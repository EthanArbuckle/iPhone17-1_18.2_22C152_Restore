@interface MTLRasterizationRateSampleArrayInternal
- (MTLRasterizationRateSampleArrayInternal)initWithData:(float *)a3 numElements:(unint64_t)a4;
- (float)__getRawArray:(unint64_t *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
@end

@implementation MTLRasterizationRateSampleArrayInternal

- (MTLRasterizationRateSampleArrayInternal)initWithData:(float *)a3 numElements:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLRasterizationRateSampleArrayInternal;
  result = [(MTLRasterizationRateSampleArrayInternal *)&v7 init];
  if (result)
  {
    result->_data = a3;
    result->_count = a4;
  }
  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  double v3 = 0.0;
  if (self->_count > a3) {
    *(float *)&double v3 = self->_data[a3];
  }
  return (id)[NSNumber numberWithFloat:v3];
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  if (self->_count > a4)
  {
    [a3 floatValue];
    self->_data[a4] = v6;
  }
}

- (float)__getRawArray:(unint64_t *)a3
{
  *a3 = self->_count;
  return self->_data;
}

@end