@interface PHASESpatialPipelineEntry
- (NSMutableDictionary)tweakParams;
- (PHASENumberMetaParameterDefinition)sendLevelMetaParameterDefinition;
- (PHASESpatialPipelineEntry)init;
- (double)sendLevel;
- (void)setSendLevel:(double)sendLevel;
- (void)setSendLevelMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)sendLevelMetaParameterDefinition;
- (void)setTweakParameterWithMetaParameterDefinition:(id)a3 identifier:(id)a4;
- (void)setTweakParameterWithValue:(double)a3 identifier:(id)a4;
- (void)setTweakParams:(id)a3;
@end

@implementation PHASESpatialPipelineEntry

- (PHASESpatialPipelineEntry)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHASESpatialPipelineEntry;
  v2 = [(PHASESpatialPipelineEntry *)&v8 init];
  v3 = v2;
  if (v2)
  {
    sendLevelMetaParameterDefinition = v2->_sendLevelMetaParameterDefinition;
    v2->_sendLevel = 1.0;
    v2->_sendLevelMetaParameterDefinition = 0;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    tweakParams = v3->_tweakParams;
    v3->_tweakParams = v5;
  }
  return v3;
}

- (void)setSendLevel:(double)sendLevel
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_sendLevel = PHASEGetPropertyBounded<double>(v8, v7, sendLevel, 0.0, 1.0);
}

- (void)setTweakParameterWithValue:(double)a3 identifier:(id)a4
{
  id v7 = a4;
  v6 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_tweakParams setObject:v6 forKeyedSubscript:v7];
}

- (void)setTweakParameterWithMetaParameterDefinition:(id)a3 identifier:(id)a4
{
}

- (double)sendLevel
{
  return self->_sendLevel;
}

- (PHASENumberMetaParameterDefinition)sendLevelMetaParameterDefinition
{
  return self->_sendLevelMetaParameterDefinition;
}

- (void)setSendLevelMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)sendLevelMetaParameterDefinition
{
}

- (NSMutableDictionary)tweakParams
{
  return self->_tweakParams;
}

- (void)setTweakParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tweakParams, 0);

  objc_storeStrong((id *)&self->_sendLevelMetaParameterDefinition, 0);
}

@end