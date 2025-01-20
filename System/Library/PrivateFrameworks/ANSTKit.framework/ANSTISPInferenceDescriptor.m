@interface ANSTISPInferenceDescriptor
+ (BOOL)_getInputDescriptors:(id *)a3 outputDescriptors:(id *)a4 forConfiguration:(id)a5 withError:(id *)a6;
+ (BOOL)supportsSecureCoding;
+ (id)_assetURLForConfiguration:(id)a3 withError:(id *)a4;
+ (id)_descriptorWithConfiguration:(id)a3 error:(id *)a4;
+ (id)e5DescriptorWithConfiguration:(id)a3 error:(id *)a4;
- (ANSTISPInferenceConfiguration)configuration;
- (ANSTISPInferenceDescriptor)initWithCoder:(id)a3;
- (ANSTISPInferenceDescriptor)initWithConfiguration:(id)a3 error:(id *)a4;
- (ANSTISPInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10;
- (ANSTTensorDescriptor)outputSalientPersonPriorMaskDescriptor;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresPostprocessing;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)newPostprocessorWithError:(id *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTISPInferenceDescriptor

- (ANSTISPInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  result = (ANSTISPInferenceDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v20, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTISPInferenceDescriptor)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_useE5(v6, v7, v8)) {
    v11 = @"main";
  }
  else {
    v11 = 0;
  }
  v12 = objc_msgSend_copy(v6, v9, v10);

  v13 = objc_opt_class();
  id v15 = objc_msgSend__nameForConfiguration_withError_(v13, v14, (uint64_t)v12, a4);
  if (!v15)
  {
    v29 = 0;
    id v18 = 0;
LABEL_12:
    id v22 = 0;
    id v25 = 0;
    goto LABEL_14;
  }
  id v16 = objc_opt_class();
  id v18 = objc_msgSend__assetURLForConfiguration_withError_(v16, v17, (uint64_t)v12, a4);
  if (!v18)
  {
    v29 = 0;
    goto LABEL_12;
  }
  id v19 = objc_opt_class();
  id v32 = 0;
  id v33 = 0;
  int InputDescriptors_outputDescriptors_forConfiguration_withError = objc_msgSend__getInputDescriptors_outputDescriptors_forConfiguration_withError_(v19, v20, (uint64_t)&v33, &v32, v12, a4);
  id v22 = v33;
  id v25 = v32;
  if (InputDescriptors_outputDescriptors_forConfiguration_withError)
  {
    uint64_t v26 = objc_msgSend_version(v12, v23, v24);
    v31.receiver = self;
    v31.super_class = (Class)ANSTISPInferenceDescriptor;
    v27 = [(ANSTInferenceDescriptor *)&v31 initWithName:v15 version:v26 assetURL:v18 assetType:2 e5FunctionName:v11 inputDescriptors:v22 outputDescriptors:v25 error:a4];
    v28 = v27;
    if (v27) {
      objc_storeStrong((id *)&v27->_configuration, v12);
    }
    self = v28;
    v29 = self;
  }
  else
  {
    v29 = 0;
  }
LABEL_14:

  return v29;
}

+ (id)_assetURLForConfiguration:(id)a3 withError:(id *)a4
{
  id v4 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v5, *MEMORY[0x263EFF4A0], @"A concrete implementation of +_version is required.", 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

+ (BOOL)_getInputDescriptors:(id *)a3 outputDescriptors:(id *)a4 forConfiguration:(id)a5 withError:(id *)a6
{
  id v6 = a5;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v7, *MEMORY[0x263EFF4A0], @"A concrete implementation of +_version is required.", 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ANSTISPInferenceDescriptor *)a3;
  v14.receiver = self;
  v14.super_class = (Class)ANSTISPInferenceDescriptor;
  if (![(ANSTInferenceDescriptor *)&v14 isEqual:v4]) {
    goto LABEL_6;
  }
  if (v4 == self)
  {
    char isEqual = 1;
    goto LABEL_8;
  }
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_msgSend_configuration(self, v5, v6);
    uint64_t v10 = objc_msgSend_configuration(v4, v8, v9);
    char isEqual = objc_msgSend_isEqual_(v7, v11, (uint64_t)v10);
  }
  else
  {
LABEL_6:
    char isEqual = 0;
  }
LABEL_8:

  return isEqual;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)ANSTISPInferenceDescriptor;
  unint64_t v3 = [(ANSTInferenceDescriptor *)&v11 hash];
  uint64_t v6 = objc_msgSend_configuration(self, v4, v5);
  unint64_t v9 = objc_msgSend_hash(v6, v7, v8) ^ v3;

  return v9;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)ANSTISPInferenceDescriptor;
  id v4 = [(ANSTInferenceDescriptor *)&v11 debugDescription];
  v7 = objc_msgSend_debugDescription(self->_configuration, v5, v6);
  unint64_t v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@\n%@", v4, v7);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ANSTISPInferenceDescriptor;
  uint64_t v6 = [(ANSTInferenceDescriptor *)&v10 copyWithZone:a3];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_copy(self->_configuration, v4, v5);
    uint64_t v8 = (void *)v6[12];
    v6[12] = v7;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ANSTISPInferenceDescriptor;
  id v4 = a3;
  [(ANSTInferenceDescriptor *)&v10 encodeWithCoder:v4];
  uint64_t v7 = objc_msgSend_configuration(self, v5, v6, v10.receiver, v10.super_class);
  uint64_t v8 = NSStringFromSelector(sel_configuration);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v7, v8);
}

- (ANSTISPInferenceDescriptor)initWithCoder:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ANSTISPInferenceDescriptor;
  uint64_t v5 = [(ANSTInferenceDescriptor *)&v20 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(sel_configuration);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
  configuration = v5->_configuration;
  v5->_configuration = (ANSTISPInferenceConfiguration *)v9;

  if (!v5->_configuration)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F07F70];
    uint64_t v21 = *MEMORY[0x263F07F80];
    v22[0] = @"ISP inference descriptor configuration was not encoded.";
    id v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v22, &v21, 1);
    id v17 = objc_msgSend_errorWithDomain_code_userInfo_(v13, v16, v14, 4865, v15);
    objc_msgSend_failWithError_(v4, v18, (uint64_t)v17);

    v12 = 0;
  }
  else
  {
LABEL_3:
    v12 = v5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ANSTISPInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (ANSTTensorDescriptor)outputSalientPersonPriorMaskDescriptor
{
  return self->_outputSalientPersonPriorMaskDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSalientPersonPriorMaskDescriptor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (BOOL)requiresPostprocessing
{
  return 1;
}

- (id)newPostprocessorWithError:(id *)a3
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF4A0], @"A concrete implementation of +_version is required.", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)e5DescriptorWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_msgSend_copy(a3, a2, (uint64_t)a3);
  objc_msgSend_setUseE5_(v6, v7, 1);
  uint64_t v9 = objc_msgSend__descriptorWithConfiguration_error_(a1, v8, (uint64_t)v6, a4);

  return v9;
}

+ (id)_descriptorWithConfiguration:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (objc_msgSend_resolution(v5, v6, v7) == 1)
  {
    if (!a4) {
      goto LABEL_9;
    }
    objc_super v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F07F80];
    v22[0] = @"Resolution 1024x576 has been deprecated. Please stop using it.";
    objc_super v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v22, &v21, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, @"ANSTErrorDomain", 2, v11);
    goto LABEL_8;
  }
  if (objc_msgSend_version(v5, v8, v9) == 0x10000)
  {
    uint64_t v14 = [_ANSTISPInferenceDescriptorV1 alloc];
    a4 = (id *)objc_msgSend_initWithConfiguration_error_(v14, v15, (uint64_t)v5, a4);
    goto LABEL_9;
  }
  if (a4)
  {
    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F07F80];
    objc_super v20 = @"Unrecognized version.";
    objc_super v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)&v20, &v19, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v17, @"ANSTErrorDomain", 14, v11);
LABEL_8:
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_9:

  return a4;
}

@end