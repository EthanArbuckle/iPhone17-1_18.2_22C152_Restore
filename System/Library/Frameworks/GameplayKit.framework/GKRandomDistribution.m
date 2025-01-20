@interface GKRandomDistribution
+ (GKRandomDistribution)d20;
+ (GKRandomDistribution)d6;
+ (GKRandomDistribution)distributionForDieWithSideCount:(NSInteger)sideCount;
+ (GKRandomDistribution)distributionWithLowestValue:(NSInteger)lowestInclusive highestValue:(NSInteger)highestInclusive;
- (BOOL)nextBool;
- (GKRandomDistribution)init;
- (GKRandomDistribution)initWithRandomSource:(id)source lowestValue:(NSInteger)lowestInclusive highestValue:(NSInteger)highestInclusive;
- (NSInteger)highestValue;
- (NSInteger)lowestValue;
- (NSInteger)nextInt;
- (NSUInteger)nextIntWithUpperBound:(NSUInteger)upperBound;
- (NSUInteger)numberOfPossibleOutcomes;
- (float)nextUniform;
@end

@implementation GKRandomDistribution

- (GKRandomDistribution)init
{
  v3 = +[GKRandomSource sharedRandom];
  v4 = [(GKRandomDistribution *)self initWithRandomSource:v3 lowestValue:0 highestValue:0];

  return v4;
}

- (GKRandomDistribution)initWithRandomSource:(id)source lowestValue:(NSInteger)lowestInclusive highestValue:(NSInteger)highestInclusive
{
  id v9 = source;
  v13.receiver = self;
  v13.super_class = (Class)GKRandomDistribution;
  v10 = [(GKRandomDistribution *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_source, source);
    v11->_lowest = lowestInclusive;
    v11->_highest = highestInclusive;
  }

  return v11;
}

- (NSUInteger)numberOfPossibleOutcomes
{
  return self->_highest - self->_lowest + 1;
}

- (NSInteger)nextInt
{
  int64_t lowest = self->_lowest;
  return [(GKRandom *)self->_source nextIntWithUpperBound:self->_highest - lowest + 1]
       + lowest;
}

- (NSUInteger)nextIntWithUpperBound:(NSUInteger)upperBound
{
  v17[3] = *MEMORY[0x263EF8340];
  int64_t lowest = self->_lowest;
  NSUInteger v4 = lowest & ~(lowest >> 63);
  if (v4 > upperBound)
  {
    v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    v16[0] = @"lowestInclusive";
    v11 = [NSNumber numberWithInteger:lowest];
    v17[0] = v11;
    v16[1] = @"highestInclusive";
    v12 = [NSNumber numberWithInteger:self->_highest];
    v17[1] = v12;
    v16[2] = @"upper";
    objc_super v13 = [NSNumber numberWithUnsignedInteger:upperBound];
    v17[2] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    id v15 = [v7 exceptionWithName:v8 reason:@"upper bound provided is less than lowestInclusive" userInfo:v14];

    objc_exception_throw(v15);
  }
  unint64_t v5 = self->_highest & ~(self->_highest >> 63);
  if (v5 >= upperBound - 1) {
    unint64_t v5 = upperBound - 1;
  }
  return [(GKRandom *)self->_source nextIntWithUpperBound:v5 - lowest + 1] + v4;
}

- (float)nextUniform
{
  return (float)[(GKRandomDistribution *)self nextInt] / (float)self->_highest;
}

- (BOOL)nextBool
{
  return [(GKRandom *)self->_source nextBool];
}

+ (GKRandomDistribution)distributionWithLowestValue:(NSInteger)lowestInclusive highestValue:(NSInteger)highestInclusive
{
  v7 = objc_opt_new();
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithRandomSource:v7 lowestValue:lowestInclusive highestValue:highestInclusive];

  return (GKRandomDistribution *)v8;
}

+ (GKRandomDistribution)distributionForDieWithSideCount:(NSInteger)sideCount
{
  unint64_t v5 = objc_opt_new();
  v6 = (void *)[objc_alloc((Class)a1) initWithRandomSource:v5 lowestValue:1 highestValue:sideCount];

  return (GKRandomDistribution *)v6;
}

+ (GKRandomDistribution)d6
{
  v3 = objc_opt_new();
  NSUInteger v4 = (void *)[objc_alloc((Class)a1) initWithRandomSource:v3 lowestValue:1 highestValue:6];

  return (GKRandomDistribution *)v4;
}

+ (GKRandomDistribution)d20
{
  v3 = objc_opt_new();
  NSUInteger v4 = (void *)[objc_alloc((Class)a1) initWithRandomSource:v3 lowestValue:1 highestValue:20];

  return (GKRandomDistribution *)v4;
}

- (NSInteger)lowestValue
{
  return self->_lowest;
}

- (NSInteger)highestValue
{
  return self->_highest;
}

- (void).cxx_destruct
{
}

@end