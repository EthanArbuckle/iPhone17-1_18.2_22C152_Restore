@interface ANSTViSegHQUpdateFrameInferenceDescriptor
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
- (ANSTTensorDescriptor)outputKeyTensorDescriptor;
- (ANSTTensorDescriptor)outputMattingTensorDescriptor;
- (ANSTTensorDescriptor)outputProbTensorDescriptor;
- (ANSTTensorDescriptor)outputValueTensorDescriptor;
- (ANSTViSegHQInferenceConfiguration)configuration;
- (ANSTViSegHQUpdateFrameInferenceDescriptor)initWithCoder:(id)a3;
- (ANSTViSegHQUpdateFrameInferenceDescriptor)initWithName:(id)a3 configuration:(id)a4 error:(id *)a5;
- (ANSTViSegHQUpdateFrameInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10;
- (BOOL)isE5;
- (BOOL)requiresPostprocessing;
- (id)newPostprocessorWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTViSegHQUpdateFrameInferenceDescriptor

- (ANSTViSegHQUpdateFrameInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  result = (ANSTViSegHQUpdateFrameInferenceDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v20, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQUpdateFrameInferenceDescriptor)initWithName:(id)a3 configuration:(id)a4 error:(id *)a5
{
  v56[6] = *MEMORY[0x263EF8340];
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
    id v17 = objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v14, (uint64_t)v9, @"input_matting", a5);
    if (v17)
    {
      id obj = a4;
      v53 = objc_msgSend_makeProbTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v16, (uint64_t)v9, @"input_prob");
      objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v18, (uint64_t)v9, @"hidden_state");
      v52 = v48 = v13;
      v51 = objc_msgSend_makeKeyTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v19, (uint64_t)v9, @"prev_key");
      uint64_t v21 = objc_msgSend_makeValueTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v20, (uint64_t)v9, @"prev_value");
      v46 = objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v22, (uint64_t)v9, @"output_matting", a5);
      v24 = objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v23, (uint64_t)v9, @"hidden");
      v43 = objc_msgSend_makeKeyTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v25, (uint64_t)v9, @"key");
      objc_msgSend_makeValueTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v26, (uint64_t)v9, @"value");
      uint64_t v27 = v45 = self;
      v29 = objc_msgSend_makeProbTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v28, (uint64_t)v9, @"output");
      uint64_t v44 = objc_msgSend_version(v9, v30, v31);
      v33 = objc_msgSend_assetURLForConfiguration_(ANSTViSegHQUpdateFrameInferenceDescriptor, v32, (uint64_t)v9);
      v56[0] = v15;
      v56[1] = v17;
      v49 = (void *)v21;
      v50 = v17;
      v56[2] = v53;
      v56[3] = v52;
      v56[4] = v51;
      v56[5] = v21;
      id v34 = v8;
      v36 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v35, (uint64_t)v56, 6);
      v55[0] = v24;
      v55[1] = v43;
      v55[2] = v27;
      v47 = (void *)v27;
      v55[3] = v46;
      v55[4] = v29;
      v38 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v37, (uint64_t)v55, 5);
      v54.receiver = v45;
      v54.super_class = (Class)ANSTViSegHQUpdateFrameInferenceDescriptor;
      v39 = [(ANSTInferenceDescriptor *)&v54 initWithName:v34 version:v44 assetURL:v33 assetType:2 e5FunctionName:v48 inputDescriptors:v36 outputDescriptors:v38 error:a5];

      if (v39) {
        objc_storeStrong((id *)&v39->_configuration, obj);
      }
      self = v39;

      v40 = self;
      id v8 = v34;
      id v17 = v50;
    }
    else
    {
      v40 = 0;
    }
  }
  else
  {
    v40 = 0;
  }

  return v40;
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
      id v15 = objc_msgSend_URLByAppendingPathComponent_(v8, v14, (uint64_t)off_265203038[v13]);
    }
    else
    {
      id v15 = 0;
    }
    id v16 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136446466;
      id v19 = "+[ANSTViSegHQUpdateFrameInferenceDescriptor assetURLForConfiguration:]";
      __int16 v20 = 2114;
      uint64_t v21 = v15;
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

- (ANSTTensorDescriptor)outputKeyTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_outputTensorDescriptorNamed_, @"key");
}

- (ANSTTensorDescriptor)outputValueTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x270F9A6D0](self, sel_outputTensorDescriptorNamed_, @"value");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ANSTViSegHQUpdateFrameInferenceDescriptor;
  id v4 = a3;
  [(ANSTInferenceDescriptor *)&v10 encodeWithCoder:v4];
  v7 = objc_msgSend_configuration(self, v5, v6, v10.receiver, v10.super_class);
  id v8 = NSStringFromSelector(sel_configuration);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v7, v8);
}

- (ANSTViSegHQUpdateFrameInferenceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANSTViSegHQUpdateFrameInferenceDescriptor;
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

- (BOOL)isE5
{
  return self->_isE5;
}

- (void).cxx_destruct
{
}

- (BOOL)requiresPostprocessing
{
  return 1;
}

- (id)newPostprocessorWithError:(id *)a3
{
  v5 = [ANSTViSegHQUpdateFramePostProcessor alloc];
  configuration = self->_configuration;
  return (id)objc_msgSend_initWithConfiguration_error_(v5, v6, (uint64_t)configuration, a3);
}

+ (id)descriptorWithConfiguration:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    id v8 = objc_alloc((Class)a1);
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v8, v9, @"ViSegHQUpdateFrameInferenceDescriptor", v7, a4);
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
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v12, v13, @"ViSegHQUpdateFrameInferenceDescriptor", v10, a4);
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