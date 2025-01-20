@interface PreferencesPSTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation PreferencesPSTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(PreferencesPSTableCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v4 = [v3 dataSource];
  NSClassFromString(&cfstr_Listrestrictio.isa);
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 safeValueForKey:@"specifiers"];
    v6 = [(PreferencesPSTableCellAccessibility *)self safeValueForKey:@"specifier"];
    if ([v5 containsObject:v6])
    {
      v7 = [v6 safeValueForKey:@"values"];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        v17.receiver = self;
        v17.super_class = (Class)PreferencesPSTableCellAccessibility;
        v9 = [(PreferencesPSTableCellAccessibility *)&v17 accessibilityLabel];
        if ([v9 length] && (unint64_t)objc_msgSend(v9, "length") < 8)
        {
          v10 = accessibilityLocalizedString(@"rating.format");
          v11 = objc_msgSend(NSString, "stringWithFormat:", v10, v9);

LABEL_12:
          goto LABEL_15;
        }
      }
    }
  }
  NSClassFromString(&cfstr_Axlanguagecell.isa);
  if (objc_opt_isKindOfClass())
  {
    v12 = [(PreferencesPSTableCellAccessibility *)self textLabel];
    v5 = [v12 accessibilityLabel];

    v13 = [(PreferencesPSTableCellAccessibility *)self accessibilityLanguage];

    if (v13)
    {
      v11 = [MEMORY[0x263F21660] axAttributedStringWithString:v5];
      v14 = [(PreferencesPSTableCellAccessibility *)self accessibilityLanguage];
      [v11 setAttribute:v14 forKey:*MEMORY[0x263F217F0]];

      goto LABEL_12;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)PreferencesPSTableCellAccessibility;
  v11 = [(PreferencesPSTableCellAccessibility *)&v16 accessibilityLabel];
LABEL_15:

  return v11;
}

@end