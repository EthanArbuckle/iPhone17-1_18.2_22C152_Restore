@interface CSUSystemSearchTextEncoderV1
- (BOOL)checkIfEmbeddingInDstBufferIsContiguous:(const void *)a3;
- (BOOL)checkIfEmbeddingInSrcBufferIsContiguous:(id)a3;
- (BOOL)loadResources:(id *)a3;
- (CSUSystemSearchTextEncoderV1)initWithConfiguration:(id)a3;
- (CSUSystemSearchTextEncoderV1Configuration)configuration;
- (EspressoTensor)getTokenEmbeddingsforChunks:(SEL)a3 error:(vector<std:(std:(id *)a5 :allocator<std::vector<unsigned int>>> *)a4 :vector<unsigned)int>;
- (NSArray)tokenSegments;
- (NSDictionary)additionalLayers;
- (id).cxx_construct;
- (vector<unsigned)getTokensOnText:(CSUSystemSearchTextEncoderV1 *)self withBOS:(SEL)a3 withEOS:(id)a4 withError:(BOOL)a5;
- (void)_unsafeRunOnInput:(id)a3 completion:(id)a4;
- (void)_unsafeRunOnInputText:(id)a3 completion:(id)a4;
- (void)runOnInput:(id)a3 completion:(id)a4;
- (void)runOnInputText:(id)a3 completion:(id)a4;
- (void)setAdditionalLayers:(id)a3;
- (void)setTokenSegments:(id)a3;
@end

@implementation CSUSystemSearchTextEncoderV1

- (CSUSystemSearchTextEncoderV1)initWithConfiguration:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CSUSystemSearchTextEncoderV1;
  v6 = [(CSUSystemSearchTextEncoderV1 *)&v9 init];
  if (v6) {
    id v7 = (id)objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v3, @"CSUSystemSearchTextEncoderV1 is deprecated, please switch over to CSUTextEncoder for text encoding/embedding purposes.", v4, v5);
  }

  return 0;
}

- (vector<unsigned)getTokensOnText:(CSUSystemSearchTextEncoderV1 *)self withBOS:(SEL)a3 withEOS:(id)a4 withError:(BOOL)a5
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  if ((objc_msgSend_loadResources_(self, v13, (uint64_t)a7, v14, v15) & 1) == 0)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend_inputIsLowerCase(self->_configuration, v16, v17, v18, v19))
  {
    uint64_t v24 = objc_msgSend_lowercaseString(v12, v20, v21, v22, v23);

    id v12 = (id)v24;
  }
  id v12 = v12;
  v29 = (const char *)objc_msgSend_UTF8String(v12, v25, v26, v27, v28);
  size_t v30 = strlen(v29);
  if (v30 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  v31 = (void *)v30;
  if (v30 >= 0x17)
  {
    uint64_t v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v30 | 7) != 0x17) {
      uint64_t v33 = v30 | 7;
    }
    uint64_t v34 = v33 + 1;
    v32 = (void **)operator new(v33 + 1);
    __dst[1] = v31;
    unint64_t v45 = v34 | 0x8000000000000000;
    __dst[0] = v32;
  }
  else
  {
    HIBYTE(v45) = v30;
    v32 = __dst;
    if (!v30) {
      goto LABEL_13;
    }
  }
  memmove(v32, v29, (size_t)v31);
LABEL_13:
  *((unsigned char *)v31 + (void)v32) = 0;
  (*(void (**)(unsigned char **__return_ptr))(*(void *)self->_vocabulary.__ptr_.__value_ + 16))(&v42);
  if (v9)
  {
    int v41 = 1;
    sub_24C678294((void **)&v42, v42, &v41);
  }
  v35 = v42;
  uint64_t v36 = (uint64_t)v43 + 4 * v8 - 4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  int64_t v37 = v36 - (void)v35;
  if ((void *)v36 != v35)
  {
    if (v37 < 0) {
      sub_24C667470();
    }
    v38 = (unsigned int *)operator new(v36 - (void)v35);
    retstr->var0 = v38;
    v39 = &v38[v37 >> 2];
    retstr->var2.var0 = v39;
    memmove(v38, v35, v37);
    retstr->var1 = v39;
  }
  if (v35)
  {
    v43 = v35;
    operator delete(v35);
  }
  if (SHIBYTE(v45) < 0) {
    operator delete(__dst[0]);
  }
LABEL_22:

  return result;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24C69662C();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = sub_24C69662C();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_24C664000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CSUTextEncoderEspressoV1LoadResources", "", (uint8_t *)&v24, 2u);
  }

  v27[0] = &unk_26FEDBA20;
  v27[1] = v5;
  uint64_t v28 = v27;
  if (!self->_textEncoderNet.__ptr_.__value_)
  {
    objc_msgSend_vocabularyModelPath(self->_configuration, v8, v9, v10, v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
    size_t v18 = strlen(v17);
    if (v18 >= 0x7FFFFFFFFFFFFFF8) {
      sub_24C6673C8();
    }
    size_t v19 = v18;
    if (v18 >= 0x17)
    {
      uint64_t v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v18 | 7) != 0x17) {
        uint64_t v21 = v18 | 7;
      }
      uint64_t v22 = v21 + 1;
      v20 = operator new(v21 + 1);
      __dst[1] = v19;
      unint64_t v26 = v22 | 0x8000000000000000;
      __dst[0] = v20;
    }
    else
    {
      HIBYTE(v26) = v18;
      v20 = __dst;
      if (!v18)
      {
LABEL_14:
        *((unsigned char *)v20 + v19) = 0;

        sub_24C666A80();
      }
    }
    memmove(v20, v17, v19);
    goto LABEL_14;
  }
  (*(void (**)(void *))(v27[0] + 48))(v27);
  if (v28 == v27)
  {
    (*(void (**)(void *))(v27[0] + 32))(v27);
  }
  else if (v28)
  {
    (*(void (**)(void))(*v28 + 40))();
  }
  return 1;
}

- (BOOL)checkIfEmbeddingInDstBufferIsContiguous:(const void *)a3
{
  memset(&__p[3], 0, 24);
  v6 = (unsigned char *)*((void *)a3 + 2);
  os_signpost_id_t v5 = (unsigned char *)*((void *)a3 + 3);
  int64_t v7 = v5 - v6;
  if (v5 == v6)
  {
    BOOL v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    if (v7 < 0) {
      sub_24C667470();
    }
    BOOL v8 = (char *)operator new(v5 - v6);
    uint64_t v9 = &v8[8 * (v7 >> 3)];
    memcpy(v8, v6, v7);
  }
  (*(void (**)(void **__return_ptr))(**((void **)a3 + 5) + 32))(__p);
  if (v9 == v8)
  {
LABEL_11:
    char v17 = 0;
    BOOL v18 = 0;
    uint64_t v16 = __p[0];
    if (!__p[0]) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *(void *)&v8[8 * v14];
      if (v15 == objc_msgSend_tokenEmbeddingLength(self->_configuration, v10, v11, v12, v13))
      {
        uint64_t v16 = __p[0];
        if (*((void *)__p[0] + v14) == 4) {
          break;
        }
      }
      if (++v14 >= (unint64_t)((v9 - v8) >> 3)) {
        goto LABEL_11;
      }
    }
    char v17 = 1;
  }
  __p[1] = v16;
  operator delete(v16);
  BOOL v18 = v17;
LABEL_13:
  if (v8) {
    operator delete(v8);
  }
  return v18;
}

- (BOOL)checkIfEmbeddingInSrcBufferIsContiguous:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_strides(v4, v5, v6, v7, v8);
  BOOL v18 = objc_msgSend_shape(v4, v10, v11, v12, v13);
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= objc_msgSend_count(v18, v14, v15, v16, v17))
    {
      BOOL v34 = 0;
      goto LABEL_7;
    }
    uint64_t v23 = objc_msgSend_objectAtIndex_(v18, v20, i, v21, v22);
    uint64_t v28 = objc_msgSend_unsignedLongValue(v23, v24, v25, v26, v27);
    uint64_t v33 = objc_msgSend_tokenEmbeddingLength(self->_configuration, v29, v30, v31, v32);

    if (v28 == v33) {
      break;
    }
  }
  v35 = objc_msgSend_objectAtIndex_(v9, v14, i, v16, v17);
  BOOL v34 = objc_msgSend_unsignedLongValue(v35, v36, v37, v38, v39) == 1;

LABEL_7:
  return v34;
}

- (EspressoTensor)getTokenEmbeddingsforChunks:(SEL)a3 error:(vector<std:(std:(id *)a5 :allocator<std::vector<unsigned int>>> *)a4 :vector<unsigned)int>
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  unint64_t v10 = objc_msgSend_maximumSequenceLength(self->_configuration, a3, (uint64_t)a4, (uint64_t)a5, v5);
  uint64_t v11 = operator new(0x10uLL);
  *uint64_t v11 = 1;
  v11[1] = v10;
  *((void *)&v84 + 1) = v11 + 2;
  unint64_t v85 = (unint64_t)(v11 + 2);
  *(void *)&long long v84 = v11;
  sub_24C67C2DC((int32x4_t **)&v84, (uint64_t)v80, 0);
  if ((void)v84)
  {
    *((void *)&v84 + 1) = v84;
    operator delete((void *)v84);
  }
  sub_24C679814(v76, (uint64_t)v80);
  __p = 0;
  *(void *)v74 = 0;
  uint64_t v75 = 0;
  var0 = (char **)a4->var0;
  var1 = (char **)a4->var1;
  if (var0 == var1)
  {
    BOOL v18 = 0;
  }
  else
  {
    do
    {
      sub_24C67C730((unint64_t *)&__p, *(void **)v74, *var0, var0[1], (var0[1] - *var0) >> 2);
      var0 += 3;
    }
    while (var0 != var1);
    BOOL v18 = (char *)__p;
    if (v10 < (uint64_t)(*(void *)v74 - (void)__p) >> 2)
    {
      size_t v19 = objc_msgSend_stringWithFormat_(NSString, v12, @"Maximum input token sequence length exceeds %zu", v14, v15, v10);
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v20, (uint64_t)v19, v21, v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v18 = (char *)__p;
      uint64_t v23 = *(unsigned int **)v74;
      if (__p == *(void **)v74) {
        goto LABEL_15;
      }
      goto LABEL_10;
    }
  }
  uint64_t v23 = *(unsigned int **)v74;
  if (v18 == *(char **)v74) {
    goto LABEL_15;
  }
LABEL_10:
  if (v79 != 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid number of indices provided.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v24 = (float *)v76[1];
  uint64_t v25 = 4 * *((void *)v77 + 1);
  unint64_t v26 = v10 - 1;
  uint64_t v27 = (unsigned int *)(v18 + 4);
  do
  {
    *uint64_t v24 = (float)*(v27 - 1);
    if (!v26) {
      break;
    }
    uint64_t v24 = (float *)((char *)v24 + v25);
    --v26;
  }
  while (v27++ != v23);
LABEL_15:
  value = self->_tokenEmbeddingNet.__ptr_.__value_;
  objc_msgSend_inputTextIDTensorName(self->_configuration, v12, v13, v14, v15);
  id v30 = objc_claimAutoreleasedReturnValue();
  v35 = (const char *)objc_msgSend_UTF8String(v30, v31, v32, v33, v34);
  size_t v36 = strlen(v35);
  if (v36 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v37 = v36;
  if (v36 >= 0x17)
  {
    uint64_t v39 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v36 | 7) != 0x17) {
      uint64_t v39 = v36 | 7;
    }
    uint64_t v40 = v39 + 1;
    p_dst = (long long *)operator new(v39 + 1);
    *((void *)&__dst + 1) = v37;
    unint64_t v69 = v40 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    HIBYTE(v69) = v36;
    p_dst = &__dst;
    if (!v36) {
      goto LABEL_23;
    }
  }
  memmove(p_dst, v35, v37);
LABEL_23:
  *((unsigned char *)p_dst + v37) = 0;
  sub_24C67CADC((uint64_t)&v84, &__dst, (uint64_t)v80);
  memset(v70, 0, sizeof(v70));
  int v71 = 1065353216;
  sub_24C672C8C((uint64_t)v70, (uint64_t)&v84, &v84);
  sub_24C66D4AC((uint64_t)value, (uint64_t)v70, (uint64_t)v72);
  sub_24C6717DC((uint64_t)v70);
  v86 = &unk_26FEDD950;
  int v41 = v89;
  if (v89 && !atomic_fetch_add(&v89->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
    std::__shared_weak_count::__release_weak(v41);
  }
  if (v87)
  {
    v88 = v87;
    operator delete(v87);
  }
  if (SHIBYTE(v85) < 0)
  {
    operator delete((void *)v84);
    if ((SHIBYTE(v69) & 0x80000000) == 0) {
      goto LABEL_30;
    }
  }
  else if ((SHIBYTE(v69) & 0x80000000) == 0)
  {
    goto LABEL_30;
  }
  operator delete((void *)__dst);
LABEL_30:

  objc_msgSend_outputTokenEmbeddingIDTensorName(self->_configuration, v42, v43, v44, v45);
  id v46 = objc_claimAutoreleasedReturnValue();
  v51 = (const char *)objc_msgSend_UTF8String(v46, v47, v48, v49, v50);
  size_t v52 = strlen(v51);
  if (v52 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v53 = v52;
  if (v52 >= 0x17)
  {
    uint64_t v55 = (v52 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v52 | 7) != 0x17) {
      uint64_t v55 = v52 | 7;
    }
    uint64_t v56 = v55 + 1;
    v54 = (long long *)operator new(v55 + 1);
    *((void *)&v84 + 1) = v53;
    unint64_t v85 = v56 | 0x8000000000000000;
    *(void *)&long long v84 = v54;
    goto LABEL_37;
  }
  HIBYTE(v85) = v52;
  v54 = &v84;
  if (v52) {
LABEL_37:
  }
    memmove(v54, v51, v53);
  *((unsigned char *)v54 + v53) = 0;
  *(void *)&v70[0] = &v84;
  v57 = sub_24C67DB18((uint64_t)v72, (uint64_t)&v84, (uint64_t)&unk_24C72FF38, (long long **)v70);
  retstr->_vptr$Tensor = (void **)&unk_26FEDD950;
  int v58 = *((_DWORD *)v57 + 12);
  retstr->shape_.sizes_.__begin_ = 0;
  retstr->type_ = v58;
  retstr->shape_.sizes_.__end_ = 0;
  retstr->shape_.sizes_.__end_cap_.__value_ = 0;
  v60 = (unsigned char *)*((void *)v57 + 7);
  v59 = (unsigned char *)*((void *)v57 + 8);
  int64_t v61 = v59 - v60;
  if (v59 != v60)
  {
    if (v61 < 0) {
      sub_24C667470();
    }
    v62 = (unint64_t *)operator new(v59 - v60);
    retstr->shape_.sizes_.__begin_ = v62;
    retstr->shape_.sizes_.__end_ = v62;
    v63 = &v62[v61 >> 3];
    retstr->shape_.sizes_.__end_cap_.__value_ = v63;
    memcpy(v62, v60, v61);
    retstr->shape_.sizes_.__end_ = v63;
  }
  retstr->storage_.__ptr_ = (TensorStorage *)*((void *)v57 + 10);
  uint64_t v64 = *((void *)v57 + 11);
  retstr->storage_.__cntrl_ = (__shared_weak_count *)v64;
  if (v64) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v64 + 8), 1uLL, memory_order_relaxed);
  }
  retstr->_vptr$Tensor = (void **)&unk_26FEDD7F0;
  if (SHIBYTE(v85) < 0) {
    operator delete((void *)v84);
  }

  sub_24C6717DC((uint64_t)v72);
  if (__p)
  {
    *(void *)v74 = __p;
    operator delete(__p);
  }
  v76[0] = off_26FEDD970;
  if (v77)
  {
    v78 = v77;
    operator delete(v77);
  }
  v80[0] = &unk_26FEDD950;
  v65 = v83;
  if (v83 && !atomic_fetch_add(&v83->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
    std::__shared_weak_count::__release_weak(v65);
  }
  result = (EspressoTensor *)v81;
  if (v81)
  {
    v82 = v81;
    operator delete(v81);
  }
  return result;
}

- (void)_unsafeRunOnInput:(id)a3 completion:(id)a4
{
  uint64_t v397 = *MEMORY[0x263EF8340];
  id v322 = a3;
  v331 = (void (**)(id, void, id))a4;
  id v383 = 0;
  v334 = self;
  LOBYTE(a4) = objc_msgSend_loadResources_(self, v6, (uint64_t)&v383, v7, v8);
  id v9 = v383;
  if ((a4 & 1) == 0)
  {
    v331[2](v331, 0, v9);
    goto LABEL_202;
  }
  v381 = 0;
  v380 = 0;
  unint64_t v382 = 0;
  v378 = 0;
  v377 = 0;
  unint64_t v379 = 0;
  unint64_t v10 = operator new(4uLL);
  __p[0] = v10;
  *unint64_t v10 = 1;
  unint64_t v385 = (unint64_t)(v10 + 1);
  __p[1] = v10 + 1;
  sub_24C67B50C((char **)&v380, 0, (__n128 *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  long long v373 = 0u;
  long long v374 = 0u;
  long long v375 = 0u;
  long long v376 = 0u;
  id obj = v322;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v373, (uint64_t)v396, 16);
  if (!v12)
  {
    char v321 = 0;
    uint64_t v13 = &stru_26FEDE788;
    unint64_t v14 = 1;
    goto LABEL_74;
  }
  char v321 = 0;
  uint64_t v13 = &stru_26FEDE788;
  uint64_t v328 = *(void *)v374;
  unint64_t v14 = 1;
  do
  {
    uint64_t v327 = v12;
    uint64_t v15 = 0;
    uint64_t v16 = v9;
    do
    {
      v335 = v13;
      if (*(void *)v374 != v328) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(*((void *)&v373 + 1) + 8 * v15);
      v332 = v17;
      if (v14 >= objc_msgSend_maximumSequenceLength(v334->_configuration, v18, v19, v20, v21) - 1)
      {
        v77 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v22, @"Input length longer than maximum allowed sequence length - truncated input", v23, v24);
        objc_msgSend_logInternalError_(CSUError, v146, (uint64_t)v77, v147, v148);
LABEL_72:

        char v321 = 1;
        id v9 = v16;
LABEL_73:

        uint64_t v13 = v335;
        goto LABEL_74;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v17;
        id v30 = objc_msgSend_string(v25, v26, v27, v28, v29);
        id v372 = v16;
        objc_msgSend_getTokensOnText_withBOS_withEOS_withError_(v334, v31, (uint64_t)v30, 0, 0, &v372);
        id v9 = v372;

        if (v9) {
          v331[2](v331, 0, v9);
        }
        uint64_t v36 = objc_msgSend_maximumSequenceLength(v334->_configuration, v32, v33, v34, v35);
        int v41 = __p[0];
        unint64_t v42 = ((char *)__p[1] - (char *)__p[0]) >> 2;
        v367 = 0;
        v368 = 0;
        if (v36 + ~v14 >= v42) {
          int64_t v43 = ((char *)__p[1] - (char *)__p[0]) >> 2;
        }
        else {
          int64_t v43 = v36 + ~v14;
        }
        v366 = 0;
        if (v43)
        {
          if (v43 < 0) {
            sub_24C667470();
          }
          size_t v44 = 4 * v43;
          uint64_t v45 = (char *)operator new(4 * v43);
          v366 = v45;
          v367 = v45;
          id v46 = &v45[4 * v43];
          v368 = v46;
          memmove(v45, v41, v44);
          v367 = v46;
          if (v42 == (v46 - v45) >> 2)
          {
LABEL_19:
            v47 = NSString;
            uint64_t v48 = objc_msgSend_string(v25, v37, v38, v39, v40);
            uint64_t v52 = objc_msgSend_stringWithFormat_(v47, v49, @"%@<text_input>%@", v50, v51, v335, v48);

            size_t v53 = (__CFString *)v52;
            v54 = v381;
            if ((unint64_t)v381 < v382) {
              goto LABEL_20;
            }
LABEL_45:
            v59 = sub_24C67CE68((char **)&v380, (uint64_t)&v366);
            goto LABEL_46;
          }
        }
        else if (!v42)
        {
          goto LABEL_19;
        }
        v114 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v37, @"Input length longer than maximum allowed sequence length - truncated input", v39, v40);
        objc_msgSend_logInternalError_(CSUError, v115, (uint64_t)v114, v116, v117);

        v118 = (char *)v366;
        if (v366 == v367)
        {
          char v125 = 0;
          char v321 = 1;
          size_t v53 = v335;
          if (v366) {
            goto LABEL_47;
          }
        }
        else
        {
          v119 = NSString;
          (*(void (**)(void **__return_ptr))(*(void *)v334->_vocabulary.__ptr_.__value_ + 24))(v345);
          v123 = v345;
          if (SHIBYTE(v346) < 0) {
            v123 = (void **)v345[0];
          }
          uint64_t v124 = objc_msgSend_stringWithFormat_(v119, v120, @"%@<text_input>%s", v121, v122, v335, v123);

          if (SHIBYTE(v346) < 0) {
            operator delete(v345[0]);
          }
          char v321 = 1;
          size_t v53 = (__CFString *)v124;
          v54 = v381;
          if ((unint64_t)v381 >= v382) {
            goto LABEL_45;
          }
LABEL_20:
          *(void *)v54 = 0;
          *((void *)v54 + 1) = 0;
          *((void *)v54 + 2) = 0;
          uint64_t v55 = v366;
          int64_t v56 = v367 - (unsigned char *)v366;
          if (v367 != v366)
          {
            v336 = v53;
            if (v56 < 0) {
              sub_24C667470();
            }
            v57 = (char *)operator new(v367 - (unsigned char *)v366);
            *(void *)v54 = v57;
            *((void *)v54 + 1) = v57;
            int v58 = &v57[4 * (v56 >> 2)];
            *((void *)v54 + 2) = v58;
            memcpy(v57, v55, v56);
            *((void *)v54 + 1) = v58;
            size_t v53 = v336;
          }
          v59 = v54 + 24;
LABEL_46:
          v381 = v59;
          v14 += (uint64_t)(*((void *)v59 - 2) - *((void *)v59 - 3)) >> 2;
          char v125 = 1;
          v118 = (char *)v366;
          if (v366)
          {
LABEL_47:
            v367 = v118;
            operator delete(v118);
          }
        }
        v335 = v53;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

        if ((v125 & 1) == 0) {
          goto LABEL_73;
        }
        goto LABEL_63;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v64 = v17;
        unint64_t v69 = objc_msgSend_tokenID(v64, v65, v66, v67, v68);
        int v74 = objc_msgSend_unsignedIntValue(v69, v70, v71, v72, v73);
        __p[1] = 0;
        __p[0] = 0;
        unint64_t v385 = 0;
        uint64_t v75 = operator new(4uLL);
        __p[0] = v75;
        *uint64_t v75 = v74;
        unint64_t v385 = (unint64_t)(v75 + 1);
        __p[1] = v75 + 1;
        v76 = v381;
        if ((unint64_t)v381 >= v382)
        {
          v381 = sub_24C67D078((char **)&v380, (uint64_t)__p);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          *(void *)v381 = 0;
          *((void *)v76 + 1) = 0;
          *((void *)v76 + 2) = 0;
          *(_OWORD *)v76 = *(_OWORD *)__p;
          *((void *)v76 + 2) = v385;
          __p[1] = 0;
          __p[0] = 0;
          unint64_t v385 = 0;
          v381 = v76 + 24;
        }

        uint64_t v127 = *((void *)v381 - 3);
        uint64_t v126 = *((void *)v381 - 2);
        v128 = NSString;
        v133 = objc_msgSend_tokenID(v64, v129, v130, v131, v132);
        uint64_t v137 = objc_msgSend_stringWithFormat_(v128, v134, @"%@<token_id_input>%@", v135, v136, v335, v133);

        v14 += (v126 - v127) >> 2;
      }
      else
      {
        v77 = objc_msgSend_embedding(v17, v60, v61, v62, v63);
        v324 = v77;
        if (objc_msgSend_dataType(v77, v78, v79, v80, v81) != 65568)
        {
          uint64_t v86 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v82, @"Input custom embedding should of type FP32", v84, v85);

          uint64_t v16 = (void *)v86;
          v331[2](v331, 0, (id)v86);
        }
        v87 = objc_msgSend_shape(v77, v82, v83, v84, v85);
        v91 = objc_msgSend_objectAtIndex_(v87, v88, 0, v89, v90);
        unint64_t v96 = objc_msgSend_unsignedLongValue(v91, v92, v93, v94, v95);

        v97 = v332;
        if (v96 + v14 > objc_msgSend_maximumSequenceLength(v334->_configuration, v98, v99, v100, v101) - 1)
        {
          v315 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v102, @"Input length longer than maximum allowed sequence length - truncated input", v104, v105);
          objc_msgSend_logInternalError_(CSUError, v316, (uint64_t)v315, v317, v318);

          goto LABEL_72;
        }
        __p[1] = 0;
        __p[0] = 0;
        unint64_t v385 = 0;
        if (v96)
        {
          if (v96 >> 62) {
            sub_24C667470();
          }
          v106 = (char *)operator new(4 * v96);
          v107 = &v106[4 * v96];
          __p[0] = v106;
          unint64_t v385 = (unint64_t)v107;
          bzero(v106, 4 * v96);
          __p[1] = v107;
        }
        v108 = v381;
        if ((unint64_t)v381 >= v382)
        {
          v113 = sub_24C67CE68((char **)&v380, (uint64_t)__p);
          v97 = v332;
        }
        else
        {
          *(void *)v381 = 0;
          *((void *)v108 + 1) = 0;
          *((void *)v108 + 2) = 0;
          v109 = __p[0];
          int64_t v110 = (char *)__p[1] - (char *)__p[0];
          if (__p[1] != __p[0])
          {
            if (v110 < 0) {
              sub_24C667470();
            }
            v111 = (char *)operator new((char *)__p[1] - (char *)__p[0]);
            *(void *)v108 = v111;
            *((void *)v108 + 1) = v111;
            v112 = &v111[4 * (v110 >> 2)];
            *((void *)v108 + 2) = v112;
            memcpy(v111, v109, v110);
            *((void *)v108 + 1) = v112;
          }
          v113 = v108 + 24;
        }
        v381 = v113;
        objc_msgSend_embedding(v97, v102, v103, v104, v105);
        v138 = (char *)objc_claimAutoreleasedReturnValue();
        v366 = (void *)v14;
        v367 = v138;
        v139 = v378;
        id v64 = v324;
        if ((unint64_t)v378 >= v379)
        {
          v141 = sub_24C67D1D4(&v377, &v366);
        }
        else
        {
          *(_DWORD *)v378 = v14;
          v140 = v367;
          v367 = 0;
          *((void *)v139 + 1) = v140;
          v141 = v139 + 16;
        }
        v378 = v141;

        uint64_t v137 = objc_msgSend_stringWithFormat_(NSString, v142, @"%@<custom_embedding_input>", v143, v144, v335);

        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        v14 += v96;
      }
      v335 = (__CFString *)v137;

      id v9 = v16;
LABEL_63:

      ++v15;
      uint64_t v16 = v9;
      uint64_t v13 = v335;
    }
    while (v327 != v15);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v145, (uint64_t)&v373, (uint64_t)v396, 16);
  }
  while (v12);
LABEL_74:
  v329 = v9;
  unint64_t v323 = v14;
  v337 = v13;

  uint64_t v149 = (uint64_t)v381;
  v150 = operator new(4uLL);
  __p[0] = v150;
  _DWORD *v150 = 1;
  unint64_t v385 = (unint64_t)(v150 + 1);
  __p[1] = v150 + 1;
  sub_24C67B50C((char **)&v380, v149, (__n128 *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v333 = objc_opt_new();
  v155 = (char *)v380;
  v156 = v381;
  if (v380 != v381)
  {
    uint64_t v157 = 0;
    uint64_t v158 = 0;
    do
    {
      if (v158 && v158 != -1 - 0x5555555555555555 * ((v381 - (unsigned char *)v380) >> 3))
      {
        v159 = v155 + 8;
        v161 = objc_msgSend_valueWithRange_(MEMORY[0x263F08D40], v151, v157, (uint64_t)(*((void *)v155 + 1) - *(void *)v155) >> 2, v154);
        objc_msgSend_addObject_(v333, v165, (uint64_t)v161, v166, v167);
      }
      else
      {
        v159 = v155 + 8;
        uint64_t v160 = *((void *)v155 + 1) - *(void *)v155 == 4 && **(_DWORD **)v155 == 1;
        v161 = objc_msgSend_CSUAssert_log_(CSUError, v151, v160, @"BOS or EOS token not present in token IDs", v154);
        objc_msgSend_logInternalError_(CSUError, v162, (uint64_t)v161, v163, v164);
      }

      v168 = *(_DWORD **)v155;
      v155 += 24;
      v157 += (uint64_t)(*v159 - (void)v168) >> 2;
      ++v158;
    }
    while (v155 != v156);
  }
  uint64_t v169 = objc_msgSend_copy(v333, v151, v152, v153, v154);
  tokenSegments = v334->_tokenSegments;
  v334->_tokenSegments = (NSArray *)v169;

  sub_24C67D2E4(&v364, (uint64_t *)&v380);
  id v363 = v329;
  objc_msgSend_getTokenEmbeddingsforChunks_error_(v334, v171, (uint64_t)&v364, (uint64_t)&v363, v172);
  id v325 = v363;

  v173 = (char *)v364;
  if (v364)
  {
    v174 = v365;
    v175 = v364;
    if (v365 != v364)
    {
      v176 = v365;
      do
      {
        v178 = (void *)*((void *)v176 - 3);
        v176 -= 24;
        v177 = v178;
        if (v178)
        {
          *((void *)v174 - 2) = v177;
          operator delete(v177);
        }
        v174 = v176;
      }
      while (v176 != v173);
      v175 = v364;
    }
    v365 = v173;
    operator delete(v175);
  }
  if (v367 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  (*(void (**)(uint64_t))(*(void *)v370 + 24))(v370);
  if (v325) {
    ((void (*)(void (**)(id, void, id), void))v331[2])(v331, 0);
  }
  sub_24C679814(&v359, (uint64_t)&v366);
  if ((objc_msgSend_checkIfEmbeddingInDstBufferIsContiguous_(v334, v179, (uint64_t)&v366, v180, v181) & 1) == 0)
  {
    uint64_t v201 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v182, @"Destination buffer is not contiguous per embedding!", v183, v184);

    id v325 = (id)v201;
    v331[2](v331, 0, (id)v201);
    goto LABEL_181;
  }
  v185 = (id *)v377;
  v330 = (int *)v378;
  if (v377 != v378)
  {
    while (1)
    {
      id v186 = v185[1];
      if ((objc_msgSend_checkIfEmbeddingInSrcBufferIsContiguous_(v334, v187, (uint64_t)v186, v188, v189) & 1) == 0)
      {
        uint64_t v314 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v190, @"Source buffer is not contiguous per embedding!", v191, v192);

        v331[2](v331, 0, (id)v314);
        id v325 = (id)v314;
        v359 = off_26FEDD970;
        v303 = v360;
        if (v360) {
          goto LABEL_182;
        }
        goto LABEL_183;
      }
      if (v362 != 3)
      {
        v319 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v319, "Invalid number of indices provided.");
        __cxa_throw(v319, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      uint64_t v193 = *(int *)v185;
      uint64_t v194 = *((void *)v360 + 1);
      id v195 = v185[1];
      v350[0] = MEMORY[0x263EF8330];
      v350[1] = 3321888768;
      v350[2] = sub_24C67B890;
      v350[3] = &unk_26FEDD558;
      v351 = &unk_26FEDD950;
      int v352 = (int)v367;
      v354 = 0;
      v355 = 0;
      v353 = 0;
      v196 = v368;
      int64_t v197 = v369 - (unsigned char *)v368;
      if (v369 != v368)
      {
        if (v197 < 0) {
          sub_24C667470();
        }
        v353 = operator new(v369 - (unsigned char *)v368);
        v354 = v353;
        v198 = (char *)v353 + 8 * (v197 >> 3);
        v355 = v198;
        memcpy(v353, v196, v197);
        v354 = v198;
      }
      uint64_t v356 = v370;
      v357 = v371;
      if (v371) {
        atomic_fetch_add_explicit(&v371->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v351 = &unk_26FEDD7F0;
      uint64_t v358 = v194 * v193;
      objc_msgSend_getBytesWithHandler_(v195, v190, (uint64_t)v350, v191, v192);
      v351 = &unk_26FEDD950;
      v199 = v357;
      if (v357)
      {
        if (!atomic_fetch_add(&v357->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      v200 = v353;
      if (v353) {
        goto LABEL_109;
      }
LABEL_110:

      v185 += 2;
      if (v185 == (id *)v330) {
        goto LABEL_115;
      }
    }
    ((void (*)(std::__shared_weak_count *))v199->__on_zero_shared)(v199);
    std::__shared_weak_count::__release_weak(v199);
    v200 = v353;
    if (!v353) {
      goto LABEL_110;
    }
LABEL_109:
    v354 = v200;
    operator delete(v200);
    goto LABEL_110;
  }
LABEL_115:
  LODWORD(v344[0]) = 4;
  v202 = operator new(8uLL);
  void *v202 = 1;
  unint64_t v385 = (unint64_t)(v202 + 1);
  __p[0] = v202;
  __p[1] = v202 + 1;
  sub_24C67D4C0((uint64_t)v345, (int *)v344, (uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  **(float **)(v348 + 8) = (float)v323;
  uint64_t value = (uint64_t)v334->_textEncoderNet.__ptr_.__value_;
  objc_msgSend_inputTokenEmbeddingIDTensorName(v334->_configuration, v203, v204, v205, v206);
  id v208 = objc_claimAutoreleasedReturnValue();
  v213 = (const char *)objc_msgSend_UTF8String(v208, v209, v210, v211, v212);
  size_t v214 = strlen(v213);
  if (v214 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v215 = v214;
  if (v214 >= 0x17)
  {
    uint64_t v217 = (v214 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v214 | 7) != 0x17) {
      uint64_t v217 = v214 | 7;
    }
    uint64_t v218 = v217 + 1;
    p_dst = (long long *)operator new(v217 + 1);
    *((void *)&__dst + 1) = v215;
    unint64_t v341 = v218 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_124;
  }
  HIBYTE(v341) = v214;
  p_dst = &__dst;
  if (v214) {
LABEL_124:
  }
    memmove(p_dst, v213, v215);
  *((unsigned char *)p_dst + v215) = 0;
  sub_24C67CADC((uint64_t)__p, &__dst, (uint64_t)&v366);
  objc_msgSend_inputTokenEmbeddingMaskTensorName(v334->_configuration, v219, v220, v221, v222);
  id v223 = objc_claimAutoreleasedReturnValue();
  v228 = (const char *)objc_msgSend_UTF8String(v223, v224, v225, v226, v227);
  size_t v229 = strlen(v228);
  if (v229 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  size_t v230 = v229;
  if (v229 >= 0x17)
  {
    uint64_t v232 = (v229 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v229 | 7) != 0x17) {
      uint64_t v232 = v229 | 7;
    }
    uint64_t v233 = v232 + 1;
    v231 = operator new(v232 + 1);
    *((void *)&v338 + 1) = v230;
    unint64_t v339 = v233 | 0x8000000000000000;
    *(void *)&long long v338 = v231;
  }
  else
  {
    HIBYTE(v339) = v229;
    v231 = &v338;
    if (!v229) {
      goto LABEL_133;
    }
  }
  memmove(v231, v228, v230);
LABEL_133:
  *((unsigned char *)v231 + v230) = 0;
  sub_24C67CADC((uint64_t)v390, &v338, (uint64_t)v345);
  memset(v342, 0, sizeof(v342));
  int v343 = 1065353216;
  sub_24C672C8C((uint64_t)v342, (uint64_t)__p, (long long *)__p);
  sub_24C672C8C((uint64_t)v342, (uint64_t)v390, (long long *)v390);
  sub_24C66D4AC(value, (uint64_t)v342, (uint64_t)v344);
  sub_24C6717DC((uint64_t)v342);
  v392 = &unk_26FEDD950;
  v234 = v395;
  if (v395 && !atomic_fetch_add(&v395->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v234->__on_zero_shared)(v234);
    std::__shared_weak_count::__release_weak(v234);
  }
  if (v393)
  {
    v394 = v393;
    operator delete(v393);
  }
  if (v391 < 0) {
    operator delete(v390[0]);
  }
  v386 = &unk_26FEDD950;
  v235 = v389;
  if (v389 && !atomic_fetch_add(&v389->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v235->__on_zero_shared)(v235);
    std::__shared_weak_count::__release_weak(v235);
  }
  if (v387)
  {
    v388 = v387;
    operator delete(v387);
  }
  if (SHIBYTE(v385) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v339) < 0) {
    operator delete((void *)v338);
  }

  if (SHIBYTE(v341) < 0) {
    operator delete((void *)__dst);
  }

  id v236 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v245 = objc_msgSend_additionalLayerNames(v334->_configuration, v237, v238, v239, v240);
  unint64_t v246 = 0;
  while (2)
  {
    if (v246 < objc_msgSend_count(v245, v241, v242, v243, v244))
    {
      objc_msgSend_objectAtIndexedSubscript_(v245, v247, v246, v248, v249);
      id v250 = objc_claimAutoreleasedReturnValue();
      v255 = (const char *)objc_msgSend_UTF8String(v250, v251, v252, v253, v254);
      size_t v256 = strlen(v255);
      if (v256 > 0x7FFFFFFFFFFFFFF7) {
        sub_24C6673C8();
      }
      v257 = (void *)v256;
      if (v256 >= 0x17)
      {
        uint64_t v259 = (v256 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v256 | 7) != 0x17) {
          uint64_t v259 = v256 | 7;
        }
        uint64_t v260 = v259 + 1;
        v258 = operator new(v259 + 1);
        unint64_t v385 = v260 | 0x8000000000000000;
        __p[0] = v258;
        __p[1] = v257;
      }
      else
      {
        HIBYTE(v385) = v256;
        v258 = __p;
        if (!v256) {
          goto LABEL_161;
        }
      }
      memmove(v258, v255, (size_t)v257);
LABEL_161:
      *((unsigned char *)v257 + (void)v258) = 0;
      v261 = sub_24C66F7E4(v344, (uint64_t)__p);
      if (!v261) {
        sub_24C66DE30("unordered_map::at: key not found");
      }
      v265 = objc_msgSend_castToFP16WithDeepCopyFromTensor_(CSUMLMultiArrayUtilities, v262, (uint64_t)(v261 + 5), v263, v264);
      objc_msgSend_setObject_forKey_(v236, v266, (uint64_t)v265, (uint64_t)v250, v267);

      if (SHIBYTE(v385) < 0) {
        operator delete(__p[0]);
      }

      ++v246;
      continue;
    }
    break;
  }
  v268 = [CSUSystemSearchTextEncoderV1NetworkOutput alloc];
  objc_msgSend_outputTextEmbeddingTensorName(v334->_configuration, v269, v270, v271, v272);
  id v273 = objc_claimAutoreleasedReturnValue();
  v278 = (const char *)objc_msgSend_UTF8String(v273, v274, v275, v276, v277);
  size_t v279 = strlen(v278);
  if (v279 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  v280 = (void *)v279;
  if (v279 >= 0x17)
  {
    uint64_t v282 = (v279 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v279 | 7) != 0x17) {
      uint64_t v282 = v279 | 7;
    }
    uint64_t v283 = v282 + 1;
    v281 = operator new(v282 + 1);
    unint64_t v385 = v283 | 0x8000000000000000;
    __p[0] = v281;
    __p[1] = v280;
    goto LABEL_172;
  }
  HIBYTE(v385) = v279;
  v281 = __p;
  if (v279) {
LABEL_172:
  }
    memmove(v281, v278, (size_t)v280);
  *((unsigned char *)v280 + (void)v281) = 0;
  v284 = sub_24C66F7E4(v344, (uint64_t)__p);
  if (!v284) {
    sub_24C66DE30("unordered_map::at: key not found");
  }
  v287 = objc_msgSend_initWithTextEmbedding_tokenSegments_(v268, v285, (uint64_t)(v284 + 5), (uint64_t)v334->_tokenSegments, v286);
  if (SHIBYTE(v385) < 0) {
    operator delete(__p[0]);
  }

  v292 = objc_msgSend_copy(v236, v288, v289, v290, v291);
  objc_msgSend_setAdditionalLayers_(v287, v293, (uint64_t)v292, v294, v295);

  objc_msgSend_setProcessedInput_(v287, v296, (uint64_t)v337, v297, v298);
  objc_msgSend_setTruncatedInput_(v287, v299, v321 & 1, v300, v301);
  ((void (**)(id, void *, id))v331)[2](v331, v287, v325);

  sub_24C6717DC((uint64_t)v344);
  v345[0] = &unk_26FEDD950;
  v302 = v349;
  if (v349 && !atomic_fetch_add(&v349->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v302->__on_zero_shared)(v302);
    std::__shared_weak_count::__release_weak(v302);
  }
  if (v346)
  {
    v347 = v346;
    operator delete(v346);
  }
LABEL_181:
  v359 = off_26FEDD970;
  v303 = v360;
  if (v360)
  {
LABEL_182:
    v361 = v303;
    operator delete(v303);
  }
LABEL_183:
  v366 = &unk_26FEDD950;
  v304 = v371;
  if (v371 && !atomic_fetch_add(&v371->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v304->__on_zero_shared)(v304);
    std::__shared_weak_count::__release_weak(v304);
  }
  if (v368)
  {
    v369 = v368;
    operator delete(v368);
  }

  v305 = (char *)v377;
  if (v377)
  {
    v306 = v378;
    v307 = v377;
    if (v378 != v377)
    {
      do
      {

        v306 -= 16;
      }
      while (v306 != v305);
      v307 = v377;
    }
    v378 = v305;
    operator delete(v307);
  }
  v308 = (char *)v380;
  if (v380)
  {
    v309 = v381;
    v310 = v380;
    if (v381 != v380)
    {
      v311 = v381;
      do
      {
        v313 = (void *)*((void *)v311 - 3);
        v311 -= 24;
        v312 = v313;
        if (v313)
        {
          *((void *)v309 - 2) = v312;
          operator delete(v312);
        }
        v309 = v311;
      }
      while (v311 != v308);
      v310 = v380;
    }
    v381 = v308;
    operator delete(v310);
  }
  id v9 = v325;
LABEL_202:
}

- (void)_unsafeRunOnInputText:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  objc_msgSend_setString_(v8, v9, (uint64_t)v17, v10, v11);
  objc_msgSend_addObject_(v7, v12, (uint64_t)v8, v13, v14);
  objc_msgSend_runOnInput_completion_(self, v15, (uint64_t)v7, (uint64_t)v6, v16);
}

- (void)runOnInput:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend__unsafeRunOnInput_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
}

- (void)runOnInputText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend__unsafeRunOnInputText_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
}

- (CSUSystemSearchTextEncoderV1Configuration)configuration
{
  return self->_configuration;
}

- (NSDictionary)additionalLayers
{
  return self->_additionalLayers;
}

- (void)setAdditionalLayers:(id)a3
{
}

- (NSArray)tokenSegments
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTokenSegments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSegments, 0);
  objc_storeStrong((id *)&self->_additionalLayers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  uint64_t value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(SentencePieceVocabulary *))(*(void *)value + 8))(value);
  }
  id v4 = self->_textEncoderNet.__ptr_.__value_;
  self->_textEncoderNet.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(EspressoNet *))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = self->_tokenEmbeddingNet.__ptr_.__value_;
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