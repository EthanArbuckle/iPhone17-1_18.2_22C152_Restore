@interface ERDistanceEvent
- (BOOL)didDetectAttention;
- (ERDistanceEvent)initWithDistance:(float)a3 distanceCategory:(int64_t)a4 andAttention:(BOOL)a5;
- (float)distance;
- (id)description;
- (int64_t)distanceCategory;
- (void)setDidDetectAttention:(BOOL)a3;
- (void)setDistance:(float)a3;
- (void)setDistanceCategory:(int64_t)a3;
@end

@implementation ERDistanceEvent

- (ERDistanceEvent)initWithDistance:(float)a3 distanceCategory:(int64_t)a4 andAttention:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ERDistanceEvent;
  result = [(ERDistanceEvent *)&v9 init];
  if (result)
  {
    result->_distance = a3;
    result->_distanceCategory = a4;
    result->_didDetectAttention = a5;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  [(ERDistanceEvent *)self distance];
  double v5 = v4;
  int64_t v6 = [(ERDistanceEvent *)self distanceCategory];
  BOOL v7 = [(ERDistanceEvent *)self didDetectAttention];
  v8 = "no";
  if (v7) {
    v8 = "yes";
  }
  return (id)[v3 stringWithFormat:@"Distance: %f, Distance Category: %li, didDetectAttention: %s", *(void *)&v5, v6, v8];
}

- (float)distance
{
  return self->_distance;
}

- (void)setDistance:(float)a3
{
  self->_distance = a3;
}

- (int64_t)distanceCategory
{
  return self->_distanceCategory;
}

- (void)setDistanceCategory:(int64_t)a3
{
  self->_distanceCategory = a3;
}

- (BOOL)didDetectAttention
{
  return self->_didDetectAttention;
}

- (void)setDidDetectAttention:(BOOL)a3
{
  self->_didDetectAttention = a3;
}

@end