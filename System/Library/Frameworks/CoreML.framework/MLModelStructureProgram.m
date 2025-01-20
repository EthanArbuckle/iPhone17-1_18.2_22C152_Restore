@interface MLModelStructureProgram
+ (id)loadModelStructureFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 path:(Path *)a6 error:(id *)a7;
- (MLModelStructureProgram)initWithFunctions:(id)a3;
- (MLModelStructureProgramFunction)mainFunction;
- (NSDictionary)functions;
@end

@implementation MLModelStructureProgram

- (void).cxx_destruct
{
}

- (NSDictionary)functions
{
  return self->_functions;
}

- (MLModelStructureProgramFunction)mainFunction
{
  v2 = [(MLModelStructureProgram *)self functions];
  v3 = [NSString stringWithUTF8String:"main"];
  v4 = [v2 objectForKeyedSubscript:v3];

  return (MLModelStructureProgramFunction *)v4;
}

- (MLModelStructureProgram)initWithFunctions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureProgram;
  v5 = [(MLModelStructureProgram *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    functions = v5->_functions;
    v5->_functions = (NSDictionary *)v6;
  }
  return v5;
}

+ (id)loadModelStructureFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 path:(Path *)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  +[MLProgramContainer loadProgramFromCompiledArchive:a3 error:a7];
  if (v35)
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 72))(v35);
    v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(v14 + 24)];
    for (i = *(uint64_t **)(v14 + 16); i; i = (uint64_t *)*i)
    {
      long long v33 = 0uLL;
      uint64_t v34 = 0;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)&v33, (uint64_t)a6->m_components.__begin_, (uint64_t)a6->m_components.__end_, ((char *)a6->m_components.__end_ - (char *)a6->m_components.__begin_) >> 5);
      v17 = i + 2;
      if (*((char *)i + 39) < 0)
      {
        std::string::__init_copy_ctor_external(&v28, (const std::string::value_type *)i[2], i[3]);
      }
      else
      {
        *(_OWORD *)&v28.__r_.__value_.__l.__data_ = *v17;
        v28.__r_.__value_.__r.__words[2] = i[4];
      }
      *(void *)v30 = v28.__r_.__value_.__l.__size_;
      std::string::size_type v18 = v28.__r_.__value_.__r.__words[0];
      *(void *)&v30[7] = *(std::string::size_type *)((char *)&v28.__r_.__value_.__r.__words[1] + 7);
      char v19 = HIBYTE(v28.__r_.__value_.__r.__words[2]);
      memset(&v28, 0, sizeof(v28));
      std::string::size_type v29 = v18;
      char v31 = v19;
      int v32 = 2;
      CoreML::ModelStructure::Path::appendComponent((uint64_t)&v33, (uint64_t)&v29);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v29);
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v28.__r_.__value_.__l.__data_);
      }
      v20 = [MLModelStructureProgramFunction alloc];
      uint64_t v21 = i[5];
      long long v26 = v33;
      uint64_t v27 = v34;
      uint64_t v34 = 0;
      long long v33 = 0uLL;
      v22 = [(MLModelStructureProgramFunction *)v20 initWithMILFunction:v21 path:&v26];
      v37[0] = (void **)&v26;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v37);
      if (*((char *)i + 39) < 0) {
        v17 = *(_OWORD **)v17;
      }
      v23 = [NSString stringWithUTF8String:v17];
      [v15 setObject:v22 forKeyedSubscript:v23];

      v37[0] = (void **)&v33;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v37);
    }
    v24 = (void *)[objc_alloc((Class)a1) initWithFunctions:v15];
  }
  else
  {
    v24 = 0;
  }
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }

  return v24;
}

@end