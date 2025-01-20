@interface CCUIMenuModuleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityControlCenterMenuItemAtIndexIsValid:(int64_t)a3;
- (BOOL)_accessibilityControlCenterShouldExpandContentModule;
- (CGRect)_accessibilityControlCenterButtonFrame;
- (id)_accessibilityControlCenterButtonHint;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
- (id)_accessibilityModuleViewElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CCUIMenuModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIMenuModuleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIMenuModuleViewController" isKindOfClass:@"CCUIButtonModuleViewController"];
  [v3 validateClass:@"CCUIMenuModuleViewController" hasProperty:@"title" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIMenuModuleViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIMenuModuleViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIMenuModuleViewController", @"shouldBeginTransitionToExpandedContentModule", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewController", @"isExpanded", "B", 0);
  [v3 validateClass:@"CCUIMenuModuleViewController" hasInstanceVariable:@"_menuItemsContainer" withType:"UIStackView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)CCUIMenuModuleViewControllerAccessibility;
  [(CCUIMenuModuleViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CCUIMenuModuleViewControllerAccessibility *)self safeValueForKey:@"_titleLabel"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__CCUIMenuModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_265119688;
  v8[4] = self;
  [v3 setIsAccessibilityElementBlock:v8];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  objc_initWeak(&location, self);
  v4 = [(CCUIMenuModuleViewControllerAccessibility *)self safeUIViewForKey:@"_menuItemsContainer"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__CCUIMenuModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_2651196B0;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityElementsBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __87__CCUIMenuModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) safeBoolForKey:@"isExpanded"];
}

id __87__CCUIMenuModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityModuleViewElements];

  return v2;
}

- (id)_accessibilityControlCenterButtonLabel
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_4:
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v6 = [v5 isEqualToString:@"SleepModeControlCenterButton.SleepModeButtonViewController"];

    if (v6)
    {
      id v3 = accessibilityLocalizedString(@"sleep.mode.module.label");
    }
    else
    {
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = [v7 localizedInfoDictionary];
      objc_super v9 = [v8 objectForKey:*MEMORY[0x263EFFA90]];

      if ([v9 length])
      {
        id v10 = v9;
      }
      else
      {
        v12.receiver = self;
        v12.super_class = (Class)CCUIMenuModuleViewControllerAccessibility;
        id v10 = [(CCUIMenuModuleViewControllerAccessibility *)&v12 accessibilityLabel];
      }
      id v3 = v10;
    }
    goto LABEL_10;
  }
  id v3 = [(CCUIMenuModuleViewControllerAccessibility *)self safeStringForKey:@"title"];
  if (![v3 length])
  {

    goto LABEL_4;
  }
LABEL_10:

  return v3;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CCUIMenuModuleViewControllerAccessibility *)self safeStringForKey:@"title"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CCUIMenuModuleViewControllerAccessibility;
    id v3 = [(CCUIMenuModuleViewControllerAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

- (id)_accessibilityControlCenterButtonHint
{
  return 0;
}

- (BOOL)_accessibilityControlCenterShouldExpandContentModule
{
  int v3 = [(CCUIMenuModuleViewControllerAccessibility *)self safeBoolForKey:@"shouldBeginTransitionToExpandedContentModule"];
  if (v3) {
    LOBYTE(v3) = [(CCUIMenuModuleViewControllerAccessibility *)self safeBoolForKey:@"isExpanded"] ^ 1;
  }
  return v3;
}

- (CGRect)_accessibilityControlCenterButtonFrame
{
  objc_opt_class();
  int v3 = [(CCUIMenuModuleViewControllerAccessibility *)self safeValueForKey:@"_buttonModuleView"];
  __UIAccessibilityCastAsClass();
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();

  [(UIView *)v4 bounds];
  CGRect v20 = UIAccessibilityConvertFrameToScreenCoordinates(v19, v4);
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  if ([(CCUIMenuModuleViewControllerAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    objc_super v9 = [(CCUIMenuModuleViewControllerAccessibility *)self safeValueForKey:@"_titleLabel"];
    id v10 = v9;
    if (v9)
    {
      [v9 accessibilityFrame];
      v24.origin.CGFloat x = v11;
      v24.origin.CGFloat y = v12;
      v24.size.CGFloat width = v13;
      v24.size.CGFloat height = v14;
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGRect v22 = CGRectUnion(v21, v24);
      CGFloat x = v22.origin.x;
      CGFloat y = v22.origin.y;
      CGFloat width = v22.size.width;
      CGFloat height = v22.size.height;
    }
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIMenuModuleViewControllerAccessibility;
  [(CCUIMenuModuleViewControllerAccessibility *)&v3 viewDidLoad];
  [(CCUIMenuModuleViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_accessibilityModuleViewElements
{
  objc_super v3 = [(CCUIMenuModuleViewControllerAccessibility *)self _accessibilityValueForKey:@"AXChildren"];
  if (!v3)
  {
    objc_super v3 = [MEMORY[0x263EFF980] array];
    [(CCUIMenuModuleViewControllerAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"AXChildren"];
  }
  LOBYTE(location) = 0;
  objc_opt_class();
  v4 = [(CCUIMenuModuleViewControllerAccessibility *)self safeUIViewForKey:@"_menuItemsContainer"];
  objc_super v5 = __UIAccessibilityCastAsClass();

  int v6 = [v5 arrangedSubviews];
  unint64_t v7 = [v6 count];

  unint64_t v8 = [v3 count];
  unint64_t v9 = [v3 count];
  if (v8 <= v7)
  {
    if (v9 < v7)
    {
      objc_initWeak(&location, self);
      for (unint64_t i = 0; i < v7 - [v3 count]; ++i)
      {
        CGFloat v11 = [[AXCCMenuModuleElement alloc] initWithAccessibilityContainer:self];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __77__CCUIMenuModuleViewControllerAccessibility__accessibilityModuleViewElements__block_invoke;
        v13[3] = &unk_2651196D8;
        objc_copyWeak(&v14, &location);
        v13[4] = self;
        [(AXCCMenuModuleElement *)v11 setProvider:v13];
        -[AXCCMenuModuleElement setIndex:](v11, "setIndex:", [v3 count]);
        [v3 addObject:v11];
        objc_destroyWeak(&v14);
      }
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(v3, "removeObjectsInRange:", v7, v9 - v7);
  }

  return v3;
}

id __77__CCUIMenuModuleViewControllerAccessibility__accessibilityModuleViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 index];
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = [WeakRetained safeUIViewForKey:@"_menuItemsContainer"];
  unint64_t v7 = __UIAccessibilityCastAsClass();

  unint64_t v8 = [v7 arrangedSubviews];

  if (v4 < [v8 count]
    && [*(id *)(a1 + 32) _accessibilityControlCenterMenuItemAtIndexIsValid:v4])
  {
    unint64_t v9 = [v8 objectAtIndexedSubscript:v4];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_accessibilityControlCenterMenuItemAtIndexIsValid:(int64_t)a3
{
  return 1;
}

@end