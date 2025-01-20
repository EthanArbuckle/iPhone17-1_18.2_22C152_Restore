@interface ANSTInferencePostprocessor
+ (id)new;
- (ANSTInferencePostprocessor)init;
- (ANSTInferencePostprocessor)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6;
- (BOOL)_validateDescriptor:(id)a3 usingAllowedDescriptors:(id)a4 withError:(id *)a5;
- (BOOL)_validatePixelBuffer:(id)a3 forDescriptor:(id)a4 usingAllowedDescriptors:(id)a5 withError:(id *)a6;
- (BOOL)_validateTensorData:(id)a3 forDescriptor:(id)a4 usingAllowedDescriptors:(id)a5 withError:(id *)a6;
- (BOOL)processWithError:(id *)a3;
- (BOOL)setInputPixelBuffer:(id)a3 forInferenceInputDescriptor:(id)a4 withError:(id *)a5;
- (BOOL)setInputPixelBuffer:(id)a3 forInferenceOutputDescriptor:(id)a4 withError:(id *)a5;
- (BOOL)setInputTensorData:(id)a3 forInferenceInputDescriptor:(id)a4 withError:(id *)a5;
- (BOOL)setInputTensorData:(id)a3 forInferenceOutputDescriptor:(id)a4 withError:(id *)a5;
- (BOOL)setOutputPixelBuffer:(id)a3 forProcessedOutputDescriptor:(id)a4 withError:(id *)a5;
- (BOOL)setOutputTensorData:(id)a3 forProcessedOutputDescriptor:(id)a4 withError:(id *)a5;
- (NSArray)inferenceInputDescriptors;
- (NSArray)inferenceInputPixelBufferDescriptors;
- (NSArray)inferenceInputTensorDescriptors;
- (NSArray)inferenceOutputDescriptors;
- (NSArray)inferenceOutputPixelBufferDescriptors;
- (NSArray)inferenceOutputTensorDescriptors;
- (NSArray)processedOutputDescriptors;
- (NSArray)processedOutputPixelBufferDescriptors;
- (NSArray)processedOutputTensorDescriptors;
- (id)inputPixelBufferForDescriptorNamed:(id)a3;
- (id)inputTensorDataForDescriptorNamed:(id)a3;
- (id)outputPixelBufferForDescriptorNamed:(id)a3;
- (id)outputTensorDataForDescriptorNamed:(id)a3;
@end

@implementation ANSTInferencePostprocessor

- (ANSTInferencePostprocessor)init
{
  result = (ANSTInferencePostprocessor *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTInferencePostprocessor)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)ANSTInferencePostprocessor;
  v14 = [(ANSTInferencePostprocessor *)&v34 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v9, v12, v13);
    inferenceInputDescriptors = v14->_inferenceInputDescriptors;
    v14->_inferenceInputDescriptors = (NSArray *)v15;

    uint64_t v19 = objc_msgSend_copy(v10, v17, v18);
    inferenceOutputDescriptors = v14->_inferenceOutputDescriptors;
    v14->_inferenceOutputDescriptors = (NSArray *)v19;

    uint64_t v23 = objc_msgSend_copy(v11, v21, v22);
    processedOutputDescriptors = v14->_processedOutputDescriptors;
    v14->_processedOutputDescriptors = (NSArray *)v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    inputTensorData = v14->_inputTensorData;
    v14->_inputTensorData = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    inputPixelBuffers = v14->_inputPixelBuffers;
    v14->_inputPixelBuffers = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    outputTensorData = v14->_outputTensorData;
    v14->_outputTensorData = v29;

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    outputPixelBuffers = v14->_outputPixelBuffers;
    v14->_outputPixelBuffers = v31;
  }
  return v14;
}

- (BOOL)_validateDescriptor:(id)a3 usingAllowedDescriptors:(id)a4 withError:(id *)a5
{
  v23[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_name(v7, v9, v10);
  v14 = v11;
  if (!v11 || !objc_msgSend_length(v11, v12, v13))
  {
    if (!a5) {
      goto LABEL_10;
    }
    v16 = (void *)MEMORY[0x263F087E8];
    v22[0] = *MEMORY[0x263F07F80];
    v22[1] = @"ANSTDescriptor";
    v23[0] = @"Descriptor name should not be empty.";
    v23[1] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v23, v22, 2);
    v17 = LABEL_9:;
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v18, @"ANSTErrorDomain", 10, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend_containsObject_(v8, v12, (uint64_t)v7) & 1) == 0)
  {
    if (!a5) {
      goto LABEL_10;
    }
    v16 = (void *)MEMORY[0x263F087E8];
    v20[0] = *MEMORY[0x263F07F80];
    v20[1] = @"ANSTDescriptor";
    v21[0] = @"Unrecognized descriptor is not allowed.";
    v21[1] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v21, v20, 2);
    goto LABEL_9;
  }
  LOBYTE(a5) = 1;
LABEL_10:

  return (char)a5;
}

- (BOOL)_validateTensorData:(id)a3 forDescriptor:(id)a4 usingAllowedDescriptors:(id)a5 withError:(id *)a6
{
  v24[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (!objc_msgSend__validateDescriptor_usingAllowedDescriptors_withError_(self, v12, (uint64_t)v11, a5, a6))goto LABEL_7; {
  if (v10)
  }
  {
    uint64_t v15 = objc_msgSend_tensorDescriptor(v10, v13, v14);
    char isEqual = objc_msgSend_isEqual_(v15, v16, (uint64_t)v11);

    if ((isEqual & 1) == 0)
    {
      if (!a6) {
        goto LABEL_8;
      }
      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      v23[0] = *MEMORY[0x263F07F80];
      v23[1] = @"ANSTDescriptor";
      v24[0] = @"Tensor does not match its designated descriptor.";
      v24[1] = v11;
      v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v24, v23, 2);
      objc_msgSend_errorWithDomain_code_userInfo_(v19, v21, @"ANSTErrorDomain", 11, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      LOBYTE(a6) = 0;
      goto LABEL_8;
    }
  }
  LOBYTE(a6) = 1;
LABEL_8:

  return (char)a6;
}

- (BOOL)_validatePixelBuffer:(id)a3 forDescriptor:(id)a4 usingAllowedDescriptors:(id)a5 withError:(id *)a6
{
  v24[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (!objc_msgSend__validateDescriptor_usingAllowedDescriptors_withError_(self, v12, (uint64_t)v11, a5, a6))goto LABEL_7; {
  if (v10)
  }
  {
    uint64_t v15 = objc_msgSend_pixelBufferDescriptor(v10, v13, v14);
    char isEqual = objc_msgSend_isEqual_(v15, v16, (uint64_t)v11);

    if ((isEqual & 1) == 0)
    {
      if (!a6) {
        goto LABEL_8;
      }
      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      v23[0] = *MEMORY[0x263F07F80];
      v23[1] = @"ANSTDescriptor";
      v24[0] = @"Pixel buffer does not match its designated descriptor.";
      v24[1] = v11;
      v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v24, v23, 2);
      objc_msgSend_errorWithDomain_code_userInfo_(v19, v21, @"ANSTErrorDomain", 13, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      LOBYTE(a6) = 0;
      goto LABEL_8;
    }
  }
  LOBYTE(a6) = 1;
LABEL_8:

  return (char)a6;
}

- (BOOL)setInputTensorData:(id)a3 forInferenceInputDescriptor:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v12 = objc_msgSend_inferenceInputTensorDescriptors(self, v10, v11);
  int v14 = objc_msgSend__validateTensorData_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    inputTensorData = self->_inputTensorData;
    uint64_t v18 = objc_msgSend_name(v9, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(inputTensorData, v19, (uint64_t)v8, v18);
  }
  return v14;
}

- (BOOL)setInputPixelBuffer:(id)a3 forInferenceInputDescriptor:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v12 = objc_msgSend_inferenceInputPixelBufferDescriptors(self, v10, v11);
  int v14 = objc_msgSend__validatePixelBuffer_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    inputPixelBuffers = self->_inputPixelBuffers;
    uint64_t v18 = objc_msgSend_name(v9, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(inputPixelBuffers, v19, (uint64_t)v8, v18);
  }
  return v14;
}

- (BOOL)setInputTensorData:(id)a3 forInferenceOutputDescriptor:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v12 = objc_msgSend_inferenceOutputTensorDescriptors(self, v10, v11);
  int v14 = objc_msgSend__validateTensorData_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    inputTensorData = self->_inputTensorData;
    uint64_t v18 = objc_msgSend_name(v9, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(inputTensorData, v19, (uint64_t)v8, v18);
  }
  return v14;
}

- (BOOL)setInputPixelBuffer:(id)a3 forInferenceOutputDescriptor:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v12 = objc_msgSend_inferenceOutputPixelBufferDescriptors(self, v10, v11);
  int v14 = objc_msgSend__validatePixelBuffer_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    inputPixelBuffers = self->_inputPixelBuffers;
    uint64_t v18 = objc_msgSend_name(v9, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(inputPixelBuffers, v19, (uint64_t)v8, v18);
  }
  return v14;
}

- (BOOL)setOutputTensorData:(id)a3 forProcessedOutputDescriptor:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v12 = objc_msgSend_processedOutputTensorDescriptors(self, v10, v11);
  int v14 = objc_msgSend__validateTensorData_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    outputTensorData = self->_outputTensorData;
    uint64_t v18 = objc_msgSend_name(v9, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(outputTensorData, v19, (uint64_t)v8, v18);
  }
  return v14;
}

- (BOOL)setOutputPixelBuffer:(id)a3 forProcessedOutputDescriptor:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v12 = objc_msgSend_processedOutputPixelBufferDescriptors(self, v10, v11);
  int v14 = objc_msgSend__validatePixelBuffer_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    outputPixelBuffers = self->_outputPixelBuffers;
    uint64_t v18 = objc_msgSend_name(v9, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(outputPixelBuffers, v19, (uint64_t)v8, v18);
  }
  return v14;
}

- (BOOL)processWithError:(id *)a3
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF4A0], @"A concrete implementation of -processWithError: is required.", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)inputTensorDataForDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_inputTensorData, a2, (uint64_t)a3);
}

- (id)inputPixelBufferForDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_inputPixelBuffers, a2, (uint64_t)a3);
}

- (id)outputTensorDataForDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_outputTensorData, a2, (uint64_t)a3);
}

- (id)outputPixelBufferForDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_outputPixelBuffers, a2, (uint64_t)a3);
}

- (NSArray)inferenceInputDescriptors
{
  return self->_inferenceInputDescriptors;
}

- (NSArray)inferenceOutputDescriptors
{
  return self->_inferenceOutputDescriptors;
}

- (NSArray)processedOutputDescriptors
{
  return self->_processedOutputDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedOutputDescriptors, 0);
  objc_storeStrong((id *)&self->_inferenceOutputDescriptors, 0);
  objc_storeStrong((id *)&self->_inferenceInputDescriptors, 0);
  objc_storeStrong((id *)&self->_outputPixelBuffers, 0);
  objc_storeStrong((id *)&self->_outputTensorData, 0);
  objc_storeStrong((id *)&self->_inputPixelBuffers, 0);
  objc_storeStrong((id *)&self->_inputTensorData, 0);
}

- (NSArray)inferenceInputTensorDescriptors
{
  id v3 = objc_msgSend_inferenceInputDescriptors(self, a2, v2);
  v5 = objc_msgSend_predicateWithBlock_(MEMORY[0x263F08A98], v4, (uint64_t)&unk_26FB41168);
  id v7 = objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);

  return (NSArray *)v7;
}

- (NSArray)inferenceInputPixelBufferDescriptors
{
  id v3 = objc_msgSend_inferenceInputDescriptors(self, a2, v2);
  v5 = objc_msgSend_predicateWithBlock_(MEMORY[0x263F08A98], v4, (uint64_t)&unk_26FB411A8);
  id v7 = objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);

  return (NSArray *)v7;
}

- (NSArray)inferenceOutputTensorDescriptors
{
  id v3 = objc_msgSend_inferenceOutputDescriptors(self, a2, v2);
  v5 = objc_msgSend_predicateWithBlock_(MEMORY[0x263F08A98], v4, (uint64_t)&unk_26FB411C8);
  id v7 = objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);

  return (NSArray *)v7;
}

- (NSArray)inferenceOutputPixelBufferDescriptors
{
  id v3 = objc_msgSend_inferenceOutputDescriptors(self, a2, v2);
  v5 = objc_msgSend_predicateWithBlock_(MEMORY[0x263F08A98], v4, (uint64_t)&unk_26FB411E8);
  id v7 = objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);

  return (NSArray *)v7;
}

- (NSArray)processedOutputTensorDescriptors
{
  id v3 = objc_msgSend_processedOutputDescriptors(self, a2, v2);
  v5 = objc_msgSend_predicateWithBlock_(MEMORY[0x263F08A98], v4, (uint64_t)&unk_26FB41208);
  id v7 = objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);

  return (NSArray *)v7;
}

- (NSArray)processedOutputPixelBufferDescriptors
{
  id v3 = objc_msgSend_processedOutputDescriptors(self, a2, v2);
  v5 = objc_msgSend_predicateWithBlock_(MEMORY[0x263F08A98], v4, (uint64_t)&unk_26FB41228);
  id v7 = objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);

  return (NSArray *)v7;
}

@end