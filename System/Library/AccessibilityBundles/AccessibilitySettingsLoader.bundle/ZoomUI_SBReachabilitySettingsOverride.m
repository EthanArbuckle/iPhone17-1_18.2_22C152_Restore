@interface ZoomUI_SBReachabilitySettingsOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (double)yOffsetFactor;
@end

@implementation ZoomUI_SBReachabilitySettingsOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBReachabilitySettings";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)yOffsetFactor
{
  v8.receiver = self;
  v8.super_class = (Class)ZoomUI_SBReachabilitySettingsOverride;
  [(ZoomUI_SBReachabilitySettingsOverride *)&v8 yOffsetFactor];
  double v3 = v2;
  v4 = [getZoomServicesClass() sharedInstance];
  [v4 reachabilityScaleFactor];
  double v6 = v3 * v5;

  return v6;
}

@end