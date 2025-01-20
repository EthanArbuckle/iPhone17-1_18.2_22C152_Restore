@interface ANSTForegroundSegmentation_Internal
+ (BOOL)supportsVersion:(unint64_t)a3;
- (ANSTForegroundSegmentation_Internal)initWithConfiguration:(id)a3;
- (BOOL)prepareWithError:(id *)a3;
- (__CVBuffer)_createCVPixelBuffer_Float32_fromEspressoBufferFloat32:(id *)a3;
- (id)resultForPixelBuffer:(__CVBuffer *)resizedInputBuffer error:(id *)a4;
- (unint64_t)networkInputBufferHeight;
- (unint64_t)networkInputBufferWidth;
- (unint64_t)version;
- (unsigned)networkInputBufferPixelFormat;
- (unsigned)outputBufferPixelFormat;
- (void)dealloc;
- (void)undoPrepareSideEffects;
@end

@implementation ANSTForegroundSegmentation_Internal

+ (BOOL)supportsVersion:(unint64_t)a3
{
  return a3 == 0x20000;
}

- (ANSTForegroundSegmentation_Internal)initWithConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANSTForegroundSegmentation_Internal;
  v6 = [(ANSTForegroundSegmentation *)&v13 initWithConfiguration:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_readyForInference = 0;
    v8 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend_description(v5, v9, v10);
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_246D53000, v8, OS_LOG_TYPE_DEFAULT, "ANSTForegroundSegmentation (ViSegHQ) initialized with config %{public}@.", buf, 0xCu);
    }
  }

  return v7;
}

- (void)dealloc
{
  if (self->_readyForInference) {
    objc_msgSend_undoPrepareSideEffects(self, a2, v2);
  }
  v4.receiver = self;
  v4.super_class = (Class)ANSTForegroundSegmentation_Internal;
  [(ANSTForegroundSegmentation_Internal *)&v4 dealloc];
}

- (unint64_t)version
{
  return objc_msgSend_version(self->_config, a2, v2);
}

- (void)undoPrepareSideEffects
{
  CVPixelBufferRelease(self->_resizedInputBuffer);
  CVPixelBufferPoolRelease(self->_outputBufferPool);
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSession);
    CFRelease(self->_pixelTransferSession);
  }
  vmtrackerNetworkEspresso = self->_vmtrackerNetworkEspresso;
  self->_vmtrackerNetworkEspresso = 0;

  self->_readyForInference = 0;
}

- (BOOL)prepareWithError:(id *)a3
{
  v114[1] = *MEMORY[0x263EF8340];
  id v5 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v104 = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ANSTForegroundSegmentation_prepareWithError", (const char *)&unk_246DA093E, v104, 2u);
  }

  if (self->_readyForInference)
  {
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v5, self);

    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v104 = 0;
      _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v9, "ANSTForegroundSegmentation_prepareWithError", (const char *)&unk_246DA093E, v104, 2u);
    }
    BOOL v10 = 1;
    goto LABEL_53;
  }
  p_config = (void **)&self->_config;
  if (objc_msgSend_networkEngineType(self->_config, v7, v8))
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_246D97E94(v5, v12, v13, v14, v15, v16, v17, v18);
    }

    if (a3)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v113 = *MEMORY[0x263F08320];
      v114[0] = @"ANSTKit has deprecated non-ANE execution support. Please stop configuring ANSTForegroundSegmentation for executing on non-ANE platforms.";
      v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)v114, &v113, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v21, v23, @"ANSTErrorDomain", 3, v22);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_undoPrepareSideEffects(self, v19, v20);
    os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
      goto LABEL_52;
    }
    *(_WORD *)v104 = 0;
LABEL_51:
    _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v24, "ANSTForegroundSegmentation_prepareWithError", (const char *)&unk_246DA093E, v104, 2u);
LABEL_52:
    BOOL v10 = 0;
    goto LABEL_53;
  }
  v25 = objc_opt_class();
  uint64_t v28 = objc_msgSend_version(*p_config, v26, v27);
  if ((objc_msgSend_supportsVersion_(v25, v29, v28) & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_246D97DF0((void **)&self->_config, (char *)v5, v60);
    }

    if (a3)
    {
      v63 = (void *)MEMORY[0x263F087E8];
      uint64_t v111 = *MEMORY[0x263F08320];
      v112 = @"Unsupported algorithm version";
      v64 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v61, (uint64_t)&v112, &v111, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v63, v65, @"ANSTErrorDomain", 3, v64);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_undoPrepareSideEffects(self, v61, v62);
    os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
      goto LABEL_52;
    }
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  v30 = [ANSTVMTrackerEspresso alloc];
  v32 = (ANSTVMTrackerEspresso *)objc_msgSend_initWithConfiguration_(v30, v31, (uint64_t)*p_config);
  vmtrackerNetworkEspresso = self->_vmtrackerNetworkEspresso;
  self->_vmtrackerNetworkEspresso = v32;

  if (!self->_vmtrackerNetworkEspresso)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_246D97C88(v5, v66, v67, v68, v69, v70, v71, v72);
    }

    v73 = self->_vmtrackerNetworkEspresso;
    self->_vmtrackerNetworkEspresso = 0;

    if (a3)
    {
      v76 = (void *)MEMORY[0x263F087E8];
      uint64_t v109 = *MEMORY[0x263F08320];
      v110 = @"Failed to prepare espresso network.";
      v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v74, (uint64_t)&v110, &v109, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v76, v78, @"ANSTErrorDomain", 3, v77);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_undoPrepareSideEffects(self, v74, v75);
    os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
      goto LABEL_52;
    }
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  uint64_t v36 = objc_msgSend_networkInputBufferPixelFormat(self, v34, v35);
  uint64_t v39 = objc_msgSend_networkInputBufferWidth(self, v37, v38);
  uint64_t v42 = objc_msgSend_networkInputBufferHeight(self, v40, v41);
  PixelBuffer_width_height = (__CVBuffer *)objc_msgSend_createPixelBuffer_width_height_(self, v43, v36, v39, v42);
  self->_resizedInputBuffer = PixelBuffer_width_height;
  if (!PixelBuffer_width_height)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_246D97D00(v5, v79, v80, v81, v82, v83, v84, v85);
    }

    if (a3)
    {
      v88 = (void *)MEMORY[0x263F087E8];
      uint64_t v107 = *MEMORY[0x263F08320];
      v108 = @"Failed to prepare resized input buffer.";
      v89 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v86, (uint64_t)&v108, &v107, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v88, v90, @"ANSTErrorDomain", 3, v89);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_undoPrepareSideEffects(self, v86, v87);
    os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
      goto LABEL_52;
    }
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  p_pixelTransferSession = &self->_pixelTransferSession;
  if (VTPixelTransferSessionCreate(0, &self->_pixelTransferSession)
    || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1EA08], (CFTypeRef)*MEMORY[0x263F1EC78])
    || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1EA00], (CFTypeRef)*MEMORY[0x263EFFB40]))
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_246D97D78(v5, v48, v49, v50, v51, v52, v53, v54);
    }

    if (a3)
    {
      v57 = (void *)MEMORY[0x263F087E8];
      uint64_t v105 = *MEMORY[0x263F08320];
      v106 = @"Failed to prepare VTPixelTransferSession.";
      v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)&v106, &v105, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v57, v59, @"ANSTErrorDomain", 3, v58);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_undoPrepareSideEffects(self, v55, v56);
    os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
      goto LABEL_52;
    }
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  uint64_t v92 = objc_msgSend_outputBufferWidth(self, v46, v47);
  uint64_t v95 = objc_msgSend_outputBufferHeight(self, v93, v94);
  uint64_t v98 = objc_msgSend_outputBufferPixelFormat(self, v96, v97);
  v100 = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPoolCreateWithMinCapacity_width_height_pixelFormat_(self, v99, 2, v92, v95, v98);
  self->_outputBufferPool = v100;
  if (!v100)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v101, @"ANSTErrorDomain", 3, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_undoPrepareSideEffects(self, v101, v102);
    os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
      goto LABEL_52;
    }
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  self->_frameCount = 0;
  BOOL v10 = 1;
  self->_readyForInference = 1;
  os_signpost_id_t v103 = os_signpost_id_make_with_pointer(v5, self);

  if (v103 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v104 = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v103, "ANSTForegroundSegmentation_prepareWithError", (const char *)&unk_246DA093E, v104, 2u);
  }
LABEL_53:

  return v10;
}

- (unint64_t)networkInputBufferWidth
{
  p_config = (void **)&self->_config;
  unint64_t v4 = objc_msgSend_networkResolution(self->_config, a2, v2);
  if (v4 < 4) {
    return qword_246D9ECD8[v4];
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  os_signpost_id_t v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
    sub_246D97F0C(p_config, v6, v7);
  }

  return 512;
}

- (unint64_t)networkInputBufferHeight
{
  p_config = (void **)&self->_config;
  unint64_t v4 = objc_msgSend_networkResolution(self->_config, a2, v2);
  if (v4 < 4) {
    return qword_246D9ECF8[v4];
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  os_signpost_id_t v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
    sub_246D97F94(p_config, v6, v7);
  }

  return 384;
}

- (unsigned)networkInputBufferPixelFormat
{
  return 1111970369;
}

- (unsigned)outputBufferPixelFormat
{
  return 1278226534;
}

- (id)resultForPixelBuffer:(__CVBuffer *)resizedInputBuffer error:(id *)a4
{
  v96[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v86 = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ANSTForegroundSegmentation_resultForPixelBuffer", (const char *)&unk_246DA093E, v86, 2u);
  }

  if (!self->_readyForInference)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_246D9801C(v7, v31, v32, v33, v34, v35, v36, v37);
    }

    if (a4)
    {
      uint64_t v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v95 = *MEMORY[0x263F08320];
      v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v96, &v95, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v39, v41, @"ANSTErrorDomain", 4, v40);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v7, self);

    if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7)) {
      goto LABEL_55;
    }
    *(_WORD *)v86 = 0;
    goto LABEL_54;
  }
  if (!resizedInputBuffer)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_246D98094(v7, v42, v43, v44, v45, v46, v47, v48);
    }

    if (a4)
    {
      uint64_t v50 = (void *)MEMORY[0x263F087E8];
      uint64_t v93 = *MEMORY[0x263F08320];
      uint64_t v94 = @"Nil input buffer.";
      uint64_t v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v49, (uint64_t)&v94, &v93, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v50, v52, @"ANSTErrorDomain", 2, v51);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v7, self);

    if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7)) {
      goto LABEL_55;
    }
    *(_WORD *)v86 = 0;
    goto LABEL_54;
  }
  size_t Width = CVPixelBufferGetWidth(resizedInputBuffer);
  if (Width != objc_msgSend_networkInputBufferWidth(self, v10, v11)
    || (size_t Height = CVPixelBufferGetHeight(resizedInputBuffer),
        Height != objc_msgSend_networkInputBufferHeight(self, v13, v14))
    || (OSType PixelFormatType = CVPixelBufferGetPixelFormatType(resizedInputBuffer),
        PixelFormatType != objc_msgSend_networkInputBufferPixelFormat(self, v16, v17)))
  {
    if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, resizedInputBuffer, self->_resizedInputBuffer))
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_246D981FC(v7, v19, v20, v21, v22, v23, v24, v25);
      }

      if (a4)
      {
        uint64_t v27 = (void *)MEMORY[0x263F087E8];
        uint64_t v91 = *MEMORY[0x263F08320];
        uint64_t v92 = @"Failed to transfer input pixel buffer.";
        uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)&v92, &v91, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v27, v29, @"ANSTErrorDomain", 4, v28);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v7, self);

      if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7)) {
        goto LABEL_55;
      }
      *(_WORD *)v86 = 0;
LABEL_54:
      _os_signpost_emit_with_name_impl(&dword_246D53000, v7, OS_SIGNPOST_INTERVAL_END, v30, "ANSTForegroundSegmentation_resultForPixelBuffer", (const char *)&unk_246DA093E, v86, 2u);
LABEL_55:
      uint64_t v72 = 0;
      goto LABEL_56;
    }
    resizedInputBuffer = self->_resizedInputBuffer;
  }
  unint64_t frameCount = self->_frameCount;
  self->_unint64_t frameCount = frameCount + 1;
  if (!frameCount)
  {
    if ((objc_msgSend_runInitializerModel_(self->_vmtrackerNetworkEspresso, v18, (uint64_t)resizedInputBuffer) & 1) == 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_246D98184(v7, v74, v75, v76, v77, v78, v79, v80);
      }

      if (a4)
      {
        uint64_t v82 = (void *)MEMORY[0x263F087E8];
        uint64_t v89 = *MEMORY[0x263F08320];
        v90 = @"Failed to run initializer network.";
        uint64_t v83 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v81, (uint64_t)&v90, &v89, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v82, v84, @"ANSTErrorDomain", 4, v83);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v7, self);

      if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7)) {
        goto LABEL_55;
      }
      *(_WORD *)v86 = 0;
      goto LABEL_54;
    }
LABEL_43:
    if ((objc_msgSend_runInferenceModel_(self->_vmtrackerNetworkEspresso, v18, (uint64_t)resizedInputBuffer) & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_44;
  }
  if (0xCCCCCCCCCCCCCCCDLL * (frameCount + 1) > 0x3333333333333333) {
    goto LABEL_43;
  }
  if ((objc_msgSend_runUpdateModel_(self->_vmtrackerNetworkEspresso, v18, (uint64_t)resizedInputBuffer) & 1) == 0)
  {
LABEL_35:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_246D9810C(v7, v56, v57, v58, v59, v60, v61, v62);
    }

    if (a4)
    {
      v64 = (void *)MEMORY[0x263F087E8];
      uint64_t v87 = *MEMORY[0x263F08320];
      v88 = @"Failed to run vmtracker network.";
      v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)&v88, &v87, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v64, v66, @"ANSTErrorDomain", 4, v65);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v7, self);

    if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7)) {
      goto LABEL_55;
    }
    *(_WORD *)v86 = 0;
    goto LABEL_54;
  }
LABEL_44:
  uint64_t OutputMaskBuffer = objc_msgSend_getOutputMaskBuffer(self->_vmtrackerNetworkEspresso, v54, v55);
  CVPixelBuffer_Float32_fromEspressoBufferFloat32 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Float32_fromEspressoBufferFloat32_(self, v68, OutputMaskBuffer);
  uint64_t v70 = [ANSTForegroundSegmentationResult alloc];
  uint64_t v72 = objc_msgSend_initWithMask_(v70, v71, (uint64_t)CVPixelBuffer_Float32_fromEspressoBufferFloat32);
  CVPixelBufferRelease(CVPixelBuffer_Float32_fromEspressoBufferFloat32);
  os_signpost_id_t v73 = os_signpost_id_make_with_pointer(v7, self);

  if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v86 = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v7, OS_SIGNPOST_INTERVAL_END, v73, "ANSTForegroundSegmentation_resultForPixelBuffer", (const char *)&unk_246DA093E, v86, 2u);
  }
LABEL_56:

  return v72;
}

- (__CVBuffer)_createCVPixelBuffer_Float32_fromEspressoBufferFloat32:(id *)a3
{
  if (a3->var6 != 1)
  {
    unint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D98374(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    goto LABEL_10;
  }
  if (a3->var14 != 65568)
  {
    unint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D982F4();
    }
    goto LABEL_10;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_outputBufferPool, &pixelBufferOut))
  {
    unint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D98274();
    }
LABEL_10:

    return 0;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  unint64_t var5 = a3->var5;
  unint64_t v14 = 4 * a3->var4;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  var0 = (char *)a3->var0;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  uint64_t v18 = BaseAddress;
  if (v14 == BytesPerRow)
  {
    memcpy(BaseAddress, var0, var5 * v14);
  }
  else if (var5)
  {
    if (v14 >= BytesPerRow) {
      size_t v19 = BytesPerRow;
    }
    else {
      size_t v19 = v14;
    }
    do
    {
      memcpy(v18, var0, v19);
      v18 += BytesPerRow;
      var0 += v14;
      --var5;
    }
    while (var5);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vmtrackerNetworkEspresso, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end