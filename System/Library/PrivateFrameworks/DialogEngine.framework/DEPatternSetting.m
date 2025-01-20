@interface DEPatternSetting
- (DEPatternSetting)init;
- (DEPatternSetting)initWithSharedPtr:(void *)a3;
- (NSString)defaultValueFromSetting;
- (id).cxx_construct;
- (shared_ptr<siri::dialogengine::PatternSetting>)This;
- (void)getSharedPtr;
- (void)setThis:(shared_ptr<siri::dialogengine::PatternSetting>)a3;
@end

@implementation DEPatternSetting

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_This.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setThis:(shared_ptr<siri::dialogengine::PatternSetting>)a3
{
}

- (shared_ptr<siri::dialogengine::PatternSetting>)This
{
  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__2639);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (NSString)defaultValueFromSetting
{
  v2 = NSString;
  [(DEPatternSetting *)self This];
  if (*(char *)(v6 + 359) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 336), *(void *)(v6 + 344));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 336);
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v8;
  }
  else {
    v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return (NSString *)v4;
}

- (void)getSharedPtr
{
  return &self->_This;
}

- (DEPatternSetting)initWithSharedPtr:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DEPatternSetting;
  v4 = [(DEParameter *)&v10 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v8 = *(void *)a3;
    v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEPatternSetting *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEPatternSetting)init
{
  v6.receiver = self;
  v6.super_class = (Class)DEPatternSetting;
  v2 = [(DEParameter *)&v6 init];
  if (v2)
  {
    -[DEPatternSetting setThis:](v2, "setThis:", &v4, _ZNSt3__115allocate_sharedB8ne180100IN4siri12dialogengine14PatternSettingENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v4));
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  return v2;
}

@end