@interface SFDefaultBrowserAppCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SFDefaultBrowserAppCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFDefaultBrowserAppCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFDefaultBrowserAppCollectionViewCell" hasInstanceVariable:@"_lockupView" withType:"ASCLockupView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCLockupView", @"lockup", "@", 0);
  [v3 validateClass:@"ASCLockup" hasInstanceVariable:@"_title" withType:"NSString"];
  [v3 validateClass:@"ASCLockup" hasInstanceVariable:@"_subtitle" withType:"NSString"];
  [v3 validateClass:@"ASCLockup" hasInstanceVariable:@"_heading" withType:"NSString"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SFDefaultBrowserAppCollectionViewCellAccessibility *)self safeUIViewForKey:@"_lockupView"];
  id v3 = [v2 safeValueForKey:@"lockup"];

  v4 = [v3 safeStringForKey:@"_title"];
  v5 = [v3 safeStringForKey:@"_subtitle"];
  v8 = [v3 safeStringForKey:@"_heading"];
  v6 = __AXStringForVariables();

  return v6;
}

@end