@interface CSSystemQuickAction
- (BOOL)_intentIsCameraCaptureIntent:(id)a3;
- (BOOL)allowsInteraction;
- (BOOL)controlInstance:(id)a3 handlePerformAction:(id)a4;
- (CHSControlIdentity)controlIdentity;
- (CHUISControlInstance)controlInstance;
- (CHUISControlViewModel)viewModel;
- (CSSystemQuickAction)initWithQuickActionControlIdentity:(id)a3 instance:(id)a4 delegate:(id)a5;
- (id)accessoryTitleKey;
- (id)statisticsIdentifier;
- (int64_t)appearance;
- (void)controlInstanceViewModelDidChange:(id)a3;
- (void)dealloc;
- (void)fireAction;
- (void)touchBegan;
- (void)touchEnded;
@end

@implementation CSSystemQuickAction

- (CSSystemQuickAction)initWithQuickActionControlIdentity:(id)a3 instance:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSSystemQuickAction;
  v12 = [(CSSystemQuickAction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_controlIdentity, a3);
    objc_storeStrong((id *)&v13->_controlInstance, a4);
    objc_storeWeak((id *)&v13->_systemQuickActionDelegate, v11);
    [(CHUISControlInstance *)v13->_controlInstance setDelegate:v13];
    [(CHUISControlInstance *)v13->_controlInstance registerObserver:v13];
  }

  return v13;
}

- (void)dealloc
{
  [(CHUISControlInstance *)self->_controlInstance invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSSystemQuickAction;
  [(CSSystemQuickAction *)&v3 dealloc];
}

- (id)statisticsIdentifier
{
  return @"system";
}

- (id)accessoryTitleKey
{
  return 0;
}

- (int64_t)appearance
{
  objc_super v3 = [(CSSystemQuickAction *)self viewModel];
  char v4 = [v3 isDisabled];

  if (v4) {
    return 2;
  }
  v6 = [(CSSystemQuickAction *)self viewModel];
  unsigned int v7 = [v6 isRedacted];

  return v7;
}

- (BOOL)allowsInteraction
{
  v2 = [(CSSystemQuickAction *)self viewModel];
  char v3 = [v2 isDisabled] ^ 1;

  return v3;
}

- (BOOL)_intentIsCameraCaptureIntent:(id)a3
{
  if (!a3) {
    return 0;
  }
  char v3 = [a3 linkAction];
  char v4 = [v3 systemProtocols];
  v5 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_18);

  BOOL v6 = v5 != 0;
  return v6;
}

uint64_t __52__CSSystemQuickAction__intentIsCameraCaptureIntent___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  char v3 = [MEMORY[0x1E4F72DD0] cameraCaptureProtocol];
  char v4 = [v3 identifier];
  uint64_t v5 = [v2 isEqualToString:v4];

  return v5;
}

- (void)touchBegan
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemQuickActionDelegate);
  [WeakRetained systemQuickActionTouchBegan:self];
}

- (void)fireAction
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(CHSControlIdentity *)self->_controlIdentity kind];
    *(_DWORD *)buf = 138543618;
    v8 = self;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[Quick Action] Will fire action %{public}@: %{public}@", buf, 0x16u);
  }
  controlInstance = self->_controlInstance;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__CSSystemQuickAction_fireAction__block_invoke;
  v6[3] = &unk_1E6ADA358;
  v6[4] = self;
  [(CHUISControlInstance *)controlInstance performControlActionWithCompletion:v6];
}

void __33__CSSystemQuickAction_fireAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained systemQuickActionActionFired:*(void *)(a1 + 32)];
}

- (void)touchEnded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemQuickActionDelegate);
  [WeakRetained systemQuickActionTouchEnded:self];
}

- (BOOL)controlInstance:(id)a3 handlePerformAction:(id)a4
{
  id v5 = a3;
  BOOL v6 = [v5 descriptor];
  unsigned int v7 = [v6 actionMetadata];
  int v8 = [v7 isCameraCapture];

  if (v8)
  {
    __int16 v9 = [v5 control];
    id v10 = [v9 extensionIdentity];
    uint64_t v11 = [v10 containerBundleIdentifier];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_systemQuickActionDelegate);
    if (objc_opt_respondsToSelector()) {
      char v13 = [WeakRetained systemQuickActionLaunchCaptureApplication:v11];
    }
    else {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)controlInstanceViewModelDidChange:(id)a3
{
  id v4 = [(CSQuickAction *)self delegate];
  [v4 isSelectedDidChangeForAction:self];
  [v4 allowsInteractionDidChangeForAction:self];
}

- (CHUISControlViewModel)viewModel
{
  char v3 = [(CSSystemQuickAction *)self controlInstance];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = [v7 viewModel];
  }
  else
  {
    __int16 v9 = [(CSSystemQuickAction *)self controlInstance];
    uint64_t v10 = objc_opt_class();
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      int v8 = [v13 viewModel];
    }
    else
    {
      int v8 = 0;
    }
  }

  return (CHUISControlViewModel *)v8;
}

- (CHSControlIdentity)controlIdentity
{
  return self->_controlIdentity;
}

- (CHUISControlInstance)controlInstance
{
  return self->_controlInstance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlInstance, 0);
  objc_storeStrong((id *)&self->_controlIdentity, 0);

  objc_destroyWeak((id *)&self->_systemQuickActionDelegate);
}

@end