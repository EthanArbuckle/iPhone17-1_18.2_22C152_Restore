@interface HUFaceRecognitionUserPhotosLibrarySettingsItemManager
- (HFStaticItem)addNamesInPhotosLibraryItem;
- (HFStaticItemProvider)staticItemProvider;
- (HMHome)overrideHome;
- (HMUser)user;
- (HUFaceRecognitionUserPhotosLibrarySettingsItemManager)initWithDelegate:(id)a3;
- (HUFaceRecognitionUserPhotosLibrarySettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUFaceRecognitionUserPhotosLibrarySettingsModule)photosLibrarySettingsModule;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)setImportPhotosLibraryEnabled:(BOOL)a3;
- (id)setSharePhotosLibraryEnabled:(BOOL)a3;
- (void)setAddNamesInPhotosLibraryItem:(id)a3;
- (void)setStaticItemProvider:(id)a3;
@end

@implementation HUFaceRecognitionUserPhotosLibrarySettingsItemManager

- (HUFaceRecognitionUserPhotosLibrarySettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsItemManager;
  v7 = [(HFItemManager *)&v20 initWithDelegate:a3 sourceItem:v6];
  if (!v7) {
    goto LABEL_7;
  }
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    uint64_t v11 = [v10 home];
    overrideHome = v7->_overrideHome;
    v7->_overrideHome = (HMHome *)v11;

    v13 = [HUFaceRecognitionUserPhotosLibrarySettingsModule alloc];
    v14 = [v10 home];
    uint64_t v15 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)v13 initWithItemUpdater:v7 home:v14];
    photosLibrarySettingsModule = v7->_photosLibrarySettingsModule;
    v7->_photosLibrarySettingsModule = (HUFaceRecognitionUserPhotosLibrarySettingsModule *)v15;

LABEL_7:
    v17 = v7;
    goto LABEL_11;
  }
  v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v7;
    __int16 v23 = 2080;
    v24 = "-[HUFaceRecognitionUserPhotosLibrarySettingsItemManager initWithDelegate:sourceItem:]";
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_error_impl(&dword_1BE345000, v18, OS_LOG_TYPE_ERROR, "(%@ : %s) sourceItem should be HFUserPhotosLibraryItem. sourceItem = %@", buf, 0x20u);
  }

  v17 = 0;
LABEL_11:

  return v17;
}

- (HMUser)user
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v3 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 user];
  }
  else
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = [(HFItemManager *)self sourceItem];
      int v10 = 138412802;
      uint64_t v11 = self;
      __int16 v12 = 2080;
      v13 = "-[HUFaceRecognitionUserPhotosLibrarySettingsItemManager user]";
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "%@ %s: sourceItem is expected to be HFUserPhotosLibraryItem, but it's %@", (uint8_t *)&v10, 0x20u);
    }
    id v6 = 0;
  }

  return (HMUser *)v6;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsItemManager)initWithDelegate:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(sel_initWithDelegate_sourceItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionUserPhotosLibrarySettingsItemManager.m", 60, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionUserPhotosLibrarySettingsItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemModulesForHome:(id)a3
{
  v4 = objc_opt_new();
  id v5 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self photosLibrarySettingsModule];
  objc_msgSend(v4, "na_safeAddObject:", v5);

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v4 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (!v5)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [(HFItemManager *)self sourceItem];
      *(_DWORD *)buf = 136315394;
      v18 = "-[HUFaceRecognitionUserPhotosLibrarySettingsItemManager _buildItemProvidersForHome:]";
      __int16 v19 = 2112;
      objc_super v20 = v16;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "(%s) sourceItem should be HFUserPhotosLibraryItem: %@", buf, 0x16u);
    }
  }
  v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F695C0]) initWithResultsBlock:&__block_literal_global_118];
  [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self setAddNamesInPhotosLibraryItem:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F695C8]);
  int v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self addNamesInPhotosLibraryItem];
  __int16 v12 = objc_msgSend(v10, "setWithObjects:", v11, 0);
  v13 = (void *)[v9 initWithItems:v12];
  [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self setStaticItemProvider:v13];

  __int16 v14 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self staticItemProvider];
  objc_msgSend(v7, "na_safeAddObject:", v14);

  return v7;
}

id __84__HUFaceRecognitionUserPhotosLibrarySettingsItemManager__buildItemProvidersForHome___block_invoke()
{
  v0 = objc_opt_new();
  v1 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionAddNamesInPhotosCellTitle", @"HUFaceRecognitionAddNamesInPhotosCellTitle", 1);
  [v0 setObject:v1 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v2 = [MEMORY[0x1E4F7A0D8] futureWithResult:v0];

  return v2;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self photosLibrarySettingsModule];
  v7 = [v6 buildSectionsWithDisplayedItems:v4];
  objc_msgSend(v5, "na_safeAddObjectsFromArray:", v7);

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUFaceRecognitionAddNamesInPhotosLibrarySection"];
  id v9 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self addNamesInPhotosLibraryItem];
  v13[0] = v9;
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v8 setItems:v10];

  objc_msgSend(v5, "na_safeAddObject:", v8);
  uint64_t v11 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v11;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)setImportPhotosLibraryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HFItemManager *)self home];
  id v6 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self user];
  v7 = objc_msgSend(v5, "hf_setImportPhotosLibraryEnabled:forUser:", v3, v6);

  return v7;
}

- (id)setSharePhotosLibraryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HFItemManager *)self home];
  id v6 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self user];
  v7 = objc_msgSend(v5, "hf_setSharePhotosLibraryEnabled:forUser:", v3, v6);

  return v7;
}

- (HFStaticItem)addNamesInPhotosLibraryItem
{
  return self->_addNamesInPhotosLibraryItem;
}

- (void)setAddNamesInPhotosLibraryItem:(id)a3
{
}

- (HUFaceRecognitionUserPhotosLibrarySettingsModule)photosLibrarySettingsModule
{
  return self->_photosLibrarySettingsModule;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_photosLibrarySettingsModule, 0);

  objc_storeStrong((id *)&self->_addNamesInPhotosLibraryItem, 0);
}

@end