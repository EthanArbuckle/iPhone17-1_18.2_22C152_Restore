@interface MLModelStructureProgramFunction
- (MLModelStructureProgramBlock)block;
- (MLModelStructureProgramFunction)initWithInputs:(id)a3 block:(id)a4;
- (MLModelStructureProgramFunction)initWithMILFunction:(const void *)a3 path:(Path *)a4;
- (NSArray)inputs;
@end

@implementation MLModelStructureProgramFunction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_block, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

- (MLModelStructureProgramBlock)block
{
  return self->_block;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (MLModelStructureProgramFunction)initWithMILFunction:(const void *)a3 path:(Path *)a4
{
  v7 = (void *)(*(uint64_t (**)(const void *, SEL))(*(void *)a3 + 128))(a3, a2);
  v25 = a4;
  v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7[2]];
  v11 = (void *)*v7;
  v10 = v7 + 1;
  v9 = v11;
  if (v11 != v10)
  {
    do
    {
      v12 = [[MLModelStructureProgramValueType alloc] initWithMILValueType:v9[7]];
      v13 = v9 + 4;
      if (*((char *)v9 + 55) < 0) {
        v13 = (void *)*v13;
      }
      v14 = [NSString stringWithUTF8String:v13];
      v15 = [[MLModelStructureProgramNamedValueType alloc] initWithName:v14 type:v12];
      [v8 addObject:v15];

      v16 = (void *)v9[1];
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = (void *)*v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (void *)v9[2];
          BOOL v18 = *v17 == (void)v9;
          v9 = v17;
        }
        while (!v18);
      }
      v9 = v17;
    }
    while (v17 != v10);
  }
  uint64_t v19 = (*(uint64_t (**)(const void *))(*(void *)a3 + 32))(a3);
  uint64_t v20 = (*(uint64_t (**)(const void *, uint64_t))(*(void *)a3 + 64))(a3, v19);
  v28[0] = -1;
  int v29 = 3;
  CoreML::ModelStructure::Path::appendComponent((uint64_t)v25, (uint64_t)v28);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v28);
  v21 = [MLModelStructureProgramBlock alloc];
  long long v26 = *(_OWORD *)&v25->m_components.__begin_;
  value = v25->m_components.__end_cap_.__value_;
  v25->m_components.__end_ = 0;
  v25->m_components.__end_cap_.__value_ = 0;
  v25->m_components.__begin_ = 0;
  v22 = [(MLModelStructureProgramBlock *)v21 initWithMILBlock:v20 path:&v26];
  v30 = (void **)&v26;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v30);
  v23 = [(MLModelStructureProgramFunction *)self initWithInputs:v8 block:v22];

  return v23;
}

- (MLModelStructureProgramFunction)initWithInputs:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLModelStructureProgramFunction;
  v8 = [(MLModelStructureProgramFunction *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    inputs = v8->_inputs;
    v8->_inputs = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_block, a4);
  }

  return v8;
}

@end