@interface OutputDefinition
- (BOOL)isValid;
- (NSArray)modifiers;
- (NSArray)nativePostprocessingOperations;
- (NSNumber)modelTopN;
- (NSNumber)scoreThresholdAsMultipleOfRandomScore;
- (NSString)mode;
- (NSString)modelOutputName;
- (NSString)remapDictionaryId;
- (OutputDefinition)initWithOutputDefinitionDictionary:(id)a3;
- (void)setMode:(id)a3;
- (void)setModelOutputName:(id)a3;
- (void)setModelTopN:(id)a3;
- (void)setModifiers:(id)a3;
- (void)setNativePostprocessingOperations:(id)a3;
- (void)setRemapDictionaryId:(id)a3;
- (void)setScoreThresholdAsMultipleOfRandomScore:(id)a3;
@end

@implementation OutputDefinition

- (OutputDefinition)initWithOutputDefinitionDictionary:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v15;
  v15 = 0;
  v13.receiver = v3;
  v13.super_class = (Class)OutputDefinition;
  v15 = [(OutputDefinition *)&v13 init];
  objc_storeStrong((id *)&v15, v15);
  id v5 = (id)[location[0] objectForKey:@"model_output_name"];
  -[OutputDefinition setModelOutputName:](v15, "setModelOutputName:");

  id v6 = (id)[location[0] objectForKey:@"mode"];
  -[OutputDefinition setMode:](v15, "setMode:");

  id v7 = (id)[location[0] objectForKey:@"model_top_n"];
  -[OutputDefinition setModelTopN:](v15, "setModelTopN:");

  id v8 = (id)[location[0] objectForKey:@"remap_dictionary_id"];
  -[OutputDefinition setRemapDictionaryId:](v15, "setRemapDictionaryId:");

  id v9 = (id)[location[0] objectForKey:@"score_threshold_as_multiple_of_random_score"];
  -[OutputDefinition setScoreThresholdAsMultipleOfRandomScore:](v15, "setScoreThresholdAsMultipleOfRandomScore:");

  id v10 = (id)[location[0] objectForKey:@"modifiers"];
  -[OutputDefinition setModifiers:](v15, "setModifiers:");

  id v11 = (id)[location[0] objectForKey:@"native_postprocessing_operators"];
  -[OutputDefinition setNativePostprocessingOperations:](v15, "setNativePostprocessingOperations:");

  v12 = v15;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v12;
}

- (BOOL)isValid
{
  v2 = [(OutputDefinition *)self modelOutputName];
  BOOL v4 = v2 != 0;

  return v4;
}

- (NSString)modelOutputName
{
  return self->_modelOutputName;
}

- (void)setModelOutputName:(id)a3
{
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (NSNumber)modelTopN
{
  return self->_modelTopN;
}

- (void)setModelTopN:(id)a3
{
}

- (NSArray)modifiers
{
  return self->_modifiers;
}

- (void)setModifiers:(id)a3
{
}

- (NSString)remapDictionaryId
{
  return self->_remapDictionaryId;
}

- (void)setRemapDictionaryId:(id)a3
{
}

- (NSNumber)scoreThresholdAsMultipleOfRandomScore
{
  return self->_scoreThresholdAsMultipleOfRandomScore;
}

- (void)setScoreThresholdAsMultipleOfRandomScore:(id)a3
{
}

- (NSArray)nativePostprocessingOperations
{
  return self->_nativePostprocessingOperations;
}

- (void)setNativePostprocessingOperations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end