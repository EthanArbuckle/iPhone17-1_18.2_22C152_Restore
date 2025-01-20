@interface MLModelStructureNeuralNetworkLayer
- (MLModelStructureNeuralNetworkLayer)initWithName:(id)a3 type:(id)a4 inputNames:(id)a5 outputNames:(id)a6 path:(id)a7;
- (MLModelStructurePath)path;
- (NSArray)inputNames;
- (NSArray)outputNames;
- (NSString)name;
- (NSString)type;
@end

@implementation MLModelStructureNeuralNetworkLayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (MLModelStructurePath)path
{
  return self->_path;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (NSArray)inputNames
{
  return self->_inputNames;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (MLModelStructureNeuralNetworkLayer)initWithName:(id)a3 type:(id)a4 inputNames:(id)a5 outputNames:(id)a6 path:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MLModelStructureNeuralNetworkLayer;
  v17 = [(MLModelStructureNeuralNetworkLayer *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    name = v17->_name;
    v17->_name = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    type = v17->_type;
    v17->_type = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    inputNames = v17->_inputNames;
    v17->_inputNames = (NSArray *)v22;

    uint64_t v24 = [v15 copy];
    outputNames = v17->_outputNames;
    v17->_outputNames = (NSArray *)v24;

    objc_storeStrong((id *)&v17->_path, a7);
  }

  return v17;
}

@end