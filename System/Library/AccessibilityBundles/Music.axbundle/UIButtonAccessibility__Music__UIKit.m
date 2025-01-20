@interface UIButtonAccessibility__Music__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation UIButtonAccessibility__Music__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIButton", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIButton", @"currentImage", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(UIButtonAccessibility__Music__UIKit *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"AXNowPlayingSubtitleButton"];

  if (v4)
  {
    v5 = [(UIButtonAccessibility__Music__UIKit *)self safeValueForKey:@"titleLabel"];
    v6 = [v5 accessibilityLabel];
    v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v8 = [v6 stringByTrimmingCharactersInSet:v7];
    uint64_t v9 = [v8 length];
    BOOL v10 = v9 != 0;

    if (!v9) {
      [v5 setAccessibilityIdentifier:@"AXUIButtonLabelEmptyLabel"];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIButtonAccessibility__Music__UIKit;
    return [(UIButtonAccessibility__Music__UIKit *)&v12 isAccessibilityElement];
  }
  return v10;
}

- (id)accessibilityLabel
{
  id v3 = [(UIButtonAccessibility__Music__UIKit *)self safeValueForKey:@"currentImage"];
  int v4 = [v3 accessibilityIdentifier];
  if ([v4 isEqualToString:@"Context-Love"])
  {
    v5 = @"love";
LABEL_5:
    uint64_t v6 = accessibilityMusicLocalizedString(v5);
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Context-Hate"])
  {
    v5 = @"dislike";
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)UIButtonAccessibility__Music__UIKit;
  uint64_t v6 = [(UIButtonAccessibility__Music__UIKit *)&v9 accessibilityLabel];
LABEL_7:
  v7 = (void *)v6;

  return v7;
}

@end