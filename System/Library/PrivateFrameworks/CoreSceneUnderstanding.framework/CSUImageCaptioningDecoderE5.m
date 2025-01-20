@interface CSUImageCaptioningDecoderE5
- (BOOL)loadBridge:(id *)a3;
- (BOOL)loadDecoder:(id *)a3;
- (BOOL)loadPostProcUtilsWithBeamWidth:(int)a3 error:(id *)a4;
- (BOOL)loadResources:(id *)a3;
- (CSUCaptioningProcUtils)procUtils;
- (CSUImageCaptioningDecoderConfiguration)configuration;
- (CSUImageCaptioningDecoderE5)initWithConfiguration:(id)a3;
- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6;
- (id)getBridgeLayerOutput:(id)a3 error:(id *)a4;
- (id)getCaptionsAfterBeamSearchDecodingOnEncodedFeatures:(id *)a3;
- (id)getCaptionsAfterGreedyDecodingOnEncodedFeatures:(id *)a3;
- (id)postProcessResults:(id)a3 error:(id *)a4;
- (vector<float,)nextTokensForInputs:(CSUImageCaptioningDecoderE5 *)self AndforMaskPosition:(SEL)a3;
@end

@implementation CSUImageCaptioningDecoderE5

- (CSUImageCaptioningDecoderE5)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSUImageCaptioningDecoderE5;
  v10 = [(CSUImageCaptioningDecoderE5 *)&v13 init];
  if (v10 && objc_msgSend_runtimeEngine(v5, v6, v7, v8, v9) == 2)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)loadBridge:(id *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_bridgeNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);

  if (!v7 || self->_bridgeE5Net) {
    return 1;
  }
  uint64_t IsPrecompiled = objc_msgSend_bridgeIsPrecompiled(self->_configuration, v8, v9, v10, v11);
  v17 = objc_msgSend_bridgeNetworkPath(self->_configuration, v13, v14, v15, v16);
  v21 = objc_msgSend_stringByAppendingPathComponent_(v17, v18, @"model.specialization.bundle", v19, v20);

  id v22 = objc_alloc_init(MEMORY[0x263F08850]);
  if ((objc_msgSend_fileExistsAtPath_(v22, v23, (uint64_t)v21, v24, v25) & 1) == 0)
  {
    v26 = sub_24C69662C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v31 = objc_msgSend_bridgeNetworkPath(self->_configuration, v27, v28, v29, v30);
      int v45 = 138412290;
      v46 = v31;
      _os_log_impl(&dword_24C664000, v26, OS_LOG_TYPE_INFO, "Could not fing the pre-compiled bundle for %@.", (uint8_t *)&v45, 0xCu);
    }
    uint64_t IsPrecompiled = 0;
  }
  v32 = [CSUCoreMLInference alloc];
  v37 = objc_msgSend_bridgeNetworkPath(self->_configuration, v33, v34, v35, v36);
  uint64_t v39 = objc_msgSend_initWithCompiledModelFromUri_useComputeUnit_usePrecompiledE5Bundle_error_(v32, v38, (uint64_t)v37, 3, IsPrecompiled, a3);
  bridgeE5Net = self->_bridgeE5Net;
  p_bridgeE5Net = &self->_bridgeE5Net;
  *p_bridgeE5Net = (CSUCoreMLInference *)v39;

  BOOL v42 = *p_bridgeE5Net == 0;
  return !v42;
}

- (BOOL)loadPostProcUtilsWithBeamWidth:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [CSUCaptioningProcUtils alloc];
  uint64_t v9 = (CSUCaptioningProcUtils *)objc_msgSend_initWithDecoderConfiguration_beamWidth_beamScorerType_error_(v7, v8, (uint64_t)self->_configuration, v5, 0, a4);
  procUtils = self->_procUtils;
  self->_procUtils = v9;

  return self->_procUtils != 0;
}

- (BOOL)loadDecoder:(id *)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (self->_decoderE5Net) {
    return 1;
  }
  if ((objc_msgSend_loadPostProcUtilsWithBeamWidth_error_(self, a2, 3, (uint64_t)a3, v3) & 1) == 0) {
    return 0;
  }
  uint64_t IsPrecompiled = objc_msgSend_decoderIsPrecompiled(self->_configuration, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_decoderNetworkPath(self->_configuration, v12, v13, v14, v15);
  v66 = objc_msgSend_stringByAppendingPathComponent_(v16, v17, @"model.specialization.bundle", v18, v19);

  id v65 = objc_alloc_init(MEMORY[0x263F08850]);
  if ((objc_msgSend_fileExistsAtPath_(v65, v20, (uint64_t)v66, v21, v22) & 1) == 0)
  {
    v23 = sub_24C69662C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = objc_msgSend_decoderNetworkPath(self->_configuration, v24, v25, v26, v27);
      *(_DWORD *)buf = 138412290;
      v69 = v28;
      _os_log_impl(&dword_24C664000, v23, OS_LOG_TYPE_INFO, "Could not fing the pre-compiled bundle for %@.", buf, 0xCu);
    }
    uint64_t IsPrecompiled = 0;
  }
  uint64_t v29 = [CSUCoreMLInference alloc];
  uint64_t v34 = objc_msgSend_decoderNetworkPath(self->_configuration, v30, v31, v32, v33);
  uint64_t v36 = (CSUCoreMLInference *)objc_msgSend_initWithCompiledModelFromUri_useComputeUnit_usePrecompiledE5Bundle_error_(v29, v35, (uint64_t)v34, 3, IsPrecompiled, a3);
  decoderE5Net = self->_decoderE5Net;
  self->_decoderE5Net = v36;

  v38 = self->_decoderE5Net;
  BOOL v64 = v38 != 0;
  if (v38)
  {
    id v39 = objc_alloc(MEMORY[0x263F00DA8]);
    v44 = objc_msgSend_decoderInputSeqShape(self->_configuration, v40, v41, v42, v43);
    v46 = (MLMultiArray *)objc_msgSend_initWithShape_dataType_error_(v39, v45, (uint64_t)v44, 65568, (uint64_t)a3);
    inputTokensE5 = self->_inputTokensE5;
    self->_inputTokensE5 = v46;

    uint64_t v55 = objc_msgSend_maxSeqLen(self->_configuration, v48, v49, v50, v51);
    if (v55)
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        v57 = self->_inputTokensE5;
        v67[0] = &unk_26FEEA248;
        v58 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v52, i, v53, v54);
        v67[1] = v58;
        v61 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v59, (uint64_t)v67, 2, v60);
        objc_msgSend_setObject_forKeyedSubscript_(v57, v62, (uint64_t)&unk_26FEEA560, (uint64_t)v61, v63);
      }
    }
  }

  return v64;
}

- (BOOL)loadResources:(id *)a3
{
  if (self->_decoderE5Net)
  {
    int Decoder = 1;
    uint64_t v8 = objc_msgSend_bridgeNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);

    if (v8) {
      goto LABEL_3;
    }
    return Decoder;
  }
  int Decoder = objc_msgSend_loadDecoder_(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v18 = objc_msgSend_bridgeNetworkPath(self->_configuration, v14, v15, v16, v17);

  if (!v18) {
    return Decoder;
  }
LABEL_3:
  bridgeE5Net = self->_bridgeE5Net;
  if (bridgeE5Net) {
    BOOL result = Decoder;
  }
  else {
    BOOL result = 0;
  }
  if (!bridgeE5Net && ((Decoder ^ 1) & 1) == 0)
  {
    return objc_msgSend_loadBridge_(self, v9, (uint64_t)a3, v10, v11);
  }
  return result;
}

- (id)getBridgeLayerOutput:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((objc_msgSend_loadBridge_(self, v7, (uint64_t)a4, v8, v9) & 1) == 0)
  {
    uint64_t v32 = 0;
    goto LABEL_12;
  }
  bridgeE5Net = self->_bridgeE5Net;
  uint64_t v15 = objc_msgSend_inputEncodedFeaturesTensorNameOfBridge(self->_configuration, v10, v11, v12, v13);
  uint64_t v34 = v15;
  v35[0] = v6;
  uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v35, (uint64_t)&v34, 1);
  LOBYTE(bridgeE5Net) = objc_msgSend_setInputFeatures_error_(bridgeE5Net, v18, (uint64_t)v17, (uint64_t)a4, v19);

  if ((bridgeE5Net & 1) == 0)
  {
    uint64_t v28 = sub_24C69662C();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_24C729E40();
    }
    goto LABEL_10;
  }
  if ((objc_msgSend_predict_(self->_bridgeE5Net, v20, (uint64_t)a4, v21, v22) & 1) == 0)
  {
    uint64_t v28 = sub_24C69662C();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_24C729E0C();
    }
LABEL_10:
    uint64_t v32 = 0;
    goto LABEL_11;
  }
  uint64_t v27 = self->_bridgeE5Net;
  uint64_t v28 = objc_msgSend_outputTensorNameOfBridge(self->_configuration, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_getOutputFor_(v27, v29, (uint64_t)v28, v30, v31);
LABEL_11:

LABEL_12:
  return v32;
}

- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  if ((objc_msgSend_loadResources_(self, v11, (uint64_t)a6, v12, v13) & 1) == 0) {
    goto LABEL_16;
  }
  configuration = self->_configuration;
  if (!self->_bridgeE5Net || a5)
  {
    v40 = objc_msgSend_decoderEmbeddingShape(configuration, v14, v15, v16, v17);
    objc_msgSend_reshapeMLMultiArray_toShape_(CSUMLMultiArrayUtilities, v41, (uint64_t)v10, (uint64_t)v40, v42);
    uint64_t v43 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    encodedFeaturesBufferE5 = self->_encodedFeaturesBufferE5;
    self->_encodedFeaturesBufferE5 = v43;

    if (self->_encodedFeaturesBufferE5) {
      goto LABEL_8;
    }
    if (a6)
    {
      objc_msgSend_errorWithCode_message_(CSUError, v37, 12, @"Incorrect shape to run Captioner", v39);
      int v45 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      uint64_t v22 = v10;
      goto LABEL_18;
    }
LABEL_16:
    int v45 = 0;
    goto LABEL_17;
  }
  uint64_t v19 = objc_msgSend_bridgeInputShape(configuration, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_reshapeMLMultiArray_toShape_(CSUMLMultiArrayUtilities, v20, (uint64_t)v10, (uint64_t)v19, v21);

  if (v22)
  {
    objc_msgSend_getBridgeLayerOutput_error_(self, v23, (uint64_t)v22, (uint64_t)a6, v24);
    uint64_t v25 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = self->_encodedFeaturesBufferE5;
    self->_encodedFeaturesBufferE5 = v25;

    uint64_t v31 = self->_encodedFeaturesBufferE5;
    if (v31)
    {
      uint64_t v32 = objc_msgSend_decoderEmbeddingShape(self->_configuration, v27, v28, v29, v30);
      objc_msgSend_reshapeMLMultiArray_toShape_(CSUMLMultiArrayUtilities, v33, (uint64_t)v31, (uint64_t)v32, v34);
      uint64_t v35 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = self->_encodedFeaturesBufferE5;
      self->_encodedFeaturesBufferE5 = v35;

      id v10 = v22;
LABEL_8:
      if (a4) {
        objc_msgSend_getCaptionsAfterBeamSearchDecodingOnEncodedFeatures_(self, v37, (uint64_t)a6, v38, v39);
      }
      else {
      int v45 = objc_msgSend_getCaptionsAfterGreedyDecodingOnEncodedFeatures_(self, v37, (uint64_t)a6, v38, v39);
      }
      goto LABEL_17;
    }
    uint64_t v47 = sub_24C69662C();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_24C729E74();
    }

    int v45 = 0;
  }
  else if (a6)
  {
    objc_msgSend_errorWithCode_message_(CSUError, v23, 12, @"Incorrect shape to run bridge model of Captioner", v24);
    uint64_t v22 = 0;
    int v45 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v22 = 0;
    int v45 = 0;
  }
LABEL_18:

  return v45;
}

- (vector<float,)nextTokensForInputs:(CSUImageCaptioningDecoderE5 *)self AndforMaskPosition:(SEL)a3
{
  v120[2] = *MEMORY[0x263EF8340];
  unint64_t v10 = objc_msgSend_count(self->_inputTokensE5, a3, (uint64_t)a4, *(uint64_t *)&a5, v5);
  unint64_t v13 = v10;
  v116 = 0;
  unint64_t v117 = 0;
  unint64_t v118 = 0;
  if (v10)
  {
    if (v10 >> 62) {
      sub_24C667470();
    }
    size_t v14 = 4 * v10;
    uint64_t v15 = (char *)operator new(4 * v10);
    unint64_t v13 = (unint64_t)&v15[4 * v13];
    v116 = v15;
    unint64_t v118 = v13;
    bzero(v15, v14);
    unint64_t v117 = v13;
    uint64_t v16 = *(const void **)a4;
    uint64_t v17 = *((void *)a4 + 1);
    size_t v18 = v17 - *(void *)a4;
    if (v17 != *(void *)a4) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = *(const void **)a4;
    uint64_t v95 = *((void *)a4 + 1);
    size_t v18 = v95 - *(void *)a4;
    if (v95 != *(void *)a4) {
LABEL_4:
    }
      memmove(v15, v16, v18);
  }
  inputTokensE5 = self->_inputTokensE5;
  v112[0] = MEMORY[0x263EF8330];
  v112[1] = 3321888768;
  v112[2] = sub_24C699FFC;
  v112[3] = &unk_26FEDBC50;
  v114 = 0;
  v115 = 0;
  v113 = 0;
  int64_t v20 = v13 - (void)v15;
  if (v20)
  {
    if (v20 < 0) {
      sub_24C667470();
    }
    uint64_t v21 = (char *)operator new(v20);
    uint64_t v22 = &v21[4 * (v20 >> 2)];
    v113 = v21;
    v115 = v22;
    memcpy(v21, v15, v20);
    v114 = v22;
  }
  objc_msgSend_getMutableBytesWithHandler_(inputTokensE5, (const char *)v16, (uint64_t)v112, v11, v12);
  if (!self->_encodedFeaturesBufferE5)
  {
    uint64_t v27 = sub_24C69662C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_24C729F10();
    }
  }
  decoderE5Net = self->_decoderE5Net;
  uint64_t v29 = objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v23, v24, v25, v26);
  v119[0] = v29;
  v120[0] = self->_encodedFeaturesBufferE5;
  uint64_t v34 = objc_msgSend_inputWordIdsTensorName(self->_configuration, v30, v31, v32, v33);
  v119[1] = v34;
  v120[1] = self->_inputTokensE5;
  uint64_t v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v120, (uint64_t)v119, 2);
  id v111 = 0;
  LOBYTE(decoderE5Net) = objc_msgSend_setInputFeatures_error_(decoderE5Net, v37, (uint64_t)v36, (uint64_t)&v111, v38);
  id v39 = v111;

  if ((decoderE5Net & 1) == 0)
  {
    uint64_t v43 = sub_24C69662C();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_24C729EDC();
    }
  }
  v44 = self->_decoderE5Net;
  id v110 = v39;
  char v45 = objc_msgSend_predict_(v44, v40, (uint64_t)&v110, v41, v42);
  id v46 = v110;

  if (v45)
  {
    uint64_t v51 = self->_decoderE5Net;
    v52 = objc_msgSend_outputWordProbsTensorName(self->_configuration, v47, v48, v49, v50);
    v56 = objc_msgSend_getOutputFor_(v51, v53, (uint64_t)v52, v54, v55);

    v61 = objc_msgSend_shape(v56, v57, v58, v59, v60);
    uint64_t v66 = objc_msgSend_count(v61, v62, v63, v64, v65);

    v71 = objc_msgSend_shape(v56, v67, v68, v69, v70);
    v75 = objc_msgSend_objectAtIndex_(v71, v72, v66 - 1, v73, v74);
    unint64_t v80 = objc_msgSend_unsignedIntegerValue(v75, v76, v77, v78, v79);

    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x4812000000;
    v104 = sub_24C69A134;
    v105 = sub_24C69A158;
    v106 = &unk_24C74DED7;
    v108 = 0;
    v109 = 0;
    __p = 0;
    if (v80)
    {
      if (v80 >> 62) {
        sub_24C667470();
      }
      v81 = (char *)operator new(4 * v80);
      __p = v81;
      v109 = &v81[4 * v80];
      bzero(v81, 4 * v80);
      v108 = &v81[4 * v80];
    }
    v96[0] = MEMORY[0x263EF8330];
    v96[1] = 3221225472;
    v96[2] = sub_24C69A170;
    v96[3] = &unk_2652E8030;
    id v82 = v56;
    v98 = &v101;
    unint64_t v99 = v80;
    unsigned int v100 = a5;
    id v97 = v82;
    objc_msgSend_getBytesWithHandler_(v82, v83, (uint64_t)v96, v84, v85);
    v86 = v102;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    retstr->__begin_ = 0;
    v88 = (unsigned char *)v86[6];
    v87 = (unsigned char *)v86[7];
    int64_t v89 = v87 - v88;
    if (v87 != v88)
    {
      if (v89 < 0) {
        sub_24C667470();
      }
      v90 = (float *)operator new(v87 - v88);
      retstr->__begin_ = v90;
      v91 = &v90[v89 >> 2];
      retstr->__end_cap_.__value_ = v91;
      memcpy(v90, v88, v89);
      retstr->__end_ = v91;
    }

    _Block_object_dispose(&v101, 8);
    if (__p)
    {
      v108 = (char *)__p;
      operator delete(__p);
    }

    v92 = (char *)v113;
    if (v113)
    {
LABEL_26:
      v114 = v92;
      operator delete(v92);
    }
  }
  else
  {
    v94 = sub_24C69662C();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      sub_24C729EA8();
    }

    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    v92 = (char *)v113;
    if (v113) {
      goto LABEL_26;
    }
  }
  if (v15) {
    operator delete(v15);
  }

  return result;
}

- (id)getCaptionsAfterBeamSearchDecodingOnEncodedFeatures:(id *)a3
{
  v156 = self;
  unsigned int v155 = 0;
  v154[0] = &v156;
  v154[1] = &v155;
  v141 = operator new(4uLL);
  _DWORD *v141 = 0;
  procUtils = self->_procUtils;
  if (procUtils)
  {
    objc_msgSend_beamSearch(procUtils, v4, v5, v6, v7);
    uint64_t v9 = v150;
    uint64_t v11 = v150 + 192;
    unint64_t v10 = *(char **)(v150 + 192);
    if (!v10) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v9 = 0;
    v151 = 0;
    uint64_t v11 = 192;
    unint64_t v10 = (char *)MEMORY[0xC0];
    if (!MEMORY[0xC0]) {
      goto LABEL_16;
    }
  }
  uint64_t v12 = *(char **)(v9 + 200);
  unint64_t v13 = v10;
  if (v12 == v10) {
    goto LABEL_15;
  }
  do
  {
    size_t v14 = (std::__shared_weak_count *)*((void *)v12 - 1);
    if (!v14 || atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v15 = (void *)*((void *)v12 - 5);
      if (!v15) {
        goto LABEL_7;
      }
LABEL_11:
      *((void *)v12 - 4) = v15;
      operator delete(v15);
      goto LABEL_7;
    }
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    uint64_t v15 = (void *)*((void *)v12 - 5);
    if (v15) {
      goto LABEL_11;
    }
LABEL_7:
    v12 -= 48;
  }
  while (v12 != v10);
  unint64_t v13 = *(char **)v11;
LABEL_15:
  *(void *)(v9 + 200) = v10;
  operator delete(v13);
LABEL_16:
  *(void *)uint64_t v11 = 0;
  *(void *)(v11 + 8) = 0;
  *(void *)(v11 + 16) = 0;
  uint64_t v16 = operator new(4uLL);
  uint64_t v17 = v11 - 24;
  v171 = 0;
  *(void *)&long long v172 = v16;
  *uint64_t v16 = *v141;
  *((void *)&v172 + 1) = v16 + 1;
  v173 = v16 + 1;
  uint64_t v170 = 0;
  sub_24C69C320(v11 - 24, &v172, &v170, 0.00000011921);
  size_t v18 = v171;
  if (v171 && !atomic_fetch_add(&v171->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  if ((void)v172)
  {
    *((void *)&v172 + 1) = v172;
    operator delete((void *)v172);
  }
  int v19 = *(_DWORD *)v9 - 1;
  if (*(unsigned char *)(v9 + 16) && *(_DWORD *)(v9 + 12) < v19) {
    int v19 = *(_DWORD *)(v9 + 12);
  }
  sub_24C69C534(v11 - 24, (uint64_t *)&v168);
  if (v19 < 1) {
    goto LABEL_89;
  }
  uint64_t v20 = 0;
  v146 = (void *)v11;
  int v148 = v19;
  while (2)
  {
    uint64_t v22 = *(char **)v11;
    if (!*(void *)v11) {
      goto LABEL_41;
    }
    v23 = *(char **)(v9 + 200);
    uint64_t v24 = *(char **)v11;
    if (v23 != v22)
    {
      while (1)
      {
        uint64_t v26 = (std::__shared_weak_count *)*((void *)v23 - 1);
        if (v26)
        {
          if (!atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
            break;
          }
        }
        uint64_t v25 = (void *)*((void *)v23 - 5);
        if (v25) {
          goto LABEL_33;
        }
LABEL_34:
        v23 -= 48;
        if (v23 == v22)
        {
          uint64_t v24 = *(char **)v11;
          goto LABEL_40;
        }
      }
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
      uint64_t v25 = (void *)*((void *)v23 - 5);
      if (!v25) {
        goto LABEL_34;
      }
LABEL_33:
      *((void *)v23 - 4) = v25;
      operator delete(v25);
      goto LABEL_34;
    }
LABEL_40:
    *(void *)(v9 + 200) = v22;
    operator delete(v24);
LABEL_41:
    *(void *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    *(void *)(v11 + 16) = 0;
    uint64_t v27 = *((void *)&v168 + 1);
    uint64_t v28 = v168;
    if ((void)v168 != *((void *)&v168 + 1))
    {
      int v29 = 0;
      while (*(unsigned char *)(v9 + 8))
      {
        uint64_t v30 = *(void *)(v9 + 128);
        if (*(char *)(v30 + 55) < 0)
        {
          uint64_t v31 = *(void *)(v30 + 32);
          uint64_t v32 = *(void *)(v30 + 40);
        }
        else
        {
          uint64_t v31 = v30 + 32;
          uint64_t v32 = *(unsigned __int8 *)(v30 + 55);
        }
        int v33 = *(_DWORD *)(*(void *)(v28 + 16) - 4);
        if (v33 != (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)v30 + 32))(v30, v31, v32)
          || *(void *)(v28 + 16) - *(void *)(v28 + 8) < 5uLL)
        {
          break;
        }
        float v34 = *(float *)v28;
        v165 = 0;
        v166 = 0;
        v167 = 0;
        uint64_t v36 = *(unsigned char **)(v28 + 8);
        uint64_t v35 = *(unsigned char **)(v28 + 16);
        int64_t v37 = v35 - v36;
        if (v35 != v36)
        {
          if (v37 < 0) {
            sub_24C667470();
          }
          v165 = (std::__shared_weak_count *)operator new(v35 - v36);
          v166 = v165;
          uint64_t v38 = (char *)v165 + 4 * (v37 >> 2);
          v167 = v38;
          memcpy(v165, v36, v37);
          v166 = (std::__shared_weak_count *)v38;
        }
        uint64_t v163 = *(void *)(v28 + 32);
        id v39 = *(std::__shared_weak_count **)(v28 + 40);
        v164 = v39;
        if (v39) {
          atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        sub_24C69C320(v17, &v165, &v163, v34);
        v40 = v164;
        if (v164 && !atomic_fetch_add(&v164->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
          ++v29;
          uint64_t v41 = v165;
          if (!v165) {
            goto LABEL_44;
          }
LABEL_59:
          v166 = v41;
          operator delete(v41);
          goto LABEL_44;
        }
        ++v29;
        uint64_t v41 = v165;
        if (v165) {
          goto LABEL_59;
        }
LABEL_44:
        v28 += 48;
        if (v28 == v27) {
          goto LABEL_73;
        }
      }
      sub_24C69C74C((uint64_t)__p, v9, v28 + 8, (uint64_t)v154, v20);
      int v42 = v162;
      if (v162)
      {
        (***(void (****)(void, void **))(v9 + 152))(*(void *)(v9 + 152), __p);
        sub_24C69CC48(v9, (uint64_t)__p, v28 + 8, *(float *)v28);
        uint64_t v43 = v161;
        if (!v161) {
          goto LABEL_67;
        }
      }
      else
      {
        v44 = sub_24C69662C();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          sub_24C729FBC(&buf, v158, v44);

          uint64_t v43 = v161;
          if (!v161) {
            goto LABEL_67;
          }
        }
        else
        {

          uint64_t v43 = v161;
          if (!v161) {
            goto LABEL_67;
          }
        }
      }
      if (!atomic_fetch_add(&v43->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
LABEL_67:
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (!v42)
      {
LABEL_73:
        uint64_t v46 = *(void *)(v9 + 192);
        uint64_t v45 = *(void *)(v9 + 200);
        uint64_t v11 = (uint64_t)v146;
        goto LABEL_75;
      }
      goto LABEL_44;
    }
    uint64_t v46 = 0;
    uint64_t v45 = 0;
    int v29 = 0;
LABEL_75:
    if (v29 != -1431655765 * ((unint64_t)(v45 - v46) >> 4))
    {
      sub_24C69C534(v17, (uint64_t *)__p);
      uint64_t v47 = v168;
      if (!(void)v168) {
        goto LABEL_28;
      }
      uint64_t v48 = *((void *)&v168 + 1);
      uint64_t v21 = (void *)v168;
      if (*((void *)&v168 + 1) != (void)v168)
      {
        while (1)
        {
          uint64_t v49 = *(std::__shared_weak_count **)(v48 - 8);
          if (v49)
          {
            if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
              break;
            }
          }
          uint64_t v50 = *(void **)(v48 - 40);
          if (v50) {
            goto LABEL_83;
          }
LABEL_79:
          v48 -= 48;
          if (v48 == v47)
          {
            uint64_t v21 = (void *)v168;
            goto LABEL_27;
          }
        }
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
        uint64_t v50 = *(void **)(v48 - 40);
        if (!v50) {
          goto LABEL_79;
        }
LABEL_83:
        *(void *)(v48 - 32) = v50;
        operator delete(v50);
        goto LABEL_79;
      }
LABEL_27:
      *((void *)&v168 + 1) = v47;
      operator delete(v21);
LABEL_28:
      long long v168 = *(_OWORD *)__p;
      int64_t v169 = v160;
      uint64_t v20 = (v20 + 1);
      if (v20 == v148) {
        goto LABEL_89;
      }
      continue;
    }
    break;
  }
  uint64_t v51 = sub_24C69662C();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
    sub_24C729F44(v20, v51);
  }

LABEL_89:
  uint64_t v52 = v168;
  if (!(void)v168) {
    goto LABEL_101;
  }
  uint64_t v53 = *((void *)&v168 + 1);
  uint64_t v54 = (void *)v168;
  if (*((void *)&v168 + 1) == (void)v168) {
    goto LABEL_100;
  }
  do
  {
    v56 = *(std::__shared_weak_count **)(v53 - 8);
    if (!v56 || atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v55 = *(void **)(v53 - 40);
      if (!v55) {
        goto LABEL_94;
      }
LABEL_93:
      *(void *)(v53 - 32) = v55;
      operator delete(v55);
      goto LABEL_94;
    }
    ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
    std::__shared_weak_count::__release_weak(v56);
    uint64_t v55 = *(void **)(v53 - 40);
    if (v55) {
      goto LABEL_93;
    }
LABEL_94:
    v53 -= 48;
  }
  while (v53 != v52);
  uint64_t v54 = (void *)v168;
LABEL_100:
  *((void *)&v168 + 1) = v52;
  operator delete(v54);
LABEL_101:
  sub_24C69C0F0(v17, (uint64_t)&v152);
  if (v151 && !atomic_fetch_add(&v151->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v151->__on_zero_shared)(v151);
    std::__shared_weak_count::__release_weak(v151);
    uint64_t v60 = (char *)v152;
    if (v153 == v152) {
      goto LABEL_200;
    }
LABEL_104:
    id v61 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v66 = v61;
    v67 = (_DWORD **)v152;
    v142 = (_DWORD **)v153;
    if (v152 == v153)
    {
LABEL_198:
      v122 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v62, (uint64_t)v66, v64, v65);
      v126 = objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v123, (uint64_t)v122, v124, v125);

      v127 = v126;
      goto LABEL_202;
    }
    id v145 = v61;
LABEL_107:
    HIBYTE(v160) = 0;
    LOBYTE(__p[0]) = 0;
    uint64_t v68 = v67;
    uint64_t v69 = *v67;
    v143 = v68;
    uint64_t v70 = v68[1];
    for (uint64_t i = v70; ; v70 = i)
    {
      if (v69 == v70)
      {
        MEMORY[0x2532F8850](&v168);
        LODWORD(v172) = 0x4000;
        std::locale::locale((std::locale *)&v172 + 1, (const std::locale *)&v168);
        sub_24C69EE20((unsigned __int8 *)__p, (const std::locale *)&v172);
        std::locale::~locale((std::locale *)&v172 + 1);
        std::locale::~locale((std::locale *)&v168);
        MEMORY[0x2532F8850]();
        LODWORD(v172) = 0x4000;
        std::locale::locale((std::locale *)&v172 + 1, (const std::locale *)&v168);
        sub_24C69F02C((char *)__p, (const std::locale *)&v172);
        std::locale::~locale((std::locale *)&v172 + 1);
        std::locale::~locale((std::locale *)&v168);
        v102 = NSString;
        int v103 = SHIBYTE(v160);
        v104 = __p[0];
        uint64_t v110 = objc_msgSend_defaultCStringEncoding(NSString, v105, v106, v107, v108);
        if (v103 >= 0) {
          objc_msgSend_stringWithCString_encoding_(v102, v109, (uint64_t)__p, v110, v111);
        }
        else {
        v112 = objc_msgSend_stringWithCString_encoding_(v102, v109, (uint64_t)v104, v110, v111);
        }
        v113 = [CSUCaptionResult alloc];
        LODWORD(v114) = *((_DWORD *)v143 + 6);
        unint64_t v118 = objc_msgSend_initWithCaption_score_(v113, v115, (uint64_t)v112, v116, v117, v114);
        objc_msgSend_addObject_(v66, v119, (uint64_t)v118, v120, v121);

        if (SHIBYTE(v160) < 0) {
          operator delete(__p[0]);
        }
        v67 = v143 + 4;
        if (v143 + 4 == v142) {
          goto LABEL_198;
        }
        goto LABEL_107;
      }
      if (*v69) {
        break;
      }
LABEL_108:
      ++v69;
    }
    v71 = v156->_procUtils;
    if (v71)
    {
      objc_msgSend_vocabulary(v71, v62, v63, v64, v65);
      v71 = (CSUCaptioningProcUtils *)v165;
    }
    else
    {
      v165 = 0;
      v166 = 0;
    }
    (*((void (**)(long long *__return_ptr))v71->super.isa + 5))(&v168);
    uint64_t v72 = HIBYTE(v169);
    if (v169 >= 0) {
      size_t v73 = 22;
    }
    else {
      size_t v73 = (v169 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    }
    if (v169 < 0) {
      uint64_t v72 = *((void *)&v168 + 1);
    }
    if (v73 != v72)
    {
      uint64_t v78 = &v168;
      if (v169 < 0) {
        uint64_t v78 = (long long *)v168;
      }
      *((unsigned char *)v78 + v72) = 32;
      uint64_t v79 = v72 + 1;
      if (SHIBYTE(v169) < 0) {
        *((void *)&v168 + 1) = v79;
      }
      else {
        HIBYTE(v169) = v79 & 0x7F;
      }
      unint64_t v80 = (char *)v78 + v79;
LABEL_145:
      *unint64_t v80 = 0;
      v173 = (_DWORD *)v169;
      long long v172 = v168;
      int64_t v169 = 0;
      long long v168 = 0uLL;
      int v85 = SHIBYTE(v173);
      v147 = (void *)v172;
      if (SHIBYTE(v173) >= 0) {
        v86 = &v172;
      }
      else {
        v86 = (long long *)v172;
      }
      if (SHIBYTE(v173) >= 0) {
        size_t v87 = HIBYTE(v173);
      }
      else {
        size_t v87 = *((void *)&v172 + 1);
      }
      if (v160 >= 0) {
        unint64_t v88 = 22;
      }
      else {
        unint64_t v88 = (v160 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if (v160 >= 0) {
        size_t v89 = HIBYTE(v160);
      }
      else {
        size_t v89 = (size_t)__p[1];
      }
      if (v88 - v89 >= v87)
      {
        if (!v87) {
          goto LABEL_184;
        }
        if (v160 >= 0) {
          v94 = __p;
        }
        else {
          v94 = (void **)__p[0];
        }
        memmove((char *)v94 + v89, v86, v87);
        size_t v95 = v89 + v87;
        if (SHIBYTE(v160) < 0) {
          __p[1] = (void *)(v89 + v87);
        }
        else {
          HIBYTE(v160) = v95 & 0x7F;
        }
        v96 = (char *)v94 + v95;
LABEL_183:
        char *v96 = 0;
LABEL_184:
        if (v85 < 0)
        {
          operator delete(v147);
          if ((SHIBYTE(v169) & 0x80000000) == 0)
          {
LABEL_186:
            uint64_t v101 = v166;
            if (!v166) {
              goto LABEL_108;
            }
            goto LABEL_190;
          }
        }
        else if ((SHIBYTE(v169) & 0x80000000) == 0)
        {
          goto LABEL_186;
        }
        operator delete((void *)v168);
        uint64_t v101 = v166;
        if (!v166) {
          goto LABEL_108;
        }
LABEL_190:
        if (!atomic_fetch_add(&v101->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v101->__on_zero_shared)(v101);
          std::__shared_weak_count::__release_weak(v101);
        }
        goto LABEL_108;
      }
      unint64_t v90 = v89 + v87;
      if (0x7FFFFFFFFFFFFFF6 - v88 < v89 + v87 - v88) {
        sub_24C6673C8();
      }
      if (v160 >= 0) {
        v91 = __p;
      }
      else {
        v91 = (void **)__p[0];
      }
      if (v88 >= 0x3FFFFFFFFFFFFFF3)
      {
        uint64_t v97 = 0x7FFFFFFFFFFFFFF6;
      }
      else
      {
        unint64_t v92 = 2 * v88;
        if (v90 > 2 * v88) {
          unint64_t v92 = v89 + v87;
        }
        if (v92 < 0x17)
        {
          size_t v93 = 23;
LABEL_178:
          unint64_t v99 = (char *)operator new(v93);
          unsigned int v100 = v99;
          if (v89) {
            memmove(v99, v91, v89);
          }
          memcpy(&v100[v89], v86, v87);
          if (v88 != 22) {
            operator delete(v91);
          }
          __p[1] = (void *)(v89 + v87);
          int64_t v160 = v93 | 0x8000000000000000;
          __p[0] = v100;
          v96 = &v100[v90];
          uint64_t v66 = v145;
          goto LABEL_183;
        }
        unint64_t v98 = (v92 & 0xFFFFFFFFFFFFFFF8) + 8;
        uint64_t v97 = v92 | 7;
        if (v97 == 23) {
          uint64_t v97 = v98;
        }
      }
      size_t v93 = v97 + 1;
      goto LABEL_178;
    }
    if (v73 == 0x7FFFFFFFFFFFFFF6) {
      sub_24C6673C8();
    }
    unint64_t v74 = v73 + 1;
    if (v169 >= 0) {
      v75 = &v168;
    }
    else {
      v75 = (long long *)v168;
    }
    if (v73 >= 0x3FFFFFFFFFFFFFF3)
    {
      size_t v77 = 0x7FFFFFFFFFFFFFF7;
    }
    else
    {
      unint64_t v76 = 2 * v73;
      if (v74 > 2 * v73) {
        unint64_t v76 = v73 + 1;
      }
      if (v76 >= 0x17)
      {
        unint64_t v81 = (v76 & 0xFFFFFFFFFFFFFFF8) + 8;
        uint64_t v82 = v76 | 7;
        if (v82 == 23) {
          uint64_t v82 = v81;
        }
        size_t v77 = v82 + 1;
      }
      else
      {
        size_t v77 = 23;
      }
    }
    v83 = operator new(v77);
    uint64_t v84 = v83;
    if (v73)
    {
      memmove(v83, v75, v73);
      v84[v73] = 32;
      if (v73 == 22) {
        goto LABEL_144;
      }
    }
    else
    {
      unsigned char *v83 = 32;
    }
    operator delete(v75);
LABEL_144:
    *((void *)&v168 + 1) = v73 + 1;
    int64_t v169 = v77 | 0x8000000000000000;
    *(void *)&long long v168 = v84;
    unint64_t v80 = &v84[v74];
    goto LABEL_145;
  }
  uint64_t v60 = (char *)v152;
  if (v153 != v152) {
    goto LABEL_104;
  }
LABEL_200:
  v127 = a3;
  if (a3)
  {
    uint64_t v66 = objc_msgSend_stringWithFormat_(NSString, v57, @"Captioning model failed to generate output at timestep %d", v58, v59, v155);
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v128, (uint64_t)v66, v129, v130);
    id v131 = (id)objc_claimAutoreleasedReturnValue();
    *a3 = v131;
    objc_msgSend_logInternalError_(CSUError, v132, (uint64_t)v131, v133, v134);
    v127 = 0;
LABEL_202:

    uint64_t v60 = (char *)v152;
  }
  if (v60)
  {
    v135 = v153;
    v136 = v60;
    if (v153 != v60)
    {
      v137 = v153;
      do
      {
        v139 = (void *)*((void *)v137 - 4);
        v137 -= 32;
        v138 = v139;
        if (v139)
        {
          *(v135 - 3) = v138;
          operator delete(v138);
        }
        v135 = v137;
      }
      while (v137 != v60);
      v136 = v152;
    }
    v153 = v60;
    operator delete(v136);
  }
  operator delete(v141);
  return v127;
}

- (id)getCaptionsAfterGreedyDecodingOnEncodedFeatures:(id *)a3
{
  uint64_t v5 = a3;
  v216[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_maxSeqLen(self->_configuration, a2, (uint64_t)a3, v3, v4);
  v212 = 0;
  v213 = 0;
  v214 = 0;
  v209 = 0;
  v210 = 0;
  double v12 = 0.0;
  v211 = 0;
  if (!v7)
  {
    v191 = 0;
    id v192 = 0;
    v127 = 0;
    goto LABEL_71;
  }
  unint64_t v13 = v7;
  uint64_t v14 = 0;
  id v192 = 0;
  v189 = v5;
  unint64_t v190 = v7;
  do
  {
    if (!self->_encodedFeaturesBufferE5) {
      goto LABEL_100;
    }
    decoderE5Net = self->_decoderE5Net;
    uint64_t v16 = objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v8, v9, v10, v11);
    v215[0] = v16;
    v216[0] = self->_encodedFeaturesBufferE5;
    uint64_t v21 = objc_msgSend_inputWordIdsTensorName(self->_configuration, v17, v18, v19, v20);
    v215[1] = v21;
    v216[1] = self->_inputTokensE5;
    v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v22, (uint64_t)v216, (uint64_t)v215, 2);
    LOBYTE(decoderE5Net) = objc_msgSend_setInputFeatures_error_(decoderE5Net, v24, (uint64_t)v23, (uint64_t)v5, v25);

    if ((decoderE5Net & 1) == 0)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v26, @"Decoder model failed to set input features", v27, v28);
      goto LABEL_99;
    }
    if (!objc_msgSend_predict_(self->_decoderE5Net, v26, (uint64_t)v5, v27, v28))
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v29, @"Decoder model failed to generate output", v31, v32);
LABEL_99:
      id v184 = (id)objc_claimAutoreleasedReturnValue();
      *uint64_t v5 = v184;
      objc_msgSend_logInternalError_(CSUError, v185, (uint64_t)v184, v186, v187);
LABEL_100:
      v180 = 0;
      goto LABEL_101;
    }
    int v33 = self->_decoderE5Net;
    float v34 = objc_msgSend_outputWordProbsTensorName(self->_configuration, v29, v30, v31, v32);
    uint64_t v38 = objc_msgSend_getOutputFor_(v33, v35, (uint64_t)v34, v36, v37);

    uint64_t v43 = objc_msgSend_configuration(self, v39, v40, v41, v42);
    LODWORD(v34) = objc_msgSend_saveDecoderFeatures(v43, v44, v45, v46, v47);

    if (v34) {
      id v192 = v38;
    }
    else {
      id v192 = 0;
    }
    uint64_t v52 = objc_msgSend_shape(v38, v48, v49, v50, v51);
    uint64_t v57 = objc_msgSend_count(v52, v53, v54, v55, v56);

    v62 = objc_msgSend_shape(v38, v58, v59, v60, v61);
    uint64_t v66 = objc_msgSend_objectAtIndex_(v62, v63, v57 - 1, v64, v65);
    uint64_t v71 = objc_msgSend_unsignedLongValue(v66, v67, v68, v69, v70);

    v205 = 0;
    v206 = &v205;
    uint64_t v207 = 0x2020000000;
    uint64_t v208 = 0;
    v201 = 0;
    v202 = (std::__shared_weak_count *)&v201;
    uint64_t v203 = 0x2020000000;
    uint64_t v204 = v71 + 1;
    v196[0] = MEMORY[0x263EF8330];
    v196[1] = 3221225472;
    v196[2] = sub_24C69BE44;
    v196[3] = &unk_2652E8058;
    id v72 = v38;
    id v197 = v72;
    v198 = &v205;
    v199 = &v201;
    uint64_t v200 = v14;
    objc_msgSend_getBytesWithHandler_(v72, v73, (uint64_t)v196, v74, v75);
    uint64_t v79 = v202[1].__vftable;
    if (v79)
    {
      unint64_t v80 = v202[1].__vftable;
      if (v14 + 1 < v13)
      {
        inputTokensE5 = self->_inputTokensE5;
        v195[0] = MEMORY[0x263EF8330];
        v195[1] = 3221225472;
        v195[2] = sub_24C69BF54;
        v195[3] = &unk_2652E8080;
        v195[4] = &v201;
        v195[5] = v14;
        objc_msgSend_getMutableBytesWithHandler_(inputTokensE5, v76, (uint64_t)v195, v77, v78);
        unint64_t v80 = v202[1].__vftable;
      }
      uint64_t v82 = v213;
      if (v213 < v214)
      {
        *(_DWORD *)v213 = v80;
        uint64_t v83 = (uint64_t)(v82 + 4);
        goto LABEL_35;
      }
      uint64_t v84 = v212;
      uint64_t v85 = (v213 - v212) >> 2;
      unint64_t v86 = v85 + 1;
      if ((unint64_t)(v85 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v87 = v214 - v212;
      if ((v214 - v212) >> 1 > v86) {
        unint64_t v86 = v87 >> 1;
      }
      if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v88 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v88 = v86;
      }
      if (v88)
      {
        if (v88 >> 62) {
          sub_24C66DB48();
        }
        unint64_t v89 = v88;
        unint64_t v90 = operator new(4 * v88);
        unint64_t v88 = v89;
        v91 = &v90[4 * v85];
        *(_DWORD *)v91 = v80;
        uint64_t v83 = (uint64_t)(v91 + 4);
        if (v82 != v84)
        {
LABEL_23:
          unint64_t v92 = v82 - 4 - v84;
          if (v92 < 0x2C) {
            goto LABEL_114;
          }
          if ((unint64_t)(v84 - v90) < 0x20) {
            goto LABEL_114;
          }
          uint64_t v93 = (v92 >> 2) + 1;
          uint64_t v94 = 4 * (v93 & 0x7FFFFFFFFFFFFFF8);
          size_t v95 = &v82[-v94];
          v91 -= v94;
          v96 = &v90[4 * v85 - 16];
          uint64_t v97 = v82 - 16;
          uint64_t v98 = v93 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v99 = *(_OWORD *)v97;
            *(v96 - 1) = *((_OWORD *)v97 - 1);
            _OWORD *v96 = v99;
            v96 -= 2;
            v97 -= 32;
            v98 -= 8;
          }
          while (v98);
          uint64_t v82 = v95;
          if (v93 != (v93 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_114:
            do
            {
              int v100 = *((_DWORD *)v82 - 1);
              v82 -= 4;
              *((_DWORD *)v91 - 1) = v100;
              v91 -= 4;
            }
            while (v82 != v84);
          }
        }
      }
      else
      {
        unint64_t v90 = 0;
        v91 = (char *)(4 * v85);
        *(_DWORD *)(4 * v85) = v80;
        uint64_t v83 = 4 * v85 + 4;
        if (v82 != v84) {
          goto LABEL_23;
        }
      }
      v212 = v91;
      v214 = &v90[4 * v88];
      if (v84) {
        operator delete(v84);
      }
      uint64_t v5 = v189;
LABEL_35:
      v213 = (char *)v83;
      _H0 = *(_WORD *)v206[3];
      __asm { FCVT            S11, H0 }
      uint64_t v107 = v210;
      if (v210 < v211)
      {
        *(_DWORD *)v210 = _S11;
        uint64_t v108 = (uint64_t)(v107 + 1);
LABEL_58:
        v210 = (float *)v108;
        unint64_t v13 = v190;
        goto LABEL_59;
      }
      v109 = v209;
      uint64_t v110 = ((char *)v210 - (char *)v209) >> 2;
      unint64_t v111 = v110 + 1;
      if ((unint64_t)(v110 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v112 = (char *)v211 - (char *)v209;
      if (((char *)v211 - (char *)v209) >> 1 > v111) {
        unint64_t v111 = v112 >> 1;
      }
      if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v113 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v113 = v111;
      }
      if (v113)
      {
        if (v113 >> 62) {
          sub_24C66DB48();
        }
        double v114 = operator new(4 * v113);
        v115 = (float32x4_t *)&v114[4 * v110];
        v115->i32[0] = _S11;
        uint64_t v108 = (uint64_t)v115->i64 + 4;
        if (v107 != (float *)v109)
        {
LABEL_46:
          unint64_t v116 = (char *)(v107 - 1) - (char *)v109;
          if (v116 < 0x2C) {
            goto LABEL_115;
          }
          if ((unint64_t)((char *)v109 - v114) < 0x20) {
            goto LABEL_115;
          }
          uint64_t v117 = (v116 >> 2) + 1;
          uint64_t v118 = 4 * (v117 & 0x7FFFFFFFFFFFFFF8);
          v119 = &v107[v118 / 0xFFFFFFFFFFFFFFFCLL];
          v115 = (float32x4_t *)((char *)v115 - v118);
          uint64_t v120 = &v114[4 * v110 - 16];
          uint64_t v121 = v107 - 4;
          uint64_t v122 = v117 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v123 = *(_OWORD *)v121;
            *(v120 - 1) = *((_OWORD *)v121 - 1);
            *uint64_t v120 = v123;
            v120 -= 2;
            v121 -= 8;
            v122 -= 8;
          }
          while (v122);
          uint64_t v107 = v119;
          if (v117 != (v117 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_115:
            do
            {
              __int32 v124 = *((_DWORD *)v107-- - 1);
              v115[-1].i32[3] = v124;
              v115 = (float32x4_t *)((char *)v115 - 4);
            }
            while (v107 != (float *)v109);
          }
        }
      }
      else
      {
        double v114 = 0;
        v115 = (float32x4_t *)(4 * v110);
        *(_DWORD *)(4 * v110) = _S11;
        uint64_t v108 = 4 * v110 + 4;
        if (v107 != (float *)v109) {
          goto LABEL_46;
        }
      }
      v209 = v115;
      v211 = (float *)&v114[4 * v113];
      if (v109) {
        operator delete(v109);
      }
      uint64_t v5 = v189;
      goto LABEL_58;
    }
LABEL_59:
    BOOL v125 = v79 == 0;

    _Block_object_dispose(&v201, 8);
    _Block_object_dispose(&v205, 8);

    char v126 = ++v14 == v13 || v125;
  }
  while ((v126 & 1) == 0);
  v127 = v210;
  v191 = v209;
  if (v209 != (float32x4_t *)v210)
  {
    unint64_t v128 = (char *)v210 - (char *)v209 - 4;
    double v12 = 0.0;
    uint64_t v129 = (float *)v209;
    if (v128 < 0x1C) {
      goto LABEL_116;
    }
    uint64_t v130 = (v128 >> 2) + 1;
    uint64_t v129 = &v209->f32[v130 & 0x7FFFFFFFFFFFFFF8];
    id v131 = v209 + 1;
    uint64_t v132 = v130 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      float32x4_t v133 = v131[-1];
      float64x2_t v134 = vcvt_hight_f64_f32(v133);
      float64x2_t v135 = vcvtq_f64_f32(*(float32x2_t *)v133.f32);
      float64x2_t v136 = vcvt_hight_f64_f32(*v131);
      float64x2_t v137 = vcvtq_f64_f32(*(float32x2_t *)v131->f32);
      double v12 = v12
          + v135.f64[0]
          + v135.f64[1]
          + v134.f64[0]
          + v134.f64[1]
          + v137.f64[0]
          + v137.f64[1]
          + v136.f64[0]
          + v136.f64[1];
      v131 += 2;
      v132 -= 8;
    }
    while (v132);
    if (v130 != (v130 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_116:
      do
      {
        float v138 = *v129++;
        double v12 = v12 + v138;
      }
      while (v129 != v210);
    }
  }
LABEL_71:
  v143 = objc_msgSend_array(MEMORY[0x263EFF980], v8, v9, v10, v11);
  v144 = v212;
  id v145 = v213;
  if (v212 != v213)
  {
    while (*(_DWORD *)v144)
    {
      procUtils = self->_procUtils;
      if (procUtils)
      {
        objc_msgSend_vocabulary(procUtils, v139, v140, v141, v142);
        procUtils = v205;
      }
      else
      {
        v205 = 0;
        v206 = 0;
      }
      (*(void (**)(void **__return_ptr))(*(void *)procUtils + 40))(&__p);
      if (v194 < 0)
      {
        operator delete(__p);
        v151 = (std::__shared_weak_count *)v206;
        if (!v206) {
          goto LABEL_83;
        }
      }
      else
      {
        v151 = (std::__shared_weak_count *)v206;
        if (!v206)
        {
LABEL_83:
          v152 = NSString;
          v153 = self->_procUtils;
          if (v153) {
            goto LABEL_84;
          }
LABEL_86:
          v201 = 0;
          v202 = 0;
          goto LABEL_87;
        }
      }
      if (atomic_fetch_add(&v151->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_83;
      }
      ((void (*)(std::__shared_weak_count *))v151->__on_zero_shared)(v151);
      std::__shared_weak_count::__release_weak(v151);
      v152 = NSString;
      v153 = self->_procUtils;
      if (!v153) {
        goto LABEL_86;
      }
LABEL_84:
      objc_msgSend_vocabulary(v153, v147, v148, v149, v150);
      v153 = v201;
LABEL_87:
      (*((void (**)(void **__return_ptr))v153->super.isa + 5))(&v205);
      if (v207 >= 0) {
        objc_msgSend_stringWithUTF8String_(v152, v154, (uint64_t)&v205, v155, v156);
      }
      else {
      v157 = objc_msgSend_stringWithUTF8String_(v152, v154, (uint64_t)v205, v155, v156);
      }
      objc_msgSend_addObject_(v143, v158, (uint64_t)v157, v159, v160);

      if (SHIBYTE(v207) < 0)
      {
        operator delete(v205);
        v161 = v202;
        if (!v202) {
          goto LABEL_73;
        }
      }
      else
      {
        v161 = v202;
        if (!v202) {
          goto LABEL_73;
        }
      }
      if (!atomic_fetch_add(&v161->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v161->__on_zero_shared)(v161);
        std::__shared_weak_count::__release_weak(v161);
      }
LABEL_73:
      v144 += 4;
      if (v144 == v145) {
        break;
      }
      continue;
    }
  }
  unsigned __int8 v162 = objc_msgSend_componentsJoinedByString_(v143, v139, @" ", v141, v142);
  uint64_t v163 = [CSUCaptionResult alloc];
  double v164 = v12 / (double)(unint64_t)(((char *)v127 - (char *)v191) >> 2);
  *(float *)&double v164 = v164;
  long long v168 = objc_msgSend_initWithCaption_score_(v163, v165, (uint64_t)v162, v166, v167, v164);
  id v169 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend_addObject_(v169, v170, (uint64_t)v168, v171, v172);
  v176 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v173, (uint64_t)v169, v174, v175);
  v180 = objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v177, (uint64_t)v176, v178, v179);

  objc_msgSend_setDecoderFeaturesMLMultiArray_(v180, v181, (uint64_t)v192, v182, v183);
LABEL_101:

  if (v209) {
    operator delete(v209);
  }
  if (v212) {
    operator delete(v212);
  }
  return v180;
}

- (id)postProcessResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_postProcessingHandler(self->_procUtils, v7, v8, v9, v10);

  if (v11)
  {
    uint64_t v16 = objc_msgSend_postProcessingHandler(self->_procUtils, v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_genderOptionForBeamSearch(self->_procUtils, v17, v18, v19, v20);
    objc_msgSend_postProcessResults_genderOption_error_(v16, v22, (uint64_t)v6, v21, (uint64_t)a4);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v24 = sub_24C69662C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_24C729FFC();
    }

    id v23 = v6;
  }

  return v23;
}

- (CSUCaptioningProcUtils)procUtils
{
  return self->_procUtils;
}

- (CSUImageCaptioningDecoderConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_procUtils, 0);
  objc_storeStrong((id *)&self->_encodedFeaturesBufferE5, 0);
  objc_storeStrong((id *)&self->_inputTokensE5, 0);
  objc_storeStrong((id *)&self->_bridgeE5Net, 0);
  objc_storeStrong((id *)&self->_decoderE5Net, 0);
}

@end