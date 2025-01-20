@interface CSUSystemSearchTokenizer
+ (id)SystemSearchTokenizerForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisionsForSystemSearchTokenizer;
- (CSUSystemSearchTokenizer)initWithRevision:(int64_t)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)getTokenIDsForText:(id)a3;
- (id)getTokensForText:(id)a3;
- (int64_t)revision;
- (unint64_t)getMaxTokenLength;
@end

@implementation CSUSystemSearchTokenizer

+ (id)availableRevisionsForSystemSearchTokenizer
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 5, v4, v5);
  v10 = objc_msgSend_copy(v2, v6, v7, v8, v9);

  return v10;
}

+ (id)SystemSearchTokenizerForRevision:(int64_t)a3 error:(id *)a4
{
  v6 = [CSUSystemSearchTokenizer alloc];
  uint64_t v9 = objc_msgSend_initWithRevision_error_(v6, v7, a3, (uint64_t)a4, v8);
  return v9;
}

- (CSUSystemSearchTokenizer)initWithRevision:(int64_t)a3 error:(id *)a4
{
  self->_revision = a3;
  *a4 = 0;
  if (a3 == 5)
  {
    uint64_t v7 = objc_msgSend_TextEncoderE5MLConfigurationForRevision_error_(CSUTextEncoderE5MLConfiguration, a2, 1, (uint64_t)a4, v4);
    objc_msgSend_vocabularyModelPath(v7, v8, v9, v10, v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    v17 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
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
      unint64_t v25 = v22 | 0x8000000000000000;
      __dst[0] = v20;
    }
    else
    {
      HIBYTE(v25) = v18;
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
  if (a3 == 2) {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, a2, @"tokenizer revision CSUSystemSearchTextEncoderV1ConfigurationRevision_v2_0_English not supported!", (uint64_t)a4, v4);
  }
  else {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, a2, @"tokenizer revision unknown!", (uint64_t)a4, v4);
  }
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (unint64_t)getMaxTokenLength
{
  return self->_maximumSequenceLength;
}

- (id)getTokenIDsForText:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (self->_toLower)
  {
    uint64_t v10 = objc_msgSend_lowercaseString(v4, v5, v6, v7, v8);

    uint64_t v9 = (void *)v10;
  }
  id v11 = v9;
  uint64_t v16 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
  v20 = v16;
  if (!v16)
  {
    id v24 = (id)objc_msgSend_errorForInvalidModelWithLocalizedDescription_(CSUError, v17, @"getTokensForText input text is nil! returning nil", v18, v19);
    unint64_t v25 = 0;
    goto LABEL_19;
  }
  size_t v21 = strlen(v16);
  if (v21 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  uint64_t v22 = (void *)v21;
  if (v21 >= 0x17)
  {
    uint64_t v26 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17) {
      uint64_t v26 = v21 | 7;
    }
    uint64_t v27 = v26 + 1;
    v23 = (void **)operator new(v26 + 1);
    __dst[1] = v22;
    unint64_t v43 = v27 | 0x8000000000000000;
    __dst[0] = v23;
  }
  else
  {
    HIBYTE(v43) = v21;
    v23 = __dst;
    if (!v21) {
      goto LABEL_13;
    }
  }
  memmove(v23, v20, (size_t)v22);
LABEL_13:
  *((unsigned char *)v22 + (void)v23) = 0;
  (*(void (**)(void **__return_ptr))(*(void *)self->_vocabulary.__ptr_.__value_ + 16))(&__p);
  v32 = objc_opt_new();
  v33 = (unsigned int *)__p;
  v34 = v41;
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
  unint64_t v25 = objc_msgSend_copy(v32, v28, v29, v30, v31);

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

    v34 = objc_msgSend_copy(v8, v30, v31, v32, v33);
  }
  else
  {
    id v35 = (id)objc_msgSend_errorForInvalidModelWithLocalizedDescription_(CSUError, v4, @"getTokensForText input text is nil! returning nil", v5, v6);
    v34 = 0;
  }

  return v34;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void).cxx_destruct
{
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end