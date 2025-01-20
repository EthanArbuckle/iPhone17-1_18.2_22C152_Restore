@interface BSUIVibrancyBackdropView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation BSUIVibrancyBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"filters."])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BSUIVibrancyBackdropView;
    BOOL v5 = [(BSUIVibrancyBackdropView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end