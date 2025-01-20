@interface AKPageControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)openPopoverForHighlightAnnotation:(id)a3;
@end

@implementation AKPageControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKPageController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKPageController", @"_popoverPresentingViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKPageController", @"openPopoverForHighlightAnnotation:", "v", "@", 0);
}

- (void)openPopoverForHighlightAnnotation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKPageControllerAccessibility;
  [(AKPageControllerAccessibility *)&v8 openPopoverForHighlightAnnotation:v4];
  v5 = [(AKPageControllerAccessibility *)self safeValueForKey:@"_popoverPresentingViewController"];
  MEMORY[0x245640800](@"MUPDFContentViewController");
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [(AKPageControllerAccessibility *)self safeValueForKeyPath:@"highlightColorEditorController"];
    [v6 _axHighlightPopoverPresentedForAnnotation:v4 withHighlightController:v7 pullFocus:1];
  }
}

@end