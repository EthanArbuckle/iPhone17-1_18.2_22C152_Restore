@interface QLPreviewCollectionServiceContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)_previewCollection;
- (id)_protocolHost;
- (void)actionSheetDidDismiss;
- (void)completeTransition:(BOOL)a3 withDuration:(double)a4;
- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7;
- (void)documentMenuActionWillBegin;
- (void)getNetworkObserverWithCompletionBlock:(id)a3;
- (void)getPreviewCollectionUUIDWithCompletionHandler:(id)a3;
- (void)hostApplicationDidBecomeActive;
- (void)hostApplicationDidEnterBackground:(BOOL)a3;
- (void)hostSceneWillDeactivate;
- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4;
- (void)hostViewControllerBackgroundColorChanged:(id)a3;
- (void)invalidateService;
- (void)invalidateServiceWithCompletionHandler:(id)a3;
- (void)keyCommandWasPerformed:(id)a3;
- (void)keyCommandsWithCompletionHandler:(id)a3;
- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3;
- (void)notifyStateRestorationUserInfo:(id)a3;
- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3;
- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3;
- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3;
- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4;
- (void)requestLockForCurrentItem;
- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5;
- (void)setAllowInteractiveTransitions:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setHostApplicationBundleIdentifier:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setLoadingString:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4;
- (void)setScreenEdgePanWidth:(double)a3;
- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3;
- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7;
- (void)tearDownTransition:(BOOL)a3;
- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4;
- (void)updateTransitionWithProgress:(double)a3;
@end

@implementation QLPreviewCollectionServiceContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_159);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v2;
}

uint64_t __70__QLPreviewCollectionServiceContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9477F8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___notificationCenterInterface;
  _extensionAuxiliaryVendorProtocol___notificationCenterInterface = v0;

  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C971E28];
  v3 = (void *)_extensionAuxiliaryVendorProtocol___networkStateProtocol;
  _extensionAuxiliaryVendorProtocol___networkStateProtocol = v2;

  uint64_t v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C971EE0];
  v5 = (void *)_extensionAuxiliaryVendorProtocol___downloadTrackerInterface;
  _extensionAuxiliaryVendorProtocol___downloadTrackerInterface = v4;

  uint64_t v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9564B8];
  v7 = (void *)_extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface;
  _extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface = v6;

  uint64_t v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C971F90];
  v9 = (void *)_extensionAuxiliaryVendorProtocol___urlProviderInterface;
  _extensionAuxiliaryVendorProtocol___urlProviderInterface = v8;

  [(id)_extensionAuxiliaryVendorProtocol___urlProviderInterface setInterface:_extensionAuxiliaryVendorProtocol___downloadTrackerInterface forSelector:sel_getURLWithDownloadTracker_completionHandler_ argumentIndex:0 ofReply:0];
  uint64_t v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9223F0];
  v11 = (void *)_extensionAuxiliaryVendorProtocol___itemStoreInterface;
  _extensionAuxiliaryVendorProtocol___itemStoreInterface = v10;

  v12 = (void *)_extensionAuxiliaryVendorProtocol___itemStoreInterface;
  v13 = [MEMORY[0x263F62978] encodedClasses];
  [v12 setClasses:v13 forSelector:sel_previewItemAtIndex_withCompletionHandler_ argumentIndex:0 ofReply:1];

  [(id)_extensionAuxiliaryVendorProtocol___itemStoreInterface setInterface:_extensionAuxiliaryVendorProtocol___urlProviderInterface forSelector:sel_previewItemAtIndex_withCompletionHandler_ argumentIndex:1 ofReply:1];
  uint64_t v14 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C937418];
  v15 = (void *)_extensionAuxiliaryVendorProtocol___printerInterface;
  _extensionAuxiliaryVendorProtocol___printerInterface = v14;

  uint64_t v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C921400];
  v17 = (void *)_extensionAuxiliaryVendorProtocol___stateManagerInterface;
  _extensionAuxiliaryVendorProtocol___stateManagerInterface = v16;

  [(id)_extensionAuxiliaryVendorProtocol___stateManagerInterface setInterface:_extensionAuxiliaryVendorProtocol___printerInterface forSelector:sel_setPrinter_ argumentIndex:0 ofReply:0];
  [(id)_extensionAuxiliaryVendorProtocol___stateManagerInterface setInterface:_extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface forSelector:sel_showShareSheetWithPopoverTracker_customSharedURL_dismissCompletion_ argumentIndex:0 ofReply:0];
  v18 = (void *)_extensionAuxiliaryVendorProtocol___stateManagerInterface;
  v19 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v18 setClasses:v19 forSelector:sel_forwardMessage_toItemAtIndex_withUUID_completionHandler_ argumentIndex:0 ofReply:0];

  v20 = (void *)_extensionAuxiliaryVendorProtocol___stateManagerInterface;
  v21 = [MEMORY[0x263F62978] customExtensionCommunicationEncodedClasses];
  [v20 setClasses:v21 forSelector:sel_forwardMessage_toItemAtIndex_withUUID_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v22 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9294B0];
  v23 = (void *)_extensionAuxiliaryVendorProtocol___transitionControllerInterface;
  _extensionAuxiliaryVendorProtocol___transitionControllerInterface = v22;

  uint64_t v24 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C93B200];
  v25 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v24;

  [(id)_extensionAuxiliaryVendorProtocol___interface setInterface:_extensionAuxiliaryVendorProtocol___itemStoreInterface forSelector:sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_ argumentIndex:2 ofReply:0];
  [(id)_extensionAuxiliaryVendorProtocol___interface setInterface:_extensionAuxiliaryVendorProtocol___stateManagerInterface forSelector:sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_ argumentIndex:3 ofReply:0];
  [(id)_extensionAuxiliaryVendorProtocol___interface setInterface:_extensionAuxiliaryVendorProtocol___itemStoreInterface forSelector:sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_ argumentIndex:2 ofReply:0];
  [(id)_extensionAuxiliaryVendorProtocol___interface setInterface:_extensionAuxiliaryVendorProtocol___stateManagerInterface forSelector:sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_ argumentIndex:3 ofReply:0];
  v26 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v27 = (void *)MEMORY[0x263EFFA08];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  [v26 setClasses:v30 forSelector:sel_toolbarButtonsForTraitCollection_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v31 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v32 = (void *)MEMORY[0x263EFFA08];
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  [v31 setClasses:v34 forSelector:sel_toolbarButtonsForTraitCollection_withCompletionHandler_ argumentIndex:1 ofReply:1];

  v35 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v36 = (void *)MEMORY[0x263EFFA08];
  uint64_t v37 = objc_opt_class();
  v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  [v35 setClasses:v38 forSelector:sel_keyCommandsWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v39 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v40 = (void *)MEMORY[0x263EFFA08];
  uint64_t v41 = objc_opt_class();
  v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  [v39 setClasses:v42 forSelector:sel_keyCommandWasPerformed_ argumentIndex:0 ofReply:0];

  v43 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v44 = (void *)MEMORY[0x263EFFA08];
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  v48 = objc_msgSend(v44, "setWithObjects:", v45, v46, v47, objc_opt_class(), 0);
  [v43 setClasses:v48 forSelector:sel_setPreviewItemDisplayState_onItemAtIndex_ argumentIndex:0 ofReply:0];

  [(id)_extensionAuxiliaryVendorProtocol___interface setInterface:_extensionAuxiliaryVendorProtocol___transitionControllerInterface forSelector:sel_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler_ argumentIndex:1 ofReply:0];
  [(id)_extensionAuxiliaryVendorProtocol___interface setInterface:_extensionAuxiliaryVendorProtocol___notificationCenterInterface forSelector:sel_setNotificationCenter_ argumentIndex:0 ofReply:0];
  v49 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  uint64_t v50 = _extensionAuxiliaryVendorProtocol___networkStateProtocol;

  return [v49 setInterface:v50 forSelector:sel_getNetworkObserverWithCompletionBlock_ argumentIndex:0 ofReply:1];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_272);
  }
  uint64_t v2 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v2;
}

uint64_t __68__QLPreviewCollectionServiceContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C93B260];

  return MEMORY[0x270F9A758]();
}

- (id)_protocolHost
{
  uint64_t v2 = [(QLPreviewCollectionServiceContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_274];

  return v3;
}

void __50__QLPreviewCollectionServiceContext__protocolHost__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    uint64_t v6 = [v2 localizedDescription];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Error while calling service - %@ #Remote", (uint8_t *)&v7, 0xCu);
  }
}

- (id)_previewCollection
{
  id v2 = [(QLPreviewCollectionServiceContext *)self _principalObject];
  v3 = [v2 mainViewController];

  return v3;
}

- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _principalObject];
  [v5 configureAsAccessoryViewContainerForPreviewCollection:v4];
}

- (void)getPreviewCollectionUUIDWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v7 = [(QLPreviewCollectionServiceContext *)self _principalObject];
  uint64_t v6 = [v7 uuid];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _principalObject];
  [v5 preparePreviewCollectionForInvalidationWithCompletionHandler:v4];
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = v6;
    uint64_t v8 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
    *(_DWORD *)buf = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_DEBUG, "invalidateServiceWithCompletionHandler %@ %@ #Remote", buf, 0x16u);
  }
  id v9 = v4;
  QLRunInMainThread();
}

void __76__QLPreviewCollectionServiceContext_invalidateServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 invalidateService];

  v3 = *(void **)(a1 + 32);
  id v4 = [v3 inputItems];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__QLPreviewCollectionServiceContext_invalidateServiceWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_2642F5E08;
  id v6 = *(id *)(a1 + 40);
  [v3 completeRequestReturningItems:v4 completionHandler:v5];
}

uint64_t __76__QLPreviewCollectionServiceContext_invalidateServiceWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)invalidateService
{
}

- (void)getNetworkObserverWithCompletionBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x263F629A8];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)setNotificationCenter:(id)a3
{
  id v3 = a3;
  id v4 = +[QLNotificationCenter sharedInstance];
  [v4 setRemoteNotificationCenter:v3];
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
    [v6 setHostApplicationBundleIdentifier:v7];
  }
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
  objc_storeStrong((id *)&self->_itemProvider, a5);
  id v11 = a5;
  id v12 = a6;
  id v13 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v13 configureWithNumberOfItems:a3 currentPreviewItemIndex:a4 itemProvider:v11 stateManager:v12];
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  BOOL v7 = a7;
  objc_storeStrong((id *)&self->_itemProvider, a5);
  id v13 = a5;
  id v14 = a6;
  id v15 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v15 configureWithNumberOfItems:a3 currentPreviewItemIndex:a4 itemProvider:v13 stateManager:v14 fullScreen:v7];
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v6 setCurrentPreviewItemIndex:a3 animated:v4];
}

- (void)hostSceneWillDeactivate
{
  id v3 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
    [v5 hostSceneWillDeactivate];
  }
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v4 hostApplicationDidEnterBackground:v3];
}

- (void)hostApplicationDidBecomeActive
{
  id v2 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v2 hostApplicationDidBecomeActive];
}

- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v8 toolbarButtonsForTraitCollection:v7 withCompletionHandler:v6];
}

- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v10 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = NSStringFromSelector(a2);
    int v14 = 138412546;
    id v15 = v12;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "Service received %@ (%@) #Remote", (uint8_t *)&v14, 0x16u);
  }
  id v13 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v13 toolbarButtonPressedWithIdentifier:v7 completionHandler:v8];
}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v7 saveCurrentPreviewEditsSynchronously:v4 withCompletionHandler:v6];
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v5 prepareForActionSheetPresentationWithCompletionHandler:v4];
}

- (void)actionSheetDidDismiss
{
  id v2 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v2 actionSheetDidDismiss];
}

- (void)documentMenuActionWillBegin
{
  BOOL v3 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
    [v5 documentMenuActionWillBegin];
  }
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v5 shouldDisplayLockActivityWithCompletionHandler:v4];
}

- (void)requestLockForCurrentItem
{
  id v2 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v2 requestLockForCurrentItem];
}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v10 saveIntoPhotoLibraryMediaWithURLWrapper:v9 previewItemType:a4 completionHandler:v8];
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v5 keyCommandsWithCompletionHandler:v4];
}

- (void)keyCommandWasPerformed:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v5 keyCommandWasPerformed:v4];
}

- (void)updateTransitionWithProgress:(double)a3
{
  id v4 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v4 updateTransitionWithProgress:a3];
}

- (void)completeTransition:(BOOL)a3 withDuration:(double)a4
{
  BOOL v5 = a3;
  id v6 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v6 completeTransition:v5 withDuration:a4];
}

- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v15 startTransitionWithSourceViewProvider:v14 transitionController:v13 presenting:v8 useInteractiveTransition:v7 completionHandler:v12];
}

- (void)tearDownTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v4 tearDownTransition:v3];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v7 setAppearance:v6 animated:v4];
}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  id v4 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v4 notifyFirstTimeAppearanceWithActions:a3];
}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v5 notifyStateRestorationUserInfo:v4];
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v4 setAllowInteractiveTransitions:v3];
}

- (void)setLoadingString:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v5 setLoadingString:v4];
}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v5 overrideParentApplicationDisplayIdentifierWithIdentifier:v4];
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v5 hostViewControllerBackgroundColorChanged:v4];
}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v6 hostViewControlerTransitionToState:a3 animated:v4];
}

- (void)setIsContentManaged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v4 setIsContentManaged:v3];
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  [v7 setPreviewItemDisplayState:v6 onItemAtIndex:a4];
}

- (void)setScreenEdgePanWidth:(double)a3
{
  id v5 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
    [v7 setScreenEdgePanWidth:a3];
  }
}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
  id v9 = a3;
  char v6 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    BOOL v8 = [(QLPreviewCollectionServiceContext *)self _previewCollection];
    [v8 previewItemDisplayState:v9 wasAppliedToItemAtIndex:a4];
  }
}

- (void).cxx_destruct
{
}

@end