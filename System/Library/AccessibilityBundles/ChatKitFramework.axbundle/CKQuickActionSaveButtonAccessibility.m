@interface CKQuickActionSaveButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CKQuickActionSaveButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKQuickActionSaveButton";
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
  return accessibilityLocalizedString(@"save.photo.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CKQuickActionSaveButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CKQuickActionSaveButtonAccessibility *)&v3 accessibilityTraits];
}

@end