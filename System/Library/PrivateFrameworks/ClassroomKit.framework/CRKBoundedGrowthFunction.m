@interface CRKBoundedGrowthFunction
- (CRKBoundedGrowthFunction)initWithGrowthFunction:(id)a3 lowerBound:(double)a4 upperBound:(double)a5;
- (CRKGrowthFunction)growthFunction;
- (double)evaluateWithValue:(double)a3;
- (double)lowerBound;
- (double)upperBound;
@end

@implementation CRKBoundedGrowthFunction

- (CRKBoundedGrowthFunction)initWithGrowthFunction:(id)a3 lowerBound:(double)a4 upperBound:(double)a5
{
  id v10 = a3;
  if (!v10)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CRKBoundedGrowthFunction.m", 22, @"Invalid parameter not satisfying: %@", @"growthFunction" object file lineNumber description];
  }
  if (a4 > a5)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"CRKBoundedGrowthFunction.m" lineNumber:23 description:@"Must provide a valud interval for the growth function"];
  }
  v16.receiver = self;
  v16.super_class = (Class)CRKBoundedGrowthFunction;
  v11 = [(CRKBoundedGrowthFunction *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_growthFunction, a3);
    v12->_lowerBound = a4;
    v12->_upperBound = a5;
  }

  return v12;
}

- (double)evaluateWithValue:(double)a3
{
  v5 = [(CRKBoundedGrowthFunction *)self growthFunction];
  [v5 evaluateWithValue:a3];
  double v7 = v6;

  [(CRKBoundedGrowthFunction *)self lowerBound];
  if (v8 >= v7) {
    double v7 = v8;
  }
  [(CRKBoundedGrowthFunction *)self upperBound];
  if (v7 < result) {
    return v7;
  }
  return result;
}

- (CRKGrowthFunction)growthFunction
{
  return self->_growthFunction;
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void).cxx_destruct
{
}

@end