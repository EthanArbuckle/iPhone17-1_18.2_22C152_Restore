@interface UIButtonAccessibility__ChatKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation UIButtonAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(UIButtonAccessibility__ChatKit__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"CKTranscriptStatusButton"];

  if (v4)
  {
    v5 = [(UIButtonAccessibility__ChatKit__UIKit *)self accessibilityLabel];
    uint64_t v6 = [v5 length];

    if (!v6) {
      return 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)UIButtonAccessibility__ChatKit__UIKit;
  return [(UIButtonAccessibility__ChatKit__UIKit *)&v8 isAccessibilityElement];
}

@end