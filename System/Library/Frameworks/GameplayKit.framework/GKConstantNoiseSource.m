@interface GKConstantNoiseSource
+ (GKConstantNoiseSource)constantNoiseWithValue:(double)value;
- (GKConstantNoiseSource)init;
- (GKConstantNoiseSource)initWithValue:(double)value;
- (double)value;
- (double)valueAt:(GKConstantNoiseSource *)self;
- (id)cloneModule;
- (void)setValue:(double)value;
@end

@implementation GKConstantNoiseSource

+ (GKConstantNoiseSource)constantNoiseWithValue:(double)value
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:value];

  return (GKConstantNoiseSource *)v3;
}

- (GKConstantNoiseSource)init
{
  return [(GKConstantNoiseSource *)self initWithValue:0.0];
}

- (GKConstantNoiseSource)initWithValue:(double)value
{
  v5.receiver = self;
  v5.super_class = (Class)GKConstantNoiseSource;
  result = [(GKConstantNoiseSource *)&v5 init];
  if (result) {
    result->_value = value;
  }
  return result;
}

- (double)valueAt:(GKConstantNoiseSource *)self
{
  return self->_value;
}

- (id)cloneModule
{
  return +[GKConstantNoiseSource constantNoiseWithValue:self->_value];
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)value
{
  self->_value = value;
}

@end