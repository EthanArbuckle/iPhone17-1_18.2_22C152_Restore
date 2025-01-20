@interface _MLCANEUpsampleParameters
+ (id)upsampleUnitParametersWith:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5;
- (NSDictionary)upsampleParams;
- (_MLCANEUpsampleParameters)initWithUpsampleParams:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5;
- (float)scaleFactorX;
- (float)scaleFactorY;
@end

@implementation _MLCANEUpsampleParameters

+ (id)upsampleUnitParametersWith:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5
{
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  v12 = (void *)[v9 initWithUpsampleParams:v8 scaleFactorX:v10 scaleFactorY:v11];

  return v12;
}

- (_MLCANEUpsampleParameters)initWithUpsampleParams:(id)a3 scaleFactorX:(float)a4 scaleFactorY:(float)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MLCANEUpsampleParameters;
  double v10 = [(_MLCANEUpsampleParameters *)&v13 init];
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_upsampleParams, a3);
    v11->_scaleFactorX = a4;
    v11->_scaleFactorY = a5;
  }

  return v11;
}

- (NSDictionary)upsampleParams
{
  return self->_upsampleParams;
}

- (float)scaleFactorX
{
  return self->_scaleFactorX;
}

- (float)scaleFactorY
{
  return self->_scaleFactorY;
}

- (void).cxx_destruct
{
}

@end