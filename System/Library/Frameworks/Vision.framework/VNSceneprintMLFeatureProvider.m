@interface VNSceneprintMLFeatureProvider
- (NSSet)featureNames;
- (VNSceneprintMLFeatureProvider)initWithSceneprint:(id)a3 dataType:(int64_t)a4 forKey:(id)a5 originalFeatureProvider:(id)a6;
- (id)featureValueForName:(id)a3;
@end

@implementation VNSceneprintMLFeatureProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFeatureProvider, 0);
  objc_storeStrong((id *)&self->_sceneprintKey, 0);

  objc_storeStrong((id *)&self->_sceneprint, 0);
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:self->_sceneprintKey])
  {
    sceneprint = self->_sceneprint;
    int64_t sceneprintDataType = self->_sceneprintDataType;
    id v19 = 0;
    v7 = [(VNEspressoModelImageprint *)sceneprint VNEspressoModelImageprintOneDimensionMLMultiArrayWithDataType:sceneprintDataType error:&v19];
    id v8 = v19;
    if (v7)
    {
      v9 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v7];
    }
    else
    {
      uint64_t v10 = [v4 UTF8String];
      id v11 = [v8 localizedDescription];
      [v11 UTF8String];
      VNValidatedLog(4, @"Unable to obtain data array %s - %s", v12, v13, v14, v15, v16, v17, v10);

      v9 = 0;
    }
  }
  else
  {
    v9 = [(MLFeatureProvider *)self->_originalFeatureProvider featureValueForName:v4];
  }

  return v9;
}

- (NSSet)featureNames
{
  v3 = [MEMORY[0x1E4F1CA80] setWithObject:self->_sceneprintKey];
  originalFeatureProvider = self->_originalFeatureProvider;
  if (originalFeatureProvider)
  {
    v5 = [(MLFeatureProvider *)originalFeatureProvider featureNames];
    [v3 unionSet:v5];
  }

  return (NSSet *)v3;
}

- (VNSceneprintMLFeatureProvider)initWithSceneprint:(id)a3 dataType:(int64_t)a4 forKey:(id)a5 originalFeatureProvider:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VNSceneprintMLFeatureProvider;
  uint64_t v14 = [(VNSceneprintMLFeatureProvider *)&v19 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sceneprint, a3);
    uint64_t v16 = [v12 copy];
    sceneprintKey = v15->_sceneprintKey;
    v15->_sceneprintKey = (NSString *)v16;

    v15->_int64_t sceneprintDataType = a4;
    objc_storeStrong((id *)&v15->_originalFeatureProvider, a6);
  }

  return v15;
}

@end