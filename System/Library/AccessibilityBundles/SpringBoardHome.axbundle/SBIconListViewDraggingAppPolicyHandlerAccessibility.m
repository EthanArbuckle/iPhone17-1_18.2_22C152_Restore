@interface SBIconListViewDraggingAppPolicyHandlerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (Class)_accessibilityIconViewclass;
- (id)_accessibilityFindIconIntersectingDraggedIconForDropSession:(id)a3;
- (id)_axCurrentIconListView;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)handleSpringLoadOnIconView:(id)a3;
@end

@implementation SBIconListViewDraggingAppPolicyHandlerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconListViewDraggingAppPolicyHandler";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListViewDraggingAppPolicyHandler", @"draggingDestinationDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListViewDraggingDestinationDelegate", @"iconListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListViewDraggingAppPolicyHandler", @"handleSpringLoadOnIconView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListViewDraggingDestinationDelegate", @"targetItemForSpringLoadingInteractionInView:atLocation:forDropSession:", "@", "@", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListViewDraggingAppPolicyHandler", @"dropInteraction:sessionDidEnd:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListViewDraggingAppPolicyHandler", @"dropInteraction:performDrop:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"icon", "@", 0);
  [v3 validateClass:@"SBIconView"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBIconView", @"defaultIconImageSize", "{CGSize=dd}", 0);
}

- (void)handleSpringLoadOnIconView:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(id)SBAXIconFolderOpeningTimer invalidate];
    objc_initWeak(&location, v4);
    v5 = (void *)MEMORY[0x263EFFA20];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__SBIconListViewDraggingAppPolicyHandlerAccessibility_handleSpringLoadOnIconView___block_invoke;
    v9[3] = &unk_265158260;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    uint64_t v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v9 block:3.0];
    v7 = (void *)SBAXIconFolderOpeningTimer;
    SBAXIconFolderOpeningTimer = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconListViewDraggingAppPolicyHandlerAccessibility;
    [(SBIconListViewDraggingAppPolicyHandlerAccessibility *)&v8 handleSpringLoadOnIconView:v4];
  }
}

void __82__SBIconListViewDraggingAppPolicyHandlerAccessibility_handleSpringLoadOnIconView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3.receiver = *(id *)(a1 + 32);
    v3.super_class = (Class)SBIconListViewDraggingAppPolicyHandlerAccessibility;
    objc_msgSendSuper2(&v3, sel_handleSpringLoadOnIconView_, WeakRetained);
  }
}

- (id)_axCurrentIconListView
{
  v2 = [(SBIconListViewDraggingAppPolicyHandlerAccessibility *)self safeValueForKey:@"draggingDestinationDelegate"];
  objc_super v3 = [v2 safeUIViewForKey:@"iconListView"];

  return v3;
}

- (id)_accessibilityFindIconIntersectingDraggedIconForDropSession:(id)a3
{
  id v4 = a3;
  v5 = [(SBIconListViewDraggingAppPolicyHandlerAccessibility *)self safeValueForKey:@"draggingDestinationDelegate"];
  uint64_t v6 = [(SBIconListViewDraggingAppPolicyHandlerAccessibility *)self _axCurrentIconListView];
  [v4 locationInView:v6];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  id v11 = v5;
  id v12 = v6;
  id v13 = v4;
  AXPerformSafeBlock();
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  objc_super v8 = objc_msgSend(v7, "safeValueForKey:", @"icon", v10, 3221225472, __115__SBIconListViewDraggingAppPolicyHandlerAccessibility__accessibilityFindIconIntersectingDraggedIconForDropSession___block_invoke, &unk_265158288);

  return v8;
}

uint64_t __115__SBIconListViewDraggingAppPolicyHandlerAccessibility__accessibilityFindIconIntersectingDraggedIconForDropSession___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "targetItemForSpringLoadingInteractionInView:atLocation:forDropSession:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));

  return MEMORY[0x270F9A758]();
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBIconListViewDraggingAppPolicyHandlerAccessibility;
  [(SBIconListViewDraggingAppPolicyHandlerAccessibility *)&v4 dropInteraction:a3 sessionDidEnd:a4];
  SBAXPerformingAXDrag = 0;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBIconListViewDraggingAppPolicyHandlerAccessibility;
  [(SBIconListViewDraggingAppPolicyHandlerAccessibility *)&v4 dropInteraction:a3 performDrop:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (Class)_accessibilityIconViewclass
{
  if (_accessibilityIconViewclass_onceToken != -1) {
    dispatch_once(&_accessibilityIconViewclass_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_accessibilityIconViewclass_sSBIconViewClass;

  return (Class)v2;
}

Class __82__SBIconListViewDraggingAppPolicyHandlerAccessibility__accessibilityIconViewclass__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Sbiconview.isa);
  _accessibilityIconViewclass_sSBIconViewClass = (uint64_t)result;
  return result;
}

@end