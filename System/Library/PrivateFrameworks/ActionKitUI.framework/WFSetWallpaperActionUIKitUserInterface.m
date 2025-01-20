@interface WFSetWallpaperActionUIKitUserInterface
- (BOOL)isiPad;
- (id)completionHandler;
- (int64_t)locations;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithError:(id)a3;
- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setLocations:(int64_t)a3;
- (void)showPreviewForConfiguration:(id)a3 selectedPoster:(id)a4 completionHandler:(id)a5;
- (void)showPreviewWithInput:(id)a3 key:(id)a4 wallpaperLocation:(int64_t)a5 completionHandler:(id)a6;
- (void)wallpaperPreviewViewControllerCancelButtonPressed:(id)a3;
- (void)wallpaperPreviewViewControllerSetButtonPressed:(id)a3;
@end

@implementation WFSetWallpaperActionUIKitUserInterface

- (void).cxx_destruct
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setLocations:(int64_t)a3
{
  self->_locations = a3;
}

- (int64_t)locations
{
  return self->_locations;
}

- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4
{
  id v9 = a4;
  v5 = [(WFSetWallpaperActionUIKitUserInterface *)self completionHandler];

  v6 = v9;
  if (v5)
  {
    if ([v9 entryPointResult])
    {
      v7 = 0;
    }
    else
    {
      v7 = [MEMORY[0x263F087E8] userCancelledError];
    }
    v8 = [(WFSetWallpaperActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, void *))v8)[2](v8, v7);

    v6 = v9;
  }
}

- (void)wallpaperPreviewViewControllerSetButtonPressed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  int64_t v5 = [(WFSetWallpaperActionUIKitUserInterface *)self locations];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke;
  v6[3] = &unk_264900BF8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v4 setWallpaperForLocations:v5 completionHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke_2;
  v2[3] = &unk_264900BF8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
}

void __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke_3;
  v3[3] = &unk_264900E20;
  v3[4] = *(void *)(a1 + 32);
  [WeakRetained dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:0];
}

- (void)wallpaperPreviewViewControllerCancelButtonPressed:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __92__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerCancelButtonPressed___block_invoke;
  v6[3] = &unk_264900E88;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __92__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerCancelButtonPressed___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __92__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerCancelButtonPressed___block_invoke_2;
  v3[3] = &unk_264900E20;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void __92__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerCancelButtonPressed___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishWithError:v2];
}

- (BOOL)isiPad
{
  id v2 = [MEMORY[0x263F85258] currentDevice];
  BOOL v3 = [v2 idiom] == 1;

  return v3;
}

- (void)finishWithError:(id)a3
{
  id v7 = a3;
  if (![(WFSetWallpaperActionUIKitUserInterface *)self isiPad])
  {
    id v4 = [(WFActionUserInterface *)self delegate];
    [v4 actionUserInterface:self setSupportedInterfaceOrientations:30];
  }
  id v5 = [(WFSetWallpaperActionUIKitUserInterface *)self completionHandler];

  if (v5)
  {
    v6 = [(WFSetWallpaperActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
  [(WFSetWallpaperActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__WFSetWallpaperActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFSetWallpaperActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __82__WFSetWallpaperActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithError:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showPreviewWithInput:(id)a3 key:(id)a4 wallpaperLocation:(int64_t)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v12)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFSetWallpaperActionUIKitUserInterface.m", 95, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"WFSetWallpaperActionUIKitUserInterface.m" lineNumber:96 description:@"You must have a valid wallpaper location to set a wallpaper"];

    goto LABEL_3;
  }
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  [(WFSetWallpaperActionUIKitUserInterface *)self setCompletionHandler:v13];
  v14 = (void *)MEMORY[0x263F08928];
  v15 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke;
  v20[3] = &unk_264900BD0;
  v20[4] = self;
  id v21 = v12;
  int64_t v22 = a5;
  id v16 = v12;
  id v17 = (id)objc_msgSend(v14, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v15, v20);
}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke(void *a1, void *a2)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke_2;
  v8[3] = &unk_264900BA8;
  id v4 = (void *)a1[5];
  v8[4] = a1[4];
  id v5 = v4;
  uint64_t v6 = a1[6];
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:objc_opt_class()];
}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke_3;
  v9[3] = &unk_264900B80;
  uint64_t v4 = a1[4];
  id v5 = (void *)a1[5];
  id v10 = v3;
  uint64_t v11 = v4;
  id v6 = v5;
  uint64_t v7 = a1[6];
  id v12 = v6;
  uint64_t v13 = v7;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke_3(uint64_t a1)
{
  v44[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2050000000;
    id v2 = (void *)getSBFWallpaperOptionsClass_softClass;
    uint64_t v40 = getSBFWallpaperOptionsClass_softClass;
    if (!getSBFWallpaperOptionsClass_softClass)
    {
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      v34 = __getSBFWallpaperOptionsClass_block_invoke;
      v35 = &unk_264900EF8;
      v36 = &v37;
      __getSBFWallpaperOptionsClass_block_invoke((uint64_t)&v32);
      id v2 = (void *)v38[3];
    }
    id v3 = v2;
    _Block_object_dispose(&v37, 8);
    id v4 = objc_alloc_init(v3);
    [v4 setSupportsCropping:1];
    [v4 setHasVideo:0];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v43 = *(void *)(a1 + 48);
    v44[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    uint64_t v41 = *(void *)(a1 + 48);
    id v42 = v4;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    [*(id *)(a1 + 40) setLocations:*(void *)(a1 + 56)];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2050000000;
    id v8 = (void *)getSBSUIWallpaperPreviewViewControllerClass_softClass;
    uint64_t v40 = getSBSUIWallpaperPreviewViewControllerClass_softClass;
    if (!getSBSUIWallpaperPreviewViewControllerClass_softClass)
    {
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      v34 = __getSBSUIWallpaperPreviewViewControllerClass_block_invoke;
      v35 = &unk_264900EF8;
      v36 = &v37;
      __getSBSUIWallpaperPreviewViewControllerClass_block_invoke((uint64_t)&v32);
      id v8 = (void *)v38[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v37, 8);
    LOBYTE(v30) = 0;
    id v10 = (WFSetWallpaperWrapperViewController *)[[v9 alloc] initWithImages:v6 videos:0 variant:-1 options:v7 disableSegmentedControl:1 enableButtons:1 disableContents:v30];
    [(WFSetWallpaperWrapperViewController *)v10 setPreviewDelegate:*(void *)(a1 + 40)];
    if ([*(id *)(a1 + 40) isiPad])
    {
      [(WFSetWallpaperWrapperViewController *)v10 setModalPresentationStyle:0];
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = objc_alloc_init(WFSetWallpaperWrapperViewController);
      [(WFSetWallpaperWrapperViewController *)v11 setModalPresentationStyle:0];
      uint64_t v13 = [(WFSetWallpaperWrapperViewController *)v11 view];
      v14 = [(WFSetWallpaperWrapperViewController *)v10 view];
      [v13 addSubview:v14];

      v15 = [(WFSetWallpaperWrapperViewController *)v11 view];
      [v15 bounds];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      v24 = [(WFSetWallpaperWrapperViewController *)v10 view];
      objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

      v25 = [(WFSetWallpaperWrapperViewController *)v10 view];
      [v25 setAutoresizingMask:18];

      [(WFSetWallpaperWrapperViewController *)v11 addChildViewController:v10];
      [(WFSetWallpaperWrapperViewController *)v10 didMoveToParentViewController:v11];
      v26 = [*(id *)(a1 + 40) delegate];
      [v26 actionUserInterface:*(void *)(a1 + 40) setSupportedInterfaceOrientations:2];
    }
    v28 = *(void **)(a1 + 40);
    v27 = (id *)(a1 + 40);
    if ([v28 isiPad]) {
      v29 = v10;
    }
    else {
      v29 = v11;
    }
    [*v27 presentContent:v29];
  }
  else
  {
    id v12 = *(void **)(a1 + 40);
    id v31 = [MEMORY[0x263F23260] unableToGetImageError];
    [v12 finishWithError:v31];
  }
}

- (void)showPreviewForConfiguration:(id)a3 selectedPoster:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(WFSetWallpaperActionUIKitUserInterface *)self setCompletionHandler:v10];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  uint64_t v11 = (void *)getPRSServiceClass_softClass;
  uint64_t v26 = getPRSServiceClass_softClass;
  if (!getPRSServiceClass_softClass)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __getPRSServiceClass_block_invoke;
    v22[3] = &unk_264900EF8;
    v22[4] = &v23;
    __getPRSServiceClass_block_invoke((uint64_t)v22);
    uint64_t v11 = (void *)v24[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v23, 8);
  id v13 = objc_alloc_init(v12);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke;
  v17[3] = &unk_264900B58;
  id v18 = v9;
  id v19 = v8;
  double v20 = self;
  id v21 = v10;
  id v14 = v8;
  id v15 = v10;
  id v16 = v9;
  [v13 fetchPosterConfigurationsForExtension:@"com.apple.PhotosUIPrivate.PhotosPosterProvider" completion:v17];
}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke_2;
  block[3] = &unk_264900B30;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke_3;
  double v17 = &unk_264900B08;
  id v2 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "if_firstObjectPassingTest:", &v14);
  if (v3)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2050000000;
    id v4 = (void *)getPRSPosterUpdateSessionInfoClass_softClass;
    uint64_t v27 = getPRSPosterUpdateSessionInfoClass_softClass;
    if (!getPRSPosterUpdateSessionInfoClass_softClass)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      id v21 = __getPRSPosterUpdateSessionInfoClass_block_invoke;
      double v22 = &unk_264900EF8;
      uint64_t v23 = &v24;
      __getPRSPosterUpdateSessionInfoClass_block_invoke((uint64_t)&v19);
      id v4 = (void *)v25[3];
    }
    uint64_t v5 = v4;
    _Block_object_dispose(&v24, 8);
    id v6 = objc_alloc_init(v5);
    objc_msgSend(v6, "setShortcutsWallpaperConfiguration:", *(void *)(a1 + 48), v14, v15, v16, v17);
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2050000000;
    uint64_t v7 = (void *)getPRUISModalEntryPointEditingClass_softClass;
    uint64_t v27 = getPRUISModalEntryPointEditingClass_softClass;
    if (!getPRUISModalEntryPointEditingClass_softClass)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      id v21 = __getPRUISModalEntryPointEditingClass_block_invoke;
      double v22 = &unk_264900EF8;
      uint64_t v23 = &v24;
      __getPRUISModalEntryPointEditingClass_block_invoke((uint64_t)&v19);
      uint64_t v7 = (void *)v25[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v24, 8);
    id v9 = (void *)[[v8 alloc] initWithServiceConfiguration:v3 updateSessionInfo:v6];
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2050000000;
    id v10 = (void *)getPRUISModalRemoteViewControllerClass_softClass;
    uint64_t v27 = getPRUISModalRemoteViewControllerClass_softClass;
    if (!getPRUISModalRemoteViewControllerClass_softClass)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      id v21 = __getPRUISModalRemoteViewControllerClass_block_invoke;
      double v22 = &unk_264900EF8;
      uint64_t v23 = &v24;
      __getPRUISModalRemoteViewControllerClass_block_invoke((uint64_t)&v19);
      id v10 = (void *)v25[3];
    }
    uint64_t v11 = v10;
    _Block_object_dispose(&v24, 8);
    id v12 = (void *)[[v11 alloc] initWithEntryPoint:v9];
    [v12 setModalPresentationStyle:0];
    [v12 setDelegate:*(void *)(a1 + 56)];
    [*(id *)(a1 + 56) presentContent:v12];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 64);
    objc_msgSend(MEMORY[0x263F23260], "invalidPosterError", v14, v15, v16, v17);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);
  }
}

uint64_t __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 serverUUID];
  id v4 = [*(id *)(a1 + 32) UUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

@end