@interface EMTTranslator
+ (void)initialize;
- (BOOL)isCompileRequiredFrom:(id)a3 to:(id)a4;
- (EMTTranslator)initWithModelURL:(id)a3;
- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4;
- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5;
- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6;
- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6 useGlobalTranslationQueue:(BOOL)a7;
- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4;
- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5;
- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6;
- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6 useGlobalTranslationQueue:(BOOL)a7;
- (OS_dispatch_queue)callbackQueue;
- (id).cxx_construct;
- (shared_ptr<quasar::Translator>)_prepareFor:(id)a3 to:(id)a4;
- (vector<std::string,)_tokenizeString:(EMTTranslator *)self;
- (void)_dispatchTranslationRequest:()vector<std:(std:(BOOL)a4 :(id)a5 allocator<std:(shared_ptr<quasar:(id)a7 :(id)a8 Translator>)a6 :(id)a9 string>> *)a3 :(id)a10 string isFinal:spans:translator:sourceLocale:targetLocale:options:completion:;
- (void)getTranslatorWithCompletion:(id)a3;
- (void)loadTranslatorFrom:(id)a3 to:(id)a4;
- (void)prepareFor:(id)a3 to:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)translateSpeech:(id)a3 completion:(id)a4;
- (void)translateSpeech:(id)a3 from:(id)a4 to:(id)a5 completion:(id)a6;
- (void)translateString:(id)a3 completion:(id)a4;
- (void)translateString:(id)a3 from:(id)a4 to:(id)a5 completion:(id)a6;
- (void)translateString:(id)a3 from:(id)a4 to:(id)a5 options:(id)a6 completion:(id)a7;
- (void)translateString:(id)a3 from:(id)a4 to:(id)a5 overrides:(id)a6 completion:(id)a7;
- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 completion:(id)a6;
- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 spans:(id)a6 completion:(id)a7;
- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 spans:(id)a6 options:(id)a7 completion:(id)a8;
- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 spans:(id)a6 overrides:(id)a7 completion:(id)a8;
- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 completion:(id)a5;
- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 spans:(id)a5 completion:(id)a6;
- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 spans:(id)a5 options:(id)a6 completion:(id)a7;
- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 spans:(id)a5 overrides:(id)a6 completion:(id)a7;
@end

@implementation EMTTranslator

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (EMTTranslator)initWithModelURL:(id)a3
{
  return [(EMTTranslator *)self initWithModelURL:a3 task:@"siri"];
}

- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9 = [(EMTTranslator *)self initWithModelURLs:v8 task:v7 skipNonFinalToCatchup:0 translatorCacheSize:-1 useGlobalTranslationQueue:0];

  return v9;
}

- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5
{
  BOOL v5 = a5;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v13[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11 = [(EMTTranslator *)self initWithModelURLs:v10 task:v9 skipNonFinalToCatchup:v5 translatorCacheSize:-1 useGlobalTranslationQueue:0];

  return v11;
}

- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6
{
  BOOL v7 = a5;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v15[0] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v13 = [(EMTTranslator *)self initWithModelURLs:v12 task:v11 skipNonFinalToCatchup:v7 translatorCacheSize:a6 useGlobalTranslationQueue:0];

  return v13;
}

- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6 useGlobalTranslationQueue:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v17[0] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15 = [(EMTTranslator *)self initWithModelURLs:v14 task:v13 skipNonFinalToCatchup:v9 translatorCacheSize:a6 useGlobalTranslationQueue:v7];

  return v15;
}

- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4
{
  return [(EMTTranslator *)self initWithModelURLs:a3 task:a4 skipNonFinalToCatchup:0 translatorCacheSize:-1 useGlobalTranslationQueue:0];
}

- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5
{
  return [(EMTTranslator *)self initWithModelURLs:a3 task:a4 skipNonFinalToCatchup:a5 translatorCacheSize:-1 useGlobalTranslationQueue:0];
}

- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6
{
  return [(EMTTranslator *)self initWithModelURLs:a3 task:a4 skipNonFinalToCatchup:a5 translatorCacheSize:a6 useGlobalTranslationQueue:0];
}

- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6 useGlobalTranslationQueue:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v31 = a4;
  if (!v31)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"EMTTranslator.mm" lineNumber:195 description:@"Task string cannot be nil"];
  }
  v48.receiver = self;
  v48.super_class = (Class)EMTTranslator;
  id v12 = [(EMTTranslator *)&v48 init];
  id v13 = v12;
  if (v12)
  {
    v12->_skipNonFinalToCatchup = a5;
    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    translationRequestsQueue = v13->_translationRequestsQueue;
    v13->_translationRequestsQueue = v14;

    [(NSOperationQueue *)v13->_translationRequestsQueue setMaxConcurrentOperationCount:1];
    v16 = [(NSOperationQueue *)v13->_translationRequestsQueue progress];
    [v16 setTotalUnitCount:1];

    if (v7) {
      +[EMTTranslationQueue globalTranslationQueue];
    }
    else {
    uint64_t v17 = +[EMTTranslationQueue createTranslationQueue];
    }
    translationQueue = v13->_translationQueue;
    v13->_translationQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v13->_callbackQueue, MEMORY[0x1E4F14428]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v32;
    uint64_t v19 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = [*(id *)(*((void *)&v44 + 1) + 8 * i) URLByAppendingPathComponent:@"mt-quasar-config.json"];
          quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v43);
          id v23 = v22;
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v23 fileSystemRepresentation]);
          memset(v40, 0, sizeof(v40));
          memset(v38, 0, sizeof(v38));
          int v39 = 1065353216;
          quasar::SystemConfig::readJsonFile((uint64_t)v43, (uint64_t)__p, v40, (uint64_t)v38, 0, 0);
          std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v38);
          *(void *)&v38[0] = v40;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
          if (v42 < 0) {
            operator delete(__p[0]);
          }
          end = v13->_configs.__end_;
          if (end >= v13->_configs.__end_cap_.__value_)
          {
            uint64_t p_info = std::vector<quasar::SystemConfig>::__push_back_slow_path<quasar::SystemConfig const&>((uint64_t *)&v13->_configs, (const quasar::SystemConfig *)v43);
          }
          else
          {
            quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v13->_configs.__end_, (const quasar::SystemConfig *)v43, 1, 1);
            uint64_t p_info = (uint64_t)&end[32].info;
            v13->_configs.__end_ = (SystemConfig *)((char *)end + 1544);
          }
          v13->_configs.__end_ = (SystemConfig *)p_info;
          quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v43);
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v19);
    }

    v26 = v13->_translationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__EMTTranslator_initWithModelURLs_task_skipNonFinalToCatchup_translatorCacheSize_useGlobalTranslationQueue___block_invoke;
    block[3] = &unk_1E5FFFD88;
    v35 = v13;
    id v36 = v31;
    int64_t v37 = a6;
    dispatch_async(v26, block);
  }
  v27 = v13;

  return v27;
}

void __108__EMTTranslator_initWithModelURLs_task_skipNonFinalToCatchup_translatorCacheSize_useGlobalTranslationQueue___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = (uint64_t *)(v3 + 56);
  if (v2)
  {
    objc_msgSend(v2, "ear_toString");
  }
  else
  {
    long long __p = 0uLL;
    uint64_t v9 = 0;
  }
  quasar::TranslatorFactory::createTranslatorFactory(v4, &__p, *(_DWORD *)(a1 + 48), &v10);
  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = v10;
  long long v10 = 0uLL;
  BOOL v7 = *(std::__shared_weak_count **)(v5 + 16);
  *(_OWORD *)(v5 + 8) = v6;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  if (*((void *)&v10 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
  }
  if (SHIBYTE(v9) < 0) {
    operator delete((void *)__p);
  }
}

- (void)loadTranslatorFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqual:v7] & 1) == 0)
  {
    translationQueue = self->_translationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__EMTTranslator_loadTranslatorFrom_to___block_invoke;
    block[3] = &unk_1E5FFE3F0;
    id v10 = v6;
    id v11 = v7;
    id v12 = self;
    dispatch_async(translationQueue, block);
  }
}

void __39__EMTTranslator_loadTranslatorFrom_to___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) localeIdentifier];
  uint64_t v3 = [*(id *)(a1 + 40) localeIdentifier];
  v4 = (void *)v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v2)
  {
    objc_msgSend(v2, "ear_toString");
    if (v4)
    {
LABEL_3:
      objc_msgSend(v4, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v8[0] = 0;
    v8[1] = 0;
    uint64_t v9 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v7 = 0;
LABEL_6:
  (*(void (**)(uint64_t *__return_ptr, uint64_t, void **, void **))(*(void *)v5 + 16))(&v10, v5, v8, __p);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v9) < 0) {
    operator delete(v8[0]);
  }
}

- (BOOL)isCompileRequiredFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    if ([v6 isEqual:v7])
    {
      BOOL v9 = 0;
    }
    else
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2020000000;
      char v20 = 0;
      translationQueue = self->_translationQueue;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __42__EMTTranslator_isCompileRequiredFrom_to___block_invoke;
      v12[3] = &unk_1E5FFFDB0;
      id v13 = v6;
      v15 = self;
      v16 = &v17;
      id v14 = v8;
      dispatch_async_and_wait(translationQueue, v12);
      BOOL v9 = *((unsigned char *)v18 + 24) != 0;

      _Block_object_dispose(&v17, 8);
    }
  }

  return v9;
}

void __42__EMTTranslator_isCompileRequiredFrom_to___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) localeIdentifier];
  uint64_t v3 = [*(id *)(a1 + 40) localeIdentifier];
  v4 = (void *)v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v2)
  {
    objc_msgSend(v2, "ear_toString");
    if (v4)
    {
LABEL_3:
      objc_msgSend(v4, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v8[0] = 0;
    v8[1] = 0;
    uint64_t v9 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v7 = 0;
LABEL_6:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(uint64_t, void **, void **))(*(void *)v5 + 40))(v5, v8, __p);
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v9) < 0) {
    operator delete(v8[0]);
  }
}

- (void)translateSpeech:(id)a3 completion:(id)a4
{
}

- (void)translateSpeech:(id)a3 from:(id)a4 to:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  id v22 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v14 = [v10 rawTranscription];
  v15 = [v14 segments];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__EMTTranslator_translateSpeech_from_to_completion___block_invoke;
  v16[3] = &unk_1E5FFFDD8;
  v16[4] = &v17;
  [v15 enumerateObjectsUsingBlock:v16];

  [(EMTTranslator *)self translateTokens:v18[5] from:v11 to:v12 spans:0 options:0 completion:v13];
  _Block_object_dispose(&v17, 8);
}

void __52__EMTTranslator_translateSpeech_from_to_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 substring];
  objc_msgSend(v2, "addObject:");
}

- (void)translateString:(id)a3 completion:(id)a4
{
}

- (void)translateString:(id)a3 from:(id)a4 to:(id)a5 completion:(id)a6
{
}

- (void)translateString:(id)a3 from:(id)a4 to:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  translationQueue = self->_translationQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__EMTTranslator_translateString_from_to_options_completion___block_invoke;
  v23[3] = &unk_1E5FFFE00;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(translationQueue, v23);
}

void __60__EMTTranslator_translateString_from_to_options_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  if (v2)
  {
    [v2 _tokenizeString:a1[5]];
    id v3 = (void *)a1[4];
    if (v3)
    {
      [v3 _prepareFor:a1[6] to:a1[7]];
      v4 = (void *)a1[4];
      goto LABEL_6;
    }
  }
  else
  {
    id v10 = 0;
    id v11 = 0;
    uint64_t v12 = 0;
  }
  v4 = 0;
  id v8 = 0;
  uint64_t v9 = 0;
LABEL_6:
  memset(&v7, 0, sizeof(v7));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v7, v10, v11, 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v10) >> 3));
  uint64_t v5 = (void **)v8;
  id v6 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v4 _dispatchTranslationRequest:&v7 isFinal:1 spans:0 translator:&v5 sourceLocale:a1[6] targetLocale:a1[7] options:a1[8] completion:a1[9]];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  id v13 = &v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  id v8 = &v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
}

- (void)translateString:(id)a3 from:(id)a4 to:(id)a5 overrides:(id)a6 completion:(id)a7
{
}

- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 completion:(id)a6
{
}

- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 spans:(id)a6 completion:(id)a7
{
}

- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 spans:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  translationQueue = self->_translationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__EMTTranslator_translateTokens_from_to_spans_options_completion___block_invoke;
  block[3] = &unk_1E5FFFE28;
  id v28 = v14;
  v29 = self;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(translationQueue, block);
}

void __66__EMTTranslator_translateTokens_from_to_spans_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  memset(&v28, 0, sizeof(v28));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v25 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(v5, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          std::string::size_type v23 = 0;
        }
        std::vector<std::string>::pointer end = v28.__end_;
        if (v28.__end_ >= v28.__end_cap_.__value_)
        {
          unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v28.__end_ - (char *)v28.__begin_) >> 3);
          unint64_t v9 = v8 + 1;
          if (v8 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v28.__end_cap_.__value_ - (char *)v28.__begin_) >> 3) > v9) {
            unint64_t v9 = 0x5555555555555556 * (((char *)v28.__end_cap_.__value_ - (char *)v28.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v28.__end_cap_.__value_ - (char *)v28.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v10 = v9;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v28.__end_cap_;
          if (v10) {
            id v11 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v28.__end_cap_, v10);
          }
          else {
            id v11 = 0;
          }
          uint64_t v12 = v11 + v8;
          __v.__first_ = v11;
          __v.__begin_ = v12;
          __v.__end_cap_.__value_ = &v11[v10];
          long long v13 = *(_OWORD *)__p;
          v12->__r_.__value_.__r.__words[2] = v23;
          *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
          __p[1] = 0;
          std::string::size_type v23 = 0;
          __p[0] = 0;
          __v.__end_ = v12 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v28, &__v);
          id v14 = v28.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v28.__end_ = v14;
        }
        else
        {
          long long v7 = *(_OWORD *)__p;
          v28.__end_->__r_.__value_.__r.__words[2] = v23;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v7;
          v28.__end_ = end + 1;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v2);
  }

  id v15 = *(void **)(a1 + 40);
  if (v15)
  {
    [v15 _prepareFor:*(void *)(a1 + 48) to:*(void *)(a1 + 56)];
    id v16 = *(void **)(a1 + 40);
  }
  else
  {
    id v16 = 0;
    __v.__first_ = 0;
    __v.__begin_ = 0;
  }
  memset(&v21, 0, sizeof(v21));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v21, (long long *)v28.__begin_, (long long *)v28.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v28.__end_ - (char *)v28.__begin_) >> 3));
  uint64_t v17 = *(void *)(a1 + 64);
  std::__split_buffer<std::string>::pointer first = __v.__first_;
  begin = (std::__shared_weak_count *)__v.__begin_;
  if (__v.__begin_) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)&__v.__begin_->__r_.__value_.__l.__size_, 1uLL, memory_order_relaxed);
  }
  [v16 _dispatchTranslationRequest:&v21 isFinal:1 spans:v17 translator:&first sourceLocale:*(void *)(a1 + 48) targetLocale:*(void *)(a1 + 56) options:*(void *)(a1 + 72) completion:*(void *)(a1 + 80)];
  if (begin) {
    std::__shared_weak_count::__release_shared[abi:ne180100](begin);
  }
  __p[0] = &v21;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (__v.__begin_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__v.__begin_);
  }
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v28;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 spans:(id)a6 overrides:(id)a7 completion:(id)a8
{
}

- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 completion:(id)a5
{
}

- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 spans:(id)a5 completion:(id)a6
{
}

- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 spans:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  translationQueue = self->_translationQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__EMTTranslator_translateTokens_isFinal_spans_options_completion___block_invoke;
  v21[3] = &unk_1E5FFFE50;
  id v22 = v12;
  std::string::size_type v23 = self;
  BOOL v27 = a4;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(translationQueue, v21);
}

void __66__EMTTranslator_translateTokens_isFinal_spans_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  memset(&v30, 0, sizeof(v30));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v27 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(v5, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          std::string::size_type v25 = 0;
        }
        std::vector<std::string>::pointer end = v30.__end_;
        if (v30.__end_ >= v30.__end_cap_.__value_)
        {
          unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v30.__end_ - (char *)v30.__begin_) >> 3);
          unint64_t v9 = v8 + 1;
          if (v8 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v30.__end_cap_.__value_ - (char *)v30.__begin_) >> 3) > v9) {
            unint64_t v9 = 0x5555555555555556 * (((char *)v30.__end_cap_.__value_ - (char *)v30.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v30.__end_cap_.__value_ - (char *)v30.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v10 = v9;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v30.__end_cap_;
          if (v10) {
            id v11 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v30.__end_cap_, v10);
          }
          else {
            id v11 = 0;
          }
          id v12 = v11 + v8;
          __v.__first_ = v11;
          __v.__begin_ = v12;
          __v.__end_cap_.__value_ = &v11[v10];
          long long v13 = *(_OWORD *)__p;
          v12->__r_.__value_.__r.__words[2] = v25;
          *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
          __p[1] = 0;
          std::string::size_type v25 = 0;
          __p[0] = 0;
          __v.__end_ = v12 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v30, &__v);
          id v14 = v30.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v30.__end_ = v14;
        }
        else
        {
          long long v7 = *(_OWORD *)__p;
          v30.__end_->__r_.__value_.__r.__words[2] = v25;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v7;
          v30.__end_ = end + 1;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v2);
  }

  id v15 = *(void **)(a1 + 40);
  memset(&v23, 0, sizeof(v23));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v23, (long long *)v30.__begin_, (long long *)v30.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v30.__end_ - (char *)v30.__begin_) >> 3));
  int v16 = *(unsigned __int8 *)(a1 + 72);
  id v18 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  id v19 = (std::__shared_weak_count *)v18[4];
  uint64_t v21 = v18[3];
  id v22 = v19;
  if (v19)
  {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    id v18 = *(void **)(a1 + 40);
  }
  [v15 _dispatchTranslationRequest:&v23 isFinal:v16 != 0 spans:v17 translator:&v21 sourceLocale:v18[5] targetLocale:v18[6] options:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  __v.__first_ = &v23;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 spans:(id)a5 overrides:(id)a6 completion:(id)a7
{
}

- (void)prepareFor:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  translationQueue = self->_translationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EMTTranslator_prepareFor_to___block_invoke;
  block[3] = &unk_1E5FFE3F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(translationQueue, block);
}

void __31__EMTTranslator_prepareFor_to___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _prepareFor:*(void *)(a1 + 40) to:*(void *)(a1 + 48)];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

- (vector<std::string,)_tokenizeString:(EMTTranslator *)self
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  uint64_t v5 = [v21 componentsSeparatedByString:@" "];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v25 + 1) + 8 * i) lowercaseString];
        id v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "ear_toString");
        }
        else
        {
          *(_OWORD *)long long __p = 0uLL;
          std::string::size_type v24 = 0;
        }
        std::vector<std::string>::pointer end = (char *)retstr->__end_;
        value = (char *)retstr->__end_cap_.__value_;
        if (end >= value)
        {
          unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)retstr->__begin_) >> 3);
          unint64_t v14 = v13 + 1;
          if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((value - (char *)retstr->__begin_) >> 3);
          if (2 * v15 > v14) {
            unint64_t v14 = 2 * v15;
          }
          if (v15 >= 0x555555555555555) {
            unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v16 = v14;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&retstr->__end_cap_;
          if (v16) {
            uint64_t v17 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&retstr->__end_cap_, v16);
          }
          else {
            uint64_t v17 = 0;
          }
          id v18 = v17 + v13;
          __v.__first_ = v17;
          __v.__begin_ = v18;
          __v.__end_cap_.__value_ = &v17[v16];
          v18->__r_.__value_.__r.__words[2] = v24;
          *(_OWORD *)&v18->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
          std::string::size_type v24 = 0;
          *(_OWORD *)long long __p = 0uLL;
          __v.__end_ = v18 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)retstr, &__v);
          id v19 = retstr->__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          retstr->__end_ = v19;
        }
        else
        {
          *((void *)end + 2) = v24;
          *(_OWORD *)std::vector<std::string>::pointer end = *(_OWORD *)__p;
          std::string::size_type v24 = 0;
          *(_OWORD *)long long __p = 0uLL;
          retstr->__end_ = end + 24;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  return result;
}

- (shared_ptr<quasar::Translator>)_prepareFor:(id)a3 to:(id)a4
{
  unint64_t v8 = v4;
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_translationQueue);
  if ([(NSLocale *)self->_sourceLocale isEqual:v9]
    && ([(NSLocale *)self->_targetLocale isEqual:v10] & 1) != 0)
  {
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_sourceLocale, a3);
  objc_storeStrong((id *)&self->_targetLocale, a4);
  if (!v9 || !v10 || [v9 isEqual:v10])
  {
    cntrl = self->_translator.__cntrl_;
    self->_translator.__ptr_ = 0;
    self->_translator.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
    goto LABEL_21;
  }
  id v12 = [v9 localeIdentifier];
  uint64_t v13 = [v10 localeIdentifier];
  unint64_t v14 = (void *)v13;
  ptr = self->_translatorFactory.__ptr_;
  if (v12)
  {
    objc_msgSend(v12, "ear_toString");
    if (v14)
    {
LABEL_10:
      objc_msgSend(v14, "ear_toString");
      goto LABEL_13;
    }
  }
  else
  {
    v23[0] = 0;
    v23[1] = 0;
    uint64_t v24 = 0;
    if (v13) {
      goto LABEL_10;
    }
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v22 = 0;
LABEL_13:
  (*(void (**)(shared_ptr<quasar::Translator> *__return_ptr, TranslatorFactory *, void **, void **))(*(void *)ptr + 16))(&v25, ptr, v23, __p);
  shared_ptr<quasar::Translator> v16 = v25;
  shared_ptr<quasar::Translator> v25 = (shared_ptr<quasar::Translator>)0;
  uint64_t v17 = self->_translator.__cntrl_;
  self->_translator = v16;
  if (v17)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
    if (v25.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v25.__cntrl_);
    }
  }
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v24) < 0) {
    operator delete(v23[0]);
  }

LABEL_21:
  id v18 = self->_translator.__cntrl_;
  void *v8 = self->_translator.__ptr_;
  v8[1] = (Translator *)v18;
  if (v18) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v18 + 1, 1uLL, memory_order_relaxed);
  }

  result.__cntrl_ = v20;
  result.__ptr_ = v19;
  return result;
}

- (void)_dispatchTranslationRequest:()vector<std:(std:(BOOL)a4 :(id)a5 allocator<std:(shared_ptr<quasar:(id)a7 :(id)a8 Translator>)a6 :(id)a9 string>> *)a3 :(id)a10 string isFinal:spans:translator:sourceLocale:targetLocale:options:completion:
{
  cntrl = a6.__cntrl_;
  ptr = a6.__ptr_;
  id v31 = a5;
  std::vector<std::string> v30 = cntrl;
  id v29 = a7;
  id v28 = a8;
  id v16 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_translationQueue);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke;
  v42[3] = &unk_1E5FFE4B8;
  v42[4] = self;
  uint64_t v17 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v42];
  [v17 setQueuePriority:8];
  [(NSOperationQueue *)self->_translationRequestsQueue addOperation:v17];
  translationRequestsQueue = self->_translationRequestsQueue;
  id v19 = (void *)MEMORY[0x1E4F28B48];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3321888768;
  v32[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_2;
  v32[3] = &unk_1F0A63C38;
  BOOL v41 = a4;
  v32[4] = self;
  memset(&v38, 0, sizeof(v38));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v38, (long long *)a3->__begin_, (long long *)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
  id v20 = v16;
  id v37 = v20;
  id v21 = v30;
  uint64_t v33 = v21;
  id v22 = v29;
  uint64_t v24 = *(void *)ptr;
  std::string v23 = (std::__shared_weak_count *)*((void *)ptr + 1);
  id v34 = v22;
  uint64_t v39 = v24;
  v40 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v25 = v31;
  id v35 = v25;
  id v26 = v28;
  id v36 = v26;
  long long v27 = [v19 blockOperationWithBlock:v32];
  [(NSOperationQueue *)translationRequestsQueue addOperation:v27];

  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }

  v43 = &v38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
}

void __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 88) progress];
  objc_msgSend(v1, "setTotalUnitCount:", objc_msgSend(v1, "totalUnitCount") + 2);
}

void __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 80))
  {
    if (!*(unsigned char *)(a1 + 120))
    {
      v4 = [*(id *)(v2 + 88) progress];
      uint64_t v5 = [v4 totalUnitCount];
      uint64_t v6 = [*(id *)(*(void *)(v1 + 32) + 88) progress];
      uint64_t v7 = v5 + ~[v6 completedUnitCount];

      uint64_t v1 = a1;
      if (v7 > 1) {
        return;
      }
    }
  }
  if (*(void *)(v1 + 88) == *(void *)(v1 + 80))
  {
    id v22 = *(NSObject **)(*(void *)(v1 + 32) + 112);
    v157[0] = MEMORY[0x1E4F143A8];
    v157[1] = 3221225472;
    v157[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_3;
    v157[3] = &unk_1E5FFFE78;
    id v158 = *(id *)(v1 + 72);
    dispatch_async(v22, v157);

    return;
  }
  if ([*(id *)(v1 + 40) isEqual:*(void *)(v1 + 48)])
  {
    uint64_t v8 = v1;
    id v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = *(uint64_t **)(v1 + 80);
    for (uint64_t i = *(uint64_t **)(v1 + 88); v10 != i; v10 += 3)
    {
      id v12 = [EMTToken alloc];
      uint64_t v13 = v10;
      if (*((char *)v10 + 23) < 0) {
        uint64_t v13 = (uint64_t *)*v10;
      }
      unint64_t v14 = [NSString stringWithUTF8String:v13];
      LODWORD(v15) = 1148846080;
      id v16 = [(EMTToken *)v12 initWithText:v14 confidence:1 precededBySpace:1 followedBySpace:v15];

      [v9 addObject:v16];
    }
    uint64_t v17 = [EMTResult alloc];
    LODWORD(v18) = 1148846080;
    id v19 = [(EMTResult *)v17 initWithLocale:*(void *)(v8 + 40) tokens:v9 confidence:0 lowConfidence:0 metaInfo:0 romanization:0 alternativeSelectionSpans:v18];
    id v20 = *(NSObject **)(*(void *)(v8 + 32) + 112);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_4;
    block[3] = &unk_1E5FFE4E0;
    id v156 = *(id *)(v8 + 72);
    v155 = v19;
    id v21 = v19;
    dispatch_async(v20, block);

    return;
  }
  if (!*(void *)(v1 + 104))
  {
    v59 = *(NSObject **)(*(void *)(v1 + 32) + 112);
    v152[0] = MEMORY[0x1E4F143A8];
    v152[1] = 3221225472;
    v152[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_5;
    v152[3] = &unk_1E5FFFE78;
    id v153 = *(id *)(v1 + 72);
    dispatch_async(v59, v152);

    return;
  }
  unint64_t v140 = 0xBF80000000000000;
  char v141 = 0;
  char v147 = 0;
  char v148 = 0;
  char v149 = 0;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  LOBYTE(v145) = 0;
  char v151 = 0;
  char v150 = *(unsigned char *)(v1 + 120);
  uint64_t v103 = v1;
  std::string v23 = *(long long **)(v1 + 80);
  uint64_t v24 = *(long long **)(v1 + 88);
  if (v23 != v24)
  {
    do
    {
      if (*((char *)v23 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v131, *(const std::string::value_type **)v23, *((void *)v23 + 1));
      }
      else
      {
        long long v25 = *v23;
        v131.__r_.__value_.__r.__words[2] = *((void *)v23 + 2);
        *(_OWORD *)&v131.__r_.__value_.__l.__data_ = v25;
      }
      std::string v132 = v131;
      memset(&v131, 0, sizeof(v131));
      char v134 = 0;
      uint64_t v136 = 0;
      uint64_t v137 = 0;
      uint64_t v135 = 0;
      uint64_t v138 = 3212836864;
      int v139 = -1;
      int v26 = *((char *)v23 + 23);
      char v133 = 1;
      if (v26 < 0)
      {
        std::string::__init_copy_ctor_external(&v124, *(const std::string::value_type **)v23, *((void *)v23 + 1));
      }
      else
      {
        long long v27 = *v23;
        v124.__r_.__value_.__r.__words[2] = *((void *)v23 + 2);
        *(_OWORD *)&v124.__r_.__value_.__l.__data_ = v27;
      }
      std::string v125 = v124;
      memset(&v124, 0, sizeof(v124));
      __int16 v126 = 0;
      uint64_t v128 = 0;
      long long __p = 0uLL;
      uint64_t v129 = 3212836864;
      int v130 = -1;
      uint64_t v28 = *((void *)&v142 + 1);
      if (*((void *)&v142 + 1) >= (unint64_t)v143)
      {
        *((void *)&v142 + 1) = std::vector<quasar::TranslationToken>::__push_back_slow_path<quasar::TranslationToken>((uint64_t *)&v142, (long long *)&v125);
        if ((void)__p)
        {
          *((void *)&__p + 1) = __p;
          operator delete((void *)__p);
        }
      }
      else
      {
        long long v29 = *(_OWORD *)&v125.__r_.__value_.__l.__data_;
        *(void *)(*((void *)&v142 + 1) + 16) = *((void *)&v125.__r_.__value_.__l + 2);
        *(_OWORD *)uint64_t v28 = v29;
        memset(&v125, 0, sizeof(v125));
        *(_WORD *)(v28 + 24) = v126;
        *(void *)(v28 + 40) = 0;
        *(void *)(v28 + 48) = 0;
        *(void *)(v28 + 32) = 0;
        *(_OWORD *)(v28 + 32) = __p;
        *(void *)(v28 + 48) = v128;
        long long __p = 0uLL;
        uint64_t v128 = 0;
        uint64_t v30 = v129;
        *(_DWORD *)(v28 + 64) = v130;
        *(void *)(v28 + 56) = v30;
        *((void *)&v142 + 1) = v28 + 72;
      }
      if (SHIBYTE(v125.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v125.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v124.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v132.__r_.__value_.__l.__data_);
      }
      std::string v23 = (long long *)((char *)v23 + 24);
    }
    while (v23 != v24);
    if ((void)v142 != *((void *)&v142 + 1)) {
      *(unsigned char *)(*((void *)&v142 + 1) - 48) = 0;
    }
  }
  id v31 = *(void **)(v103 + 56);
  if (v31)
  {
    memset(&v132, 0, sizeof(v132));
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id obj = v31;
    uint64_t v32 = [obj countByEnumeratingWithState:&v120 objects:v162 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v121;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v121 != v33) {
            objc_enumerationMutation(obj);
          }
          id v35 = *(void **)(*((void *)&v120 + 1) + 8 * j);
          int v36 = [v35 range];
          int v37 = [v35 range];
          [v35 range];
          int v39 = v38;
          char v40 = [v35 doNotTranslate];
          char v41 = v40;
          int v42 = v39 + v37;
          std::string::size_type size = v132.__r_.__value_.__l.__size_;
          if (v132.__r_.__value_.__l.__size_ >= v132.__r_.__value_.__r.__words[2])
          {
            unint64_t v45 = 0xAAAAAAAAAAAAAAABLL
                * ((uint64_t)(v132.__r_.__value_.__l.__size_ - v132.__r_.__value_.__r.__words[0]) >> 2);
            unint64_t v46 = v45 + 1;
            if (v45 + 1 > 0x1555555555555555) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556
               * ((uint64_t)(v132.__r_.__value_.__r.__words[2] - v132.__r_.__value_.__r.__words[0]) >> 2) > v46)
              unint64_t v46 = 0x5555555555555556
                  * ((uint64_t)(v132.__r_.__value_.__r.__words[2] - v132.__r_.__value_.__r.__words[0]) >> 2);
            if (0xAAAAAAAAAAAAAAABLL
               * ((uint64_t)(v132.__r_.__value_.__r.__words[2] - v132.__r_.__value_.__r.__words[0]) >> 2) >= 0xAAAAAAAAAAAAAAALL)
              unint64_t v47 = 0x1555555555555555;
            else {
              unint64_t v47 = v46;
            }
            if (v47) {
              objc_super v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<int,float,int>>>((uint64_t)&v132.__r_.__value_.__r.__words[2], v47);
            }
            else {
              objc_super v48 = 0;
            }
            v49 = &v48[12 * v45];
            *(_DWORD *)v49 = v36;
            *((_DWORD *)v49 + 1) = v42;
            v49[8] = v41;
            uint64_t v50 = (unsigned char *)v132.__r_.__value_.__l.__size_;
            std::string::size_type v51 = v132.__r_.__value_.__r.__words[0];
            std::string::size_type v52 = (std::string::size_type)v49;
            if (v132.__r_.__value_.__l.__size_ != v132.__r_.__value_.__r.__words[0])
            {
              do
              {
                uint64_t v53 = *(void *)(v50 - 12);
                v50 -= 12;
                char v54 = v50[8];
                *(void *)(v52 - 12) = v53;
                v52 -= 12;
                *(unsigned char *)(v52 + 8) = v54;
              }
              while (v50 != (unsigned char *)v51);
              uint64_t v50 = (unsigned char *)v132.__r_.__value_.__r.__words[0];
            }
            std::string::size_type v44 = (std::string::size_type)(v49 + 12);
            v132.__r_.__value_.__r.__words[0] = v52;
            v132.__r_.__value_.__l.__size_ = (std::string::size_type)(v49 + 12);
            v132.__r_.__value_.__r.__words[2] = (std::string::size_type)&v48[12 * v47];
            if (v50) {
              operator delete(v50);
            }
          }
          else
          {
            *(_DWORD *)v132.__r_.__value_.__l.__size_ = v36;
            *(_DWORD *)(size + 4) = v42;
            std::string::size_type v44 = size + 12;
            *(unsigned char *)(size + 8) = v40;
          }
          v132.__r_.__value_.__l.__size_ = v44;
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v120 objects:v162 count:16];
      }
      while (v32);
    }

    quasar::TranslationPhrase::populateMetaInfoWithAlignmentQueries((uint64_t)&v140, (int **)&v132);
  }
  uint64_t v55 = *(void *)(v103 + 104);
  id v56 = *(id *)(v103 + 64);
  v57 = v56;
  if (v56) {
    uint64_t v58 = [v56 enableDisambiguationAlternatives];
  }
  else {
    uint64_t v58 = 0;
  }

  (*(void (**)(std::string *__return_ptr, uint64_t, unint64_t *, uint64_t, void))(*(void *)v55 + 24))(&v132, v55, &v140, v58, 0);
  if (v132.__r_.__value_.__r.__words[0] == v132.__r_.__value_.__l.__size_)
  {
    v100 = *(NSObject **)(*(void *)(v103 + 32) + 112);
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_6;
    v118[3] = &unk_1E5FFFE78;
    id v119 = *(id *)(v103 + 72);
    dispatch_async(v100, v118);
    id v99 = v119;
  }
  else
  {
    id v102 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    std::string::size_type v101 = v132.__r_.__value_.__l.__size_;
    for (std::string::size_type k = v132.__r_.__value_.__r.__words[0]; k != v101; k += 136)
    {
      id obja = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v60 = *(uint64_t **)(k + 16);
      v61 = *(uint64_t **)(k + 24);
      while (v60 != v61)
      {
        v62 = [EMTToken alloc];
        v63 = v60;
        if (*((char *)v60 + 23) < 0) {
          v63 = (uint64_t *)*v60;
        }
        v64 = [NSString stringWithUTF8String:v63];
        LODWORD(v65) = *((_DWORD *)v60 + 14);
        LODWORD(v66) = *((_DWORD *)v60 + 15);
        v67 = [(EMTToken *)v62 initWithText:v64 confidence:*((unsigned __int8 *)v60 + 25) score:*((unsigned __int8 *)v60 + 24) precededBySpace:v65 followedBySpace:v66];

        [obja addObject:v67];
        v60 += 9;
      }
      if (*(char *)(k + 63) < 0)
      {
        std::string::size_type v68 = *(void *)(k + 40);
        uint64_t v69 = *(void *)(k + 48);
      }
      else
      {
        std::string::size_type v68 = k + 40;
        uint64_t v69 = *(unsigned __int8 *)(k + 63);
      }
      v104 = objc_msgSend(NSString, "ear_stringWithStringView:", v68, v69);
      if (*(unsigned char *)(k + 88))
      {
        if (*(char *)(k + 87) < 0)
        {
          std::string::size_type v70 = *(void *)(k + 64);
          uint64_t v71 = *(void *)(k + 72);
        }
        else
        {
          std::string::size_type v70 = k + 64;
          uint64_t v71 = *(unsigned __int8 *)(k + 87);
        }
        v105 = objc_msgSend(NSString, "ear_stringWithStringView:", v70, v71);
      }
      else
      {
        v105 = 0;
      }
      *(_OWORD *)&v125.__r_.__value_.__r.__words[1] = 0uLL;
      v125.__r_.__value_.__r.__words[0] = (std::string::size_type)&v125.__r_.__value_.__l.__size_;
      if (*(unsigned char *)(k + 120))
      {
        id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v74 = *(int **)(k + 96);
        v73 = *(int **)(k + 104);
        id v107 = v72;
        v108 = v73;
        while (v74 != v73)
        {
          uint64_t v75 = *v74;
          uint64_t v76 = v74[2];
          uint64_t v109 = v74[3];
          uint64_t v110 = v74[1];
          id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v78 = *((void *)v74 + 2);
          uint64_t v79 = *((void *)v74 + 3);
          while (v78 != v79)
          {
            v80 = [EMTAlternative alloc];
            unint64_t v81 = *(void *)v78;
            v82 = *(std::__shared_weak_count **)(v78 + 8);
            unint64_t v116 = *(void *)v78;
            v117 = v82;
            if (v82) {
              atomic_fetch_add_explicit(&v82->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            std::string::size_type v83 = v125.__r_.__value_.__l.__size_;
            if (!v125.__r_.__value_.__l.__size_) {
              goto LABEL_95;
            }
            v84 = (std::string *)&v125.__r_.__value_.__r.__words[1];
            do
            {
              v85 = (std::string *)v83;
              v86 = v84;
              unint64_t v87 = *(void *)(v83 + 32);
              v88 = (std::string::size_type *)(v83 + 8);
              if (v87 >= v81)
              {
                v88 = (std::string::size_type *)v85;
                v84 = v85;
              }
              std::string::size_type v83 = *v88;
            }
            while (v83);
            if (v84 != (std::string *)&v125.__r_.__value_.__r.__words[1]
              && (v87 >= v81 ? (v89 = v85) : (v89 = v86), v81 >= v89[1].__r_.__value_.__l.__size_))
            {
              if (v87 < v81) {
                v85 = v86;
              }
              v91 = v85[2].__r_.__value_.__l.__data_;
            }
            else
            {
LABEL_95:
              uint64_t v90 = *(unsigned int *)(v81 + 24);
              if (v90 == -1) {
                std::__throw_bad_variant_access[abi:ne180100]();
              }
              v161 = &v159;
              uint64_t v160 = ((void (*)(char **))off_1F0A64370[v90])(&v161);
              std::__tree<std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>,std::__map_value_compare<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>,std::less<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>>,true>,std::allocator<std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>>>::__emplace_hint_unique_key_args<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>&,EMTAlternativeDescription * {__strong}&>((uint64_t **)&v125, &v125.__r_.__value_.__l.__size_, &v116, &v116, (id *)&v160);
              v91 = (char *)v160;
            }
            v92 = [(EMTAlternative *)v80 initWithDescription:v91 translationPhraseIndex:*(int *)(v78 + 16) selectionSpanIndex:*(int *)(v78 + 20)];

            if (v117) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v117);
            }
            [v77 addObject:v92];

            v78 += 24;
          }
          if ([v77 count])
          {
            v93 = -[EMTAlternativeSelectionSpan initWithSource:projection:alternatives:]([EMTAlternativeSelectionSpan alloc], "initWithSource:projection:alternatives:", v75, v110, v76, v109, v77);
            [v107 addObject:v93];
          }
          v74 += 10;
          v73 = v108;
        }
        if ([v107 count]) {
          goto LABEL_109;
        }
      }
      id v107 = 0;
LABEL_109:
      v94 = [EMTResult alloc];
      LODWORD(v95) = *(_DWORD *)(k + 4);
      v96 = [(EMTResult *)v94 initWithLocale:*(void *)(v103 + 48) tokens:obja confidence:*(unsigned __int8 *)(k + 8) lowConfidence:v104 metaInfo:v105 romanization:v107 alternativeSelectionSpans:v95];
      [v102 addObject:v96];

      std::__tree<std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>,std::__map_value_compare<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>,std::less<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>>,true>,std::allocator<std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>>>::destroy((uint64_t)&v125, (void *)v125.__r_.__value_.__l.__size_);
    }
    v97 = *(NSObject **)(*(void *)(v103 + 32) + 112);
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_7;
    v113[3] = &unk_1E5FFE4E0;
    id v98 = *(id *)(v103 + 72);
    id v114 = v102;
    id v115 = v98;
    id v99 = v102;
    dispatch_async(v97, v113);
  }
  v125.__r_.__value_.__r.__words[0] = (std::string::size_type)&v132;
  std::vector<quasar::TranslationPhrase>::__destroy_vector::operator()[abi:ne180100]((void ***)&v125);
  if (v149)
  {
    v132.__r_.__value_.__r.__words[0] = (std::string::size_type)&v148;
    std::vector<quasar::AlternativeSelectionSpan>::__destroy_vector::operator()[abi:ne180100]((void ***)&v132);
  }
  if (v147 && v146 < 0) {
    operator delete(v145);
  }
  if (SHIBYTE(v144) < 0) {
    operator delete(*((void **)&v143 + 1));
  }
  v132.__r_.__value_.__r.__words[0] = (std::string::size_type)&v142;
  std::vector<quasar::TranslationToken>::__destroy_vector::operator()[abi:ne180100]((void ***)&v132);
}

uint64_t __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_4(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  v3[0] = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getTranslatorWithCompletion:(id)a3
{
  id v4 = a3;
  translationQueue = self->_translationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__EMTTranslator_getTranslatorWithCompletion___block_invoke;
  v7[3] = &unk_1E5FFE4E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(translationQueue, v7);
}

void __45__EMTTranslator_getTranslatorWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v3 + 24);
  id v4 = *(std::__shared_weak_count **)(v3 + 32);
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v6);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_translationQueue, 0);
  objc_storeStrong((id *)&self->_translationRequestsQueue, 0);
  p_configs = &self->_configs;
  std::vector<quasar::SystemConfig>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_configs);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  cntrl = self->_translator.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->_translatorFactory.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end