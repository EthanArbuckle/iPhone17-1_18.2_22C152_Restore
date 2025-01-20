@interface SiriRestaurantsDetailDescriptionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_setPriceInfoWithRestaurant:(id)a3;
@end

@implementation SiriRestaurantsDetailDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriRestaurantsDetailDescriptionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_setPriceInfoWithRestaurant:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SiriRestaurantsDetailDescriptionCellAccessibility;
  [(SiriRestaurantsDetailDescriptionCellAccessibility *)&v18 _setPriceInfoWithRestaurant:v4];
  objc_opt_class();
  v5 = [(SiriRestaurantsDetailDescriptionCellAccessibility *)self safeValueForKey:@"_priceLabel"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 safeValueForKey:@"attributedText"];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3010000000;
  v16 = &unk_24249F6BA;
  long long v17 = xmmword_24249F530;
  uint64_t v8 = [v7 length];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__SiriRestaurantsDetailDescriptionCellAccessibility__setPriceInfoWithRestaurant___block_invoke;
  v12[3] = &unk_26514A310;
  v12[4] = &v13;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", @"NSColor", 0, v8, 0, v12);
  if (v14[4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = [v7 string];
    [v6 setAccessibilityLabel:v9];
  }
  else
  {
    v9 = [v7 string];
    v10 = objc_msgSend(v9, "substringWithRange:", v14[4], v14[5]);
    v11 = UIAXPriceRangeDescription();
    [v6 setAccessibilityLabel:v11];
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __81__SiriRestaurantsDetailDescriptionCellAccessibility__setPriceInfoWithRestaurant___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *a5 = 1;
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
    *(void *)(v5 + 32) = a3;
    *(void *)(v5 + 40) = a4;
  }
  return result;
}

@end