@interface PSTableCellAccessibility__DNDSettings__Preferences
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation PSTableCellAccessibility__DNDSettings__Preferences

+ (id)safeCategoryTargetClassName
{
  return @"PSTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)PSTableCellAccessibility__DNDSettings__Preferences;
  unint64_t v3 = [(PSTableCellAccessibility__DNDSettings__Preferences *)&v7 accessibilityTraits];
  v4 = [(PSTableCellAccessibility__DNDSettings__Preferences *)self accessibilityIdentifier];
  int v5 = [v4 hasSuffix:@"DateRangePaneCell"];

  if (v5) {
    return v3 & ~*MEMORY[0x263F1CF20] | *MEMORY[0x263F1CEE8];
  }
  return v3;
}

@end