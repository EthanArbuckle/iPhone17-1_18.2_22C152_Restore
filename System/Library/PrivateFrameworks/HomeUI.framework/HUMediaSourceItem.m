@interface HUMediaSourceItem
+ (id)_musicAppUninstallResolveError;
+ (id)_musicCatalogPlaybackDisabledResolveErrorFor:(unint64_t)a3;
+ (id)_storeKitErrorResolveErrorFor:(id)a3;
+ (id)appleMusicSource;
+ (id)soundScapesSource;
- (BOOL)continuousPicker;
- (BOOL)failed;
- (BOOL)success;
- (HUMediaPickerDelegate)delegate;
- (HUMediaSourceItem)initWithBundleIdentifier:(id)a3 forServiceName:(id)a4;
- (NAFuture)iconFuture;
- (NAFuture)resolveFuture;
- (NSDictionary)resolveError;
- (NSSet)mediaProfileContainers;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)name;
- (UIImage)iconImage;
- (id)_appIconFuture;
- (id)_setupAppleMusicPicker;
- (id)_setupSoundScapesPicker;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)_updateAppleMusicSubscriptionStatusForMediaProfiles:(id)a3 forTarget:(unint64_t)a4;
- (id)pickerViewController;
- (id)resolveForMediaProfiles:(id)a3 forTarget:(unint64_t)a4;
- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3;
- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4;
- (void)mediaPickerCancelled;
- (void)mediaPickerDidCancel:(id)a3;
- (void)mediaPickerDidSelectPlaybackArchive:(id)a3 withError:(id)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setContinuousPicker:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setName:(id)a3;
- (void)setResolveError:(id)a3;
@end

@implementation HUMediaSourceItem

+ (id)appleMusicSource
{
  v2 = [[HUMediaSourceItem alloc] initWithBundleIdentifier:@"com.apple.Music" forServiceName:@"HFAppleMusicServiceName"];
  [(HUMediaSourceItem *)v2 setContinuousPicker:0];

  return v2;
}

+ (id)soundScapesSource
{
  v2 = [[HUMediaSourceItem alloc] initWithBundleIdentifier:@"com.apple.SoundScapes" forServiceName:@"HFSoundScapesServiceName"];
  [(HUMediaSourceItem *)v2 setContinuousPicker:1];

  return v2;
}

- (HUMediaSourceItem)initWithBundleIdentifier:(id)a3 forServiceName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUMediaSourceItem;
  v9 = [(HUMediaSourceItem *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    uint64_t v11 = HFLocalizedString();
    name = v10->_name;
    v10->_name = (NSString *)v11;

    uint64_t v13 = [(HUMediaSourceItem *)v10 _appIconFuture];
    iconFuture = v10->_iconFuture;
    v10->_iconFuture = (NAFuture *)v13;

    objc_initWeak(&location, v10);
    v15 = [(HUMediaSourceItem *)v10 iconFuture];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__HUMediaSourceItem_initWithBundleIdentifier_forServiceName___block_invoke;
    v18[3] = &unk_1E63915B8;
    objc_copyWeak(&v19, &location);
    id v16 = (id)[v15 addCompletionBlock:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __61__HUMediaSourceItem_initWithBundleIdentifier_forServiceName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained updateWithOptions:MEMORY[0x1E4F1CC08]];
}

- (id)_appIconFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__HUMediaSourceItem__appIconFuture__block_invoke;
  v6[3] = &unk_1E6385108;
  v6[4] = self;
  v3 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  v4 = [v2 futureWithBlock:v6 scheduler:v3];

  return v4;
}

void __35__HUMediaSourceItem__appIconFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F223B8];
  v5 = [*(id *)(a1 + 32) bundleIdentifier];
  v6 = [v4 applicationProxyForIdentifier:v5];

  if ([v6 isInstalled])
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F6F248]) initWithResourceProxy:v6];
LABEL_6:
    uint64_t v11 = (void *)v7;
    goto LABEL_7;
  }
  id v8 = [*(id *)(a1 + 32) bundleIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.SoundScapes"];

  if (!v9)
  {
    uint64_t v7 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
    goto LABEL_6;
  }
  v10 = [MEMORY[0x1E4F223F0] bundleProxyForIdentifier:@"com.apple.SoundScapesUtility.ViewServices"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithResourceProxy:v10];

LABEL_7:
  v12 = [MEMORY[0x1E4F42D90] mainScreen];
  [v12 scale];
  double v14 = v13;

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 32.0, 32.0, v14);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __35__HUMediaSourceItem__appIconFuture__block_invoke_2;
  v17[3] = &unk_1E638B240;
  double v19 = v14;
  id v18 = v3;
  id v16 = v3;
  [v11 getImageForImageDescriptor:v15 completion:v17];
}

void __35__HUMediaSourceItem__appIconFuture__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:scale:orientation:", objc_msgSend(a2, "CGImage"), 0, *(double *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) finishWithResult:v3];
}

- (id)resolveForMediaProfiles:(id)a3 forTarget:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_storeStrong((id *)&self->_mediaProfileContainers, a3);
  id v8 = [(HUMediaSourceItem *)self bundleIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.Music"];

  if (v9)
  {
    v10 = [(HUMediaSourceItem *)self _updateAppleMusicSubscriptionStatusForMediaProfiles:v7 forTarget:a4];
    resolveFuture = self->_resolveFuture;
    self->_resolveFuture = v10;
  }
  else
  {
    v12 = [(HUMediaSourceItem *)self bundleIdentifier];
    int v13 = [v12 isEqualToString:@"com.apple.SoundScapes"];

    if (v13)
    {
      double v14 = (void *)MEMORY[0x1E4F7A0D8];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke;
      v35[3] = &unk_1E638A2F8;
      id v36 = v7;
      unint64_t v37 = a4;
      v15 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
      id v16 = [v14 futureWithBlock:v35 scheduler:v15];
      v17 = self->_resolveFuture;
      self->_resolveFuture = v16;
    }
  }
  objc_initWeak(&location, self);
  id v18 = [(HUMediaSourceItem *)self bundleIdentifier];
  double v19 = self->_resolveFuture;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke_54;
  v31[3] = &unk_1E63915E0;
  id v20 = v18;
  id v32 = v20;
  objc_copyWeak(&v33, &location);
  id v21 = (id)[(NAFuture *)v19 addCompletionBlock:v31];
  v22 = objc_opt_new();
  v23 = [(HUMediaSourceItem *)self resolveFuture];

  if (v23)
  {
    v24 = [(HUMediaSourceItem *)self resolveFuture];
    [v22 addObject:v24];
  }
  else
  {
    v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [(HUMediaSourceItem *)self bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      v39 = v25;
      _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "Media Source %@ is not being resolved", buf, 0xCu);
    }
  }

  v26 = [(HUMediaSourceItem *)self iconFuture];

  if (v26)
  {
    v27 = [(HUMediaSourceItem *)self iconFuture];
    [v22 addObject:v27];
  }
  else
  {
    v27 = HFLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [(HUMediaSourceItem *)self bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      v39 = v28;
      _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "Icon for media Source %@ is not being fetched", buf, 0xCu);
    }
  }

  v29 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v22];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v29;
}

void __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) anyObject];
  v5 = objc_msgSend(v4, "hf_home");

  if (*(void *)(a1 + 40) == 1)
  {
    v6 = [*(id *)(a1 + 32) anyObject];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
    if (v9)
    {
      v10 = [v9 accessory];
      int v11 = objc_msgSend(v10, "hf_isHomePod");

      v12 = [v9 accessory];
      char v13 = objc_msgSend(v12, "hf_isSiriEndpoint");

      if (v11)
      {
LABEL_9:
        double v14 = [v7 accessories];
        char v15 = objc_msgSend(v14, "na_all:", &__block_literal_global_264);
        goto LABEL_10;
      }
      if (v13)
      {
        double v14 = [v5 residentDevices];
        char v15 = objc_msgSend(v14, "na_any:", &__block_literal_global_46_1);
LABEL_10:
        char v16 = v15;

        if ((v16 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_13;
      }
    }
    else
    {
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Unexpected media profile container", buf, 2u);
      }
    }
    id v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Unexpected media profile configuration", v23, 2u);
    }

    goto LABEL_22;
  }
  if (([getSSUSoundScapesPickerManagerClass() pickerSupportHome:v5 targetMediaProfileContainers:*(void *)(a1 + 32)] & 1) == 0)
  {
LABEL_22:
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v20 = HFLocalizedString();
    [v19 setObject:v20 forKeyedSubscript:@"HUMediaPickerUnavailablePromptTitleKey"];

    id v21 = HFLocalizedString();
    [v19 setObject:v21 forKeyedSubscript:@"HUMediaPickerUnavailablePromptMessageKey"];

    v22 = (void *)[v19 copy];
    [v3 finishWithResult:v22];

    goto LABEL_23;
  }
LABEL_13:
  [v3 finishWithResult:MEMORY[0x1E4F1CC08]];
LABEL_23:
}

unint64_t __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke_42(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_linkedResidentDevice");
  unint64_t v3 = ((unint64_t)[v2 capabilities] >> 24) & 1;

  return v3;
}

unint64_t __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 24) & 1;
}

void __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v14 = 138412802;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Media Source %@ resolve result %@, with error %@", (uint8_t *)&v14, 0x20u);
  }

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v13 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setResolveError:v11];
  }
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v4 = [(HUMediaSourceItem *)self name];
  id v5 = [(HUMediaSourceItem *)self bundleIdentifier];
  id v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return (NSString *)v6;
}

- (id)pickerViewController
{
  if (![(HUMediaSourceItem *)self success]) {
    goto LABEL_6;
  }
  unint64_t v3 = [(HUMediaSourceItem *)self bundleIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.Music"];

  if (v4)
  {
    id v5 = [(HUMediaSourceItem *)self _setupAppleMusicPicker];
    goto LABEL_7;
  }
  id v6 = [(HUMediaSourceItem *)self bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.SoundScapes"];

  if (v7)
  {
    id v5 = [(HUMediaSourceItem *)self _setupSoundScapesPicker];
  }
  else
  {
LABEL_6:
    id v5 = 0;
  }
LABEL_7:

  return v5;
}

- (id)_setupAppleMusicPicker
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  unint64_t v3 = (void *)qword_1EBA472E0;
  uint64_t v22 = qword_1EBA472E0;
  if (!qword_1EBA472E0)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    __int16 v16 = __getMPMediaPickerControllerClass_block_invoke_1;
    id v17 = &unk_1E63852F0;
    __int16 v18 = &v19;
    __getMPMediaPickerControllerClass_block_invoke_1((uint64_t)&v14);
    unint64_t v3 = (void *)v20[3];
  }
  int v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = (void *)[[v4 alloc] initWithSupportedTypeIdentifiers:&unk_1F19B5A50 selectionMode:4];
  [v5 setShowsCloudItems:1];
  [v5 setShowsItemsWithProtectedAssets:1];
  [v5 setShowsCatalogContent:1];
  [v5 setShowsLibraryContent:1];
  id v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  double v8 = v7;

  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v9 = (void *)qword_1EBA472E8;
  uint64_t v22 = qword_1EBA472E8;
  if (!qword_1EBA472E8)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    __int16 v16 = __getMPPlaybackArchiveConfigurationClass_block_invoke_1;
    id v17 = &unk_1E63852F0;
    __int16 v18 = &v19;
    __getMPPlaybackArchiveConfigurationClass_block_invoke_1((uint64_t)&v14);
    id v9 = (void *)v20[3];
  }
  if (v8 <= 4.0) {
    double v10 = 256.0;
  }
  else {
    double v10 = v8 * 64.0;
  }
  id v11 = v9;
  _Block_object_dispose(&v19, 8);
  v12 = objc_msgSend([v11 alloc], "initWithPreferredArtworkSize:", v10, v10);
  [v5 setPlaybackArchiveConfiguration:v12];

  [v5 setDelegate:self];

  return v5;
}

- (id)_setupSoundScapesPicker
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id SSUSoundScapesPickerManagerClass = getSSUSoundScapesPickerManagerClass();
  int v4 = [(HUMediaSourceItem *)self mediaProfileContainers];
  id v5 = [SSUSoundScapesPickerManagerClass pickerForMediaProfileContainers:v4 forDelegate:self];

  if (!v5)
  {
    v10[0] = @"HUMediaPickerUnavailablePromptTitleKey";
    id v6 = _HULocalizedStringWithDefaultValue(@"HUAlertError", @"HUAlertError", 1);
    v10[1] = @"HUMediaPickerUnavailablePromptMessageKey";
    v11[0] = v6;
    double v7 = HFLocalizedString();
    v11[1] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    [(HUMediaSourceItem *)self setResolveError:v8];
  }

  return v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HUMediaSourceItem *)self iconFuture];
  id v6 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  double v7 = [v5 reschedule:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __49__HUMediaSourceItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1E6391608;
  objc_copyWeak(&v11, &location);
  double v8 = [v7 flatMap:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);

  return v8;
}

id __49__HUMediaSourceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained resolveError];
    double v7 = [v6 objectForKeyedSubscript:@"HUMediaPickerUnavailablePromptTitleKey"];

    double v8 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v15 = *MEMORY[0x1E4F68AB8];
    id v9 = [v5 name];
    v16[0] = v9;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v11 = [v8 dictionaryWithDictionary:v10];

    objc_msgSend(v11, "na_safeSetObject:forKey:", v3, *MEMORY[0x1E4F689F8]);
    objc_msgSend(v11, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F68980]);
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F692F0]) initWithResults:v11];
    char v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:v12];
  }
  else
  {
    char v13 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v13;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  id v3 = [(HUMediaSourceItem *)self resolveFuture];
  unint64_t v4 = [v3 isFinished] ^ 1;

  return v4;
}

- (BOOL)success
{
  id v3 = [(HUMediaSourceItem *)self resolveFuture];
  if ([v3 isFinished])
  {
    unint64_t v4 = [(HUMediaSourceItem *)self resolveError];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)failed
{
  id v3 = [(HUMediaSourceItem *)self resolveFuture];
  if ([v3 isFinished])
  {
    unint64_t v4 = [(HUMediaSourceItem *)self resolveError];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)_musicAppUninstallResolveError
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"HUMediaPickerUnavailablePromptTitleKey";
  v2 = _HULocalizedStringWithDefaultValue(@"HUMediaPickerUnavailableMusicAppUninstalledPromptTitle", @"HUMediaPickerUnavailableMusicAppUninstalledPromptTitle", 1);
  v9[0] = v2;
  v8[1] = @"HUMediaPickerUnavailablePromptActionTitleKey";
  id v3 = _HULocalizedStringWithDefaultValue(@"HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton", @"HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton", 1);
  v9[1] = v3;
  v8[2] = @"HUMediaPickerUnavailablePromptActionURLKey";
  unint64_t v4 = +[HUMediaAccountUtilities musicAppURL];
  v9[2] = v4;
  v8[3] = @"HUMediaPickerUnavailablePromptMessageKey";
  BOOL v5 = _HULocalizedStringWithDefaultValue(@"HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage", @"HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage", 1);
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)_musicCatalogPlaybackDisabledResolveErrorFor:(unint64_t)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    id v3 = @"HUMusicAlarmMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage";
    unint64_t v4 = @"HUMusicAlarmMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage";
    goto LABEL_5;
  }
  if (!a3)
  {
    id v3 = @"HUSceneMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage";
    unint64_t v4 = @"HUSceneMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage";
    LODWORD(a3) = 1;
LABEL_5:
    BOOL v5 = _HULocalizedStringWithDefaultValue(v3, v4, a3);
    goto LABEL_7;
  }
  BOOL v5 = 0;
LABEL_7:
  v11[0] = @"HUMediaPickerUnavailablePromptTitleKey";
  id v6 = _HULocalizedStringWithDefaultValue(@"HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptTitle", @"HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptTitle", 1);
  v12[0] = v6;
  v12[1] = v5;
  v11[1] = @"HUMediaPickerUnavailablePromptMessageKey";
  v11[2] = @"HUMediaPickerUnavailablePromptActionTitleKey";
  double v7 = _HULocalizedStringWithDefaultValue(@"HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptGetAppleMusicButton", @"HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptGetAppleMusicButton", 1);
  v12[2] = v7;
  void v11[3] = @"HUMediaPickerUnavailablePromptActionURLKey";
  double v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"music://subscribe"];
  v12[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

+ (id)_storeKitErrorResolveErrorFor:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = +[HUMediaAccountUtilities reasonForMediaPickerNotAvailable:2];
  if (v4)
  {
    BOOL v5 = v4;
    id v6 = _HULocalizedStringWithDefaultValue(v4, v4, 1);
  }
  else
  {
    id v6 = [v3 localizedDescription];
  }
  v10[0] = @"HUMediaPickerUnavailablePromptTitleKey";
  double v7 = _HULocalizedStringWithDefaultValue(@"HUAlertError", @"HUAlertError", 1);
  v10[1] = @"HUMediaPickerUnavailablePromptMessageKey";
  v11[0] = v7;
  v11[1] = v6;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (id)_updateAppleMusicSubscriptionStatusForMediaProfiles:(id)a3 forTarget:(unint64_t)a4
{
  void v18[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (+[HUMediaAccountUtilities isMusicAppInstalled])
  {
    id v6 = [v5 anyObject];
    double v7 = objc_msgSend(v6, "hf_home");
    double v8 = +[HUMediaAccountUtilities determineMediaPickerAvailabilityForHomePodProfiles:v5 inHome:v7];

    id v9 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
    double v10 = [v8 reschedule:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __83__HUMediaSourceItem__updateAppleMusicSubscriptionStatusForMediaProfiles_forTarget___block_invoke;
    v16[3] = &__block_descriptor_40_e32___NAFuture_16__0__NSDictionary_8l;
    v16[4] = a4;
    id v11 = [v10 flatMap:v16];
  }
  else
  {
    v17[0] = @"HUMediaPickerUnavailablePromptTitleKey";
    v12 = _HULocalizedStringWithDefaultValue(@"HUMediaPickerUnavailableMusicAppUninstalledPromptTitle", @"HUMediaPickerUnavailableMusicAppUninstalledPromptTitle", 1);
    v18[0] = v12;
    v18[1] = @"HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton";
    v17[1] = @"HUMediaPickerUnavailablePromptActionTitleKey";
    v17[2] = @"HUMediaPickerUnavailablePromptActionURLKey";
    char v13 = +[HUMediaAccountUtilities musicAppURL];
    v18[2] = v13;
    v17[3] = @"HUMediaPickerUnavailablePromptMessageKey";
    uint64_t v14 = _HULocalizedStringWithDefaultValue(@"HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage", @"HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage", 1);
    v18[3] = v14;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

    id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];
  }

  return v11;
}

id __83__HUMediaSourceItem__updateAppleMusicSubscriptionStatusForMediaProfiles_forTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  unint64_t v4 = [v3 objectForKeyedSubscript:@"HOMediaPickerUnavailableReasonKey"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  double v7 = [v3 objectForKeyedSubscript:@"HUMediaPickerUnavailableReasonStoreKitErrorObjectKey"];

  if (objc_opt_isKindOfClass()) {
    double v8 = v7;
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;

  if (!v6)
  {
    v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    goto LABEL_18;
  }
  uint64_t v10 = [v6 integerValue];
  if (v10 == 2)
  {
    uint64_t v11 = +[HUMediaSourceItem _storeKitErrorResolveErrorFor:v9];
  }
  else if (v10 == 1)
  {
    uint64_t v11 = +[HUMediaSourceItem _musicCatalogPlaybackDisabledResolveErrorFor:*(void *)(a1 + 32)];
  }
  else
  {
    if (v10)
    {
      char v13 = 0;
      goto LABEL_17;
    }
    uint64_t v11 = +[HUMediaSourceItem _musicAppUninstallResolveError];
  }
  char v13 = (void *)v11;
LABEL_17:
  v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v13];

LABEL_18:

  return v12;
}

- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4
{
  id v5 = a4;
  id v6 = [(HUMediaSourceItem *)self delegate];
  [v6 mediaPickerDidPickPlaybackArchive:v5];
}

- (void)mediaPickerDidCancel:(id)a3
{
  id v3 = [(HUMediaSourceItem *)self delegate];
  [v3 mediaPickerDidCancel];
}

- (void)mediaPickerDidSelectPlaybackArchive:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = [(HUMediaSourceItem *)self delegate];
  [v6 mediaPickerDidPickPlaybackArchive:v5];
}

- (void)mediaPickerCancelled
{
  id v2 = [(HUMediaSourceItem *)self delegate];
  [v2 mediaPickerDidCancel];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (HUMediaPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUMediaPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)continuousPicker
{
  return self->_continuousPicker;
}

- (void)setContinuousPicker:(BOOL)a3
{
  self->_continuousPicker = a3;
}

- (NSDictionary)resolveError
{
  return self->_resolveError;
}

- (void)setResolveError:(id)a3
{
}

- (NSSet)mediaProfileContainers
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (NAFuture)iconFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 112, 1);
}

- (NAFuture)resolveFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveFuture, 0);
  objc_storeStrong((id *)&self->_iconFuture, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainers, 0);
  objc_storeStrong((id *)&self->_resolveError, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end