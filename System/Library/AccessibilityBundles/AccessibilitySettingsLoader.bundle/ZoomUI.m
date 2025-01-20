@interface ZoomUI
@end

@implementation ZoomUI

uint64_t __50__ZoomUI_UIAlertControllerOverride_viewDidAppear___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "convertRect:fromView:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

uint64_t __50__ZoomUI_UIAlertControllerOverride_viewDidAppear___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "convertRect:toWindow:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

uint64_t __88__ZoomUI_SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didEndGesture___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __88__ZoomUI_SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didEndGesture___block_invoke_2;
  v3[3] = &unk_26509DA58;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateChildModifiersWithBlock:v3];
}

void __88__ZoomUI_SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didEndGesture___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  soft_AXSafeClassFromString(@"SBHomeGestureRootSwitcherModifier");
  if (objc_opt_isKindOfClass())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __88__ZoomUI_SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didEndGesture___block_invoke_3;
    v7[3] = &unk_26509DA30;
    v7[4] = *(void *)(a1 + 32);
    v7[5] = a4;
    [v6 enumerateChildModifiersWithBlock:v7];
  }
}

void __88__ZoomUI_SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didEndGesture___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  soft_AXSafeClassFromString(@"SBHomeGestureSwitcherModifier");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 safeIntegerForKey:@"currentFinalDestination"];
    v8 = [v6 safeValueForKey:@"_dockModifier"];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __88__ZoomUI_SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didEndGesture___block_invoke_4;
    v11[3] = &unk_26509DA08;
    v13 = &v15;
    id v9 = v8;
    id v12 = v9;
    uint64_t v14 = v7;
    soft_AXPerformSafeBlock(v11);
    LODWORD(v7) = *((unsigned __int8 *)v16 + 24);

    _Block_object_dispose(&v15, 8);
    if (v7)
    {
      v10 = [getZoomServicesClass() sharedInstance];
      [v10 notifyZoomFluidSwitcherGestureDidFinishWithDock];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
      **(unsigned char **)(a1 + 40) = 1;
    }
  }
}

uint64_t __88__ZoomUI_SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didEndGesture___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldPresentDockForFinalDestination:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end