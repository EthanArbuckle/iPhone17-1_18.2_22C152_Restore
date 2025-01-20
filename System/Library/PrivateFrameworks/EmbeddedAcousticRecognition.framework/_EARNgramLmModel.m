@interface _EARNgramLmModel
+ (void)initialize;
- (BOOL)writeToDirectory:(id)a3;
- (NSString)arpaFileName;
- (_EARNgramLmModel)initWithConfiguration:(id)a3;
- (_EARNgramLmModel)initWithConfiguration:(id)a3 root:(id)a4;
- (id).cxx_construct;
- (id)_initWithModel:(shared_ptr<quasar:(shared_ptr<quasar::NgramFstConfig>)a4 :NgramLmModel2>)a3 config:;
- (id)generateNgramCounts:(id)a3;
- (id)initFromDirectory:(id)a3;
- (shared_ptr<quasar::NgramFstConfig>)ngramBuildConfig;
- (shared_ptr<quasar::NgramLmModel2>)ngramModel;
@end

@implementation _EARNgramLmModel

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (id)_initWithModel:(shared_ptr<quasar:(shared_ptr<quasar::NgramFstConfig>)a4 :NgramLmModel2>)a3 config:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v16.receiver = self;
  v16.super_class = (Class)_EARNgramLmModel;
  v6 = [(_EARNgramLmModel *)&v16 init];
  v7 = v6;
  if (v6)
  {
    p_ngramModel = &v6->_ngramModel;
    v10 = *(NgramLmModel2 **)ptr;
    uint64_t v9 = *((void *)ptr + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    v11 = (std::__shared_weak_count *)v6->_ngramModel.__cntrl_;
    p_ngramModel->__ptr_ = v10;
    v7->_ngramModel.__cntrl_ = (__shared_weak_count *)v9;
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    v13 = *(NgramFstConfig **)cntrl;
    uint64_t v12 = *((void *)cntrl + 1);
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    v14 = (std::__shared_weak_count *)v7->_ngramBuildConfig.__cntrl_;
    v7->_ngramBuildConfig.__ptr_ = v13;
    v7->_ngramBuildConfig.__cntrl_ = (__shared_weak_count *)v12;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  return v7;
}

- (_EARNgramLmModel)initWithConfiguration:(id)a3 root:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_EARNgramLmModel;
  v8 = [(_EARLmModel *)&v18 initWithConfiguration:v6 root:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    [(_EARLmModel *)v8 buildConfig];
    v10 = (NgramFstConfig *)lpsrc;
    if (lpsrc
    {
      v11 = v17;
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
    lpsrc = 0;
    v17 = 0;
  }
  cntrl = (std::__shared_weak_count *)v9->_ngramBuildConfig.__cntrl_;
  v9->_ngramBuildConfig.__ptr_ = v10;
  v9->_ngramBuildConfig.__cntrl_ = (__shared_weak_count *)v11;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v9->_ngramBuildConfig.__ptr_)
  {
    v13 = v9;
  }
  else
  {
    v14 = EarLmLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(lpsrc) = 0;
      _os_log_impl(&dword_1B1A86000, v14, OS_LOG_TYPE_DEFAULT, "Cannot cast to NgramFstConfig", (uint8_t *)&lpsrc, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (_EARNgramLmModel)initWithConfiguration:(id)a3
{
  return [(_EARNgramLmModel *)self initWithConfiguration:a3 root:@"app-lm.NGRAM"];
}

- (id)initFromDirectory:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_EARNgramLmModel;
  v5 = [(_EARLmModel *)&v15 initFromDirectory:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 model];
    id v7 = lpsrc;
    if (lpsrc
    {
      v8 = v14;
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    id v7 = 0;
    v8 = 0;
    lpsrc = 0;
    v14 = 0;
  }
  uint64_t v9 = (std::__shared_weak_count *)v6[6];
  v6[5] = v7;
  v6[6] = v8;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v6[5])
  {
    v10 = v6;
  }
  else
  {
    v11 = EarLmLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(lpsrc) = 0;
      _os_log_impl(&dword_1B1A86000, v11, OS_LOG_TYPE_DEFAULT, "Cannot cast to NgramLmModel", (uint8_t *)&lpsrc, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)writeToDirectory:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_EARLmModel *)self model];
  v5 = (NgramLmModel2 *)lpsrc;
  if (lpsrc
  {
    id v6 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    id v6 = 0;
  }
  p_ngramModel = &self->_ngramModel;
  cntrl = (std::__shared_weak_count *)p_ngramModel->__cntrl_;
  p_ngramModel->__ptr_ = v5;
  p_ngramModel->__cntrl_ = (__shared_weak_count *)v6;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  ptr = p_ngramModel->__ptr_;
  if (ptr)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      lpsrc = 0;
      v13 = 0;
      uint64_t v14 = 0;
    }
    quasar::LmModel2::write((unsigned char *)ptr + 656, (uint64_t)&lpsrc);
  }
  v10 = EarLmLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(lpsrc) = 0;
    _os_log_impl(&dword_1B1A86000, v10, OS_LOG_TYPE_DEFAULT, "Cannot cast to NgramLmModel", (uint8_t *)&lpsrc, 2u);
  }

  return 0;
}

- (id)generateNgramCounts:(id)a3
{
  v10[5] = *(uint64_t ***)MEMORY[0x1E4F143B8];
  id v4 = a3;
  ptr = (uint64_t **)self->_ngramBuildConfig.__ptr_;
  cntrl = self->_ngramBuildConfig.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  v10[0] = ptr;
  v10[1] = (uint64_t **)cntrl;
  [v4 data];
  quasar::generateNgramCountsStr(v10, v9, v7);
}

- (NSString)arpaFileName
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  ptr = self->_ngramModel.__ptr_;
  if (ptr)
  {
    v3 = NSString;
    std::string::basic_string[abi:ne180100]<0>(v7, "");
    quasar::NgramLmModel2::getArpaFileName((uint64_t)ptr, (uint64_t)v7, __p);
    if (v10 >= 0) {
      id v4 = __p;
    }
    else {
      id v4 = (void **)__p[0];
    }
    v5 = [v3 stringWithUTF8String:v4];
    if (v10 < 0) {
      operator delete(__p[0]);
    }
    if (v8 < 0) {
      operator delete(v7[0]);
    }
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (shared_ptr<quasar::NgramLmModel2>)ngramModel
{
  cntrl = self->_ngramModel.__cntrl_;
  *v2 = self->_ngramModel.__ptr_;
  v2[1] = (NgramLmModel2 *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (NgramLmModel2 *)self;
  return result;
}

- (shared_ptr<quasar::NgramFstConfig>)ngramBuildConfig
{
  cntrl = self->_ngramBuildConfig.__cntrl_;
  *v2 = self->_ngramBuildConfig.__ptr_;
  v2[1] = (NgramFstConfig *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (NgramFstConfig *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_ngramBuildConfig.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->_ngramModel.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end