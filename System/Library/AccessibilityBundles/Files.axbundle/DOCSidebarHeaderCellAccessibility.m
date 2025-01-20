@interface DOCSidebarHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DOCSidebarHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Files.DOCSidebarHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_UICollectionViewListAccessoryDisclosure"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Files.DOCSidebarHeaderCell", @"accessibilityTitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)DOCSidebarHeaderCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(DOCSidebarHeaderCellAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CEF8];
}

- (id)accessibilityLabel
{
  return (id)[(DOCSidebarHeaderCellAccessibility *)self safeValueForKey:@"accessibilityTitle"];
}

- (CGPoint)accessibilityActivationPoint
{
  objc_super v3 = [(DOCSidebarHeaderCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DOCSidebarHeaderCellAccessibility;
    [(DOCSidebarHeaderCellAccessibility *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

uint64_t __65__DOCSidebarHeaderCellAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uicollectionvi.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end