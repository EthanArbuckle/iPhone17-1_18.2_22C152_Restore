@interface _DPUniformNoiseGenerator
+ (id)generatorWithValueRange:(id)a3;
- (_DPUniformNoiseGenerator)init;
- (_DPUniformNoiseGenerator)initWithValueRange:(id)a3;
- (double)minValue;
- (double)range;
- (double)sample;
- (id)description;
@end

@implementation _DPUniformNoiseGenerator

- (_DPUniformNoiseGenerator)init
{
  return 0;
}

- (_DPUniformNoiseGenerator)initWithValueRange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DPUniformNoiseGenerator;
  v5 = [(_DPUniformNoiseGenerator *)&v11 init];
  if (v5)
  {
    v6 = [v4 minPossible];
    [v6 doubleValue];
    v5->_minValue = v7;

    v8 = [v4 range];
    [v8 doubleValue];
    v5->_range = v9;
  }
  return v5;
}

+ (id)generatorWithValueRange:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithValueRange:v4];

  return v5;
}

- (double)sample
{
  return uniformRandomProbability() * self->_range - fabs(self->_minValue);
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { minValue=%.16g ; range=%.16g }",
    v5,
    *(void *)&self->_minValue,
  v6 = *(void *)&self->_range);

  return v6;
}

- (double)minValue
{
  return self->_minValue;
}

- (double)range
{
  return self->_range;
}

@end