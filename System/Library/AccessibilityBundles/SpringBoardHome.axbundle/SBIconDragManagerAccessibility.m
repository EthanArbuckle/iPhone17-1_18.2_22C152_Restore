@interface SBIconDragManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsIconDragging;
- (BOOL)canMakeIconViewRecipient:(id)a3;
- (CGPoint)_accessibilityLastPausedLocation;
- (id)_accessibilityGetLastAnnouncedIcon;
- (id)_axGrabbedIconView;
- (id)_axGrabbedIcons;
- (id)_axGrabbedIconsLabel;
- (id)_axIconForIconView:(id)a3;
- (id)_axRecipientIconView;
- (id)_axRowColAnnouncementTimer;
- (id)createNewFolderFromRecipientIcon:(id)a3 grabbedIcon:(id)a4;
- (id)iconDropSessionDidUpdate:(id)a3 inIconListView:(id)a4;
- (int64_t)placeholderMovementForDragHitRegion:(unint64_t)a3 onGridCellIndex:(unint64_t)a4 inListView:(id)a5 forDragWithIdentifier:(id)a6;
- (unint64_t)_axRowColScheduledCol;
- (unint64_t)_axRowColScheduledRow;
- (void)_accessibilityIconMovedToPosition;
- (void)_accessibilitySetLastAnnouncedIcon:(id)a3;
- (void)_accessibilitySetLastPausedLocation:(CGPoint)a3;
- (void)_axDragPauseForDropSession:(id)a3 iconListView:(id)a4;
- (void)_axScheduleAnnouncementForRow:(unint64_t)a3 col:(unint64_t)a4;
- (void)_axSetRowColAnnouncementTimer:(id)a3;
- (void)_axSetRowColScheduledCol:(unint64_t)a3;
- (void)_axSetRowColScheduledRow:(unint64_t)a3;
- (void)_axUpdateDragPauseForDropSession:(id)a3 iconListView:(id)a4;
- (void)iconDropSession:(id)a3 didPauseAtLocation:(CGPoint)a4 inIconListView:(id)a5;
- (void)iconDropSessionDidEnd:(id)a3;
- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4;
- (void)updatePlaceholderPositionForDropSession:(id)a3 inIconListView:(id)a4;
@end

@implementation SBIconDragManagerAccessibility

- (id)_axGrabbedIcons
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__3;
  v8 = __Block_byref_object_dispose__3;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __49__SBIconDragManagerAccessibility__axGrabbedIcons__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__SBIconDragManagerAccessibility__axGrabbedIcons__block_invoke_2;
  v3[3] = &unk_265158038;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateIconDragContextsUsingBlock:v3];
}

+ (id)safeCategoryTargetClassName
{
  return @"SBIconDragManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axRowColAnnouncementTimer
{
}

- (void)_axSetRowColAnnouncementTimer:(id)a3
{
}

- (unint64_t)_axRowColScheduledCol
{
  return MEMORY[0x270F0A478](self, &__SBIconDragManagerAccessibility___axRowColScheduledCol);
}

- (void)_axSetRowColScheduledCol:(unint64_t)a3
{
}

- (unint64_t)_axRowColScheduledRow
{
  return MEMORY[0x270F0A478](self, &__SBIconDragManagerAccessibility___axRowColScheduledRow);
}

- (void)_axSetRowColScheduledRow:(unint64_t)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"iconDropSessionDidUpdate:inIconListView:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"iconDropSessionDidEnd:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"iconDragContextForDropSession:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"iconViewWillBeginDrag:session:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"cancelAllDrags", "v", 0);
  [v3 validateClass:@"SBIconDragContext"];
  [v3 validateClass:@"SBIconListView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"coordinateForIcon:", "{SBIconCoordinate=qq}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconAtPoint:index:", "@", "{CGPoint=dd}", "^Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconViewForIcon:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"iconDropSession:didPauseAtLocation:inIconListView:", "v", "@", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isPlaceholder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"isFolderIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"initialTouchOffsetFromIconImageCenter", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"placeholderMovementForDragHitRegion:onGridCellIndex:inListView:forDragWithIdentifier:draggedIconIdentifiers:", "q", "Q", "Q", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"updatePlaceholderPositionForDropSession:inIconListView:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"uniqueIdentifierForIconDropSession:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"iconDragContextForDragWithIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"canMakeIconViewRecipient:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"setRecipientIconView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"currentEnteredIconListViewLastLocation", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"initialTouchOffsetFromIconImageCenter", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"createNewFolderFromRecipientIcon:grabbedIcon:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"enumerateIconDragContextsUsingBlock:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"isUserActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"draggedIcons", "@", 0);
  [v3 validateClass:@"SBIconDragContext" hasInstanceVariable:@"_sourceIconViews" withType:"NSMutableSet"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"recipientIconView", "@", 0);
  [v3 validateClass:@"SBPlaceholderIcon"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconRowsForCurrentOrientation", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconColumnsForCurrentOrientation", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconRowsForCurrentOrientation", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"icons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"hasOpenFolder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"openedFolder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolder", @"displayName", "@", 0);
}

- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconDragManagerAccessibility;
  [(SBIconDragManagerAccessibility *)&v5 iconViewWillBeginDrag:a3 session:a4];
  uint64_t v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 setNeedsFocusUpdate];
}

- (id)iconDropSessionDidUpdate:(id)a3 inIconListView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SBIconDragManagerAccessibility;
  v8 = [(SBIconDragManagerAccessibility *)&v30 iconDropSessionDidUpdate:v6 inIconListView:v7];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  id v9 = v6;
  AXPerformSafeBlock();
  id v10 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  [v9 locationInView:v7];
  double v12 = v11;
  double v14 = v13;
  [v10 safeCGPointForKey:@"initialTouchOffsetFromIconImageCenter"];
  v17 = objc_msgSend(v7, "iconAtPoint:index:", 0, v12 - v15, v14 - v16);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3010000000;
  v27 = (uint64_t (*)(uint64_t, uint64_t))&unk_2425EB325;
  v28 = 0;
  id v29 = 0;
  uint64_t v23 = MEMORY[0x263EF8330];
  id v18 = v7;
  id v19 = v17;
  AXPerformSafeBlock();
  uint64_t v20 = v25[4];
  uint64_t v21 = v25[5];

  _Block_object_dispose(&v24, 8);
  if (v19 && v21 && v20) {
    -[SBIconDragManagerAccessibility _axScheduleAnnouncementForRow:col:](self, "_axScheduleAnnouncementForRow:col:", v21, v20, v23, 3221225472, __74__SBIconDragManagerAccessibility_iconDropSessionDidUpdate_inIconListView___block_invoke_2, &unk_265157EC0);
  }

  return v8;
}

uint64_t __74__SBIconDragManagerAccessibility_iconDropSessionDidUpdate_inIconListView___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) iconDragContextForDropSession:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __74__SBIconDragManagerAccessibility_iconDropSessionDidUpdate_inIconListView___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) coordinateForIcon:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v3 + 32) = result;
  *(void *)(v3 + 40) = v4;
  return result;
}

- (void)iconDropSessionDidEnd:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBIconDragManagerAccessibility;
  [(SBIconDragManagerAccessibility *)&v4 iconDropSessionDidEnd:a3];
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()) {
    AXPerformSafeBlock();
  }
  [(SBIconDragManagerAccessibility *)self _accessibilitySetLastAnnouncedIcon:0];
}

uint64_t __56__SBIconDragManagerAccessibility_iconDropSessionDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAllDrags];
}

- (CGPoint)_accessibilityLastPausedLocation
{
  MEMORY[0x270F0A448](self, &__SBIconDragManagerAccessibility___accessibilityLastPausedLocation);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_accessibilitySetLastPausedLocation:(CGPoint)a3
{
}

- (void)updatePlaceholderPositionForDropSession:(id)a3 inIconListView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  v32 = __89__SBIconDragManagerAccessibility_updatePlaceholderPositionForDropSession_inIconListView___block_invoke;
  v33 = &unk_265157EC0;
  v36 = &v37;
  v34 = self;
  id v8 = v6;
  id v35 = v8;
  AXPerformSafeBlock();
  id v9 = (id)v38[5];

  _Block_object_dispose(&v37, 8);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __89__SBIconDragManagerAccessibility_updatePlaceholderPositionForDropSession_inIconListView___block_invoke_2;
  uint64_t v26 = &unk_265157EC0;
  id v29 = &v37;
  v27 = self;
  id v10 = v9;
  id v28 = v10;
  AXPerformSafeBlock();
  id v11 = (id)v38[5];

  _Block_object_dispose(&v37, 8);
  [v8 locationInView:v7];
  double v13 = v12;
  double v15 = v14;
  [v11 safeCGPointForKey:@"initialTouchOffsetFromIconImageCenter"];
  double v17 = v13 - v16;
  double v19 = v15 - v18;
  [v7 bounds];
  -[SBIconDragManagerAccessibility _accessibilitySetLastPausedLocation:](self, "_accessibilitySetLastPausedLocation:", fmin(fmax(v17, 1.0), v20 + -1.0), fmin(fmax(v19, 1.0), v21 + -1.0));
  v22.receiver = self;
  v22.super_class = (Class)SBIconDragManagerAccessibility;
  [(SBIconDragManagerAccessibility *)&v22 updatePlaceholderPositionForDropSession:v8 inIconListView:v7];
  [(SBIconDragManagerAccessibility *)self _axDragPauseForDropSession:v8 iconListView:v7];
  [(SBIconDragManagerAccessibility *)self _axUpdateDragPauseForDropSession:v8 iconListView:v7];
}

uint64_t __89__SBIconDragManagerAccessibility_updatePlaceholderPositionForDropSession_inIconListView___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) uniqueIdentifierForIconDropSession:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __89__SBIconDragManagerAccessibility_updatePlaceholderPositionForDropSession_inIconListView___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) iconDragContextForDragWithIdentifier:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)canMakeIconViewRecipient:(id)a3
{
  if (SBAXPerformingAXDrag)
  {
    id v4 = a3;
    [v4 frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v4 frame];
    CGFloat v14 = v13 * 0.2;
    [v4 frame];
    double v16 = v15;

    v34.origin.CGFloat x = v6;
    v34.origin.CGFloat y = v8;
    v34.size.CGFloat width = v10;
    v34.size.CGFloat height = v12;
    CGRect v35 = CGRectInset(v34, v14, v16 * 0.2);
    CGFloat x = v35.origin.x;
    CGFloat y = v35.origin.y;
    CGFloat width = v35.size.width;
    CGFloat height = v35.size.height;
    [(SBIconDragManagerAccessibility *)self _accessibilityLastPausedLocation];
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    CGFloat v25 = x;
    CGFloat v26 = y;
    CGFloat v27 = width;
    CGFloat v28 = height;
    return CGRectContainsPoint(*(CGRect *)&v25, *(CGPoint *)&v22);
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)SBIconDragManagerAccessibility;
    id v30 = a3;
    BOOL v31 = [(SBIconDragManagerAccessibility *)&v32 canMakeIconViewRecipient:v30];

    return v31;
  }
}

- (int64_t)placeholderMovementForDragHitRegion:(unint64_t)a3 onGridCellIndex:(unint64_t)a4 inListView:(id)a5 forDragWithIdentifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  CGFloat v12 = v11;
  if ((a3 & 2) == 0 && SBAXPerformingAXDrag)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    CGFloat v26 = __119__SBIconDragManagerAccessibility_placeholderMovementForDragHitRegion_onGridCellIndex_inListView_forDragWithIdentifier___block_invoke;
    CGFloat v27 = &unk_265157E90;
    CGFloat v28 = self;
    double v13 = &v29;
    id v29 = v11;
    AXPerformSafeBlock();
LABEL_7:

    goto LABEL_8;
  }
  if ((a3 & 2) != 0 && SBAXPerformingAXDrag)
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    double v19 = __119__SBIconDragManagerAccessibility_placeholderMovementForDragHitRegion_onGridCellIndex_inListView_forDragWithIdentifier___block_invoke_2;
    double v20 = &unk_265157FA0;
    uint64_t v21 = self;
    double v13 = &v22;
    id v22 = v11;
    id v23 = v10;
    AXPerformSafeBlock();

    goto LABEL_7;
  }
LABEL_8:
  v16.receiver = self;
  v16.super_class = (Class)SBIconDragManagerAccessibility;
  id v14 = [(SBIconDragManagerAccessibility *)&v16 placeholderMovementForDragHitRegion:a3 onGridCellIndex:a4 inListView:v10 forDragWithIdentifier:v12];

  return (int64_t)v14;
}

void __119__SBIconDragManagerAccessibility_placeholderMovementForDragHitRegion_onGridCellIndex_inListView_forDragWithIdentifier___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) iconDragContextForDragWithIdentifier:*(void *)(a1 + 40)];
  [v1 setRecipientIconView:0];
}

void __119__SBIconDragManagerAccessibility_placeholderMovementForDragHitRegion_onGridCellIndex_inListView_forDragWithIdentifier___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) iconDragContextForDragWithIdentifier:*(void *)(a1 + 40)];
  [v4 safeCGPointForKey:@"currentEnteredIconListViewLastLocation"];
  double v2 = objc_msgSend(*(id *)(a1 + 48), "iconAtPoint:index:", 0);
  double v3 = [*(id *)(a1 + 48) iconViewForIcon:v2];
  [v4 setRecipientIconView:v3];
}

- (id)createNewFolderFromRecipientIcon:(id)a3 grabbedIcon:(id)a4
{
  SBAXIconCreatingFolder = 1;
  v15.receiver = self;
  v15.super_class = (Class)SBIconDragManagerAccessibility;
  id v4 = [(SBIconDragManagerAccessibility *)&v15 createNewFolderFromRecipientIcon:a3 grabbedIcon:a4];
  id v5 = objc_allocWithZone(NSDictionary);
  CGFloat v6 = [NSNumber numberWithInt:1];
  double v7 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, *MEMORY[0x263F216D8], 0);

  id v8 = objc_allocWithZone(MEMORY[0x263F086A0]);
  double v9 = NSString;
  id v10 = accessibilityLocalizedString(@"creating.folder");
  id v11 = [v4 safeValueForKey:@"displayName"];
  CGFloat v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11);
  double v13 = (void *)[v8 initWithString:v12 attributes:v7];

  LODWORD(v12) = *MEMORY[0x263F1CDC8];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v13);
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v12, (id)*MEMORY[0x263F21948]);
  SBAXIconCreatingFolder = 0;

  return v4;
}

- (void)_axDragPauseForDropSession:(id)a3 iconListView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AXSBHIconManagerFromSharedIconController();
  [v6 locationInView:v7];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v47 = MEMORY[0x263EF8330];
  uint64_t v48 = 3221225472;
  v49 = __74__SBIconDragManagerAccessibility__axDragPauseForDropSession_iconListView___block_invoke;
  v50 = &unk_265157FC8;
  id v13 = v7;
  v51 = v13;
  AXPerformSafeBlock();
  if (!SBAXPerformingAXDrag)
  {
    if (v53[3] == _axDragPauseForDropSession_iconListView__previousIconIndex
      && (id)_axDragPauseForDropSession_iconListView__previousIconList == v13)
    {
      goto LABEL_25;
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21980]);
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    id v14 = (void *)SBAXIconMoveSpeakTimer;
    if (!SBAXIconMoveSpeakTimer)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x263EFFA20], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__accessibilityIconMovedToPosition, 0, 1, 1.0, v47, 3221225472, __74__SBIconDragManagerAccessibility__axDragPauseForDropSession_iconListView___block_invoke, &unk_265157FC8, v13, &v52, v10, v12);
      objc_super v16 = (void *)SBAXIconMoveSpeakTimer;
      SBAXIconMoveSpeakTimer = v15;

      id v14 = (void *)SBAXIconMoveSpeakTimer;
    }
    uint64_t v17 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 0.1, v47, v48, v49, v50);
    [v14 setFireDate:v17];

    SBAXIconMovedIntoDock = 0;
    SBAXIconJustMovedIntoDock = 0;
    SBAXIconJustLeftDock = 0;
    uint64_t v18 = [(SBIconDragManagerAccessibility *)self _axGrabbedIcons];
    double v19 = [v18 firstObject];

    if (v19)
    {
      double v20 = [v13 safeValueForKey:@"iconRowsForCurrentOrientation"];
      uint64_t v21 = [v20 unsignedIntegerValue];

      id v22 = [v13 safeValueForKey:@"iconColumnsForCurrentOrientation"];
      unint64_t v23 = [v22 unsignedIntegerValue];

      uint64_t v24 = [(id)_axDragPauseForDropSession_iconListView__previousIconList safeValueForKey:@"iconRowsForCurrentOrientation"];
      uint64_t v25 = [v24 unsignedIntegerValue];

      unint64_t v26 = v53[3];
      SBAXIconMovedY = v26 / v23 + 1;
      SBAXIconMovedX = v26 % v23 + 1;
      if (v21 == 1)
      {
        if (v25 == 1)
        {
          SBAXIconMovedIntoDock = 1;
          CGFloat v27 = (void *)SBAXIconPreItemInDock;
          SBAXIconPreItemInDock = 0;

          CGFloat v28 = (void *)SBAXIconNextItemInDock;
          SBAXIconNextItemInDock = 0;

          id v29 = [v13 safeValueForKey:@"icons"];
          id v30 = v29;
          BOOL v31 = v53;
          uint64_t v32 = v53[3];
          if (v32)
          {
            unint64_t v33 = [v29 count];
            BOOL v31 = v53;
            if (v32 - 1 < v33)
            {
              CGRect v34 = [v30 objectAtIndex:v53[3] - 1];
              uint64_t v35 = [v34 accessibilityLabel];
              v36 = (void *)SBAXIconPreItemInDock;
              SBAXIconPreItemInDock = v35;

              BOOL v31 = v53;
            }
          }
          unint64_t v37 = v31[3];
          if (v37 < [v30 count] - 1)
          {
            v38 = [v30 objectAtIndex:v53[3] + 1];
            uint64_t v39 = [v38 accessibilityLabel];
            v40 = (void *)SBAXIconNextItemInDock;
            SBAXIconNextItemInDock = v39;
          }
          goto LABEL_24;
        }
        SBAXIconJustMovedIntoDock = 1;
        id v42 = &SBAXIconMovedIntoDock;
        goto LABEL_20;
      }
      if (v25 == 1 && v21)
      {
        id v42 = &SBAXIconJustLeftDock;
LABEL_20:
        *id v42 = 1;
LABEL_24:
        uint64_t v45 = [(SBIconDragManagerAccessibility *)self _axGrabbedIconsLabel];
        v46 = (void *)SBAXIconMovedIconLabel;
        SBAXIconMovedIconLabel = v45;

LABEL_25:
        objc_storeStrong((id *)&_axDragPauseForDropSession_iconListView__previousIconList, a4);
        _axDragPauseForDropSession_iconListView__previousIconIndeCGFloat x = v53[3];
        goto LABEL_26;
      }
      v43 = [v8 safeValueForKey:@"hasOpenFolder"];

      if (!v43) {
        goto LABEL_24;
      }
      uint64_t v44 = [v8 safeValueForKeyPath:@"openedFolder.displayName"];
      v41 = (void *)SBAXIconMovedFolderLabel;
      SBAXIconMovedFolderLabel = v44;
    }
    else
    {
      v41 = (void *)SBAXIconMovedFolderLabel;
      SBAXIconMovedFolderLabel = 0;
    }

    goto LABEL_24;
  }
LABEL_26:

  _Block_object_dispose(&v52, 8);
}

void __74__SBIconDragManagerAccessibility__axDragPauseForDropSession_iconListView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "iconAtPoint:index:", *(void *)(*(void *)(a1 + 40) + 8) + 24, *(double *)(a1 + 48), *(double *)(a1 + 56));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  if (!v1 || (NSClassFromString(&cfstr_Sbplaceholderi.isa), (objc_opt_isKindOfClass() & 1) != 0)) {
    [(id)SBAXIconFolderOpeningTimer invalidate];
  }
}

- (void)_axUpdateDragPauseForDropSession:(id)a3 iconListView:(id)a4
{
  id v34 = a3;
  uint64_t v5 = [a4 window];
  id v6 = (void *)v5;
  if (SBAXPerformingAXDrag) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7) {
    goto LABEL_30;
  }
  [v34 locationInView:v5];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [MEMORY[0x263F1C920] mainScreen];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  uint64_t v17 = [v6 windowScene];
  uint64_t v18 = [v17 interfaceOrientation];

  if ((unint64_t)(v18 - 3) >= 2)
  {
    if ((v9 <= 20.0 || v9 > 50.0) && (v9 < v14 + -50.0 || v9 >= v14 + -20.0)) {
      goto LABEL_20;
    }
  }
  else if ((v11 <= 20.0 || v11 > 50.0) && (v11 < v16 + -50.0 || v11 >= v16 + -20.0))
  {
LABEL_20:
    char v21 = 0;
    goto LABEL_23;
  }
  if (_axUpdateDragPauseForDropSession_iconListView__WantsNearedBorder) {
    goto LABEL_24;
  }
  UIAccessibilityNotifications v22 = *MEMORY[0x263F1CDC8];
  unint64_t v23 = accessibilityLocalizedString(@"nearing.border");
  UIAccessibilityPostNotification(v22, v23);

  char v21 = 1;
LABEL_23:
  _axUpdateDragPauseForDropSession_iconListView__WantsNearedBorder = v21;
LABEL_24:
  int v24 = _axUpdateDragPauseForDropSession_iconListView__previousCloseFolderTimerStatus;
  int v25 = SBAXIconCloseFolderTimerStatus;
  unint64_t v26 = AXSBHIconManagerFromSharedIconController();
  CGFloat v27 = [v26 safeValueForKey:@"openedFolder"];

  int v28 = SBAXIconCloseFolderTimerStatus;
  if (v27 && v24 != v25 && SBAXIconCloseFolderTimerStatus == 2 && SBAXIconOpenedFolderWhileJiggling)
  {
    UIAccessibilityNotifications v29 = *MEMORY[0x263F1CDC8];
    id v30 = NSString;
    BOOL v31 = accessibilityLocalizedString(@"dragged.inside.folder");
    uint64_t v32 = [v27 safeValueForKey:@"displayName"];
    unint64_t v33 = objc_msgSend(v30, "stringWithFormat:", v31, v32);
    UIAccessibilityPostNotification(v29, v33);

    int v28 = SBAXIconCloseFolderTimerStatus;
  }
  _axUpdateDragPauseForDropSession_iconListView__previousCloseFolderTimerStatus = v28;

LABEL_30:
}

- (void)_accessibilityIconMovedToPosition
{
  double v3 = [(SBIconDragManagerAccessibility *)self _axGrabbedIcons];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    goto LABEL_18;
  }
  if (!SBAXIconMovedIconLabel) {
    goto LABEL_18;
  }
  uint64_t v5 = [(SBIconDragManagerAccessibility *)self _axRecipientIconView];

  if (v5) {
    goto LABEL_18;
  }
  if (SBAXIconMovedIntoDock)
  {
    if (SBAXIconJustMovedIntoDock)
    {
      id v6 = NSString;
      BOOL v7 = @"finished.moving.app.in.dock";
LABEL_14:
      double v13 = accessibilityLocalizedString(v7);
      double v14 = MEMORY[0x245663CF0](SBAXIconMovedX);
      double v8 = objc_msgSend(v6, "stringWithFormat:", v13, v14);

      goto LABEL_15;
    }
    if (SBAXIconPreItemInDock && SBAXIconNextItemInDock)
    {
      id v6 = NSString;
      BOOL v7 = @"moving.app.within.dock.middle";
      goto LABEL_14;
    }
    if (SBAXIconPreItemInDock)
    {
      double v20 = @"moving.app.within.dock.last";
LABEL_25:
      double v8 = accessibilityLocalizedString(v20);
      goto LABEL_15;
    }
    if (SBAXIconNextItemInDock)
    {
      double v20 = @"moving.app.within.dock.first";
      goto LABEL_25;
    }
  }
  else if (_accessibilityIconMovedToPosition_LastX != SBAXIconMovedX {
         || _accessibilityIconMovedToPosition_LastY != SBAXIconMovedY)
  }
  {
    double v9 = NSString;
    double v10 = accessibilityLocalizedString(@"finished.moving.app");
    double v11 = MEMORY[0x245663CF0](SBAXIconMovedY);
    uint64_t v12 = MEMORY[0x245663CF0](SBAXIconMovedX);
    double v8 = objc_msgSend(v9, "stringWithFormat:", v10, v11, v12);

    _accessibilityIconMovedToPosition_LastY = SBAXIconMovedY;
    _accessibilityIconMovedToPosition_LastX = SBAXIconMovedX;
    goto LABEL_15;
  }
  double v8 = 0;
LABEL_15:
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
  if (v8)
  {
    id v15 = objc_allocWithZone(NSDictionary);
    double v16 = [NSNumber numberWithInt:10];
    uint64_t v17 = objc_msgSend(v15, "initWithObjectsAndKeys:", v16, *MEMORY[0x263F216D8], 0);

    uint64_t v18 = (void *)[objc_allocWithZone(MEMORY[0x263F086A0]) initWithString:v8 attributes:v17];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v18);
  }
LABEL_18:
  double v19 = (void *)SBAXIconMoveSpeakTimer;
  id v21 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2.0];
  [v19 setFireDate:v21];
}

- (id)_accessibilityGetLastAnnouncedIcon
{
}

- (void)_accessibilitySetLastAnnouncedIcon:(id)a3
{
}

- (void)iconDropSession:(id)a3 didPauseAtLocation:(CGPoint)a4 inIconListView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)SBIconDragManagerAccessibility;
  -[SBIconDragManagerAccessibility iconDropSession:didPauseAtLocation:inIconListView:](&v35, sel_iconDropSession_didPauseAtLocation_inIconListView_, v9, v10, x, y);
  if (!SBAXPerformingAXDrag)
  {
    double v11 = [v10 _accessibilityWindow];
    if (!v11)
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__3;
    unint64_t v33 = __Block_byref_object_dispose__3;
    id v34 = 0;
    id v28 = v10;
    AXPerformSafeBlock();
    id v12 = (id)v30[5];

    _Block_object_dispose(&v29, 8);
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__3;
    unint64_t v33 = __Block_byref_object_dispose__3;
    id v34 = 0;
    id v27 = v28;
    id v13 = v12;
    AXPerformSafeBlock();
    id v14 = (id)v30[5];

    _Block_object_dispose(&v29, 8);
    id v15 = [(SBIconDragManagerAccessibility *)self _accessibilityGetLastAnnouncedIcon];
    if (v14
      && ([(SBIconDragManagerAccessibility *)self _axIconForIconView:v14],
          double v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = [v16 safeBoolForKey:@"isPlaceholder"],
          v16,
          (v17 & 1) == 0))
    {
      UIAccessibilityNotifications v22 = [v14 accessibilityLabel];
      uint64_t v18 = v22;
      if (v14 != v15 && [v22 length])
      {
        int v19 = [v14 safeBoolForKey:@"isFolderIcon"];
        double v20 = @"dragged.over.app";
        id v21 = @"dragged.over.folder";
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v18 = [v15 accessibilityLabel];
      if ([v18 length])
      {
        int v19 = [v15 safeBoolForKey:@"isFolderIcon"];
        double v20 = @"dragged.off.app";
        id v21 = @"dragged.off.folder";
LABEL_10:
        if (v19) {
          unint64_t v23 = v21;
        }
        else {
          unint64_t v23 = v20;
        }
        int v24 = NSString;
        int v25 = accessibilityLocalizedString(v23);
        unint64_t v26 = objc_msgSend(v24, "stringWithFormat:", v25, v18);

        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v26);
      }
    }

    [(SBIconDragManagerAccessibility *)self _accessibilitySetLastAnnouncedIcon:v14];
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __84__SBIconDragManagerAccessibility_iconDropSession_didPauseAtLocation_inIconListView___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "iconAtPoint:index:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));

  return MEMORY[0x270F9A758]();
}

uint64_t __84__SBIconDragManagerAccessibility_iconDropSession_didPauseAtLocation_inIconListView___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_axIconForIconView:(id)a3
{
  return (id)[a3 safeValueForKey:@"icon"];
}

- (void)_axScheduleAnnouncementForRow:(unint64_t)a3 col:(unint64_t)a4
{
  unint64_t v7 = [(SBIconDragManagerAccessibility *)self _axRowColScheduledRow];
  if ([(SBIconDragManagerAccessibility *)self _axRowColScheduledCol] != a4 || v7 != a3)
  {
    double v8 = [(SBIconDragManagerAccessibility *)self _axRowColAnnouncementTimer];
    [v8 invalidate];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__SBIconDragManagerAccessibility__axScheduleAnnouncementForRow_col___block_invoke;
    v10[3] = &__block_descriptor_48_e17_v16__0__NSTimer_8l;
    v10[4] = a3;
    v10[5] = a4;
    id v9 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:0 repeats:v10 block:1.0];

    [(SBIconDragManagerAccessibility *)self _axSetRowColAnnouncementTimer:v9];
    [(SBIconDragManagerAccessibility *)self _axSetRowColScheduledRow:a3];
    [(SBIconDragManagerAccessibility *)self _axSetRowColScheduledCol:a4];
  }
}

void __68__SBIconDragManagerAccessibility__axScheduleAnnouncementForRow_col___block_invoke(uint64_t a1)
{
  double v2 = NSString;
  double v3 = accessibilityLocalizedString(@"app.grid.location");
  uint64_t v4 = MEMORY[0x245663CF0](*(void *)(a1 + 32));
  uint64_t v5 = MEMORY[0x245663CF0](*(void *)(a1 + 40));
  objc_msgSend(v2, "stringWithFormat:", v3, v4, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilitySpeakIfNotSpeaking();
}

- (id)_axGrabbedIconsLabel
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unint64_t v7 = __Block_byref_object_copy__3;
  double v8 = __Block_byref_object_dispose__3;
  id v9 = &stru_26F7E8EF8;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __54__SBIconDragManagerAccessibility__axGrabbedIconsLabel__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__SBIconDragManagerAccessibility__axGrabbedIconsLabel__block_invoke_2;
  v3[3] = &unk_265158038;
  id v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateIconDragContextsUsingBlock:v3];
}

void __54__SBIconDragManagerAccessibility__axGrabbedIconsLabel__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 safeBoolForKey:@"isUserActive"])
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = [v3 safeArrayForKey:@"draggedIcons"];
    uint64_t v6 = [v4 setWithArray:v5];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "accessibilityLabel", v15, v16, (void)v17);
          double v16 = @"__AXStringForVariablesSentinel";
          uint64_t v12 = __UIAXStringForVariables();
          uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
          id v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;
        }
        uint64_t v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v15, @"__AXStringForVariablesSentinel");
      }
      while (v9);
    }
  }
}

- (BOOL)_axIsIconDragging
{
  id v2 = [(SBIconDragManagerAccessibility *)self _axGrabbedIconsLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_axGrabbedIconView
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__3;
  uint64_t v8 = __Block_byref_object_dispose__3;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __52__SBIconDragManagerAccessibility__axGrabbedIconView__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__SBIconDragManagerAccessibility__axGrabbedIconView__block_invoke_2;
  v3[3] = &unk_265158038;
  id v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateIconDragContextsUsingBlock:v3];
}

void __52__SBIconDragManagerAccessibility__axGrabbedIconView__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 safeBoolForKey:@"isUserActive"])
  {
    BOOL v3 = [v8 safeSetForKey:@"_sourceIconViews"];
    uint64_t v4 = [v3 allObjects];
    uint64_t v5 = [v4 firstObject];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __49__SBIconDragManagerAccessibility__axGrabbedIcons__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 safeBoolForKey:@"isUserActive"])
  {
    uint64_t v3 = [v6 safeArrayForKey:@"draggedIcons"];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)_axRecipientIconView
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__3;
  id v8 = __Block_byref_object_dispose__3;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __54__SBIconDragManagerAccessibility__axRecipientIconView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"iconDragManager"];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__SBIconDragManagerAccessibility__axRecipientIconView__block_invoke_2;
  v3[3] = &unk_265158038;
  v3[4] = *(void *)(a1 + 40);
  [v2 enumerateIconDragContextsUsingBlock:v3];
}

void __54__SBIconDragManagerAccessibility__axRecipientIconView__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 safeBoolForKey:@"isUserActive"])
  {
    uint64_t v3 = [v6 safeValueForKey:@"recipientIconView"];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

@end