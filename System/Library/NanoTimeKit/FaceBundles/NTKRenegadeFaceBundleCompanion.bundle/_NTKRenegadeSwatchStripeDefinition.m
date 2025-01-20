@interface _NTKRenegadeSwatchStripeDefinition
+ (id)definitionWithColor:(id)a3 height:(double)a4;
- (UIColor)color;
- (double)height;
@end

@implementation _NTKRenegadeSwatchStripeDefinition

+ (id)definitionWithColor:(id)a3 height:(double)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  *(double *)(v6 + 16) = a4;

  return (id)v6;
}

- (UIColor)color
{
  return self->_color;
}

- (double)height
{
  return self->_height;
}

- (void).cxx_destruct
{
}

@end