@interface HUControllableItemCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axOpenControls:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUControllableItemCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUControllableItemCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUControllableItemCollectionViewController" isKindOfClass:@"UICollectionViewController"];
  [v3 validateClass:@"HUControllableItemCollectionViewController" hasInstanceVariable:@"_quickControlPresentationCoordinator" withType:"HUQuickControlPresentationCoordinator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPresentationCoordinator", @"setPresentationContext:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPresentationCoordinator", @"setPresentationContext:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPresentationCoordinator", @"_preparePressedItemContextForItem:startApplier:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPresentationCoordinator", @"_beginControlPresentationAnimated:", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPresentationCoordinator", @"_pressGestureDidBeginWithLocation:", "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPresentationCoordinator", @"_pressGestureDidEnd:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPresentationCoordinator", @"delegate", "@", 0);
  [v3 validateProtocol:@"HUQuickControlPresentationCoordinatorDelegate" hasMethod:@"presentationCoordinator:contextForPresentationAtPoint:" isInstanceMethod:1 isRequired:1];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"item", "@", 0);
  [v3 validateClass:@"HUGridServiceCell" isKindOfClass:@"HUGridCell"];
  [v3 validateClass:@"HUGridCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"UICollectionViewCell" isKindOfClass:@"UICollectionReusableView"];
  [v3 validateClass:@"UICollectionReusableView" hasInstanceVariable:@"_collectionView" withType:"UICollectionView"];
  [v3 validateClass:@"HFAbstractControlStatusItem"];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v5 = [(HUControllableItemCollectionViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    unsigned __int8 v7 = [v5 accessibilityScrollRightPage];
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    unsigned __int8 v7 = [v5 accessibilityScrollLeftPage];
  }
  else
  {
LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)HUControllableItemCollectionViewControllerAccessibility;
    unsigned __int8 v7 = [(HUControllableItemCollectionViewControllerAccessibility *)&v10 accessibilityScroll:a3];
  }
LABEL_7:
  BOOL v8 = v7;

  return v8;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HUControllableItemCollectionViewControllerAccessibility;
  [(HUControllableItemCollectionViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:AXOpenControlsNotification object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__axOpenControls_ name:AXOpenControlsNotification object:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUControllableItemCollectionViewControllerAccessibility;
  [(HUControllableItemCollectionViewControllerAccessibility *)&v3 viewDidLoad];
  [(HUControllableItemCollectionViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axOpenControls:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_super v5 = [v4 object];
  v6 = __UIAccessibilityCastAsClass();

  unsigned __int8 v7 = [v6 safeValueForKeyPath:@"_collectionView.delegate"];
  if ([(HUControllableItemCollectionViewControllerAccessibility *)self isEqual:v7])
  {
    [v6 center];
    BOOL v8 = [v6 safeValueForKey:@"item"];
    MEMORY[0x2456509F0](@"HUGridCell");
    if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
    {
      v9 = [(HUControllableItemCollectionViewControllerAccessibility *)self safeValueForKey:@"_quickControlPresentationCoordinator"];
      objc_super v10 = [v9 safeValueForKey:@"delegate"];
      MEMORY[0x2456509F0](@"HUQuickControlPresentationCoordinator");
      if (objc_opt_isKindOfClass())
      {
        v11 = NSProtocolFromString(&cfstr_Huquickcontrol_24.isa);
        int v12 = [v10 conformsToProtocol:v11];

        if (v12)
        {
          id v13 = v9;
          id v14 = v10;
          id v15 = v8;
          AXPerformSafeBlock();
        }
      }
    }
  }
}

id __75__HUControllableItemCollectionViewControllerAccessibility__axOpenControls___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = objc_msgSend(*(id *)(a1 + 40), "presentationCoordinator:contextForPresentationAtPoint:", v2, *(double *)(a1 + 56), *(double *)(a1 + 64));
  [v2 setPresentationContext:v3];

  MEMORY[0x2456509F0](@"HFAbstractControlStatusItem");
  LOBYTE(v2) = objc_opt_isKindOfClass();
  [*(id *)(a1 + 32) _preparePressedItemContextForItem:*(void *)(a1 + 48) startApplier:(v2 & 1) == 0];
  id result = (id)[*(id *)(a1 + 32) _beginControlPresentationAnimated:1];
  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_pressGestureDidBeginWithLocation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    objc_super v5 = *(void **)(a1 + 32);
    return (id)[v5 _pressGestureDidEnd:1];
  }
  return result;
}

@end