@interface TKTokenKeyAlgorithm
- (BOOL)isAlgorithm:(SecKeyAlgorithm)algorithm;
- (BOOL)supportsAlgorithm:(SecKeyAlgorithm)algorithm;
- (TKTokenKeyAlgorithm)initWithAlgorithmsArray:(id)a3;
@end

@implementation TKTokenKeyAlgorithm

- (TKTokenKeyAlgorithm)initWithAlgorithmsArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKTokenKeyAlgorithm;
  v6 = [(TKTokenKeyAlgorithm *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_algorithms, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![(NSArray *)v7->_algorithms count])
    {

      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isAlgorithm:(SecKeyAlgorithm)algorithm
{
  v4 = [(NSArray *)self->_algorithms lastObject];
  LOBYTE(algorithm) = [v4 isEqual:algorithm];

  return (char)algorithm;
}

- (BOOL)supportsAlgorithm:(SecKeyAlgorithm)algorithm
{
  return [(NSArray *)self->_algorithms indexOfObject:algorithm] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
}

@end