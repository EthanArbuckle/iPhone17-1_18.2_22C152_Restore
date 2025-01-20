@interface DelaunayPoint
- (DelaunayPoint)initWithValue:(DelaunayPoint *)self;
- (double)value;
@end

@implementation DelaunayPoint

- (DelaunayPoint)initWithValue:(DelaunayPoint *)self
{
  uint64_t v3 = v2;
  v8.receiver = self;
  v8.super_class = (Class)DelaunayPoint;
  v4 = [(DelaunayPoint *)&v8 init];
  v5 = v4;
  if (v4)
  {
    *(void *)v4->_value = v3;
    v6 = v4;
  }

  return v5;
}

- (double)value
{
  return *(double *)(a1 + 8);
}

@end