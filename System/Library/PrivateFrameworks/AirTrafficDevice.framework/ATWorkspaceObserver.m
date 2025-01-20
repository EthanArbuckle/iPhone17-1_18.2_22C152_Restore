@interface ATWorkspaceObserver
- (ATWorkspaceObserverDelegate)delegate;
- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidPrioritize:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation ATWorkspaceObserver

- (void).cxx_destruct
{
}

- (void)applicationInstallsDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 count];
    delegate = self->_delegate;
    v8[0] = 67109378;
    v8[1] = v6;
    __int16 v9 = 2114;
    v10 = delegate;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Installs changed [Applications: %d] [Delegate: %{public}@]", (uint8_t *)v8, 0x12u);
  }

  [(LSApplicationWorkspaceObserverProtocol *)self->_delegate applicationInstallsDidChange:v4];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 count];
    delegate = self->_delegate;
    v8[0] = 67109378;
    v8[1] = v6;
    __int16 v9 = 2114;
    v10 = delegate;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Installs completed [Applications: %d] [Delegate: %{public}@]", (uint8_t *)v8, 0x12u);
  }

  [(LSApplicationWorkspaceObserverProtocol *)self->_delegate applicationsDidInstall:v4];
}

- (void)applicationInstallsDidCancel:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 count];
    delegate = self->_delegate;
    v8[0] = 67109378;
    v8[1] = v6;
    __int16 v9 = 2114;
    v10 = delegate;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Installs canceled [Applications: %d] [Delegate: %{public}@]", (uint8_t *)v8, 0x12u);
  }

  [(LSApplicationWorkspaceObserverProtocol *)self->_delegate applicationInstallsDidCancel:v4];
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 count];
    int v10 = [v7 count];
    delegate = self->_delegate;
    v12[0] = 67109634;
    v12[1] = v9;
    __int16 v13 = 1024;
    int v14 = v10;
    __int16 v15 = 2114;
    v16 = delegate;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Prioritization notification arrived [Ordered: %d] [Paused: %d] [Delegate: %{public}@]", (uint8_t *)v12, 0x18u);
  }

  [(LSApplicationWorkspaceObserverProtocol *)self->_delegate applicationInstallsArePrioritized:v6 arePaused:v7];
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 count];
    delegate = self->_delegate;
    v8[0] = 67109378;
    v8[1] = v6;
    __int16 v9 = 2114;
    int v10 = delegate;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Prioritization Changed [Ordered: %d] [Delegate: %{public}@]", (uint8_t *)v8, 0x12u);
  }

  [(LSApplicationWorkspaceObserverProtocol *)self->_delegate applicationInstallsDidPrioritize:v4];
}

- (void)setDelegate:(id)a3
{
}

- (ATWorkspaceObserverDelegate)delegate
{
  return self->_delegate;
}

- (void)stopObserving
{
  v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- stop observing", v5, 2u);
  }

  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 removeObserver:self];
}

- (void)startObserving
{
  v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- start observing", v5, 2u);
  }

  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 addObserver:self];
}

@end