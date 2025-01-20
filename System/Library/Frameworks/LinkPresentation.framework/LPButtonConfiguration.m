@interface LPButtonConfiguration
- (UIColor)_lp_indicatorColor;
- (id)_resolvedIndicatorColor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)set_lp_indicatorColor:(id)a3;
@end

@implementation LPButtonConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LPButtonConfiguration;
  v4 = [(UIButtonConfiguration *)&v8 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 34, self->_lp_indicatorColor);
    v6 = v5;
  }

  return v5;
}

- (id)_resolvedIndicatorColor
{
  return self->_lp_indicatorColor;
}

- (UIColor)_lp_indicatorColor
{
  return self->_lp_indicatorColor;
}

- (void)set_lp_indicatorColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end