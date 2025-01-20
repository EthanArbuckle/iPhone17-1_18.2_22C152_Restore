@interface CardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axCollapseCard;
- (BOOL)_axExpandCard;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityContaineeViewController;
- (id)_accessibilityContainerViewController;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityContaineeLayout;
- (void)layoutSubviews;
@end

@implementation CardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ContainerViewController", @"setLayoutIfSupported: animated:", "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ModalContaineeViewController", @"_dismissContainee", "v", 0);
  [v3 validateClass:@"ContaineeViewController"];
}

- (BOOL)_axExpandCard
{
  v2 = [(CardViewAccessibility *)self _accessibilityContainerViewController];
  uint64_t v3 = [v2 safeIntegerForKey:@"containeeLayout"];
  if (v3 == 2)
  {
    v4 = v8;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v5 = __38__CardViewAccessibility__axExpandCard__block_invoke_2;
  }
  else
  {
    if (v3 != 1)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    v4 = v9;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v5 = __38__CardViewAccessibility__axExpandCard__block_invoke;
  }
  v4[2] = v5;
  v4[3] = &unk_26512D688;
  v4[4] = v2;
  AXPerformSafeBlock();

  BOOL v6 = 1;
LABEL_7:

  return v6;
}

uint64_t __38__CardViewAccessibility__axExpandCard__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLayoutIfSupported:2 animated:1];
}

uint64_t __38__CardViewAccessibility__axExpandCard__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLayoutIfSupported:3 animated:1];
}

- (BOOL)_axCollapseCard
{
  v2 = [(CardViewAccessibility *)self _accessibilityContainerViewController];
  uint64_t v3 = [v2 safeIntegerForKey:@"containeeLayout"];
  if ((unint64_t)(v3 - 3) >= 2)
  {
    if (v3 != 2)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    v4 = v9;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v5 = __40__CardViewAccessibility__axCollapseCard__block_invoke;
  }
  else
  {
    v4 = v8;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v5 = __40__CardViewAccessibility__axCollapseCard__block_invoke_2;
  }
  v4[2] = v5;
  v4[3] = &unk_26512D688;
  v4[4] = v2;
  AXPerformSafeBlock();

  BOOL v6 = 1;
LABEL_7:

  return v6;
}

uint64_t __40__CardViewAccessibility__axCollapseCard__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLayoutIfSupported:1 animated:1];
}

uint64_t __40__CardViewAccessibility__axCollapseCard__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLayoutIfSupported:2 animated:1];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CardViewAccessibility;
  [(CardViewAccessibility *)&v4 layoutSubviews];
  [(CardViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"AXMapVisibleRegionDidChange" object:0];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)_accessibilityContainerViewController
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  if (v2)
  {
    while (1)
    {
      uint64_t v3 = [MEMORY[0x263F1CB68] viewControllerForView:v2];
      objc_super v4 = __UIAccessibilitySafeClass();

      if (v4)
      {
        MEMORY[0x245653010](@"ContainerViewController");
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      uint64_t v5 = [v2 superview];

      v2 = (void *)v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    objc_super v4 = 0;
  }

  return v4;
}

- (id)_accessibilityContaineeViewController
{
  v2 = [(CardViewAccessibility *)self _accessibilityContainerViewController];
  uint64_t v3 = [v2 safeValueForKey:@"currentViewController"];

  return v3;
}

- (unint64_t)_accessibilityContaineeLayout
{
  v2 = [(CardViewAccessibility *)self _accessibilityContainerViewController];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 safeIntegerForKey:@"containeeLayout"];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [MEMORY[0x263F1CB68] viewControllerForView:self];
  MEMORY[0x245653010](@"ModalContaineeViewController");
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v5 = v2;
    AXPerformSafeBlock();
  }
  return isKindOfClass & 1;
}

uint64_t __51__CardViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissContainee];
}

- (BOOL)accessibilityViewIsModal
{
  if (AXDeviceIsPad()) {
    return 0;
  }
  unint64_t v4 = [(CardViewAccessibility *)self _accessibilityContaineeViewController];
  MEMORY[0x245653010](@"CollectionCreateViewController");
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0
    || [(CardViewAccessibility *)self _accessibilityContaineeLayout] == 3;

  return v3;
}

@end