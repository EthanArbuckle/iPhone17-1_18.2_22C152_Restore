@interface _MSMessageAppExtensionContext
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (id)_extensionContextHostProtocolAllowedClassesForItems;
- (CGRect)initialFrameOfHostView;
- (MSConversation)activeConversation;
- (UIViewController)stickerViewController;
- (UIViewController)viewController;
- (_MSMessageAppExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (_MSMessageComposeExtensionImplProtocol)containingContext;
- (_MSMessageComposeHostImplProtocol)hostContext;
- (__CFRunLoopObserver)principalObjectCreationObserver;
- (id)remoteProxy;
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
- (void)_handlePrincipalObjectCreated;
- (void)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4 completion:(id)a5;
- (void)_hostDidBeginDeferredTeardown;
- (void)_installPrincipalObjectObserver;
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
- (void)_setHostBundleID:(id)a3;
- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4;
- (void)_uninstallPrincipalObjectObserverIfNeeded;
- (void)_volumeButtonPressed:(BOOL)a3;
- (void)beginDisablingUserInteraction;
- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4;
- (void)contentDidLoad;
- (void)dealloc;
- (void)dismiss;
- (void)dismissAndPresentPhotosApp;
- (void)dragMediaItemCanceled;
- (void)dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7;
- (void)endDisablingUserInteraction;
- (void)openURL:(id)a3 completionHandler:(id)a4;
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
- (void)setActiveConversation:(id)a3;
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

@implementation _MSMessageAppExtensionContext

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
  block[2] = __84___MSMessageAppExtensionContext__extensionContextHostProtocolAllowedClassesForItems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_extensionContextHostProtocolAllowedClassesForItems_onceToken != -1) {
    dispatch_once(&_extensionContextHostProtocolAllowedClassesForItems_onceToken, block);
  }
  v2 = (void *)_extensionContextHostProtocolAllowedClassesForItems_allowedClasses;

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

- (_MSMessageAppExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v8 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_MSMessageAppExtensionContext;
  v9 = [(_MSMessageAppExtensionContext *)&v45 initWithInputItems:v8 listenerEndpoint:a4 contextUUID:a5];
  if (v9)
  {
    v10 = ms_traceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_MSMessageAppExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v18 = [v8 firstObject];
    v19 = [v18 userInfo];

    v20 = [v19 objectForKeyedSubscript:@"wants-live-view"];
    int v21 = [v20 BOOLValue];

    if (v21)
    {
      [(_MSMessageAppExtensionContext *)v9 setPresentationStyle:2];
      [(_MSMessageAppExtensionContext *)v9 _installPrincipalObjectObserver];
    }
    else
    {
      v22 = [v19 objectForKeyedSubscript:@"context-is-primary"];
      char v23 = [v22 BOOLValue];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81___MSMessageAppExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke;
      block[3] = &unk_1E6E989A8;
      char v44 = v23;
      v24 = v9;
      v43 = v24;
      dispatch_async(MEMORY[0x1E4F14428], block);
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __81___MSMessageAppExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_2;
      v39 = &unk_1E6E989A8;
      char v41 = v23;
      v25 = v24;
      v40 = v25;
      [(_MSMessageAppExtensionContext *)v25 _setRequestCleanUpBlock:&v36];
      CGSize v26 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      v25->_initialFrameOfHostView.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      v25->_initialFrameOfHostView.size = v26;
      v27 = objc_msgSend(v19, "objectForKeyedSubscript:", @"host-view-bounds", v36, v37, v38, v39);
      v28 = v27;
      if (v27)
      {
        [v27 CGRectValue];
        v25->_initialFrameOfHostView.origin.x = v29;
        v25->_initialFrameOfHostView.origin.y = v30;
        v25->_initialFrameOfHostView.size.width = v31;
        v25->_initialFrameOfHostView.size.height = v32;
      }
      [(_MSMessageAppExtensionContext *)v25 _installPrincipalObjectObserver];
    }
    v33 = [[_MSMessageAppContext alloc] initWithAppContext:v9];
    containingContext = v9->_containingContext;
    v9->_containingContext = (_MSMessageComposeExtensionImplProtocol *)v33;
  }
  return v9;
}

- (void)dealloc
{
}

- (void)_installPrincipalObjectObserver
{
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  self->_principalObjectCreationObserver = CFRunLoopObserverCreate(0, 0x21uLL, 1u, 0, (CFRunLoopObserverCallBack)handleRunloopEnded, &context);
  Main = CFRunLoopGetMain();
  CFRunLoopAddObserver(Main, self->_principalObjectCreationObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
}

- (void)_uninstallPrincipalObjectObserverIfNeeded
{
  if (self->_principalObjectCreationObserver)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveObserver(Main, self->_principalObjectCreationObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->_principalObjectCreationObserver);
    self->_principalObjectCreationObserver = 0;
  }
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v9 = [(_MSMessageAppExtensionContext *)self remoteProxy];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59___MSMessageAppExtensionContext_openURL_completionHandler___block_invoke;
    v13[3] = &unk_1E6E98980;
    v10 = &v14;
    id v14 = v8;
    [v9 _openURL:v6 completionHandler:v13];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59___MSMessageAppExtensionContext_openURL_completionHandler___block_invoke_3;
    v11[3] = &unk_1E6E98A40;
    v10 = &v12;
    id v12 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

- (UIViewController)viewController
{
  v2 = [(_MSMessageAppExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UIViewController *)v3;
}

- (UIViewController)stickerViewController
{
  v2 = [(_MSMessageAppExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UIViewController *)v3;
}

- (void)_handlePrincipalObjectCreated
{
  id v3 = [(_MSMessageAppExtensionContext *)self _principalObject];
  int v4 = [v3 conformsToProtocol:&unk_1F40764B0];

  if (v4)
  {
    v5 = [(_MSMessageAppExtensionContext *)self _principalObject];
    [(_MSMessageAppExtensionContext *)self initialFrameOfHostView];
    objc_msgSend(v5, "setInitialFrameBeforeAppearance:");
  }

  [(_MSMessageAppExtensionContext *)self _uninstallPrincipalObjectObserverIfNeeded];
}

- (void)_becomeActiveWithConversationState:(id)a3 presentationState:(id)a4
{
}

- (void)_resignActive
{
}

- (void)_requestContentSizeThatFits:(id)a3 presentationStyle:(id)a4 completionHandler:(id)a5
{
}

- (void)_canSendMessage:(id)a3 conversationState:(id)a4 associatedText:(id)a5 completion:(id)a6
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

- (void)_didSelectGPAsset:(id)a3 sandboxExtension:(id)a4 recipeData:(id)a5 completion:(id)a6
{
}

- (void)_didCancelSendingMessage:(id)a3 conversationState:(id)a4
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

- (id)remoteProxy
{
  v2 = [(_MSMessageAppExtensionContext *)self _auxiliaryConnection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v10 _stageAppItem:v9 skipShelf:v5 completionHandler:v8];
}

- (void)stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a6;
  uint64_t v11 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v11 _stageMediaItem:v13 skipShelf:v8 forceStage:v7 completionHandler:v10];

  if ([v13 isSticker])
  {
    id v12 = [[MSStickerUsageEvent alloc] initWithMediaPayload:v13];
    [(MSStickerUsageEvent *)v12 setUsageType:0];
    [(MSStickerUsageEvent *)v12 send];
  }
}

- (void)stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v10 _stageRichLink:v9 skipShelf:v5 completionHandler:v8];
}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v10 _stageAssetArchive:v9 skipShelf:v5 completionHandler:v8];
}

- (void)removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MSMessageAppExtensionContext *)self remoteProxy];
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
  id v16 = [(_MSMessageAppExtensionContext *)self remoteProxy];
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
  id v17 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  objc_msgSend(v17, "_dragMediaItemMoved:frameInRemoteView:rotation:scale:completionHandler:", v16, v15, x, y, width, height, a5, a6);
}

- (void)dragMediaItemCanceled
{
  id v2 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v2 _dragMediaItemCanceled];
}

- (void)stickerDruidDragStarted
{
  id v2 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v2 _stickerDruidDragStarted];
}

- (void)stickerDruidDragEndedWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v5 _stickerDruidDragEndedWithPayload:v4];
}

- (void)stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MSMessageAppExtensionContext *)self remoteProxy];
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
  id v4 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v4 _requestPresentationStyle:a3];
LABEL_6:
}

- (void)requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  objc_msgSend(v5, "_requestFullScreenModalPresentationWithSize:", width, height);
}

- (void)dismiss
{
  id v2 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v2 _dismiss];
}

- (void)dismissAndPresentPhotosApp
{
  id v2 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v2 _dismissAndPresentPhotosApp];
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v14 _presentAlertWithTitle:v13 message:v12 buttonTitle:v11 completion:v10];
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v17 _presentAlertWithTitle:v16 message:v15 buttonTitle:v14 destructiveButtonTitle:v13 completion:v12];
}

- (void)presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v11 _presentAlertSheetWith:v10 styles:v9 completion:v8];
}

- (void)presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v17 _presentAlertSheetWithTitle:v16 message:v15 buttonTitles:v14 styles:v13 completion:v12];
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
  id v16 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  objc_msgSend(v16, "_presentContextMenuWithButtonTitles:imageNames:buttonFrame:completion:", v15, v14, v13, x, y, width, height);
}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v8 _canShowBrowserForPluginIdentifier:v7 completion:v6];
}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v10 _showBrowserForPluginIdentifier:v9 style:a4 completion:v8];
}

- (void)_hostDidBeginDeferredTeardown
{
  id v3 = [(_MSMessageAppExtensionContext *)self _principalObject];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62___MSMessageAppExtensionContext__hostDidBeginDeferredTeardown__block_invoke;
    block[3] = &unk_1E6E987F0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_remoteViewProvidesExplicitSizeSnapshot
{
  id v2 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v2 _remoteViewProvidesExplicitSizeSnapshot];
}

- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap
{
  id v2 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v2 _remoteViewNeedsSizeMatchBeforeSnapshotSwap];
}

- (void)_remoteViewDidBecomeReadyForDisplay
{
  id v2 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v2 _remoteViewDidBecomeReadyForDisplay];
}

- (void)_requestStickerExtensionMetadataDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(_MSMessageAppExtensionContext *)self containingContext];
  [v5 _requestStickerExtensionMetadataDictionary:v4];
}

- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MSMessageAppExtensionContext *)self containingContext];
  [v8 _requestPresentationWithStickerType:v7 identifier:v6];
}

- (void)requestResize
{
  id v2 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v2 _requestResize];
}

- (void)contentDidLoad
{
  id v2 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v2 _contentDidLoad];
}

- (void)requestHostSceneIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(_MSMessageAppExtensionContext *)self remoteProxy];
  [v5 _requestHostSceneIdentifierWithCompletion:v4];
}

- (void)beginDisablingUserInteraction
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___MSMessageAppExtensionContext_beginDisablingUserInteraction__block_invoke;
  block[3] = &unk_1E6E987F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)endDisablingUserInteraction
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___MSMessageAppExtensionContext_endDisablingUserInteraction__block_invoke;
  block[3] = &unk_1E6E987F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_setHostBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[_MSStickerSendManager sharedInstance];
  [v4 setHostBundleID:v3];
}

- (_MSMessageComposeHostImplProtocol)hostContext
{
  return self->_hostContext;
}

- (void)setHostContext:(id)a3
{
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

- (void)setActiveConversation:(id)a3
{
}

- (CGRect)initialFrameOfHostView
{
  double x = self->_initialFrameOfHostView.origin.x;
  double y = self->_initialFrameOfHostView.origin.y;
  double width = self->_initialFrameOfHostView.size.width;
  double height = self->_initialFrameOfHostView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (__CFRunLoopObserver)principalObjectCreationObserver
{
  return self->_principalObjectCreationObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConversation, 0);
  objc_storeStrong((id *)&self->_containingContext, 0);

  objc_storeStrong((id *)&self->_hostContext, 0);
}

- (void)initWithInputItems:(uint64_t)a3 listenerEndpoint:(uint64_t)a4 contextUUID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end