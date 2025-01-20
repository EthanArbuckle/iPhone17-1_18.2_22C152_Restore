@interface MLModelStructureNeuralNetwork
+ (id)loadModelStructureFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 path:(Path *)a6 error:(id *)a7;
- (MLModelStructureNeuralNetwork)initWithLayers:(id)a3;
- (NSArray)layers;
@end

@implementation MLModelStructureNeuralNetwork

- (void).cxx_destruct
{
}

- (NSArray)layers
{
  return self->_layers;
}

- (MLModelStructureNeuralNetwork)initWithLayers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureNeuralNetwork;
  v5 = [(MLModelStructureNeuralNetwork *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    layers = v5->_layers;
    v5->_layers = (NSArray *)v6;
  }
  return v5;
}

+ (id)loadModelStructureFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 path:(Path *)a6 error:(id *)a7
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v56 = a4;
  id v57 = a5;
  v55 = a7;
  v58 = objc_alloc_init(MLModelConfiguration);
  v59 = +[MLNeuralNetworkV1Container containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:](MLNeuralNetworkV1Container, "containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v56, v57);
  if (!v59)
  {
LABEL_23:
    v26 = 0;
    goto LABEL_50;
  }
  if (!espresso_create_context())
  {
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to create the context for loading the NeuralNetwork model structure.", buf, 2u);
    }

    if (a7)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      v15 = [NSString stringWithFormat:@"Failed to create the context for loading the NeuralNetwork model structure."];
      v76 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      *a7 = [v14 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v16];
    }
    goto LABEL_23;
  }
  if (!espresso_create_plan())
  {
    v22 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v22, OS_LOG_TYPE_ERROR, "Failed to create the plan for loading the NeuralNetwork model structure.", buf, 2u);
    }

    if (a7)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v73 = *MEMORY[0x1E4F28568];
      v24 = [NSString stringWithFormat:@"Failed to create the plan for loading the NeuralNetwork model structure."];
      v74 = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      *a7 = [v23 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v25];
    }
    espresso_context_destroy();
    goto LABEL_23;
  }
  id v10 = v59;
  v11 = [v10 compilerOutput];
  v12 = v11;
  if (v11)
  {
    [v11 network];
    if (*(void *)v78) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v78);
    }
    if (*(void *)buf)
    {
      [v12 network];
      espresso_plan_add_cpp_net();
      if (*((void *)&v65 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v65 + 1));
      }

LABEL_24:
      Espresso::get_internal_network();
      v27 = v68;
      v60 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(v68[5] - v68[4]) >> 4];
      unint64_t v67 = 0;
      uint64_t v28 = v68[4];
      if (v68[5] != v28)
      {
        uint64_t v29 = 0;
        unint64_t v30 = 0;
        do
        {
          uint64_t v31 = *(void *)(v28 + v29);
          v32 = (uint64_t *)(v31 + 16);
          uint64_t v33 = v31 + 16;
          if (*(char *)(v31 + 39) < 0) {
            uint64_t v33 = *v32;
          }
          v34 = [NSString stringWithUTF8String:v33];
          uint64_t v35 = *(void *)(v28 + v29);
          v36 = (void *)(v35 + 40);
          if (*(char *)(v35 + 63) < 0) {
            v36 = (void *)*v36;
          }
          v37 = [NSString stringWithUTF8String:v36];
          v38 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v68 + 7, v30, &v67);
          v39 = CoreML::stringArrayToObjC(v38 + 3);
          v40 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v68 + 12, v30, &v67);
          v41 = CoreML::stringArrayToObjC(v40 + 3);
          long long v65 = 0uLL;
          uint64_t v66 = 0;
          std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)&v65, (uint64_t)a6->m_components.__begin_, (uint64_t)a6->m_components.__end_, ((char *)a6->m_components.__end_ - (char *)a6->m_components.__begin_) >> 5);
          if (*(char *)(v31 + 39) < 0)
          {
            std::string::__init_copy_ctor_external(&v64, *(const std::string::value_type **)(v31 + 16), *(void *)(v31 + 24));
          }
          else
          {
            *(_OWORD *)&v64.__r_.__value_.__l.__data_ = *(_OWORD *)v32;
            v64.__r_.__value_.__r.__words[2] = *(void *)(v31 + 32);
          }
          *(void *)v78 = v64.__r_.__value_.__l.__size_;
          std::string::size_type v42 = v64.__r_.__value_.__r.__words[0];
          *(void *)&v78[7] = *(std::string::size_type *)((char *)&v64.__r_.__value_.__r.__words[1] + 7);
          char v43 = HIBYTE(v64.__r_.__value_.__r.__words[2]);
          memset(&v64, 0, sizeof(v64));
          *(void *)buf = v42;
          char v79 = v43;
          int v80 = 6;
          CoreML::ModelStructure::Path::appendComponent((uint64_t)&v65, (uint64_t)buf);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
          if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v64.__r_.__value_.__l.__data_);
          }
          v44 = [MLModelStructurePath alloc];
          long long v62 = v65;
          uint64_t v63 = v66;
          uint64_t v66 = 0;
          long long v65 = 0uLL;
          v45 = [(MLModelStructurePath *)v44 initWithCppPath:&v62];
          v70 = (void **)&v62;
          std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v70);
          v46 = [[MLModelStructureNeuralNetworkLayer alloc] initWithName:v34 type:v37 inputNames:v39 outputNames:v41 path:v45];
          [v60 addObject:v46];

          v70 = (void **)&v65;
          std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v70);

          unint64_t v67 = ++v30;
          uint64_t v28 = v27[4];
          v29 += 16;
        }
        while (v30 < (v27[5] - v28) >> 4);
      }
      if (v69) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v69);
      }
      uint64_t v20 = 0;
      v21 = v60;
      goto LABEL_42;
    }
  }
  v17 = [v10 modelFilePath];
  BOOL v18 = [v17 length] == 0;

  if (v18)
  {
    v47 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v47, OS_LOG_TYPE_ERROR, "This is a logic error, encountered unexpected internal state when loading the NeuralNetwork model structure.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"This is a logic error, encountered unexpected internal state when loading the NeuralNetwork model structure." format];
    v21 = 0;
    uint64_t v20 = 4294967294;
    goto LABEL_42;
  }
  id v19 = [v10 modelFilePath];
  [v19 UTF8String];
  uint64_t v20 = espresso_plan_add_network();

  if (!v20) {
    goto LABEL_24;
  }
  v21 = 0;
LABEL_42:
  espresso_plan_destroy();
  espresso_context_destroy();
  v48 = v21;
  if (v21)
  {
    v26 = (void *)[objc_alloc((Class)a1) initWithLayers:v21];
  }
  else
  {
    v49 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v20;
      _os_log_error_impl(&dword_19E58B000, v49, OS_LOG_TYPE_ERROR, "Failed to load the NeuralNetwork model structure due to error code: %d.", buf, 8u);
    }

    if (v55)
    {
      v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v71 = *MEMORY[0x1E4F28568];
      v51 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to load the NeuralNetwork model structure due to error code: %d.", v20);
      v72 = v51;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      id *v55 = [v50 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v52];
    }
    v26 = 0;
  }

LABEL_50:

  return v26;
}

@end