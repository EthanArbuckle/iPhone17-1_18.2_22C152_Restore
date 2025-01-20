@interface _UIKeyboardArbiterClientHandle
+ (id)handlerWithArbiter:(id)a3 forConnection:(id)a4;
- (BOOL)_isKeyboardOnScreen:(id)a3;
- (BOOL)_shouldRejectSceneIdentityUpdateCorrectingClientIfNeeded:(id)a3 fromSelector:(SEL)a4;
- (BOOL)active;
- (BOOL)deactivating;
- (BOOL)hasDebugInformationEntitlement;
- (BOOL)hasHostedPids;
- (BOOL)inputUIHost;
- (BOOL)isAcquiringFocus;
- (BOOL)isHandlerShowableWithHandler:(id)a3;
- (BOOL)isHostingPID:(int)a3;
- (BOOL)isKeyboardOnScreen;
- (BOOL)isViewService;
- (BOOL)multipleScenes;
- (BOOL)requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus;
- (BOOL)requiresInputUIForAutofillUIOnly;
- (BOOL)running;
- (BOOL)takeProcessAssertionOnRemoteWithQueue:(id)a3;
- (BOOL)wantsFence;
- (FBSCAContextSceneLayer)sceneLayer;
- (NSString)bundleIdentifier;
- (NSXPCConnection)connection;
- (RBSProcessHandle)processHandle;
- (UIKBArbiterClientFocusContext)remoteFocusContext;
- (double)iavHeight;
- (double)level;
- (id)description;
- (id)pendingNotifyKeyboardChanged;
- (id)sceneDescription;
- (int)prevActiveIdentifier;
- (int)processIdentifier;
- (int)suppressionCount;
- (unint64_t)wantedState;
- (void)_deactivateScene;
- (void)_reevaluateRemoteFocusContext:(id)a3;
- (void)activeProcessResign;
- (void)addHostedPids:(id)a3;
- (void)applicationShouldFocusWithBundle:(id)a3 onCompletion:(id)a4;
- (void)beginAcquiringFocusOnQueue:(id)a3;
- (void)cacheWindowContext;
- (void)checkActivation:(unint64_t)a3;
- (void)clearAcquiringFocus;
- (void)dealloc;
- (void)didAttachLayer;
- (void)didDetachLayer;
- (void)focusApplicationWithProcessIdentifier:(int)a3 context:(id)a4 onCompletion:(id)a5;
- (void)focusApplicationWithProcessIdentifier:(int)a3 context:(id)a4 stealingKeyboard:(BOOL)a5 onCompletion:(id)a6;
- (void)invalidate;
- (void)notifyHostedPIDsOfSuppression:(BOOL)a3;
- (void)notifyHostedPIDsOfSuppression:(BOOL)a3 active:(BOOL)a4;
- (void)notifyIAVHeight:(double)a3;
- (void)releaseProcessAssertion;
- (void)retrieveDebugInformation:(id)a3;
- (void)retrieveMoreDebugInformationWithCompletion:(id)a3;
- (void)setClientFocusContext:(id)a3;
- (void)setDeactivating:(BOOL)a3;
- (void)setHasDebugInformationEntitlement:(BOOL)a3;
- (void)setInputUIHost:(BOOL)a3;
- (void)setIsViewService:(BOOL)a3;
- (void)setKeyboardTotalDisable:(BOOL)a3 withFence:(id)a4 completionHandler:(id)a5;
- (void)setPendingNotifyKeyboardChanged:(id)a3;
- (void)setPrevActiveIdentifier:(int)a3;
- (void)setRequestedCorrectionOfClientSceneIdentityWhileAcquiringFocus:(BOOL)a3;
- (void)setRequiresInputUIForAutofillUIOnly:(BOOL)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSuppressionCount:(int)a3;
- (void)setWantsFencing:(BOOL)a3;
- (void)setWindowContextID:(unsigned int)a3 focusContext:(id)a4 windowState:(unint64_t)a5 withLevel:(double)a6;
- (void)setWindowHostingPID:(int)a3 active:(BOOL)a4;
- (void)signalAutofillUIBringupWithCompletion:(id)a3;
- (void)signalEventSourceChanged:(int64_t)a3 completionHandler:(id)a4;
- (void)signalKeyboardChangeComplete;
- (void)signalKeyboardChanged:(id)a3 onCompletion:(id)a4;
- (void)signalKeyboardClientChanged:(id)a3 onCompletion:(id)a4;
- (void)signalKeyboardUIDidChange:(id)a3 onCompletion:(id)a4;
- (void)startArbitrationWithExpectedState:(id)a3 focusContext:(id)a4 hostingPIDs:(id)a5 usingFence:(BOOL)a6 withSuppression:(int)a7 onConnected:(id)a8;
- (void)startArbitrationWithExpectedState:(id)a3 hostingPIDs:(id)a4 usingFence:(BOOL)a5 withSuppression:(int)a6 onConnected:(id)a7;
- (void)transition:(id)a3 eventStage:(unint64_t)a4 withInfo:(id)a5;
- (void)uncacheWindowContext;
- (void)updateSuspensionCountForPids:(id)a3 active:(BOOL)a4;
@end

@implementation _UIKeyboardArbiterClientHandle

- (void)setDeactivating:(BOOL)a3
{
  self->_deactivating = a3;
  if (!a3)
  {
    v4 = [(_UIKeyboardArbiterClientHandle *)self pendingNotifyKeyboardChanged];

    if (v4)
    {
      v5 = [(_UIKeyboardArbiterClientHandle *)self pendingNotifyKeyboardChanged];
      ((void (**)(void, _UIKeyboardArbiterClientHandle *))v5)[2](v5, self);

      [(_UIKeyboardArbiterClientHandle *)self setPendingNotifyKeyboardChanged:0];
    }
  }
}

- (id)pendingNotifyKeyboardChanged
{
  return self->_pendingNotifyKeyboardChanged;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_running) {
    v5 = &stru_26D891F00;
  }
  else {
    v5 = @" (suspended)";
  }
  v6 = @"YES";
  if (self->_active) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (self->_wantedState) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (self->_keyboardOnScreen) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if (!self->_acquiringFocus) {
    v6 = @"NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; %@ <%@>%@; hosting PIDs %@; level %f; active %@ [wants %@]; suppression %i; iav %f; on screen %@; isAcquiringFocus: %@>",
               v4,
               self,
               self->_processHandle,
               self->_remoteFocusContext,
               v5,
               self->_hostedPids,
               *(void *)&self->_level,
               v7,
               v8,
               self->_suppressionCount,
               *(void *)&self->_iavHeight,
               v9,
               v6);
}

- (void)notifyIAVHeight:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v6 = _UIArbiterLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = NSStringFromSelector(a2);
    int v8 = 138412802;
    v9 = self;
    __int16 v10 = 2112;
    v11 = v7;
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_debug_impl(&dword_225660000, v6, OS_LOG_TYPE_DEBUG, "[%@] %@: %f", (uint8_t *)&v8, 0x20u);
  }
  if (self->_iavHeight != a3)
  {
    self->_iavHeight = a3;
    [(_UIKeyboardArbiter *)self->_owner notifyHeightUpdated:self];
  }
}

- (void)startArbitrationWithExpectedState:(id)a3 focusContext:(id)a4 hostingPIDs:(id)a5 usingFence:(BOOL)a6 withSuppression:(int)a7 onConnected:(id)a8
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  memset(v35, 0, sizeof(v35));
  v17 = _UIArbiterLog();
  os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  v18 = NSStringFromSelector(a2);
  int v25 = 138413314;
  v26 = self;
  __int16 v27 = 2112;
  v28 = v18;
  __int16 v29 = 2112;
  id v30 = v13;
  __int16 v31 = 2112;
  id v32 = v14;
  __int16 v33 = 2112;
  id v34 = v15;
  LODWORD(v22) = 52;
  v19 = (_OWORD *)_os_log_send_and_compose_impl();

  v20 = +[_UIKeyboardArbiterDebug sharedInstance];
  v21 = (void *)[[NSString alloc] initWithUTF8String:v35];
  [v20 debugWithMessage:v21];

  if (v19 != v35) {
    free(v19);
  }
  self->_suppressionCount = a7;
  self->_wantsFence = a6;
  objc_storeStrong((id *)&self->_remoteFocusContext, a4);
  self->_keyboardOnScreen = [v13 keyboardOnScreen];
  self->_multipleScenes = [v13 multipleScenes];
  if (v15) {
    [(_UIKeyboardArbiterClientHandle *)self addHostedPids:v15];
  }
  [(_UIKeyboardArbiter *)self->_owner newClientConnected:self withExpectedState:v13 onConnected:v16];
  if (self->_active) {
    [(_UIKeyboardArbiterClientHandle *)self updateSuspensionCountForPids:self->_hostedPids active:1];
  }
}

- (void)addHostedPids:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableSet *)self->_hostedPids addObjectsFromArray:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_hostedPids;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "intValue", (void)v14));
        [v10 setIsViewService:1];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  owner = self->_owner;
  uint64_t childrenSuppressionCount = self->_childrenSuppressionCount;
  id v13 = [MEMORY[0x263EFFA08] setWithArray:v4];
  [(_UIKeyboardArbiter *)owner setSuppressionCount:childrenSuppressionCount ofPIDs:v13];
}

- (UIKBArbiterClientFocusContext)remoteFocusContext
{
  return (UIKBArbiterClientFocusContext *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isHostingPID:(int)a3
{
  hostedPids = self->_hostedPids;
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  LOBYTE(hostedPids) = [(NSMutableSet *)hostedPids containsObject:v4];

  return (char)hostedPids;
}

- (int)processIdentifier
{
  return [(NSXPCConnection *)self->_connection processIdentifier];
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void)beginAcquiringFocusOnQueue:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)location = 0u;
  long long v27 = 0u;
  uint64_t v6 = _UIArbiterLog();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = [(_UIKeyboardArbiterClientHandle *)self remoteFocusContext];
  uint64_t v9 = [v8 sceneIdentity];
  __int16 v10 = [v9 stringRepresentation];
  int v20 = 138412802;
  v21 = self;
  __int16 v22 = 2112;
  v23 = v7;
  __int16 v24 = 2112;
  int v25 = v10;
  LODWORD(v17) = 32;
  v11 = (id *)_os_log_send_and_compose_impl();

  __int16 v12 = +[_UIKeyboardArbiterDebug sharedInstance];
  id v13 = (void *)[[NSString alloc] initWithUTF8String:location];
  [v12 debugWithMessage:v13];

  if (v11 != location) {
    free(v11);
  }
  self->_acquiringFocus = 1;
  objc_initWeak(location, self);
  acquiringFocusTimer = self->_acquiringFocusTimer;
  if (!acquiringFocusTimer)
  {
    long long v15 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x263F3F628]) initWithIdentifier:@"com.apple.KeyboardArbiter.AcquiringFocusTimer"];
    long long v16 = self->_acquiringFocusTimer;
    self->_acquiringFocusTimer = v15;

    acquiringFocusTimer = self->_acquiringFocusTimer;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61___UIKeyboardArbiterClientHandle_beginAcquiringFocusOnQueue___block_invoke;
  v18[3] = &unk_264721778;
  objc_copyWeak(&v19, location);
  v18[4] = self;
  [(BSAbsoluteMachTimer *)acquiringFocusTimer scheduleWithFireInterval:v5 leewayInterval:v18 queue:5.0 handler:0.1];
  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
}

- (void)clearAcquiringFocus
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  memset(v19, 0, sizeof(v19));
  id v4 = _UIArbiterLog();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [(_UIKeyboardArbiterClientHandle *)self remoteFocusContext];
  uint64_t v7 = [v6 sceneIdentity];
  uint64_t v8 = [v7 stringRepresentation];
  int v13 = 138412802;
  long long v14 = self;
  __int16 v15 = 2112;
  long long v16 = v5;
  __int16 v17 = 2112;
  v18 = v8;
  LODWORD(v12) = 32;
  uint64_t v9 = (_OWORD *)_os_log_send_and_compose_impl();

  __int16 v10 = +[_UIKeyboardArbiterDebug sharedInstance];
  v11 = (void *)[[NSString alloc] initWithUTF8String:v19];
  [v10 debugWithMessage:v11];

  if (v9 != v19) {
    free(v9);
  }
  self->_acquiringFocus = 0;
  [(_UIKeyboardArbiterClientHandle *)self setRequestedCorrectionOfClientSceneIdentityWhileAcquiringFocus:0];
  [(BSAbsoluteMachTimer *)self->_acquiringFocusTimer cancel];
}

- (void)setRequestedCorrectionOfClientSceneIdentityWhileAcquiringFocus:(BOOL)a3
{
  self->_requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus = a3;
}

- (void)setClientFocusContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  memset(v22, 0, sizeof(v22));
  uint64_t v6 = _UIArbiterLog();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = [v5 sceneIdentity];
  uint64_t v9 = [v8 stringRepresentation];
  int v16 = 138412802;
  __int16 v17 = self;
  __int16 v18 = 2112;
  id v19 = v7;
  __int16 v20 = 2112;
  v21 = v9;
  LODWORD(v15) = 32;
  __int16 v10 = (_OWORD *)_os_log_send_and_compose_impl();

  v11 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v12 = (void *)[[NSString alloc] initWithUTF8String:v22];
  [v11 debugWithMessage:v12];

  if (v10 != v22) {
    free(v10);
  }
  int v13 = [v5 sceneIdentity];
  BOOL v14 = [(_UIKeyboardArbiterClientHandle *)self _shouldRejectSceneIdentityUpdateCorrectingClientIfNeeded:v13 fromSelector:a2];

  if (!v14)
  {
    [(_UIKeyboardArbiterClientHandle *)self _reevaluateRemoteFocusContext:v5];
    [(_UIKeyboardArbiter *)self->_owner reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:0];
  }
}

- (BOOL)_shouldRejectSceneIdentityUpdateCorrectingClientIfNeeded:(id)a3 fromSelector:(SEL)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(_UIKeyboardArbiterClientHandle *)self remoteFocusContext];
  uint64_t v8 = [v7 sceneIdentity];

  BOOL v9 = [(_UIKeyboardArbiterClientHandle *)self isAcquiringFocus];
  int v10 = BSEqualObjects();
  v11 = [(_UIKeyboardArbiter *)self->_owner omniscientDelegate];
  uint64_t v12 = v11;
  if (!v11 || !v9 || (v6 != 0) != (v8 != 0) || v10)
  {
  }
  else
  {
    int v13 = [(_UIKeyboardArbiterClientHandle *)self bundleIdentifier];
    int v14 = [v13 isEqualToString:@"com.apple.Spotlight"];

    if (!v14)
    {
      BOOL v15 = [(_UIKeyboardArbiterClientHandle *)self requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      int v16 = _UIArbiterLog();
      os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      __int16 v17 = NSStringFromSelector(a4);
      __int16 v18 = [v6 stringRepresentation];
      int v31 = 138412802;
      long long v32 = self;
      __int16 v33 = 2112;
      long long v34 = v17;
      __int16 v35 = 2112;
      long long v36 = v18;
      LODWORD(v30) = 32;
      id v19 = (long long *)_os_log_send_and_compose_impl();

      __int16 v20 = +[_UIKeyboardArbiterDebug sharedInstance];
      v21 = (void *)[[NSString alloc] initWithUTF8String:&v37];
      [v20 errorWithMessage:v21];

      if (v19 != &v37) {
        free(v19);
      }
      if (!v15) {
        [(_UIKeyboardArbiter *)self->_owner handlerRequestedForcedClientSceneIdentityUpdate:self];
      }
      BOOL v22 = 1;
      goto LABEL_17;
    }
  }
  if (v9)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v23 = _UIArbiterLog();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    __int16 v24 = NSStringFromSelector(a4);
    int v25 = [v6 stringRepresentation];
    int v31 = 138412802;
    long long v32 = self;
    __int16 v33 = 2112;
    long long v34 = v24;
    __int16 v35 = 2112;
    long long v36 = v25;
    LODWORD(v30) = 32;
    v26 = (long long *)_os_log_send_and_compose_impl();

    long long v27 = +[_UIKeyboardArbiterDebug sharedInstance];
    long long v28 = (void *)[[NSString alloc] initWithUTF8String:&v37];
    [v27 debugWithMessage:v28];

    if (v26 != &v37) {
      free(v26);
    }
    [(_UIKeyboardArbiterClientHandle *)self clearAcquiringFocus];
  }
  BOOL v22 = 0;
LABEL_17:

  return v22;
}

- (BOOL)isAcquiringFocus
{
  return self->_acquiringFocus;
}

- (void)_reevaluateRemoteFocusContext:(id)a3
{
  id v6 = a3;
  id v5 = +[_UIKeyboardArbiterDebug sharedInstance];
  objc_sync_enter(v5);
  objc_storeStrong((id *)&self->_remoteFocusContext, a3);
  if (([MEMORY[0x263F828A0] inputUIOOP] & 1) != 0 || self->_sceneLayer) {
    [(_UIKeyboardArbiterClientHandle *)self checkActivation:self->_wantedState];
  }
  [(_UIKeyboardArbiter *)self->_owner reevaluateSceneClientSettings];
  [(_UIKeyboardArbiter *)self->_owner updateKeyboardSceneSettings];
  objc_sync_exit(v5);
}

- (BOOL)active
{
  return self->_active;
}

- (RBSProcessHandle)processHandle
{
  return (RBSProcessHandle *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)inputUIHost
{
  return self->_inputUIHost;
}

+ (id)handlerWithArbiter:(id)a3 forConnection:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (NSXPCConnection *)a4;
  BOOL v9 = objc_alloc_init(_UIKeyboardArbiterClientHandle);
  objc_storeStrong((id *)&v9->_owner, a3);
  v9->_connection = v8;
  uint64_t v10 = [MEMORY[0x263EFF9C0] set];
  hostedPids = v9->_hostedPids;
  v9->_hostedPids = (NSMutableSet *)v10;

  v9->_running = 1;
  if (v8) {
    [(NSXPCConnection *)v8 auditToken];
  }
  else {
    memset(&atoken, 0, sizeof(atoken));
  }
  uint64_t v12 = audit_token_to_pid(&atoken);
  if (v12)
  {
    int v13 = v12;
    int v14 = [MEMORY[0x263F64580] identifierWithPid:v12];
    id v32 = 0;
    BOOL v15 = [MEMORY[0x263F64570] handleForIdentifier:v14 error:&v32];
    id v16 = v32;
    if (v16)
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      __int16 v17 = _UIArbiterLog();
      os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      int v34 = 138412802;
      id v35 = a1;
      __int16 v36 = 1024;
      LODWORD(v37[0]) = v13;
      WORD2(v37[0]) = 2112;
      *(void *)((char *)v37 + 6) = v16;
      LODWORD(v31) = 28;
      __int16 v18 = (long long *)_os_log_send_and_compose_impl();

      id v19 = +[_UIKeyboardArbiterDebug sharedInstance];
      __int16 v20 = (void *)[[NSString alloc] initWithUTF8String:&v38];
      [v19 errorWithMessage:v20];

      if (v18 != &v38) {
        free(v18);
      }
    }
    else
    {
      objc_storeStrong((id *)&v9->_processHandle, v15);
      int v25 = [v15 bundle];
      uint64_t v26 = [v25 identifier];
      bundleIdentifier = v9->_bundleIdentifier;
      v9->_bundleIdentifier = (NSString *)v26;
    }
  }
  else
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v21 = _UIArbiterLog();
    os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    int v34 = 138412546;
    id v35 = a1;
    __int16 v36 = 2112;
    v37[0] = v8;
    LODWORD(v31) = 22;
    BOOL v22 = (long long *)_os_log_send_and_compose_impl();

    uint64_t v23 = +[_UIKeyboardArbiterDebug sharedInstance];
    __int16 v24 = (void *)[[NSString alloc] initWithUTF8String:&v38];
    [v23 errorWithMessage:v24];

    if (v22 != &v38) {
      free(v22);
    }
  }
  long long v28 = [(NSXPCConnection *)v8 valueForEntitlement:@"com.apple.KeyboardArbiter.client.debuginfo"];
  int v29 = [v28 BOOLValue];

  if (v29) {
    v9->_hasDebugInformationEntitlement = 1;
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!self->_invalidated)
  {
    memset(v11, 0, sizeof(v11));
    v3 = _UIArbiterLog();
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    int v9 = 138412290;
    uint64_t v10 = self;
    LODWORD(v7) = 12;
    id v4 = (_OWORD *)_os_log_send_and_compose_impl();

    id v5 = +[_UIKeyboardArbiterDebug sharedInstance];
    id v6 = (void *)[[NSString alloc] initWithUTF8String:v11];
    [v5 errorWithMessage:v6];

    if (v4 != v11) {
      free(v4);
    }
    [(_UIKeyboardArbiter *)self->_owner handleUnexpectedDeallocForHandler:self];
  }
  if (self->_endpointGrantInjector) {
    [(_UIKeyboardArbiterClientHandle *)self didDetachLayer];
  }
  [(BSAbsoluteMachTimer *)self->_acquiringFocusTimer invalidate];
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardArbiterClientHandle;
  [(_UIKeyboardArbiterClientHandle *)&v8 dealloc];
}

- (void)updateSuspensionCountForPids:(id)a3 active:(BOOL)a4
{
  int suppressionCount = self->_suppressionCount;
  int childrenSuppressionCount = self->_childrenSuppressionCount;
  int v6 = suppressionCount - childrenSuppressionCount;
  if (suppressionCount != childrenSuppressionCount)
  {
    BOOL v7 = a4;
    self->_int childrenSuppressionCount = suppressionCount;
    if (v6 >= 0) {
      unsigned int v10 = suppressionCount - childrenSuppressionCount;
    }
    else {
      unsigned int v10 = childrenSuppressionCount - suppressionCount;
    }
    if (v10 <= 1) {
      int v11 = 1;
    }
    else {
      int v11 = v10;
    }
    do
    {
      [(_UIKeyboardArbiter *)self->_owner updateSuppression:v6 > 0 ofPIDs:a3 active:v7];
      --v11;
    }
    while (v11);
  }
}

- (void)startArbitrationWithExpectedState:(id)a3 hostingPIDs:(id)a4 usingFence:(BOOL)a5 withSuppression:(int)a6 onConnected:(id)a7
{
}

- (void)_deactivateScene
{
  BOOL v3 = [(_UIKeyboardArbiter *)self->_owner deactivateHandle:self];
  self->_active = v3;
  if (v3) {
    return;
  }
  [(_UIKeyboardArbiterClientHandle *)self updateSuspensionCountForPids:self->_hostedPids active:0];
  id v4 = [(_UIKeyboardArbiter *)self->_owner activeInputDestinationHandle];
  id v5 = self;
  if (v4 == self) {
    goto LABEL_7;
  }
  int v6 = v4;
  BOOL v7 = [(_UIKeyboardArbiter *)self->_owner focusRequestedHandle];
  if (v7 != self)
  {

    id v5 = v6;
LABEL_7:

    goto LABEL_8;
  }
  objc_super v8 = [(_UIKeyboardArbiter *)self->_owner activeInputDestinationHandle];
  int v9 = [v8 active];

  if (v9)
  {
    owner = self->_owner;
    id v5 = [(_UIKeyboardArbiter *)owner activeInputDestinationHandle];
    [(_UIKeyboardArbiter *)owner activateHandle:v5];
    goto LABEL_7;
  }
LABEL_8:
  [(_UIKeyboardArbiterClientHandle *)self activeProcessResign];
}

- (void)activeProcessResign
{
  id v8 = [(_UIKeyboardArbiter *)self->_owner handlerForPID:[(_UIKeyboardArbiterClientHandle *)self prevActiveIdentifier]];
  uint64_t hostedPids = [(_UIKeyboardArbiter *)self->_owner activeInputDestinationHandle];
  if (hostedPids)
  {
    id v4 = [(_UIKeyboardArbiter *)self->_owner activeInputDestinationHandle];

    if (v4 == self)
    {
      LODWORD(hostedPids) = 0;
    }
    else
    {
      uint64_t hostedPids = (uint64_t)self->_hostedPids;
      id v5 = NSNumber;
      int v6 = [(_UIKeyboardArbiter *)self->_owner activeInputDestinationHandle];
      BOOL v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "processIdentifier"));
      LODWORD(hostedPids) = [(id)hostedPids containsObject:v7];

      LODWORD(hostedPids) = hostedPids ^ 1;
    }
  }
  if ([v8 running]
    && (([v8 isKeyboardOnScreen] ^ 1 | hostedPids) & 1) == 0
    && ([v8 inputUIHost] & 1) == 0)
  {
    -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self->_owner, "runOperations:onHandler:fromFunction:", &__block_literal_global_502, v8, "-[_UIKeyboardArbiterClientHandle activeProcessResign]");
  }
}

- (BOOL)_isKeyboardOnScreen:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 containsObject:self])
  {
    BOOL v5 = 0;
  }
  else
  {
    [v4 addObject:self];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v6 = self->_hostedPids;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "intValue", (void)v14));
          char v12 = [v11 _isKeyboardOnScreen:v4];

          if (v12)
          {
            BOOL v5 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 0;
LABEL_13:
  }
  return v5;
}

- (BOOL)isKeyboardOnScreen
{
  if (self->_keyboardOnScreen) {
    return 1;
  }
  BOOL v3 = self;
  id v4 = [MEMORY[0x263EFF980] array];
  LOBYTE(v3) = [(_UIKeyboardArbiterClientHandle *)v3 _isKeyboardOnScreen:v4];

  return (char)v3;
}

- (void)setWindowContextID:(unsigned int)a3 focusContext:(id)a4 windowState:(unint64_t)a5 withLevel:(double)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v86 = *MEMORY[0x263EF8340];
  int v11 = (FBSCAContextSceneLayer *)a4;
  id obj = +[_UIKeyboardArbiterDebug sharedInstance];
  objc_sync_enter(obj);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  char v12 = _UIArbiterLog();
  os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  int v13 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue();
  int v44 = 138413570;
  long long v14 = @"YES";
  long long v45 = v13;
  __int16 v46 = 2112;
  long long v47 = v11;
  if (!a5) {
    long long v14 = @"NO";
  }
  __int16 v48 = 1024;
  *(_DWORD *)long long v49 = v8;
  *(_WORD *)&v49[4] = 2112;
  *(void *)&v49[6] = v14;
  __int16 v50 = 2048;
  double v51 = a6;
  __int16 v52 = 2112;
  long long v53 = self;
  LODWORD(v41) = 58;
  long long v15 = (long long *)_os_log_send_and_compose_impl();

  long long v16 = +[_UIKeyboardArbiterDebug sharedInstance];
  long long v17 = (void *)[[NSString alloc] initWithUTF8String:&v54];
  [v16 debugWithMessage:v17];

  if (v15 != &v54) {
    free(v15);
  }
  __int16 v18 = [(FBSCAContextSceneLayer *)v11 sceneIdentity];
  BOOL v19 = [(_UIKeyboardArbiterClientHandle *)self _shouldRejectSceneIdentityUpdateCorrectingClientIfNeeded:v18 fromSelector:a2];

  if (!v19)
  {
    if (a5 == 2 && ![(_UIKeyboardArbiterClientHandle *)self isKeyboardOnScreen])
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      int v34 = _UIArbiterLog();
      os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      NSStringFromSelector(a2);
      id v35 = (_UIKeyboardArbiterClientHandle *)(id)objc_claimAutoreleasedReturnValue();
      __int16 v36 = [(FBSCAContextSceneLayer *)v11 sceneIdentity];
      long long v37 = [v36 stringRepresentation];
      int v44 = 138412802;
      long long v45 = v35;
      __int16 v46 = 2112;
      long long v47 = v37;
      __int16 v48 = 2112;
      *(void *)long long v49 = self;
      LODWORD(v42) = 32;
      long long v38 = (long long *)_os_log_send_and_compose_impl();

      long long v39 = +[_UIKeyboardArbiterDebug sharedInstance];
      long long v40 = (void *)[[NSString alloc] initWithUTF8String:&v54];
      [v39 errorWithMessage:v40];

      if (v38 != &v54) {
        free(v38);
      }
    }
    else
    {
      if (([MEMORY[0x263F828A0] inputUIOOP] & 1) == 0)
      {
        sceneLayer = self->_sceneLayer;
        if (sceneLayer)
        {
          if ([(FBSCAContextSceneLayer *)sceneLayer contextID] != v8)
          {
            if (self->_active) {
              [(_UIKeyboardArbiterClientHandle *)self _deactivateScene];
            }
            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            v21 = _UIArbiterLog();
            os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
            BOOL v22 = self->_sceneLayer;
            int v44 = 138412546;
            long long v45 = self;
            __int16 v46 = 2112;
            long long v47 = v22;
            LODWORD(v42) = 22;
            uint64_t v23 = (long long *)_os_log_send_and_compose_impl();

            __int16 v24 = +[_UIKeyboardArbiterDebug sharedInstance];
            int v25 = (void *)[[NSString alloc] initWithUTF8String:&v54];
            [v24 debugWithMessage:v25];

            if (v23 != &v54) {
              free(v23);
            }
            uint64_t v26 = self->_sceneLayer;
            self->_sceneLayer = 0;
          }
        }
      }
      self->_wantedState = a5;
      self->_level = a6;
      if (([MEMORY[0x263F828A0] inputUIOOP] & 1) == 0)
      {
        if (v8)
        {
          if (!self->_sceneLayer)
          {
            if (self->_owner)
            {
              long long v27 = (FBSCAContextSceneLayer *)[objc_alloc(MEMORY[0x263F3F6E8]) initWithCAContextID:v8 level:0.0];
              long long v28 = self->_sceneLayer;
              self->_sceneLayer = v27;

              long long v84 = 0u;
              long long v85 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              int v29 = _UIArbiterLog();
              os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
              uint64_t v30 = self->_sceneLayer;
              int v44 = 138412546;
              long long v45 = self;
              __int16 v46 = 2112;
              long long v47 = v30;
              LODWORD(v42) = 22;
              uint64_t v31 = (long long *)_os_log_send_and_compose_impl();

              id v32 = +[_UIKeyboardArbiterDebug sharedInstance];
              __int16 v33 = (void *)[[NSString alloc] initWithUTF8String:&v54];
              [v32 debugWithMessage:v33];

              if (v31 != &v54) {
                free(v31);
              }
            }
          }
        }
      }
      [(_UIKeyboardArbiterClientHandle *)self _reevaluateRemoteFocusContext:v11];
    }
  }
  objc_sync_exit(obj);
}

- (void)checkActivation:(unint64_t)a3
{
  int v5 = [MEMORY[0x263F828A0] inputUIOOP];
  owner = self->_owner;
  if (v5)
  {
    uint64_t v7 = [(_UIKeyboardArbiter *)owner lastActivatedHandle];
    BOOL v8 = v7 != self;
  }
  else
  {
    uint64_t v7 = [(_UIKeyboardArbiter *)owner sceneLayer];
    uint64_t v9 = [(_UIKeyboardArbiterClientHandle *)self sceneLayer];
    BOOL v8 = v7 != v9;
  }
  if (self->_active)
  {
    BOOL v10 = a3 == 1 && v8;
    if (a3 != 2 && !v10)
    {
      if (!a3)
      {
        [(_UIKeyboardArbiterClientHandle *)self _deactivateScene];
      }
      return;
    }
  }
  else if (a3 - 1 > 1)
  {
    return;
  }
  BOOL v11 = [(_UIKeyboardArbiter *)self->_owner activateHandle:self];
  self->_active = v11;
  if (v11)
  {
    uint64_t hostedPids = self->_hostedPids;
    [(_UIKeyboardArbiterClientHandle *)self updateSuspensionCountForPids:hostedPids active:1];
  }
}

- (void)didAttachLayer
{
  if (!self->_sceneLayer)
  {
    long long v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UIKeyboardArbiter.m" lineNumber:2378 description:@"Layer must exist for us to attach visibility to."];
  }
  if (self->_endpointGrantInjector)
  {
    [(_UIKeyboardArbiterClientHandle *)self didDetachLayer];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_225660000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Keyboard attaching layer before removing prior layer...", buf, 2u);
    }
  }
  BOOL v3 = [MEMORY[0x263F3F7C8] identityForIdentifier:@"com.apple.UIKit.remote-keyboard"];
  id v4 = [getFBSceneManagerClass() sharedInstance];
  int v5 = (void *)[v4 newSceneIdentityTokenForIdentity:v3];

  int v6 = [v5 stringRepresentation];
  uint64_t v7 = _UISVisibilityEnvironmentForSceneIdentityTokenString();

  [(FBSCAContextSceneLayer *)self->_sceneLayer contextID];
  BOOL v8 = _UISVisibilityEnvironmentForUIHostedWindowContextID();
  uint64_t v9 = (void *)MEMORY[0x263F3F698];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48___UIKeyboardArbiterClientHandle_didAttachLayer__block_invoke;
  v16[3] = &unk_2647217A0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v7;
  id v10 = v7;
  id v11 = v8;
  char v12 = [v9 injectorWithConfigurator:v16];
  endpointGrantInjector = self->_endpointGrantInjector;
  self->_endpointGrantInjector = v12;
}

- (void)didDetachLayer
{
  [(BSServiceConnectionEndpointInjector *)self->_endpointGrantInjector invalidate];
  endpointGrantInjector = self->_endpointGrantInjector;
  self->_endpointGrantInjector = 0;
}

- (void)setWantsFencing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  memset(v17, 0, sizeof(v17));
  int v6 = _UIArbiterLog();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  uint64_t v7 = NSStringFromSelector(a2);
  BOOL v8 = (void *)v7;
  uint64_t v9 = @"NO";
  *(_DWORD *)long long v14 = 138412802;
  *(void *)&v14[4] = self;
  *(_WORD *)&v14[12] = 2112;
  if (v3) {
    uint64_t v9 = @"YES";
  }
  *(void *)&v14[14] = v7;
  __int16 v15 = 2112;
  long long v16 = v9;
  LODWORD(v13) = 32;
  id v10 = (_OWORD *)_os_log_send_and_compose_impl();

  id v11 = +[_UIKeyboardArbiterDebug sharedInstance];
  char v12 = (void *)[[NSString alloc] initWithUTF8String:v17];
  [v11 debugWithMessage:v12];

  if (v10 != v17) {
    free(v10);
  }
  self->_wantsFence = v3;
}

- (void)signalKeyboardUIDidChange:(id)a3 onCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  BOOL v8 = (void (**)(void))a4;
  if (+[_UIKeyboardArbiter unitTestEnvironment])
  {
    [(_UIKeyboardArbiter *)self->_owner setKeyboardUIHandle:self];
    [(_UIKeyboardArbiterClientHandle *)self setInputUIHost:1];
  }
  if ([MEMORY[0x263F828A0] inputUIOOP])
  {
    memset(v25, 0, sizeof(v25));
    uint64_t v9 = _UIArbiterLog();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    id v10 = NSStringFromSelector(a2);
    int v19 = 138412802;
    __int16 v20 = self;
    __int16 v21 = 2112;
    BOOL v22 = v10;
    __int16 v23 = 2112;
    id v24 = v7;
    LODWORD(v18) = 32;
    id v11 = (_OWORD *)_os_log_send_and_compose_impl();

    char v12 = +[_UIKeyboardArbiterDebug sharedInstance];
    uint64_t v13 = (void *)[[NSString alloc] initWithUTF8String:v25];
    [v12 debugWithMessage:v13];

    if (v11 != v25) {
      free(v11);
    }
    self->_keyboardOnScreen = [v7 keyboardOnScreen];
    -[_UIKeyboardArbiter setKeyboardScenePresentationMode:](self->_owner, "setKeyboardScenePresentationMode:", [v7 keyboardScenePresentationMode]);
    [(_UIKeyboardArbiter *)self->_owner updateKeyboardUIStatus:v7 fromHandler:self];
    long long v14 = [(_UIKeyboardArbiter *)self->_owner sceneDelegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      long long v16 = [(_UIKeyboardArbiter *)self->_owner sceneDelegate];
      id v17 = [(_UIKeyboardArbiter *)self->_owner focusContext];
      objc_msgSend(v16, "focusContext:didChangeKeyboardScenePresentationMode:", v17, -[_UIKeyboardArbiter keyboardScenePresentationMode](self->_owner, "keyboardScenePresentationMode"));
    }
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void)signalKeyboardClientChanged:(id)a3 onCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  BOOL v8 = (void (**)(void))a4;
  memset(v21, 0, sizeof(v21));
  uint64_t v9 = _UIArbiterLog();
  os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  id v10 = NSStringFromSelector(a2);
  int v15 = 138412802;
  long long v16 = self;
  __int16 v17 = 2112;
  uint64_t v18 = v10;
  __int16 v19 = 2112;
  id v20 = v7;
  LODWORD(v14) = 32;
  id v11 = (_OWORD *)_os_log_send_and_compose_impl();

  char v12 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v13 = (void *)[[NSString alloc] initWithUTF8String:v21];
  [v12 debugWithMessage:v13];

  if (v11 != v21) {
    free(v11);
  }
  self->_keyboardOnScreen = [v7 keyboardOnScreen];
  self->_multipleScenes = [v7 multipleScenes];
  [(_UIKeyboardArbiter *)self->_owner updateKeyboardStatus:v7 fromHandler:self];
  if (v8) {
    v8[2](v8);
  }
}

- (void)signalKeyboardChanged:(id)a3 onCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  BOOL v8 = (void (**)(void))a4;
  memset(v21, 0, sizeof(v21));
  uint64_t v9 = _UIArbiterLog();
  os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  id v10 = NSStringFromSelector(a2);
  int v15 = 138412802;
  long long v16 = self;
  __int16 v17 = 2112;
  uint64_t v18 = v10;
  __int16 v19 = 2112;
  id v20 = v7;
  LODWORD(v14) = 32;
  id v11 = (_OWORD *)_os_log_send_and_compose_impl();

  char v12 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v13 = (void *)[[NSString alloc] initWithUTF8String:v21];
  [v12 debugWithMessage:v13];

  if (v11 != v21) {
    free(v11);
  }
  self->_keyboardOnScreen = [v7 keyboardOnScreen];
  self->_multipleScenes = [v7 multipleScenes];
  [(_UIKeyboardArbiter *)self->_owner updateKeyboardStatus:v7 fromHandler:self];
  if (v8) {
    v8[2](v8);
  }
}

- (void)signalAutofillUIBringupWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([MEMORY[0x263F828A0] usesInputSystemUIForAutoFillOnly])
  {
    [(_UIKeyboardArbiterClientHandle *)self setRequiresInputUIForAutofillUIOnly:1];
    [(_UIKeyboardArbiter *)self->_owner reevaluateSceneClientSettings];
    if (v4) {
      v4[2]();
    }
  }
}

- (void)signalKeyboardChangeComplete
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(v14, 0, sizeof(v14));
  id v4 = _UIArbiterLog();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  int v5 = NSStringFromSelector(a2);
  int v10 = 138412546;
  id v11 = self;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  LODWORD(v9) = 22;
  int v6 = (_OWORD *)_os_log_send_and_compose_impl();

  id v7 = +[_UIKeyboardArbiterDebug sharedInstance];
  BOOL v8 = (void *)[[NSString alloc] initWithUTF8String:v14];
  [v7 debugWithMessage:v8];

  if (v6 != v14) {
    free(v6);
  }
  [(_UIKeyboardArbiter *)self->_owner completeKeyboardStatusChangedFromHandler:self];
}

- (void)setWindowHostingPID:(int)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  memset(v36, 0, sizeof(v36));
  BOOL v8 = _UIArbiterLog();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  uint64_t v9 = NSStringFromSelector(a2);
  int v10 = (void *)v9;
  id v11 = @"NO";
  int v28 = 138413058;
  int v29 = self;
  __int16 v30 = 2112;
  if (v4) {
    id v11 = @"YES";
  }
  uint64_t v31 = v9;
  __int16 v32 = 1024;
  int v33 = v5;
  __int16 v34 = 2112;
  id v35 = v11;
  LODWORD(v26) = 38;
  __int16 v12 = (_OWORD *)_os_log_send_and_compose_impl();

  uint64_t v13 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v14 = (void *)[[NSString alloc] initWithUTF8String:v36];
  [v13 debugWithMessage:v14];

  if (v12 != v36) {
    free(v12);
  }
  uint64_t v15 = [NSNumber numberWithInt:v5];
  long long v16 = (void *)v15;
  if (v4)
  {
    if (v15 && ([(NSMutableSet *)self->_hostedPids containsObject:v15] & 1) == 0)
    {
      long long v27 = v16;
      __int16 v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
      [(_UIKeyboardArbiterClientHandle *)self addHostedPids:v17];

      [(_UIKeyboardArbiter *)self->_owner reevaluateSceneClientSettings];
      if (self->_active)
      {
        uint64_t v18 = [MEMORY[0x263EFFA08] setWithObject:v16];
        [(_UIKeyboardArbiterClientHandle *)self updateSuspensionCountForPids:v18 active:self->_active];
      }
      [(_UIKeyboardArbiter *)self->_owner notifyHeightUpdated:self];
    }
  }
  else if ([(NSMutableSet *)self->_hostedPids containsObject:v15])
  {
    __int16 v19 = [(_UIKeyboardArbiter *)self->_owner handlerForPID:v5];
    [v19 notifyIAVHeight:0.0];

    [(NSMutableSet *)self->_hostedPids removeObject:v16];
    if (self->_active)
    {
      id v20 = [MEMORY[0x263EFFA08] setWithObject:v16];
      [(_UIKeyboardArbiterClientHandle *)self updateSuspensionCountForPids:v20 active:self->_active];
    }
    __int16 v21 = [(_UIKeyboardArbiter *)self->_owner handlerForPID:v5];
    uint64_t v22 = [(_UIKeyboardArbiter *)self->_owner activeInputDestinationHandle];
    if (v21 == v22)
    {
      int v23 = [v21 prevActiveIdentifier];

      if (v23)
      {
        [v21 activeProcessResign];
        [v21 setPrevActiveIdentifier:0];
      }
    }
    else
    {
    }
    [(_UIKeyboardArbiter *)self->_owner notifyHeightUpdated:self];
    owner = self->_owner;
    int v25 = [(_UIKeyboardArbiter *)owner handlerForPID:v5];
    [(_UIKeyboardArbiter *)owner notifyHeightUpdated:v25];
  }
  [(_UIKeyboardArbiter *)self->_owner checkHostingState];
}

- (void)notifyHostedPIDsOfSuppression:(BOOL)a3
{
}

- (void)notifyHostedPIDsOfSuppression:(BOOL)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  memset(v21, 0, sizeof(v21));
  BOOL v8 = _UIArbiterLog();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  uint64_t v9 = NSStringFromSelector(a2);
  int v10 = (void *)v9;
  id v11 = @"NO";
  *(_DWORD *)uint64_t v18 = 138412802;
  *(void *)&v18[4] = self;
  *(_WORD *)&v18[12] = 2112;
  if (v5) {
    id v11 = @"YES";
  }
  *(void *)&v18[14] = v9;
  __int16 v19 = 2112;
  id v20 = v11;
  LODWORD(v17) = 32;
  __int16 v12 = (_OWORD *)_os_log_send_and_compose_impl();

  uint64_t v13 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v14 = (void *)[[NSString alloc] initWithUTF8String:v21];
  [v13 debugWithMessage:v14];

  if (v12 != v21) {
    free(v12);
  }
  int suppressionCount = self->_suppressionCount;
  if (!v5)
  {
    int v16 = suppressionCount - 1;
    self->_int suppressionCount = v16;
    if (v16) {
      return;
    }
    goto LABEL_10;
  }
  self->_int suppressionCount = suppressionCount + 1;
  if (v4 && !suppressionCount)
  {
    BOOL v4 = 1;
LABEL_10:
    [(_UIKeyboardArbiterClientHandle *)self updateSuspensionCountForPids:self->_hostedPids active:v4];
  }
}

- (void)transition:(id)a3 eventStage:(unint64_t)a4 withInfo:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  id v11 = _UIArbiterLog();
  os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  __int16 v12 = NSStringFromSelector(a2);
  int v17 = 138413314;
  uint64_t v18 = self;
  __int16 v19 = 2112;
  id v20 = v12;
  __int16 v21 = 2112;
  id v22 = v9;
  __int16 v23 = 1024;
  int v24 = a4;
  __int16 v25 = 2112;
  id v26 = v10;
  LODWORD(v16) = 48;
  uint64_t v13 = (_OWORD *)_os_log_send_and_compose_impl();

  uint64_t v14 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v15 = (void *)[[NSString alloc] initWithUTF8String:v27];
  [v14 debugWithMessage:v15];

  if (v13 != v27) {
    free(v13);
  }
  [(_UIKeyboardArbiter *)self->_owner transition:v9 eventStage:a4 withInfo:v10 fromHandler:self];
}

- (void)retrieveDebugInformation:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  BOOL v5 = (void (**)(id, void *))a3;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v6 = _UIArbiterLog();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  id v7 = NSStringFromSelector(a2);
  int v18 = 138412546;
  __int16 v19 = self;
  __int16 v20 = 2112;
  __int16 v21 = v7;
  LODWORD(v16) = 22;
  BOOL v8 = (long long *)_os_log_send_and_compose_impl();

  id v9 = +[_UIKeyboardArbiterDebug sharedInstance];
  id v10 = (void *)[[NSString alloc] initWithUTF8String:&v22];
  [v9 debugWithMessage:v10];

  if (v8 != &v22) {
    free(v8);
  }
  if ([(_UIKeyboardArbiterClientHandle *)self hasDebugInformationEntitlement])
  {
    if (v5)
    {
      id v11 = [(_UIKeyboardArbiter *)self->_owner description];
      v5[2](v5, v11);
    }
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    __int16 v12 = _UIArbiterLog();
    os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    int v18 = 138412290;
    __int16 v19 = self;
    LODWORD(v17) = 12;
    uint64_t v13 = (long long *)_os_log_send_and_compose_impl();

    uint64_t v14 = +[_UIKeyboardArbiterDebug sharedInstance];
    uint64_t v15 = (void *)[[NSString alloc] initWithUTF8String:&v22];
    [v14 errorWithMessage:v15];

    if (v13 != &v22) {
      free(v13);
    }
    v5[2](v5, 0);
  }
}

- (void)retrieveMoreDebugInformationWithCompletion:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  BOOL v5 = (void (**)(id, void))a3;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v6 = _UIArbiterLog();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  id v7 = NSStringFromSelector(a2);
  int v17 = 138412546;
  int v18 = self;
  __int16 v19 = 2112;
  __int16 v20 = v7;
  LODWORD(v15) = 22;
  BOOL v8 = (long long *)_os_log_send_and_compose_impl();

  id v9 = +[_UIKeyboardArbiterDebug sharedInstance];
  id v10 = (void *)[[NSString alloc] initWithUTF8String:&v21];
  [v9 debugWithMessage:v10];

  if (v8 != &v21) {
    free(v8);
  }
  if ([(_UIKeyboardArbiterClientHandle *)self hasDebugInformationEntitlement])
  {
    [(_UIKeyboardArbiter *)self->_owner retrieveDebugInformationWithCompletion:v5];
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = _UIArbiterLog();
    os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    int v17 = 138412290;
    int v18 = self;
    LODWORD(v16) = 12;
    __int16 v12 = (long long *)_os_log_send_and_compose_impl();

    uint64_t v13 = +[_UIKeyboardArbiterDebug sharedInstance];
    uint64_t v14 = (void *)[[NSString alloc] initWithUTF8String:&v21];
    [v13 errorWithMessage:v14];

    if (v12 != &v21) {
      free(v12);
    }
    v5[2](v5, 0);
  }
}

- (id)sceneDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = [(NSXPCConnection *)self->_connection processIdentifier];
  BOOL v5 = [(UIKBArbiterClientFocusContext *)self->_remoteFocusContext sceneIdentity];
  int v6 = [v5 stringRepresentation];
  id v7 = [v3 stringWithFormat:@"<pid: %d; scene: %@>", v4, v6];

  return v7;
}

- (BOOL)isHandlerShowableWithHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = (_UIKeyboardArbiterClientHandle *)a3;
  BOOL v5 = v4;
  if (v4 && !self->_checkingShowability)
  {
    LOBYTE(v6) = 1;
    if (v4 != self)
    {
      self->_checkingShowability = 1;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      BOOL v8 = self->_hostedPids;
      uint64_t v6 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v9 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v8);
            }
            id v11 = -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "intValue", (void)v13));
            char v12 = [v11 isHandlerShowableWithHandler:v5];

            if (v12)
            {
              LOBYTE(v6) = 1;
              goto LABEL_16;
            }
          }
          uint64_t v6 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_16:

      self->_checkingShowability = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)takeProcessAssertionOnRemoteWithQueue:(id)a3
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  unint64_t remoteKeepAliveAssertionCount = self->_remoteKeepAliveAssertionCount;
  self->_unint64_t remoteKeepAliveAssertionCount = remoteKeepAliveAssertionCount + 1;
  uint64_t v6 = &loc_225679000;
  if (remoteKeepAliveAssertionCount) {
    goto LABEL_27;
  }
  pid_t v7 = [(NSXPCConnection *)self->_connection processIdentifier];
  if (v7 == getpid()) {
    goto LABEL_27;
  }
  BOOL v8 = [(_UIKeyboardArbiterClientHandle *)self description];
  if (takeProcessAssertionOnRemoteWithQueue____needsStaging != 1)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x263F64630], "targetWithPid:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
    uint64_t v19 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.UIKit.KeyboardManagement.xpc" name:@"Arbiter"];
    id v20 = objc_alloc(MEMORY[0x263F64408]);
    long long v63 = (void *)v19;
    uint64_t v75 = v19;
    long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v75 count:1];
    long long v62 = (_UIKeyboardArbiterClientHandle *)v18;
    long long v22 = (RBSAssertion *)[v20 initWithExplanation:@"com.apple.UIKit.KeyboardManagement.message" target:v18 attributes:v21];
    remoteKeepAliveAssertion = self->_remoteKeepAliveAssertion;
    self->_remoteKeepAliveAssertion = v22;

    long long v24 = self->_remoteKeepAliveAssertion;
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke_537;
    v67[3] = &unk_2647217C8;
    long long v25 = v8;
    long long v68 = v25;
    [(RBSAssertion *)v24 setInvalidationHandler:v67];
    long long v26 = self->_remoteKeepAliveAssertion;
    id v66 = 0;
    int v27 = [(RBSAssertion *)v26 acquireWithError:&v66];
    id v28 = v66;
    long long v64 = v28;
    if (v27)
    {
      long long v29 = (void *)&loc_225679000;
LABEL_23:
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v49 = _UIArbiterLog();
      os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG);
      int v71 = v29[466];
      long long v72 = v25;
      LODWORD(v60) = 12;
      long long v50 = (long long *)_os_log_send_and_compose_impl();

      long long v51 = +[_UIKeyboardArbiterDebug sharedInstance];
      long long v52 = (void *)[[NSString alloc] initWithUTF8String:&v76];
      [v51 debugWithMessage:v52];

      if (v50 != &v76) {
        free(v50);
      }

      uint64_t v6 = &loc_225679000;
      int v17 = v62;
      goto LABEL_26;
    }
    unint64_t v30 = (unint64_t)v28;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v31 = _UIArbiterLog();
    os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    int v71 = 138412546;
    long long v72 = v25;
    __int16 v73 = 2112;
    unint64_t v74 = v30;
    LODWORD(v60) = 22;
    long long v32 = (long long *)_os_log_send_and_compose_impl();

    long long v33 = +[_UIKeyboardArbiterDebug sharedInstance];
    long long v34 = (void *)[[NSString alloc] initWithUTF8String:&v76];
    [v33 errorWithMessage:v34];

    if (v32 != &v76) {
      free(v32);
    }
    long long v35 = [v64 domain];
    uint64_t v36 = *MEMORY[0x263F646B8];
    long long v29 = &loc_225679000;
    if ([v35 isEqual:*MEMORY[0x263F646B8]])
    {
      uint64_t v37 = [v64 code];

      if (v37 == 1)
      {
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v38 = _UIArbiterLog();
        os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
        int v71 = 138412290;
        long long v72 = v25;
        LODWORD(v61) = 12;
        long long v39 = (long long *)_os_log_send_and_compose_impl();

        long long v40 = +[_UIKeyboardArbiterDebug sharedInstance];
        long long v41 = (void *)[[NSString alloc] initWithUTF8String:&v76];
        [v40 errorWithMessage:v41];

        if (v39 == &v76) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
    long long v42 = [v64 domain];
    if ([v42 isEqual:v36])
    {
      long long v43 = [v64 localizedFailureReason];
      char v44 = [v43 isEqual:@"Could not find plist for domain attribute"];

      if (v44)
      {

        BOOL v45 = 0;
        goto LABEL_30;
      }
    }
    else
    {
    }
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v46 = _UIArbiterLog();
    os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    int v71 = 138412290;
    long long v72 = v25;
    LODWORD(v61) = 12;
    long long v39 = (long long *)_os_log_send_and_compose_impl();

    long long v47 = +[_UIKeyboardArbiterDebug sharedInstance];
    long long v48 = (void *)[[NSString alloc] initWithUTF8String:&v76];
    [v47 errorWithMessage:v48];

    if (v39 == &v76) {
      goto LABEL_22;
    }
LABEL_21:
    free(v39);
LABEL_22:
    takeProcessAssertionOnRemoteWithQueue____needsStaging = 1;
    goto LABEL_23;
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v9 = _UIArbiterLog();
  os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  int v71 = 138412290;
  long long v72 = v8;
  LODWORD(v60) = 12;
  id v10 = (long long *)_os_log_send_and_compose_impl();

  id v11 = +[_UIKeyboardArbiterDebug sharedInstance];
  char v12 = (void *)[[NSString alloc] initWithUTF8String:&v76];
  [v11 debugWithMessage:v12];

  if (v10 != &v76) {
    free(v10);
  }
  id v13 = objc_alloc(MEMORY[0x263F28180]);
  uint64_t v14 = [(NSXPCConnection *)self->_connection processIdentifier];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke;
  v69[3] = &unk_2647213D0;
  long long v70 = v8;
  long long v15 = (RBSAssertion *)[v13 initWithPID:v14 flags:39 reason:4 name:@"com.apple.UIKit.KeyboardManagement.message" withHandler:v69];
  long long v16 = self->_remoteKeepAliveAssertion;
  self->_remoteKeepAliveAssertion = v15;

  int v17 = v70;
  uint64_t v6 = (void *)&loc_225679000;
LABEL_26:

LABEL_27:
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v53 = _UIArbiterLog();
  os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
  unint64_t v54 = self->_remoteKeepAliveAssertionCount;
  int v71 = v6[468];
  long long v72 = self;
  __int16 v73 = 2048;
  unint64_t v74 = v54;
  LODWORD(v60) = 22;
  long long v55 = (long long *)_os_log_send_and_compose_impl();

  long long v56 = +[_UIKeyboardArbiterDebug sharedInstance];
  long long v57 = (void *)[[NSString alloc] initWithUTF8String:&v76];
  [v56 debugWithMessage:v57];

  if (v55 != &v76) {
    free(v55);
  }
  ++self->_remoteKeepAliveTimerCount;
  dispatch_time_t v58 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke_542;
  block[3] = &unk_2647211F0;
  block[4] = self;
  dispatch_after(v58, v4, block);
  BOOL v45 = 1;
LABEL_30:

  return v45;
}

- (void)releaseProcessAssertion
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v3 = self->_remoteKeepAliveAssertionCount - 1;
  self->_unint64_t remoteKeepAliveAssertionCount = v3;
  if (!v3)
  {
    [(RBSAssertion *)self->_remoteKeepAliveAssertion invalidate];
    remoteKeepAliveAssertion = self->_remoteKeepAliveAssertion;
    self->_remoteKeepAliveAssertion = 0;
  }
  memset(v15, 0, sizeof(v15));
  BOOL v5 = _UIArbiterLog();
  os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  unint64_t remoteKeepAliveAssertionCount = self->_remoteKeepAliveAssertionCount;
  int v11 = 138412546;
  char v12 = self;
  __int16 v13 = 2048;
  unint64_t v14 = remoteKeepAliveAssertionCount;
  LODWORD(v10) = 22;
  pid_t v7 = (_OWORD *)_os_log_send_and_compose_impl();

  BOOL v8 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v9 = (void *)[[NSString alloc] initWithUTF8String:v15];
  [v8 debugWithMessage:v9];

  if (v7 != v15) {
    free(v7);
  }
}

- (void)cacheWindowContext
{
  v9[3] = *MEMORY[0x263EF8340];
  if ([(_UIKeyboardArbiterClientHandle *)self active])
  {
    if (self->_wantedState)
    {
      unint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FBSCAContextSceneLayer contextID](self->_sceneLayer, "contextID"));
      v9[0] = v3;
      remoteFocusContext = self->_remoteFocusContext;
      BOOL v5 = remoteFocusContext;
      if (!remoteFocusContext)
      {
        BOOL v5 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v9[0]);
      }
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithDouble:", self->_level, v9[0], v5);
      v9[2] = v6;
      pid_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
      cachedContext = self->_cachedContext;
      self->_cachedContext = v7;

      if (!remoteFocusContext) {
    }
      }
    [(_UIKeyboardArbiterClientHandle *)self setWindowContextID:0 focusContext:0 windowState:0 withLevel:0.0];
  }
}

- (void)uncacheWindowContext
{
  if (self->_cachedContext)
  {
    if (![(_UIKeyboardArbiterClientHandle *)self active])
    {
      unint64_t v3 = [(NSArray *)self->_cachedContext objectAtIndexedSubscript:0];
      uint64_t v4 = [v3 intValue];
      BOOL v5 = [(NSArray *)self->_cachedContext objectAtIndexedSubscript:1];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        pid_t v7 = [(NSArray *)self->_cachedContext objectAtIndexedSubscript:1];
      }
      else
      {
        pid_t v7 = 0;
      }
      BOOL v8 = [(NSArray *)self->_cachedContext objectAtIndexedSubscript:2];
      -[_UIKeyboardArbiterClientHandle setWindowContextID:focusContext:windowState:withLevel:](self, "setWindowContextID:focusContext:windowState:withLevel:", v4, v7, 1, (double)(int)[v8 intValue]);

      if (isKindOfClass) {
    }
      }
    cachedContext = self->_cachedContext;
    self->_cachedContext = 0;
  }
}

- (void)invalidate
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  memset(v23, 0, sizeof(v23));
  uint64_t v4 = _UIArbiterLog();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  BOOL v5 = NSStringFromSelector(a2);
  int v19 = 138412546;
  id v20 = self;
  __int16 v21 = 2112;
  long long v22 = v5;
  LODWORD(v16) = 22;
  uint64_t v6 = (_OWORD *)_os_log_send_and_compose_impl();

  pid_t v7 = +[_UIKeyboardArbiterDebug sharedInstance];
  BOOL v8 = (void *)[[NSString alloc] initWithUTF8String:v23];
  [v7 debugWithMessage:v8];

  if (v6 != v23) {
    free(v6);
  }
  uint64_t v9 = [(_UIKeyboardArbiterClientHandle *)self description];
  owner = self->_owner;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __44___UIKeyboardArbiterClientHandle_invalidate__block_invoke;
  v17[3] = &unk_2647217F0;
  id v18 = v9;
  id v11 = v9;
  [(_UIKeyboardArbiter *)owner setKeyboardTotalDisable:0 withFence:0 fromHandler:self completionHandler:v17];
  self->_iavHeight = 0.0;
  self->_keyboardOnScreen = 0;
  [(_UIKeyboardArbiter *)self->_owner notifyHeightUpdated:self];
  [(_UIKeyboardArbiterClientHandle *)self setWindowContextID:0 focusContext:0 windowState:0 withLevel:0.0];
  char v12 = self->_owner;
  self->_owner = 0;

  self->_connection = 0;
  remoteFocusContext = self->_remoteFocusContext;
  self->_remoteFocusContext = 0;

  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = 0;

  [(RBSAssertion *)self->_remoteKeepAliveAssertion invalidate];
  remoteKeepAliveAssertion = self->_remoteKeepAliveAssertion;
  self->_remoteKeepAliveAssertion = 0;

  self->_invalidated = 1;
}

- (void)applicationShouldFocusWithBundle:(id)a3 onCompletion:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v7 = a3;
  BOOL v8 = (void (**)(id, uint64_t))a4;
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v9 = [(_UIKeyboardArbiterClientHandle *)self bundleIdentifier];
  if ([v9 isEqual:v7])
  {

    goto LABEL_5;
  }
  BOOL v10 = [(_UIKeyboardArbiterClientHandle *)self hasDebugInformationEntitlement];

  if (v10)
  {
LABEL_5:
    if (([v7 isEqualToString:&stru_26D891F00] & 1) == 0)
    {
      id v11 = [(_UIKeyboardArbiter *)self->_owner handlerForBundleID:v7];
LABEL_8:
      char v12 = v11;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      __int16 v13 = _UIArbiterLog();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
      unint64_t v14 = NSStringFromSelector(a2);
      int v28 = 138413058;
      long long v29 = self;
      __int16 v30 = 2112;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 2114;
      long long v35 = v12;
      LODWORD(v27) = 42;
      long long v15 = (long long *)_os_log_send_and_compose_impl();

      uint64_t v16 = +[_UIKeyboardArbiterDebug sharedInstance];
      int v17 = (void *)[[NSString alloc] initWithUTF8String:&v36];
      [v16 debugWithMessage:v17];

      if (v15 != &v36) {
        free(v15);
      }
      if (v12
        && (([(_UIKeyboardArbiter *)self->_owner activeInputDestinationHandle],
             (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0)
         || (int v19 = (void *)v18,
             [(_UIKeyboardArbiter *)self->_owner activeInputDestinationHandle],
             id v20 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue(),
             v20,
             v19,
             v12 == v20)))
      {
        owner = self->_owner;
        uint64_t v21 = 1;
        [(_UIKeyboardArbiter *)owner handlerRequestedFocus:v12 shouldStealKeyboard:1];
        if (!v8) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v21 = 0;
        if (!v8)
        {
LABEL_15:

          goto LABEL_16;
        }
      }
      v8[2](v8, v21);
      goto LABEL_15;
    }
LABEL_6:
    id v11 = self;
    goto LABEL_8;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v23 = _UIArbiterLog();
  os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
  int v28 = 138412546;
  long long v29 = self;
  __int16 v30 = 2112;
  id v31 = v7;
  LODWORD(v27) = 22;
  uint64_t v24 = (long long *)_os_log_send_and_compose_impl();

  long long v25 = +[_UIKeyboardArbiterDebug sharedInstance];
  long long v26 = (void *)[[NSString alloc] initWithUTF8String:&v36];
  [v25 errorWithMessage:v26];

  if (v24 != &v36) {
    free(v24);
  }
  v8[2](v8, 0);
LABEL_16:
}

- (void)focusApplicationWithProcessIdentifier:(int)a3 context:(id)a4 onCompletion:(id)a5
{
}

- (void)focusApplicationWithProcessIdentifier:(int)a3 context:(id)a4 stealingKeyboard:(BOOL)a5 onCompletion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v11 = a4;
  char v12 = (void (**)(id, BOOL))a6;
  if ([(_UIKeyboardArbiterClientHandle *)self processIdentifier] == v8
    || (int v13 = [(_UIKeyboardArbiterClientHandle *)self processIdentifier], v13 == getpid())
    || [(_UIKeyboardArbiterClientHandle *)self hasDebugInformationEntitlement])
  {
    unint64_t v14 = [v11 sceneIdentity];

    if (v14)
    {
      long long v15 = [(_UIKeyboardArbiter *)self->_owner handlerForPID:v8];
    }
    else
    {
      long long v15 = self;
    }
    uint64_t v16 = v15;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    int v17 = _UIArbiterLog();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    uint64_t v18 = NSStringFromSelector(a2);
    int v19 = (void *)v18;
    *(_DWORD *)id v33 = 138544386;
    id v20 = @"NO";
    *(void *)&v33[4] = self;
    if (v7) {
      id v20 = @"YES";
    }
    *(_WORD *)&v33[12] = 2114;
    *(void *)&v33[14] = v18;
    __int16 v34 = 2114;
    id v35 = v11;
    __int16 v36 = 2114;
    long long v37 = v16;
    __int16 v38 = 2114;
    long long v39 = v20;
    LODWORD(v32) = 52;
    uint64_t v21 = (long long *)_os_log_send_and_compose_impl();

    long long v22 = +[_UIKeyboardArbiterDebug sharedInstance];
    long long v23 = (void *)[[NSString alloc] initWithUTF8String:&v40];
    [v22 debugWithMessage:v23];

    if (v21 != &v40) {
      free(v21);
    }
    if (v16)
    {
      uint64_t v24 = [(_UIKeyboardArbiterClientHandle *)v16 remoteFocusContext];
      long long v25 = [v24 sceneIdentity];

      [(_UIKeyboardArbiterClientHandle *)v16 _reevaluateRemoteFocusContext:v11];
      if (v16 != self)
      {
        if ([(_UIKeyboardArbiterClientHandle *)v16 isAcquiringFocus])
        {
          long long v26 = [v11 sceneIdentity];
          char v27 = BSEqualObjects();

          if ((v27 & 1) == 0) {
            [(_UIKeyboardArbiter *)self->_owner handlerRequestedForcedClientSceneIdentityUpdate:v16];
          }
        }
      }
      [(_UIKeyboardArbiter *)self->_owner handlerRequestedFocus:v16 shouldStealKeyboard:v7];
    }
    if (v12) {
      v12[2](v12, v16 != 0);
    }
  }
  else
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    int v28 = _UIArbiterLog();
    os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    *(_DWORD *)id v33 = 138412546;
    *(void *)&v33[4] = self;
    *(_WORD *)&v33[12] = 2048;
    *(void *)&v33[14] = (int)v8;
    LODWORD(v32) = 22;
    long long v29 = (long long *)_os_log_send_and_compose_impl();

    __int16 v30 = +[_UIKeyboardArbiterDebug sharedInstance];
    id v31 = (void *)[[NSString alloc] initWithUTF8String:&v40];
    [v30 errorWithMessage:v31];

    if (v29 != &v40) {
      free(v29);
    }
    v12[2](v12, 0);
  }
}

- (void)setKeyboardTotalDisable:(BOOL)a3 withFence:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  memset(v24, 0, sizeof(v24));
  id v11 = _UIArbiterLog();
  os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  uint64_t v12 = NSStringFromSelector(a2);
  int v13 = (void *)v12;
  unint64_t v14 = @"NO";
  *(_DWORD *)int v19 = 138413058;
  *(void *)&v19[4] = self;
  if (v6) {
    unint64_t v14 = @"YES";
  }
  *(_WORD *)&v19[12] = 2112;
  *(void *)&v19[14] = v12;
  __int16 v20 = 2112;
  uint64_t v21 = v14;
  __int16 v22 = 2112;
  id v23 = v9;
  LODWORD(v18) = 42;
  long long v15 = (_OWORD *)_os_log_send_and_compose_impl();

  uint64_t v16 = +[_UIKeyboardArbiterDebug sharedInstance];
  int v17 = (void *)[[NSString alloc] initWithUTF8String:v24];
  [v16 debugWithMessage:v17];

  if (v15 != v24) {
    free(v15);
  }
  [(_UIKeyboardArbiter *)self->_owner setKeyboardTotalDisable:v6 withFence:v9 fromHandler:self completionHandler:v10];
}

- (void)signalEventSourceChanged:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  memset(v20, 0, sizeof(v20));
  uint64_t v8 = _UIArbiterLog();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  id v9 = NSStringFromSelector(a2);
  int v14 = 138412802;
  long long v15 = self;
  __int16 v16 = 2112;
  int v17 = v9;
  __int16 v18 = 1024;
  int v19 = a3;
  LODWORD(v13) = 28;
  id v10 = (_OWORD *)_os_log_send_and_compose_impl();

  id v11 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v12 = (void *)[[NSString alloc] initWithUTF8String:v20];
  [v11 debugWithMessage:v12];

  if (v10 != v20) {
    free(v10);
  }
  [(_UIKeyboardArbiter *)self->_owner signalEventSourceChanged:a3 fromHandler:self completionHandler:v7];
}

- (BOOL)hasHostedPids
{
  return [(NSMutableSet *)self->_hostedPids count] != 0;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (FBSCAContextSceneLayer)sceneLayer
{
  return (FBSCAContextSceneLayer *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)wantedState
{
  return self->_wantedState;
}

- (double)level
{
  return self->_level;
}

- (double)iavHeight
{
  return self->_iavHeight;
}

- (int)prevActiveIdentifier
{
  return self->_prevActiveIdentifier;
}

- (void)setPrevActiveIdentifier:(int)a3
{
  self->_prevActiveIdentifier = a3;
}

- (BOOL)isViewService
{
  return self->_isViewService;
}

- (void)setIsViewService:(BOOL)a3
{
  self->_isViewService = a3;
}

- (BOOL)wantsFence
{
  return self->_wantsFence;
}

- (BOOL)deactivating
{
  return self->_deactivating;
}

- (BOOL)multipleScenes
{
  return self->_multipleScenes;
}

- (int)suppressionCount
{
  return self->_suppressionCount;
}

- (void)setSuppressionCount:(int)a3
{
  self->_int suppressionCount = a3;
}

- (void)setInputUIHost:(BOOL)a3
{
  self->_inputUIHost = a3;
}

- (BOOL)hasDebugInformationEntitlement
{
  return self->_hasDebugInformationEntitlement;
}

- (void)setHasDebugInformationEntitlement:(BOOL)a3
{
  self->_hasDebugInformationEntitlement = a3;
}

- (BOOL)requiresInputUIForAutofillUIOnly
{
  return self->_requiresInputUIForAutofillUIOnly;
}

- (void)setRequiresInputUIForAutofillUIOnly:(BOOL)a3
{
  self->_requiresInputUIForAutofillUIOnly = a3;
}

- (BOOL)requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus
{
  return self->_requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus;
}

- (void)setPendingNotifyKeyboardChanged:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingNotifyKeyboardChanged, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_endpointGrantInjector, 0);
  objc_storeStrong((id *)&self->_cachedContext, 0);
  objc_storeStrong((id *)&self->_remoteKeepAliveAssertion, 0);
  objc_storeStrong((id *)&self->_acquiringFocusTimer, 0);
  objc_storeStrong((id *)&self->_hostedPids, 0);
  objc_storeStrong((id *)&self->_remoteFocusContext, 0);
  objc_storeStrong((id *)&self->_sceneLayer, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end