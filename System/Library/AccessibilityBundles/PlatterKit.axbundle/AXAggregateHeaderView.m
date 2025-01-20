@interface AXAggregateHeaderView
- (AXAggregateHeaderView)initWithAccessibilityContainer:(id)a3 iconButtons:(id)a4 dateLabel:(id)a5 titleLabel:(id)a6;
- (BOOL)_axIsHeaderViewActionable;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (NSArray)iconButtons;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)dateLabel;
- (id)titleLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AXAggregateHeaderView

- (AXAggregateHeaderView)initWithAccessibilityContainer:(id)a3 iconButtons:(id)a4 dateLabel:(id)a5 titleLabel:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x263EFF980] array];
  [v14 axSafelyAddObjectsFromArray:v11];
  [v14 axSafelyAddObject:v13];
  [v14 axSafelyAddObject:v12];
  v28.receiver = self;
  v28.super_class = (Class)AXAggregateHeaderView;
  v15 = [(UIAccessibilityAggregateElement *)&v28 initWithAccessibilityContainer:v10 representedElements:v14];
  v16 = v15;
  if (v15)
  {
    id v23 = v10;
    objc_storeStrong((id *)&v15->_iconButtons, a4);
    objc_storeStrong(&v16->_titleLabel, a6);
    objc_storeStrong(&v16->_dateLabel, a5);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v17 = v16->_iconButtons;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v21++) accessibilitySetIdentification:@"HeaderAppIcon"];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v19);
    }

    id v10 = v23;
  }

  return v16;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(AXAggregateHeaderView *)self iconButtons];
  v3 = [v2 firstObject];
  [v3 accessibilityActivationPoint];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)accessibilityActivate
{
  v3 = [(AXAggregateHeaderView *)self iconButtons];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    id v10 = self;
    _AXAssert();
  }
  BOOL v5 = [(AXAggregateHeaderView *)self _axIsHeaderViewActionable];
  if (v5)
  {
    objc_opt_class();
    double v6 = [(AXAggregateHeaderView *)self iconButtons];
    double v7 = [v6 firstObject];
    double v8 = __UIAccessibilityCastAsClass();

    [v8 sendActionsForControlEvents:64];
  }
  return v5;
}

- (id)accessibilityLabel
{
  v3 = [(AXAggregateHeaderView *)self titleLabel];
  unint64_t v4 = [v3 accessibilityLabel];
  BOOL v5 = [(AXAggregateHeaderView *)self dateLabel];
  double v8 = [v5 accessibilityLabel];
  double v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityHint
{
  if ([(AXAggregateHeaderView *)self _axIsHeaderViewActionable])
  {
    v3 = NSString;
    unint64_t v4 = accessibilityLocalizedString(@"notification.icon.button.hint");
    BOOL v5 = [(AXAggregateHeaderView *)self titleLabel];
    double v6 = [v5 accessibilityLabel];
    double v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  BOOL v2 = [(AXAggregateHeaderView *)self _axIsHeaderViewActionable];
  uint64_t v3 = *MEMORY[0x263F1CEE8];
  if (!v2) {
    uint64_t v3 = 0;
  }
  return v3 | *MEMORY[0x263F1CEF8];
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v3 = [(AXAggregateHeaderView *)self iconButtons];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    v9.receiver = self;
    v9.super_class = (Class)AXAggregateHeaderView;
    double v7 = [(AXAggregateHeaderView *)&v9 _accessibilitySupplementaryFooterViews];
  }
  else
  {
    BOOL v5 = [(AXAggregateHeaderView *)self iconButtons];
    double v6 = [(AXAggregateHeaderView *)self iconButtons];
    double v7 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
  }

  return v7;
}

- (BOOL)_axIsHeaderViewActionable
{
  uint64_t v3 = [(AXAggregateHeaderView *)self titleLabel];
  unint64_t v4 = [v3 accessibilityLabel];
  if ([v4 length])
  {
    BOOL v5 = [(AXAggregateHeaderView *)self iconButtons];
    double v6 = [v5 firstObject];
    if ([v6 _accessibilityViewIsVisible])
    {
      double v7 = [(AXAggregateHeaderView *)self iconButtons];
      double v8 = [v7 firstObject];
      objc_super v9 = [v8 allTargets];
      BOOL v10 = [v9 count] != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSArray)iconButtons
{
  return self->_iconButtons;
}

- (id)dateLabel
{
  return self->_dateLabel;
}

- (id)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_titleLabel, 0);
  objc_storeStrong(&self->_dateLabel, 0);

  objc_storeStrong((id *)&self->_iconButtons, 0);
}

@end