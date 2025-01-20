@interface MiroContentEditorViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)clipCollection:(id)a3 didSnapToIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MiroContentEditorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MiroContentEditorViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroContentEditorViewController", @"topToolbar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroContentEditorViewController", @"timelineViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroContentEditorViewController", @"editorViewController", "@", 0);
  [v3 validateClass:@"MiroContentEditorViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroContentEditorViewController", @"bottomToolbar", "@", 0);
  [v3 validateClass:@"MiroEditorClipCollectionViewController" isKindOfClass:@"UICollectionViewController"];
  [v3 validateClass:@"MiroTimelineClipCollectionViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroContentEditorViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroContentEditorViewController", @"clipCollection: didSnapToIndexPath:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroTimelineClipCollectionViewController", @"snapToIndexPath: animated:", "v", "@", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)MiroContentEditorViewControllerAccessibility;
  [(MiroContentEditorViewControllerAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MiroContentEditorViewControllerAccessibility *)self safeValueForKeyPath:@"topToolbar"];
  v4 = [(MiroContentEditorViewControllerAccessibility *)self safeValueForKeyPath:@"timelineViewController.view"];
  objc_opt_class();
  v5 = [(MiroContentEditorViewControllerAccessibility *)self safeValueForKeyPath:@"editorViewController.collectionView"];
  v6 = __UIAccessibilityCastAsClass();

  [v6 accessibilitySetIdentification:@"AccessibilityMiroUICollectionView"];
  v7 = [(MiroContentEditorViewControllerAccessibility *)self safeValueForKeyPath:@"bottomToolbar"];
  objc_opt_class();
  v8 = [(MiroContentEditorViewControllerAccessibility *)self safeValueForKey:@"view"];
  v9 = __UIAccessibilityCastAsClass();

  v10 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 4, v3, v6, v4, v7);
  [v9 setAccessibilityElements:v10];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MiroContentEditorViewControllerAccessibility;
  [(MiroContentEditorViewControllerAccessibility *)&v3 viewDidLoad];
  [(MiroContentEditorViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)clipCollection:(id)a3 didSnapToIndexPath:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MiroContentEditorViewControllerAccessibility;
  id v7 = a3;
  [(MiroContentEditorViewControllerAccessibility *)&v10 clipCollection:v7 didSnapToIndexPath:v6];
  id v8 = [(MiroContentEditorViewControllerAccessibility *)self safeValueForKey:@"editorViewController"];

  if (v8 == v7)
  {
    id v9 = v6;
    AXPerformSafeBlock();
  }
}

void __82__MiroContentEditorViewControllerAccessibility_clipCollection_didSnapToIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"timelineViewController"];
  [v2 snapToIndexPath:*(void *)(a1 + 40) animated:1];
}

@end