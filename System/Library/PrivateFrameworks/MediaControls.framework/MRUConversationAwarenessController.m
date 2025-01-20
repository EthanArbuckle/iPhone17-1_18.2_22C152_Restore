@interface MRUConversationAwarenessController
- (BOOL)isConversationAwarenessEnabled;
- (BOOL)isConversationAwarenessSupported;
- (MRUConversationAwarenessController)initWithOutputDeviceRouteController:(id)a3;
- (MRUConversationAwarenessControllerDelegate)delegate;
- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController;
- (void)setConversationAwarenessEnabled:(BOOL)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a3;
- (void)updateConversationAwarenessEnabled;
- (void)updateConversationAwarenessSupported;
@end

@implementation MRUConversationAwarenessController

- (BOOL)isConversationAwarenessSupported
{
  return self->_conversationAwarenessSupported;
}

- (MRUConversationAwarenessController)initWithOutputDeviceRouteController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUConversationAwarenessController;
  v6 = [(MRUConversationAwarenessController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    [(MRUSystemOutputDeviceRouteController *)v7->_outputDeviceRouteController addObserver:v7];
    [(MRUConversationAwarenessController *)v7 updateConversationAwarenessSupported];
    [(MRUConversationAwarenessController *)v7 updateConversationAwarenessEnabled];
  }

  return v7;
}

- (void)setConversationAwarenessEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_conversationAwarenessEnabled != v4)
  {
    self->_conversationAwarenessEnabled = v4;
    v7 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
    v8 = [v7 logicalLeaderOutputDevice];
    objc_super v9 = MCLogCategoryVolume();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 1024;
      BOOL v20 = v4;
      __int16 v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ conversation detection enabled changed: %{BOOL}u | device: %{public}@", buf, 0x1Cu);
    }

    objc_initWeak((id *)buf, self);
    v10 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController systemRoute];
    v11 = [v10 endpoint];

    v12 = [v7 routeUID];
    id v13 = MEMORY[0x1E4F14428];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__MRUConversationAwarenessController_setConversationAwarenessEnabled_completion___block_invoke;
    v14[3] = &unk_1E5F0E3B0;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v6;
    [v11 setConversationDetectionEnabled:v4 outputDeviceUID:v12 queue:MEMORY[0x1E4F14428] completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __81__MRUConversationAwarenessController_setConversationAwarenessEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  BOOL v4 = [a2 userInfo];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  [v6 code];
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained updateConversationAwarenessEnabled];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a3
{
  [(MRUConversationAwarenessController *)self updateConversationAwarenessSupported];

  [(MRUConversationAwarenessController *)self updateConversationAwarenessEnabled];
}

- (void)updateConversationAwarenessSupported
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  BOOL v4 = [v3 logicalLeaderOutputDevice];
  if ([(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController isSplitRoute]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v4 supportsConversationDetection];
  }
  if (self->_conversationAwarenessSupported != v5)
  {
    self->_conversationAwarenessSupported = v5;
    id v6 = MCLogCategoryVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543874;
      uint64_t v9 = objc_opt_class();
      __int16 v10 = 1024;
      int v11 = v5;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ conversation detection supported: %{BOOL}u | device: %{public}@", (uint8_t *)&v8, 0x1Cu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained conversationAwarenessController:self didChangeConversationAwarenessSupported:v5];
  }
}

- (void)updateConversationAwarenessEnabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  BOOL v4 = [v3 logicalLeaderOutputDevice];
  uint64_t v5 = [v4 isConversationDetectionEnabled];
  if (self->_conversationAwarenessEnabled != v5)
  {
    uint64_t v6 = v5;
    self->_conversationAwarenessEnabled = v5;
    v7 = MCLogCategoryVolume();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543874;
      uint64_t v10 = objc_opt_class();
      __int16 v11 = 1024;
      int v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ conversation detection enabled: %{BOOL}u | device: %{public}@", (uint8_t *)&v9, 0x1Cu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained conversationAwarenessController:self didChangeConversationAwarenessEnabled:v6];
  }
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (MRUConversationAwarenessControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUConversationAwarenessControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isConversationAwarenessEnabled
{
  return self->_conversationAwarenessEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
}

@end