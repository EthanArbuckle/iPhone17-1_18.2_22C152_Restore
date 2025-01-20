@interface _EARLmEvaluator
+ (void)initialize;
- (BOOL)roundingEnabled;
- (BOOL)runEvaluationWithData:(id)a3 handle:(id)a4 result:(id *)a5;
- (BOOL)runEvaluationWithData:(id)a3 handle:(id)a4 result:(id *)a5 bestWeight:(float *)a6;
- (BOOL)runEvaluationWithData:(id)a3 handle:(id)a4 shouldStop:(id)a5 result:(id *)a6 bestWeight:(float *)a7;
- (_EARLmEvaluator)initWithConfiguration:(id)a3 recognizerConfiguration:(id)a4;
- (_EARLmEvaluator)initWithConfiguration:(id)a3 root:(id)a4 recognizerConfiguration:(id)a5;
- (id).cxx_construct;
- (void)setRoundingEnabled:(BOOL)a3;
@end

@implementation _EARLmEvaluator

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARLmEvaluator)initWithConfiguration:(id)a3 root:(id)a4 recognizerConfiguration:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_EARLmEvaluator;
  v11 = [(_EARLmEvaluator *)&v24 init];
  if (!v11)
  {
LABEL_23:
    v15 = v11;
    goto LABEL_24;
  }
  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v13 = [v12 fileExistsAtPath:v8];

  if (v13)
  {
    if (v8)
    {
      objc_msgSend(v8, "ear_toString");
      if (v9) {
        goto LABEL_5;
      }
    }
    else
    {
      long long buf = 0uLL;
      uint64_t v26 = 0;
      if (v9)
      {
LABEL_5:
        objc_msgSend(v9, "ear_toString");
        if (v10)
        {
LABEL_6:
          objc_msgSend(v10, "ear_toString");
          goto LABEL_13;
        }
LABEL_12:
        __p = 0;
        char v20 = 0;
LABEL_13:
        std::allocate_shared[abi:ne180100]<quasar::LmEvaluator,std::allocator<quasar::LmEvaluator>,std::string,std::string,std::string,void>(&v23);
        long long v16 = v23;
        long long v23 = 0uLL;
        v17 = (std::__shared_weak_count *)*((void *)v11 + 2);
        *(_OWORD *)(v11 + 8) = v16;
        if (v17)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v17);
          if (*((void *)&v23 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v23 + 1));
          }
        }
        if (v20 < 0) {
          operator delete(__p);
        }
        if (v22 < 0) {
          operator delete(v21);
        }
        if (SHIBYTE(v26) < 0) {
          operator delete((void *)buf);
        }
        v11[24] = 1;
        goto LABEL_23;
      }
    }
    v21 = 0;
    char v22 = 0;
    if (v10) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  v14 = EarLmLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1B1A86000, v14, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
  }

  v15 = 0;
LABEL_24:

  return v15;
}

- (_EARLmEvaluator)initWithConfiguration:(id)a3 recognizerConfiguration:(id)a4
{
  return [(_EARLmEvaluator *)self initWithConfiguration:a3 root:&stru_1F0A64AB0 recognizerConfiguration:a4];
}

- (BOOL)runEvaluationWithData:(id)a3 handle:(id)a4 result:(id *)a5
{
  int v6 = 0;
  return [(_EARLmEvaluator *)self runEvaluationWithData:a3 handle:a4 result:a5 bestWeight:&v6];
}

- (BOOL)runEvaluationWithData:(id)a3 handle:(id)a4 result:(id *)a5 bestWeight:(float *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (a5) {
    *a5 = 0;
  }
  double v12 = quasar::PTree::PTree((quasar::PTree *)v20);
  if (v11)
  {
    objc_msgSend(v11, "handle", v12);
  }
  else
  {
    uint64_t v18 = 0;
    v19 = 0;
  }
  ptr = self->_evaluator.__ptr_;
  [v10 data];
  char v14 = quasar::LmEvaluator::runEvaluation((uint64_t)ptr, v16, (uint64_t)&v18, (quasar *)v20, a6, self->_roundingEnabled, 0);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (a5)
  {
    EARHelpers::dictFromPTree((EARHelpers *)v20, (const quasar::PTree *)1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  quasar::PTree::~PTree((quasar::PTree *)v20);

  return v14;
}

- (BOOL)runEvaluationWithData:(id)a3 handle:(id)a4 shouldStop:(id)a5 result:(id *)a6 bestWeight:(float *)a7
{
  return [(_EARLmEvaluator *)self runEvaluationWithData:a3 handle:a4 result:a6 bestWeight:a7];
}

- (BOOL)roundingEnabled
{
  return self->_roundingEnabled;
}

- (void)setRoundingEnabled:(BOOL)a3
{
  self->_roundingEnabled = a3;
}

- (void).cxx_destruct
{
  cntrl = self->_evaluator.__cntrl_;
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

@end