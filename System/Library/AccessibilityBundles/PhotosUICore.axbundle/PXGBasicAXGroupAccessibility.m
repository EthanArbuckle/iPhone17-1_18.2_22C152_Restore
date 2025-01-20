@interface PXGBasicAXGroupAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (id)_axPXGScrollView;
- (void)_updateLayoutIfNeeded;
- (void)updateSubgroupsWithChangeDetails:(id)a3;
@end

@implementation PXGBasicAXGroupAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXGBasicAXGroup";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axScrollParent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axParent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axGroupSource", "@", 0);
  [v3 validateProtocol:@"PXGAXGroupSource" hasMethod:@"axConvertRect:fromDescendantGroup:" isInstanceMethod:1 isRequired:1];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axNextResponder", "@", 0);
  [v3 validateProtocol:@"PXGAXResponder" hasMethod:@"axContainingScrollViewForAXGroup:" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"_PXUIScrollView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"_updateLayoutIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"needsUpdate", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"updateSubgroupsWithChangeDetails:", "v", "@", 0);
}

- (id)_axPXGScrollView
{
  id v3 = [(PXGBasicAXGroupAccessibility *)self safeValueForKey:@"axScrollParent"];
  v4 = [v3 safeValueForKey:@"axNextResponder"];
  v5 = [v4 axContainingScrollViewForAXGroup:self];

  return v5;
}

- (CGRect)accessibilityFrame
{
  [(PXGBasicAXGroupAccessibility *)self safeCGRectForKey:@"axFrame"];
  id v3 = [(PXGBasicAXGroupAccessibility *)self safeValueForKey:@"axScrollParent"];
  v4 = [(PXGBasicAXGroupAccessibility *)self safeValueForKey:@"axParent"];
  v5 = [(PXGBasicAXGroupAccessibility *)self _axPXGScrollView];
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x4010000000;
  v21 = "";
  long long v6 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v22 = *MEMORY[0x263F001A0];
  long long v23 = v6;
  id v15 = v4;
  id v16 = v3;
  id v17 = v5;
  AXPerformSafeBlock();
  double v7 = v19[4];
  double v8 = v19[5];
  double v9 = v19[6];
  double v10 = v19[7];

  _Block_object_dispose(&v18, 8);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

void __50__PXGBasicAXGroupAccessibility_accessibilityFrame__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) safeValueForKey:@"axGroupSource"];
    objc_msgSend(v2, "axConvertRect:fromDescendantGroup:", *(void *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *(double *)(a1 + 64);
    double v6 = *(double *)(a1 + 72);
    double v8 = *(double *)(a1 + 80);
    double v10 = *(double *)(a1 + 88);
  }
  id v16 = [*(id *)(a1 + 48) safeValueForKey:@"window"];
  objc_msgSend(v16, "convertRect:fromView:", *(void *)(a1 + 48), v4, v6, v8, v10);
  double v11 = *(void **)(*(void *)(a1 + 56) + 8);
  v11[4] = v12;
  v11[5] = v13;
  v11[6] = v14;
  v11[7] = v15;
}

- (void)_updateLayoutIfNeeded
{
  v8[2] = *MEMORY[0x263EF8340];
  int v3 = [(PXGBasicAXGroupAccessibility *)self safeBoolForKey:@"needsUpdate"];
  v6.receiver = self;
  v6.super_class = (Class)PXGBasicAXGroupAccessibility;
  [(PXGBasicAXGroupAccessibility *)&v6 _updateLayoutIfNeeded];
  if (v3)
  {
    double v4 = [MEMORY[0x263F08A00] defaultCenter];
    v7[0] = @"AXPhotosGridGroupKey";
    v7[1] = @"AXPhotosGridUpdateKey";
    v8[0] = self;
    v8[1] = &unk_26F42DF70;
    double v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
    [v4 postNotificationName:@"AXPhotosGridGroupDataChanged" object:self userInfo:v5];
  }
}

- (void)updateSubgroupsWithChangeDetails:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)PXGBasicAXGroupAccessibility;
  id v4 = a3;
  [(PXGBasicAXGroupAccessibility *)&v8 updateSubgroupsWithChangeDetails:v4];
  int v5 = [v4 hasAnyInsertionsRemovalsOrMoves];

  if (v5)
  {
    objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
    v9[0] = @"AXPhotosGridGroupKey";
    v9[1] = @"AXPhotosGridUpdateKey";
    v10[0] = self;
    v10[1] = &unk_26F42DF70;
    double v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    [v6 postNotificationName:@"AXPhotosGridGroupDataChanged" object:self userInfo:v7];
  }
}

@end