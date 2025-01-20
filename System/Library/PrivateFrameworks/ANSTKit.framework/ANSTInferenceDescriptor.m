@interface ANSTInferenceDescriptor
+ (BOOL)supportsSecureCoding;
- (ANSTInferenceDescriptor)initWithCoder:(id)a3;
- (ANSTInferenceDescriptor)initWithName:(id)a3 error:(id *)a4;
- (ANSTInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10;
- (BOOL)_buildCategorizedDescriptorsCacheWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresPostprocessing;
- (NSArray)allInputPixelBufferDescriptors;
- (NSArray)allInputTensorDescriptors;
- (NSArray)allOutputPixelBufferDescriptors;
- (NSArray)allOutputTensorDescriptors;
- (NSArray)inputDescriptors;
- (NSArray)outputDescriptors;
- (NSString)e5FunctionName;
- (NSString)espressoConfigurationName;
- (NSURL)assetURL;
- (NSURL)networkFileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)inputPixelBufferDescriptorNamed:(id)a3;
- (id)inputTensorDescriptorNamed:(id)a3;
- (id)newPostprocessorWithError:(id *)a3;
- (id)outputPixelBufferDescriptorNamed:(id)a3;
- (id)outputTensorDescriptorNamed:(id)a3;
- (int64_t)assetType;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTInferenceDescriptor

- (ANSTInferenceDescriptor)initWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  result = (ANSTInferenceDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v7, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10
{
  v16 = (ANSTInferenceDescriptor *)a10;
  v48[1] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v23 = v21;
  if (!v18 || !v20 || !v21)
  {
    if (!a10) {
      goto LABEL_10;
    }
    v42 = (void *)MEMORY[0x263F087E8];
    uint64_t v47 = *MEMORY[0x263F07F80];
    v48[0] = @"ANSTInferenceDescriptor initialization requires nonnil assetURL, inputDescriptors, and outputDescriptors.";
    v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v22, (uint64_t)v48, &v47, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v42, v44, @"ANSTErrorDomain", 2, v43);
    *a10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  v46.receiver = self;
  v46.super_class = (Class)ANSTInferenceDescriptor;
  v24 = [(ANSTDescriptor *)&v46 initWithName:v17 error:a10];
  self = v24;
  if (v24)
  {
    v24->_version = a4;
    v27 = (NSURL *)objc_msgSend_copy(v18, v25, v26);
    assetURL = self->_assetURL;
    self->_assetURL = v27;

    self->_assetType = a6;
    v31 = (NSString *)objc_msgSend_copy(v19, v29, v30);
    e5FunctionName = self->_e5FunctionName;
    self->_e5FunctionName = v31;

    v35 = (NSArray *)objc_msgSend_copy(v20, v33, v34);
    inputDescriptors = self->_inputDescriptors;
    self->_inputDescriptors = v35;

    v39 = (NSArray *)objc_msgSend_copy(v23, v37, v38);
    outputDescriptors = self->_outputDescriptors;
    self->_outputDescriptors = v39;

    if (!objc_msgSend__buildCategorizedDescriptorsCacheWithError_(self, v41, (uint64_t)a10)) {
      goto LABEL_9;
    }
  }
  self = self;
  v16 = self;
LABEL_10:

  return v16;
}

- (BOOL)_buildCategorizedDescriptorsCacheWithError:(id *)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  v94 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, (uint64_t)a3);
  v93 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v4, v5);
  v8 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v6, v7);
  v92 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v9, v10);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v89 = self;
  outputPixelBufferDescriptors = self->_inputDescriptors;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(outputPixelBufferDescriptors, v12, (uint64_t)&v100, v125, 16);
  v95 = v8;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v101;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v101 != v15) {
          objc_enumerationMutation(outputPixelBufferDescriptors);
        }
        id v17 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = objc_msgSend_name(v17, v18, v19);
          v23 = v20;
          if (!v20 || !objc_msgSend_length(v20, v21, v22))
          {
            v74 = a3;
            if (a3)
            {
              v75 = (void *)MEMORY[0x263F087E8];
              v123[0] = *MEMORY[0x263F07F80];
              v123[1] = @"ANSTDescriptor";
              v124[0] = @"Descriptor name should not be empty.";
              v124[1] = v17;
              v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)v124, v123, 2);
              objc_msgSend_errorWithDomain_code_userInfo_(v75, v77, @"ANSTErrorDomain", 10, v76, v89);
              goto LABEL_62;
            }
            goto LABEL_53;
          }
          v24 = objc_msgSend_objectForKey_(v94, v21, (uint64_t)v23);

          if (v24)
          {
            v74 = a3;
            if (a3)
            {
              v83 = (void *)MEMORY[0x263F087E8];
              v121[0] = *MEMORY[0x263F07F80];
              v121[1] = @"ANSTDescriptor";
              v122[0] = @"Descriptors should not have duplicated names.";
              v122[1] = v17;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)v122, v121, 2, v89);
              goto LABEL_61;
            }
LABEL_58:
            v60 = v93;
            v55 = v94;
            v8 = v95;
            goto LABEL_54;
          }
          objc_msgSend_setObject_forKey_(v94, v25, (uint64_t)v17, v23);
          v8 = v95;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v81 = a3;
            if (!a3)
            {
LABEL_55:
              BOOL v73 = 0;
              v60 = v93;
              v55 = v94;
              v69 = v92;
              goto LABEL_66;
            }
            v82 = (void *)MEMORY[0x263F087E8];
            v115[0] = *MEMORY[0x263F07F80];
            v115[1] = @"ANSTDescriptor";
            v116[0] = @"Invalid descriptor, expects either tensor or pixel buffer descriptor.";
            v116[1] = v17;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)v116, v115, 2, v89);
            v23 = LABEL_52:;
            v8 = v95;
            objc_msgSend_errorWithDomain_code_userInfo_(v82, v86, @"ANSTErrorDomain", 10, v23);
            id *v81 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
            v60 = v93;
            v55 = v94;
LABEL_54:
            v69 = v92;
            goto LABEL_65;
          }
          v28 = objc_msgSend_name(v17, v26, v27);
          v23 = v28;
          if (!v28 || !objc_msgSend_length(v28, v29, v30))
          {
            v60 = v93;
            v55 = v94;
            v74 = a3;
            v69 = v92;
            if (a3)
            {
              v78 = (void *)MEMORY[0x263F087E8];
              v119[0] = *MEMORY[0x263F07F80];
              v119[1] = @"ANSTDescriptor";
              v120[0] = @"Descriptor name should not be empty.";
              v120[1] = v17;
              v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v120, v119, 2);
              v80 = objc_msgSend_errorWithDomain_code_userInfo_(v78, v79, @"ANSTErrorDomain", 10, v76);
              goto LABEL_64;
            }
LABEL_65:

            BOOL v73 = 0;
            goto LABEL_66;
          }
          v31 = objc_msgSend_objectForKey_(v8, v29, (uint64_t)v23);

          if (v31)
          {
            v74 = a3;
            if (a3)
            {
              v83 = (void *)MEMORY[0x263F087E8];
              v117[0] = *MEMORY[0x263F07F80];
              v117[1] = @"ANSTDescriptor";
              v118[0] = @"Descriptors should not have duplicated names.";
              v118[1] = v17;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)v118, v117, 2, v89);
              goto LABEL_61;
            }
            goto LABEL_53;
          }
          objc_msgSend_setObject_forKey_(v8, v32, (uint64_t)v17, v23);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(outputPixelBufferDescriptors, v33, (uint64_t)&v100, v125, 16);
    }
    while (v14);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  outputPixelBufferDescriptors = v89->_outputDescriptors;
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(outputPixelBufferDescriptors, v34, (uint64_t)&v96, v114, 16);
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v97;
LABEL_20:
    uint64_t v38 = 0;
    while (1)
    {
      if (*(void *)v97 != v37) {
        objc_enumerationMutation(outputPixelBufferDescriptors);
      }
      v39 = *(void **)(*((void *)&v96 + 1) + 8 * v38);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v42 = objc_msgSend_name(v39, v40, v41);
        v23 = v42;
        if (!v42 || !objc_msgSend_length(v42, v43, v44))
        {
          v74 = a3;
          if (!a3) {
            goto LABEL_53;
          }
          v83 = (void *)MEMORY[0x263F087E8];
          v112[0] = *MEMORY[0x263F07F80];
          v112[1] = @"ANSTDescriptor";
          v113[0] = @"Descriptor name should not be empty.";
          v113[1] = v39;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v43, (uint64_t)v113, v112, 2, v89);
          goto LABEL_61;
        }
        v45 = objc_msgSend_objectForKey_(v93, v43, (uint64_t)v23);

        if (v45)
        {
          v74 = a3;
          if (!a3) {
            goto LABEL_58;
          }
          v83 = (void *)MEMORY[0x263F087E8];
          v110[0] = *MEMORY[0x263F07F80];
          v110[1] = @"ANSTDescriptor";
          v111[0] = @"Descriptors should not have duplicated names.";
          v111[1] = v39;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v46, (uint64_t)v111, v110, 2, v89);
          goto LABEL_61;
        }
        objc_msgSend_setObject_forKey_(v93, v46, (uint64_t)v39, v23);
        v8 = v95;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v81 = a3;
          if (!a3) {
            goto LABEL_55;
          }
          v82 = (void *)MEMORY[0x263F087E8];
          v104[0] = *MEMORY[0x263F07F80];
          v104[1] = @"ANSTDescriptor";
          v105[0] = @"Invalid descriptor, expects either tensor or pixel buffer descriptor.";
          v105[1] = v39;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v47, (uint64_t)v105, v104, 2, v89);
          goto LABEL_52;
        }
        v49 = objc_msgSend_name(v39, v47, v48);
        v23 = v49;
        if (!v49 || !objc_msgSend_length(v49, v50, v51))
        {
          v60 = v93;
          v55 = v94;
          v74 = a3;
          if (!a3) {
            goto LABEL_54;
          }
          v84 = (void *)MEMORY[0x263F087E8];
          v108[0] = *MEMORY[0x263F07F80];
          v108[1] = @"ANSTDescriptor";
          v109[0] = @"Descriptor name should not be empty.";
          v109[1] = v39;
          v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v50, (uint64_t)v109, v108, 2);
          v80 = objc_msgSend_errorWithDomain_code_userInfo_(v84, v85, @"ANSTErrorDomain", 10, v76);
          goto LABEL_63;
        }
        v52 = objc_msgSend_objectForKey_(v92, v50, (uint64_t)v23);

        if (v52)
        {
          v74 = a3;
          if (!a3) {
            goto LABEL_53;
          }
          v83 = (void *)MEMORY[0x263F087E8];
          v106[0] = *MEMORY[0x263F07F80];
          v106[1] = @"ANSTDescriptor";
          v107[0] = @"Descriptors should not have duplicated names.";
          v107[1] = v39;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v53, (uint64_t)v107, v106, 2, v89);
          v76 = LABEL_61:;
          objc_msgSend_errorWithDomain_code_userInfo_(v83, v87, @"ANSTErrorDomain", 10, v76, v90);
          v80 = LABEL_62:;
          v60 = v93;
          v55 = v94;
LABEL_63:
          v69 = v92;
LABEL_64:
          id *v74 = v80;

          v8 = v95;
          goto LABEL_65;
        }
        objc_msgSend_setObject_forKey_(v92, v53, (uint64_t)v39, v23);
      }

      if (v36 == ++v38)
      {
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(outputPixelBufferDescriptors, v54, (uint64_t)&v96, v114, 16);
        if (v36) {
          goto LABEL_20;
        }
        break;
      }
    }
  }

  v55 = v94;
  uint64_t v58 = objc_msgSend_copy(v94, v56, v57);
  inputTensorDescriptors = v89->_inputTensorDescriptors;
  v89->_inputTensorDescriptors = (NSDictionary *)v58;

  v60 = v93;
  uint64_t v63 = objc_msgSend_copy(v93, v61, v62);
  outputTensorDescriptors = v89->_outputTensorDescriptors;
  v89->_outputTensorDescriptors = (NSDictionary *)v63;

  uint64_t v67 = objc_msgSend_copy(v8, v65, v66);
  inputPixelBufferDescriptors = v89->_inputPixelBufferDescriptors;
  v89->_inputPixelBufferDescriptors = (NSDictionary *)v67;

  v69 = v92;
  uint64_t v72 = objc_msgSend_copy(v92, v70, v71);
  outputPixelBufferDescriptors = (NSArray *)v89->_outputPixelBufferDescriptors;
  v89->_outputPixelBufferDescriptors = (NSDictionary *)v72;
  BOOL v73 = 1;
LABEL_66:

  return v73;
}

- (NSURL)networkFileURL
{
  return self->_assetURL;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ANSTInferenceDescriptor *)a3;
  v53.receiver = self;
  v53.super_class = (Class)ANSTInferenceDescriptor;
  if ([(ANSTDescriptor *)&v53 isEqual:v4])
  {
    if (v4 == self)
    {
      char isEqualToString = 1;
      goto LABEL_22;
    }
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = v4;
        uint64_t v8 = objc_msgSend_assetType(self, v6, v7);
        if (v8 != objc_msgSend_assetType(v5, v9, v10)) {
          goto LABEL_20;
        }
        uint64_t v13 = objc_msgSend_assetURL(self, v11, v12);
        v16 = objc_msgSend_assetURL(v5, v14, v15);
        if (objc_msgSend_isEqual_(v13, v17, (uint64_t)v16))
        {
          id v20 = objc_msgSend_inputDescriptors(self, v18, v19);
          v23 = objc_msgSend_inputDescriptors(v5, v21, v22);
          if (objc_msgSend_isEqualToArray_(v20, v24, (uint64_t)v23))
          {
            uint64_t v27 = objc_msgSend_outputDescriptors(self, v25, v26);
            uint64_t v30 = objc_msgSend_outputDescriptors(v5, v28, v29);
            int isEqualToArray = objc_msgSend_isEqualToArray_(v27, v31, (uint64_t)v30);

            if (isEqualToArray)
            {
              uint64_t v35 = objc_msgSend_e5FunctionName(self, v33, v34);
              if (v35)
              {
              }
              else
              {
                uint64_t v41 = objc_msgSend_e5FunctionName(v5, v36, v37);

                if (!v41)
                {
                  char isEqualToString = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v42 = objc_msgSend_e5FunctionName(self, v38, v39);
              if (v42)
              {
                v45 = (void *)v42;
                objc_super v46 = objc_msgSend_e5FunctionName(v5, v43, v44);

                if (v46)
                {
                  uint64_t v13 = objc_msgSend_e5FunctionName(self, v47, v48);
                  v16 = objc_msgSend_e5FunctionName(v5, v49, v50);
                  char isEqualToString = objc_msgSend_isEqualToString_(v13, v51, (uint64_t)v16);
                  goto LABEL_15;
                }
              }
            }
LABEL_20:
            char isEqualToString = 0;
            goto LABEL_21;
          }
        }
        char isEqualToString = 0;
LABEL_15:

LABEL_21:
        goto LABEL_22;
      }
    }
  }
  char isEqualToString = 0;
LABEL_22:

  return isEqualToString;
}

- (unint64_t)hash
{
  v35.receiver = self;
  v35.super_class = (Class)ANSTInferenceDescriptor;
  unint64_t v3 = [(ANSTDescriptor *)&v35 hash];
  uint64_t v6 = objc_msgSend_version(self, v4, v5);
  v9 = objc_msgSend_assetURL(self, v7, v8);
  uint64_t v12 = v6 ^ objc_msgSend_hash(v9, v10, v11);

  uint64_t v15 = v12 ^ objc_msgSend_assetType(self, v13, v14);
  id v18 = objc_msgSend_e5FunctionName(self, v16, v17);
  uint64_t v21 = v15 ^ objc_msgSend_hash(v18, v19, v20);

  v24 = objc_msgSend_inputDescriptors(self, v22, v23);
  uint64_t v27 = v21 ^ objc_msgSend_hash(v24, v25, v26) ^ v3;

  uint64_t v30 = objc_msgSend_outputDescriptors(self, v28, v29);
  unint64_t v33 = v27 ^ objc_msgSend_hash(v30, v31, v32);

  return v33;
}

- (id)description
{
  v4 = NSString;
  uint64_t v5 = objc_msgSend_name(self, a2, v2);
  uint64_t v8 = objc_msgSend_inputDescriptors(self, v6, v7);
  uint64_t v11 = objc_msgSend_count(v8, v9, v10);
  uint64_t v14 = objc_msgSend_outputDescriptors(self, v12, v13);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v4, v18, @"%@ (%zu input(s), %zu output(s))", v5, v11, v17);

  return v19;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_appendFormat_(v3, v6, @"<%@ %p>\n", v5, self);

  v9 = objc_msgSend_name(self, v7, v8);
  objc_msgSend_appendFormat_(v3, v10, @"  name %@\n", v9);

  uint64_t v13 = objc_msgSend_version(self, v11, v12);
  unint64_t v16 = (unint64_t)objc_msgSend_version(self, v14, v15) >> 16;
  unsigned __int16 v19 = objc_msgSend_version(self, v17, v18);
  objc_msgSend_appendFormat_(v3, v20, @"  version 0x%zx (major=%zu, minor=%zu)\n", v13, v16, v19);
  uint64_t v23 = objc_msgSend_assetURL(self, v21, v22);
  objc_msgSend_appendFormat_(v3, v24, @"  assetURL %@\n", v23);

  unint64_t v27 = objc_msgSend_assetType(self, v25, v26);
  uint64_t v29 = ANSTAssetTypeToNSString(v27, v28);
  objc_msgSend_appendFormat_(v3, v30, @"  assetType %@\n", v29);

  unint64_t v33 = objc_msgSend_e5FunctionName(self, v31, v32);
  objc_msgSend_appendFormat_(v3, v34, @"  e5FunctionName %@\n", v33);

  uint64_t v37 = objc_msgSend_inputDescriptors(self, v35, v36);
  objc_msgSend_appendFormat_(v3, v38, @"  inputDescriptors %@\n", v37);

  uint64_t v41 = objc_msgSend_outputDescriptors(self, v39, v40);
  objc_msgSend_appendFormat_(v3, v42, @"  outputDescriptors %@\n", v41);

  v45 = objc_msgSend_copy(v3, v43, v44);
  return v45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_name(self, v8, v9);
  uint64_t v13 = objc_msgSend_version(self, v11, v12);
  unint64_t v16 = objc_msgSend_assetURL(self, v14, v15);
  uint64_t v19 = objc_msgSend_assetType(self, v17, v18);
  uint64_t v22 = objc_msgSend_e5FunctionName(self, v20, v21);
  v25 = objc_msgSend_inputDescriptors(self, v23, v24);
  v28 = objc_msgSend_outputDescriptors(self, v26, v27);
  uint64_t v30 = objc_msgSend_initWithName_version_assetURL_assetType_e5FunctionName_inputDescriptors_outputDescriptors_error_(v7, v29, (uint64_t)v10, v13, v16, v19, v22, v25, v28, 0);

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)ANSTInferenceDescriptor;
  [(ANSTDescriptor *)&v44 encodeWithCoder:v4];
  uint64_t v5 = NSNumber;
  uint64_t v8 = objc_msgSend_version(self, v6, v7);
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(v5, v9, v8);
  uint64_t v11 = NSStringFromSelector(sel_version);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v10, v11);

  uint64_t v15 = objc_msgSend_assetURL(self, v13, v14);
  unint64_t v16 = NSStringFromSelector(sel_assetURL);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, v16);

  uint64_t v18 = NSNumber;
  uint64_t v21 = objc_msgSend_assetType(self, v19, v20);
  uint64_t v23 = objc_msgSend_numberWithInteger_(v18, v22, v21);
  uint64_t v24 = NSStringFromSelector(sel_assetType);
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v23, v24);

  v28 = objc_msgSend_inputDescriptors(self, v26, v27);
  uint64_t v29 = NSStringFromSelector(sel_inputDescriptors);
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v28, v29);

  unint64_t v33 = objc_msgSend_outputDescriptors(self, v31, v32);
  uint64_t v34 = NSStringFromSelector(sel_outputDescriptors);
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v33, v34);

  uint64_t v38 = objc_msgSend_e5FunctionName(self, v36, v37);

  if (v38)
  {
    uint64_t v41 = objc_msgSend_e5FunctionName(self, v39, v40);
    uint64_t v42 = NSStringFromSelector(sel_e5FunctionName);
    objc_msgSend_encodeObject_forKey_(v4, v43, (uint64_t)v41, v42);
  }
}

- (ANSTInferenceDescriptor)initWithCoder:(id)a3
{
  v103[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)ANSTInferenceDescriptor;
  uint64_t v5 = [(ANSTDescriptor *)&v88 initWithCoder:v4];
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(sel_version);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);

  if (!v9)
  {
    uint64_t v39 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F07F70];
    v102[0] = *MEMORY[0x263F07F80];
    v102[1] = @"ANSTDescriptorName";
    v103[0] = @"Inference descriptor version was not encoded.";
    uint64_t v22 = objc_msgSend_name(v5, v10, v11);
    v103[1] = v22;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v41, (uint64_t)v103, v102, 2);
    uint64_t v37 = LABEL_10:;
    objc_super v44 = objc_msgSend_errorWithDomain_code_userInfo_(v39, v43, v40, 4865, v37);
    objc_msgSend_failWithError_(v4, v45, (uint64_t)v44);
LABEL_24:

    uint64_t v66 = 0;
    goto LABEL_25;
  }
  v5->_version = objc_msgSend_unsignedIntegerValue(v9, v10, v11);
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = NSStringFromSelector(sel_assetURL);
  uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);
  assetURL = v5->_assetURL;
  v5->_assetURL = (NSURL *)v15;

  if (!v5->_assetURL)
  {
    uint64_t v39 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F07F70];
    v100[0] = *MEMORY[0x263F07F80];
    v100[1] = @"ANSTDescriptorName";
    v101[0] = @"Inference descriptor asset URL was not encoded.";
    uint64_t v22 = objc_msgSend_name(v5, v17, v18);
    v101[1] = v22;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v42, (uint64_t)v101, v100, 2);
    goto LABEL_10;
  }
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = NSStringFromSelector(sel_assetType);
  uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v19, v20);

  if (!v22)
  {
    objc_super v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F07F70];
    uint64_t v67 = *MEMORY[0x263F07F80];
    v99[0] = @"Inference descriptor asset type was not encoded.";
    v98[0] = v67;
    v98[1] = @"ANSTDescriptorName";
    uint64_t v37 = objc_msgSend_name(v5, v23, v24);
    v99[1] = v37;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v68, (uint64_t)v99, v98, 2);
    goto LABEL_17;
  }
  v5->_assetType = objc_msgSend_integerValue(v22, v23, v24);
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = NSStringFromSelector(sel_e5FunctionName);
  uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v25, v26);
  e5FunctionName = v5->_e5FunctionName;
  v5->_e5FunctionName = (NSString *)v28;

  if (!v5->_e5FunctionName)
  {
    uint64_t v30 = NSStringFromSelector(sel_e5FunctionName);
    int v32 = objc_msgSend_containsValueForKey_(v4, v31, (uint64_t)v30);

    if (v32)
    {
      objc_super v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F07F70];
      v96[0] = *MEMORY[0x263F07F80];
      v96[1] = @"ANSTDescriptorName";
      v97[0] = @"Inference descriptor E5 function name was not properly encoded.";
      uint64_t v37 = objc_msgSend_name(v5, v33, v34);
      v97[1] = v37;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v97, v96, 2);
      objc_super v44 = LABEL_17:;
      v70 = objc_msgSend_errorWithDomain_code_userInfo_(v35, v69, v36, 4865, v44);
      objc_msgSend_failWithError_(v4, v71, (uint64_t)v70);
LABEL_23:

      goto LABEL_24;
    }
  }
  objc_super v46 = (void *)MEMORY[0x263EFFA08];
  v95[0] = objc_opt_class();
  v95[1] = objc_opt_class();
  uint64_t v48 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v47, (uint64_t)v95, 2);
  uint64_t v37 = objc_msgSend_setWithArray_(v46, v49, (uint64_t)v48);

  uint64_t v50 = NSStringFromSelector(sel_inputDescriptors);
  uint64_t v52 = objc_msgSend_decodeArrayOfObjectsOfClasses_forKey_(v4, v51, (uint64_t)v37, v50);
  inputDescriptors = v5->_inputDescriptors;
  v5->_inputDescriptors = (NSArray *)v52;

  if (!v5->_inputDescriptors)
  {
    uint64_t v72 = (void *)MEMORY[0x263F087E8];
    uint64_t v73 = *MEMORY[0x263F07F70];
    v93[0] = *MEMORY[0x263F07F80];
    v93[1] = @"ANSTDescriptorName";
    v94[0] = @"Inference descriptor input descriptors were not encoded.";
    objc_super v44 = objc_msgSend_name(v5, v54, v55);
    v94[1] = v44;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v74, (uint64_t)v94, v93, 2);
    v70 = LABEL_20:;
    v77 = objc_msgSend_errorWithDomain_code_userInfo_(v72, v76, v73, 4865, v70);
    objc_msgSend_failWithError_(v4, v78, (uint64_t)v77);
LABEL_22:

    goto LABEL_23;
  }
  v56 = NSStringFromSelector(sel_outputDescriptors);
  uint64_t v58 = objc_msgSend_decodeArrayOfObjectsOfClasses_forKey_(v4, v57, (uint64_t)v37, v56);
  outputDescriptors = v5->_outputDescriptors;
  v5->_outputDescriptors = (NSArray *)v58;

  if (!v5->_outputDescriptors)
  {
    uint64_t v72 = (void *)MEMORY[0x263F087E8];
    uint64_t v73 = *MEMORY[0x263F07F70];
    v91[0] = *MEMORY[0x263F07F80];
    v91[1] = @"ANSTDescriptorName";
    v92[0] = @"Inference descriptor output descriptors were not encoded.";
    objc_super v44 = objc_msgSend_name(v5, v60, v61);
    v92[1] = v44;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v75, (uint64_t)v92, v91, 2);
    goto LABEL_20;
  }
  id v87 = 0;
  char v62 = objc_msgSend__buildCategorizedDescriptorsCacheWithError_(v5, v60, (uint64_t)&v87);
  id v63 = v87;
  objc_super v44 = v63;
  if ((v62 & 1) == 0)
  {
    v79 = (void *)MEMORY[0x263F087E8];
    uint64_t v80 = *MEMORY[0x263F07F70];
    uint64_t v81 = *MEMORY[0x263F07F80];
    v90[0] = @"Inference descriptor contains invalid input and/or output descriptors.";
    v89[0] = v81;
    v89[1] = @"ANSTDescriptorName";
    v70 = objc_msgSend_name(v5, v64, v65);
    v89[2] = *MEMORY[0x263F08608];
    v90[1] = v70;
    v90[2] = v44;
    v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v82, (uint64_t)v90, v89, 3);
    v84 = objc_msgSend_errorWithDomain_code_userInfo_(v79, v83, v80, 4864, v77);
    objc_msgSend_failWithError_(v4, v85, (uint64_t)v84);

    goto LABEL_22;
  }

LABEL_15:
  uint64_t v66 = v5;
LABEL_25:

  return v66;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (NSString)e5FunctionName
{
  return self->_e5FunctionName;
}

- (NSArray)inputDescriptors
{
  return self->_inputDescriptors;
}

- (NSArray)outputDescriptors
{
  return self->_outputDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDescriptors, 0);
  objc_storeStrong((id *)&self->_inputDescriptors, 0);
  objc_storeStrong((id *)&self->_e5FunctionName, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_outputPixelBufferDescriptors, 0);
  objc_storeStrong((id *)&self->_inputPixelBufferDescriptors, 0);
  objc_storeStrong((id *)&self->_outputTensorDescriptors, 0);
  objc_storeStrong((id *)&self->_inputTensorDescriptors, 0);
}

- (NSArray)allInputTensorDescriptors
{
  return (NSArray *)((uint64_t (*)(NSDictionary *, char *))MEMORY[0x270F9A6D0])(self->_inputTensorDescriptors, sel_allValues);
}

- (NSArray)allOutputTensorDescriptors
{
  return (NSArray *)((uint64_t (*)(NSDictionary *, char *))MEMORY[0x270F9A6D0])(self->_outputTensorDescriptors, sel_allValues);
}

- (id)inputTensorDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_inputTensorDescriptors, a2, (uint64_t)a3);
}

- (id)outputTensorDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_outputTensorDescriptors, a2, (uint64_t)a3);
}

- (NSArray)allInputPixelBufferDescriptors
{
  return (NSArray *)((uint64_t (*)(NSDictionary *, char *))MEMORY[0x270F9A6D0])(self->_inputPixelBufferDescriptors, sel_allValues);
}

- (NSArray)allOutputPixelBufferDescriptors
{
  return (NSArray *)((uint64_t (*)(NSDictionary *, char *))MEMORY[0x270F9A6D0])(self->_outputPixelBufferDescriptors, sel_allValues);
}

- (id)inputPixelBufferDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_inputPixelBufferDescriptors, a2, (uint64_t)a3);
}

- (id)outputPixelBufferDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_outputPixelBufferDescriptors, a2, (uint64_t)a3);
}

- (BOOL)requiresPostprocessing
{
  return 0;
}

- (id)newPostprocessorWithError:(id *)a3
{
  return 0;
}

- (NSString)espressoConfigurationName
{
  return 0;
}

@end