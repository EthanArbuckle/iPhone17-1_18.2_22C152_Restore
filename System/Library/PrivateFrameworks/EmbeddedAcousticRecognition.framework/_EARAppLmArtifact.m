@interface _EARAppLmArtifact
+ (BOOL)createEmptyArtifact:(id)a3 version:(id)a4 locale:(id)a5 saveTo:(id)a6;
+ (BOOL)createPhraseCountsArtifact:(id)a3 version:(id)a4 locale:(id)a5 rawPhraseCountsPath:(id)a6 customPronunciationsPath:(id)a7 saveTo:(id)a8;
+ (BOOL)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 dataRoot:(id)a6 estimationRoot:(id)a7 minimize:(BOOL)a8 saveTo:(id)a9;
+ (BOOL)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 ncsRoot:(id)a6 dataRoot:(id)a7 estimationRoot:(id)a8 minimize:(BOOL)a9 saveTo:(id)a10;
+ (id)loadLmHandleFromArtifactAt:(id)a3 configPath:(id)a4;
+ (id)loadLmHandleFromArtifactAt:(id)a3 configPath:(id)a4 ncsRoot:(id)a5;
+ (id)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 dataRoot:(id)a6 estimationRoot:(id)a7 minimize:(BOOL)a8;
+ (id)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 ncsRoot:(id)a6 dataRoot:(id)a7 estimationRoot:(id)a8 minimize:(BOOL)a9;
- (BOOL)isAdaptableToSpeechModelVersion:(id)a3 locale:(id)a4;
- (_EARAppLmArtifact)initWithAppLmArtifact:(shared_ptr<quasar::artifact::AppLmArtifact>)a3;
- (_EARAppLmArtifact)initWithPath:(id)a3;
- (_EARAppLmArtifact)initWithVersion:(id)a3 andLocale:(id)a4;
- (id).cxx_construct;
- (id)loadAppLmData:(id)a3 dataRoot:(id)a4;
- (id)loadAppLmData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5;
- (id)loadCustomPronData:(id)a3 dataRoot:(id)a4;
- (id)loadCustomPronData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5;
- (id)loadLmHandle;
- (id)loadOovs;
- (shared_ptr<quasar::AppLmData>)_loadRawAppLmData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5;
- (shared_ptr<quasar::AppLmData>)_tryToLoadCachedLmData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5;
- (uint64_t)loadLmHandle;
- (unint64_t)getLifeCycleStage;
- (void)_cacheLmData:(shared_ptr<quasar:(id)a4 :(id)a5 AppLmData>)a3 configFilepath:(id)a6 ncsRoot:dataRoot:;
@end

@implementation _EARAppLmArtifact

- (_EARAppLmArtifact)initWithVersion:(id)a3 andLocale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_EARAppLmArtifact;
  v8 = [(_EARAppLmArtifact *)&v24 init];
  if (!v8) {
    goto LABEL_22;
  }
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
    if (v7)
    {
LABEL_4:
      objc_msgSend(v7, "ear_toString");
      goto LABEL_7;
    }
  }
  else
  {
    v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    if (v7) {
      goto LABEL_4;
    }
  }
  v15[0] = 0;
  v15[1] = 0;
  uint64_t v16 = 0;
LABEL_7:
  std::string::basic_string[abi:ne180100]<0>(v13, "_");
  quasar::Locale::fromInternalShortIdentifier((uint64_t)v15, (char *)v13, &v17);
  std::allocate_shared[abi:ne180100]<quasar::artifact::AppLmArtifact,std::allocator<quasar::artifact::AppLmArtifact>,std::string,quasar::Locale,void>(&v23);
  long long v9 = v23;
  long long v23 = 0uLL;
  v10 = (std::__shared_weak_count *)*((void *)v8 + 2);
  *(_OWORD *)(v8 + 8) = v9;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    if (*((void *)&v23 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v23 + 1));
    }
  }
  if (v19 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
  if (SHIBYTE(v22) < 0) {
    operator delete(v20);
  }
  v11 = (std::__shared_weak_count *)*((void *)v8 + 4);
  *((void *)v8 + 3) = 0;
  *((void *)v8 + 4) = 0;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
LABEL_22:

  return (_EARAppLmArtifact *)v8;
}

- (_EARAppLmArtifact)initWithPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EARAppLmArtifact;
  v5 = [(_EARAppLmArtifact *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
    std::allocate_shared[abi:ne180100]<quasar::artifact::AppLmArtifact,std::allocator<quasar::artifact::AppLmArtifact>,std::string,void>(&v10);
    long long v6 = v10;
    long long v10 = 0uLL;
    id v7 = (std::__shared_weak_count *)*((void *)v5 + 2);
    *(_OWORD *)(v5 + 8) = v6;
    if (v7)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      if (*((void *)&v10 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
      }
    }
    if (SHIBYTE(v14) < 0) {
      operator delete(__p);
    }
  }
  v8 = v5;

  return v8;
}

- (_EARAppLmArtifact)initWithAppLmArtifact:(shared_ptr<quasar::artifact::AppLmArtifact>)a3
{
  var0 = a3.var0;
  v10.receiver = self;
  v10.super_class = (Class)_EARAppLmArtifact;
  id v4 = [(_EARAppLmArtifact *)&v10 init];
  v5 = v4;
  if (v4)
  {
    long long v6 = *(Artifact **)var0;
    if (*(void *)var0)
    {
      uint64_t v7 = *((void *)var0 + 1);
      if (v7) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
      }
      cntrl = (std::__shared_weak_count *)v4->super._artifact.__cntrl_;
      v5->super._artifact.__ptr_ = v6;
      v5->super._artifact.__cntrl_ = (__shared_weak_count *)v7;
      if (cntrl) {
        std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      }
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (shared_ptr<quasar::AppLmData>)_tryToLoadCachedLmData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5
{
  long long v9 = v5;
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_cachedLmData.__ptr_
    && (cachedConfigFilepath = self->_cachedConfigFilepath) != 0
    && self->_cachedNcsRoot
    && self->_cachedDataRoot
    && [(NSString *)cachedConfigFilepath isEqualToString:v16]
    && [(NSString *)self->_cachedNcsRoot isEqualToString:v10]
    && [(NSString *)self->_cachedDataRoot isEqualToString:v11])
  {
    cntrl = self->_cachedLmData.__cntrl_;
    *long long v9 = self->_cachedLmData.__ptr_;
    v9[1] = (AppLmData *)cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    *long long v9 = 0;
    v9[1] = 0;
  }

  result.__cntrl_ = v15;
  result.__ptr_ = v14;
  return result;
}

- (void)_cacheLmData:(shared_ptr<quasar:(id)a4 :(id)a5 AppLmData>)a3 configFilepath:(id)a6 ncsRoot:dataRoot:
{
  ptr = a3.__ptr_;
  id v10 = a3.__cntrl_;
  id v11 = (NSString *)a4;
  v12 = (NSString *)a5;
  uint64_t v14 = *(AppLmData **)ptr;
  uint64_t v13 = *((void *)ptr + 1);
  if (v13) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_cachedLmData.__cntrl_;
  self->_cachedLmData.__ptr_ = v14;
  self->_cachedLmData.__cntrl_ = (__shared_weak_count *)v13;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  cachedConfigFilepath = self->_cachedConfigFilepath;
  self->_cachedConfigFilepath = (NSString *)v10;
  v20 = v10;

  cachedNcsRoot = self->_cachedNcsRoot;
  self->_cachedNcsRoot = v11;
  v18 = v11;

  cachedDataRoot = self->_cachedDataRoot;
  self->_cachedDataRoot = v12;
}

- (shared_ptr<quasar::AppLmData>)_loadRawAppLmData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5
{
  long long v9 = v5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(_EARAppLmArtifact *)self _tryToLoadCachedLmData:v10 ncsRoot:v11 dataRoot:v12];
  if ((void)v29)
  {
    uint64_t v13 = *((void *)&v29 + 1);
    *long long v9 = v29;
    v9[1] = v13;
    long long v29 = 0uLL;
    goto LABEL_18;
  }
  ptr = self->super._artifact.__ptr_;
  if (ptr)
  {
    if (v15)
    {
      id v16 = v15;
      cntrl = self->super._artifact.__cntrl_;
      if (cntrl) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
      }
      LifeCycleStage = quasar::artifact::AppLmArtifact::getLifeCycleStage(v15);
      if (quasar::artifact::AppLmArtifactLifeCycleStage::isTextNormalized(LifeCycleStage))
      {
        uint64_t v19 = 0;
        if (v12) {
          goto LABEL_9;
        }
      }
      else
      {
        if (v11) {
          +[_EARQuasarTokenizer tokenizerWithNcsRoot:v11];
        }
        else {
          +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:v10];
        }
        uint64_t v19 = *(void *)buf;
        if (v12)
        {
LABEL_9:
          if (v10)
          {
            objc_msgSend(v10, "ear_toString");
          }
          else
          {
            v26 = 0;
            uint64_t v27 = 0;
            uint64_t v28 = 0;
          }
          quasar::filesystem::Path::Path(buf, &v26);
          uint64_t v25 = v19;
          objc_msgSend(v12, "ear_toString");
          quasar::artifact::AppLmArtifact::loadAppLmData(v16, (uint64_t)buf, &v25);
        }
      }
      if (v10)
      {
        objc_msgSend(v10, "ear_toString");
      }
      else
      {
        v26 = 0;
        uint64_t v27 = 0;
        uint64_t v28 = 0;
      }
      quasar::filesystem::Path::Path(buf, &v26);
      uint64_t v23 = v19;
      std::string::basic_string[abi:ne180100]<0>(&__p, "app-lm.data");
      quasar::artifact::AppLmArtifact::loadAppLmData(v16, (uint64_t)buf, &v23);
    }
  }
  v20 = EarArtifactLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1A86000, v20, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", buf, 2u);
  }

  *long long v9 = 0;
  v9[1] = 0;
LABEL_18:
  if (*((void *)&v29 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v29 + 1));
  }

  result.__cntrl_ = v22;
  result.__ptr_ = v21;
  return result;
}

- (id)loadAppLmData:(id)a3 dataRoot:(id)a4
{
  id v4 = [(_EARAppLmArtifact *)self loadAppLmData:a3 ncsRoot:0 dataRoot:a4];
  return v4;
}

- (id)loadAppLmData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5
{
  [(_EARAppLmArtifact *)self _loadRawAppLmData:a3 ncsRoot:a4 dataRoot:a5];
  if (v10)
  {
    v5 = [_EARAppLmData alloc];
    uint64_t v8 = v10;
    long long v9 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    long long v6 = [(_EARAppLmData *)v5 initWithAppLmData:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  else
  {
    long long v6 = 0;
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v6;
}

- (id)loadCustomPronData:(id)a3 dataRoot:(id)a4
{
  id v4 = [(_EARAppLmArtifact *)self loadCustomPronData:a3 ncsRoot:0 dataRoot:a4];
  return v4;
}

- (id)loadCustomPronData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ptr = self->super._artifact.__ptr_;
  if (ptr
  {
    uint64_t v13 = v12;
    cntrl = self->super._artifact.__cntrl_;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    [(_EARAppLmArtifact *)self _loadRawAppLmData:v8 ncsRoot:v9 dataRoot:v10];
    if (*(void *)buf)
    {
      quasar::LmData::getSymbolTableData(*(quasar::LmData **)buf);
      quasar::artifact::AppLmArtifact::loadCustomPronData(v13, v21);
      uint64_t v15 = *(void **)v21;
      if (*(void *)v21) {
        operator new();
      }
    }
    else
    {
      std::string v17 = EarArtifactLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_1B1A86000, v17, OS_LOG_TYPE_DEFAULT, "Failed to load app lm data object for use parsing custom prons", v21, 2u);
      }

      uint64_t v15 = 0;
    }
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    id v16 = EarArtifactLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v16, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", buf, 2u);
    }

    uint64_t v15 = 0;
  }

  return v15;
}

- (id)loadOovs
{
  v9[3] = *(void ***)MEMORY[0x1E4F143B8];
  ptr = self->super._artifact.__ptr_;
  if (ptr)
  {
    if (v4)
    {
      cntrl = self->super._artifact.__cntrl_;
      if (cntrl) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
      }
      quasar::artifact::AppLmArtifact::loadOovs(v4, v9);
      if (v9[0])
      {
        long long v6 = EARHelpers::VectorToArray<std::string>((long long **)v9[0]);
        std::unique_ptr<std::vector<std::string>>::reset[abi:ne180100](v9, 0);
        if (!cntrl) {
          goto LABEL_13;
        }
      }
      else
      {
        std::unique_ptr<std::vector<std::string>>::reset[abi:ne180100](v9, 0);
        long long v6 = 0;
        if (!cntrl) {
          goto LABEL_13;
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
      goto LABEL_13;
    }
  }
  uint64_t v7 = EarArtifactLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1B1A86000, v7, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", (uint8_t *)v9, 2u);
  }

  long long v6 = 0;
LABEL_13:
  return v6;
}

- (id)loadLmHandle
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  ptr = self->super._artifact.__ptr_;
  if (ptr)
  {
    if (v4)
    {
      v5 = v4;
      cntrl = self->super._artifact.__cntrl_;
      if (cntrl) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
      }
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      std::string::basic_string[abi:ne180100]<0>(&__str, "language-model-weight");
      BOOL hasInfo = quasar::artifact::Artifact::hasInfo((uint64_t)v5, (const void **)&__str.__r_.__value_.__l.__data_);
      BOOL v8 = hasInfo;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__str.__r_.__value_.__l.__data_);
        if (v8) {
          goto LABEL_7;
        }
      }
      else if (hasInfo)
      {
LABEL_7:
        std::string::basic_string[abi:ne180100]<0>(__p, "language-model-weight");
        quasar::artifact::Artifact::getInfo((uint64_t)v5, (uint64_t)__p, &__str);
        float v9 = std::stof(&__str, 0);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
        if (v20 < 0) {
          operator delete(__p[0]);
        }
        id v10 = EarArtifactLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(__str.__r_.__value_.__l.__data_) = 134217984;
          *(double *)((char *)__str.__r_.__value_.__r.__words + 4) = v9;
          _os_log_impl(&dword_1B1A86000, v10, OS_LOG_TYPE_DEFAULT, "Interpolating app-lm with a weight of %f", (uint8_t *)&__str, 0xCu);
        }

        quasar::artifact::AppLmArtifact::getLmHandle(v5, &__str);
        std::shared_ptr<kaldi::quasar::LmHandle>::operator=[abi:ne180100]<kaldi::quasar::LmHandle,std::default_delete<kaldi::quasar::LmHandle>,void>(&v21, (uint64_t *)&__str);
LABEL_21:
        std::string::size_type v13 = __str.__r_.__value_.__r.__words[0];
        __str.__r_.__value_.__r.__words[0] = 0;
        if (v13) {
          (*(void (**)(std::string::size_type))(*(void *)v13 + 8))(v13);
        }
        uint64_t v14 = v21;
        if (v21)
        {
          uint64_t v15 = [_EARLmHandle alloc];
          uint64_t v17 = v21;
          v18 = v22;
          if (v22) {
            atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          v5 = [(_EARLmHandle *)v15 _initWithHandle:&v17];
          if (v18) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v18);
          }
        }
        if (v22) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v22);
        }
        if (!v14) {
          v5 = 0;
        }
        if (cntrl) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
        }
        goto LABEL_34;
      }
      id v12 = EarArtifactLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__str.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_1B1A86000, v12, OS_LOG_TYPE_DEFAULT, "Interpolating app-lm with default weight", (uint8_t *)&__str, 2u);
      }

      quasar::artifact::AppLmArtifact::getLmHandle(v5, &__str);
      std::shared_ptr<kaldi::quasar::LmHandle>::operator=[abi:ne180100]<kaldi::quasar::LmHandle,std::default_delete<kaldi::quasar::LmHandle>,void>(&v21, (uint64_t *)&__str);
      goto LABEL_21;
    }
  }
  id v11 = EarArtifactLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__str.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1B1A86000, v11, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", (uint8_t *)&__str, 2u);
  }

  v5 = 0;
LABEL_34:
  return v5;
}

- (BOOL)isAdaptableToSpeechModelVersion:(id)a3 locale:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  ptr = self->super._artifact.__ptr_;
  if (ptr
  {
    id v10 = v9;
    cntrl = self->super._artifact.__cntrl_;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    if (v7)
    {
      objc_msgSend(v7, "ear_toString");
    }
    else
    {
      v19[0] = 0;
      v19[1] = 0;
      uint64_t v20 = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(v17, "_");
    quasar::Locale::fromInternalShortIdentifier((uint64_t)v19, (char *)v17, (std::string *)&buf);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v16 = 0;
    }
    char isAdaptableToSpeechModelVersion = quasar::artifact::AppLmArtifact::isAdaptableToSpeechModelVersion(v10, &buf, (unsigned __int8 *)__p);
    if (SHIBYTE(v16) < 0) {
      operator delete(__p[0]);
    }
    if (v22 < 0) {
      operator delete(*(void **)&buf.var0.__r_.var0);
    }
    if (*((char *)&buf.var0.__r_.__value_.var0.var1 + 23) < 0) {
      operator delete(buf.var0.__r_.__value_.var0.var1.__data_);
    }
    if (v18 < 0) {
      operator delete(v17[0]);
    }
    if (SHIBYTE(v20) < 0) {
      operator delete(v19[0]);
    }
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    id v12 = EarArtifactLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.__r_.__value_.var0.var0.__data_ = 0;
      _os_log_impl(&dword_1B1A86000, v12, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", (uint8_t *)&buf, 2u);
    }

    char isAdaptableToSpeechModelVersion = 0;
  }

  return isAdaptableToSpeechModelVersion;
}

- (unint64_t)getLifeCycleStage
{
  ptr = self->super._artifact.__ptr_;
  if (ptr
  {
    cntrl = self->super._artifact.__cntrl_;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    LifeCycleStage = quasar::artifact::AppLmArtifact::getLifeCycleStage(v4);
    id v7 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
    int v8 = (int)v7;
    uint64_t v9 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v7);
    if (v8 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v9 + 64))
    {
      unint64_t v10 = 1;
    }
    else
    {
      id v12 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
      int v13 = (int)v12;
      uint64_t v14 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v12);
      if (v13 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v14 + 128))
      {
        unint64_t v10 = 2;
      }
      else
      {
        uint64_t v15 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
        int v16 = (int)v15;
        uint64_t v17 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v15);
        if (v16 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v17 + 192))
        {
          unint64_t v10 = 3;
        }
        else
        {
          char v18 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
          int v19 = (int)v18;
          uint64_t v20 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v18);
          if (v19 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v20 + 256))
          {
            unint64_t v10 = 4;
          }
          else
          {
            uint64_t v21 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
            int v22 = (int)v21;
            uint64_t v23 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v21);
            if (v22 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v23 + 320))
            {
              unint64_t v10 = 5;
            }
            else
            {
              uint64_t v24 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
              uint64_t v25 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v24);
              quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v25);
              unint64_t v10 = 0;
            }
          }
        }
      }
    }
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    id v11 = EarArtifactLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_1B1A86000, v11, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", v27, 2u);
    }

    return 0;
  }
  return v10;
}

+ (BOOL)createEmptyArtifact:(id)a3 version:(id)a4 locale:(id)a5 saveTo:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  EARLogger::initializeLogging((EARLogger *)a6);
  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    if (v10)
    {
LABEL_3:
      objc_msgSend(v10, "ear_toString");
      if (v11)
      {
LABEL_4:
        objc_msgSend(v11, "ear_toString");
        goto LABEL_8;
      }
LABEL_7:
      memset(v14, 0, sizeof(v14));
LABEL_8:
      std::string::basic_string[abi:ne180100]<0>(v13, "_");
      quasar::Locale::fromInternalShortIdentifier((uint64_t)v14, v13, &v17);
      quasar::artifact::CreateEmptyArtifact((const void **)v16, (uint64_t)v15);
    }
  }
  memset(v15, 0, sizeof(v15));
  if (v11) {
    goto LABEL_4;
  }
  goto LABEL_7;
}

+ (BOOL)createPhraseCountsArtifact:(id)a3 version:(id)a4 locale:(id)a5 rawPhraseCountsPath:(id)a6 customPronunciationsPath:(id)a7 saveTo:(id)a8
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  EARLogger::initializeLogging((EARLogger *)a8);
  if (v13)
  {
    objc_msgSend(v13, "ear_toString");
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    memset(&v24[6], 0, 24);
    if (v14)
    {
LABEL_3:
      objc_msgSend(v14, "ear_toString");
      if (v15)
      {
LABEL_4:
        objc_msgSend(v15, "ear_toString");
        goto LABEL_8;
      }
LABEL_7:
      memset(v24, 0, 24);
LABEL_8:
      std::string::basic_string[abi:ne180100]<0>(v23, "_");
      quasar::Locale::fromInternalShortIdentifier((uint64_t)v24, v23, &v25);
      if (v16) {
        objc_msgSend(v16, "ear_toString");
      }
      else {
        memset(v21, 0, sizeof(v21));
      }
      quasar::filesystem::Path::Path(&v22, v21);
      if (v17) {
        objc_msgSend(v17, "ear_toString");
      }
      else {
        memset(v19, 0, sizeof(v19));
      }
      quasar::filesystem::Path::Path(&v20, v19);
      quasar::artifact::CreatePhraseCountsArtifact();
    }
  }
  memset(&v24[3], 0, 24);
  if (v15) {
    goto LABEL_4;
  }
  goto LABEL_7;
}

+ (id)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 dataRoot:(id)a6 estimationRoot:(id)a7 minimize:(BOOL)a8
{
  LOBYTE(v10) = a8;
  int v8 = [a1 transitionArtifactAt:a3 toStage:a4 configPath:a5 ncsRoot:0 dataRoot:a6 estimationRoot:a7 minimize:v10];
  return v8;
}

+ (id)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 ncsRoot:(id)a6 dataRoot:(id)a7 estimationRoot:(id)a8 minimize:(BOOL)a9
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  EARLogger::initializeLogging((EARLogger *)a8);
  if (v13) {
    objc_msgSend(v13, "ear_toString");
  }
  operator new();
}

+ (BOOL)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 dataRoot:(id)a6 estimationRoot:(id)a7 minimize:(BOOL)a8 saveTo:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  LOBYTE(v20) = a8;
  LOBYTE(a4) = [(id)objc_opt_class() transitionArtifactAt:v14 toStage:a4 configPath:v15 ncsRoot:0 dataRoot:v16 estimationRoot:v17 minimize:v20 saveTo:v18];

  return a4;
}

+ (BOOL)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 ncsRoot:(id)a6 dataRoot:(id)a7 estimationRoot:(id)a8 minimize:(BOOL)a9 saveTo:(id)a10
{
  id v16 = a10;
  LOBYTE(v21) = a9;
  id v17 = +[_EARAppLmArtifact transitionArtifactAt:a3 toStage:a4 configPath:a5 ncsRoot:a6 dataRoot:a7 estimationRoot:a8 minimize:v21];
  id v18 = v17;
  if (v17) {
    char v19 = [v17 write:v16];
  }
  else {
    char v19 = 0;
  }

  return v19;
}

+ (id)loadLmHandleFromArtifactAt:(id)a3 configPath:(id)a4
{
  id v4 = [a1 loadLmHandleFromArtifactAt:a3 configPath:a4 ncsRoot:0];
  return v4;
}

+ (id)loadLmHandleFromArtifactAt:(id)a3 configPath:(id)a4 ncsRoot:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9) {
    +[_EARQuasarTokenizer tokenizerWithNcsRoot:v9];
  }
  else {
    +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:v8];
  }
  if (v7)
  {
    objc_msgSend(v7, "ear_toString");
    if (!v8) {
      goto LABEL_8;
    }
  }
  else if (!v8)
  {
LABEL_8:
    quasar::artifact::LoadLmHandleFromArtifact();
  }
  objc_msgSend(v8, "ear_toString");
  goto LABEL_8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDataRoot, 0);
  objc_storeStrong((id *)&self->_cachedNcsRoot, 0);
  objc_storeStrong((id *)&self->_cachedConfigFilepath, 0);
  cntrl = self->_cachedLmData.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (uint64_t)_loadRawAppLmData:ncsRoot:dataRoot:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

- (uint64_t)loadLmHandle
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

@end