@interface SKUIButtonCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUIButtonCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIButtonCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUIButtonCollectionViewCell" hasInstanceVariable:@"_button" withType:"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"isUserInteractionEnabled", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SKUIButtonCollectionViewCellAccessibility *)self safeValueForKey:@"_button"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  id v3 = [(SKUIButtonCollectionViewCellAccessibility *)self safeValueForKey:@"_button"];
  v4 = __UIAccessibilityCastAsClass();

  int v5 = [v4 safeBoolForKey:@"isUserInteractionEnabled"];
  uint64_t v6 = [v4 accessibilityTraits];
  uint64_t v7 = *MEMORY[0x263F1CEE8];
  if (!v5) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v6 | v7;

  return v8;
}

@end