@interface CSRemoteContentSession
- (BOOL)_invalidateForReason:(int64_t)a3 error:(id)a4 completion:(id)a5;
- (BOOL)_remoteContentFrameIsValid:(CGRect)a3;
- (BOOL)isValid;
- (BOOL)prefersInlineForPreferences:(id)a3;
- (BOOL)remoteContentViewController:(id)a3 requestsDismissalForType:(int64_t)a4 completion:(id)a5;
- (CSDashBoardRemoteContentSettings)remoteContentSettings;
- (CSRemoteContentHostViewController)hostViewController;
- (CSRemoteContentSession)initWithDefinition:(id)a3 authenticationStatusProvider:(id)a4;
- (CSRemoteContentSessionHostDelegate)hostDelegate;
- (CSRemoteContentSessionPreferencesProvider)preferencesProvider;
- (CSRemoteContentViewControllerProtocol)containerViewController;
- (NSString)sessionID;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (SBSRemoteContentDefinition)definition;
- (double)remoteContentComplicationHeightInset;
- (id)_errorWithCode:(int64_t)a3;
- (id)_remoteContentViewControllerForPreferences:(id)a3;
- (void)_activateHostViewControllerWithPreferences:(id)a3;
- (void)_activateRemoteViewController:(id)a3 remoteError:(id)a4;
- (void)_invalidateWithError:(id)a3;
- (void)_invalidateWithErrorCode:(int64_t)a3;
- (void)_reactivate;
- (void)_requestRemoteViewControllerWithConnectionHandler:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)didChangeRemoteHostContentFrame:(CGRect)a3;
- (void)didChangeRemotePreferences:(id)a3;
- (void)forceDisconnect;
- (void)remoteContentHostViewController:(id)a3 didTerminateWithError:(id)a4;
- (void)setContainerViewController:(id)a3;
- (void)setHostDelegate:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setPreferencesProvider:(id)a3;
- (void)setRemoteContentSettings:(id)a3;
@end

@implementation CSRemoteContentSession

- (CSRemoteContentSession)initWithDefinition:(id)a3 authenticationStatusProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSRemoteContentSession;
  v8 = [(CSRemoteContentSession *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    definition = v8->_definition;
    v8->_definition = (SBSRemoteContentDefinition *)v9;

    objc_storeStrong((id *)&v8->_authenticationStatusProvider, a4);
    v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];
    sessionID = v8->_sessionID;
    v8->_sessionID = (NSString *)v12;

    v8->_valid = 1;
    v14 = +[CSLockScreenDomain rootSettings];
    uint64_t v15 = [v14 dashBoardRemoteContentSettings];
    remoteContentSettings = v8->_remoteContentSettings;
    v8->_remoteContentSettings = (CSDashBoardRemoteContentSettings *)v15;
  }
  return v8;
}

- (void)dealloc
{
  [(CSRemoteContentViewControllerProtocol *)self->_containerViewController setHostViewController:0];
  [(CSRemoteContentHostViewController *)self->_hostViewController setDelegate:0];
  id v3 = [(_UIRemoteViewController *)self->_hostViewController disconnect];
  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;

  v5.receiver = self;
  v5.super_class = (Class)CSRemoteContentSession;
  [(CSRemoteContentSession *)&v5 dealloc];
}

- (void)activate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!self->_activated && self->_valid)
  {
    self->_activated = 1;
    id v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      *(_DWORD *)buf = 138543618;
      id v7 = self;
      __int16 v8 = 2114;
      uint64_t v9 = sessionID;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Activate session %{public}@", buf, 0x16u);
    }

    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__CSRemoteContentSession_activate__block_invoke;
    v5[3] = &unk_1E6AD9D00;
    v5[4] = self;
    [(CSRemoteContentSession *)self _requestRemoteViewControllerWithConnectionHandler:v5];
  }
}

uint64_t __34__CSRemoteContentSession_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _activateRemoteViewController:a2 remoteError:a3];
}

- (void)forceDisconnect
{
  BSDispatchQueueAssertMain();
  *(_WORD *)&self->_activated = 0;
  self->_valid = 0;
  [(CSRemoteContentViewControllerProtocol *)self->_containerViewController setHostViewController:0];
  [(CSRemoteContentViewControllerProtocol *)self->_containerViewController setDelegate:0];
  containerViewController = self->_containerViewController;
  self->_containerViewController = 0;

  [(CSRemoteContentHostViewController *)self->_hostViewController setDelegate:0];
  id v4 = [(_UIRemoteViewController *)self->_hostViewController disconnect];
  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;
}

- (void)_requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v7 = a3;
  id v4 = [(SBSRemoteContentDefinition *)self->_definition viewControllerClassName];
  objc_super v5 = [(SBSRemoteContentDefinition *)self->_definition serviceName];
  id v6 = +[_UIRemoteViewController requestViewController:v4 fromServiceWithBundleIdentifier:v5 connectionHandler:v7];
}

- (void)_activateRemoteViewController:(id)a3 remoteError:(id)a4
{
  *(void *)&v29[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (uint64_t)a4;
  BSDispatchQueueAssertMain();
  if (self->_activated && self->_valid)
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v6;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10;

    if (!(v7 | v11))
    {
      v14 = SBLogDashBoard();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = self;
        _os_log_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Failed to activate remote view controller", buf, 0xCu);
      }

      uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSRemoteContentSessionErrorDomain" code:0 userInfo:0];
    }
    uint64_t v15 = SBLogDashBoard();
    v16 = v15;
    if (v7)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CSRemoteContentSession _activateRemoteViewController:remoteError:]((uint64_t)self, (void *)v7, v16);
      }

      v17 = [(id)v7 userInfo];
      objc_super v18 = [v17 objectForKey:*MEMORY[0x1E4F28A50]];

      v19 = [v18 domain];
      if ([v19 isEqualToString:*MEMORY[0x1E4F62380]])
      {
        uint64_t v20 = [v18 code];

        if (v20 == 6)
        {
          dispatch_time_t v21 = dispatch_time(0, 1000000000);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __68__CSRemoteContentSession__activateRemoteViewController_remoteError___block_invoke;
          block[3] = &unk_1E6AD87F8;
          block[4] = self;
          dispatch_after(v21, MEMORY[0x1E4F14428], block);
LABEL_29:

          goto LABEL_30;
        }
      }
      else
      {
      }
      [(CSRemoteContentSession *)self _invalidateWithError:v7];
      goto LABEL_29;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      *(_DWORD *)buf = 138543618;
      v27 = self;
      __int16 v28 = 2114;
      *(void *)v29 = sessionID;
      _os_log_impl(&dword_1D839D000, v16, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Successfully activated remote view controller for session %{public}@!", buf, 0x16u);
    }

    if (self->_hostViewController) {
      [(CSRemoteContentViewControllerProtocol *)self->_containerViewController setHostViewController:0];
    }
    objc_storeStrong((id *)&self->_hostViewController, v10);
    [(CSRemoteContentHostViewController *)self->_hostViewController setDelegate:self];
    self->_waitingForPreferences = 1;
    v23 = SBLogDashBoard();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_sessionID;
      *(_DWORD *)buf = 138543618;
      v27 = self;
      __int16 v28 = 2114;
      *(void *)v29 = v24;
      _os_log_impl(&dword_1D839D000, v23, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Configuring remote view controller and waiting for preferences for session %{public}@", buf, 0x16u);
    }

    [(CSRemoteContentHostViewController *)self->_hostViewController configureWithDefinition:self->_definition];
  }
  else
  {
    uint64_t v11 = SBLogDashBoard();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL activated = self->_activated;
      BOOL valid = self->_valid;
      *(_DWORD *)buf = 138543874;
      v27 = self;
      __int16 v28 = 1024;
      *(_DWORD *)v29 = activated;
      v29[2] = 1024;
      *(_DWORD *)&v29[3] = valid;
      _os_log_impl(&dword_1D839D000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Not activated (%d) or not valid (%d); not continuing activation",
        buf,
        0x18u);
    }
  }
LABEL_30:
}

uint64_t __68__CSRemoteContentSession__activateRemoteViewController_remoteError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reactivate];
}

- (void)_activateHostViewControllerWithPreferences:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  containerViewController = self->_containerViewController;
  if (containerViewController)
  {
    [(CSRemoteContentViewControllerProtocol *)containerViewController setHostViewController:self->_hostViewController];
  }
  else
  {
    id v6 = [(CSRemoteContentSession *)self _remoteContentViewControllerForPreferences:v4];
    uint64_t v7 = self->_containerViewController;
    self->_containerViewController = v6;

    [(CSRemoteContentViewControllerProtocol *)self->_containerViewController setDelegate:self];
  }
  if (self->_presented)
  {
    WeakRetained = SBLogDashBoard();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      int v17 = 138543618;
      objc_super v18 = self;
      __int16 v19 = 2114;
      uint64_t v20 = sessionID;
      _os_log_impl(&dword_1D839D000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Successfully re-presented session %{public}@!", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_19;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
  if (![WeakRetained shouldActivateRemoteContentSession:self])
  {
    v14 = SBLogDashBoard();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CSRemoteContentSession _activateHostViewControllerWithPreferences:]();
    }

    uint64_t v15 = self;
    uint64_t v16 = 3;
    goto LABEL_18;
  }
  int v10 = [WeakRetained remoteContentSession:self presentViewController:self->_containerViewController];
  self->_presented = v10;
  uint64_t v11 = SBLogDashBoard();
  uint64_t v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CSRemoteContentSession _activateHostViewControllerWithPreferences:]();
    }

    uint64_t v15 = self;
    uint64_t v16 = 2;
LABEL_18:
    [(CSRemoteContentSession *)v15 _invalidateWithErrorCode:v16];
    goto LABEL_19;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_sessionID;
    int v17 = 138543618;
    objc_super v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Successfully presented remote view controller for session %{public}@!", (uint8_t *)&v17, 0x16u);
  }

LABEL_19:
}

- (id)_remoteContentViewControllerForPreferences:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSRemoteContentSession *)self prefersInlineForPreferences:v4];
  id v6 = off_1E6AD7B40;
  if (!v5) {
    id v6 = off_1E6AD7B50;
  }
  uint64_t v7 = (void *)[objc_alloc(*v6) initWithContentDefinition:self->_definition preferences:v4 hostViewController:self->_hostViewController authenticationStatusProvider:self->_authenticationStatusProvider];

  return v7;
}

- (void)_reactivate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_activated)
  {
    id v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      BOOL v5 = self;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Reactivating view service.", (uint8_t *)&v4, 0xCu);
    }

    self->_BOOL activated = 0;
    [(CSRemoteContentSession *)self activate];
  }
  else
  {
    [(CSRemoteContentSession *)self _invalidateWithErrorCode:1];
  }
}

- (void)_invalidateWithErrorCode:(int64_t)a3
{
  id v4 = [(CSRemoteContentSession *)self _errorWithCode:a3];
  [(CSRemoteContentSession *)self _invalidateWithError:v4];
}

- (void)_invalidateWithError:(id)a3
{
}

- (BOOL)_invalidateForReason:(int64_t)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  if (!self->_valid)
  {
    char v16 = 0;
    goto LABEL_14;
  }
  self->_BOOL activated = 0;
  self->_BOOL valid = 0;
  uint64_t v11 = SBLogDashBoard();
  uint64_t v12 = v11;
  if (v9)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    v13 = NSStringFromSelector(a2);
    v14 = NSStringFromSBSRemoteContentDismissType();
    uint64_t v15 = [v9 descriptionWithMultilinePrefix:0];
    *(_DWORD *)buf = 138544130;
    v30 = self;
    __int16 v31 = 2114;
    v32 = v13;
    __int16 v33 = 2114;
    v34 = v14;
    __int16 v35 = 2114;
    v36 = v15;
    _os_log_error_impl(&dword_1D839D000, v12, OS_LOG_TYPE_ERROR, "[RemoteContent][Invalidate] %{public}@: %{public}@ (%{public}@): %{public}@", buf, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    v13 = NSStringFromSelector(a2);
    v14 = NSStringFromSBSRemoteContentDismissType();
    *(_DWORD *)buf = 138543874;
    v30 = self;
    __int16 v31 = 2114;
    v32 = v13;
    __int16 v33 = 2114;
    v34 = v14;
    _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "[RemoteContent][Invalidate] %{public}@: %{public}@ (%{public}@)", buf, 0x20u);
  }

LABEL_9:
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __64__CSRemoteContentSession__invalidateForReason_error_completion___block_invoke;
  v24 = &unk_1E6AD9D28;
  v25 = self;
  int64_t v28 = a3;
  id v26 = v9;
  id v27 = v10;
  uint64_t v17 = MEMORY[0x1D9487300](&v21);
  objc_super v18 = (void *)v17;
  if (a3 == 1 || !self->_presented)
  {
    (*(void (**)(uint64_t))(v17 + 16))(v17);
    char v16 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
    char v16 = objc_msgSend(WeakRetained, "remoteContentSession:dismissWithReason:completion:", self, a3, v18, v21, v22, v23, v24, v25, v26);
  }
LABEL_14:

  return v16;
}

uint64_t __64__CSRemoteContentSession__invalidateForReason_error_completion___block_invoke(uint64_t a1)
{
  v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__CSRemoteContentSession__invalidateForReason_error_completion___block_invoke_cold_1(a1, v2);
  }

  [*(id *)(a1 + 32) forceDisconnect];
  if (*(void *)(a1 + 56) == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [WeakRetained remoteContentSession:*(void *)(a1 + 32) didInvalidateWithError:*(void *)(a1 + 40)];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_errorWithCode:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 4)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSRemoteContentSessionErrorDomain" code:a3 userInfo:0];
  }
  else
  {
    id v4 = off_1E6AD9D48[a3];
    BOOL v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [v5 errorWithDomain:@"CSRemoteContentSessionErrorDomain" code:a3 userInfo:v6];
  }

  return v7;
}

- (BOOL)prefersInlineForPreferences:(id)a3
{
  id v4 = a3;
  if (CSFeatureEnabled(0))
  {
    if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings overrideContentPreferences])
    {
      char v5 = [(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings prefersInlinePresentationOverride];
    }
    else
    {
      char v5 = [v4 prefersInlinePresentation];
    }
    BOOL v6 = v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)didChangeRemotePreferences:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_preferencesProvider);
    BOOL v6 = [WeakRetained preferencesForRemoteContentSession:self];
    [WeakRetained remoteContentSession:self didUpdateWithPreferences:v4];
    if (self->_waitingForPreferences)
    {
      self->_waitingForPreferences = 0;
      if ([(CSRemoteContentSession *)self prefersInlineForPreferences:v4]
        && ([(CSRemoteContentHostViewController *)self->_hostViewController contentFrame],
            !-[CSRemoteContentSession _remoteContentFrameIsValid:](self, "_remoteContentFrameIsValid:")))
      {
        v14 = SBLogDashBoard();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          sessionID = self->_sessionID;
          int v16 = 138543618;
          uint64_t v17 = self;
          __int16 v18 = 2114;
          __int16 v19 = sessionID;
          _os_log_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Waiting for contentFrame for session %{public}@", (uint8_t *)&v16, 0x16u);
        }

        self->_waitingForContentFrame = 1;
      }
      else
      {
        uint64_t v7 = SBLogDashBoard();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = self->_sessionID;
          int v16 = 138543618;
          uint64_t v17 = self;
          __int16 v18 = 2114;
          __int16 v19 = v8;
          _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Received valid preferences and contentFrame for session %{public}@, presenting hostVC", (uint8_t *)&v16, 0x16u);
        }

        [(CSRemoteContentSession *)self _activateHostViewControllerWithPreferences:v4];
      }
    }
    else
    {
      int v9 = [v4 isEqual:v6];
      id v10 = SBLogDashBoard();
      uint64_t v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138543362;
          uint64_t v17 = self;
          _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Ignoring identical remote preferences", (uint8_t *)&v16, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = self->_sessionID;
          int v16 = 138543618;
          uint64_t v17 = self;
          __int16 v18 = 2114;
          __int16 v19 = v12;
          _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_INFO, "[RemoteContent] %{public}@: remoteContentDidUpdateStyle for session %{public}@", (uint8_t *)&v16, 0x16u);
        }

        [(CSRemoteContentViewControllerProtocol *)self->_containerViewController remoteDidChangeStyle];
        id v13 = objc_loadWeakRetained((id *)&self->_hostDelegate);
        [v13 remoteContentDidUpdateStyle];
      }
    }
  }
}

- (void)didChangeRemoteHostContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (self->_waitingForContentFrame)
  {
    if (-[CSRemoteContentSession _remoteContentFrameIsValid:](self, "_remoteContentFrameIsValid:", x, y, width, height))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_preferencesProvider);
      int v9 = [WeakRetained preferencesForRemoteContentSession:self];

      if (v9)
      {
        self->_waitingForContentFrame = 0;
        id v10 = SBLogDashBoard();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "[RemoteContent] Have content frame; activating host VC",
            (uint8_t *)&v13,
            2u);
        }

        [(CSRemoteContentSession *)self _activateHostViewControllerWithPreferences:v9];
        goto LABEL_16;
      }
      uint64_t v12 = SBLogDashBoard();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CSRemoteContentSession didChangeRemoteHostContentFrame:]();
      }
    }
    else
    {
      int v9 = SBLogDashBoard();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_16:

        return;
      }
      v19.origin.double x = x;
      v19.origin.double y = y;
      v19.size.double width = width;
      v19.size.double height = height;
      uint64_t v12 = NSStringFromCGRect(v19);
      int v13 = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      int v16 = v12;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_INFO, "[RemoteContent] %{public}@: Remote content frame is not valid: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_16;
  }
  if (objc_opt_respondsToSelector())
  {
    containerViewController = self->_containerViewController;
    -[CSRemoteContentViewControllerProtocol didChangeRemoteHostContentFrame:](containerViewController, "didChangeRemoteHostContentFrame:", x, y, width, height);
  }
}

- (BOOL)_remoteContentFrameIsValid:(CGRect)a3
{
  return (a3.size.width > 0.0) & ~CGRectIsNull(a3);
}

- (void)remoteContentHostViewController:(id)a3 didTerminateWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (self->_activated && self->_valid)
  {
    BOOL v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      sessionID = self->_sessionID;
      uint64_t v8 = [v5 descriptionWithMultilinePrefix:0];
      int v11 = 138543874;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      v14 = sessionID;
      __int16 v15 = 2114;
      int v16 = v8;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Remote view connection lost while active in session %{public}@, reactivating immediately: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    [(CSRemoteContentSession *)self _reactivate];
  }
  else
  {
    int v9 = SBLogDashBoard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = self->_sessionID;
      int v11 = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Remote view connection lost while inactive/invalid for session %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (double)remoteContentComplicationHeightInset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);
  [WeakRetained remoteContentComplicationHeightInset];
  double v4 = v3;

  return v4;
}

- (BOOL)remoteContentViewController:(id)a3 requestsDismissalForType:(int64_t)a4 completion:(id)a5
{
  return [(CSRemoteContentSession *)self _invalidateForReason:a4 error:0 completion:a5];
}

- (CSRemoteContentSessionHostDelegate)hostDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);

  return (CSRemoteContentSessionHostDelegate *)WeakRetained;
}

- (void)setHostDelegate:(id)a3
{
}

- (CSRemoteContentSessionPreferencesProvider)preferencesProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferencesProvider);

  return (CSRemoteContentSessionPreferencesProvider *)WeakRetained;
}

- (void)setPreferencesProvider:(id)a3
{
}

- (SBSRemoteContentDefinition)definition
{
  return self->_definition;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (CSDashBoardRemoteContentSettings)remoteContentSettings
{
  return self->_remoteContentSettings;
}

- (void)setRemoteContentSettings:(id)a3
{
}

- (CSRemoteContentViewControllerProtocol)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
}

- (CSRemoteContentHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_remoteContentSettings, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_destroyWeak((id *)&self->_preferencesProvider);
  objc_destroyWeak((id *)&self->_hostDelegate);

  objc_storeStrong((id *)&self->_hostViewController, 0);
}

- (void)_activateRemoteViewController:(NSObject *)a3 remoteError:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 descriptionWithMultilinePrefix:0];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_error_impl(&dword_1D839D000, a3, OS_LOG_TYPE_ERROR, "[RemoteContent] %{public}@: Error activating remote view controller: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_activateHostViewControllerWithPreferences:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1D839D000, v0, v1, "[RemoteContent] %{public}@: Failed to present remote view controller for session %{public}@", v2, v3, v4, v5, v6);
}

- (void)_activateHostViewControllerWithPreferences:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1D839D000, v0, v1, "[RemoteContent] %{public}@: Not activating due to hostDelegate preventing it for session %{public}@", v2, v3, v4, v5, v6);
}

void __64__CSRemoteContentSession__invalidateForReason_error_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 64);
  uint8_t v6 = NSStringFromSBSRemoteContentDismissType();
  uint64_t v7 = [*(id *)(a1 + 40) descriptionWithMultilinePrefix:0];
  int v8 = 138544130;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  __int16 v12 = 2114;
  __int16 v13 = v6;
  __int16 v14 = 2114;
  __int16 v15 = v7;
  _os_log_error_impl(&dword_1D839D000, a2, OS_LOG_TYPE_ERROR, "[RemoteContent][Invalidate] %{public}@: finishing invalidating container and host for session %{public}@ due to (%{public}@): %{public}@", (uint8_t *)&v8, 0x2Au);
}

- (void)didChangeRemoteHostContentFrame:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1D839D000, v0, v1, "[RemoteContent] %{public}@: Missing preferences despite getting a remote host content frame for session: %{public}@", v2, v3, v4, v5, v6);
}

@end