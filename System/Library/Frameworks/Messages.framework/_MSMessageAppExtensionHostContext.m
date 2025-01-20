@interface _MSMessageAppExtensionHostContext
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (id)_extensionContextHostProtocolAllowedClassesForItems;
- (_MSMessageComposeHostProtocol)delegate;
- (void)_canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4;
- (void)_contentDidLoad;
- (void)_dismiss;
- (void)_dismissAndPresentPhotosApp;
- (void)_dragMediaItemCanceled;
- (void)_dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7;
- (void)_openURL:(id)a3 completionHandler:(id)a4;
- (void)_presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5;
- (void)_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7;
- (void)_presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6;
- (void)_remoteViewDidBecomeReadyForDisplay;
- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap;
- (void)_remoteViewProvidesExplicitSizeSnapshot;
- (void)_removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3;
- (void)_requestHostSceneIdentifierWithCompletion:(id)a3;
- (void)_requestPresentationStyle:(unint64_t)a3;
- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4;
- (void)_requestResize;
- (void)_requestStickerExtensionMetadataDictionary:(id)a3;
- (void)_showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)_stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6;
- (void)_stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6;
- (void)_stickerDruidDragEndedWithPayload:(id)a3;
- (void)_stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4;
- (void)_stickerDruidDragStarted;
- (void)_updateSnapshotForNextLaunch:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _MSMessageAppExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E4F29280], "__mf_messageComposerExtensionInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E4F29280], "__mf_messageComposerHostInterface");
}

+ (id)_extensionContextHostProtocolAllowedClassesForItems
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88___MSMessageAppExtensionHostContext__extensionContextHostProtocolAllowedClassesForItems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_extensionContextHostProtocolAllowedClassesForItems_onceToken_0 != -1) {
    dispatch_once(&_extensionContextHostProtocolAllowedClassesForItems_onceToken_0, block);
  }
  v2 = (void *)_extensionContextHostProtocolAllowedClassesForItems_allowedClasses_0;

  return v2;
}

+ (id)_allowedItemPayloadClasses
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (void)_stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 _stageAppItem:v13 skipShelf:v6 completionHandler:v8];
  }
}

- (void)_stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v15 = a3;
  id v10 = a6;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)p_delegate);
    [v14 _stageMediaItem:v15 skipShelf:v8 forceStage:v7 completionHandler:v10];
  }
}

- (void)_stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 _stageRichLink:v13 skipShelf:v6 completionHandler:v8];
  }
}

- (void)_startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v19 = a3;
  id v13 = a5;
  id v14 = a6;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v18, "_startDragMediaItem:frameInRemoteView:fence:completionHandler:", v19, v13, v14, x, y, width, height);
  }
}

- (void)_dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v20 = a3;
  id v15 = a7;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v19, "_dragMediaItemMoved:frameInRemoteView:rotation:scale:completionHandler:", v20, v15, x, y, width, height, a5, a6);
  }
}

- (void)_dragMediaItemCanceled
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _dragMediaItemCanceled];
  }
}

- (void)_stickerDruidDragStarted
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _stickerDruidDragStarted];
  }
}

- (void)_stickerDruidDragEndedWithPayload:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 _stickerDruidDragEndedWithPayload:v8];
  }
}

- (void)_stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 _stickerDruidDragEndedWithPayload:v11 pluginIdentifier:v6];
  }
}

- (void)_requestPresentationStyle:(unint64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 _requestPresentationStyle:a3];
  }
}

- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "_requestFullScreenModalPresentationWithSize:", width, height);
  }
}

- (void)_dismiss
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _dismiss];
  }
}

- (void)_dismissAndPresentPhotosApp
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _dismissAndPresentPhotosApp];
  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)p_delegate);
    [v16 _presentAlertWithTitle:v17 message:v10 buttonTitle:v11 completion:v12];
  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  id v20 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)p_delegate);
    [v19 _presentAlertWithTitle:v20 message:v12 buttonTitle:v13 destructiveButtonTitle:v14 completion:v15];
  }
}

- (void)_presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_delegate);
    [v13 _presentAlertSheetWith:v14 styles:v8 completion:v9];
  }
}

- (void)_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v20 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)p_delegate);
    [v19 _presentAlertSheetWithTitle:v20 message:v12 buttonTitles:v13 styles:v14 completion:v15];
  }
}

- (void)_presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v19 = a3;
  id v13 = a4;
  id v14 = a6;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v18, "_presentContextMenuWithButtonTitles:imageNames:buttonFrame:completion:", v19, v13, v14, x, y, width, height);
  }
}

- (void)_updateSnapshotForNextLaunch:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 _updateSnapshotForNextLaunch:v8];
  }
}

- (void)_remoteViewProvidesExplicitSizeSnapshot
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _remoteViewProvidesExplicitSizeSnapshot];
  }
}

- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _remoteViewNeedsSizeMatchBeforeSnapshotSwap];
  }
}

- (void)_remoteViewDidBecomeReadyForDisplay
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _remoteViewDidBecomeReadyForDisplay];
  }
}

- (void)_requestStickerExtensionMetadataDictionary:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 _requestStickerExtensionMetadataDictionary:v8];
  }
}

- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 _requestPresentationWithStickerType:v11 identifier:v6];
  }
}

- (void)_openURL:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 _openURL:v11 completionHandler:v6];
  }
}

- (void)_requestResize
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _requestResize];
  }
}

- (void)_contentDidLoad
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _contentDidLoad];
  }
}

- (void)_stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 _stageAssetArchive:v13 skipShelf:v6 completionHandler:v8];
  }
}

- (void)_removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 _removeAssetArchiveWithIdentifier:v11 completionHandler:v6];
  }
}

- (void)_requestHostSceneIdentifierWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void))a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 _requestHostSceneIdentifierWithCompletion:v8];
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }
}

- (void)_canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v7 = (void (**)(id, void))a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)p_delegate);
      [v12 _canShowBrowserForPluginIdentifier:v15 completion:v7];
    }
    else if (v7)
    {
      v7[2](v7, 0);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_queuedCanShowBrowserPluginIdentifier, a3);
    id v13 = _Block_copy(v7);
    id queuedCanShowBrowserCompletion = self->_queuedCanShowBrowserCompletion;
    self->_id queuedCanShowBrowserCompletion = v13;
  }
}

- (void)_showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = (void (**)(void))a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 _showBrowserForPluginIdentifier:v13 style:a4 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (self->_queuedCanShowBrowserPluginIdentifier && self->_queuedCanShowBrowserCompletion)
  {
    -[_MSMessageAppExtensionHostContext _canShowBrowserForPluginIdentifier:completion:](self, "_canShowBrowserForPluginIdentifier:completion:");
    queuedCanShowBrowserPluginIdentifier = self->_queuedCanShowBrowserPluginIdentifier;
    self->_queuedCanShowBrowserPluginIdentifier = 0;

    id queuedCanShowBrowserCompletion = self->_queuedCanShowBrowserCompletion;
    self->_id queuedCanShowBrowserCompletion = 0;
  }
}

- (_MSMessageComposeHostProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MSMessageComposeHostProtocol *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_queuedCanShowBrowserCompletion, 0);

  objc_storeStrong((id *)&self->_queuedCanShowBrowserPluginIdentifier, 0);
}

@end