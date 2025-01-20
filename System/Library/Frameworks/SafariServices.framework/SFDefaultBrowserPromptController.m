@interface SFDefaultBrowserPromptController
+ (SFDefaultBrowserPromptController)sharedController;
+ (id)_directoryURLWithKey:(id)a3;
+ (id)_fileURLWithKey:(id)a3;
- (BOOL)_didStorePlistWithDictionary:(id)a3 fileNameKey:(id)a4 shouldExcludeFromBackup:(BOOL)a5;
- (BOOL)_hasPerformedPromptCheck;
- (BOOL)didCompleteBrowserSheet;
- (BOOL)hasShownBrowserChoiceScreenOnOtherDevices;
- (BOOL)shouldPerformPromptCheck;
- (SFDefaultBrowserPromptController)init;
- (id)browserIconReplacementAlertController:(id)a3 completionHandler:(id)a4;
- (id)platformStyleViewForAlertController:(id)a3 inIdiom:(int64_t)a4;
- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5;
- (void)_connectToService;
- (void)determineIfBrowserIconSwapAlertNeedsDisplayWithCompletionHandler:(id)a3;
- (void)determineIfBrowserSheetNeedsDisplayWithCompletionHandler:(id)a3;
- (void)serviceProxyWillQueueInvocation:(id)a3;
@end

@implementation SFDefaultBrowserPromptController

+ (SFDefaultBrowserPromptController)sharedController
{
  if (sharedController_onceToken_1 != -1) {
    dispatch_once(&sharedController_onceToken_1, &__block_literal_global_67);
  }
  v2 = (void *)sharedController_sharedController_1;

  return (SFDefaultBrowserPromptController *)v2;
}

void __52__SFDefaultBrowserPromptController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(SFDefaultBrowserPromptController);
  v1 = (void *)sharedController_sharedController_1;
  sharedController_sharedController_1 = (uint64_t)v0;
}

- (SFDefaultBrowserPromptController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDefaultBrowserPromptController;
  v2 = [(SFDefaultBrowserPromptController *)&v7 init];
  if (v2)
  {
    v3 = [[SFQueueingServiceViewControllerProxy alloc] initWithProtocol:&unk_1EFC80498];
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = (SFDefaultBrowserPromptServiceProtocol *)v3;

    [(SFDefaultBrowserPromptServiceProtocol *)v2->_serviceProxy setDelegate:v2];
    v5 = v2;
  }

  return v2;
}

- (BOOL)hasShownBrowserChoiceScreenOnOtherDevices
{
  v2 = +[SFDefaultBrowserPromptController _fileURLWithKey:@"DefaultBrowserShownOnOtherDevices"];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2];
  char v4 = objc_msgSend(v3, "safari_BOOLForKey:", @"DefaultBrowserShownOnOtherDevices");

  return v4;
}

- (BOOL)shouldPerformPromptCheck
{
  if (+[_SFFeatureAvailability isBrowserSelectionSheetEligible])
  {
    v3 = [MEMORY[0x1E4F74230] sharedConnection];
    char v4 = [MEMORY[0x1E4F74230] sharedConnection];
    int v5 = [v4 isOnDeviceAppInstallationAllowed];

    if (v5
      && ((objc_opt_respondsToSelector() & 1) == 0 || [v3 isDefaultBrowserPromptingAllowed]))
    {
      BOOL v6 = ![(SFDefaultBrowserPromptController *)self _hasPerformedPromptCheck];
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)determineIfBrowserIconSwapAlertNeedsDisplayWithCompletionHandler:(id)a3
{
}

- (void)determineIfBrowserSheetNeedsDisplayWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serviceProxy = self->_serviceProxy;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__SFDefaultBrowserPromptController_determineIfBrowserSheetNeedsDisplayWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C726C8;
  id v8 = v4;
  id v6 = v4;
  [(SFDefaultBrowserPromptServiceProtocol *)serviceProxy determineIfBrowserSheetNeedsDisplayWithCompletionHandler:v7];
}

uint64_t __93__SFDefaultBrowserPromptController_determineIfBrowserSheetNeedsDisplayWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)didCompleteBrowserSheet
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"DefaultBrowserPromptVersion";
  v10[0] = &unk_1EFBDF0B8;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  BOOL v4 = [(SFDefaultBrowserPromptController *)self _didStorePlistWithDictionary:v3 fileNameKey:@"DefaultBrowserPromptVersion" shouldExcludeFromBackup:1];

  objc_super v7 = @"DefaultBrowserShownOnOtherDevices";
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  LOBYTE(self) = [(SFDefaultBrowserPromptController *)self _didStorePlistWithDictionary:v5 fileNameKey:@"DefaultBrowserShownOnOtherDevices" shouldExcludeFromBackup:0];

  return v4 & self;
}

- (id)browserIconReplacementAlertController:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bundleIdentifier];
  uint64_t v9 = *MEMORY[0x1E4F997F8];
  if ([v8 isEqualToString:*MEMORY[0x1E4F997F8]])
  {
    v10 = 0;
  }
  else
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    v11 = (void *)getSBSHomeScreenServiceClass_softClass;
    uint64_t v38 = getSBSHomeScreenServiceClass_softClass;
    if (!getSBSHomeScreenServiceClass_softClass)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __getSBSHomeScreenServiceClass_block_invoke;
      v34[3] = &unk_1E5C723B0;
      v34[4] = &v35;
      __getSBSHomeScreenServiceClass_block_invoke((uint64_t)v34);
      v11 = (void *)v36[3];
    }
    v12 = v11;
    _Block_object_dispose(&v35, 8);
    id v13 = objc_alloc_init(v12);
    if ([v13 canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:v9 withApplicationIconsWithWithBundleIdentifier:v8])
    {
      uint64_t v14 = _WBSLocalizedString();
      _SFDeviceIsPad();
      v15 = NSString;
      v16 = _WBSLocalizedString();
      v17 = [v6 localizedName];
      v26 = objc_msgSend(v15, "stringWithFormat:", v16, v17);

      v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:v26 preferredStyle:1];
      [v10 _setStyleProvider:self];
      v18 = (void *)MEMORY[0x1E4FB1410];
      _WBSLocalizedString();
      v19 = v27 = (void *)v14;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __92__SFDefaultBrowserPromptController_browserIconReplacementAlertController_completionHandler___block_invoke;
      v30[3] = &unk_1E5C75370;
      id v31 = v13;
      id v32 = v8;
      id v20 = v7;
      id v33 = v20;
      v21 = [v18 actionWithTitle:v19 style:0 handler:v30];

      v22 = (void *)MEMORY[0x1E4FB1410];
      v23 = _WBSLocalizedString();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __92__SFDefaultBrowserPromptController_browserIconReplacementAlertController_completionHandler___block_invoke_2;
      v28[3] = &unk_1E5C74688;
      id v29 = v20;
      v24 = [v22 actionWithTitle:v23 style:1 handler:v28];

      [v10 addAction:v21];
      [v10 addAction:v24];
      [v10 setPreferredAction:v21];
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

uint64_t __92__SFDefaultBrowserPromptController_browserIconReplacementAlertController_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) swapApplicationIconsInProminentPositionsWithBundleIdentifier:*MEMORY[0x1E4F997F8] withApplicationIconsWithWithBundleIdentifier:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __92__SFDefaultBrowserPromptController_browserIconReplacementAlertController_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_directoryURLWithKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = objc_msgSend(v4, "safari_mobileSafariGroupContainerDirectoryURL");
  id v6 = [v5 URLByAppendingPathComponent:@"Library" isDirectory:1];

  id v7 = [v6 URLByAppendingPathComponent:@"DefaultBrowserSelection" isDirectory:1];
  if ([v3 isEqualToString:@"DefaultBrowserPromptVersion"])
  {
    uint64_t v8 = @"ExcludedFromBackup";
LABEL_5:
    id v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:1];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"DefaultBrowserShownOnOtherDevices"])
  {
    uint64_t v8 = @"RestoredFromBackup";
    goto LABEL_5;
  }
  id v9 = v7;
LABEL_7:
  v10 = v9;

  return v10;
}

+ (id)_fileURLWithKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[SFDefaultBrowserPromptController _directoryURLWithKey:v3];
  int v5 = [NSString stringWithFormat:@"%@.plist", v3];

  id v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:0];

  return v6;
}

- (void)_connectToService
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelViewServiceRequest invoke];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SFDefaultBrowserPromptController__connectToService__block_invoke;
  v6[3] = &unk_1E5C751F0;
  v6[4] = self;
  BOOL v4 = +[SFDefaultBrowserPromptRemoteViewController requestViewControllerWithConnectionHandler:v6];
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;
}

void __53__SFDefaultBrowserPromptController__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    v10 = [v6 serviceViewControllerProxy];
    [*(id *)(*(void *)(a1 + 32) + 24) setTarget:v10];
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __53__SFDefaultBrowserPromptController__connectToService__block_invoke_cold_1((uint64_t)v7, v11);
    }
  }
}

- (BOOL)_hasPerformedPromptCheck
{
  v2 = +[SFDefaultBrowserPromptController _fileURLWithKey:@"DefaultBrowserPromptVersion"];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2];
  BOOL v4 = objc_msgSend(v3, "safari_numberForKey:", @"DefaultBrowserPromptVersion");
  BOOL v5 = [v4 integerValue] != 0;

  return v5;
}

- (BOOL)_didStorePlistWithDictionary:(id)a3 fileNameKey:(id)a4 shouldExcludeFromBackup:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = +[SFDefaultBrowserPromptController _directoryURLWithKey:v8];
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = 0;
  char v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v12 = v22;

  if (v11)
  {
    id v13 = +[SFDefaultBrowserPromptController _fileURLWithKey:v8];
    int v14 = [v7 writeToURL:v13 atomically:0];
    if (v14 && v5)
    {
      uint64_t v15 = *MEMORY[0x1E4F1C630];
      id v21 = v12;
      char v16 = [v9 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v15 error:&v21];
      id v17 = v21;

      if (v16)
      {
        LOBYTE(v14) = 1;
      }
      else
      {
        v19 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SFDefaultBrowserPromptController _didStorePlistWithDictionary:fileNameKey:shouldExcludeFromBackup:]((uint64_t)v8, v19, v17);
        }
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      id v17 = v12;
    }

    id v12 = v17;
  }
  else
  {
    v18 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SFDefaultBrowserPromptController _didStorePlistWithDictionary:fileNameKey:shouldExcludeFromBackup:](v18, v12);
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  if (!self->_cancelViewServiceRequest) {
    [(SFDefaultBrowserPromptController *)self _connectToService];
  }
}

- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 1)
  {
    visualStyle = self->_visualStyle;
    if (!visualStyle)
    {
      char v11 = objc_alloc_init(SFDefaultBrowserAlertControllerVisualStyle);
      id v12 = self->_visualStyle;
      self->_visualStyle = v11;

      visualStyle = self->_visualStyle;
    }
    id v13 = visualStyle;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)platformStyleViewForAlertController:(id)a3 inIdiom:(int64_t)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
}

void __53__SFDefaultBrowserPromptController__connectToService__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Failed to get prompt remote view controller with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_didStorePlistWithDictionary:(uint64_t)a1 fileNameKey:(void *)a2 shouldExcludeFromBackup:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a2;
  id v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "Failed to set NSURLIsExcludedFromBackupKey on %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_didStorePlistWithDictionary:(void *)a1 fileNameKey:(void *)a2 shouldExcludeFromBackup:.cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end