@interface UIView
- (id)superviewWithClass:(Class)a3;
- (void)shake;
@end

@implementation UIView

- (void)shake
{
  id v5 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
  v3 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  [v5 setTimingFunction:v3];

  [v5 setDuration:0.6];
  [v5 setValues:&off_1000FAAB8];
  v4 = [(UIView *)self layer];
  [v4 addAnimation:v5 forKey:@"shake"];
}

- (id)superviewWithClass:(Class)a3
{
  uint64_t v3 = [(UIView *)self superview];
  if (v3)
  {
    v4 = (void *)v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [v4 superview];

      v4 = v5;
      if (!v5)
      {
        id v6 = 0;
        goto LABEL_8;
      }
    }
    id v6 = v4;
    id v5 = v6;
  }
  else
  {
    id v6 = 0;
    id v5 = 0;
  }
LABEL_8:

  return v6;
}

@end