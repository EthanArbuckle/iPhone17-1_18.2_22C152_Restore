@interface DDRemoteActionViewController
+ (BOOL)controllerIsAvailable;
+ (id)exportedInterface;
+ (id)prepareViewController:(id)a3 forAction:(id)a4 actionController:(id)a5;
+ (id)serviceViewControllerInterface;
- (CGSize)preferredContentSize;
- (DDAction)action;
- (DDActionController)actionController;
- (void)_prepareForAction:(id)a3 inActionController:(id)a4;
- (void)actionCanBeCancelledExternally:(BOOL)a3;
- (void)actionDidFinishShouldDismiss:(BOOL)a3;
- (void)adaptForPresentationInPopover:(BOOL)a3;
- (void)getIsBeingPresentedInPopover:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionController:(id)a3;
- (void)viewControllerReady;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation DDRemoteActionViewController

- (void)_prepareForAction:(id)a3 inActionController:(id)a4
{
  if (!self->_proxyConfigured) {
    self->_proxyConfigured = 1;
  }
  self->_waitingForRemoteConfiguration = 1;
  id v6 = a4;
  id v7 = a3;
  [(DDRemoteActionViewController *)self setAction:v7];
  [(DDRemoteActionViewController *)self setActionController:v6];

  v8 = [MEMORY[0x1E4F42948] currentDevice];
  unint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 <= 6 && ((1 << v9) & 0x62) != 0) {
    [(DDRemoteActionViewController *)self setModalPresentationStyle:7];
  }
  id v11 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v11 prepareForAction:v7];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF537400];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF557550];
}

+ (BOOL)controllerIsAvailable
{
  if (controllerIsAvailable_onceToken != -1) {
    dispatch_once(&controllerIsAvailable_onceToken, &__block_literal_global_9);
  }
  return controllerIsAvailable__available;
}

void __53__DDRemoteActionViewController_controllerIsAvailable__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 bundleIdentifier];

  if (([v2 isEqualToString:@"com.apple.datadetectors.DDActionsService"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.InputUI"] & 1) != 0)
  {
    char v1 = 0;
  }
  else
  {
    char v1 = [v2 isEqualToString:@"com.apple.calendar.EventKitUIRemoteUIExtension"] ^ 1;
  }
  controllerIsAvailable__available = v1;
}

- (void)viewControllerReady
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionController);
  id v4 = objc_loadWeakRetained((id *)&self->_action);
  [WeakRetained action:v4 viewControllerReady:self];

  self->_waitingForRemoteConfiguration = 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_waitingForRemoteConfiguration)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDRemoteActionViewController viewServiceDidTerminateWithError:].cold.4();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_actionController);
    id v7 = objc_loadWeakRetained((id *)&self->_action);
    [WeakRetained failedToPrepareViewControllerForAction:v7];

    goto LABEL_15;
  }
  if (!self->_receivedActionDidFinish) {
    goto LABEL_18;
  }
  if ([v4 code] == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[DDRemoteActionViewController viewServiceDidTerminateWithError:]();
    }
    goto LABEL_15;
  }
  if (self->_receivedActionDidFinish)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDRemoteActionViewController viewServiceDidTerminateWithError:]();
    }
  }
  else
  {
LABEL_18:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDRemoteActionViewController viewServiceDidTerminateWithError:]();
    }
    [(DDRemoteActionViewController *)self actionDidFinishShouldDismiss:1];
  }
LABEL_15:
  v8.receiver = self;
  v8.super_class = (Class)DDRemoteActionViewController;
  [(_UIRemoteViewController *)&v8 viewServiceDidTerminateWithError:v5];
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v4 adaptForPresentationInPopover:v3];
}

- (CGSize)preferredContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)DDRemoteActionViewController;
  [(DDRemoteActionViewController *)&v4 preferredContentSize];
  if (v2 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v3 = 480.0;
    double v2 = 360.0;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)prepareViewController:(id)a3 forAction:(id)a4 actionController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__DDRemoteActionViewController_prepareViewController_forAction_actionController___block_invoke;
  v15[3] = &unk_1E5A85D30;
  id v16 = v8;
  id v17 = v9;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DDRemoteActionViewController;
  id v10 = v9;
  id v11 = v8;
  v12 = objc_msgSendSuper2(&v14, sel_requestViewController_fromServiceWithBundleIdentifier_connectionHandler_, a3, @"com.apple.datadetectors.DDActionsService", v15);

  return v12;
}

void __81__DDRemoteActionViewController_prepareViewController_forAction_actionController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) setViewController:v5];
    [v5 _prepareForAction:*(void *)(a1 + 32) inActionController:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __81__DDRemoteActionViewController_prepareViewController_forAction_actionController___block_invoke_cold_1();
    }
    [*(id *)(a1 + 40) failedToPrepareViewControllerForAction:*(void *)(a1 + 32)];
  }
}

- (void)actionCanBeCancelledExternally:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionController);
  id v5 = objc_loadWeakRetained((id *)&self->_action);
  [WeakRetained action:v5 presentationShouldBeModal:!v3];
}

- (void)actionDidFinishShouldDismiss:(BOOL)a3
{
  if (!self->_receivedActionDidFinish)
  {
    BOOL v3 = a3;
    self->_receivedActionDidFinish = 1;
    p_action = &self->_action;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
    id v6 = [WeakRetained delegate];

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_action);
      id v8 = [v7 delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)p_action);
        id v11 = [v10 delegate];
        id v12 = objc_loadWeakRetained((id *)p_action);
        [v11 actionDidFinish:v12 shouldDismiss:v3];
      }
    }
    id v13 = objc_loadWeakRetained((id *)p_action);
    [v13 invalidate];

    objc_storeWeak((id *)p_action, 0);
  }
}

- (void)getIsBeingPresentedInPopover:(id)a3
{
  p_actionController = &self->_actionController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_actionController);
  (*((void (**)(id, uint64_t))a3 + 2))(v5, [WeakRetained isPresentingInPopover]);
}

- (DDAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (DDAction *)WeakRetained;
}

- (void)setAction:(id)a3
{
}

- (DDActionController)actionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionController);
  return (DDActionController *)WeakRetained;
}

- (void)setActionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionController);
  objc_destroyWeak((id *)&self->_action);
}

- (void)viewServiceDidTerminateWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "View service did terminate with error %@ before completing its action", v1, v2, v3, v4, v5);
}

- (void)viewServiceDidTerminateWithError:.cold.2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "View service did terminate after action ended.", v0, 2u);
}

- (void)viewServiceDidTerminateWithError:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "View service did terminate with error %@", v1, v2, v3, v4, v5);
}

- (void)viewServiceDidTerminateWithError:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "View service did terminate with error while preparing itself %@", v1, v2, v3, v4, v5);
}

void __81__DDRemoteActionViewController_prepareViewController_forAction_actionController___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "Could not get an out-of-process view controller. Error %@", v1, v2, v3, v4, v5);
}

@end