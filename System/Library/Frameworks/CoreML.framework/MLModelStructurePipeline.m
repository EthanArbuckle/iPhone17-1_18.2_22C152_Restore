@interface MLModelStructurePipeline
+ (id)loadModelStructureFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 path:(Path *)a6 error:(id *)a7;
- (MLModelStructurePipeline)initWithSubModelNames:(id)a3 subModels:(id)a4;
- (NSArray)subModelNames;
- (NSArray)subModels;
@end

@implementation MLModelStructurePipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subModels, 0);

  objc_storeStrong((id *)&self->_subModelNames, 0);
}

- (NSArray)subModels
{
  return self->_subModels;
}

- (NSArray)subModelNames
{
  return self->_subModelNames;
}

- (MLModelStructurePipeline)initWithSubModelNames:(id)a3 subModels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLModelStructurePipeline;
  v8 = [(MLModelStructurePipeline *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    subModelNames = v8->_subModelNames;
    v8->_subModelNames = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    subModels = v8->_subModels;
    v8->_subModels = (NSArray *)v11;
  }
  return v8;
}

+ (id)loadModelStructureFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 path:(Path *)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  objc_super v14 = [[MLModelAssetDescription alloc] initWithCompiledModelArchive:a3 error:a7];
  if (v14)
  {
    v28 = v14;
    id v29 = v13;
    id v30 = v12;
    id v51 = 0;
    id v52 = 0;
    BOOL v15 = +[MLPipeline parseModelArchive:a3 subModelNames:&v52 subModelArchiveNames:&v51 error:a7];
    id v32 = v52;
    id v16 = v51;
    v17 = v16;
    if (v15)
    {
      v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      for (unint64_t i = 0; ; ++i)
      {
        if (i >= [v32 count])
        {
          v26 = (void *)[objc_alloc((Class)a1) initWithSubModelNames:v32 subModels:v31];
          goto LABEL_25;
        }
        id v19 = [v17 objectAtIndexedSubscript:i];
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v19 UTF8String]);
        v20 = IArchive::nestedArchive(a3, (uint64_t)&__p);
        v21 = (std::__shared_weak_count *)*((void *)v20 + 1);
        uint64_t v47 = *(void *)v20;
        v48 = v21;
        if (v21) {
          atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)&v49, (void *)v20 + 2);
        if (v45 < 0) {
          operator delete(__p);
        }
        _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)&__p, (const IArchive *)&v47);
        long long v41 = 0uLL;
        uint64_t v42 = 0;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)&v41, (uint64_t)a6->m_components.__begin_, (uint64_t)a6->m_components.__end_, ((char *)a6->m_components.__end_ - (char *)a6->m_components.__begin_) >> 5);
        id v22 = v19;
        std::string::basic_string[abi:ne180100]<0>(&v35, (char *)[v22 UTF8String]);
        v23 = v35;
        *(void *)v38 = v36;
        *(void *)&v38[7] = *(void *)((char *)&v36 + 7);
        char v24 = HIBYTE(v36);
        v35 = 0;
        long long v36 = 0uLL;
        v37 = v23;
        char v39 = v24;
        int v40 = 8;
        CoreML::ModelStructure::Path::appendComponent((uint64_t)&v41, (uint64_t)&v37);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v37);
        if (SHIBYTE(v36) < 0) {
          operator delete(v35);
        }
        long long v33 = v41;
        uint64_t v34 = v42;
        uint64_t v42 = 0;
        long long v41 = 0uLL;
        v25 = +[MLModelStructure loadModelStructureFromCompiledArchive:&__p path:&v33 error:a7];
        v53[0] = (void **)&v33;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v53);
        if (!v25) {
          break;
        }
        [v31 addObject:v25];

        v53[0] = (void **)&v41;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v53);
        std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v46);
        if (v44) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v44);
        }
        std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v50);
        if (v48) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v48);
        }
      }
      v53[0] = (void **)&v41;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v53);
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v46);
      if (v44) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v44);
      }
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v50);
      if (v48) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v48);
      }

      v26 = 0;
LABEL_25:
    }
    else
    {
      v26 = 0;
    }

    id v13 = v29;
    id v12 = v30;
    objc_super v14 = v28;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end