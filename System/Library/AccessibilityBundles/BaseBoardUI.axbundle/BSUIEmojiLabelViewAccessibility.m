@interface BSUIEmojiLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation BSUIEmojiLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BSUIEmojiLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF48];
  v4.receiver = self;
  v4.super_class = (Class)BSUIEmojiLabelViewAccessibility;
  return [(BSUIEmojiLabelViewAccessibility *)&v4 accessibilityTraits] | v2;
}

- (id)accessibilityLabel
{
  return (id)[(BSUIEmojiLabelViewAccessibility *)self safeStringForKey:@"_rawText"];
}

@end