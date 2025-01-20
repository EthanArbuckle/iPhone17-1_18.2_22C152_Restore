@interface MobileCalUIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
@end

@implementation MobileCalUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  id v4 = a3;
  v5 = [(MobileCalUIViewAccessibility *)self accessibilityIdentification];
  int v6 = [v5 isEqualToString:@"_AXYearViewIdentifier"];

  if (v6)
  {
    if ([v4 isEqualToString:*MEMORY[0x263F1D180]])
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
    unsigned __int8 v10 = [v4 isEqualToString:*MEMORY[0x263F1D130]];
LABEL_9:
    BOOL v7 = v10;
    goto LABEL_11;
  }
  v8 = [(MobileCalUIViewAccessibility *)self accessibilityIdentification];
  int v9 = [v8 isEqualToString:@"_AXMonthViewIdentifier"];

  if (!v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)MobileCalUIViewAccessibility;
    unsigned __int8 v10 = [(MobileCalUIViewAccessibility *)&v12 _accessibilitySupportsContentSizeCategory:v4];
    goto LABEL_9;
  }
  BOOL v7 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x263F1D188]) == NSOrderedDescending
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x263F1D148]) == NSOrderedAscending;
LABEL_11:

  return v7;
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  if (![(MobileCalUIViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 0; {
  v3 = [(MobileCalUIViewAccessibility *)self accessibilityIdentification];
  }
  if ([v3 isEqualToString:@"_AXMonthViewIdentifier"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(MobileCalUIViewAccessibility *)self accessibilityIdentification];
    char v4 = [v5 isEqualToString:@"_AXYearViewIdentifier"];
  }
  return v4;
}

@end