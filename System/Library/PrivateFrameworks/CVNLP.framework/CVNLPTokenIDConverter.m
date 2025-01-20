@interface CVNLPTokenIDConverter
- (BOOL)enumerateTokensForText:(id)a3 withBlock:(id)a4;
- (CVNLPTokenIDConverter)initWithLanguageModel:(void *)a3;
- (CVNLPTokenIDConverter)initWithResource:(id)a3 andTokenType:(int)a4;
- (id).cxx_construct;
- (unsigned)bosTokenID;
- (unsigned)eosTokenID;
- (unsigned)unkTokenID;
- (void)enumerateTokenIDsForText:(id)a3 withBlock:(id)a4;
@end

@implementation CVNLPTokenIDConverter

- (CVNLPTokenIDConverter)initWithResource:(id)a3 andTokenType:(int)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CVNLPTokenIDConverter;
  if ([(CVNLPTokenIDConverter *)&v25 init])
  {
    objc_msgSend_path(v6, v7, v8, v9);
    id v10 = objc_claimAutoreleasedReturnValue();
    v14 = (char *)objc_msgSend_UTF8String(v10, v11, v12, v13);
    memset(&v24, 0, sizeof(v24));
    v15 = v14 - 1;
    while (*++v15)
      ;
    sub_1B4BCC01C(&v24, v14, v15);
    v23 = &unk_1F0D55498;

    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      sub_1B4BCA11C(&__p, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v24;
    }
    memset(&v22, 0, sizeof(v22));
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    sub_1B4BCC01C(&v22, (char *)p_p, (char *)p_p + size);
    v21 = &unk_1F0D55410;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    v21 = &unk_1F0D55498;
    sub_1B4C6277C((uint64_t)&v21, a4);
  }
  v19 = (CVNLPTokenIDConverter *)0;

  return v19;
}

- (CVNLPTokenIDConverter)initWithLanguageModel:(void *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CVNLPTokenIDConverter;
  v4 = [(CVNLPTokenIDConverter *)&v20 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  id v6 = (AbstractVocabulary *)*((void *)a3 + 15);
  v7 = (std::__shared_weak_count *)*((void *)a3 + 16);
  if (v7)
  {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v4->_vocabTokenizer.__cntrl_;
  v4->_vocabTokenizer.__ptr_ = v6;
  v4->_vocabTokenizer.__cntrl_ = (__shared_weak_count *)v7;
  if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
    std::__shared_weak_count::__release_weak(cntrl);
  }
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    ptr = v5->_vocabTokenizer.__ptr_;
    int v10 = *((char *)ptr + 31);
    if ((v10 & 0x80000000) == 0) {
      goto LABEL_10;
    }
LABEL_12:
    v11 = (char *)*((void *)ptr + 1);
    uint64_t v12 = *((void *)ptr + 2);
    goto LABEL_13;
  }
  ptr = v5->_vocabTokenizer.__ptr_;
  int v10 = *((char *)ptr + 31);
  if (v10 < 0) {
    goto LABEL_12;
  }
LABEL_10:
  v11 = (char *)ptr + 8;
  uint64_t v12 = v10;
LABEL_13:
  v5->_bosTokenID = (*(uint64_t (**)(AbstractVocabulary *, char *, uint64_t))(*(void *)ptr + 40))(ptr, v11, v12);
  uint64_t v13 = v5->_vocabTokenizer.__ptr_;
  if (*((char *)v13 + 55) < 0)
  {
    v14 = (char *)*((void *)v13 + 4);
    uint64_t v15 = *((void *)v13 + 5);
  }
  else
  {
    v14 = (char *)v13 + 32;
    uint64_t v15 = *((unsigned __int8 *)v13 + 55);
  }
  v5->_eosTokenID = (*(uint64_t (**)(AbstractVocabulary *, char *, uint64_t))(*(void *)v13 + 40))(v13, v14, v15);
  v16 = v5->_vocabTokenizer.__ptr_;
  if (*((char *)v16 + 79) < 0)
  {
    v17 = (char *)*((void *)v16 + 7);
    uint64_t v18 = *((void *)v16 + 8);
  }
  else
  {
    v17 = (char *)v16 + 56;
    uint64_t v18 = *((unsigned __int8 *)v16 + 79);
  }
  v5->_unkTokenID = (*(uint64_t (**)(AbstractVocabulary *, char *, uint64_t))(*(void *)v16 + 40))(v16, v17, v18);
  return v5;
}

- (void)enumerateTokenIDsForText:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ptr = self->_vocabTokenizer.__ptr_;
  if (ptr)
  {
    id v9 = v6;
    uint64_t v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
    size_t v14 = strlen(v13);
    (*(void (**)(void **__return_ptr, AbstractVocabulary *, const char *, size_t, void))(*(void *)ptr + 24))(&__p, ptr, v13, v14, 0);
    char v17 = 0;
    uint64_t v15 = v19;
    if (v19 != __p)
    {
      unint64_t v16 = 0;
      uint64_t v15 = (unsigned int *)__p;
      do
      {
        (*((void (**)(id, uint64_t, void, void, char *))v7 + 2))(v7, 0x7FFFFFFFFFFFFFFFLL, 0, v15[v16], &v17);
        uint64_t v15 = (unsigned int *)__p;
        if (v17) {
          break;
        }
        ++v16;
      }
      while (v16 < ((char *)v19 - (unsigned char *)__p) >> 2);
    }
    if (v15)
    {
      v19 = v15;
      operator delete(v15);
    }
  }
}

- (BOOL)enumerateTokensForText:(id)a3 withBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id, uint64_t, unsigned char *))a4;
  ptr = self->_vocabTokenizer.__ptr_;
  if (ptr)
  {
    id v9 = v6;
    uint64_t v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
    size_t v14 = strlen(v13);
    (*(void (**)(void **__return_ptr, AbstractVocabulary *, const char *, size_t, void))(*(void *)ptr + 16))(&__p, ptr, v13, v14, 0);
    char v34 = 0;
    unint64_t v16 = (void **)__p;
    uint64_t v15 = v36;
    if (v36 != __p)
    {
      uint64_t v17 = 0;
      unint64_t v18 = 0;
      while (1)
      {
        v19 = (char *)&v16[v17];
        if (SHIBYTE(v16[v17 + 2]) < 0)
        {
          if (!*(void *)v19)
          {
            std::string v22 = (__CFString *)0;
            if (v22) {
              goto LABEL_10;
            }
            goto LABEL_11;
          }
          CFIndex v20 = *((void *)v19 + 1);
          v19 = *(char **)v19;
        }
        else
        {
          CFIndex v20 = HIBYTE(v16[v17 + 2]);
        }
        v21 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)v19, v20, 0x8000100u, 0);
        if (!v21)
        {
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        std::string v22 = v21;
        if (v22) {
LABEL_10:
        }
          CFRelease(v22);
LABEL_11:
        v23 = (char **)((char *)__p + v17 * 8);
        if (*((char *)__p + v17 * 8 + 23) < 0)
        {
          objc_super v25 = *v23;
          std::string v24 = v23[1];
        }
        else
        {
          std::string v24 = (char *)*((unsigned __int8 *)__p + v17 * 8 + 23);
          objc_super v25 = (char *)__p + v17 * 8;
        }
        uint64_t v26 = (*(uint64_t (**)(AbstractVocabulary *, char *, char *))(*(void *)self->_vocabTokenizer.__ptr_
                                                                              + 40))(self->_vocabTokenizer.__ptr_, v25, v24);
        v7[2](v7, v22, v26, &v34);
        BOOL v27 = v34 == 0;

        if (!v27)
        {
          v28 = (void **)__p;
          if (__p)
          {
            v29 = v36;
            v30 = __p;
            if (v36 != __p)
            {
              do
              {
                if (*((char *)v29 - 1) < 0) {
                  operator delete(*(v29 - 3));
                }
                v29 -= 3;
              }
              while (v29 != v28);
              v30 = __p;
            }
            v36 = v28;
LABEL_36:
            operator delete(v30);
          }
          goto LABEL_37;
        }
        ++v18;
        unint64_t v16 = (void **)__p;
        uint64_t v15 = v36;
        v17 += 3;
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v36 - (unsigned char *)__p) >> 3) <= v18) {
          goto LABEL_20;
        }
      }
    }
    unint64_t v16 = v36;
LABEL_20:
    if (v16)
    {
      if (v15 != v16)
      {
        do
        {
          if (*((char *)v15 - 1) < 0) {
            operator delete(*(v15 - 3));
          }
          v15 -= 3;
        }
        while (v15 != v16);
        uint64_t v15 = (void **)__p;
      }
      v36 = v16;
      v30 = v15;
      goto LABEL_36;
    }
LABEL_37:
    BOOL v31 = 1;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (unsigned)bosTokenID
{
  return self->_bosTokenID;
}

- (unsigned)eosTokenID
{
  return self->_eosTokenID;
}

- (unsigned)unkTokenID
{
  return self->_unkTokenID;
}

- (void).cxx_destruct
{
  cntrl = self->_vocabTokenizer.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end