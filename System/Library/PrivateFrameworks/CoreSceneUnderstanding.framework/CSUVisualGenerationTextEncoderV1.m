@interface CSUVisualGenerationTextEncoderV1
- (BOOL)loadResources:(id *)a3;
- (CSUVisualGenerationTextEncoderV1)initWithConfiguration:(id)a3;
- (CSUVisualGenerationTextEncoderV1Configuration)configuration;
- (id).cxx_construct;
- (unordered_map<std::string,)_inputTokenTensorsWithTokenIDs:()std:()std:(std:(ik:(CSUVisualGenerationTextEncoderV1 *)self :(SEL)a3 Tensor>>> *__return_ptr)retstr :(vector<unsigned)int allocator<std:(std::allocator<unsigned int>> *)a4 :pair<const)std::string :equal_to<std::string> :hash<std::string>;
- (vector<unsigned)getTokenIDsOnText:(CSUVisualGenerationTextEncoderV1 *)self withBOS:(SEL)a3 withEOS:(id)a4 withError:(BOOL)a5;
- (void)_unsafeRunOnInput:(id)a3 completion:(id)a4;
- (void)runOnInput:(id)a3 completion:(id)a4;
@end

@implementation CSUVisualGenerationTextEncoderV1

- (CSUVisualGenerationTextEncoderV1)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUVisualGenerationTextEncoderV1;
  v6 = [(CSUVisualGenerationTextEncoderV1 *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (vector<unsigned)getTokenIDsOnText:(CSUVisualGenerationTextEncoderV1 *)self withBOS:(SEL)a3 withEOS:(id)a4 withError:(BOOL)a5
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  if ((objc_msgSend_loadResources_(self, v13, (uint64_t)a7, v14, v15) & 1) == 0)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    goto LABEL_34;
  }
  BOOL v66 = v8;
  if (objc_msgSend_inputIsLowerCase(self->_configuration, v16, v17, v18, v19))
  {
    uint64_t v24 = objc_msgSend_lowercaseString(v12, v20, v21, v22, v23);

    id v12 = (id)v24;
  }
  value = self->_vocabulary.__ptr_.__value_;
  id v12 = v12;
  v30 = (const char *)objc_msgSend_UTF8String(v12, v26, v27, v28, v29);
  size_t v31 = strlen(v30);
  if (v31 >= 0x7FFFFFFFFFFFFFF8) {
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
    p_dst = (void **)operator new(v34 + 1);
    size_t v68 = v32;
    unint64_t v69 = v35 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_12;
  }
  HIBYTE(v69) = v31;
  p_dst = (void **)&__dst;
  if (v31) {
LABEL_12:
  }
    memmove(p_dst, v30, v32);
  *((unsigned char *)p_dst + v32) = 0;
  (*(void (**)(void **__return_ptr, SentencePieceVocabulary *, void ***, void))(*(void *)value + 16))(&__p, value, &__dst, 0);
  if ((SHIBYTE(v69) & 0x80000000) == 0)
  {
    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  operator delete(__dst);
  if (v9)
  {
LABEL_17:
    LODWORD(__dst) = 1;
    sub_24C678294(&__p, __p, &__dst);
  }
LABEL_18:
  v41 = __p;
  v40 = v71;
  if (objc_msgSend_maximumSequenceLength(self->_configuration, v36, v37, v38, v39) >= (unint64_t)((v40 - v41) >> 2))
  {
    v55 = __p;
    v56 = &v71[4 * v66 - 4];
    size_t v68 = 0;
    unint64_t v69 = 0;
    __dst = 0;
    int64_t v57 = v56 - (unsigned char *)__p;
    if (v56 == __p)
    {
      v59 = 0;
      v58 = 0;
    }
    else
    {
      if (v57 < 0) {
        sub_24C667470();
      }
      v58 = (char *)operator new(v56 - (unsigned char *)__p);
      v59 = &v58[4 * (v57 >> 2)];
      memmove(v58, v55, v57);
    }
    unint64_t v60 = objc_msgSend_maximumSequenceLength(self->_configuration, v42, v43, v44, v45);
    if (v60 >= (v59 - v58) >> 2) {
      uint64_t v61 = (v59 - v58) >> 2;
    }
    else {
      uint64_t v61 = v60;
    }
    NSLog(&cfstr_TokenizedQuery.isa, v12, v61);
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    if (v61)
    {
      if (v61 < 0) {
        sub_24C667470();
      }
      size_t v62 = 4 * v61;
      v63 = (unsigned int *)operator new(4 * v61);
      retstr->var0 = v63;
      v64 = &v63[v61];
      retstr->var2.var0 = v64;
      memcpy(v63, v58, v62);
      retstr->var1 = v64;
    }
    if (v58) {
      operator delete(v58);
    }
  }
  else
  {
    v46 = NSString;
    uint64_t v47 = objc_msgSend_maximumSequenceLength(self->_configuration, v42, v43, v44, v45);
    v51 = objc_msgSend_stringWithFormat_(v46, v48, @"input text exceeded max allowed length %zu", v49, v50, v47);
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v52, (uint64_t)v51, v53, v54);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  if (__p)
  {
    v71 = (char *)__p;
    operator delete(__p);
  }
LABEL_34:

  return result;
}

- (unordered_map<std::string,)_inputTokenTensorsWithTokenIDs:()std:()std:(std:(ik:(CSUVisualGenerationTextEncoderV1 *)self :(SEL)a3 Tensor>>> *__return_ptr)retstr :(vector<unsigned)int allocator<std:(std::allocator<unsigned int>> *)a4 :pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_maximumSequenceLength(self->_configuration, a3, (uint64_t)a4, v4, v5);
  objc_super v10 = operator new(0x10uLL);
  *objc_super v10 = 1;
  v10[1] = v9;
  *((void *)&__p + 1) = v10 + 2;
  uint64_t v54 = v10 + 2;
  *(void *)&long long __p = v10;
  sub_24C67C2DC((int32x4_t **)&__p, (uint64_t)&v47, 0);
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (v48 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v51 + 24))(v51);
  (*(void (**)(long long *__return_ptr))(*(void *)v51 + 32))(&__p);
  sub_24C67C4BC(&v42, v11, (uint64_t)&__p);
  v42 = (uint64_t (**)())&unk_26FEDD1C0;
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  var0 = a4->var0;
  var1 = a4->var1;
  if (a4->var0 != var1)
  {
    if (v46 != 2)
    {
      v40 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v40, "Invalid number of indices provided.");
      __cxa_throw(v40, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    uint64_t v18 = 0;
    uint64_t v19 = v43;
    uint64_t v20 = *((void *)v44 + 1);
    unint64_t v21 = (char *)var1 - (char *)var0 - 4;
    if (v21 < 0x1C) {
      goto LABEL_13;
    }
    if (v20 != 1) {
      goto LABEL_13;
    }
    uint64_t v22 = (v21 >> 2) + 1;
    uint64_t v18 = v22 & 0x7FFFFFFFFFFFFFF8;
    uint64_t v23 = &var0[v22 & 0x7FFFFFFFFFFFFFF8];
    uint64_t v24 = v43 + 1;
    v25 = (uint32x4_t *)(var0 + 4);
    uint64_t v26 = v22 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      float32x4_t v27 = vcvtq_f32_u32(*v25);
      v24[-1] = vcvtq_f32_u32(v25[-1]);
      *uint64_t v24 = v27;
      v24 += 2;
      v25 += 2;
      v26 -= 8;
    }
    while (v26);
    var0 = v23;
    if (v22 != v18)
    {
LABEL_13:
      uint64_t v28 = &v19->f32[v18 * v20];
      uint64_t v29 = 4 * v20;
      do
      {
        unsigned int v30 = *var0++;
        *uint64_t v28 = (float)v30;
        uint64_t v28 = (float *)((char *)v28 + v29);
      }
      while (var0 != var1);
    }
  }
  objc_msgSend_inputTextIDTensorName(self->_configuration, v12, v13, v14, v15);
  id v31 = objc_claimAutoreleasedReturnValue();
  v41 = (const char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35);
  sub_24C6C8078((uint64_t)&__p, &v41, (uint64_t)&v47);
  retstr->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
  retstr->__table_.__p3_.__value_ = 1.0;
  sub_24C672C8C((uint64_t)retstr, (uint64_t)&__p, &__p);
  v55 = &unk_26FEDD950;
  v36 = v58;
  if (v58 && !atomic_fetch_add(&v58->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
    std::__shared_weak_count::__release_weak(v36);
  }
  if (v56)
  {
    int64_t v57 = v56;
    operator delete(v56);
  }
  if (SHIBYTE(v54) < 0) {
    operator delete((void *)__p);
  }

  v42 = off_26FEDD970;
  if (v44)
  {
    uint64_t v45 = v44;
    operator delete(v44);
  }
  uint64_t v47 = &unk_26FEDD950;
  uint64_t v37 = v52;
  if (v52 && !atomic_fetch_add(&v52->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
    std::__shared_weak_count::__release_weak(v37);
  }
  result = (unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *)v49;
  if (v49)
  {
    uint64_t v50 = v49;
    operator delete(v49);
  }
  return result;
}

- (BOOL)loadResources:(id *)a3
{
  if (!self->_textEncoderNet.__ptr_.__value_)
  {
    objc_msgSend_vocabularyModelPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
    id v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v5, v6, v7, v8, v9);
    sub_24C6DD774();
  }
  return 1;
}

- (void)_unsafeRunOnInput:(id)a3 completion:(id)a4
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v99 = a3;
  v100 = (void (**)(id, void, id))a4;
  v101 = self;
  id v123 = 0;
  char Resources = objc_msgSend_loadResources_(self, v6, (uint64_t)&v123, v7, v8);
  id v10 = v123;
  if ((Resources & 1) == 0)
  {
    v100[2](v100, 0, v10);
    goto LABEL_42;
  }
  v120 = 0;
  v121 = 0;
  uint64_t v122 = 0;
  v117 = 0;
  v118 = 0;
  v119 = 0;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v11 = v99;
  id v97 = v11;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v113, (uint64_t)v124, 16);
  if (!v13)
  {
    id v54 = v10;
    goto LABEL_44;
  }
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v114;
  uint64_t v98 = *(void *)v114;
  while (2)
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v114 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(id *)(*((void *)&v113 + 1) + 8 * v16);
      uint64_t v22 = objc_msgSend_string(v17, v18, v19, v20, v21);
      uint64_t v27 = objc_msgSend_count(v11, v23, v24, v25, v26);
      id v112 = v10;
      objc_msgSend_getTokenIDsOnText_withBOS_withEOS_withError_(v101, v28, (uint64_t)v22, v14 == 0, v14 == v27 - 1, &v112);
      id v29 = v112;

      if (v29)
      {
        v100[2](v100, 0, v29);
        uint64_t v34 = (char *)__p;
        if (!__p) {
          goto LABEL_10;
        }
LABEL_9:
        v111 = v34;
        operator delete(v34);
        goto LABEL_10;
      }
      int shouldReturnMask = objc_msgSend_shouldReturnMask(v17, v30, v31, v32, v33);
      uint64_t v37 = v121;
      uint64_t v38 = (char *)__p;
      uint64_t v39 = v111;
      if (shouldReturnMask)
      {
        uint64_t v40 = (v121 - v120) >> 2;
        uint64_t v41 = v40 + ((v111 - (unsigned char *)__p) >> 2);
        v42 = v118;
        if (v118 < v119)
        {
          uint64_t *v118 = v40;
          v42[1] = v41;
          uint64_t v43 = v42 + 2;
          uint64_t v15 = v98;
LABEL_29:
          v118 = v43;
          uint64_t v37 = v121;
          uint64_t v38 = (char *)__p;
          uint64_t v39 = v111;
          goto LABEL_30;
        }
        uint64_t v44 = v117;
        uint64_t v45 = ((char *)v118 - (unsigned char *)v117) >> 4;
        unint64_t v46 = v45 + 1;
        if ((unint64_t)(v45 + 1) >> 60) {
          sub_24C667470();
        }
        uint64_t v47 = (char *)v119 - (unsigned char *)v117;
        if (((char *)v119 - (unsigned char *)v117) >> 3 > v46) {
          unint64_t v46 = v47 >> 3;
        }
        if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v48 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v48 = v46;
        }
        if (v48)
        {
          uint64_t v96 = v40 + ((v111 - (unsigned char *)__p) >> 2);
          if (v48 >> 60) {
            sub_24C66DB48();
          }
          unint64_t v49 = v48;
          uint64_t v50 = (char *)operator new(16 * v48);
          unint64_t v48 = v49;
          uint64_t v51 = (uint64_t *)&v50[16 * v45];
          uint64_t *v51 = v40;
          v51[1] = v96;
          v52 = v51;
          if (v42 != v44)
          {
LABEL_25:
            id v11 = v97;
            uint64_t v15 = v98;
            do
            {
              *((_OWORD *)v52 - 1) = *((_OWORD *)v42 - 1);
              v52 -= 2;
              v42 -= 2;
            }
            while (v42 != v44);
            v42 = v117;
            uint64_t v43 = v51 + 2;
            v117 = v52;
            v118 = v51 + 2;
            v119 = (uint64_t *)&v50[16 * v48];
            if (!v42) {
              goto LABEL_29;
            }
LABEL_28:
            operator delete(v42);
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v50 = 0;
          uint64_t v51 = (uint64_t *)(16 * v45);
          uint64_t *v51 = v40;
          v51[1] = v41;
          v52 = (uint64_t *)(16 * v45);
          if (v42 != v44) {
            goto LABEL_25;
          }
        }
        id v11 = v97;
        uint64_t v15 = v98;
        uint64_t v43 = v51 + 2;
        v117 = v52;
        v118 = v51 + 2;
        v119 = (uint64_t *)&v50[16 * v48];
        if (!v42) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
LABEL_30:
      sub_24C67C730((unint64_t *)&v120, v37, v38, v39, (v39 - v38) >> 2);
      ++v14;
      uint64_t v34 = (char *)__p;
      if (__p) {
        goto LABEL_9;
      }
LABEL_10:

      if (v29)
      {

        id v10 = v29;
        v55 = (uint64_t *)v117;
        if (!v117) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
      id v10 = 0;
      ++v16;
    }
    while (v16 != v13);
    uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v35, (uint64_t)&v113, (uint64_t)v124, 16);
    uint64_t v13 = v53;
    id v10 = 0;
    id v54 = 0;
    if (v53) {
      continue;
    }
    break;
  }
LABEL_44:

  v108 = 0;
  v109 = 0;
  v107 = 0;
  uint64_t v59 = v120;
  int64_t v60 = v121 - v120;
  if (v121 != v120)
  {
    if (v60 < 0) {
      sub_24C667470();
    }
    v107 = operator new(v121 - v120);
    v109 = (char *)v107 + 4 * (v60 >> 2);
    memcpy(v107, v59, v60);
    v108 = v109;
  }
  objc_msgSend__inputTokenTensorsWithTokenIDs_(v101, v56, (uint64_t)&v107, v57, v58);
  if (v107)
  {
    v108 = v107;
    operator delete(v107);
  }
  sub_24C66D4AC((uint64_t)v101->_textEncoderNet.__ptr_.__value_, (uint64_t)&__p, (uint64_t)v106);
  uint64_t v61 = [CSUVisualGenerationTextEncoderV1NetworkOutput alloc];
  objc_msgSend_outputLastHiddenState(v101->_configuration, v62, v63, v64, v65);
  id v66 = objc_claimAutoreleasedReturnValue();
  v71 = (const char *)objc_msgSend_UTF8String(v66, v67, v68, v69, v70);
  size_t v72 = strlen(v71);
  if (v72 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  v73 = (void *)v72;
  if (v72 >= 0x17)
  {
    uint64_t v75 = (v72 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v72 | 7) != 0x17) {
      uint64_t v75 = v72 | 7;
    }
    uint64_t v76 = v75 + 1;
    v74 = (void **)operator new(v75 + 1);
    __dst[1] = v73;
    unint64_t v105 = v76 | 0x8000000000000000;
    __dst[0] = v74;
    goto LABEL_56;
  }
  HIBYTE(v105) = v72;
  v74 = __dst;
  if (v72) {
LABEL_56:
  }
    memmove(v74, v71, (size_t)v73);
  *((unsigned char *)v73 + (void)v74) = 0;
  v81 = sub_24C66F7E4(v106, (uint64_t)__dst);
  if (!v81) {
    sub_24C66DE30("unordered_map::at: key not found");
  }
  objc_msgSend_outputCLIPPooledLayer(v101->_configuration, v77, v78, v79, v80);
  id v82 = objc_claimAutoreleasedReturnValue();
  v87 = (const char *)objc_msgSend_UTF8String(v82, v83, v84, v85, v86);
  size_t v88 = strlen(v87);
  if (v88 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  v89 = (void *)v88;
  if (v88 >= 0x17)
  {
    uint64_t v91 = (v88 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v88 | 7) != 0x17) {
      uint64_t v91 = v88 | 7;
    }
    uint64_t v92 = v91 + 1;
    v90 = operator new(v91 + 1);
    v102[1] = v89;
    unint64_t v103 = v92 | 0x8000000000000000;
    v102[0] = v90;
    goto LABEL_65;
  }
  HIBYTE(v103) = v88;
  v90 = v102;
  if (v88) {
LABEL_65:
  }
    memmove(v90, v87, (size_t)v89);
  *((unsigned char *)v89 + (void)v90) = 0;
  v93 = sub_24C66F7E4(v106, (uint64_t)v102);
  if (!v93) {
    sub_24C66DE30("unordered_map::at: key not found");
  }
  HiddenLayer_PooledCLIPEmbedding_MaskIndices = objc_msgSend_initWithLastHiddenLayer_PooledCLIPEmbedding_MaskIndices_(v61, v94, (uint64_t)(v81 + 5), (uint64_t)(v93 + 5), (uint64_t)&v117);
  if (SHIBYTE(v103) < 0) {
    operator delete(v102[0]);
  }

  if (SHIBYTE(v105) < 0) {
    operator delete(__dst[0]);
  }

  ((void (**)(id, void *, id))v100)[2](v100, HiddenLayer_PooledCLIPEmbedding_MaskIndices, v54);
  sub_24C6717DC((uint64_t)v106);
  sub_24C6717DC((uint64_t)&__p);
  id v10 = v54;
  v55 = (uint64_t *)v117;
  if (v117)
  {
LABEL_39:
    v118 = v55;
    operator delete(v55);
  }
LABEL_40:
  if (v120)
  {
    v121 = v120;
    operator delete(v120);
  }
LABEL_42:
}

- (void)runOnInput:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend__unsafeRunOnInput_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
}

- (CSUVisualGenerationTextEncoderV1Configuration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(SentencePieceVocabulary *))(*(void *)value + 8))(value);
  }
  uint64_t v4 = self->_textEncoderNet.__ptr_.__value_;
  self->_textEncoderNet.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(EspressoNet *))(*(void *)v4 + 8))(v4);
  }
  id v5 = self->_tokenEmbeddingNet.__ptr_.__value_;
  self->_tokenEmbeddingNet.__ptr_.__value_ = 0;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end