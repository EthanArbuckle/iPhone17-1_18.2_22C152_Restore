@interface NTKPageScrollViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsPageViewVisible:(id)a3;
- (BOOL)_accessibilityShouldSwipeBetweenPages;
- (NTKPageScrollViewControllerAccessibility)initWithScrollOrientation:(int64_t)a3;
- (id)_accessibilityCustomActionsForPageView:(id)a3;
- (id)_accessibilityHintForPageView:(id)a3;
- (id)_accessibilityLabelForPageView:(id)a3;
- (id)_accessibilityTouchContainerLabel;
- (id)_accessibilityValueForPageView:(id)a3;
- (id)_axDataSource;
- (id)_axScrollView;
- (unint64_t)_axPageIndexForPageView:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateScrollView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NTKPageScrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKPageScrollViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollViewController", @"initWithScrollOrientation:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollViewController", @"dataSource", "@", 0);
  [v3 validateClass:@"NTKPageScrollViewController" hasInstanceVariable:@"_scrollView" withType:"NTKPageScrollView"];
  [v3 validateClass:@"NTKPageScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollView", @"enumeratePagesWithBlock:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollView", @"enumerateVisiblePagesWithBlock:", "v", "@?", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPageScrollViewControllerAccessibility;
  [(NTKPageScrollViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(NTKPageScrollViewControllerAccessibility *)self _axAnnotateScrollView];
}

- (id)_accessibilityTouchContainerLabel
{
  objc_super v3 = [(NTKPageScrollViewControllerAccessibility *)self _axDataSource];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 _accessibilityTouchContainerLabelForPageScrollViewController:self];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_accessibilityShouldSwipeBetweenPages
{
  objc_super v3 = [(NTKPageScrollViewControllerAccessibility *)self _axDataSource];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 _accessibilityShouldSwipeBetweenPagesForPageScrollViewController:self];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_accessibilityIsPageViewVisible:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = a3;
  AXPerformSafeBlock();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __76__NTKPageScrollViewControllerAccessibility__accessibilityIsPageViewVisible___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _axScrollView];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __76__NTKPageScrollViewControllerAccessibility__accessibilityIsPageViewVisible___block_invoke_2;
  v5[3] = &unk_20508;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateVisiblePagesWithBlock:v5];
}

uint64_t __76__NTKPageScrollViewControllerAccessibility__accessibilityIsPageViewVisible___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)_axPageIndexForPageView:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  id v5 = a3;
  AXPerformSafeBlock();
  unint64_t v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __68__NTKPageScrollViewControllerAccessibility__axPageIndexForPageView___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _axScrollView];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __68__NTKPageScrollViewControllerAccessibility__axPageIndexForPageView___block_invoke_2;
  v5[3] = &unk_20508;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumeratePagesWithBlock:v5];
}

uint64_t __68__NTKPageScrollViewControllerAccessibility__axPageIndexForPageView___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a2)
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)_accessibilityValueForPageView:(id)a3
{
  unint64_t v4 = [(NTKPageScrollViewControllerAccessibility *)self _axPageIndexForPageView:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    unint64_t v6 = v4;
    uint64_t v7 = [(NTKPageScrollViewControllerAccessibility *)self _axDataSource];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v7 _accessibilityValueForPageAtIndex:v6 forPageScrollViewController:self];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_accessibilityLabelForPageView:(id)a3
{
  unint64_t v4 = [(NTKPageScrollViewControllerAccessibility *)self _axPageIndexForPageView:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    unint64_t v6 = v4;
    uint64_t v7 = [(NTKPageScrollViewControllerAccessibility *)self _axDataSource];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v7 _accessibilityLabelForPageAtIndex:v6 forPageScrollViewController:self];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_accessibilityHintForPageView:(id)a3
{
  unint64_t v4 = [(NTKPageScrollViewControllerAccessibility *)self _axPageIndexForPageView:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    unint64_t v6 = v4;
    uint64_t v7 = [(NTKPageScrollViewControllerAccessibility *)self _axDataSource];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v7 _accessibilityHintForPageAtIndex:v6 forPageScrollViewController:self];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_accessibilityCustomActionsForPageView:(id)a3
{
  unint64_t v4 = [(NTKPageScrollViewControllerAccessibility *)self _axPageIndexForPageView:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    unint64_t v6 = v4;
    uint64_t v7 = [(NTKPageScrollViewControllerAccessibility *)self _axDataSource];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v7 _accessibilityCustomActionsForPageAtIndex:v6 forPageScrollViewController:self];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPageScrollViewControllerAccessibility;
  [(NTKPageScrollViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(NTKPageScrollViewControllerAccessibility *)self _axAnnotateScrollView];
}

- (NTKPageScrollViewControllerAccessibility)initWithScrollOrientation:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKPageScrollViewControllerAccessibility;
  id v3 = [(NTKPageScrollViewControllerAccessibility *)&v6 initWithScrollOrientation:a3];
  objc_super v4 = v3;
  if (v3) {
    [(NTKPageScrollViewControllerAccessibility *)v3 _axAnnotateScrollView];
  }
  return v4;
}

- (id)_axScrollView
{
  v2 = [(NTKPageScrollViewControllerAccessibility *)self safeValueForKey:@"_scrollView"];
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_axAnnotateScrollView
{
  objc_opt_class();
  id v3 = [(NTKPageScrollViewControllerAccessibility *)self _axScrollView];
  objc_super v4 = __UIAccessibilityCastAsSafeCategory();

  [v4 setAccessibilityPageScrollViewController:self];
}

- (id)_axDataSource
{
  v2 = [(NTKPageScrollViewControllerAccessibility *)self safeValueForKey:@"dataSource"];
  id v3 = NSProtocolFromString(@"NTKPageScrollViewControllerDataSource");
  unsigned int v4 = [v2 conformsToProtocol:v3];

  if (v4) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

@end