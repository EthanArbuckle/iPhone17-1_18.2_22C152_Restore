@interface QLPreviewCollectionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)_protocolService;
- (id)_protocolServiceWithErrorHandler:(id)a3;
- (id)_synchronousProtocolServiceWithErrorHandler:(id)a3;
- (void)actionSheetDidDismiss;
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
@end

@implementation QLPreviewCollectionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[QLPreviewCollectionServiceContext _extensionAuxiliaryVendorProtocol];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[QLPreviewCollectionServiceContext _extensionAuxiliaryHostProtocol];
}

- (id)_protocolService
{
  return [(QLPreviewCollectionHostContext *)self _protocolServiceWithErrorHandler:&__block_literal_global_3];
}

void __50__QLPreviewCollectionHostContext__protocolService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = (NSObject **)MEMORY[0x263F62940];
  v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = [v2 localizedDescription];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Error while calling the service - %@ #Remote", (uint8_t *)&v7, 0xCu);
  }
}

- (id)_protocolServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(QLPreviewCollectionHostContext *)self _auxiliaryConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__QLPreviewCollectionHostContext__protocolServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_2642F5E90;
  id v10 = v4;
  id v6 = v4;
  int v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __67__QLPreviewCollectionHostContext__protocolServiceWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F62940];
  v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Error while waiting asynchronously for the service to call the completion handler of a method - %@ #Remote", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (id)_synchronousProtocolServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(QLPreviewCollectionHostContext *)self _auxiliaryConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__QLPreviewCollectionHostContext__synchronousProtocolServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_2642F5E90;
  id v10 = v4;
  id v6 = v4;
  int v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __78__QLPreviewCollectionHostContext__synchronousProtocolServiceWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F62940];
  v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = v5;
    int v7 = [v3 localizedDescription];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_ERROR, "Error while waiting synchronously for the service to call the completion handler of a method - %@ #Remote", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)getNetworkObserverWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 getNetworkObserverWithCompletionBlock:v4];
}

- (void)setNotificationCenter:(id)a3
{
  id v4 = [(QLPreviewCollectionHostContext *)self _protocolService];
  id v3 = +[QLNotificationCenter sharedInstance];
  [v4 setNotificationCenter:v3];
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 setHostApplicationBundleIdentifier:v4];
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  BOOL v7 = a7;
  v33[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  if (!self->_jetsamBandAssertion)
  {
    uint64_t v14 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.quicklook" name:@"KeepAboveBackgroundBand"];
    v15 = [(QLPreviewCollectionHostContext *)self _auxiliaryConnection];
    v16 = v15;
    if (v15) {
      [v15 auditToken];
    }
    else {
      memset(&atoken, 0, sizeof(atoken));
    }
    uint64_t v17 = audit_token_to_pid(&atoken);

    v18 = [MEMORY[0x263F64630] targetWithPid:v17];
    id v19 = objc_alloc(MEMORY[0x263F64408]);
    v28 = (void *)v14;
    v33[0] = v14;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    v21 = (RBSAssertion *)[v19 initWithExplanation:@"Quick Look remote view service jetsam band assertion" target:v18 attributes:v20];
    jetsamBandAssertion = self->_jetsamBandAssertion;
    self->_jetsamBandAssertion = v21;

    v23 = self->_jetsamBandAssertion;
    id v29 = 0;
    LOBYTE(v20) = [(RBSAssertion *)v23 acquireWithError:&v29];
    id v24 = v29;
    if ((v20 & 1) == 0)
    {
      v25 = (NSObject **)MEMORY[0x263F62940];
      v26 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        v26 = *v25;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v24;
        _os_log_impl(&dword_217F61000, v26, OS_LOG_TYPE_ERROR, "Failed to acquire jetsam band assertion: %@ #Remote", buf, 0xCu);
      }
    }
  }
  v27 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v27 configureWithNumberOfItems:a3 currentPreviewItemIndex:a4 itemProvider:v12 stateManager:v13 fullScreen:v7];
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v6 setCurrentPreviewItemIndex:a3 animated:v4];
}

- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 configureAsAccessoryViewContainerForPreviewCollection:v4];
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _auxiliaryConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__QLPreviewCollectionHostContext_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke;
  v8[3] = &unk_2642F5E90;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 preparePreviewCollectionForInvalidationWithCompletionHandler:v6];
}

void __95__QLPreviewCollectionHostContext_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F62940];
  id v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = v5;
    BOOL v7 = [v3 localizedDescription];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_ERROR, "Error while waiting for the completion handler of preparePreviewCollectionForInvalidationWithCompletionHandler to be called - %@ #Remote", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (void)invalidateService
{
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__QLPreviewCollectionHostContext_invalidateServiceWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_2642F5EB8;
  aBlock[4] = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__QLPreviewCollectionHostContext_invalidateServiceWithCompletionHandler___block_invoke_28;
  v9[3] = &unk_2642F5E90;
  id v10 = v6;
  id v7 = v6;
  uint64_t v8 = [(QLPreviewCollectionHostContext *)self _protocolServiceWithErrorHandler:v9];
  [v8 invalidateServiceWithCompletionHandler:v7];
}

uint64_t __73__QLPreviewCollectionHostContext_invalidateServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    id v10 = 0;
    char v3 = [v2 invalidateSyncWithError:&v10];
    id v4 = v10;
    if ((v3 & 1) == 0)
    {
      id v5 = (NSObject **)MEMORY[0x263F62940];
      id v6 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_DEFAULT, "Failed to invalidate jetsam band assertion: %@ #Remote", buf, 0xCu);
      }
    }
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __73__QLPreviewCollectionHostContext_invalidateServiceWithCompletionHandler___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPreviewCollectionUUIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 getPreviewCollectionUUIDWithCompletionHandler:v4];
}

- (void)hostSceneWillDeactivate
{
  id v2 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v2 hostSceneWillDeactivate];
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v4 hostApplicationDidEnterBackground:v3];
}

- (void)hostApplicationDidBecomeActive
{
  id v2 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v2 hostApplicationDidBecomeActive];
}

- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v8 toolbarButtonsForTraitCollection:v7 withCompletionHandler:v6];
}

- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = (NSObject **)MEMORY[0x263F62940];
  id v10 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    id v12 = NSStringFromSelector(a2);
    int v14 = 138412546;
    v15 = v12;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "Host context is calling %@ on the service (%@) #Remote", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v13 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v13 toolbarButtonPressedWithIdentifier:v7 completionHandler:v8];
}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v4)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __93__QLPreviewCollectionHostContext_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke;
    v15[3] = &unk_2642F5E90;
    id v8 = &v16;
    id v16 = v6;
    id v9 = v6;
    uint64_t v10 = [(QLPreviewCollectionHostContext *)self _synchronousProtocolServiceWithErrorHandler:v15];
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __93__QLPreviewCollectionHostContext_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke_2;
    v13[3] = &unk_2642F5E90;
    id v8 = &v14;
    id v14 = v6;
    id v11 = v6;
    uint64_t v10 = [(QLPreviewCollectionHostContext *)self _protocolServiceWithErrorHandler:v13];
  }
  id v12 = (void *)v10;

  [v12 saveCurrentPreviewEditsSynchronously:v4 withCompletionHandler:v7];
}

uint64_t __93__QLPreviewCollectionHostContext_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 0x7FFFFFFFFFFFFFFFLL, 0);
  }
  return result;
}

uint64_t __93__QLPreviewCollectionHostContext_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 0x7FFFFFFFFFFFFFFFLL, 0);
  }
  return result;
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 prepareForActionSheetPresentationWithCompletionHandler:v4];
}

- (void)actionSheetDidDismiss
{
  id v2 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v2 actionSheetDidDismiss];
}

- (void)documentMenuActionWillBegin
{
  id v2 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v2 documentMenuActionWillBegin];
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__QLPreviewCollectionHostContext_shouldDisplayLockActivityWithCompletionHandler___block_invoke;
  v7[3] = &unk_2642F5E90;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(QLPreviewCollectionHostContext *)self _protocolServiceWithErrorHandler:v7];
  [v6 shouldDisplayLockActivityWithCompletionHandler:v5];
}

uint64_t __81__QLPreviewCollectionHostContext_shouldDisplayLockActivityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)requestLockForCurrentItem
{
  id v2 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v2 requestLockForCurrentItem];
}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v10 saveIntoPhotoLibraryMediaWithURLWrapper:v9 previewItemType:a4 completionHandler:v8];
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 keyCommandsWithCompletionHandler:v4];
}

- (void)keyCommandWasPerformed:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 keyCommandWasPerformed:v4];
}

- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v15 startTransitionWithSourceViewProvider:v14 transitionController:v13 presenting:v8 useInteractiveTransition:v7 completionHandler:v12];
}

- (void)tearDownTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v4 tearDownTransition:v3];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v7 setAppearance:v6 animated:v4];
}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  id v4 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v4 notifyFirstTimeAppearanceWithActions:a3];
}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 notifyStateRestorationUserInfo:v4];
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v4 setAllowInteractiveTransitions:v3];
}

- (void)setLoadingString:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 setLoadingString:v4];
}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 overrideParentApplicationDisplayIdentifierWithIdentifier:v4];
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v5 hostViewControllerBackgroundColorChanged:v4];
}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v6 hostViewControlerTransitionToState:a3 animated:v4];
}

- (void)setIsContentManaged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v4 setIsContentManaged:v3];
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v7 setPreviewItemDisplayState:v6 onItemAtIndex:a4];
}

- (void)setScreenEdgePanWidth:(double)a3
{
  id v4 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v4 setScreenEdgePanWidth:a3];
}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(QLPreviewCollectionHostContext *)self _protocolService];
  [v7 previewItemDisplayState:v6 wasAppliedToItemAtIndex:a4];
}

- (void).cxx_destruct
{
}

@end