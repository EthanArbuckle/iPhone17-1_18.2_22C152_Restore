@interface CSUTokenizer
+ (id)TokenizerForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisionsForTokenizer;
- (CSUTokenizer)initWithRevision:(int64_t)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)getTextFromTokenIds:(id)a3 error:(id *)a4;
- (id)getTokenIDsForText:(id)a3;
- (id)getTokensForText:(id)a3;
- (int64_t)revision;
- (unint64_t)maxTokenLength;
@end

@implementation CSUTokenizer

+ (id)availableRevisionsForTokenizer
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 8, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 7, v7, v8);
  objc_msgSend_addIndex_(v2, v9, 2, v10, v11);
  objc_msgSend_addIndex_(v2, v12, 1, v13, v14);
  objc_msgSend_addIndex_(v2, v15, 2, v16, v17);
  v22 = objc_msgSend_copy(v2, v18, v19, v20, v21);

  return v22;
}

+ (id)TokenizerForRevision:(int64_t)a3 error:(id *)a4
{
  v6 = [CSUTokenizer alloc];
  v9 = objc_msgSend_initWithRevision_error_(v6, v7, a3, (uint64_t)a4, v8);
  return v9;
}

- (CSUTokenizer)initWithRevision:(int64_t)a3 error:(id *)a4
{
  objc_msgSend_createForRevision_error_(CSUTextEncoderConfiguration, a2, a3, (uint64_t)a4, v4);
  uint64_t v7 = (CSUTextEncoderConfiguration *)objc_claimAutoreleasedReturnValue();
  config = self->_config;
  self->_config = v7;

  uint64_t v13 = self->_config;
  if (v13)
  {
    self->_revision = a3;
    value = self->_vocabulary.__ptr_.__value_;
    self->_vocabulary.__ptr_.__value_ = 0;
    if (value)
    {
      (*(void (**)(SentencePieceVocabulary *))(*(void *)value + 8))(value);
      uint64_t v13 = self->_config;
    }
    self->_toLower = 1;
    v15 = objc_msgSend_systemSearchTextEncoderConfig(v13, v9, v10, v11, v12);

    uint64_t v20 = self->_config;
    if (v15)
    {
      uint64_t v21 = objc_msgSend_systemSearchTextEncoderConfig(v20, v16, v17, v18, v19);
      v26 = objc_msgSend_vocabularyModelPath(v21, v22, v23, v24, v25);

      id v27 = v26;
      v32 = (const char *)objc_msgSend_UTF8String(v27, v28, v29, v30, v31);
      size_t v33 = strlen(v32);
      if (v33 > 0x7FFFFFFFFFFFFFF7) {
        sub_24C6673C8();
      }
      size_t v34 = v33;
      if (v33 >= 0x17)
      {
        uint64_t v56 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v33 | 7) != 0x17) {
          uint64_t v56 = v33 | 7;
        }
        uint64_t v57 = v56 + 1;
        p_dst = operator new(v56 + 1);
        size_t v62 = v34;
        unint64_t v63 = v57 | 0x8000000000000000;
        __dst = p_dst;
      }
      else
      {
        HIBYTE(v63) = v33;
        p_dst = &__dst;
        if (!v33)
        {
LABEL_19:
          *((unsigned char *)p_dst + v34) = 0;
          sub_24C666A80();
        }
      }
      memmove(p_dst, v32, v34);
      goto LABEL_19;
    }
    objc_msgSend_textEncoderE5MLConfig(v20, v16, v17, v18, v19);
    v36 = (CSUTokenizer *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v41 = objc_msgSend_textEncoderE5MLConfig(self->_config, v37, v38, v39, v40);
      v46 = objc_msgSend_vocabularyModelPath(v41, v42, v43, v44, v45);

      id v47 = v46;
      v52 = (const char *)objc_msgSend_UTF8String(v47, v48, v49, v50, v51);
      size_t v53 = strlen(v52);
      if (v53 > 0x7FFFFFFFFFFFFFF7) {
        sub_24C6673C8();
      }
      size_t v54 = v53;
      if (v53 >= 0x17)
      {
        uint64_t v58 = (v53 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v53 | 7) != 0x17) {
          uint64_t v58 = v53 | 7;
        }
        uint64_t v59 = v58 + 1;
        v55 = operator new(v58 + 1);
        size_t v62 = v54;
        unint64_t v63 = v59 | 0x8000000000000000;
        __dst = v55;
      }
      else
      {
        HIBYTE(v63) = v53;
        v55 = &__dst;
        if (!v53)
        {
LABEL_24:
          *((unsigned char *)v55 + v54) = 0;
          sub_24C666A80();
        }
      }
      memmove(v55, v52, v54);
      goto LABEL_24;
    }
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)getTokenIDsForText:(id)a3
{
  id v4 = a3;
  v9 = v4;
  if (self->_toLower)
  {
    uint64_t v10 = objc_msgSend_lowercaseString(v4, v5, v6, v7, v8);

    v9 = (void *)v10;
  }
  id v11 = v9;
  uint64_t v16 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
  uint64_t v20 = v16;
  if (!v16)
  {
    id v24 = (id)objc_msgSend_errorForInvalidModelWithLocalizedDescription_(CSUError, v17, @"getTokensForText input text is nil! returning nil", v18, v19);
    uint64_t v25 = 0;
    goto LABEL_19;
  }
  size_t v21 = strlen(v16);
  if (v21 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  v22 = (void *)v21;
  if (v21 >= 0x17)
  {
    uint64_t v26 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17) {
      uint64_t v26 = v21 | 7;
    }
    uint64_t v27 = v26 + 1;
    uint64_t v23 = (void **)operator new(v26 + 1);
    __dst[1] = v22;
    unint64_t v43 = v27 | 0x8000000000000000;
    __dst[0] = v23;
  }
  else
  {
    HIBYTE(v43) = v21;
    uint64_t v23 = __dst;
    if (!v21) {
      goto LABEL_13;
    }
  }
  memmove(v23, v20, (size_t)v22);
LABEL_13:
  *((unsigned char *)v22 + (void)v23) = 0;
  (*(void (**)(void **__return_ptr))(*(void *)self->_vocabulary.__ptr_.__value_ + 16))(&__p);
  v32 = objc_opt_new();
  size_t v33 = (unsigned int *)__p;
  size_t v34 = v41;
  if (__p != v41)
  {
    do
    {
      v35 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v28, *v33, v30, v31);
      objc_msgSend_addObject_(v32, v36, (uint64_t)v35, v37, v38);

      ++v33;
    }
    while (v33 != v34);
  }
  uint64_t v25 = objc_msgSend_copy(v32, v28, v29, v30, v31);

  if (__p)
  {
    v41 = (unsigned int *)__p;
    operator delete(__p);
  }
  if (SHIBYTE(v43) < 0) {
    operator delete(__dst[0]);
  }
LABEL_19:

  return v25;
}

- (id)getTokensForText:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    uint64_t v37 = objc_msgSend_getTokenIDsForText_(self, v4, (uint64_t)v7, v5, v6);
    uint64_t v8 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v37;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v10)
    {
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(id *)(*((void *)&v41 + 1) + 8 * i);
          id v14 = [NSString alloc];
          value = self->_vocabulary.__ptr_.__value_;
          uint64_t v20 = objc_msgSend_unsignedIntValue(v13, v16, v17, v18, v19);
          (*(void (**)(void **__return_ptr, SentencePieceVocabulary *, uint64_t))(*(void *)value + 40))(__p, value, v20);
          if (v40 >= 0) {
            uint64_t v24 = objc_msgSend_initWithUTF8String_(v14, v21, (uint64_t)__p, v22, v23);
          }
          else {
            uint64_t v24 = objc_msgSend_initWithUTF8String_(v14, v21, (uint64_t)__p[0], v22, v23);
          }
          v28 = (void *)v24;
          objc_msgSend_addObject_(v8, v25, v24, v26, v27);

          if (v40 < 0) {
            operator delete(__p[0]);
          }
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v10);
    }

    size_t v34 = objc_msgSend_copy(v8, v30, v31, v32, v33);
  }
  else
  {
    id v35 = (id)objc_msgSend_errorForInvalidModelWithLocalizedDescription_(CSUError, v4, @"getTokensForText input text is nil! returning nil", v5, v6);
    size_t v34 = 0;
  }

  return v34;
}

- (id)getTextFromTokenIds:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = v6;
  if (!v6)
  {
    if (a4)
    {
      uint64_t v33 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v7, @"input cannot be nil!", v9, v10);
LABEL_17:
      uint64_t v32 = 0;
      *a4 = v33;
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v32 = 0;
    goto LABEL_19;
  }
  unint64_t v12 = objc_msgSend_count(v6, v7, v8, v9, v10);
  unint64_t v16 = v12;
  if (!v12)
  {
    if (a4)
    {
      uint64_t v33 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v13, @"input has no tokens ids!", v14, v15);
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  if (v12 >> 62) {
    sub_24C667470();
  }
  uint64_t v17 = 4 * v12;
  uint64_t v37 = operator new(4 * v12);
  uint64_t v39 = (char *)v37 + 4 * v16;
  bzero(v37, 4 * v16);
  uint64_t v21 = 0;
  uint64_t v38 = (char *)v37 + v17;
  do
  {
    uint64_t v22 = objc_msgSend_objectAtIndex_(v11, v18, v21, v19, v20);
    *((_DWORD *)v37 + v21) = objc_msgSend_unsignedIntValue(v22, v23, v24, v25, v26);

    ++v21;
  }
  while (v16 != v21);
  (*(void (**)(void **__return_ptr))(*(void *)self->_vocabulary.__ptr_.__value_ + 24))(__p);
  id v27 = [NSString alloc];
  if (v36 >= 0) {
    uint64_t v31 = objc_msgSend_initWithUTF8String_(v27, v28, (uint64_t)__p, v29, v30);
  }
  else {
    uint64_t v31 = objc_msgSend_initWithUTF8String_(v27, v28, (uint64_t)__p[0], v29, v30);
  }
  uint64_t v32 = (void *)v31;
  if (v36 < 0) {
    operator delete(__p[0]);
  }
  if (v37)
  {
    uint64_t v38 = (char *)v37;
    operator delete(v37);
  }
LABEL_19:

  return v32;
}

- (int64_t)revision
{
  return self->_revision;
}

- (unint64_t)maxTokenLength
{
  return self->_maxTokenLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = 0;
  if (value)
  {
    id v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end