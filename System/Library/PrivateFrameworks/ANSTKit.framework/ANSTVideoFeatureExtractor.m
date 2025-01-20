@interface ANSTVideoFeatureExtractor
- (ANSTVideoFeatureExtractor)initWithConfig:(id)a3 error:(id *)a4;
- (ANSTVideoFeatureExtractor)initWithConfiguration:(id)a3;
- (ANSTVideoFeatureExtractorConfiguration)configuration;
- (ANSTVideoFeatureExtractorDelegate)delegate;
- (BOOL)bindAudioInput:(id)a3 error:(id *)a4;
- (BOOL)bindVideoInput:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)commitInputBindingWithError:(id *)a3;
- (BOOL)digestFrame:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)executeInferenceWithError:(id *)a3;
- (id)_initWithConfig:(id)a3 error:(id *)a4;
- (id)getCurrentVideoFeatureWithOutError:(id *)a3;
- (int64_t)windowSize;
- (void)dealloc;
- (void)releaseResourceSafely;
- (void)resetInferenceState;
- (void)resetInputBinding;
- (void)setDelegate:(id)a3;
@end

@implementation ANSTVideoFeatureExtractor

- (int64_t)windowSize
{
  return 16;
}

- (ANSTVideoFeatureExtractor)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_246D9BB10(v5);
  }

  v7 = (ANSTVideoFeatureExtractor *)objc_msgSend__initWithConfig_error_(self, v6, (uint64_t)v4, 0);
  return v7;
}

- (ANSTVideoFeatureExtractor)initWithConfig:(id)a3 error:(id *)a4
{
  id v12 = 0;
  v5 = (unsigned char *)objc_msgSend__initWithConfig_error_(self, a2, (uint64_t)a3, &v12);
  id v6 = v12;
  if (v5[105])
  {
    v7 = v5;
  }
  else
  {
    v8 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_246D9BB94((uint64_t)v6, v8);
    }

    objc_msgSend_releaseResourceSafely(v5, v9, v10);
    v7 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  return v7;
}

- (id)_initWithConfig:(id)a3 error:(id *)a4
{
  v71[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v67.receiver = self;
  v67.super_class = (Class)ANSTVideoFeatureExtractor;
  v8 = [(ANSTVideoFeatureExtractor *)&v67 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    uint64_t v10 = [ANSTVideoFoundationModelConfiguration alloc];
    id v12 = objc_msgSend_initWithVersion_(v10, v11, 0x10000);
    v13 = [ANSTVideoFoundationModel alloc];
    uint64_t v15 = objc_msgSend_initWithConfiguration_(v13, v14, (uint64_t)v12);
    model = v9->_model;
    v9->_model = (ANSTVideoFoundationModel *)v15;

    if (!objc_msgSend_prepareWithError_(v9->_model, v17, (uint64_t)a4)) {
      goto LABEL_13;
    }
    v20 = objc_msgSend_outputFeatureDescriptor(v9->_model, v18, v19);
    size_t v23 = objc_msgSend_sizeInBytes(v20, v21, v22);

    uint64_t v26 = objc_msgSend_windowSize(v9, v24, v25);
    v9->_windowBuffer = (float **)malloc_type_malloc(8 * v26, 0x80040B8603338uLL);
    if (objc_msgSend_windowSize(v9, v27, v28) >= 1)
    {
      uint64_t v29 = 0;
      do
        v9->_windowBuffer[v29++] = (float *)malloc_type_calloc(1uLL, v23, 0xAB6E4948uLL);
      while (objc_msgSend_windowSize(v9, v30, v31) > v29);
    }
    v9->_currentIndex = 0;
    v9->_windowSum = (float *)malloc_type_calloc(1uLL, v23, 0x7B97DDB0uLL);
    v9->_normalizedMeanFeature = (float *)malloc_type_calloc(1uLL, v23, 0x34A3D00EuLL);
    v32 = [ANSTTensorData alloc];
    v35 = objc_msgSend_outputFeatureDescriptor(v9->_model, v33, v34);
    uint64_t v37 = objc_msgSend_initWithDescriptor_dataPointer_length_deallocator_error_(v32, v36, (uint64_t)v35, v9->_normalizedMeanFeature, v23, 0, a4);
    currentVideoFeatureData = v9->_currentVideoFeatureData;
    v9->_currentVideoFeatureData = (ANSTTensorData *)v37;

    if (!v9->_currentVideoFeatureData) {
      goto LABEL_13;
    }
    v9->_inputBindingCommitted = 0;
    uint64_t v41 = objc_msgSend_set(MEMORY[0x263EFF9C0], v39, v40);
    modalityStatus = v9->_modalityStatus;
    v9->_modalityStatus = (NSMutableSet *)v41;

    p_pixelTransferSession = (VTSessionRef *)&v9->_pixelTransferSession;
    if (VTPixelTransferSessionCreate(0, &v9->_pixelTransferSession)
      || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1EA08], (CFTypeRef)*MEMORY[0x263F1EC78])|| VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1EA00], (CFTypeRef)*MEMORY[0x263EFFB40]))
    {
      if (a4)
      {
        v46 = (void *)MEMORY[0x263F087E8];
        uint64_t v70 = *MEMORY[0x263F07F80];
        v71[0] = @"Failed to prepare VTPixelTransferSession.";
        objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v44, (uint64_t)v71, &v70, 1);
        v47 = LABEL_12:;
        objc_msgSend_errorWithDomain_code_userInfo_(v46, v48, @"ANSTErrorDomain", 3, v47);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v50 = objc_msgSend_inputImageDescriptor(v9->_model, v44, v45);
      uint64_t v53 = objc_msgSend_pixelFormatType(v50, v51, v52);
      v56 = objc_msgSend_inputImageDescriptor(v9->_model, v54, v55);
      v59 = (const char *)objc_msgSend_width(v56, v57, v58);
      v62 = objc_msgSend_inputImageDescriptor(v9->_model, v60, v61);
      size_t v65 = objc_msgSend_height(v62, v63, v64);
      LODWORD(v53) = sub_246D764C8(v53, v59, v65, &v9->_preprocessedInputImage);

      if (!v53)
      {
        v9->_rawInputImage = 0;
        *(_WORD *)&v9->_needsPreprocessing = 257;
        goto LABEL_13;
      }
      if (a4)
      {
        v46 = (void *)MEMORY[0x263F087E8];
        uint64_t v68 = *MEMORY[0x263F07F80];
        v69 = @"Failed to allocate intermediate pixel buffer for preprocessing.";
        objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v66, (uint64_t)&v69, &v68, 1);
        goto LABEL_12;
      }
    }
LABEL_13:
  }
  return v9;
}

- (void)releaseResourceSafely
{
  objc_msgSend_resetInputBinding(self, a2, v2);
  if (self->_windowBuffer)
  {
    if (objc_msgSend_windowSize(self, v4, v5) >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        v9 = self->_windowBuffer[v8];
        if (v9) {
          free(v9);
        }
        ++v8;
      }
      while (objc_msgSend_windowSize(self, v6, v7) > v8);
    }
    free(self->_windowBuffer);
    self->_windowBuffer = 0;
  }
  windowSum = self->_windowSum;
  if (windowSum)
  {
    free(windowSum);
    self->_windowSum = 0;
  }
  normalizedMeanFeature = self->_normalizedMeanFeature;
  if (normalizedMeanFeature)
  {
    free(normalizedMeanFeature);
    self->_normalizedMeanFeature = 0;
  }
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(self->_pixelTransferSession);
    CFRelease(pixelTransferSession);
  }
  self->_pixelTransferSession = 0;
  CVPixelBufferRelease(self->_rawInputImage);
  self->_rawInputImage = 0;
  CVPixelBufferRelease(self->_preprocessedInputImage);
  self->_preprocessedInputImage = 0;
}

- (void)dealloc
{
  objc_msgSend_releaseResourceSafely(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoFeatureExtractor;
  [(ANSTVideoFeatureExtractor *)&v4 dealloc];
}

- (BOOL)digestFrame:(__CVBuffer *)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  if (!self->_initSucceeded)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F07F80];
      v15[0] = @"Initialization was not successful. Please check error log.";
      id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v15, &v14, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, @"ANSTErrorDomain", 3, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  objc_msgSend_resetInputBinding(self, a2, (uint64_t)a3);
  if (!objc_msgSend_bindVideoInput_error_(self, v7, (uint64_t)a3, a4)
    || !objc_msgSend_commitInputBindingWithError_(self, v8, (uint64_t)a4))
  {
    return 0;
  }
  return objc_msgSend_executeInferenceWithError_(self, v9, (uint64_t)a4);
}

- (BOOL)bindVideoInput:(__CVBuffer *)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  if (!self->_initSucceeded)
  {
    if (a4)
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F07F80];
      v25[0] = @"Initialization was not successful. Please check error log.";
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v25, &v24, 1);
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v9) = 0;
    return v9;
  }
  if (self->_inputBindingCommitted)
  {
    if (a4)
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08320];
      size_t v23 = @"Input binding ready comitted. In order to binding new input, please run -[ANSTVideoFeatureExtractor resetInputBinding] first.";
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)&v23, &v22, 1);
      uint64_t v7 = LABEL_7:;
      objc_msgSend_errorWithDomain_code_userInfo_(v6, v8, @"ANSTErrorDomain", 3, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v10 = a3;
  p_rawInputImage = &self->_rawInputImage;
  rawInputImage = self->_rawInputImage;
  if (rawInputImage != a3)
  {
    CVPixelBufferRelease(rawInputImage);
    *p_rawInputImage = v10;
    CVPixelBufferRetain(v10);
    uint64_t v10 = *p_rawInputImage;
  }
  size_t Width = CVPixelBufferGetWidth(v10);
  p_preprocessedInputImage = &self->_preprocessedInputImage;
  if (Width == CVPixelBufferGetWidth(self->_preprocessedInputImage)
    && (size_t Height = CVPixelBufferGetHeight(*p_rawInputImage), Height == CVPixelBufferGetHeight(*p_preprocessedInputImage))
    && (OSType PixelFormatType = CVPixelBufferGetPixelFormatType(*p_rawInputImage),
        PixelFormatType == CVPixelBufferGetPixelFormatType(*p_preprocessedInputImage)))
  {
    BOOL v18 = 0;
    p_preprocessedInputImage = &self->_rawInputImage;
  }
  else
  {
    BOOL v18 = 1;
  }
  CVPixelBufferRef v19 = *p_preprocessedInputImage;
  self->_needsPreprocessing = v18;
  int v9 = objc_msgSend_bindInputFrameBuffer_error_(self->_model, v15, (uint64_t)v19, a4);
  if (v9)
  {
    objc_msgSend_addObject_(self->_modalityStatus, v20, @"Video");
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)bindAudioInput:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (self->_initSucceeded)
  {
    if (a4)
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F08320];
      v13 = @"Audio input is not supported yet.";
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)&v13, &v12, 1);
      int v9 = LABEL_6:;
      objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, @"ANSTErrorDomain", 3, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a4)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F07F80];
    v15[0] = @"Initialization was not successful. Please check error log.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v15, &v14, 1);
    goto LABEL_6;
  }

  return 0;
}

- (BOOL)executeInferenceWithError:(id *)a3
{
  normalizedMeanFeature = a3;
  v48[1] = *MEMORY[0x263EF8340];
  if (!self->_initSucceeded)
  {
    if (!a3) {
      return (char)normalizedMeanFeature;
    }
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v47 = *MEMORY[0x263F07F80];
    v48[0] = @"Initialization was not successful. Please check error log.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v48, &v47, 1);
    uint64_t v8 = LABEL_19:;
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v27, @"ANSTErrorDomain", 3, v8);
    goto LABEL_20;
  }
  if (!self->_inputBindingCommitted)
  {
    if (!a3) {
      return (char)normalizedMeanFeature;
    }
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = *MEMORY[0x263F08320];
    v46 = @"Input binding not committed yet. Please run -[ANSTVideoFeatureExtractor commitInputBinding] first.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)&v46, &v45, 1);
    goto LABEL_19;
  }
  if (!self->_needsPreprocessing
    || !VTPixelTransferSessionTransferImage(self->_pixelTransferSession, self->_rawInputImage, self->_preprocessedInputImage))
  {
    if (!objc_msgSend_executeInferenceWithError_(self->_model, a2, (uint64_t)normalizedMeanFeature))
    {
LABEL_21:
      LOBYTE(normalizedMeanFeature) = 0;
      return (char)normalizedMeanFeature;
    }
    v13 = (__IOSurface *)objc_msgSend_outputFeatureSurfaceRef(self->_model, v11, v12);
    IOSurfaceLock(v13, 1u, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v13);
    uint64_t v15 = self->_windowBuffer[self->_currentIndex];
    cblas_saxpy_NEWLAPACK();
    if (self->_windowFilled) {
      cblas_saxpy_NEWLAPACK();
    }
    BOOL v18 = objc_msgSend_outputFeatureDescriptor(self->_model, v16, v17);
    size_t v21 = objc_msgSend_sizeInBytes(v18, v19, v20);
    memcpy(v15, BaseAddress, v21);

    IOSurfaceUnlock(v13, 1u, 0);
    uint64_t currentIndex = self->_currentIndex;
    self->_uint64_t currentIndex = currentIndex + 1;
    if (objc_msgSend_windowSize(self, v23, v24) <= currentIndex + 1)
    {
      self->_uint64_t currentIndex = 0;
      self->_windowFilled = 1;
    }
    else if (!self->_windowFilled)
    {
      goto LABEL_26;
    }
    uint64_t v29 = objc_msgSend_delegate(self, v25, v26);

    if (v29)
    {
      windowSum = self->_windowSum;
      normalizedMeanFeature = self->_normalizedMeanFeature;
      v33 = objc_msgSend_outputFeatureDescriptor(self->_model, v30, v31);
      size_t v36 = objc_msgSend_sizeInBytes(v33, v34, v35);
      memcpy(normalizedMeanFeature, windowSum, v36);

      objc_msgSend_windowSize(self, v37, v38);
      LOBYTE(normalizedMeanFeature) = 1;
      cblas_sscal_NEWLAPACK();
      cblas_snrm2_NEWLAPACK();
      cblas_sscal_NEWLAPACK();
      uint64_t v41 = objc_msgSend_delegate(self, v39, v40);
      objc_msgSend_videoFeatureExtractor_didUpdateVideoFeature_(v41, v42, (uint64_t)self, self->_currentVideoFeatureData);

      return (char)normalizedMeanFeature;
    }
LABEL_26:
    LOBYTE(normalizedMeanFeature) = 1;
    return (char)normalizedMeanFeature;
  }
  uint64_t v5 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_246D9BC20(v5);
  }

  if (normalizedMeanFeature)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    v44 = @"Failed to preprocess input pixel buffer.";
    uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)&v44, &v43, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v7, v9, @"ANSTErrorDomain", 4, v8);
LABEL_20:
    void *normalizedMeanFeature = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  return (char)normalizedMeanFeature;
}

- (BOOL)commitInputBindingWithError:(id *)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  if (self->_initSucceeded)
  {
    if (objc_msgSend_count(self->_modalityStatus, a2, (uint64_t)a3))
    {
      BOOL result = 1;
      self->_inputBindingCommitted = 1;
      return result;
    }
    if (a3)
    {
      id v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F08320];
      v11 = @"Commit failure since no input is binded yet. Please run -[ANSTVideoFeatureExtractor bindVideoInput:error:] or -[ANSTVideoFeatureExtractor bindAudioInput:error:] first.";
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)&v11, &v10, 1);
      goto LABEL_8;
    }
  }
  else if (a3)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F07F80];
    v13[0] = @"Initialization was not successful. Please check error log.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v13, &v12, 1);
    uint64_t v8 = LABEL_8:;
    objc_msgSend_errorWithDomain_code_userInfo_(v7, v9, @"ANSTErrorDomain", 3, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)resetInputBinding
{
  if (self->_initSucceeded)
  {
    objc_msgSend_removeAllObjects(self->_modalityStatus, a2, v2);
    self->_inputBindingCommitted = 0;
    CVPixelBufferRelease(self->_rawInputImage);
    self->_rawInputImage = 0;
    self->_needsPreprocessing = 1;
  }
}

- (void)resetInferenceState
{
  if (self->_initSucceeded)
  {
    windowSum = self->_windowSum;
    uint64_t v5 = objc_msgSend_outputFeatureDescriptor(self->_model, a2, v2);
    size_t v8 = objc_msgSend_sizeInBytes(v5, v6, v7);
    bzero(windowSum, v8);

    self->_windowFilled = 0;
    self->_uint64_t currentIndex = 0;
  }
}

- (id)getCurrentVideoFeatureWithOutError:(id *)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  if (self->_initSucceeded)
  {
    if (self->_windowFilled)
    {
      v3 = self->_currentVideoFeatureData;
      goto LABEL_7;
    }
  }
  else if (a3)
  {
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F07F80];
    v10[0] = @"Initialization was not successful. Please check error log.";
    id v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v10, &v9, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v5, v7, @"ANSTErrorDomain", 3, v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = 0;
LABEL_7:
  return v3;
}

- (ANSTVideoFeatureExtractorConfiguration)configuration
{
  return self->_configuration;
}

- (ANSTVideoFeatureExtractorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANSTVideoFeatureExtractorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modalityStatus, 0);
  objc_storeStrong((id *)&self->_currentVideoFeatureData, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end