@interface _MLCANETransposeParameters
+ (id)transposeUnitParametersWith:(id)a3;
- (NSDictionary)transposeParams;
- (_MLCANETransposeParameters)initWithTransposeParams:(id)a3;
@end

@implementation _MLCANETransposeParameters

+ (id)transposeUnitParametersWith:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTransposeParams:v4];

  return v5;
}

- (_MLCANETransposeParameters)initWithTransposeParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANETransposeParameters;
  v6 = [(_MLCANETransposeParameters *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transposeParams, a3);
  }

  return v7;
}

- (NSDictionary)transposeParams
{
  return self->_transposeParams;
}

- (void).cxx_destruct
{
}

@end