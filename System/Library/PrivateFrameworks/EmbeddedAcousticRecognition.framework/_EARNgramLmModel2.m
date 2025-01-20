@interface _EARNgramLmModel2
+ (void)initialize;
- (BOOL)writeToDirectory:(id)a3;
- (NSString)arpaFileName;
- (id).cxx_construct;
- (id)_initWithModel:(shared_ptr<quasar::NgramLmModel2>)a3;
- (shared_ptr<quasar::NgramLmModel2>)ngramModel;
- (void)setProtectionClass:(id)a3;
@end

@implementation _EARNgramLmModel2

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (id)_initWithModel:(shared_ptr<quasar::NgramLmModel2>)a3
{
  ptr = a3.__ptr_;
  v11.receiver = self;
  v11.super_class = (Class)_EARNgramLmModel2;
  v4 = [(_EARNgramLmModel2 *)&v11 init];
  v5 = v4;
  if (v4)
  {
    p_ngramModel = &v4->_ngramModel;
    v8 = *(NgramLmModel2 **)ptr;
    uint64_t v7 = *((void *)ptr + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_ngramModel.__cntrl_;
    p_ngramModel->__ptr_ = v8;
    v5->_ngramModel.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (BOOL)writeToDirectory:(id)a3
{
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  ptr = self->_ngramModel.__ptr_;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  else {
    memset(__p, 0, 24);
  }
  quasar::LmModel2::write((unsigned char *)ptr + 656, (uint64_t)__p);
}

- (void)setProtectionClass:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if ((id)*MEMORY[0x1E4F28340] == v4)
  {
    ptr = self->_ngramModel.__ptr_;
    int v8 = 1;
LABEL_12:
    *((_DWORD *)ptr + 198) = v8;
    goto LABEL_13;
  }
  if ((id)*MEMORY[0x1E4F28348] == v4)
  {
    ptr = self->_ngramModel.__ptr_;
    int v8 = 2;
    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F28358] == v4)
  {
    ptr = self->_ngramModel.__ptr_;
    int v8 = 3;
    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F28378] == v4)
  {
    ptr = self->_ngramModel.__ptr_;
    int v8 = 4;
    goto LABEL_12;
  }
  v6 = EarLmLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1B1A86000, v6, OS_LOG_TYPE_DEFAULT, "Unknown protection class: %@", (uint8_t *)&v9, 0xCu);
  }

LABEL_13:
}

- (NSString)arpaFileName
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  ptr = self->_ngramModel.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(v7, "");
  quasar::NgramLmModel2::getArpaFileName((uint64_t)ptr, (uint64_t)v7, __p);
  if (v10 >= 0) {
    id v4 = __p;
  }
  else {
    id v4 = (void **)__p[0];
  }
  v5 = [v2 stringWithUTF8String:v4];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  return (NSString *)v5;
}

- (shared_ptr<quasar::NgramLmModel2>)ngramModel
{
  cntrl = self->_ngramModel.__cntrl_;
  void *v2 = self->_ngramModel.__ptr_;
  v2[1] = (NgramLmModel2 *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (NgramLmModel2 *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_ngramModel.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end