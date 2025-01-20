@interface CAMSmartStyleSettingsRootController
- (BOOL)_canShowWhileLocked;
- (BOOL)_validateIsCurrentPicker:(id)a3;
- (CAMSmartStyleSettingsPickerViewController)_pickerViewController;
- (CAMSmartStyleSettingsResourceLoadingManager)_resourceLoadingManager;
- (CAMSmartStyleSettingsView)_settingsView;
- (CEKSmartStyle)_persistedSystemStyle;
- (NSArray)_selectedAssetIdentifiers;
- (NSMutableDictionary)_cachedStyles;
- (id)_cancelButtonItem;
- (id)_readSelectedAssetIdentifiers;
- (id)_readSystemStyleFromDefaultsWrites;
- (id)_styleForPresetType:(int64_t)a3;
- (id)previewViewController:(id)a3 requestsLoadResultForGridIndex:(int64_t)a4;
- (id)settingsView:(id)a3 requestsStyleForPresetType:(int64_t)a4;
- (id)settingsView:(id)a3 requestsViewControllerForPresetType:(int64_t)a4 pageIndex:(unint64_t)a5 parentViewController:(id *)a6;
- (int64_t)_currentStylePreset;
- (void)_applicationDidEnterBackground;
- (void)_didFinishPickingFromPicker:(id)a3;
- (void)_dismiss;
- (void)_dismissPicker;
- (void)_dismissWithCompletion:(id)a3;
- (void)_persistSystemStyle:(id)a3;
- (void)_pickerDidCancel;
- (void)_writeSelectedAssetIdentifiers:(id)a3;
- (void)addChildViewController:(id)a3 toView:(id)a4;
- (void)loadView;
- (void)previewViewController:(id)a3 didChangeAnimatingGrid:(BOOL)a4;
- (void)set_currentStylePreset:(int64_t)a3;
- (void)settingsView:(id)a3 didChangeToStylePreset:(int64_t)a4;
- (void)settingsView:(id)a3 didUpdateStyle:(id)a4 forPresetType:(int64_t)a5;
- (void)settingsView:(id)a3 requestsTitle:(id)a4 showBackButton:(BOOL)a5 showCancelButton:(BOOL)a6 cancelButtonOnLeft:(BOOL)a7;
- (void)settingsViewDidConfirmStyle:(id)a3;
- (void)settingsViewRequestsDismiss:(id)a3 completion:(id)a4;
- (void)settingsViewRequestsResetToStandardStyleAndDismiss:(id)a3;
- (void)settingsViewRequestsUserAssetSelection:(id)a3;
- (void)smartStyleSettingsPickerDidConfirmSelection:(id)a3;
- (void)smartStyleSettingsPickerDidUpdateSelectedAssetIdentifiers:(id)a3;
- (void)smartStyleSettingsResourceLoadingManager:(id)a3 didFinishLoadingForAssetIdentifier:(id)a4;
@end

@implementation CAMSmartStyleSettingsRootController

- (void)loadView
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)CAMSmartStyleSettingsRootController;
  [(CAMSmartStyleSettingsRootController *)&v39 loadView];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  cachedStyles = self->__cachedStyles;
  self->__cachedStyles = v3;

  v5 = [(CAMSmartStyleSettingsRootController *)self _readSelectedAssetIdentifiers];
  selectedAssetIdentifiers = self->__selectedAssetIdentifiers;
  self->__selectedAssetIdentifiers = v5;

  if ([(NSArray *)self->__selectedAssetIdentifiers count] <= 3)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v8 = objc_alloc_init(MEMORY[0x263F14E18]);
    v9 = [MEMORY[0x263F5D940] predicateForStyleableAssets];
    [v8 setInternalPredicate:v9];

    [v8 setFetchLimit:4];
    v10 = [MEMORY[0x263F14D18] fetchAssetsWithOptions:v8];
    double v11 = CFAbsoluteTimeGetCurrent();
    v12 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v10 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v42 = v13;
      __int16 v43 = 2048;
      double v44 = v11 - Current;
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Settings: fetched %ld assets in %.3f seconds", buf, 0x16u);
    }

    BOOL v32 = (unint64_t)[v10 count] > 3;
  }
  else
  {
    BOOL v32 = 1;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v14 = [&unk_26BDDFF80 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(&unk_26BDDFF80);
        }
        v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v19 = objc_msgSend(objc_alloc(MEMORY[0x263F306F8]), "initWithPresetType:", objc_msgSend(v18, "integerValue"));
        [(NSMutableDictionary *)self->__cachedStyles setObject:v19 forKeyedSubscript:v18];
      }
      uint64_t v15 = [&unk_26BDDFF80 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v15);
  }
  v20 = [(CAMSmartStyleSettingsRootController *)self _readSystemStyleFromDefaultsWrites];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __47__CAMSmartStyleSettingsRootController_loadView__block_invoke;
  v33[3] = &unk_263FA36F8;
  id v21 = v20;
  id v34 = v21;
  uint64_t v22 = [&unk_26BDDFF80 indexOfObjectPassingTest:v33];
  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = v22;
    v24 = self->__cachedStyles;
    v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "presetType"));
    [(NSMutableDictionary *)v24 setObject:v21 forKeyedSubscript:v25];
  }
  v26 = [&unk_26BDDFF80 objectAtIndexedSubscript:v23];
  self->__currentStylePreset = [v26 integerValue];

  objc_storeStrong((id *)&self->__persistedSystemStyle, v20);
  v27 = objc_alloc_init(CAMSmartStyleSettingsResourceLoadingManager);
  resourceLoadingManager = self->__resourceLoadingManager;
  self->__resourceLoadingManager = v27;

  [(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager setDelegate:self];
  if (v32) {
    [(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager loadResourcesForAssetIdentifiers:self->__selectedAssetIdentifiers unloadAllOthers:1];
  }
  v29 = -[CAMSmartStyleSettingsView initWithDelegate:stylePresets:selectedIndex:hasEnoughPhotos:usingMostCompatibleFormat:]([CAMSmartStyleSettingsView alloc], "initWithDelegate:stylePresets:selectedIndex:hasEnoughPhotos:usingMostCompatibleFormat:", self, &unk_26BDDFF80, v23, v32, [MEMORY[0x263F5DF10] newFormatsConfiguration] == 1);
  settingsView = self->__settingsView;
  self->__settingsView = v29;

  [(CAMSmartStyleSettingsRootController *)self setView:self->__settingsView];
  v31 = [MEMORY[0x263F08A00] defaultCenter];
  [v31 addObserver:self selector:sel__applicationDidEnterBackground name:*MEMORY[0x263F83330] object:0];
}

BOOL __47__CAMSmartStyleSettingsRootController_loadView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  return v3 == [*(id *)(a1 + 32) presetType];
}

- (void)_applicationDidEnterBackground
{
  uint64_t v3 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Settings: stopping all animations for DidEnterBackground", v5, 2u);
  }

  v4 = [(CAMSmartStyleSettingsRootController *)self _settingsView];
  [v4 stopAllAnimations];
}

- (id)_cancelButtonItem
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x263F824A8]);
  uint64_t v3 = (void *)MEMORY[0x263F823D0];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __56__CAMSmartStyleSettingsRootController__cancelButtonItem__block_invoke;
  v10 = &unk_263FA3720;
  objc_copyWeak(&v11, &location);
  v4 = [v3 actionWithHandler:&v7];
  v5 = objc_msgSend(v2, "initWithBarButtonSystemItem:primaryAction:", 1, v4, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __56__CAMSmartStyleSettingsRootController__cancelButtonItem__block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "User tapped Cancel button", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismiss];
}

- (id)previewViewController:(id)a3 requestsLoadResultForGridIndex:(int64_t)a4
{
  v6 = [(CAMSmartStyleSettingsRootController *)self _selectedAssetIdentifiers];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v8 = [(CAMSmartStyleSettingsRootController *)self _selectedAssetIdentifiers];
    v9 = [v8 objectAtIndexedSubscript:a4];

    v10 = [(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager resourceLoaderForAssetIdentifier:v9];
    id v11 = [v10 resourceLoadResult];
  }
  return v11;
}

- (void)previewViewController:(id)a3 didChangeAnimatingGrid:(BOOL)a4
{
}

- (void)settingsView:(id)a3 requestsTitle:(id)a4 showBackButton:(BOOL)a5 showCancelButton:(BOOL)a6 cancelButtonOnLeft:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [(CAMSmartStyleSettingsRootController *)self navigationItem];
  [v14 setTitle:v13];

  uint64_t v15 = [(CAMSmartStyleSettingsRootController *)self navigationItem];
  uint64_t v16 = v15;
  if (v9)
  {
    v17 = [v15 backAction];

    if (!v17)
    {
      objc_initWeak(&location, self);
      v18 = (void *)MEMORY[0x263F823D0];
      v19 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_BACK_BUTTON_TITLE", 0);
      uint64_t v29 = MEMORY[0x263EF8330];
      uint64_t v30 = 3221225472;
      v31 = __117__CAMSmartStyleSettingsRootController_settingsView_requestsTitle_showBackButton_showCancelButton_cancelButtonOnLeft___block_invoke;
      BOOL v32 = &unk_263FA3720;
      objc_copyWeak(&v33, &location);
      v20 = [v18 actionWithTitle:v19 image:0 identifier:0 handler:&v29];
      id v21 = [(CAMSmartStyleSettingsRootController *)self navigationItem];
      [v21 setBackAction:v20];

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [v15 setBackAction:0];
  }
  int v22 = v8 && v7;
  if (v8 && v7)
  {
    uint64_t v23 = [(CAMSmartStyleSettingsRootController *)self _cancelButtonItem];
  }
  else
  {
    uint64_t v23 = 0;
  }
  BOOL v24 = !v8;
  v25 = [(CAMSmartStyleSettingsRootController *)self navigationItem];
  [v25 setLeftBarButtonItem:v23];

  if (v22) {
  BOOL v26 = v24 || v7;
  }
  if (v24 || v7)
  {
    v27 = 0;
  }
  else
  {
    v27 = [(CAMSmartStyleSettingsRootController *)self _cancelButtonItem];
  }
  v28 = [(CAMSmartStyleSettingsRootController *)self navigationItem];
  [v28 setRightBarButtonItem:v27];

  if (!v26) {
}
  }

void __117__CAMSmartStyleSettingsRootController_settingsView_requestsTitle_showBackButton_showCancelButton_cancelButtonOnLeft___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "User tapped Back button", (uint8_t *)&v8, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = [WeakRetained _settingsView];
  [v6 performBackAction];

  BOOL v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Completed back action %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)settingsViewRequestsDismiss:(id)a3 completion:(id)a4
{
}

- (void)_dismiss
{
}

- (void)_dismissWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMSmartStyleSettingsRootController *)self navigationController];
  [v5 dismissViewControllerAnimated:1 completion:v4];
}

- (void)settingsViewRequestsUserAssetSelection:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F15210]);
  id v5 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
  v6 = (void *)[v4 initWithPhotoLibrary:v5];

  [v6 setPreferredAssetRepresentationMode:1];
  [v6 setSelectionLimit:4];
  BOOL v7 = (void *)MEMORY[0x263F15218];
  int v8 = [MEMORY[0x263F15218] _styleabilityFilter];
  v15[0] = v8;
  id v9 = [MEMORY[0x263F15218] imagesFilter];
  v15[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  id v11 = [v7 allFilterMatchingSubfilters:v10];
  [v6 setFilter:v11];

  id v12 = [[CAMSmartStyleSettingsPickerViewController alloc] initWithPickerConfiguration:v6 selectedAssetIdentifiers:self->__selectedAssetIdentifiers];
  [(CAMSmartStyleSettingsPickerViewController *)v12 setDelegate:self];
  pickerViewController = self->__pickerViewController;
  self->__pickerViewController = v12;
  uint64_t v14 = v12;

  [(CAMSmartStyleSettingsRootController *)self presentViewController:v14 animated:1 completion:0];
}

- (id)settingsView:(id)a3 requestsViewControllerForPresetType:(int64_t)a4 pageIndex:(unint64_t)a5 parentViewController:(id *)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a6) {
    *a6 = self;
  }
  id v9 = [(CAMSmartStyleSettingsRootController *)self _selectedAssetIdentifiers];
  BOOL v10 = [v9 count] != 1;

  id v11 = [[CAMSmartStylePreviewViewController alloc] initWithDelegate:self gridLayout:v10 pageIndex:a5];
  id v12 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = CEKDebugStringForSmartStylePresetType();
    int v18 = 134218242;
    unint64_t v19 = a5;
    __int16 v20 = 2114;
    id v21 = v13;
    _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Settings: created new view controller for page=%lu/%{public}@", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v14 = [(CAMSmartStyleSettingsRootController *)self _cachedStyles];
  uint64_t v15 = [NSNumber numberWithInteger:a4];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];

  [(CAMSmartStylePreviewViewController *)v11 updateWithStyle:v16];
  return v11;
}

- (id)settingsView:(id)a3 requestsStyleForPresetType:(int64_t)a4
{
  return [(CAMSmartStyleSettingsRootController *)self _styleForPresetType:a4];
}

- (id)_styleForPresetType:(int64_t)a3
{
  cachedStyles = self->__cachedStyles;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)cachedStyles objectForKeyedSubscript:v4];

  return v5;
}

- (void)settingsView:(id)a3 didUpdateStyle:(id)a4 forPresetType:(int64_t)a5
{
  id v7 = a4;
  int v8 = [(NSMutableDictionary *)self->__cachedStyles allKeys];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__CAMSmartStyleSettingsRootController_settingsView_didUpdateStyle_forPresetType___block_invoke;
  v10[3] = &unk_263FA3748;
  id v11 = v7;
  int64_t v12 = a5;
  v10[4] = self;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v10];
}

void __81__CAMSmartStyleSettingsRootController_settingsView_didUpdateStyle_forPresetType___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ([v12 integerValue] == *(void *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 1008) setObject:*(void *)(a1 + 40) forKeyedSubscript:v12];
  }
  else
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 1008) objectForKeyedSubscript:v12];
    id v4 = objc_alloc(MEMORY[0x263F306F8]);
    uint64_t v5 = [v3 presetType];
    [v3 castIntensity];
    double v7 = v6;
    [*(id *)(a1 + 40) toneBias];
    double v9 = v8;
    [*(id *)(a1 + 40) colorBias];
    id v11 = (void *)[v4 initWithPresetType:v5 castIntensity:v7 toneBias:v9 colorBias:v10];
    [*(id *)(*(void *)(a1 + 32) + 1008) setObject:v11 forKeyedSubscript:v12];
  }
}

- (void)settingsViewDidConfirmStyle:(id)a3
{
  cachedStyles = self->__cachedStyles;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMSmartStyleSettingsRootController _currentStylePreset](self, "_currentStylePreset", a3));
  id v6 = [(NSMutableDictionary *)cachedStyles objectForKeyedSubscript:v5];

  [(CAMSmartStyleSettingsRootController *)self _persistSystemStyle:v6];
}

- (void)settingsViewRequestsResetToStandardStyleAndDismiss:(id)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F306F8]) initWithPresetType:1];
  [(CAMSmartStyleSettingsRootController *)self _persistSystemStyle:v4];
  [(CAMSmartStyleSettingsRootController *)self _dismiss];
}

- (void)addChildViewController:(id)a3 toView:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  [(CAMSmartStyleSettingsRootController *)self addChildViewController:v8];
  double v7 = [v8 view];
  [v6 addSubview:v7];

  [v8 didMoveToParentViewController:self];
}

- (void)_persistSystemStyle:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->__persistedSystemStyle, a3);
  id v6 = +[CAMCaptureConversions AVCaptureSmartStyleForCEKSmartStyle:v5];
  +[CAMSmartStyleUtilities writeAVCaptureSystemStyle:v6];
  double v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Settings: set SystemStyle: %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)settingsView:(id)a3 didChangeToStylePreset:(int64_t)a4
{
}

- (id)_readSystemStyleFromDefaultsWrites
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = +[CAMSmartStyleUtilities readAVCaptureSystemStyle];
  id v3 = objc_alloc(MEMORY[0x263F306F8]);
  id v4 = [v2 cast];
  int64_t v5 = +[CAMCaptureConversions CEKSmartStylePresetTypeForAVSmartStyleCastType:v4];
  [v2 intensity];
  double v7 = v6;
  [v2 toneBias];
  double v9 = v8;
  [v2 colorBias];
  id v11 = (void *)[v3 initWithPresetType:v5 castIntensity:v7 toneBias:v9 colorBias:v10];

  id v12 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    uint64_t v15 = v11;
    _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Settings: read SystemStyle: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  return v11;
}

- (BOOL)_validateIsCurrentPicker:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMSmartStyleSettingsRootController *)self _pickerViewController];

  if (v5 != v4)
  {
    float v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CAMSmartStyleSettingsRootController *)(uint64_t)v4 _validateIsCurrentPicker:v6];
    }
  }
  return v5 == v4;
}

- (void)smartStyleSettingsPickerDidUpdateSelectedAssetIdentifiers:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CAMSmartStyleSettingsRootController *)self _validateIsCurrentPicker:v4])
  {
    id v5 = [v4 selectedAssetIdentifiers];
    float v6 = [v4 initialSelectedAssetIdentifiers];
    double v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      float v8 = [(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager logIdentifierForAssetIdentifiers:v5];
      int v11 = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Settings: didUpdateSelectedAssetIdentifiers %{public}@", (uint8_t *)&v11, 0xCu);
    }
    double v9 = [v5 arrayByAddingObjectsFromArray:v6];
    [(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager loadResourcesForAssetIdentifiers:v9 unloadAllOthers:1];
    if (![(NSArray *)self->__selectedAssetIdentifiers isEqualToArray:v5])
    {
      objc_storeStrong((id *)&self->__selectedAssetIdentifiers, v5);
      float v10 = [(CAMSmartStyleSettingsRootController *)self _settingsView];
      [v10 updateImageViews];
    }
  }
}

- (void)smartStyleSettingsPickerDidConfirmSelection:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CAMSmartStyleSettingsRootController *)self _validateIsCurrentPicker:v4])
  {
    id v5 = [v4 selectedAssetIdentifiers];
    if ([(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager isWaitingOnLoadingForAssetIdentifiers:v5])
    {
      float v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        double v7 = [(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager logIdentifierForAssetIdentifiers:v5];
        int v8 = 138543362;
        double v9 = v7;
        _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Settings: didFinishPicking %{public}@ (waiting on loading)", (uint8_t *)&v8, 0xCu);
      }
      [v4 setWaitingOnLoading:1];
    }
    else
    {
      [(CAMSmartStyleSettingsRootController *)self _didFinishPickingFromPicker:v4];
    }
  }
}

- (void)_didFinishPickingFromPicker:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [a3 selectedAssetIdentifiers];
  id v5 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    float v6 = [(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager logIdentifierForAssetIdentifiers:v4];
    int v10 = 138543362;
    int v11 = v6;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Settings: didFinishPicking %{public}@", (uint8_t *)&v10, 0xCu);
  }
  if (![(NSArray *)self->__selectedAssetIdentifiers isEqualToArray:v4])
  {
    objc_storeStrong((id *)&self->__selectedAssetIdentifiers, v4);
    double v7 = [(CAMSmartStyleSettingsRootController *)self _settingsView];
    [v7 updateImageViews];
  }
  [(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager loadResourcesForAssetIdentifiers:v4 unloadAllOthers:1];
  [(CAMSmartStyleSettingsRootController *)self _writeSelectedAssetIdentifiers:v4];
  int v8 = [(CAMSmartStyleSettingsRootController *)self _settingsView];
  [v8 zoomOutToGridAnimated:0];

  if ([(NSArray *)self->__selectedAssetIdentifiers count])
  {
    double v9 = [(CAMSmartStyleSettingsRootController *)self _settingsView];
    [v9 didFinishPickingAssets];
  }
  [(CAMSmartStyleSettingsRootController *)self _dismissPicker];
}

- (void)_pickerDidCancel
{
  id v3 = [(CAMSmartStyleSettingsRootController *)self _pickerViewController];
  int v4 = [v3 isWaitingOnLoading];
  id v5 = os_log_create("com.apple.camera", "SmartStyleSettings");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    __int16 v12 = 0;
    double v7 = "Settings: did cancel picker while waiting for loading";
    int v8 = (uint8_t *)&v12;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    LOWORD(v11) = 0;
    double v7 = "Settings: did cancel";
    int v8 = (uint8_t *)&v11;
  }
  _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_7:

  double v9 = [v3 initialSelectedAssetIdentifiers];
  if (![(NSArray *)self->__selectedAssetIdentifiers isEqualToArray:v9])
  {
    objc_storeStrong((id *)&self->__selectedAssetIdentifiers, v9);
    int v10 = [(CAMSmartStyleSettingsRootController *)self _settingsView];
    [v10 updateImageViews];
  }
  [(CAMSmartStyleSettingsRootController *)self _dismissPicker];
}

- (void)_dismissPicker
{
  [(CAMSmartStyleSettingsPickerViewController *)self->__pickerViewController setDelegate:0];
  pickerViewController = self->__pickerViewController;
  self->__pickerViewController = 0;

  [(CAMSmartStyleSettingsRootController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)smartStyleSettingsResourceLoadingManager:(id)a3 didFinishLoadingForAssetIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [(CAMSmartStyleSettingsRootController *)self _pickerViewController];
  if ([v5 isWaitingOnLoading])
  {
    BOOL v6 = [v5 selectedAssetIdentifiers];
    if (![(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager isWaitingOnLoadingForAssetIdentifiers:v6])
    {
      double v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = [(CAMSmartStyleSettingsResourceLoadingManager *)self->__resourceLoadingManager logIdentifierForAssetIdentifiers:v6];
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Settings: did finish waiting for loading %{public}@", (uint8_t *)&v10, 0xCu);
      }
      [(CAMSmartStyleSettingsRootController *)self _didFinishPickingFromPicker:v5];
    }
  }
  double v9 = [(CAMSmartStyleSettingsRootController *)self _settingsView];
  [v9 updateImageViews];
}

- (id)_readSelectedAssetIdentifiers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = (void *)CFPreferencesCopyAppValue(@"CAMUserPreferencesSmartStylesSettingsSelectedAssetIdentifiers", @"com.apple.camera");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v28 = 1;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __68__CAMSmartStyleSettingsRootController__readSelectedAssetIdentifiers__block_invoke;
    v25[3] = &unk_263FA3770;
    v25[4] = buf;
    [v2 enumerateObjectsUsingBlock:v25];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      _Block_object_dispose(buf, 8);
      if (v2) {
        goto LABEL_8;
      }
    }
    else
    {

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
  }
  id v2 = (void *)MEMORY[0x263EFFA68];
LABEL_8:
  if ([v2 count])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F14E18]);
    int v4 = [MEMORY[0x263F5D940] predicateForStyleableAssets];
    [v3 setInternalPredicate:v4];

    double Current = CFAbsoluteTimeGetCurrent();
    BOOL v6 = [MEMORY[0x263F14D18] fetchAssetsWithLocalIdentifiers:v2 options:v3];
    double v7 = CFAbsoluteTimeGetCurrent();
    int v8 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v7 - Current;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Settings: Fetching assets for validation took %.3f seconds", buf, 0xCu);
    }

    double v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          int v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "localIdentifier", (void)v21);
          [v9 addObject:v14];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [v2 count];
    if (v15 != [v9 count])
    {
      uint64_t v16 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v9 count];
        uint64_t v18 = [v2 count];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "Settings: Could only find %ld assets out of %ld", buf, 0x16u);
      }

      id v19 = v9;
      id v2 = v19;
    }
  }
  return v2;
}

void __68__CAMSmartStyleSettingsRootController__readSelectedAssetIdentifiers__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)_writeSelectedAssetIdentifiers:(id)a3
{
  CFPreferencesSetAppValue(@"CAMUserPreferencesSmartStylesSettingsSelectedAssetIdentifiers", a3, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CAMSmartStyleSettingsView)_settingsView
{
  return self->__settingsView;
}

- (NSArray)_selectedAssetIdentifiers
{
  return self->__selectedAssetIdentifiers;
}

- (CAMSmartStyleSettingsResourceLoadingManager)_resourceLoadingManager
{
  return self->__resourceLoadingManager;
}

- (int64_t)_currentStylePreset
{
  return self->__currentStylePreset;
}

- (void)set_currentStylePreset:(int64_t)a3
{
  self->__currentStylePreset = a3;
}

- (NSMutableDictionary)_cachedStyles
{
  return self->__cachedStyles;
}

- (CEKSmartStyle)_persistedSystemStyle
{
  return self->__persistedSystemStyle;
}

- (CAMSmartStyleSettingsPickerViewController)_pickerViewController
{
  return self->__pickerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pickerViewController, 0);
  objc_storeStrong((id *)&self->__persistedSystemStyle, 0);
  objc_storeStrong((id *)&self->__cachedStyles, 0);
  objc_storeStrong((id *)&self->__resourceLoadingManager, 0);
  objc_storeStrong((id *)&self->__selectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->__settingsView, 0);
}

- (void)_validateIsCurrentPicker:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 _pickerViewController];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  double v9 = v5;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "Settings: got picker callback from %{public}@ instead of expected %{public}@", (uint8_t *)&v6, 0x16u);
}

@end