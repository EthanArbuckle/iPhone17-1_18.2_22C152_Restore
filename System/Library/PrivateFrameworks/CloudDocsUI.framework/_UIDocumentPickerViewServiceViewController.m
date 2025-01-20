@interface _UIDocumentPickerViewServiceViewController
+ (id)_exportedInterface;
+ (id)_logicalURLForPhysicalURL:(id)a3;
+ (id)_remoteViewControllerInterface;
+ (id)_urlByResolvingExternalDocumentReferenceForURL:(id)a3;
- (BOOL)_shouldWarnForSharing;
- (BOOL)displayedAsMenu;
- (BOOL)hasBeenDismissed;
- (BOOL)showingSpinner;
- (CGSize)_updatedContentSizeForPreferredContentSize:(CGSize)a3;
- (NSArray)auxiliaryOptions;
- (NSArray)pickableTypes;
- (NSString)currentPickerIdentifier;
- (NSURL)uploadURL;
- (UIViewController)currentPicker;
- (id)_mangledFilenameForURL:(id)a3;
- (int)sortOrder;
- (unint64_t)pickerMode;
- (void)_cloudEnabledStatusDidChange:(id)a3;
- (void)_createBookmarkAndDismissWithCloudURL:(id)a3;
- (void)_didInstantiateThirdPartyPickerWithDescription:(id)a3 placeholder:(id)a4;
- (void)_didSelectURL:(id)a3;
- (void)_dismissViewController;
- (void)_dismissWithFileProviderURL:(id)a3 bundleIdentifier:(id)a4;
- (void)_dismissWithImportURL:(id)a3;
- (void)_displayLocationsMenuFromRect:(CGRect)a3;
- (void)_documentPickerDidDismiss;
- (void)_doneButton:(id)a3;
- (void)_invalidatePicker:(id)a3;
- (void)_prepareForDisplayWithCompletion:(id)a3;
- (void)_presentError:(id)a3 forThirdPartyPickerWithDescription:(id)a4;
- (void)_setAuxiliaryOptions:(id)a3;
- (void)_setIsContentManaged:(BOOL)a3;
- (void)_setPickableTypes:(id)a3;
- (void)_setPickerMode:(unint64_t)a3;
- (void)_setTintColor:(id)a3;
- (void)_setUploadURL:(id)a3;
- (void)_setUploadURLWrapper:(id)a3;
- (void)_showExistsAlertForFile:(id)a3 withSourceURL:(id)a4;
- (void)_showLocationPopup:(id)a3;
- (void)_showLocationPopupFromBarButtonItem:(id)a3 rect:(CGRect)a4;
- (void)_showPicker:(id)a3;
- (void)_showTopLevelViewController;
- (void)_tryExportingFile:(id)a3 toLocation:(id)a4;
- (void)_updateDefaultPicker;
- (void)_waitForDownloadOfURL:(id)a3 completion:(id)a4;
- (void)_warnSharingForTarget:(id)a3 completion:(id)a4;
- (void)_warnSharingPreMove;
- (void)_willAppearInRemoteViewController;
- (void)dealloc;
- (void)dismissWithURL:(id)a3 forBundleIdentifier:(id)a4;
- (void)documentListController:(id)a3 didSelectContainerWithViewController:(id)a4;
- (void)documentListController:(id)a3 didSelectItemAtURL:(id)a4;
- (void)documentTargetSelectionController:(id)a3 didSelectItemAtURL:(id)a4;
- (void)overviewController:(id)a3 selectedAuxiliaryOptionWithIdentifier:(id)a4;
- (void)overviewController:(id)a3 selectedDocumentPickerWithIdentifier:(id)a4;
- (void)pickLocationForUpload:(id)a3;
- (void)setCurrentPicker:(id)a3;
- (void)setCurrentPickerIdentifier:(id)a3;
- (void)setDisplayedAsMenu:(BOOL)a3;
- (void)setHasBeenDismissed:(BOOL)a3;
- (void)setNavigationItemSpinner:(BOOL)a3;
- (void)setShowingSpinner:(BOOL)a3;
- (void)setSortOrder:(int)a3;
- (void)setupNavigationItemForPicker:(id)a3 isRoot:(BOOL)a4;
@end

@implementation _UIDocumentPickerViewServiceViewController

+ (id)_exportedInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E06C650];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel__setAuxiliaryOptions_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E072158];
}

- (void)dealloc
{
  [(NSURL *)self->_uploadURL stopAccessingSecurityScopedResource];
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerViewServiceViewController;
  [(_UIDocumentPickerViewServiceViewController *)&v3 dealloc];
}

- (void)_setUploadURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = cdui_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v5;
    _os_log_impl(&dword_22CA47000, v6, OS_LOG_TYPE_INFO, "[INFO] received upload URL %@", buf, 0xCu);
  }

  p_uploadURL = &self->_uploadURL;
  if (([(NSURL *)self->_uploadURL isEqual:v5] & 1) == 0)
  {
    [(NSURL *)*p_uploadURL stopAccessingSecurityScopedResource];
    objc_storeStrong((id *)&self->_uploadURL, a3);
    [(NSURL *)*p_uploadURL startAccessingSecurityScopedResource];
    v8 = [(_UIDocumentPickerViewServiceViewController *)self uploadURL];

    if (v8)
    {
      v9 = [MEMORY[0x263EFF980] array];
      id v35 = 0;
      int v10 = [v5 getPromisedItemResourceValue:&v35 forKey:*MEMORY[0x263EFF780] error:0];
      id v11 = v35;
      if (v10)
      {
        [v9 addObject:*MEMORY[0x263F01A78]];
        [v9 addObject:v11];
        id v34 = 0;
        int v12 = [v5 getPromisedItemResourceValue:&v34 forKey:*MEMORY[0x263EFF6D0] error:0];
        v13 = v34;
        v14 = v13;
        if (v12)
        {
          int v15 = [v13 BOOLValue];
          v16 = (void *)MEMORY[0x263F01AE8];
          if (!v15) {
            v16 = (void *)MEMORY[0x263F01A08];
          }
          [v9 addObject:*v16];
        }
      }
      else
      {
        v17 = cdui_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.6((uint64_t)&self->_uploadURL, v17, v18, v19, v20, v21, v22, v23);
        }

        id v24 = [(NSURL *)*p_uploadURL path];
        uint64_t v33 = [v24 fileSystemRepresentation];
        int v25 = sandbox_check();

        if (v25)
        {
          v26 = cdui_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.5();
          }

          v14 = MEMORY[0x230F71E50](*p_uploadURL);
          v27 = cdui_default_log();
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_FAULT);
          if (v14)
          {
            if (v28) {
              -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.4();
            }
          }
          else if (v28)
          {
            -[_UIDocumentPickerViewServiceViewController _setUploadURL:]();
          }
        }
        else
        {
          v29 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v33);
          v30 = [(NSURL *)*p_uploadURL path];
          int v31 = [v29 fileExistsAtPath:v30];

          v14 = cdui_default_log();
          BOOL v32 = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);
          if (v31)
          {
            if (v32) {
              -[_UIDocumentPickerViewServiceViewController _setUploadURL:]();
            }
          }
          else if (v32)
          {
            -[_UIDocumentPickerViewServiceViewController _setUploadURL:]();
          }
        }
      }

      [(_UIDocumentPickerViewServiceViewController *)self _setPickableTypes:v9];
    }
  }
}

- (void)_createBookmarkAndDismissWithCloudURL:(id)a3
{
  id v4 = a3;
  [(_UIDocumentPickerViewServiceViewController *)self _hostApplicationBundleIdentifier];
  id v5 = v4;
  FPExtendBookmarkForDocumentURL();
}

- (void)_dismissWithFileProviderURL:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(_UIDocumentPickerViewServiceViewController *)self _hostApplicationBundleIdentifier];
  v9 = cdui_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_22CA47000, v9, OS_LOG_TYPE_INFO, "[INFO] 3rd party document picker %@ selected URL %@", buf, 0x16u);
  }

  int v10 = [MEMORY[0x263F05448] sharedConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke;
  v14[3] = &unk_26492D6F8;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  [v10 extendSandboxAndCreatePlaceholderForFileURL:v13 fromProviderID:v12 toConsumerID:v11 completionHandler:v14];
}

- (void)_dismissWithImportURL:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIDocumentPickerViewServiceViewController *)self hostingViewController];
  id v5 = [MEMORY[0x263F1CC78] wrapperWithURL:v4];

  [v6 _didSelectURLWrapper:v5];
}

- (void)dismissWithURL:(id)a3 forBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![(_UIDocumentPickerViewServiceViewController *)self hasBeenDismissed])
  {
    [(_UIDocumentPickerViewServiceViewController *)self setHasBeenDismissed:1];
    if (v9)
    {
      if ([(_UIDocumentPickerViewServiceViewController *)self pickerMode]
        && [(_UIDocumentPickerViewServiceViewController *)self pickerMode] != 2)
      {
        if (v6 && ![v6 isEqualToString:*MEMORY[0x263F324E8]]) {
          [(_UIDocumentPickerViewServiceViewController *)self _dismissWithFileProviderURL:v9 bundleIdentifier:v6];
        }
        else {
          [(_UIDocumentPickerViewServiceViewController *)self _createBookmarkAndDismissWithCloudURL:v9];
        }
        goto LABEL_8;
      }
      [(_UIDocumentPickerViewServiceViewController *)self setNavigationItemSpinner:1];
      id v7 = [(_UIDocumentPickerViewServiceViewController *)self hostingViewController];
      v8 = [MEMORY[0x263F1CC78] wrapperWithURL:v9];
      [v7 _didSelectURLWrapper:v8];
    }
    else
    {
      id v7 = [(_UIDocumentPickerViewServiceViewController *)self hostingViewController];
      [v7 _dismissViewController];
    }
  }
LABEL_8:
}

- (void)_waitForDownloadOfURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v73[0] = 0;
  char v7 = [v5 getPromisedItemResourceValue:v73 forKey:*MEMORY[0x263EFF738] error:0];
  id v8 = v73[0];
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = [v5 lastPathComponent];

    id v8 = (id)v9;
  }
  id v72 = 0;
  uint64_t v10 = *MEMORY[0x263EFF688];
  id v71 = 0;
  int v11 = [v5 getPromisedItemResourceValue:&v72 forKey:v10 error:&v71];
  id v12 = v72;
  id v43 = v71;
  v44 = v12;
  if (v11)
  {
    uint64_t v13 = [v12 unsignedIntegerValue];
  }
  else
  {
    v14 = cdui_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[_UIDocumentPickerViewServiceViewController _waitForDownloadOfURL:completion:]();
    }

    uint64_t v13 = 0;
  }
  id v15 = NSString;
  v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v17 = [v16 localizedStringForKey:@"Downloading \"%@\" value:@"Downloading a Copy of “%@”" table:@"Localizable""];
  uint64_t v18 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v8);

  v42 = (void *)v18;
  uint64_t v19 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v18 message:0 preferredStyle:1];
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__3;
  v69[4] = __Block_byref_object_dispose__3;
  id v70 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__3;
  v67 = __Block_byref_object_dispose__3;
  id v68 = 0;
  id v20 = objc_opt_new();
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke;
  v62[3] = &unk_26492D720;
  v62[4] = v69;
  v62[5] = &v63;
  __int16 v21 = (void *)MEMORY[0x230F72310](v62);
  id v22 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_2;
  block[3] = &unk_26492D7C0;
  id v23 = v5;
  id v58 = v23;
  id v24 = v21;
  id v60 = v24;
  id v25 = v19;
  id v59 = v25;
  id v26 = v6;
  id v61 = v26;
  dispatch_async(v22, block);

  v27 = [MEMORY[0x263F086F0] stringFromByteCount:v13 countStyle:0];
  BOOL v28 = (void *)MEMORY[0x263F08AB8];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_6;
  v50[3] = &unk_26492D810;
  v55 = v69;
  uint64_t v56 = v13;
  id v29 = v27;
  id v51 = v29;
  id v30 = v25;
  id v52 = v30;
  id v31 = v20;
  id v53 = v31;
  id v32 = v24;
  id v54 = v32;
  uint64_t v33 = [v28 _addSubscriberForFileURL:v23 withPublishingHandler:v50];
  id v34 = (void *)v64[5];
  v64[5] = v33;

  [v31 addObject:v64[5]];
  id v35 = (void *)MEMORY[0x263F1C3F0];
  v36 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v37 = [v36 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_10;
  v46[3] = &unk_26492D838;
  id v38 = v32;
  id v48 = v38;
  id v39 = v31;
  id v47 = v39;
  id v40 = v26;
  id v49 = v40;
  v41 = [v35 actionWithTitle:v37 style:1 handler:v46];
  [v30 addAction:v41];

  [(_UIDocumentPickerViewServiceViewController *)self presentViewController:v30 animated:1 completion:&__block_literal_global_122_0];
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(v69, 8);
}

- (void)_documentPickerDidDismiss
{
  v2 = [(_UIViewServiceViewController *)self containedNavController];
  [v2 setViewControllers:MEMORY[0x263EFFA68]];

  +[_UIDocumentPickerContainerItem clearLRUThumbnailCache];
}

- (void)_setTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDocumentPickerViewServiceViewController *)self view];
  [v5 setTintColor:v4];
}

- (void)_updateDefaultPicker
{
  unint64_t v3 = [(_UIDocumentPickerViewServiceViewController *)self pickerMode];
  id v4 = [(_UIDocumentPickerViewServiceViewController *)self pickableTypes];
  id v5 = +[_UIDocumentPickerDescriptor defaultPickerIdentifierForMode:v3 documentTypes:v4];
  [(_UIDocumentPickerViewServiceViewController *)self setCurrentPickerIdentifier:v5];

  id v6 = [(_UIDocumentPickerViewServiceViewController *)self currentPickerIdentifier];

  if (!v6)
  {
    [(_UIDocumentPickerViewServiceViewController *)self setCurrentPickerIdentifier:@"_UIDocumentPickerUnavailableIdentifier"];
  }
}

- (void)_setUploadURLWrapper:(id)a3
{
  id v4 = [a3 url];
  [(_UIDocumentPickerViewServiceViewController *)self _setUploadURL:v4];
}

- (void)_setIsContentManaged:(BOOL)a3
{
}

- (void)_prepareForDisplayWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(_UIDocumentPickerViewServiceViewController *)self _showTopLevelViewController];
  id v5 = [(_UIViewServiceViewController *)self containedNavController];
  id v6 = [v5 viewControllers];
  id v7 = [v6 lastObject];

  [v7 preferredContentSize];
  -[_UIDocumentPickerViewServiceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [v7 preferredContentSize];
  v4[2](v4);

  if (self->_currentPickerIdentifier) {
    [(_UIDocumentPickerViewServiceViewController *)self _warnSharingPreMove];
  }
}

- (void)_cloudEnabledStatusDidChange:(id)a3
{
  [(_UIDocumentPickerViewServiceViewController *)self _updateDefaultPicker];
  id v4 = [(_UIDocumentPickerViewServiceViewController *)self currentPickerIdentifier];
  [(_UIDocumentPickerViewServiceViewController *)self _showPicker:v4];
}

- (void)_willAppearInRemoteViewController
{
  unint64_t v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  id v4 = [(_UIDocumentPickerViewServiceViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(_UIDocumentPickerViewServiceViewController *)self _hostApplicationBundleIdentifier];
  +[_UIDocumentPickerDescriptor setHostBundleID:v5];

  [(_UIDocumentPickerViewServiceViewController *)self _hostAuditToken];
  +[_UIDocumentPickerDescriptor setHostAuditToken:&v7];
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__cloudEnabledStatusDidChange_ name:@"_UIDocumentPickerDescriptorCloudEnabledStatusDidChange" object:0];
}

- (void)_showTopLevelViewController
{
  v17[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(_UIDocumentPickerViewServiceViewController *)self currentPickerIdentifier];

  id v4 = [(_UIViewServiceViewController *)self containedNavController];
  id v5 = v4;
  if (v3)
  {
    [v4 setNavigationBarHidden:0];

    id v6 = objc_alloc_init(MEMORY[0x263F1CB68]);
    uint64_t v7 = [(_UIViewServiceViewController *)self containedNavController];
    v17[0] = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [v7 setViewControllers:v8 animated:0];

    uint64_t v9 = [v6 navigationItem];
    [(_UIDocumentPickerViewServiceViewController *)self setupNavigationItemForPicker:v9 isRoot:1];

    uint64_t v10 = [(_UIDocumentPickerViewServiceViewController *)self currentPickerIdentifier];
    [(_UIDocumentPickerViewServiceViewController *)self _showPicker:v10];
  }
  else
  {
    [v4 setNavigationBarHidden:1];

    int v11 = [_UIDocumentPickerOverviewViewController alloc];
    id v12 = [(_UIDocumentPickerViewServiceViewController *)self pickableTypes];
    unint64_t v13 = [(_UIDocumentPickerViewServiceViewController *)self pickerMode];
    v14 = [(_UIDocumentPickerViewServiceViewController *)self auxiliaryOptions];
    v16 = [(_UIDocumentPickerOverviewViewController *)v11 initWithFileTypes:v12 mode:v13 auxiliaryOptions:v14 includeManagementItem:1];

    [(_UIDocumentPickerOverviewViewController *)v16 setDelegate:self];
    [(_UIDocumentPickerViewServiceViewController *)self setDisplayedAsMenu:1];
    id v15 = [(_UIViewServiceViewController *)self containedNavController];
    [v15 pushViewController:v16 animated:0];
  }
}

- (void)setupNavigationItemForPicker:(id)a3 isRoot:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__doneButton_];
  [v18 setRightBarButtonItem:v6];
  unint64_t v7 = [(_UIDocumentPickerViewServiceViewController *)self pickerMode];
  id v8 = [(_UIDocumentPickerViewServiceViewController *)self pickableTypes];
  uint64_t v9 = +[_UIDocumentPickerDescriptor allPickersForMode:v7 documentTypes:v8];

  uint64_t v10 = +[_UIDocumentPickerDescriptor filteredPickersForPickers:v9 filter:0];
  uint64_t v11 = [v10 count];

  id v12 = +[_UIDocumentPickerDescriptor filteredPickersForPickers:v9 filter:1];
  uint64_t v13 = [v12 count];

  if (v4 && (v11 > 1 || v13 >= 1))
  {
    id v14 = objc_alloc(MEMORY[0x263F1C468]);
    id v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v16 = [v15 localizedStringForKey:@"Locations" value:@"Locations" table:@"Localizable"];
    id v17 = (void *)[v14 initWithTitle:v16 style:0 target:self action:sel__showLocationPopup_];

    [v18 setLeftBarButtonItem:v17];
  }
}

- (void)_showPicker:(id)a3
{
  v47[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_UIDocumentPickerViewServiceViewController *)self currentPicker];
  [(_UIDocumentPickerViewServiceViewController *)self setCurrentPicker:0];
  if ([v4 isEqualToString:*MEMORY[0x263F1D878]])
  {
    id v6 = [(_UIViewServiceViewController *)self containedNavController];
    [v6 setNavigationBarHidden:0];

    if ([(_UIDocumentPickerViewServiceViewController *)self pickerMode] == 2
      || [(_UIDocumentPickerViewServiceViewController *)self pickerMode] == 3)
    {
      BOOL v7 = [(_UIDocumentPickerViewServiceViewController *)self pickerMode] == 2;
      id v8 = [_UIDocumentTargetSelectionController alloc];
      uint64_t v9 = [(_UIDocumentPickerViewServiceViewController *)self uploadURL];
      uint64_t v10 = (void *)v9;
      if (v7)
      {
        v47[0] = v9;
        uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:1];
        uint64_t v12 = [(_UIDocumentTargetSelectionController *)v8 initForCopyWithItems:v11];
      }
      else
      {
        uint64_t v46 = v9;
        uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
        uint64_t v12 = [(_UIDocumentTargetSelectionController *)v8 initForCrossContainerMoveWithItemsToMove:v11];
      }
      id v14 = (_UIDocumentListController *)v12;

      [(_UIDocumentListController *)v14 setDelegate:self];
    }
    else
    {
      BOOL v28 = [_UIDocumentPickerRootContainerModel alloc];
      id v29 = [(_UIDocumentPickerViewServiceViewController *)self pickableTypes];
      id v30 = [(_UIDocumentPickerRootContainerModel *)v28 initWithPickableTypes:v29 mode:[(_UIDocumentPickerViewServiceViewController *)self pickerMode]];

      id v14 = [[_UIDocumentListController alloc] initWithModel:v30];
      [(_UIDocumentListController *)v14 setDelegate:self];
      [(_UIDocumentListController *)v14 setAvailableActions:0];
    }
    id v31 = [(_UIViewServiceViewController *)self containedNavController];
    v45 = v14;
    id v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
    [v31 setViewControllers:v32 animated:0];

    uint64_t v33 = [(_UIDocumentListController *)v14 navigationItem];
    [(_UIDocumentPickerViewServiceViewController *)self setupNavigationItemForPicker:v33 isRoot:1];

    [(_UIDocumentPickerViewServiceViewController *)self setCurrentPickerIdentifier:v4];
    [(_UIDocumentPickerViewServiceViewController *)self setCurrentPicker:v14];
  }
  else if ([v4 isEqualToString:@"_UIDocumentPickerUnavailableIdentifier"])
  {
    uint64_t v13 = [(_UIViewServiceViewController *)self containedNavController];
    [v13 setNavigationBarHidden:0];

    id v14 = objc_alloc_init(_UIDocumentPickerUnavailableViewController);
    id v15 = [(_UIDocumentListController *)v14 navigationItem];
    [(_UIDocumentPickerViewServiceViewController *)self setupNavigationItemForPicker:v15 isRoot:1];

    v16 = [(_UIViewServiceViewController *)self containedNavController];
    v44 = v14;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    [v16 setViewControllers:v17 animated:0];

    [(_UIDocumentPickerViewServiceViewController *)self setCurrentPickerIdentifier:v4];
  }
  else
  {
    id v18 = +[_UIDocumentPickerDescriptor descriptorWithIdentifier:v4];
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x3032000000;
    id v40 = __Block_byref_object_copy__3;
    v41 = __Block_byref_object_dispose__3;
    id v42 = 0;
    uint64_t v19 = (void *)MEMORY[0x263F1CD20];
    id v20 = [v18 extension];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __58___UIDocumentPickerViewServiceViewController__showPicker___block_invoke;
    v34[3] = &unk_26492D860;
    v34[4] = self;
    id v14 = v18;
    id v35 = v14;
    v36 = &v37;
    uint64_t v21 = [v19 instantiateWithExtension:v20 completion:v34];
    id v22 = (void *)v38[5];
    v38[5] = v21;

    [(id)v38[5] delayDisplayOfRemoteController];
    id v23 = [(id)v38[5] navigationItem];
    [(_UIDocumentPickerViewServiceViewController *)self setupNavigationItemForPicker:v23 isRoot:1];

    id v24 = [(_UIDocumentListController *)v14 localizedName];
    [(id)v38[5] setTitle:v24];

    id v25 = [(_UIViewServiceViewController *)self containedNavController];
    [v25 setNavigationBarHidden:0];

    id v26 = [(_UIViewServiceViewController *)self containedNavController];
    uint64_t v43 = v38[5];
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    [v26 setViewControllers:v27 animated:0];

    _Block_object_dispose(&v37, 8);
  }

  [(_UIDocumentPickerViewServiceViewController *)self _invalidatePicker:v5];
}

- (void)_didInstantiateThirdPartyPickerWithDescription:(id)a3 placeholder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 remoteViewController];
  uint64_t v9 = [v6 nonUIIdentifier];
  [v8 setPublicController:self];
  [v8 setIdentifier:v9];
  [v8 setEdgesForExtendedLayout:0];
  [(_UIDocumentPickerViewServiceViewController *)self setCurrentPicker:v8];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke;
  v25[3] = &unk_26492D888;
  v25[4] = self;
  uint64_t v10 = [v8 serviceViewControllerProxyWithErrorHandler:v25];
  if ([(_UIDocumentPickerViewServiceViewController *)self pickerMode] == 2
    || [(_UIDocumentPickerViewServiceViewController *)self pickerMode] == 3)
  {
    uint64_t v11 = (void *)MEMORY[0x263F1CC78];
    uint64_t v12 = [(_UIDocumentPickerViewServiceViewController *)self uploadURL];
    uint64_t v13 = [v11 wrapperWithURL:v12];
    [v10 _setUploadURLWrapper:v13];
  }
  id v14 = [(_UIDocumentPickerViewServiceViewController *)self pickableTypes];
  [v10 _setPickableTypes:v14];

  objc_msgSend(v10, "_setPickerMode:", -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode"));
  id v15 = [MEMORY[0x263F05448] sharedConnection];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_2;
  v20[3] = &unk_26492D8D8;
  v20[4] = self;
  id v21 = v6;
  id v22 = v9;
  id v23 = v10;
  id v24 = v7;
  id v16 = v7;
  id v17 = v10;
  id v18 = v9;
  id v19 = v6;
  [v15 providersCompletionHandler:v20];
}

- (void)_presentError:(id)a3 forThirdPartyPickerWithDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95___UIDocumentPickerViewServiceViewController__presentError_forThirdPartyPickerWithDescription___block_invoke;
  block[3] = &unk_26492CFE8;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  id v14 = self;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v10 = cdui_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[_UIDocumentPickerViewServiceViewController _presentError:forThirdPartyPickerWithDescription:]();
  }
}

- (void)_displayLocationsMenuFromRect:(CGRect)a3
{
}

- (void)_showLocationPopup:(id)a3
{
}

- (void)_showLocationPopupFromBarButtonItem:(id)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v19 = a3;
  id v9 = [_UIDocumentPickerOverviewViewController alloc];
  uint64_t v10 = [(_UIDocumentPickerViewServiceViewController *)self pickableTypes];
  uint64_t v11 = [(_UIDocumentPickerOverviewViewController *)v9 initWithFileTypes:v10 mode:[(_UIDocumentPickerViewServiceViewController *)self pickerMode] auxiliaryOptions:0 includeManagementItem:1];

  id v12 = [(_UIDocumentPickerViewServiceViewController *)self traitCollection];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if (v13 == 1)
  {
    [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:1];
    id v14 = v11;
    [(_UIPreferredContentSizeRelayingNavigationController *)v14 setModalPresentationStyle:7];
  }
  else
  {
    id v14 = [[_UIPreferredContentSizeRelayingNavigationController alloc] initWithRootViewController:v11];
    [(_UIPreferredContentSizeRelayingNavigationController *)v14 setModalPresentationStyle:100];
    [(_UIPreferredContentSizeRelayingNavigationController *)v14 setNavigationBarHidden:1];
  }
  [(_UIPreferredContentSizeRelayingNavigationController *)v14 setModalTransitionStyle:12];
  id v15 = [(_UIPreferredContentSizeRelayingNavigationController *)v14 popoverPresentationController];
  if (objc_opt_respondsToSelector())
  {
    id v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    id v17 = [v16 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
    [v15 setDismissActionTitle:v17];
  }
  [v15 setBarButtonItem:v19];
  objc_msgSend(v15, "setSourceRect:", x, y, width, height);
  id v18 = [(_UIDocumentPickerViewServiceViewController *)self view];
  [v15 setSourceView:v18];

  [v15 setPermittedArrowDirections:15];
  [(_UIDocumentPickerOverviewViewController *)v11 setDelegate:self];
  [(_UIDocumentPickerViewServiceViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (void)overviewController:(id)a3 selectedDocumentPickerWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 isEqualToString:@"__UIDocumentPickerManageIdentifier"];
  BOOL v9 = [(_UIDocumentPickerViewServiceViewController *)self displayedAsMenu];
  if (v8)
  {
    if (v9
      || ([(_UIDocumentPickerViewServiceViewController *)self traitCollection],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 userInterfaceIdiom],
          v10,
          v11 != 1))
    {
      uint64_t v13 = [_UIDocumentPickerManagementViewController alloc];
      id v14 = [(_UIDocumentPickerViewServiceViewController *)self pickableTypes];
      id v15 = [(_UIDocumentPickerManagementViewController *)v13 initWithFileTypes:v14 mode:[(_UIDocumentPickerViewServiceViewController *)self pickerMode]];

      id v16 = [(_UIDocumentPickerManagementViewController *)v15 navigationItem];
      [v16 setHidesBackButton:1];

      id v17 = [v6 navigationController];
      [v17 setNavigationBarHidden:0 animated:1];

      id v18 = [v6 navigationController];
      [v18 pushViewController:v15 animated:1];
    }
    else
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __102___UIDocumentPickerViewServiceViewController_overviewController_selectedDocumentPickerWithIdentifier___block_invoke;
      v21[3] = &unk_26492CC78;
      v21[4] = self;
      [(_UIDocumentPickerViewServiceViewController *)self dismissViewControllerAnimated:1 completion:v21];
    }
  }
  else if (v9)
  {
    [(_UIDocumentPickerViewServiceViewController *)self setCurrentPickerIdentifier:v7];
    id v12 = [(_UIDocumentPickerViewServiceViewController *)self hostingViewController];
    [v12 _didSelectPicker];

    [(_UIDocumentPickerViewServiceViewController *)self setDisplayedAsMenu:0];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __102___UIDocumentPickerViewServiceViewController_overviewController_selectedDocumentPickerWithIdentifier___block_invoke_2;
    v19[3] = &unk_26492CCC8;
    v19[4] = self;
    id v20 = v7;
    [(_UIDocumentPickerViewServiceViewController *)self dismissViewControllerAnimated:1 completion:v19];
  }
}

- (void)overviewController:(id)a3 selectedAuxiliaryOptionWithIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (([v6 isEqualToString:@"__UIDocumentPickerManageIdentifier"] & 1) != 0
    || [v6 isEqualToString:@"_UIDocumentPickerUnavailableIdentifier"])
  {
    [(_UIDocumentPickerViewServiceViewController *)self overviewController:v8 selectedDocumentPickerWithIdentifier:v6];
  }
  else
  {
    id v7 = [(_UIDocumentPickerViewServiceViewController *)self hostingViewController];
    [v7 _dismissWithOption:v6];
  }
}

- (CGSize)_updatedContentSizeForPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(_UIDocumentPickerViewServiceViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 1)
  {
    [(_UIDocumentPickerViewServiceViewController *)self preferredContentSize];
    if (v9 <= height) {
      double v9 = height;
    }
    if (v8 <= width) {
      double v8 = width;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIDocumentPickerViewServiceViewController;
    -[_UIViewServiceViewController _updatedContentSizeForPreferredContentSize:](&v10, sel__updatedContentSizeForPreferredContentSize_, width, height);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)_dismissViewController
{
}

- (void)_doneButton:(id)a3
{
  +[_UIDocumentPickerContainerItem clearLRUThumbnailCache];
  id v4 = [(_UIDocumentPickerViewServiceViewController *)self currentPicker];
  [(_UIDocumentPickerViewServiceViewController *)self _invalidatePicker:v4];

  [(_UIDocumentPickerViewServiceViewController *)self setCurrentPicker:0];

  [(_UIDocumentPickerViewServiceViewController *)self dismissWithURL:0 forBundleIdentifier:0];
}

- (void)_invalidatePicker:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_26E05DB68]) {
    [v3 invalidate];
  }
}

- (void)_didSelectURL:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [(_UIDocumentPickerViewServiceViewController *)self currentPicker];
    id v5 = [v4 identifier];
    [(_UIDocumentPickerViewServiceViewController *)self dismissWithURL:v6 forBundleIdentifier:v5];
  }
  else
  {
    [(_UIDocumentPickerViewServiceViewController *)self dismissWithURL:0 forBundleIdentifier:0];
  }
}

- (void)setNavigationItemSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIViewServiceViewController *)self containedNavController];
  id v6 = [v5 topViewController];
  id v14 = [v6 navigationItem];

  uint64_t v7 = (void *)MEMORY[0x263EFF980];
  double v8 = [v14 leftBarButtonItems];
  double v9 = [v7 arrayWithArray:v8];

  if (v3)
  {
    if (!self->_showingSpinner)
    {
      objc_super v10 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
      [v10 startAnimating];
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
      id v12 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v10];
      [v9 addObject:v11];
      [v9 addObject:v12];
      self->_showingSpinner = 1;
    }
  }
  else if (self->_showingSpinner)
  {
    [v9 removeLastObject];
    [v9 removeLastObject];
    self->_showingSpinner = 0;
  }
  [v14 setLeftBarButtonItems:v9];
  uint64_t v13 = [(_UIDocumentPickerViewServiceViewController *)self view];
  [v13 setUserInteractionEnabled:!v3];
}

+ (id)_urlByResolvingExternalDocumentReferenceForURL:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend(v4, "br_isExternalDocumentReference")) {
    goto LABEL_4;
  }
  id v11 = 0;
  id v5 = objc_msgSend(v4, "br_URLByResolvingExternalDocumentReferenceWithError:", &v11);
  id v6 = v11;
  if (v5)
  {
    uint64_t v7 = [a1 _logicalURLForPhysicalURL:v5];

    id v4 = (id)v7;
LABEL_4:
    id v4 = v4;
    double v8 = v4;
    goto LABEL_5;
  }
  objc_super v10 = cdui_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    +[_UIDocumentPickerViewServiceViewController _urlByResolvingExternalDocumentReferenceForURL:]();
  }

  double v8 = 0;
LABEL_5:

  return v8;
}

+ (id)_logicalURLForPhysicalURL:(id)a3
{
  id v3 = a3;
  if (v3 && _CFURLIsItemPromiseAtURL())
  {
    id v4 = (id)_CFURLCopyLogicalURLOfPromiseAtURL();
    if (!v4)
    {
      id v5 = cdui_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        +[_UIDocumentPickerViewServiceViewController _logicalURLForPhysicalURL:]();
      }
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (void)documentListController:(id)a3 didSelectItemAtURL:(id)a4
{
  id v5 = a4;
  id v6 = [(id)objc_opt_class() _urlByResolvingExternalDocumentReferenceForURL:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88___UIDocumentPickerViewServiceViewController_documentListController_didSelectItemAtURL___block_invoke;
  v8[3] = &unk_26492CCC8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  _UIDocumentListControllerPresentOSAlert(v7, self, v8, 0);
}

- (void)documentListController:(id)a3 didSelectContainerWithViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __106___UIDocumentPickerViewServiceViewController_documentListController_didSelectContainerWithViewController___block_invoke;
    v10[3] = &unk_26492CCC8;
    id v11 = v6;
    id v12 = self;
    [(_UIDocumentPickerViewServiceViewController *)self dismissViewControllerAnimated:1 completion:v10];
  }
  else
  {
    id v9 = [(_UIViewServiceViewController *)self containedNavController];
    [v9 pushViewController:v6 animated:1];
  }
}

- (void)documentTargetSelectionController:(id)a3 didSelectItemAtURL:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __99___UIDocumentPickerViewServiceViewController_documentTargetSelectionController_didSelectItemAtURL___block_invoke;
  v7[3] = &unk_26492CCC8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(_UIDocumentPickerViewServiceViewController *)self _warnSharingForTarget:v6 completion:v7];
}

- (void)pickLocationForUpload:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDocumentPickerViewServiceViewController *)self uploadURL];
  id v6 = [v5 lastPathComponent];
  id v7 = [v4 URLByAppendingPathComponent:v6];

  [(_UIDocumentPickerViewServiceViewController *)self _tryExportingFile:v5 toLocation:v7];
}

- (id)_mangledFilenameForURL:(id)a3
{
  id v3 = a3;
  BOOL v28 = [v3 URLByDeletingLastPathComponent];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v3 pathExtension];
  v27 = v3;
  id v6 = [v3 lastPathComponent];
  id v7 = [v6 stringByDeletingPathExtension];

  id v8 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v9 = [v7 rangeOfCharacterFromSet:v8 options:4];
  uint64_t v11 = v10;

  if (v9 + v11 != [v7 length])
  {
    id v12 = [v7 stringByAppendingString:@" 2"];

    uint64_t v13 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    uint64_t v9 = [v12 rangeOfCharacterFromSet:v13 options:4];
    uint64_t v11 = v14;

    id v7 = v12;
  }
  id v15 = objc_msgSend(v7, "substringWithRange:", v9, v11);
  uint64_t v16 = [v15 integerValue];

  id v17 = [v7 substringToIndex:v9];

  uint64_t v18 = v16 + 999;
  while (1)
  {
    id v19 = objc_msgSend(v17, "stringByAppendingFormat:", @"%li", v16);
    id v20 = [v19 stringByAppendingPathExtension:v5];

    id v21 = [v28 URLByAppendingPathComponent:v20];
    id v22 = [v21 path];
    int v23 = [v4 fileExistsAtPath:v22];

    if (!v23) {
      break;
    }

    if (v16++ >= v18)
    {
      id v25 = v27;
      id v20 = [v27 lastPathComponent];
      goto LABEL_8;
    }
  }
  id v25 = v27;
LABEL_8:

  return v20;
}

- (void)_showExistsAlertForFile:(id)a3 withSourceURL:(id)a4
{
  id v6 = a3;
  id v34 = a4;
  uint64_t v7 = [v6 lastPathComponent];
  id v8 = [v6 pathExtension];
  uint64_t v9 = NSString;
  uint64_t v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  uint64_t v11 = [v10 localizedStringForKey:@"This location already contains a file named %@" value:@"This location already contains a file named %@" table:@"Localizable"];
  uint64_t v33 = (void *)v7;
  uint64_t v12 = objc_msgSend(v9, "stringWithFormat:", v11, v7);

  unint64_t v13 = [(_UIDocumentPickerViewServiceViewController *)self pickerMode];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v15 = v14;
  if (v13 == 2) {
    uint64_t v16 = @"Would you like to rename the file you are about to export?";
  }
  else {
    uint64_t v16 = @"Would you like to rename the file you are about to move?";
  }
  uint64_t v17 = [v14 localizedStringForKey:v16 value:v16 table:@"Localizable"];

  id v31 = (void *)v17;
  id v32 = (void *)v12;
  uint64_t v18 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v12 message:v17 preferredStyle:1];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke;
  v43[3] = &unk_26492D950;
  v43[4] = self;
  id v19 = v6;
  id v44 = v19;
  [v18 addTextFieldWithConfigurationHandler:v43];
  objc_initWeak(&location, v18);
  id v20 = (void *)MEMORY[0x263F1C3F0];
  id v21 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v22 = [v21 localizedStringForKey:@"Rename" value:@"Rename" table:@"Localizable"];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke_2;
  v36[3] = &unk_26492D978;
  objc_copyWeak(&v41, &location);
  id v23 = v8;
  id v37 = v23;
  id v24 = v19;
  id v38 = v24;
  uint64_t v39 = self;
  id v25 = v34;
  id v40 = v25;
  id v26 = [v20 actionWithTitle:v22 style:0 handler:v36];
  [v18 addAction:v26];

  v27 = (void *)MEMORY[0x263F1C3F0];
  BOOL v28 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v29 = [v28 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke_3;
  v35[3] = &unk_26492D528;
  v35[4] = self;
  id v30 = [v27 actionWithTitle:v29 style:1 handler:v35];
  [v18 addAction:v30];

  [(_UIDocumentPickerViewServiceViewController *)self presentViewController:v18 animated:1 completion:&__block_literal_global_215];
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)_tryExportingFile:(id)a3 toLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  id v37 = __Block_byref_object_dispose__3;
  id v38 = 0;
  id v8 = objc_alloc_init(MEMORY[0x263F08830]);
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = [v7 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    [(_UIDocumentPickerViewServiceViewController *)self _showExistsAlertForFile:v7 withSourceURL:v6];
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v13 = [(_UIDocumentPickerViewServiceViewController *)self hostingViewController];
    [v13 _stitchFileCreationAtURL:v7];

    if ([(_UIDocumentPickerViewServiceViewController *)self pickerMode] == 3)
    {
      uint64_t v32 = 0;
      uint64_t v14 = v31;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke;
      v31[3] = &unk_26492D9A0;
      v31[4] = v9;
      v31[5] = &v33;
      id v15 = (id *)&v32;
      [v8 coordinateWritingItemAtURL:v6 options:2 writingItemAtURL:v7 options:0 error:&v32 byAccessor:v31];
    }
    else
    {
      uint64_t v30 = 0;
      uint64_t v14 = v29;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke_2;
      v29[3] = &unk_26492D9A0;
      v29[4] = v9;
      v29[5] = &v33;
      id v15 = (id *)&v30;
      [v8 coordinateReadingItemAtURL:v6 options:0 writingItemAtURL:v7 options:0 error:&v30 byAccessor:v29];
    }
    unint64_t v12 = (unint64_t)*v15;

    unint64_t v16 = v34[5];
    if (v12 | v16)
    {
      uint64_t v17 = [(id)v16 domain];
      if ([v17 isEqualToString:*MEMORY[0x263F07F70]])
      {
        uint64_t v18 = [(id)v34[5] code];

        if (v18 == 516)
        {
          [(_UIDocumentPickerViewServiceViewController *)self _showExistsAlertForFile:v7 withSourceURL:v6];
          goto LABEL_13;
        }
      }
      else
      {
      }
      id v19 = (void *)MEMORY[0x263F1C3F8];
      id v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      id v21 = [v20 localizedStringForKey:@"Copying file failed" value:@"Copying file failed" table:@"Localizable"];
      id v22 = [(id)v12 localizedDescription];
      id v23 = [v19 alertControllerWithTitle:v21 message:v22 preferredStyle:1];

      id v24 = (void *)MEMORY[0x263F1C3F0];
      id v25 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      id v26 = [v25 localizedStringForKey:@"Dismiss" value:@"Dismiss" table:@"Localizable"];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke_3;
      v28[3] = &unk_26492D528;
      v28[4] = self;
      v27 = [v24 actionWithTitle:v26 style:0 handler:v28];
      [v23 addAction:v27];

      [(_UIDocumentPickerViewServiceViewController *)self presentViewController:v23 animated:1 completion:&__block_literal_global_223];
      goto LABEL_13;
    }
    [(_UIDocumentPickerViewServiceViewController *)self dismissWithURL:v7 forBundleIdentifier:0];
    unint64_t v12 = 0;
  }
LABEL_13:

  _Block_object_dispose(&v33, 8);
}

- (BOOL)_shouldWarnForSharing
{
  if ([(_UIDocumentPickerViewServiceViewController *)self pickerMode] == 3)
  {
    id v3 = [(_UIDocumentPickerViewServiceViewController *)self uploadURL];
    id v8 = 0;
    int v4 = [v3 getPromisedItemResourceValue:&v8 forKey:*MEMORY[0x263EFF7D0] error:0];
    id v5 = v8;
    id v6 = v5;
    if (v4) {
      LOBYTE(v4) = [v5 BOOLValue];
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_warnSharingPreMove
{
  if ([(_UIDocumentPickerViewServiceViewController *)self _shouldWarnForSharing])
  {
    id v3 = cdui_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22CA47000, v3, OS_LOG_TYPE_INFO, "[INFO] we're in move mode and the file is shared", buf, 2u);
    }

    int v4 = [(_UIDocumentPickerViewServiceViewController *)self uploadURL];
    id v17 = 0;
    int v5 = [v4 getPromisedItemResourceValue:&v17 forKey:*MEMORY[0x263EFF830] error:0];
    id v6 = v17;

    if (!v5) {
      goto LABEL_11;
    }
    id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    id v8 = [v7 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];

    if ([v6 isEqualToString:*MEMORY[0x263EFF840]])
    {
      uint64_t v9 = cdui_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22CA47000, v9, OS_LOG_TYPE_INFO, "[INFO] presenting can't-move alert for participant", buf, 2u);
      }

      uint64_t v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      int v11 = [v10 localizedStringForKey:@"You cannot move this document" value:@"You cannot move this document" table:@"Localizable"];

      unint64_t v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      unint64_t v13 = [v12 localizedStringForKey:@"This document has been shared to you. You cannot move it to a different location." value:@"This document has been shared to you. You cannot move it to a different location." table:@"Localizable"];

      uint64_t v14 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v11 message:v13 preferredStyle:1];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __65___UIDocumentPickerViewServiceViewController__warnSharingPreMove__block_invoke;
      v16[3] = &unk_26492D528;
      v16[4] = self;
      id v15 = [MEMORY[0x263F1C3F0] actionWithTitle:v8 style:1 handler:v16];
      [v14 addAction:v15];

      if (!v14) {
        goto LABEL_11;
      }
      [(_UIDocumentPickerViewServiceViewController *)self presentViewController:v14 animated:1 completion:0];
      id v8 = v14;
    }

LABEL_11:
  }
}

- (void)_warnSharingForTarget:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(_UIDocumentPickerViewServiceViewController *)self _shouldWarnForSharing])
  {
    id v8 = cdui_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22CA47000, v8, OS_LOG_TYPE_INFO, "[INFO] We're in move mode and the file is shared", buf, 2u);
    }

    uint64_t v9 = [(_UIDocumentPickerViewServiceViewController *)self uploadURL];
    id v34 = 0;
    __int16 v10 = objc_msgSend(v9, "br_capabilityToMoveToURL:error:", v6, &v34);
    id v11 = v34;

    if ((v10 & 0x204) != 0)
    {
      unint64_t v12 = [(_UIDocumentPickerViewServiceViewController *)self uploadURL];
      id v33 = 0;
      int v13 = [v12 getPromisedItemResourceValue:&v33 forKey:*MEMORY[0x263EFF830] error:0];
      uint64_t v14 = v33;

      if (v13)
      {
        id v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        unint64_t v16 = [v15 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];

        if ([v14 isEqualToString:*MEMORY[0x263EFF838]])
        {
          id v29 = v16;
          id v17 = cdui_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22CA47000, v17, OS_LOG_TYPE_INFO, "[INFO] presenting share-will-break alert for owner", buf, 2u);
          }

          uint64_t v18 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          BOOL v28 = [v18 localizedStringForKey:@"Moving this document will unshare it" value:@"Moving this document will unshare it" table:@"Localizable"];

          id v19 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          id v20 = [v19 localizedStringForKey:@"This document is shared. Moving it to a different location will stop sharing the document. You can share again from the new location." value:@"This document is shared. Moving it to a different location will stop sharing the document. You can share again from the new location." table:@"Localizable"];

          id v21 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          id v22 = [v21 localizedStringForKey:@"Move and stop sharing" value:@"Move and stop sharing" table:@"Localizable"];

          id v23 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v28 message:v20 preferredStyle:1];
          id v24 = (void *)MEMORY[0x263F1C3F0];
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __79___UIDocumentPickerViewServiceViewController__warnSharingForTarget_completion___block_invoke;
          v31[3] = &unk_26492CD88;
          uint64_t v32 = v7;
          id v25 = [v24 actionWithTitle:v22 style:2 handler:v31];
          [v23 addAction:v25];

          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __79___UIDocumentPickerViewServiceViewController__warnSharingForTarget_completion___block_invoke_239;
          v30[3] = &unk_26492D528;
          v30[4] = self;
          id v26 = [MEMORY[0x263F1C3F0] actionWithTitle:v29 style:1 handler:v30];
          [v23 addAction:v26];

          if (v23)
          {
            [(_UIDocumentPickerViewServiceViewController *)self presentViewController:v23 animated:1 completion:0];

LABEL_21:
            goto LABEL_22;
          }
LABEL_20:
          v7[2](v7);
          goto LABEL_21;
        }
        if (([v14 isEqualToString:*MEMORY[0x263EFF840]] & 1) == 0)
        {
          v27 = cdui_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v14;
            _os_log_impl(&dword_22CA47000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving a file, but we're neither participant nor owner? (role is %@)", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      uint64_t v14 = cdui_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22CA47000, v14, OS_LOG_TYPE_INFO, "[INFO] ...but we can move the file around between these locations", buf, 2u);
      }
    }

    goto LABEL_20;
  }
  v7[2](v7);
LABEL_22:
}

- (NSArray)pickableTypes
{
  return self->_pickableTypes;
}

- (void)_setPickableTypes:(id)a3
{
}

- (unint64_t)pickerMode
{
  return self->_pickerMode;
}

- (void)_setPickerMode:(unint64_t)a3
{
  self->_pickerMode = a3;
}

- (NSURL)uploadURL
{
  return self->_uploadURL;
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
}

- (NSArray)auxiliaryOptions
{
  return self->_auxiliaryOptions;
}

- (void)_setAuxiliaryOptions:(id)a3
{
}

- (NSString)currentPickerIdentifier
{
  return self->_currentPickerIdentifier;
}

- (void)setCurrentPickerIdentifier:(id)a3
{
}

- (BOOL)displayedAsMenu
{
  return self->_displayedAsMenu;
}

- (void)setDisplayedAsMenu:(BOOL)a3
{
  self->_displayedAsMenu = a3;
}

- (BOOL)hasBeenDismissed
{
  return self->_hasBeenDismissed;
}

- (void)setHasBeenDismissed:(BOOL)a3
{
  self->_hasBeenDismissed = a3;
}

- (BOOL)showingSpinner
{
  return self->_showingSpinner;
}

- (void)setShowingSpinner:(BOOL)a3
{
  self->_showingSpinner = a3;
}

- (UIViewController)currentPicker
{
  return self->_currentPicker;
}

- (void)setCurrentPicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPicker, 0);
  objc_storeStrong((id *)&self->_currentPickerIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptions, 0);
  objc_storeStrong((id *)&self->_uploadURL, 0);

  objc_storeStrong((id *)&self->_pickableTypes, 0);
}

- (void)_setUploadURL:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_22CA47000, v0, v1, "[ERROR] ...but we have sandbox access and the file exists", v2, v3, v4, v5, v6);
}

- (void)_setUploadURL:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_22CA47000, v0, v1, "[ERROR] ...we have sandbox access but the file doesn't exist", v2, v3, v4, v5, v6);
}

- (void)_setUploadURL:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_22CA47000, v0, v1, "[ERROR] ...nor a sec scope", v2, v3, v4, v5, v6);
}

- (void)_setUploadURL:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_22CA47000, v0, v1, "[ERROR] ...even though the url has a sec scope (%@)", v2, v3, v4, v5, v6);
}

- (void)_setUploadURL:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_22CA47000, v0, v1, "[ERROR] ...and we don't have sandbox access", v2, v3, v4, v5, v6);
}

- (void)_setUploadURL:(uint64_t)a3 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_waitForDownloadOfURL:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22CA47000, v0, v1, "[ERROR] Couldn't get file size for %@: %@");
}

- (void)_presentError:forThirdPartyPickerWithDescription:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_22CA47000, v0, v1, "[ERROR] 3rd party doc picker failed to launch with error %@", v2, v3, v4, v5, v6);
}

+ (void)_urlByResolvingExternalDocumentReferenceForURL:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22CA47000, v0, v1, "[ERROR] error resolving external document reference for url %@: %@");
}

+ (void)_logicalURLForPhysicalURL:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_22CA47000, v0, v1, "[ERROR] error copying logical url of promise at url %@: %@");
}

@end