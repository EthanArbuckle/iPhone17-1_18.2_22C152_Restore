@interface MUOfficialAppSectionController
- (BOOL)hasContent;
- (BOOL)isImpressionable;
- (MUOfficialAppSectionController)initWithMapItem:(id)a3 usingCachedMediaResults:(id)a4;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (UIView)sectionView;
- (id)_sectionHeaderText;
- (id)infoCardChildPossibleActions;
- (int)analyticsModuleType;
- (void)_hydrateViewWithApp;
- (void)_setupLockupView;
- (void)_updateViewWithMediaServicesResult:(id)a3;
- (void)appLockupViewDidSelectPunchOutButton:(id)a3;
@end

@implementation MUOfficialAppSectionController

- (MUOfficialAppSectionController)initWithMapItem:(id)a3 usingCachedMediaResults:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUOfficialAppSectionController;
  v8 = [(MUPlaceSectionController *)&v13 initWithMapItem:a3];
  if (v8)
  {
    v9 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUOfficialAppSectionControllerInit", "", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_cachedMediaResults, a4);
    [(MUOfficialAppSectionController *)v8 _hydrateViewWithApp];
    v10 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUOfficialAppSectionControllerInit", "", v12, 2u);
    }
  }
  return v8;
}

- (void)_setupLockupView
{
  v3 = [MUPlaceAppLockupView alloc];
  v4 = -[MUPlaceAppLockupView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  officialAppView = self->_officialAppView;
  self->_officialAppView = v4;

  [(MUPlaceAppLockupView *)self->_officialAppView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUPlaceAppLockupView *)self->_officialAppView setDelegate:self];
  v10 = [[MUPlatterView alloc] initWithContentView:self->_officialAppView];
  v6 = [MUPlaceSectionView alloc];
  id v7 = [(MUOfficialAppSectionController *)self sectionHeaderViewModel];
  v8 = [(MUPlaceSectionView *)v6 initWithStyle:1 sectionHeaderViewModel:v7];
  sectionView = self->_sectionView;
  self->_sectionView = v8;

  [(MUPlaceSectionView *)self->_sectionView attachViewToContentView:v10];
  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
}

- (void)_hydrateViewWithApp
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(MUPlaceSectionController *)self mapItem];
  v4 = [v3 _preferedAppAdamID];
  v5 = [v4 stringValue];

  v6 = [(MUTimeExpirableLRUCache *)self->_cachedMediaResults objectForKey:v5];
  id v7 = MUGetPlaceCardLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_INFO, "Have cached app store app for identifier %@.  Early return.", buf, 0xCu);
    }

    [(MUOfficialAppSectionController *)self _updateViewWithMediaServicesResult:v6];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_INFO, "Fetching app store app with identifier %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v9 = [MEMORY[0x1E4F30E48] sharedInstance];
    v10 = [(MUPlaceSectionController *)self mapItem];
    v11 = [v10 _preferedAppAdamID];
    v12 = [v11 stringValue];
    v23 = v12;
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    +[MUPlaceAppLockupView appIconSize];
    double v15 = v14;
    double v17 = v16;
    v18 = [MEMORY[0x1E4F31038] sharedInstance];
    [v18 screenScale];
    double v20 = v19;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __53__MUOfficialAppSectionController__hydrateViewWithApp__block_invoke;
    v21[3] = &unk_1E574F0E8;
    objc_copyWeak(&v22, (id *)buf);
    objc_msgSend(v9, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v13, 1, 4, v21, v15, v17, v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __53__MUOfficialAppSectionController__hydrateViewWithApp__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v8 = [v5 firstObject];
    v9 = v8;
    if (v6 || !v8)
    {
      objc_super v13 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch app store app with error %@", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      v10 = (void *)WeakRetained[12];
      v11 = [v8 identifier];
      [v10 setObject:v9 forKey:v11];

      [WeakRetained _updateViewWithMediaServicesResult:v9];
      v12 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v9;
        _os_log_impl(&dword_1931EA000, v12, OS_LOG_TYPE_INFO, "MUOfficialAppSectionController: Fetched app %@, will tell parent to update", (uint8_t *)&v14, 0xCu);
      }

      objc_super v13 = [WeakRetained delegate];
      [v13 placeSectionControllerDidUpdateContent:WeakRetained];
    }
  }
}

- (void)_updateViewWithMediaServicesResult:(id)a3
{
  p_appStoreApp = &self->_appStoreApp;
  objc_storeStrong((id *)&self->_appStoreApp, a3);
  id v6 = a3;
  [(MUOfficialAppSectionController *)self _setupLockupView];
  [(MUPlaceAppLockupView *)self->_officialAppView setViewModel:*p_appStoreApp];
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  return self->_appStoreApp != 0;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  v3 = [MUPlaceSectionHeaderViewModel alloc];
  v4 = [(MUOfficialAppSectionController *)self _sectionHeaderText];
  id v5 = [(MUPlaceSectionHeaderViewModel *)v3 initWithTitleString:v4];

  return v5;
}

- (void)appLockupViewDidSelectPunchOutButton:(id)a3
{
  v4 = [(MUPlaceSectionController *)self mapItem];
  id v5 = [v4 _attribution];
  id v6 = [v5 providerID];
  [(MUPlaceSectionController *)self captureInfoCardAction:6040 eventValue:0 feedbackType:0 actionRichProviderId:v6];

  if ([(GEOAppleMediaServicesResult *)self->_appStoreApp isInstalled])
  {
    id v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v7 = [(GEOAppleMediaServicesResult *)self->_appStoreApp iOSBundleIdentifier];
    [v8 openApplicationWithBundleID:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F31038] sharedInstance];
    id v7 = [(GEOAppleMediaServicesResult *)self->_appStoreApp url];
    [v8 openURL:v7 completionHandler:0];
  }
}

- (id)_sectionHeaderText
{
  if ([(GEOAppleMediaServicesResult *)self->_appStoreApp isInstalled]) {
    v2 = @"Open the App [Placecard]";
  }
  else {
    v2 = @"Get the App [Placecard]";
  }
  v3 = _MULocalizedStringFromThisBundle(v2);
  return v3;
}

- (id)infoCardChildPossibleActions
{
  if ([(MUOfficialAppSectionController *)self hasContent]) {
    return &unk_1EE4050D8;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (int)analyticsModuleType
{
  return 15;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMediaResults, 0);
  objc_storeStrong((id *)&self->_appStoreApp, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_officialAppView, 0);
}

@end