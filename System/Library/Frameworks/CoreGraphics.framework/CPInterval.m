@interface CPInterval
- (BOOL)contains:(id)a3;
- (BOOL)intersects:(id)a3;
- (double)left;
- (double)right;
- (id)initLeft:(double)a3 right:(double)a4;
- (void)add:(id)a3;
@end

@implementation CPInterval

- (BOOL)contains:(id)a3
{
  [a3 normalizedBounds];
  double x = v4;
  CGFloat v9 = v5;
  double width = v6;
  CGFloat v11 = v7;
  if (v6 >= 0.0 && v7 >= 0.0)
  {
    if (v4 >= self->left) {
      return x + width <= self->right;
    }
    return 0;
  }
  if (COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v4)) < self->left) {
    return 0;
  }
  v13.origin.double x = x;
  v13.origin.y = v9;
  v13.size.double width = width;
  v13.size.height = v11;
  CGRect v14 = CGRectStandardize(v13);
  double x = v14.origin.x;
  double width = v14.size.width;
  return x + width <= self->right;
}

- (double)right
{
  return self->right;
}

- (double)left
{
  return self->left;
}

- (void)add:(id)a3
{
  double right = self->right;
  self->left = fmin(self->left, *((double *)a3 + 1));
  self->double right = fmax(right, *((double *)a3 + 2));
}

- (BOOL)intersects:(id)a3
{
  double right = self->right;
  double v4 = *((double *)a3 + 1);
  if (right < v4)
  {
    double v5 = v4 - right;
    return v5 <= 10.0;
  }
  double left = self->left;
  double v7 = *((double *)a3 + 2);
  if (left > v7)
  {
    double v5 = left - v7;
    return v5 <= 10.0;
  }
  return 1;
}

- (id)initLeft:(double)a3 right:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CPInterval;
  id result = [(CPInterval *)&v7 init];
  if (result)
  {
    *((double *)result + 1) = a3;
    *((double *)result + 2) = a4;
  }
  return result;
}

@end