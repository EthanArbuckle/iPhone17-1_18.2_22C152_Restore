@interface AFUISiriRemoteSceneViewController
+ (id)exportedInterface;
+ (id)remoteObjectInterface;
- (AFApplicationInfo)viewServiceApplicationInfo;
- (AFUISiriRemoteSceneViewController)init;
- (AFUISiriRemoteSceneViewControllerDataSource)dataSource;
- (AFUISiriRemoteSceneViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (NSXPCConnection)remoteConnection;
- (id)_connection;
- (id)serviceViewControllerProxy;
- (id)serviceViewControllerProxyWithErrorHandler:(id)a3;
- (id)sessionDelegate;
- (void)_audioCategoriesDisablingVolumeHUDDidChangeTo:(id)a3;
- (void)_handleInvalidationForReason:(unint64_t)a3 explanation:(id)a4;
- (void)_handleSceneDidActivateWithIdentifier:(id)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4;
- (void)applicationDidBecomeActive;
- (void)applicationWillEnterForeground;
- (void)applicationWillResignActive;
- (void)dealloc;
- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4;
- (void)didReceiveBugButtonLongPress;
- (void)didReceiveHelpAction;
- (void)didReceiveOrbViewTapToCancelRequest;
- (void)didReceiveReportBugAction;
- (void)didReceiveShortTapActionWithRequestOptions:(id)a3;
- (void)didSuccessfullyHandleCommandsInDelayedActionCommand:(id)a3;
- (void)dismissSiriResults;
- (void)emitInstrumentationEvent:(id)a3;
- (void)emitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4;
- (void)emitUIStateTransitionForSiriDismissalWithDismissalReason:(int)a3 completion:(id)a4;
- (void)getScreenshotWithReplyHandler:(id)a3;
- (void)handlePasscodeUnlockWithCompletion:(id)a3;
- (void)hasContentAtPoint:(CGPoint)a3 completion:(id)a4;
- (void)inputTypeDidChange:(int64_t)a3;
- (void)invalidate;
- (void)invalidateSystemApertureAssertion;
- (void)openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 completion:(id)a6;
- (void)orientationWillChangeTo:(int64_t)a3;
- (void)preloadPluginBundles;
- (void)preloadPresentationBundleWithIdentifier:(id)a3;
- (void)presentationDidPresentKeyboard;
- (void)presentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4;
- (void)pulseHelpButton;
- (void)reduceOrbOpacity:(BOOL)a3;
- (void)requestHostBlurVisible:(BOOL)a3 reason:(int64_t)a4 fence:(id)a5;
- (void)requestSystemApertureCollapse;
- (void)sceneController:(id)a3 willInvalidateScene:(id)a4 forReason:(unint64_t)a5;
- (void)serviceBulletinWithIdentifier:(id)a3 replyHandler:(id)a4;
- (void)serviceCancelHIDEventDefferal;
- (void)serviceDidDetectAudioRoutePickerTap;
- (void)serviceDidDetectMicButtonLongPressBegan;
- (void)serviceDidDetectMicButtonLongPressEnded;
- (void)serviceDidDetectMicButtonTap;
- (void)serviceDidDismissViewControllerWithStatusBarStyle:(int64_t)a3;
- (void)serviceDidEndEditing;
- (void)serviceDidEnterUITrackingMode;
- (void)serviceDidExitUITrackingMode;
- (void)serviceDidPresentConversationFromBreadcrumb;
- (void)serviceDidPresentUserInterface;
- (void)serviceDidPresentViewControllerWithStatusBarStyle:(int64_t)a3;
- (void)serviceDidRequestCurrentTextInput:(id)a3;
- (void)serviceDidRequestKeyboard:(BOOL)a3;
- (void)serviceDidRequestKeyboard:(BOOL)a3 minimized:(BOOL)a4;
- (void)serviceDidResetTextInput;
- (void)servicePresentationDidChangePeekMode:(unint64_t)a3;
- (void)servicePresentationDidChangeVisualState:(unint64_t)a3;
- (void)servicePresentedIntentWithBundleId:(id)a3;
- (void)serviceRequestsActivationSourceWithReplyHandler:(id)a3;
- (void)serviceRequestsDismissalWithUserInfo:(id)a3 withReason:(int64_t)a4;
- (void)serviceRequestsHIDEventDefferal;
- (void)serviceStartGuidedAccess;
- (void)serviceStartRequestWithOptions:(id)a3;
- (void)serviceUserRelevantEventDidOccur;
- (void)serviceViewControllerRequestsDismissalWithDismissalReason:(int64_t)a3 completion:(id)a4;
- (void)serviceViewControllerRequestsKeyboardWithCompletion:(id)a3;
- (void)serviceViewControllerRequestsPresentation:(id)a3;
- (void)serviceViewControllerWillChangeKeyboardVisibility:(BOOL)a3;
- (void)serviceWillBeginEditing;
- (void)serviceWillDismissViewControllerWithStatusBarStyle:(int64_t)a3;
- (void)serviceWillPresentViewControllerWithStatusBarStyle:(int64_t)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setBugReportingAvailable:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDockFrame:(CGRect)a3;
- (void)setFullScreenDimmingLayerVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setHelpButtonEmphasized:(BOOL)a3;
- (void)setRemoteConnection:(id)a3;
- (void)setRequestHandlingStatus:(unint64_t)a3;
- (void)setRequestOptions:(id)a3;
- (void)setSession:(id)a3;
- (void)setShouldDismissForSwipesOutsideContent:(BOOL)a3;
- (void)setShouldDismissForTapOutsideContent:(BOOL)a3;
- (void)setShouldDismissForTapsOutsideContent:(BOOL)a3;
- (void)setShouldPassTouchesThroughToSpringBoard:(BOOL)a3;
- (void)setStatusBarFrame:(CGRect)a3;
- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setStatusViewDisabled:(BOOL)a3;
- (void)setStatusViewHeight:(double)a3;
- (void)setStatusViewHidden:(BOOL)a3;
- (void)setStatusViewUserInteractionEnabled:(BOOL)a3;
- (void)setSystemContentFrame:(CGRect)a3;
- (void)setTypeToSiriViewHidden:(BOOL)a3;
- (void)setWaitingForTelephonyToStart:(BOOL)a3;
- (void)showAppUnlockForAppId:(id)a3 completion:(id)a4;
- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5;
- (void)siriDidActivateFromSource:(int64_t)a3;
- (void)siriDidDeactivate;
- (void)siriDidHidePasscodeUnlock;
- (void)siriIdleAndQuietStatusDidChange:(BOOL)a3;
- (void)siriKeyboardViewDidChange:(id *)a3;
- (void)siriResultsDidDismissInTamale;
- (void)siriWillActivateFromSource:(int64_t)a3;
- (void)siriWillBePresented:(int64_t)a3;
- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4;
- (void)siriWillHidePasscodeUnlockForResult:(int64_t)a3;
- (void)siriWillShowPasscodeUnlock;
- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3;
- (void)startHostingSceneForConfiguration:(id)a3 withCompletionBlock:(id)a4;
- (void)startRequestForText:(id)a3;
- (void)takeScreenshotWithCompletion:(id)a3;
- (void)toggleHomeAffordanceHidden:(BOOL)a3;
- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3;
- (void)updateEdgeLightWindowLevel:(int64_t)a3;
- (void)updateRemoteSceneWithFrontMostAppInterfaceOrientation:(int64_t)a3;
- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation AFUISiriRemoteSceneViewController

- (AFUISiriRemoteSceneViewController)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)AFUISiriRemoteSceneViewController;
  v2 = [(AFUISceneHostingViewController *)&v5 init];
  if (v2)
  {
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "-[AFUISiriRemoteSceneViewController init]";
      __int16 v8 = 2112;
      v9 = v2;
      _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
  }
  return v2;
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    objc_super v5 = "-[AFUISiriRemoteSceneViewController invalidate]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Asked to invalidate XPC connection to Siri.app", (uint8_t *)&v4, 0xCu);
  }
  [(NSXPCConnection *)self->_remoteConnection invalidate];
}

- (id)_connection
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  remoteConnection = self->_remoteConnection;
  if (!remoteConnection)
  {
    int v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[AFUISiriRemoteSceneViewController _connection]";
      _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Setting up new XPC connection to Siri.app", buf, 0xCu);
    }
    objc_super v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.siri.app" options:0];
    uint64_t v6 = self->_remoteConnection;
    self->_remoteConnection = v5;

    self->_connectionHasBeenResumed = 0;
    objc_initWeak((id *)buf, self);
    v7 = (void *)MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
    v9 = self->_remoteConnection;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __48__AFUISiriRemoteSceneViewController__connection__block_invoke;
    v24[3] = &unk_264691BF0;
    id v10 = v7;
    id v25 = v7;
    objc_copyWeak(&v26, (id *)buf);
    [(NSXPCConnection *)v9 setInvalidationHandler:v24];
    v11 = self->_remoteConnection;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __48__AFUISiriRemoteSceneViewController__connection__block_invoke_3;
    v21 = &unk_264691BF0;
    id v12 = v7;
    id v22 = v7;
    objc_copyWeak(&v23, (id *)buf);
    [(NSXPCConnection *)v11 setInterruptionHandler:&v18];
    v13 = self->_remoteConnection;
    v14 = objc_msgSend((id)objc_opt_class(), "remoteObjectInterface", v18, v19, v20, v21);
    [(NSXPCConnection *)v13 setRemoteObjectInterface:v14];

    v15 = self->_remoteConnection;
    v16 = [(id)objc_opt_class() exportedInterface];
    [(NSXPCConnection *)v15 setExportedInterface:v16];

    [(NSXPCConnection *)self->_remoteConnection setExportedObject:self];
    [(NSXPCConnection *)self->_remoteConnection _setQueue:MEMORY[0x263EF83A0]];
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
    remoteConnection = self->_remoteConnection;
  }

  return remoteConnection;
}

void __48__AFUISiriRemoteSceneViewController__connection__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__AFUISiriRemoteSceneViewController__connection__block_invoke_2;
  block[3] = &unk_2646919D8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __48__AFUISiriRemoteSceneViewController__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidated];
}

void __48__AFUISiriRemoteSceneViewController__connection__block_invoke_3(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__AFUISiriRemoteSceneViewController__connection__block_invoke_4;
  block[3] = &unk_2646919D8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __48__AFUISiriRemoteSceneViewController__connection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _interrupted];
}

+ (id)exportedInterface
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D642E38];
  id v3 = (void *)MEMORY[0x263EFFA08];
  v7[0] = objc_opt_class();
  int v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  objc_super v5 = [v3 setWithArray:v4];

  [v2 setClasses:v5 forSelector:sel_serviceStartRequestWithOptions_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)remoteObjectInterface
{
  v17[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D6669F0];
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D645808];
  [v2 setInterface:v3 forSelector:sel_setSession_ argumentIndex:0 ofReply:0];

  int v4 = (void *)MEMORY[0x263EFFA08];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  uint64_t v6 = [v4 setWithArray:v5];

  [v2 setClasses:v6 forSelector:sel_siriSessionGetRequestContextWithCompletionHandler_ argumentIndex:0 ofReply:1];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_siriSessionDidUpdateRecognitionWithPhrases_utterances_refId_ argumentIndex:0 ofReply:0];

  id v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_siriSessionDidUpdateRecognitionWithPhrases_utterances_refId_ argumentIndex:1 ofReply:0];

  v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:sel_siriSessionDidInitializeSessionInfo_ argumentIndex:0 ofReply:0];

  v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:sel_siriSessionDidUpdateSessionInfo_ argumentIndex:0 ofReply:0];

  v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v15 forSelector:sel_siriSessionDidReceivePlayContentCommand_completion_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)serviceViewControllerProxy
{
  v2 = [(AFUISiriRemoteSceneViewController *)self _connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)serviceViewControllerProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AFUISiriRemoteSceneViewController *)self _connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__AFUISiriRemoteSceneViewController_serviceViewControllerProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_264691C18;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __80__AFUISiriRemoteSceneViewController_serviceViewControllerProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __80__AFUISiriRemoteSceneViewController_serviceViewControllerProxyWithErrorHandler___block_invoke_cold_1(v4, v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_invalidated
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSXPCConnection *)self->_remoteConnection processIdentifier];
  id v4 = (void *)[[NSString alloc] initWithFormat:@"Connection to Siri.app was invalidated pid=%d _remoteConnection=%@", v3, self->_remoteConnection];
  objc_super v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AFUISiriRemoteSceneViewController _invalidated]";
    __int16 v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp %@", buf, 0x16u);
  }
  [(NSXPCConnection *)self->_remoteConnection setExportedObject:0];
  [(AFUISceneHostingViewController *)self invalidateSceneForReason:5 explanation:v4];
}

- (void)_interrupted
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s #xpcSiriApp %@", v2, v3, v4, v5, 2u);
}

- (void)startHostingSceneForConfiguration:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__AFUISiriRemoteSceneViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke;
  v10[3] = &unk_264691C40;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)AFUISiriRemoteSceneViewController;
  [(AFUISceneHostingViewController *)&v9 startHostingSceneForConfiguration:v6 withCompletionBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __91__AFUISiriRemoteSceneViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    objc_copyWeak(&v7, (id *)(a1 + 40));
    SiriUIInvokeOnMainQueue();
    objc_destroyWeak(&v7);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
}

void __91__AFUISiriRemoteSceneViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _connection];
  if (!WeakRetained[1144])
  {
    WeakRetained[1144] = 1;
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[AFUISiriRemoteSceneViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke_2";
      _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp resuming connection after startHostingSceneForConfiguration", (uint8_t *)&v4, 0xCu);
    }
    [v2 resume];
  }
}

- (void)sceneController:(id)a3 willInvalidateScene:(id)a4 forReason:(unint64_t)a5
{
  if (a5 <= 5) {
    self->_expectingInvalidation = 0x1010100uLL >> (8 * a5);
  }
}

- (void)_handleInvalidationForReason:(unint64_t)a3 explanation:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  id v7 = v6;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __78__AFUISiriRemoteSceneViewController__handleInvalidationForReason_explanation___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *((unsigned __int8 *)WeakRetained + 1160);
      uint64_t v5 = *(void *)(a1 + 48);
      id v6 = v3;
      id v7 = +[AFUISceneConfiguration stringForInvalidationReason:v5];
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 136315906;
      id v12 = "-[AFUISiriRemoteSceneViewController _handleInvalidationForReason:explanation:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = v4;
      __int16 v15 = 2112;
      v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp expectingInvalidation=%i reason=%@ explanation=%@", (uint8_t *)&v11, 0x26u);
    }
    [WeakRetained[149] invalidate];
    objc_super v9 = [WeakRetained delegate];
    uint64_t v10 = v9;
    if (*((unsigned char *)WeakRetained + 1160))
    {
      [v9 siriRemoteViewControllerDidFinishDismissing:WeakRetained];
      *((unsigned char *)WeakRetained + 1160) = 0;
    }
    else
    {
      [v9 siriRemoteViewController:WeakRetained invalidatedForReason:*(void *)(a1 + 48) explanation:*(void *)(a1 + 32)];
    }
  }
}

- (void)_audioCategoriesDisablingVolumeHUDDidChangeTo:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  id v6 = v5;
  audioCategoriesDisablingVolumeHUD = self->_audioCategoriesDisablingVolumeHUD;
  if (v5 && audioCategoriesDisablingVolumeHUD)
  {
    if (-[NSArray isEqualToArray:](v5, "isEqualToArray:")) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (audioCategoriesDisablingVolumeHUD != v5)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, a3);
    objc_initWeak(&location, self);
    objc_copyWeak(&v9, &location);
    uint64_t v8 = v6;
    SiriUIInvokeOnMainQueue();

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
LABEL_7:
}

void __83__AFUISiriRemoteSceneViewController__audioCategoriesDisablingVolumeHUDDidChangeTo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained delegate];
    [v3 siriRemoteViewController:v4 didUpdateAudioCategoriesDisablingVolumeHUD:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)_handleSceneDidActivateWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  id v5 = v4;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __75__AFUISiriRemoteSceneViewController__handleSceneDidActivateWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained delegate];

    id WeakRetained = v5;
    if (v3)
    {
      id v4 = [v5 delegate];
      if (objc_opt_respondsToSelector()) {
        [v4 siriRemoteViewController:v5 sceneDidActivateWithIdentifier:*(void *)(a1 + 32)];
      }

      id WeakRetained = v5;
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriRemoteSceneViewController;
  [(AFUISiriRemoteSceneViewController *)&v4 viewDidAppear:a3];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[AFUISiriRemoteSceneViewController viewDidAppear:]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s AFUIRemoteViewController's view did appear", buf, 0xCu);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[AFUISiriRemoteSceneViewController viewDidDisappear:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)AFUISiriRemoteSceneViewController;
  [(AFUISiriRemoteSceneViewController *)&v6 viewDidDisappear:v3];
}

- (id)sessionDelegate
{
  return [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_2];
}

void __52__AFUISiriRemoteSceneViewController_sessionDelegate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __52__AFUISiriRemoteSceneViewController_sessionDelegate__block_invoke_cold_1();
  }
}

- (void)serviceRequestsActivationSourceWithReplyHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(AFUISiriRemoteSceneViewController *)self delegate];
    (*((void (**)(id, uint64_t))a3 + 2))(v5, [v6 siriRemoteViewControllerRequestsActivationSource:self]);
  }
}

- (void)serviceRequestsDismissalWithUserInfo:(id)a3 withReason:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = SASDismissalReasonGetName();
    int v11 = 136315394;
    id v12 = "-[AFUISiriRemoteSceneViewController serviceRequestsDismissalWithUserInfo:withReason:]";
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v10 dismissSiriRemoteViewController:self userInfo:v6 withReason:a4];
}

- (void)serviceStartGuidedAccess
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 startGuidedAccessForRemoteViewController:self];
}

- (void)serviceBulletinWithIdentifier:(id)a3 replyHandler:(id)a4
{
  if (a4)
  {
    id v7 = a4;
    id v8 = a3;
    id v10 = [(AFUISiriRemoteSceneViewController *)self dataSource];
    uint64_t v9 = [v10 siriRemoteViewController:self bulletinWithIdentifier:v8];

    (*((void (**)(id, void *))a4 + 2))(v7, v9);
  }
}

- (void)serviceStartRequestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self startRequestWithOptions:v4];
}

- (void)serviceUserRelevantEventDidOccur
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 userRelevantEventDidOccurInSiriRemoteViewController:self];
}

- (void)serviceDidRequestCurrentTextInput:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self didRequestCurrentTextInputWithReplyHandler:v4];
}

- (void)siriIdleAndQuietStatusDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self siriIdleAndQuietStatusDidChange:v3];
}

- (void)setStatusViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self setStatusViewHidden:v3];
}

- (void)setTypeToSiriViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self setTypeToSiriViewHidden:v3];
}

- (void)setFullScreenDimmingLayerVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v7 siriRemoteViewController:self setFullScreenDimmingLayerVisible:v5 animated:v4];
}

- (void)inputTypeDidChange:(int64_t)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self inputTypeDidChange:a3];
}

- (void)setStatusViewDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self setStatusViewDisabled:v3];
}

- (void)setStatusViewUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self setStatusViewUserInteractionEnabled:v3];
}

- (void)serviceWillPresentViewControllerWithStatusBarStyle:(int64_t)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self willPresentViewControllerWithStatusBarStyle:a3];
}

- (void)serviceDidPresentViewControllerWithStatusBarStyle:(int64_t)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self didPresentViewControllerWithStatusBarStyle:a3];
}

- (void)serviceWillDismissViewControllerWithStatusBarStyle:(int64_t)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self willDismissViewControllerWithStatusBarStyle:a3];
}

- (void)serviceDidDismissViewControllerWithStatusBarStyle:(int64_t)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self didDismissViewControllerWithStatusBarStyle:a3];
}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v7 siriRemoteViewController:self setStatusBarHidden:v5 animated:v4];
}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v9 siriRemoteViewController:self setStatusBarHidden:v6 animated:v5 completion:v8];
}

- (void)setHelpButtonEmphasized:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self setHelpButtonEmphasized:v3];
}

- (void)setBugReportingAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self setBugReportingAvailable:v3];
}

- (void)setRequestHandlingStatus:(unint64_t)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self setRequestHandlingStatus:a3];
}

- (void)getScreenshotWithReplyHandler:(id)a3
{
  if (a3)
  {
    BOOL v3 = (void (**)(id, void *))a3;
    BOOL v4 = (const void *)UICreateScreenImage();
    BOOL v6 = [MEMORY[0x263F827E8] imageWithCGImage:v4];
    id v5 = UIImagePNGRepresentation(v6);
    v3[2](v3, v5);

    if (v4) {
      CFRelease(v4);
    }
  }
}

- (void)handlePasscodeUnlockWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self handlePasscodeUnlockWithCompletion:v4];
}

- (void)pulseHelpButton
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerPulseHelpButton:self];
}

- (void)serviceDidRequestKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self didRequestKeyboard:v3];
}

- (void)serviceDidRequestKeyboard:(BOOL)a3 minimized:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v7 siriRemoteViewController:self didRequestKeyboard:v5 minimized:v4];
}

- (void)serviceDidResetTextInput
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidResetTextInput:self];
}

- (void)serviceViewControllerRequestsKeyboardWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self requestsKeyboardWithCompletion:v4];
}

- (void)serviceWillBeginEditing
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerWillBeginEditing:self];
}

- (void)serviceDidEndEditing
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidEndEditing:self];
}

- (void)serviceRequestsHIDEventDefferal
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerRequestsHIDEventDefferal:self];
}

- (void)serviceCancelHIDEventDefferal
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerCancelHIDEventDefferal:self];
}

- (void)serviceDidEnterUITrackingMode
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidEnterUITrackingMode:self];
}

- (void)serviceDidExitUITrackingMode
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidExitUITrackingMode:self];
}

- (void)serviceDidPresentUserInterface
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidPresentUserInterface:self];
}

- (void)openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v13 openURL:v12 bundleId:v11 inPlace:v6 completion:v10];
}

- (void)serviceDidDetectMicButtonTap
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidDetectMicButtonTap:self];
}

- (void)serviceDidDetectMicButtonLongPressBegan
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidDetectMicButtonLongPressBegan:self];
}

- (void)serviceDidDetectMicButtonLongPressEnded
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidDetectMicButtonLongPressEnded:self];
}

- (void)servicePresentationDidChangePeekMode:(unint64_t)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self didChangePresentationPeekMode:a3];
}

- (void)servicePresentationDidChangeVisualState:(unint64_t)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriRemoteSceneViewController *)self delegate];
    [v7 siriRemoteViewController:self didChangePresentationVisualState:a3];
  }
}

- (void)serviceDidPresentConversationFromBreadcrumb
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidPresentConversationFromBreadcrumb:self];
}

- (void)serviceDidDetectAudioRoutePickerTap
{
  id v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v3 siriRemoteViewControllerDidDetectAudioRoutePickerTap:self];
}

- (void)serviceViewControllerRequestsPresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self requestsPresentation:v4];
}

- (void)serviceViewControllerRequestsDismissalWithDismissalReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = SASDismissalReasonGetName();
    int v11 = 136315394;
    id v12 = "-[AFUISiriRemoteSceneViewController serviceViewControllerRequestsDismissalWithDismissalReason:completion:]";
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation dismissal requested %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v10 siriRemoteViewController:self requestsDismissalWithReason:a3 withCompletion:v6];
}

- (void)servicePresentedIntentWithBundleId:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self presentedIntentWithBundleId:v4];
}

- (void)setShouldDismissForTapOutsideContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriRemoteSceneViewController *)self delegate];
    [v7 setShouldDismissForTapOutsideContent:v3];
  }
}

- (void)setShouldDismissForTapsOutsideContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriRemoteSceneViewController *)self delegate];
    [v7 setShouldDismissForTapsOutsideContent:v3];
  }
}

- (void)setShouldDismissForSwipesOutsideContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriRemoteSceneViewController *)self delegate];
    [v7 setShouldDismissForSwipesOutsideContent:v3];
  }
}

- (void)requestHostBlurVisible:(BOOL)a3 reason:(int64_t)a4 fence:(id)a5
{
  id v6 = a5;
  id v5 = v6;
  SiriUIInvokeOnMainQueue();
}

void __73__AFUISiriRemoteSceneViewController_requestHostBlurVisible_reason_fence___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestBlurVisible:*(unsigned __int8 *)(a1 + 56) reason:*(void *)(a1 + 48) fence:*(void *)(a1 + 40)];
}

- (void)reduceOrbOpacity:(BOOL)a3
{
}

void __54__AFUISiriRemoteSceneViewController_reduceOrbOpacity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 siriRemoteViewController:*(void *)(a1 + 32) reduceOrbOpacity:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setShouldPassTouchesThroughToSpringBoard:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AFUISiriRemoteSceneViewController *)self delegate];
    [v7 setShouldPassTouchesThroughToSpringBoard:v3];
  }
}

- (void)requestSystemApertureCollapse
{
  BOOL v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
    [v5 requestSystemApertureCollapse];
  }
}

- (void)invalidateSystemApertureAssertion
{
  BOOL v3 = [(AFUISiriRemoteSceneViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
    [v5 invalidateSystemApertureAssertion];
  }
}

- (void)presentationDidPresentKeyboard
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 siriRemoteViewControllerDidPresentKeyboard:self];
  }
}

- (void)toggleHomeAffordanceHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v4 toggleHomeAffordanceHidden:v3];
}

- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v4 toggleSiriHomeAffordanceGestureControl:v3];
}

- (void)updateEdgeLightWindowLevel:(int64_t)a3
{
  id v4 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v4 updateEdgeLightWindowLevel:a3];
}

- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __115__AFUISiriRemoteSceneViewController_updateToPresentationWithIdentifier_presentationProperties_animated_completion___block_invoke;
  void v17[3] = &unk_264691CE0;
  id v18 = v10;
  id v11 = v10;
  id v12 = a6;
  id v13 = a4;
  int v14 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v17];
  uint64_t v15 = v14;
  if (v12) {
    v16 = v12;
  }
  else {
    v16 = &__block_literal_global_169;
  }
  [v14 updateToPresentationWithIdentifier:v11 presentationProperties:v13 animated:v7 completion:v16];
}

void __115__AFUISiriRemoteSceneViewController_updateToPresentationWithIdentifier_presentationProperties_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __115__AFUISiriRemoteSceneViewController_updateToPresentationWithIdentifier_presentationProperties_animated_completion___block_invoke_cold_1();
  }
}

- (void)setDockFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_171];
  BOOL v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", x, y, width, height);
  [v8 setDockFrameValue:v7];
}

void __50__AFUISiriRemoteSceneViewController_setDockFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __50__AFUISiriRemoteSceneViewController_setDockFrame___block_invoke_cold_1();
  }
}

- (void)updateRemoteSceneWithFrontMostAppInterfaceOrientation:(int64_t)a3
{
  id v4 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_174];
  [v4 setHostFrontMostAppOrientation:a3];
}

void __91__AFUISiriRemoteSceneViewController_updateRemoteSceneWithFrontMostAppInterfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __91__AFUISiriRemoteSceneViewController_updateRemoteSceneWithFrontMostAppInterfaceOrientation___block_invoke_cold_1();
  }
}

- (void)siriWillActivateFromSource:(int64_t)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_176];
  id v4 = [MEMORY[0x263F82438] sharedApplication];
  objc_msgSend(v5, "setHostFrontMostAppOrientation:", objc_msgSend(v4, "_frontMostAppOrientation"));

  [v5 siriWillActivateFromSource:a3];
}

void __64__AFUISiriRemoteSceneViewController_siriWillActivateFromSource___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __64__AFUISiriRemoteSceneViewController_siriWillActivateFromSource___block_invoke_cold_1();
  }
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  id v4 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_179];
  [v4 siriDidActivateFromSource:a3];
}

void __63__AFUISiriRemoteSceneViewController_siriDidActivateFromSource___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __63__AFUISiriRemoteSceneViewController_siriDidActivateFromSource___block_invoke_cold_1();
  }
}

- (void)setRequestOptions:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __55__AFUISiriRemoteSceneViewController_setRequestOptions___block_invoke;
  v7[3] = &unk_264691CE0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v7];
  [v6 setRequestOptions:v5];
}

void __55__AFUISiriRemoteSceneViewController_setRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __55__AFUISiriRemoteSceneViewController_setRequestOptions___block_invoke_cold_1();
  }
}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __77__AFUISiriRemoteSceneViewController_preloadPresentationBundleWithIdentifier___block_invoke;
  v7[3] = &unk_264691CE0;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v7];
  [v6 preloadPresentationBundleWithIdentifier:v5];
}

void __77__AFUISiriRemoteSceneViewController_preloadPresentationBundleWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __77__AFUISiriRemoteSceneViewController_preloadPresentationBundleWithIdentifier___block_invoke_cold_1();
  }
}

- (void)preloadPluginBundles
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_181];
  [v2 preloadPluginBundles];
}

void __57__AFUISiriRemoteSceneViewController_preloadPluginBundles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __57__AFUISiriRemoteSceneViewController_preloadPluginBundles__block_invoke_cold_1();
  }
}

- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__AFUISiriRemoteSceneViewController_showPresentationWithIdentifier_properties_lockState___block_invoke;
  v12[3] = &unk_264691CE0;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v12];
  [v11 showPresentationWithIdentifier:v10 properties:v9 lockState:a5];
}

void __89__AFUISiriRemoteSceneViewController_showPresentationWithIdentifier_properties_lockState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __89__AFUISiriRemoteSceneViewController_showPresentationWithIdentifier_properties_lockState___block_invoke_cold_1();
  }
}

- (void)showAppUnlockForAppId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__AFUISiriRemoteSceneViewController_showAppUnlockForAppId_completion___block_invoke;
  v10[3] = &unk_264691CE0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a4;
  id v9 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v10];
  [v9 showAppUnlockForAppId:v7 completion:v8];
}

void __70__AFUISiriRemoteSceneViewController_showAppUnlockForAppId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __70__AFUISiriRemoteSceneViewController_showAppUnlockForAppId_completion___block_invoke_cold_1();
  }
}

- (void)siriWillBePresented:(int64_t)a3
{
  id v4 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_183];
  [v4 siriWillBePresented:a3];
}

void __57__AFUISiriRemoteSceneViewController_siriWillBePresented___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __57__AFUISiriRemoteSceneViewController_siriWillBePresented___block_invoke_cold_1();
  }
}

- (void)siriDidDeactivate
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke;
  aBlock[3] = &unk_2646919D8;
  objc_copyWeak(&v15, &location);
  BOOL v3 = _Block_copy(aBlock);
  id v4 = [(AFUISiriRemoteSceneViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AFUISiriRemoteSceneViewController *)self delegate];
    [v6 siriRemoteViewControllerDidDeactivateScene:self];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_2;
  v12[3] = &unk_264691C18;
  id v7 = v3;
  id v13 = v7;
  id v8 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v12];
  [v8 setHostFrontMostAppOrientation:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_189;
  v10[3] = &unk_264691AC8;
  id v9 = v7;
  id v11 = v9;
  [v8 siriDidDeactivateWithCompletion:v10];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained invalidate];
    [v2 invalidateSceneForReason:1 explanation:@"Invalidating because [AFUISiriRemoteSceneViewController siriDidDeactivate]"];
    id WeakRetained = v2;
  }
}

void __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_189(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didReceiveOrbViewTapToCancelRequest
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_191];
  [v2 didReceiveOrbViewTapToCancelRequest];
}

void __72__AFUISiriRemoteSceneViewController_didReceiveOrbViewTapToCancelRequest__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __72__AFUISiriRemoteSceneViewController_didReceiveOrbViewTapToCancelRequest__block_invoke_cold_1();
  }
}

- (void)siriWillShowPasscodeUnlock
{
}

- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_193];
  [v4 siriWillShowPasscodeUnlockAndCancelRequest:v3];
}

void __80__AFUISiriRemoteSceneViewController_siriWillShowPasscodeUnlockAndCancelRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __80__AFUISiriRemoteSceneViewController_siriWillShowPasscodeUnlockAndCancelRequest___block_invoke_cold_1();
  }
}

- (void)siriWillHidePasscodeUnlockForResult:(int64_t)a3
{
  id v4 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_195];
  [v4 siriWillHidePasscodeUnlockForResult:a3];
}

void __73__AFUISiriRemoteSceneViewController_siriWillHidePasscodeUnlockForResult___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __73__AFUISiriRemoteSceneViewController_siriWillHidePasscodeUnlockForResult___block_invoke_cold_1();
  }
}

- (void)siriDidHidePasscodeUnlock
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_197];
  [v2 siriDidHidePasscodeUnlock];
}

void __62__AFUISiriRemoteSceneViewController_siriDidHidePasscodeUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __62__AFUISiriRemoteSceneViewController_siriDidHidePasscodeUnlock__block_invoke_cold_1();
  }
}

- (void)startRequestForText:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_199];
  [v5 startRequestForText:v4];
}

void __57__AFUISiriRemoteSceneViewController_startRequestForText___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __57__AFUISiriRemoteSceneViewController_startRequestForText___block_invoke_cold_1();
  }
}

- (void)siriKeyboardViewDidChange:(id *)a3
{
  id v4 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_201];
  [v4 siriKeyboardViewDidChange:a3];
}

void __63__AFUISiriRemoteSceneViewController_siriKeyboardViewDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __63__AFUISiriRemoteSceneViewController_siriKeyboardViewDidChange___block_invoke_cold_1();
  }
}

- (void)setStatusBarFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_203];
  id v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", x, y, width, height);
  [v8 setStatusBarFrameValue:v7];
}

void __55__AFUISiriRemoteSceneViewController_setStatusBarFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __55__AFUISiriRemoteSceneViewController_setStatusBarFrame___block_invoke_cold_1();
  }
}

- (void)setStatusViewHeight:(double)a3
{
  id v5 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_205];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setStatusViewHeightNumber:v4];
}

void __57__AFUISiriRemoteSceneViewController_setStatusViewHeight___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __57__AFUISiriRemoteSceneViewController_setStatusViewHeight___block_invoke_cold_1();
  }
}

- (void)setBottomContentInset:(double)a3
{
  id v4 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_208];
  [v4 setBottomContentInset:a3];
}

void __59__AFUISiriRemoteSceneViewController_setBottomContentInset___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __59__AFUISiriRemoteSceneViewController_setBottomContentInset___block_invoke_cold_1();
  }
}

- (void)setSystemContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_210];
  objc_msgSend(v7, "setSystemContentFrame:", x, y, width, height);
}

void __59__AFUISiriRemoteSceneViewController_setSystemContentFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __59__AFUISiriRemoteSceneViewController_setSystemContentFrame___block_invoke_cold_1();
  }
}

- (void)setSession:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_212];
  [v5 setSession:v4];
}

void __48__AFUISiriRemoteSceneViewController_setSession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __48__AFUISiriRemoteSceneViewController_setSession___block_invoke_cold_1();
  }
}

- (void)didReceiveHelpAction
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_214];
  [v2 didReceiveHelpAction];
}

void __57__AFUISiriRemoteSceneViewController_didReceiveHelpAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __57__AFUISiriRemoteSceneViewController_didReceiveHelpAction__block_invoke_cold_1();
  }
}

- (void)didReceiveReportBugAction
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_216];
  [v2 didReceiveReportBugAction];
}

void __62__AFUISiriRemoteSceneViewController_didReceiveReportBugAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __62__AFUISiriRemoteSceneViewController_didReceiveReportBugAction__block_invoke_cold_1();
  }
}

- (void)didReceiveBugButtonLongPress
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_218];
  [v2 didReceiveBugButtonLongPress];
}

void __65__AFUISiriRemoteSceneViewController_didReceiveBugButtonLongPress__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __65__AFUISiriRemoteSceneViewController_didReceiveBugButtonLongPress__block_invoke_cold_1();
  }
}

- (void)didReceiveShortTapActionWithRequestOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_220];
  [v5 didReceiveShortTapActionWIthRequestOptions:v4];
}

void __80__AFUISiriRemoteSceneViewController_didReceiveShortTapActionWithRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __80__AFUISiriRemoteSceneViewController_didReceiveShortTapActionWithRequestOptions___block_invoke_cold_1();
  }
}

- (void)applicationWillResignActive
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_222];
  [v2 hostApplicationWillResignActive];
}

void __64__AFUISiriRemoteSceneViewController_applicationWillResignActive__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __64__AFUISiriRemoteSceneViewController_applicationWillResignActive__block_invoke_cold_1();
  }
}

- (void)applicationWillEnterForeground
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_224];
  [v2 hostApplicationWillEnterForeground];
}

void __67__AFUISiriRemoteSceneViewController_applicationWillEnterForeground__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __67__AFUISiriRemoteSceneViewController_applicationWillEnterForeground__block_invoke_cold_1();
  }
}

- (void)applicationDidBecomeActive
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_226];
  [v2 hostApplicationDidBecomeActive];
}

void __63__AFUISiriRemoteSceneViewController_applicationDidBecomeActive__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __63__AFUISiriRemoteSceneViewController_applicationDidBecomeActive__block_invoke_cold_1();
  }
}

- (void)setWaitingForTelephonyToStart:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_228];
  [v4 setWaitingForTelephonyToStart:v3];
}

void __67__AFUISiriRemoteSceneViewController_setWaitingForTelephonyToStart___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __67__AFUISiriRemoteSceneViewController_setWaitingForTelephonyToStart___block_invoke_cold_1();
  }
}

- (void)hasContentAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke;
  v13[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  *(double *)&v13[4] = x;
  *(double *)&v13[5] = y;
  id v8 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v13];
  id v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke_230;
  v11[3] = &unk_264691D48;
  id v12 = v7;
  id v10 = v7;
  [v8 hasContentAtPoint:v9 completion:v11];
}

void __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke_cold_1(a1, v2);
  }
}

uint64_t __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke_230(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __68__AFUISiriRemoteSceneViewController_didDetectGestureEvent_inRegion___block_invoke;
  v7[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  void v7[4] = a3;
  v7[5] = a4;
  id v6 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v7];
  [v6 didDetectGestureEvent:a3 inRegion:a4];
}

void __68__AFUISiriRemoteSceneViewController_didDetectGestureEvent_inRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __68__AFUISiriRemoteSceneViewController_didDetectGestureEvent_inRegion___block_invoke_cold_1(a1, v4, (uint64_t)v3);
  }
}

- (void)orientationWillChangeTo:(int64_t)a3
{
  id v4 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_232];
  [v4 orientationWillChangeTo:a3];
}

void __61__AFUISiriRemoteSceneViewController_orientationWillChangeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __61__AFUISiriRemoteSceneViewController_orientationWillChangeTo___block_invoke_cold_1();
  }
}

- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  id v8[2] = __106__AFUISiriRemoteSceneViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a3;
  id v6 = a4;
  id v7 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v8];
  [v7 siriWillBeginTearDownForDismissalReason:a3 withOriginalDismissalOptions:v6];
}

void __106__AFUISiriRemoteSceneViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __106__AFUISiriRemoteSceneViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke_cold_1(a1, v4, a2);
  }
}

- (void)presentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4
{
  id v6 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_235];
  [v6 hostApplicationPresentationStateUpdatedFromPresentationState:a3 toPresentationState:a4];
}

void __103__AFUISiriRemoteSceneViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __103__AFUISiriRemoteSceneViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke_cold_1();
  }
}

- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4
{
  id v6 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_237];
  [v6 animatedDisappearanceDidBeginWithDuration:a4 reason:a3];
}

void __86__AFUISiriRemoteSceneViewController_animatedDisappearanceDidBeginWithDuration_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __86__AFUISiriRemoteSceneViewController_animatedDisappearanceDidBeginWithDuration_reason___block_invoke_cold_1();
  }
}

- (void)dismissSiriResults
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_239];
  [v2 dismissSiriResults];
}

void __55__AFUISiriRemoteSceneViewController_dismissSiriResults__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __55__AFUISiriRemoteSceneViewController_dismissSiriResults__block_invoke_cold_1();
  }
}

- (void)siriResultsDidDismissInTamale
{
  id v2 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v2 siriResultsDidDismissInTamale];
}

- (void)serviceViewControllerWillChangeKeyboardVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self delegate];
  [v5 siriRemoteViewController:self willChangeKeyboardVisibility:v3];
}

- (void)emitUIStateTransitionForSiriDismissalWithDismissalReason:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  id v8[2] = __105__AFUISiriRemoteSceneViewController_emitUIStateTransitionForSiriDismissalWithDismissalReason_completion___block_invoke;
  v8[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
  int v9 = a3;
  id v6 = a4;
  id v7 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:v8];
  [v7 hostApplicationRequestsEmitUIStateTransitionForSiriDismissalWithReason:v4 completion:v6];
}

void __105__AFUISiriRemoteSceneViewController_emitUIStateTransitionForSiriDismissalWithDismissalReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __105__AFUISiriRemoteSceneViewController_emitUIStateTransitionForSiriDismissalWithDismissalReason_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_242];
  [v5 hostApplicationRequestsEmitInstrumentationEvent:v4];
}

void __62__AFUISiriRemoteSceneViewController_emitInstrumentationEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __62__AFUISiriRemoteSceneViewController_emitInstrumentationEvent___block_invoke_cold_1();
  }
}

- (void)emitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_244];
  [v7 hostApplicationRequestsEmitInstrumentationEvent:v6 atTime:a4];
}

void __69__AFUISiriRemoteSceneViewController_emitInstrumentationEvent_atTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __69__AFUISiriRemoteSceneViewController_emitInstrumentationEvent_atTime___block_invoke_cold_1();
  }
}

- (void)didSuccessfullyHandleCommandsInDelayedActionCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_246];
  [v5 hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:v4];
}

void __89__AFUISiriRemoteSceneViewController_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __89__AFUISiriRemoteSceneViewController_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke_cold_1();
  }
}

- (void)takeScreenshotWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriRemoteSceneViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_248];
  [v5 hostApplicationRequestsScreenshotWithCompletion:v4];
}

void __66__AFUISiriRemoteSceneViewController_takeScreenshotWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __66__AFUISiriRemoteSceneViewController_takeScreenshotWithCompletion___block_invoke_cold_1();
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[AFUISiriRemoteSceneViewController dealloc]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriRemoteSceneViewController;
  [(AFUISiriRemoteSceneViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return MEMORY[0x270F72808](self, a2);
}

- (AFUISiriRemoteSceneViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (AFUISiriRemoteSceneViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (AFUISiriRemoteSceneViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUISiriRemoteSceneViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AFApplicationInfo)viewServiceApplicationInfo
{
  return self->_viewServiceApplicationInfo;
}

- (NSXPCConnection)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteConnection, 0);
  objc_storeStrong((id *)&self->_viewServiceApplicationInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
}

void __80__AFUISiriRemoteSceneViewController_serviceViewControllerProxyWithErrorHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a1;
  objc_super v4 = [a2 localizedDescription];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_223099000, v3, OS_LOG_TYPE_ERROR, "%s error talking to remote proxy: %@", (uint8_t *)v5, 0x16u);
}

void __52__AFUISiriRemoteSceneViewController_sessionDelegate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to perform operation on session delegate: %{public}@", v2, v3, v4, v5, 2u);
}

void __115__AFUISiriRemoteSceneViewController_updateToPresentationWithIdentifier_presentationProperties_animated_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_223099000, v0, v1, "%s Unable to update service view controller with new presentation identifier %@: %{public}@", v2);
}

void __50__AFUISiriRemoteSceneViewController_setDockFrame___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to set service view controller's dock frame: %{public}@", v2, v3, v4, v5, 2u);
}

void __91__AFUISiriRemoteSceneViewController_updateRemoteSceneWithFrontMostAppInterfaceOrientation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about updated frontMostAppOrientation: %{public}@", v2, v3, v4, v5, 2u);
}

void __64__AFUISiriRemoteSceneViewController_siriWillActivateFromSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about willActivate: %{public}@", v2, v3, v4, v5, 2u);
}

void __63__AFUISiriRemoteSceneViewController_siriDidActivateFromSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about didActivate: %{public}@", v2, v3, v4, v5, 2u);
}

void __55__AFUISiriRemoteSceneViewController_setRequestOptions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_223099000, v0, v1, "%s Unable to set service view controller request options %{public}@: %{public}@", v2);
}

void __77__AFUISiriRemoteSceneViewController_preloadPresentationBundleWithIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_223099000, v0, v1, "%s Unable to instruct service view controller to preloadPresentationBundleWithIdentifier: \"%{public}@\", error: %{public}@", v2);
}

void __57__AFUISiriRemoteSceneViewController_preloadPluginBundles__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to instruct service view controller to preloadPluginBundles, error: %{public}@", v2, v3, v4, v5, 2u);
}

void __89__AFUISiriRemoteSceneViewController_showPresentationWithIdentifier_properties_lockState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_223099000, v0, v1, "%s Unable to instruct service view controller to show the presentation \"%{public}@\": %{public}@", v2);
}

void __70__AFUISiriRemoteSceneViewController_showAppUnlockForAppId_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_223099000, v0, v1, "%s Unable to instruct service view controller to show app unlock for appId \"%@\": %{public}@", v2);
}

void __57__AFUISiriRemoteSceneViewController_siriWillBePresented___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about siriWillBePresented: %{public}@", v2, v3, v4, v5, 2u);
}

void __54__AFUISiriRemoteSceneViewController_siriDidDeactivate__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about didDeactivate: %{public}@", v2, v3, v4, v5, 2u);
}

void __72__AFUISiriRemoteSceneViewController_didReceiveOrbViewTapToCancelRequest__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about didReceiveOrbViewTapToCancelRequest: %{public}@", v2, v3, v4, v5, 2u);
}

void __80__AFUISiriRemoteSceneViewController_siriWillShowPasscodeUnlockAndCancelRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about showing passcode unlock: %{public}@", v2, v3, v4, v5, 2u);
}

void __73__AFUISiriRemoteSceneViewController_siriWillHidePasscodeUnlockForResult___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about will hide passcode unlock: %{public}@", v2, v3, v4, v5, 2u);
}

void __62__AFUISiriRemoteSceneViewController_siriDidHidePasscodeUnlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about did hide passcode unlock: %{public}@", v2, v3, v4, v5, 2u);
}

void __57__AFUISiriRemoteSceneViewController_startRequestForText___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about starting text request: %{public}@", v2, v3, v4, v5, 2u);
}

void __63__AFUISiriRemoteSceneViewController_siriKeyboardViewDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Type2Siri: Unable to notify service view controller about keyboard info: %{public}@", v2, v3, v4, v5, 2u);
}

void __55__AFUISiriRemoteSceneViewController_setStatusBarFrame___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to set service view controller's status bar frame: %{public}@", v2, v3, v4, v5, 2u);
}

void __57__AFUISiriRemoteSceneViewController_setStatusViewHeight___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to set service view controller's status view height: %{public}@", v2, v3, v4, v5, 2u);
}

void __59__AFUISiriRemoteSceneViewController_setBottomContentInset___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s #compact Unable to set service view controller's bottom content inset: %{public}@", v2, v3, v4, v5, 2u);
}

void __59__AFUISiriRemoteSceneViewController_setSystemContentFrame___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s #compact Unable to set service view controller's system content frame: %{public}@", v2, v3, v4, v5, 2u);
}

void __48__AFUISiriRemoteSceneViewController_setSession___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to set session of service view controller: %{public}@", v2, v3, v4, v5, 2u);
}

void __57__AFUISiriRemoteSceneViewController_didReceiveHelpAction__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to send help action: %{public}@", v2, v3, v4, v5, 2u);
}

void __62__AFUISiriRemoteSceneViewController_didReceiveReportBugAction__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to report bug: %{public}@", v2, v3, v4, v5, 2u);
}

void __65__AFUISiriRemoteSceneViewController_didReceiveBugButtonLongPress__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to send bug button long press: %{public}@", v2, v3, v4, v5, 2u);
}

void __80__AFUISiriRemoteSceneViewController_didReceiveShortTapActionWithRequestOptions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to send short tap action: %{public}@", v2, v3, v4, v5, 2u);
}

void __64__AFUISiriRemoteSceneViewController_applicationWillResignActive__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about hostApplicationWillResignActive: %{public}@", v2, v3, v4, v5, 2u);
}

void __67__AFUISiriRemoteSceneViewController_applicationWillEnterForeground__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about hostApplicationWillEnterForeground: %{public}@", v2, v3, v4, v5, 2u);
}

void __63__AFUISiriRemoteSceneViewController_applicationDidBecomeActive__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about hostApplicationDidBecomeActive: %{public}@", v2, v3, v4, v5, 2u);
}

void __67__AFUISiriRemoteSceneViewController_setWaitingForTelephonyToStart___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about setWaitingForTelephonyToStart: %{public}@", v2, v3, v4, v5, 2u);
}

void __66__AFUISiriRemoteSceneViewController_hasContentAtPoint_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  CGFloat v2 = *(double *)(a1 + 32);
  CGFloat v3 = *(double *)(a1 + 40);
  uint64_t v4 = a2;
  v8.double x = v2;
  v8.double y = v3;
  uint64_t v5 = NSStringFromCGPoint(v8);
  v6[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_223099000, v4, OS_LOG_TYPE_ERROR, "%s Unable to check if there is content at point: %@", (uint8_t *)v6, 0x16u);
}

void __68__AFUISiriRemoteSceneViewController_didDetectGestureEvent_inRegion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  uint64_t v5 = SiriSharedUIGestureEventDescription();
  uint64_t v6 = SiriSharedUIGestureEventRegionDescription();
  int v7 = 136315906;
  CGPoint v8 = "-[AFUISiriRemoteSceneViewController didDetectGestureEvent:inRegion:]_block_invoke";
  __int16 v9 = 2112;
  id v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  _os_log_error_impl(&dword_223099000, v4, OS_LOG_TYPE_ERROR, "%s #dismissal Unable to notify service view controller of gesture event %@ in region %@ with error: %{public}@", (uint8_t *)&v7, 0x2Au);
}

void __61__AFUISiriRemoteSceneViewController_orientationWillChangeTo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to invalidate assertion for orientation if needed for this siri request: %{public}@", v2, v3, v4, v5, 2u);
}

void __106__AFUISiriRemoteSceneViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = [a3 description];
  int v7 = 136315650;
  CGPoint v8 = "-[AFUISiriRemoteSceneViewController siriWillBeginTearDownForDismissalReason:withOriginalDismissalOptions:]_block_invoke";
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  id v12 = v6;
  _os_log_error_impl(&dword_223099000, v5, OS_LOG_TYPE_ERROR, "%s Unable to notify service view controller about siriWillBeginTearDownForDismissalReason:%lu error:%@", (uint8_t *)&v7, 0x20u);
}

void __103__AFUISiriRemoteSceneViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about presentationStateUpdatedFromPresentationState:toPresentationState: %{public}@", v2, v3, v4, v5, 2u);
}

void __86__AFUISiriRemoteSceneViewController_animatedDisappearanceDidBeginWithDuration_reason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller of animatedDisappearanceDidBeginWithDuration: %{public}@", v2, v3, v4, v5, 2u);
}

void __55__AFUISiriRemoteSceneViewController_dismissSiriResults__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s @dismissal Unable to notify service view controller of dismissSiriResult with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __105__AFUISiriRemoteSceneViewController_emitUIStateTransitionForSiriDismissalWithDismissalReason_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(a1 + 32);
  int v4 = 136315650;
  uint64_t v5 = "-[AFUISiriRemoteSceneViewController emitUIStateTransitionForSiriDismissalWithDismissalReason:completion:]_block_invoke";
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s Unable to notify service view controller about emitUIStateTransitionForSiriDismissal:%d: %{public}@", (uint8_t *)&v4, 0x1Cu);
}

void __62__AFUISiriRemoteSceneViewController_emitInstrumentationEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about emitInstrumentationEvent: %{public}@", v2, v3, v4, v5, 2u);
}

void __69__AFUISiriRemoteSceneViewController_emitInstrumentationEvent_atTime___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about emitInstrumentationEvent: %{public}@", v2, v3, v4, v5, 2u);
}

void __89__AFUISiriRemoteSceneViewController_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about didSuccessfullyHandleCommandsInDelayedActionCommand : %{public}@", v2, v3, v4, v5, 2u);
}

void __66__AFUISiriRemoteSceneViewController_takeScreenshotWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unable to notify service view controller about takeScreenshot: %{public}@", v2, v3, v4, v5, 2u);
}

@end