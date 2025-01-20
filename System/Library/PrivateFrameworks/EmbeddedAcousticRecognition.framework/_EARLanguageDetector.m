@interface _EARLanguageDetector
+ (id)localesOfMessages:(id)a3;
+ (shared_ptr<const)updateContext:(const void *)a3 withMessageLocales:(const void *)a4;
+ (vector<std::optional<quasar::language_detector::Locale>,)quasarLocalesOfMessages:(id)a2;
+ (void)initialize;
- (_EARLanguageDetector)initWithConfigFile:(id)a3;
- (_EARLanguageDetector)initWithConfigFile:(id)a3 overrides:(id)a4;
- (id).cxx_construct;
- (id)startRequestWith:(unint64_t)a3 context:(id)a4 delegate:(id)a5;
- (unsigned)featureQueuePriority;
- (void)setFeatureQueuePriority:(unsigned int)a3;
@end

@implementation _EARLanguageDetector

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
    os_log_t v4 = os_log_create("com.apple.ear", "EARLanguageDetector");
    v5 = (void *)earLanguageDetectorLog;
    earLanguageDetectorLog = (uint64_t)v4;
  }
}

- (_EARLanguageDetector)initWithConfigFile:(id)a3
{
  return [(_EARLanguageDetector *)self initWithConfigFile:a3 overrides:MEMORY[0x1E4F1CC08]];
}

- (_EARLanguageDetector)initWithConfigFile:(id)a3 overrides:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_EARLanguageDetector;
  v8 = [(_EARLanguageDetector *)&v10 init];
  if (v8)
  {
    v8->_featureQueuePriority = 0;
    operator new();
  }

  return 0;
}

+ (id)localesOfMessages:(id)a3
{
  id v4 = a3;
  [a1 quasarLocalesOfMessages:v4];
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0x6DB6DB6DB6DB6DB7 * ((v17 - v16) >> 3)];
  uint64_t v6 = v16;
  for (uint64_t i = v17; v6 != i; v6 += 56)
  {
    std::__optional_copy_base<quasar::language_detector::Locale,false>::__optional_copy_base[abi:ne180100](&v14, v6);
    if (v15)
    {
      v8 = NSString;
      quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v14, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      objc_super v10 = [v8 stringWithUTF8String:p_p];
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      objc_super v10 = [MEMORY[0x1E4F1CA98] null];
    }
    [v5 addObject:v10];

    std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v14);
  }
  v11 = (void *)[v5 copy];

  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  std::vector<std::optional<quasar::language_detector::Locale>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);

  return v11;
}

+ (vector<std::optional<quasar::language_detector::Locale>,)quasarLocalesOfMessages:(id)a2
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v35 = a4;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v35, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = v35;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [MEMORY[0x1E4F28DF0] dominantLanguageForString:*(void *)(*((void *)&v48 + 1) + 8 * i)];
        if (v9) {
          objc_super v10 = (__CFString *)v9;
        }
        else {
          objc_super v10 = @"und";
        }
        [v4 addObject:v10];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v6);
  }

  v11 = earLanguageDetectorLog;
  if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
    _os_log_impl(&dword_1B1A86000, v11, OS_LOG_TYPE_DEFAULT, "Identified languages of messages = %@", (uint8_t *)&buf, 0xCu);
  }
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v4;
  uint64_t v13 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v45;
    char v15 = @"und";
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        v18 = [v12 objectForKeyedSubscript:v17];
        BOOL v19 = v18 == 0;

        if (v19)
        {
          v20 = &stru_1F0A64AB0;
          if (([v17 isEqualToString:v15] & 1) == 0)
          {
            if (!AssistantServicesLibraryCore(0)) {
              goto LABEL_28;
            }
            id v21 = v17;
            *(void *)&long long v40 = 0;
            *((void *)&v40 + 1) = &v40;
            uint64_t v41 = 0x2020000000;
            v22 = (void (*)(id))getAFDictationLanguageForKeyboardLanguageSymbolLoc(void)::ptr;
            std::string __p = getAFDictationLanguageForKeyboardLanguageSymbolLoc(void)::ptr;
            if (!getAFDictationLanguageForKeyboardLanguageSymbolLoc(void)::ptr)
            {
              buf.__r_.__value_.__r.__words[0] = MEMORY[0x1E4F143A8];
              buf.__r_.__value_.__l.__size_ = 3221225472;
              buf.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZL50getAFDictationLanguageForKeyboardLanguageSymbolLocv_block_invoke;
              v53 = &unk_1E60003E0;
              v54 = &v40;
              ___ZL50getAFDictationLanguageForKeyboardLanguageSymbolLocv_block_invoke(&buf);
              v22 = *(void (**)(id))(*((void *)&v40 + 1) + 24);
            }
            _Block_object_dispose(&v40, 8);
            if (!v22)
            {
              v33 = [MEMORY[0x1E4F28B00] currentHandler];
              v34 = [NSString stringWithUTF8String:"NSString *localAFDictationLanguageForKeyboardLanguage(NSString *__strong)"];
              objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"EARLanguageDetector.mm", 45, @"%s", dlerror());

              __break(1u);
            }
            v22(v21);
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v23 = v15;
              id v24 = v5;
              v25 = earLanguageDetectorLog;
              if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.__r_.__value_.__l.__data_) = 138412546;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
                WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
                *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v20;
                _os_log_impl(&dword_1B1A86000, v25, OS_LOG_TYPE_DEFAULT, "%@ maps to %@", (uint8_t *)&buf, 0x16u);
              }
              id v5 = v24;
              char v15 = v23;
            }
            else
            {
LABEL_28:
              v26 = earLanguageDetectorLog;
              v20 = &stru_1F0A64AB0;
              if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v17;
                _os_log_impl(&dword_1B1A86000, v26, OS_LOG_TYPE_DEFAULT, "There is no keyboard language for %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          [v12 setObject:v20 forKeyedSubscript:v17];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v13);
  }

  unint64_t v27 = [obj count];
  std::vector<std::optional<quasar::language_detector::Locale>>::vector(retstr, v27);
  if (v27)
  {
    uint64_t v28 = 0;
    for (uint64_t k = 0; k != v27; ++k)
    {
      buf.__r_.__value_.__s.__data_[0] = 0;
      char v55 = 0;
      v30 = [obj objectAtIndexedSubscript:k];
      v31 = [v12 objectForKeyedSubscript:v30];

      if ([v31 length])
      {
        if (v31)
        {
          objc_msgSend(v31, "ear_toString");
        }
        else
        {
          v38[0] = 0;
          v38[1] = 0;
          uint64_t v39 = 0;
        }
        quasar::language_detector::Locale::Locale(&v40, v38);
        std::optional<quasar::language_detector::Locale>::operator=[abi:ne180100]<quasar::language_detector::Locale,void>((uint64_t)&buf, &v40);
        if (v43 < 0) {
          operator delete(__p);
        }
        if (SHIBYTE(v41) < 0) {
          operator delete((void *)v40);
        }
        if (SHIBYTE(v39) < 0) {
          operator delete(v38[0]);
        }
      }
      std::__optional_storage_base<quasar::language_detector::Locale,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<quasar::language_detector::Locale,false> const&>((std::string *)((char *)retstr->var0 + v28), &buf);

      std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
      v28 += 56;
    }
  }

  return result;
}

+ (shared_ptr<const)updateContext:(const void *)a3 withMessageLocales:(const void *)a4
{
  uint64_t v6 = v4;
  uint64_t v7 = (LDContext *)std::allocate_shared[abi:ne180100]<quasar::LDContext,std::allocator<quasar::LDContext>,quasar::LDContext const&,void>((const quasar::LDContext *)a3, v23);
  uint64_t v9 = v23[0];
  if (!*(unsigned char *)(v23[0] + 264))
  {
    uint64_t v19 = *((void *)a4 + 1);
    if (*(void *)a4 != v19)
    {
      if (*(unsigned char *)(v19 - 8))
      {
        std::__optional_storage_base<quasar::language_detector::Locale,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<quasar::language_detector::Locale,false> const&>((std::string *)(v23[0] + 216), (std::string *)(v19 - 56));
        uint64_t v9 = v23[0];
      }
    }
  }
  if (!*(unsigned char *)(v9 + 176))
  {
    id v21 = 0;
    uint64_t v22 = 0;
    v20 = (uint64_t *)&v21;
    uint64_t v10 = *(void *)a4;
    uint64_t v11 = *((void *)a4 + 1);
    if (*(void *)a4 != v11)
    {
      double v12 = 0.0;
      do
      {
        if (*(unsigned char *)(v10 + 48))
        {
          id v24 = (long long *)v10;
          uint64_t v13 = std::__tree<std::__value_type<quasar::language_detector::Locale,double>,std::__map_value_compare<quasar::language_detector::Locale,std::__value_type<quasar::language_detector::Locale,double>,std::less<quasar::language_detector::Locale>,true>,std::allocator<std::__value_type<quasar::language_detector::Locale,double>>>::__emplace_unique_key_args<quasar::language_detector::Locale,std::piecewise_construct_t const&,std::tuple<quasar::language_detector::Locale const&>,std::tuple<>>(&v20, (unsigned __int8 *)v10, (uint64_t)&std::piecewise_construct, &v24);
          *((double *)v13 + 10) = *((double *)v13 + 10) + 1.0;
          double v12 = v12 + 1.0;
        }
        v10 += 56;
      }
      while (v10 != v11);
      if (v22)
      {
        uint64_t v14 = v20;
        if (v20 != (uint64_t *)&v21)
        {
          do
          {
            *((double *)v14 + 10) = *((double *)v14 + 10) / v12;
            char v15 = (uint64_t *)v14[1];
            if (v15)
            {
              do
              {
                uint64_t v16 = v15;
                char v15 = (uint64_t *)*v15;
              }
              while (v15);
            }
            else
            {
              do
              {
                uint64_t v16 = (uint64_t *)v14[2];
                BOOL v17 = *v16 == (void)v14;
                uint64_t v14 = v16;
              }
              while (!v17);
            }
            uint64_t v14 = v16;
          }
          while (v16 != (uint64_t *)&v21);
        }
        std::optional<std::map<quasar::language_detector::Locale,double>>::operator=[abi:ne180100]<std::map<quasar::language_detector::Locale,double>&,void>(v23[0] + 152, (uint64_t)&v20);
      }
    }
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v20, v21);
    uint64_t v9 = v23[0];
  }
  uint64_t v18 = v23[1];
  *uint64_t v6 = v9;
  v6[1] = v18;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (id)startRequestWith:(unint64_t)a3 context:(id)a4 delegate:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = earLanguageDetectorLog;
  if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B1A86000, v10, OS_LOG_TYPE_DEFAULT, "Starting new request", (uint8_t *)&buf, 2u);
  }
  uint64_t v11 = (std::__shared_weak_count *)operator new(0x38uLL);
  v11->__shared_owners_ = 0;
  v11->__shared_weak_owners_ = 0;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0A5DD58;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0A340A0;
  v11[1].__shared_owners_ = 0;
  v11[1].__shared_weak_owners_ = 0;
  v11[2].__vftable = (std::__shared_weak_count_vtbl *)0xBFF0000000000000;
  EARLDResultStream::init((uint64_t)&v11[1], v9, self);
  double v12 = [v8 recentMessages];
  if (v12)
  {
    uint64_t v13 = [v8 previousMessageLanguage];
    if (v13)
    {
      uint64_t v14 = [v8 keyboardConvoLanguagePriors];

      if (v14)
      {
        char v15 = earLanguageDetectorLog;
        if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B1A86000, v15, OS_LOG_TYPE_DEFAULT, "previousMessageLanguage and keyboardConvoLanguagePriors are both set, so recentMessages will be ignored.", (uint8_t *)&buf, 2u);
        }

        double v12 = 0;
      }
    }
  }
  if (v8)
  {
    [v8 LDContext];
  }
  else
  {
    uint64_t v56 = 0;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long buf = 0u;
    long long v35 = 0u;
  }
  std::allocate_shared[abi:ne180100]<quasar::LDContext const,std::allocator<quasar::LDContext const>,quasar::LDContext,void>(&v57);
  quasar::LDContext::~LDContext((quasar::LDContext *)&buf);
  value = self->languageDetector.__ptr_.__value_;
  id location = &v11[1];
  v33 = v11;
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  quasar::LanguageDetector::startRequest(value, v6, &v57, &buf);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  BOOL v17 = dispatch_get_global_queue(self->_featureQueuePriority, 0);
  uint64_t v18 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __58___EARLanguageDetector_startRequestWith_context_delegate___block_invoke;
  block[3] = &unk_1F0A63C70;
  block[4] = self;
  long long v31 = buf;
  if (*((void *)&buf + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&buf + 1) + 8), 1uLL, memory_order_relaxed);
  }
  dispatch_async(v17, block);
  if (v12)
  {
    objc_initWeak(&location, self);
    atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    long long v19 = buf;
    if (*((void *)&buf + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&buf + 1) + 16), 1uLL, memory_order_relaxed);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3321888768;
    void v23[2] = __58___EARLanguageDetector_startRequestWith_context_delegate___block_invoke_63;
    v23[3] = &unk_1F0A63DF8;
    id v24 = v12;
    v25[1] = &v11[1];
    v26 = v11;
    atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    long long v27 = v19;
    if (*((void *)&v19 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v19 + 1) + 16), 1uLL, memory_order_relaxed);
    }
    objc_copyWeak(v25, &location);
    uint64_t v28 = v57;
    v29 = v58;
    if (v58) {
      atomic_fetch_add_explicit(&v58->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_async(v18, v23);
    if (v29) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v29);
    }
    objc_destroyWeak(v25);
    if (*((void *)&v27 + 1)) {
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v27 + 1));
    }
    if (v26) {
      std::__shared_weak_count::__release_weak(v26);
    }

    if (*((void *)&v19 + 1)) {
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v19 + 1));
    }
    std::__shared_weak_count::__release_weak(v11);
    objc_destroyWeak(&location);
  }
  v20 = *(std::__shared_weak_count **)(buf + 8);
  id location = *(id *)buf;
  v33 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v21 = [[_EARLanguageDetectorAudioBuffer alloc] _initWithAudioBuffer:&location];
  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
  if (*((void *)&v31 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v31 + 1));
  }

  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  if (v58) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v58);
  }

  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  return v21;
}

- (unsigned)featureQueuePriority
{
  return self->_featureQueuePriority;
}

- (void)setFeatureQueuePriority:(unsigned int)a3
{
  self->_featureQueuePriority = a3;
}

- (void).cxx_destruct
{
  value = self->languageDetector.__ptr_.__value_;
  p_languageDetector = &self->languageDetector;
  v3 = (uint64_t *)value;
  p_languageDetector->__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<quasar::LanguageDetector>::operator()[abi:ne180100]((uint64_t)p_languageDetector, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end