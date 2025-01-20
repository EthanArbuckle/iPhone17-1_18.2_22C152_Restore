@interface CSUImageCaptioningDecoderE1
- (BOOL)compareTensorShapesForShape1:(const void *)a3 Shape2:(unint64_t)a4[5] rank:(unint64_t)a5;
- (BOOL)loadBridge:(id *)a3;
- (BOOL)loadDecoder:(id *)a3;
- (BOOL)loadPostProcUtilsWithBeamWidth:(int)a3 error:(id *)a4;
- (BOOL)loadResources:(id *)a3;
- (BOOL)populateInputBufferWithBridgeFeatures:(id)a3 WithError:(id *)a4;
- (BOOL)reshapeEncodedFeaturesBufferForBridgeNet:(id)a3 WithError:(id *)a4;
- (CSUCaptioningProcUtils)procUtils;
- (CSUImageCaptioningDecoderConfiguration)configuration;
- (CSUImageCaptioningDecoderE1)initWithConfiguration:(id)a3;
- (id).cxx_construct;
- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6;
- (id)getBridgeLayerOutput:(id)a3 error:(id *)a4;
- (id)getCaptionsAfterBeamSearchDecodingOnEncodedFeatures;
- (id)getCaptionsAfterGreedyDecodingOnEncodedFeatures;
- (id)postProcessResults:(id)a3 error:(id *)a4;
- (vector<float,)nextTokensForInputs:(CSUImageCaptioningDecoderE1 *)self AndforMaskPosition:(SEL)a3;
@end

@implementation CSUImageCaptioningDecoderE1

- (CSUImageCaptioningDecoderE1)initWithConfiguration:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CSUImageCaptioningDecoderE1;
  v10 = [(CSUImageCaptioningDecoderE1 *)&v31 init];
  if (v10)
  {
    if (objc_msgSend_revision(v5, v6, v7, v8, v9) != 1)
    {
LABEL_17:
      objc_storeStrong((id *)&v10->_configuration, a3);
      v25 = v10;
      goto LABEL_18;
    }
    objc_msgSend_supportedComputeDevices(v5, v11, v12, v13, v14);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v27, (uint64_t)v32, 16);
    if (v18)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * v20);
          if (v21)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend_setComputeDevice_(v5, v17, v21, v22, v23, (void)v27);

              goto LABEL_17;
            }
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v27, (uint64_t)v32, 16);
      }
      while (v18);
    }

    v24 = sub_24C69662C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_24C72A684(v24);
    }
  }
  v25 = 0;
LABEL_18:

  return v25;
}

- (BOOL)loadBridge:(id *)a3
{
  v6 = objc_msgSend_bridgeNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);

  if (v6 && !self->_bridgeNet.__ptr_.__value_)
  {
    objc_msgSend_bridgeNetworkPath(self->_configuration, v7, v8, v9, v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
    objc_msgSend_espressoExecutionEngine(self->_configuration, v16, v17, v18, v19, 0, 0, 0);
    sub_24C669758();
  }
  return 1;
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
  if (self->_decoderNet.__ptr_.__value_) {
    return 1;
  }
  if (objc_msgSend_loadPostProcUtilsWithBeamWidth_error_(self, a2, 3, (uint64_t)a3, v3))
  {
    objc_msgSend_decoderNetworkPath(self->_configuration, v7, v8, v9, v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
    objc_msgSend_espressoExecutionEngine(self->_configuration, v16, v17, v18, v19);
    sub_24C669758();
  }
  return 0;
}

- (BOOL)loadResources:(id *)a3
{
  if (self->_decoderNet.__ptr_.__value_)
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
  value = self->_bridgeNet.__ptr_.__value_;
  if (value) {
    BOOL result = Decoder;
  }
  else {
    BOOL result = 0;
  }
  if (!value && ((Decoder ^ 1) & 1) == 0)
  {
    return objc_msgSend_loadBridge_(self, v9, (uint64_t)a3, v10, v11);
  }
  return result;
}

- (BOOL)compareTensorShapesForShape1:(const void *)a3 Shape2:(unint64_t)a4[5] rank:(unint64_t)a5
{
  if (!a5) {
    return 1;
  }
  if (*(void *)(*(void *)a3 + 8 * (4 - a5)) != *a4) {
    return 0;
  }
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = v5;
    if (a5 - 1 == v5) {
      break;
    }
    uint64_t v7 = *(void *)(*(void *)a3 - 8 * a5 + 40 + 8 * v5);
    unint64_t v8 = a4[++v5];
  }
  while (v7 == v8);
  return v6 + 1 >= a5;
}

- (vector<float,)nextTokensForInputs:(CSUImageCaptioningDecoderE1 *)self AndforMaskPosition:(SEL)a3
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  begin = self->_inputTokens.shape_.sizes_.__begin_;
  end = self->_inputTokens.shape_.sizes_.__end_;
  if (begin == end)
  {
    uint64_t v13 = 0;
    v113 = 0;
    v114 = 0;
    v115 = 0;
    uint64_t v14 = *(const void **)a4;
    uint64_t v15 = *((void *)a4 + 1);
    size_t v16 = v15 - *(void *)a4;
    if (v15 == *(void *)a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unint64_t v10 = (char *)end - (char *)begin - 8;
  if (v10 < 0x38)
  {
    int v11 = 1;
    uint64_t v12 = self->_inputTokens.shape_.sizes_.__begin_;
    do
    {
LABEL_9:
      int v27 = *(_DWORD *)v12++;
      v11 *= v27;
    }
    while (v12 != end);
    goto LABEL_10;
  }
  uint64_t v17 = (v10 >> 3) + 1;
  uint64_t v12 = &begin[v17 & 0x3FFFFFFFFFFFFFF8];
  uint64_t v18 = (int32x4_t *)(begin + 4);
  v19.i64[0] = 0x100000001;
  v19.i64[1] = 0x100000001;
  uint64_t v20 = v17 & 0x3FFFFFFFFFFFFFF8;
  v21.i64[0] = 0x100000001;
  v21.i64[1] = 0x100000001;
  do
  {
    int32x4_t v23 = v18[-2];
    int32x4_t v22 = v18[-1];
    int32x4_t v25 = *v18;
    int32x4_t v24 = v18[1];
    v18 += 4;
    int32x4_t v19 = vmulq_s32(v19, vuzp1q_s32(v23, v22));
    int32x4_t v21 = vmulq_s32(v21, vuzp1q_s32(v25, v24));
    v20 -= 8;
  }
  while (v20);
  int8x16_t v26 = (int8x16_t)vmulq_s32(v21, v19);
  *(int32x2_t *)v26.i8 = vmul_s32(*(int32x2_t *)v26.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL));
  int v11 = v26.i32[0] * v26.i32[1];
  if (v17 != (v17 & 0x3FFFFFFFFFFFFFF8)) {
    goto LABEL_9;
  }
LABEL_10:
  v113 = 0;
  v114 = 0;
  v115 = 0;
  if (!v11)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(const void **)a4;
    uint64_t v103 = *((void *)a4 + 1);
    size_t v16 = v103 - *(void *)a4;
    if (v103 == *(void *)a4) {
      goto LABEL_14;
    }
LABEL_13:
    memmove(v13, v14, v16);
    goto LABEL_14;
  }
  uint64_t v28 = v11;
  if (v11 < 0) {
    sub_24C667470();
  }
  size_t v29 = 4 * v11;
  uint64_t v13 = (uint32x4_t *)operator new(v29);
  v113 = v13;
  v115 = (uint32x4_t *)((char *)v13 + 4 * v28);
  bzero(v13, v29);
  v114 = v115;
  uint64_t v14 = *(const void **)a4;
  uint64_t v30 = *((void *)a4 + 1);
  size_t v16 = v30 - *(void *)a4;
  if (v30 != *(void *)a4) {
    goto LABEL_13;
  }
LABEL_14:
  if (self->_inputTokens.type_ != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v31 = (*(uint64_t (**)(TensorStorage *, const void *, size_t))(*(void *)self->_inputTokens.storage_.__ptr_
                                                                         + 24))(self->_inputTokens.storage_.__ptr_, v14, v16);
  v36 = v114;
  if (v13 != v114)
  {
    unint64_t v37 = (char *)v114 - (char *)v13 - 4;
    if (v37 < 0x1C)
    {
      v38 = (float *)v31;
      v39 = (unsigned int *)v13;
      do
      {
LABEL_21:
        unsigned int v46 = *v39++;
        *v38++ = (float)v46;
      }
      while (v39 != (unsigned int *)v36);
      goto LABEL_22;
    }
    uint64_t v40 = (v37 >> 2) + 1;
    uint64_t v41 = v40 & 0x7FFFFFFFFFFFFFF8;
    v38 = (float *)(v31 + v41 * 4);
    v39 = &v13->u32[v41];
    v42 = v13 + 1;
    v43 = (float32x4_t *)(v31 + 16);
    uint64_t v44 = v40 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      float32x4_t v45 = vcvtq_f32_u32(*v42);
      v43[-1] = vcvtq_f32_u32(v42[-1]);
      float32x4_t *v43 = v45;
      v42 += 2;
      v43 += 2;
      v44 -= 8;
    }
    while (v44);
    if (v40 != (v40 & 0x7FFFFFFFFFFFFFF8)) {
      goto LABEL_21;
    }
  }
LABEL_22:
  value = self->_decoderNet.__ptr_.__value_;
  objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v32, v33, v34, v35);
  id v48 = objc_claimAutoreleasedReturnValue();
  v53 = (const char *)objc_msgSend_UTF8String(v48, v49, v50, v51, v52);
  size_t v54 = strlen(v53);
  if (v54 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v55 = v54;
  if (v54 >= 0x17)
  {
    uint64_t v57 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v54 | 7) != 0x17) {
      uint64_t v57 = v54 | 7;
    }
    uint64_t v58 = v57 + 1;
    p_dst = (long long *)operator new(v57 + 1);
    *((void *)&__dst + 1) = v55;
    unint64_t v109 = v58 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_29;
  }
  HIBYTE(v109) = v54;
  p_dst = &__dst;
  if (v54) {
LABEL_29:
  }
    memmove(p_dst, v53, v55);
  *((unsigned char *)p_dst + v55) = 0;
  sub_24C67CADC((uint64_t)&v116, &__dst, (uint64_t)&self->_encodedFeaturesBuffer);
  objc_msgSend_inputWordIdsTensorName(self->_configuration, v59, v60, v61, v62);
  id v63 = objc_claimAutoreleasedReturnValue();
  v68 = (const char *)objc_msgSend_UTF8String(v63, v64, v65, v66, v67);
  size_t v69 = strlen(v68);
  if (v69 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v70 = v69;
  if (v69 >= 0x17)
  {
    uint64_t v72 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v69 | 7) != 0x17) {
      uint64_t v72 = v69 | 7;
    }
    uint64_t v73 = v72 + 1;
    v71 = operator new(v72 + 1);
    *((void *)&v106 + 1) = v70;
    unint64_t v107 = v73 | 0x8000000000000000;
    *(void *)&long long v106 = v71;
  }
  else
  {
    HIBYTE(v107) = v69;
    v71 = &v106;
    if (!v69) {
      goto LABEL_38;
    }
  }
  memmove(v71, v68, v70);
LABEL_38:
  *((unsigned char *)v71 + v70) = 0;
  sub_24C67CADC((uint64_t)v122, &v106, (uint64_t)&self->_inputTokens);
  memset(v110, 0, sizeof(v110));
  int v111 = 1065353216;
  sub_24C672C8C((uint64_t)v110, (uint64_t)&v116, &v116);
  sub_24C672C8C((uint64_t)v110, (uint64_t)v122, (long long *)v122);
  sub_24C66D4AC((uint64_t)value, (uint64_t)v110, (uint64_t)v112);
  sub_24C6717DC((uint64_t)v110);
  v124 = &unk_26FEDD950;
  v74 = v127;
  if (v127 && !atomic_fetch_add(&v127->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
    std::__shared_weak_count::__release_weak(v74);
  }
  if (__p)
  {
    v126 = __p;
    operator delete(__p);
  }
  if (v123 < 0) {
    operator delete(v122[0]);
  }
  v118 = &unk_26FEDD950;
  v75 = v121;
  if (v121 && !atomic_fetch_add(&v121->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
    std::__shared_weak_count::__release_weak(v75);
  }
  if (v119)
  {
    v120 = v119;
    operator delete(v119);
  }
  if (SHIBYTE(v117) < 0)
  {
    operator delete((void *)v116);
    if ((SHIBYTE(v107) & 0x80000000) == 0) {
      goto LABEL_52;
    }
  }
  else if ((SHIBYTE(v107) & 0x80000000) == 0)
  {
    goto LABEL_52;
  }
  operator delete((void *)v106);
LABEL_52:

  if (SHIBYTE(v109) < 0) {
    operator delete((void *)__dst);
  }

  objc_msgSend_outputWordProbsTensorName(self->_configuration, v76, v77, v78, v79);
  id v80 = objc_claimAutoreleasedReturnValue();
  v85 = (const char *)objc_msgSend_UTF8String(v80, v81, v82, v83, v84);
  size_t v86 = strlen(v85);
  if (v86 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v87 = v86;
  if (v86 >= 0x17)
  {
    uint64_t v89 = (v86 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v86 | 7) != 0x17) {
      uint64_t v89 = v86 | 7;
    }
    uint64_t v90 = v89 + 1;
    v88 = operator new(v89 + 1);
    *((void *)&v116 + 1) = v87;
    unint64_t v117 = v90 | 0x8000000000000000;
    *(void *)&long long v116 = v88;
    goto LABEL_61;
  }
  HIBYTE(v117) = v86;
  v88 = &v116;
  if (v86) {
LABEL_61:
  }
    memmove(v88, v85, v87);
  *((unsigned char *)v88 + v87) = 0;
  v91 = sub_24C66F168(v112, (uint64_t)&v116);
  if (!v91) {
    sub_24C66DE30("unordered_map::at: key not found");
  }
  uint64_t v92 = v91[10];
  if (SHIBYTE(v117) < 0) {
    operator delete((void *)v116);
  }

  uint64_t v93 = *(void *)(v92 + 8);
  uint64_t v94 = *(void *)(v92 + 88);
  uint64_t v95 = v94 * a5;
  uint64_t v96 = v94 * (a5 + 1);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (v96 != v95)
  {
    v97 = (const void *)(v93 + 4 * v95);
    uint64_t v98 = v93 + 4 * v96;
    int64_t v99 = v98 - (void)v97;
    if (v98 - (void)v97 < 0) {
      sub_24C667470();
    }
    v100 = (float *)operator new(v98 - (void)v97);
    retstr->__begin_ = v100;
    v101 = &v100[v99 >> 2];
    retstr->__end_cap_.__value_ = v101;
    memcpy(v100, v97, v99);
    retstr->__end_ = v101;
  }
  sub_24C6717DC((uint64_t)v112);
  BOOL result = (vector<float, std::allocator<float>> *)v113;
  if (v113)
  {
    v114 = (uint32x4_t *)v113;
    operator delete(v113);
  }
  return result;
}

- (BOOL)populateInputBufferWithBridgeFeatures:(id)a3 WithError:(id *)a4
{
  v98[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = sub_24C6C9D10(v6);
  LOWORD(v81) = 1;
  sub_24C66FCBC((uint64_t)&v90, v7, &v81);
  size_t v87 = 0;
  v88 = 0;
  uint64_t v89 = 0;
  uint64_t v12 = (int32x4_t *)v92;
  uint64_t v13 = v93;
  int64_t v14 = v93 - (unsigned char *)v92;
  if (v93 == v92)
  {
    uint64_t v18 = 0;
    goto LABEL_11;
  }
  if (v14 < 0) {
    sub_24C667470();
  }
  size_t v87 = operator new(v93 - (unsigned char *)v92);
  v88 = v87;
  uint64_t v15 = (char *)v87 + 8 * (v14 >> 3);
  uint64_t v89 = v15;
  memcpy(v87, v12, v14);
  v88 = v15;
  if ((unint64_t)(v14 - 8) >= 0x38)
  {
    unint64_t v19 = ((unint64_t)(v14 - 8) >> 3) + 1;
    uint64_t v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    uint64_t v20 = v12 + 2;
    v21.i64[0] = 0x100000001;
    v21.i64[1] = 0x100000001;
    uint64_t v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    v23.i64[0] = 0x100000001;
    v23.i64[1] = 0x100000001;
    do
    {
      int32x4_t v25 = v20[-2];
      int32x4_t v24 = v20[-1];
      int32x4_t v27 = *v20;
      int32x4_t v26 = v20[1];
      v20 += 4;
      int32x4_t v21 = vmulq_s32(v21, vuzp1q_s32(v25, v24));
      int32x4_t v23 = vmulq_s32(v23, vuzp1q_s32(v27, v26));
      v22 -= 8;
    }
    while (v22);
    int8x16_t v28 = (int8x16_t)vmulq_s32(v23, v21);
    *(int32x2_t *)v28.i8 = vmul_s32(*(int32x2_t *)v28.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
    int v16 = v28.i32[0] * v28.i32[1];
    if (v19 == (v19 & 0x3FFFFFFFFFFFFFF8)) {
      goto LABEL_10;
    }
  }
  else
  {
    int v16 = 1;
    uint64_t v17 = (char *)v12;
  }
  do
  {
    int v29 = *(_DWORD *)v17;
    v17 += 8;
    v16 *= v29;
  }
  while (v17 != v13);
LABEL_10:
  uint64_t v18 = v16;
LABEL_11:
  objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v8, v9, v10, v11);
  id v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v30, v31, v32, v33, v34);
  espresso_network_query_blob_shape();

  if (!v96)
  {
    uint64_t v38 = 1;
    goto LABEL_20;
  }
  if (v96 == 1)
  {
    unint64_t v37 = 0;
    uint64_t v38 = 1;
LABEL_18:
    uint64_t v43 = v96 - v37;
    uint64_t v44 = (uint64_t *)&v97[8 * v37];
    do
    {
      uint64_t v45 = *v44++;
      v38 *= v45;
      --v43;
    }
    while (v43);
    goto LABEL_20;
  }
  unint64_t v37 = v96 & 0xFFFFFFFFFFFFFFFELL;
  v39 = v98;
  uint64_t v40 = 1;
  unint64_t v41 = v96 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v42 = 1;
  do
  {
    v40 *= *(v39 - 1);
    v42 *= *v39;
    v39 += 2;
    v41 -= 2;
  }
  while (v41);
  uint64_t v38 = v42 * v40;
  if (v96 != v37) {
    goto LABEL_18;
  }
LABEL_20:
  if (v18 != v38)
  {
    if (a4)
    {
      v49 = objc_msgSend_stringWithFormat_(NSString, v35, @"the bridge features fed to computeDecodedCaptionsForFeatures has %zu elements and the decoder model is expected to have %zu elements for the node corresponding to attention features", v36, v96, v18, v38);
      objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v50, (uint64_t)v49, v51, v52);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_54;
  }
  if (objc_msgSend_compareTensorShapesForShape1_Shape2_rank_(self, v35, (uint64_t)&v87, (uint64_t)v97, v96))
  {
    self->_encodedFeaturesBuffer.type_ = v91;
    if (&self->_encodedFeaturesBuffer != (EspressoTensor *)&v90) {
      sub_24C670F38(&self->_encodedFeaturesBuffer.shape_.sizes_.__begin_, (char *)v92, v93, (v93 - (unsigned char *)v92) >> 3);
    }
    v47 = v94;
    unsigned int v46 = (__shared_weak_count *)v95;
    if (v95) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v95 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
    self->_encodedFeaturesBuffer.storage_.__ptr_ = v47;
    self->_encodedFeaturesBuffer.storage_.__cntrl_ = v46;
    if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    goto LABEL_49;
  }
  sub_24C6C9DF4((uint64_t)&v90, (uint64_t)&v81);
  espresso_buffer_pack_tensor_shape();
  uint64_t v54 = *((void *)v85 + 13);
  uint64_t v53 = *((void *)v85 + 14);
  uint64_t v56 = *((void *)v85 + 11);
  uint64_t v55 = *((void *)v85 + 12);
  uint64_t v57 = operator new(0x20uLL);
  uint64_t v79 = v57 + 4;
  id v80 = v57 + 4;
  *uint64_t v57 = v53;
  v57[1] = v54;
  v57[2] = v55;
  v57[3] = v56;
  __p = v57;
  char v62 = objc_msgSend_compareTensorShapesForShape1_Shape2_rank_(self, v58, (uint64_t)&__p, (uint64_t)v97, v96);
  if (v62)
  {
    self->_encodedFeaturesBuffer.type_ = v82;
    if (&self->_encodedFeaturesBuffer != (EspressoTensor *)&v81) {
      sub_24C670F38(&self->_encodedFeaturesBuffer.shape_.sizes_.__begin_, (char *)v83, v84, (v84 - (unsigned char *)v83) >> 3);
    }
    v64 = v85;
    id v63 = (__shared_weak_count *)v86;
    if (v86) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v86 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v65 = self->_encodedFeaturesBuffer.storage_.__cntrl_;
    self->_encodedFeaturesBuffer.storage_.__ptr_ = v64;
    self->_encodedFeaturesBuffer.storage_.__cntrl_ = v63;
    if (v65 && !atomic_fetch_add((atomic_ullong *volatile)v65 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)v65 + 16))(v65);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v65);
    }
  }
  else if (a4)
  {
    uint64_t v66 = objc_msgSend_stringWithFormat_(NSString, v59, @"the bridge features fed to computeDecodedCaptionsForFeatures has same number of elements as desired by attention-features-based-input-node for decoder model but even after reshape, their shapes do not match", v60, v61);
    objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v67, (uint64_t)v66, v68, v69);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (__p)
  {
    uint64_t v79 = __p;
    operator delete(__p);
  }
  v81 = &unk_26FEDD950;
  size_t v70 = (std::__shared_weak_count *)v86;
  if (v86 && !atomic_fetch_add((atomic_ullong *volatile)(v86 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
    std::__shared_weak_count::__release_weak(v70);
  }
  if (v83)
  {
    uint64_t v84 = (char *)v83;
    operator delete(v83);
  }
  if ((v62 & 1) == 0)
  {
LABEL_54:
    BOOL v73 = 0;
    v74 = v87;
    if (!v87) {
      goto LABEL_56;
    }
LABEL_55:
    v88 = v74;
    operator delete(v74);
    goto LABEL_56;
  }
LABEL_49:
  if (self->_inputTokens.type_ != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  v71 = (void *)(*(uint64_t (**)(TensorStorage *))(*(void *)self->_inputTokens.storage_.__ptr_ + 24))(self->_inputTokens.storage_.__ptr_);
  if ((uint64_t)(v72 & 0xFFFFFFFFFFFFFFFCLL) >= 1) {
    bzero(v71, 4 * (((v72 & 0xFFFFFFFFFFFFFFFCLL) >> 2) - ((v72 & 0xFFFFFFFFFFFFFFFCLL) > 3)) + 4);
  }
  BOOL v73 = 1;
  v74 = v87;
  if (v87) {
    goto LABEL_55;
  }
LABEL_56:
  uint64_t v90 = &unk_26FEDD950;
  v75 = (std::__shared_weak_count *)v95;
  if (v95 && !atomic_fetch_add((atomic_ullong *volatile)(v95 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
    std::__shared_weak_count::__release_weak(v75);
  }
  if (v92)
  {
    uint64_t v93 = (char *)v92;
    operator delete(v92);
  }

  return v73;
}

- (BOOL)reshapeEncodedFeaturesBufferForBridgeNet:(id)a3 WithError:(id *)a4
{
  v93[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = sub_24C6C9D10(v6);
  LOWORD(v76) = 1;
  sub_24C66FCBC((uint64_t)&v85, v7, &v76);
  int v82 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v12 = (int32x4_t *)v87;
  uint64_t v13 = v88;
  int64_t v14 = v88 - (unsigned char *)v87;
  if (v88 == v87)
  {
    uint64_t v18 = 0;
    goto LABEL_11;
  }
  if (v14 < 0) {
    sub_24C667470();
  }
  int v82 = operator new(v88 - (unsigned char *)v87);
  uint64_t v83 = v82;
  uint64_t v15 = (char *)v82 + 8 * (v14 >> 3);
  uint64_t v84 = v15;
  memcpy(v82, v12, v14);
  uint64_t v83 = v15;
  if ((unint64_t)(v14 - 8) >= 0x38)
  {
    unint64_t v19 = ((unint64_t)(v14 - 8) >> 3) + 1;
    uint64_t v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    uint64_t v20 = v12 + 2;
    v21.i64[0] = 0x100000001;
    v21.i64[1] = 0x100000001;
    uint64_t v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    v23.i64[0] = 0x100000001;
    v23.i64[1] = 0x100000001;
    do
    {
      int32x4_t v25 = v20[-2];
      int32x4_t v24 = v20[-1];
      int32x4_t v27 = *v20;
      int32x4_t v26 = v20[1];
      v20 += 4;
      int32x4_t v21 = vmulq_s32(v21, vuzp1q_s32(v25, v24));
      int32x4_t v23 = vmulq_s32(v23, vuzp1q_s32(v27, v26));
      v22 -= 8;
    }
    while (v22);
    int8x16_t v28 = (int8x16_t)vmulq_s32(v23, v21);
    *(int32x2_t *)v28.i8 = vmul_s32(*(int32x2_t *)v28.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
    int v16 = v28.i32[0] * v28.i32[1];
    if (v19 == (v19 & 0x3FFFFFFFFFFFFFF8)) {
      goto LABEL_10;
    }
  }
  else
  {
    int v16 = 1;
    uint64_t v17 = (char *)v12;
  }
  do
  {
    int v29 = *(_DWORD *)v17;
    v17 += 8;
    v16 *= v29;
  }
  while (v17 != v13);
LABEL_10:
  uint64_t v18 = v16;
LABEL_11:
  objc_msgSend_inputEncodedFeaturesTensorNameOfBridge(self->_configuration, v8, v9, v10, v11);
  id v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v30, v31, v32, v33, v34);
  espresso_network_query_blob_shape();

  if (!v91)
  {
    uint64_t v38 = 1;
    goto LABEL_20;
  }
  if (v91 == 1)
  {
    unint64_t v37 = 0;
    uint64_t v38 = 1;
LABEL_18:
    uint64_t v43 = v91 - v37;
    uint64_t v44 = (uint64_t *)&v92[8 * v37];
    do
    {
      uint64_t v45 = *v44++;
      v38 *= v45;
      --v43;
    }
    while (v43);
    goto LABEL_20;
  }
  unint64_t v37 = v91 & 0xFFFFFFFFFFFFFFFELL;
  v39 = v93;
  uint64_t v40 = 1;
  unint64_t v41 = v91 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v42 = 1;
  do
  {
    v40 *= *(v39 - 1);
    v42 *= *v39;
    v39 += 2;
    v41 -= 2;
  }
  while (v41);
  uint64_t v38 = v42 * v40;
  if (v91 != v37) {
    goto LABEL_18;
  }
LABEL_20:
  if (v18 == v38)
  {
    if (objc_msgSend_compareTensorShapesForShape1_Shape2_rank_(self, v35, (uint64_t)&v82, (uint64_t)v92, v91))
    {
      self->_bridgeInputBuffer.type_ = v86;
      if (&self->_bridgeInputBuffer != (EspressoTensor *)&v85) {
        sub_24C670F38(&self->_bridgeInputBuffer.shape_.sizes_.__begin_, (char *)v87, v88, (v88 - (unsigned char *)v87) >> 3);
      }
      v47 = v89;
      unsigned int v46 = (__shared_weak_count *)v90;
      if (v90) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v90 + 8), 1uLL, memory_order_relaxed);
      }
      cntrl = self->_bridgeInputBuffer.storage_.__cntrl_;
      self->_bridgeInputBuffer.storage_.__ptr_ = v47;
      self->_bridgeInputBuffer.storage_.__cntrl_ = v46;
      if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
      char v49 = 1;
    }
    else
    {
      sub_24C6C9DF4((uint64_t)&v85, (uint64_t)&v76);
      espresso_buffer_pack_tensor_shape();
      uint64_t v55 = *((void *)v80 + 13);
      uint64_t v54 = *((void *)v80 + 14);
      uint64_t v57 = *((void *)v80 + 11);
      uint64_t v56 = *((void *)v80 + 12);
      uint64_t v58 = operator new(0x20uLL);
      v74 = v58 + 4;
      v75 = v58 + 4;
      *uint64_t v58 = v54;
      v58[1] = v55;
      v58[2] = v56;
      v58[3] = v57;
      __p = v58;
      char v49 = objc_msgSend_compareTensorShapesForShape1_Shape2_rank_(self, v59, (uint64_t)&__p, (uint64_t)v92, v91);
      if (v49)
      {
        self->_bridgeInputBuffer.type_ = v77;
        if (&self->_bridgeInputBuffer != (EspressoTensor *)&v76) {
          sub_24C670F38(&self->_bridgeInputBuffer.shape_.sizes_.__begin_, (char *)v78, v79, (v79 - (unsigned char *)v78) >> 3);
        }
        v64 = v80;
        id v63 = (__shared_weak_count *)v81;
        if (v81) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v81 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v65 = self->_bridgeInputBuffer.storage_.__cntrl_;
        self->_bridgeInputBuffer.storage_.__ptr_ = v64;
        self->_bridgeInputBuffer.storage_.__cntrl_ = v63;
        if (v65 && !atomic_fetch_add((atomic_ullong *volatile)v65 + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          (*(void (**)(__shared_weak_count *))(*(void *)v65 + 16))(v65);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v65);
        }
      }
      else if (a4)
      {
        uint64_t v66 = objc_msgSend_stringWithFormat_(NSString, v60, @"the encoder features fed to computeDecodedCaptionsForFeatures has same number of elements as desired by bridge layer input but even after reshape, their shapes do not match", v61, v62);
        objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v67, (uint64_t)v66, v68, v69);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (__p)
      {
        v74 = __p;
        operator delete(__p);
      }
      v76 = &unk_26FEDD950;
      size_t v70 = (std::__shared_weak_count *)v81;
      if (v81 && !atomic_fetch_add((atomic_ullong *volatile)(v81 + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
        std::__shared_weak_count::__release_weak(v70);
      }
      if (v78)
      {
        uint64_t v79 = (char *)v78;
        operator delete(v78);
      }
    }
  }
  else
  {
    if (a4)
    {
      uint64_t v50 = objc_msgSend_stringWithFormat_(NSString, v35, @"the encoder features fed to computeDecodedCaptionsForFeatures has %zu elements and the bridge model is expected to have %zu elements for the node corresponding to attention features", v36, v91, v18, v38);
      objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v51, (uint64_t)v50, v52, v53);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    char v49 = 0;
  }
  if (v82)
  {
    uint64_t v83 = v82;
    operator delete(v82);
  }
  v85 = &unk_26FEDD950;
  v71 = (std::__shared_weak_count *)v90;
  if (v90 && !atomic_fetch_add((atomic_ullong *volatile)(v90 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
    std::__shared_weak_count::__release_weak(v71);
  }
  if (v87)
  {
    v88 = (char *)v87;
    operator delete(v87);
  }

  return v49;
}

- (id)getBridgeLayerOutput:(id)a3 error:(id *)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((objc_msgSend_loadBridge_(self, v7, (uint64_t)a4, v8, v9) & 1) == 0
    || !objc_msgSend_reshapeEncodedFeaturesBufferForBridgeNet_WithError_(self, v10, (uint64_t)v6, (uint64_t)a4, v11))
  {
    uint64_t v36 = 0;
    goto LABEL_23;
  }
  value = self->_bridgeNet.__ptr_.__value_;
  objc_msgSend_inputEncodedFeaturesTensorNameOfBridge(self->_configuration, v12, v13, v14, v15);
  id v17 = objc_claimAutoreleasedReturnValue();
  uint64_t v53 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
  sub_24C6C8078((uint64_t)v58, &v53, (uint64_t)&self->_bridgeInputBuffer);
  long long __dst = 0u;
  long long v55 = 0u;
  int v56 = 1065353216;
  sub_24C672C8C((uint64_t)&__dst, (uint64_t)v58, (long long *)v58);
  sub_24C66D4AC((uint64_t)value, (uint64_t)&__dst, (uint64_t)v57);
  sub_24C6717DC((uint64_t)&__dst);
  *((void *)&v59 + 1) = &unk_26FEDD950;
  uint64_t v22 = (std::__shared_weak_count *)*((void *)&v62 + 1);
  if (*((void *)&v62 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v62 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  if (*((void *)&v60 + 1))
  {
    *(void *)&long long v61 = *((void *)&v60 + 1);
    operator delete(*((void **)&v60 + 1));
  }
  if (SBYTE7(v59) < 0) {
    operator delete(v58[0]);
  }

  objc_msgSend_outputTensorNameOfBridge(self->_configuration, v23, v24, v25, v26);
  id v27 = objc_claimAutoreleasedReturnValue();
  uint64_t v32 = (const char *)objc_msgSend_UTF8String(v27, v28, v29, v30, v31);
  size_t v33 = strlen(v32);
  if (v33 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  size_t v34 = v33;
  if (v33 >= 0x17)
  {
    uint64_t v37 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v33 | 7) != 0x17) {
      uint64_t v37 = v33 | 7;
    }
    uint64_t v38 = v37 + 1;
    p_dst = (long long *)operator new(v37 + 1);
    *((void *)&__dst + 1) = v34;
    *(void *)&long long v55 = v38 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    BYTE7(v55) = v33;
    p_dst = &__dst;
    if (!v33) {
      goto LABEL_19;
    }
  }
  memmove(p_dst, v32, v34);
LABEL_19:
  *((unsigned char *)p_dst + v34) = 0;
  v39 = sub_24C66F168(v57, (uint64_t)&__dst);
  if (!v39) {
    sub_24C66DE30("unordered_map::at: key not found");
  }
  uint64_t v43 = v39[10];
  long long v44 = *(_OWORD *)(v43 + 40);
  long long v45 = *(_OWORD *)(v43 + 24);
  *(_OWORD *)uint64_t v58 = *(_OWORD *)(v43 + 8);
  long long v59 = v45;
  long long v60 = v44;
  long long v46 = *(_OWORD *)(v43 + 88);
  long long v47 = *(_OWORD *)(v43 + 104);
  long long v48 = *(_OWORD *)(v43 + 72);
  long long v61 = *(_OWORD *)(v43 + 56);
  long long v62 = v48;
  long long v49 = *(_OWORD *)(v43 + 120);
  long long v50 = *(_OWORD *)(v43 + 136);
  long long v51 = *(_OWORD *)(v43 + 152);
  uint64_t v68 = *(void *)(v43 + 168);
  long long v66 = v50;
  long long v67 = v51;
  long long v64 = v47;
  long long v65 = v49;
  long long v63 = v46;
  uint64_t v36 = objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v40, (uint64_t)v58, v41, v42);
  if (SBYTE7(v55) < 0) {
    operator delete((void *)__dst);
  }

  sub_24C6717DC((uint64_t)v57);
LABEL_23:

  return v36;
}

- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  if ((objc_msgSend_loadResources_(self, v11, (uint64_t)a6, v12, v13) & 1) == 0) {
    goto LABEL_6;
  }
  if (self->_bridgeNet.__ptr_.__value_ && !a5)
  {
    uint64_t v18 = objc_msgSend_getBridgeLayerOutput_error_(self, v14, (uint64_t)v10, (uint64_t)a6, v15);
    if (!v18) {
      goto LABEL_6;
    }
    char v19 = objc_msgSend_populateInputBufferWithBridgeFeatures_WithError_(self, v16, (uint64_t)v18, (uint64_t)a6, v17);

    if ((v19 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_8:
    if (a4) {
      objc_msgSend_getCaptionsAfterBeamSearchDecodingOnEncodedFeatures(self, v20, v21, v22, v23);
    }
    else {
    uint64_t v24 = objc_msgSend_getCaptionsAfterGreedyDecodingOnEncodedFeatures(self, v20, v21, v22, v23);
    }
    goto LABEL_12;
  }
  if (objc_msgSend_populateInputBufferWithBridgeFeatures_WithError_(self, v14, (uint64_t)v10, (uint64_t)a6, v15))goto LABEL_8; {
LABEL_6:
  }
  uint64_t v24 = 0;
LABEL_12:

  return v24;
}

- (id)getCaptionsAfterBeamSearchDecodingOnEncodedFeatures
{
  uint64_t v128 = operator new(4uLL);
  *uint64_t v128 = 0;
  v134 = self;
  procUtils = self->_procUtils;
  if (procUtils)
  {
    objc_msgSend_beamSearch(procUtils, v3, v4, v5, v6);
    uint64_t v8 = v137;
    uint64_t v10 = v137 + 192;
    uint64_t v9 = *(char **)(v137 + 192);
    if (!v9) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v8 = 0;
    v138 = 0;
    uint64_t v10 = 192;
    uint64_t v9 = (char *)MEMORY[0xC0];
    if (!MEMORY[0xC0]) {
      goto LABEL_16;
    }
  }
  uint64_t v11 = *(char **)(v8 + 200);
  uint64_t v12 = v9;
  if (v11 == v9) {
    goto LABEL_15;
  }
  do
  {
    uint64_t v13 = (std::__shared_weak_count *)*((void *)v11 - 1);
    if (!v13 || atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v14 = (void *)*((void *)v11 - 5);
      if (!v14) {
        goto LABEL_7;
      }
LABEL_11:
      *((void *)v11 - 4) = v14;
      operator delete(v14);
      goto LABEL_7;
    }
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    uint64_t v14 = (void *)*((void *)v11 - 5);
    if (v14) {
      goto LABEL_11;
    }
LABEL_7:
    v11 -= 48;
  }
  while (v11 != v9);
  uint64_t v12 = *(char **)v10;
LABEL_15:
  *(void *)(v8 + 200) = v9;
  operator delete(v12);
LABEL_16:
  *(void *)uint64_t v10 = 0;
  *(void *)(v10 + 8) = 0;
  *(void *)(v10 + 16) = 0;
  uint64_t v15 = operator new(4uLL);
  uint64_t v16 = v10 - 24;
  v155 = 0;
  *(void *)&long long v156 = v15;
  *uint64_t v15 = *v128;
  *((void *)&v156 + 1) = v15 + 1;
  v157 = v15 + 1;
  uint64_t v154 = 0;
  sub_24C69C320(v10 - 24, &v156, &v154, 0.00000011921);
  uint64_t v17 = v155;
  if (v155 && !atomic_fetch_add(&v155->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  if ((void)v156)
  {
    *((void *)&v156 + 1) = v156;
    operator delete((void *)v156);
  }
  int v18 = *(_DWORD *)v8 - 1;
  if (*(unsigned char *)(v8 + 16) && *(_DWORD *)(v8 + 12) < v18) {
    int v18 = *(_DWORD *)(v8 + 12);
  }
  sub_24C69C534(v10 - 24, (uint64_t *)&v152);
  if (v18 < 1) {
    goto LABEL_89;
  }
  uint64_t v19 = 0;
  v132 = (void *)v10;
  int v135 = v18;
  while (2)
  {
    uint64_t v21 = *(char **)v10;
    if (!*(void *)v10) {
      goto LABEL_41;
    }
    uint64_t v22 = *(char **)(v8 + 200);
    uint64_t v23 = *(char **)v10;
    if (v22 != v21)
    {
      while (1)
      {
        uint64_t v24 = (std::__shared_weak_count *)*((void *)v22 - 1);
        if (v24)
        {
          if (!atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
            break;
          }
        }
        uint64_t v25 = (void *)*((void *)v22 - 5);
        if (v25) {
          goto LABEL_36;
        }
LABEL_32:
        v22 -= 48;
        if (v22 == v21)
        {
          uint64_t v23 = *(char **)v10;
          goto LABEL_40;
        }
      }
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
      uint64_t v25 = (void *)*((void *)v22 - 5);
      if (!v25) {
        goto LABEL_32;
      }
LABEL_36:
      *((void *)v22 - 4) = v25;
      operator delete(v25);
      goto LABEL_32;
    }
LABEL_40:
    *(void *)(v8 + 200) = v21;
    operator delete(v23);
LABEL_41:
    *(void *)uint64_t v10 = 0;
    *(void *)(v10 + 8) = 0;
    *(void *)(v10 + 16) = 0;
    uint64_t v26 = *((void *)&v152 + 1);
    uint64_t v27 = v152;
    if ((void)v152 != *((void *)&v152 + 1))
    {
      int v28 = 0;
      while (*(unsigned char *)(v8 + 8))
      {
        uint64_t v29 = *(void *)(v8 + 128);
        if (*(char *)(v29 + 55) < 0)
        {
          uint64_t v30 = *(void *)(v29 + 32);
          uint64_t v31 = *(void *)(v29 + 40);
        }
        else
        {
          uint64_t v30 = v29 + 32;
          uint64_t v31 = *(unsigned __int8 *)(v29 + 55);
        }
        int v32 = *(_DWORD *)(*(void *)(v27 + 16) - 4);
        if (v32 != (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 32))(v29, v30, v31)
          || *(void *)(v27 + 16) - *(void *)(v27 + 8) < 5uLL)
        {
          break;
        }
        float v33 = *(float *)v27;
        __p = 0;
        v150 = 0;
        v151 = 0;
        uint64_t v35 = *(unsigned char **)(v27 + 8);
        size_t v34 = *(unsigned char **)(v27 + 16);
        int64_t v36 = v34 - v35;
        if (v34 != v35)
        {
          if (v36 < 0) {
            sub_24C667470();
          }
          __p = operator new(v34 - v35);
          v150 = (std::__shared_weak_count *)__p;
          uint64_t v37 = (std::__shared_weak_count *)((char *)__p + 4 * (v36 >> 2));
          v151 = v37;
          memcpy(__p, v35, v36);
          v150 = v37;
        }
        uint64_t v147 = *(void *)(v27 + 32);
        uint64_t v38 = *(std::__shared_weak_count **)(v27 + 40);
        v148 = v38;
        if (v38) {
          atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        sub_24C69C320(v16, &__p, &v147, v33);
        v39 = v148;
        if (v148 && !atomic_fetch_add(&v148->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
          ++v28;
          uint64_t v40 = (std::__shared_weak_count *)__p;
          if (!__p) {
            goto LABEL_44;
          }
LABEL_59:
          v150 = v40;
          operator delete(v40);
          goto LABEL_44;
        }
        ++v28;
        uint64_t v40 = (std::__shared_weak_count *)__p;
        if (__p) {
          goto LABEL_59;
        }
LABEL_44:
        v27 += 48;
        if (v27 == v26) {
          goto LABEL_73;
        }
      }
      sub_24C6CD15C((uint64_t)v143, v8, v27 + 8, v134, v19);
      int v41 = v146;
      if (v146)
      {
        (***(void (****)(void, void **))(v8 + 152))(*(void *)(v8 + 152), v143);
        sub_24C69CC48(v8, (uint64_t)v143, v27 + 8, *(float *)v27);
        uint64_t v42 = v145;
        if (!v145) {
          goto LABEL_67;
        }
      }
      else
      {
        uint64_t v43 = sub_24C69662C();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          sub_24C729FBC(&buf, v142, v43);

          uint64_t v42 = v145;
          if (!v145) {
            goto LABEL_67;
          }
        }
        else
        {

          uint64_t v42 = v145;
          if (!v145) {
            goto LABEL_67;
          }
        }
      }
      if (!atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
LABEL_67:
      if (v143[0])
      {
        v143[1] = v143[0];
        operator delete(v143[0]);
      }
      if (!v41)
      {
LABEL_73:
        uint64_t v45 = *(void *)(v8 + 192);
        uint64_t v44 = *(void *)(v8 + 200);
        uint64_t v10 = (uint64_t)v132;
        goto LABEL_75;
      }
      goto LABEL_44;
    }
    uint64_t v45 = 0;
    uint64_t v44 = 0;
    int v28 = 0;
LABEL_75:
    if (v28 != -1431655765 * ((unint64_t)(v44 - v45) >> 4))
    {
      sub_24C69C534(v16, (uint64_t *)v143);
      uint64_t v46 = v152;
      if (!(void)v152) {
        goto LABEL_28;
      }
      uint64_t v47 = *((void *)&v152 + 1);
      uint64_t v20 = (void *)v152;
      if (*((void *)&v152 + 1) != (void)v152)
      {
        while (1)
        {
          long long v48 = *(std::__shared_weak_count **)(v47 - 8);
          if (v48)
          {
            if (!atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
              break;
            }
          }
          long long v49 = *(void **)(v47 - 40);
          if (v49) {
            goto LABEL_83;
          }
LABEL_79:
          v47 -= 48;
          if (v47 == v46)
          {
            uint64_t v20 = (void *)v152;
            goto LABEL_27;
          }
        }
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
        long long v49 = *(void **)(v47 - 40);
        if (!v49) {
          goto LABEL_79;
        }
LABEL_83:
        *(void *)(v47 - 32) = v49;
        operator delete(v49);
        goto LABEL_79;
      }
LABEL_27:
      *((void *)&v152 + 1) = v46;
      operator delete(v20);
LABEL_28:
      long long v152 = *(_OWORD *)v143;
      int64_t v153 = v144;
      uint64_t v19 = (v19 + 1);
      if (v19 == v135) {
        goto LABEL_89;
      }
      continue;
    }
    break;
  }
  long long v50 = sub_24C69662C();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    sub_24C729F44(v19, v50);
  }

LABEL_89:
  uint64_t v51 = v152;
  if (!(void)v152) {
    goto LABEL_101;
  }
  uint64_t v52 = *((void *)&v152 + 1);
  uint64_t v53 = (void *)v152;
  if (*((void *)&v152 + 1) == (void)v152) {
    goto LABEL_100;
  }
  do
  {
    uint64_t v54 = *(std::__shared_weak_count **)(v52 - 8);
    if (!v54 || atomic_fetch_add(&v54->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      long long v55 = *(void **)(v52 - 40);
      if (!v55) {
        goto LABEL_92;
      }
LABEL_96:
      *(void *)(v52 - 32) = v55;
      operator delete(v55);
      goto LABEL_92;
    }
    ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
    std::__shared_weak_count::__release_weak(v54);
    long long v55 = *(void **)(v52 - 40);
    if (v55) {
      goto LABEL_96;
    }
LABEL_92:
    v52 -= 48;
  }
  while (v52 != v51);
  uint64_t v53 = (void *)v152;
LABEL_100:
  *((void *)&v152 + 1) = v51;
  operator delete(v53);
LABEL_101:
  sub_24C69C0F0(v16, (uint64_t)&v139);
  if (v138 && !atomic_fetch_add(&v138->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v138->__on_zero_shared)(v138);
    std::__shared_weak_count::__release_weak(v138);
  }
  id v130 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v60 = (_DWORD **)v139;
  v129 = (_DWORD **)v140;
  if (v139 == v140) {
    goto LABEL_198;
  }
  while (2)
  {
    HIBYTE(v144) = 0;
    LOBYTE(v143[0]) = 0;
    long long v61 = v60;
    long long v62 = *v60;
    v131 = v61;
    long long v63 = v61[1];
    v136 = v63;
    while (2)
    {
      if (v62 != v63)
      {
        if (*v62)
        {
          long long v64 = v134->_procUtils;
          if (v64)
          {
            objc_msgSend_vocabulary(v64, v56, v57, v58, v59);
            long long v64 = __p;
          }
          else
          {
            __p = 0;
            v150 = 0;
          }
          (*(void (**)(long long *__return_ptr))(*(void *)v64 + 40))(&v152);
          uint64_t v65 = HIBYTE(v153);
          if (v153 >= 0) {
            size_t v66 = 22;
          }
          else {
            size_t v66 = (v153 & 0x7FFFFFFFFFFFFFFFLL) - 1;
          }
          if (v153 < 0) {
            uint64_t v65 = *((void *)&v152 + 1);
          }
          if (v66 == v65)
          {
            if (v66 == 0x7FFFFFFFFFFFFFF6) {
              sub_24C6673C8();
            }
            unint64_t v67 = v66 + 1;
            if (v153 >= 0) {
              uint64_t v68 = &v152;
            }
            else {
              uint64_t v68 = (long long *)v152;
            }
            if (v66 >= 0x3FFFFFFFFFFFFFF3)
            {
              size_t v70 = 0x7FFFFFFFFFFFFFF7;
            }
            else
            {
              unint64_t v69 = 2 * v66;
              if (v67 > 2 * v66) {
                unint64_t v69 = v66 + 1;
              }
              if (v69 >= 0x17)
              {
                unint64_t v74 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
                uint64_t v75 = v69 | 7;
                if (v75 == 23) {
                  uint64_t v75 = v74;
                }
                size_t v70 = v75 + 1;
              }
              else
              {
                size_t v70 = 23;
              }
            }
            v76 = operator new(v70);
            int v77 = v76;
            if (v66)
            {
              memmove(v76, v68, v66);
              v77[v66] = 32;
              if (v66 == 22)
              {
LABEL_144:
                *((void *)&v152 + 1) = v66 + 1;
                int64_t v153 = v70 | 0x8000000000000000;
                *(void *)&long long v152 = v77;
                BOOL v73 = &v77[v67];
                goto LABEL_145;
              }
            }
            else
            {
              unsigned char *v76 = 32;
            }
            operator delete(v68);
            goto LABEL_144;
          }
          v71 = &v152;
          if (v153 < 0) {
            v71 = (long long *)v152;
          }
          *((unsigned char *)v71 + v65) = 32;
          uint64_t v72 = v65 + 1;
          if (SHIBYTE(v153) < 0) {
            *((void *)&v152 + 1) = v72;
          }
          else {
            HIBYTE(v153) = v72 & 0x7F;
          }
          BOOL v73 = (char *)v71 + v72;
LABEL_145:
          *BOOL v73 = 0;
          v157 = (_DWORD *)v153;
          long long v156 = v152;
          int64_t v153 = 0;
          long long v152 = 0uLL;
          int v78 = SHIBYTE(v157);
          v133 = (void *)v156;
          if (SHIBYTE(v157) >= 0) {
            uint64_t v79 = &v156;
          }
          else {
            uint64_t v79 = (long long *)v156;
          }
          if (SHIBYTE(v157) >= 0) {
            size_t v80 = HIBYTE(v157);
          }
          else {
            size_t v80 = *((void *)&v156 + 1);
          }
          if (v144 >= 0) {
            unint64_t v81 = 22;
          }
          else {
            unint64_t v81 = (v144 & 0x7FFFFFFFFFFFFFFFLL) - 1;
          }
          if (v144 >= 0) {
            size_t v82 = HIBYTE(v144);
          }
          else {
            size_t v82 = (size_t)v143[1];
          }
          if (v81 - v82 >= v80)
          {
            if (v80)
            {
              if (v144 >= 0) {
                size_t v87 = v143;
              }
              else {
                size_t v87 = (void **)v143[0];
              }
              memmove((char *)v87 + v82, v79, v80);
              size_t v88 = v82 + v80;
              if (SHIBYTE(v144) < 0) {
                v143[1] = (void *)(v82 + v80);
              }
              else {
                HIBYTE(v144) = v88 & 0x7F;
              }
              uint64_t v89 = (char *)v87 + v88;
              goto LABEL_183;
            }
          }
          else
          {
            unint64_t v83 = v82 + v80;
            if (0x7FFFFFFFFFFFFFF6 - v81 < v82 + v80 - v81) {
              sub_24C6673C8();
            }
            if (v144 >= 0) {
              uint64_t v84 = v143;
            }
            else {
              uint64_t v84 = (void **)v143[0];
            }
            if (v81 >= 0x3FFFFFFFFFFFFFF3)
            {
              uint64_t v90 = 0x7FFFFFFFFFFFFFF6;
            }
            else
            {
              unint64_t v85 = 2 * v81;
              if (v83 > 2 * v81) {
                unint64_t v85 = v82 + v80;
              }
              if (v85 < 0x17)
              {
                size_t v86 = 23;
                goto LABEL_178;
              }
              unint64_t v91 = (v85 & 0xFFFFFFFFFFFFFFF8) + 8;
              uint64_t v90 = v85 | 7;
              if (v90 == 23) {
                uint64_t v90 = v91;
              }
            }
            size_t v86 = v90 + 1;
LABEL_178:
            uint64_t v92 = (char *)operator new(v86);
            uint64_t v93 = v92;
            if (v82) {
              memmove(v92, v84, v82);
            }
            memcpy(&v93[v82], v79, v80);
            if (v81 != 22) {
              operator delete(v84);
            }
            v143[1] = (void *)(v82 + v80);
            int64_t v144 = v86 | 0x8000000000000000;
            v143[0] = v93;
            uint64_t v89 = &v93[v83];
LABEL_183:
            *uint64_t v89 = 0;
          }
          if (v78 < 0)
          {
            operator delete(v133);
            if (SHIBYTE(v153) < 0) {
              goto LABEL_189;
            }
LABEL_186:
            uint64_t v94 = v150;
            if (v150)
            {
LABEL_190:
              if (!atomic_fetch_add(&v94->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
                std::__shared_weak_count::__release_weak(v94);
              }
            }
          }
          else
          {
            if ((SHIBYTE(v153) & 0x80000000) == 0) {
              goto LABEL_186;
            }
LABEL_189:
            operator delete((void *)v152);
            uint64_t v94 = v150;
            if (v150) {
              goto LABEL_190;
            }
          }
        }
        ++v62;
        long long v63 = v136;
        continue;
      }
      break;
    }
    MEMORY[0x2532F8850](&v152);
    LODWORD(v156) = 0x4000;
    std::locale::locale((std::locale *)&v156 + 1, (const std::locale *)&v152);
    sub_24C69EE20((unsigned __int8 *)v143, (const std::locale *)&v156);
    std::locale::~locale((std::locale *)&v156 + 1);
    std::locale::~locale((std::locale *)&v152);
    MEMORY[0x2532F8850]();
    LODWORD(v156) = 0x4000;
    std::locale::locale((std::locale *)&v156 + 1, (const std::locale *)&v152);
    sub_24C69F02C((char *)v143, (const std::locale *)&v156);
    std::locale::~locale((std::locale *)&v156 + 1);
    std::locale::~locale((std::locale *)&v152);
    uint64_t v95 = NSString;
    int v96 = SHIBYTE(v144);
    v97 = v143[0];
    uint64_t v103 = objc_msgSend_defaultCStringEncoding(NSString, v98, v99, v100, v101);
    if (v96 >= 0) {
      objc_msgSend_stringWithCString_encoding_(v95, v102, (uint64_t)v143, v103, v104);
    }
    else {
    v105 = objc_msgSend_stringWithCString_encoding_(v95, v102, (uint64_t)v97, v103, v104);
    }
    long long v106 = [CSUCaptionResult alloc];
    LODWORD(v107) = *((_DWORD *)v131 + 6);
    int v111 = objc_msgSend_initWithCaption_score_(v106, v108, (uint64_t)v105, v109, v110, v107);
    objc_msgSend_addObject_(v130, v112, (uint64_t)v111, v113, v114);

    if (SHIBYTE(v144) < 0) {
      operator delete(v143[0]);
    }
    long long v60 = v131 + 4;
    if (v131 + 4 != v129) {
      continue;
    }
    break;
  }
LABEL_198:
  v115 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v56, (uint64_t)v130, v58, v59);
  v119 = objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v116, (uint64_t)v115, v117, v118);

  id v120 = v119;
  v121 = (char *)v139;
  if (v139)
  {
    v122 = v140;
    char v123 = v139;
    if (v140 != v139)
    {
      v124 = v140;
      do
      {
        v126 = (void *)*((void *)v124 - 4);
        v124 -= 32;
        v125 = v126;
        if (v126)
        {
          *(v122 - 3) = v125;
          operator delete(v125);
        }
        v122 = v124;
      }
      while (v124 != v121);
      char v123 = v139;
    }
    v140 = v121;
    operator delete(v123);
  }
  operator delete(v128);
  return v120;
}

- (id)getCaptionsAfterGreedyDecodingOnEncodedFeatures
{
  uint64_t v257 = *MEMORY[0x263EF8340];
  begin = self->_inputTokens.shape_.sizes_.__begin_;
  end = self->_inputTokens.shape_.sizes_.__end_;
  if (begin != end)
  {
    unint64_t v5 = (char *)end - (char *)begin - 8;
    if (v5 >= 0x38)
    {
      uint64_t v8 = (v5 >> 3) + 1;
      uint64_t v7 = &begin[v8 & 0x3FFFFFFFFFFFFFF8];
      uint64_t v9 = (int32x4_t *)(begin + 4);
      v10.i64[0] = 0x100000001;
      v10.i64[1] = 0x100000001;
      uint64_t v11 = v8 & 0x3FFFFFFFFFFFFFF8;
      v12.i64[0] = 0x100000001;
      v12.i64[1] = 0x100000001;
      do
      {
        int32x4_t v14 = v9[-2];
        int32x4_t v13 = v9[-1];
        int32x4_t v16 = *v9;
        int32x4_t v15 = v9[1];
        v9 += 4;
        int32x4_t v10 = vmulq_s32(v10, vuzp1q_s32(v14, v13));
        int32x4_t v12 = vmulq_s32(v12, vuzp1q_s32(v16, v15));
        v11 -= 8;
      }
      while (v11);
      int8x16_t v17 = (int8x16_t)vmulq_s32(v12, v10);
      *(int32x2_t *)v17.i8 = vmul_s32(*(int32x2_t *)v17.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
      int v6 = v17.i32[0] * v17.i32[1];
      if (v8 == (v8 & 0x3FFFFFFFFFFFFFF8)) {
        goto LABEL_9;
      }
    }
    else
    {
      int v6 = 1;
      uint64_t v7 = self->_inputTokens.shape_.sizes_.__begin_;
    }
    do
    {
      int v18 = *(_DWORD *)v7++;
      v6 *= v18;
    }
    while (v7 != end);
LABEL_9:
    unint64_t v226 = v6;
    goto LABEL_10;
  }
  unint64_t v226 = 0;
LABEL_10:
  if (self->_inputTokens.type_ != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v222 = (*(uint64_t (**)(TensorStorage *, SEL))(*(void *)self->_inputTokens.storage_.__ptr_ + 24))(self->_inputTokens.storage_.__ptr_, a2);
  v243 = 0;
  v244 = 0;
  v245 = 0;
  v240 = 0;
  v241 = 0;
  v242 = 0;
  v228 = self;
  if (!v226)
  {
    v126 = 0;
    id v227 = 0;
    v162 = (float32x4_t *)v240;
LABEL_133:
    double v164 = 0.0;
    goto LABEL_139;
  }
  id v227 = 0;
  unint64_t v23 = 0;
  p_inputTokens = &self->_inputTokens;
  p_encodedFeaturesBuffer = &self->_encodedFeaturesBuffer;
  while (1)
  {
    uint64_t value = (uint64_t)v228->_decoderNet.__ptr_.__value_;
    objc_msgSend_inputEncodedFeaturesTensorName(v228->_configuration, v19, v20, v21, v22, v222);
    id v25 = objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (const char *)objc_msgSend_UTF8String(v25, v26, v27, v28, v29);
    size_t v31 = strlen(v30);
    if (v31 > 0x7FFFFFFFFFFFFFF7) {
      sub_24C6673C8();
    }
    size_t v32 = v31;
    if (v31 >= 0x17)
    {
      uint64_t v34 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v31 | 7) != 0x17) {
        uint64_t v34 = v31 | 7;
      }
      uint64_t v35 = v34 + 1;
      p_dst = (long long *)operator new(v34 + 1);
      *((void *)&__dst + 1) = v32;
      unint64_t v234 = v35 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
LABEL_20:
      memmove(p_dst, v30, v32);
      goto LABEL_21;
    }
    HIBYTE(v234) = v31;
    p_dst = &__dst;
    if (v31) {
      goto LABEL_20;
    }
LABEL_21:
    *((unsigned char *)p_dst + v32) = 0;
    sub_24C67CADC((uint64_t)&v246, &__dst, (uint64_t)p_encodedFeaturesBuffer);
    objc_msgSend_inputWordIdsTensorName(v228->_configuration, v36, v37, v38, v39);
    id v40 = objc_claimAutoreleasedReturnValue();
    uint64_t v45 = (const char *)objc_msgSend_UTF8String(v40, v41, v42, v43, v44);
    size_t v46 = strlen(v45);
    if (v46 > 0x7FFFFFFFFFFFFFF7) {
      sub_24C6673C8();
    }
    size_t v47 = v46;
    if (v46 >= 0x17)
    {
      uint64_t v49 = (v46 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v46 | 7) != 0x17) {
        uint64_t v49 = v46 | 7;
      }
      uint64_t v50 = v49 + 1;
      long long v48 = operator new(v49 + 1);
      *((void *)&v231 + 1) = v47;
      unint64_t v232 = v50 | 0x8000000000000000;
      *(void *)&long long v231 = v48;
    }
    else
    {
      HIBYTE(v232) = v46;
      long long v48 = &v231;
      if (!v46) {
        goto LABEL_29;
      }
    }
    memmove(v48, v45, v47);
LABEL_29:
    *((unsigned char *)v48 + v47) = 0;
    sub_24C67CADC((uint64_t)&v251, &v231, (uint64_t)p_inputTokens);
    *(_OWORD *)v235 = 0u;
    long long v236 = 0u;
    int v237 = 1065353216;
    sub_24C672C8C((uint64_t)v235, (uint64_t)&v246, &v246);
    sub_24C672C8C((uint64_t)v235, (uint64_t)&v251, &v251);
    sub_24C66D4AC(value, (uint64_t)v235, (uint64_t)&v238);
    sub_24C6717DC((uint64_t)v235);
    *((void *)&v252 + 1) = &unk_26FEDD950;
    uint64_t v51 = (std::__shared_weak_count *)*((void *)&v255 + 1);
    if (!*((void *)&v255 + 1)
      || atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v255 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v52 = (void *)*((void *)&v253 + 1);
      if (!*((void *)&v253 + 1)) {
        goto LABEL_33;
      }
LABEL_32:
      *(void *)&long long v254 = v52;
      operator delete(v52);
      goto LABEL_33;
    }
    ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
    std::__shared_weak_count::__release_weak(v51);
    uint64_t v52 = (void *)*((void *)&v253 + 1);
    if (*((void *)&v253 + 1)) {
      goto LABEL_32;
    }
LABEL_33:
    if (SBYTE7(v252) < 0)
    {
      operator delete((void *)v251);
      *((void *)&v247 + 1) = &unk_26FEDD950;
      uint64_t v53 = (std::__shared_weak_count *)*((void *)&v250 + 1);
      if (!*((void *)&v250 + 1)) {
        goto LABEL_38;
      }
    }
    else
    {
      *((void *)&v247 + 1) = &unk_26FEDD950;
      uint64_t v53 = (std::__shared_weak_count *)*((void *)&v250 + 1);
      if (!*((void *)&v250 + 1)) {
        goto LABEL_38;
      }
    }
    if (atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_38:
      uint64_t v54 = (void *)*((void *)&v248 + 1);
      if (!*((void *)&v248 + 1)) {
        goto LABEL_40;
      }
LABEL_39:
      *(void *)&long long v249 = v54;
      operator delete(v54);
      goto LABEL_40;
    }
    ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
    std::__shared_weak_count::__release_weak(v53);
    uint64_t v54 = (void *)*((void *)&v248 + 1);
    if (*((void *)&v248 + 1)) {
      goto LABEL_39;
    }
LABEL_40:
    if (SBYTE7(v247) < 0)
    {
      operator delete((void *)v246);
      if ((SHIBYTE(v232) & 0x80000000) == 0) {
        goto LABEL_42;
      }
    }
    else if ((SHIBYTE(v232) & 0x80000000) == 0)
    {
      goto LABEL_42;
    }
    operator delete((void *)v231);
LABEL_42:

    if (SHIBYTE(v234) < 0) {
      operator delete((void *)__dst);
    }

    objc_msgSend_outputWordProbsTensorName(v228->_configuration, v55, v56, v57, v58);
    id v59 = (id)objc_claimAutoreleasedReturnValue();
    long long v60 = v59;
    if (!v59)
    {
LABEL_66:
      unint64_t v83 = 0;
      goto LABEL_74;
    }
    id v61 = v59;
    size_t v66 = (const char *)objc_msgSend_UTF8String(v61, v62, v63, v64, v65);
    size_t v67 = strlen(v66);
    if (v67 > 0x7FFFFFFFFFFFFFF7) {
      sub_24C6673C8();
    }
    size_t v68 = v67;
    if (v67 >= 0x17)
    {
      uint64_t v70 = (v67 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v67 | 7) != 0x17) {
        uint64_t v70 = v67 | 7;
      }
      uint64_t v71 = v70 + 1;
      unint64_t v69 = operator new(v70 + 1);
      *((void *)&v246 + 1) = v68;
      *(void *)&long long v247 = v71 | 0x8000000000000000;
      *(void *)&long long v246 = v69;
LABEL_54:
      memmove(v69, v66, v68);
      goto LABEL_55;
    }
    BYTE7(v247) = v67;
    unint64_t v69 = &v246;
    if (v67) {
      goto LABEL_54;
    }
LABEL_55:
    *((unsigned char *)v69 + v68) = 0;
    uint64_t v72 = sub_24C66F168(&v238, (uint64_t)&v246);
    BOOL v73 = v72;
    if (SBYTE7(v247) < 0)
    {
      operator delete((void *)v246);
      if (!v73) {
        goto LABEL_66;
      }
    }
    else if (!v72)
    {
      goto LABEL_66;
    }
    id v74 = v61;
    uint64_t v79 = (const char *)objc_msgSend_UTF8String(v74, v75, v76, v77, v78);
    size_t v80 = strlen(v79);
    if (v80 > 0x7FFFFFFFFFFFFFF7) {
      sub_24C6673C8();
    }
    unint64_t v81 = (void *)v80;
    if (v80 >= 0x17)
    {
      uint64_t v84 = (v80 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v80 | 7) != 0x17) {
        uint64_t v84 = v80 | 7;
      }
      uint64_t v85 = v84 + 1;
      size_t v82 = operator new(v84 + 1);
      v235[1] = v81;
      *(void *)&long long v236 = v85 | 0x8000000000000000;
      v235[0] = v82;
    }
    else
    {
      BYTE7(v236) = v80;
      size_t v82 = v235;
      if (!v80) {
        goto LABEL_71;
      }
    }
    memmove(v82, v79, (size_t)v81);
LABEL_71:
    *((unsigned char *)v81 + (void)v82) = 0;
    size_t v86 = sub_24C66F168(&v238, (uint64_t)v235);
    if (!v86) {
      sub_24C66DE30("unordered_map::at: key not found");
    }
    uint64_t v90 = v86[10];
    long long v91 = *(_OWORD *)(v90 + 40);
    long long v92 = *(_OWORD *)(v90 + 24);
    long long v246 = *(_OWORD *)(v90 + 8);
    long long v247 = v92;
    long long v248 = v91;
    long long v93 = *(_OWORD *)(v90 + 88);
    long long v94 = *(_OWORD *)(v90 + 104);
    long long v95 = *(_OWORD *)(v90 + 72);
    long long v249 = *(_OWORD *)(v90 + 56);
    long long v250 = v95;
    long long v96 = *(_OWORD *)(v90 + 120);
    long long v97 = *(_OWORD *)(v90 + 136);
    long long v98 = *(_OWORD *)(v90 + 152);
    uint64_t v256 = *(void *)(v90 + 168);
    long long v254 = v97;
    long long v255 = v98;
    long long v252 = v94;
    long long v253 = v96;
    long long v251 = v93;
    unint64_t v83 = objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v87, (uint64_t)&v246, v88, v89);
    if (SBYTE7(v236) < 0) {
      operator delete(v235[0]);
    }
LABEL_74:

    uint64_t v103 = objc_msgSend_configuration(v228, v99, v100, v101, v102);
    int v108 = objc_msgSend_saveDecoderFeatures(v103, v104, v105, v106, v107);

    id v227 = v108 ? v83 : 0;
    uint64_t v109 = (void *)sub_24C6C9D10(v83);
    uint64_t v110 = v109[10];
    uint64_t v111 = v110 * v23++;
    if (v111 == v110 * v23) {
      break;
    }
    v112 = (float *)(*v109 + 4 * v111);
    uint64_t v113 = v112 + 1;
    if (v112 + 1 == (float *)(*v109 + 4 * v110 * v23)) {
      break;
    }
    float v114 = *v112;
    uint64_t v115 = 4 * v110 - 4;
    long long v116 = v112;
    uint64_t v117 = v112 + 1;
    do
    {
      float v118 = *v117++;
      float v119 = v118;
      if (v114 < v118)
      {
        float v114 = v119;
        long long v116 = v113;
      }
      uint64_t v113 = v117;
      v115 -= 4;
    }
    while (v115);
    uint64_t v120 = (char *)v116 - (char *)v112;
    if (!v120) {
      break;
    }
    if (v23 < v226) {
      *(float *)(v222 + 4 * v23) = (float)(v120 >> 2);
    }
    unint64_t v121 = (unint64_t)v120 >> 2;
    v122 = v244;
    if (v244 >= v245)
    {
      v223 = v83;
      v127 = (char *)v243;
      int64_t v128 = v244 - (unsigned char *)v243;
      uint64_t v129 = (v244 - (unsigned char *)v243) >> 2;
      unint64_t v130 = v129 + 1;
      if ((unint64_t)(v129 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v131 = v245 - (unsigned char *)v243;
      if ((v245 - (unsigned char *)v243) >> 1 > v130) {
        unint64_t v130 = v131 >> 1;
      }
      if ((unint64_t)v131 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v132 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v132 = v130;
      }
      if (v132)
      {
        if (v132 >> 62) {
          sub_24C66DB48();
        }
        v133 = (char *)operator new(4 * v132);
        v134 = &v133[4 * v129];
        *(_DWORD *)v134 = v121;
        uint64_t v135 = (uint64_t)(v134 + 4);
        if (v122 == v127)
        {
LABEL_106:
          v243 = v134;
          v245 = &v133[4 * v132];
          if (v127) {
            operator delete(v127);
          }
          unint64_t v83 = v223;
          v244 = (char *)v135;
          int v123 = *(_DWORD *)v116;
          v125 = v241;
          v124 = v242;
          if (v241 < v242) {
            goto LABEL_88;
          }
LABEL_109:
          v145 = (char *)v240;
          int64_t v146 = v125 - (unsigned char *)v240;
          uint64_t v147 = (v125 - (unsigned char *)v240) >> 2;
          unint64_t v148 = v147 + 1;
          if ((unint64_t)(v147 + 1) >> 62) {
            sub_24C667470();
          }
          uint64_t v149 = v124 - (unsigned char *)v240;
          if (v149 >> 1 > v148) {
            unint64_t v148 = v149 >> 1;
          }
          if ((unint64_t)v149 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v150 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v150 = v148;
          }
          if (v150)
          {
            if (v150 >> 62) {
              sub_24C66DB48();
            }
            v151 = operator new(4 * v150);
            long long v152 = &v151[4 * v147];
            *(_DWORD *)long long v152 = v123;
            v126 = v152 + 4;
            if (v125 == v145) {
              goto LABEL_126;
            }
          }
          else
          {
            v151 = 0;
            long long v152 = (char *)(4 * v147);
            *(_DWORD *)(4 * v147) = v123;
            v126 = (char *)(4 * v147 + 4);
            if (v125 == v145)
            {
LABEL_126:
              v240 = v152;
              v242 = &v151[4 * v150];
              if (v145) {
                operator delete(v145);
              }
              goto LABEL_128;
            }
          }
          unint64_t v153 = v125 - 4 - v145;
          if (v153 < 0x2C) {
            goto LABEL_183;
          }
          if ((unint64_t)(v125 - &v151[v146]) < 0x20) {
            goto LABEL_183;
          }
          uint64_t v154 = (v153 >> 2) + 1;
          uint64_t v155 = 4 * (v154 & 0x7FFFFFFFFFFFFFF8);
          long long v156 = &v125[-v155];
          v152 -= v155;
          v157 = &v151[4 * v147 - 16];
          v158 = v125 - 16;
          uint64_t v159 = v154 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v160 = *(_OWORD *)v158;
            *(v157 - 1) = *((_OWORD *)v158 - 1);
            _OWORD *v157 = v160;
            v157 -= 2;
            v158 -= 32;
            v159 -= 8;
          }
          while (v159);
          v125 = v156;
          if (v154 != (v154 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_183:
            do
            {
              int v161 = *((_DWORD *)v125 - 1);
              v125 -= 4;
              *((_DWORD *)v152 - 1) = v161;
              v152 -= 4;
            }
            while (v125 != v145);
          }
          goto LABEL_126;
        }
      }
      else
      {
        v133 = 0;
        v134 = (char *)(4 * v129);
        *(_DWORD *)(4 * v129) = v121;
        uint64_t v135 = 4 * v129 + 4;
        if (v122 == v127) {
          goto LABEL_106;
        }
      }
      unint64_t v136 = v122 - 4 - v127;
      if (v136 < 0x2C) {
        goto LABEL_184;
      }
      if ((unint64_t)(v122 - &v133[v128]) < 0x20) {
        goto LABEL_184;
      }
      uint64_t v137 = (v136 >> 2) + 1;
      uint64_t v138 = 4 * (v137 & 0x7FFFFFFFFFFFFFF8);
      v139 = &v122[-v138];
      v134 -= v138;
      v140 = &v133[4 * v129 - 16];
      v141 = v122 - 16;
      uint64_t v142 = v137 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v143 = *(_OWORD *)v141;
        *((_OWORD *)v140 - 1) = *((_OWORD *)v141 - 1);
        *(_OWORD *)v140 = v143;
        v140 -= 32;
        v141 -= 32;
        v142 -= 8;
      }
      while (v142);
      v122 = v139;
      if (v137 != (v137 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_184:
        do
        {
          int v144 = *((_DWORD *)v122 - 1);
          v122 -= 4;
          *((_DWORD *)v134 - 1) = v144;
          v134 -= 4;
        }
        while (v122 != v127);
      }
      goto LABEL_106;
    }
    *(_DWORD *)v244 = v121;
    v244 = v122 + 4;
    int v123 = *(_DWORD *)v116;
    v125 = v241;
    v124 = v242;
    if (v241 >= v242) {
      goto LABEL_109;
    }
LABEL_88:
    *(_DWORD *)v125 = v123;
    v126 = v125 + 4;
LABEL_128:
    v241 = v126;

    sub_24C6717DC((uint64_t)&v238);
    if (v23 == v226)
    {
      v162 = (float32x4_t *)v240;
      if (v240 == v126) {
        goto LABEL_133;
      }
      goto LABEL_130;
    }
  }

  sub_24C6717DC((uint64_t)&v238);
  v162 = (float32x4_t *)v240;
  v126 = v241;
  if (v240 == v241) {
    goto LABEL_133;
  }
LABEL_130:
  unint64_t v163 = v126 - (char *)v162 - 4;
  if (v163 < 0x1C)
  {
    double v164 = 0.0;
    v165 = (float *)v162;
    goto LABEL_138;
  }
  uint64_t v166 = (v163 >> 2) + 1;
  v165 = &v162->f32[v166 & 0x7FFFFFFFFFFFFFF8];
  v167 = v162 + 1;
  double v164 = 0.0;
  uint64_t v168 = v166 & 0x7FFFFFFFFFFFFFF8;
  do
  {
    float32x4_t v169 = v167[-1];
    float64x2_t v170 = vcvt_hight_f64_f32(v169);
    float64x2_t v171 = vcvtq_f64_f32(*(float32x2_t *)v169.f32);
    float64x2_t v172 = vcvt_hight_f64_f32(*v167);
    float64x2_t v173 = vcvtq_f64_f32(*(float32x2_t *)v167->f32);
    double v164 = v164
         + v171.f64[0]
         + v171.f64[1]
         + v170.f64[0]
         + v170.f64[1]
         + v173.f64[0]
         + v173.f64[1]
         + v172.f64[0]
         + v172.f64[1];
    v167 += 2;
    v168 -= 8;
  }
  while (v168);
  if (v166 != (v166 & 0x7FFFFFFFFFFFFFF8))
  {
    do
    {
LABEL_138:
      float v174 = *v165++;
      double v164 = v164 + v174;
    }
    while (v165 != (float *)v126);
  }
LABEL_139:
  v179 = objc_msgSend_array(MEMORY[0x263EFF980], v19, v20, v21, v22, v222);
  v180 = v243;
  v181 = v244;
  if (v243 != v244)
  {
    while (*v180)
    {
      procUtils = v228->_procUtils;
      if (procUtils)
      {
        objc_msgSend_vocabulary(procUtils, v175, v176, v177, v178);
        procUtils = (CSUCaptioningProcUtils *)v246;
      }
      else
      {
        long long v246 = 0uLL;
      }
      (*((void (**)(void **__return_ptr))procUtils->super.isa + 5))(&v229);
      if (v230 < 0)
      {
        operator delete(v229);
        v187 = (std::__shared_weak_count *)*((void *)&v246 + 1);
        if (!*((void *)&v246 + 1)) {
          goto LABEL_151;
        }
      }
      else
      {
        v187 = (std::__shared_weak_count *)*((void *)&v246 + 1);
        if (!*((void *)&v246 + 1))
        {
LABEL_151:
          v188 = NSString;
          v189 = v228->_procUtils;
          if (v189) {
            goto LABEL_152;
          }
LABEL_154:
          v238 = 0;
          v239 = 0;
          goto LABEL_155;
        }
      }
      if (atomic_fetch_add(&v187->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_151;
      }
      ((void (*)(std::__shared_weak_count *))v187->__on_zero_shared)(v187);
      std::__shared_weak_count::__release_weak(v187);
      v188 = NSString;
      v189 = v228->_procUtils;
      if (!v189) {
        goto LABEL_154;
      }
LABEL_152:
      objc_msgSend_vocabulary(v189, v183, v184, v185, v186);
      v189 = v238;
LABEL_155:
      (*((void (**)(long long *__return_ptr))v189->super.isa + 5))(&v246);
      if ((SBYTE7(v247) & 0x80u) == 0) {
        objc_msgSend_stringWithUTF8String_(v188, v190, (uint64_t)&v246, v191, v192);
      }
      else {
      v193 = objc_msgSend_stringWithUTF8String_(v188, v190, v246, v191, v192);
      }
      objc_msgSend_addObject_(v179, v194, (uint64_t)v193, v195, v196);

      if (SBYTE7(v247) < 0)
      {
        operator delete((void *)v246);
        v197 = v239;
        if (!v239) {
          goto LABEL_141;
        }
      }
      else
      {
        v197 = v239;
        if (!v239) {
          goto LABEL_141;
        }
      }
      if (!atomic_fetch_add(&v197->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v197->__on_zero_shared)(v197);
        std::__shared_weak_count::__release_weak(v197);
      }
LABEL_141:
      if (++v180 == (_DWORD *)v181) {
        break;
      }
      continue;
    }
  }
  v198 = objc_msgSend_componentsJoinedByString_(v179, v175, @" ", v177, v178);
  v199 = [CSUCaptionResult alloc];
  double v200 = v164 / (double)(unint64_t)((v126 - (char *)v162) >> 2);
  *(float *)&double v200 = v200;
  v204 = objc_msgSend_initWithCaption_score_(v199, v201, (uint64_t)v198, v202, v203, v200);
  id v205 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend_addObject_(v205, v206, (uint64_t)v204, v207, v208);
  v212 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v209, (uint64_t)v205, v210, v211);
  v216 = objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v213, (uint64_t)v212, v214, v215);

  objc_msgSend_setDecoderFeaturesCSUBuffer_(v216, v217, (uint64_t)v227, v218, v219);
  if (v240) {
    operator delete(v240);
  }
  if (v243) {
    operator delete(v243);
  }
  return v216;
}

- (id)postProcessResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_postProcessingHandler(self->_procUtils, v7, v8, v9, v10);

  if (v11)
  {
    int32x4_t v16 = objc_msgSend_postProcessingHandler(self->_procUtils, v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_genderOptionForBeamSearch(self->_procUtils, v17, v18, v19, v20);
    objc_msgSend_postProcessResults_genderOption_error_(v16, v22, (uint64_t)v6, v21, (uint64_t)a4);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v24 = sub_24C69662C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_24C72A70C(v24);
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
  self->_encodedFeaturesBuffer._vptr$Tensor = (void **)&unk_26FEDD950;
  cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    begin = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
    if (!begin) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  begin = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_4:
    self->_encodedFeaturesBuffer.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_5:
  self->_bridgeInputBuffer._vptr$Tensor = (void **)&unk_26FEDD950;
  unint64_t v5 = self->_bridgeInputBuffer.storage_.__cntrl_;
  if (v5 && !atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v5 + 16))(v5);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
    id v6 = self->_bridgeInputBuffer.shape_.sizes_.__begin_;
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v6 = self->_bridgeInputBuffer.shape_.sizes_.__begin_;
  if (v6)
  {
LABEL_8:
    self->_bridgeInputBuffer.shape_.sizes_.__end_ = v6;
    operator delete(v6);
  }
LABEL_9:
  self->_inputTokens._vptr$Tensor = (void **)&unk_26FEDD950;
  uint64_t v7 = self->_inputTokens.storage_.__cntrl_;
  if (!v7 || atomic_fetch_add((atomic_ullong *volatile)v7 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v8 = self->_inputTokens.shape_.sizes_.__begin_;
    if (!v8) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  (*(void (**)(__shared_weak_count *))(*(void *)v7 + 16))(v7);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  uint64_t v8 = self->_inputTokens.shape_.sizes_.__begin_;
  if (v8)
  {
LABEL_12:
    self->_inputTokens.shape_.sizes_.__end_ = v8;
    operator delete(v8);
  }
LABEL_13:
  uint64_t value = self->_bridgeNet.__ptr_.__value_;
  self->_bridgeNet.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(EspressoNet *))(*(void *)value + 8))(value);
  }
  uint64_t v10 = self->_decoderNet.__ptr_.__value_;
  self->_decoderNet.__ptr_.__value_ = 0;
  if (v10)
  {
    uint64_t v11 = *(void (**)(void))(*(void *)v10 + 8);
    v11();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((_DWORD *)self + 8) = 4;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 3) = &unk_26FEDD7F0;
  *((_DWORD *)self + 22) = 4;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = &unk_26FEDD7F0;
  *((_DWORD *)self + 36) = 4;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *((void *)self + 23) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = &unk_26FEDD7F0;
  return self;
}

@end