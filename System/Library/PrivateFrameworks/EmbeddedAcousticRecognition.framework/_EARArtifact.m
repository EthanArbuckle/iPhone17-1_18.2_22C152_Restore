@interface _EARArtifact
+ (BOOL)isValid:(id)a3;
- (BOOL)hasContent:(id)a3;
- (BOOL)hasInfo:(id)a3;
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)isMinimalistic;
- (BOOL)supportsContent:(id)a3;
- (BOOL)supportsInfo:(id)a3;
- (BOOL)write:(id)a3;
- (_EARArtifact)initWithAcceptedContent:(id)a3 acceptedInfo:(id)a4 dependent:(id)a5;
- (id).cxx_construct;
- (id)getContent:(id)a3;
- (id)getInfo:(id)a3;
- (id)getLocale;
- (id)getVersion;
- (void)getVersion;
- (void)minimize;
@end

@implementation _EARArtifact

- (_EARArtifact)initWithAcceptedContent:(id)a3 acceptedInfo:(id)a4 dependent:(id)a5
{
  v48[10] = *(void **)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)_EARArtifact;
  v11 = [(_EARArtifact *)&v34 init];
  if (v11)
  {
    id v12 = v8;
    v33[0] = 0;
    v33[1] = 0;
    v32 = v33;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:&v42 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(id *)(*((void *)&v38 + 1) + 8 * i);
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "ear_toString");
          }
          else
          {
            __p = 0;
            v36 = 0;
            uint64_t v37 = 0;
          }

          std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&v32, (const void **)&__p, (uint64_t)&__p);
          if (SHIBYTE(v37) < 0) {
            operator delete(__p);
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:&v42 count:16];
      }
      while (v14);
    }

    id v19 = v9;
    v31[0] = 0;
    v31[1] = 0;
    v30 = v31;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:&v42 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = *(id *)(*((void *)&v38 + 1) + 8 * j);
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "ear_toString");
          }
          else
          {
            __p = 0;
            v36 = 0;
            uint64_t v37 = 0;
          }

          std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&v30, (const void **)&__p, (uint64_t)&__p);
          if (SHIBYTE(v37) < 0) {
            operator delete(__p);
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:&v42 count:16];
      }
      while (v21);
    }

    id v26 = v10;
    *(void *)&long long v42 = 0;
    *((void *)&v42 + 1) = &v42;
    uint64_t v43 = 0x4812000000;
    v44 = __Block_byref_object_copy__10;
    v45 = __Block_byref_object_dispose__10;
    v46 = &unk_1B27252DB;
    v48[0] = 0;
    v48[1] = 0;
    v47 = v48;
    *(void *)&long long v38 = MEMORY[0x1E4F143A8];
    *((void *)&v38 + 1) = 3221225472;
    *(void *)&long long v39 = ___ZN10EARHelpers15DictionaryToMapINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_6vectorIS7_NS5_IS7_EEEEZ63___EARArtifact_initWithAcceptedContent_acceptedInfo_dependent__E3__2Z63___EARArtifact_initWithAcceptedContent_acceptedInfo_dependent__E3__3EENS1_3mapIT_T0_NS1_4lessISE_EENS5_INS1_4pairIKSE_SF_EEEEEEP12NSDictionaryT1_T2__block_invoke;
    *((void *)&v39 + 1) = &unk_1E5FFE238;
    *(void *)&long long v40 = &v42;
    [v26 enumerateKeysAndObjectsUsingBlock:&v38];
    std::map<std::string,std::vector<std::string>>::map[abi:ne180100]((uint64_t *)&__p, (const void ***)(*((void *)&v42 + 1) + 48));
    _Block_object_dispose(&v42, 8);
    std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::destroy((uint64_t)&v47, v48[0]);

    std::allocate_shared[abi:ne180100]<quasar::artifact::Artifact,std::allocator<quasar::artifact::Artifact>,std::set<std::string> &,std::set<std::string> &,std::map<std::string,std::vector<std::string>> &,void>(&v42);
    long long v27 = v42;
    long long v42 = 0uLL;
    v28 = (std::__shared_weak_count *)*((void *)v11 + 2);
    *(_OWORD *)(v11 + 8) = v27;
    if (v28)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
      if (*((void *)&v42 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v42 + 1));
      }
    }
    std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::destroy((uint64_t)&__p, v36);
    std::__tree<std::string>::destroy((uint64_t)&v30, v31[0]);
    std::__tree<std::string>::destroy((uint64_t)&v32, v33[0]);
  }

  return (_EARArtifact *)v11;
}

- (id)getVersion
{
  v2 = NSString;
  Version = quasar::artifact::Artifact::getVersion((quasar::artifact::Artifact *)self->_artifact.__ptr_);
  if (Version[23] >= 0) {
    v4 = Version;
  }
  else {
    v4 = *(char **)Version;
  }
  v5 = [v2 stringWithUTF8String:v4];
  return v5;
}

- (id)getLocale
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  quasar::artifact::Artifact::getLocale((quasar::artifact::Artifact *)self->_artifact.__ptr_, &v10);
  std::string::basic_string[abi:ne180100]<0>(v6, "_");
  quasar::Locale::toInternalShortIdentifier((uint64_t)&v10, (uint64_t)v6);
  if (v9 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  v4 = [v2 stringWithUTF8String:p_p];
  if (v9 < 0) {
    operator delete(__p);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  return v4;
}

- (BOOL)supportsInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v10 = 0;
  }
  BOOL v7 = quasar::artifact::Artifact::supportsInfo((uint64_t)ptr, (const void **)__p);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }

  return v7;
}

- (BOOL)hasInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v10 = 0;
  }
  BOOL hasInfo = quasar::artifact::Artifact::hasInfo((uint64_t)ptr, (const void **)__p);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }

  return hasInfo;
}

- (id)getInfo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  v6 = NSString;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v11[0] = 0;
    v11[1] = 0;
    uint64_t v12 = 0;
  }
  quasar::artifact::Artifact::getInfo((uint64_t)ptr, (uint64_t)v11, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  char v9 = [v6 stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12) < 0) {
    operator delete(v11[0]);
  }

  return v9;
}

- (BOOL)supportsContent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v10 = 0;
  }
  BOOL v7 = quasar::artifact::Artifact::supportsContent((uint64_t)ptr, (const void **)__p);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }

  return v7;
}

- (BOOL)hasContent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v10 = 0;
  }
  BOOL hasContent = quasar::artifact::Artifact::hasContent((uint64_t)ptr, (const void **)__p);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }

  return hasContent;
}

- (id)getContent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  v6 = NSString;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v11[0] = 0;
    v11[1] = 0;
    uint64_t v12 = 0;
  }
  quasar::artifact::Artifact::getContentAsString((uint64_t)ptr, (const void **)v11, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  char v9 = [v6 stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12) < 0) {
    operator delete(v11[0]);
  }

  return v9;
}

- (BOOL)isMinimalistic
{
  return (*(uint64_t (**)(void))(*(void *)self->_artifact.__ptr_ + 16))();
}

- (void)minimize
{
}

- (BOOL)write:(id)a3
{
  id v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    std::string __p = 0;
    char v10 = 0;
  }
  char v7 = quasar::artifact::Artifact::write((quasar::artifact::Artifact *)ptr);
  if (v10 < 0) {
    operator delete(__p);
  }

  return v7;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = (void **)a3;
  LOBYTE(self) = quasar::artifact::Artifact::operator==(self->_artifact.__ptr_, v4[1]);

  return (char)self;
}

+ (BOOL)isValid:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    std::string __p = 0;
    char v8 = 0;
  }
  char isValid = quasar::artifact::Artifact::isValid();
  if (v8 < 0) {
    operator delete(__p);
  }

  return isValid;
}

- (void).cxx_destruct
{
  cntrl = self->_artifact.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)getVersion
{
  if (a1)
  {
    uint64_t v4 = OUTLINED_FUNCTION_3_0(a1, a2);
    v5(v4);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_0_1(&dword_1B1A86000, v6, v7, "Internal C++ exception: %s", v8, v9, v10, v11, v12);
  }

  __cxa_end_catch();
}

@end