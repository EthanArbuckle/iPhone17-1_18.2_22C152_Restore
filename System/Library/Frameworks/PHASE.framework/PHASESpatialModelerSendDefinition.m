@interface PHASESpatialModelerSendDefinition
+ (id)new;
- (NSMutableDictionary)tweakParams;
- (PHASENumberMetaParameterDefinition)sendMetaParameterDefinition;
- (PHASESpatialModelerSendDefinition)init;
- (PHASESpatialModelerSendDefinition)initWithSpatialModelerType:(int64_t)a3;
- (PHASESpatialModelerSendDefinition)initWithSpatialModelerType:(int64_t)a3 uid:(id)a4;
- (double)sendLevel;
- (int64_t)spatialModelerType;
- (void)setSendLevel:(double)a3;
- (void)setSendMetaParameterDefinition:(id)a3;
- (void)setTweakParameterWithMetaParameterDefinition:(id)a3 uid:(id)a4;
- (void)setTweakParameterWithValue:(double)a3 uid:(id)a4;
- (void)setTweakParams:(id)a3;
@end

@implementation PHASESpatialModelerSendDefinition

- (PHASESpatialModelerSendDefinition)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASESpatialModelerSendDefinition)initWithSpatialModelerType:(int64_t)a3 uid:(id)a4
{
  id v6 = a4;
  v7 = [(PHASESpatialModelerSendDefinition *)self initWithSpatialModelerType:a3];
  v8 = v7;
  if (v7)
  {
    [(PHASEDefinition *)v7 setIdentifier:v6];
    v9 = v8;
  }

  return v8;
}

- (PHASESpatialModelerSendDefinition)initWithSpatialModelerType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PHASESpatialModelerSendDefinition;
  v4 = [(PHASEDefinition *)&v11 initInternal];
  v5 = v4;
  if (v4)
  {
    v4->_spatialModelerType = a3;
    v4->_sendLevel = 1.0;
    sendMetaParameterDefinition = v4->_sendMetaParameterDefinition;
    v4->_sendMetaParameterDefinition = 0;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    tweakParams = v5->_tweakParams;
    v5->_tweakParams = v7;

    v9 = v5;
  }

  return v5;
}

- (void)setSendLevel:(double)a3
{
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_sendLevel = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.0);
}

- (void)setTweakParameterWithValue:(double)a3 uid:(id)a4
{
  id v7 = a4;
  id v6 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_tweakParams setObject:v6 forKeyedSubscript:v7];
}

- (void)setTweakParameterWithMetaParameterDefinition:(id)a3 uid:(id)a4
{
}

- (int64_t)spatialModelerType
{
  return self->_spatialModelerType;
}

- (double)sendLevel
{
  return self->_sendLevel;
}

- (PHASENumberMetaParameterDefinition)sendMetaParameterDefinition
{
  return self->_sendMetaParameterDefinition;
}

- (void)setSendMetaParameterDefinition:(id)a3
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

  objc_storeStrong((id *)&self->_sendMetaParameterDefinition, 0);
}

@end