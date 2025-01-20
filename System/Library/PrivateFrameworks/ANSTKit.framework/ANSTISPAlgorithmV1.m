@interface ANSTISPAlgorithmV1
+ (unint64_t)_version;
- (ANSTISPAlgorithmV1)initWithConfiguration:(id)a3;
- (BOOL)prepareWithError:(id *)a3;
- (__CVBuffer)_createCVPixelBuffer_Uint8_fromAcSaliencyHeatMap:(id *)a3;
- (__CVBuffer)_createCVPixelBuffer_Uint8_fromEspressoBufferFloat32:(id *)a3;
- (id)_networkResult;
- (id)resultForPixelBuffer:(__CVBuffer *)resizedInputBuffer orientation:(int64_t)a4 error:(id *)a5;
- (unint64_t)networkInputBufferHeight;
- (unint64_t)networkInputBufferWidth;
- (unsigned)networkInputBufferPixelFormat;
- (void)dealloc;
- (void)undoPrepareSideEffects;
@end

@implementation ANSTISPAlgorithmV1

+ (unint64_t)_version
{
  return 0x10000;
}

- (ANSTISPAlgorithmV1)initWithConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANSTISPAlgorithmV1;
  v6 = [(ANSTISPAlgorithm *)&v13 initWithConfiguration:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_readyForInference = 0;
    v8 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend_description(v7->_config, v9, v10);
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_246D53000, v8, OS_LOG_TYPE_DEFAULT, "ANSTISPAlgorithmV1 (ANST v2.4 model + v2.5 post-processing) initialized with config %{public}@.", buf, 0xCu);
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
  v4.super_class = (Class)ANSTISPAlgorithmV1;
  [(ANSTISPAlgorithmV1 *)&v4 dealloc];
}

- (void)undoPrepareSideEffects
{
  det = self->_det;
  if (det)
  {
    if (AcANSTStop(det))
    {
      objc_super v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_246D9A114();
      }
    }
    if (AcANSTDestroy((uint64_t)self->_det))
    {
      id v5 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_246D9A0A0();
      }
    }
    self->_det = 0;
  }
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSession);
    CFRelease(self->_pixelTransferSession);
    self->_pixelTransferSession = 0;
  }
  CVPixelBufferRelease(self->_resizedInputBuffer);
  self->_resizedInputBuffer = 0;
  CVPixelBufferPoolRelease(self->_outputSemanticBufferPool);
  self->_outputSemanticBufferPool = 0;
  CVPixelBufferPoolRelease(self->_outputSaliencyBufferPool);
  self->_outputSaliencyBufferPool = 0;
  network = self->_network;
  self->_network = 0;

  self->_readyForInference = 0;
}

- (BOOL)prepareWithError:(id *)a3
{
  v152[1] = *MEMORY[0x263EF8340];
  id v5 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ANSTISPAlgorithmV1_prepareWithError", (const char *)&unk_246DA093E, buf, 2u);
  }

  if (!self->_readyForInference)
  {
    char v137 = 0;
    p_det = (uint64_t **)&self->_det;
    uint64_t v10 = AcANSTCreate((uint64_t)&self->_det, (uint64_t)&v137);
    if (v10
      || (uint64_t v10 = AcANSTStart(*p_det, (uint64_t)&self->_detState), v10)
      || (uint64_t v10 = AcANSTGetParams(*p_det, self->_detState.data, (uint64_t)&self->_detParams), v10)
      || (uint64_t v10 = AcANSTUseLowThresholds(*p_det), v10)
      || (uint64_t v10 = AcANSTSetRunSaliency(*p_det, 1), v10)
      || (uint64_t v10 = AcANSTSetRunSaliencyObjectDetection(*p_det, 1), v10)
      || (uint64_t v10 = AcANSTSetRunViSeg(*p_det, 1), v10))
    {
      v12 = objc_msgSend_stringWithFormat_(NSString, v11, @"Failed to setup ANST network config (AcReturn code %d)", v10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_246D9A46C();
      }

      if (a3)
      {
        v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v151 = *MEMORY[0x263F08320];
        v152[0] = v12;
        uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v152, &v151, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v15, v17, @"ANSTErrorDomain", 3, v16);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_undoPrepareSideEffects(self, v13, v14);
      os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v5, self);

      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v18, "ANSTISPAlgorithmV1_prepareWithError", (const char *)&unk_246DA093E, buf, 2u);
      }

      BOOL v8 = 0;
      goto LABEL_24;
    }
    objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v11, 25);
    v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    networkOutputNames = self->_networkOutputNames;
    self->_networkOutputNames = v20;

    for (uint64_t i = 0; i != 25; ++i)
    {
      v24 = self->_networkOutputNames;
      v25 = objc_msgSend_stringWithUTF8String_(NSString, v22, (uint64_t)self->_detParams.netOutputNames[i]);
      objc_msgSend_addObject_(v24, v26, (uint64_t)v25);
    }
    if (objc_msgSend_networkEngineType(self->_config, v22, v27))
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_246D9A3F4(v5, v28, v29, v30, v31, v32, v33, v34);
      }

      if (a3)
      {
        v37 = (void *)MEMORY[0x263F087E8];
        uint64_t v149 = *MEMORY[0x263F08320];
        v150 = @"ANSTKit has deprecated non-ANE execution support. Please stop configuring ANSTISPAlgorithm for executing on non-ANE platforms.";
        v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)&v150, &v149, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v37, v39, @"ANSTErrorDomain", 3, v38);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_undoPrepareSideEffects(self, v35, v36);
      os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v5, self);

      if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
        goto LABEL_68;
      }
      *(_WORD *)buf = 0;
      v41 = "ANSTISPAlgorithm_prepareWithError";
    }
    else
    {
      v42 = [ANSTBaseNetworkEspresso alloc];
      uint64_t v45 = objc_msgSend_networkEngineType(self->_config, v43, v44);
      uint64_t v48 = objc_msgSend_qualityOfService(self->_config, v46, v47);
      if (objc_msgSend_networkResolution(self->_config, v49, v50) == 1) {
        v52 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkResolution_(v42, v51, v45, v48, @"anst", @"resolution1024x576");
      }
      else {
        v52 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkResolution_(v42, v51, v45, v48, @"anst", @"resolution512x384");
      }
      network = self->_network;
      self->_network = v52;

      if (objc_msgSend_prepare(self->_network, v54, v55))
      {
        v58 = self->_network;
        uint64_t v59 = objc_msgSend_UTF8String((void *)kANSTNetworkInputName, v56, v57);
        objc_msgSend_getResolutionByBlobName_(v58, v60, v59);
        uint64_t v62 = v61;
        v63 = self->_network;
        uint64_t v66 = objc_msgSend_UTF8String((void *)kANSTNetworkInputName, v64, v65);
        objc_msgSend_getResolutionByBlobName_(v63, v67, v66);
        uint64_t v69 = v68;
        if (objc_msgSend_networkInputBufferWidth(self, v70, v71) == v62
          && objc_msgSend_networkInputBufferHeight(self, v72, v73) == v69)
        {
          uint64_t v76 = objc_msgSend_networkInputBufferPixelFormat(self, v74, v75);
          PixelBuffer_width_height = (__CVBuffer *)objc_msgSend_createPixelBuffer_width_height_(self, v77, v76, v62, v69);
          self->_resizedInputBuffer = PixelBuffer_width_height;
          if (PixelBuffer_width_height)
          {
            p_pixelTransferSession = &self->_pixelTransferSession;
            if (VTPixelTransferSessionCreate(0, &self->_pixelTransferSession)
              || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1EA08], (CFTypeRef)*MEMORY[0x263F1EC78])|| VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1EA00], (CFTypeRef)*MEMORY[0x263EFFB40]))
            {
              if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
                sub_246D9A278(v5, v81, v82, v83, v84, v85, v86, v87);
              }

              if (a3)
              {
                v90 = (void *)MEMORY[0x263F087E8];
                uint64_t v141 = *MEMORY[0x263F08320];
                v142 = @"Failed to prepare VTPixelTransferSession.";
                v91 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v88, (uint64_t)&v142, &v141, 1);
                objc_msgSend_errorWithDomain_code_userInfo_(v90, v92, @"ANSTErrorDomain", 3, v91);
                *a3 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend_undoPrepareSideEffects(self, v88, v89);
              os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v5, self);

              if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
                goto LABEL_68;
              }
              *(_WORD *)buf = 0;
              v41 = "ANSTISPAlgorithmV1_prepareWithError";
            }
            else
            {
              self->_outputSemanticBufferPool = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPoolCreateWithMinCapacity_width_height_pixelFormat_(self, v80, 5, v62 >> 1, v69 >> 1, 1278226488);
              v123 = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPoolCreateWithMinCapacity_width_height_pixelFormat_(self, v122, 1, 64, 48, 1278226488);
              self->_outputSaliencyBufferPool = v123;
              if (self->_outputSemanticBufferPool && v123)
              {
                BOOL v8 = 1;
                self->_readyForInference = 1;
                os_signpost_id_t v124 = os_signpost_id_make_with_pointer(v5, self);

                if (v124 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v124, "ANSTISPAlgorithmV1_prepareWithError", (const char *)&unk_246DA093E, buf, 2u);
                }
                goto LABEL_69;
              }
              if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
                sub_246D9A200(v5, v125, v126, v127, v128, v129, v130, v131);
              }

              if (a3)
              {
                v134 = (void *)MEMORY[0x263F087E8];
                uint64_t v139 = *MEMORY[0x263F08320];
                v140 = @"Failed to prepare output pixel buffer pool.";
                v135 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v132, (uint64_t)&v140, &v139, 1);
                objc_msgSend_errorWithDomain_code_userInfo_(v134, v136, @"ANSTErrorDomain", 3, v135);
                *a3 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend_undoPrepareSideEffects(self, v132, v133);
              os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v5, self);

              if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
              {
LABEL_68:
                BOOL v8 = 0;
LABEL_69:
                v12 = v5;
LABEL_24:

                return v8;
              }
              *(_WORD *)buf = 0;
              v41 = "ANSTISPAlgorithmV1_prepareWithError";
            }
          }
          else
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
              sub_246D9A188(v5, v110, v111, v112, v113, v114, v115, v116);
            }

            if (a3)
            {
              v119 = (void *)MEMORY[0x263F087E8];
              uint64_t v143 = *MEMORY[0x263F08320];
              v144 = @"Failed to prepare resized input buffer.";
              v120 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v117, (uint64_t)&v144, &v143, 1);
              objc_msgSend_errorWithDomain_code_userInfo_(v119, v121, @"ANSTErrorDomain", 3, v120);
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend_undoPrepareSideEffects(self, v117, v118);
            os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v5, self);

            if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
              goto LABEL_68;
            }
            *(_WORD *)buf = 0;
            v41 = "ANSTISPAlgorithmV1_prepareWithError";
          }
        }
        else
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
            sub_246D9A2F0();
          }

          if (a3)
          {
            v107 = (void *)MEMORY[0x263F087E8];
            uint64_t v145 = *MEMORY[0x263F08320];
            v146 = @"Prepared espresso network returned unexpected input width or height.";
            v108 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v105, (uint64_t)&v146, &v145, 1);
            objc_msgSend_errorWithDomain_code_userInfo_(v107, v109, @"ANSTErrorDomain", 3, v108);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_undoPrepareSideEffects(self, v105, v106);
          os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v5, self);

          if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
            goto LABEL_68;
          }
          *(_WORD *)buf = 0;
          v41 = "ANSTISPAlgorithmV1_prepareWithError";
        }
      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_246D9A37C(v5, v93, v94, v95, v96, v97, v98, v99);
        }

        if (a3)
        {
          v102 = (void *)MEMORY[0x263F087E8];
          uint64_t v147 = *MEMORY[0x263F08320];
          v148 = @"Failed to prepare espresso network.";
          v103 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v100, (uint64_t)&v148, &v147, 1);
          objc_msgSend_errorWithDomain_code_userInfo_(v102, v104, @"ANSTErrorDomain", 3, v103);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_undoPrepareSideEffects(self, v100, v101);
        os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v5, self);

        if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
          goto LABEL_68;
        }
        *(_WORD *)buf = 0;
        v41 = "ANSTISPAlgorithmV1_prepareWithError";
      }
    }
    _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v40, v41, (const char *)&unk_246DA093E, buf, 2u);
    goto LABEL_68;
  }
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v5, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v7, "ANSTISPAlgorithmV1_prepareWithError", (const char *)&unk_246DA093E, buf, 2u);
  }

  return 1;
}

- (id)resultForPixelBuffer:(__CVBuffer *)resizedInputBuffer orientation:(int64_t)a4 error:(id *)a5
{
  v115[1] = *MEMORY[0x263EF8340];
  v9 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v103 = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ANSTISPAlgorithmV1_resultForPixelBuffer", (const char *)&unk_246DA093E, v103, 2u);
  }

  if (!self->_readyForInference)
  {
    if (a5)
    {
      uint64_t v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v114 = *MEMORY[0x263F08320];
      uint64_t v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v115, &v114, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v29, v31, @"ANSTErrorDomain", 4, v30);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v9, self);

    if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_55;
    }
    *(_WORD *)v103 = 0;
    goto LABEL_54;
  }
  if (!resizedInputBuffer)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D9A4F4(v9, v32, v33, v34, v35, v36, v37, v38);
    }

    if (a5)
    {
      os_signpost_id_t v40 = (void *)MEMORY[0x263F087E8];
      uint64_t v112 = *MEMORY[0x263F08320];
      uint64_t v113 = @"Nil input buffer.";
      v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v39, (uint64_t)&v113, &v112, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v40, v42, @"ANSTErrorDomain", 2, v41);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v9, self);

    if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_55;
    }
    *(_WORD *)v103 = 0;
    goto LABEL_54;
  }
  size_t Width = CVPixelBufferGetWidth(resizedInputBuffer);
  size_t Height = CVPixelBufferGetHeight(resizedInputBuffer);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(resizedInputBuffer);
  if (Width < Height)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D9A56C(v9, v17, v18, v19, v20, v21, v22, v23);
    }

    if (a5)
    {
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v110 = *MEMORY[0x263F08320];
      uint64_t v111 = @"Input pixel buffer width < height. ANSTISPAlgorithmV1 only supports landscape input.";
      v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)&v111, &v110, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v25, v27, @"ANSTErrorDomain", 2, v26);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v9, self);

    if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_55;
    }
    *(_WORD *)v103 = 0;
LABEL_54:
    _os_signpost_emit_with_name_impl(&dword_246D53000, v9, OS_SIGNPOST_INTERVAL_END, v28, "ANSTISPAlgorithmV1_resultForPixelBuffer", (const char *)&unk_246DA093E, v103, 2u);
LABEL_55:
    uint64_t v94 = 0;
    goto LABEL_56;
  }
  OSType v43 = PixelFormatType;
  if (Width != objc_msgSend_networkInputBufferWidth(self, v15, v16)
    || Height != objc_msgSend_networkInputBufferHeight(self, v44, v45)
    || v43 != objc_msgSend_networkInputBufferPixelFormat(self, v46, v47))
  {
    if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, resizedInputBuffer, self->_resizedInputBuffer))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_246D9A5E4(v9, v50, v51, v52, v53, v54, v55, v56);
      }

      if (a5)
      {
        v58 = (void *)MEMORY[0x263F087E8];
        uint64_t v108 = *MEMORY[0x263F08320];
        v109 = @"Failed to transfer input pixel buffer.";
        uint64_t v59 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v57, (uint64_t)&v109, &v108, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v58, v60, @"ANSTErrorDomain", 4, v59);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v9, self);

      if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
        goto LABEL_55;
      }
      *(_WORD *)v103 = 0;
      goto LABEL_54;
    }
    resizedInputBuffer = self->_resizedInputBuffer;
  }
  self->_detControl.originalImagesize_t Width = Width;
  self->_detControl.originalImagesize_t Height = Height;
  network = self->_network;
  uint64_t v62 = objc_msgSend_UTF8String((void *)kANSTNetworkInputName, v48, v49);
  objc_msgSend_getResolutionByBlobName_(network, v63, v62);
  self->_detControl.networkInputsize_t Width = v64;
  uint64_t v65 = self->_network;
  uint64_t v68 = objc_msgSend_UTF8String((void *)kANSTNetworkInputName, v66, v67);
  objc_msgSend_getResolutionByBlobName_(v65, v69, v68);
  self->_detControl.networkInputsize_t Height = v70;
  self->_detControl.imageOrientation = AcImageOrientationFromANSTImageOrientation(a4);
  if (!objc_msgSend_setInput_fromCVPixelBuffer_(self->_network, v71, kANSTNetworkInputName, resizedInputBuffer))goto LABEL_49; {
  uint64_t v73 = self->_network;
  }
  objc_msgSend_objectAtIndexedSubscript_(self->_networkOutputNames, v72, 17);
  id v74 = objc_claimAutoreleasedReturnValue();
  uint64_t v77 = objc_msgSend_UTF8String(v74, v75, v76);
  uint64_t TensorByName = objc_msgSend_getTensorByName_(v73, v78, v77);
  if (!objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(v73, v80, TensorByName, kANSTNetworkInputLastMaskName)|| (uint64_t v83 = self->_network, v84 = objc_msgSend_UTF8String((void *)kANSTNetworkOutputExtraSalientMaskName, v81, v82), v86 = objc_msgSend_getTensorByName_(v83, v85, v84), (objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(v83, v87, v86, kANSTNetworkInputSalientMaskName) & 1) == 0))
  {

    goto LABEL_49;
  }
  char v90 = objc_msgSend_runNetwork(self->_network, v88, v89);

  if ((v90 & 1) == 0)
  {
LABEL_49:
    if (a5)
    {
      uint64_t v99 = (void *)MEMORY[0x263F087E8];
      uint64_t v106 = *MEMORY[0x263F08320];
      v107 = @"Failed to execute espresso inference.";
      v100 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v72, (uint64_t)&v107, &v106, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v99, v101, @"ANSTErrorDomain", 4, v100);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v9, self);

    if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_55;
    }
    *(_WORD *)v103 = 0;
    goto LABEL_54;
  }
  uint64_t v92 = objc_msgSend__networkResult(self, v72, v91);
  uint64_t v94 = (void *)v92;
  if (a5 && !v92)
  {
    uint64_t v95 = (void *)MEMORY[0x263F087E8];
    uint64_t v104 = *MEMORY[0x263F08320];
    v105 = @"Failed to create inference result.";
    uint64_t v96 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v93, (uint64_t)&v105, &v104, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v95, v97, @"ANSTErrorDomain", 4, v96);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_signpost_id_t v98 = os_signpost_id_make_with_pointer(v9, self);

  if (v98 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v103 = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v9, OS_SIGNPOST_INTERVAL_END, v98, "ANSTISPAlgorithmV1_resultForPixelBuffer", (const char *)&unk_246DA093E, v103, 2u);
  }
LABEL_56:

  return v94;
}

- (id)_networkResult
{
  uint64_t v2 = MEMORY[0x270FA5388](self, a2);
  uint64_t v95 = *MEMORY[0x263EF8340];
  *(void *)(v2 + 204904) = 0;
  *(float32x2_t *)(v2 + 204912) = vcvt_f32_u32(*(uint32x2_t *)(v2 + 204880));
  uint64_t v5 = objc_msgSend_runningFrameRate(*(void **)(v2 + 32), v3, v4);
  if (!v5)
  {
LABEL_7:
    char v6 = 0;
    goto LABEL_8;
  }
  if (v5 != 1)
  {
    os_signpost_id_t v7 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_246D9A6D0();
    }

    goto LABEL_7;
  }
  char v6 = 1;
LABEL_8:
  *(unsigned char *)(v2 + 204901) = v6;
  bzero(v94, 0x5228uLL);
  if (!objc_msgSend_enableObjectTracking(*(void **)(v2 + 32), v8, v9)) {
    goto LABEL_33;
  }
  v12 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, (const void *)v2);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ANSTISPAlgorithmV1_RTCVPostProcess", (const char *)&unk_246DA093E, buf, 2u);
  }

  uint64_t v15 = 0;
  uint64_t v16 = &v91;
  do
  {
    uint64_t v17 = *(void **)(v2 + 40);
    objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v14, v15);
    id v18 = objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_UTF8String(v18, v19, v20);
    uint64_t TensorByName = objc_msgSend_getTensorByName_(v17, v22, v21);

    int v24 = *(_DWORD *)(TensorByName + 96) * *(_DWORD *)(TensorByName + 88);
    int v25 = *(_DWORD *)(TensorByName + 80);
    *(void *)(v16 - 3) = *(void *)TensorByName;
    *(v16 - 1) = v24;
    *uint64_t v16 = v25;
    v16[1] = 4 * v25;
    v16[2] = 6;
    ++v15;
    v16 += 6;
  }
  while (v15 != 25);
  int v89 = 1;
  uint64_t v88 = 0x700000011;
  v87[0] = (uint64_t *)buf;
  v87[1] = &v92;
  v87[2] = &v93;
  AcANSTPostProcessMultiNetOutputs(*(void **)(v2 + 56), (uint32x2_t *)(v2 + 204880), v2 + 64, v87, (unsigned int *)&v88, 0, (_DWORD *)(v2 + 2464), (uint64_t)v94);
  int v27 = v26;
  os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v12, (const void *)v2);

  if (v28 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v86 = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v12, OS_SIGNPOST_INTERVAL_END, v28, "ANSTISPAlgorithmV1_RTCVPostProcess", (const char *)&unk_246DA093E, v86, 2u);
  }

  if (v27)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_246D9A65C();
    }

    uint64_t v29 = 0;
  }
  else
  {
LABEL_33:
    if (objc_msgSend_enableSegmentation(*(void **)(v2 + 32), v10, v11))
    {
      uint64_t v31 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v30, 18);
      id v32 = objc_claimAutoreleasedReturnValue();
      uint64_t v35 = objc_msgSend_UTF8String(v32, v33, v34);
      uint64_t v37 = objc_msgSend_getTensorByName_(v31, v36, v35);

      CVPixelBuffer_Uint8_fromEspressoBufferFloat32 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v38, v37);
      os_signpost_id_t v40 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v41, 19);
      id v42 = objc_claimAutoreleasedReturnValue();
      uint64_t v45 = objc_msgSend_UTF8String(v42, v43, v44);
      uint64_t v47 = objc_msgSend_getTensorByName_(v40, v46, v45);

      uint64_t v49 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v48, v47);
      uint64_t v50 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v51, 20);
      id v52 = objc_claimAutoreleasedReturnValue();
      uint64_t v55 = objc_msgSend_UTF8String(v52, v53, v54);
      uint64_t v57 = objc_msgSend_getTensorByName_(v50, v56, v55);

      uint64_t v59 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v58, v57);
      v60 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v61, 21);
      id v62 = objc_claimAutoreleasedReturnValue();
      uint64_t v65 = objc_msgSend_UTF8String(v62, v63, v64);
      uint64_t v67 = objc_msgSend_getTensorByName_(v60, v66, v65);

      uint64_t v69 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v68, v67);
      double v70 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v71, 22);
      id v72 = objc_claimAutoreleasedReturnValue();
      uint64_t v75 = objc_msgSend_UTF8String(v72, v73, v74);
      uint64_t v77 = objc_msgSend_getTensorByName_(v70, v76, v75);

      v79 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v78, v77);
    }
    else
    {
      CVPixelBuffer_Uint8_fromEspressoBufferFloat32 = 0;
      uint64_t v49 = 0;
      uint64_t v59 = 0;
      uint64_t v69 = 0;
      v79 = 0;
    }
    v80 = [ANSTISPAlgorithmResult alloc];
    if (objc_msgSend_enableObjectTracking(*(void **)(v2 + 32), v81, v82)) {
      uint64_t v84 = objc_msgSend_initWithAcResult_personMask_salientPersonMask_skinMask_hairMask_skyMask_saliencyMask_(v80, v83, (uint64_t)v94, CVPixelBuffer_Uint8_fromEspressoBufferFloat32, v49, v59, v69, v79, 0);
    }
    else {
      uint64_t v84 = objc_msgSend_initWithAcResult_personMask_salientPersonMask_skinMask_hairMask_skyMask_saliencyMask_(v80, v83, 0, CVPixelBuffer_Uint8_fromEspressoBufferFloat32, v49, v59, v69, v79, 0);
    }
    uint64_t v29 = (void *)v84;
    CVPixelBufferRelease(CVPixelBuffer_Uint8_fromEspressoBufferFloat32);
    CVPixelBufferRelease(v49);
    CVPixelBufferRelease(v59);
    CVPixelBufferRelease(v69);
    CVPixelBufferRelease(v79);
    CVPixelBufferRelease(0);
  }
  return v29;
}

- (unint64_t)networkInputBufferWidth
{
  p_config = (void **)&self->_config;
  uint64_t v4 = objc_msgSend_networkResolution(self->_config, a2, v2);
  if (v4)
  {
    if (v4 == 1) {
      return 1024;
    }
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    char v6 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
      sub_246D9A758(p_config, v6, v7);
    }
  }
  return 512;
}

- (unint64_t)networkInputBufferHeight
{
  p_config = (void **)&self->_config;
  uint64_t v4 = objc_msgSend_networkResolution(self->_config, a2, v2);
  if (!v4) {
    return 384;
  }
  if (v4 == 1) {
    return 576;
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  char v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
    sub_246D9A7E8(p_config, v6, v7);
  }

  return 512;
}

- (unsigned)networkInputBufferPixelFormat
{
  return 1111970369;
}

- (__CVBuffer)_createCVPixelBuffer_Uint8_fromEspressoBufferFloat32:(id *)a3
{
  if (a3->var6 != 1)
  {
    uint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9A9D8(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    goto LABEL_21;
  }
  if (a3->var14 != 65568)
  {
    uint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9A964();
    }
    goto LABEL_21;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_outputSemanticBufferPool, &pixelBufferOut))
  {
    uint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9A8F0();
    }
LABEL_21:

    return 0;
  }
  unint64_t var4 = a3->var4;
  unint64_t var5 = a3->var5;
  if (var4 != CVPixelBufferGetWidth(pixelBufferOut) || var5 != CVPixelBufferGetHeight(pixelBufferOut))
  {
    uint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9A878(v4, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_21;
  }
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  var0 = (char *)a3->var0;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  if (var5)
  {
    for (uint64_t i = 0; i != var5; ++i)
    {
      if (var4)
      {
        id v18 = &BaseAddress[i * BytesPerRow];
        uint64_t v19 = (float *)&var0[4 * i * var4];
        unint64_t v20 = var4;
        do
        {
          float v21 = *v19++;
          *v18++ = (int)v21;
          --v20;
        }
        while (v20);
      }
    }
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (__CVBuffer)_createCVPixelBuffer_Uint8_fromAcSaliencyHeatMap:(id *)a3
{
  if (!a3->var4)
  {
    uint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9AA50(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    goto LABEL_7;
  }
  v3 = a3;
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_outputSaliencyBufferPool, &pixelBufferOut))
  {
    uint64_t v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9AAC8();
    }
LABEL_7:

    return 0;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  size_t Width = CVPixelBufferGetWidth(pixelBufferOut);
  size_t Height = CVPixelBufferGetHeight(pixelBufferOut);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  if (Height)
  {
    uint64_t v17 = BaseAddress;
    do
    {
      memcpy(v17, v3, Width);
      v17 += BytesPerRow;
      v3 = ($89BB12214744E703B6C4B42151811E52 *)((char *)v3 + Width);
      --Height;
    }
    while (Height);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkOutputNames, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end