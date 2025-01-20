@interface DEVariableBoolean
- (BOOL)getValue;
- (DEVariableBoolean)init;
- (DEVariableBoolean)initWithName:(id)a3 value:(BOOL)a4;
- (DEVariableBoolean)initWithSharedPtr:(void *)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation DEVariableBoolean

- (void)setValue:(BOOL)a3
{
  [(DEVariable *)self This];
  if (!lpsrc)
  {
    v4 = 0;
    goto LABEL_6;
  }
  if (!v4)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  v4[66] = a3;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

- (BOOL)getValue
{
  [(DEVariable *)self This];
  if (!lpsrc)
  {
    v2 = 0;
    goto LABEL_6;
  }
  if (!v2)
  {
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  v3 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (v2) {
    LOBYTE(v2) = v2[66] != 0;
  }
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return (char)v2;
}

- (DEVariableBoolean)initWithName:(id)a3 value:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEVariableBoolean;
  v7 = [(DEVariable *)&v13 init];
  if (v7)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v6 UTF8String]);
    v8 = operator new(0x60uLL);
    v8[1] = 0;
    v8[2] = 0;
    void *v8 = &unk_1F2126A20;
    *(void *)&long long v9 = siri::dialogengine::VariableBoolean::VariableBoolean((uint64_t)(v8 + 3), &__p, a4);
    *((void *)&v9 + 1) = v8;
    long long v12 = v9;
    [(DEVariable *)v7 setThis:&v12];
    if (*((void *)&v12 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }

  return v7;
}

- (DEVariableBoolean)initWithSharedPtr:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DEVariableBoolean;
  v4 = [(DEVariable *)&v10 init];
  v5 = v4;
  if (v4)
  {
    id v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v8 = *(void *)a3;
    long long v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEVariable *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEVariableBoolean)init
{
  v7.receiver = self;
  v7.super_class = (Class)DEVariableBoolean;
  v2 = [(DEVariable *)&v7 init];
  if (v2)
  {
    v3 = operator new(0x60uLL);
    v3[1] = 0;
    v3[2] = 0;
    void *v3 = &unk_1F2126A20;
    *(void *)&long long v4 = siri::dialogengine::VariableBoolean::VariableBoolean((siri::dialogengine::VariableBoolean *)(v3 + 3));
    *((void *)&v4 + 1) = v3;
    long long v6 = v4;
    [(DEVariable *)v2 setThis:&v6];
    if (*((void *)&v6 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
    }
  }
  return v2;
}

@end