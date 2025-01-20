@interface DEPatternSchema
+ (id)schema:(id)a3 typeName:(id)a4;
- (DEPatternSchema)init;
- (DEPatternSchema)initWithPtr:(shared_ptr<siri::dialogengine::PatternSchema>)a3;
- (NSString)description;
- (NSString)name;
- (id).cxx_construct;
- (id)computedParameter:(id)a3;
- (id)computedParameterNames;
- (id)requiredParameter:(id)a3;
- (id)requiredParameterNames;
- (id)setting:(id)a3;
- (id)settingNames;
- (shared_ptr<siri::dialogengine::PatternSchema>)This;
- (void)setThis:(shared_ptr<siri::dialogengine::PatternSchema>)a3;
@end

@implementation DEPatternSchema

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

- (void)setThis:(shared_ptr<siri::dialogengine::PatternSchema>)a3
{
}

- (shared_ptr<siri::dialogengine::PatternSchema>)This
{
  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__49563);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (id)setting:(id)a3
{
  id v4 = a3;
  [(DEPatternSchema *)self This];
  v5 = (DEPatternSetting *)__p;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (__p)
  {
    [(DEPatternSchema *)self This];
    uint64_t v6 = v13;
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v4 UTF8String]);
    uint64_t v7 = std::__tree<std::string>::find<std::string>(v6 + 120, (const void **)&__p);
    if (v6 + 128 == v7)
    {
      v8 = 0;
      v5 = 0;
      v15 = 0;
      v16 = 0;
    }
    else
    {
      v5 = *(DEPatternSetting **)(v7 + 56);
      v8 = *(std::__shared_weak_count **)(v7 + 64);
      v15 = v5;
      v16 = v8;
      if (v8) {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    if (v12 < 0) {
      operator delete(__p);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    if (v5)
    {
      v5 = [[DEPatternSetting alloc] initWithSharedPtr:&v15];
      v8 = v16;
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }

  return v5;
}

- (id)settingNames
{
  v3 = objc_opt_new();
  [(DEPatternSchema *)self This];
  if (__p.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
  }
  if (__p.__r_.__value_.__r.__words[0])
  {
    [(DEPatternSchema *)self This];
    siri::dialogengine::PatternSchema::GetSettings((siri::dialogengine::PatternSchema *)__p.__r_.__value_.__l.__data_, (uint64_t)&v13);
    if (__p.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
    id v4 = v13;
    if (v13 != (long long *)v14)
    {
      do
      {
        std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100](&__p, v4 + 2);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        uint64_t v6 = [NSString stringWithUTF8String:p_p];
        [v3 addObject:v6];

        if (v12) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v12);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        uint64_t v7 = (long long *)*((void *)v4 + 1);
        if (v7)
        {
          do
          {
            v8 = v7;
            uint64_t v7 = *(long long **)v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (long long *)*((void *)v4 + 2);
            BOOL v9 = *(void *)v8 == (void)v4;
            id v4 = v8;
          }
          while (!v9);
        }
        id v4 = v8;
      }
      while (v8 != (long long *)v14);
    }
    std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v14[0]);
  }
  return v3;
}

- (id)computedParameter:(id)a3
{
  id v4 = a3;
  [(DEPatternSchema *)self This];
  v5 = (DEParameter *)__p;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (__p)
  {
    [(DEPatternSchema *)self This];
    uint64_t v6 = v13;
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v4 UTF8String]);
    uint64_t v7 = std::__tree<std::string>::find<std::string>(v6 + 168, (const void **)&__p);
    if (v6 + 176 == v7)
    {
      v8 = 0;
      v5 = 0;
      v15 = 0;
      v16 = 0;
    }
    else
    {
      v5 = *(DEParameter **)(v7 + 56);
      v8 = *(std::__shared_weak_count **)(v7 + 64);
      v15 = v5;
      v16 = v8;
      if (v8) {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    if (v12 < 0) {
      operator delete(__p);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    if (v5)
    {
      v5 = [[DEParameter alloc] initWithSharedPtr:&v15];
      v8 = v16;
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }

  return v5;
}

- (id)computedParameterNames
{
  v3 = objc_opt_new();
  [(DEPatternSchema *)self This];
  if (__p.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
  }
  if (__p.__r_.__value_.__r.__words[0])
  {
    [(DEPatternSchema *)self This];
    std::map<std::string,std::shared_ptr<siri::dialogengine::Parameter>>::map[abi:ne180100]((uint64_t)&v13, (const void ***)(__p.__r_.__value_.__r.__words[0] + 168));
    if (__p.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
    id v4 = v13;
    if (v13 != (long long *)v14)
    {
      do
      {
        std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100](&__p, v4 + 2);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        uint64_t v6 = [NSString stringWithUTF8String:p_p];
        [v3 addObject:v6];

        if (v12) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v12);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        uint64_t v7 = (long long *)*((void *)v4 + 1);
        if (v7)
        {
          do
          {
            v8 = v7;
            uint64_t v7 = *(long long **)v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (long long *)*((void *)v4 + 2);
            BOOL v9 = *(void *)v8 == (void)v4;
            id v4 = v8;
          }
          while (!v9);
        }
        id v4 = v8;
      }
      while (v8 != (long long *)v14);
    }
    std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v14[0]);
  }
  return v3;
}

- (id)requiredParameter:(id)a3
{
  id v4 = a3;
  [(DEPatternSchema *)self This];
  v5 = (DEParameter *)__p;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (__p)
  {
    [(DEPatternSchema *)self This];
    uint64_t v6 = v13;
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v4 UTF8String]);
    uint64_t v7 = std::__tree<std::string>::find<std::string>(v6 + 144, (const void **)&__p);
    if (v6 + 152 == v7)
    {
      v8 = 0;
      v5 = 0;
      v15 = 0;
      v16 = 0;
    }
    else
    {
      v5 = *(DEParameter **)(v7 + 56);
      v8 = *(std::__shared_weak_count **)(v7 + 64);
      v15 = v5;
      v16 = v8;
      if (v8) {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    if (v12 < 0) {
      operator delete(__p);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    if (v5)
    {
      v5 = [[DEParameter alloc] initWithSharedPtr:&v15];
      v8 = v16;
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }

  return v5;
}

- (id)requiredParameterNames
{
  v3 = objc_opt_new();
  [(DEPatternSchema *)self This];
  if (__p.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
  }
  if (__p.__r_.__value_.__r.__words[0])
  {
    [(DEPatternSchema *)self This];
    std::map<std::string,std::shared_ptr<siri::dialogengine::Parameter>>::map[abi:ne180100]((uint64_t)&v13, (const void ***)(__p.__r_.__value_.__r.__words[0] + 144));
    if (__p.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
    id v4 = v13;
    if (v13 != (long long *)v14)
    {
      do
      {
        std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100](&__p, v4 + 2);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        uint64_t v6 = [NSString stringWithUTF8String:p_p];
        [v3 addObject:v6];

        if (v12) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v12);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        uint64_t v7 = (long long *)*((void *)v4 + 1);
        if (v7)
        {
          do
          {
            v8 = v7;
            uint64_t v7 = *(long long **)v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (long long *)*((void *)v4 + 2);
            BOOL v9 = *(void *)v8 == (void)v4;
            id v4 = v8;
          }
          while (!v9);
        }
        id v4 = v8;
      }
      while (v8 != (long long *)v14);
    }
    std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v14[0]);
  }
  return v3;
}

- (NSString)description
{
  [(DEPatternSchema *)self This];
  if (v10)
  {
    v3 = NSString;
    [(DEPatternSchema *)self This];
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

- (NSString)name
{
  [(DEPatternSchema *)self This];
  if (v11)
  {
    v3 = NSString;
    [(DEPatternSchema *)self This];
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

- (DEPatternSchema)initWithPtr:(shared_ptr<siri::dialogengine::PatternSchema>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)DEPatternSchema;
  long long v4 = [(DEPatternSchema *)&v10 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v8 = *(void *)ptr;
    std::string v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEPatternSchema *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEPatternSchema)init
{
  v7.receiver = self;
  v7.super_class = (Class)DEPatternSchema;
  v2 = [(DEPatternSchema *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    [(DEPatternSchema *)v2 setThis:&v5];
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
  siri::dialogengine::PatternRegistry::GetSchema(v6, (const std::string::value_type **)__p, (uint64_t *)&v14);
  uint64_t v8 = v14;
  if (v14)
  {
    std::string v9 = [DEPatternSchema alloc];
    objc_super v10 = v15;
    char v12 = v8;
    uint64_t v13 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = [(DEPatternSchema *)v9 initWithPtr:&v12];
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