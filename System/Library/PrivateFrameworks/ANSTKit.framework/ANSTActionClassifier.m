@interface ANSTActionClassifier
- (ANSTActionClassifier)initWithConfig:(id)a3 error:(id *)a4;
- (ANSTActionClassifier)initWithConfiguration:(id)a3;
- (ANSTActionClassifierConfiguration)configuration;
- (ANSTActionClassifierDelegate)delegate;
- (BOOL)bindAudioInput:(id)a3 error:(id *)a4;
- (BOOL)bindVideoInput:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)commitInputBindingWithError:(id *)a3;
- (BOOL)digestFrame:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)executeInferenceWithError:(id *)a3;
- (NSArray)listOfSupportedActions;
- (id)_initWithConfig:(id)a3 error:(id *)a4;
- (id)getCurrentActionPredictions;
- (int64_t)windowSize;
- (void)dealloc;
- (void)resetInferenceState;
- (void)resetInputBinding;
- (void)setDelegate:(id)a3;
- (void)videoFeatureExtractor:(id)a3 didUpdateVideoFeature:(id)a4;
@end

@implementation ANSTActionClassifier

- (int64_t)windowSize
{
  return objc_msgSend_windowSize(self->_featureExtractor, a2, v2);
}

- (ANSTActionClassifier)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_246D9B690(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v14 = (ANSTActionClassifier *)objc_msgSend__initWithConfig_error_(self, v13, (uint64_t)v4, 0);
  return v14;
}

- (ANSTActionClassifier)initWithConfig:(id)a3 error:(id *)a4
{
  id v10 = 0;
  v5 = objc_msgSend__initWithConfig_error_(self, a2, (uint64_t)a3, &v10);
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_246D9B708((uint64_t)v6, v7);
    }

    uint64_t v8 = 0;
    if (a4) {
      *a4 = v6;
    }
  }
  else
  {
    uint64_t v8 = v5;
  }

  return v8;
}

- (id)_initWithConfig:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v51.receiver = self;
  v51.super_class = (Class)ANSTActionClassifier;
  uint64_t v8 = [(ANSTActionClassifier *)&v51 init];
  uint64_t v9 = (uint64_t)v8;
  if (!v8)
  {
LABEL_13:
    id v49 = (id)v9;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v8->_configuration, a3);
  id v10 = objc_alloc(MEMORY[0x263EFF980]);
  v13 = objc_msgSend_initWithCapacity_(v10, v11, 53);
  for (uint64_t i = 0; i != 53; ++i)
  {
    v15 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, i);
    objc_msgSend_addObject_(v13, v16, (uint64_t)v15);
  }
  objc_storeStrong((id *)(v9 + 16), v13);
  v17 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = 0;

  v18 = [ANSTVideoFeatureExtractorConfiguration alloc];
  v20 = objc_msgSend_initWithVersion_(v18, v19, 0x10000);
  v21 = [ANSTVideoFeatureExtractor alloc];
  uint64_t v23 = objc_msgSend_initWithConfig_error_(v21, v22, (uint64_t)v20, a4);
  v24 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v23;

  v26 = *(void **)(v9 + 32);
  if (v26)
  {
    objc_msgSend_setDelegate_(v26, v25, v9);
    *(void *)(v9 + 56) = malloc_type_malloc(0xD4uLL, 0x100004052888210uLL);
    *(void *)(v9 + 64) = malloc_type_malloc(0xD4uLL, 0x100004052888210uLL);
    long long v52 = xmmword_246D9F060;
    v27 = [ANSTTensorDescriptor alloc];
    v30 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v27, v28, @"decodingMatrix", 102, 2, &v52, 1, a4);
    if (v30)
    {
      v31 = objc_msgSend_fileURLWithPath_(NSURL, v29, @"/AppleInternal/Library/Application Support/com.apple.ANSTKit/action_decoding_matrix.bin");
      uint64_t v33 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x263EFF8F8], v32, (uint64_t)v31, 1, a4);
      v34 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v33;

      if (*(void *)(v9 + 40))
      {
        v35 = [ANSTTensorData alloc];
        uint64_t v38 = objc_msgSend_bytes(*(void **)(v9 + 40), v36, v37);
        uint64_t v41 = objc_msgSend_sizeInBytes(v30, v39, v40);
        uint64_t v43 = objc_msgSend_initWithDescriptor_dataPointer_length_deallocator_error_(v35, v42, (uint64_t)v30, v38, v41, 0, a4);
        v44 = *(void **)(v9 + 48);
        *(void *)(v9 + 48) = v43;

        int v45 = 0;
      }
      else
      {
        id v48 = (id)v9;
        int v45 = 1;
      }
    }
    else
    {
      id v47 = (id)v9;
      int v45 = 1;
    }

    if (!v45) {
      goto LABEL_13;
    }
  }
  else
  {
    id v46 = (id)v9;
  }
LABEL_14:

  return (id)v9;
}

- (void)dealloc
{
  rawScores = self->_rawScores;
  if (rawScores) {
    free(rawScores);
  }
  probabilities = self->_probabilities;
  if (probabilities) {
    free(probabilities);
  }
  v5.receiver = self;
  v5.super_class = (Class)ANSTActionClassifier;
  [(ANSTActionClassifier *)&v5 dealloc];
}

- (BOOL)digestFrame:(__CVBuffer *)a3 error:(id *)a4
{
  return MEMORY[0x270F9A6D0](self->_featureExtractor, sel_digestFrame_error_, a3);
}

- (id)getCurrentActionPredictions
{
  return self->_currentPredictions;
}

- (NSArray)listOfSupportedActions
{
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  objc_super v5 = objc_msgSend_initWithCapacity_(v2, v3, 53);
  for (uint64_t i = 1; i != 54; ++i)
  {
    id v7 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v4, i);
    objc_msgSend_addObject_(v5, v8, (uint64_t)v7);
  }
  return (NSArray *)v5;
}

- (void)videoFeatureExtractor:(id)a3 didUpdateVideoFeature:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v8 = objc_msgSend_initWithCapacity_(v6, v7, 53);
  decodingMatrix = self->_decodingMatrix;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_246D74588;
  v19[3] = &unk_265203108;
  id v20 = v5;
  v21 = self;
  id v10 = v8;
  v22 = v10;
  id v11 = v5;
  objc_msgSend_performDataAccessWithOptions_usingBlock_error_(decodingMatrix, v12, 0, v19, 0);
  currentPredictions = self->_currentPredictions;
  self->_currentPredictions = v10;
  v14 = v10;

  v17 = objc_msgSend_delegate(self, v15, v16);
  objc_msgSend_actionClassifier_didUpdateActionPredictions_(v17, v18, (uint64_t)self, v14);
}

- (BOOL)bindVideoInput:(__CVBuffer *)a3 error:(id *)a4
{
  return objc_msgSend_bindVideoInput_error_(self->_featureExtractor, a2, (uint64_t)a3, a4);
}

- (BOOL)bindAudioInput:(id)a3 error:(id *)a4
{
  return MEMORY[0x270F9A6D0](self->_featureExtractor, sel_bindAudioInput_error_, a3);
}

- (BOOL)executeInferenceWithError:(id *)a3
{
  return objc_msgSend_executeInferenceWithError_(self->_featureExtractor, a2, (uint64_t)a3);
}

- (BOOL)commitInputBindingWithError:(id *)a3
{
  return objc_msgSend_commitInputBindingWithError_(self->_featureExtractor, a2, (uint64_t)a3);
}

- (void)resetInputBinding
{
  objc_msgSend_resetInputBinding(self->_featureExtractor, a2, v2);
}

- (void)resetInferenceState
{
  currentPredictions = self->_currentPredictions;
  self->_currentPredictions = 0;

  featureExtractor = self->_featureExtractor;
  MEMORY[0x270F9A6D0](featureExtractor, sel_resetInferenceState, v4);
}

- (ANSTActionClassifierConfiguration)configuration
{
  return self->_configuration;
}

- (ANSTActionClassifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANSTActionClassifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_decodingMatrix, 0);
  objc_storeStrong((id *)&self->_decodingMatrixData, 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_currentPredictions, 0);
  objc_storeStrong((id *)&self->_supportedActions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end