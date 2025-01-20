@interface _UIStackedImageContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFrameDelegate;
@end

@implementation _UIStackedImageContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStackedImageContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityFrameDelegate
{
  return (id)[(_UIStackedImageContainerViewAccessibility *)self safeValueForKey:@"layer", a2, self];
}

@end