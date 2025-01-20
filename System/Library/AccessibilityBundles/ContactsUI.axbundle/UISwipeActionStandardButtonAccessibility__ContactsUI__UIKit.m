@interface UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UISwipeActionStandardButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UISwipeActionStandardButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIButton", @"imageView", "@", 0);
  [v3 validateClass:@"UIImage" hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (id)accessibilityLabel
{
  char v12 = 0;
  objc_opt_class();
  id v3 = [(UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit *)self safeUIViewForKey:@"imageView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 image];
  v6 = [v5 safeValueForKey:@"_imageAsset"];
  v7 = [v6 safeStringForKey:@"assetName"];

  if ([v7 isEqualToString:@"envelope.fill"])
  {
    uint64_t v8 = accessibilityLocalizedString(@"action.email.all");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit;
    uint64_t v8 = [(UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit *)&v11 accessibilityLabel];
  }
  v9 = (void *)v8;

  return v9;
}

@end