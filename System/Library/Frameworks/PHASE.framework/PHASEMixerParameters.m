@interface PHASEMixerParameters
- (NSDictionary)parameterDictionary;
- (PHASEMixerParameters)init;
- (void)addAmbientMixerParametersWithIdentifier:(NSString *)identifier listener:(PHASEListener *)listener;
- (void)addSpatialMixerParametersWithIdentifier:(NSString *)identifier source:(PHASESource *)source listener:(PHASEListener *)listener;
@end

@implementation PHASEMixerParameters

- (PHASEMixerParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHASEMixerParameters;
  v2 = [(PHASEMixerParameters *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    parameters = v2->_parameters;
    v2->_parameters = v3;
  }
  return v2;
}

- (void)addSpatialMixerParametersWithIdentifier:(NSString *)identifier source:(PHASESource *)source listener:(PHASEListener *)listener
{
  v11 = identifier;
  v8 = source;
  v9 = listener;
  v10 = objc_alloc_init(PHASEMixerParameterEntry);
  [(PHASEMixerParameterEntry *)v10 setSource:v8];
  [(PHASEMixerParameterEntry *)v10 setListener:v9];
  [(PHASEMixerParameterEntry *)v10 setMixerType:1];
  [(NSMutableDictionary *)self->_parameters setObject:v10 forKey:v11];
}

- (void)addAmbientMixerParametersWithIdentifier:(NSString *)identifier listener:(PHASEListener *)listener
{
  v8 = identifier;
  objc_super v6 = listener;
  v7 = objc_alloc_init(PHASEMixerParameterEntry);
  [(PHASEMixerParameterEntry *)v7 setSource:0];
  [(PHASEMixerParameterEntry *)v7 setListener:v6];
  [(PHASEMixerParameterEntry *)v7 setMixerType:2];
  [(NSMutableDictionary *)self->_parameters setObject:v7 forKey:v8];
}

- (NSDictionary)parameterDictionary
{
  return (NSDictionary *)[NSDictionary dictionaryWithDictionary:self->_parameters];
}

- (void).cxx_destruct
{
}

@end