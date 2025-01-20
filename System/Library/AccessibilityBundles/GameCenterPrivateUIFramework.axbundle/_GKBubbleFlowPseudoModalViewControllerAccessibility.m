@interface _GKBubbleFlowPseudoModalViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _GKBubbleFlowPseudoModalViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_GKBubbleFlowPseudoModalViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_GKBubbleFlowPseudoModalViewControllerAccessibility;
  [(_GKBubbleFlowPseudoModalViewControllerAccessibility *)&v5 viewWillAppear:a3];
  v4 = [(_GKBubbleFlowPseudoModalViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v4 setAccessibilityViewIsModal:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_GKBubbleFlowPseudoModalViewControllerAccessibility;
  [(_GKBubbleFlowPseudoModalViewControllerAccessibility *)&v5 viewWillDisappear:a3];
  v4 = [(_GKBubbleFlowPseudoModalViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v4 setAccessibilityViewIsModal:0];
}

@end