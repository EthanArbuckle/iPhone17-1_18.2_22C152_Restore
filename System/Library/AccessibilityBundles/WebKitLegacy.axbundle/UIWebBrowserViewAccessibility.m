@interface UIWebBrowserViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)accessibilityContainerType;
- (void)assistFormNode:(id)a3;
@end

@implementation UIWebBrowserViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWebBrowserView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)assistFormNode:(id)a3
{
  id v4 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() || !*MEMORY[0x263F81470])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIWebBrowserViewAccessibility;
    [(UIWebBrowserViewAccessibility *)&v5 assistFormNode:v4];
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __48__UIWebBrowserViewAccessibility_assistFormNode___block_invoke()
{
  v0 = AXUIKeyboardWindow();
  Class v1 = NSClassFromString(&cfstr_Uipickerview.isa);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__UIWebBrowserViewAccessibility_assistFormNode___block_invoke_2;
  v3[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v3[4] = v1;
  v2 = [v0 _accessibilityFindDescendant:v3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v2);
}

BOOL __48__UIWebBrowserViewAccessibility_assistFormNode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAccessibilityElement])
  {
    id v4 = [v3 _accessibilityAncestorIsKindOf:*(void *)(a1 + 32)];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)accessibilityContainerType
{
  v3.receiver = self;
  v3.super_class = (Class)UIWebBrowserViewAccessibility;
  return [(UIWebBrowserViewAccessibility *)&v3 accessibilityContainerType];
}

@end