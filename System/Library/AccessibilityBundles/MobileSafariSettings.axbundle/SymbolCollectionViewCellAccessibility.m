@interface SymbolCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SymbolCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SymbolCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SymbolCollectionViewCell" hasInstanceVariable:@"_symbolName" withType:"NSString"];
  [v3 validateClass:@"SymbolCollectionViewCell" hasInstanceVariable:@"_showsSelection" withType:"BOOL"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SymbolCollectionViewCellAccessibility *)self safeStringForKey:@"_symbolName"];
  id v3 = profileSymbolAccessibilityLabel(v2);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)SymbolCollectionViewCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(SymbolCollectionViewCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(SymbolCollectionViewCellAccessibility *)self safeBoolForKey:@"_showsSelection"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end