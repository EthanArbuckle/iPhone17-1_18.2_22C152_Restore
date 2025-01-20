@interface MUWebBasedPlacecardSectionController
- (BOOL)hasContent;
- (BOOL)isImpressionable;
- (MUWebBasedPlacecardSectionController)initWithMapItem:(id)a3 placeActionDispatcher:(id)a4 configuration:(id)a5;
- (MUWebBasedPlacecardSectionControllerConfiguration)configuration;
- (MUWebBasedPlacecardViewControllerDelegate)webContentDelegate;
- (NSMutableDictionary)UIMenusDictionary;
- (UIView)sectionView;
- (UIViewController)sectionViewController;
- (id)draggableContent;
- (int)analyticsModuleType;
- (void)_downloadManifestWithForce:(BOOL)a3;
- (void)_setupExternalActionsModels;
- (void)_setupWebContentViewController;
- (void)callBridgeMethod:(id)a3 arguments:(id)a4;
- (void)didReceiveMessageFromWebContentViewController:(id)a3 replyHandler:(id)a4;
- (void)setConfiguration:(id)a3;
- (void)setUIMenusDictionary:(id)a3;
- (void)setWebContentDelegate:(id)a3;
- (void)updateUserData;
@end

@implementation MUWebBasedPlacecardSectionController

- (MUWebBasedPlacecardSectionController)initWithMapItem:(id)a3 placeActionDispatcher:(id)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MUWebBasedPlacecardSectionController;
  v12 = [(MUPlaceSectionController *)&v27 initWithMapItem:v9];
  if (v12)
  {
    v13 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceWebContentSectionControllerInit", "", v26, 2u);
    }

    v14 = [[_TtC6MapsUI37_MUWebBasedPlacecardSectionController alloc] initWithMapItem:v9 placeActionDispatcher:v10 configuration:v11 sectionController:v12];
    sectionController = v12->_sectionController;
    v12->_sectionController = v14;

    v16 = [[MUWebPlacecardBridgeConfiguration alloc] initWithNativeControllerName:@"PlacecardNativeController" webControllerName:@"PlacecardWebController"];
    webBundleConfiguration = v12->_webBundleConfiguration;
    v12->_webBundleConfiguration = v16;

    v12->_shouldRemoveWebContent = 0;
    objc_storeStrong((id *)&v12->_mapItem, a3);
    objc_storeStrong((id *)&v12->_configuration, a5);
    [(MUWebBasedPlacecardSectionController *)v12 _downloadManifestWithForce:1];
    v18 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceWebContentSectionControllerInit", "", v26, 2u);
    }

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    UIMenusDictionary = v12->_UIMenusDictionary;
    v12->_UIMenusDictionary = v19;

    [(MUWebBasedPlacecardSectionController *)v12 _setupExternalActionsModels];
    v21 = [MUWebUIMenuActionManager alloc];
    v22 = [v10 actionManager];
    uint64_t v23 = [(MUWebUIMenuActionManager *)v21 initWithPlaceActionManager:v22 mapItem:v9 externalActionViewModel:v12->_externalActionViewModels];
    menuActionManager = v12->_menuActionManager;
    v12->_menuActionManager = (MUWebUIMenuActionManager *)v23;
  }
  return v12;
}

- (void)_setupExternalActionsModels
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(MUPlaceSectionController *)self mapItem];
  v4 = [v3 _geoMapItem];
  v5 = [v4 _externalActionLinks];

  v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        v12 = [MUPlaceExternalActionViewModel alloc];
        v13 = [(MUWebBasedPlacecardSectionControllerConfiguration *)self->_configuration amsResultProvider];
        v14 = [(MUWebBasedPlacecardSectionControllerConfiguration *)self->_configuration artworkCache];
        v15 = [(MUWebBasedPlacecardSectionControllerConfiguration *)self->_configuration externalActionHandler];
        v16 = [(MUPlaceExternalActionViewModel *)v12 initWithExternalAction:v11 amsResultProvider:v13 iconCache:v14 actionHandler:v15 analyticsHandler:self];

        [(NSArray *)v6 addObject:v16];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  externalActionViewModels = self->_externalActionViewModels;
  self->_externalActionViewModels = v6;
}

- (void)_downloadManifestWithForce:(BOOL)a3
{
  objc_initWeak(&location, self);
  v4 = [MEMORY[0x1E4F64918] modernManager];
  v5 = [v4 activeTileGroup];
  v6 = [v5 explicitResources];

  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke;
  v14[3] = &unk_1E57511C0;
  objc_copyWeak(&v15, &location);
  uint64_t v8 = [v7 predicateWithBlock:v14];
  uint64_t v9 = [v6 filteredArrayUsingPredicate:v8];

  uint64_t v10 = [MEMORY[0x1E4F64928] sharedRequester];
  global_queue = (void *)geo_get_global_queue();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke_2;
  v12[3] = &unk_1E57511E8;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  [v10 fetchResources:v9 force:1 unpack:1 manifestConfiguration:0 auditToken:0 queue:global_queue handler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

uint64_t __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [v3 filename];
    v6 = [WeakRetained[14] manifestSignedResourceName];
    uint64_t v7 = [v5 isEqualToString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a4)
    {
      uint64_t v8 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_FAULT, "MUWebBasedPlacecardViewController: Error fetching signed resource from GeoServices", buf, 2u);
      }
    }
    else
    {
      uint64_t v8 = [v6 firstObject];
      buf[0] = 0;
      uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v10 = [v8 path];
      int v11 = [v9 fileExistsAtPath:v10 isDirectory:buf];
      int v12 = buf[0];

      if (v11 && v12)
      {
        id v13 = [WeakRetained[14] webBundleEntryPoint];
        v14 = [v8 URLByAppendingPathComponent:v13];

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke_152;
        v16[3] = &unk_1E574EE08;
        uint64_t v8 = v14;
        uint64_t v15 = *(void *)(a1 + 32);
        v17 = v8;
        uint64_t v18 = v15;
        dispatch_async(MEMORY[0x1E4F14428], v16);
      }
    }
  }
}

void __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke_152(uint64_t a1)
{
  v2 = objc_alloc_init(MUWebContentTraits);
  [(MUWebContentTraits *)v2 setVibrant:+[MUInfoCardStyle platterStyle] == 1];
  id v3 = [[MUWebBasedPlacecardViewController alloc] initWithURL:*(void *)(a1 + 32) traits:v2];
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 72), v3);
    [*(id *)(a1 + 40) _setupWebContentViewController];
  }
  else
  {
    v4 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_FAULT, "MUWebBasedPlacecardViewController: Cannot load a webmodule because the MUWebContentViewController doesn't exist", v5, 2u);
    }
  }
}

- (void)_setupWebContentViewController
{
  [(MUWebBasedPlacecardViewController *)self->_webContentViewController setWebBridgeDelegate:self];
  id v3 = [[MUPlaceSectionView alloc] initWithStyle:0 alwaysHideSeparators:0];
  sectionView = self->_sectionView;
  self->_sectionView = v3;

  v5 = self->_sectionView;
  id v6 = [(MUWebBasedPlacecardViewController *)self->_webContentViewController view];
  [(MUPlaceSectionView *)v5 attachViewToContentView:v6];

  uint64_t v7 = self->_sectionView;
  [(MUPlaceSectionView *)v7 configureWithSectionController:self];
}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_webContentViewController;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  return 1;
}

- (void)callBridgeMethod:(id)a3 arguments:(id)a4
{
}

- (void)updateUserData
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(MUWebBasedPlacecardSectionController *)self configuration];
  int v5 = [v4 placeInShortcuts];

  if (v5)
  {
    id v6 = NSNumber;
    uint64_t v7 = [(MUWebBasedPlacecardSectionController *)self configuration];
    uint64_t v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "placeInShortcuts"));
    [v3 setObject:v8 forKeyedSubscript:@"favorites"];
  }
  uint64_t v9 = [(MUWebBasedPlacecardSectionController *)self configuration];
  uint64_t v10 = [v9 userARPSuggestion];

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v12 = [(MUWebBasedPlacecardSectionController *)self configuration];
    id v13 = [v12 userARPSuggestion];
    v14 = [v13 title];
    [v11 setObject:v14 forKeyedSubscript:@"title"];

    uint64_t v15 = [(MUWebBasedPlacecardSectionController *)self configuration];
    v16 = [v15 userARPSuggestion];
    v17 = [v16 subtitle];
    [v11 setObject:v17 forKeyedSubscript:@"subtitle"];

    uint64_t v18 = NSNumber;
    long long v19 = [(MUWebBasedPlacecardSectionController *)self configuration];
    long long v20 = [v19 userARPSuggestion];
    long long v21 = objc_msgSend(v18, "numberWithBool:", objc_msgSend(v20, "isRatingSuggestion"));
    [v11 setObject:v21 forKeyedSubscript:@"isRatingSuggestion"];

    long long v22 = NSNumber;
    uint64_t v23 = [(MUWebBasedPlacecardSectionController *)self configuration];
    uint64_t v24 = [v23 userARPSuggestion];
    v25 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v24, "isPhotoSuggesion"));
    [v11 setObject:v25 forKeyedSubscript:@"isPhotoSuggestion"];

    v26 = [(MUWebBasedPlacecardSectionController *)self configuration];
    objc_super v27 = [v26 userIcon];
    [v11 setObject:v27 forKeyedSubscript:@"userImage"];

    [v3 setObject:v11 forKeyedSubscript:@"arpSuggestions"];
  }
  v28 = [(MUWebBasedPlacecardSectionController *)self configuration];
  v29 = [v28 userARPRatings];

  if (v29)
  {
    v48 = v3;
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v49 = self;
    v31 = [(MUWebBasedPlacecardSectionController *)self configuration];
    v32 = [v31 userARPRatings];

    uint64_t v33 = [v32 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v51;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v51 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v50 + 1) + 8 * v36);
          id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v39 = [v37 category];
          [v38 setObject:v39 forKeyedSubscript:@"appleRatingCategory"];

          v40 = [v37 value];
          [v38 setObject:v40 forKeyedSubscript:@"value"];

          [v30 addObject:v38];
          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v34);
    }

    id v3 = v48;
    [v48 setObject:v30 forKeyedSubscript:@"arpRatings"];

    self = v49;
  }
  v41 = [(MUWebBasedPlacecardSectionController *)self configuration];
  v42 = [v41 userARPPhoto];

  if (v42)
  {
    v43 = (void *)MEMORY[0x1E4F1C9B8];
    v44 = [(MUWebBasedPlacecardSectionController *)self configuration];
    v45 = [v44 userARPPhoto];
    v46 = [v43 dataWithContentsOfURL:v45];

    v47 = [v46 base64EncodedStringWithOptions:0];
    [v3 setObject:v47 forKeyedSubscript:@"arpPhotos"];
  }
  if ([v3 count]) {
    [(MUWebBasedPlacecardSectionController *)self callBridgeMethod:@"updateUserData" arguments:v3];
  }
}

- (void)didReceiveMessageFromWebContentViewController:(id)a3 replyHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = [[WebPlacecardBridge alloc] initWithData:v6];
  uint64_t v9 = [(WebPlacecardBridge *)v8 arguments];
  if ([(WebPlacecardBridge *)v8 name] == 3)
  {
    uint64_t v10 = +[MUWebBasedPlacecardImageDataProvider sharedInstance];
    id v11 = [v9 firstObject];
    int v12 = [v11 iconArgument];
    id v13 = [v10 imageDataForStyleAttributes:v12];
    v14 = (void *)[v13 mutableCopy];

    v7[2](v7, v14, 0);
  }
  else if ([(WebPlacecardBridge *)v8 name] == 2)
  {
    uint64_t v15 = [v9 firstObject];
    v16 = [v15 webMenuButton];

    v17 = [(MUWebBasedPlacecardSectionController *)self UIMenusDictionary];
    uint64_t v18 = [v16 menuId];
    long long v19 = [v17 objectForKey:v18];

    long long v20 = [v16 boundingBox];
    [v20 xCoordinate];
    double v22 = v21;
    [v20 yCoordinate];
    double v24 = v23;
    [v20 width];
    double v26 = v25;
    [v20 height];
    double v28 = v27;
    if (v19)
    {
      v29 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v19;
        _os_log_impl(&dword_1931EA000, v29, OS_LOG_TYPE_INFO, "Updated WebUIMenu frame %@", buf, 0xCu);
      }

      -[MUWebUIMenu setFrame:](v19, "setFrame:", v22, v24, v26, v28);
    }
    else
    {
      id v30 = -[MUWebUIMenu initWithFrame:]([MUWebUIMenu alloc], "initWithFrame:", v22, v24, v26, v28);
      [(MUWebUIMenu *)v30 setMenuButton:v16];
      [(MUWebUIMenu *)v30 setMenuActionManager:self->_menuActionManager];
      v31 = [(MUWebBasedPlacecardViewController *)self->_webContentViewController webView];
      v32 = [v31 scrollView];
      [v32 addSubview:v30];

      uint64_t v33 = [(MUWebBasedPlacecardSectionController *)self UIMenusDictionary];
      uint64_t v34 = [v16 menuId];
      [v33 setObject:v30 forKey:v34];

      uint64_t v35 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v30;
        _os_log_impl(&dword_1931EA000, v35, OS_LOG_TYPE_INFO, "Added WebUIMenu %@", buf, 0xCu);
      }

      long long v19 = 0;
    }
  }
  else
  {
    [(_MUWebBasedPlacecardSectionController *)self->_sectionController didReceiveMessageFromWebContentViewController:v6 replyHandler:v7];
  }
}

- (id)draggableContent
{
  return 0;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (int)analyticsModuleType
{
  return 25;
}

- (MUWebBasedPlacecardViewControllerDelegate)webContentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webContentDelegate);
  return (MUWebBasedPlacecardViewControllerDelegate *)WeakRetained;
}

- (void)setWebContentDelegate:(id)a3
{
}

- (MUWebBasedPlacecardSectionControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSMutableDictionary)UIMenusDictionary
{
  return self->_UIMenusDictionary;
}

- (void)setUIMenusDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UIMenusDictionary, 0);
  objc_destroyWeak((id *)&self->_webContentDelegate);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_menuActionManager, 0);
  objc_storeStrong((id *)&self->_webBundleConfiguration, 0);
  objc_storeStrong((id *)&self->_externalActionViewModels, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_webContentViewController, 0);
}

@end