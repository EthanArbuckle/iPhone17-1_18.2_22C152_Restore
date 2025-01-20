@interface ZoomUI_UITouchReachabilityOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGPoint)locationInView:(id)a3;
@end

@implementation ZoomUI_UITouchReachabilityOverride

+ (id)safeCategoryTargetClassName
{
  return @"UITouch";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)locationInView:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ZoomUI_UITouchReachabilityOverride;
  [(ZoomUI_UITouchReachabilityOverride *)&v15 locationInView:a3];
  double v5 = v4;
  double v7 = v6;
  v8 = [(ZoomUI_UITouchReachabilityOverride *)self accessibilityIdentifier];
  if (![v8 isEqualToString:@"AXSBReachabilityTouch"]
    || !+[ZoomServicesUI _shouldUnmapPointsForFluidGestures])
  {
    goto LABEL_5;
  }
  v9 = [getAXSettingsClass() sharedInstance];
  if ([v9 zoomInStandby])
  {

LABEL_5:
    goto LABEL_6;
  }
  BOOL v12 = +[ZoomServicesUI _deviceIsPortrait];

  if (v12)
  {
    +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v5, v7);
    double v5 = v13;
    double v7 = v14;
  }
LABEL_6:
  double v10 = v5;
  double v11 = v7;
  result.y = v11;
  result.x = v10;
  return result;
}

@end