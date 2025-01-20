@interface MediaControlsEndpointsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MediaControlsEndpointsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsEndpointsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsEndpointsViewController", @"viewWillAppear:", "v", "B", 0);
  [v3 validateClass:@"MediaControlsEndpointsViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"MediaControlsEndpointsViewController" isKindOfClass:@"MediaControlsCollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsCollectionViewController", @"scrollView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsEndpointsViewControllerAccessibility;
  [(MediaControlsEndpointsViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MediaControlsEndpointsViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setAccessibilityContainerType:4];
  v4 = accessibilityLocalizedString(@"media.controls.container.label");
  [v3 setAccessibilityLabel:v4];

  [v3 setAccessibilityNavigationStyle:2];
  v5 = [(MediaControlsEndpointsViewControllerAccessibility *)self safeValueForKey:@"scrollView"];
  [v5 accessibilitySetIdentification:@"AXMediaControlsScrollViewIdentifier"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsEndpointsViewControllerAccessibility;
  [(MediaControlsEndpointsViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(MediaControlsEndpointsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __79__MediaControlsEndpointsViewControllerAccessibility_accessibilityPerformEscape__block_invoke;
  v9 = &unk_265130400;
  v10 = self;
  v11 = &v12;
  AXPerformSafeBlock();
  if (*((unsigned char *)v13 + 24))
  {
    BOOL v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MediaControlsEndpointsViewControllerAccessibility;
    BOOL v3 = [(MediaControlsEndpointsViewControllerAccessibility *)&v5 accessibilityPerformEscape];
    *((unsigned char *)v13 + 24) = v3;
  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

void __79__MediaControlsEndpointsViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  BOOL v3 = [v2 parentViewController];
  NSClassFromString(&cfstr_Ccuicontentmod.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [v2 dismissViewControllerAnimated:1 completion:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end