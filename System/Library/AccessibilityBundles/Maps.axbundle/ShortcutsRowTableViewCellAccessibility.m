@interface ShortcutsRowTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation ShortcutsRowTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShortcutsRowTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ShortcutsRowTableViewCellAccessibility *)self safeValueForKey:@"_collectionView"];
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ShortcutsRowTableViewCellAccessibility;
    uint64_t v5 = [(ShortcutsRowTableViewCellAccessibility *)&v8 accessibilityElements];
  }
  v6 = (void *)v5;

  return v6;
}

@end