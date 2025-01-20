@interface DEFile
- (DEFile)init;
- (DEFile)initWithSharedPtr:(shared_ptr<siri::dialogengine::File>)a3;
- (NSString)id;
- (NSString)localeFilename;
- (NSString)paramsFilename;
- (id).cxx_construct;
- (id)execute:(id)a3;
- (id)getDialogs;
- (id)getFormatVersion;
- (id)getParameters;
- (id)getRoot;
- (id)getValidationErrors;
- (id)getValidationWarnings;
- (shared_ptr<siri::dialogengine::File>)This;
- (void)setId:(id)a3;
- (void)setLocaleFilename:(id)a3;
- (void)setParamsFilename:(id)a3;
- (void)setThis:(shared_ptr<siri::dialogengine::File>)a3;
@end

@implementation DEFile

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

- (void)setThis:(shared_ptr<siri::dialogengine::File>)a3
{
}

- (shared_ptr<siri::dialogengine::File>)This
{
  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (id)execute:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  [(DEFile *)self This];
  siri::dialogengine::File::Execute((siri::dialogengine::File *)v15, (const void ***)[v4 This], &v17);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  uint64_t v6 = v17;
  if (v18 != v17)
  {
    unint64_t v7 = 0;
    do
    {
      long long v8 = *(_OWORD *)(v6 + 16 * v7);
      long long v13 = v8;
      v9 = *(std::__shared_weak_count **)(v6 + 16 * v7 + 8);
      if (*((void *)&v8 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v8 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      v10 = [DENode alloc];
      long long v14 = v13;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v11 = -[DENode initWithSharedPtr:](v10, "initWithSharedPtr:", &v14, v13);
      [v5 addObject:v11];

      if (*((void *)&v14 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
      }
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      ++v7;
      uint64_t v6 = v17;
    }
    while (v7 < (v18 - v17) >> 4);
  }
  v15 = (void **)&v17;
  std::vector<std::shared_ptr<siri::dialogengine::PatternSchemaComponent>>::__destroy_vector::operator()[abi:ne180100](&v15);

  return v5;
}

- (id)getValidationWarnings
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [(DEFile *)self This];
  std::vector<siri::dialogengine::ValidationEntry>::vector<std::__tree_const_iterator<siri::dialogengine::ValidationEntry,std::__tree_node<siri::dialogengine::ValidationEntry,void *> *,long>,0>(&v12, *(void **)(__p.__r_.__value_.__r.__words[0] + 592), (void *)(__p.__r_.__value_.__r.__words[0] + 600));
  if (__p.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
  }
  uint64_t v4 = v12;
  if (v13 != v12)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = NSString;
      siri::dialogengine::ValidationEntry::GetFormattedText((siri::dialogengine::ValidationEntry *)(v4 + v5), &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v9 = [v7 stringWithUTF8String:p_p];
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      [v3 addObject:v9];

      ++v6;
      uint64_t v4 = v12;
      v5 += 88;
    }
    while (v6 < 0x2E8BA2E8BA2E8BA3 * ((v13 - v12) >> 3));
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v12;
  std::vector<siri::dialogengine::ValidationEntry>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return v3;
}

- (id)getValidationErrors
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [(DEFile *)self This];
  std::vector<siri::dialogengine::ValidationEntry>::vector<std::__tree_const_iterator<siri::dialogengine::ValidationEntry,std::__tree_node<siri::dialogengine::ValidationEntry,void *> *,long>,0>(&v12, *(void **)(__p.__r_.__value_.__r.__words[0] + 568), (void *)(__p.__r_.__value_.__r.__words[0] + 576));
  if (__p.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
  }
  uint64_t v4 = v12;
  if (v13 != v12)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = NSString;
      siri::dialogengine::ValidationEntry::GetFormattedText((siri::dialogengine::ValidationEntry *)(v4 + v5), &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v9 = [v7 stringWithUTF8String:p_p];
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      [v3 addObject:v9];

      ++v6;
      uint64_t v4 = v12;
      v5 += 88;
    }
    while (v6 < 0x2E8BA2E8BA2E8BA3 * ((v13 - v12) >> 3));
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v12;
  std::vector<siri::dialogengine::ValidationEntry>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return v3;
}

- (id)getDialogs
{
  [(DEFile *)self This];
  siri::dialogengine::File::GetDialogs(v12, &v14);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  v2 = objc_opt_new();
  v3 = v14;
  for (i = v15; v3 != i; v3 += 2)
  {
    uint64_t v6 = *v3;
    uint64_t v5 = (std::__shared_weak_count *)v3[1];
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v7 = [DEDialog alloc];
    uint64_t v10 = v6;
    v11 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    long long v8 = [(DEDialog *)v7 initWithSharedPtr:&v10];
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    [v2 addObject:v8];

    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  uint64_t v12 = (siri::dialogengine::File *)&v14;
  std::vector<std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  return v2;
}

- (id)getParameters
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [(DEFile *)self This];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  std::vector<siri::dialogengine::Parameter>::__init_with_size[abi:ne180100]<siri::dialogengine::Parameter*,siri::dialogengine::Parameter*>(&v12, (uint64_t)v10[22], (uint64_t)v10[23], 0xCF3CF3CF3CF3CF3DLL * (((unsigned char *)v10[23] - (unsigned char *)v10[22]) >> 4));
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  uint64_t v4 = v12;
  if (v13 != v12)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = (std::__shared_weak_count *)operator new(0x168uLL);
      v7->__shared_owners_ = 0;
      v7->__shared_weak_owners_ = 0;
      v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2122138;
      uint64_t v10 = (void **)siri::dialogengine::Parameter::Parameter((siri::dialogengine::Parameter *)&v7[1], (const siri::dialogengine::Parameter *)(v4 + v5));
      v11 = v7;
      long long v8 = [[DEParameter alloc] initWithSharedPtr:&v10];
      [v3 addObject:v8];

      if (v11) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      }
      ++v6;
      uint64_t v4 = v12;
      v5 += 336;
    }
    while (v6 < 0xCF3CF3CF3CF3CF3DLL * ((v13 - v12) >> 4));
  }
  uint64_t v10 = (void **)&v12;
  std::vector<siri::dialogengine::Parameter>::__destroy_vector::operator()[abi:ne180100](&v10);
  return v3;
}

- (void)setLocaleFilename:(id)a3
{
  id v4 = a3;
  [(DEFile *)self This];
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

- (NSString)localeFilename
{
  v2 = NSString;
  [(DEFile *)self This];
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

- (void)setId:(id)a3
{
  id v4 = a3;
  [(DEFile *)self This];
  uint64_t v5 = v8;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=((std::string *)(v5 + 104), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (NSString)id
{
  v2 = NSString;
  [(DEFile *)self This];
  if (*(char *)(v6 + 127) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 104), *(void *)(v6 + 112));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 104);
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

- (void)setParamsFilename:(id)a3
{
  id v4 = a3;
  [(DEFile *)self This];
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

- (NSString)paramsFilename
{
  v2 = NSString;
  [(DEFile *)self This];
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

- (id)getFormatVersion
{
  v2 = NSString;
  [(DEFile *)self This];
  if (*(char *)(v6 + 175) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 152), *(void *)(v6 + 160));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 152);
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
  return v4;
}

- (id)getRoot
{
  [(DEFile *)self This];
  uint64_t v3 = *(void *)(v9 + 224);
  v2 = *(std::__shared_weak_count **)(v9 + 232);
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  id v4 = [DEGroup alloc];
  uint64_t v7 = v3;
  std::string v8 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = [(DEGroup *)v4 initWithSharedPtr:&v7];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return v5;
}

- (DEFile)initWithSharedPtr:(shared_ptr<siri::dialogengine::File>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)DEFile;
  id v4 = [(DEFile *)&v10 init];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v8 = *(void *)ptr;
    uint64_t v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEFile *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEFile)init
{
  v3.receiver = self;
  v3.super_class = (Class)DEFile;
  if ([(DEFile *)&v3 init]) {
    operator new();
  }
  return 0;
}

@end