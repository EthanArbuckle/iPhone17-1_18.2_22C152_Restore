@interface ANSTViSegHQUpdateFramePostProcessor
- (ANSTViSegHQInferenceConfiguration)configuration;
- (ANSTViSegHQUpdateFramePostProcessor)initWithConfiguration:(id)a3 error:(id *)a4;
- (ANSTViSegHQUpdateFramePostProcessor)initWithInferenceDescriptor:(id)a3 error:(id *)a4;
- (ANSTViSegHQUpdateFramePostProcessor)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6;
- (BOOL)_processKeyTensorWithInput:(id)a3 output:(id)a4 error:(id *)a5;
- (BOOL)_processValueTensorWithInput:(id)a3 output:(id)a4 error:(id *)a5;
- (BOOL)processWithError:(id *)a3;
- (id)_inputTensorDataForDescriptor:(id)a3 error:(id *)a4;
- (id)_outputTensorDataForDescriptor:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation ANSTViSegHQUpdateFramePostProcessor

- (ANSTViSegHQUpdateFramePostProcessor)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  result = (ANSTViSegHQUpdateFramePostProcessor *)objc_msgSend_doesNotRecognizeSelector_(self, v13, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQUpdateFramePostProcessor)initWithInferenceDescriptor:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend_configuration(a3, a2, (uint64_t)a3);
  v8 = (ANSTViSegHQUpdateFramePostProcessor *)objc_msgSend_initWithConfiguration_error_(self, v7, (uint64_t)v6, a4);

  return v8;
}

- (ANSTViSegHQUpdateFramePostProcessor)initWithConfiguration:(id)a3 error:(id *)a4
{
  v28[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v9 = objc_msgSend_makeKeyTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v8, (uint64_t)v7, @"key");
  id v11 = objc_msgSend_makeValueTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v10, (uint64_t)v7, @"value");
  v28[0] = v9;
  v28[1] = v11;
  v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, (uint64_t)v28, 2);
  v27[0] = v9;
  v27[1] = v11;
  v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v27, 2);
  v26.receiver = self;
  v26.super_class = (Class)ANSTViSegHQUpdateFramePostProcessor;
  v16 = [(ANSTInferencePostprocessor *)&v26 initWithInferenceInputDescriptors:MEMORY[0x263EFFA68] inferenceOutputDescriptors:v13 processedOutputDescriptors:v15 error:a4];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_configuration, a3);
    objc_storeStrong((id *)&v16->_key, v9);
    objc_storeStrong((id *)&v16->_value, v11);
    unint64_t v18 = (unint64_t)((double)(unint64_t)objc_msgSend_lengthOfDimensionAt_(v16->_key, v17, 1) * 0.5);
    size_t v20 = objc_msgSend_strideOfDimensionAt_(v16->_key, v19, 1) * v18;
    v16->_keyTensorSwapSpaceSize = v20;
    v16->_keyTensorSwapSpace = malloc_type_malloc(v20, 0xA4E66C8DuLL);
    unint64_t v22 = (unint64_t)((double)(unint64_t)objc_msgSend_lengthOfDimensionAt_(v16->_value, v21, 3) * 0.5);
    size_t v24 = objc_msgSend_strideOfDimensionAt_(v16->_value, v23, 3) * v22;
    v16->_valueTensorSwapSpaceSize = v24;
    v16->_valueTensorSwapSpace = malloc_type_malloc(v24, 0x1BB3CC56uLL);
  }

  return v16;
}

- (void)dealloc
{
  free(self->_keyTensorSwapSpace);
  self->_keyTensorSwapSpace = 0;
  free(self->_valueTensorSwapSpace);
  self->_valueTensorSwapSpace = 0;
  v3.receiver = self;
  v3.super_class = (Class)ANSTViSegHQUpdateFramePostProcessor;
  [(ANSTViSegHQUpdateFramePostProcessor *)&v3 dealloc];
}

- (BOOL)processWithError:(id *)a3
{
  v6 = objc_msgSend__inputTensorDataForDescriptor_error_(self, a2, (uint64_t)self->_key, a3);
  if (v6)
  {
    v8 = objc_msgSend__outputTensorDataForDescriptor_error_(self, v5, (uint64_t)self->_key, a3);
    if (v8)
    {
      id v10 = objc_msgSend__inputTensorDataForDescriptor_error_(self, v7, (uint64_t)self->_value, a3);
      if (v10)
      {
        id v12 = objc_msgSend__outputTensorDataForDescriptor_error_(self, v9, (uint64_t)self->_value, a3);
        if (v12 && objc_msgSend__processKeyTensorWithInput_output_error_(self, v11, (uint64_t)v6, v8, a3)) {
          char v14 = objc_msgSend__processValueTensorWithInput_output_error_(self, v13, (uint64_t)v10, v12, a3);
        }
        else {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)_inputTensorDataForDescriptor:(id)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v9 = objc_msgSend_name(v6, v7, v8);
  id v11 = objc_msgSend_inputTensorDataForDescriptorNamed_(self, v10, (uint64_t)v9);

  if (v11)
  {
    id v13 = v11;
  }
  else if (a4)
  {
    char v14 = (void *)MEMORY[0x263F087E8];
    v18[0] = *MEMORY[0x263F07F80];
    v18[1] = @"ANSTDescriptor";
    v19[0] = @"Input tensor data not found.";
    v19[1] = v6;
    v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v19, v18, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, @"ANSTErrorDomain", 11, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)_outputTensorDataForDescriptor:(id)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v9 = objc_msgSend_name(v6, v7, v8);
  id v11 = objc_msgSend_outputTensorDataForDescriptorNamed_(self, v10, (uint64_t)v9);

  if (v11)
  {
    id v13 = v11;
  }
  else if (a4)
  {
    char v14 = (void *)MEMORY[0x263F087E8];
    v18[0] = *MEMORY[0x263F07F80];
    v18[1] = @"ANSTDescriptor";
    v19[0] = @"Output tensor data not found.";
    v19[1] = v6;
    v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v19, v18, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, @"ANSTErrorDomain", 11, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (BOOL)_processKeyTensorWithInput:(id)a3 output:(id)a4 error:(id *)a5
{
  id v8 = a4;
  key = self->_key;
  id v10 = a3;
  uint64_t v12 = objc_msgSend_lengthOfDimensionAt_(key, v11, 0);
  uint64_t v14 = objc_msgSend_strideOfDimensionAt_(self->_key, v13, 0);
  char v26 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_246D630D0;
  void v19[3] = &unk_265202EF0;
  unint64_t v22 = &v26;
  uint64_t v23 = v12;
  id v20 = v8;
  v21 = self;
  uint64_t v24 = v14;
  v25 = a5;
  id v15 = v8;
  char v17 = objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v10, v16, 0, v19, a5);

  if (!v26) {
    char v17 = 0;
  }

  return v17;
}

- (BOOL)_processValueTensorWithInput:(id)a3 output:(id)a4 error:(id *)a5
{
  id v8 = a4;
  value = self->_value;
  id v10 = a3;
  uint64_t v12 = objc_msgSend_lengthOfDimensionAt_(value, v11, 0);
  uint64_t v14 = objc_msgSend_strideOfDimensionAt_(self->_value, v13, 0);
  uint64_t v16 = objc_msgSend_lengthOfDimensionAt_(self->_value, v15, 1);
  uint64_t v18 = objc_msgSend_strideOfDimensionAt_(self->_value, v17, 1);
  uint64_t v20 = objc_msgSend_lengthOfDimensionAt_(self->_value, v19, 2);
  uint64_t v22 = objc_msgSend_strideOfDimensionAt_(self->_value, v21, 2);
  char v38 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  void v27[2] = sub_246D63388;
  v27[3] = &unk_265202F40;
  v30 = &v38;
  uint64_t v31 = v12;
  uint64_t v32 = v16;
  uint64_t v33 = v20;
  uint64_t v34 = v14;
  uint64_t v35 = v18;
  id v28 = v8;
  v29 = self;
  uint64_t v36 = v22;
  v37 = a5;
  id v23 = v8;
  char v25 = objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v10, v24, 0, v27, a5);

  if (!v38) {
    char v25 = 0;
  }

  return v25;
}

- (ANSTViSegHQInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end