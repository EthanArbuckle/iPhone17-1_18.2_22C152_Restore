@interface GKLinearCongruentialRandomSource
+ (BOOL)supportsSecureCoding;
- (BOOL)nextBool;
- (GKLinearCongruentialRandomSource)init;
- (GKLinearCongruentialRandomSource)initWithCoder:(id)a3;
- (GKLinearCongruentialRandomSource)initWithSeed:(uint64_t)seed;
- (float)nextUniform;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)nextInt;
- (uint64_t)seed;
- (unint64_t)nextBits:(int)a3;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSeed:(uint64_t)seed;
@end

@implementation GKLinearCongruentialRandomSource

- (GKLinearCongruentialRandomSource)init
{
  uint64_t bytes = 0;
  if (SecRandomCopyBytes(0, 8uLL, &bytes))
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"failed to generate secure random bytes" userInfo:MEMORY[0x263EFFA78]];
    objc_exception_throw(v4);
  }
  return [(GKLinearCongruentialRandomSource *)self initWithSeed:bytes];
}

- (GKLinearCongruentialRandomSource)initWithSeed:(uint64_t)seed
{
  v5.receiver = self;
  v5.super_class = (Class)GKLinearCongruentialRandomSource;
  result = [(GKRandomSource *)&v5 init];
  if (result) {
    result->_seed = seed;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t seed = self->_seed;

  return (id)[v4 initWithSeed:seed];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKLinearCongruentialRandomSource)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(GKLinearCongruentialRandomSource *)self init];
  if (v5) {
    v5->_unint64_t seed = [v4 decodeInt64ForKey:@"seed"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)GKLinearCongruentialRandomSource;
  [(GKRandomSource *)&v5 encodeWithCoder:v4];
  [v4 encodeInt64:self->_seed forKey:@"seed"];
}

- (uint64_t)seed
{
  return self->_seed;
}

- (void)setSeed:(uint64_t)seed
{
  self->_unint64_t seed = seed;
}

- (unint64_t)nextBits:(int)a3
{
  unint64_t result = (0x5DEECE66DLL * self->_seed + 11) & 0xFFFFFFFFFFFFLL;
  self->_unint64_t seed = result;
  if (a3 < 1) {
    return 0;
  }
  if (a3 <= 0x30) {
    result >>= 48 - a3;
  }
  return result;
}

- (int64_t)nextInt
{
  return (int)[(GKLinearCongruentialRandomSource *)self nextBits:32];
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  unint64_t v5 = a3 - 1;
  if ((a3 & (a3 - 1)) == 0) {
    return ([(GKLinearCongruentialRandomSource *)self nextBits:32] * a3) >> 32;
  }
  do
  {
    unint64_t v7 = [(GKLinearCongruentialRandomSource *)self nextBits:32];
    unint64_t result = v7 % a3;
  }
  while (v5 + v7 < v7 % a3);
  return result;
}

- (float)nextUniform
{
  return (float)[(GKLinearCongruentialRandomSource *)self nextBits:24] * 0.000000059605;
}

- (BOOL)nextBool
{
  return [(GKLinearCongruentialRandomSource *)self nextBits:1] != 0;
}

@end