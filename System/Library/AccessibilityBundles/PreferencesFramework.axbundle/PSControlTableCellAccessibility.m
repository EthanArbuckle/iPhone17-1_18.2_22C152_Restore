@interface PSControlTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityAbsoluteValue;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PSControlTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSControlTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v9.receiver = self;
  v9.super_class = (Class)PSControlTableCellAccessibility;
  v3 = [(PSControlTableCellAccessibility *)&v9 accessibilityLabel];
  if ([v3 length])
  {
    id v4 = v3;
    v5 = v4;
  }
  else
  {
    v6 = [(PSControlTableCellAccessibility *)self specifier];
    id v4 = [v6 accessibilityLabel];

    if ([v4 length])
    {
      id v7 = v4;
    }
    else
    {
      id v7 = [(PSControlTableCellAccessibility *)self safeStringForKey:@"title"];
    }
    v5 = v7;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  if ([(PSControlTableCellAccessibility *)self type] == 5)
  {
    v3 = [(PSControlTableCellAccessibility *)self safeValueForKey:@"control"];
    uint64_t v4 = [v3 accessibilityTraits];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PSControlTableCellAccessibility;
    uint64_t v4 = [(PSControlTableCellAccessibility *)&v11 accessibilityTraits];
  }
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if ((*MEMORY[0x263F1CEE8] & v4) == 0) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 ^ v4;
  id v7 = [(PSControlTableCellAccessibility *)self safeValueForKey:@"isUserInteractionEnabled"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = *MEMORY[0x263F1CF20];
  if (v8) {
    uint64_t v9 = 0;
  }
  return v9 | v6;
}

- (id)_accessibilityAbsoluteValue
{
  v2 = [(PSControlTableCellAccessibility *)self safeValueForKey:@"_control"];
  v3 = [v2 _accessibilityAbsoluteValue];

  return v3;
}

- (void)accessibilityIncrement
{
  v3 = [(PSControlTableCellAccessibility *)self safeValueForKey:@"isUserInteractionEnabled"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = [(PSControlTableCellAccessibility *)self safeValueForKey:@"_control"];
    [v5 accessibilityIncrement];
  }
}

- (void)accessibilityDecrement
{
  v3 = [(PSControlTableCellAccessibility *)self safeValueForKey:@"isUserInteractionEnabled"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = [(PSControlTableCellAccessibility *)self safeValueForKey:@"_control"];
    [v5 accessibilityDecrement];
  }
}

@end