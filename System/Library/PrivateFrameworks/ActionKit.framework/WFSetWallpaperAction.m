@interface WFSetWallpaperAction
+ (id)invalidPosterError;
+ (id)unableToGetImageError;
+ (id)userInterfaceProtocol;
- (BOOL)inputPassthrough;
- (BOOL)perspectiveZoom;
- (BOOL)showPreview;
- (BOOL)supportsPosters;
- (NSUUID)createdPosterConfigurationUUID;
- (double)currentParallaxFactor;
- (double)maximumSizeInPixels;
- (id)contentDestinationWithError:(id *)a3;
- (id)disabledOnPlatforms;
- (id)imageTooLargeError;
- (id)invalidLocationError;
- (id)invalidLocationErrorWithProvidedLocation:(id)a3;
- (id)locationParameterValues;
- (id)missingImageError;
- (id)noPosterHomeError;
- (id)readableLocationParameterValues;
- (id)setWallpaperFailedError;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (int64_t)sbf_wallpaperLocationFromLocationParameter;
- (int64_t)wf_wallpaperLocationFromLocationParameter;
- (void)buildWallpaperConfigurationFromCollection:(id)a3 completionHandler:(id)a4;
- (void)cancel;
- (void)deletePosterWithUUID:(id)a3 completionHandler:(id)a4;
- (void)finishAndSetCurrentPosterIfNecessary:(id)a3 isNewPoster:(BOOL)a4;
- (void)preparePosterWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runLegacySetWallpaperWithInput:(id)a3;
- (void)setCreatedPosterConfigurationUUID:(id)a3;
- (void)setLegacyWallpaperWithImage:(id)a3;
@end

@implementation WFSetWallpaperAction

- (void).cxx_destruct
{
}

- (void)setCreatedPosterConfigurationUUID:(id)a3
{
}

- (NSUUID)createdPosterConfigurationUUID
{
  return self->_createdPosterConfigurationUUID;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to set a wallpaper with %2$@?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to set a wallpaper?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F337E8], "wallpaperLocation", a3);
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFSetWallpaperAction;
  v2 = [(WFSetWallpaperAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

- (id)setWallpaperFailedError
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  v4 = WFLocalizedString(@"Unable to Set Wallpaper");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  objc_super v5 = WFLocalizedString(@"An unknown error occurred while setting the wallpaper.");
  v10[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:6 userInfo:v6];

  return v7;
}

- (id)missingImageError
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  v4 = WFLocalizedString(@"Unable to Set Wallpaper");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  objc_super v5 = WFLocalizedString(@"Please provide an image to set as a wallpaper.");
  v10[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:6 userInfo:v6];

  return v7;
}

- (id)invalidLocationErrorWithProvidedLocation:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F870B8];
  uint64_t v13 = *MEMORY[0x263F08338];
  id v5 = a3;
  id v6 = WFLocalizedString(@"Invalid Wallpaper Location");
  v15[0] = v6;
  uint64_t v14 = *MEMORY[0x263F08320];
  v7 = NSString;
  id v8 = WFLocalizedString(@"“%@” is not a valid wallpaper location, please provide a valid location.");
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v5, v13, v14, v6);

  v15[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v13 count:2];
  v11 = [v3 errorWithDomain:v4 code:5 userInfo:v10];

  return v11;
}

- (id)imageTooLargeError
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  uint64_t v4 = WFLocalizedString(@"Unable to Set Wallpaper");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  id v5 = WFLocalizedString(@"The image provided was too large.");
  v10[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:6 userInfo:v6];

  return v7;
}

- (id)invalidLocationError
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  uint64_t v4 = WFLocalizedString(@"Unable to Set Wallpaper Photo");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  id v5 = WFLocalizedString(@"Please select a valid destination for your photo.");
  v10[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:5 userInfo:v6];

  return v7;
}

- (id)noPosterHomeError
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  uint64_t v4 = WFLocalizedString(@"Unable to Set Wallpaper Photo");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  id v5 = WFLocalizedString(@"Please select a wallpaper and try again.");
  v10[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:6 userInfo:v6];

  return v7;
}

- (int64_t)sbf_wallpaperLocationFromLocationParameter
{
  v2 = [(WFSetWallpaperAction *)self locationParameterValues];
  int v3 = [v2 containsObject:@"Home Screen"];
  unsigned int v4 = [v2 containsObject:@"Lock Screen"];
  uint64_t v5 = 2;
  if ((v3 & v4) != 0) {
    uint64_t v5 = 3;
  }
  if (v3) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = v4;
  }

  return v6;
}

- (int64_t)wf_wallpaperLocationFromLocationParameter
{
  v2 = [(WFSetWallpaperAction *)self locationParameterValues];
  int v3 = [v2 containsObject:@"Home Screen"];
  unsigned int v4 = [v2 containsObject:@"Lock Screen"];
  uint64_t v5 = 1;
  if ((v3 & v4) != 0) {
    uint64_t v5 = 2;
  }
  if (v3) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = v4 - 1;
  }

  return v6;
}

- (id)readableLocationParameterValues
{
  v2 = [(WFSetWallpaperAction *)self locationParameterValues];
  int v3 = [v2 componentsJoinedByString:@", "];

  return v3;
}

- (id)locationParameterValues
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFSetWallpaperAction *)self parameterValueForKey:@"WFWallpaperLocation" ofClass:v3];
}

- (double)currentParallaxFactor
{
  BOOL v2 = [(WFSetWallpaperAction *)self perspectiveZoom];
  double result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (BOOL)perspectiveZoom
{
  BOOL v2 = [(WFSetWallpaperAction *)self parameterValueForKey:@"WFWallpaperPerspectiveZoom" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (double)maximumSizeInPixels
{
  v26[3] = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  char v3 = (void *)getSBFWallpaperParallaxSettingsClass_softClass;
  uint64_t v23 = getSBFWallpaperParallaxSettingsClass_softClass;
  if (!getSBFWallpaperParallaxSettingsClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getSBFWallpaperParallaxSettingsClass_block_invoke;
    double v25 = COERCE_DOUBLE(&unk_264E5EC88);
    v26[0] = &v20;
    __getSBFWallpaperParallaxSettingsClass_block_invoke((uint64_t)buf);
    char v3 = (void *)v21[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v20, 8);
  [(WFSetWallpaperAction *)self currentParallaxFactor];
  objc_msgSend(v4, "bestWallpaperSizeForParallaxFactor:");
  double v6 = v5;
  double v8 = v7;
  v9 = getWFActionsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [(WFSetWallpaperAction *)self currentParallaxFactor];
    uint64_t v11 = v10;
    uint64_t v12 = [NSString stringWithFormat:@"w: %f, h: %f", *(void *)&v6, *(void *)&v8, v20];
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[WFSetWallpaperAction maximumSizeInPixels]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    double v25 = *(double *)&v12;
    _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_DEFAULT, "%s Best wallpaper size for parallax factor (%f): %{public}@", buf, 0x20u);
  }
  if (v6 == 0.0 || v8 == 0.0)
  {
    v18 = getWFActionsLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      [(WFSetWallpaperAction *)self currentParallaxFactor];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[WFSetWallpaperAction maximumSizeInPixels]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2048;
      double v25 = v8;
      LOWORD(v26[0]) = 2048;
      *(void *)((char *)v26 + 2) = v19;
      _os_log_impl(&dword_23C364000, v18, OS_LOG_TYPE_FAULT, "%s Set Wallpaper: unexpected canvasSize (%f, %f, parallax factor: %f) encountered when getting maximum size, using default maximum size instead", buf, 0x2Au);
    }

    return 4000.0;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F85258] currentDevice];
    [v13 screenScale];
    double v15 = v14;

    if (v6 >= v8) {
      double v16 = v6;
    }
    else {
      double v16 = v8;
    }
    double result = v16 * v15;
    if (result > 4000.0) {
      return 4000.0;
    }
  }
  return result;
}

- (void)setLegacyWallpaperWithImage:(id)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v11 = [(WFSetWallpaperAction *)self missingImageError];
    [(WFSetWallpaperAction *)self finishRunningWithError:v11];
LABEL_12:

    goto LABEL_17;
  }
  int64_t v5 = [(WFSetWallpaperAction *)self sbf_wallpaperLocationFromLocationParameter];
  if (!v5)
  {
    uint64_t v11 = [(WFSetWallpaperAction *)self readableLocationParameterValues];
    uint64_t v12 = [(WFSetWallpaperAction *)self invalidLocationErrorWithProvidedLocation:v11];
    [(WFSetWallpaperAction *)self finishRunningWithError:v12];

    goto LABEL_12;
  }
  int64_t v6 = v5;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  double v7 = (void (*)(void))getSBFStringForWallpaperModeSymbolLoc_ptr;
  v39 = getSBFStringForWallpaperModeSymbolLoc_ptr;
  if (!getSBFStringForWallpaperModeSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __getSBFStringForWallpaperModeSymbolLoc_block_invoke;
    v34 = &unk_264E5EC88;
    v35 = &v36;
    double v8 = SpringBoardFoundationLibrary();
    v37[3] = (uint64_t)dlsym(v8, "SBFStringForWallpaperMode");
    getSBFStringForWallpaperModeSymbolLoc_ptr = *(_UNKNOWN **)(v35[1] + 24);
    double v7 = (void (*)(void))v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v7)
  {
    uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
    v21 = [NSString stringWithUTF8String:"NSString *WFSBFStringForWallpaperMode(SBFWallpaperMode)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"WFSetWallpaperAction.m", 37, @"%s", dlerror());

    __break(1u);
  }
  v9 = v7(0);
  int v10 = ![(WFSetWallpaperAction *)self showPreview];
  if ((v6 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
    LOBYTE(v10) = 1;
  }
  if (v10)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2050000000;
    uint64_t v13 = (void *)getSBFWallpaperOptionsClass_softClass;
    v39 = (void *)getSBFWallpaperOptionsClass_softClass;
    if (!getSBFWallpaperOptionsClass_softClass)
    {
      uint64_t v31 = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      v33 = __getSBFWallpaperOptionsClass_block_invoke;
      v34 = &unk_264E5EC88;
      v35 = &v36;
      __getSBFWallpaperOptionsClass_block_invoke((uint64_t)&v31);
      uint64_t v13 = (void *)v37[3];
    }
    double v14 = v13;
    _Block_object_dispose(&v36, 8);
    id v15 = objc_alloc_init(v14);
    [v15 setSupportsCropping:1];
    [v15 setPortrait:1];
    [v15 setHasVideo:0];
    [(WFSetWallpaperAction *)self currentParallaxFactor];
    objc_msgSend(v15, "setParallaxFactor:");
    v42 = v9;
    v43[0] = v4;
    double v16 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v40 = v9;
    id v41 = v15;
    v17 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_4;
    block[3] = &unk_264E5E3B0;
    id v23 = v16;
    id v24 = v17;
    double v25 = self;
    int64_t v26 = v6;
    id v18 = v17;
    id v19 = v16;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke;
    v27[3] = &unk_264E5D2B8;
    v27[4] = self;
    id v28 = v4;
    id v29 = v9;
    int64_t v30 = v6;
    [(WFSetWallpaperAction *)self requestUnlock:v27];
  }
LABEL_17:
}

void __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke(uint64_t a1, char a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_2;
    v7[3] = &unk_264E5D290;
    v7[4] = v2;
    id v8 = *(id *)(a1 + 40);
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    id v9 = v4;
    uint64_t v10 = v5;
    [v2 requestInterfacePresentationWithCompletionHandler:v7];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) deviceLockedError];
    [v2 finishRunningWithError:v6];
  }
}

void __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_4(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  BOOL v2 = (void *)MEMORY[0x23ECE6170]();
  char v3 = getWFActionsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFSetWallpaperAction setLegacyWallpaperWithImage:]_block_invoke_4";
    _os_log_impl(&dword_23C364000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating wallpaper preview view...", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v4 = (void *)getSBSUIWallpaperPreviewViewControllerClass_softClass;
  uint64_t v26 = getSBSUIWallpaperPreviewViewControllerClass_softClass;
  if (!getSBSUIWallpaperPreviewViewControllerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    id v28 = __getSBSUIWallpaperPreviewViewControllerClass_block_invoke;
    id v29 = &unk_264E5EC88;
    int64_t v30 = &v23;
    __getSBSUIWallpaperPreviewViewControllerClass_block_invoke((uint64_t)&buf);
    id v4 = (void *)v24[3];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v23, 8);
  id v6 = [v5 alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  BYTE1(v21) = [*(id *)(a1 + 48) perspectiveZoom] ^ 1;
  LOBYTE(v21) = 0;
  id v9 = objc_msgSend(v6, "initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:", v8, 0, -1, v7, 0, 1, v21);
  uint64_t v10 = [MEMORY[0x263F85258] currentDevice];
  [v10 screenBounds];
  double v12 = v11;
  double v14 = v13;

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v15 = (void *)getUIViewClass_softClass;
  uint64_t v26 = getUIViewClass_softClass;
  if (!getUIViewClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    id v28 = __getUIViewClass_block_invoke;
    id v29 = &unk_264E5EC88;
    int64_t v30 = &v23;
    __getUIViewClass_block_invoke((uint64_t)&buf);
    id v15 = (void *)v24[3];
  }
  double v16 = v15;
  _Block_object_dispose(&v23, 8);
  v17 = objc_msgSend([v16 alloc], "initWithFrame:", 0.0, 0.0, v12, v14);
  id v18 = [v9 view];
  [v17 addSubview:v18];

  id v19 = getWFActionsLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFSetWallpaperAction setLegacyWallpaperWithImage:]_block_invoke";
    _os_log_impl(&dword_23C364000, v19, OS_LOG_TYPE_DEFAULT, "%s Setting wallpaper...", (uint8_t *)&buf, 0xCu);
  }

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_292;
  v22[3] = &unk_264E5EE70;
  uint64_t v20 = *(void *)(a1 + 56);
  v22[4] = *(void *)(a1 + 48);
  [v9 setWallpaperForLocations:v20 completionHandler:v22];
}

uint64_t __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_292(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v2 = getWFActionsLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[WFSetWallpaperAction setLegacyWallpaperWithImage:]_block_invoke";
    _os_log_impl(&dword_23C364000, v2, OS_LOG_TYPE_DEFAULT, "%s Setting wallpaper finished", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

void __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F337B0]);
    [v6 addObject:*(void *)(a1 + 40)];
    uint64_t v7 = objc_msgSend(MEMORY[0x263F08910], "wf_securelyArchivedDataWithRootObject:", v6);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_3;
    void v10[3] = &unk_264E5EBC8;
    v10[4] = *(void *)(a1 + 32);
    [v5 showPreviewWithInput:v7 key:v8 wallpaperLocation:v9 completionHandler:v10];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

uint64_t __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)runLegacySetWallpaperWithInput:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = getWFActionsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [(WFSetWallpaperAction *)self currentParallaxFactor];
    *(_DWORD *)long long buf = 136315650;
    uint64_t v10 = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]";
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = [(WFSetWallpaperAction *)self showPreview];
    _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_DEFAULT, "%s Setting wallpaper with options: parallaxFactor: %f, showPreview: %i", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__WFSetWallpaperAction_runLegacySetWallpaperWithInput___block_invoke;
  v8[3] = &unk_264E5D390;
  v8[4] = self;
  uint64_t v7 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
  [v4 getFileRepresentation:v8 forType:v7];
}

void __55__WFSetWallpaperAction_runLegacySetWallpaperWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x23ECE6170]();
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2050000000;
    uint64_t v8 = (void *)getUIScreenClass_softClass;
    uint64_t v44 = getUIScreenClass_softClass;
    if (!getUIScreenClass_softClass)
    {
      *(void *)long long buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getUIScreenClass_block_invoke;
      v46 = &unk_264E5EC88;
      v47 = &v41;
      __getUIScreenClass_block_invoke((uint64_t)buf);
      uint64_t v8 = (void *)v42[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v41, 8);
    uint64_t v10 = [v9 mainScreen];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    if (v12 == 0.0 || v14 == 0.0)
    {
      uint64_t v15 = getWFActionsLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]_block_invoke";
        _os_log_impl(&dword_23C364000, v15, OS_LOG_TYPE_FAULT, "%s UIScreen is reporting a zero height/width screen size, we are not going to be able to size wallpaper properly. We are likely not able to access the CA render server or something else in our process accessed mainScreen before we had access to the render server.", buf, 0xCu);
      }
    }
    id v16 = v5;
    WFImageSizeFromFile();
    double v18 = v17;
    double v20 = v19;
    uint64_t v21 = getWFActionsLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) maximumSizeInPixels];
      uint64_t v23 = v22;
      id v24 = [NSString stringWithFormat:@"w: %f, h: %f", *(void *)&v18, *(void *)&v20, v41];
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]_block_invoke";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2114;
      v46 = v24;
      _os_log_impl(&dword_23C364000, v21, OS_LOG_TYPE_DEFAULT, "%s Maximum size: %f, imageSize: %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 32) maximumSizeInPixels];
    if (v18 > v25 || ([*(id *)(a1 + 32) maximumSizeInPixels], v20 > v26))
    {
      v27 = getWFActionsLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [NSString stringWithFormat:@"w: %f, h: %f", *(void *)&v18, *(void *)&v20];
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_log_impl(&dword_23C364000, v27, OS_LOG_TYPE_DEFAULT, "%s Scaling image from size: %{public}@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) maximumSizeInPixels];
      id v29 = [v16 wfType];
      uint64_t v30 = WFResizedImageFromImageFile();

      uint64_t v31 = getWFActionsLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]_block_invoke";
        _os_log_impl(&dword_23C364000, v31, OS_LOG_TYPE_DEFAULT, "%s Image scaling complete", buf, 0xCu);
      }

      id v16 = (id)v30;
    }
    uint64_t v32 = [v16 representationType];
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2050000000;
    v33 = (void *)getUIImageClass_softClass;
    uint64_t v44 = getUIImageClass_softClass;
    if (!getUIImageClass_softClass)
    {
      *(void *)long long buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getUIImageClass_block_invoke;
      v46 = &unk_264E5EC88;
      v47 = &v41;
      __getUIImageClass_block_invoke((uint64_t)buf);
      v33 = (void *)v42[3];
    }
    id v34 = v33;
    _Block_object_dispose(&v41, 8);
    id v35 = v34;
    if (v32)
    {
      uint64_t v36 = [v16 fileURL];
      v37 = [v36 path];
      uint64_t v38 = [v35 imageWithContentsOfFile:v37];
    }
    else
    {
      uint64_t v36 = [v16 data];
      uint64_t v38 = [v35 imageWithData:v36];
    }

    [*(id *)(a1 + 32) setLegacyWallpaperWithImage:v38];
  }
  else
  {
    v39 = *(void **)(a1 + 32);
    v40 = [v39 missingImageError];
    [v39 finishRunningWithError:v40];
  }
}

- (void)deletePosterWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[WFSetWallpaperAction deletePosterWithUUID:completionHandler:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleting poster configuration matching UUID: %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = objc_alloc_init((Class)getPRSServiceClass());
  [v8 deletePosterConfigurationsMatchingUUID:v5 completion:v6];
}

- (void)finishAndSetCurrentPosterIfNecessary:(id)a3 isNewPoster:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(WFSetWallpaperAction *)self output];
    [v7 addObject:v6];
  }
  if (a4)
  {
    id v8 = getWFActionsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v16 = "-[WFSetWallpaperAction finishAndSetCurrentPosterIfNecessary:isNewPoster:]";
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_DEFAULT, "%s Setting poster as current because criteria was met (migration case)...", buf, 0xCu);
    }

    id v9 = objc_alloc_init((Class)getPRSServiceClass());
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke;
    v11[3] = &unk_264E5EBA0;
    id v12 = v6;
    uint64_t v13 = self;
    id v14 = v9;
    id v10 = v9;
    [v10 fetchPosterConfigurations:v11];
  }
  else
  {
    [(WFSetWallpaperAction *)self finishRunningWithError:0];
  }
}

void __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke_2;
  v9[3] = &unk_264E5E5F8;
  id v10 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(a2, "if_firstObjectPassingTest:", v9);
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke_3;
    v8[3] = &unk_264E5EBC8;
    id v5 = *(void **)(a1 + 48);
    v8[4] = *(void *)(a1 + 40);
    [v5 updateToSelectedConfiguration:v4 completion:v8];
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = [(id)objc_opt_class() invalidPosterError];
    [v6 finishRunningWithError:v7];
  }
}

uint64_t __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = [a2 serverUUID];
  id v4 = [*(id *)(a1 + 32) UUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 localizedName];
  id v4 = WFSanitizedPostersError();

  [v2 finishRunningWithError:v4];
}

- (void)preparePosterWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFSetWallpaperAction *)self parameterValueForKey:@"WFSelectedPoster" ofClass:objc_opt_class()];
  if (v5)
  {
    id v6 = getWFActionsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v21 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]";
      __int16 v22 = 2112;
      uint64_t v23 = v5;
      _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_DEFAULT, "%s Using user selected, non-default poster (%@) as the target", buf, 0x16u);
    }

    (*((void (**)(id, void *, void, void))v4 + 2))(v4, v5, 0, 0);
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_264E5EE18;
    aBlock[4] = self;
    id v7 = v4;
    id v19 = v7;
    id v8 = (void (**)(void))_Block_copy(aBlock);
    id v9 = [MEMORY[0x263EFFA40] systemShortcutsUserDefaults];
    id v10 = [v9 objectForKey:*MEMORY[0x263F87450]];

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      __int16 v11 = [MEMORY[0x263F86DC0] posterWithSerializedRepresentation:v10];
      id v12 = objc_alloc_init(MEMORY[0x263F86DC8]);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke_2;
      v14[3] = &unk_264E5D268;
      id v15 = v11;
      id v16 = v7;
      uint64_t v17 = v8;
      id v13 = v11;
      [v12 fetchEligiblePostersWithCompletionHandler:v14];
    }
    else
    {

      v8[2](v8);
    }
  }
}

void __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "wf_wallpaperLocationFromLocationParameter");
  id v3 = getWFActionsLogObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == 1)
  {
    if (v4)
    {
      *(_DWORD *)long long buf = 136315138;
      id v9 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_23C364000, v3, OS_LOG_TYPE_DEFAULT, "%s Failing the action because user doesn't have a selected poster and we can't set only home to a new poster", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) noPosterHomeError];
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v6);
  }
  else
  {
    if (v4)
    {
      *(_DWORD *)long long buf = 136315138;
      id v9 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_23C364000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating a new poster as a default poster", buf, 0xCu);
    }

    id v6 = objc_alloc_init((Class)getPRSServiceClass());
    id v7 = *(id *)(a1 + 40);
    objc_msgSend(v6, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:completion:");
  }
}

uint64_t __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 UUID];
  int v6 = [v4 containsObject:v5];

  id v7 = getWFActionsLogObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = a1[4];
      int v12 = 136315394;
      id v13 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]_block_invoke_2";
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEFAULT, "%s Using serialized default poster (%@) as the target", (uint8_t *)&v12, 0x16u);
    }

    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (v8)
    {
      int v12 = 136315138;
      id v13 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEFAULT, "%s Serialized default poster no longer exists or valid, going to create a new one", (uint8_t *)&v12, 0xCu);
    }

    __int16 v11 = [MEMORY[0x263EFFA40] systemShortcutsUserDefaults];
    [v11 removeObjectForKey:*MEMORY[0x263F87450]];

    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

void __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke_276(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (v3)
  {
    id v4 = [v3 serverUUID];
    [*(id *)(a1 + 32) setCreatedPosterConfigurationUUID:v4];

    id v5 = objc_alloc(MEMORY[0x263F86DC0]);
    int v6 = [v11 serverUUID];
    id v7 = WFLocalizedString(@"Default Wallpaper");
    BOOL v8 = (void *)[v5 initWithUUID:v6 name:v7 providerBundleIdentifier:*(void *)(a1 + 40)];

    uint64_t v9 = [MEMORY[0x263EFFA40] systemShortcutsUserDefaults];
    uint64_t v10 = [v8 serializedRepresentation];
    [v9 setObject:v10 forKey:*MEMORY[0x263F87450]];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)buildWallpaperConfigurationFromCollection:(id)a3 completionHandler:(id)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __84__WFSetWallpaperAction_buildWallpaperConfigurationFromCollection_completionHandler___block_invoke;
    void v15[3] = &unk_264E5D218;
    v15[4] = self;
    id v16 = v7;
    [v6 generateCollectionByCoercingToItemClasses:v8 completionHandler:v15];

    uint64_t v9 = v16;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F870B8];
    v18[0] = *MEMORY[0x263F08338];
    uint64_t v9 = WFLocalizedString(@"Unable to Set Wallpaper Photo");
    v19[0] = v9;
    v18[1] = *MEMORY[0x263F08320];
    int v12 = WFLocalizedString(@"Please provide an image to set as a wallpaper.");
    v19[1] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    __int16 v14 = [v10 errorWithDomain:v11 code:6 userInfo:v13];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
}

void __84__WFSetWallpaperAction_buildWallpaperConfigurationFromCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 numberOfItems])
  {
    uint64_t v10 = [*(id *)(a1 + 32) parameterValueForKey:@"WFWallpaperLegibilityBlur" ofClass:objc_opt_class()];
    uint64_t v11 = [*(id *)(a1 + 32) parameterValueForKey:@"WFWallpaperSmartCrop" ofClass:objc_opt_class()];
    uint64_t v31 = [*(id *)(a1 + 32) parameterValueForKey:@"WFWallpaperShowPreview" ofClass:objc_opt_class()];
    uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "wf_wallpaperLocationFromLocationParameter");
    if (v12 == -1)
    {
      uint64_t v19 = *(void *)(a1 + 40);
      double v20 = [*(id *)(a1 + 32) invalidLocationError];
      (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);

LABEL_21:
      goto LABEL_22;
    }
    uint64_t v13 = v12;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__49404;
    uint64_t v43 = __Block_byref_object_dispose__49405;
    id v44 = 0;
    __int16 v14 = [v7 items];
    uint64_t v15 = [v14 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
      id v29 = v8;
      uint64_t v30 = v11;
      if (v16)
      {
        objc_opt_class();
        uint64_t v17 = v10;
        if (objc_opt_isKindOfClass()) {
          double v18 = v16;
        }
        else {
          double v18 = 0;
        }
      }
      else
      {
        uint64_t v17 = v10;
        double v18 = 0;
      }
      id v23 = v18;

      uint64_t v24 = [v23 asset];
      id v25 = objc_alloc(MEMORY[0x263F85490]);
      double v26 = [v24 localIdentifier];
      uint64_t v27 = [v25 initWithLocalIdentifier:v26 location:v13 legibilityBlur:v17 smartCrop:v30 usePreview:v31];
      id v28 = (void *)v40[5];
      v40[5] = v27;

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_20:

        _Block_object_dispose(&v39, 8);
        goto LABEL_21;
      }
      id v21 = v15;
      id v29 = v8;
      uint64_t v30 = v11;
      if (v21)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v22 = v21;
        }
        else {
          __int16 v22 = 0;
        }
      }
      else
      {
        __int16 v22 = 0;
      }
      id v23 = v22;

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __84__WFSetWallpaperAction_buildWallpaperConfigurationFromCollection_completionHandler___block_invoke_269;
      v32[3] = &unk_264E5D1F0;
      id v36 = *(id *)(a1 + 40);
      v37 = &v39;
      uint64_t v38 = v13;
      uint64_t v17 = v10;
      id v33 = v10;
      id v34 = v30;
      id v35 = v31;
      [v23 getFileRepresentation:v32 forType:0];

      uint64_t v24 = v36;
    }

    uint64_t v10 = v17;
    id v8 = v29;
    uint64_t v11 = v30;
    goto LABEL_20;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_22:
}

void __84__WFSetWallpaperAction_buildWallpaperConfigurationFromCollection_completionHandler___block_invoke_269(void *a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = objc_alloc(MEMORY[0x263F85490]);
    id v4 = [v8 fileURL];
    uint64_t v5 = [v3 initWithURL:v4 location:a1[9] legibilityBlur:a1[4] smartCrop:a1[5] usePreview:a1[6]];
    uint64_t v6 = *(void *)(a1[8] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)cancel
{
  v10.receiver = self;
  v10.super_class = (Class)WFSetWallpaperAction;
  [(WFSetWallpaperAction *)&v10 cancel];
  if ([(WFSetWallpaperAction *)self supportsPosters])
  {
    id v3 = [(WFSetWallpaperAction *)self createdPosterConfigurationUUID];

    if (v3)
    {
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      uint64_t v5 = [(WFSetWallpaperAction *)self createdPosterConfigurationUUID];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __30__WFSetWallpaperAction_cancel__block_invoke;
      v8[3] = &unk_264E5EBC8;
      dispatch_semaphore_t v9 = v4;
      uint64_t v6 = v4;
      [(WFSetWallpaperAction *)self deletePosterWithUUID:v5 completionHandler:v8];

      dispatch_time_t v7 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v6, v7);
    }
  }
}

void __30__WFSetWallpaperAction_cancel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3)
  {
    dispatch_semaphore_t v4 = getWFActionsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[WFSetWallpaperAction cancel]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_ERROR, "%s Failed to delete new default poster during cancellation with error: %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WFSetWallpaperAction *)self supportsPosters])
  {
    int v5 = getWFActionsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v8 = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]";
      _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_DEFAULT, "%s Device supports posters, going down modern wallpaper path (v4)", buf, 0xCu);
    }

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke;
    v6[3] = &unk_264E5D1C8;
    v6[4] = self;
    [(WFSetWallpaperAction *)self buildWallpaperConfigurationFromCollection:v4 completionHandler:v6];
  }
  else
  {
    [(WFSetWallpaperAction *)self runLegacySetWallpaperWithInput:v4];
  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  __int16 v7 = *(void **)(a1 + 32);
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_264E5D1A0;
    void v8[4] = v7;
    id v9 = v5;
    [v7 preparePosterWithCompletionHandler:v8];
  }
  else
  {
    [v7 finishRunningWithError:a3];
  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    id v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]_block_invoke_2";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      id v28 = v7;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_DEFAULT, "%s Setting configuration: %@ on poster: %@", buf, 0x20u);
    }

    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2050000000;
    uint64_t v11 = (void *)getPRSExternalSystemServiceClass_softClass;
    uint64_t v26 = getPRSExternalSystemServiceClass_softClass;
    if (!getPRSExternalSystemServiceClass_softClass)
    {
      *(void *)long long buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getPRSExternalSystemServiceClass_block_invoke;
      id v28 = &unk_264E5EC88;
      id v29 = &v23;
      __getPRSExternalSystemServiceClass_block_invoke((uint64_t)buf);
      uint64_t v11 = (void *)v24[3];
    }
    uint64_t v12 = v11;
    _Block_object_dispose(&v23, 8);
    id v13 = objc_alloc_init(v12);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_241;
    v18[3] = &unk_264E5D178;
    v18[4] = *(void *)(a1 + 32);
    char v22 = a3;
    id v19 = v7;
    id v20 = *(id *)(a1 + 40);
    id v21 = v13;
    id v14 = v13;
    [v14 fetchEligibleConfigurationsWithCompletion:v18];
  }
  else
  {
    uint64_t v15 = *(void **)(a1 + 32);
    id v16 = [v15 localizedName];
    uint64_t v17 = WFSanitizedPostersError();
    [v15 finishRunningWithError:v17];
  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_241(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v32 = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]_block_invoke";
    __int16 v33 = 2112;
    id v34 = v5;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEFAULT, "%s Found eligible posters: %@, error: %@", buf, 0x20u);
  }

  if (!v5)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v11 localizedName];
    id v13 = WFSanitizedPostersError();
    [v11 finishRunningWithError:v13];

LABEL_20:
    goto LABEL_21;
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    id v8 = [*(id *)(a1 + 40) UUID];
    char v9 = [v5 containsObject:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v12 = [(id)objc_opt_class() invalidPosterError];
      [v23 finishRunningWithError:v12];
      goto LABEL_20;
    }
  }
  if ([*(id *)(a1 + 48) location]) {
    BOOL v10 = [*(id *)(a1 + 48) location] != 2;
  }
  else {
    BOOL v10 = 0;
  }
  int v14 = [*(id *)(a1 + 32) showPreview];
  uint64_t v15 = getWFActionsLogObject();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v14 || v10)
  {
    if (v16)
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v32 = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]_block_invoke_5";
      _os_log_impl(&dword_23C364000, v15, OS_LOG_TYPE_DEFAULT, "%s Updating poster...", buf, 0xCu);
    }

    id v19 = *(void **)(a1 + 56);
    id v20 = [*(id *)(a1 + 40) UUID];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_248;
    v24[3] = &unk_264E5D150;
    id v21 = *(void **)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    v24[4] = *(void *)(a1 + 32);
    id v25 = v21;
    char v26 = *(unsigned char *)(a1 + 64);
    [v19 updatePosterMatchingUUID:v20 withConfiguration:v22 completion:v24];

    double v18 = v25;
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v32 = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]_block_invoke";
      _os_log_impl(&dword_23C364000, v15, OS_LOG_TYPE_DEFAULT, "%s Showing wallpaper editing UI...", buf, 0xCu);
    }

    uint64_t v17 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_242;
    v27[3] = &unk_264E5D128;
    v27[4] = v17;
    id v28 = *(id *)(a1 + 48);
    id v29 = *(id *)(a1 + 40);
    char v30 = *(unsigned char *)(a1 + 64);
    [v17 requestUnlock:v27];

    double v18 = v28;
  }

LABEL_21:
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_242(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_2_243;
    v5[3] = &unk_264E5D100;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    char v8 = *(unsigned char *)(a1 + 56);
    [v2 requestInterfacePresentationWithCompletionHandler:v5];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) deviceLockedError];
    [v2 finishRunningWithError:v4];
  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_248(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [*(id *)(a1 + 32) finishAndSetCurrentPosterIfNecessary:*(void *)(a1 + 40) isNewPoster:*(unsigned __int8 *)(a1 + 48)];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) localizedName];
    id v7 = WFSanitizedPostersError();
    [v5 finishRunningWithError:v7];
  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_2_243(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_3;
    v7[3] = &unk_264E5D0D8;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v4;
    char v9 = *(unsigned char *)(a1 + 56);
    [a2 showPreviewForConfiguration:v5 selectedPoster:v8 completionHandler:v7];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "finishRunningWithError:");
  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "wf_isUserCancelledError")
    && ([*(id *)(a1 + 32) createdPosterConfigurationUUID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v5 createdPosterConfigurationUUID];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_4;
    void v10[3] = &unk_264E5ED78;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v3;
    [v5 deletePosterWithUUID:v6 completionHandler:v10];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    if (v3)
    {
      id v8 = [*(id *)(a1 + 32) localizedName];
      char v9 = WFSanitizedPostersError();
      [v7 finishRunningWithError:v9];
    }
    else
    {
      [*(id *)(a1 + 32) finishAndSetCurrentPosterIfNecessary:*(void *)(a1 + 40) isNewPoster:*(unsigned __int8 *)(a1 + 48)];
    }
  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 localizedName];
  id v4 = WFSanitizedPostersError();

  [v2 finishRunningWithError:v4];
}

- (BOOL)supportsPosters
{
  uint64_t v2 = [MEMORY[0x263F85258] currentDevice];
  char v3 = [v2 hasCapability:*MEMORY[0x263F85678]];

  return v3;
}

- (BOOL)showPreview
{
  uint64_t v2 = [(WFSetWallpaperAction *)self parameterValueForKey:@"WFWallpaperShowPreview" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)inputPassthrough
{
  return ![(WFSetWallpaperAction *)self supportsPosters];
}

+ (id)unableToGetImageError
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  id v4 = WFLocalizedString(@"Unable to Set Wallpaper");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  id v5 = WFLocalizedString(@"Unable to fetch the image provided.");
  v10[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = [v2 errorWithDomain:v3 code:6 userInfo:v6];

  return v7;
}

+ (id)invalidPosterError
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  id v4 = WFLocalizedString(@"Unable to Set Wallpaper Photo");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  id v5 = WFLocalizedString(@"Photos cannot be set on the selected wallpaper. Please select a different wallpaper.");
  v10[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = [v2 errorWithDomain:v3 code:6 userInfo:v6];

  return v7;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2BD8;
}

@end