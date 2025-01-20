@interface _MLCANEArithmeticParameters
+ (id)arithmeticUnitParametersWith:(id)a3;
- (NSArray)arithmeticParams;
- (_MLCANEArithmeticParameters)initWithArithmeticParams:(id)a3;
@end

@implementation _MLCANEArithmeticParameters

+ (id)arithmeticUnitParametersWith:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithArithmeticParams:v4];

  return v5;
}

- (_MLCANEArithmeticParameters)initWithArithmeticParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANEArithmeticParameters;
  v6 = [(_MLCANEArithmeticParameters *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_arithmeticParams, a3);
  }

  return v7;
}

- (NSArray)arithmeticParams
{
  return self->_arithmeticParams;
}

- (void).cxx_destruct
{
}

@end