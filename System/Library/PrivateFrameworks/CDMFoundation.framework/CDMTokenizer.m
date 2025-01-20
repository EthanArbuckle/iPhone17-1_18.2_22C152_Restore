@interface CDMTokenizer
+ (BOOL)registerTrialAsset:(id)a3;
+ (BOOL)syncTrialAsset:(id)a3;
+ (BOOL)trialAssetUpdate:(id)a3;
+ (id)printableLocales:(id)a3;
+ (id)tokenizerForLocale:(id)a3;
+ (void)analyzerFactory;
+ (void)normalizerFactory;
+ (void)registerMorphunAssetsPathForLocale:(id)a3 withPath:(id)a4;
- (CDMTokenizer)initWithLocale:(id)a3;
- (CDMTokenizer)initWithLocale:(id)a3 maxTokens:(int)a4 maxInputSize:(int)a5;
- (id).cxx_construct;
- (id)createTokenChain:(id)a3;
@end

@implementation CDMTokenizer

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  return self;
}

+ (BOOL)registerTrialAsset:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F56678] getAssetPathForLocale:v4];
  if (v5 || ([a1 trialAssetUpdate:v4] & 1) != 0) {
    char v6 = [a1 syncTrialAsset:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)syncTrialAsset:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v19 = [v4 localeIdentifier];
    *(_DWORD *)buf = 136315394;
    v24 = "+[CDMTokenizer syncTrialAsset:]";
    __int16 v25 = 2112;
    v26 = v19;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Issuing a blocking synchronous API call to get Morphun assets path using MorphunAssets for locale: %@.", buf, 0x16u);
  }
  id v22 = 0;
  char v6 = [MEMORY[0x263F56678] getAssetPathForLocale:v4 withError:&v22];
  v7 = v22;
  v8 = v7;
  if (!v7)
  {
    v10 = [v6 path];
    if (v10)
    {
      v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v4 localeIdentifier];
        *(_DWORD *)buf = 136315650;
        v24 = "+[CDMTokenizer syncTrialAsset:]";
        __int16 v25 = 2112;
        v26 = v10;
        __int16 v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s MorphunAssets returns path: %@ for locale: %@", buf, 0x20u);
      }
      [a1 registerMorphunAssetsPathForLocale:v4 withPath:v10];
      goto LABEL_12;
    }
    v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = [v4 localeIdentifier];
      *(_DWORD *)buf = 136315394;
      v24 = "+[CDMTokenizer syncTrialAsset:]";
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: CDM get nil Morphun assets path with no error returned from MorphunAssets for locale: %@.", buf, 0x16u);
    }
    v10 = 0;
LABEL_23:
    BOOL v11 = 0;
    goto LABEL_24;
  }
  uint64_t v9 = [v7 code];
  if (!v9)
  {
    if ([MEMORY[0x263F56678] isLocaleEmbedded:v4])
    {
      v10 = CDMOSLoggerForCategory(0);
      BOOL v11 = 1;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      v15 = [v4 localeIdentifier];
      *(_DWORD *)buf = 136315650;
      v24 = "+[CDMTokenizer syncTrialAsset:]";
      __int16 v25 = 2112;
      v26 = v8;
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_2263A0000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: [Not Critical] CDM gets Morphun assets path with error: %@ for embedded locale: %@. Skip following code to register Morphun assets path.", buf, 0x20u);

      goto LABEL_12;
    }
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v21 = [v4 localeIdentifier];
      *(_DWORD *)buf = 136315650;
      v24 = "+[CDMTokenizer syncTrialAsset:]";
      __int16 v25 = 2112;
      v26 = v8;
      __int16 v27 = 2112;
      v28 = v21;
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: CDM gets Morphun assets path with error: %@ for non-embedded locale: %@.", buf, 0x20u);
    }
    goto LABEL_23;
  }
  if (v9 != 1)
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = [v4 localeIdentifier];
      *(_DWORD *)buf = 136315650;
      v24 = "+[CDMTokenizer syncTrialAsset:]";
      __int16 v25 = 2112;
      v26 = v8;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: CDM gets Morphun assets path with error: %@ for locale: %@.", buf, 0x20u);
    }
    goto LABEL_23;
  }
  v10 = CDMOSLoggerForCategory(0);
  BOOL v11 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = [v4 localeIdentifier];
    *(_DWORD *)buf = 136315650;
    v24 = "+[CDMTokenizer syncTrialAsset:]";
    __int16 v25 = 2112;
    v26 = v8;
    __int16 v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_2263A0000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: CDM gets Morphun assets path with error: %@ for locale: %@. The error code indicates the locale is not supported by MorphunAssets. Skip following code to register Morphun assets path. Morphun will fallback to use assets provided by CoreFoundation / ICU.", buf, 0x20u);

LABEL_12:
    BOOL v11 = 1;
  }
LABEL_24:

  return v11;
}

+ (id)tokenizerForLocale:(id)a3
{
  id v3 = a3;
  id v4 = [[CDMTokenizer alloc] initWithLocale:v3];

  return v4;
}

- (CDMTokenizer)initWithLocale:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMTokenizer;
  v5 = [(CDMTokenizer *)&v9 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.siri.mini.CDMTokenizer", 0);
    morphunForceUpdateQueue = v5->_morphunForceUpdateQueue;
    v5->_morphunForceUpdateQueue = (OS_dispatch_queue *)v6;

    v5 = [(CDMTokenizer *)v5 initWithLocale:v4 maxTokens:25 maxInputSize:4096];
  }

  return v5;
}

- (CDMTokenizer)initWithLocale:(id)a3 maxTokens:(int)a4 maxInputSize:(int)a5
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [a3 UTF8String];
  operator new();
}

+ (void)normalizerFactory
{
  {
    operator new();
  }
  return (void *)+[CDMTokenizer normalizerFactory]::factory;
}

+ (void)analyzerFactory
{
  {
    operator new();
  }
  return (void *)+[CDMTokenizer analyzerFactory]::factory;
}

+ (void)registerMorphunAssetsPathForLocale:(id)a3 withPath:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [v5 localeIdentifier];
    *(_DWORD *)buf = 136315650;
    __int16 v27 = "+[CDMTokenizer registerMorphunAssetsPathForLocale:withPath:]";
    __int16 v28 = 2112;
    uint64_t v29 = v8;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s Attempting to register Morphun assets from Trial for locale: %@ with path: %@", buf, 0x20u);
  }
  id v9 = [v5 localeIdentifier];
  std::string::basic_string[abi:ne180100]<0>(&v24, (char *)[v9 UTF8String]);
  v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  morphun::util::ULocale::ULocale();
  id v10 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v10 UTF8String]);
  morphun::resources::DataRegistrationService::registerDataPathForLocale();
  if (v14 < 0) {
    operator delete(__p);
  }
  morphun::util::ULocale::~ULocale((morphun::util::ULocale *)buf);
  if (SHIBYTE(v17) < 0) {
    operator delete(v15);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(v18);
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(v21);
  }
  if (v25 < 0) {
    operator delete(v24);
  }

  BOOL v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v5 localeIdentifier];
    *(_DWORD *)buf = 136315650;
    __int16 v27 = "+[CDMTokenizer registerMorphunAssetsPathForLocale:withPath:]";
    __int16 v28 = 2112;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s Registered Morphun assets from Trial for locale: %@ with path: %@", buf, 0x20u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_morphunForceUpdateQueue, 0);
  objc_storeStrong((id *)&self->_language, 0);
  value = self->_locale.__ptr_.__value_;
  self->_locale.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(ULocale *))(*(void *)value + 16))(value);
  }
  id v4 = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = 0;
  if (v4)
  {
    id v5 = *(void (**)(void))(*(void *)v4 + 16);
    v5();
  }
}

- (id)createTokenChain:(id)a3
{
  CFStringRef v4 = (const __CFString *)a3;
  id v5 = (__CFString *)v4;
  memset(&v66, 0, sizeof(v66));
  if (v4)
  {
    CFIndex Length = CFStringGetLength(v4);
    std::basic_string<char16_t>::resize(&v66, Length, v7);
    if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v8 = &v66;
    }
    else {
      v8 = (std::basic_string<char16_t> *)v66.__r_.__value_.__r.__words[0];
    }
    v68.location = 0;
    v68.length = Length;
    CFStringGetCharacters(v5, v68, (UniChar *)v8);
  }
  v60 = v5;

  uint64_t v9 = (*(uint64_t (**)(Tokenizer *, std::basic_string<char16_t> *))(*(void *)self->_tokenizer.__ptr_.__value_
                                                                             + 24))(self->_tokenizer.__ptr_.__value_, &v66);
  id v10 = (void *)(*(uint64_t (**)(void *, uint64_t))(*(void *)self->_analyzer + 72))(self->_analyzer, v9);
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 16))(v9);
  }
  uint64_t v11 = (*(uint64_t (**)(void *, void *))(*(void *)self->_normalizer + 72))(self->_normalizer, v10);
  v12 = [CDMTokenChain alloc];
  uint64_t v61 = v11;
  (**(void (***)(void **__return_ptr))self->_locale.__ptr_.__value_)(__p);
  if ((v65 & 0x80u) == 0) {
    v13 = __p;
  }
  else {
    v13 = (void **)__p[0];
  }
  if ((v65 & 0x80u) == 0) {
    unint64_t v14 = v65;
  }
  else {
    unint64_t v14 = (unint64_t)__p[1];
  }
  v15 = [NSString stringWithCharacters:v13 length:v14];
  v62 = [(CDMTokenChain *)v12 initWithString:v60 locale:v15];

  if ((char)v65 < 0) {
    operator delete(__p[0]);
  }
  morphun::TokenIterator::TokenIterator();
  morphun::TokenIterator::TokenIterator();
  unsigned int v63 = 0;
  unsigned int v16 = 0;
  while (1)
  {
    uint64_t v17 = (morphun::Token *)v10[2];
    if (v17) {
      morphun::Token::getNext(v17);
    }
    morphun::TokenIterator::TokenIterator();
    if (!morphun::TokenIterator::operator!=()) {
      break;
    }
    v18 = (morphun::Token *)morphun::TokenIterator::operator->();
    if ((morphun::Token::isHead(v18) & 1) == 0)
    {
      uint64_t v19 = (morphun::Token *)morphun::TokenIterator::operator->();
      if ((morphun::Token::isTail(v19) & 1) == 0)
      {
        while (1)
        {
          uint64_t v20 = morphun::TokenIterator::operator->();
          int v21 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 24))(v20);
          uint64_t v22 = morphun::TokenIterator::operator->();
          if (v21 >= (*(int (**)(uint64_t))(*(void *)v22 + 24))(v22))
          {
            uint64_t v23 = (morphun::Token *)morphun::TokenIterator::operator->();
            if (!morphun::Token::isHead(v23)) {
              break;
            }
          }
          morphun::TokenIterator::operator++();
        }
        v24 = (morphun::Token *)morphun::TokenIterator::operator*();
        uint64_t Value = morphun::Token::getValue(v24);
        int v26 = *(char *)(Value + 23);
        if (v26 >= 0) {
          uint64_t v27 = Value;
        }
        else {
          uint64_t v27 = *(void *)Value;
        }
        if (v26 >= 0) {
          uint64_t v28 = *(unsigned __int8 *)(Value + 23);
        }
        else {
          uint64_t v28 = *(void *)(Value + 8);
        }
        uint64_t v29 = [NSString stringWithCharacters:v27 length:v28];
        Cleanuint64_t Value = morphun::Token::getCleanValue(v24);
        uint64_t v31 = *(unsigned __int8 *)(CleanValue + 23);
        if ((v31 & 0x80u) != 0) {
          uint64_t v31 = *(void *)(CleanValue + 8);
        }
        if (v31)
        {
          uint64_t v32 = morphun::Token::getCleanValue(v24);
          int v33 = *(char *)(v32 + 23);
          if (v33 >= 0) {
            uint64_t v34 = v32;
          }
          else {
            uint64_t v34 = *(void *)v32;
          }
          if (v33 >= 0) {
            uint64_t v35 = *(unsigned __int8 *)(v32 + 23);
          }
          else {
            uint64_t v35 = *(void *)(v32 + 8);
          }
          v36 = [NSString stringWithCharacters:v34 length:v35];
        }
        else
        {
          v36 = 0;
        }
        v37 = [CDMToken alloc];
        int v38 = (*(uint64_t (**)(morphun::Token *))(*(void *)v24 + 24))(v24);
        int v39 = (*(uint64_t (**)(morphun::Token *))(*(void *)v24 + 32))(v24);
        uint64_t isSignificant = morphun::Token::isSignificant(v24);
        v41 = [(CDMToken *)v37 initWithValue:v29 begin:v38 end:v39 significant:isSignificant whitespace:morphun::Token::isWhitespace(v24) cleanValue:v36 tokenIndex:v63 nonWhitespaceTokenIndex:v16];

        while (1)
        {
          v42 = (morphun::Token *)morphun::TokenIterator::operator->();
          uint64_t v43 = morphun::Token::getValue(v42);
          int v44 = *(char *)(v43 + 23);
          uint64_t v45 = v44 >= 0 ? v43 : *(void *)v43;
          uint64_t v46 = v44 >= 0 ? *(unsigned __int8 *)(v43 + 23) : *(void *)(v43 + 8);
          v47 = [NSString stringWithCharacters:v45 length:v46];
          uint64_t v48 = morphun::TokenIterator::operator->();
          int v49 = (*(uint64_t (**)(uint64_t))(*(void *)v48 + 24))(v48);
          uint64_t v50 = morphun::TokenIterator::operator->();
          BOOL v51 = [(CDMToken *)v41 hasValue:v47 from:v49 to:(*(int (**)(uint64_t))(*(void *)v50 + 32))(v50)];

          if (!v51) {
            break;
          }
          v52 = (morphun::Token *)morphun::TokenIterator::operator->();
          uint64_t v53 = morphun::Token::getCleanValue(v52);
          int v54 = *(char *)(v53 + 23);
          if (v54 >= 0) {
            uint64_t v55 = v53;
          }
          else {
            uint64_t v55 = *(void *)v53;
          }
          if (v54 >= 0) {
            uint64_t v56 = *(unsigned __int8 *)(v53 + 23);
          }
          else {
            uint64_t v56 = *(void *)(v53 + 8);
          }
          v57 = [NSString stringWithCharacters:v55 length:v56];
          [(CDMToken *)v41 addNormalizedValue:v57];

          morphun::TokenIterator::operator++();
        }
        [(CDMTokenChain *)v62 addToken:v41];
        v58 = (morphun::Token *)morphun::TokenIterator::operator->();
        ++v63;
        v16 += morphun::Token::isWhitespace(v58) ^ 1;

        uint64_t v11 = v61;
      }
    }
    morphun::TokenIterator::operator++();
  }
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 16))(v11);
  }
  (*(void (**)(void *))(*v10 + 16))(v10);
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v66.__r_.__value_.__l.__data_);
  }

  return v62;
}

+ (BOOL)trialAssetUpdate:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [v4 localeIdentifier];
    int v22 = 136315394;
    uint64_t v23 = "+[CDMTokenizer trialAssetUpdate:]";
    __int16 v24 = 2112;
    id v25 = v20;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Triggering Morphun assets downloading via MorphunAssets API for locale: %@.", (uint8_t *)&v22, 0x16u);
  }
  if ([MEMORY[0x263F56678] isLocaleDownloadSupported:v4])
  {
    if ([MEMORY[0x263F56678] isLocaleEmbedded:v4])
    {
      [MEMORY[0x263F56678] onDemandDownloadForLocale:v4 withProgress:0 withCompletion:0];
      id v6 = CDMOSLoggerForCategory(0);
      BOOL v7 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v8 = [v4 localeIdentifier];
        uint64_t v9 = [MEMORY[0x263F56678] EmbeddedLocales];
        id v10 = [a1 printableLocales:v9];
        int v22 = 136315650;
        uint64_t v23 = "+[CDMTokenizer trialAssetUpdate:]";
        __int16 v24 = 2112;
        id v25 = v8;
        __int16 v26 = 2112;
        v27[0] = v10;
        _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s Issued an non-blocking Morphun Trial asset downloading for %@ as it's part of Morphun embedded locales: %@", (uint8_t *)&v22, 0x20u);

LABEL_9:
        BOOL v7 = 1;
      }
    }
    else
    {
      id v6 = objc_msgSend(MEMORY[0x263F56678], "blockingOnDemandDownloadForLocale:withTimeout:withProgress:", v4, dispatch_time(0, 180000000000), 0);
      unint64_t v14 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [v4 localeIdentifier];
        unsigned int v16 = [MEMORY[0x263F56678] EmbeddedLocales];
        uint64_t v17 = [a1 printableLocales:v16];
        int v22 = 136315906;
        uint64_t v23 = "+[CDMTokenizer trialAssetUpdate:]";
        __int16 v24 = 2112;
        id v25 = v15;
        __int16 v26 = 1024;
        LODWORD(v27[0]) = 180;
        WORD2(v27[0]) = 2112;
        *(void *)((char *)v27 + 6) = v17;
        _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s Issued a blocking Morphun Trial asset downloading for %@, with timeout of %d secs. This language is NOT part of Morphun embedded locales: %@", (uint8_t *)&v22, 0x26u);
      }
      if (!v6)
      {
        BOOL v7 = 1;
        goto LABEL_17;
      }
      v18 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v21 = [v4 localeIdentifier];
        int v22 = 136315650;
        uint64_t v23 = "+[CDMTokenizer trialAssetUpdate:]";
        __int16 v24 = 2112;
        id v25 = v21;
        __int16 v26 = 2112;
        v27[0] = v6;
        _os_log_error_impl(&dword_2263A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Morphun Trial asset downloading timed out for: %@, with error: %@", (uint8_t *)&v22, 0x20u);
      }
      BOOL v7 = 0;
    }
  }
  else
  {
    id v6 = CDMOSLoggerForCategory(0);
    BOOL v7 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v11 = [v4 localeIdentifier];
      v12 = [MEMORY[0x263F56678] SupportedLocales];
      v13 = [a1 printableLocales:v12];
      int v22 = 136315650;
      uint64_t v23 = "+[CDMTokenizer trialAssetUpdate:]";
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      v27[0] = v13;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: Current locale: %@ is NOT in MorphunAssets download supported list: %@. Return TRUE so that Morphun will fallback to use Morphun assets provided by CoreFoundation / ICU on device for this locale.", (uint8_t *)&v22, 0x20u);

      goto LABEL_9;
    }
  }

LABEL_17:
  return v7;
}

+ (id)printableLocales:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__CDMTokenizer_printableLocales___block_invoke;
  v7[3] = &unk_2647A55B0;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __33__CDMTokenizer_printableLocales___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 localeIdentifier];
  objc_msgSend(v2, "addObject:");
}

@end