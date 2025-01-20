@interface ANSTPixelBufferDescriptor
+ (BOOL)supportsSecureCoding;
- (ANSTPixelBufferDescriptor)initWithCoder:(id)a3;
- (ANSTPixelBufferDescriptor)initWithName:(id)a3 error:(id *)a4;
- (ANSTPixelBufferDescriptor)initWithName:(id)a3 pixelBufferAttributes:(id)a4 error:(id *)a5;
- (ANSTPixelBufferDescriptor)initWithName:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormatType:(unsigned int)a6 pixelBufferAttributes:(id)a7 error:(id *)a8;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)pixelBufferAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (unint64_t)height;
- (unint64_t)width;
- (unsigned)pixelFormatType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTPixelBufferDescriptor

- (ANSTPixelBufferDescriptor)initWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  result = (ANSTPixelBufferDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v7, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTPixelBufferDescriptor)initWithName:(id)a3 pixelBufferAttributes:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ANSTPixelBufferDescriptor;
  v10 = [(ANSTDescriptor *)&v25 initWithName:a3 error:a5];
  if (!v10) {
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, *MEMORY[0x263F04240]);
  if (v11)
  {
    v13 = (void *)v11;
    uint64_t v14 = objc_msgSend_objectForKey_(v8, v12, *MEMORY[0x263F04118]);
    if (v14)
    {
      v16 = (void *)v14;
      v17 = objc_msgSend_objectForKey_(v8, v15, *MEMORY[0x263F04180]);

      if (v17)
      {
        uint64_t v19 = objc_msgSend_copy(v8, v12, v18);
        pixelBufferAttributes = v10->_pixelBufferAttributes;
        v10->_pixelBufferAttributes = (NSDictionary *)v19;

LABEL_6:
        a5 = v10;
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if (a5)
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F07F80];
    v27[0] = @"Pixel buffer attributes are missing mandatory keys, i.e. width, height, and pixel format type.";
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v27, &v26, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v21, v23, @"ANSTErrorDomain", 9, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_10:

  return (ANSTPixelBufferDescriptor *)a5;
}

- (ANSTPixelBufferDescriptor)initWithName:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormatType:(unsigned int)a6 pixelBufferAttributes:(id)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a6;
  id v14 = a7;
  v15 = (objc_class *)MEMORY[0x263EFF9A0];
  id v16 = a3;
  id v17 = objc_alloc_init(v15);
  uint64_t v19 = v17;
  if (v14) {
    objc_msgSend_addEntriesFromDictionary_(v17, v18, (uint64_t)v14);
  }
  v20 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v18, a4);
  objc_msgSend_setObject_forKey_(v19, v21, (uint64_t)v20, *MEMORY[0x263F04240]);

  v23 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v22, a5);
  objc_msgSend_setObject_forKey_(v19, v24, (uint64_t)v23, *MEMORY[0x263F04118]);

  uint64_t v26 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v25, v9);
  objc_msgSend_setObject_forKey_(v19, v27, (uint64_t)v26, *MEMORY[0x263F04180]);

  v29 = (ANSTPixelBufferDescriptor *)objc_msgSend_initWithName_pixelBufferAttributes_error_(self, v28, (uint64_t)v16, v19, a8);
  return v29;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ANSTPixelBufferDescriptor *)a3;
  v14.receiver = self;
  v14.super_class = (Class)ANSTPixelBufferDescriptor;
  if (![(ANSTDescriptor *)&v14 isEqual:v4]) {
    goto LABEL_6;
  }
  if (v4 == self)
  {
    char isEqualToDictionary = 1;
    goto LABEL_8;
  }
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_msgSend_pixelBufferAttributes(self, v5, v6);
    v10 = objc_msgSend_pixelBufferAttributes(v4, v8, v9);
    char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v7, v11, (uint64_t)v10);
  }
  else
  {
LABEL_6:
    char isEqualToDictionary = 0;
  }
LABEL_8:

  return isEqualToDictionary;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)ANSTPixelBufferDescriptor;
  unint64_t v3 = [(ANSTDescriptor *)&v11 hash];
  uint64_t v6 = objc_msgSend_pixelBufferAttributes(self, v4, v5);
  unint64_t v9 = objc_msgSend_hash(v6, v7, v8) ^ v3;

  return v9;
}

- (id)description
{
  v4 = NSString;
  uint64_t v5 = objc_msgSend_name(self, a2, v2);
  uint64_t v8 = objc_msgSend_width(self, v6, v7);
  uint64_t v11 = objc_msgSend_height(self, v9, v10);
  uint64_t v14 = ((int)objc_msgSend_pixelFormatType(self, v12, v13) >> 24);
  uint64_t v17 = ((int)(objc_msgSend_pixelFormatType(self, v15, v16) << 8) >> 24);
  uint64_t v20 = ((__int16)objc_msgSend_pixelFormatType(self, v18, v19) >> 8);
  char v23 = objc_msgSend_pixelFormatType(self, v21, v22);
  objc_super v25 = objc_msgSend_stringWithFormat_(v4, v24, @"%@ (%zu×%zu, %c%c%c%c)", v5, v8, v11, v14, v17, v20, v23);

  return v25;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_name(self, v6, v7);
  uint64_t v11 = objc_msgSend_pixelBufferAttributes(self, v9, v10);
  uint64_t v14 = objc_msgSend_debugDescription(v11, v12, v13);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v3, v15, @"<%@ %p> %@ pixelBufferAttributes %@", v5, self, v8, v14);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_name(self, v8, v9);
  uint64_t v13 = objc_msgSend_pixelBufferAttributes(self, v11, v12);
  v15 = objc_msgSend_initWithName_pixelBufferAttributes_error_(v7, v14, (uint64_t)v10, v13, 0);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)ANSTPixelBufferDescriptor;
  id v4 = a3;
  [(ANSTDescriptor *)&v25 encodeWithCoder:v4];
  uint64_t v5 = (void *)MEMORY[0x263F08AC0];
  uint64_t v8 = objc_msgSend_pixelBufferAttributes(self, v6, v7);
  id v24 = 0;
  uint64_t v10 = objc_msgSend_dataWithPropertyList_format_options_error_(v5, v9, (uint64_t)v8, 200, 0, &v24);
  id v11 = v24;

  if (v10)
  {
    uint64_t v14 = NSStringFromSelector(sel_pixelBufferAttributes);
    objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v10, v14);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08608];
    v26[0] = *MEMORY[0x263F07F80];
    v26[1] = v17;
    uint64_t v18 = *MEMORY[0x263F07F70];
    v27[0] = @"Pixel buffer attributes cannot be encoded.";
    v27[1] = v11;
    v26[2] = @"ANSTDescriptorName";
    uint64_t v14 = objc_msgSend_name(self, v12, v13);
    void v27[2] = v14;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)v27, v26, 3);
    uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(v16, v21, v18, 4866, v20);
    objc_msgSend_failWithError_(v4, v23, (uint64_t)v22);

    id v4 = (id)v20;
  }
}

- (ANSTPixelBufferDescriptor)initWithCoder:(id)a3
{
  v44[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)ANSTPixelBufferDescriptor;
  uint64_t v7 = [(ANSTDescriptor *)&v40 initWithCoder:v4];
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = objc_msgSend_error(v4, v5, v6);

  if (!v8)
  {
    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_pixelBufferAttributes);
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, v11);

    if (!v13)
    {
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F07F70];
      v43[0] = *MEMORY[0x263F07F80];
      v43[1] = @"ANSTDescriptorName";
      v44[0] = @"Pixel buffer descriptor pixel buffer attributes were not encoded.";
      id v24 = objc_msgSend_name(v7, v14, v15);
      v44[1] = v24;
      uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)v44, v43, 2);
      v28 = objc_msgSend_errorWithDomain_code_userInfo_(v22, v27, v23, 4865, v26);
      objc_msgSend_failWithError_(v4, v29, (uint64_t)v28);

      goto LABEL_3;
    }
    id v39 = 0;
    uint64_t v16 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v14, (uint64_t)v13, 0, 0, &v39);
    id v17 = v39;
    pixelBufferAttributes = v7->_pixelBufferAttributes;
    v7->_pixelBufferAttributes = (NSDictionary *)v16;

    if (!v7->_pixelBufferAttributes)
    {
      v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08608];
      v41[0] = *MEMORY[0x263F07F80];
      v41[1] = v31;
      uint64_t v32 = *MEMORY[0x263F07F70];
      v42[0] = @"Pixel buffer attributes cannot be decoded.";
      v42[1] = v17;
      v41[2] = @"ANSTDescriptorName";
      v33 = objc_msgSend_name(v7, v19, v20);
      v42[2] = v33;
      v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v34, (uint64_t)v42, v41, 3);
      v37 = objc_msgSend_errorWithDomain_code_userInfo_(v30, v36, v32, 4864, v35);
      objc_msgSend_failWithError_(v4, v38, (uint64_t)v37);

      goto LABEL_3;
    }

LABEL_7:
    uint64_t v9 = v7;
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)pixelBufferAttributes
{
  return self->_pixelBufferAttributes;
}

- (void).cxx_destruct
{
}

- (unint64_t)width
{
  uint64_t v5 = objc_msgSend_pixelBufferAttributes(self, a2, v2);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x263F04240]);

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v10 = objc_msgSend_unsignedIntegerValue(v7, v8, v9);

    return v10;
  }
  else
  {
    unint64_t result = objc_msgSend_doesNotRecognizeSelector_(self, v8, (uint64_t)a2);
    __break(1u);
  }
  return result;
}

- (unint64_t)height
{
  uint64_t v5 = objc_msgSend_pixelBufferAttributes(self, a2, v2);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x263F04118]);

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v10 = objc_msgSend_unsignedIntegerValue(v7, v8, v9);

    return v10;
  }
  else
  {
    unint64_t result = objc_msgSend_doesNotRecognizeSelector_(self, v8, (uint64_t)a2);
    __break(1u);
  }
  return result;
}

- (unsigned)pixelFormatType
{
  uint64_t v5 = objc_msgSend_pixelBufferAttributes(self, a2, v2);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x263F04180]);

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v10 = objc_msgSend_unsignedIntegerValue(v7, v8, v9);

    return v10;
  }
  else
  {
    unsigned int result = objc_msgSend_doesNotRecognizeSelector_(self, v8, (uint64_t)a2);
    __break(1u);
  }
  return result;
}

@end