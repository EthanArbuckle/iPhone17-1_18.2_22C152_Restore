@interface PKPaletteDictationBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPaletteDictationBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteDictationBarButton";
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
  return accessibilityPencilKitLocalizedString(@"pkpalettebutton.dictate");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteDictationBarButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PKPaletteDictationBarButtonAccessibility *)&v3 accessibilityTraits];
}

@end