@interface SBHIconManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axSetCurrentFolderScrollEnabled:(BOOL)a3;
- (void)closeFolderAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7;
- (void)setEditing:(BOOL)a3 withFeedbackBehavior:(id)a4 location:(CGPoint)a5;
- (void)setMainDisplayLibraryViewVisible:(BOOL)a3;
@end

@implementation SBHIconManagerAccessibility

uint64_t __92__SBHIconManagerAccessibility_pushExpandedIcon_location_context_animated_completionHandler___block_invoke(uint64_t a1)
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v2 = *(void **)(a1 + 32);
    v3 = AXSBIconControllerSharedInstance();
    v4 = [v3 _axIconScrollView];
    objc_msgSend(v2, "_axSetCurrentFolderScrollEnabled:", objc_msgSend(v4, "isScrollEnabled"));
  }
  int v5 = [*(id *)(a1 + 32) safeBoolForKey:@"hasOpenFolder"];
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    NSClassFromString(&cfstr_Sbfoldericon.isa);
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_allocWithZone(NSDictionary);
      v8 = [NSNumber numberWithInt:1];
      v9 = objc_msgSend(v7, "initWithObjectsAndKeys:", v8, *MEMORY[0x263F216D8], *MEMORY[0x263EFFB40], *MEMORY[0x263F21770], 0);

      id v10 = objc_allocWithZone(MEMORY[0x263F086A0]);
      v11 = NSString;
      v12 = accessibilityLocalizedString(@"opening.folder");
      v13 = [*(id *)(a1 + 40) safeValueForKey:@"displayName"];
      v14 = objc_msgSend(v11, "stringWithFormat:", v12, v13);
      v15 = (void *)[v10 initWithString:v14 attributes:v9];

      LODWORD(v14) = *MEMORY[0x263F1CDC8];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v15);
      SBAXIconOpenedFolderWhileJiggling = 1;
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v14, (id)*MEMORY[0x263F21948]);
    }
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v17 = *(uint64_t (**)(void))(result + 16);
    return v17();
  }
  return result;
}

- (void)setEditing:(BOOL)a3 withFeedbackBehavior:(id)a4 location:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v7 = a3;
  id v9 = a4;
  int v10 = [(SBHIconManagerAccessibility *)self safeBoolForKey:@"isEditing"];
  v16.receiver = self;
  v16.super_class = (Class)SBHIconManagerAccessibility;
  -[SBHIconManagerAccessibility setEditing:withFeedbackBehavior:location:](&v16, sel_setEditing_withFeedbackBehavior_location_, v7, v9, x, y);

  if (v10 != [(SBHIconManagerAccessibility *)self safeBoolForKey:@"isEditing"])
  {
    if (v10)
    {
      SBHAXCancelSBAXIconMoveSpeakTimer();
      UIAccessibilityNotifications v11 = *MEMORY[0x263F1CDC8];
      v12 = accessibilityLocalizedString(@"homescreen.editing.ended");
      UIAccessibilityPostNotification(v11, v12);

      if (!AXDeviceIsPad())
      {
LABEL_7:
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
        goto LABEL_8;
      }
      v15 = [(SBHIconManagerAccessibility *)self safeValueForKey:@"iconDragManager"];
      id v13 = v15;
      AXPerformSafeBlock();
    }
    else
    {
      UIAccessibilityNotifications v14 = *MEMORY[0x263F1CDC8];
      accessibilityLocalizedString(@"homescreen.editing.started");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v14, v13);
    }

    goto LABEL_7;
  }
LABEL_8:
  SBAXIconOpenedFolderWhileJiggling = 0;
}

- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = a4;
  v15 = (void *)[a7 copy];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __92__SBHIconManagerAccessibility_pushExpandedIcon_location_context_animated_completionHandler___block_invoke;
  v20[3] = &unk_265157F50;
  BOOL v23 = v8;
  v20[4] = self;
  id v21 = v12;
  id v22 = v15;
  id v16 = v15;
  id v17 = v12;
  v18 = (void *)MEMORY[0x245664140](v20);
  v19.receiver = self;
  v19.super_class = (Class)SBHIconManagerAccessibility;
  [(SBHIconManagerAccessibility *)&v19 pushExpandedIcon:v17 location:v14 context:v13 animated:v8 completionHandler:v18];
}

+ (id)safeCategoryTargetClassName
{
  return @"SBHIconManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"hasOpenFolder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"openedFolder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"iconDragManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"setMainDisplayLibraryViewVisible:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"pushExpandedIcon:location:context:animated:completionHandler:", "v", "@", "@", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"setEditing:withFeedbackBehavior:location:", "v", "B", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"closeFolderAnimated:withCompletion:", "v", "B", "@?", 0);
  [v3 validateClass:@"SBIconDragManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"cancelAllDrags", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolder", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"displayName", "@", 0);
}

uint64_t __72__SBHIconManagerAccessibility_setEditing_withFeedbackBehavior_location___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAllDrags];
}

- (void)closeFolderAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(SBHIconManagerAccessibility *)self _axSetCurrentFolderScrollEnabled:1];
  BOOL v7 = [(SBHIconManagerAccessibility *)self safeValueForKey:@"openedFolder"];
  BOOL v8 = [v7 safeValueForKey:@"displayName"];
  id v9 = (void *)[v6 copy];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__SBHIconManagerAccessibility_closeFolderAnimated_withCompletion___block_invoke;
  v14[3] = &unk_265157F78;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = v7 != 0;
  BOOL v18 = v4;
  v14[4] = self;
  id v10 = v8;
  id v11 = v9;
  id v12 = (void *)MEMORY[0x245664140](v14);
  v13.receiver = self;
  v13.super_class = (Class)SBHIconManagerAccessibility;
  [(SBHIconManagerAccessibility *)&v13 closeFolderAnimated:v4 withCompletion:v12];
}

void __66__SBHIconManagerAccessibility_closeFolderAnimated_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4 = [*(id *)(a1 + 32) safeBoolForKey:@"hasOpenFolder"];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  if (*(unsigned char *)(a1 + 56)) {
    char v6 = v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0 && *(unsigned char *)(a1 + 57))
  {
    UIAccessibilityNotifications v7 = *MEMORY[0x263F1CDC8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21940]);
    id v8 = objc_allocWithZone(NSDictionary);
    id v9 = [NSNumber numberWithInt:1];
    id v10 = objc_msgSend(v8, "initWithObjectsAndKeys:", v9, *MEMORY[0x263F216D8], *MEMORY[0x263EFFB40], *MEMORY[0x263F21770], 0);

    id v11 = objc_allocWithZone(MEMORY[0x263F086A0]);
    id v12 = NSString;
    objc_super v13 = accessibilityLocalizedString(@"closing.folder");
    id v14 = objc_msgSend(v12, "stringWithFormat:", v13, *(void *)(a1 + 40));
    id v15 = (void *)[v11 initWithString:v14 attributes:v10];

    UIAccessibilityPostNotification(v7, v15);
  }
  UIAccessibilityNotifications v16 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v16, 0);
}

- (void)setMainDisplayLibraryViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconManagerAccessibility;
  -[SBHIconManagerAccessibility setMainDisplayLibraryViewVisible:](&v9, sel_setMainDisplayLibraryViewVisible_);
  if (v3)
  {
    char v4 = AXSBIconControllerSharedInstance();
    uint64_t v5 = [v4 _axDragManager];
    char v6 = [v5 _axGrabbedIcons];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      if (!SBAXPerformingAXDrag)
      {
        id v8 = accessibilityLocalizedString(@"icon.finished.scroll.for.app.library");
        UIAccessibilitySpeakAndDoNotBeInterrupted();
      }
    }
  }
}

- (void)_axSetCurrentFolderScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  uint64_t v5 = [(SBHIconManagerAccessibility *)self safeValueForKey:@"_currentFolderController"];
  char v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = [v6 view];
  id v8 = [v7 _accessibilityDescendantOfType:objc_opt_class()];

  [v8 setScrollEnabled:v3];
}

@end