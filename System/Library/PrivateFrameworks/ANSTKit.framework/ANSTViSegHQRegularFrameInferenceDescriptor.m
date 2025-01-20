@interface ANSTViSegHQRegularFrameInferenceDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)assetURLForConfiguration:(id)a3;
+ (id)descriptorWithConfiguration:(id)a3 error:(id *)a4;
+ (id)e5DescriptorWithConfiguration:(id)a3 error:(id *)a4;
- (ANSTPixelBufferDescriptor)inputImageDescriptor;
- (ANSTPixelBufferDescriptor)inputMattingDescriptor;
- (ANSTPixelBufferDescriptor)outputMattingDescriptor;
- (ANSTTensorDescriptor)inputHiddenTensorDescriptor;
- (ANSTTensorDescriptor)inputKeyTensorDescriptor;
- (ANSTTensorDescriptor)inputMattingTensorDescriptor;
- (ANSTTensorDescriptor)inputProbTensorDescriptor;
- (ANSTTensorDescriptor)inputValueTensorDescriptor;
- (ANSTTensorDescriptor)outputHiddenTensorDescriptor;
- (ANSTTensorDescriptor)outputMattingTensorDescriptor;
- (ANSTTensorDescriptor)outputProbTensorDescriptor;
- (ANSTViSegHQInferenceConfiguration)configuration;
- (ANSTViSegHQRegularFrameInferenceDescriptor)initWithCoder:(id)a3;
- (ANSTViSegHQRegularFrameInferenceDescriptor)initWithName:(id)a3 configuration:(id)a4 error:(id *)a5;
- (ANSTViSegHQRegularFrameInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10;
- (BOOL)requiresPostprocessing;
- (id)newPostprocessorWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTViSegHQRegularFrameInferenceDescriptor

- (ANSTViSegHQRegularFrameInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  result = (ANSTViSegHQRegularFrameInferenceDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v20, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQRegularFrameInferenceDescriptor)initWithName:(id)a3 configuration:(id)a4 error:(id *)a5
{
  v52[6] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_useE5(v9, v10, v11)) {
    v13 = @"main";
  }
  else {
    v13 = 0;
  }
  id v15 = objc_msgSend_makeInputImagePixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v12, (uint64_t)v9, @"input_image", a5);
  if (v15)
  {
    id v16 = objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v14, (uint64_t)v9, @"input_matting", a5);
    if (v16)
    {
      id obj = a4;
      v49 = v16;
      objc_msgSend_makeProbTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v17, (uint64_t)v9, @"input_prob");
      uint64_t v18 = v45 = v13;
      uint64_t v20 = objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v19, (uint64_t)v9, @"hidden_state");
      v22 = objc_msgSend_makeKeyTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v21, (uint64_t)v9, @"prev_key");
      v42 = objc_msgSend_makeValueTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v23, (uint64_t)v9, @"prev_value");
      objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v24, (uint64_t)v9, @"output_matting", a5);
      uint64_t v25 = v44 = self;
      v27 = objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v26, (uint64_t)v9, @"hidden");
      v29 = objc_msgSend_makeProbTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v28, (uint64_t)v9, @"output");
      uint64_t v43 = objc_msgSend_version(v9, v30, v31);
      v41 = objc_msgSend_assetURLForConfiguration_(ANSTViSegHQRegularFrameInferenceDescriptor, v32, (uint64_t)v9);
      v52[0] = v15;
      v52[1] = v49;
      v47 = (void *)v20;
      v48 = (void *)v18;
      v52[2] = v18;
      v52[3] = v20;
      v52[4] = v22;
      v52[5] = v42;
      v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v33, (uint64_t)v52, 6);
      v51[0] = v27;
      v51[1] = v25;
      v46 = (void *)v25;
      v51[2] = v29;
      v36 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v35, (uint64_t)v51, 3);
      v50.receiver = v44;
      v50.super_class = (Class)ANSTViSegHQRegularFrameInferenceDescriptor;
      v37 = [(ANSTInferenceDescriptor *)&v50 initWithName:v8 version:v43 assetURL:v41 assetType:2 e5FunctionName:v45 inputDescriptors:v34 outputDescriptors:v36 error:a5];

      if (v37) {
        objc_storeStrong((id *)&v37->_configuration, obj);
      }
      self = v37;

      v38 = self;
      id v16 = v49;
    }
    else
    {
      v38 = 0;
    }
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

+ (id)assetURLForConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6 = objc_msgSend_bundleForClass_(MEMORY[0x263F086E0], v5, (uint64_t)a1);
  id v8 = objc_msgSend_URLForResource_withExtension_subdirectory_(v6, v7, @"visegHQ_mask_memory_shared", @"mlmodelc", @"Models");

  if (v8)
  {
    if (objc_msgSend_version(v4, v9, v10) == 0x20000 && (unint64_t v13 = objc_msgSend_resolution(v4, v11, v12), v13 <= 3))
    {
      id v15 = objc_msgSend_URLByAppendingPathComponent_(v8, v14, (uint64_t)off_265202E88[v13]);
    }
    else
    {
      id v15 = 0;
    }
    id v16 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136446466;
      id v19 = "+[ANSTViSegHQRegularFrameInferenceDescriptor assetURLForConfiguration:]";
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

- (ANSTPixelBufferDescriptor)inputMattingDescriptor
{
  return (ANSTPixelBufferDescriptor *)MEMORY[0x270F9A6D0](self, sel_inputPixelBufferDescriptorNamed_, @"input_matting");
}

- (ANSTTensorDescriptor)inputMattingTensorDescriptor
{
  return (ANSTTensorDescriptor *)objc_msgSend_makeMattingTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, a2, (uint64_t)self->_configuration, @"input_matting");
}

- (ANSTTensorDescriptor)inputProbTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_inputTensorDescriptorNamed_, @"input_prob");
}

- (ANSTTensorDescriptor)inputHiddenTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_inputTensorDescriptorNamed_, @"hidden_state");
}

- (ANSTTensorDescriptor)inputKeyTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_inputTensorDescriptorNamed_, @"prev_key");
}

- (ANSTTensorDescriptor)inputValueTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_inputTensorDescriptorNamed_, @"prev_value");
}

- (ANSTPixelBufferDescriptor)outputMattingDescriptor
{
  return (ANSTPixelBufferDescriptor *)MEMORY[0x270F9A6D0](self, sel_outputPixelBufferDescriptorNamed_, @"output_matting");
}

- (ANSTTensorDescriptor)outputMattingTensorDescriptor
{
  return (ANSTTensorDescriptor *)objc_msgSend_makeMattingTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, a2, (uint64_t)self->_configuration, @"output_matting");
}

- (ANSTTensorDescriptor)outputProbTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_outputTensorDescriptorNamed_, @"output");
}

- (ANSTTensorDescriptor)outputHiddenTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_outputTensorDescriptorNamed_, @"hidden");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ANSTViSegHQRegularFrameInferenceDescriptor;
  id v4 = a3;
  [(ANSTInferenceDescriptor *)&v10 encodeWithCoder:v4];
  v7 = objc_msgSend_configuration(self, v5, v6, v10.receiver, v10.super_class);
  id v8 = NSStringFromSelector(sel_configuration);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v7, v8);
}

- (ANSTViSegHQRegularFrameInferenceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANSTViSegHQRegularFrameInferenceDescriptor;
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

- (BOOL)requiresPostprocessing
{
  return 0;
}

- (id)newPostprocessorWithError:(id *)a3
{
  return 0;
}

+ (id)descriptorWithConfiguration:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    id v8 = objc_alloc((Class)a1);
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v8, v9, @"ViSegHQRegularFrameInferenceDescriptor", v7, a4);
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
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v12, v13, @"ViSegHQRegularFrameInferenceDescriptor", v10, a4);
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