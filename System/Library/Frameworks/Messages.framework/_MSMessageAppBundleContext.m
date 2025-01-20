@interface _MSMessageAppBundleContext
- ($115C4C562B26FF47E01F9F4EA65B5887)balloonHostAuditToken;
- (CGRect)initialFrameOfHostView;
- (MSConversation)activeConversation;
- (UIViewController)stickerViewController;
- (UIViewController)viewController;
- (_MSMessageAppBundleContext)initWithViewController:(id)a3 wantsLiveView:(BOOL)a4;
- (_MSMessageComposeExtensionImplProtocol)containingContext;
- (_MSMessageComposeHostImplProtocol)hostContext;
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
- (void)_hostDidBeginDeferredTeardown;
- (void)_prepareForAddStickerFromSubjectLift;
- (void)_prepareForPresentationWithCompletionHandler:(id)a3;
- (void)_presentationDidChangeToPresentationState:(id)a3;
- (void)_presentationWillChangeToPresentationState:(id)a3;
- (void)_remoteViewDidBecomeReadyForDisplay;
- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap;
- (void)_remoteViewProvidesExplicitSizeSnapshot;
- (void)_requestContentSizeThatFits:(id)a3 presentationStyle:(id)a4 completionHandler:(id)a5;
- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4;
- (void)_requestSnapshotThatFits:(id)a3 completion:(id)a4;
- (void)_requestSnapshotWithCompletion:(id)a3;
- (void)_requestStickerExtensionMetadataDictionary:(id)a3;
- (void)_resignActive;
- (void)_sendWillBecomeActiveMessage;
- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4;
- (void)_volumeButtonPressed:(BOOL)a3;
- (void)balloonHostAuditToken;
- (void)beginDisablingUserInteraction;
- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4;
- (void)contentDidLoad;
- (void)dismiss;
- (void)dismissAndPresentPhotosApp;
- (void)dragMediaItemCanceled;
- (void)dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7;
- (void)endDisablingUserInteraction;
- (void)presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5;
- (void)presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7;
- (void)presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6;
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

@implementation _MSMessageAppBundleContext

- (_MSMessageAppBundleContext)initWithViewController:(id)a3 wantsLiveView:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MSMessageAppBundleContext;
  v7 = [(_MSMessageAppBundleContext *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_viewController, v6);
    v8->_wantsLiveView = a4;
    if (!a4)
    {
      v9 = +[_MSExtensionGlobalState sharedInstance];
      [v9 setActiveExtensionContext:v8];
    }
  }

  return v8;
}

- (UIViewController)stickerViewController
{
  p_viewController = &self->_viewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = objc_loadWeakRetained((id *)p_viewController);
  }
  else {
    id v4 = 0;
  }

  return (UIViewController *)v4;
}

- (void)_sendWillBecomeActiveMessage
{
  v3 = [(_MSMessageAppBundleContext *)self viewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_MSMessageAppBundleContext *)self viewController];
    [(_MSMessageAppBundleContext *)self initialFrameOfHostView];
    objc_msgSend(v5, "setInitialFrameBeforeAppearance:");
  }
}

- (CGRect)initialFrameOfHostView
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_remoteViewProvidesExplicitSizeSnapshot
{
  id v2 = [(_MSMessageAppBundleContext *)self hostContext];
  [v2 _remoteViewProvidesExplicitSizeSnapshot];
}

- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap
{
  id v2 = [(_MSMessageAppBundleContext *)self hostContext];
  [v2 _remoteViewNeedsSizeMatchBeforeSnapshotSwap];
}

- (void)_remoteViewDidBecomeReadyForDisplay
{
  id v2 = [(_MSMessageAppBundleContext *)self hostContext];
  [v2 _remoteViewDidBecomeReadyForDisplay];
}

- (void)_requestStickerExtensionMetadataDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(_MSMessageAppBundleContext *)self containingContext];
  [v5 _requestStickerExtensionMetadataDictionary:v4];
}

- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MSMessageAppBundleContext *)self containingContext];
  [v8 _requestPresentationWithStickerType:v7 identifier:v6];
}

- (void)_hostDidBeginDeferredTeardown
{
  double v3 = [(_MSMessageAppBundleContext *)self viewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59___MSMessageAppBundleContext__hostDidBeginDeferredTeardown__block_invoke;
    block[3] = &unk_1E6E987F0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)beginDisablingUserInteraction
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___MSMessageAppBundleContext_beginDisablingUserInteraction__block_invoke;
  block[3] = &unk_1E6E987F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)endDisablingUserInteraction
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___MSMessageAppBundleContext_endDisablingUserInteraction__block_invoke;
  block[3] = &unk_1E6E987F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_becomeActiveWithConversationState:(id)a3 presentationState:(id)a4
{
}

- (void)_resignActive
{
}

- (void)_canSendMessage:(id)a3 conversationState:(id)a4 associatedText:(id)a5 completion:(id)a6
{
}

- (void)_requestContentSizeThatFits:(id)a3 presentationStyle:(id)a4 completionHandler:(id)a5
{
}

- (void)_didUpdateMessage:(id)a3 conversationState:(id)a4
{
}

- (void)_didReceiveMessage:(id)a3 conversationState:(id)a4
{
}

- (void)_didStartSendingMessage:(id)a3 conversationState:(id)a4
{
}

- (void)_didCancelSendingMessage:(id)a3 conversationState:(id)a4
{
}

- (void)_didSelectGPAsset:(id)a3 sandboxExtension:(id)a4 recipeData:(id)a5 completion:(id)a6
{
}

- (void)_conversationDidChangeWithConversationState:(id)a3
{
}

- (void)_presentationWillChangeToPresentationState:(id)a3
{
}

- (void)_presentationDidChangeToPresentationState:(id)a3
{
}

- (void)_requestSnapshotThatFits:(id)a3 completion:(id)a4
{
}

- (void)_requestSnapshotWithCompletion:(id)a3
{
}

- (void)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4 completion:(id)a5
{
}

- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3
{
}

- (void)_prepareForPresentationWithCompletionHandler:(id)a3
{
}

- (void)_volumeButtonPressed:(BOOL)a3
{
}

- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4
{
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6
{
}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
}

- (void)_prepareForAddStickerFromSubjectLift
{
}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
}

- (void)_didRemoveStickerPreview
{
}

- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
}

- (void)stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_MSMessageAppBundleContext *)self hostContext];
  [v10 _stageAppItem:v9 skipShelf:v5 completionHandler:v8];
}

- (void)stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(_MSMessageAppBundleContext *)self hostContext];
  [v12 _stageMediaItem:v11 skipShelf:v7 forceStage:v6 completionHandler:v10];
}

- (void)stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_MSMessageAppBundleContext *)self hostContext];
  [v10 _stageRichLink:v9 skipShelf:v5 completionHandler:v8];
}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_MSMessageAppBundleContext *)self hostContext];
  [v10 _stageAssetArchive:v9 skipShelf:v5 completionHandler:v8];
}

- (void)removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MSMessageAppBundleContext *)self hostContext];
  [v8 _removeAssetArchiveWithIdentifier:v7 completionHandler:v6];
}

- (void)startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [(_MSMessageAppBundleContext *)self hostContext];
  objc_msgSend(v16, "_startDragMediaItem:frameInRemoteView:fence:completionHandler:", v15, v14, v13, x, y, width, height);
}

- (void)dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a7;
  id v16 = a3;
  id v17 = [(_MSMessageAppBundleContext *)self hostContext];
  objc_msgSend(v17, "_dragMediaItemMoved:frameInRemoteView:rotation:scale:completionHandler:", v16, v15, x, y, width, height, a5, a6);
}

- (void)dragMediaItemCanceled
{
  id v2 = [(_MSMessageAppBundleContext *)self hostContext];
  [v2 _dragMediaItemCanceled];
}

- (void)stickerDruidDragStarted
{
  id v2 = [(_MSMessageAppBundleContext *)self hostContext];
  [v2 _stickerDruidDragStarted];
}

- (void)stickerDruidDragEndedWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(_MSMessageAppBundleContext *)self hostContext];
  [v5 _stickerDruidDragEndedWithPayload:v4];
}

- (void)stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MSMessageAppBundleContext *)self hostContext];
  [v8 _stickerDruidDragEndedWithPayload:v7 pluginIdentifier:v6];
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
}

- (void)requestPresentationStyle:(unint64_t)a3
{
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot request transition to transcript presentation style" userInfo:0];
      [v4 raise];
      goto LABEL_6;
    }
    if (a3 != 3) {
      return;
    }
  }
  id v4 = [(_MSMessageAppBundleContext *)self hostContext];
  [v4 _requestPresentationStyle:a3];
LABEL_6:
}

- (void)requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(_MSMessageAppBundleContext *)self hostContext];
  objc_msgSend(v5, "_requestFullScreenModalPresentationWithSize:", width, height);
}

- (void)dismiss
{
  id v2 = [(_MSMessageAppBundleContext *)self hostContext];
  [v2 _dismiss];
}

- (void)dismissAndPresentPhotosApp
{
  id v2 = [(_MSMessageAppBundleContext *)self hostContext];
  [v2 _dismissAndPresentPhotosApp];
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(_MSMessageAppBundleContext *)self hostContext];
  [v14 _presentAlertWithTitle:v13 message:v12 buttonTitle:v11 completion:v10];
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(_MSMessageAppBundleContext *)self hostContext];
  [v17 _presentAlertWithTitle:v16 message:v15 buttonTitle:v14 destructiveButtonTitle:v13 completion:v12];
}

- (void)presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_MSMessageAppBundleContext *)self hostContext];
  [v11 _presentAlertSheetWith:v10 styles:v9 completion:v8];
}

- (void)presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(_MSMessageAppBundleContext *)self hostContext];
  objc_msgSend(v16, "_presentContextMenuWithButtonTitles:imageNames:buttonFrame:completion:", v15, v14, v13, x, y, width, height);
}

- (void)presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(_MSMessageAppBundleContext *)self hostContext];
  [v17 _presentAlertSheetWithTitle:v16 message:v15 buttonTitles:v14 styles:v13 completion:v12];
}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MSMessageAppBundleContext *)self hostContext];
  [v8 _canShowBrowserForPluginIdentifier:v7 completion:v6];
}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_MSMessageAppBundleContext *)self hostContext];
  [v10 _showBrowserForPluginIdentifier:v9 style:a4 completion:v8];
}

- (void)requestResize
{
  id v2 = [(_MSMessageAppBundleContext *)self hostContext];
  [v2 _requestResize];
}

- (void)contentDidLoad
{
  id v2 = [(_MSMessageAppBundleContext *)self hostContext];
  [v2 _contentDidLoad];
}

- (void)requestHostSceneIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(_MSMessageAppBundleContext *)self hostContext];
  [v5 _requestHostSceneIdentifierWithCompletion:v4];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)balloonHostAuditToken
{
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  *(_OWORD *)retstr->var0 = v5;
  *(_OWORD *)&retstr->var0[4] = v5;
  id v6 = [(_MSMessageAppBundleContext *)self hostContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(_MSMessageAppBundleContext *)self hostContext];
    id v9 = v8;
    if (v8)
    {
      [v8 _extensionHostAuditToken];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
    }
    long long v12 = v14;
    *(_OWORD *)retstr->var0 = v13;
    *(_OWORD *)&retstr->var0[4] = v12;
  }
  else
  {
    LODWORD(v13) = 8;
    CGRect result = ($115C4C562B26FF47E01F9F4EA65B5887 *)task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)retstr, (mach_msg_type_number_t *)&v13);
    if (result)
    {
      id v11 = ms_traceLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_MSMessageAppBundleContext balloonHostAuditToken](v11);
      }
    }
  }
  return result;
}

- (_MSMessageComposeExtensionImplProtocol)containingContext
{
  return self->_containingContext;
}

- (void)setContainingContext:(id)a3
{
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (MSConversation)activeConversation
{
  return self->_activeConversation;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (unint64_t)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(unint64_t)a3
{
  self->_presentationContext = a3;
}

- (_MSMessageComposeHostImplProtocol)hostContext
{
  return self->_hostContext;
}

- (void)setHostContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_storeStrong((id *)&self->_activeConversation, 0);
  objc_destroyWeak((id *)&self->_viewController);

  objc_storeStrong((id *)&self->_containingContext, 0);
}

- (void)balloonHostAuditToken
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  id v2 = "-[_MSMessageAppBundleContext balloonHostAuditToken]";
  _os_log_debug_impl(&dword_1E4A76000, log, OS_LOG_TYPE_DEBUG, "failed to get audit token for self: %s", (uint8_t *)&v1, 0xCu);
}

@end