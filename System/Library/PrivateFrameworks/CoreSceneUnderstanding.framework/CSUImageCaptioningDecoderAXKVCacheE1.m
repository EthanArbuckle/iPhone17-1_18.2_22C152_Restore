@interface CSUImageCaptioningDecoderAXKVCacheE1
- (BOOL)compareTensorShapesForShape1:(const void *)a3 Shape2:(const void *)a4;
- (BOOL)loadDecoder:(id *)a3;
- (BOOL)loadDecoderObj:(id *)a3;
- (BOOL)loadPostProcUtilsWithBeamWidth:(int)a3 error:(id *)a4;
- (BOOL)loadResources:(id *)a3;
- (BOOL)populateInputBuffer:(id)a3 WithError:(id *)a4;
- (CSUCaptioningProcUtils)procUtils;
- (CSUImageCaptionDecoderAXKVCacheE1Network)decoderNetObj;
- (CSUImageCaptioningDecoderAXKVCacheE1)initWithConfiguration:(id)a3;
- (CSUImageCaptioningDecoderConfiguration)configuration;
- (ModelOutput)nextTokensForInputs:(SEL)a3 KVCache:(const void *)a4 AndforMaskPosition:(const void *)a5;
- (id).cxx_construct;
- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6;
- (id)getCaptionsAfterBeamSearchDecodingOnEncodedFeatures;
- (id)getCaptionsAfterGreedyDecodingOnEncodedFeatures;
- (id)postProcessResults:(id)a3 error:(id *)a4;
- (void)setDecoderNetObj:(id)a3;
@end

@implementation CSUImageCaptioningDecoderAXKVCacheE1

- (CSUImageCaptioningDecoderAXKVCacheE1)initWithConfiguration:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CSUImageCaptioningDecoderAXKVCacheE1;
  v10 = [(CSUImageCaptioningDecoderAXKVCacheE1 *)&v27 init];
  if (v10)
  {
    objc_msgSend_supportedComputeDevices(v5, v6, v7, v8, v9);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v23, (uint64_t)v28, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (v17)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend_setComputeDevice_(v5, v13, v17, v18, v19, (void)v23);

              objc_storeStrong((id *)&v10->_configuration, a3);
              v21 = v10;
              goto LABEL_16;
            }
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v23, (uint64_t)v28, 16);
      }
      while (v14);
    }

    v20 = sub_24C69662C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_24C72A684(v20);
    }

    v21 = 0;
LABEL_16:
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)loadPostProcUtilsWithBeamWidth:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [CSUCaptioningProcUtils alloc];
  uint64_t v9 = (CSUCaptioningProcUtils *)objc_msgSend_initWithDecoderConfiguration_beamWidth_beamScorerType_error_(v7, v8, (uint64_t)self->_configuration, v5, 1, a4);
  procUtils = self->_procUtils;
  self->_procUtils = v9;

  return self->_procUtils != 0;
}

- (BOOL)loadDecoderObj:(id *)a3
{
  uint64_t v5 = (CSUImageCaptionDecoderAXKVCacheE1Network *)objc_opt_new();
  decoderNetObj = self->_decoderNetObj;
  self->_decoderNetObj = v5;

  uint64_t v8 = self->_decoderNetObj;
  configuration = self->_configuration;
  return MEMORY[0x270F9A6D0](v8, sel_loadDecoderNetworkfromConfiguration_error_, configuration, a3, v7);
}

- (BOOL)loadDecoder:(id *)a3
{
  if (self->_decoderNetObj) {
    return 1;
  }
  id v17 = 0;
  char PostProcUtilsWithBeamWidth_error = objc_msgSend_loadPostProcUtilsWithBeamWidth_error_(self, a2, 3, (uint64_t)&v17, v3);
  id v8 = v17;
  id v12 = v8;
  if (PostProcUtilsWithBeamWidth_error)
  {
    id v16 = v8;
    char DecoderObj = objc_msgSend_loadDecoderObj_(self, v9, (uint64_t)&v16, v10, v11);
    id v14 = v16;

    if (DecoderObj)
    {
      BOOL v15 = 1;
LABEL_12:
      id v12 = v14;
      goto LABEL_13;
    }
    if (!a3)
    {
      BOOL v15 = 0;
      goto LABEL_12;
    }
    id v12 = v14;
    goto LABEL_10;
  }
  if (a3)
  {
LABEL_10:
    id v12 = v12;
    BOOL v15 = 0;
    *a3 = v12;
    goto LABEL_13;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)loadResources:(id *)a3
{
  if (self->_decoderNetObj) {
    return 1;
  }
  else {
    return objc_msgSend_loadDecoder_(self, a2, (uint64_t)a3, v3, v4);
  }
}

- (BOOL)compareTensorShapesForShape1:(const void *)a3 Shape2:(const void *)a4
{
  uint64_t v4 = *(void **)a3;
  uint64_t v5 = *((void *)a3 + 1) - *(void *)a3;
  if (!v5) {
    return 1;
  }
  unint64_t v6 = v5 >> 3;
  uint64_t v7 = *(void **)a4;
  if (v6 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v6;
  }
  if (*v4 != *v7) {
    return 0;
  }
  uint64_t v9 = 1;
  do
  {
    unint64_t v10 = v9;
    if (v8 == v9) {
      break;
    }
    uint64_t v11 = v4[v9];
    uint64_t v12 = v7[v9++];
  }
  while (v11 == v12);
  return v10 >= v6;
}

- (ModelOutput)nextTokensForInputs:(SEL)a3 KVCache:(const void *)a4 AndforMaskPosition:(const void *)a5
{
  decoderNetObj = self->_decoderNetObj;
  uint64_t v11 = a6;
  id v23 = 0;
  objc_msgSend_buildNetworkForSequenceLength_error_(decoderNetObj, a3, a6, (uint64_t)&v23, *(uint64_t *)&a6);
  id v15 = v23;
  if (v15)
  {
    objc_msgSend_logInternalError_(CSUError, v12, (uint64_t)v15, v13, v14);
    long long v16 = 0uLL;
    *(shared_ptr<std::unordered_map<std::string, std::vector<float>>> *)((char *)&retstr->var1 + 1) = 0u;
  }
  else
  {
    objc_msgSend_copyInputContextIDs_EncoderFeatures_KVCache_MaskPosition_(self->_decoderNetObj, v12, (uint64_t)a4, (uint64_t)&self->_encodedFeaturesBuffer, (uint64_t)a5, v11);
    v21 = self->_decoderNetObj;
    if (v21)
    {
      objc_msgSend_predict(v21, v17, v18, v19, v20);
      goto LABEL_6;
    }
    long long v16 = 0uLL;
    *(_OWORD *)&retstr->var1.var1 = 0u;
  }
  *(_OWORD *)&retstr->var0.__begin_ = v16;
  *(_OWORD *)&retstr->var0.__end_cap_.__value_ = v16;
LABEL_6:

  return result;
}

- (BOOL)populateInputBuffer:(id)a3 WithError:(id *)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_54:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v11 = objc_msgSend_espressoBuffer(v6, v7, v8, v9, v10);

  LOWORD(v70) = 1;
  sub_24C66FCBC((uint64_t)&v82, v11, &v70);
  v79 = 0;
  v80 = 0;
  v81 = 0;
  uint64_t v12 = (int32x4_t *)v83;
  uint64_t v13 = v84;
  int64_t v14 = (char *)v84 - (unsigned char *)v83;
  if (v84 != v83)
  {
    if (v14 < 0) {
      sub_24C667470();
    }
    v79 = operator new((char *)v84 - (unsigned char *)v83);
    v80 = v79;
    id v15 = (char *)v79 + 8 * (v14 >> 3);
    v81 = v15;
    memcpy(v79, v12, v14);
    v80 = v15;
    if ((unint64_t)(v14 - 8) >= 0x38)
    {
      unint64_t v19 = ((unint64_t)(v14 - 8) >> 3) + 1;
      id v17 = (int32x4_t *)((char *)v12 + 8 * (v19 & 0x3FFFFFFFFFFFFFF8));
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
        goto LABEL_12;
      }
    }
    else
    {
      int v16 = 1;
      id v17 = v12;
    }
    do
    {
      int v29 = v17->i32[0];
      id v17 = (int32x4_t *)((char *)v17 + 8);
      v16 *= v29;
    }
    while (v17 != v13);
LABEL_12:
    uint64_t v18 = v16;
    goto LABEL_13;
  }
  uint64_t v18 = 0;
LABEL_13:
  v30 = operator new(0x28uLL);
  v77 = (char *)v30 + 40;
  v78 = (char *)v30 + 40;
  _OWORD *v30 = 0u;
  v30[1] = 0u;
  *((void *)v30 + 4) = 0;
  v76 = v30;
  objc_msgSend_decoderNet(self->_decoderNetObj, v31, v32, v33, v34);
  objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v35, v36, v37, v38);
  id v39 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v39, v40, v41, v42, v43);
  espresso_network_query_blob_shape();

  v47 = v71;
  if (!v71 || atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v48 = v86;
    if (v86) {
      goto LABEL_16;
    }
LABEL_39:
    uint64_t v50 = 1;
    if (v18 == 1) {
      goto LABEL_24;
    }
    goto LABEL_40;
  }
  ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
  std::__shared_weak_count::__release_weak(v47);
  uint64_t v48 = v86;
  if (!v86) {
    goto LABEL_39;
  }
LABEL_16:
  if (v48 == 1)
  {
    unint64_t v49 = 0;
    uint64_t v50 = 1;
LABEL_21:
    uint64_t v55 = v48 - v49;
    v56 = (uint64_t *)((char *)v76 + 8 * v49);
    do
    {
      uint64_t v57 = *v56++;
      v50 *= v57;
      --v55;
    }
    while (v55);
    goto LABEL_23;
  }
  unint64_t v49 = v48 & 0xFFFFFFFFFFFFFFFELL;
  v51 = (char *)v76 + 8;
  uint64_t v52 = 1;
  unint64_t v53 = v48 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v54 = 1;
  do
  {
    v52 *= *(v51 - 1);
    v54 *= *v51;
    v51 += 2;
    v53 -= 2;
  }
  while (v53);
  uint64_t v50 = v54 * v52;
  if (v48 != v49) {
    goto LABEL_21;
  }
LABEL_23:
  if (v18 == v50)
  {
LABEL_24:
    if ((objc_msgSend_compareTensorShapesForShape1_Shape2_(self, v44, (uint64_t)&v79, (uint64_t)&v76, v46) & 1) == 0) {
      espresso_buffer_pack_tensor_shape();
    }
    __int16 v69 = 1;
    sub_24C66FCBC((uint64_t)&v70, v11, &v69);
    self->_encodedFeaturesBuffer.type_ = (int)v71;
    if (&self->_encodedFeaturesBuffer != (EspressoTensor *)&v70) {
      sub_24C670F38(&self->_encodedFeaturesBuffer.shape_.sizes_.__begin_, (char *)__p, v73, (v73 - (unsigned char *)__p) >> 3);
    }
    v59 = v74;
    v58 = (__shared_weak_count *)v75;
    if (v75) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v75 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
    self->_encodedFeaturesBuffer.storage_.__ptr_ = v59;
    self->_encodedFeaturesBuffer.storage_.__cntrl_ = v58;
    if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    v70 = &unk_26FEDD950;
    v61 = (std::__shared_weak_count *)v75;
    if (v75 && !atomic_fetch_add((atomic_ullong *volatile)(v75 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
    if (__p)
    {
      v73 = (char *)__p;
      operator delete(__p);
    }
    goto LABEL_42;
  }
LABEL_40:
  if (a4)
  {
    v62 = objc_msgSend_stringWithFormat_(NSString, v44, @"the features fed to the decoder has %zu elements, but the decoder model is expected to have %zu elements for the node corresponding to the encoder feature input", v45, v46, v18, v50);
    objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v63, (uint64_t)v62, v64, v65);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_42:
  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  if (v79)
  {
    v80 = v79;
    operator delete(v79);
  }
  v82 = &unk_26FEDD950;
  v66 = v85;
  if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
    std::__shared_weak_count::__release_weak(v66);
  }
  if (v83)
  {
    v84 = (int32x4_t *)v83;
    operator delete(v83);
  }

  return v18 == v50;
}

- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  if ((objc_msgSend_loadResources_(self, v10, (uint64_t)a6, v11, v12) & 1) != 0
    && objc_msgSend_populateInputBuffer_WithError_(self, v13, (uint64_t)v9, (uint64_t)a6, v14))
  {
    if (a4) {
      objc_msgSend_getCaptionsAfterBeamSearchDecodingOnEncodedFeatures(self, v15, v16, v17, v18);
    }
    else {
    unint64_t v19 = objc_msgSend_getCaptionsAfterGreedyDecodingOnEncodedFeatures(self, v15, v16, v17, v18);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }

  return v19;
}

- (id)getCaptionsAfterBeamSearchDecodingOnEncodedFeatures
{
  v130 = operator new(4uLL);
  _DWORD *v130 = 0;
  v136 = self;
  procUtils = self->_procUtils;
  if (procUtils)
  {
    objc_msgSend_beamSearch(procUtils, v3, v4, v5, v6);
    uint64_t v8 = v139;
    uint64_t v10 = v139 + 192;
    id v9 = *(char **)(v139 + 192);
    if (!v9) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v8 = 0;
    v140 = 0;
    uint64_t v10 = 192;
    id v9 = (char *)MEMORY[0xC0];
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
  id v15 = operator new(4uLL);
  v157 = 0;
  *(void *)&long long v158 = v15;
  *id v15 = *v130;
  *((void *)&v158 + 1) = v15 + 1;
  v159 = v15 + 1;
  uint64_t v156 = 0;
  uint64_t v137 = v10 - 24;
  sub_24C69C320(v10 - 24, &v158, &v156, 0.00000011921);
  uint64_t v16 = v157;
  if (v157 && !atomic_fetch_add(&v157->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  if ((void)v158)
  {
    *((void *)&v158 + 1) = v158;
    operator delete((void *)v158);
  }
  int v17 = *(_DWORD *)v8 - 1;
  if (*(unsigned char *)(v8 + 16) && *(_DWORD *)(v8 + 12) < v17) {
    int v17 = *(_DWORD *)(v8 + 12);
  }
  sub_24C69C534(v137, (uint64_t *)&v154);
  if (v17 < 1) {
    goto LABEL_90;
  }
  uint64_t v18 = 0;
  int v134 = v17;
  while (2)
  {
    uint64_t v20 = *(char **)v10;
    if (!*(void *)v10) {
      goto LABEL_41;
    }
    int32x4_t v21 = *(char **)(v8 + 200);
    uint64_t v22 = *(char **)v10;
    if (v21 != v20)
    {
      while (1)
      {
        int32x4_t v23 = (std::__shared_weak_count *)*((void *)v21 - 1);
        if (v23)
        {
          if (!atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
            break;
          }
        }
        int32x4_t v24 = (void *)*((void *)v21 - 5);
        if (v24) {
          goto LABEL_36;
        }
LABEL_32:
        v21 -= 48;
        if (v21 == v20)
        {
          uint64_t v22 = *(char **)v10;
          goto LABEL_40;
        }
      }
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
      int32x4_t v24 = (void *)*((void *)v21 - 5);
      if (!v24) {
        goto LABEL_32;
      }
LABEL_36:
      *((void *)v21 - 4) = v24;
      operator delete(v24);
      goto LABEL_32;
    }
LABEL_40:
    *(void *)(v8 + 200) = v20;
    operator delete(v22);
LABEL_41:
    *(void *)uint64_t v10 = 0;
    *(void *)(v10 + 8) = 0;
    *(void *)(v10 + 16) = 0;
    uint64_t v25 = *((void *)&v154 + 1);
    uint64_t v26 = v154;
    if ((void)v154 != *((void *)&v154 + 1))
    {
      int v27 = 0;
      while (1)
      {
        int8x16_t v28 = (uint64_t *)(v26 + 8);
        if (!*(unsigned char *)(v8 + 8)) {
          break;
        }
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
        int v33 = *(_DWORD *)(*(void *)(v26 + 16) - 4);
        int v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 32))(v29, v30, v31);
        uint64_t v32 = *v28;
        if (v33 != v34 || (unint64_t)(*(void *)(v26 + 16) - v32) < 5) {
          goto LABEL_61;
        }
        float v35 = *(float *)v26;
        __p = 0;
        v152 = 0;
        v153 = 0;
        uint64_t v37 = *(unsigned char **)(v26 + 8);
        uint64_t v36 = *(unsigned char **)(v26 + 16);
        int64_t v38 = v36 - v37;
        if (v36 != v37)
        {
          if (v38 < 0) {
            sub_24C667470();
          }
          __p = operator new(v36 - v37);
          v152 = (std::__shared_weak_count *)__p;
          id v39 = (std::__shared_weak_count *)((char *)__p + 4 * (v38 >> 2));
          v153 = v39;
          memcpy(__p, v37, v38);
          v152 = v39;
        }
        uint64_t v149 = *(void *)(v26 + 32);
        v40 = *(std::__shared_weak_count **)(v26 + 40);
        v150 = v40;
        if (v40) {
          atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        sub_24C69C320(v137, &__p, &v149, v35);
        uint64_t v41 = v150;
        if (v150 && !atomic_fetch_add(&v150->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
          std::__shared_weak_count::__release_weak(v41);
          ++v27;
          uint64_t v42 = (std::__shared_weak_count *)__p;
          if (!__p) {
            goto LABEL_44;
          }
LABEL_60:
          v152 = v42;
          operator delete(v42);
          goto LABEL_44;
        }
        ++v27;
        uint64_t v42 = (std::__shared_weak_count *)__p;
        if (__p) {
          goto LABEL_60;
        }
LABEL_44:
        v26 += 48;
        if (v26 == v25) {
          goto LABEL_74;
        }
      }
      uint64_t v32 = *v28;
LABEL_61:
      sub_24C6B0FF0((uint64_t)v145, v8, v32, *(void *)(v26 + 16), v136, v18, v26 + 32);
      int v43 = v148;
      if (v148)
      {
        (***(void (****)(void, void **))(v8 + 152))(*(void *)(v8 + 152), v145);
        sub_24C69CC48(v8, (uint64_t)v145, v26 + 8, *(float *)v26);
        v44 = v147;
        if (!v147) {
          goto LABEL_68;
        }
      }
      else
      {
        uint64_t v45 = sub_24C69662C();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          sub_24C729FBC(&buf, v144, v45);

          v44 = v147;
          if (!v147) {
            goto LABEL_68;
          }
        }
        else
        {

          v44 = v147;
          if (!v147) {
            goto LABEL_68;
          }
        }
      }
      if (!atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
        std::__shared_weak_count::__release_weak(v44);
      }
LABEL_68:
      if (v145[0])
      {
        v145[1] = v145[0];
        operator delete(v145[0]);
      }
      if (!v43)
      {
LABEL_74:
        uint64_t v47 = *(void *)(v8 + 192);
        uint64_t v46 = *(void *)(v8 + 200);
        int v17 = v134;
        goto LABEL_76;
      }
      goto LABEL_44;
    }
    uint64_t v47 = 0;
    uint64_t v46 = 0;
    int v27 = 0;
LABEL_76:
    if (v27 != -1431655765 * ((unint64_t)(v46 - v47) >> 4))
    {
      sub_24C69C534(v137, (uint64_t *)v145);
      uint64_t v48 = v154;
      if (!(void)v154) {
        goto LABEL_28;
      }
      uint64_t v49 = *((void *)&v154 + 1);
      unint64_t v19 = (void *)v154;
      if (*((void *)&v154 + 1) != (void)v154)
      {
        while (1)
        {
          uint64_t v50 = *(std::__shared_weak_count **)(v49 - 8);
          if (v50)
          {
            if (!atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
              break;
            }
          }
          v51 = *(void **)(v49 - 40);
          if (v51) {
            goto LABEL_84;
          }
LABEL_80:
          v49 -= 48;
          if (v49 == v48)
          {
            unint64_t v19 = (void *)v154;
            goto LABEL_27;
          }
        }
        ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
        std::__shared_weak_count::__release_weak(v50);
        v51 = *(void **)(v49 - 40);
        if (!v51) {
          goto LABEL_80;
        }
LABEL_84:
        *(void *)(v49 - 32) = v51;
        operator delete(v51);
        goto LABEL_80;
      }
LABEL_27:
      *((void *)&v154 + 1) = v48;
      operator delete(v19);
LABEL_28:
      long long v154 = *(_OWORD *)v145;
      int64_t v155 = v146;
      uint64_t v18 = (v18 + 1);
      if (v18 == v17) {
        goto LABEL_90;
      }
      continue;
    }
    break;
  }
  uint64_t v52 = sub_24C69662C();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    sub_24C729F44(v18, v52);
  }

LABEL_90:
  uint64_t v53 = v154;
  if (!(void)v154) {
    goto LABEL_102;
  }
  uint64_t v54 = *((void *)&v154 + 1);
  uint64_t v55 = (void *)v154;
  if (*((void *)&v154 + 1) == (void)v154) {
    goto LABEL_101;
  }
  do
  {
    v56 = *(std::__shared_weak_count **)(v54 - 8);
    if (!v56 || atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v57 = *(void **)(v54 - 40);
      if (!v57) {
        goto LABEL_93;
      }
LABEL_97:
      *(void *)(v54 - 32) = v57;
      operator delete(v57);
      goto LABEL_93;
    }
    ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
    std::__shared_weak_count::__release_weak(v56);
    uint64_t v57 = *(void **)(v54 - 40);
    if (v57) {
      goto LABEL_97;
    }
LABEL_93:
    v54 -= 48;
  }
  while (v54 != v53);
  uint64_t v55 = (void *)v154;
LABEL_101:
  *((void *)&v154 + 1) = v53;
  operator delete(v55);
LABEL_102:
  sub_24C69C0F0(v137, (uint64_t)&v141);
  if (v140 && !atomic_fetch_add(&v140->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v140->__on_zero_shared)(v140);
    std::__shared_weak_count::__release_weak(v140);
  }
  id v132 = objc_alloc_init(MEMORY[0x263EFF980]);
  v62 = (_DWORD **)v141;
  v131 = (_DWORD **)v142;
  if (v141 == v142) {
    goto LABEL_199;
  }
  while (2)
  {
    HIBYTE(v146) = 0;
    LOBYTE(v145[0]) = 0;
    v63 = v62;
    uint64_t v64 = *v62;
    v133 = v63;
    uint64_t v65 = v63[1];
    v138 = v65;
    while (2)
    {
      if (v64 != v65)
      {
        if (*v64)
        {
          v66 = v136->_procUtils;
          if (v66)
          {
            objc_msgSend_vocabulary(v66, v58, v59, v60, v61);
            v66 = __p;
          }
          else
          {
            __p = 0;
            v152 = 0;
          }
          (*(void (**)(long long *__return_ptr))(*(void *)v66 + 40))(&v154);
          uint64_t v67 = HIBYTE(v155);
          if (v155 >= 0) {
            size_t v68 = 22;
          }
          else {
            size_t v68 = (v155 & 0x7FFFFFFFFFFFFFFFLL) - 1;
          }
          if (v155 < 0) {
            uint64_t v67 = *((void *)&v154 + 1);
          }
          if (v68 == v67)
          {
            if (v68 == 0x7FFFFFFFFFFFFFF6) {
              sub_24C6673C8();
            }
            unint64_t v69 = v68 + 1;
            if (v155 >= 0) {
              v70 = &v154;
            }
            else {
              v70 = (long long *)v154;
            }
            if (v68 >= 0x3FFFFFFFFFFFFFF3)
            {
              size_t v72 = 0x7FFFFFFFFFFFFFF7;
            }
            else
            {
              unint64_t v71 = 2 * v68;
              if (v69 > 2 * v68) {
                unint64_t v71 = v68 + 1;
              }
              if (v71 >= 0x17)
              {
                unint64_t v76 = (v71 & 0xFFFFFFFFFFFFFFF8) + 8;
                uint64_t v77 = v71 | 7;
                if (v77 == 23) {
                  uint64_t v77 = v76;
                }
                size_t v72 = v77 + 1;
              }
              else
              {
                size_t v72 = 23;
              }
            }
            v78 = operator new(v72);
            v79 = v78;
            if (v68)
            {
              memmove(v78, v70, v68);
              v79[v68] = 32;
              if (v68 == 22)
              {
LABEL_145:
                *((void *)&v154 + 1) = v68 + 1;
                int64_t v155 = v72 | 0x8000000000000000;
                *(void *)&long long v154 = v79;
                uint64_t v75 = &v79[v69];
                goto LABEL_146;
              }
            }
            else
            {
              unsigned char *v78 = 32;
            }
            operator delete(v70);
            goto LABEL_145;
          }
          v73 = &v154;
          if (v155 < 0) {
            v73 = (long long *)v154;
          }
          *((unsigned char *)v73 + v67) = 32;
          uint64_t v74 = v67 + 1;
          if (SHIBYTE(v155) < 0) {
            *((void *)&v154 + 1) = v74;
          }
          else {
            HIBYTE(v155) = v74 & 0x7F;
          }
          uint64_t v75 = (char *)v73 + v74;
LABEL_146:
          *uint64_t v75 = 0;
          v159 = (_DWORD *)v155;
          long long v158 = v154;
          int64_t v155 = 0;
          long long v154 = 0uLL;
          int v80 = SHIBYTE(v159);
          v135 = (void *)v158;
          if (SHIBYTE(v159) >= 0) {
            v81 = &v158;
          }
          else {
            v81 = (long long *)v158;
          }
          if (SHIBYTE(v159) >= 0) {
            size_t v82 = HIBYTE(v159);
          }
          else {
            size_t v82 = *((void *)&v158 + 1);
          }
          if (v146 >= 0) {
            unint64_t v83 = 22;
          }
          else {
            unint64_t v83 = (v146 & 0x7FFFFFFFFFFFFFFFLL) - 1;
          }
          if (v146 >= 0) {
            size_t v84 = HIBYTE(v146);
          }
          else {
            size_t v84 = (size_t)v145[1];
          }
          if (v83 - v84 >= v82)
          {
            if (v82)
            {
              if (v146 >= 0) {
                v89 = v145;
              }
              else {
                v89 = (void **)v145[0];
              }
              memmove((char *)v89 + v84, v81, v82);
              size_t v90 = v84 + v82;
              if (SHIBYTE(v146) < 0) {
                v145[1] = (void *)(v84 + v82);
              }
              else {
                HIBYTE(v146) = v90 & 0x7F;
              }
              v91 = (char *)v89 + v90;
              goto LABEL_184;
            }
          }
          else
          {
            unint64_t v85 = v84 + v82;
            if (0x7FFFFFFFFFFFFFF6 - v83 < v84 + v82 - v83) {
              sub_24C6673C8();
            }
            if (v146 >= 0) {
              uint64_t v86 = v145;
            }
            else {
              uint64_t v86 = (void **)v145[0];
            }
            if (v83 >= 0x3FFFFFFFFFFFFFF3)
            {
              uint64_t v92 = 0x7FFFFFFFFFFFFFF6;
            }
            else
            {
              unint64_t v87 = 2 * v83;
              if (v85 > 2 * v83) {
                unint64_t v87 = v84 + v82;
              }
              if (v87 < 0x17)
              {
                size_t v88 = 23;
                goto LABEL_179;
              }
              unint64_t v93 = (v87 & 0xFFFFFFFFFFFFFFF8) + 8;
              uint64_t v92 = v87 | 7;
              if (v92 == 23) {
                uint64_t v92 = v93;
              }
            }
            size_t v88 = v92 + 1;
LABEL_179:
            v94 = (char *)operator new(v88);
            v95 = v94;
            if (v84) {
              memmove(v94, v86, v84);
            }
            memcpy(&v95[v84], v81, v82);
            if (v83 != 22) {
              operator delete(v86);
            }
            v145[1] = (void *)(v84 + v82);
            int64_t v146 = v88 | 0x8000000000000000;
            v145[0] = v95;
            v91 = &v95[v85];
LABEL_184:
            char *v91 = 0;
          }
          if (v80 < 0)
          {
            operator delete(v135);
            if (SHIBYTE(v155) < 0) {
              goto LABEL_190;
            }
LABEL_187:
            v96 = v152;
            if (v152)
            {
LABEL_191:
              if (!atomic_fetch_add(&v96->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
                std::__shared_weak_count::__release_weak(v96);
              }
            }
          }
          else
          {
            if ((SHIBYTE(v155) & 0x80000000) == 0) {
              goto LABEL_187;
            }
LABEL_190:
            operator delete((void *)v154);
            v96 = v152;
            if (v152) {
              goto LABEL_191;
            }
          }
        }
        ++v64;
        uint64_t v65 = v138;
        continue;
      }
      break;
    }
    MEMORY[0x2532F8850](&v154);
    LODWORD(v158) = 0x4000;
    std::locale::locale((std::locale *)&v158 + 1, (const std::locale *)&v154);
    sub_24C69EE20((unsigned __int8 *)v145, (const std::locale *)&v158);
    std::locale::~locale((std::locale *)&v158 + 1);
    std::locale::~locale((std::locale *)&v154);
    MEMORY[0x2532F8850]();
    LODWORD(v158) = 0x4000;
    std::locale::locale((std::locale *)&v158 + 1, (const std::locale *)&v154);
    sub_24C69F02C((char *)v145, (const std::locale *)&v158);
    std::locale::~locale((std::locale *)&v158 + 1);
    std::locale::~locale((std::locale *)&v154);
    v97 = NSString;
    int v98 = SHIBYTE(v146);
    v99 = v145[0];
    uint64_t v105 = objc_msgSend_defaultCStringEncoding(NSString, v100, v101, v102, v103);
    if (v98 >= 0) {
      objc_msgSend_stringWithCString_encoding_(v97, v104, (uint64_t)v145, v105, v106);
    }
    else {
    v107 = objc_msgSend_stringWithCString_encoding_(v97, v104, (uint64_t)v99, v105, v106);
    }
    v108 = [CSUCaptionResult alloc];
    LODWORD(v109) = *((_DWORD *)v133 + 6);
    v113 = objc_msgSend_initWithCaption_score_(v108, v110, (uint64_t)v107, v111, v112, v109);
    objc_msgSend_addObject_(v132, v114, (uint64_t)v113, v115, v116);

    if (SHIBYTE(v146) < 0) {
      operator delete(v145[0]);
    }
    v62 = v133 + 4;
    if (v133 + 4 != v131) {
      continue;
    }
    break;
  }
LABEL_199:
  v117 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v58, (uint64_t)v132, v60, v61);
  v121 = objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v118, (uint64_t)v117, v119, v120);

  id v122 = v121;
  v123 = (char *)v141;
  if (v141)
  {
    v124 = v142;
    v125 = v141;
    if (v142 != v141)
    {
      v126 = v142;
      do
      {
        v128 = (void *)*((void *)v126 - 4);
        v126 -= 32;
        v127 = v128;
        if (v128)
        {
          *(v124 - 3) = v127;
          operator delete(v127);
        }
        v124 = v126;
      }
      while (v126 != v123);
      v125 = v141;
    }
    v142 = v123;
    operator delete(v125);
  }
  operator delete(v130);
  return v122;
}

- (id)getCaptionsAfterGreedyDecodingOnEncodedFeatures
{
  v2 = sub_24C69662C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_24C72A6C8(v2);
  }

  return 0;
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
    int32x4_t v24 = sub_24C69662C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_24C72A70C(v24);
    }

    id v23 = v6;
  }

  return v23;
}

- (CSUImageCaptionDecoderAXKVCacheE1Network)decoderNetObj
{
  return self->_decoderNetObj;
}

- (void)setDecoderNetObj:(id)a3
{
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
  objc_storeStrong((id *)&self->_decoderNetObj, 0);
  self->_encodedFeaturesBuffer._vptr$Tensor = (void **)&unk_26FEDD950;
  cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    begin = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
    if (!begin) {
      return;
    }
  }
  else
  {
    begin = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
    if (!begin) {
      return;
    }
  }
  self->_encodedFeaturesBuffer.shape_.sizes_.__end_ = begin;
  operator delete(begin);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 4;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((void *)self + 7) = 0;
  *((void *)self + 1) = &unk_26FEDD7F0;
  return self;
}

@end