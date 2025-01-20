@interface PRInlineComplicationContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityGetRemoteElement;
- (id)accessibilityRemoteSubstituteChildren:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetRemoteElement:(id)a3;
- (void)_axResetRemoteView;
- (void)_axSetRemoteView;
- (void)_axSetWidgetView;
- (void)invalidate;
- (void)setComplicationDescriptor:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PRInlineComplicationContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRInlineComplicationContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityGetRemoteElement
{
}

- (void)_accessibilitySetRemoteElement:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PRInlineComplicationContainerViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRInlineComplicationContainerViewController", @"setComplicationDescriptor:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRInlineComplicationContainerViewController", @"invalidate", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRInlineComplicationContainerViewController", @"complicationDescriptor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRComplicationDescriptor", @"widgetDescriptor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScene", @"_FBSScene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSScene", @"hostProcess", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSProcess", @"pid", "i", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  [(PRInlineComplicationContainerViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PRInlineComplicationContainerViewControllerAccessibility *)self _axSetWidgetView];
  [(PRInlineComplicationContainerViewControllerAccessibility *)self _axSetRemoteView];
}

- (void)setComplicationDescriptor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  [(PRInlineComplicationContainerViewControllerAccessibility *)&v4 setComplicationDescriptor:a3];
  [(PRInlineComplicationContainerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  [(PRInlineComplicationContainerViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(PRInlineComplicationContainerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  [(PRInlineComplicationContainerViewControllerAccessibility *)&v4 viewDidDisappear:a3];
  [(PRInlineComplicationContainerViewControllerAccessibility *)self _axResetRemoteView];
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  [(PRInlineComplicationContainerViewControllerAccessibility *)&v3 invalidate];
  [(PRInlineComplicationContainerViewControllerAccessibility *)self _axResetRemoteView];
}

- (void)_axSetWidgetView
{
  id v8 = [(PRInlineComplicationContainerViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  objc_super v3 = accessibilityLocalizedString(@"default.calendar.widget");
  objc_super v4 = [(PRInlineComplicationContainerViewControllerAccessibility *)self safeValueForKey:@"complicationDescriptor"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 safeValueForKey:@"widgetDescriptor"];
    uint64_t v7 = AXWidgetAndAppName(v6, 1);

    objc_super v3 = (void *)v7;
  }
  [v8 setAccessibilityLabel:v3];
  [v8 setIsAccessibilityElement:1];
}

- (void)_axSetRemoteView
{
  objc_super v3 = [(PRInlineComplicationContainerViewControllerAccessibility *)self _accessibilityGetRemoteElement];
  if (!v3)
  {
    objc_super v4 = [(PRInlineComplicationContainerViewControllerAccessibility *)self safeUIViewForKey:@"view"];
    v5 = [v4 _accessibilityWindowScene];
    v6 = [v5 safeValueForKeyPath:@"_FBSScene.hostProcess"];
    uint64_t v7 = [v6 safeIntForKey:@"pid"];

    uint64_t v8 = [v4 _accessibilityContextId];
    if (v7 && v8)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263F21678]) initWithUUID:@"posterboard.posterkit.top.widget" andRemotePid:v7 andContextId:v8];
      [v9 setRemoteChildrenDelegate:self];
      [(PRInlineComplicationContainerViewControllerAccessibility *)self _accessibilitySetRemoteElement:v9];
    }
    objc_super v3 = 0;
  }
}

- (void)_axResetRemoteView
{
  objc_super v3 = [(PRInlineComplicationContainerViewControllerAccessibility *)self _accessibilityGetRemoteElement];
  if (v3)
  {
    id v5 = v3;
    objc_super v4 = [(PRInlineComplicationContainerViewControllerAccessibility *)self _accessibilityGetRemoteElement];
    [v4 unregister];

    [(PRInlineComplicationContainerViewControllerAccessibility *)self _accessibilitySetRemoteElement:0];
    objc_super v3 = v5;
  }
}

- (id)accessibilityRemoteSubstituteChildren:(id)a3
{
  objc_super v3 = [(PRInlineComplicationContainerViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  objc_super v4 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end