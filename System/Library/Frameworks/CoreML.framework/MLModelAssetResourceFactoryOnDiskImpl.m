@interface MLModelAssetResourceFactoryOnDiskImpl
- (MLModelAssetResourceFactoryOnDiskImpl)initWithModelURL:(id)a3 error:(id *)a4;
- (NSURL)modelURL;
- (id)modelAssetDescriptionWithError:(id *)a3;
- (id)modelStructureWithError:(id *)a3;
- (id)modelWithConfiguration:(id)a3 error:(id *)a4;
@end

@implementation MLModelAssetResourceFactoryOnDiskImpl

- (void).cxx_destruct
{
}

- (MLModelAssetResourceFactoryOnDiskImpl)initWithModelURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MLModelAssetResourceFactoryOnDiskImpl;
  v7 = [(MLModelAssetResourceFactoryOnDiskImpl *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_modelURL, a3);
  }

  return v8;
}

- (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = (void *)[a3 copy];
  v7 = [(MLModelAssetResourceFactoryOnDiskImpl *)self compiledModelURL];
  [v6 setRootModelURL:v7];

  v8 = [(MLModelAssetResourceFactoryOnDiskImpl *)self modelURL];
  v9 = +[MLLoader loadModelFromAssetAtURL:v8 configuration:v6 error:a4];

  return v9;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (id)modelStructureWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [(MLModelAssetResourceFactoryOnDiskImpl *)self modelURL];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 fileSystemRepresentation]);

  IArchive::IArchive(&v11, (uint64_t)__p, 0);
  int v17 = 0;
  std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v20, (uint64_t)v16);
  v8 = 0;
  v9 = 0;
  objc_super v10 = 0;
  v18 = (void **)&v8;
  char v19 = 0;
  v8 = (char *)operator new(0x20uLL);
  v9 = v8;
  objc_super v10 = v8 + 32;
  v9 = (unsigned char *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel> const*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel> const*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v20, (uint64_t)&v21, (uint64_t)v8);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v20);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v16);
  memset(v7, 0, sizeof(v7));
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (v9 - v8) >> 5);
  v5 = +[MLModelStructure loadModelStructureFromCompiledArchive:&v11 path:v7 error:a3];
  v20[0] = (void **)v7;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v20);
  v20[0] = (void **)&v8;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v20);
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v13);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v15 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

- (id)modelAssetDescriptionWithError:(id *)a3
{
  id v4 = [(MLModelAssetResourceFactoryOnDiskImpl *)self modelURL];
  v5 = +[MLLoader loadModelAssetDescriptionFromAssetAtURL:v4 error:a3];

  return v5;
}

@end