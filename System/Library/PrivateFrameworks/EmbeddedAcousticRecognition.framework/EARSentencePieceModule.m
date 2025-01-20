@interface EARSentencePieceModule
- (EARSentencePieceModule)initWithModelPath:(id)a3;
- (id).cxx_construct;
- (id)encodeUtterance:(id)a3;
- (int64_t)setEncodeOptions:(id)a3;
- (void)dealloc;
@end

@implementation EARSentencePieceModule

- (EARSentencePieceModule)initWithModelPath:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EARSentencePieceModule;
  v5 = [(EARSentencePieceModule *)&v15 init];
  if (!v5)
  {
LABEL_16:
    v10 = v5;
    goto LABEL_17;
  }
  _ZNSt3__115allocate_sharedB8ne180100IN13sentencepiece22SentencePieceProcessorENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(__p);
  long long v6 = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  v7 = (std::__shared_weak_count *)*((void *)v5 + 2);
  *(_OWORD *)(v5 + 8) = v6;
  if (v7)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
    }
  }
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v14 = 0;
  }
  v8 = (EARLogger *)(*(void *(**)(uint64_t *__return_ptr))(**((void **)v5 + 1) + 16))(&v12);
  if (!v12)
  {
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v12);
    if (SHIBYTE(v14) < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_16;
  }
  v9 = EARLogger::QuasarOSLogger(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[EARSentencePieceModule initWithModelPath:](v9);
  }

  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v12);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  v10 = 0;
LABEL_17:

  return v10;
}

- (void)dealloc
{
  if (self->_processor.__ptr_)
  {
    cntrl = self->_processor.__cntrl_;
    self->_processor.__ptr_ = 0;
    self->_processor.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)EARSentencePieceModule;
  [(EARSentencePieceModule *)&v4 dealloc];
}

- (int64_t)setEncodeOptions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_processor.__ptr_ + 64))(&v8);
  int v6 = sentencepiece::util::Status::code((sentencepiece::util::Status *)&v8);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v8);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p);
  }

  return v6;
}

- (id)encodeUtterance:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    objc_super v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  __p = 0;
  v13 = 0;
  uint64_t v14 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_processor.__ptr_ + 112))(&v11);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v11);
  int v6 = [MEMORY[0x1E4F1CA48] array];
  v7 = (unsigned int *)__p;
  uint64_t v8 = v13;
  if (__p != v13)
  {
    do
    {
      v9 = [NSNumber numberWithInt:*v7];
      [v6 addObject:v9];

      ++v7;
    }
    while (v7 != v8);
  }
  if (__p)
  {
    v13 = (unsigned int *)__p;
    operator delete(__p);
  }
  if (SHIBYTE(v17) < 0) {
    operator delete(v15);
  }

  return v6;
}

- (void).cxx_destruct
{
  cntrl = self->_processor.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)initWithModelPath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B1A86000, log, OS_LOG_TYPE_FAULT, "Cannot create SPM model", v1, 2u);
}

@end