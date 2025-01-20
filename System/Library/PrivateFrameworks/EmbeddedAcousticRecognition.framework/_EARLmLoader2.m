@interface _EARLmLoader2
+ (void)initialize;
- (_EARLmLoader2)init;
- (_EARLmLoader2)initWithRoot:(id)a3;
- (id).cxx_construct;
- (id)fetchOrLoadModelWithDirectory:(id)a3 recognizer:(id)a4;
- (id)loadForRecognitionWithDirectory:(id)a3 recognizer:(id)a4 task:(id)a5 applicationName:(id)a6;
- (void)invalidate;
@end

@implementation _EARLmLoader2

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARLmLoader2)init
{
  return [(_EARLmLoader2 *)self initWithRoot:&stru_1F0A64AB0];
}

- (_EARLmLoader2)initWithRoot:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EARLmLoader2;
  v5 = [(_EARLmLoader2 *)&v11 init];
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
    std::allocate_shared[abi:ne180100]<quasar::LmLoader2,std::allocator<quasar::LmLoader2>,std::string,void>(&v10);
    long long v6 = v10;
    long long v10 = 0uLL;
    v7 = (std::__shared_weak_count *)*((void *)v5 + 2);
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

- (id)fetchOrLoadModelWithDirectory:(id)a3 recognizer:(id)a4
{
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  ptr = self->_loader.__ptr_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
    if (v8)
    {
LABEL_3:
      [v8 getRecognizer];
      long long v10 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    memset(__p, 0, 24);
    if (v7) {
      goto LABEL_3;
    }
  }
  long long v10 = 0;
LABEL_6:
  SysConfig = (quasar::SystemConfig *)quasar::SpeechRecognizer::getSysConfig(v10);
  quasar::LmLoader2::fetchOrLoadModel((uint64_t)ptr, (int)__p, SysConfig);
}

- (id)loadForRecognitionWithDirectory:(id)a3 recognizer:(id)a4 task:(id)a5 applicationName:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  ptr = self->_loader.__ptr_;
  if (v10)
  {
    objc_msgSend(v10, "ear_toString");
    if (v11)
    {
LABEL_3:
      [v11 getRecognizer];
      uint64_t v15 = v26;
      goto LABEL_6;
    }
  }
  else
  {
    v30[0] = 0;
    v30[1] = 0;
    uint64_t v31 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
  v26 = 0;
  v27 = 0;
LABEL_6:
  SysConfig = (quasar::SystemConfig *)quasar::SpeechRecognizer::getSysConfig(v15);
  if (v12)
  {
    objc_msgSend(v12, "ear_toString");
    if (v13)
    {
LABEL_8:
      objc_msgSend(v13, "ear_toString");
      goto LABEL_11;
    }
  }
  else
  {
    v24[0] = 0;
    v24[1] = 0;
    uint64_t v25 = 0;
    if (v13) {
      goto LABEL_8;
    }
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v23 = 0;
LABEL_11:
  quasar::LmLoader2::loadForRecognition(SysConfig, (uint64_t)ptr, (int)v30, (uint64_t)v24, (uint64_t)__p, &v28);
  if (SHIBYTE(v23) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v25) < 0) {
    operator delete(v24[0]);
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  if (SHIBYTE(v31) < 0) {
    operator delete(v30[0]);
  }
  if (v28)
  {
    v17 = [_EARLmModel2 alloc];
    uint64_t v20 = v28;
    v21 = v29;
    if (v29) {
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v18 = [(_EARLmModel2 *)v17 _initWithModel:&v20];
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
  }
  else
  {
    id v18 = 0;
  }
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }

  return v18;
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  cntrl = self->_loader.__cntrl_;
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