@interface DEExecutionContext
+ (id)globalParameters;
- (BOOL)isBuiltinType:(id)a3;
- (BOOL)load:(id)a3 locale:(id)a4;
- (BOOL)needsUpgrade:(id)a3;
- (DEExecutionContext)init;
- (DEExecutionContext)initWithPtr:(shared_ptr<siri::dialogengine::Context>)a3;
- (NSString)loadStatus;
- (NSString)locale;
- (id).cxx_construct;
- (id)findVariable:(id)a3;
- (id)getBuiltinSemanticConcepts;
- (id)getFile;
- (id)upgrade:(id)a3;
- (shared_ptr<siri::dialogengine::Context>)SharedThis;
- (void)This;
- (void)addVariable:(id)a3;
- (void)enableDebugLogging;
- (void)registerMorphunDataPathFor:(id)a3 path:(id)a4;
- (void)setFile:(id)a3;
- (void)setSharedThis:(shared_ptr<siri::dialogengine::Context>)a3;
- (void)setTemplateDir:(id)a3;
- (void)setThis:(void *)a3;
@end

@implementation DEExecutionContext

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_SharedThis.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setSharedThis:(shared_ptr<siri::dialogengine::Context>)a3
{
}

- (shared_ptr<siri::dialogengine::Context>)SharedThis
{
  objc_copyCppObjectAtomic(v2, &self->_SharedThis, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__23149);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThis:(void *)a3
{
  self->_This = a3;
}

- (void)This
{
  return self->_This;
}

- (BOOL)isBuiltinType:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    v5 = (char *)[v3 UTF8String];
  }
  else {
    v5 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v5);
  BOOL IsBuiltinType = siri::dialogengine::IsBuiltinType(&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return IsBuiltinType;
}

- (id)getBuiltinSemanticConcepts
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v28, (const siri::dialogengine::RequestInfo *)([(DEExecutionContext *)self This] + 8));
  memset(v27, 0, sizeof(v27));
  std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(v27, v29, v30, 0xAAAAAAAAAAAAAAABLL * ((v30 - v29) >> 5));
  v18 = [MEMORY[0x1E4F1CA80] set];
  v2 = NSString;
  siri::dialogengine::GetBaseDir(v27, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v21 = objc_msgSend(v2, "stringWithFormat:", @"%s/%s", p_p, "metadata");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [v20 enumeratorAtPath:v21];
  __p.__r_.__value_.__s.__data_[0] = 1;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v9 = [NSString stringWithFormat:@"%@/%@", v21, v8];
        int v10 = [v20 fileExistsAtPath:v9 isDirectory:&__p];
        v11 = [v8 lastPathComponent];
        v12 = [v11 pathExtension];
        int v13 = [v12 isEqualToString:@"dtag"];

        if ((v10 & v13) == 1)
        {
          v14 = [v8 lastPathComponent];
          v15 = [v14 stringByDeletingPathExtension];
          [v18 addObject:v15];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v5);
  }

  v16 = [v18 allObjects];

  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  siri::dialogengine::RequestInfo::~RequestInfo(&v28);
  return v16;
}

- (void)enableDebugLogging
{
  siri::dialogengine::Log::SetLogDebugMessages((siri::dialogengine::Log *)1);
  siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Debug mode activated", v2);
}

- (void)registerMorphunDataPathFor:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DEExecutionContext *)self This];
  id v9 = v6;
  std::string::basic_string[abi:ne180100]<0>(&v13, (char *)[v9 UTF8String]);
  id v10 = v7;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
  siri::dialogengine::RegisterMorphunData((uint64_t)v8, &v13, (uint64_t)__p);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
}

- (NSString)locale
{
  v2 = [(DEExecutionContext *)self This];
  id v3 = NSString;
  siri::dialogengine::Context::GetLocale(v2, v4, (uint64_t)__p);
  if (v9 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  id v6 = [v3 stringWithUTF8String:v5];
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return (NSString *)v6;
}

- (NSString)loadStatus
{
  v2 = [(DEExecutionContext *)self This];
  id v3 = NSString;
  if (v2[711] < 0) {
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v2 + 86), *((void *)v2 + 87));
  }
  else {
    std::string __p = *(std::string *)(v2 + 688);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v5 = objc_msgSend(v3, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return (NSString *)v5;
}

- (id)upgrade:(id)a3
{
  id v3 = (void *)MEMORY[0x1F4188790](self);
  id v5 = v4;
  id v6 = objc_opt_new();
  uint64_t v7 = [v3 This];
  v8 = (void *)v7;
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v10 = *(void *)(v7 + 504);
  char v9 = *(std::__shared_weak_count **)(v7 + 512);
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (!v10)
  {
LABEL_11:
    id v11 = v6;
    goto LABEL_83;
  }
  memset(&v41, 0, sizeof(v41));
  memset(&v40, 0, sizeof(v40));
  std::string::basic_string[abi:ne180100]<0>(v28, "/tmp");
  std::string::basic_string[abi:ne180100]<0>(__p, "UpgradeTemplates");
  siri::dialogengine::JoinPath((uint64_t)v28, (uint64_t)__p, (uint64_t)v38);
  if (v33 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v28[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28[0].__r_.__value_.__l.__data_);
  }
  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)__p, (const siri::dialogengine::RequestInfo *)(v8 + 1));
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(v28, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  }
  else {
    v28[0] = __s;
  }
  if (SHIBYTE(v28[0].__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = v28[0].__r_.__value_.__l.__size_;
    operator delete(v28[0].__r_.__value_.__l.__data_);
    if (size) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)&v28[0].__r_.__value_.__s + 23))
  {
LABEL_15:
    uint64_t v12 = v8[63];
    std::string v13 = (std::__shared_weak_count *)v8[64];
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (*(char *)(v12 + 127) < 0) {
      std::string::__init_copy_ctor_external(&v30, *(const std::string::value_type **)(v12 + 104), *(void *)(v12 + 112));
    }
    else {
      std::string v30 = *(std::string *)(v12 + 104);
    }
    siri::dialogengine::CatIdToPath((uint64_t)&v30, &v31);
    siri::dialogengine::JoinPath((uint64_t)v38, (uint64_t)&v31, (uint64_t)v28);
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v30.__r_.__value_.__l.__data_);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    std::string::basic_string[abi:ne180100]<0>(&v30, "_params.cat.xml");
    siri::dialogengine::JoinPath((uint64_t)v28, (uint64_t)&v30, (uint64_t)&v31);
    if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v41.__r_.__value_.__l.__data_);
    }
    std::string v41 = v31;
    *((unsigned char *)&v31.__r_.__value_.__s + 23) = 0;
    v31.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v30.__r_.__value_.__l.__data_);
    }
    siri::dialogengine::Context::GetLocale((siri::dialogengine::Context *)v8, v15, (uint64_t)&v29);
    v16 = std::string::append(&v29, ".cat.xml");
    long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v30.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v30.__r_.__value_.__l.__data_ = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::JoinPath((uint64_t)v28, (uint64_t)&v30, (uint64_t)&v31);
    if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v40.__r_.__value_.__l.__data_);
    }
    std::string v40 = v31;
    *((unsigned char *)&v31.__r_.__value_.__s + 23) = 0;
    v31.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v30.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v29.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v31, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    }
    else {
      std::string v31 = __s;
    }
    siri::dialogengine::WriteFileFromString(&v41, (uint64_t)&v31);
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v31, v36.__r_.__value_.__l.__data_, v36.__r_.__value_.__l.__size_);
    }
    else {
      std::string v31 = v36;
    }
    siri::dialogengine::WriteFileFromString(&v40, (uint64_t)&v31);
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v28[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v28[0].__r_.__value_.__l.__data_);
    }
    goto LABEL_60;
  }
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(v28, v35.__r_.__value_.__l.__data_, v35.__r_.__value_.__l.__size_);
  }
  else {
    v28[0] = v35;
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  std::string v41 = v28[0];
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(v28, v37.__r_.__value_.__l.__data_, v37.__r_.__value_.__l.__size_);
  }
  else {
    v28[0] = v37;
  }
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v40.__r_.__value_.__l.__data_);
  }
  std::string v40 = v28[0];
LABEL_60:
  siri::dialogengine::Context::Context((siri::dialogengine::Context *)v28);
  if (siri::dialogengine::Context::LoadFiles((uint64_t)v28, (uint64_t)&v41, (uint64_t)&v40))
  {
    std::string::basic_string[abi:ne180100]<0>(&v31, (char *)[v5 UTF8String]);
    char v19 = siri::dialogengine::Context::UpgradeAndSave((uint64_t)v28, (uint64_t)&v40, (uint64_t)&v31);
    char v20 = v19;
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v31.__r_.__value_.__l.__data_);
      if (v20) {
        goto LABEL_63;
      }
    }
    else if (v19)
    {
LABEL_63:
      siri::dialogengine::ReadFileToString((uint64_t)&v41, &v31);
      siri::dialogengine::ReadFileToString((uint64_t)&v40, &v30);
      siri::dialogengine::DeleteDirTree((char *)v38);
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v21 = &v31;
      }
      else {
        v21 = (std::string *)v31.__r_.__value_.__r.__words[0];
      }
      long long v22 = objc_msgSend(NSString, "stringWithUTF8String:", v21, v28[0].__r_.__value_.__r.__words[0]);
      [v6 setObject:v22 forKey:@"params"];

      if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        long long v23 = &v30;
      }
      else {
        long long v23 = (std::string *)v30.__r_.__value_.__r.__words[0];
      }
      long long v24 = [NSString stringWithUTF8String:v23];
      [v6 setObject:v24 forKey:@"locale"];

      id v25 = v6;
      if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v30.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
      goto LABEL_77;
    }
    siri::dialogengine::DeleteDirTree((char *)v38);
  }
  else
  {
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Unable to load CAT content in order to perform upgrade.", v18);
    siri::dialogengine::DeleteDirTree((char *)v38);
  }
  id v26 = v6;
LABEL_77:
  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)v28);
  siri::dialogengine::RequestInfo::~RequestInfo(__p);
  if (v39 < 0) {
    operator delete(v38[0]);
  }
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v40.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
LABEL_83:

  return v6;
}

- (BOOL)needsUpgrade:(id)a3
{
  id v4 = a3;
  id v5 = [(DEExecutionContext *)self This];
  if (v5)
  {
    uint64_t v6 = v5[63];
    uint64_t v7 = (std::__shared_weak_count *)v5[64];
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v8 = 0;
    if (v4 && v6)
    {
      if (*(char *)(v6 + 175) < 0) {
        std::string::__init_copy_ctor_external(&v14, *(const std::string::value_type **)(v6 + 152), *(void *)(v6 + 160));
      }
      else {
        std::string v14 = *(std::string *)(v6 + 152);
      }
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
      memset(&v10, 0, sizeof(v10));
      siri::dialogengine::GetCatVersionForOS(&v10, (uint64_t)__p, &v13);
      v15 = &v10;
      std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
      if (v12 < 0) {
        operator delete(__p[0]);
      }
      char v8 = siri::dialogengine::VersionLessThan((unsigned __int8 *)&v14, (unsigned __int8 *)&v13);
      if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v13.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v14.__r_.__value_.__l.__data_);
      }
    }
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setTemplateDir:(id)a3
{
  id v4 = a3;
  id v5 = [(DEExecutionContext *)self This];
  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v11, (const siri::dialogengine::RequestInfo *)(v5 + 8));
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  siri::dialogengine::GetTemplateDirs((uint64_t)__p, 0, (uint64_t)&v9);
  std::vector<siri::dialogengine::UpdatableDir>::__assign_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>((uint64_t)&v12, v9, v10, 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)v9) >> 5));
  std::string v13 = &v9;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  siri::dialogengine::Context::SetRequestInfo((uint64_t)v5, (uint64_t)&v11);
  siri::dialogengine::RequestInfo::~RequestInfo(&v11);
}

- (id)getFile
{
  v2 = [(DEExecutionContext *)self This];
  id v3 = [DEFile alloc];
  id v4 = (std::__shared_weak_count *)v2[64];
  uint64_t v7 = v2[63];
  char v8 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = [(DEFile *)v3 initWithSharedPtr:&v7];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return v5;
}

- (void)setFile:(id)a3
{
  id v4 = a3;
  id v5 = [(DEExecutionContext *)self This];
  if (v4)
  {
    [v4 getSharedPtr];
    uint64_t v6 = v9;
    uint64_t v7 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    std::vector<std::pair<std::string, std::string>> v10 = 0;
  }
  char v8 = (std::__shared_weak_count *)v5[64];
  v5[63] = v6;
  v5[64] = v7;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

- (id)findVariable:(id)a3
{
  id v4 = a3;
  id v5 = [(DEExecutionContext *)self This];
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  siri::dialogengine::Context::FindVariable((uint64_t)v5, (uint64_t)__p, &v11);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v7 = [[DEVariable alloc] initWithSharedPtr:&v11];
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }

  return v7;
}

- (void)addVariable:(id)a3
{
  id v7 = a3;
  id v4 = [(DEExecutionContext *)self This];
  id v5 = (void *)[v7 getSharedPtr];
  id v6 = (std::__shared_weak_count *)v5[1];
  v8[0] = *v5;
  v8[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  siri::dialogengine::Context::AddVariable((uint64_t)v4, v8);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (BOOL)load:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(DEExecutionContext *)self This];
  id v9 = v6;
  std::string::basic_string[abi:ne180100]<0>(&v14, (char *)[v9 UTF8String]);
  id v10 = v7;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v10 UTF8String]);
  char v11 = siri::dialogengine::Context::LoadStrings((uint64_t)v8, &v14, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }

  return v11;
}

- (DEExecutionContext)initWithPtr:(shared_ptr<siri::dialogengine::Context>)a3
{
  ptr = a3.__ptr_;
  v12.receiver = self;
  v12.super_class = (Class)DEExecutionContext;
  id v4 = [(DEExecutionContext *)&v12 init];
  id v5 = v4;
  if (v4)
  {
    id v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v10 = *(void *)ptr;
    char v11 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEExecutionContext *)v4 setSharedThis:&v10];
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    [(DEExecutionContext *)v5 SharedThis];
    [(DEExecutionContext *)v5 setThis:v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEExecutionContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)DEExecutionContext;
  v2 = [(DEExecutionContext *)&v8 init];
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100IN4siri12dialogengine7ContextENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v6);
    [(DEExecutionContext *)v2 setSharedThis:&v6];
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    [(DEExecutionContext *)v2 SharedThis];
    [(DEExecutionContext *)v2 setThis:v4];
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  return v2;
}

+ (id)globalParameters
{
  siri::dialogengine::Context::Context((siri::dialogengine::Context *)v24);
  id v14 = (id)objc_opt_new();
  siri::dialogengine::Context::GetGlobalParameters((siri::dialogengine::Context *)v24, (uint64_t)&v22);
  v2 = v22;
  if (v22 != (long long *)v23)
  {
    std::string v13 = v21;
    do
    {
      std::pair<std::string const,siri::dialogengine::Parameter>::pair[abi:ne180100](&__p, v2 + 2);
      id v3 = NSString;
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v15, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
      }
      else {
        std::string v15 = v18;
      }
      if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v4 = &v15;
      }
      else {
        uint64_t v4 = (std::string *)v15.__r_.__value_.__r.__words[0];
      }
      id v5 = objc_msgSend(v3, "stringWithUTF8String:", v4, v13);
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v15.__r_.__value_.__l.__data_);
      }
      id v6 = NSString;
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v15, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
      }
      else {
        std::string v15 = v19;
      }
      if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v7 = &v15;
      }
      else {
        id v7 = (std::string *)v15.__r_.__value_.__r.__words[0];
      }
      objc_super v8 = [v6 stringWithUTF8String:v7];
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v15.__r_.__value_.__l.__data_);
      }
      [v14 setObject:v8 forKey:v5];

      v21[0] = &unk_1F21271E8;
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((void *)v21[2]);
      siri::dialogengine::LineNumberBase::~LineNumberBase(&v20);
      siri::dialogengine::ObjectProperty::~ObjectProperty(&v17);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      id v9 = (long long *)*((void *)v2 + 1);
      if (v9)
      {
        do
        {
          uint64_t v10 = v9;
          id v9 = *(long long **)v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          uint64_t v10 = (long long *)*((void *)v2 + 2);
          BOOL v11 = *(void *)v10 == (void)v2;
          v2 = v10;
        }
        while (!v11);
      }
      v2 = v10;
    }
    while (v10 != (long long *)v23);
  }
  std::__tree<std::__value_type<std::string,siri::dialogengine::Parameter>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::Parameter>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::Parameter>>>::destroy(v23[0]);
  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)v24);
  return v14;
}

@end