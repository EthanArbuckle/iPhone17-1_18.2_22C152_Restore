@interface WidgetSceneContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilitySpeakThisViewController;
@end

@implementation WidgetSceneContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WidgetRenderer.WidgetSceneContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySpeakThisViewController
{
  return 0;
}

@end