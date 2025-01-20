@interface MLModelStructureProgramOperation
- (MLModelStructurePath)path;
- (MLModelStructureProgramOperation)initWithMILOperation:(const void *)a3 path:(const void *)a4;
- (MLModelStructureProgramOperation)initWithOperatorName:(id)a3 inputs:(id)a4 outputs:(id)a5 blocks:(id)a6 path:(id)a7 milTextLocation:(id)a8 milId:(id)a9;
- (NSArray)blocks;
- (NSArray)outputs;
- (NSDictionary)inputs;
- (NSNumber)milId;
- (NSString)milTextLocation;
- (NSString)operatorName;
@end

@implementation MLModelStructureProgramOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_milId, 0);
  objc_storeStrong((id *)&self->_milTextLocation, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->_operatorName, 0);
}

- (NSNumber)milId
{
  return self->_milId;
}

- (NSString)milTextLocation
{
  return self->_milTextLocation;
}

- (MLModelStructurePath)path
{
  return self->_path;
}

- (NSArray)blocks
{
  return self->_blocks;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSDictionary)inputs
{
  return self->_inputs;
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (MLModelStructureProgramOperation)initWithMILOperation:(const void *)a3 path:(const void *)a4
{
  MIL::IRObject::GetLocation((MIL::IRObject *)a3);
  v7 = (void *)(*(uint64_t (**)(const void *))(*(void *)a3 + 160))(a3);
  v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v7[2]];
  v11 = (void *)*v7;
  v9 = v7 + 1;
  v10 = v11;
  if (v11 != v9)
  {
    do
    {
      v12 = v10 + 4;
      if (*((char *)v10 + 55) < 0) {
        v12 = (void *)*v12;
      }
      v13 = [NSString stringWithUTF8String:v12];
      v14 = [[MLModelStructureProgramArgument alloc] initWithMILArguments:v10 + 7];
      [v8 setObject:v14 forKeyedSubscript:v13];

      v15 = (void *)v10[1];
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = (void *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (void *)v10[2];
          BOOL v17 = *v16 == (void)v10;
          v10 = v16;
        }
        while (!v17);
      }
      v10 = v16;
    }
    while (v16 != v9);
  }
  v50 = (MIL::IRObject *)a3;
  v18 = (void *)(*(uint64_t (**)(const void *))(*(void *)a3 + 176))(a3);
  v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(v18[1] - *v18) >> 4];
  v20 = (void *)*v18;
  v21 = (void *)v18[1];
  if ((void *)*v18 != v21)
  {
    do
    {
      v22 = [[MLModelStructureProgramNamedValueType alloc] initWithMILNamedValueType:*v20];
      [v19 addObject:v22];

      v20 += 2;
    }
    while (v20 != v21);
  }
  uint64_t v23 = (*(uint64_t (**)(MIL::IRObject *))(*(void *)v50 + 208))(v50);
  v47 = v19;
  v48 = v8;
  v49 = self;
  v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*(void *)(*(void *)v23 + 8) - **(void **)v23) >> 4];
  if (*(void *)(*(void *)v23 + 8) != **(void **)v23)
  {
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    do
    {
      long long v56 = 0uLL;
      uint64_t v57 = 0;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)&v56, *(void *)a4, *((void *)a4 + 1), (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
      v54[0] = v26;
      int v55 = 3;
      CoreML::ModelStructure::Path::appendComponent((uint64_t)&v56, (uint64_t)v54);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v54);
      uint64_t v27 = *(void *)(**(void **)v23 + v25);
      v28 = [MLModelStructureProgramBlock alloc];
      long long v52 = v56;
      uint64_t v53 = v57;
      uint64_t v57 = 0;
      long long v56 = 0uLL;
      v29 = [(MLModelStructureProgramBlock *)v28 initWithMILBlock:v27 path:&v52];
      v58[0] = (void **)&v52;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v58);
      [v24 addObject:v29];

      v58[0] = (void **)&v56;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v58);
      ++v26;
      v25 += 16;
    }
    while (v26 < (uint64_t)(*(void *)(*(void *)v23 + 8) - **(void **)v23) >> 4);
  }
  v30 = NSString;
  uint64_t v31 = (*(uint64_t (**)(MIL::IRObject *))(*(void *)v50 + 64))(v50);
  uint64_t v32 = (*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
  if (*(char *)(v32 + 23) >= 0) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = *(void *)v32;
  }
  v34 = [v30 stringWithUTF8String:v33];
  v35 = [MLModelStructurePath alloc];
  memset(v51, 0, sizeof(v51));
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v51, *(void *)a4, *((void *)a4 + 1), (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
  v36 = [(MLModelStructurePath *)v35 initWithCppPath:v51];
  *(void *)&long long v56 = v51;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
  Location = (const void *)MIL::IRObject::GetLocation(v50);
  v38 = __dynamic_cast(Location, MEMORY[0x1E4F733C8], MEMORY[0x1E4F733A8], 0);
  if (v38)
  {
    v39 = v38;
    v40 = NSString;
    uint64_t v41 = (*(uint64_t (**)(void *))(*(void *)v38 + 48))(v38);
    v42 = objc_msgSend(v40, "stringWithFormat:", @"%llu:%llu", v41, (*(uint64_t (**)(void *))(*(void *)v39 + 32))(v39));
  }
  else
  {
    v42 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v56, "milId");
  uint64_t Attribute = MIL::IRObject::TryGetAttribute();
  v44 = (MIL::IRValue *)Attribute;
  if ((SHIBYTE(v57) & 0x80000000) == 0)
  {
    if (!Attribute) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  operator delete((void *)v56);
  if (v44)
  {
LABEL_25:
    MIL::IRValue::AsTensor(v44);
    v44 = [NSNumber numberWithUnsignedLongLong:MIL::IRValue::GetScalar<unsigned long long>()];
  }
LABEL_26:
  v45 = [(MLModelStructureProgramOperation *)v49 initWithOperatorName:v34 inputs:v48 outputs:v47 blocks:v24 path:v36 milTextLocation:v42 milId:v44];

  return v45;
}

- (MLModelStructureProgramOperation)initWithOperatorName:(id)a3 inputs:(id)a4 outputs:(id)a5 blocks:(id)a6 path:(id)a7 milTextLocation:(id)a8 milId:(id)a9
{
  id v35 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)MLModelStructureProgramOperation;
  v22 = [(MLModelStructureProgramOperation *)&v36 init];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_operatorName, a3);
    uint64_t v24 = [v16 copy];
    inputs = v23->_inputs;
    v23->_inputs = (NSDictionary *)v24;

    uint64_t v26 = [v17 copy];
    outputs = v23->_outputs;
    v23->_outputs = (NSArray *)v26;

    uint64_t v28 = [v18 copy];
    blocks = v23->_blocks;
    v23->_blocks = (NSArray *)v28;

    objc_storeStrong((id *)&v23->_path, a7);
    uint64_t v30 = [v20 copy];
    milTextLocation = v23->_milTextLocation;
    v23->_milTextLocation = (NSString *)v30;

    uint64_t v32 = [v21 copy];
    milId = v23->_milId;
    v23->_milId = (NSNumber *)v32;
  }
  return v23;
}

@end