@interface _MLCANEConcatParameters
+ (id)concatUnitParametersWith:(id)a3;
- (NSDictionary)concatParams;
- (_MLCANEConcatParameters)initWithConcatParams:(id)a3;
@end

@implementation _MLCANEConcatParameters

+ (id)concatUnitParametersWith:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithConcatParams:v4];

  return v5;
}

- (_MLCANEConcatParameters)initWithConcatParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANEConcatParameters;
  v6 = [(_MLCANEConcatParameters *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_concatParams, a3);
  }

  return v7;
}

- (NSDictionary)concatParams
{
  return self->_concatParams;
}

- (void).cxx_destruct
{
}

@end