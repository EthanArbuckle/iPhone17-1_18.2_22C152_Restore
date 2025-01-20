@interface AXMVisionFeature_AXRuntime
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGPoint)activationPoint;
- (void)setActivationPoint:(CGPoint)a3;
@end

@implementation AXMVisionFeature_AXRuntime

+ (id)safeCategoryTargetClassName
{
  return @"AXMVisionFeature";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setActivationPoint:(CGPoint)a3
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", a3.x, a3.y);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &ActivationPointKey, v4, (void *)1);
}

- (CGPoint)activationPoint
{
  v2 = objc_getAssociatedObject(self, &ActivationPointKey);
  [v2 pointValue];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end