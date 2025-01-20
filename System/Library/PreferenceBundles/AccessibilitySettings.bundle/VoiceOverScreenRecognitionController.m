@interface VoiceOverScreenRecognitionController
- (AXAsset)cachedAsset;
- (AXAssetController)assetController;
- (AXElementVisionModelAssetPolicy)elementVisionModelAssetPolicy;
- (BOOL)_isFeatureEnabled;
- (id)_appsApplied:(id)a3;
- (id)_ignoreAppAccessibility:(id)a3;
- (id)_neuralVisionEnabled:(id)a3;
- (id)_validateAssetFromResults:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_addSettingToRotor:(id)a3;
- (void)_downloadModel;
- (void)_purgeModel;
- (void)_setIgnoreAppAccessibility:(id)a3 specifier:(id)a4;
- (void)_setNeuralVisionEnabled:(id)a3 specifier:(id)a4;
- (void)_updateAssetStatusCell:(int64_t)a3 error:(id)a4 downloaded:(int64_t)a5 expected:(int64_t)a6;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)setAssetController:(id)a3;
- (void)setCachedAsset:(id)a3;
- (void)setElementVisionModelAssetPolicy:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation VoiceOverScreenRecognitionController

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)VoiceOverScreenRecognitionController;
  [(VoiceOverScreenRecognitionController *)&v13 viewDidLoad];
  v3 = [(VoiceOverScreenRecognitionController *)self elementVisionModelAssetPolicy];
  v4 = +[AXAssetController assetControllerWithPolicy:v3 qosClass:25];
  assetController = self->_assetController;
  self->_assetController = v4;

  [(AXAssetController *)self->_assetController setUserInitiated:1];
  [(AXAssetController *)self->_assetController addObserver:self];
  objc_initWeak(&location, self);
  v6 = +[AXSettings sharedInstance];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = __51__VoiceOverScreenRecognitionController_viewDidLoad__block_invoke;
  v10 = &unk_208798;
  objc_copyWeak(&v11, &location);
  [v6 registerUpdateBlock:&v7 forRetrieveSelector:"voiceOverImageCaptionsEnabled" withListener:self];

  objc_destroyWeak(&v11);
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](self->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, 1, 0, 0, v7, v8, v9, v10);
  objc_destroyWeak(&location);
}

void __51__VoiceOverScreenRecognitionController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _isFeatureEnabled]) {
    [WeakRetained _downloadModel];
  }
  else {
    [WeakRetained _purgeModel];
  }
}

- (AXElementVisionModelAssetPolicy)elementVisionModelAssetPolicy
{
  elementVisionModelAssetPolicy = self->_elementVisionModelAssetPolicy;
  if (!elementVisionModelAssetPolicy)
  {
    v4 = +[AXElementVisionModelAssetPolicy policy];
    v5 = self->_elementVisionModelAssetPolicy;
    self->_elementVisionModelAssetPolicy = v4;

    elementVisionModelAssetPolicy = self->_elementVisionModelAssetPolicy;
  }

  return elementVisionModelAssetPolicy;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = AXLocStringKeyForModel();
    uint64_t v8 = settingsLocString(v7, @"VoiceOverSettings");
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    primaryGroupSpecifier = self->_primaryGroupSpecifier;
    self->_primaryGroupSpecifier = (PSSpecifier *)v6;
    id v10 = v6;

    [v5 addObject:v10];
    id v11 = settingsLocString(@"VO_SCREEN_RECOGNITION", @"VoiceOverSettings");
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"_setNeuralVisionEnabled:specifier:" get:"_neuralVisionEnabled:" detail:0 cell:6 edit:0];

    [v5 addObject:v12];
    preferenceToggleSpecifier = self->_preferenceToggleSpecifier;
    self->_preferenceToggleSpecifier = v12;
    v14 = v12;

    v15 = +[PSSpecifier preferenceSpecifierNamed:&stru_20F6B8 target:self set:0 get:0 detail:0 cell:-1 edit:0];

    [v15 setProperty:objc_opt_class() forKey:PSCellClassKey];
    objc_msgSend(v15, "setAx_assetState:", 0);
    [v5 addObject:v15];
    assetStatusSpecifier = self->_assetStatusSpecifier;
    self->_assetStatusSpecifier = (PSSpecifier *)v15;
    id v17 = v15;

    [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDeleteButtonHidden:1];
    [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDownloadButtonHidden:1];
    v18 = +[PSSpecifier emptyGroupSpecifier];

    [v5 addObject:v18];
    v19 = settingsLocString(@"VO_APPLY_TO_APPS", @"VoiceOverSettings");
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:"_appsApplied:" detail:objc_opt_class() cell:2 edit:0];

    [v20 setProperty:@"apps" forKey:PSIDKey];
    [v5 addObject:v20];
    id v21 = [v5 copy];
    v22 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v21;

    v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (void)_setNeuralVisionEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = +[AXSettings sharedInstance];
  objc_msgSend(v6, "setAutomaticAccessibilityEnabled:", objc_msgSend(v5, "integerValue") != 0);

  LODWORD(v6) = [v5 BOOLValue];
  if (v6)
  {
    [(VoiceOverScreenRecognitionController *)self _downloadModel];
    v7 = &__kCFBooleanTrue;
  }
  else
  {
    [(VoiceOverScreenRecognitionController *)self _purgeModel];
    v7 = &__kCFBooleanFalse;
  }

  [(VoiceOverScreenRecognitionController *)self _addSettingToRotor:v7];
}

- (id)_neuralVisionEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 automaticAccessibilityEnabled]);

  return v4;
}

- (void)_addSettingToRotor:(id)a3
{
  id v21 = a3;
  uint64_t v3 = &swift_allocBox_ptr;
  v4 = +[AXSettings sharedInstance];
  id v5 = [v4 voiceOverRotorItems];
  id v20 = [v5 mutableCopy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = +[AXSettings sharedInstance];
  v7 = [v6 voiceOverRotorItems];

  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (!v8)
  {

    uint64_t v10 = 0;
LABEL_13:
    v26[0] = @"RotorItem";
    v26[1] = @"Enabled";
    v27[0] = kAXSVoiceOverTouchRotorMLElementsMode;
    v27[1] = v21;
    v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2, v20);
    [v20 setObject:v18 atIndexedSubscript:v10];

    id v11 = 0;
    goto LABEL_14;
  }
  id v9 = v8;
  uint64_t v10 = 0;
  id v11 = 0;
  uint64_t v12 = *(void *)v23;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "objectForKeyedSubscript:", @"RotorItem", v20);
      unsigned int v16 = [v15 isEqualToString:kAXSVoiceOverTouchRotorMLElementsMode];

      if (v16)
      {
        id v17 = [v14 mutableCopy];

        [v17 setObject:v21 forKeyedSubscript:@"Enabled"];
        [v20 setObject:v17 atIndexedSubscript:(char *)i + v10];
        id v11 = v17;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    v10 += (uint64_t)i;
  }
  while (v9);

  uint64_t v3 = &swift_allocBox_ptr;
  if (!v11) {
    goto LABEL_13;
  }
LABEL_14:
  v19 = [v3[459] sharedInstance];
  [v19 setVoiceOverRotorItems:v20];
}

- (id)_ignoreAppAccessibility:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 automaticAccessibilityIgnoreAppAccessibilityPreferred]);

  return v4;
}

- (void)_setIgnoreAppAccessibility:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAutomaticAccessibilityIgnoreAppAccessibilityPreferred:v4];
}

- (BOOL)_isFeatureEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 automaticAccessibilityEnabled];

  return v3;
}

- (void)_downloadModel
{
  self->_wantsAssetDownloadIfNeeded = 1;
  [(VoiceOverScreenRecognitionController *)self _updatePrimaryGroupFooterTextAndReloadSpecifier:1];
  assetController = self->_assetController;

  [(AXAssetController *)assetController refreshAssetsByForceUpdatingCatalog:0 updatingCatalogIfNeeded:0 catalogRefreshOverrideTimeout:0 completion:0];
}

- (void)_purgeModel
{
  self->_wantsAssetDownloadIfNeeded = 0;
  [(VoiceOverScreenRecognitionController *)self _updatePrimaryGroupFooterTextAndReloadSpecifier:1];
  assetController = self->_assetController;

  [(AXAssetController *)assetController refreshAssetsByForceUpdatingCatalog:0 updatingCatalogIfNeeded:0 catalogRefreshOverrideTimeout:0 completion:0];
}

- (void)_updateAssetStatusCell:(int64_t)a3 error:(id)a4 downloaded:(int64_t)a5 expected:(int64_t)a6
{
  assetStatusSpecifier = self->_assetStatusSpecifier;
  id v11 = a4;
  [(PSSpecifier *)assetStatusSpecifier setAx_assetState:a3];
  uint64_t v12 = [(VoiceOverScreenRecognitionController *)self cachedAsset];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_asset:v12];

  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetError:v11];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDownloadBytesReceived:a5];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDownloadBytesExpected:a6];
  objc_super v13 = self->_assetStatusSpecifier;

  [(VoiceOverScreenRecognitionController *)self reloadSpecifier:v13];
}

- (id)_validateAssetFromResults:(id)a3
{
  return [a3 firstObject];
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v9 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __102__VoiceOverScreenRecognitionController_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
  v12[3] = &unk_20ACA8;
  BOOL v15 = a5;
  v12[4] = self;
  id v13 = a6;
  id v14 = v9;
  id v10 = v9;
  id v11 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

void __102__VoiceOverScreenRecognitionController_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  unsigned __int8 v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    uint64_t v10 = *(void *)(a1 + 40);
LABEL_9:
    [v3 _updateAssetStatusCell:5 error:v10 downloaded:0 expected:0];
    return;
  }
  id v4 = [v3 _validateAssetFromResults:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setCachedAsset:v4];

  id v5 = [*(id *)(a1 + 32) cachedAsset];

  unsigned __int8 v3 = *(void **)(a1 + 32);
  if (!v5)
  {
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  v6 = [v3 cachedAsset];
  if ([v6 isInstalled])
  {
    unsigned int v7 = [*(id *)(a1 + 32) _isFeatureEnabled];

    if (v7)
    {
      [*(id *)(a1 + 32) _updateAssetStatusCell:4 error:0 downloaded:0 expected:0];
      id v8 = AXLogAssetLoader();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [*(id *)(a1 + 32) cachedAsset];
        *(_DWORD *)buf = 138412290;
        long long v23 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Image caption model is installed: %@", buf, 0xCu);
      }
LABEL_18:

      return;
    }
  }
  else
  {
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v11 + 200))
  {
    unsigned int v12 = [(id)v11 _isFeatureEnabled];
    uint64_t v11 = *(void *)(a1 + 32);
    if (v12)
    {
      *(unsigned char *)(v11 + 200) = 0;
      [*(id *)(a1 + 32) _updateAssetStatusCell:2 error:0 downloaded:0 expected:0];
      id v13 = AXLogAssetLoader();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Image caption model requested. Beginning download", buf, 2u);
      }

      id v14 = *(void **)(a1 + 32);
      BOOL v15 = (void *)v14[29];
      id v8 = [v14 cachedAsset];
      id v21 = v8;
      unsigned int v16 = +[NSArray arrayWithObjects:&v21 count:1];
      [v15 downloadAssets:v16 successStartBlock:&__block_literal_global_37];

      goto LABEL_18;
    }
  }
  id v17 = *(void **)(v11 + 232);
  v18 = [(id)v11 cachedAsset];
  id v20 = v18;
  v19 = +[NSArray arrayWithObjects:&v20 count:1];
  [v17 purgeAssets:v19 completion:0];

  [*(id *)(a1 + 32) _updateAssetStatusCell:1 error:0 downloaded:0 expected:0];
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __137__VoiceOverScreenRecognitionController_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke;
  v8[3] = &unk_20ACD0;
  BOOL v9 = a7;
  v8[4] = self;
  v8[5] = a5;
  v8[6] = a6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

id __137__VoiceOverScreenRecognitionController_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v1 = 3;
  }
  else {
    uint64_t v1 = 2;
  }
  return [*(id *)(a1 + 32) _updateAssetStatusCell:v1 error:0 downloaded:*(void *)(a1 + 40) expected:*(void *)(a1 + 48)];
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __124__VoiceOverScreenRecognitionController_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke;
  block[3] = &unk_2094C8;
  BOOL v10 = a5;
  block[4] = self;
  id v9 = a6;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __124__VoiceOverScreenRecognitionController_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  unsigned __int8 v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = 4;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = 5;
  }
  return [v3 _updateAssetStatusCell:v4 error:v5 downloaded:0 expected:0];
}

- (id)_appsApplied:(id)a3
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 automaticAccessibilityModes];

  uint64_t v5 = [v4 allKeys];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  BOOL v15 = __53__VoiceOverScreenRecognitionController__appsApplied___block_invoke;
  unsigned int v16 = &unk_20ADB8;
  id v6 = v4;
  id v17 = v6;
  id v7 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &v13);

  if ((unint64_t)[v7 count] < 3)
  {
    id v8 = objc_msgSend(v7, "ax_mappedArrayUsingBlock:", &__block_literal_global_319);
    uint64_t v11 = [v8 sortedArrayUsingComparator:&__block_literal_global_322_0];
    BOOL v10 = [v11 componentsJoinedByString:@", "];
  }
  else
  {
    id v8 = settingsLocString(@"APPLIES_TO_APP_COUNT", @"VoiceOverSettings");
    id v9 = [v7 count];
    BOOL v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v9, v13, v14, v15, v16);
  }

  return v10;
}

BOOL __53__VoiceOverScreenRecognitionController__appsApplied___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXAppNameForBundleId();
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    BOOL v6 = [v5 intValue] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

NSString *__cdecl __53__VoiceOverScreenRecognitionController__appsApplied___block_invoke_2(id a1, NSString *a2)
{
  return (NSString *)AXAppNameForBundleId();
}

int64_t __53__VoiceOverScreenRecognitionController__appsApplied___block_invoke_3(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 localizedCompare:a3];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverScreenRecognitionController;
  uint64_t v4 = [(VoiceOverScreenRecognitionController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cellForRowAtIndexPath:v7];
  id v9 = [v8 specifier];
  BOOL v10 = [v9 propertyForKey:PSIDKey];
  unsigned int v11 = [v10 isEqualToString:@"apps"];

  if (v11)
  {
    unsigned int v12 = objc_alloc_init(AXAppSelectionController);
    id v13 = [(VoiceOverScreenRecognitionController *)self rootController];
    [(AXAppSelectionController *)v12 setRootController:v13];

    [(AXAppSelectionController *)v12 setSpecifier:v9];
    [(AXAppSelectionController *)v12 setParentController:self];
    [(AXAppSelectionController *)v12 setIncludesHomeScreen:0];
    objc_initWeak(&location, self);
    [(AXAppSelectionController *)v12 setGetSelectedApps:&__block_literal_global_330];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __74__VoiceOverScreenRecognitionController_tableView_didSelectRowAtIndexPath___block_invoke_3;
    v15[3] = &unk_209698;
    objc_copyWeak(&v16, &location);
    [(AXAppSelectionController *)v12 setSetSelectedApps:v15];
    [(VoiceOverScreenRecognitionController *)self showController:v12 animate:1];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VoiceOverScreenRecognitionController;
    [(VoiceOverScreenRecognitionController *)&v14 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

NSSet *__cdecl __74__VoiceOverScreenRecognitionController_tableView_didSelectRowAtIndexPath___block_invoke(id a1)
{
  uint64_t v1 = +[AXSettings sharedInstance];
  int v2 = [v1 automaticAccessibilityModes];

  id v3 = [v2 allKeys];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __74__VoiceOverScreenRecognitionController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v8[3] = &unk_20ADB8;
  id v9 = v2;
  id v4 = v2;
  uint64_t v5 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", v8);
  id v6 = +[NSSet setWithArray:v5];

  return (NSSet *)v6;
}

id __74__VoiceOverScreenRecognitionController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v3 = [v2 BOOLValue];

  return v3;
}

void __74__VoiceOverScreenRecognitionController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      BOOL v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
        BOOL v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  unsigned int v11 = +[AXSettings sharedInstance];
  [v11 setAutomaticAccessibilityModes:v5];

  [WeakRetained reloadSpecifierID:@"apps"];
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (void)setElementVisionModelAssetPolicy:(id)a3
{
}

- (AXAsset)cachedAsset
{
  return self->_cachedAsset;
}

- (void)setCachedAsset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAsset, 0);
  objc_storeStrong((id *)&self->_elementVisionModelAssetPolicy, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_assetStatusSpecifier, 0);
  objc_storeStrong((id *)&self->_preferenceToggleSpecifier, 0);

  objc_storeStrong((id *)&self->_primaryGroupSpecifier, 0);
}

@end