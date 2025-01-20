@interface PuppetCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)displaySelection:(BOOL)a3;
@end

@implementation PuppetCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PuppetCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)displaySelection:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PuppetCollectionViewCellAccessibility;
  -[PuppetCollectionViewCellAccessibility displaySelection:](&v6, sel_displaySelection_);
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v5 = 0;
  }
  [(PuppetCollectionViewCellAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v5];
}

@end