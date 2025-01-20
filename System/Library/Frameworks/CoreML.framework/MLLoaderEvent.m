@interface MLLoaderEvent
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)computeUnits;
- (NSNumber)containsCustomLayer;
- (NSNumber)firstPartyExecutable;
- (NSNumber)modelDimension;
- (NSNumber)modelEngineType;
- (NSNumber)modelIsEncrypted;
- (NSNumber)modelLoadError;
- (NSNumber)modelLoadTime;
- (NSNumber)modelOrigin;
- (NSNumber)modelProgramParsingError;
- (NSNumber)modelProgramValidationError;
- (NSNumber)modelType;
- (NSString)bundleIdentifier;
- (NSString)compilerVersion;
- (NSString)modelHash;
- (NSString)modelName;
- (NSString)modelVersion;
- (NSString)name;
- (NSString)nnModelNetHash;
- (NSString)nnModelShapeHash;
- (NSString)nnModelWeightsHash;
- (NSString)processName;
- (id)numberFromCString:(const char *)a3;
- (void)extractAndSetModelDetailsFromArchive:(void *)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCompilerVersion:(id)a3;
- (void)setComputeUnits:(id)a3;
- (void)setContainsCustomLayer:(id)a3;
- (void)setFirstPartyExecutable:(id)a3;
- (void)setModelDimension:(id)a3;
- (void)setModelEngineType:(id)a3;
- (void)setModelHash:(id)a3;
- (void)setModelIsEncrypted:(id)a3;
- (void)setModelLoadError:(id)a3;
- (void)setModelLoadTime:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelOrigin:(id)a3;
- (void)setModelProgramParsingError:(id)a3;
- (void)setModelProgramValidationError:(id)a3;
- (void)setModelType:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setNnModelNetHash:(id)a3;
- (void)setNnModelShapeHash:(id)a3;
- (void)setNnModelWeightsHash:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation MLLoaderEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDimension, 0);
  objc_storeStrong((id *)&self->_nnModelWeightsHash, 0);
  objc_storeStrong((id *)&self->_nnModelShapeHash, 0);
  objc_storeStrong((id *)&self->_nnModelNetHash, 0);
  objc_storeStrong((id *)&self->_modelHash, 0);
  objc_storeStrong((id *)&self->_containsCustomLayer, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_modelEngineType, 0);
  objc_storeStrong((id *)&self->_modelProgramParsingError, 0);
  objc_storeStrong((id *)&self->_modelProgramValidationError, 0);
  objc_storeStrong((id *)&self->_modelIsEncrypted, 0);
  objc_storeStrong((id *)&self->_firstPartyExecutable, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_modelLoadError, 0);
  objc_storeStrong((id *)&self->_modelOrigin, 0);
  objc_storeStrong((id *)&self->_computeUnits, 0);
  objc_storeStrong((id *)&self->_compilerVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelLoadTime, 0);

  objc_storeStrong((id *)&self->_modelType, 0);
}

- (void)extractAndSetModelDetailsFromArchive:(void *)a3
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "analytics");
  char hasNestedArchive = IArchive::hasNestedArchive(a3, &__p);
  char v6 = hasNestedArchive;
  if ((v65[7] & 0x80000000) != 0)
  {
    operator delete(__p);
    if ((v6 & 1) == 0) {
      return;
    }
  }
  else if ((hasNestedArchive & 1) == 0)
  {
    return;
  }
  std::string::basic_string[abi:ne180100]<0>(&__s1, "analytics");
  v7 = IArchive::nestedArchive(a3, (uint64_t)&__s1);
  v8 = (std::__shared_weak_count *)*((void *)v7 + 1);
  __p = *(void **)v7;
  v64 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v65, (void *)v7 + 2);
  if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s1.__r_.__value_.__l.__data_);
  }
  while (1)
  {
    (*(void (**)(void))(**((void **)__p + 4) + 16))(*((void *)__p + 4));
    if (std::istream::peek() == -1) {
      break;
    }
    v9 = (void *)MEMORY[0x19F3C29E0]();
    memset(&__s1, 0, sizeof(__s1));
    v61[0] = 0;
    v61[1] = 0;
    v60 = (uint64_t *)v61;
    operator>>((uint64_t)&__p, &__s1);
    operator>><std::string,std::string>((uint64_t)&__p, &v60);
    if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__s1.__r_.__value_.__l.__size_ != 20)
      {
        if (__s1.__r_.__value_.__l.__size_ != 25) {
          goto LABEL_107;
        }
        BOOL v10 = *(void *)__s1.__r_.__value_.__l.__data_ == 0x654E6C617275654ELL
           && *(void *)(__s1.__r_.__value_.__r.__words[0] + 8) == 0x646F4D6B726F7774;
        BOOL v11 = v10 && *(void *)(__s1.__r_.__value_.__r.__words[0] + 16) == 0x6C69617465446C65;
        if (!v11 || *(unsigned char *)(__s1.__r_.__value_.__r.__words[0] + 24) != 115) {
          goto LABEL_107;
        }
LABEL_28:
        std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"nnModelNetHash" UTF8String]);
        v13 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v60, v58);
        if (v59 < 0) {
          operator delete(v58[0]);
        }
        if (v61 != v13)
        {
          v14 = NSString;
          std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"nnModelNetHash" UTF8String]);
          v67 = v58;
          v15 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v60, v58, (_OWORD **)&v67);
          v16 = (void *)v15 + 7;
          if (*((char *)v15 + 79) < 0) {
            v16 = (void *)*v16;
          }
          v17 = [v14 stringWithUTF8String:v16];
          [(MLLoaderEvent *)self setNnModelNetHash:v17];

          if (v59 < 0) {
            operator delete(v58[0]);
          }
        }
        std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"nnModelShapeHash" UTF8String]);
        v18 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v60, v58);
        if (v59 < 0) {
          operator delete(v58[0]);
        }
        if (v61 != v18)
        {
          v19 = NSString;
          std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"nnModelShapeHash" UTF8String]);
          v67 = v58;
          v20 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v60, v58, (_OWORD **)&v67);
          v21 = (void *)v20 + 7;
          if (*((char *)v20 + 79) < 0) {
            v21 = (void *)*v21;
          }
          v22 = [v19 stringWithUTF8String:v21];
          [(MLLoaderEvent *)self setNnModelShapeHash:v22];

          if (v59 < 0) {
            operator delete(v58[0]);
          }
        }
        std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"nnModelWeightsHash" UTF8String]);
        v23 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v60, v58);
        if (v59 < 0) {
          operator delete(v58[0]);
        }
        if (v61 != v23)
        {
          v24 = NSString;
          std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"nnModelWeightsHash" UTF8String]);
          v67 = v58;
          v25 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v60, v58, (_OWORD **)&v67);
          v26 = (void *)v25 + 7;
          if (*((char *)v25 + 79) < 0) {
            v26 = (void *)*v26;
          }
          v27 = [v24 stringWithUTF8String:v26];
          [(MLLoaderEvent *)self setNnModelWeightsHash:v27];

          if (v59 < 0) {
            operator delete(v58[0]);
          }
        }
        std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"modelDimension" UTF8String]);
        v28 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v60, v58);
        if (v59 < 0) {
          operator delete(v58[0]);
        }
        if (v61 != v28)
        {
          std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"modelDimension" UTF8String]);
          v67 = v58;
          v29 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v60, v58, (_OWORD **)&v67);
          v30 = (void *)v29 + 7;
          if (*((char *)v29 + 79) < 0) {
            v30 = (void *)*v30;
          }
          v31 = [(MLLoaderEvent *)self numberFromCString:v30];
          [(MLLoaderEvent *)self setModelDimension:v31];

          if (v59 < 0) {
            operator delete(v58[0]);
          }
        }
        std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"containsCustomLayer" UTF8String]);
        v32 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v60, v58);
        if (v59 < 0) {
          operator delete(v58[0]);
        }
        if (v61 != v32)
        {
          std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"containsCustomLayer" UTF8String]);
          v67 = v58;
          v33 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v60, v58, (_OWORD **)&v67);
          v34 = (void *)v33 + 7;
          if (*((char *)v33 + 79) < 0) {
            v34 = (void *)*v34;
          }
          v35 = [(MLLoaderEvent *)self numberFromCString:v34];
          [(MLLoaderEvent *)self setContainsCustomLayer:v35];
LABEL_105:

          if (v59 < 0) {
            operator delete(v58[0]);
          }
          goto LABEL_107;
        }
        goto LABEL_107;
      }
      if (*(void *)__s1.__r_.__value_.__l.__data_ == 0x6369666963657053
        && *(void *)(__s1.__r_.__value_.__r.__words[0] + 8) == 0x7465446E6F697461
        && *(_DWORD *)(__s1.__r_.__value_.__r.__words[0] + 16) == 1936484705)
      {
LABEL_92:
        std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"modelName" UTF8String]);
        v49 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v60, v58);
        if (v59 < 0) {
          operator delete(v58[0]);
        }
        if (v61 != v49)
        {
          v50 = NSString;
          std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"modelName" UTF8String]);
          v67 = v58;
          v51 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v60, v58, (_OWORD **)&v67);
          v52 = (void *)v51 + 7;
          if (*((char *)v51 + 79) < 0) {
            v52 = (void *)*v52;
          }
          v53 = [v50 stringWithUTF8String:v52];
          [(MLLoaderEvent *)self setModelName:v53];

          if (v59 < 0) {
            operator delete(v58[0]);
          }
        }
        std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"modelHash" UTF8String]);
        v54 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v60, v58);
        if (v59 < 0) {
          operator delete(v58[0]);
        }
        if (v61 != v54)
        {
          v55 = NSString;
          std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"modelHash" UTF8String]);
          v67 = v58;
          v56 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v60, v58, (_OWORD **)&v67);
          v57 = (void *)v56 + 7;
          if (*((char *)v56 + 79) < 0) {
            v57 = (void *)*v57;
          }
          v35 = [v55 stringWithUTF8String:v57];
          [(MLLoaderEvent *)self setModelHash:v35];
          goto LABEL_105;
        }
        goto LABEL_107;
      }
      p_s1 = (std::string *)__s1.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (HIBYTE(__s1.__r_.__value_.__r.__words[2]) != 20)
      {
        if (HIBYTE(__s1.__r_.__value_.__r.__words[2]) != 25
          || memcmp(&__s1, "NeuralNetworkModelDetails", HIBYTE(__s1.__r_.__value_.__r.__words[2])))
        {
          goto LABEL_107;
        }
        goto LABEL_28;
      }
      if (__s1.__r_.__value_.__r.__words[0] == 0x6369666963657053
        && __s1.__r_.__value_.__l.__size_ == 0x7465446E6F697461
        && LODWORD(__s1.__r_.__value_.__r.__words[2]) == 1936484705)
      {
        goto LABEL_92;
      }
      p_s1 = &__s1;
    }
    std::string::size_type v41 = p_s1->__r_.__value_.__r.__words[0];
    std::string::size_type size = p_s1->__r_.__value_.__l.__size_;
    uint64_t v43 = LODWORD(p_s1->__r_.__value_.__r.__words[2]);
    if (v41 == 0x656E696C65706950 && size == 0x7465446C65646F4DLL && v43 == 1936484705)
    {
      std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"modelDimension" UTF8String]);
      v46 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v60, v58);
      if (v59 < 0) {
        operator delete(v58[0]);
      }
      if (v61 != v46)
      {
        std::string::basic_string[abi:ne180100]<0>(v58, (char *)[@"modelDimension" UTF8String]);
        v67 = v58;
        v47 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v60, v58, (_OWORD **)&v67);
        v48 = (void *)v47 + 7;
        if (*((char *)v47 + 79) < 0) {
          v48 = (void *)*v48;
        }
        v35 = [(MLLoaderEvent *)self numberFromCString:v48];
        [(MLLoaderEvent *)self setModelDimension:v35];
        goto LABEL_105;
      }
    }
LABEL_107:
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v61[0]);
    if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__s1.__r_.__value_.__l.__data_);
    }
  }
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v66);
  if (v64) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v64);
  }
}

- (id)numberFromCString:(const char *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a3);
  uint64_t v3 = std::stoi(&__p, 0, 10);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v4 = [NSNumber numberWithInt:v3];

  return v4;
}

- (void)setModelName:(id)a3
{
}

- (void)setModelHash:(id)a3
{
}

- (void)setModelDimension:(id)a3
{
}

- (void)setNnModelWeightsHash:(id)a3
{
}

- (void)setNnModelShapeHash:(id)a3
{
}

- (void)setNnModelNetHash:(id)a3
{
}

- (void)setContainsCustomLayer:(id)a3
{
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(MLLoaderEvent *)self modelOrigin];
  [v3 setObject:v4 forKeyedSubscript:@"modelOrigin"];

  v5 = [(MLLoaderEvent *)self modelType];
  [v3 setObject:v5 forKeyedSubscript:@"modelType"];

  char v6 = [(MLLoaderEvent *)self modelVersion];
  [v3 setObject:v6 forKeyedSubscript:@"modelVersion"];

  uint64_t v7 = [(MLLoaderEvent *)self compilerVersion];
  [v3 setObject:v7 forKeyedSubscript:@"compilerVersion"];

  v8 = [(MLLoaderEvent *)self computeUnits];
  [v3 setObject:v8 forKeyedSubscript:@"computeUnits"];

  v9 = [(MLLoaderEvent *)self modelLoadTime];
  [v3 setObject:v9 forKeyedSubscript:@"modelLoadTime"];

  BOOL v10 = [(MLLoaderEvent *)self modelName];
  [v3 setObject:v10 forKeyedSubscript:@"modelName"];

  BOOL v11 = [(MLLoaderEvent *)self modelHash];
  [v3 setObject:v11 forKeyedSubscript:@"modelHash"];

  v12 = [(MLLoaderEvent *)self modelDimension];
  [v3 setObject:v12 forKeyedSubscript:@"modelDimension"];

  v13 = [(MLLoaderEvent *)self nnModelNetHash];
  [v3 setObject:v13 forKeyedSubscript:@"nnModelNetHash"];

  v14 = [(MLLoaderEvent *)self nnModelShapeHash];
  [v3 setObject:v14 forKeyedSubscript:@"nnModelShapeHash"];

  v15 = [(MLLoaderEvent *)self nnModelWeightsHash];
  [v3 setObject:v15 forKeyedSubscript:@"nnModelWeightsHash"];

  v16 = [(MLLoaderEvent *)self modelLoadError];
  [v3 setObject:v16 forKeyedSubscript:@"modelLoadError"];

  v17 = [(MLLoaderEvent *)self bundleIdentifier];
  [v3 setObject:v17 forKeyedSubscript:@"bundleIdentifier"];

  v18 = [(MLLoaderEvent *)self firstPartyExecutable];
  [v3 setObject:v18 forKeyedSubscript:@"firstPartyExecutable"];

  v19 = [(MLLoaderEvent *)self modelIsEncrypted];
  [v3 setObject:v19 forKeyedSubscript:@"modelIsEncrypted"];

  v20 = [(MLLoaderEvent *)self modelProgramValidationError];
  [v3 setObject:v20 forKeyedSubscript:@"modelProgramValidationError"];

  v21 = [(MLLoaderEvent *)self modelProgramParsingError];
  [v3 setObject:v21 forKeyedSubscript:@"modelProgramParsingError"];

  v22 = [(MLLoaderEvent *)self modelEngineType];
  [v3 setObject:v22 forKeyedSubscript:@"modelEngineType"];

  v23 = [(MLLoaderEvent *)self processName];
  [v3 setObject:v23 forKeyedSubscript:@"processName"];

  v24 = [(MLLoaderEvent *)self containsCustomLayer];
  [v3 setObject:v24 forKeyedSubscript:@"containsCustomLayer"];

  return (NSDictionary *)v3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setFirstPartyExecutable:(id)a3
{
}

- (NSNumber)modelType
{
  return self->_modelType;
}

- (NSNumber)firstPartyExecutable
{
  return self->_firstPartyExecutable;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setProcessName:(id)a3
{
}

- (void)setModelOrigin:(id)a3
{
}

- (void)setModelLoadTime:(id)a3
{
}

- (void)setModelEngineType:(id)a3
{
}

- (void)setComputeUnits:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)nnModelWeightsHash
{
  return self->_nnModelWeightsHash;
}

- (NSString)nnModelShapeHash
{
  return self->_nnModelShapeHash;
}

- (NSString)nnModelNetHash
{
  return self->_nnModelNetHash;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSNumber)modelProgramValidationError
{
  return self->_modelProgramValidationError;
}

- (NSNumber)modelProgramParsingError
{
  return self->_modelProgramParsingError;
}

- (NSNumber)modelOrigin
{
  return self->_modelOrigin;
}

- (NSNumber)modelLoadTime
{
  return self->_modelLoadTime;
}

- (NSNumber)modelLoadError
{
  return self->_modelLoadError;
}

- (NSNumber)modelIsEncrypted
{
  return self->_modelIsEncrypted;
}

- (NSString)modelHash
{
  return self->_modelHash;
}

- (NSNumber)modelEngineType
{
  return self->_modelEngineType;
}

- (NSNumber)modelDimension
{
  return self->_modelDimension;
}

- (NSNumber)containsCustomLayer
{
  return self->_containsCustomLayer;
}

- (NSNumber)computeUnits
{
  return self->_computeUnits;
}

- (NSString)compilerVersion
{
  return self->_compilerVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (void)setModelType:(id)a3
{
}

- (void)setCompilerVersion:(id)a3
{
}

- (void)setModelIsEncrypted:(id)a3
{
}

- (void)setModelLoadError:(id)a3
{
}

- (NSString)name
{
  v2 = @"com.apple.CoreML.MLLoader";
  return (NSString *)@"com.apple.CoreML.MLLoader";
}

- (void)setModelProgramParsingError:(id)a3
{
}

- (void)setModelProgramValidationError:(id)a3
{
}

@end