@interface MLModelStructure
+ (id)loadModelStructureFromCompiledArchive:(void *)a3 path:(Path *)a4 error:(id *)a5;
+ (void)loadContentsOfURL:(id)a3 completionHandler:(id)a4;
+ (void)loadModelAsset:(id)a3 completionHandler:(id)a4;
- (MLModelStructure)initWithNeuralNetwork:(id)a3;
- (MLModelStructure)initWithNeuralNetwork:(id)a3 program:(id)a4 pipeline:(id)a5;
- (MLModelStructure)initWithPipeline:(id)a3;
- (MLModelStructure)initWithProgram:(id)a3;
- (MLModelStructureNeuralNetwork)neuralNetwork;
- (MLModelStructurePipeline)pipeline;
- (MLModelStructureProgram)program;
@end

@implementation MLModelStructure

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_program, 0);

  objc_storeStrong((id *)&self->_neuralNetwork, 0);
}

- (MLModelStructurePipeline)pipeline
{
  return self->_pipeline;
}

- (MLModelStructureProgram)program
{
  return self->_program;
}

- (MLModelStructureNeuralNetwork)neuralNetwork
{
  return self->_neuralNetwork;
}

- (MLModelStructure)initWithPipeline:(id)a3
{
  return [(MLModelStructure *)self initWithNeuralNetwork:0 program:0 pipeline:a3];
}

- (MLModelStructure)initWithProgram:(id)a3
{
  return [(MLModelStructure *)self initWithNeuralNetwork:0 program:a3 pipeline:0];
}

- (MLModelStructure)initWithNeuralNetwork:(id)a3
{
  return [(MLModelStructure *)self initWithNeuralNetwork:a3 program:0 pipeline:0];
}

- (MLModelStructure)initWithNeuralNetwork:(id)a3 program:(id)a4 pipeline:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MLModelStructure;
  v12 = [(MLModelStructure *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_neuralNetwork, a3);
    objc_storeStrong((id *)&v13->_program, a4);
    objc_storeStrong((id *)&v13->_pipeline, a5);
  }

  return v13;
}

+ (void)loadContentsOfURL:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, void, id))a4;
  id v9 = 0;
  v7 = +[MLModelAsset modelAssetWithURL:a3 error:&v9];
  id v8 = v9;
  if (v7) {
    [a1 loadModelAsset:v7 completionHandler:v6];
  }
  else {
    v6[2](v6, 0, v8);
  }
}

+ (void)loadModelAsset:(id)a3 completionHandler:(id)a4
{
}

+ (id)loadModelStructureFromCompiledArchive:(void *)a3 path:(Path *)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if (!(*(unsigned int (**)(void, SEL))(**(void **)a3 + 64))(*(void *)a3, a2))
  {
    int v36 = 0;
    id v34 = 0;
    id v35 = 0;
    BOOL v13 = +[MLArchivingUtils parseModelArchive:a3 modelType:&v36 compilerVersion:&v35 modelVersion:&v34 error:a5];
    id v14 = v35;
    id v15 = v34;
    if (!v13)
    {
      a5 = 0;
LABEL_30:

      goto LABEL_31;
    }
    if (v36 <= 302)
    {
      if ((v36 - 200) < 3)
      {
        memset(buf, 0, sizeof(buf));
        uint64_t v33 = 0;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)buf, (uint64_t)a4->m_components.__begin_, (uint64_t)a4->m_components.__end_, ((char *)a4->m_components.__end_ - (char *)a4->m_components.__begin_) >> 5);
        int v23 = 7;
        CoreML::ModelStructure::Path::appendComponent((uint64_t)buf, (uint64_t)v22);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v22);
        long long v20 = *(_OWORD *)buf;
        uint64_t v21 = v33;
        uint64_t v33 = 0;
        memset(buf, 0, sizeof(buf));
        v16 = +[MLModelStructurePipeline loadModelStructureFromCompiledArchive:a3 modelVersionInfo:v15 compilerVersionInfo:v14 path:&v20 error:a5];
        v37 = (uint8_t *)&v20;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
        if (v16) {
          a5 = (id *)[objc_alloc((Class)a1) initWithPipeline:v16];
        }
        else {
          a5 = 0;
        }

        goto LABEL_29;
      }
    }
    else
    {
      if (v36 <= 499)
      {
        if (v36 != 303 && v36 != 403) {
          goto LABEL_26;
        }
        goto LABEL_18;
      }
      if (v36 == 502)
      {
        memset(buf, 0, sizeof(buf));
        uint64_t v33 = 0;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)buf, (uint64_t)a4->m_components.__begin_, (uint64_t)a4->m_components.__end_, ((char *)a4->m_components.__end_ - (char *)a4->m_components.__begin_) >> 5);
        int v27 = 1;
        CoreML::ModelStructure::Path::appendComponent((uint64_t)buf, (uint64_t)v26);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v26);
        long long v24 = *(_OWORD *)buf;
        uint64_t v25 = v33;
        uint64_t v33 = 0;
        memset(buf, 0, sizeof(buf));
        v18 = +[MLModelStructureProgram loadModelStructureFromCompiledArchive:a3 modelVersionInfo:v15 compilerVersionInfo:v14 path:&v24 error:a5];
        v37 = (uint8_t *)&v24;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
        if (v18) {
          a5 = (id *)[objc_alloc((Class)a1) initWithProgram:v18];
        }
        else {
          a5 = 0;
        }

        goto LABEL_29;
      }
      if (v36 == 500)
      {
LABEL_18:
        memset(buf, 0, sizeof(buf));
        uint64_t v33 = 0;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)buf, (uint64_t)a4->m_components.__begin_, (uint64_t)a4->m_components.__end_, ((char *)a4->m_components.__end_ - (char *)a4->m_components.__begin_) >> 5);
        int v31 = 5;
        CoreML::ModelStructure::Path::appendComponent((uint64_t)buf, (uint64_t)v30);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v30);
        long long v28 = *(_OWORD *)buf;
        uint64_t v29 = v33;
        uint64_t v33 = 0;
        memset(buf, 0, sizeof(buf));
        v17 = +[MLModelStructureNeuralNetwork loadModelStructureFromCompiledArchive:a3 modelVersionInfo:v15 compilerVersionInfo:v14 path:&v28 error:a5];
        v37 = (uint8_t *)&v28;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
        if (v17) {
          a5 = (id *)[objc_alloc((Class)a1) initWithNeuralNetwork:v17];
        }
        else {
          a5 = 0;
        }

LABEL_29:
        v37 = buf;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
        goto LABEL_30;
      }
    }
LABEL_26:
    a5 = (id *)[objc_alloc((Class)a1) initWithNeuralNetwork:0 program:0 pipeline:0];
    goto LABEL_30;
  }
  id v9 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Failed to construct MLModelStructure, encrypted model is not supported.", buf, 2u);
  }

  if (a5)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    id v11 = [NSString stringWithFormat:@"Failed to construct MLModelStructure, encrypted model is not supported."];
    v39[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    *a5 = [v10 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v12];

    a5 = 0;
  }
LABEL_31:

  return a5;
}

@end