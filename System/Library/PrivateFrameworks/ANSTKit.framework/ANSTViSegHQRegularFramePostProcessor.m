@interface ANSTViSegHQRegularFramePostProcessor
- (ANSTViSegHQInferenceConfiguration)configuration;
- (ANSTViSegHQRegularFramePostProcessor)initWithConfiguration:(id)a3 error:(id *)a4;
- (ANSTViSegHQRegularFramePostProcessor)initWithInferenceDescriptor:(id)a3 error:(id *)a4;
- (ANSTViSegHQRegularFramePostProcessor)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6;
- (BOOL)processWithError:(id *)a3;
@end

@implementation ANSTViSegHQRegularFramePostProcessor

- (ANSTViSegHQRegularFramePostProcessor)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  result = (ANSTViSegHQRegularFramePostProcessor *)objc_msgSend_doesNotRecognizeSelector_(self, v13, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQRegularFramePostProcessor)initWithInferenceDescriptor:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend_configuration(a3, a2, (uint64_t)a3);
  v8 = (ANSTViSegHQRegularFramePostProcessor *)objc_msgSend_initWithConfiguration_error_(self, v7, (uint64_t)v6, a4);

  return v8;
}

- (ANSTViSegHQRegularFramePostProcessor)initWithConfiguration:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v10 = objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v8, (uint64_t)v7, @"output_mask", a4);
  if (v10)
  {
    id v11 = objc_msgSend_makeMattingTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v9, (uint64_t)v7, @"output_matting");
    v23 = v11;
    v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, (uint64_t)&v23, 1);
    v22 = v10;
    v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)&v22, 1);
    v21.receiver = self;
    v21.super_class = (Class)ANSTViSegHQRegularFramePostProcessor;
    v16 = [(ANSTInferencePostprocessor *)&v21 initWithInferenceInputDescriptors:MEMORY[0x263EFFA68] inferenceOutputDescriptors:v13 processedOutputDescriptors:v15 error:a4];

    if (v16)
    {
      objc_storeStrong((id *)&v16->_configuration, a3);
      objc_storeStrong((id *)&v16->_outputMatting, v11);
      objc_storeStrong((id *)&v16->_outputMask, v10);
    }
    self = v16;
    v17 = self;
  }
  else
  {
    if (!a4)
    {
      v17 = 0;
      goto LABEL_8;
    }
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F07F80];
    v25[0] = @"Error creating output pixel buffer descriptor.";
    id v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v25, &v24, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v18, v19, @"ANSTErrorDomain", 13, v11);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v17;
}

- (BOOL)processWithError:(id *)a3
{
  v40[2] = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_name(self->_outputMatting, a2, (uint64_t)a3);
  id v7 = objc_msgSend_inputTensorDataForDescriptorNamed_(self, v6, (uint64_t)v5);

  if (v7)
  {
    id v10 = objc_msgSend_name(self->_outputMask, v8, v9);
    id v12 = objc_msgSend_outputPixelBufferForDescriptorNamed_(self, v11, (uint64_t)v10);

    if (v12)
    {
      v15 = (__CVBuffer *)objc_msgSend_pixelBuffer(v12, v13, v14);
      CVPixelBufferLockBaseAddress(v15, 0);
      size_t Width = CVPixelBufferGetWidth(v15);
      size_t Height = CVPixelBufferGetHeight(v15);
      v20 = objc_msgSend_tensorDescriptor(v7, v18, v19);
      uint64_t v23 = objc_msgSend_dataType(v20, v21, v22);
      uint64_t v24 = ANSTTensorDataTypeGetSize(v23) * Width;

      CVPixelBufferGetBytesPerRow(v15);
      BaseAddress = CVPixelBufferGetBaseAddress(v15);
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = sub_246D5E540;
      v36[3] = &unk_265202E68;
      v36[4] = BaseAddress;
      v36[5] = Height;
      v36[6] = v24;
      char v27 = objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v7, v26, 0, v36, a3);
      CVPixelBufferUnlockBaseAddress(v15, 0);
    }
    else
    {
      if (a3)
      {
        v31 = (void *)MEMORY[0x263F087E8];
        v37[0] = *MEMORY[0x263F07F80];
        v37[1] = @"ANSTDescriptor";
        outputMask = self->_outputMask;
        v38[0] = @"Output pixel buffer not found.";
        v38[1] = outputMask;
        v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v38, v37, 2);
        objc_msgSend_errorWithDomain_code_userInfo_(v31, v34, @"ANSTErrorDomain", 13, v33);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      char v27 = 0;
    }
  }
  else
  {
    if (!a3)
    {
      char v27 = 0;
      goto LABEL_10;
    }
    v28 = (void *)MEMORY[0x263F087E8];
    v39[0] = *MEMORY[0x263F07F80];
    v39[1] = @"ANSTDescriptor";
    outputMatting = self->_outputMatting;
    v40[0] = @"Input tensor data not found.";
    v40[1] = outputMatting;
    id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v40, v39, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, @"ANSTErrorDomain", 11, v12);
    char v27 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v27;
}

- (ANSTViSegHQInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outputMask, 0);
  objc_storeStrong((id *)&self->_outputMatting, 0);
}

@end