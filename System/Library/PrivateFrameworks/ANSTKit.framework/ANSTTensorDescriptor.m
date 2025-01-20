@interface ANSTTensorDescriptor
+ (BOOL)supportsSecureCoding;
- (ANSTTensorDescriptor)initWithCoder:(id)a3;
- (ANSTTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 lengths:(id)a5 strides:(id)a6 error:(id *)a7;
- (ANSTTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 numberOfDimensions:(unint64_t)a5 lengths:(const unint64_t *)a6 alignment:(unint64_t)a7 error:(id *)a8;
- (ANSTTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 numberOfDimensions:(unint64_t)a5 lengths:(const unint64_t *)a6 strides:(const unint64_t *)a7 error:(id *)a8;
- (ANSTTensorDescriptor)initWithName:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)lengths;
- (NSArray)strides;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)_minimumContiguousLength;
- (unint64_t)dataType;
- (unint64_t)hash;
- (unint64_t)lengthOfDimensionAt:(unint64_t)a3;
- (unint64_t)numberOfDimensions;
- (unint64_t)sizeInBytes;
- (unint64_t)strideOfDimensionAt:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTTensorDescriptor

- (unint64_t)lengthOfDimensionAt:(unint64_t)a3
{
  if (self->_numberOfDimensions <= a3) {
    return 0;
  }
  else {
    return self->_lengths[a3];
  }
}

- (unint64_t)strideOfDimensionAt:(unint64_t)a3
{
  if (self->_numberOfDimensions <= a3) {
    return 0;
  }
  else {
    return self->_strides[a3];
  }
}

- (unint64_t)sizeInBytes
{
  return *self->_lengths * *self->_strides;
}

- (ANSTTensorDescriptor)initWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  result = (ANSTTensorDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v7, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 numberOfDimensions:(unint64_t)a5 lengths:(const unint64_t *)a6 strides:(const unint64_t *)a7 error:(id *)a8
{
  v29[1] = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)ANSTTensorDescriptor;
  v13 = [(ANSTDescriptor *)&v27 initWithName:a3 error:a8];
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v22 = v14;
    goto LABEL_17;
  }
  v13->_dataType = a4;
  v13->_numberOfDimensions = a5;
  v15 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
  v14->_lengths = v15;
  if (v15)
  {
    v17 = (unint64_t *)malloc_type_calloc(v14->_numberOfDimensions, 8uLL, 0x100004000313F17uLL);
    v14->_strides = v17;
    if (v17)
    {
      if (v14->_numberOfDimensions)
      {
        uint64_t v18 = 0;
        lengths = v14->_lengths;
        while (1)
        {
          lengths[v18] = a6[v18];
          unint64_t v20 = a7[v18];
          v17[v18] = v20;
          if (!lengths[v18] || v20 == 0) {
            break;
          }
          if (++v18 >= v14->_numberOfDimensions) {
            goto LABEL_11;
          }
        }
        if (a8)
        {
          v23 = (void *)MEMORY[0x263F087E8];
          uint64_t v28 = *MEMORY[0x263F07F80];
          v29[0] = @"Tensor descriptor's length(s) and/or stride(s) should not be zero.";
          v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v29, &v28, 1);
          objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, @"ANSTErrorDomain", 8, v24);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_16;
      }
      goto LABEL_11;
    }
  }
  if (!a8)
  {
LABEL_16:
    v22 = 0;
    goto LABEL_17;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v16, @"ANSTErrorDomain", 6, 0);
  v22 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v22;
}

- (ANSTTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 numberOfDimensions:(unint64_t)a5 lengths:(const unint64_t *)a6 alignment:(unint64_t)a7 error:(id *)a8
{
  id v14 = a3;
  v15 = (char *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
  if (v15)
  {
    v17 = v15;
    if (a5)
    {
      uint64_t Size = ANSTTensorDataTypeGetSize(a4);
      uint64_t v19 = 0;
      unint64_t v20 = 8 * a5 - 8;
      v21 = &v17[v20];
      v22 = (char *)a6 + v20;
      uint64_t v23 = 1;
      do
      {
        Size *= v23;
        if (a7 >= 2 && v19 == -1) {
          uint64_t Size = (a7 - 1 + Size) / a7 * a7;
        }
        uint64_t v23 = *(void *)&v22[8 * v19];
        *(void *)&v21[8 * v19--] = Size;
      }
      while (-(uint64_t)a5 != v19);
    }
    v24 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_strides_error_(self, v16, (uint64_t)v14, a4, a5, a6, v17, a8);
    free(v17);
    self = v24;
    v25 = self;
  }
  else if (a8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v16, @"ANSTErrorDomain", 6, 0);
    v25 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (ANSTTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 lengths:(id)a5 strides:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  size_t v17 = objc_msgSend_count(v13, v15, v16);
  uint64_t v18 = malloc_type_calloc(v17, 8uLL, 0x100004000313F17uLL);
  if (!v18)
  {
    if (!a7)
    {
LABEL_10:
      v33 = 0;
      goto LABEL_11;
    }
LABEL_8:
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v19, @"ANSTErrorDomain", 6, 0);
    v33 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  unint64_t v20 = v18;
  v21 = malloc_type_calloc(v17, 8uLL, 0x100004000313F17uLL);
  if (!v21)
  {
    free(v20);
    if (!a7) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v23 = v21;
  uint64_t v35 = (uint64_t)v12;
  if (v17)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      v25 = objc_msgSend_objectAtIndex_(v13, v22, i);
      *((void *)v20 + i) = objc_msgSend_unsignedIntegerValue(v25, v26, v27);

      v29 = objc_msgSend_objectAtIndex_(v14, v28, i);
      v23[i] = objc_msgSend_unsignedIntegerValue(v29, v30, v31);
    }
  }
  id v12 = (id)v35;
  v32 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_strides_error_(self, v22, v35, a4, v17, v20, v23, a7);
  free(v20);
  free(v23);
  self = v32;
  v33 = self;
LABEL_11:

  return v33;
}

- (void)dealloc
{
  lengths = self->_lengths;
  if (lengths) {
    free(lengths);
  }
  strides = self->_strides;
  if (strides) {
    free(strides);
  }
  v5.receiver = self;
  v5.super_class = (Class)ANSTTensorDescriptor;
  [(ANSTTensorDescriptor *)&v5 dealloc];
}

- (unint64_t)_minimumContiguousLength
{
  unint64_t result = objc_msgSend_numberOfDimensions(self, a2, v2);
  if (result)
  {
    uint64_t v6 = objc_msgSend_lengthOfDimensionAt_(self, v5, 0);
    return objc_msgSend_strideOfDimensionAt_(self, v7, 0) * v6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ANSTTensorDescriptor *)a3;
  v32.receiver = self;
  v32.super_class = (Class)ANSTTensorDescriptor;
  if (![(ANSTDescriptor *)&v32 isEqual:v4]) {
    goto LABEL_14;
  }
  if (v4 == self) {
    goto LABEL_16;
  }
  if (!v4) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v7 = objc_msgSend_dataType(self, v5, v6);
  if (v7 != objc_msgSend_dataType(v4, v8, v9)) {
    goto LABEL_14;
  }
  uint64_t v12 = objc_msgSend_numberOfDimensions(self, v10, v11);
  if (v12 != objc_msgSend_numberOfDimensions(v4, v13, v14)) {
    goto LABEL_14;
  }
  uint64_t v17 = objc_msgSend_numberOfDimensions(self, v15, v16);
  if (!v17)
  {
LABEL_16:
    BOOL v23 = 1;
    goto LABEL_15;
  }
  unint64_t v19 = v17;
  uint64_t v20 = objc_msgSend_lengthOfDimensionAt_(self, v18, 0);
  if (v20 != objc_msgSend_lengthOfDimensionAt_(v4, v21, 0))
  {
LABEL_14:
    BOOL v23 = 0;
    goto LABEL_15;
  }
  BOOL v23 = 0;
  unint64_t v24 = 1;
  do
  {
    uint64_t v25 = objc_msgSend_strideOfDimensionAt_(self, v22, v24 - 1);
    if (v25 != objc_msgSend_strideOfDimensionAt_(v4, v26, v24 - 1)) {
      break;
    }
    BOOL v23 = v24 >= v19;
    if (v19 == v24) {
      break;
    }
    uint64_t v28 = objc_msgSend_lengthOfDimensionAt_(self, v27, v24);
    uint64_t v30 = objc_msgSend_lengthOfDimensionAt_(v4, v29, v24++);
  }
  while (v28 == v30);
LABEL_15:

  return v23;
}

- (unint64_t)hash
{
  v19.receiver = self;
  v19.super_class = (Class)ANSTTensorDescriptor;
  unint64_t v3 = [(ANSTDescriptor *)&v19 hash];
  uint64_t v6 = objc_msgSend_dataType(self, v4, v5);
  unint64_t v9 = v6 ^ objc_msgSend_numberOfDimensions(self, v7, v8) ^ v3;
  uint64_t v12 = objc_msgSend_numberOfDimensions(self, v10, v11);
  if (v12)
  {
    uint64_t v14 = v12;
    for (uint64_t i = 0; i != v14; ++i)
    {
      uint64_t v16 = objc_msgSend_lengthOfDimensionAt_(self, v13, i);
      v9 ^= v16 ^ objc_msgSend_strideOfDimensionAt_(self, v17, i);
    }
  }
  return v9;
}

- (id)description
{
  v4 = NSString;
  uint64_t v5 = objc_msgSend_name(self, a2, v2);
  uint64_t v8 = objc_msgSend_dataType(self, v6, v7);
  unint64_t v9 = ANSTTensorDataTypeToNSString(v8);
  uint64_t v12 = objc_msgSend_lengths(self, v10, v11);
  uint64_t v14 = objc_msgSend_componentsJoinedByString_(v12, v13, @"×");
  uint64_t v16 = objc_msgSend_stringWithFormat_(v4, v15, @"%@ (%@, %@)", v5, v9, v14);

  return v16;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_name(self, v6, v7);
  uint64_t v11 = objc_msgSend_dataType(self, v9, v10);
  uint64_t v12 = ANSTTensorDataTypeToNSString(v11);
  v15 = objc_msgSend_lengths(self, v13, v14);
  uint64_t v17 = objc_msgSend_componentsJoinedByString_(v15, v16, @"×");
  uint64_t v20 = objc_msgSend_strides(self, v18, v19);
  v22 = objc_msgSend_componentsJoinedByString_(v20, v21, @"×");
  unint64_t v24 = objc_msgSend_stringWithFormat_(v3, v23, @"<%@ %p> %@ (%@, %@, %@)", v5, self, v8, v12, v17, v22);

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_name(self, v8, v9);
  uint64_t v12 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_strides_error_(v7, v11, (uint64_t)v10, self->_dataType, self->_numberOfDimensions, self->_lengths, self->_strides, 0);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ANSTTensorDescriptor;
  [(ANSTDescriptor *)&v42 encodeWithCoder:v4];
  uint64_t v5 = NSNumber;
  uint64_t v8 = objc_msgSend_dataType(self, v6, v7);
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(v5, v9, v8);
  uint64_t v11 = NSStringFromSelector(sel_dataType);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v10, v11);

  id v13 = NSNumber;
  uint64_t v16 = objc_msgSend_numberOfDimensions(self, v14, v15);
  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(v13, v17, v16);
  uint64_t v19 = NSStringFromSelector(sel_numberOfDimensions);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v18, v19);

  uint64_t v23 = objc_msgSend_numberOfDimensions(self, v21, v22);
  if (v23)
  {
    uint64_t v25 = v23;
    for (uint64_t i = 0; i != v25; ++i)
    {
      uint64_t v27 = NSNumber;
      uint64_t v28 = objc_msgSend_lengthOfDimensionAt_(self, v24, i);
      uint64_t v30 = objc_msgSend_numberWithUnsignedInteger_(v27, v29, v28);
      objc_super v32 = objc_msgSend_stringWithFormat_(NSString, v31, @"length@%zu", i);
      objc_msgSend_encodeObject_forKey_(v4, v33, (uint64_t)v30, v32);

      v34 = NSNumber;
      uint64_t v36 = objc_msgSend_strideOfDimensionAt_(self, v35, i);
      v38 = objc_msgSend_numberWithUnsignedInteger_(v34, v37, v36);
      v40 = objc_msgSend_stringWithFormat_(NSString, v39, @"stride@%zu", i);
      objc_msgSend_encodeObject_forKey_(v4, v41, (uint64_t)v38, v40);
    }
  }
}

- (ANSTTensorDescriptor)initWithCoder:(id)a3
{
  v92[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)ANSTTensorDescriptor;
  uint64_t v5 = [(ANSTDescriptor *)&v82 initWithCoder:v4];
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(sel_dataType);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);

  if (!v9)
  {
    v41 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F07F70];
    v91[0] = *MEMORY[0x263F07F80];
    v91[1] = @"ANSTDescriptorName";
    v92[0] = @"Tensor descriptor data type was not encoded.";
    v43 = objc_msgSend_name(v5, v10, v11);
    v92[1] = v43;
    v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v44, (uint64_t)v92, v91, 2);
    v47 = objc_msgSend_errorWithDomain_code_userInfo_(v41, v46, v42, 4865, v45);
    objc_msgSend_failWithError_(v4, v48, (uint64_t)v47);

LABEL_20:
    v40 = 0;
    goto LABEL_21;
  }
  v5->_dataType = objc_msgSend_unsignedIntegerValue(v9, v10, v11);
  uint64_t v12 = objc_opt_class();
  id v13 = NSStringFromSelector(sel_numberOfDimensions);
  uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);

  if (!v15)
  {
    v49 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F07F70];
    uint64_t v51 = *MEMORY[0x263F07F80];
    v90[0] = @"Tensor descriptor number of dimensions was not encoded.";
    v89[0] = v51;
    v89[1] = @"ANSTDescriptorName";
    v29 = objc_msgSend_name(v5, v16, v17);
    v90[1] = v29;
    v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v52, (uint64_t)v90, v89, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v49, v54, v50, 4865, v53);
    v59 = LABEL_17:;
    objc_msgSend_failWithError_(v4, v60, (uint64_t)v59);
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  size_t v18 = objc_msgSend_unsignedIntegerValue(v15, v16, v17);
  v5->_numberOfDimensions = v18;
  if (!v18)
  {
    v55 = (void *)MEMORY[0x263F087E8];
    uint64_t v56 = *MEMORY[0x263F07F70];
    v87[0] = *MEMORY[0x263F07F80];
    v87[1] = @"ANSTDescriptorName";
    v88[0] = @"Invalid tensor descriptor number of dimensions was encoded.";
    v29 = objc_msgSend_name(v5, v19, v20);
    v88[1] = v29;
    v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v57, (uint64_t)v88, v87, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v55, v58, v56, 4864, v53);
    goto LABEL_17;
  }
  v21 = (unint64_t *)malloc_type_calloc(v18, 8uLL, 0x100004000313F17uLL);
  v5->_lengths = v21;
  if (!v21) {
    goto LABEL_19;
  }
  uint64_t v22 = (unint64_t *)malloc_type_calloc(v5->_numberOfDimensions, 8uLL, 0x100004000313F17uLL);
  v5->_strides = v22;
  if (!v22) {
    goto LABEL_19;
  }
  v80 = v15;
  v81 = v9;
  if (v5->_numberOfDimensions)
  {
    unint64_t v23 = 0;
    unint64_t v24 = 0x263F08000uLL;
    while (1)
    {
      uint64_t v25 = objc_opt_class();
      uint64_t v27 = objc_msgSend_stringWithFormat_(*(void **)(v24 + 2880), v26, @"length@%zu", v23);
      v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v25, v27);

      if (!v29)
      {
        v62 = (void *)MEMORY[0x263F087E8];
        unint64_t v63 = v24;
        uint64_t v64 = *MEMORY[0x263F07F70];
        v85[0] = *MEMORY[0x263F07F80];
        v29 = objc_msgSend_stringWithFormat_(*(void **)(v63 + 2880), v30, @"Tensor descriptor length at dimension index #%zu was not encoded.", v23);
        v85[1] = @"ANSTDescriptorName";
        v86[0] = v29;
        v53 = objc_msgSend_name(v5, v65, v66);
        v86[1] = v53;
        v59 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v67, (uint64_t)v86, v85, 2);
        v69 = objc_msgSend_errorWithDomain_code_userInfo_(v62, v68, v64, 4865, v59);
        objc_msgSend_failWithError_(v4, v70, (uint64_t)v69);

        goto LABEL_24;
      }
      v5->_lengths[v23] = objc_msgSend_unsignedIntegerValue(v29, v30, v31);
      uint64_t v32 = objc_opt_class();
      unint64_t v33 = v24;
      uint64_t v35 = objc_msgSend_stringWithFormat_(*(void **)(v24 + 2880), v34, @"stride@%zu", v23);
      v37 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v32, v35);

      if (!v37) {
        break;
      }
      v5->_strides[v23] = objc_msgSend_unsignedIntegerValue(v37, v38, v39);

      ++v23;
      unint64_t v24 = v33;
      if (v23 >= v5->_numberOfDimensions) {
        goto LABEL_12;
      }
    }
    v71 = (void *)MEMORY[0x263F087E8];
    uint64_t v72 = *MEMORY[0x263F07F70];
    v83[0] = *MEMORY[0x263F07F80];
    v53 = objc_msgSend_stringWithFormat_(*(void **)(v33 + 2880), v38, @"Tensor descriptor stride at dimension index #%zu was not encoded.", v23);
    v83[1] = @"ANSTDescriptorName";
    v84[0] = v53;
    v59 = objc_msgSend_name(v5, v73, v74);
    v84[1] = v59;
    v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v75, (uint64_t)v84, v83, 2);
    v78 = objc_msgSend_errorWithDomain_code_userInfo_(v71, v77, v72, 4865, v76);
    objc_msgSend_failWithError_(v4, v79, (uint64_t)v78);

LABEL_24:
    uint64_t v15 = v80;
    uint64_t v9 = v81;
    goto LABEL_18;
  }
LABEL_12:

LABEL_13:
  v40 = v5;
LABEL_21:

  return v40;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (unint64_t)numberOfDimensions
{
  return self->_numberOfDimensions;
}

- (NSArray)lengths
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v6 = objc_msgSend_numberOfDimensions(self, v4, v5);
  uint64_t v8 = objc_msgSend_initWithCapacity_(v3, v7, v6);
  uint64_t v11 = objc_msgSend_numberOfDimensions(self, v9, v10);
  if (v11)
  {
    uint64_t v14 = v11;
    for (uint64_t i = 0; i != v14; ++i)
    {
      uint64_t v16 = NSNumber;
      uint64_t v17 = objc_msgSend_lengthOfDimensionAt_(self, v12, i);
      uint64_t v19 = objc_msgSend_numberWithUnsignedInteger_(v16, v18, v17);
      objc_msgSend_addObject_(v8, v20, (uint64_t)v19);
    }
  }
  v21 = objc_msgSend_copy(v8, v12, v13);

  return (NSArray *)v21;
}

- (NSArray)strides
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v6 = objc_msgSend_numberOfDimensions(self, v4, v5);
  uint64_t v8 = objc_msgSend_initWithCapacity_(v3, v7, v6);
  uint64_t v11 = objc_msgSend_numberOfDimensions(self, v9, v10);
  if (v11)
  {
    uint64_t v14 = v11;
    for (uint64_t i = 0; i != v14; ++i)
    {
      uint64_t v16 = NSNumber;
      uint64_t v17 = objc_msgSend_strideOfDimensionAt_(self, v12, i);
      uint64_t v19 = objc_msgSend_numberWithUnsignedInteger_(v16, v18, v17);
      objc_msgSend_addObject_(v8, v20, (uint64_t)v19);
    }
  }
  v21 = objc_msgSend_copy(v8, v12, v13);

  return (NSArray *)v21;
}

@end