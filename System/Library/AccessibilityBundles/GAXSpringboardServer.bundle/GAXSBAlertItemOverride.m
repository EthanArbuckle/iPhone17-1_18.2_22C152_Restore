@interface GAXSBAlertItemOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)dismiss:(int)a3;
@end

@implementation GAXSBAlertItemOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBAlertItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)dismiss:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = +[GAXSpringboard sharedInstance];
  if (([v5 allowsTouch] & 1) == 0) {
    [v5 notifyBackboardSBMiniAlertIsShowing:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)GAXSBAlertItemOverride;
  [(GAXSBAlertItemOverride *)&v6 dismiss:v3];
}

@end