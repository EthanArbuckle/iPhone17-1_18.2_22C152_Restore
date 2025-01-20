@interface NPKCompanionPasscodeChangeCoordinator
- (BOOL)_shouldUsePasscodeConnection;
- (NPKChangePasscodeCompanionInstructionViewController)instructionViewController;
- (NPKCompanionPasscodeChangeCoordinatorDelegate)delegate;
- (PUConnection)passcodeConnection;
- (id)flowController;
- (id)passcodeChangeCompletion;
- (int64_t)pendingAction;
- (void)_cancelRemoteAction;
- (void)_checkDeviceLockStateIfNeededWithCompletion:(id)a3;
- (void)_displayInstructionViewControllerOnNavigationController:(id)a3;
- (void)_endPasscodeChangeWithPasscodeChanged:(BOOL)a3 error:(id)a4;
- (void)_finishRemoteAction:(BOOL)a3;
- (void)_invokePasscodeChangeCompletionWithPasscodeChanged:(BOOL)a3 error:(id)a4;
- (void)_startPasscodeChange;
- (void)_startRemoteAction:(int64_t)a3 type:(int64_t)a4;
- (void)_tellGizmoToPromptForPasscodeChange;
- (void)changePasscodeCompanionInstructionViewController:(id)a3 didChangeVisibilityWithIsVisible:(BOOL)a4;
- (void)exitPasscodeChangeFlowWithPasscodeChanged:(BOOL)a3 error:(id)a4;
- (void)handleGizmoPasscodeChangeWithVisibleViewController:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFlowController:(id)a3;
- (void)setInstructionViewController:(id)a3;
- (void)setPasscodeChangeCompletion:(id)a3;
- (void)setPasscodeConnection:(id)a3;
- (void)setPendingAction:(int64_t)a3;
- (void)unlockConnection:(id)a3 remoteDeviceDidCompleteRemoteAction:(BOOL)a4 remoteDeviceState:(id)a5 error:(id)a6;
@end

@implementation NPKCompanionPasscodeChangeCoordinator

- (PUConnection)passcodeConnection
{
  passcodeConnection = self->_passcodeConnection;
  if (!passcodeConnection)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)qword_35DB0;
    uint64_t v13 = qword_35DB0;
    if (!qword_35DB0)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_15548;
      v9[3] = &unk_2CF50;
      v9[4] = &v10;
      sub_15548((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = (PUConnection *)[[v5 alloc] initWithDelegate:self];
    v7 = self->_passcodeConnection;
    self->_passcodeConnection = v6;

    passcodeConnection = self->_passcodeConnection;
  }

  return passcodeConnection;
}

- (NPKChangePasscodeCompanionInstructionViewController)instructionViewController
{
  if (!self->_instructionViewController)
  {
    v3 = [[NPKChangePasscodeCompanionInstructionViewController alloc] initWithHidesCancelButton:1];
    instructionViewController = self->_instructionViewController;
    self->_instructionViewController = v3;

    [(NPKChangePasscodeCompanionInstructionViewController *)self->_instructionViewController setDelegate:self];
    v5 = [(NPKCompanionPasscodeChangeCoordinator *)self flowController];
    unint64_t v6 = (unint64_t)[v5 context];

    if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 4)
    {
      v7 = +[UIColor darkTextColor];
      [(NPKBridgeInstructionViewController *)self->_instructionViewController setInstructionLabelTextColor:v7];
    }
  }
  v8 = self->_instructionViewController;

  return v8;
}

- (void)handleGizmoPasscodeChangeWithVisibleViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      uint64_t v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136446978;
        v16 = "-[NPKCompanionPasscodeChangeCoordinator handleGizmoPasscodeChangeWithVisibleViewController:completion:]";
        __int16 v17 = 2082;
        v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook/NanoPassbookBridgeSettings/NPKCompanionPasscodeChangeCoordinator.m";
        __int16 v19 = 2048;
        uint64_t v20 = 63;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Expected to have a view controller, but got %@)", (uint8_t *)&v15, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  v11 = [v6 navigationController];
  if (!v11)
  {
    uint64_t v12 = pk_General_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v13)
    {
      v14 = pk_General_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136446722;
        v16 = "-[NPKCompanionPasscodeChangeCoordinator handleGizmoPasscodeChangeWithVisibleViewController:completion:]";
        __int16 v17 = 2082;
        v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook/NanoPassbookBridgeSettings/NPKCompanionPasscodeChangeCoordinator.m";
        __int16 v19 = 2048;
        uint64_t v20 = 66;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Expected to have a navigation controller to present from.)", (uint8_t *)&v15, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  [(NPKCompanionPasscodeChangeCoordinator *)self setPasscodeChangeCompletion:v7];
  [(NPKCompanionPasscodeChangeCoordinator *)self _displayInstructionViewControllerOnNavigationController:v11];
  [(NPKCompanionPasscodeChangeCoordinator *)self _tellGizmoToPromptForPasscodeChange];
}

- (void)exitPasscodeChangeFlowWithPasscodeChanged:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = 138543874;
      BOOL v13 = v11;
      __int16 v14 = 2048;
      BOOL v15 = v4;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Exiting passcode change flow with passcodeChanged: %ld error: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  [(NPKCompanionPasscodeChangeCoordinator *)self _endPasscodeChangeWithPasscodeChanged:v4 error:v6];
}

- (void)setFlowController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = pk_General_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

      if (v6)
      {
        id v7 = pk_General_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v9 = 136446978;
          uint64_t v10 = "-[NPKCompanionPasscodeChangeCoordinator setFlowController:]";
          __int16 v11 = 2082;
          int v12 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook/NanoPassbookBridgeSettings/NPKCompanionPasscodeChangeCoordinator.m";
          __int16 v13 = 2048;
          uint64_t v14 = 81;
          __int16 v15 = 2112;
          id v16 = (id)objc_opt_class();
          id v8 = v16;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Expecting PKPasscodeUpgradeFlowController, but got %@)", (uint8_t *)&v9, 0x2Au);
        }
      }
      _NPKAssertAbort();
    }
  }
  objc_storeWeak(&self->_flowController, v4);
}

- (void)_displayInstructionViewControllerOnNavigationController:(id)a3
{
  id v4 = a3;
  v5 = [(NPKCompanionPasscodeChangeCoordinator *)self instructionViewController];

  if (v5) {
    [(NPKCompanionPasscodeChangeCoordinator *)self setInstructionViewController:0];
  }
  objc_initWeak(&location, self);
  objc_copyWeak(&v9, &location);
  BOOL v6 = [(NPKCompanionPasscodeChangeCoordinator *)self instructionViewController];
  [v6 setCancellationHandler:&v8];

  id v7 = [(NPKCompanionPasscodeChangeCoordinator *)self instructionViewController];
  [v4 pushViewController:v7 animated:1];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_tellGizmoToPromptForPasscodeChange
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_14354;
  v3[3] = &unk_2CF00;
  objc_copyWeak(&v4, &location);
  [(NPKCompanionPasscodeChangeCoordinator *)self _checkDeviceLockStateIfNeededWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_checkDeviceLockStateIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(NPKCompanionPasscodeChangeCoordinator *)self _shouldUsePasscodeConnection])
  {
    v5 = [(NPKCompanionPasscodeChangeCoordinator *)self passcodeConnection];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_14584;
    v7[3] = &unk_2CF28;
    id v8 = v4;
    [v5 getRemoteDeviceState:v7];
  }
  else
  {
    BOOL v6 = [(NPKCompanionPasscodeChangeCoordinator *)self delegate];
    [v6 passcodeChangeCoordinator:self checkRemoteDeviceLockStateWithCompletion:v4];
  }
}

- (void)_startPasscodeChange
{
  if ([(NPKCompanionPasscodeChangeCoordinator *)self _shouldUsePasscodeConnection])
  {
    [(NPKCompanionPasscodeChangeCoordinator *)self _startRemoteAction:2 type:2];
  }
  else
  {
    objc_initWeak(&location, self);
    v3 = [(NPKCompanionPasscodeChangeCoordinator *)self delegate];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_146C8;
    v4[3] = &unk_2CF00;
    objc_copyWeak(&v5, &location);
    [v3 passcodeChangeCoordinator:self remoteDeviceShouldInitiatePasscodeChangeForType:1 completion:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_endPasscodeChangeWithPasscodeChanged:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    [(NPKCompanionPasscodeChangeCoordinator *)self _invokePasscodeChangeCompletionWithPasscodeChanged:1 error:v6];
    id v7 = [(NPKCompanionPasscodeChangeCoordinator *)self instructionViewController];
    [v7 showNavigationBarSpinner:1];
  }
  else
  {
    id v8 = [(NPKCompanionPasscodeChangeCoordinator *)self instructionViewController];
    id v7 = [v8 navigationController];

    id v9 = [v7 topViewController];
    uint64_t v10 = [(NPKCompanionPasscodeChangeCoordinator *)self instructionViewController];
    unsigned int v11 = [v9 isEqual:v10];

    if (v11) {
      id v12 = [v7 popViewControllerAnimated:1];
    }
  }

  if ([(NPKCompanionPasscodeChangeCoordinator *)self _shouldUsePasscodeConnection])
  {
    [(NPKCompanionPasscodeChangeCoordinator *)self _cancelRemoteAction];
  }
  else
  {
    objc_initWeak(&location, self);
    __int16 v13 = [(NPKCompanionPasscodeChangeCoordinator *)self delegate];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_14A90;
    v14[3] = &unk_2CF00;
    objc_copyWeak(&v15, &location);
    [v13 passcodeChangeCoordinator:self remoteDeviceShouldCancelPasscodeChangeWithCompletion:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)changePasscodeCompanionInstructionViewController:(id)a3 didChangeVisibilityWithIsVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      unsigned int v11 = NSStringFromClass(v10);
      CFStringRef v12 = @"NO";
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[NPKCompanionPasscodeChangeCoordinator changePasscodeCompanionInstructionViewController:did"
                            "ChangeVisibilityWithIsVisible:]";
      *(_DWORD *)id v15 = 138544130;
      *(void *)&v15[4] = v11;
      if (v4) {
        CFStringRef v12 = @"YES";
      }
      *(_WORD *)&v15[22] = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      CFStringRef v18 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: %s instructionViewController: %@ isVisible: %@", v15, 0x2Au);
    }
  }
  __int16 v13 = [(NPKCompanionPasscodeChangeCoordinator *)self flowController];
  uint64_t v14 = v13;
  if (v4) {
    [v13 beginShowingViewController];
  }
  else {
    [v13 endedShowingViewController];
  }
}

- (void)unlockConnection:(id)a3 remoteDeviceDidCompleteRemoteAction:(BOOL)a4 remoteDeviceState:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      CFStringRef v18 = +[NSNumber numberWithBool:v8];
      *(_DWORD *)buf = 138544386;
      v23 = v17;
      __int16 v24 = 2080;
      v25 = "-[NPKCompanionPasscodeChangeCoordinator unlockConnection:remoteDeviceDidCompleteRemoteAction:remoteDeviceState:error:]";
      __int16 v26 = 2112;
      v27 = v18;
      __int16 v28 = 2048;
      int64_t v29 = [(NPKCompanionPasscodeChangeCoordinator *)self pendingAction];
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: %s completed: %@ forPendingAction: %ld error: %@", buf, 0x34u);
    }
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v20, (id *)buf);
  BOOL v21 = v8;
  id v19 = v12;
  NPKGuaranteeMainThread();

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)_invokePasscodeChangeCompletionWithPasscodeChanged:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = [(NPKCompanionPasscodeChangeCoordinator *)self passcodeChangeCompletion];

  if (v6)
  {
    id v7 = [(NPKCompanionPasscodeChangeCoordinator *)self passcodeChangeCompletion];
    ((void (**)(void, BOOL, id))v7)[2](v7, v4, v8);

    [(NPKCompanionPasscodeChangeCoordinator *)self setPasscodeChangeCompletion:0];
  }
}

- (BOOL)_shouldUsePasscodeConnection
{
  if (NPKPairedOrPairingDeviceIsTinker()) {
    return 0;
  }
  v3 = NPKPairedOrPairingDevice();
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C3FD35B9-C30A-4893-B94B-56080B5FD9B7"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5 ^ 1;
}

- (void)_startRemoteAction:(int64_t)a3 type:(int64_t)a4
{
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v13 = 138543618;
      BOOL v14 = v11;
      __int16 v15 = 2048;
      int64_t v16 = a3;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Starting remote action %ld", (uint8_t *)&v13, 0x16u);
    }
  }
  [(NPKCompanionPasscodeChangeCoordinator *)self setPendingAction:a3];
  id v12 = [(NPKCompanionPasscodeChangeCoordinator *)self passcodeConnection];
  [v12 requestRemoteDeviceRemoteAction:a3 type:a4];
}

- (void)_finishRemoteAction:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int64_t v10 = [(NPKCompanionPasscodeChangeCoordinator *)self pendingAction];
      id v11 = +[NSNumber numberWithBool:v3];
      int v12 = 138543874;
      int v13 = v9;
      __int16 v14 = 2048;
      int64_t v15 = v10;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Finished remote action %ld, completed = %@", (uint8_t *)&v12, 0x20u);
    }
  }
  [(NPKCompanionPasscodeChangeCoordinator *)self setPasscodeConnection:0];
  [(NPKCompanionPasscodeChangeCoordinator *)self setPendingAction:0];
}

- (void)_cancelRemoteAction
{
  BOOL v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    unsigned __int8 v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138543362;
      int64_t v10 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Canceling remote action", (uint8_t *)&v9, 0xCu);
    }
  }
  BOOL v8 = [(NPKCompanionPasscodeChangeCoordinator *)self passcodeConnection];
  [v8 requestRemoteDeviceRemoteAction:0 type:0];

  [(NPKCompanionPasscodeChangeCoordinator *)self _finishRemoteAction:0];
}

- (id)flowController
{
  id WeakRetained = objc_loadWeakRetained(&self->_flowController);

  return WeakRetained;
}

- (NPKCompanionPasscodeChangeCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NPKCompanionPasscodeChangeCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setPasscodeConnection:(id)a3
{
}

- (int64_t)pendingAction
{
  return self->_pendingAction;
}

- (void)setPendingAction:(int64_t)a3
{
  self->_pendingAction = a3;
}

- (id)passcodeChangeCompletion
{
  return self->_passcodeChangeCompletion;
}

- (void)setPasscodeChangeCompletion:(id)a3
{
}

- (void)setInstructionViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionViewController, 0);
  objc_storeStrong(&self->_passcodeChangeCompletion, 0);
  objc_storeStrong((id *)&self->_passcodeConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak(&self->_flowController);
}

@end