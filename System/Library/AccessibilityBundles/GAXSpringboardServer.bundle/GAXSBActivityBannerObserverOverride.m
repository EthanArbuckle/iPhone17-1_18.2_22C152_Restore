@interface GAXSBActivityBannerObserverOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldHandleActivityItem:(id)a3;
@end

@implementation GAXSBActivityBannerObserverOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBActivityBannerObserver";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)shouldHandleActivityItem:(id)a3
{
  id v4 = a3;
  v5 = +[GAXSpringboard sharedInstance];
  if ([v5 isActive])
  {
    BOOL v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GAXSBActivityBannerObserverOverride;
    BOOL v6 = [(GAXSBActivityBannerObserverOverride *)&v8 shouldHandleActivityItem:v4];
  }

  return v6;
}

@end