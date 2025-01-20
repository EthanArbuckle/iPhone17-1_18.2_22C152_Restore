@interface PXGReusableAXInfoAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (id)_axPXGScrollView;
- (id)accessibilityContainer;
- (void)applyToInfo:(id)a3;
@end

@implementation PXGReusableAXInfoAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXGReusableAXInfo";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXGReusableAXInfo" conformsToProtocol:@"UIFocusItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"frame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axContainingGroup", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axNextResponder", "@", 0);
  [v3 validateProtocol:@"PXGAXResponder" hasMethod:@"axContainingScrollViewForAXGroup:" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"_PXUIScrollView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"applyToInfo:", "v", "@", 0);
}

- (id)_axPXGScrollView
{
  id v3 = [(PXGReusableAXInfoAccessibility *)self safeValueForKey:@"axContainingGroup"];
  v4 = [v3 safeValueForKey:@"axNextResponder"];
  v5 = [v4 axContainingScrollViewForAXGroup:self];

  return v5;
}

- (CGRect)accessibilityFrame
{
  [(PXGReusableAXInfoAccessibility *)self safeCGRectForKey:@"frame"];
  id v3 = [(PXGReusableAXInfoAccessibility *)self _axPXGScrollView];
  uint64_t v14 = 0;
  v15 = (double *)&v14;
  uint64_t v16 = 0x4010000000;
  v17 = "";
  long long v4 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v18 = *MEMORY[0x263F001A0];
  long long v19 = v4;
  id v13 = v3;
  AXPerformSafeBlock();
  double v5 = v15[4];
  double v6 = v15[5];
  double v7 = v15[6];
  double v8 = v15[7];

  _Block_object_dispose(&v14, 8);
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

void __52__PXGReusableAXInfoAccessibility_accessibilityFrame__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) safeValueForKey:@"window"];
  objc_msgSend(v7, "convertRect:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
}

- (void)applyToInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGReusableAXInfoAccessibility;
  [(PXGReusableAXInfoAccessibility *)&v4 applyToInfo:a3];
  if ([(PXGReusableAXInfoAccessibility *)self conformsToProtocol:&unk_26F431750]) {
    [MEMORY[0x263F1C648] updateRingForFocusItem:self];
  }
}

- (id)accessibilityContainer
{
  v2 = [(PXGReusableAXInfoAccessibility *)self parentFocusEnvironment];
  uint64_t v3 = [v2 focusItemContainer];

  return v3;
}

@end