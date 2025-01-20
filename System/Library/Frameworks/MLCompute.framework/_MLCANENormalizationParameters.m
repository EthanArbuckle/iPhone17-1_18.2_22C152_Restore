@interface _MLCANENormalizationParameters
+ (id)normalizationUnitParametersWith:(id)a3 gocParams:(id)a4 neuronParams:(id)a5;
- (NSArray)neuronParams;
- (NSDictionary)gocParams;
- (NSDictionary)normalizationParams;
- (_MLCANENormalizationParameters)initWithNormalizationParams:(id)a3 gocParams:(id)a4 neuronParams:(id)a5;
@end

@implementation _MLCANENormalizationParameters

+ (id)normalizationUnitParametersWith:(id)a3 gocParams:(id)a4 neuronParams:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithNormalizationParams:v10 gocParams:v9 neuronParams:v8];

  return v11;
}

- (_MLCANENormalizationParameters)initWithNormalizationParams:(id)a3 gocParams:(id)a4 neuronParams:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MLCANENormalizationParameters;
  v12 = [(_MLCANENormalizationParameters *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_normalizationParams, a3);
    objc_storeStrong((id *)&v13->_gocParams, a4);
    objc_storeStrong((id *)&v13->_neuronParams, a5);
  }

  return v13;
}

- (NSDictionary)normalizationParams
{
  return self->_normalizationParams;
}

- (NSDictionary)gocParams
{
  return self->_gocParams;
}

- (NSArray)neuronParams
{
  return self->_neuronParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neuronParams, 0);
  objc_storeStrong((id *)&self->_gocParams, 0);

  objc_storeStrong((id *)&self->_normalizationParams, 0);
}

@end