@interface DEObjectProperty
- (DEObjectProperty)init;
- (DEObjectProperty)initWithOpt:(const void *)a3;
- (DEObjectProperty)initWithSharedPtr:(void *)a3;
- (NSArray)sampleValueLocales;
- (NSString)description;
- (NSString)name;
- (NSString)semanticConcept;
- (NSString)type;
- (id).cxx_construct;
- (id)sampleValuesForLocale:(id)a3;
- (optional<siri::dialogengine::ObjectProperty>)This;
- (shared_ptr<siri::dialogengine::ObjectProperty>)ThisShared;
- (void)setThis:(optional<siri::dialogengine::ObjectProperty> *)a3;
- (void)setThisShared:(shared_ptr<siri::dialogengine::ObjectProperty>)a3;
@end

@implementation DEObjectProperty

- (id).cxx_construct
{
  *((unsigned char *)self + 264) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((unsigned char *)self + 24) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (LOBYTE(self[3].super.isa)) {
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&self->_This);
  }
  cntrl = self->_ThisShared.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setThis:(optional<siri::dialogengine::ObjectProperty> *)a3
{
}

- (optional<siri::dialogengine::ObjectProperty>)This
{
  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 24), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__3);
  return result;
}

- (void)setThisShared:(shared_ptr<siri::dialogengine::ObjectProperty>)a3
{
}

- (shared_ptr<siri::dialogengine::ObjectProperty>)ThisShared
{
  objc_copyCppObjectAtomic(v2, &self->_ThisShared, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__3106);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (NSString)semanticConcept
{
  memset(&v10, 0, sizeof(v10));
  [(DEObjectProperty *)self This];
  if (v9)
  {
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v7.__r_.__value_.__l.__data_);
    [(DEObjectProperty *)self This];
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v6, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
    }
    else {
      std::string v6 = v8;
    }
    std::string v10 = v6;
    *((unsigned char *)&v6.__r_.__value_.__s + 23) = 0;
    v6.__r_.__value_.__s.__data_[0] = 0;
    if (v9) {
      siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v7.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    [(DEObjectProperty *)self ThisShared];
    if (v7.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7.__r_.__value_.__l.__size_);
    }
    if (v7.__r_.__value_.__r.__words[0])
    {
      [(DEObjectProperty *)self ThisShared];
      if (*(char *)(v6.__r_.__value_.__r.__words[0] + 183) < 0) {
        std::string::__init_copy_ctor_external(&v7, *(const std::string::value_type **)(v6.__r_.__value_.__r.__words[0] + 160), *(void *)(v6.__r_.__value_.__r.__words[0] + 168));
      }
      else {
        std::string v7 = *(std::string *)(v6.__r_.__value_.__r.__words[0] + 160);
      }
      std::string v10 = v7;
      *((unsigned char *)&v7.__r_.__value_.__s + 23) = 0;
      v7.__r_.__value_.__s.__data_[0] = 0;
      if (v6.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6.__r_.__value_.__l.__size_);
      }
    }
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v10;
  }
  else {
    v3 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  v4 = objc_msgSend(NSString, "stringWithUTF8String:", v3, v6.__r_.__value_.__r.__words[0]);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  return (NSString *)v4;
}

- (NSString)description
{
  memset(&v10, 0, sizeof(v10));
  [(DEObjectProperty *)self This];
  if (v9)
  {
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v7.__r_.__value_.__l.__data_);
    [(DEObjectProperty *)self This];
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v6, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
    }
    else {
      std::string v6 = v8;
    }
    std::string v10 = v6;
    *((unsigned char *)&v6.__r_.__value_.__s + 23) = 0;
    v6.__r_.__value_.__s.__data_[0] = 0;
    if (v9) {
      siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v7.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    [(DEObjectProperty *)self ThisShared];
    if (v7.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7.__r_.__value_.__l.__size_);
    }
    if (v7.__r_.__value_.__r.__words[0])
    {
      [(DEObjectProperty *)self ThisShared];
      if (*(char *)(v6.__r_.__value_.__r.__words[0] + 79) < 0) {
        std::string::__init_copy_ctor_external(&v7, *(const std::string::value_type **)(v6.__r_.__value_.__r.__words[0] + 56), *(void *)(v6.__r_.__value_.__r.__words[0] + 64));
      }
      else {
        std::string v7 = *(std::string *)(v6.__r_.__value_.__r.__words[0] + 56);
      }
      std::string v10 = v7;
      *((unsigned char *)&v7.__r_.__value_.__s + 23) = 0;
      v7.__r_.__value_.__s.__data_[0] = 0;
      if (v6.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6.__r_.__value_.__l.__size_);
      }
    }
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v10;
  }
  else {
    v3 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  v4 = objc_msgSend(NSString, "stringWithUTF8String:", v3, v6.__r_.__value_.__r.__words[0]);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  return (NSString *)v4;
}

- (NSString)type
{
  memset(&v10, 0, sizeof(v10));
  [(DEObjectProperty *)self This];
  if (v9)
  {
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v7.__r_.__value_.__l.__data_);
    [(DEObjectProperty *)self This];
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v6, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
    }
    else {
      std::string v6 = v8;
    }
    std::string v10 = v6;
    *((unsigned char *)&v6.__r_.__value_.__s + 23) = 0;
    v6.__r_.__value_.__s.__data_[0] = 0;
    if (v9) {
      siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v7.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    [(DEObjectProperty *)self ThisShared];
    if (v7.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7.__r_.__value_.__l.__size_);
    }
    if (v7.__r_.__value_.__r.__words[0])
    {
      [(DEObjectProperty *)self ThisShared];
      if (*(char *)(v6.__r_.__value_.__r.__words[0] + 55) < 0) {
        std::string::__init_copy_ctor_external(&v7, *(const std::string::value_type **)(v6.__r_.__value_.__r.__words[0] + 32), *(void *)(v6.__r_.__value_.__r.__words[0] + 40));
      }
      else {
        std::string v7 = *(std::string *)(v6.__r_.__value_.__r.__words[0] + 32);
      }
      std::string v10 = v7;
      *((unsigned char *)&v7.__r_.__value_.__s + 23) = 0;
      v7.__r_.__value_.__s.__data_[0] = 0;
      if (v6.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6.__r_.__value_.__l.__size_);
      }
    }
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v10;
  }
  else {
    v3 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  v4 = objc_msgSend(NSString, "stringWithUTF8String:", v3, v6.__r_.__value_.__r.__words[0]);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  return (NSString *)v4;
}

- (NSString)name
{
  memset(&v10, 0, sizeof(v10));
  [(DEObjectProperty *)self This];
  if (v9)
  {
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)v8);
    [(DEObjectProperty *)self This];
    if ((v8[31] & 0x80000000) != 0) {
      std::string::__init_copy_ctor_external(&v7, *(const std::string::value_type **)&v8[8], *(std::string::size_type *)&v8[16]);
    }
    else {
      std::string v7 = *(std::string *)&v8[8];
    }
    std::string v10 = v7;
    *((unsigned char *)&v7.__r_.__value_.__s + 23) = 0;
    v7.__r_.__value_.__s.__data_[0] = 0;
    if (v9) {
      siri::dialogengine::ObjectProperty::~ObjectProperty((void **)v8);
    }
  }
  else
  {
    [(DEObjectProperty *)self ThisShared];
    if (*(void *)&v8[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v8[8]);
    }
    if (*(void *)v8)
    {
      [(DEObjectProperty *)self ThisShared];
      if (*(char *)(v7.__r_.__value_.__r.__words[0] + 31) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)v8, *(const std::string::value_type **)(v7.__r_.__value_.__r.__words[0] + 8), *(void *)(v7.__r_.__value_.__r.__words[0] + 16));
      }
      else
      {
        long long v3 = *(_OWORD *)(v7.__r_.__value_.__r.__words[0] + 8);
        *(void *)&v8[16] = *(void *)(v7.__r_.__value_.__r.__words[0] + 24);
        *(_OWORD *)std::string v8 = v3;
      }
      std::string v10 = *(std::string *)v8;
      v8[23] = 0;
      v8[0] = 0;
      if (v7.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7.__r_.__value_.__l.__size_);
      }
    }
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v4 = &v10;
  }
  else {
    v4 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  v5 = objc_msgSend(NSString, "stringWithUTF8String:", v4, v7.__r_.__value_.__r.__words[0]);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  return (NSString *)v5;
}

- (NSArray)sampleValueLocales
{
  siri::dialogengine::Log::Error((siri::dialogengine::Log *)"DEObjectProperty.sampleValueLocales is deprecated.", a2);
  v2 = objc_opt_new();
  return (NSArray *)v2;
}

- (id)sampleValuesForLocale:(id)a3
{
  siri::dialogengine::Log::Error((siri::dialogengine::Log *)"DEObjectProperty.sampleValuesForLocale is deprecated.", a2, a3);
  long long v3 = objc_opt_new();
  return v3;
}

- (DEObjectProperty)initWithSharedPtr:(void *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DEObjectProperty;
  v4 = [(DEObjectProperty *)&v12 init];
  v5 = v4;
  if (v4)
  {
    std::string v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v10 = *(void *)a3;
    v11 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEObjectProperty *)v4 setThisShared:&v10];
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    LOBYTE(v8[0]) = 0;
    char v9 = 0;
    [(DEObjectProperty *)v5 setThis:v8];
    if (v9) {
      siri::dialogengine::ObjectProperty::~ObjectProperty(v8);
    }
  }
  return v5;
}

- (DEObjectProperty)initWithOpt:(const void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DEObjectProperty;
  v4 = [(DEObjectProperty *)&v11 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    [(DEObjectProperty *)v4 setThisShared:&v9];
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    std::__optional_copy_base<siri::dialogengine::ObjectProperty,false>::__optional_copy_base[abi:ne180100]((siri::dialogengine::ObjectProperty *)v7, (const siri::dialogengine::ObjectProperty *)a3);
    [(DEObjectProperty *)v5 setThis:v7];
    if (v8) {
      siri::dialogengine::ObjectProperty::~ObjectProperty(v7);
    }
  }
  return v5;
}

- (DEObjectProperty)init
{
  v9.receiver = self;
  v9.super_class = (Class)DEObjectProperty;
  v2 = [(DEObjectProperty *)&v9 init];
  long long v3 = v2;
  if (v2)
  {
    uint64_t v7 = 0;
    char v8 = 0;
    [(DEObjectProperty *)v2 setThisShared:&v7];
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    LOBYTE(v5[0]) = 0;
    char v6 = 0;
    [(DEObjectProperty *)v3 setThis:v5];
    if (v6) {
      siri::dialogengine::ObjectProperty::~ObjectProperty(v5);
    }
  }
  return v3;
}

@end