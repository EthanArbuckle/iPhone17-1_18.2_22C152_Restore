@interface UIBarButtonItemAccessibility__DocumentManager__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation UIBarButtonItemAccessibility__DocumentManager__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIBarButtonItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIBarButtonItem", @"image", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImage", @"imageAsset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (id)accessibilityLabel
{
  v9.receiver = self;
  v9.super_class = (Class)UIBarButtonItemAccessibility__DocumentManager__UIKit;
  id v3 = [(UIBarButtonItemAccessibility__DocumentManager__UIKit *)&v9 accessibilityLabel];
  v4 = [(UIBarButtonItemAccessibility__DocumentManager__UIKit *)self safeValueForKeyPath:@"image.imageAsset"];
  v5 = [v4 safeStringForKey:@"assetName"];

  if (([v5 containsString:@"Dots"] & 1) != 0
    || ([v5 containsString:@"More"] & 1) != 0
    || ([v5 containsString:@"ellipsis.circle"] & 1) != 0
    || ([v5 isEqualToString:@"ellipsis"] & 1) != 0)
  {
    v6 = @"more";
LABEL_6:
    uint64_t v7 = accessibilityLocalizedString(v6);

    id v3 = (void *)v7;
    goto LABEL_7;
  }
  if (([v5 containsString:@"Duplicate"] & 1) != 0
    || ([v5 containsString:@"plus.square.on.square"] & 1) != 0)
  {
    v6 = @"duplicate";
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"folder.badge.plus"])
  {
    v6 = @"new.folder";
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"square.grid.2x2"])
  {
    v6 = @"display.mode.icons";
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"list.bullet"])
  {
    v6 = @"display.mode.list";
    goto LABEL_6;
  }
LABEL_7:

  return v3;
}

@end