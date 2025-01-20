@interface UIBarButtonItemAccessibility__Tips__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation UIBarButtonItemAccessibility__Tips__UIKit

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
  v9.super_class = (Class)UIBarButtonItemAccessibility__Tips__UIKit;
  id v3 = [(UIBarButtonItemAccessibility__Tips__UIKit *)&v9 accessibilityLabel];
  v4 = [(UIBarButtonItemAccessibility__Tips__UIKit *)self safeValueForKeyPath:@"image.imageAsset"];
  v5 = [v4 safeStringForKey:@"assetName"];

  if ([v5 isEqualToString:@"bookmark"])
  {
    v6 = @"Save";
  }
  else
  {
    if (![v5 isEqualToString:@"bookmark.fill"]) {
      goto LABEL_6;
    }
    v6 = @"Remove from Saved Tips";
  }
  uint64_t v7 = accessibilityLocalizedString(v6);

  id v3 = (void *)v7;
LABEL_6:

  return v3;
}

@end