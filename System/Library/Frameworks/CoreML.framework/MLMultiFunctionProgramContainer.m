@interface MLMultiFunctionProgramContainer
+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (MLMultiFunctionProgramContainer)initWithContainer:(id)a3 program:(const void *)a4 error:(id *)a5;
- (NSDictionary)functionNameToInputLayersNames;
- (NSDictionary)functionNameToOutputLayersNames;
- (NSString)activeFunction;
- (id).cxx_construct;
- (void)setActiveFunction:(id)a3;
- (void)setFunctionNameToInputLayersNames:(id)a3;
- (void)setFunctionNameToOutputLayersNames:(id)a3;
@end

@implementation MLMultiFunctionProgramContainer

- (id).cxx_construct
{
  *((void *)self + 41) = 0;
  *((void *)self + 40) = 0;
  *((void *)self + 39) = (char *)self + 320;
  return self;
}

- (NSString)activeFunction
{
  return self->_activeFunction;
}

+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___MLMultiFunctionProgramContainer;
  v10 = objc_msgSendSuper2(&v15, sel_containerFromCompiledArchive_modelVersionInfo_compilerVersionInfo_configuration_error_, a3, a4, a5, a6);
  if (v10)
  {
    [a1 loadProgramFromCompiledArchive:a3 error:a7];
    if (v13) {
      v11 = (void *)[objc_alloc((Class)a1) initWithContainer:v10 program:v13 error:a7];
    }
    else {
      v11 = 0;
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setActiveFunction:(id)a3
{
  id v5 = a3;
  p_activeFunction = &self->_activeFunction;
  objc_storeStrong((id *)&self->_activeFunction, a3);
  v7 = [(MLMultiFunctionProgramContainer *)self functionNameToOutputLayersNames];
  v8 = [v7 objectForKeyedSubscript:self->_activeFunction];
  [(MLNeuralNetworkContainer *)self setOutputLayerNames:v8];

  v9 = [(MLMultiFunctionProgramContainer *)self functionNameToInputLayersNames];
  v10 = [v9 objectForKeyedSubscript:self->_activeFunction];
  [(MLNeuralNetworkContainer *)self setInputLayerNames:v10];

  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)self->_activeFunction UTF8String]);
  p_functionNameToInputShapes = (uint64_t **)&self->functionNameToInputShapes;
  v20 = __p;
  v12 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.widths != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)((char *)v12 + 56)) {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.widths, *((void **)v12 + 7), (void *)v12 + 8);
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)*p_activeFunction UTF8String]);
  v20 = __p;
  uint64_t v13 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.heights != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)(v13 + 5)) {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.heights, *((void **)v13 + 10), (void *)v13 + 11);
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)*p_activeFunction UTF8String]);
  v20 = __p;
  v14 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.ks != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)((char *)v14 + 104)) {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.ks, *((void **)v14 + 13), (void *)v14 + 14);
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)*p_activeFunction UTF8String]);
  v20 = __p;
  objc_super v15 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.batches != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)(v15 + 8)) {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.batches, *((void **)v15 + 16), (void *)v15 + 17);
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)*p_activeFunction UTF8String]);
  v20 = __p;
  v16 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.sequences != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)((char *)v16 + 152)) {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.sequences, *((void **)v16 + 19), (void *)v16 + 20);
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)*p_activeFunction UTF8String]);
  v20 = __p;
  v17 = std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_functionNameToInputShapes, __p, (_OWORD **)&v20);
  if (&self->super.super.ranks != (map<std::string, int, std::less<std::string>, std::allocator<std::pair<const std::string, int>>> *)(v17 + 11)) {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)&self->super.super.ranks, *((void **)v17 + 22), (void *)v17 + 23);
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }
}

- (NSDictionary)functionNameToOutputLayersNames
{
  return self->_functionNameToOutputLayersNames;
}

- (NSDictionary)functionNameToInputLayersNames
{
  return self->_functionNameToInputLayersNames;
}

- (MLMultiFunctionProgramContainer)initWithContainer:(id)a3 program:(const void *)a4 error:(id *)a5
{
  v6 = (uint64_t **)a3;
  v80.receiver = self;
  v80.super_class = (Class)MLMultiFunctionProgramContainer;
  v7 = [(MLMultiFunctionProgramContainer *)&v80 init];
  if (!v7) {
    goto LABEL_42;
  }
  uint64_t v8 = (*(uint64_t (**)(const void *))(*(void *)a4 + 72))(a4);
  std::unordered_map<std::string,std::shared_ptr<MIL::IRFunction>>::unordered_map((uint64_t)v78, v8);
  v57 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  v54 = v7;
  v56 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  v9 = v79;
  if (!v79)
  {
LABEL_41:
    [v6 setFunctionNameToOutputLayersNames:v57];
    [v6 setFunctionNameToInputLayersNames:v56];

    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>>>::~__hash_table((uint64_t)v78);
    v7 = v54;
LABEL_42:
    v52 = v6;
    goto LABEL_43;
  }
  while (1)
  {
    v10 = v9 + 2;
    uint64_t Function = MIL::IRProgram::GetFunction();
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)Function + 40))(Function);
    uint64_t v13 = (long long **)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 88))(v12);
    memset(&v77, 0, sizeof(v77));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v77, *v13, v13[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v13[1] - (char *)*v13) >> 3));
    v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    uint64_t v15 = MIL::IRProgram::GetFunction();
    v16 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v15 + 128))(v15);
    v17 = v16 + 1;
    v18 = (void *)*v16;
    if ((void *)*v16 != v16 + 1)
    {
      do
      {
        char v19 = v18 + 4;
        if (*((char *)v18 + 55) < 0) {
          char v19 = (void *)*v19;
        }
        v20 = [NSString stringWithUTF8String:v19];
        [v14 addObject:v20];

        v21 = (void *)v18[1];
        if (v21)
        {
          do
          {
            v22 = v21;
            v21 = (void *)*v21;
          }
          while (v21);
        }
        else
        {
          do
          {
            v22 = (void *)v18[2];
            BOOL v23 = *v22 == (void)v18;
            v18 = v22;
          }
          while (!v23);
        }
        v18 = v22;
      }
      while (v22 != v17);
    }
    uint64_t v24 = (uint64_t)(v9 + 2);
    if (*((char *)v9 + 39) < 0) {
      uint64_t v24 = *v10;
    }
    v25 = [NSString stringWithUTF8String:v24];
    [v56 setObject:v14 forKeyedSubscript:v25];

    v26 = CoreML::stringArrayToObjC((uint64_t **)&v77);
    uint64_t v27 = (uint64_t)(v9 + 2);
    if (*((char *)v9 + 39) < 0) {
      uint64_t v27 = *v10;
    }
    v28 = [NSString stringWithUTF8String:v27];
    [v57 setObject:v26 forKeyedSubscript:v28];

    v60 = 0;
    uint64_t v61 = 0;
    v63 = 0;
    uint64_t v64 = 0;
    v59 = (std::string *)&v60;
    v62 = &v63;
    v66 = 0;
    uint64_t v67 = 0;
    v69 = 0;
    uint64_t v70 = 0;
    v65 = &v66;
    v68 = &v69;
    v72 = 0;
    uint64_t v73 = 0;
    v75 = 0;
    uint64_t v76 = 0;
    v71 = &v72;
    v74 = &v75;
    if (!+[MLProgramContainer populateInputNameToShapeMap:&v59 fromContainer:v6 forFunction:v9 + 2 program:a4 withValidation:0 error:a5])break; {
    v29 = (void **)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)(v6 + 39), &v83, v9 + 2);
    }
    v30 = (char *)*v29;
    if (!*v29)
    {
      v31 = (uint64_t **)v29;
      v30 = (char *)operator new(0xC8uLL);
      v81[0] = v30;
      v81[1] = v6 + 40;
      char v82 = 0;
      v32 = (std::string *)(v30 + 32);
      if (*((char *)v9 + 39) < 0)
      {
        std::string::__init_copy_ctor_external(v32, (const std::string::value_type *)v9[2], v9[3]);
      }
      else
      {
        long long v33 = *(_OWORD *)v10;
        *((void *)v30 + 6) = v9[4];
        *(_OWORD *)&v32->__r_.__value_.__l.__data_ = v33;
      }
      *((void *)v30 + 8) = 0;
      *((void *)v30 + 7) = v30 + 64;
      *((void *)v30 + 11) = 0;
      *((void *)v30 + 9) = 0;
      *((void *)v30 + 10) = v30 + 88;
      *((void *)v30 + 14) = 0;
      *((void *)v30 + 12) = 0;
      *((void *)v30 + 13) = v30 + 112;
      *((void *)v30 + 17) = 0;
      *((void *)v30 + 15) = 0;
      *((void *)v30 + 16) = v30 + 136;
      *((void *)v30 + 20) = 0;
      *((void *)v30 + 18) = 0;
      *((void *)v30 + 19) = v30 + 160;
      *((void *)v30 + 24) = 0;
      *((void *)v30 + 23) = 0;
      *((void *)v30 + 21) = 0;
      *((void *)v30 + 22) = v30 + 184;
      char v82 = 1;
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(v6 + 39, v83, v31, (uint64_t *)v30);
      v81[0] = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::string,InputNameToShapes>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,InputNameToShapes>,void *>>>>::reset[abi:ne180100]((uint64_t)v81);
    }
    v34 = v30 + 64;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 8));
    v35 = v60;
    *((void *)v30 + 7) = v59;
    *((void *)v30 + 8) = v35;
    uint64_t v36 = v61;
    *((void *)v30 + 9) = v61;
    if (v36)
    {
      *((void *)v35 + 2) = v34;
      v59 = (std::string *)&v60;
      v60 = 0;
      uint64_t v61 = 0;
    }
    else
    {
      *((void *)v30 + 7) = v34;
    }
    v37 = v30 + 88;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 11));
    v38 = v63;
    *((void *)v30 + 10) = v62;
    *((void *)v30 + 11) = v38;
    uint64_t v39 = v64;
    *((void *)v30 + 12) = v64;
    if (v39)
    {
      *((void *)v38 + 2) = v37;
      v62 = &v63;
      v63 = 0;
      uint64_t v64 = 0;
    }
    else
    {
      *((void *)v30 + 10) = v37;
    }
    v40 = v30 + 112;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 14));
    v41 = v66;
    *((void *)v30 + 13) = v65;
    *((void *)v30 + 14) = v41;
    uint64_t v42 = v67;
    *((void *)v30 + 15) = v67;
    if (v42)
    {
      *((void *)v41 + 2) = v40;
      v65 = &v66;
      v66 = 0;
      uint64_t v67 = 0;
    }
    else
    {
      *((void *)v30 + 13) = v40;
    }
    v43 = v30 + 136;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 17));
    v44 = v69;
    *((void *)v30 + 16) = v68;
    *((void *)v30 + 17) = v44;
    uint64_t v45 = v70;
    *((void *)v30 + 18) = v70;
    if (v45)
    {
      *((void *)v44 + 2) = v43;
      v68 = &v69;
      v69 = 0;
      uint64_t v70 = 0;
    }
    else
    {
      *((void *)v30 + 16) = v43;
    }
    v46 = v30 + 160;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 20));
    v47 = v72;
    *((void *)v30 + 19) = v71;
    *((void *)v30 + 20) = v47;
    uint64_t v48 = v73;
    *((void *)v30 + 21) = v73;
    if (v48)
    {
      *((void *)v47 + 2) = v46;
      v71 = &v72;
      v72 = 0;
      uint64_t v73 = 0;
    }
    else
    {
      *((void *)v30 + 19) = v46;
    }
    v49 = v30 + 184;
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(*((char **)v30 + 23));
    v50 = v75;
    *((void *)v30 + 22) = v74;
    *((void *)v30 + 23) = v50;
    uint64_t v51 = v76;
    *((void *)v30 + 24) = v76;
    if (v51)
    {
      *((void *)v50 + 2) = v49;
      v50 = 0;
      v74 = &v75;
      v75 = 0;
      uint64_t v76 = 0;
    }
    else
    {
      *((void *)v30 + 22) = v49;
    }
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v50);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v72);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v69);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v66);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v63);
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v60);

    v59 = &v77;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
    v9 = (uint64_t *)*v9;
    if (!v9) {
      goto LABEL_41;
    }
  }
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v75);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v72);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v69);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v66);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v63);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v60);

  v59 = &v77;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);

  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>>>::~__hash_table((uint64_t)v78);
  v52 = 0;
  v7 = v54;
LABEL_43:

  return v52;
}

- (void)setFunctionNameToOutputLayersNames:(id)a3
{
}

- (void)setFunctionNameToInputLayersNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionNameToInputLayersNames, 0);
  objc_storeStrong((id *)&self->_functionNameToOutputLayersNames, 0);
  objc_storeStrong((id *)&self->_activeFunction, 0);
  left = self->functionNameToInputShapes.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<std::string,InputNameToShapes>,std::__map_value_compare<std::string,std::__value_type<std::string,InputNameToShapes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,InputNameToShapes>>>::destroy(left);
}

@end