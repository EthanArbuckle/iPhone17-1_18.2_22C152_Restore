@interface ZoomUI_SpringBoardOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (double)_accessibilityActivationAnimationStartDelay;
- (double)_accessibilityDeactivationAnimationStartDelay;
- (void)_accessibilityActivationAnimationWillBegin;
- (void)_accessibilityDeactivationAnimationWillBegin;
@end

@implementation ZoomUI_SpringBoardOverride

+ (id)safeCategoryTargetClassName
{
  return @"SpringBoard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityActivationAnimationStartDelay
{
  v3 = [getZoomServicesClass() sharedInstance];
  [v3 appActivationAnimationStartDelay];
  double v5 = v4;

  if (v5 < 0.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)ZoomUI_SpringBoardOverride;
    [(ZoomUI_SpringBoardOverride *)&v8 _accessibilityActivationAnimationStartDelay];
    return v6;
  }
  return v5;
}

- (double)_accessibilityDeactivationAnimationStartDelay
{
  v3 = [getZoomServicesClass() sharedInstance];
  [v3 appDeactivationAnimationStartDelay];
  double v5 = v4;

  if (v5 < 0.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)ZoomUI_SpringBoardOverride;
    [(ZoomUI_SpringBoardOverride *)&v8 _accessibilityDeactivationAnimationStartDelay];
    return v6;
  }
  return v5;
}

- (void)_accessibilityActivationAnimationWillBegin
{
  v3.receiver = self;
  v3.super_class = (Class)ZoomUI_SpringBoardOverride;
  [(ZoomUI_SpringBoardOverride *)&v3 _accessibilityActivationAnimationWillBegin];
  v2 = [getZoomServicesClass() sharedInstance];
  [v2 notifyZoomAppActivationAnimationWillBegin];
}

- (void)_accessibilityDeactivationAnimationWillBegin
{
  v3.receiver = self;
  v3.super_class = (Class)ZoomUI_SpringBoardOverride;
  [(ZoomUI_SpringBoardOverride *)&v3 _accessibilityDeactivationAnimationWillBegin];
  v2 = [getZoomServicesClass() sharedInstance];
  [v2 notifyZoomAppDeactivationAnimationWillBegin];
}

@end