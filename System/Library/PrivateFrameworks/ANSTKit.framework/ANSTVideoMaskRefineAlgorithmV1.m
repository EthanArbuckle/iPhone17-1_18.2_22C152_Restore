@interface ANSTVideoMaskRefineAlgorithmV1
+ (unint64_t)_version;
- (ANSTVideoMaskRefineAlgorithmV1)initWithConfiguration:(id)a3;
- (BOOL)prepareWithError:(id *)a3;
- (__CVBuffer)_createCVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32:(id *)a3;
- (id)_networkResult;
- (id)resultForPixelBuffer:(__CVBuffer *)resizedInputBuffer coarseSegementationMasks:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)undoPrepareSideEffects;
@end

@implementation ANSTVideoMaskRefineAlgorithmV1

+ (unint64_t)_version
{
  return 0x10000;
}

- (ANSTVideoMaskRefineAlgorithmV1)initWithConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANSTVideoMaskRefineAlgorithmV1;
  v6 = [(ANSTVideoMaskRefineAlgorithm *)&v13 initWithConfiguration:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_readyForInference = 0;
    v7->_isFirstFrame = 1;
    v8 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend_description(v5, v9, v10);
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_246D53000, v8, OS_LOG_TYPE_DEFAULT, "ANSTVideoMaskRefineAlgorithmV1 (VMRefiner v1.1) initialized with config %{public}@.", buf, 0xCu);
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
  v4.super_class = (Class)ANSTVideoMaskRefineAlgorithmV1;
  [(ANSTVideoMaskRefineAlgorithmV1 *)&v4 dealloc];
}

- (void)undoPrepareSideEffects
{
  CVPixelBufferRelease(self->_resizedInputBuffer);
  CVPixelBufferPoolRelease(self->_outputBufferPool_256x192);
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(self->_pixelTransferSession);
    CFRelease(pixelTransferSession);
  }
  network = self->_network;
  self->_network = 0;

  self->_readyForInference = 0;
}

- (BOOL)prepareWithError:(id *)a3
{
  v125[1] = *MEMORY[0x263EF8340];
  id v5 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_246DA093E, buf, 2u);
  }

  if (!self->_readyForInference)
  {
    v9 = [ANSTBaseNetworkEspresso alloc];
    uint64_t v12 = objc_msgSend_networkEngineType(self->_config, v10, v11);
    uint64_t v15 = objc_msgSend_qualityOfService(self->_config, v13, v14);
    v17 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_(v9, v16, v12, v15, @"vmrefiner");
    network = self->_network;
    self->_network = v17;

    if (objc_msgSend_networkEngineType(self->_config, v19, v20))
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_246D9AEF0(v5, v23, v24, v25, v26, v27, v28, v29);
      }

      if (a3)
      {
        v32 = (void *)MEMORY[0x263F087E8];
        uint64_t v124 = *MEMORY[0x263F08320];
        v125[0] = @"ANSTKit has deprecated non-ANE execution support. Please stop configuring ANSTVideoMaskRefineAlgorithm for executing on non-ANE platforms.";
        v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)v125, &v124, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, @"ANSTErrorDomain", 3, v33);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_undoPrepareSideEffects(self, v30, v31);
      os_signpost_id_t v35 = os_signpost_id_make_with_pointer(v5, self);

      if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
LABEL_37:
      _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v35, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_246DA093E, buf, 2u);
LABEL_38:

      return 0;
    }
    if ((objc_msgSend_prepare(self->_network, v21, v22) & 1) == 0)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_246D9AE78(v5, v69, v70, v71, v72, v73, v74, v75);
      }

      if (a3)
      {
        v78 = (void *)MEMORY[0x263F087E8];
        uint64_t v122 = *MEMORY[0x263F08320];
        v123 = @"Failed to prepare espresso network.";
        v79 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v76, (uint64_t)&v123, &v122, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v78, v80, @"ANSTErrorDomain", 3, v79);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_undoPrepareSideEffects(self, v76, v77);
      os_signpost_id_t v35 = os_signpost_id_make_with_pointer(v5, self);

      if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      goto LABEL_37;
    }
    *(_OWORD *)buf = 0u;
    long long v121 = 0u;
    v37 = self->_network;
    objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, v36, 2);
    id v38 = objc_claimAutoreleasedReturnValue();
    uint64_t v41 = objc_msgSend_UTF8String(v38, v39, v40);
    self->_lastPersonMask = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v37, v42, v41);

    v43 = self->_network;
    objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, v44, 2);
    id v45 = objc_claimAutoreleasedReturnValue();
    uint64_t v48 = objc_msgSend_UTF8String(v45, v46, v47);
    LOBYTE(v43) = objc_msgSend_getBlobDimensionByName_andDestination_(v43, v49, v48, buf);

    if (v43)
    {
      bzero(self->_lastPersonMask->var0, 4 * self->_lastPersonMask->var13);
      PixelBuffer_width_height = (__CVBuffer *)objc_msgSend_createPixelBuffer_width_height_(self, v52, 1111970369, 256, 192);
      self->_resizedInputBuffer = PixelBuffer_width_height;
      if (PixelBuffer_width_height)
      {
        p_pixelTransferSession = &self->_pixelTransferSession;
        if (VTPixelTransferSessionCreate(0, &self->_pixelTransferSession)
          || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1EA08], (CFTypeRef)*MEMORY[0x263F1EC78])|| VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x263F1EA00], (CFTypeRef)*MEMORY[0x263EFFB40]))
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
            sub_246D9AE00(v5, v56, v57, v58, v59, v60, v61, v62);
          }

          if (a3)
          {
            v65 = (void *)MEMORY[0x263F087E8];
            uint64_t v114 = *MEMORY[0x263F08320];
            v115 = @"Failed to prepare VTPixelTransferSession.";
            v66 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)&v115, &v114, 1);
            objc_msgSend_errorWithDomain_code_userInfo_(v65, v67, @"ANSTErrorDomain", 3, v66);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_undoPrepareSideEffects(self, v63, v64);
          os_signpost_id_t v68 = os_signpost_id_make_with_pointer(v5, self);

          if (v68 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
            goto LABEL_53;
          }
          *(_WORD *)v111 = 0;
        }
        else
        {
          v97 = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPoolCreateWithMinCapacity_width_height_pixelFormat_(self, v55, 3, 256, 192, 1278226534);
          self->_outputBufferPool_256x192 = v97;
          if (v97)
          {
            BOOL v8 = 1;
            self->_readyForInference = 1;
            os_signpost_id_t v98 = os_signpost_id_make_with_pointer(v5, self);

            if (v98 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
            {
              *(_WORD *)v111 = 0;
              _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v98, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_246DA093E, v111, 2u);
            }
            goto LABEL_54;
          }
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
            sub_246D9AD88(v5, v99, v100, v101, v102, v103, v104, v105);
          }

          if (a3)
          {
            v108 = (void *)MEMORY[0x263F087E8];
            uint64_t v112 = *MEMORY[0x263F08320];
            v113 = @"Failed to prepare output pixel buffer pool.";
            v109 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v106, (uint64_t)&v113, &v112, 1);
            objc_msgSend_errorWithDomain_code_userInfo_(v108, v110, @"ANSTErrorDomain", 3, v109);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_undoPrepareSideEffects(self, v106, v107);
          os_signpost_id_t v68 = os_signpost_id_make_with_pointer(v5, self);

          if (v68 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
          {
LABEL_53:
            BOOL v8 = 0;
LABEL_54:

            return v8;
          }
          *(_WORD *)v111 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_246D9AD10(v5, v85, v86, v87, v88, v89, v90, v91);
        }

        if (a3)
        {
          v94 = (void *)MEMORY[0x263F087E8];
          uint64_t v116 = *MEMORY[0x263F08320];
          v117 = @"Failed to prepare resized input buffer.";
          v95 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v92, (uint64_t)&v117, &v116, 1);
          objc_msgSend_errorWithDomain_code_userInfo_(v94, v96, @"ANSTErrorDomain", 3, v95);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_undoPrepareSideEffects(self, v92, v93);
        os_signpost_id_t v68 = os_signpost_id_make_with_pointer(v5, self);

        if (v68 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
          goto LABEL_53;
        }
        *(_WORD *)v111 = 0;
      }
    }
    else
    {
      if (a3)
      {
        v82 = (void *)MEMORY[0x263F087E8];
        uint64_t v118 = *MEMORY[0x263F08320];
        v119 = @"Failed to get last person mask output blob dimensions";
        v83 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v50, (uint64_t)&v119, &v118, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v82, v84, @"ANSTErrorDomain", 3, v83);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_undoPrepareSideEffects(self, v50, v51);
      os_signpost_id_t v68 = os_signpost_id_make_with_pointer(v5, self);

      if (v68 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5)) {
        goto LABEL_53;
      }
      *(_WORD *)v111 = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v68, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_246DA093E, v111, 2u);
    goto LABEL_53;
  }
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v5, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v5, OS_SIGNPOST_INTERVAL_END, v7, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_246DA093E, buf, 2u);
  }

  return 1;
}

- (id)resultForPixelBuffer:(__CVBuffer *)resizedInputBuffer coarseSegementationMasks:(id)a4 error:(id *)a5
{
  v149[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ANSTVideoMaskRefineAlgorithm_resultForPixelBuffer", (const char *)&unk_246DA093E, buf, 2u);
  }

  if (!self->_readyForInference)
  {
    if (a5)
    {
      uint64_t v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v148 = *MEMORY[0x263F08320];
      uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v149, &v148, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, @"ANSTErrorDomain", 4, v29);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  if (!resizedInputBuffer)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D9AF68(v9, v31, v32, v33, v34, v35, v36, v37);
    }

    if (a5)
    {
      v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v146 = *MEMORY[0x263F08320];
      v147 = @"Nil input buffer.";
      uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)&v147, &v146, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v39, v41, @"ANSTErrorDomain", 2, v40);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  size_t Width = CVPixelBufferGetWidth(resizedInputBuffer);
  size_t Height = CVPixelBufferGetHeight(resizedInputBuffer);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(resizedInputBuffer);
  if (Width < Height)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D9AFE0(v9, v16, v17, v18, v19, v20, v21, v22);
    }

    if (a5)
    {
      uint64_t v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v144 = *MEMORY[0x263F08320];
      v145 = @"Input pixel buffer width < height. ANSTISPAlgorithm only supports landscape input.";
      uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)&v145, &v144, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, @"ANSTErrorDomain", 2, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
LABEL_71:
    _os_signpost_emit_with_name_impl(&dword_246D53000, v9, OS_SIGNPOST_INTERVAL_END, v27, "ANSTVideoMaskRefineAlgorithm_resultForPixelBuffer", (const char *)&unk_246DA093E, buf, 2u);
LABEL_72:
    uint64_t v104 = 0;
    goto LABEL_73;
  }
  if (Width != 256 || Height != 192 || PixelFormatType != 1111970369)
  {
    if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, resizedInputBuffer, self->_resizedInputBuffer))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_246D9B1C0(v9, v42, v43, v44, v45, v46, v47, v48);
      }

      if (a5)
      {
        v50 = (void *)MEMORY[0x263F087E8];
        uint64_t v142 = *MEMORY[0x263F08320];
        v143 = @"Failed to transfer input pixel buffer.";
        uint64_t v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v49, (uint64_t)&v143, &v142, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v50, v52, @"ANSTErrorDomain", 4, v51);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v9, self);

      if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
        goto LABEL_72;
      }
      *(_WORD *)buf = 0;
      goto LABEL_71;
    }
    resizedInputBuffer = self->_resizedInputBuffer;
  }
  v53 = objc_msgSend_objectForKeyedSubscript_(v8, v15, @"Skin");

  v55 = objc_msgSend_objectForKeyedSubscript_(v8, v54, @"Hair");

  uint64_t v57 = objc_msgSend_objectForKeyedSubscript_(v8, v56, @"Person");

  if (!v53 || !v55 || !v57)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D9B058(v9, v82, v83, v84, v85, v86, v87, v88);
    }

    if (a5)
    {
      uint64_t v90 = (void *)MEMORY[0x263F087E8];
      uint64_t v140 = *MEMORY[0x263F08320];
      v141 = @"Missing one or more required coarse input mask.";
      uint64_t v91 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v89, (uint64_t)&v141, &v140, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v90, v92, @"ANSTErrorDomain", 2, v91);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  if (CVPixelBufferGetWidth((CVPixelBufferRef)v53) != 256
    || CVPixelBufferGetHeight((CVPixelBufferRef)v53) != 192
    || CVPixelBufferGetWidth((CVPixelBufferRef)v55) != 256
    || CVPixelBufferGetHeight((CVPixelBufferRef)v55) != 192
    || CVPixelBufferGetWidth((CVPixelBufferRef)v57) != 256
    || CVPixelBufferGetHeight((CVPixelBufferRef)v57) != 192)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D9B148(v9, v93, v94, v95, v96, v97, v98, v99);
    }

    if (a5)
    {
      uint64_t v101 = (void *)MEMORY[0x263F087E8];
      uint64_t v138 = *MEMORY[0x263F08320];
      v139 = @"Unexpected input mask dimension. VMRefiner expects 256 x 192 input.";
      uint64_t v102 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v100, (uint64_t)&v139, &v138, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v101, v103, @"ANSTErrorDomain", 2, v102);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  if (CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v53) != 1278226488
    || CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v55) != 1278226488
    || CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v57) != 1278226488)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D9B0D0(v9, v106, v107, v108, v109, v110, v111, v112);
    }

    if (a5)
    {
      uint64_t v114 = (void *)MEMORY[0x263F087E8];
      uint64_t v136 = *MEMORY[0x263F08320];
      v137 = @"Unexpected input mask pixel format. VMRefiner expects OneComponent8.";
      v115 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v113, (uint64_t)&v137, &v136, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v114, v116, @"ANSTErrorDomain", 2, v115);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  network = self->_network;
  uint64_t v60 = objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v58, 0);
  uint64_t v61 = network;
  uint64_t v62 = (void *)v60;
  if (!objc_msgSend_setInput_fromCVPixelBuffer_(v61, v63, v60, resizedInputBuffer)) {
    goto LABEL_85;
  }
  v130 = v62;
  v65 = self->_network;
  v66 = objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v64, 1);
  if (!objc_msgSend_setInput_fromCVPixelBuffer_(v65, v67, (uint64_t)v66, v53))
  {
LABEL_84:

    uint64_t v62 = v130;
LABEL_85:

    goto LABEL_86;
  }
  uint64_t v69 = self->_network;
  uint64_t v70 = objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v68, 2);
  if ((objc_msgSend_setInput_fromCVPixelBuffer_(v69, v71, (uint64_t)v70, v55) & 1) == 0)
  {

    goto LABEL_84;
  }
  uint64_t v73 = self->_network;
  uint64_t v74 = objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v72, 3);
  LODWORD(v73) = objc_msgSend_setInput_fromCVPixelBuffer_(v73, v75, (uint64_t)v74, v57);

  if (!v73) {
    goto LABEL_86;
  }
  uint64_t v77 = self->_network;
  if (self->_isFirstFrame)
  {
    v78 = objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v76, 4);
    int v80 = objc_msgSend_setInput_fromCVPixelBuffer_(v77, v79, (uint64_t)v78, v57);

    if (v80)
    {
      self->_isFirstFrame = 0;
      goto LABEL_92;
    }
LABEL_86:
    if (a5)
    {
      v117 = (void *)MEMORY[0x263F087E8];
      uint64_t v134 = *MEMORY[0x263F08320];
      v135 = @"Failed to set network input buffers";
      uint64_t v118 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v76, (uint64_t)&v135, &v134, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v117, v119, @"ANSTErrorDomain", 4, v118);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  lastPersonMask = self->_lastPersonMask;
  long long v121 = objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v76, 4);
  char v123 = objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(v77, v122, (uint64_t)lastPersonMask, v121);

  if ((v123 & 1) == 0) {
    goto LABEL_86;
  }
LABEL_92:
  if ((objc_msgSend_runNetwork(self->_network, v76, v81) & 1) == 0)
  {
    if (a5)
    {
      v127 = (void *)MEMORY[0x263F087E8];
      uint64_t v132 = *MEMORY[0x263F08320];
      v133 = @"Failed to run network";
      v128 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v124, (uint64_t)&v133, &v132, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v127, v129, @"ANSTErrorDomain", 4, v128);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  uint64_t v104 = objc_msgSend__networkResult(self, v124, v125);
  os_signpost_id_t v126 = os_signpost_id_make_with_pointer(v9, self);

  if (v126 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_246D53000, v9, OS_SIGNPOST_INTERVAL_END, v126, "ANSTVideoMaskRefineAlgorithm_resultForPixelBuffer", (const char *)&unk_246DA093E, buf, 2u);
  }
LABEL_73:

  return v104;
}

- (id)_networkResult
{
  network = self->_network;
  objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, a2, 0);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_UTF8String(v4, v5, v6);
  uint64_t TensorByName = objc_msgSend_getTensorByName_(network, v8, v7);

  uint64_t CVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32 = objc_msgSend__createCVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32_(self, v10, TensorByName);
  if (CVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32)
  {
    objc_super v13 = (__CVBuffer *)CVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32;
    uint64_t v14 = self->_network;
    objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, v12, 1);
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
    uint64_t v20 = objc_msgSend_getTensorByName_(v14, v19, v18);

    uint64_t v22 = objc_msgSend__createCVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32_(self, v21, v20);
    if (v22)
    {
      uint64_t v24 = (__CVBuffer *)v22;
      uint64_t v25 = self->_network;
      objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, v23, 2);
      id v26 = objc_claimAutoreleasedReturnValue();
      uint64_t v29 = objc_msgSend_UTF8String(v26, v27, v28);
      self->_lastPersonMask = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v25, v30, v29);

      uint64_t v32 = objc_msgSend__createCVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32_(self, v31, (uint64_t)self->_lastPersonMask);
      if (v32)
      {
        uint64_t v33 = (__CVBuffer *)v32;
        uint64_t v34 = [ANSTVideoMaskRefineAlgorithmResult alloc];
        uint64_t v36 = objc_msgSend_initWithSkinMask_hairMask_personMask_(v34, v35, (uint64_t)v13, v24, v33);
        CVPixelBufferRelease(v13);
        CVPixelBufferRelease(v24);
        CVPixelBufferRelease(v33);
        goto LABEL_12;
      }
      uint64_t v37 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_246D9B328(v37, v52, v53, v54, v55, v56, v57, v58);
      }
    }
    else
    {
      uint64_t v37 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_246D9B2B0(v37, v45, v46, v47, v48, v49, v50, v51);
      }
    }
  }
  else
  {
    uint64_t v37 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_246D9B238(v37, v38, v39, v40, v41, v42, v43, v44);
    }
  }

  uint64_t v36 = 0;
LABEL_12:
  return v36;
}

- (__CVBuffer)_createCVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32:(id *)a3
{
  if (a3->var6 != 1)
  {
    id v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9B518(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    goto LABEL_12;
  }
  if (a3->var4 != 256 || a3->var5 != 192)
  {
    id v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9B4A0(v4, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_12;
  }
  if (a3->var14 != 65568)
  {
    id v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9B420();
    }
    goto LABEL_12;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_outputBufferPool_256x192, &pixelBufferOut))
  {
    id v4 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_246D9B3A0();
    }
LABEL_12:

    return 0;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  unint64_t var5 = a3->var5;
  unint64_t v21 = 4 * a3->var4;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  var0 = (char *)a3->var0;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  uint64_t v25 = BaseAddress;
  if (v21 == BytesPerRow)
  {
    memcpy(BaseAddress, var0, var5 * v21);
  }
  else if (var5)
  {
    if (v21 >= BytesPerRow) {
      size_t v26 = BytesPerRow;
    }
    else {
      size_t v26 = v21;
    }
    do
    {
      memcpy(v25, var0, v26);
      v25 += BytesPerRow;
      var0 += v21;
      --var5;
    }
    while (var5);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end