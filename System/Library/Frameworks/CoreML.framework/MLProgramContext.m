@interface MLProgramContext
- (MLFeatureProvider)executionState;
- (MLProgramContext)initWithExecutionState:(id)a3 functionNameToStateMap:(id)a4;
- (NSDictionary)functionNameToInputLayersNames;
- (NSDictionary)functionNameToOutputLayersNames;
- (NSDictionary)functionNameToStateMap;
- (NSString)forwardFunctionLossName;
- (NSString)trainFunctionLossName;
- (void)setExecutionState:(id)a3;
- (void)setForwardFunctionLossName:(id)a3;
- (void)setFunctionNameToInputLayersNames:(id)a3;
- (void)setFunctionNameToOutputLayersNames:(id)a3;
- (void)setFunctionNameToStateMap:(id)a3;
- (void)setTrainFunctionLossName:(id)a3;
@end

@implementation MLProgramContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionNameToStateMap, 0);
  objc_storeStrong((id *)&self->_forwardFunctionLossName, 0);
  objc_storeStrong((id *)&self->_trainFunctionLossName, 0);
  objc_storeStrong((id *)&self->_executionState, 0);
  objc_storeStrong((id *)&self->_functionNameToOutputLayersNames, 0);

  objc_storeStrong((id *)&self->_functionNameToInputLayersNames, 0);
}

- (void)setFunctionNameToStateMap:(id)a3
{
}

- (NSDictionary)functionNameToStateMap
{
  return self->_functionNameToStateMap;
}

- (void)setForwardFunctionLossName:(id)a3
{
}

- (NSString)forwardFunctionLossName
{
  return self->_forwardFunctionLossName;
}

- (void)setTrainFunctionLossName:(id)a3
{
}

- (NSString)trainFunctionLossName
{
  return self->_trainFunctionLossName;
}

- (void)setExecutionState:(id)a3
{
}

- (MLFeatureProvider)executionState
{
  return self->_executionState;
}

- (void)setFunctionNameToOutputLayersNames:(id)a3
{
}

- (NSDictionary)functionNameToOutputLayersNames
{
  return self->_functionNameToOutputLayersNames;
}

- (void)setFunctionNameToInputLayersNames:(id)a3
{
}

- (NSDictionary)functionNameToInputLayersNames
{
  return self->_functionNameToInputLayersNames;
}

- (MLProgramContext)initWithExecutionState:(id)a3 functionNameToStateMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLProgramContext;
  v9 = [(MLProgramContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_executionState, a3);
    objc_storeStrong((id *)&v10->_functionNameToStateMap, a4);
  }

  return v10;
}

@end