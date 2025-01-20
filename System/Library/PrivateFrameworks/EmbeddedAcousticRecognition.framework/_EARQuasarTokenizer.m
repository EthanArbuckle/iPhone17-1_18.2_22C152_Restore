@interface _EARQuasarTokenizer
+ (id)extractModelRootFromNcsResourcePaths:(id)a3 lexiconEnh:(id)a4 tokenEnh:(id)a5 itnEnh:(id)a6;
+ (id)extractModelRootFromNcsRoot:(id)a3;
+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithModelRoot:(id)a3;
+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithNcsRoot:(id)a3;
+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithRecognizerConfigPath:(id)a3;
+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithTokenizerModelRoot:(id)a3;
- (_EARQuasarTokenizer)initWithModelRoot:(id)a3;
- (_EARQuasarTokenizer)initWithNcsRoot:(id)a3;
- (_EARQuasarTokenizer)initWithTokenizerModelRoot:(id)a3;
- (id).cxx_construct;
- (id)tokenize:(id)a3;
- (id)tokenize:(id)a3 limit:(unint64_t)a4;
@end

@implementation _EARQuasarTokenizer

+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithNcsRoot:(id)a3
{
  v4 = v3;
  id v5 = a3;
  void *v4 = 0;
  if ((os_variant_is_darwinos() & 1) == 0)
  {
    +[EARSdapiHelper EnsureSDAPIInitialized];
    v6 = [v5 stringByAppendingPathComponent:@"dispatch.voc"];
    v7 = [v5 stringByAppendingPathComponent:@"lexicon.enh"];
    v8 = [v5 stringByAppendingPathComponent:@"token_s.enh"];
    if (v6) {
      objc_msgSend(v6, "ear_toString");
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    std::string::basic_string[abi:ne180100]<0>(&v10, "");
    if (v7)
    {
      objc_msgSend(v7, "ear_toString");
      if (!v8) {
        goto LABEL_9;
      }
    }
    else if (!v8)
    {
LABEL_9:
      sdapi::SdapiTokenizer::createSdapiTokenizer((sdapi::SdapiUtil *)v11);
    }
    objc_msgSend(v8, "ear_toString");
    goto LABEL_9;
  }

  return v9;
}

+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithTokenizerModelRoot:(id)a3
{
  id v5 = v3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 stringByAppendingPathComponent:@"token_s.enh"];
  char v9 = [v7 fileExistsAtPath:v8];

  if ((v9 & 1) == 0)
  {
    v10 = [v6 stringByAppendingPathComponent:@"wordlist/token_infos.bin"];
    char v11 = [v7 fileExistsAtPath:v10];

    if (v11)
    {
      *id v5 = 0;
      if (v6)
      {
        objc_msgSend(v6, "ear_toString");
      }
      else
      {
        long long buf = 0uLL;
        uint64_t v16 = 0;
      }
      quasar::tennessee::TennesseeTokenizer::createTennesseeTokenizer((uint64_t)&buf, 0);
    }
    v13 = EARLogger::QuasarOSLogger(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1B1A86000, v13, OS_LOG_TYPE_INFO, "Unable to infer text normalization model type at %@.", (uint8_t *)&buf, 0xCu);
    }

    *id v5 = 0;
    operator new();
  }
  *id v5 = 0;
  [a1 tokenizerWithNcsRoot:v6];
  *id v5 = buf;

  return v14;
}

+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithModelRoot:(id)a3
{
  id v5 = v3;
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 stringByAppendingPathComponent:@"TP"];
  char v9 = [v8 stringByAppendingPathComponent:@"tennessee"];

  v10 = [v6 stringByAppendingPathComponent:@"ncs"];
  *id v5 = 0;
  char v11 = (EARLogger *)[v7 fileExistsAtPath:v9];
  if (v11)
  {
    v12 = EARLogger::QuasarOSLogger(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[_EARQuasarTokenizer tokenizerWithModelRoot:]((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);
    }

    v19 = (EARLogger *)[a1 tokenizerWithTokenizerModelRoot:v9];
  }
  else
  {
    v19 = (EARLogger *)[v7 fileExistsAtPath:v10];
    if (!v19) {
      goto LABEL_10;
    }
    v20 = EARLogger::QuasarOSLogger(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[_EARQuasarTokenizer tokenizerWithModelRoot:]((uint64_t)v10, v20, v21, v22, v23, v24, v25, v26);
    }

    v19 = (EARLogger *)[a1 tokenizerWithTokenizerModelRoot:v10];
  }
  v27 = __p;
  *id v5 = __p;
  if (!v27)
  {
LABEL_10:
    v28 = EARLogger::QuasarOSLogger(v19);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      +[_EARQuasarTokenizer tokenizerWithModelRoot:]((uint64_t)v6, v28, v29, v30, v31, v32, v33, v34);
    }

    operator new();
  }

  return v35;
}

+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithRecognizerConfigPath:(id)a3
{
  id v5 = [a3 stringByDeletingLastPathComponent];
  objc_msgSend(a1, "tokenizerWithModelRoot:");

  return v4;
}

+ (id)extractModelRootFromNcsResourcePaths:(id)a3 lexiconEnh:(id)a4 tokenEnh:(id)a5 itnEnh:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v11 stringByDeletingLastPathComponent];
  uint64_t v16 = [v15 lastPathComponent];

  if (([v16 isEqualToString:@"ncs"] & 1) == 0)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"EARTokenizer.mm", 175, @"General vocabulary %@ does not live in directory named 'ncs' (was: %@).", v11, v16 object file lineNumber description];
  }
  uint64_t v17 = [v11 stringByDeletingLastPathComponent];
  uint64_t v18 = [v12 stringByDeletingLastPathComponent];
  char v19 = [v17 isEqualToString:v18];

  if (v19)
  {
    if (!v13) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:a1 file:@"EARTokenizer.mm" lineNumber:178 description:@"lexicon.enh is not at the expected location."];

    if (!v13) {
      goto LABEL_7;
    }
  }
  v20 = [v11 stringByDeletingLastPathComponent];
  uint64_t v21 = [v13 stringByDeletingLastPathComponent];
  char v22 = [v20 isEqualToString:v21];

  if ((v22 & 1) == 0)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:a1 file:@"EARTokenizer.mm" lineNumber:183 description:@"token.enh is not at the expected location."];
  }
LABEL_7:
  if (v14)
  {
    uint64_t v23 = [v11 stringByDeletingLastPathComponent];
    uint64_t v24 = [v14 stringByDeletingLastPathComponent];
    char v25 = [v23 isEqualToString:v24];

    if ((v25 & 1) == 0)
    {
      uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:a1 file:@"EARTokenizer.mm" lineNumber:189 description:@"itn.enh is not at the expected location."];
    }
  }
  uint64_t v26 = [v11 stringByDeletingLastPathComponent];
  v27 = [v26 stringByDeletingLastPathComponent];

  return v27;
}

+ (id)extractModelRootFromNcsRoot:(id)a3
{
  id v5 = a3;
  id v6 = [v5 lastPathComponent];
  if (([v6 isEqualToString:@"ncs"] & 1) == 0)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"EARTokenizer.mm", 200, @"NCS root %@ does not point to directory named 'ncs' (was: %@).", v5, v6 object file lineNumber description];
  }
  v7 = [v5 stringByDeletingLastPathComponent];

  return v7;
}

- (_EARQuasarTokenizer)initWithNcsRoot:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EARQuasarTokenizer;
  id v5 = [(_EARQuasarTokenizer *)&v10 init];
  if (v5)
  {
    id v6 = objc_opt_class();
    if (v6) {
      [v6 tokenizerWithNcsRoot:v4];
    }
    else {
      uint64_t v9 = 0;
    }
    std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>(&v5->_tokenizer.__ptr_, &v9);
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
  }

  return v5;
}

- (_EARQuasarTokenizer)initWithModelRoot:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EARQuasarTokenizer;
  id v5 = [(_EARQuasarTokenizer *)&v10 init];
  if (v5)
  {
    id v6 = objc_opt_class();
    if (v6) {
      [v6 tokenizerWithModelRoot:v4];
    }
    else {
      uint64_t v9 = 0;
    }
    std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>(&v5->_tokenizer.__ptr_, &v9);
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
  }

  return v5;
}

- (_EARQuasarTokenizer)initWithTokenizerModelRoot:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EARQuasarTokenizer;
  id v5 = [(_EARQuasarTokenizer *)&v10 init];
  if (v5)
  {
    id v6 = objc_opt_class();
    if (v6) {
      [v6 tokenizerWithTokenizerModelRoot:v4];
    }
    else {
      uint64_t v9 = 0;
    }
    std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>(&v5->_tokenizer.__ptr_, &v9);
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
  }

  return v5;
}

- (id)tokenize:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  v19[0] = 0;
  v19[1] = 0;
  uint64_t v20 = 0;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  quasar::TextSanitizer::sanitize((uint64_t)&self->_sanitizer, (uint64_t)&__p);
  if (SHIBYTE(v18) < 0) {
    operator delete(__p);
  }
  __p = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  (*(void (**)(TextTokenizer *, void **, void **))(*(void *)self->_tokenizer.__ptr_ + 16))(self->_tokenizer.__ptr_, v19, &__p);
  if (__p == v17)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = (void *)v6;
    memset(&v15, 0, sizeof(v15));
    v8 = *(std::string **)__p;
    uint64_t v9 = (std::string *)*((void *)__p + 1);
    if (*(std::string **)__p != v9)
    {
      do
      {
        uint64_t v10 = quasar::QsrText::SingletonInstance((quasar::QsrText *)v6);
        uint64_t v6 = quasar::QsrText::encodeTokenQsrTextWithMetadata(v10, v8, &v15);
        if (v6)
        {
          if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            id v11 = &v15;
          }
          else {
            id v11 = (std::string *)v15.__r_.__value_.__r.__words[0];
          }
          id v12 = [NSString stringWithUTF8String:v11];
          [v7 addObject:v12];
        }
        v8 = (std::string *)((char *)v8 + 32);
      }
      while (v8 != v9);
    }
    id v13 = (void *)[v7 copy];
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v15.__r_.__value_.__l.__data_);
    }
  }
  v15.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  std::vector<quasar::TextTokenizer::TokenString>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  if (SHIBYTE(v20) < 0) {
    operator delete(v19[0]);
  }

  return v13;
}

- (id)tokenize:(id)a3 limit:(unint64_t)a4
{
  id v5 = [(_EARQuasarTokenizer *)self tokenize:a3];
  unint64_t v6 = [v5 count];
  if (v6 <= a4)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(v5, "subarrayWithRange:", v6 - a4, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  cntrl = self->_tokenizer.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  quasar::BasicTextSanitizer::~BasicTextSanitizer((quasar::BasicTextSanitizer *)&self->_sanitizer);
}

- (id).cxx_construct
{
  p_sanitizer = &self->_sanitizer;
  std::string::basic_string[abi:ne180100]<0>(&__p, "•|\\(|\\)|\"|\\[|\\]|\\{|\\}|®|,|;|\\?|\\!|\\\\"");
  quasar::BasicTextSanitizer::BasicTextSanitizer((quasar::TextSanitizer *)p_sanitizer);
}

+ (void)tokenizerWithModelRoot:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)tokenizerWithModelRoot:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)tokenizerWithModelRoot:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end