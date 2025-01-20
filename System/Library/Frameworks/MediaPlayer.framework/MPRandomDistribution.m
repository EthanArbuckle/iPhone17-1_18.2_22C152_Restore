@interface MPRandomDistribution
+ (BOOL)supportsSecureCoding;
- (MPRandomDistribution)init;
- (MPRandomDistribution)initWithCoder:(id)a3;
- (MPRandomDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5;
- (int64_t)highestValue;
- (int64_t)lowestValue;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
- (unint64_t)numberOfPossibleOutcomes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPRandomDistribution

- (void).cxx_destruct
{
}

- (unint64_t)numberOfPossibleOutcomes
{
  return self->_numberOfPossibleOutcomes;
}

- (int64_t)highestValue
{
  return self->_highestValue;
}

- (int64_t)lowestValue
{
  return self->_lowestValue;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  int64_t lowestValue = self->_lowestValue;
  unint64_t v4 = lowestValue & ~(lowestValue >> 63);
  if (v4 > a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v16[0] = @"lowestInclusive";
    v11 = [NSNumber numberWithInteger:lowestValue];
    v17[0] = v11;
    v16[1] = @"highestInclusive";
    v12 = [NSNumber numberWithInteger:self->_highestValue];
    v17[1] = v12;
    v16[2] = @"upper";
    v13 = [NSNumber numberWithUnsignedInteger:a3];
    v17[2] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    id v15 = [v7 exceptionWithName:v8 reason:@"upper bound provided is less than lowestInclusive" userInfo:v14];

    objc_exception_throw(v15);
  }
  unint64_t v5 = self->_highestValue & ~(self->_highestValue >> 63);
  if (v5 >= a3 - 1) {
    unint64_t v5 = a3 - 1;
  }
  return [(MPRandom *)self->_source nextIntWithUpperBound:v5 - lowestValue + 1] + v4;
}

- (void)encodeWithCoder:(id)a3
{
  source = self->_source;
  id v5 = a3;
  [v5 encodeObject:source forKey:@"source"];
  [v5 encodeInteger:self->_lowestValue forKey:@"lowest"];
  [v5 encodeInteger:self->_highestValue forKey:@"highest"];
}

- (MPRandomDistribution)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"lowest"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"highest"];

  uint64_t v8 = [(MPRandomDistribution *)self initWithRandomSource:v5 lowestValue:v6 highestValue:v7];
  return v8;
}

- (MPRandomDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPRandomDistribution;
  v10 = [(MPRandomDistribution *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_source, a3);
    v11->_int64_t lowestValue = a4;
    v11->_highestValue = a5;
  }

  return v11;
}

- (MPRandomDistribution)init
{
  v3 = objc_alloc_init(MPARC4RandomSource);
  id v4 = [(MPRandomDistribution *)self initWithRandomSource:v3 lowestValue:0 highestValue:0];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end