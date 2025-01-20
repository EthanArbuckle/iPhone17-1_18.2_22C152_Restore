@interface AAFlowPresenter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)presentationCompletion;
- (void)_callCompletionBlockWithError:(id)a3;
- (void)dealloc;
- (void)flowFinishedWithError:(id)a3 completion:(id)a4;
- (void)launchProcessWithUserInfo:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setPresentationCompletion:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setRemoteListener:(id)a3;
@end

@implementation AAFlowPresenter

- (void)launchProcessWithUserInfo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F29290];
  id v5 = a3;
  v6 = [v4 anonymousListener];
  remoteListener = self->_remoteListener;
  self->_remoteListener = v6;

  [(NSXPCListener *)self->_remoteListener setDelegate:self];
  [(NSXPCListener *)self->_remoteListener resume];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.AAUIViewService" viewControllerClassName:@"AAUIRemoteViewController"];
  v9 = objc_opt_new();
  v10 = [(NSXPCListener *)self->_remoteListener endpoint];
  v11 = [v10 _endpoint];
  [v9 setXpcEndpoint:v11];

  [v9 setUserInfo:v5];
  v12 = objc_opt_new();
  v13 = (SBSRemoteAlertHandle *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v8 configurationContext:v9];
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = v13;

  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle registerObserver:self];
  v15 = _AALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(AAFlowPresenter *)self remoteAlertHandle];
    int v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "Activating handle: %@", (uint8_t *)&v17, 0xCu);
  }
  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:v12];
}

- (void)flowFinishedWithError:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v6 = (void (**)(id, id))a4;
  [(AAFlowPresenter *)self _callCompletionBlockWithError:v7];
  if (v6) {
    v6[2](v6, v7);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[AAFlowPresenterHostInterface XPCInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) activated.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) deactivated.", (uint8_t *)&v7, 0xCu);
  }

  id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -1);
  [(AAFlowPresenter *)self _callCompletionBlockWithError:v6];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4FA7170]])
  {
    if ([v7 code] == 4)
    {

LABEL_6:
      v10 = _AALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) deactivated by request.", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -1);
      goto LABEL_12;
    }
    uint64_t v9 = [v7 code];

    if (v9 == 5) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Alert handle (%@) interrupted with error: %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", 0, v7);
LABEL_12:
  v13 = (void *)v11;
  [(AAFlowPresenter *)self _callCompletionBlockWithError:v11];
}

- (void)_callCompletionBlockWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(AAFlowPresenter *)self presentationCompletion];

  if (v4)
  {
    int v5 = [(AAFlowPresenter *)self presentationCompletion];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [(AAFlowPresenter *)self setPresentationCompletion:0];
}

- (void)dealloc
{
  id v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(AATrustedContactFlowPresenter *)(uint64_t)self dealloc];
  }

  v4.receiver = self;
  v4.super_class = (Class)AAFlowPresenter;
  [(AAFlowPresenter *)&v4 dealloc];
}

- (id)presentationCompletion
{
  return self->presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);

  objc_storeStrong(&self->presentationCompletion, 0);
}

@end