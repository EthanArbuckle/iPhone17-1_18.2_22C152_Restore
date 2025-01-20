@interface DEInspector
+ (id)getParamsForCat:(id)a3 templateDir:(id)a4 includeComputed:(BOOL)a5 includeSettings:(BOOL)a6 includeValueFromCat:(BOOL)a7;
+ (id)getParamsForPattern:(id)a3 templateDir:(id)a4 includeComputed:(BOOL)a5 includeSettings:(BOOL)a6 includeValueFromCat:(BOOL)a7;
@end

@implementation DEInspector

+ (id)getParamsForCat:(id)a3 templateDir:(id)a4 includeComputed:(BOOL)a5 includeSettings:(BOOL)a6 includeValueFromCat:(BOOL)a7
{
  MEMORY[0x1F4188790](a1);
  v8 = v7;
  id v10 = v9;
  id v11 = v8;
  std::string::basic_string[abi:ne180100]<0>(v40, (char *)[v11 UTF8String]);
  id v12 = v10;
  std::string::basic_string[abi:ne180100]<0>(v38, (char *)[v12 UTF8String]);
  v13 = objc_opt_new();
  v36[0] = 0;
  v36[1] = 0;
  v35 = (uint64_t *)v36;
  char v37 = 0;
  siri::dialogengine::GetTemplateDirs((uint64_t)v40, 1, (uint64_t)&v29);
  siri::dialogengine::Context::Context((siri::dialogengine::Context *)v33, (std::string **)&v29);
  v32.__r_.__value_.__r.__words[0] = (std::string::size_type)&v29;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v29, (const siri::dialogengine::RequestInfo *)&v34);
  memset(&v32, 0, sizeof(v32));
  std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v32, (uint64_t)v30, v31, 0xAAAAAAAAAAAAAAABLL * ((v31 - (uint64_t)v30) >> 5));
  siri::dialogengine::GetParamsForDialogCat((uint64_t *)&v32, (uint64_t)v38, (uint64_t)&v35, 0);
  v42 = &v32;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
  siri::dialogengine::RequestInfo::~RequestInfo((void **)&v29);
  [v13 setCatId:v12];
  v14 = objc_opt_new();
  siri::dialogengine::ParameterCollection::GetUniqueParameters(&v35, (siri::dialogengine::Context *)v33, (uint64_t **)&v29);
  v15 = v29;
  if (v29 != &v30)
  {
    do
    {
      v16 = NSString;
      uint64_t v17 = v15[7];
      if (*(char *)(v17 + 31) < 0)
      {
        std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)(v17 + 8), *(void *)(v17 + 16));
      }
      else
      {
        long long v18 = *(_OWORD *)(v17 + 8);
        v32.__r_.__value_.__r.__words[2] = *(void *)(v17 + 24);
        *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v18;
      }
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v19 = &v32;
      }
      else {
        v19 = (std::string *)v32.__r_.__value_.__r.__words[0];
      }
      v20 = [v16 stringWithUTF8String:v19];
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v32.__r_.__value_.__l.__data_);
      }
      v21 = NSString;
      uint64_t v22 = v15[7];
      if (*(char *)(v22 + 55) < 0) {
        std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)(v22 + 32), *(void *)(v22 + 40));
      }
      else {
        std::string v32 = *(std::string *)(v22 + 32);
      }
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v23 = &v32;
      }
      else {
        v23 = (std::string *)v32.__r_.__value_.__r.__words[0];
      }
      v24 = [v21 stringWithUTF8String:v23];
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v32.__r_.__value_.__l.__data_);
      }
      [v14 setObject:v24 forKeyedSubscript:v20];

      v25 = (void *)v15[1];
      if (v25)
      {
        do
        {
          v26 = (void **)v25;
          v25 = (void *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (void **)v15[2];
          BOOL v27 = *v26 == v15;
          v15 = v26;
        }
        while (!v27);
      }
      v15 = v26;
    }
    while (v26 != &v30);
  }
  [v13 setParams:v14];
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v30);

  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)v33);
  std::__tree<std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>>>::destroy(v36[0]);
  if (v39 < 0) {
    operator delete(v38[0]);
  }
  if (v41 < 0) {
    operator delete(v40[0]);
  }

  return v13;
}

+ (id)getParamsForPattern:(id)a3 templateDir:(id)a4 includeComputed:(BOOL)a5 includeSettings:(BOOL)a6 includeValueFromCat:(BOOL)a7
{
  MEMORY[0x1F4188790](a1);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  int v12 = v11;
  v14 = v13;
  id v16 = v15;
  id v17 = v14;
  std::string::basic_string[abi:ne180100]<0>(v50, (char *)[v17 UTF8String]);
  id v18 = v16;
  std::string::basic_string[abi:ne180100]<0>(v48, (char *)[v18 UTF8String]);
  v19 = objc_opt_new();
  [v19 setPatternId:v18];
  v20 = objc_opt_new();
  [v19 setParams:v20];
  siri::dialogengine::GetTemplateDirs((uint64_t)v50, 1, (uint64_t)&v37);
  siri::dialogengine::Context::Context((siri::dialogengine::Context *)v46, (std::string **)&v37);
  char v41 = (uint64_t *)&v37;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v41);
  siri::dialogengine::PatternFile::LoadFromId((uint64_t)v46, (uint64_t)v48, 0, &v44);
  uint64_t v21 = v44;
  if (v44)
  {
    v42[1] = 0;
    v42[0] = 0;
    char v41 = (uint64_t *)v42;
    char v43 = 0;
    siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v37, (const siri::dialogengine::RequestInfo *)&v47);
    memset(&v40, 0, sizeof(v40));
    std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v40, (uint64_t)v38, v39, 0xAAAAAAAAAAAAAAABLL * ((v39 - (uint64_t)v38) >> 5));
    if (v12) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 0;
    }
    siri::dialogengine::GetParamsForPattern(v21, (std::string **)&v40, v22, v10, v8, (uint64_t)&v41);
    v52 = &v40;
    std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
    siri::dialogengine::RequestInfo::~RequestInfo((void **)&v37);
    siri::dialogengine::ParameterCollection::GetUniqueParameters(&v41, (siri::dialogengine::Context *)v46, (uint64_t **)&v37);
    v23 = v37;
    if (v37 != &v38)
    {
      do
      {
        v24 = NSString;
        uint64_t v25 = v23[7];
        if (*(char *)(v25 + 31) < 0)
        {
          std::string::__init_copy_ctor_external(&v40, *(const std::string::value_type **)(v25 + 8), *(void *)(v25 + 16));
        }
        else
        {
          long long v26 = *(_OWORD *)(v25 + 8);
          v40.__r_.__value_.__r.__words[2] = *(void *)(v25 + 24);
          *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v26;
        }
        if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          BOOL v27 = &v40;
        }
        else {
          BOOL v27 = (std::string *)v40.__r_.__value_.__r.__words[0];
        }
        v28 = [v24 stringWithUTF8String:v27];
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v40.__r_.__value_.__l.__data_);
        }
        v29 = NSString;
        uint64_t v30 = v23[7];
        if (*(char *)(v30 + 55) < 0) {
          std::string::__init_copy_ctor_external(&v40, *(const std::string::value_type **)(v30 + 32), *(void *)(v30 + 40));
        }
        else {
          std::string v40 = *(std::string *)(v30 + 32);
        }
        if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v31 = &v40;
        }
        else {
          uint64_t v31 = (std::string *)v40.__r_.__value_.__r.__words[0];
        }
        std::string v32 = [v29 stringWithUTF8String:v31];
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v40.__r_.__value_.__l.__data_);
        }
        [v20 setObject:v32 forKeyedSubscript:v28];

        v33 = (void *)v23[1];
        if (v33)
        {
          do
          {
            uint64_t v34 = (void **)v33;
            v33 = (void *)*v33;
          }
          while (v33);
        }
        else
        {
          do
          {
            uint64_t v34 = (void **)v23[2];
            BOOL v35 = *v34 == v23;
            v23 = v34;
          }
          while (!v35);
        }
        v23 = v34;
      }
      while (v34 != &v38);
    }
    std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v38);
    std::__tree<std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,std::unordered_set<std::shared_ptr<siri::dialogengine::Parameter>,siri::dialogengine::ParameterCollection::ParameterHash,siri::dialogengine::ParameterCollection::ParameterEqual,std::allocator<std::shared_ptr<siri::dialogengine::Parameter>>>>>>::destroy(v42[0]);
  }
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  }
  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)v46);

  if (v49 < 0) {
    operator delete(v48[0]);
  }
  if (v51 < 0) {
    operator delete(v50[0]);
  }

  return v19;
}

@end