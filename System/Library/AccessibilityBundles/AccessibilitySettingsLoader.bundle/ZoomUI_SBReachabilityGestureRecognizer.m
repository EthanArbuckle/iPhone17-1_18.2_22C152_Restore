@interface ZoomUI_SBReachabilityGestureRecognizer
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation ZoomUI_SBReachabilityGestureRecognizer

+ (id)safeCategoryTargetClassName
{
  return @"SBReachabilityGestureRecognizer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 anyObject];
  [v8 setAccessibilityIdentifier:@"AXSBReachabilityTouch"];

  v9.receiver = self;
  v9.super_class = (Class)ZoomUI_SBReachabilityGestureRecognizer;
  [(ZoomUI_SBReachabilityGestureRecognizer *)&v9 touchesBegan:v7 withEvent:v6];
}

@end