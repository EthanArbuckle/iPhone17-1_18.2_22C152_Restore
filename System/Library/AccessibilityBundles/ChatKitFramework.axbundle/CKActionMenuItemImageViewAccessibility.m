@interface CKActionMenuItemImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation CKActionMenuItemImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKActionMenuItemImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)CKActionMenuItemImageViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(CKActionMenuItemImageViewAccessibility *)&v7 accessibilityTraits];
  int v4 = [(CKActionMenuItemImageViewAccessibility *)self safeBoolForKey:@"_enabled"];
  uint64_t v5 = *MEMORY[0x263F1CF20];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end