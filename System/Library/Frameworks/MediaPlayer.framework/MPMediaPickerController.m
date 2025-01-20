@interface MPMediaPickerController
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasAddedRemoteView;
- (BOOL)allowsPickingMultipleItems;
- (BOOL)pickingForExternalPlayer;
- (BOOL)picksSingleCollectionEntity;
- (BOOL)showsCatalogContent;
- (BOOL)showsCloudItems;
- (BOOL)showsItemsWithProtectedAssets;
- (BOOL)showsLibraryContent;
- (BOOL)supportsUnavailableContent;
- (MPMediaPickerController)initWithCoder:(id)a3;
- (MPMediaPickerController)initWithConfiguration:(id)a3;
- (MPMediaPickerController)initWithMediaTypes:(MPMediaType)mediaTypes;
- (MPMediaPickerController)initWithNibName:(id)a3 bundle:(id)a4;
- (MPMediaPickerController)initWithSupportedTypeIdentifiers:(id)a3 selectionMode:(int64_t)a4;
- (MPMediaPickerRemoteViewLoader)loader;
- (MPMediaType)mediaTypes;
- (NSString)prompt;
- (id)configuration;
- (id)delegate;
- (id)playbackArchiveConfiguration;
- (id)typeIdentifiers;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)modalPresentationStyle;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)selectionMode;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)watchCompatibilityVersion;
- (void)_addRemoteView;
- (void)_checkLibraryAuthorization;
- (void)_forceDismissal;
- (void)_pickerDidCancel;
- (void)_pickerDidPickItems:(id)a3;
- (void)_pickerDidPickPlaybackArchive:(id)a3;
- (void)_sharedInit;
- (void)_synchronizeSettings;
- (void)setAllowsPickingMultipleItems:(BOOL)allowsPickingMultipleItems;
- (void)setDelegate:(id)delegate;
- (void)setLoader:(id)a3;
- (void)setPickingForExternalPlayer:(BOOL)a3;
- (void)setPicksSingleCollectionEntity:(BOOL)a3;
- (void)setPlaybackArchiveConfiguration:(id)a3;
- (void)setPrompt:(NSString *)prompt;
- (void)setShowsCatalogContent:(BOOL)a3;
- (void)setShowsCloudItems:(BOOL)showsCloudItems;
- (void)setShowsItemsWithProtectedAssets:(BOOL)showsItemsWithProtectedAssets;
- (void)setShowsLibraryContent:(BOOL)a3;
- (void)setSupportsUnavailableContent:(BOOL)a3;
- (void)setWatchCompatibilityVersion:(unsigned int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MPMediaPickerController

void __60__MPMediaPickerController_Appex_requestRemoteViewController__block_invoke_191(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"MPMediaPickerController.m" lineNumber:523 description:@"remoteViewController cannot be nil -- process will crash inserting in hierarchy. We likely got a nil remoteViewController because Music is crashing."];
  }
  [v7 setMediaPickerController:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a3);
  [*(id *)(a1 + 32) synchronizeSettings];
  [*(id *)(a1 + 40) addChildViewController:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  if ([*(id *)(a1 + 40) isViewLoaded])
  {
    v9 = [*(id *)(a1 + 40) view];
    v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) view];
    [v9 addSubview:v10];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) didMoveToParentViewController:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) endDelayingDisplayOfRemoteController];
  [*(id *)(a1 + 40) _endDelayingPresentation];
}

uint64_t __60__MPMediaPickerController_Appex_requestRemoteViewController__block_invoke()
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setLoader:(id)a3
{
}

- (MPMediaPickerRemoteViewLoader)loader
{
  return self->_loader;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)_checkLibraryAuthorization
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__MPMediaPickerController__checkLibraryAuthorization__block_invoke;
  v2[3] = &unk_1E57F3380;
  v2[4] = self;
  +[MPMediaLibrary requestAuthorization:v2];
}

void __53__MPMediaPickerController__checkLibraryAuthorization__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 3)
  {
    uint64_t v8 = v2;
    uint64_t v9 = v3;
    v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "Media library access is not authorized. Users need to grant media library access for your app in Settings > Privacy to interact with MPMediaPickerController. Dismissing.", v7, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MPMediaPickerController__checkLibraryAuthorization__block_invoke_99;
    block[3] = &unk_1E57F9EA8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __53__MPMediaPickerController__checkLibraryAuthorization__block_invoke_99(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forceDismissal];
}

- (void)_synchronizeSettings
{
  if ([(MPMediaPickerController *)self _hasAddedRemoteView])
  {
    loader = self->_loader;
    [(MPMediaPickerRemoteViewLoader *)loader synchronizeSettings];
  }
}

- (void)_addRemoteView
{
  uint64_t v3 = [(MPMediaPickerRemoteViewLoader *)self->_loader remoteViewController];
  if (v3)
  {
    v4 = (void *)v3;
    int v5 = [(MPMediaPickerController *)self isViewLoaded];

    if (v5)
    {
      v6 = [(MPMediaPickerRemoteViewLoader *)self->_loader remoteViewController];
      id v10 = [v6 view];

      id v7 = [MEMORY[0x1E4FB1618] whiteColor];
      [v10 setBackgroundColor:v7];

      [(MPMediaPickerRemoteViewLoader *)self->_loader synchronizeSettings];
      uint64_t v8 = [(MPMediaPickerController *)self view];
      [v8 addSubview:v10];

      uint64_t v9 = [(MPMediaPickerController *)self view];
      [v9 bounds];
      objc_msgSend(v10, "setFrame:");

      [v10 setAutoresizingMask:18];
    }
  }
}

- (BOOL)_hasAddedRemoteView
{
  uint64_t v3 = [(MPMediaPickerRemoteViewLoader *)self->_loader remoteViewController];
  if (v3
    && [(MPMediaPickerController *)self isViewLoaded]
    && [v3 isViewLoaded])
  {
    v4 = [v3 view];
    int v5 = [v4 superview];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_pickerDidPickPlaybackArchive:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained conformsToProtocol:&unk_1EE78DEC8]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained mediaPicker:self didPickPlaybackArchive:v5];
  }
  else
  {
    [(MPMediaPickerController *)self _forceDismissal];
  }
}

- (void)_pickerDidPickItems:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained mediaPicker:self didPickMediaItems:v5];
  }
  else {
    [(MPMediaPickerController *)self _forceDismissal];
  }
}

- (void)_pickerDidCancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained mediaPickerDidCancel:self];
  }
  else {
    [(MPMediaPickerController *)self _forceDismissal];
  }
}

- (void)_forceDismissal
{
  id v2 = [(MPMediaPickerController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)setPlaybackArchiveConfiguration:(id)a3
{
  id v6 = a3;
  id v4 = [(MPMediaPickerConfiguration *)self->_configuration playbackArchiveConfiguration];

  id v5 = v6;
  if (v4 != v6)
  {
    [(MPMediaPickerConfiguration *)self->_configuration setPlaybackArchiveConfiguration:v6];
    [(MPMediaPickerController *)self _synchronizeSettings];
    id v5 = v6;
  }
}

- (id)playbackArchiveConfiguration
{
  return [(MPMediaPickerConfiguration *)self->_configuration playbackArchiveConfiguration];
}

- (void)setPickingForExternalPlayer:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MPMediaPickerConfiguration *)self->_configuration pickingForExternalPlayer] != a3)
  {
    [(MPMediaPickerConfiguration *)self->_configuration setPickingForExternalPlayer:v3];
    [(MPMediaPickerController *)self _synchronizeSettings];
  }
}

- (BOOL)pickingForExternalPlayer
{
  return [(MPMediaPickerConfiguration *)self->_configuration pickingForExternalPlayer];
}

- (void)setSupportsUnavailableContent:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MPMediaPickerConfiguration *)self->_configuration supportsUnavailableContent] != a3)
  {
    [(MPMediaPickerConfiguration *)self->_configuration setSupportsUnavailableContent:v3];
    [(MPMediaPickerController *)self _synchronizeSettings];
  }
}

- (BOOL)supportsUnavailableContent
{
  return [(MPMediaPickerConfiguration *)self->_configuration supportsUnavailableContent];
}

- (void)setShowsLibraryContent:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MPMediaPickerConfiguration *)self->_configuration showsLibraryContent] != a3)
  {
    [(MPMediaPickerConfiguration *)self->_configuration setShowsLibraryContent:v3];
    [(MPMediaPickerController *)self _synchronizeSettings];
  }
}

- (BOOL)showsLibraryContent
{
  return [(MPMediaPickerConfiguration *)self->_configuration showsLibraryContent];
}

- (void)setShowsCatalogContent:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MPMediaPickerConfiguration *)self->_configuration showsCatalogContent] != a3)
  {
    [(MPMediaPickerConfiguration *)self->_configuration setShowsCatalogContent:v3];
    [(MPMediaPickerController *)self _synchronizeSettings];
  }
}

- (BOOL)showsCatalogContent
{
  return [(MPMediaPickerConfiguration *)self->_configuration showsCatalogContent];
}

- (int64_t)selectionMode
{
  return [(MPMediaPickerConfiguration *)self->_configuration selectionMode];
}

- (id)typeIdentifiers
{
  return [(MPMediaPickerConfiguration *)self->_configuration typeIdentifiers];
}

- (void)setWatchCompatibilityVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(MPMediaPickerConfiguration *)self->_configuration watchCompatibilityVersion] != a3)
  {
    [(MPMediaPickerConfiguration *)self->_configuration setWatchCompatibilityVersion:v3];
    [(MPMediaPickerController *)self _synchronizeSettings];
  }
}

- (unsigned)watchCompatibilityVersion
{
  return [(MPMediaPickerConfiguration *)self->_configuration watchCompatibilityVersion];
}

- (void)setPicksSingleCollectionEntity:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MPMediaPickerConfiguration *)self->_configuration picksSingleCollectionEntity] != a3)
  {
    if ([(MPMediaPickerConfiguration *)self->_configuration allowsPickingMultipleItems]) {
      BOOL v5 = !v3;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      [(MPMediaPickerConfiguration *)self->_configuration setPicksSingleCollectionEntity:v3];
      [(MPMediaPickerController *)self _synchronizeSettings];
    }
    else
    {
      id v6 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "setPicksSingleCollectionEntity mutually-exclusive with setAllowsPickingMultipleItems", v8, 2u);
      }
    }
  }
}

- (BOOL)picksSingleCollectionEntity
{
  return [(MPMediaPickerConfiguration *)self->_configuration picksSingleCollectionEntity];
}

- (id)configuration
{
  return self->_configuration;
}

- (void)setShowsItemsWithProtectedAssets:(BOOL)showsItemsWithProtectedAssets
{
  BOOL v3 = showsItemsWithProtectedAssets;
  if ([(MPMediaPickerConfiguration *)self->_configuration showsItemsWithProtectedAssets] != showsItemsWithProtectedAssets)
  {
    [(MPMediaPickerConfiguration *)self->_configuration setShowsItemsWithProtectedAssets:v3];
    [(MPMediaPickerController *)self _synchronizeSettings];
  }
}

- (BOOL)showsItemsWithProtectedAssets
{
  return [(MPMediaPickerConfiguration *)self->_configuration showsItemsWithProtectedAssets];
}

- (void)setShowsCloudItems:(BOOL)showsCloudItems
{
  BOOL v3 = showsCloudItems;
  if ([(MPMediaPickerConfiguration *)self->_configuration showsCloudItems] != showsCloudItems)
  {
    [(MPMediaPickerConfiguration *)self->_configuration setShowsCloudItems:v3];
    [(MPMediaPickerController *)self _synchronizeSettings];
  }
}

- (BOOL)showsCloudItems
{
  return [(MPMediaPickerConfiguration *)self->_configuration showsCloudItems];
}

- (void)setAllowsPickingMultipleItems:(BOOL)allowsPickingMultipleItems
{
  BOOL v3 = allowsPickingMultipleItems;
  if ([(MPMediaPickerConfiguration *)self->_configuration allowsPickingMultipleItems] != allowsPickingMultipleItems)
  {
    if (v3
      && [(MPMediaPickerConfiguration *)self->_configuration picksSingleCollectionEntity])
    {
      BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "setAllowsPickingMultipleItems mutually-exclusive with setPicksSingleCollectionEntity", v6, 2u);
      }
    }
    else
    {
      [(MPMediaPickerConfiguration *)self->_configuration setAllowsPickingMultipleItems:v3];
      [(MPMediaPickerController *)self _synchronizeSettings];
    }
  }
}

- (BOOL)allowsPickingMultipleItems
{
  return [(MPMediaPickerConfiguration *)self->_configuration allowsPickingMultipleItems];
}

- (void)setPrompt:(NSString *)prompt
{
  id v6 = prompt;
  id v4 = [(MPMediaPickerConfiguration *)self->_configuration prompt];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(MPMediaPickerConfiguration *)self->_configuration setPrompt:v6];
    [(MPMediaPickerController *)self _synchronizeSettings];
  }
}

- (NSString)prompt
{
  return [(MPMediaPickerConfiguration *)self->_configuration prompt];
}

- (MPMediaType)mediaTypes
{
  return [(MPMediaPickerConfiguration *)self->_configuration mediaTypes];
}

- (int64_t)_preferredModalPresentationStyle
{
  return 1;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController;
  return [(MPMediaPickerController *)&v6 preferredInterfaceOrientationForPresentation];
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 2;
  }
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController;
  return [(MPMediaPickerController *)&v6 supportedInterfaceOrientations];
}

- (int64_t)modalPresentationStyle
{
  BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController;
  return [(MPMediaPickerController *)&v6 modalPresentationStyle];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPMediaPickerController;
  [(MPMediaPickerController *)&v4 viewDidAppear:a3];
  [(MPMediaPickerController *)self _checkLibraryAuthorization];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MPMediaPickerRemoteViewLoader *)self->_loader synchronizeSettings];
  v5.receiver = self;
  v5.super_class = (Class)MPMediaPickerController;
  [(MPMediaPickerController *)&v5 viewWillAppear:v3];
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)MPMediaPickerController;
  [(MPMediaPickerController *)&v26 viewDidLoad];
  if (![(MPMediaPickerController *)self showsLibraryContent]
    && ![(MPMediaPickerController *)self showsCatalogContent])
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MPMediaPickerController.m" lineNumber:148 description:@"showsLibraryContent and showsCatalogContent can't both be NO."];
  }
  objc_super v4 = [(MPMediaPickerController *)self view];
  objc_super v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 setBackgroundColor:v5];

  [(MPMediaPickerController *)self _addRemoteView];
  if (!self->_loader)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    uint64_t v8 = [v7 localizedStringForKey:@"MEDIAPICKER_NAVIGATION_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];
    [v6 setTitle:v8];

    v25 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
    uint64_t v9 = [v6 navigationItem];
    id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    id v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_1EE680640 table:@"MediaPlayer"];
    v13 = (void *)[v10 initWithTitle:v12 style:0 target:self action:sel__pickerDidCancel];

    [v9 setLeftBarButtonItem:v13];
    id v14 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v16 = [v15 localizedStringForKey:@"DONE" value:&stru_1EE680640 table:@"MediaPlayer"];
    v17 = (void *)[v14 initWithTitle:v16 style:0 target:0 action:0];

    [v17 setEnabled:0];
    [v9 setRightBarButtonItem:v17];
    id v18 = v25;
    [(MPMediaPickerController *)self addChildViewController:v18];
    v19 = [(MPMediaPickerController *)self view];
    v20 = [v18 view];
    [v19 addSubview:v20];

    [v18 didMoveToParentViewController:self];
    v21 = [v18 view];
    v22 = [(MPMediaPickerController *)self view];
    [v22 bounds];
    objc_msgSend(v21, "setFrame:");

    v23 = [v18 view];

    [v23 setAutoresizingMask:18];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "MPMediaPickerController must be presented modally.", buf, 2u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController;
  [(MPMediaPickerController *)&v6 willMoveToParentViewController:v4];
}

- (MPMediaPickerController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMediaPickerController;
  objc_super v6 = [(MPMediaPickerController *)&v9 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(MPMediaPickerController *)v7 _sharedInit];
  }

  return v7;
}

- (MPMediaPickerController)initWithSupportedTypeIdentifiers:(id)a3 selectionMode:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MPMediaPickerConfiguration);
  [(MPMediaPickerConfiguration *)v7 setTypeIdentifiers:v6];

  [(MPMediaPickerConfiguration *)v7 setSelectionMode:a4];
  uint64_t v8 = [(MPMediaPickerController *)self initWithConfiguration:v7];

  return v8;
}

- (MPMediaPickerController)initWithMediaTypes:(MPMediaType)mediaTypes
{
  MPMediaType v3 = mediaTypes;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!(_BYTE)mediaTypes)
  {
    id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      MPMediaType v12 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "Unsupported media types (%ld), using MPMediaTypeAny.", buf, 0xCu);
    }

    MPMediaType v3 = -1;
  }
  id v6 = objc_alloc_init(MPMediaPickerConfiguration);
  [(MPMediaPickerConfiguration *)v6 setMediaTypes:v3];
  v10.receiver = self;
  v10.super_class = (Class)MPMediaPickerController;
  id v7 = [(MPMediaPickerController *)&v10 initWithNibName:0 bundle:0];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_configuration, v6);
    [(MPMediaPickerController *)v8 _sharedInit];
  }

  return v8;
}

- (void)_sharedInit
{
  -[MPMediaPickerController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, 568.0);
  MPMediaType v3 = objc_alloc_init(MPMediaPickerController_Appex);
  loader = self->_loader;
  self->_loader = (MPMediaPickerRemoteViewLoader *)v3;

  [(MPMediaPickerRemoteViewLoader *)self->_loader setMediaPickerController:self];
  id v5 = self->_loader;

  [(MPMediaPickerRemoteViewLoader *)v5 requestRemoteViewController];
}

- (MPMediaPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MPMediaPickerController initWithMediaTypes:](self, "initWithMediaTypes:", -1, a4);
}

- (MPMediaPickerController)initWithCoder:(id)a3
{
  return [(MPMediaPickerController *)self initWithMediaTypes:-1];
}

@end