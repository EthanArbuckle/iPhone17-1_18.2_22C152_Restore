@interface BWLearnedNRInferenceConfiguration
- (BWLearnedNRInferenceConfiguration)initWithMetalCommandQueue:(id)a3 sensorConfigurationsByPortType:(id)a4 inferenceType:(int)a5 outputVideoRequirements:(id)a6;
- (NSArray)outputVideoRequirements;
- (NSDictionary)sensorConfigurationsByPortType;
- (id)outputAttachedMediaKeyForInputDimensions:(id)a3;
- (void)dealloc;
@end

@implementation BWLearnedNRInferenceConfiguration

- (BWLearnedNRInferenceConfiguration)initWithMetalCommandQueue:(id)a3 sensorConfigurationsByPortType:(id)a4 inferenceType:(int)a5 outputVideoRequirements:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)BWLearnedNRInferenceConfiguration;
  v8 = [(BWTiledEspressoInferenceConfiguration *)&v10 initWithInferenceType:*(void *)&a5 metalCommandQueue:a3];
  if (v8)
  {
    v8->_sensorConfigurationsByPortType = (NSDictionary *)a4;
    v8->_outputVideoRequirements = (NSArray *)a6;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWLearnedNRInferenceConfiguration;
  [(BWTiledEspressoInferenceConfiguration *)&v3 dealloc];
}

- (id)outputAttachedMediaKeyForInputDimensions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  id result = (id)[(NSArray *)outputVideoRequirements countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v13;
    uint64_t var0 = a3.var0;
    uint64_t v9 = *(uint64_t *)&a3 >> 32;
    while (2)
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(outputVideoRequirements);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "width") == var0
          && objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "height") == v9)
        {
          return (id)[v11 attachedMediaKey];
        }
        objc_super v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      id result = (id)[(NSArray *)outputVideoRequirements countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSDictionary)sensorConfigurationsByPortType
{
  return self->_sensorConfigurationsByPortType;
}

- (NSArray)outputVideoRequirements
{
  return self->_outputVideoRequirements;
}

@end