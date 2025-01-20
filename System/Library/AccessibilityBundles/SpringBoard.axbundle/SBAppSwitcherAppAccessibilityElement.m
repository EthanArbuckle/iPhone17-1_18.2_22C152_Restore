@interface SBAppSwitcherAppAccessibilityElement
- (BOOL)_accessibilityCanPerformAction:(int)a3;
- (BOOL)_accessibilityIsDescendantOfElement:(id)a3;
- (BOOL)_accessibilityIsInAppSwitcher;
- (BOOL)_accessibilityIsVisibleByCompleteHitTest;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)_accessibilitySetNativeFocus;
- (BOOL)_accessibilityUpdatesSwitchMenu;
- (BOOL)_axIsAppActive;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)isControlCenter;
- (CGRect)accessibilityFrame;
- (SBAppLayoutAccessibility)appLayout;
- (SBAppSwticherAppAccessibilityElementDelegate)delegate;
- (SBFluidSwitcherContentViewAccessibility)contentView;
- (SBFluidSwitcherItemContainerAccessibility)itemContainer;
- (id)_accessibilityBundleIdentifier;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_accessibilityPreferredScrollActions;
- (id)_accessibilityScrollAncestor;
- (id)_accessibilityScrollStatus;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setAppLayout:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemContainer:(id)a3;
@end

@implementation SBAppSwitcherAppAccessibilityElement

- (BOOL)accessibilityActivate
{
  objc_opt_class();
  v3 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  v4 = __UIAccessibilityCastAsSafeCategory();

  if (v4) {
    [v4 _axHandlePageViewTap:0];
  }

  return v4 != 0;
}

- (BOOL)isAccessibilityElement
{
  v3 = [(SBAppSwitcherAppAccessibilityElement *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  v5 = [(SBAppSwitcherAppAccessibilityElement *)self delegate];
  char v6 = [v5 appElementIsAccessibilityElement:self];

  return v6;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  char v3 = [v2 _accessibilityRetainsCustomRotorActionSetting];

  return v3;
}

- (id)_accessibilityBundleIdentifier
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  char v3 = [v2 _accessibilityBundleIdentifier];

  return v3;
}

- (BOOL)_accessibilityIsInAppSwitcher
{
  objc_opt_class();
  char v3 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  char v4 = __UIAccessibilityCastAsSafeCategory();

  char v5 = [v4 _accessibilityIsInAppSwitcher];
  return v5;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  char v3 = (objc_class *)objc_opt_class();
  char v4 = NSStringFromClass(v3);

  return v4;
}

- (CGRect)accessibilityFrame
{
  char v3 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];

  if (v3)
  {
    char v4 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
    [v4 accessibilityFrame];
    unint64_t v6 = v5;
    unint64_t v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v10 = 10.0;
    *(double *)&unint64_t v6 = -100.0;
    *(double *)&unint64_t v8 = -100.0;
    double v12 = 10.0;
  }
  double v13 = *(double *)&v6;
  double v14 = *(double *)&v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityLabel
{
  char v3 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];

  if (v3)
  {
    char v4 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
    unint64_t v5 = [v4 accessibilityLabel];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)accessibilityIdentifier
{
  char v3 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  char v4 = [v3 accessibilityIdentifier];

  unint64_t v5 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  LODWORD(v3) = [v5 _accessibilityHasMultipleWindows];

  if (v3)
  {
    uint64_t v6 = [v4 stringByAppendingString:@":has-multiple-windows"];

    char v4 = (void *)v6;
  }

  return v4;
}

- (id)accessibilityHint
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  char v3 = [v2 accessibilityHint];

  return v3;
}

- (BOOL)_accessibilityIsVisibleByCompleteHitTest
{
  char v3 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];

  if (!v3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBAppSwitcherAppAccessibilityElement;
  return [(SBAppSwitcherAppAccessibilityElement *)&v5 _accessibilityIsVisibleByCompleteHitTest];
}

- (id)accessibilityPath
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  char v3 = [v2 accessibilityPath];

  return v3;
}

- (id)accessibilityValue
{
  char v3 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  char v4 = [v3 accessibilityValue];

  if ([(SBAppSwitcherAppAccessibilityElement *)self _axIsAppActive])
  {
    objc_super v5 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
    char v6 = [v5 _accessibilityIsShelfItemContainer];

    if ((v6 & 1) == 0)
    {
      double v9 = accessibilityLocalizedString(@"app.running.status");
      uint64_t v7 = __UIAXStringForVariables();

      char v4 = (void *)v7;
    }
  }

  return v4;
}

- (id)accessibilityCustomActions
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  char v3 = [v2 accessibilityCustomActions];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_super v5 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];

  if (v5)
  {
    char v6 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
    char v7 = [v6 accessibilityScroll:a3];

    if (v7)
    {
      return 1;
    }
    else
    {
      double v9 = [(SBAppSwitcherAppAccessibilityElement *)self accessibilityContainer];
      char v10 = [v9 accessibilityScroll:a3];

      return v10;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBAppSwitcherAppAccessibilityElement;
    return [(SBAppSwitcherAppAccessibilityElement *)&v11 accessibilityScroll:a3];
  }
}

- (id)_accessibilityScrollStatus
{
  unint64_t v3 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];

  if (v3)
  {
    char v4 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
    objc_super v5 = [v4 _accessibilityScrollStatus];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBAppSwitcherAppAccessibilityElement;
    objc_super v5 = [(SBAppSwitcherAppAccessibilityElement *)&v7 _accessibilityScrollStatus];
  }

  return v5;
}

- (BOOL)_accessibilityScrollToVisible
{
  unint64_t v3 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];

  if (v3)
  {
    char v4 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
    char v5 = [v4 _accessibilityScrollToVisible];
  }
  else
  {
    char v4 = [(SBAppSwitcherAppAccessibilityElement *)self contentView];
    char v5 = [v4 _axScrollToAppElement:self];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)_accessibilityCanPerformAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v4 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  LOBYTE(v3) = [v4 _accessibilityCanPerformAction:v3];

  return v3;
}

- (id)_accessibilityPreferredScrollActions
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  uint64_t v3 = [v2 _accessibilityPreferredScrollActions];

  return v3;
}

- (id)_accessibilityScrollAncestor
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  uint64_t v3 = [v2 _accessibilityScrollAncestor];

  return v3;
}

- (BOOL)_accessibilityUpdatesSwitchMenu
{
  return 1;
}

- (BOOL)_axIsAppActive
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self appLayout];
  uint64_t v3 = [v2 _axBundleIdentifier];

  char v4 = [MEMORY[0x263F3F460] sharedInstanceIfExists];
  char v5 = [v4 allProcesses];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_super v11 = objc_msgSend(v10, "bundleIdentifier", (void)v15);
        int v12 = [v11 isEqualToString:v3];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  char v13 = [v7 isRunning];
  return v13;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)_accessibilityIsDescendantOfElement:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Sbappswitcherp_0.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(SBAppSwitcherAppAccessibilityElement *)self itemContainer],
        char v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 _accessibilityIsDescendantOfElement:v5],
        v5,
        (v6 & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBAppSwitcherAppAccessibilityElement;
    BOOL v7 = [(SBAppSwitcherAppAccessibilityElement *)&v9 _accessibilityIsDescendantOfElement:v4];
  }

  return v7;
}

- (BOOL)_accessibilitySetNativeFocus
{
  v2 = [(SBAppSwitcherAppAccessibilityElement *)self itemContainer];
  uint64_t v3 = [v2 safeValueForKey:@"_pageView"];
  char v4 = [v3 _accessibilitySetNativeFocus];

  return v4;
}

- (BOOL)isControlCenter
{
  return self->_isControlCenter;
}

- (SBAppLayoutAccessibility)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
}

- (SBFluidSwitcherItemContainerAccessibility)itemContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemContainer);

  return (SBFluidSwitcherItemContainerAccessibility *)WeakRetained;
}

- (void)setItemContainer:(id)a3
{
}

- (SBFluidSwitcherContentViewAccessibility)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  return (SBFluidSwitcherContentViewAccessibility *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (SBAppSwticherAppAccessibilityElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SBAppSwticherAppAccessibilityElementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_itemContainer);

  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end