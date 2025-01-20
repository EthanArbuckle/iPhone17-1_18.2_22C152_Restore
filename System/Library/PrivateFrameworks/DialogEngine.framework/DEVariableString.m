@interface DEVariableString
- (DEVariableString)init;
- (DEVariableString)initWithName:(id)a3 print:(id)a4 speak:(id)a5;
- (DEVariableString)initWithName:(id)a3 string:(id)a4;
- (DEVariableString)initWithSharedPtr:(void *)a3;
- (NSString)printValue;
- (NSString)speakValue;
- (void)setValuePrint:(id)a3 speak:(id)a4;
@end

@implementation DEVariableString

- (void)setValuePrint:(id)a3 speak:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(DEVariable *)self This];
  if (!lpsrc.__r_.__value_.__r.__words[0])
  {
    v8 = 0;
    goto LABEL_6;
  }
  if (!v8)
  {
LABEL_6:
    size = 0;
    goto LABEL_7;
  }
  size = (std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_;
  if (lpsrc.__r_.__value_.__l.__size_) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(lpsrc.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (lpsrc.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_);
  }
  if (v8)
  {
    std::string::basic_string[abi:ne180100]<0>(&lpsrc, (char *)[v6 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v7 UTF8String]);
    siri::dialogengine::SpeakableString::SetString(v8 + 3, &lpsrc, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(lpsrc.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(lpsrc.__r_.__value_.__l.__data_);
    }
  }
  if (size) {
    std::__shared_weak_count::__release_shared[abi:ne180100](size);
  }
}

- (NSString)speakValue
{
  [(DEVariable *)self This];
  if (!lpsrc.__r_.__value_.__r.__words[0])
  {
    uint64_t v2 = 0;
    goto LABEL_6;
  }
  if (!v2)
  {
LABEL_6:
    size = 0;
    goto LABEL_7;
  }
  size = (std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_;
  if (lpsrc.__r_.__value_.__l.__size_) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(lpsrc.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (lpsrc.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_);
  }
  if (v2)
  {
    v4 = NSString;
    if (*(char *)(v2 + 119) < 0) {
      std::string::__init_copy_ctor_external(&lpsrc, *(const std::string::value_type **)(v2 + 96), *(void *)(v2 + 104));
    }
    else {
      std::string lpsrc = *(std::string *)(v2 + 96);
    }
    v5 = (lpsrc.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? &lpsrc
       : (std::string *)lpsrc.__r_.__value_.__r.__words[0];
    uint64_t v2 = objc_msgSend(v4, "stringWithUTF8String:", v5, *(_OWORD *)&lpsrc.__r_.__value_.__l.__data_, lpsrc.__r_.__value_.__r.__words[2]);
    if (SHIBYTE(lpsrc.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(lpsrc.__r_.__value_.__l.__data_);
    }
  }
  if (size) {
    std::__shared_weak_count::__release_shared[abi:ne180100](size);
  }
  return (NSString *)(id)v2;
}

- (NSString)printValue
{
  [(DEVariable *)self This];
  if (!lpsrc.__r_.__value_.__r.__words[0])
  {
    uint64_t v2 = 0;
    goto LABEL_6;
  }
  if (!v2)
  {
LABEL_6:
    size = 0;
    goto LABEL_7;
  }
  size = (std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_;
  if (lpsrc.__r_.__value_.__l.__size_) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(lpsrc.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (lpsrc.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_);
  }
  if (v2)
  {
    v4 = NSString;
    if (*(char *)(v2 + 95) < 0) {
      std::string::__init_copy_ctor_external(&lpsrc, *(const std::string::value_type **)(v2 + 72), *(void *)(v2 + 80));
    }
    else {
      std::string lpsrc = *(std::string *)(v2 + 72);
    }
    v5 = (lpsrc.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? &lpsrc
       : (std::string *)lpsrc.__r_.__value_.__r.__words[0];
    uint64_t v2 = objc_msgSend(v4, "stringWithUTF8String:", v5, *(_OWORD *)&lpsrc.__r_.__value_.__l.__data_, lpsrc.__r_.__value_.__r.__words[2]);
    if (SHIBYTE(lpsrc.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(lpsrc.__r_.__value_.__l.__data_);
    }
  }
  if (size) {
    std::__shared_weak_count::__release_shared[abi:ne180100](size);
  }
  return (NSString *)(id)v2;
}

- (DEVariableString)initWithName:(id)a3 print:(id)a4 speak:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DEVariableString;
  v11 = [(DEVariable *)&v19 init];
  if (v11)
  {
    std::string::basic_string[abi:ne180100]<0>(&v17, (char *)[v8 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(&v16, (char *)[v9 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v10 UTF8String]);
    v12 = operator new(0x108uLL);
    v12[1] = 0;
    v12[2] = 0;
    void *v12 = &unk_1F2126AF0;
    *(void *)&long long v13 = siri::dialogengine::VariableString::VariableString((uint64_t)(v12 + 3), &v17, &v16, &__p);
    *((void *)&v13 + 1) = v12;
    long long v18 = v13;
    [(DEVariable *)v11 setThis:&v18];
    if (*((void *)&v18 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v17.__r_.__value_.__l.__data_);
    }
  }

  return v11;
}

- (DEVariableString)initWithName:(id)a3 string:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DEVariableString;
  id v8 = [(DEVariable *)&v16 init];
  if (v8)
  {
    std::string::basic_string[abi:ne180100]<0>(&v14, (char *)[v6 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
    id v9 = operator new(0x108uLL);
    v9[1] = 0;
    v9[2] = 0;
    *id v9 = &unk_1F2126AF0;
    *(void *)&long long v10 = siri::dialogengine::VariableString::VariableString((uint64_t)(v9 + 3), &v14, (uint64_t)__p);
    *((void *)&v10 + 1) = v9;
    long long v15 = v10;
    [(DEVariable *)v8 setThis:&v15];
    if (*((void *)&v15 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v14.__r_.__value_.__l.__data_);
    }
  }

  return v8;
}

- (DEVariableString)initWithSharedPtr:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DEVariableString;
  v4 = [(DEVariable *)&v10 init];
  v5 = v4;
  if (v4)
  {
    id v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v8 = *(void *)a3;
    id v9 = v6;
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

- (DEVariableString)init
{
  v7.receiver = self;
  v7.super_class = (Class)DEVariableString;
  uint64_t v2 = [(DEVariable *)&v7 init];
  if (v2)
  {
    v3 = operator new(0x108uLL);
    v3[1] = 0;
    v3[2] = 0;
    void *v3 = &unk_1F2126AF0;
    *(void *)&long long v4 = siri::dialogengine::VariableString::VariableString((siri::dialogengine::VariableString *)(v3 + 3));
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