@interface HUCameraSmartDetectionSettingsItemProvider
- (BOOL)_homeSupportsPackageDetection;
- (HUCameraSmartDetectionSettingsItemProvider)init;
- (HUCameraSmartDetectionSettingsItemProvider)initWithCameraProfiles:(id)a3 settingsContext:(unint64_t)a4;
- (NSMutableSet)smartDetectionSettingsItems;
- (NSSet)cameraProfiles;
- (id)reloadItems;
- (unint64_t)settingsContext;
@end

@implementation HUCameraSmartDetectionSettingsItemProvider

- (HUCameraSmartDetectionSettingsItemProvider)initWithCameraProfiles:(id)a3 settingsContext:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUCameraSmartDetectionSettingsItemProvider;
  v7 = [(HFItemProvider *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    cameraProfiles = v7->_cameraProfiles;
    v7->_cameraProfiles = (NSSet *)v8;

    v7->_settingsContext = a4;
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    smartDetectionSettingsItems = v7->_smartDetectionSettingsItems;
    v7->_smartDetectionSettingsItems = (NSMutableSet *)v10;
  }
  return v7;
}

- (HUCameraSmartDetectionSettingsItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithCameraProfiles_settingsContext_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraSmartDetectionSettingsItemProvider.m", 30, @"%s is unavailable; use %@ instead",
    "-[HUCameraSmartDetectionSettingsItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [MEMORY[0x1E4F68FD8] configurationWithEventTypes:2 personFamiliarityOptions:0];
  v23[0] = v4;
  v5 = [MEMORY[0x1E4F68FD8] configurationWithEventTypes:4 personFamiliarityOptions:0];
  v23[1] = v5;
  id v6 = [MEMORY[0x1E4F68FD8] configurationWithEventTypes:8 personFamiliarityOptions:0];
  v23[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  uint64_t v8 = [v3 arrayWithArray:v7];

  if ([(HUCameraSmartDetectionSettingsItemProvider *)self _homeSupportsPackageDetection])
  {
    v9 = [MEMORY[0x1E4F68FD8] configurationWithEventTypes:16 personFamiliarityOptions:0];
    [v8 addObject:v9];
  }
  if ([(HUCameraSmartDetectionSettingsItemProvider *)self settingsContext] == 1
    && _os_feature_enabled_impl())
  {
    uint64_t v10 = [MEMORY[0x1E4F68FD8] configurationWithEventTypes:2 personFamiliarityOptions:1];
    v22[0] = v10;
    v11 = [MEMORY[0x1E4F68FD8] configurationWithEventTypes:2 personFamiliarityOptions:2];
    v22[1] = v11;
    v12 = [MEMORY[0x1E4F68FD8] configurationWithEventTypes:2 personFamiliarityOptions:4];
    v22[2] = v12;
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
    [v8 addObjectsFromArray:v13];
  }
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_3;
  v19[3] = &unk_1E6389C30;
  objc_copyWeak(&v20, &location);
  v14 = [(HFItemProvider *)self reloadItemsWithObjects:v8 keyAdaptor:&__block_literal_global_91 itemAdaptor:&__block_literal_global_16 filter:0 itemMap:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_5;
  v17[3] = &unk_1E6385B38;
  objc_copyWeak(&v18, &location);
  v15 = [v14 flatMap:v17];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v15;
}

uint64_t __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 hash];

  return [v2 numberWithUnsignedInteger:v3];
}

id __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 significantEventConfiguration];
  v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "hash"));

  return v4;
}

HUCameraSmartDetectionSettingsItem *__57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained items];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_4;
  v11[3] = &unk_1E6386108;
  id v6 = v3;
  id v12 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v11);
  v7 = (HUCameraSmartDetectionSettingsItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    uint64_t v8 = [HUCameraSmartDetectionSettingsItem alloc];
    v9 = [WeakRetained cameraProfiles];
    v7 = -[HUCameraSmartDetectionSettingsItem initWithSignificantEventConfiguration:cameraProfiles:settingsContext:](v8, "initWithSignificantEventConfiguration:cameraProfiles:settingsContext:", v6, v9, [WeakRetained settingsContext]);
  }

  return v7;
}

BOOL __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 significantEventConfiguration];
  uint64_t v8 = [v7 hash];
  BOOL v9 = v8 == [*(id *)(a1 + 32) hash];

  return v9;
}

id __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained smartDetectionSettingsItems];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained smartDetectionSettingsItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  BOOL v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (BOOL)_homeSupportsPackageDetection
{
  v2 = [(HUCameraSmartDetectionSettingsItemProvider *)self cameraProfiles];
  id v3 = [v2 anyObject];
  id v4 = [v3 accessory];
  v5 = [v4 home];
  char v6 = objc_msgSend(v5, "hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes");

  return v6;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (NSMutableSet)smartDetectionSettingsItems
{
  return self->_smartDetectionSettingsItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartDetectionSettingsItems, 0);

  objc_storeStrong((id *)&self->_cameraProfiles, 0);
}

@end