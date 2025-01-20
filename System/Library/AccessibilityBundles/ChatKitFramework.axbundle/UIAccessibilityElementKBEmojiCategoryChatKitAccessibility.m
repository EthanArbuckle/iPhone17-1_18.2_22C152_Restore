@interface UIAccessibilityElementKBEmojiCategoryChatKitAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityCustomRotors;
@end

@implementation UIAccessibilityElementKBEmojiCategoryChatKitAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAccessibilityElementKBEmojiCategory";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityCustomRotors
{
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityElementKBEmojiCategoryChatKitAccessibility;
  v2 = [(UIAccessibilityElementKBEmojiCategoryChatKitAccessibility *)&v5 accessibilityCustomRotors];
  v3 = addFirstResponderRotorsToRotorArray(v2);

  return v3;
}

@end