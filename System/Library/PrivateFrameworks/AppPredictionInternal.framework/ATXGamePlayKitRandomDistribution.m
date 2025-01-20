@interface ATXGamePlayKitRandomDistribution
+ (id)d20;
+ (id)d6;
+ (id)distributionForDieWithSideCount:(int64_t)a3;
+ (id)distributionWithLowestValue:(int64_t)a3 highestValue:(int64_t)a4;
- (ATXGamePlayKitRandomDistribution)init;
- (ATXGamePlayKitRandomDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5;
- (BOOL)nextBool;
- (float)nextUniform;
- (int64_t)highestValue;
- (int64_t)lowestValue;
- (int64_t)nextInt;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
- (unint64_t)numberOfPossibleOutcomes;
@end

@implementation ATXGamePlayKitRandomDistribution

- (ATXGamePlayKitRandomDistribution)init
{
  v3 = +[ATXGamePlayKitRandomSource sharedRandom];
  v4 = [(ATXGamePlayKitRandomDistribution *)self initWithRandomSource:v3 lowestValue:0 highestValue:0];

  return v4;
}

- (ATXGamePlayKitRandomDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXGamePlayKitRandomDistribution;
  v10 = [(ATXGamePlayKitRandomDistribution *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_source, a3);
    v11->_lowest = a4;
    v11->_highest = a5;
  }

  return v11;
}

- (unint64_t)numberOfPossibleOutcomes
{
  return self->_highest - self->_lowest + 1;
}

- (int64_t)nextInt
{
  int64_t lowest = self->_lowest;
  return [(ATXGamePlayKitRandom *)self->_source nextIntWithUpperBound:self->_highest - lowest + 1]+ lowest;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  int64_t lowest = self->_lowest;
  unint64_t v6 = lowest & ~(lowest >> 63);
  if (v6 > a3)
  {
    id v9 = (void *)MEMORY[0x1E4F1CA00];
    v15[0] = @"lowestInclusive";
    v10 = objc_msgSend(NSNumber, "numberWithInteger:");
    v16[0] = v10;
    v15[1] = @"highestInclusive";
    v11 = [NSNumber numberWithInteger:self->_highest];
    v16[1] = v11;
    v15[2] = @"upper";
    v12 = [NSNumber numberWithUnsignedInteger:a3];
    v16[2] = v12;
    objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    id v14 = [v9 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"upper bound provided is less than lowestInclusive" userInfo:v13];

    objc_exception_throw(v14);
  }
  unint64_t v7 = self->_highest & ~(self->_highest >> 63);
  if (v7 >= a3 - 1) {
    unint64_t v7 = a3 - 1;
  }
  return [(ATXGamePlayKitRandom *)self->_source nextIntWithUpperBound:v7 - lowest + 1] + v6;
}

- (float)nextUniform
{
  return (float)[(ATXGamePlayKitRandomDistribution *)self nextInt] / (float)self->_highest;
}

- (BOOL)nextBool
{
  return [(ATXGamePlayKitRandom *)self->_source nextBool];
}

+ (id)distributionWithLowestValue:(int64_t)a3 highestValue:(int64_t)a4
{
  unint64_t v7 = objc_opt_new();
  v8 = (void *)[objc_alloc((Class)a1) initWithRandomSource:v7 lowestValue:a3 highestValue:a4];

  return v8;
}

+ (id)distributionForDieWithSideCount:(int64_t)a3
{
  v5 = objc_opt_new();
  unint64_t v6 = (void *)[objc_alloc((Class)a1) initWithRandomSource:v5 lowestValue:1 highestValue:a3];

  return v6;
}

+ (id)d6
{
  v3 = objc_opt_new();
  v4 = (void *)[objc_alloc((Class)a1) initWithRandomSource:v3 lowestValue:1 highestValue:6];

  return v4;
}

+ (id)d20
{
  v3 = objc_opt_new();
  v4 = (void *)[objc_alloc((Class)a1) initWithRandomSource:v3 lowestValue:1 highestValue:20];

  return v4;
}

- (int64_t)lowestValue
{
  return self->_lowest;
}

- (int64_t)highestValue
{
  return self->_highest;
}

- (void).cxx_destruct
{
}

@end