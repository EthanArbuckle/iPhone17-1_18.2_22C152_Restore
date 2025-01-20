@interface MLModelStructureProgramBlock
- (MLModelStructureProgramBlock)initWithInputs:(id)a3 outputNames:(id)a4 operations:(id)a5;
- (MLModelStructureProgramBlock)initWithMILBlock:(const void *)a3 path:(Path *)a4;
- (NSArray)inputs;
- (NSArray)operations;
- (NSArray)outputNames;
@end

@implementation MLModelStructureProgramBlock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

- (NSArray)operations
{
  return self->_operations;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (MLModelStructureProgramBlock)initWithMILBlock:(const void *)a3 path:(Path *)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v6 = (void *)(*(uint64_t (**)(const void *, SEL))(*(void *)a3 + 40))(a3, a2);
  v30 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(v6[1] - *v6) >> 4];
  v7 = (void *)*v6;
  v8 = (void *)v6[1];
  if ((void *)*v6 != v8)
  {
    do
    {
      v9 = [[MLModelStructureProgramNamedValueType alloc] initWithMILNamedValueType:*v7];
      [v30 addObject:v9];

      v7 += 2;
    }
    while (v7 != v8);
  }
  v10 = (uint64_t **)(*(uint64_t (**)(const void *))(*(void *)a3 + 88))(a3);
  v29 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * (v10[1] - *v10)];
  v11 = *v10;
  v12 = v10[1];
  if (*v10 != v12)
  {
    do
    {
      v13 = v11;
      if (*((char *)v11 + 23) < 0) {
        v13 = (uint64_t *)*v11;
      }
      v14 = [NSString stringWithUTF8String:v13];
      [v29 addObject:v14];

      v11 += 3;
    }
    while (v11 != v12);
  }
  v15 = (char ***)(*(uint64_t (**)(const void *))(*(void *)a3 + 56))(a3);
  v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:((*v15)[1] - **v15) >> 4];
  v17 = **v15;
  for (i = (*v15)[1]; v17 != i; v17 += 16)
  {
    uint64_t v19 = *(void *)v17;
    uint64_t v20 = (*(uint64_t (**)(void))(**(void **)v17 + 176))(*(void *)v17);
    if (*(void *)(v20 + 8) == *(void *)v20)
    {
      memset(&v36, 0, sizeof(v36));
    }
    else
    {
      uint64_t Name = MIL::IRNamedValueType::GetName(**(MIL::IRNamedValueType ***)v20);
      if (*(char *)(Name + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v36, *(const std::string::value_type **)Name, *(void *)(Name + 8));
      }
      else
      {
        long long v22 = *(_OWORD *)Name;
        v36.__r_.__value_.__r.__words[2] = *(void *)(Name + 16);
        *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v22;
      }
    }
    memset(v35, 0, sizeof(v35));
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v35, (uint64_t)a4->m_components.__begin_, (uint64_t)a4->m_components.__end_, ((char *)a4->m_components.__end_ - (char *)a4->m_components.__begin_) >> 5);
    v38[0] = v36.__r_.__value_.__l.__size_;
    std::string::size_type v23 = v36.__r_.__value_.__r.__words[0];
    *(void *)((char *)v38 + 7) = *(std::string::size_type *)((char *)&v36.__r_.__value_.__r.__words[1] + 7);
    char v24 = HIBYTE(v36.__r_.__value_.__r.__words[2]);
    memset(&v36, 0, sizeof(v36));
    *(void *)v32 = v38[0];
    *(void *)&v32[7] = *(void *)((char *)v38 + 7);
    v38[0] = 0;
    *(void *)((char *)v38 + 7) = 0;
    std::string::size_type v31 = v23;
    char v33 = v24;
    int v34 = 4;
    CoreML::ModelStructure::Path::appendComponent((uint64_t)v35, (uint64_t)&v31);
    std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v31);
    v25 = [[MLModelStructureProgramOperation alloc] initWithMILOperation:v19 path:v35];
    [v16 addObject:v25];

    v37 = (void **)v35;
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v37);
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v36.__r_.__value_.__l.__data_);
    }
  }
  v26 = [(MLModelStructureProgramBlock *)self initWithInputs:v30 outputNames:v29 operations:v16];

  return v26;
}

- (MLModelStructureProgramBlock)initWithInputs:(id)a3 outputNames:(id)a4 operations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MLModelStructureProgramBlock;
  v11 = [(MLModelStructureProgramBlock *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    inputs = v11->_inputs;
    v11->_inputs = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    outputNames = v11->_outputNames;
    v11->_outputNames = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    operations = v11->_operations;
    v11->_operations = (NSArray *)v16;
  }
  return v11;
}

@end