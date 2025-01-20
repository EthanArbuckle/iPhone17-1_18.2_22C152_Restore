@interface ETModelDefinition
- (ETModelDefinition)initWithInferenceNetworkPath:(id)a3 error:(id *)a4;
- (ETModelDefinition)initWithInferenceNetworkPath:(id)a3 inferenceInputs:(id)a4 inferenceOutputs:(id)a5 error:(id *)a6;
- (ETModelDefinition)initWithTrainingNetworkPath:(id)a3 inferenceInputs:(id)a4 inferenceOutputs:(id)a5 trainingInputs:(id)a6 trainingOutputs:(id)a7 trainingControlVariableName:(id)a8 withInitializer:(id)a9 error:(id *)a10;
- (NSArray)inputs;
- (NSArray)layerNames;
- (NSArray)outputs;
- (NSArray)trainingInputs;
- (NSArray)trainingOutputs;
- (NSString)initializer;
- (NSString)isTrainingGlobalName;
- (NSURL)modelURL;
@end

@implementation ETModelDefinition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializer, 0);
  objc_storeStrong((id *)&self->_isTrainingGlobalName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_trainingOutputs, 0);
  objc_storeStrong((id *)&self->_trainingInputs, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->_layerNames, 0);
}

- (NSString)initializer
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)isTrainingGlobalName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)trainingOutputs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)trainingInputs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)outputs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)inputs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)layerNames
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (ETModelDefinition)initWithTrainingNetworkPath:(id)a3 inferenceInputs:(id)a4 inferenceOutputs:(id)a5 trainingInputs:(id)a6 trainingOutputs:(id)a7 trainingControlVariableName:(id)a8 withInitializer:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v26 = a6;
  id v18 = a7;
  id v25 = a8;
  id v27 = a9;
  id v29 = 0;
  v19 = [[ETModelDefinition alloc] initWithInferenceNetworkPath:v15 inferenceInputs:v16 inferenceOutputs:v17 error:&v29];
  id v20 = v29;

  if (v20)
  {
    v21 = v25;
    v22 = v26;
    v23 = 0;
    if (a10) {
      *a10 = v20;
    }
  }
  else
  {
    if (v19)
    {
      objc_storeStrong((id *)&v19->_trainingInputs, a6);
      objc_storeStrong((id *)&v19->_trainingOutputs, a7);
      objc_storeStrong((id *)&v19->_isTrainingGlobalName, a8);
      objc_storeStrong((id *)&v19->_initializer, a9);
    }
    v23 = v19;
    v21 = v25;
    v22 = v26;
  }

  return v23;
}

- (ETModelDefinition)initWithInferenceNetworkPath:(id)a3 inferenceInputs:(id)a4 inferenceOutputs:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ETModelDefinition;
  v13 = [(ETModelDefinition *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_modelURL, a3);
    objc_storeStrong((id *)&v14->_inputs, a4);
    objc_storeStrong((id *)&v14->_outputs, a5);
  }

  return v14;
}

- (ETModelDefinition)initWithInferenceNetworkPath:(id)a3 error:(id *)a4
{
  return [(ETModelDefinition *)self initWithInferenceNetworkPath:a3 inferenceInputs:MEMORY[0x1E4F1CBF0] inferenceOutputs:MEMORY[0x1E4F1CBF0] error:a4];
}

@end