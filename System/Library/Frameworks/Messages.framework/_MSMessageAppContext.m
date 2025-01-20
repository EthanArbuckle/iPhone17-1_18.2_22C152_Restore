@interface _MSMessageAppContext
+ (id)activeExtensionContext;
- ($115C4C562B26FF47E01F9F4EA65B5887)balloonHostAuditToken;
- (MSConversation)activeConversation;
- (UIViewController)stickerViewController;
- (UIViewController)viewController;
- (_MSMessageAppContext)initWithAppContext:(id)a3;
- (_MSMessageComposeExtensionImplProtocol)containingContext;
- (_MSMessageComposeHostImplProtocol)hostContext;
- (id)updatedConversationForConversationState:(id)a3;
- (unint64_t)presentationContext;
- (unint64_t)presentationStyle;
- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4;
- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6;
- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4;
- (void)_becomeActiveWithConversationState:(id)a3 presentationState:(id)a4;
- (void)_canSendMessage:(id)a3 conversationState:(id)a4 associatedText:(id)a5 completion:(id)a6;
- (void)_conversationDidChangeWithConversationState:(id)a3;
- (void)_didCancelSendingMessage:(id)a3 conversationState:(id)a4;
- (void)_didReceiveMessage:(id)a3 conversationState:(id)a4;
- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3;
- (void)_didRemoveStickerPreview;
- (void)_didSelectGPAsset:(id)a3 sandboxExtension:(id)a4 recipeData:(id)a5 completion:(id)a6;
- (void)_didStartSendingMessage:(id)a3 conversationState:(id)a4;
- (void)_didUpdateMessage:(id)a3 conversationState:(id)a4;
- (void)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4 completion:(id)a5;
- (void)_keepContextAlive;
- (void)_prepareForAddStickerFromSubjectLift;
- (void)_prepareForPresentationWithCompletionHandler:(id)a3;
- (void)_presentationDidChangeToPresentationState:(id)a3;
- (void)_presentationWillChangeToPresentationState:(id)a3;
- (void)_releaseKeepAliveContext;
- (void)_remoteViewDidBecomeReadyForDisplay;
- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap;
- (void)_remoteViewProvidesExplicitSizeSnapshot;
- (void)_requestContentSizeThatFits:(id)a3 presentationStyle:(id)a4 completionHandler:(id)a5;
- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4;
- (void)_requestSnapshotThatFits:(id)a3 completion:(id)a4;
- (void)_requestSnapshotWithCompletion:(id)a3;
- (void)_requestStickerExtensionMetadataDictionary:(id)a3;
- (void)_resignActive;
- (void)_setHostBundleID:(id)a3;
- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4;
- (void)_volumeButtonPressed:(BOOL)a3;
- (void)balloonHostAuditToken;
- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4;
- (void)contentDidLoad;
- (void)dismiss;
- (void)dismissAndPresentPhotosApp;
- (void)dragMediaItemCanceled;
- (void)dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7;
- (void)presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5;
- (void)presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7;
- (void)removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestFullScreenModalPresentationWithSize:(CGSize)a3;
- (void)requestHostSceneIdentifierWithCompletion:(id)a3;
- (void)requestPresentationStyle:(unint64_t)a3;
- (void)requestPresentationStyleExpanded:(BOOL)a3;
- (void)requestResize;
- (void)setContainingContext:(id)a3;
- (void)setHostContext:(id)a3;
- (void)setPresentationContext:(unint64_t)a3;
- (void)setPresentationStyle:(unint64_t)a3;
- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6;
- (void)stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6;
- (void)stickerDruidDragEndedWithPayload:(id)a3;
- (void)stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4;
- (void)stickerDruidDragStarted;
@end

@implementation _MSMessageAppContext

+ (id)activeExtensionContext
{
  v2 = +[_MSExtensionGlobalState sharedInstance];
  v3 = [v2 activeExtensionContext];

  return v3;
}

- (_MSMessageAppContext)initWithAppContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)_MSMessageAppContext;
    v5 = [(_MSMessageAppContext *)&v12 init];
    v6 = v5;
    if (v5)
    {
      id v7 = objc_storeWeak((id *)&v5->_context, v4);
      [v4 setContainingContext:v6];

      uint64_t v8 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      conversationsByIdentifier = v6->_conversationsByIdentifier;
      v6->_conversationsByIdentifier = (NSMapTable *)v8;
    }
    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_keepContextAlive
{
  self->_keepAliveContext = (_MSMessageComposeExtensionImplProtocol *)objc_loadWeakRetained((id *)&self->_context);

  MEMORY[0x1F41817F8]();
}

- (void)_releaseKeepAliveContext
{
  self->_keepAliveContext = 0;
  MEMORY[0x1F41817F8]();
}

- (void)setHostContext:(id)a3
{
  p_context = &self->_context;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained setHostContext:v4];
}

- (_MSMessageComposeHostImplProtocol)hostContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v3 = [WeakRetained hostContext];

  return (_MSMessageComposeHostImplProtocol *)v3;
}

- (unint64_t)presentationStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  unint64_t v3 = [WeakRetained presentationStyle];

  return v3;
}

- (unint64_t)presentationContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  unint64_t v3 = [WeakRetained presentationContext];

  return v3;
}

- (void)setPresentationContext:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained setPresentationContext:a3];
}

- (void)setPresentationStyle:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained setPresentationStyle:a3];
}

- (id)updatedConversationForConversationState:(id)a3
{
  id v4 = a3;
  v5 = [v4 conversationIdentifier];
  v6 = [(NSMapTable *)self->_conversationsByIdentifier objectForKey:v5];
  if (v6)
  {
    id v7 = v6;
    [v6 _updateWithState:v4];
  }
  else
  {
    uint64_t v8 = [MSConversation alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    id v7 = [(MSConversation *)v8 _initWithState:v4 context:WeakRetained];

    v10 = [(_MSMessageAppContext *)self viewController];
    if ([v10 conformsToProtocol:&unk_1F4076558])
    {
      v11 = [(_MSMessageAppContext *)self viewController];
      [v7 setDelegate:v11];
    }
    conversationsByIdentifier = self->_conversationsByIdentifier;
    v13 = [v7 identifier];
    [(NSMapTable *)conversationsByIdentifier setObject:v7 forKey:v13];
  }

  return v7;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  unint64_t v3 = [WeakRetained viewController];

  return (UIViewController *)v3;
}

- (UIViewController)stickerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  unint64_t v3 = [WeakRetained stickerViewController];

  return (UIViewController *)v3;
}

- (void)stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  p_context = &self->_context;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained stageAppItem:v9 skipShelf:v5 completionHandler:v8];
}

- (void)stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  p_context = &self->_context;
  id v10 = a6;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained stageMediaItem:v11 skipShelf:v7 forceStage:v6 completionHandler:v10];
}

- (void)stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  p_context = &self->_context;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained stageRichLink:v9 skipShelf:v5 completionHandler:v8];
}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = ms_defaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v12 = 0;
    _os_log_impl(&dword_1E4A76000, v10, OS_LOG_TYPE_DEFAULT, "Called -stageAssetArchive:skipShelf:completionHandler:", v12, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained stageAssetArchive:v9 skipShelf:v5 completionHandler:v8];
}

- (void)removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = ms_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1E4A76000, v8, OS_LOG_TYPE_DEFAULT, "Called -removeAssetArchiveWithIdentifier:completionHandler:", v10, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained removeAssetArchiveWithIdentifier:v7 completionHandler:v6];
}

- (void)startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  p_context = &self->_context;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "startDragMediaItem:frameInRemoteView:fence:completionHandler:", v15, v14, v13, x, y, width, height);
}

- (void)dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  p_context = &self->_context;
  id v15 = a7;
  id v16 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "dragMediaItemMoved:frameInRemoteView:rotation:scale:completionHandler:", v16, v15, x, y, width, height, a5, a6);
}

- (void)dragMediaItemCanceled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained dragMediaItemCanceled];
}

- (void)stickerDruidDragStarted
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained stickerDruidDragStarted];
}

- (void)stickerDruidDragEndedWithPayload:(id)a3
{
  p_context = &self->_context;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained stickerDruidDragEndedWithPayload:v4];
}

- (void)stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4
{
  p_context = &self->_context;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained stickerDruidDragEndedWithPayload:v7 pluginIdentifier:v6];
}

- (void)requestPresentationStyle:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained requestPresentationStyle:a3];
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained requestPresentationStyleExpanded:v3];
}

- (void)requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "requestFullScreenModalPresentationWithSize:", width, height);
}

- (void)dismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained dismiss];
}

- (void)dismissAndPresentPhotosApp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained dismissAndPresentPhotosApp];
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  p_context = &self->_context;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained presentAlertWithTitle:v13 message:v12 buttonTitle:v11 completion:v10];
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  p_context = &self->_context;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained presentAlertWithTitle:v16 message:v15 buttonTitle:v14 destructiveButtonTitle:v13 completion:v12];
}

- (void)presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
  p_context = &self->_context;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained presentAlertSheetWith:v10 styles:v9 completion:v8];
}

- (void)presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  p_context = &self->_context;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained presentAlertSheetWithTitle:v16 message:v15 buttonTitles:v14 styles:v13 completion:v12];
}

- (void)_remoteViewProvidesExplicitSizeSnapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained _remoteViewProvidesExplicitSizeSnapshot];
}

- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained _remoteViewNeedsSizeMatchBeforeSnapshotSwap];
}

- (void)_remoteViewDidBecomeReadyForDisplay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained _remoteViewDidBecomeReadyForDisplay];
}

- (void)_requestStickerExtensionMetadataDictionary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_MSMessageAppContext *)self viewController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___MSMessageAppContext__requestStickerExtensionMetadataDictionary___block_invoke;
  v8[3] = &unk_1E6E98818;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MSMessageAppContext *)self viewController];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___MSMessageAppContext__requestPresentationWithStickerType_identifier___block_invoke;
  block[3] = &unk_1E6E98840;
  id v13 = v8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)requestResize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained requestResize];
}

- (void)contentDidLoad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained contentDidLoad];
}

- (void)requestHostSceneIdentifierWithCompletion:(id)a3
{
  p_context = &self->_context;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained requestHostSceneIdentifierWithCompletion:v4];
}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  p_context = &self->_context;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained canShowBrowserForPluginIdentifier:v7 completion:v6];
}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  p_context = &self->_context;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained showBrowserForPluginIdentifier:v9 style:a4 completion:v8];
}

- (void)_setHostBundleID:(id)a3
{
  p_context = &self->_context;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  [WeakRetained _setHostBundleID:v4];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)balloonHostAuditToken
{
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  *(_OWORD *)retstr->var0 = v4;
  *(_OWORD *)&retstr->var0[4] = v4;
  p_context = &self->_context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_context);
    id v8 = v7;
    if (v7)
    {
      [v7 balloonHostAuditToken];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }
    long long v18 = v20;
    *(_OWORD *)retstr->var0 = v19;
    *(_OWORD *)&retstr->var0[4] = v18;
  }
  else
  {
    LODWORD(v19) = 8;
    result = ($115C4C562B26FF47E01F9F4EA65B5887 *)task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)retstr, (mach_msg_type_number_t *)&v19);
    if (result)
    {
      id v10 = ms_traceLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        [(_MSMessageAppContext *)v10 balloonHostAuditToken];
      }
    }
  }
  return result;
}

- (void)_becomeActiveWithConversationState:(id)a3 presentationState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MSMessageAppContext *)self viewController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77___MSMessageAppContext__becomeActiveWithConversationState_presentationState___block_invoke;
  v12[3] = &unk_1E6E98868;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

- (void)_resignActive
{
  BOOL v3 = [(_MSMessageAppContext *)self viewController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___MSMessageAppContext__resignActive__block_invoke;
  v5[3] = &unk_1E6E98890;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

- (void)_canSendMessage:(id)a3 conversationState:(id)a4 associatedText:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(_MSMessageAppContext *)self _keepContextAlive];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke;
  block[3] = &unk_1E6E988E0;
  void block[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_conversationDidChangeWithConversationState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_MSMessageAppContext *)self viewController];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___MSMessageAppContext__conversationDidChangeWithConversationState___block_invoke;
  block[3] = &unk_1E6E98840;
  void block[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_requestContentSizeThatFits:(id)a3 presentationStyle:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88___MSMessageAppContext__requestContentSizeThatFits_presentationStyle_completionHandler___block_invoke;
  block[3] = &unk_1E6E98908;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_presentationWillChangeToPresentationState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___MSMessageAppContext__presentationWillChangeToPresentationState___block_invoke;
  v6[3] = &unk_1E6E98890;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_presentationDidChangeToPresentationState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66___MSMessageAppContext__presentationDidChangeToPresentationState___block_invoke;
  v6[3] = &unk_1E6E98890;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_didUpdateMessage:(id)a3 conversationState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___MSMessageAppContext__didUpdateMessage_conversationState___block_invoke;
  block[3] = &unk_1E6E98840;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_didReceiveMessage:(id)a3 conversationState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___MSMessageAppContext__didReceiveMessage_conversationState___block_invoke;
  block[3] = &unk_1E6E98840;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_didStartSendingMessage:(id)a3 conversationState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_MSMessageAppContext *)self _keepContextAlive];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66___MSMessageAppContext__didStartSendingMessage_conversationState___block_invoke;
  block[3] = &unk_1E6E98840;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_didCancelSendingMessage:(id)a3 conversationState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_MSMessageAppContext *)self _keepContextAlive];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67___MSMessageAppContext__didCancelSendingMessage_conversationState___block_invoke;
  block[3] = &unk_1E6E98840;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_didSelectGPAsset:(id)a3 sandboxExtension:(id)a4 recipeData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(_MSMessageAppContext *)self _keepContextAlive];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke;
  block[3] = &unk_1E6E988E0;
  void block[4] = self;
  id v19 = v10;
  id v20 = v12;
  id v21 = v11;
  id v22 = v13;
  id v14 = v13;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_requestSnapshotThatFits:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ms_traceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_MSMessageAppContext _requestSnapshotThatFits:completion:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___MSMessageAppContext__requestSnapshotThatFits_completion___block_invoke;
  block[3] = &unk_1E6E98908;
  void block[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_requestSnapshotWithCompletion:(id)a3
{
}

- (void)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73___MSMessageAppContext__handleTextInputPayload_withPayloadID_completion___block_invoke;
  v14[3] = &unk_1E6E98930;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3
{
  id v4 = a3;
  [(_MSMessageAppContext *)self _keepContextAlive];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61___MSMessageAppContext__didRemoveAssetArchiveWithIdentifier___block_invoke;
  v6[3] = &unk_1E6E98890;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_prepareForPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6E98818;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_volumeButtonPressed:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45___MSMessageAppContext__volumeButtonPressed___block_invoke;
  v3[3] = &unk_1E6E989A8;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    [v7 _setPluginIdentifierToShow:v8 completion:v6];
  }
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    [v7 _addStickerToStoreWithRepresentations:v8 completionWithStickerIDs:v6];
  }
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    [v7 _addStickerToStoreWithRepresentations:v8 completionHandler:v6];
  }
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v11 = a5;
  id v12 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v12, "_addStickerToStoreWithRepresentations:sourceRect:completion:", v13, v11, x, y, width, height);
  }
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  id v14 = a3;
  id v15 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v15, "_addStickerToStoreWithRepresentations:sourceRect:effect:completion:", v14, a5, v13, x, y, width, height);
  }
  else {
    -[_MSMessageAppContext _addStickerToStoreWithRepresentations:sourceRect:completion:](self, "_addStickerToStoreWithRepresentations:sourceRect:completion:", v14, v13, x, y, width, height);
  }
}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v11 = a5;
  id v12 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v12, "_addStickerToStoreWithUISticker:sourceRect:completion:", v13, v11, x, y, width, height);
  }
}

- (void)_prepareForAddStickerFromSubjectLift
{
  id v2 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    [v2 _prepareForAddStickerFromSubjectLift];
  }
}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    [v4 _addStickerAnimationDidFinishWithCompletion:v5];
  }
}

- (void)_didRemoveStickerPreview
{
  id v2 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    [v2 _didRemoveStickerPreview];
  }
}

- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  id v7 = a3;
  id v6 = [(_MSMessageAppContext *)self viewController];
  if (objc_opt_respondsToSelector()) {
    [v6 _animatedStickerCreationProgressChanged:v7 progress:a4];
  }
}

- (_MSMessageComposeExtensionImplProtocol)containingContext
{
  return self->_containingContext;
}

- (void)setContainingContext:(id)a3
{
}

- (MSConversation)activeConversation
{
  return self->_activeConversation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConversation, 0);
  objc_storeStrong((id *)&self->_containingContext, 0);
  objc_storeStrong((id *)&self->_conversationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_keepAliveContext, 0);

  objc_destroyWeak((id *)&self->_context);
}

- (void)balloonHostAuditToken
{
}

- (void)_requestSnapshotThatFits:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end