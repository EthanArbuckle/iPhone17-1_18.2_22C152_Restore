@interface CSUCLIPTextEncoderV3
- (BOOL)loadResources:(id *)a3;
- (CSUCLIPTextEncoderV3)initWithConfiguration:(id)a3;
- (CSUCLIPTextEncoderV3Configuration)configuration;
- (id).cxx_construct;
- (unordered_map<std::string,)_inputTokenTensorsWithText:()std:()std:(std:(ik:(CSUCLIPTextEncoderV3 *)self :(SEL)a3 Tensor>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>;
- (unordered_map<std::string,)_inputTokenTensorsWithTextBatch:()std:()std:(std:(ik:(CSUCLIPTextEncoderV3 *)self :(SEL)a3 Tensor>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>;
- (void)_unsafeRunOnInputText:(id)a3 completion:(id)a4;
- (void)runOnInputText:(id)a3 completion:(id)a4;
@end

@implementation CSUCLIPTextEncoderV3

- (CSUCLIPTextEncoderV3)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUCLIPTextEncoderV3;
  v6 = [(CSUCLIPTextEncoderV3 *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (unordered_map<std::string,)_inputTokenTensorsWithTextBatch:()std:()std:(std:(ik:(CSUCLIPTextEncoderV3 *)self :(SEL)a3 Tensor>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v111 = a4;
  if (!self->_vocabulary.__ptr_.__value_)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tokenizer called before initializing vocabulary");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  unint64_t v110 = objc_msgSend_maximumSequenceLength(self->_configuration, v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_count(v111, v10, v11, v12, v13);
  v15 = operator new(0x10uLL);
  void *v15 = v14;
  v15[1] = v110;
  *((void *)&v133 + 1) = v15 + 2;
  v134 = v15 + 2;
  *(void *)&long long v133 = v15;
  sub_24C67C2DC((int32x4_t **)&v133, (uint64_t)v129, 0);
  v109 = retstr;
  if ((void)v133)
  {
    *((void *)&v133 + 1) = v133;
    operator delete((void *)v133);
  }
  uint64_t v20 = objc_msgSend_count(v111, v16, v17, v18, v19);
  *((void *)&v133 + 1) = 0;
  v21 = operator new(8uLL);
  void *v21 = v20;
  *(void *)&long long v133 = v21;
  v134 = v21 + 1;
  v22 = operator new(0x10uLL);
  void *v22 = v20;
  v22[1] = v110;
  v23 = v22 + 2;
  *(void *)&long long v133 = v22;
  *((void *)&v133 + 1) = v22 + 2;
  v134 = v22 + 2;
  operator delete(v21);
  *((void *)&v133 + 1) = v23;
  v24.i32[0] = 1.0;
  sub_24C67C2DC((int32x4_t **)&v133, (uint64_t)v125, v24);
  if ((void)v133)
  {
    *((void *)&v133 + 1) = v133;
    operator delete((void *)v133);
  }
  sub_24C6C67B8(&v120, (uint64_t)v129);
  sub_24C6C67B8(&v115, (uint64_t)v125);
  uint64_t v33 = objc_msgSend_count(v111, v25, v26, v27, v28);
  if (v33)
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    while (1)
    {
      v36 = objc_msgSend_objectAtIndexedSubscript_(v111, v29, v35, v31, v32);
      if (objc_msgSend_inputIsLowerCase(self->_configuration, v37, v38, v39, v40))
      {
        uint64_t v45 = objc_msgSend_lowercaseString(v36, v41, v42, v43, v44);

        v36 = (void *)v45;
      }
      value = self->_vocabulary.__ptr_.__value_;
      id v47 = v36;
      v52 = (const char *)objc_msgSend_UTF8String(v47, v48, v49, v50, v51);
      size_t v53 = strlen(v52);
      if (v53 >= 0x7FFFFFFFFFFFFFF8) {
        sub_24C6673C8();
      }
      v54 = (const char *)v53;
      if (v53 >= 0x17) {
        break;
      }
      HIBYTE(v114) = v53;
      v55 = (char *)__dst;
      if (v53) {
        goto LABEL_17;
      }
LABEL_18:
      v54[(void)v55] = 0;
      (*(void (**)(long long *__return_ptr, SentencePieceVocabulary *, const char **, void))(*(void *)value + 16))(&v133, value, __dst, 0);
      long long v58 = v133;
      v134 = 0;
      long long v133 = 0uLL;
      if (SHIBYTE(v114) < 0) {
        operator delete((void *)__dst[0]);
      }
      if (v110 >= (uint64_t)(*((void *)&v58 + 1) - v58) >> 2) {
        uint64_t v59 = (uint64_t)(*((void *)&v58 + 1) - v58) >> 2;
      }
      else {
        uint64_t v59 = v110;
      }
      v60 = (unsigned int *)(v58 + 4 * v59);
      v62 = self->_vocabulary.__ptr_.__value_;
      if (*((char *)v62 + 55) < 0)
      {
        v63 = (char *)*((void *)v62 + 4);
        uint64_t v64 = *((void *)v62 + 5);
      }
      else
      {
        v63 = (char *)v62 + 32;
        uint64_t v64 = *((unsigned __int8 *)v62 + 55);
      }
      int v61 = *(v60 - 1);
      if (v61 != (*(unsigned int (**)(SentencePieceVocabulary *, char *, uint64_t))(*(void *)v62 + 32))(v62, v63, v64))
      {
        v65 = self->_vocabulary.__ptr_.__value_;
        if (*((char *)v65 + 55) < 0)
        {
          v66 = (char *)*((void *)v65 + 4);
          uint64_t v67 = *((void *)v65 + 5);
        }
        else
        {
          v66 = (char *)v65 + 32;
          uint64_t v67 = *((unsigned __int8 *)v65 + 55);
        }
        *(v60 - 1) = (*(uint64_t (**)(SentencePieceVocabulary *, char *, uint64_t))(*(void *)v65 + 32))(v65, v66, v67);
      }
      NSLog(&cfstr_TokenizedQuery.isa, v47, v59);
      if (!v59)
      {
LABEL_39:
        operator delete((void *)v58);
        goto LABEL_40;
      }
      if (v124 != 2)
      {
        v107 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v107, "Invalid number of indices provided.");
        goto LABEL_81;
      }
      uint64_t v68 = v121;
      uint64_t v69 = *(void *)v122;
      uint64_t v70 = *(void *)v122 * v35;
      if (v119 != 2)
      {
        *(float *)(v121 + 4 * v70) = (float)*(unsigned int *)v58;
        v107 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v107, "Invalid number of indices provided.");
LABEL_81:
        __cxa_throw(v107, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      uint64_t v71 = v116;
      uint64_t v72 = *((void *)v122 + 1);
      uint64_t v74 = *(void *)__p;
      uint64_t v73 = *((void *)__p + 1);
      unint64_t v75 = (v59 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v75 < 0xB)
      {
LABEL_35:
        uint64_t v76 = 0;
        v77 = (unsigned int *)v58;
LABEL_36:
        v78 = (_DWORD *)(v71 + 4 * (v76 * v73 + v74 * v35));
        uint64_t v79 = 4 * v73;
        v80 = (float *)(v68 + 4 * (v76 * v72 + v70));
        do
        {
          unsigned int v81 = *v77++;
          float *v80 = (float)v81;
          _DWORD *v78 = 0;
          v78 = (_DWORD *)((char *)v78 + v79);
          v80 += v72;
        }
        while (v77 != v60);
        goto LABEL_38;
      }
      uint64_t v76 = 0;
      v77 = (unsigned int *)v58;
      if (v72 != 1 || v73 != 1) {
        goto LABEL_36;
      }
      if ((unint64_t)(v116 + v74 * 4 * v35 - (v121 + v69 * 4 * v35)) < 0x20) {
        goto LABEL_35;
      }
      unint64_t v82 = v75 + 1;
      uint64_t v76 = v82 & 0x7FFFFFFFFFFFFFF8;
      v77 = (unsigned int *)(v58 + 4 * (v82 & 0x7FFFFFFFFFFFFFF8));
      v83 = (_OWORD *)(v116 + v74 * v34 + 16);
      v84 = (uint32x4_t *)(v58 + 16);
      v85 = (float32x4_t *)(v121 + v69 * v34 + 16);
      uint64_t v86 = v82 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        float32x4_t v87 = vcvtq_f32_u32(*v84);
        v85[-1] = vcvtq_f32_u32(v84[-1]);
        float32x4_t *v85 = v87;
        *(v83 - 1) = 0uLL;
        _OWORD *v83 = 0uLL;
        v83 += 2;
        v84 += 2;
        v85 += 2;
        v86 -= 8;
      }
      while (v86);
      if (v82 != v76) {
        goto LABEL_36;
      }
LABEL_38:
      if ((void)v58) {
        goto LABEL_39;
      }
LABEL_40:

      ++v35;
      v34 += 4;
      if (v35 == v33) {
        goto LABEL_49;
      }
    }
    uint64_t v56 = (v53 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v53 | 7) != 0x17) {
      uint64_t v56 = v53 | 7;
    }
    uint64_t v57 = v56 + 1;
    v55 = (char *)operator new(v56 + 1);
    __dst[1] = v54;
    unint64_t v114 = v57 | 0x8000000000000000;
    __dst[0] = v55;
LABEL_17:
    memmove(v55, v52, (size_t)v54);
    goto LABEL_18;
  }
LABEL_49:
  objc_msgSend_inputTextIDTensorName(self->_configuration, v29, v30, v31, v32);
  id v88 = objc_claimAutoreleasedReturnValue();
  __dst[0] = (const char *)objc_msgSend_UTF8String(v88, v89, v90, v91, v92);
  sub_24C6C8078((uint64_t)&v133, __dst, (uint64_t)v129);
  objc_msgSend_inputTextIDMaskTensorName(self->_configuration, v93, v94, v95, v96);
  id v97 = objc_claimAutoreleasedReturnValue();
  v112 = (const char *)objc_msgSend_UTF8String(v97, v98, v99, v100, v101);
  sub_24C6C8078((uint64_t)&v139, &v112, (uint64_t)v125);
  v109->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&v109->__table_.__p1_.__value_.__next_ = 0u;
  v109->__table_.__p3_.__value_ = 1.0;
  sub_24C672C8C((uint64_t)v109, (uint64_t)&v133, &v133);
  sub_24C672C8C((uint64_t)v109, (uint64_t)&v139, &v139);
  v141 = &unk_26FEDD950;
  v102 = v144;
  if (v144 && !atomic_fetch_add(&v144->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
    std::__shared_weak_count::__release_weak(v102);
  }
  if (v142)
  {
    v143 = v142;
    operator delete(v142);
  }
  if (v140 < 0) {
    operator delete((void *)v139);
  }
  v135 = &unk_26FEDD950;
  v103 = v138;
  if (v138 && !atomic_fetch_add(&v138->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v103->__on_zero_shared)(v103);
    std::__shared_weak_count::__release_weak(v103);
  }
  if (v136)
  {
    v137 = v136;
    operator delete(v136);
  }
  if (SHIBYTE(v134) < 0) {
    operator delete((void *)v133);
  }

  v115 = off_26FEDD970;
  if (__p)
  {
    v118 = __p;
    operator delete(__p);
  }
  v120 = off_26FEDD970;
  if (v122)
  {
    v123 = v122;
    operator delete(v122);
  }
  v125[0] = &unk_26FEDD950;
  v104 = v128;
  if (v128 && !atomic_fetch_add(&v128->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
    std::__shared_weak_count::__release_weak(v104);
  }
  if (v126)
  {
    v127 = v126;
    operator delete(v126);
  }
  v129[0] = &unk_26FEDD950;
  v105 = v132;
  if (v132 && !atomic_fetch_add(&v132->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
    std::__shared_weak_count::__release_weak(v105);
  }
  if (v130)
  {
    v131 = v130;
    operator delete(v130);
  }

  return result;
}

- (unordered_map<std::string,)_inputTokenTensorsWithText:()std:()std:(std:(ik:(CSUCLIPTextEncoderV3 *)self :(SEL)a3 Tensor>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v13[0] = v5;
  uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, (uint64_t)v13, 1, v7);
  objc_msgSend__inputTokenTensorsWithTextBatch_(self, v9, (uint64_t)v8, v10, v11);

  return result;
}

- (BOOL)loadResources:(id *)a3
{
  if (!self->_textEncoderNet.__ptr_.__value_)
  {
    objc_msgSend_vocabularyModelPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
    id v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v5, v6, v7, v8, v9);
    sub_24C6C6E40();
  }
  return 1;
}

- (void)_unsafeRunOnInputText:(id)a3 completion:(id)a4
{
  uint64_t v149 = *MEMORY[0x263EF8340];
  id v111 = a3;
  v112 = (void (**)(id, void, id))a4;
  id v136 = 0;
  LOBYTE(a4) = objc_msgSend_loadResources_(self, v6, (uint64_t)&v136, v7, v8);
  id v12 = v136;
  if ((a4 & 1) == 0)
  {
    v112[2](v112, 0, v12);
    goto LABEL_78;
  }
  objc_msgSend__inputTokenTensorsWithText_(self, v9, (uint64_t)v111, v10, v11);
  sub_24C66D4AC((uint64_t)self->_tokenEmbeddingNet.__ptr_.__value_, (uint64_t)v135, (uint64_t)v134);
  objc_msgSend_outputTokenEmbeddingIDTensorName(self->_configuration, v13, v14, v15, v16);
  id v17 = objc_claimAutoreleasedReturnValue();
  v22 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
  size_t v23 = strlen(v22);
  if (v23 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v24 = v23;
  if (v23 >= 0x17)
  {
    uint64_t v26 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v23 | 7) != 0x17) {
      uint64_t v26 = v23 | 7;
    }
    uint64_t v27 = v26 + 1;
    p_dst = (long long *)operator new(v26 + 1);
    *((void *)&__dst + 1) = v24;
    unint64_t v138 = v27 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v138) = v23;
  p_dst = &__dst;
  if (v23) {
LABEL_10:
  }
    memmove(p_dst, v22, v24);
  *((unsigned char *)p_dst + v24) = 0;
  uint64_t v28 = sub_24C66F168(v134, (uint64_t)&__dst);
  v29 = v28;
  if (!v28) {
    sub_24C66DE30("unordered_map::at: key not found");
  }
  v127 = &unk_26FEDD950;
  int v128 = *((_DWORD *)v28 + 12);
  v130 = 0;
  v131 = 0;
  v129 = 0;
  uint64_t v31 = (unsigned char *)v28[7];
  uint64_t v30 = (unsigned char *)v28[8];
  int64_t v32 = v30 - v31;
  if (v30 != v31)
  {
    if (v32 < 0) {
      sub_24C667470();
    }
    v129 = operator new(v30 - v31);
    v131 = (char *)v129 + 8 * (v32 >> 3);
    memcpy(v129, v31, v32);
    v130 = v131;
  }
  uint64_t v33 = (std::__shared_weak_count *)v29[11];
  uint64_t v132 = v29[10];
  long long v133 = v33;
  if (v33) {
    atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v127 = &unk_26FEDD7F0;
  if (SHIBYTE(v138) < 0) {
    operator delete((void *)__dst);
  }

  objc_msgSend_outputTokenEmbeddingMaskTensorName(self->_configuration, v34, v35, v36, v37);
  id v38 = objc_claimAutoreleasedReturnValue();
  uint64_t v43 = (const char *)objc_msgSend_UTF8String(v38, v39, v40, v41, v42);
  size_t v44 = strlen(v43);
  if (v44 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v45 = v44;
  if (v44 >= 0x17)
  {
    uint64_t v47 = (v44 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v44 | 7) != 0x17) {
      uint64_t v47 = v44 | 7;
    }
    uint64_t v48 = v47 + 1;
    v46 = (long long *)operator new(v47 + 1);
    *((void *)&__dst + 1) = v45;
    unint64_t v138 = v48 | 0x8000000000000000;
    *(void *)&long long __dst = v46;
    goto LABEL_26;
  }
  HIBYTE(v138) = v44;
  v46 = &__dst;
  if (v44) {
LABEL_26:
  }
    memmove(v46, v43, v45);
  *((unsigned char *)v46 + v45) = 0;
  uint64_t v49 = sub_24C66F168(v134, (uint64_t)&__dst);
  uint64_t v50 = v49;
  if (!v49) {
    sub_24C66DE30("unordered_map::at: key not found");
  }
  v120 = &unk_26FEDD950;
  int v121 = *((_DWORD *)v49 + 12);
  v123 = 0;
  uint64_t v124 = 0;
  v122 = 0;
  v52 = (unsigned char *)v49[7];
  uint64_t v51 = (unsigned char *)v49[8];
  int64_t v53 = v51 - v52;
  if (v51 != v52)
  {
    if (v53 < 0) {
      sub_24C667470();
    }
    v122 = operator new(v51 - v52);
    uint64_t v124 = (char *)v122 + 8 * (v53 >> 3);
    memcpy(v122, v52, v53);
    v123 = v124;
  }
  v54 = (std::__shared_weak_count *)v50[11];
  uint64_t v125 = v50[10];
  v126 = v54;
  if (v54) {
    atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v120 = &unk_26FEDD7F0;
  if (SHIBYTE(v138) < 0) {
    operator delete((void *)__dst);
  }

  value = self->_textEncoderNet.__ptr_.__value_;
  objc_msgSend_inputTokenEmbeddingIDTensorName(self->_configuration, v56, v57, v58, v59);
  id v60 = objc_claimAutoreleasedReturnValue();
  v65 = (const char *)objc_msgSend_UTF8String(v60, v61, v62, v63, v64);
  size_t v66 = strlen(v65);
  if (v66 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v67 = v66;
  if (v66 >= 0x17)
  {
    uint64_t v69 = (v66 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v66 | 7) != 0x17) {
      uint64_t v69 = v66 | 7;
    }
    uint64_t v70 = v69 + 1;
    p_p = operator new(v69 + 1);
    *((void *)&__p + 1) = v67;
    unint64_t v116 = v70 | 0x8000000000000000;
    *(void *)&long long __p = p_p;
    goto LABEL_42;
  }
  HIBYTE(v116) = v66;
  p_p = &__p;
  if (v66) {
LABEL_42:
  }
    memmove(p_p, v65, v67);
  *((unsigned char *)p_p + v67) = 0;
  sub_24C6C81E4((uint64_t)&__dst, &__p, (uint64_t)&v127);
  objc_msgSend_inputTokenEmbeddingMaskTensorName(self->_configuration, v71, v72, v73, v74);
  id v75 = objc_claimAutoreleasedReturnValue();
  v80 = (const char *)objc_msgSend_UTF8String(v75, v76, v77, v78, v79);
  size_t v81 = strlen(v80);
  if (v81 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v82 = v81;
  if (v81 >= 0x17)
  {
    uint64_t v84 = (v81 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v81 | 7) != 0x17) {
      uint64_t v84 = v81 | 7;
    }
    uint64_t v85 = v84 + 1;
    v83 = operator new(v84 + 1);
    *((void *)&v113 + 1) = v82;
    unint64_t v114 = v85 | 0x8000000000000000;
    *(void *)&long long v113 = v83;
  }
  else
  {
    HIBYTE(v114) = v81;
    v83 = &v113;
    if (!v81) {
      goto LABEL_51;
    }
  }
  memmove(v83, v80, v82);
LABEL_51:
  *((unsigned char *)v83 + v82) = 0;
  sub_24C6C81E4((uint64_t)&v143, &v113, (uint64_t)&v120);
  memset(v117, 0, sizeof(v117));
  int v118 = 1065353216;
  sub_24C672C8C((uint64_t)v117, (uint64_t)&__dst, &__dst);
  sub_24C672C8C((uint64_t)v117, (uint64_t)&v143, &v143);
  sub_24C66D4AC((uint64_t)value, (uint64_t)v117, (uint64_t)v119);
  sub_24C6717DC((uint64_t)v117);
  uint64_t v145 = &unk_26FEDD950;
  uint64_t v86 = v148;
  if (v148 && !atomic_fetch_add(&v148->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
    std::__shared_weak_count::__release_weak(v86);
  }
  if (v146)
  {
    v147 = v146;
    operator delete(v146);
  }
  if (v144 < 0) {
    operator delete((void *)v143);
  }
  long long v139 = &unk_26FEDD950;
  float32x4_t v87 = v142;
  if (v142 && !atomic_fetch_add(&v142->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
    std::__shared_weak_count::__release_weak(v87);
  }
  if (v140)
  {
    v141 = v140;
    operator delete(v140);
  }
  if (SHIBYTE(v138) < 0)
  {
    operator delete((void *)__dst);
    if ((SHIBYTE(v114) & 0x80000000) == 0) {
      goto LABEL_65;
    }
LABEL_80:
    operator delete((void *)v113);
    goto LABEL_65;
  }
  if (SHIBYTE(v114) < 0) {
    goto LABEL_80;
  }
LABEL_65:

  if (SHIBYTE(v116) < 0) {
    operator delete((void *)__p);
  }

  id v88 = [CSUCLIPTextEncoderV3NetworkOutput alloc];
  v93 = objc_msgSend_outputTokenEmbeddingIDTensorName(self->_configuration, v89, v90, v91, v92);
  uint64_t v94 = sub_24C6C7AC8(v134, v93);
  uint64_t v99 = objc_msgSend_outputTokenEmbeddingMaskTensorName(self->_configuration, v95, v96, v97, v98);
  uint64_t v100 = sub_24C6C7AC8(v134, v99);
  v105 = objc_msgSend_outputTextEmbeddingTensorName(self->_configuration, v101, v102, v103, v104);
  v106 = sub_24C6C7AC8(v119, v105);
  v108 = objc_msgSend_initWithTokenEmbeddingIDs_tokenEmbeddingMask_clipTextEmbedding_(v88, v107, (uint64_t)v94, (uint64_t)v100, (uint64_t)v106);

  ((void (**)(id, void *, id))v112)[2](v112, v108, v12);
  sub_24C6717DC((uint64_t)v119);
  v120 = &unk_26FEDD950;
  v109 = v126;
  if (v126 && !atomic_fetch_add(&v126->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
    std::__shared_weak_count::__release_weak(v109);
  }
  if (v122)
  {
    v123 = v122;
    operator delete(v122);
  }
  v127 = &unk_26FEDD950;
  unint64_t v110 = v133;
  if (v133 && !atomic_fetch_add(&v133->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
    std::__shared_weak_count::__release_weak(v110);
  }
  if (v129)
  {
    v130 = v129;
    operator delete(v129);
  }
  sub_24C6717DC((uint64_t)v134);
  sub_24C6717DC((uint64_t)v135);
LABEL_78:
}

- (void)runOnInputText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend__unsafeRunOnInputText_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
}

- (CSUCLIPTextEncoderV3Configuration)configuration
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