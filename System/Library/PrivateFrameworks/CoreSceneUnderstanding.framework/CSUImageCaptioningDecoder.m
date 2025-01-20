@interface CSUImageCaptioningDecoder
- (BOOL)loadResources:(id *)a3;
- (CSUImageCaptioningDecoder)initWithConfiguration:(id)a3;
- (CSUImageCaptioningDecoderConfiguration)configuration;
- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5;
- (id)computeDecodedCaptionsForFeaturesAXKVCacheE1:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6;
- (id)computeDecodedCaptionsForFeaturesE1:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6;
- (id)computeDecodedCaptionsForFeaturesE5:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6;
- (id)computeDecodedCaptionsForFeaturesWithCSUBuffer:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5;
- (id)getBridgeLayerOutputE1:(id)a3 error:(id *)a4;
- (id)getBridgeLayerOutputE5:(id)a3 error:(id *)a4;
- (id)postProcessResults:(id)a3 error:(id *)a4;
- (void)setConfiguration:(id)a3;
@end

@implementation CSUImageCaptioningDecoder

- (CSUImageCaptioningDecoder)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CSUImageCaptioningDecoder;
  v6 = [(CSUImageCaptioningDecoder *)&v41 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_configuration, a3);
  imageCaptioningDecoderE1 = v7->_imageCaptioningDecoderE1;
  v7->_imageCaptioningDecoderE1 = 0;

  imageCaptioningDecoderE5 = v7->_imageCaptioningDecoderE5;
  v7->_imageCaptioningDecoderE5 = 0;

  imageCaptioningDecoderAXKVCacheE1 = v7->_imageCaptioningDecoderAXKVCacheE1;
  v7->_imageCaptioningDecoderAXKVCacheE1 = 0;

  uint64_t v15 = objc_msgSend_runtimeEngine(v5, v11, v12, v13, v14);
  if (v15 == 3)
  {
    v25 = [CSUImageCaptioningDecoderAXKVCacheE1 alloc];
    uint64_t v29 = objc_msgSend_initWithConfiguration_(v25, v26, (uint64_t)v5, v27, v28);
    v24 = v7->_imageCaptioningDecoderAXKVCacheE1;
    v7->_imageCaptioningDecoderAXKVCacheE1 = (CSUImageCaptioningDecoderAXKVCacheE1 *)v29;
    goto LABEL_8;
  }
  if (v15 == 2)
  {
    v30 = [CSUImageCaptioningDecoderE5 alloc];
    uint64_t v34 = objc_msgSend_initWithConfiguration_(v30, v31, (uint64_t)v5, v32, v33);
    v24 = v7->_imageCaptioningDecoderE5;
    v7->_imageCaptioningDecoderE5 = (CSUImageCaptioningDecoderE5 *)v34;
    goto LABEL_8;
  }
  if (v15 != 1)
  {
    v36 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v16, @"Runtime not supported!", v17, v18);
    objc_msgSend_logInternalError_(CSUError, v37, (uint64_t)v36, v38, v39);

LABEL_10:
    v35 = 0;
    goto LABEL_11;
  }
  v19 = [CSUImageCaptioningDecoderE1 alloc];
  uint64_t v23 = objc_msgSend_initWithConfiguration_(v19, v20, (uint64_t)v5, v21, v22);
  v24 = v7->_imageCaptioningDecoderE1;
  v7->_imageCaptioningDecoderE1 = (CSUImageCaptioningDecoderE1 *)v23;
LABEL_8:

  v35 = v7;
LABEL_11:

  return v35;
}

- (BOOL)loadResources:(id *)a3
{
  imageCaptioningDecoderE1 = self->_imageCaptioningDecoderE1;
  if (imageCaptioningDecoderE1)
  {
    LODWORD(imageCaptioningDecoderE5) = objc_msgSend_loadResources_(imageCaptioningDecoderE1, a2, (uint64_t)a3, v3, v4);
    if (imageCaptioningDecoderE5)
    {
      uint64_t v12 = objc_msgSend_procUtils(self->_imageCaptioningDecoderE1, v8, v9, v10, v11);
      objc_msgSend_postProcessingHandler(v12, v13, v14, v15, v16);
      uint64_t v17 = (CSUCaptionPostProcessingHandler *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      postProcessingHandler = self->_postProcessingHandler;
      self->_postProcessingHandler = v17;

      LOBYTE(imageCaptioningDecoderE5) = 1;
    }
  }
  else
  {
    imageCaptioningDecoderAXKVCacheE1 = self->_imageCaptioningDecoderAXKVCacheE1;
    if (imageCaptioningDecoderAXKVCacheE1)
    {
      LODWORD(imageCaptioningDecoderE5) = objc_msgSend_loadResources_(imageCaptioningDecoderAXKVCacheE1, a2, (uint64_t)a3, v3, v4);
      if (imageCaptioningDecoderE5)
      {
        uint64_t v12 = objc_msgSend_procUtils(self->_imageCaptioningDecoderAXKVCacheE1, v19, v20, v21, v22);
        objc_msgSend_postProcessingHandler(v12, v23, v24, v25, v26);
        uint64_t v17 = (CSUCaptionPostProcessingHandler *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    else
    {
      imageCaptioningDecoderE5 = self->_imageCaptioningDecoderE5;
      if (imageCaptioningDecoderE5)
      {
        LODWORD(imageCaptioningDecoderE5) = objc_msgSend_loadResources_(imageCaptioningDecoderE5, a2, (uint64_t)a3, v3, v4);
        if (imageCaptioningDecoderE5)
        {
          uint64_t v12 = objc_msgSend_procUtils(self->_imageCaptioningDecoderE5, v27, v28, v29, v30);
          objc_msgSend_postProcessingHandler(v12, v31, v32, v33, v34);
          uint64_t v17 = (CSUCaptionPostProcessingHandler *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
      }
    }
  }
  return (char)imageCaptioningDecoderE5;
}

- (id)computeDecodedCaptionsForFeaturesWithCSUBuffer:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  v51[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v17 = objc_msgSend_runtimeEngine(self->_configuration, v9, v10, v11, v12);
  configuration = self->_configuration;
  if (v17 == 1)
  {
    v19 = objc_msgSend_bridgeNetworkPath(configuration, v13, v14, v15, v16);
    BOOL v20 = v19 == 0;

    uint64_t v22 = objc_msgSend_computeDecodedCaptionsForFeaturesE1_withDecodingMethod_runDecoderOnly_error_(self, v21, (uint64_t)v8, a4, v20, a5);
LABEL_3:
    uint64_t v23 = (void *)v22;
    goto LABEL_11;
  }
  if (objc_msgSend_runtimeEngine(configuration, v13, v14, v15, v16) == 2)
  {
    id v28 = v8;
    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v33 = (uint64_t *)objc_msgSend_espressoBuffer(v28, v29, v30, v31, v32);

        uint64_t v34 = v33[19];
        id v35 = objc_alloc(MEMORY[0x263F00DA8]);
        uint64_t v36 = *v33;
        v40 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v37, v34, v38, v39);
        v51[0] = v40;
        v43 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v41, (uint64_t)v51, 1, v42);
        v45 = objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v35, v44, v36, (uint64_t)v43, 65568, &unk_26FEEA4B8, 0, a5);

        uint64_t v23 = objc_msgSend_computeDecodedCaptionsForFeaturesE5_withDecodingMethod_runDecoderOnly_error_(self, v46, (uint64_t)v45, a4, 0, a5);

        goto LABEL_11;
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
    }
    else
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    }
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (objc_msgSend_runtimeEngine(self->_configuration, v24, v25, v26, v27) == 3)
  {
    uint64_t v22 = objc_msgSend_computeDecodedCaptionsForFeaturesAXKVCacheE1_withDecodingMethod_runDecoderOnly_error_(self, v47, (uint64_t)v8, a4, 0, a5);
    goto LABEL_3;
  }
  objc_msgSend_errorWithCode_message_(CSUError, v47, 3, @"Unknown Runtime engine requested", v48);
  uint64_t v23 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v23;
}

- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  v86[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (objc_msgSend_runtimeEngine(self->_configuration, v9, v10, v11, v12) == 1)
  {
    objc_msgSend_tensorForInputEmbedding_(CSUDataUtilities, v13, (uint64_t)v8, v15, v16);
    long long v17 = *(_OWORD *)(v84 + 40);
    long long v18 = *(_OWORD *)(v84 + 24);
    v79[0] = *(_OWORD *)(v84 + 8);
    v79[1] = v18;
    v79[2] = v17;
    long long v19 = *(_OWORD *)(v84 + 72);
    long long v20 = *(_OWORD *)(v84 + 104);
    long long v21 = *(_OWORD *)(v84 + 56);
    v79[5] = *(_OWORD *)(v84 + 88);
    v79[6] = v20;
    v79[3] = v21;
    v79[4] = v19;
    long long v22 = *(_OWORD *)(v84 + 120);
    long long v23 = *(_OWORD *)(v84 + 136);
    long long v24 = *(_OWORD *)(v84 + 152);
    uint64_t v80 = *(void *)(v84 + 168);
    v79[8] = v23;
    v79[9] = v24;
    v79[7] = v22;
    id v28 = objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v25, (uint64_t)v79, v26, v27);
    uint64_t v33 = objc_msgSend_bridgeNetworkPath(self->_configuration, v29, v30, v31, v32);
    BOOL v34 = v33 == 0;

    uint64_t v36 = objc_msgSend_computeDecodedCaptionsForFeaturesE1_withDecodingMethod_runDecoderOnly_error_(self, v35, (uint64_t)v28, a4, v34, a5);
  }
  else
  {
    if (objc_msgSend_runtimeEngine(self->_configuration, v13, v14, v15, v16) == 2)
    {
      unint64_t v42 = objc_msgSend_length(v8, v38, v39, v40, v41);
      id v43 = objc_alloc(MEMORY[0x263F00DA8]);
      id v44 = v8;
      uint64_t v49 = objc_msgSend_bytes(v44, v45, v46, v47, v48);
      v53 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v50, v42 >> 2, v51, v52);
      v86[0] = v53;
      v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v54, (uint64_t)v86, 1, v55);
      v58 = objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v43, v57, v49, (uint64_t)v56, 65568, &unk_26FEEA4D0, 0, a5);

      uint64_t v36 = objc_msgSend_computeDecodedCaptionsForFeaturesE5_withDecodingMethod_runDecoderOnly_error_(self, v59, (uint64_t)v58, a4, 0, a5);

      goto LABEL_13;
    }
    if (objc_msgSend_runtimeEngine(self->_configuration, v38, v39, v40, v41) != 3)
    {
      objc_msgSend_errorWithCode_message_(CSUError, v60, 3, @"Unknown Runtime engine requested", v62);
      uint64_t v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend_tensorForInputEmbedding_(CSUDataUtilities, v60, (uint64_t)v8, v61, v62);
    long long v63 = *(_OWORD *)(v84 + 40);
    long long v64 = *(_OWORD *)(v84 + 24);
    v77[0] = *(_OWORD *)(v84 + 8);
    v77[1] = v64;
    v77[2] = v63;
    long long v65 = *(_OWORD *)(v84 + 72);
    long long v66 = *(_OWORD *)(v84 + 104);
    long long v67 = *(_OWORD *)(v84 + 56);
    v77[5] = *(_OWORD *)(v84 + 88);
    v77[6] = v66;
    v77[3] = v67;
    v77[4] = v65;
    long long v68 = *(_OWORD *)(v84 + 120);
    long long v69 = *(_OWORD *)(v84 + 136);
    long long v70 = *(_OWORD *)(v84 + 152);
    uint64_t v78 = *(void *)(v84 + 168);
    v77[8] = v69;
    v77[9] = v70;
    v77[7] = v68;
    v74 = objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v71, (uint64_t)v77, v72, v73);
    uint64_t v36 = objc_msgSend_computeDecodedCaptionsForFeaturesAXKVCacheE1_withDecodingMethod_runDecoderOnly_error_(self, v75, (uint64_t)v74, a4, 1, a5);
  }
  v81 = &unk_26FEDD950;
  v37 = v85;
  if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
    std::__shared_weak_count::__release_weak(v37);
  }
  if (v82)
  {
    v83 = v82;
    operator delete(v82);
  }
LABEL_13:

  return v36;
}

- (id)computeDecodedCaptionsForFeaturesE1:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v13 = a3;
  if (self->_imageCaptioningDecoderE1 && (objc_msgSend_loadResources_(self, v10, (uint64_t)a6, v11, v12) & 1) != 0)
  {
    uint64_t v15 = objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_runDecoderOnly_error_(self->_imageCaptioningDecoderE1, v14, (uint64_t)v13, a4, v7, a6);
    long long v18 = objc_msgSend_postProcessResults_error_(self, v16, (uint64_t)v15, (uint64_t)a6, v17);
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)computeDecodedCaptionsForFeaturesAXKVCacheE1:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v13 = a3;
  if (self->_imageCaptioningDecoderAXKVCacheE1
    && (objc_msgSend_loadResources_(self, v10, (uint64_t)a6, v11, v12) & 1) != 0)
  {
    uint64_t v15 = objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_runDecoderOnly_error_(self->_imageCaptioningDecoderAXKVCacheE1, v14, (uint64_t)v13, a4, v7, a6);
    long long v18 = objc_msgSend_postProcessResults_error_(self, v16, (uint64_t)v15, (uint64_t)a6, v17);
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)computeDecodedCaptionsForFeaturesE5:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v13 = a3;
  if (self->_imageCaptioningDecoderE5 && (objc_msgSend_loadResources_(self, v10, (uint64_t)a6, v11, v12) & 1) != 0)
  {
    uint64_t v17 = objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_runDecoderOnly_error_(self->_imageCaptioningDecoderE5, v14, (uint64_t)v13, a4, v7, a6);
    if (v17)
    {
      long long v18 = objc_msgSend_postProcessResults_error_(self, v15, (uint64_t)v17, (uint64_t)a6, v16);
    }
    else
    {
      long long v18 = 0;
    }
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)getBridgeLayerOutputE5:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_loadResources_(self, v7, (uint64_t)a4, v8, v9))
  {
    if (self->_imageCaptioningDecoderE1 || (imageCaptioningDecoderE5 = self->_imageCaptioningDecoderE5) == 0)
    {
      objc_msgSend_errorWithCode_message_(CSUError, v10, 3, @"Found null object of ML inferences", v13);
      uint64_t v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v17 = objc_msgSend_configuration(imageCaptioningDecoderE5, v10, v11, v12, v13);
      long long v22 = objc_msgSend_bridgeInputShape(v17, v18, v19, v20, v21);
      uint64_t v25 = objc_msgSend_copyFromNSDataAndReshape_shape_(CSUMLMultiArrayUtilities, v23, (uint64_t)v6, (uint64_t)v22, v24);

      uint64_t v14 = objc_msgSend_getBridgeLayerOutput_error_(self->_imageCaptioningDecoderE5, v26, (uint64_t)v25, (uint64_t)a4, v27);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)getBridgeLayerOutputE1:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_loadResources_(self, v7, (uint64_t)a4, v8, v9))
  {
    imageCaptioningDecoderE1 = self->_imageCaptioningDecoderE1;
    if (imageCaptioningDecoderE1 && !self->_imageCaptioningDecoderE5)
    {
      uint64_t v13 = objc_msgSend_getBridgeLayerOutput_error_(imageCaptioningDecoderE1, v10, (uint64_t)v6, (uint64_t)a4, v11);
    }
    else
    {
      objc_msgSend_errorWithCode_message_(CSUError, v10, 3, @"Found null object of ML inferences", v11);
      uint64_t v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)postProcessResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_runtimeEngine(self->_configuration, v7, v8, v9, v10);
  switch(v11)
  {
    case 1:
      uint64_t v14 = objc_msgSend_postProcessResults_error_(self->_imageCaptioningDecoderE1, v12, (uint64_t)v6, (uint64_t)a4, v13);
      goto LABEL_7;
    case 2:
      uint64_t v14 = objc_msgSend_postProcessResults_error_(self->_imageCaptioningDecoderE5, v12, (uint64_t)v6, (uint64_t)a4, v13);
LABEL_7:
      uint64_t v15 = (void *)v14;

      uint64_t v16 = v15;
      return v16;
    case 3:
      uint64_t v14 = objc_msgSend_postProcessResults_error_(self->_imageCaptioningDecoderAXKVCacheE1, v12, (uint64_t)v6, (uint64_t)a4, v13);
      goto LABEL_7;
  }
  long long v18 = sub_24C69662C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_24C72A70C(v18);
  }

  uint64_t v16 = v6;
  return v16;
}

- (CSUImageCaptioningDecoderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_postProcessingHandler, 0);
  objc_storeStrong((id *)&self->_imageCaptioningDecoderE5, 0);
  objc_storeStrong((id *)&self->_imageCaptioningDecoderAXKVCacheE1, 0);
  objc_storeStrong((id *)&self->_imageCaptioningDecoderE1, 0);
}

@end