@interface _DPRandomBitPositionGenerator
+ (_DPRandomBitPositionGenerator)generatorWithDimensionality:(unint64_t)a3;
- (_DPRandomBitPositionGenerator)init;
- (_DPRandomBitPositionGenerator)initWithDimensionality:(unint64_t)a3;
- (id)description;
- (unint64_t)m;
- (unint64_t)sample;
@end

@implementation _DPRandomBitPositionGenerator

- (_DPRandomBitPositionGenerator)init
{
  return 0;
}

- (_DPRandomBitPositionGenerator)initWithDimensionality:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_DPRandomBitPositionGenerator;
  result = [(_DPRandomBitPositionGenerator *)&v5 init];
  if (result) {
    result->_m = a3;
  }
  return result;
}

+ (_DPRandomBitPositionGenerator)generatorWithDimensionality:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDimensionality:a3];
  return (_DPRandomBitPositionGenerator *)v3;
}

- (unint64_t)sample
{
  return (unint64_t)(uniformRandomProbabilityExcludingOne() * (double)self->_m);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: { m=%ld }", v5, self->_m];

  return v6;
}

- (unint64_t)m
{
  return self->_m;
}

@end