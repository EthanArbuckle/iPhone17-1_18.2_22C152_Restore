@interface NMBUIMediaTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsShowingControl;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation NMBUIMediaTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NMBUIMediaTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NMBUIMediaTableCell" isKindOfClass:@"PSControlTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSControlTableCell", @"control", "@", 0);
  [v3 validateClass:@"NMBUIMediaTableCell" isKindOfClass:@"PSTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"titleLabel", "@", 0);
  [v3 validateClass:@"NMBUIMediaTableCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"detailTextLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(NMBUIMediaTableCellAccessibility *)self _axIsShowingControl]
    && (char v14 = 0,
        objc_opt_class(),
        [(NMBUIMediaTableCellAccessibility *)self safeValueForKey:@"control"],
        id v3 = objc_claimAutoreleasedReturnValue(),
        __UIAccessibilityCastAsClass(),
        v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    [v4 accessibilityActivationPoint];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NMBUIMediaTableCellAccessibility;
    [(NMBUIMediaTableCellAccessibility *)&v13 accessibilityActivationPoint];
    double v6 = v9;
    double v8 = v10;
  }
  double v11 = v6;
  double v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)NMBUIMediaTableCellAccessibility;
  unint64_t v3 = [(NMBUIMediaTableCellAccessibility *)&v7 accessibilityTraits];
  if ([(NMBUIMediaTableCellAccessibility *)self _axIsShowingControl])
  {
    uint64_t v4 = kAXToggleTrait;
    double v5 = [(NMBUIMediaTableCellAccessibility *)self safeValueForKey:@"control"];
    v3 |= v4 | (unint64_t)[v5 accessibilityTraits];
  }
  return v3;
}

- (id)accessibilityLabel
{
  return [(NMBUIMediaTableCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, detailTextLabel"];
}

- (id)accessibilityValue
{
  if ([(NMBUIMediaTableCellAccessibility *)self _axIsShowingControl])
  {
    unint64_t v3 = [(NMBUIMediaTableCellAccessibility *)self safeValueForKey:@"control"];
    uint64_t v4 = [v3 accessibilityValue];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NMBUIMediaTableCellAccessibility;
    uint64_t v4 = [(NMBUIMediaTableCellAccessibility *)&v6 accessibilityValue];
  }

  return v4;
}

- (BOOL)_axIsShowingControl
{
  char v15 = 0;
  objc_opt_class();
  unint64_t v3 = [(NMBUIMediaTableCellAccessibility *)self safeValueForKey:@"accessoryView"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  double v5 = [(NMBUIMediaTableCellAccessibility *)self safeValueForKey:@"control"];
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v6 = objc_msgSend(v4, "arrangedSubviews", 0);
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if (*(void **)(*((void *)&v11 + 1) + 8 * i) == v5)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

@end