@interface ZoomUI_UIFocusScrollAnimatorOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setTargetContentOffset:(CGPoint)a3 forEnvironmentScrollableContainer:(id)a4 convergenceRate:(double)a5 completion:(id)a6;
@end

@implementation ZoomUI_UIFocusScrollAnimatorOverride

+ (id)safeCategoryTargetClassName
{
  return @"_UIFocusDisplayLinkScrollAnimator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setTargetContentOffset:(CGPoint)a3 forEnvironmentScrollableContainer:(id)a4 convergenceRate:(double)a5 completion:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a4;
  id v12 = a6;
  if (_AXSZoomTouchEnabled())
  {
    v13 = [getAXSettingsClass() sharedInstance];
    if ([v13 zoomInStandby])
    {
    }
    else
    {
      v14 = [getAXSettingsClass() sharedInstance];
      [v14 zoomScale];
      double v16 = v15;

      if (v16 > 1.01) {
        a5 = 0.5;
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)ZoomUI_UIFocusScrollAnimatorOverride;
  -[ZoomUI_UIFocusScrollAnimatorOverride setTargetContentOffset:forEnvironmentScrollableContainer:convergenceRate:completion:](&v17, sel_setTargetContentOffset_forEnvironmentScrollableContainer_convergenceRate_completion_, v11, v12, x, y, a5);
}

@end