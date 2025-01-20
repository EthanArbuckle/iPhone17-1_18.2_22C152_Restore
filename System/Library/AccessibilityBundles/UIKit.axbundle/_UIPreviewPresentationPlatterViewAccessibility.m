@interface _UIPreviewPresentationPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation _UIPreviewPresentationPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPreviewPresentationPlatterView";
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

- (BOOL)accessibilityPerformEscape
{
  id v3 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"accessibilityDismissActionSheet" object:0];

  return 1;
}

@end