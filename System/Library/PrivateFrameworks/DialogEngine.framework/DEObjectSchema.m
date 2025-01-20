@interface DEObjectSchema
+ (id)schema:(id)a3 typeName:(id)a4;
- (DEObjectSchema)init;
- (DEObjectSchema)initWithPtr:(shared_ptr<siri::dialogengine::ObjectSchema>)a3;
- (NSString)baseObject;
- (NSString)description;
- (NSString)name;
- (id).cxx_construct;
- (id)input:(id)a3 name:(id)a4;
- (id)inputNames:(id)a3;
- (id)property:(id)a3 name:(id)a4;
- (id)propertyNames:(id)a3;
- (shared_ptr<siri::dialogengine::ObjectSchema>)This;
- (void)setThis:(shared_ptr<siri::dialogengine::ObjectSchema>)a3;
@end

@implementation DEObjectSchema

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

- (void)setThis:(shared_ptr<siri::dialogengine::ObjectSchema>)a3
{
}

- (shared_ptr<siri::dialogengine::ObjectSchema>)This
{
  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__25601);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (id)input:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(DEObjectSchema *)self This];
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v15)
  {
    v8 = (const char *)[v6 This];
    [(DEObjectSchema *)self This];
    uint64_t v9 = v13;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
    siri::dialogengine::ObjectSchema::ResolveInput(v9, v8, (const void **)__p, 0, (uint64_t)&v15);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    operator new();
  }

  return 0;
}

- (id)inputNames:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [(DEObjectSchema *)self This];
  if (v14.__end_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14.__end_);
  }
  if (v14.__begin_)
  {
    uint64_t v6 = [v4 This];
    [(DEObjectSchema *)self This];
    siri::dialogengine::ObjectSchema::GetInputNames((uint64_t)__p.__r_.__value_.__l.__data_, v6, 0, &v14);
    if (__p.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
    std::vector<std::string>::pointer begin = v14.__begin_;
    for (std::vector<std::string>::pointer i = v14.__end_; begin != i; ++begin)
    {
      if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
      }
      else
      {
        long long v9 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = begin->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v11 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      [v5 addObject:v11];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v14;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }

  return v5;
}

- (id)property:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(DEObjectSchema *)self This];
  v8 = v16;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v16)
  {
    long long v9 = (const char *)[v6 This];
    [(DEObjectSchema *)self This];
    uint64_t v10 = v14;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
    siri::dialogengine::ObjectSchema::GetProperty(v10, v9, (const void **)__p, 0, (siri::dialogengine::ObjectProperty *)&v16);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    if (v18)
    {
      v8 = [[DEObjectProperty alloc] initWithOpt:&v16];
      if (v18) {
        siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v16);
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)propertyNames:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [(DEObjectSchema *)self This];
  if (v14.__end_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14.__end_);
  }
  if (v14.__begin_)
  {
    uint64_t v6 = [v4 This];
    [(DEObjectSchema *)self This];
    siri::dialogengine::ObjectSchema::GetPropertyNames((uint64_t)__p.__r_.__value_.__l.__data_, v6, 0, &v14);
    if (__p.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
    std::vector<std::string>::pointer begin = v14.__begin_;
    for (std::vector<std::string>::pointer i = v14.__end_; begin != i; ++begin)
    {
      if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
      }
      else
      {
        long long v9 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = begin->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v11 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      [v5 addObject:v11];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v14;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }

  return v5;
}

- (NSString)description
{
  [(DEObjectSchema *)self This];
  if (v10)
  {
    v3 = NSString;
    [(DEObjectSchema *)self This];
    if (*(char *)(v7 + 71) < 0) {
      std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)(v7 + 48), *(void *)(v7 + 56));
    }
    else {
      std::string v9 = *(std::string *)(v7 + 48);
    }
    if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v5 = &v9;
    }
    else {
      v5 = (std::string *)v9.__r_.__value_.__r.__words[0];
    }
    id v4 = [v3 stringWithUTF8String:v5];
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v9.__r_.__value_.__l.__data_);
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  else
  {
    id v4 = &stru_1F2127290;
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return (NSString *)v4;
}

- (NSString)baseObject
{
  [(DEObjectSchema *)self This];
  if (v10)
  {
    v3 = NSString;
    [(DEObjectSchema *)self This];
    if (*(char *)(v7 + 95) < 0) {
      std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)(v7 + 72), *(void *)(v7 + 80));
    }
    else {
      std::string v9 = *(std::string *)(v7 + 72);
    }
    if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v5 = &v9;
    }
    else {
      v5 = (std::string *)v9.__r_.__value_.__r.__words[0];
    }
    id v4 = [v3 stringWithUTF8String:v5];
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v9.__r_.__value_.__l.__data_);
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  else
  {
    id v4 = &stru_1F2127290;
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return (NSString *)v4;
}

- (NSString)name
{
  [(DEObjectSchema *)self This];
  if (v11)
  {
    v3 = NSString;
    [(DEObjectSchema *)self This];
    if (*((char *)v8 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)v8, *((void *)v8 + 1));
    }
    else
    {
      long long v4 = *v8;
      v10.__r_.__value_.__r.__words[2] = *((void *)v8 + 2);
      *(_OWORD *)&v10.__r_.__value_.__l.__data_ = v4;
    }
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v6 = &v10;
    }
    else {
      uint64_t v6 = (std::string *)v10.__r_.__value_.__r.__words[0];
    }
    v5 = [v3 stringWithUTF8String:v6];
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v10.__r_.__value_.__l.__data_);
    }
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  else
  {
    v5 = &stru_1F2127290;
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  return (NSString *)v5;
}

- (DEObjectSchema)initWithPtr:(shared_ptr<siri::dialogengine::ObjectSchema>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)DEObjectSchema;
  long long v4 = [(DEObjectSchema *)&v10 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v8 = *(void *)ptr;
    std::string v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEObjectSchema *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEObjectSchema)init
{
  v7.receiver = self;
  v7.super_class = (Class)DEObjectSchema;
  v2 = [(DEObjectSchema *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    [(DEObjectSchema *)v2 setThis:&v5];
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  return v3;
}

+ (id)schema:(id)a3 typeName:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 This];
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
  siri::dialogengine::ObjectRegistry::GetObject(v6, (const std::string::value_type **)__p, (uint64_t *)&v14);
  uint64_t v8 = v14;
  if (v14)
  {
    std::string v9 = [DEObjectSchema alloc];
    objc_super v10 = v15;
    char v12 = v8;
    char v13 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = [(DEObjectSchema *)v9 initWithPtr:&v12];
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_super v10 = v15;
    if (v15) {
LABEL_7:
    }
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (v17 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

@end