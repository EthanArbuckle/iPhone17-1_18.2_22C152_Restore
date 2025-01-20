@interface BuddyUITableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityScannerGroupElements;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_axChoiceController;
- (id)_axPrimaryChoiceButton;
- (id)_axSecondaryChoiceButton;
- (id)_axSortedAccessibleSubviews;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
@end

@implementation BuddyUITableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SetupChoiceController"];
  [v3 validateClass:@"SetupChoiceController" hasInstanceVariable:@"_primaryChoiceButton" withType:"UIButton"];
  [v3 validateClass:@"SetupChoiceController" hasInstanceVariable:@"_secondaryChoiceButton" withType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(BuddyUITableViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"BuddyMagnifyView"];

  if (v4) {
    return 0;
  }
  v6 = [(BuddyUITableViewAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Buddytableview.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (NSClassFromString(&cfstr_Cdptableviewco.isa), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BuddyUITableViewAccessibility;
    BOOL v5 = [(BuddyUITableViewAccessibility *)&v8 isAccessibilityElement];
  }

  return v5;
}

- (id)_axSortedAccessibleSubviews
{
  v2 = [(BuddyUITableViewAccessibility *)self safeValueForKey:@"_accessibleSubviews"];
  id v3 = [v2 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];

  return v3;
}

- (id)_axChoiceController
{
  if (_axChoiceController_onceToken != -1) {
    dispatch_once(&_axChoiceController_onceToken, &__block_literal_global_0);
  }
  id v3 = [(BuddyUITableViewAccessibility *)self delegate];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v3 = 0;
  }

  return v3;
}

Class __52__BuddyUITableViewAccessibility__axChoiceController__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Setupchoicecon.isa);
  _axChoiceController_SetupChoiceControllerClass = (uint64_t)result;
  return result;
}

- (id)_axPrimaryChoiceButton
{
  v2 = [(BuddyUITableViewAccessibility *)self _axChoiceController];
  id v3 = [v2 safeValueForKey:@"_primaryChoiceButton"];

  return v3;
}

- (id)_axSecondaryChoiceButton
{
  v2 = [(BuddyUITableViewAccessibility *)self _axChoiceController];
  id v3 = [v2 safeValueForKey:@"_secondaryChoiceButton"];

  return v3;
}

- (int64_t)accessibilityElementCount
{
  id v3 = [(BuddyUITableViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"BuddyMagnifyView"];

  if (v4)
  {
    BOOL v5 = [(BuddyUITableViewAccessibility *)self _axSortedAccessibleSubviews];
    int64_t v6 = [v5 count];

    return v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)BuddyUITableViewAccessibility;
    objc_super v8 = [(BuddyUITableViewAccessibility *)&v11 accessibilityElementCount];
    int64_t result = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = [(BuddyUITableViewAccessibility *)self _axPrimaryChoiceButton];

      if (v9) {
        ++v8;
      }
      v10 = [(BuddyUITableViewAccessibility *)self _axSecondaryChoiceButton];

      if (v10) {
        return (int64_t)(v8 + 1);
      }
      else {
        return (int64_t)v8;
      }
    }
  }
  return result;
}

- (id)_accessibilityScannerGroupElements
{
  uint64_t v3 = [(BuddyUITableViewAccessibility *)self _axPrimaryChoiceButton];
  uint64_t v4 = [(BuddyUITableViewAccessibility *)self _axSecondaryChoiceButton];
  if (v3 | v4
    || ([(BuddyUITableViewAccessibility *)self accessibilityIdentifier],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:@"BuddyMagnifyView"],
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BuddyUITableViewAccessibility;
    v7 = [(BuddyUITableViewAccessibility *)&v9 _accessibilityScannerGroupElements];
  }

  return v7;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  BOOL v5 = [(BuddyUITableViewAccessibility *)self accessibilityIdentifier];
  int v6 = [v5 isEqualToString:@"BuddyMagnifyView"];

  if (v6)
  {
    v7 = [(BuddyUITableViewAccessibility *)self _axSortedAccessibleSubviews];
    id v8 = [v7 objectAtIndex:a3];

    goto LABEL_17;
  }
  uint64_t v9 = [(BuddyUITableViewAccessibility *)self _axPrimaryChoiceButton];
  uint64_t v10 = [(BuddyUITableViewAccessibility *)self _axSecondaryChoiceButton];
  if (!(v9 | v10)) {
    goto LABEL_15;
  }
  int64_t v11 = [(BuddyUITableViewAccessibility *)self accessibilityElementCount];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  int64_t v12 = v11 - 1;
  if (v9 && v10)
  {
    if (v12 != a3)
    {
      int64_t v12 = v11 - 2;
      goto LABEL_10;
    }
LABEL_14:
    id v13 = (id)v10;
    goto LABEL_16;
  }
  if (!v9)
  {
    if (!v10 || v12 != a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_10:
  if (v12 != a3)
  {
LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)BuddyUITableViewAccessibility;
    id v13 = [(BuddyUITableViewAccessibility *)&v15 accessibilityElementAtIndex:a3];
    goto LABEL_16;
  }
  id v13 = (id)v9;
LABEL_16:
  id v8 = v13;

LABEL_17:

  return v8;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BuddyUITableViewAccessibility *)self accessibilityIdentifier];
  int v6 = [v5 isEqualToString:@"BuddyMagnifyView"];

  if (!v6)
  {
    uint64_t v7 = [(BuddyUITableViewAccessibility *)self _axPrimaryChoiceButton];
    uint64_t v9 = [(BuddyUITableViewAccessibility *)self _axSecondaryChoiceButton];
    if (!(v7 | v9)) {
      goto LABEL_5;
    }
    int64_t v10 = [(BuddyUITableViewAccessibility *)self accessibilityElementCount];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_5;
    }
    if (v7 && v9)
    {
      if ((id)v9 != v4)
      {
        if ((id)v7 == v4)
        {
          id v8 = (id)(v10 - 2);
          goto LABEL_6;
        }
LABEL_5:
        v12.receiver = self;
        v12.super_class = (Class)BuddyUITableViewAccessibility;
        id v8 = [(BuddyUITableViewAccessibility *)&v12 indexOfAccessibilityElement:v4];
LABEL_6:

        goto LABEL_7;
      }
    }
    else if (v7)
    {
      if ((id)v7 != v4) {
        goto LABEL_5;
      }
    }
    else if (!v9 || (id)v9 != v4)
    {
      goto LABEL_5;
    }
    id v8 = (id)(v10 - 1);
    goto LABEL_6;
  }
  uint64_t v7 = [(BuddyUITableViewAccessibility *)self _axSortedAccessibleSubviews];
  id v8 = (id)[(id)v7 indexOfObject:v4];
LABEL_7:

  return (int64_t)v8;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  uint64_t v3 = [(BuddyUITableViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"BuddyMagnifyView"];

  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BuddyUITableViewAccessibility;
    BOOL v5 = [(BuddyUITableViewAccessibility *)&v7 _accessibilitySupplementaryHeaderViews];
  }

  return v5;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = [(BuddyUITableViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"BuddyTableView"];

  if (v4)
  {
    [(BuddyUITableViewAccessibility *)self bounds];
    BOOL v5 = [(BuddyUITableViewAccessibility *)self delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v5, "tableView:heightForHeaderInSection:", self, 0, 0.0);
    }
    UIAccessibilityFrameForBounds();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)BuddyUITableViewAccessibility;
    [(BuddyUITableViewAccessibility *)&v22 accessibilityFrame];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

@end