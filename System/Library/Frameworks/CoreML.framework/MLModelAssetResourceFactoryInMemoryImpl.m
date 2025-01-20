@interface MLModelAssetResourceFactoryInMemoryImpl
- (MLModelAssetResourceFactoryInMemoryImpl)initWithArchiveData:(id)a3;
- (NSURL)compiledModelURL;
- (id).cxx_construct;
- (id)modelAssetDescriptionWithError:(id *)a3;
- (id)modelStructureWithError:(id *)a3;
- (id)modelWithConfiguration:(id)a3 error:(id *)a4;
@end

@implementation MLModelAssetResourceFactoryInMemoryImpl

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_inputArchiver.__ptr_.__value_;
  self->_inputArchiver.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<_MLModelInputArchiver>::operator()[abi:ne180100]((uint64_t)value);
  }
}

- (id)modelStructureWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  IArchive::rewind((uint64_t)self->_inputArchiver.__ptr_.__value_);
  int v13 = 0;
  std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v16, (uint64_t)v12);
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v14 = (void **)&v9;
  char v15 = 0;
  v9 = (char *)operator new(0x20uLL);
  v10 = v9;
  v11 = v9 + 32;
  v10 = (unsigned char *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel> const*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel> const*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v16, (uint64_t)&v17, (uint64_t)v9);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v16);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v12);
  value = self->_inputArchiver.__ptr_.__value_;
  memset(v8, 0, sizeof(v8));
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (v10 - v9) >> 5);
  v6 = +[MLModelStructure loadModelStructureFromCompiledArchive:value path:v8 error:a3];
  v16[0] = (void **)v8;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v16);
  v16[0] = (void **)&v9;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v16);

  return v6;
}

- (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  IArchive::rewind((uint64_t)self->_inputArchiver.__ptr_.__value_);
  v7 = +[MLLoader loadModelFromArchive:self->_inputArchiver.__ptr_.__value_ configuration:v6 error:a4];

  return v7;
}

- (id)modelAssetDescriptionWithError:(id *)a3
{
  IArchive::rewind((uint64_t)self->_inputArchiver.__ptr_.__value_);
  value = self->_inputArchiver.__ptr_.__value_;

  return +[MLLoader loadModelAssetDescriptionFromArchive:value error:a3];
}

- (NSURL)compiledModelURL
{
  return 0;
}

- (MLModelAssetResourceFactoryInMemoryImpl)initWithArchiveData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MLModelAssetResourceFactoryInMemoryImpl;
  if ([(MLModelAssetResourceFactoryInMemoryImpl *)&v10 init])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, ".");
    id v5 = v4;
    id v6 = (std::__shared_weak_count *)operator new(0x50uLL);
    v6->__shared_owners_ = 0;
    v6->__shared_weak_owners_ = 0;
    v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF0DD998;
    __p[3] = (void *)Archiver::_IArchiveMemoryImpl::_IArchiveMemoryImpl((uint64_t)&v6[1], (uint64_t)__p, v5);
    __p[4] = v6;
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    v9[0] = 0;
    v9[1] = 0;
    __p[5] = v9;
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);

    operator new();
  }

  return 0;
}

@end