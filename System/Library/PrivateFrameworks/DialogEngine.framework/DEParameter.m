@interface DEParameter
- (BOOL)overridable;
- (DEParameter)init;
- (DEParameter)initWithSharedPtr:(void *)a3;
- (NSString)defaultValue;
- (NSString)description;
- (NSString)name;
- (NSString)semanticConcept;
- (NSString)type;
- (id).cxx_construct;
- (shared_ptr<siri::dialogengine::Parameter>)This;
- (void)getSharedPtr;
- (void)setDescription:(id)a3;
- (void)setName:(id)a3;
- (void)setSemanticConcept:(id)a3;
- (void)setThis:(shared_ptr<siri::dialogengine::Parameter>)a3;
- (void)setType:(id)a3;
@end

@implementation DEParameter

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_This.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setThis:(shared_ptr<siri::dialogengine::Parameter>)a3
{
}

- (shared_ptr<siri::dialogengine::Parameter>)This
{
  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__24570);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setSemanticConcept:(id)a3
{
  id v4 = a3;
  [(DEParameter *)self This];
  uint64_t v5 = v8;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=((std::string *)(v5 + 160), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (NSString)semanticConcept
{
  v2 = NSString;
  [(DEParameter *)self This];
  if (*(char *)(v6 + 183) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 160), *(void *)(v6 + 168));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 160);
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v8;
  }
  else {
    v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  id v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return (NSString *)v4;
}

- (BOOL)overridable
{
  [(DEParameter *)self This];
  int v2 = *(unsigned __int8 *)(v4 + 233);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2 != 0;
}

- (NSString)defaultValue
{
  int v2 = NSString;
  [(DEParameter *)self This];
  if (*(char *)(v6 + 231) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 208), *(void *)(v6 + 216));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 208);
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v8;
  }
  else {
    v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  uint64_t v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return (NSString *)v4;
}

- (void)setDescription:(id)a3
{
  id v4 = a3;
  [(DEParameter *)self This];
  uint64_t v5 = v8;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=((std::string *)(v5 + 56), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (NSString)description
{
  int v2 = NSString;
  [(DEParameter *)self This];
  if (*(char *)(v6 + 79) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 56), *(void *)(v6 + 64));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 56);
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v8;
  }
  else {
    v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  id v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return (NSString *)v4;
}

- (void)setType:(id)a3
{
  id v4 = a3;
  [(DEParameter *)self This];
  uint64_t v5 = v8;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=((std::string *)(v5 + 32), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (NSString)type
{
  int v2 = NSString;
  [(DEParameter *)self This];
  if (*(char *)(v6 + 55) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 32), *(void *)(v6 + 40));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 32);
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v8;
  }
  else {
    v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  id v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return (NSString *)v4;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  [(DEParameter *)self This];
  uint64_t v5 = v8;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=((std::string *)(v5 + 8), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (NSString)name
{
  int v2 = NSString;
  [(DEParameter *)self This];
  if (*(char *)(v7 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)(v7 + 8), *(void *)(v7 + 16));
  }
  else
  {
    long long v3 = *(_OWORD *)(v7 + 8);
    v9.__r_.__value_.__r.__words[2] = *(void *)(v7 + 24);
    *(_OWORD *)&v9.__r_.__value_.__l.__data_ = v3;
  }
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v4 = &v9;
  }
  else {
    id v4 = (std::string *)v9.__r_.__value_.__r.__words[0];
  }
  uint64_t v5 = [v2 stringWithUTF8String:v4];
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return (NSString *)v5;
}

- (void)getSharedPtr
{
  return &self->_This;
}

- (DEParameter)initWithSharedPtr:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DEParameter;
  id v4 = [(DEParameter *)&v10 init];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v8 = *(void *)a3;
    std::string v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEParameter *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEParameter)init
{
  v6.receiver = self;
  v6.super_class = (Class)DEParameter;
  int v2 = [(DEParameter *)&v6 init];
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100IN4siri12dialogengine9ParameterENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v4);
    [(DEParameter *)v2 setThis:&v4];
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  return v2;
}

@end