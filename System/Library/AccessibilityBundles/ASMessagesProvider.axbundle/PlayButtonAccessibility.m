@interface PlayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.PlayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(@"play.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PlayButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PlayButtonAccessibility *)&v3 accessibilityTraits];
}

@end