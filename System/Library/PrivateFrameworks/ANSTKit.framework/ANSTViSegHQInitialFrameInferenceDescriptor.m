@interface ANSTViSegHQInitialFrameInferenceDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)assetURLForConfiguration:(id)a3;
+ (id)descriptorWithConfiguration:(id)a3 error:(id *)a4;
+ (id)e5DescriptorWithConfiguration:(id)a3 error:(id *)a4;
- (ANSTPixelBufferDescriptor)inputImageDescriptor;
- (ANSTPixelBufferDescriptor)inputMaskDescriptor;
- (ANSTTensorDescriptor)inputHiddenTensorDescriptor;
- (ANSTTensorDescriptor)inputMaskTensorDescriptor;
- (ANSTTensorDescriptor)outputHiddenTensorDescriptor;
- (ANSTTensorDescriptor)outputKeyTensorDescriptor;
- (ANSTTensorDescriptor)outputValueTensorDescriptor;
- (ANSTViSegHQInferenceConfiguration)configuration;
- (ANSTViSegHQInitialFrameInferenceDescriptor)initWithCoder:(id)a3;
- (ANSTViSegHQInitialFrameInferenceDescriptor)initWithName:(id)a3 configuration:(id)a4 error:(id *)a5;
- (ANSTViSegHQInitialFrameInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10;
- (BOOL)requiresPostprocessing;
- (id)newPostprocessorWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTViSegHQInitialFrameInferenceDescriptor

- (ANSTViSegHQInitialFrameInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  result = (ANSTViSegHQInitialFrameInferenceDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v20, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQInitialFrameInferenceDescriptor)initWithName:(id)a3 configuration:(id)a4 error:(id *)a5
{
  v44[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v12 = objc_msgSend_useE5(v9, v10, v11);
  v14 = @"main";
  if (!v12) {
    v14 = 0;
  }
  v41 = v14;
  id v16 = objc_msgSend_makeInputImagePixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v13, (uint64_t)v9, @"input_image", a5);
  if (v16)
  {
    id v17 = objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v15, (uint64_t)v9, @"mask", a5);
    if (v17)
    {
      id obj = a4;
      id v19 = v17;
      uint64_t v20 = objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v18, (uint64_t)v9, @"hidden_state");
      v22 = objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v21, (uint64_t)v9, @"hidden");
      v37 = objc_msgSend_makeKeyTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v23, (uint64_t)v9, @"key");
      v25 = objc_msgSend_makeValueTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v24, (uint64_t)v9, @"value");
      uint64_t v39 = objc_msgSend_version(v9, v26, v27);
      v38 = objc_msgSend_assetURLForConfiguration_(ANSTViSegHQInitialFrameInferenceDescriptor, v28, (uint64_t)v9);
      v44[0] = v16;
      v44[1] = v19;
      v40 = (void *)v20;
      v44[2] = v20;
      v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v29, (uint64_t)v44, 3);
      v43[0] = v22;
      v43[1] = v37;
      v43[2] = v25;
      v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v31, (uint64_t)v43, 3);
      v42.receiver = self;
      v42.super_class = (Class)ANSTViSegHQInitialFrameInferenceDescriptor;
      v33 = [(ANSTInferenceDescriptor *)&v42 initWithName:v8 version:v39 assetURL:v38 assetType:2 e5FunctionName:v41 inputDescriptors:v30 outputDescriptors:v32 error:a5];

      if (v33) {
        objc_storeStrong((id *)&v33->_configuration, obj);
      }
      self = v33;

      v34 = self;
      id v17 = v19;
    }
    else
    {
      v34 = 0;
    }
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)assetURLForConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6 = objc_msgSend_bundleForClass_(MEMORY[0x263F086E0], v5, (uint64_t)a1);
  id v8 = objc_msgSend_URLForResource_withExtension_subdirectory_(v6, v7, @"visegHQ_memory", @"mlmodelc", @"Models");

  if (v8)
  {
    if (objc_msgSend_version(v4, v9, v10) == 0x20000 && (unint64_t v13 = objc_msgSend_resolution(v4, v11, v12), v13 <= 3))
    {
      id v15 = objc_msgSend_URLByAppendingPathComponent_(v8, v14, (uint64_t)off_265202F60[v13]);
    }
    else
    {
      id v15 = 0;
    }
    id v16 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136446466;
      id v19 = "+[ANSTViSegHQInitialFrameInferenceDescriptor assetURLForConfiguration:]";
      __int16 v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_246D53000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: returning %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (ANSTPixelBufferDescriptor)inputImageDescriptor
{
  return (ANSTPixelBufferDescriptor *)MEMORY[0x270F9A6D0](self, sel_inputPixelBufferDescriptorNamed_, @"input_image");
}

- (ANSTPixelBufferDescriptor)inputMaskDescriptor
{
  return (ANSTPixelBufferDescriptor *)MEMORY[0x270F9A6D0](self, sel_inputPixelBufferDescriptorNamed_, @"mask");
}

- (ANSTTensorDescriptor)inputMaskTensorDescriptor
{
  return (ANSTTensorDescriptor *)objc_msgSend_makeMattingTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, a2, (uint64_t)self->_configuration, @"mask");
}

- (ANSTTensorDescriptor)inputHiddenTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_inputTensorDescriptorNamed_, @"hidden_state");
}

- (ANSTTensorDescriptor)outputHiddenTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_outputTensorDescriptorNamed_, @"hidden");
}

- (ANSTTensorDescriptor)outputKeyTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_outputTensorDescriptorNamed_, @"key");
}

- (ANSTTensorDescriptor)outputValueTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_outputTensorDescriptorNamed_, @"value");
}

- (BOOL)requiresPostprocessing
{
  return 0;
}

- (id)newPostprocessorWithError:(id *)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ANSTViSegHQInitialFrameInferenceDescriptor;
  id v4 = a3;
  [(ANSTInferenceDescriptor *)&v10 encodeWithCoder:v4];
  v7 = objc_msgSend_configuration(self, v5, v6, v10.receiver, v10.super_class);
  id v8 = NSStringFromSelector(sel_configuration);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v7, v8);
}

- (ANSTViSegHQInitialFrameInferenceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANSTViSegHQInitialFrameInferenceDescriptor;
  v5 = [(ANSTInferenceDescriptor *)&v13 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(sel_configuration);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
  configuration = v5->_configuration;
  v5->_configuration = (ANSTViSegHQInferenceConfiguration *)v9;

  if (!v5->_configuration) {
    uint64_t v11 = 0;
  }
  else {
LABEL_3:
  }
    uint64_t v11 = v5;

  return v11;
}

- (ANSTViSegHQInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

+ (id)descriptorWithConfiguration:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    id v8 = objc_alloc((Class)a1);
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v8, v9, @"ViSegHQInitialFrameInferenceDescriptor", v7, a4);
  }
  else if (a4)
  {
    objc_super v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"Configuration cannot be nil.";
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v15, &v14, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, @"ANSTErrorDomain", 2, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

+ (id)e5DescriptorWithConfiguration:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v9 = v6;
  if (v6)
  {
    objc_super v10 = objc_msgSend_copy(v6, v7, v8);
    objc_msgSend_setUseE5_(v10, v11, 1);
    id v12 = objc_alloc((Class)a1);
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v12, v13, @"ViSegHQInitialFrameInferenceDescriptor", v10, a4);
  }
  else if (a4)
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v19[0] = @"Configuration cannot be nil.";
    id v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v19, &v18, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, @"ANSTErrorDomain", 2, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end