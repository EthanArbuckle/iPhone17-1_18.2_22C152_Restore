@interface DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController
+ (id)keyPathsForValuesAffectingBroadcasting;
- (BOOL)isBroadcasting;
- (BOOL)isComplete;
- (BOOL)isObservingEnroller;
- (CATTaskServer)taskServer;
- (DMTAutomatedDeviceEnroller)enroller;
- (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController)initWithBroadcastingProvider:(id)a3 enrollmentPrimitives:(id)a4 deviceInformationPrimitives:(id)a5 enrollmentInformationPrimitives:(id)a6 reachabilityPrimitives:(id)a7 wifiActivationPrimitives:(id)a8 wifiPrimitives:(id)a9 profileInstallationPrimitives:(id)a10 destructiveErasePrimitives:(id)a11 powerOffPrimitives:(id)a12 delegate:(id)a13;
- (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentControllerDelegate)delegate;
- (DMTDeviceInformationPrimitives)deviceInformationPrimitives;
- (DMTRemoteSetupBroadcasting)broadcaster;
- (DMTRemoteSetupBroadcastingProvider)broadcastingProvider;
- (DMTTaskOperationBuilder)operationBuilder;
- (NSError)enrollmentError;
- (id)makeFailureCompletionViewModelWithError:(id)a3;
- (id)makeStatusViewModelForCurrentEnrollerState;
- (id)makeSuccessfulCompletionViewModel;
- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6;
- (void)addHandlersToBroadcaster:(id)a3;
- (void)beginBroadcasting;
- (void)beginEraseAndShutdown;
- (void)beginObservingEnroller;
- (void)broadcasterEncounteredError:(id)a3;
- (void)broadcasterHasPairedTransport:(id)a3;
- (void)broadcasterUpdatedDisplayedPin:(id)a3;
- (void)dealloc;
- (void)delegateEnrollmentError:(id)a3;
- (void)delegateStatusUpdate;
- (void)delegateSuccessfullEnrollment;
- (void)endBroadcasting;
- (void)endObservingEnrollerIfNeeded;
- (void)handleServerFailureWithError:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeHandlersFromBroadcaster:(id)a3;
- (void)resetNetworking;
- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5;
- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4;
- (void)serverDidInvalidate:(id)a3;
- (void)setBroadcaster:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setObservingEnroller:(BOOL)a3;
@end

@implementation DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = _DMTLogGeneral_6();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_INFO, "%{public}@ dealloc'd", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController;
  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)&v6 dealloc];
}

- (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController)initWithBroadcastingProvider:(id)a3 enrollmentPrimitives:(id)a4 deviceInformationPrimitives:(id)a5 enrollmentInformationPrimitives:(id)a6 reachabilityPrimitives:(id)a7 wifiActivationPrimitives:(id)a8 wifiPrimitives:(id)a9 profileInstallationPrimitives:(id)a10 destructiveErasePrimitives:(id)a11 powerOffPrimitives:(id)a12 delegate:(id)a13
{
  id v41 = a3;
  id v18 = a4;
  id v39 = a5;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v42 = a8;
  id v22 = a9;
  v23 = v18;
  id v24 = a10;
  id v25 = a11;
  v26 = v21;
  id v27 = a12;
  id v28 = a13;
  v43.receiver = self;
  v43.super_class = (Class)DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController;
  v29 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)&v43 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_broadcastingProvider, a3);
    objc_storeWeak((id *)&v30->_delegate, v28);
    objc_storeStrong((id *)&v30->_deviceInformationPrimitives, v39);
    v31 = [[DMTAutomatedDeviceEnroller alloc] initWithEnrollmentPrimitives:v23 enrollmentInformationPrimitives:v20 reachabilityPrimitives:v26 activationPrimitives:v42 wifiPrimitives:v22 profileInstallationPrimitives:v24 destructiveErasePrimitives:v25 nonDestructiveErasePrimitives:0 powerOffPrimitives:v27];
    enroller = v30->_enroller;
    v30->_enroller = v31;

    v33 = [[DMTTaskOperationBuilder alloc] initWithDeviceInfoPrimitives:v19 enrollmentPrerequisiteReceiver:v30->_enroller enrollmentInitiator:v30->_enroller enrollmentStateProvider:v30->_enroller];
    operationBuilder = v30->_operationBuilder;
    v30->_operationBuilder = v33;

    uint64_t v35 = objc_opt_new();
    taskServer = v30->_taskServer;
    v30->_taskServer = (CATTaskServer *)v35;

    [(CATTaskServer *)v30->_taskServer setDelegate:v30];
  }

  return v30;
}

+ (id)keyPathsForValuesAffectingBroadcasting
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"broadcaster.isBroadcasting"];
}

- (BOOL)isBroadcasting
{
  v2 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self broadcaster];
  char v3 = [v2 isBroadcasting];

  return v3;
}

- (void)beginBroadcasting
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    BOOL v4 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self isBroadcasting];
    v5 = _DMTLogGeneral_6();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        v7 = NSStringFromSelector(a2);
        int v12 = 138543362;
        v13 = v7;
        _os_log_impl(&dword_22D3D6000, v5, OS_LOG_TYPE_INFO, "Ignoring %{public}@, already broadcasting", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        v8 = NSStringFromSelector(a2);
        int v12 = 138543362;
        v13 = v8;
        _os_log_impl(&dword_22D3D6000, v5, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v9 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self broadcastingProvider];
      v10 = [v9 broadcaster];

      [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self addHandlersToBroadcaster:v10];
      [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self setBroadcaster:v10];
      v11 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self broadcaster];
      [v11 startBroadcasting];
    }
  }
  else
  {
    [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)endBroadcasting
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    BOOL v4 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self isBroadcasting];
    v5 = _DMTLogGeneral_6();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        v7 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v13 = v7;
        _os_log_impl(&dword_22D3D6000, v5, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
      }
      v8 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self broadcaster];
      [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self removeHandlersFromBroadcaster:v8];

      uint64_t v9 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self broadcaster];
      [v9 invalidate];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __77__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_endBroadcasting__block_invoke;
      block[3] = &unk_2649A9730;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      if (v6)
      {
        v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v13 = v10;
        _os_log_impl(&dword_22D3D6000, v5, OS_LOG_TYPE_INFO, "Ignoring %{public}@, not broadcasting", buf, 0xCu);
      }
    }
  }
  else
  {
    [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

uint64_t __77__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_endBroadcasting__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBroadcaster:0];
}

- (void)beginEraseAndShutdown
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    BOOL v4 = _DMTLogGeneral_6();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = NSStringFromSelector(a2);
      int v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_22D3D6000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v7, 0xCu);
    }
    BOOL v6 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
    [v6 eraseAndShutDownWithExternalError:0];
  }
  else
  {
    [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)addHandlersToBroadcaster:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke;
  v9[3] = &unk_2649A9EF0;
  objc_copyWeak(&v10, &location);
  [v4 setShowPinHandler:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke_2;
  v7[3] = &unk_2649A9BE0;
  objc_copyWeak(&v8, &location);
  [v4 setShowErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke_3;
  v5[3] = &unk_2649A9F18;
  objc_copyWeak(&v6, &location);
  [v4 setPairedTransportHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained broadcasterUpdatedDisplayedPin:v3];
}

void __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained broadcasterEncounteredError:v3];
}

void __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained broadcasterHasPairedTransport:v3];
}

- (void)removeHandlersFromBroadcaster:(id)a3
{
  id v3 = a3;
  [v3 setShowPinHandler:0];
  [v3 setShowErrorHandler:0];
  [v3 setPairedTransportHandler:0];
}

- (void)beginObservingEnroller
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22D3D6000, v2, v3, "Already observing enroller, ignoring %{public}@", v4, v5, v6, v7, v8);
}

- (void)endObservingEnrollerIfNeeded
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self isObservingEnroller])
  {
    uint64_t v4 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
    [v4 removeObserver:self forKeyPath:@"enrollmentState" context:@"EnrollmentControllerContext"];

    [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self setObservingEnroller:0];
  }
  else
  {
    uint64_t v5 = _DMTLogGeneral_6();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      int v7 = 138543362;
      uint8_t v8 = v6;
      _os_log_impl(&dword_22D3D6000, v5, OS_LOG_TYPE_INFO, "Not observing enroller, ignoring %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)broadcasterUpdatedDisplayedPin:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if ([(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self isBroadcasting])
    {
      if (v5)
      {
        uint64_t v6 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegate];
        [v6 enrollmentController:self needsToDisplayPin:v5];
      }
      else
      {
        uint64_t v6 = _DMTLogGeneral_6();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcasterUpdatedDisplayedPin:]();
        }
      }
    }
    else
    {
      int v7 = _DMTLogGeneral_6();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint8_t v8 = 0;
        _os_log_impl(&dword_22D3D6000, v7, OS_LOG_TYPE_INFO, "Ignoring updated Pin, no longer broadcasting", v8, 2u);
      }
    }
  }
  else
  {
    [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)broadcasterEncounteredError:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v6 = [v5 userInfo];
    uint64_t v7 = *MEMORY[0x263F08608];
    uint8_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    uint64_t v9 = [v8 userInfo];
    id v10 = [v9 objectForKeyedSubscript:v7];

    if (v10)
    {
      v11 = [v10 domain];
      if ([v11 isEqualToString:*MEMORY[0x263F317D0]])
      {
        uint64_t v12 = [v10 code];

        if (v12 == 702)
        {
          v13 = _DMTLogGeneral_6();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcasterEncounteredError:](v13);
          }
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    uint64_t v14 = _DMTLogGeneral_6();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcasterEncounteredError:](v5);
    }

    [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self endBroadcasting];
    v13 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegate];
    [v13 enrollmentController:self hasBroadcastError:v5];
    goto LABEL_12;
  }
  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
LABEL_13:
}

- (void)broadcasterHasPairedTransport:(id)a3
{
  id v8 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self beginObservingEnroller];
    id v5 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self taskServer];
    [v5 connectWithClientTransport:v8];

    uint64_t v6 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegate];
    uint64_t v7 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self makeStatusViewModelForCurrentEnrollerState];
    [v6 enrollmentControllerHasPaired:self withInitialViewModel:v7];
  }
  else
  {
    [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)delegateSuccessfullEnrollment
{
  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self setComplete:1];
  uint64_t v3 = _DMTLogGeneral_6();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_INFO, "Successfully enrolled", v6, 2u);
  }

  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self resetNetworking];
  uint64_t v4 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self makeSuccessfulCompletionViewModel];
  id v5 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegate];
  [v5 enrollmentController:self hasCompletedWithViewModel:v4];
}

- (void)handleServerFailureWithError:(id)a3
{
  id v4 = a3;
  if (![(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self isComplete])
  {
    id v5 = _DMTLogGeneral_6();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController handleServerFailureWithError:]();
    }

    uint64_t v6 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
    uint64_t v7 = [v6 enrollmentState];

    id v8 = _DMTLogGeneral_6();
    uint64_t v9 = v8;
    if (v7 >= 5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController handleServerFailureWithError:](v7);
      }
      goto LABEL_12;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController handleServerFailureWithError:](v7);
    }

    if (!v4)
    {
      uint64_t v9 = DMTErrorWithCodeAndUserInfo(90, 0);
      [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegateEnrollmentError:v9];
LABEL_12:

      goto LABEL_13;
    }
    [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegateEnrollmentError:v4];
  }
LABEL_13:
}

- (void)delegateEnrollmentError:(id)a3
{
  id v4 = a3;
  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self setComplete:1];
  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self resetNetworking];
  id v6 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self makeFailureCompletionViewModelWithError:v4];

  id v5 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegate];
  [v5 enrollmentController:self hasCompletedWithViewModel:v6];
}

- (void)delegateStatusUpdate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = _DMTLogGeneral_6();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSNumber;
    id v5 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
    id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "enrollmentState"));
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_DEFAULT, "Enroller changed status to: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self makeStatusViewModelForCurrentEnrollerState];
  id v8 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegate];
  [v8 enrollmentController:self hasUpdatedWithViewModel:v7];
}

- (void)resetNetworking
{
  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self endBroadcasting];
  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self endObservingEnrollerIfNeeded];
  id v3 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self taskServer];
  [v3 disconnectAllClientSessions];
}

- (id)makeStatusViewModelForCurrentEnrollerState
{
  v15 = [DMTEnrollmentStatusViewModel alloc];
  id v3 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
  id v4 = [v3 organizationName];
  id v5 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
  uint64_t v6 = [v5 organizationType];
  uint64_t v7 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self deviceInformationPrimitives];
  id v8 = [v7 deviceClass];
  int v9 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
  uint64_t v10 = [v9 enrollmentState];
  uint64_t v11 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
  uint64_t v12 = [v11 networkName];
  v13 = [(DMTEnrollmentStatusViewModel *)v15 initWithOrganizationName:v4 organizationType:v6 localizedDeviceClass:v8 enrollmentState:v10 networkName:v12];

  return v13;
}

- (id)makeSuccessfulCompletionViewModel
{
  id v3 = [DMTEnrollmentCompletionViewModel alloc];
  id v4 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
  id v5 = [v4 organizationName];
  uint64_t v6 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
  uint64_t v7 = [v6 organizationType];
  id v8 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
  int v9 = [v8 mdmServerName];
  uint64_t v10 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self deviceInformationPrimitives];
  uint64_t v11 = [v10 deviceClass];
  id v12 = [(DMTEnrollmentCompletionViewModel *)v3 initSuccessfulEnrollmentInOrganizationName:v5 organizationType:v7 mdmServerName:v9 localizedDeviceClass:v11];

  return v12;
}

- (id)makeFailureCompletionViewModelWithError:(id)a3
{
  id v4 = a3;
  id v5 = [DMTEnrollmentCompletionViewModel alloc];
  uint64_t v6 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self deviceInformationPrimitives];
  uint64_t v7 = [v6 deviceClass];
  id v8 = [(DMTEnrollmentCompletionViewModel *)v5 initForEnrollmentFailureWithError:v4 localizedDeviceClass:v7];

  return v8;
}

- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5
{
  id v6 = a5;
  uint64_t v7 = _DMTLogGeneral_6();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController server:clientSession:didInterruptWithError:]();
  }

  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self handleServerFailureWithError:v6];
}

- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _DMTLogGeneral_6();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_22D3D6000, v6, OS_LOG_TYPE_INFO, "Client Session did disconnect: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = DMTErrorWithCodeAndUserInfo(91, 0);
  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self handleServerFailureWithError:v7];
}

- (void)serverDidInvalidate:(id)a3
{
  id v4 = _DMTLogGeneral_6();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22D3D6000, v4, OS_LOG_TYPE_INFO, "Task Server invalidated", v6, 2u);
  }

  id v5 = DMTErrorWithCodeAndUserInfo(90, 0);
  [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self handleServerFailureWithError:v5];
}

- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self operationBuilder];
  LODWORD(a6) = [v9 validateRequest:v8 error:a6];

  if (a6)
  {
    uint64_t v10 = _DMTLogGeneral_6();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_22D3D6000, v10, OS_LOG_TYPE_INFO, "Creating operation for request: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    v13 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self operationBuilder];
    uint64_t v14 = [v13 taskOperationForRequest:v8];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"EnrollmentControllerContext")
  {
    if (objc_msgSend(a3, "isEqualToString:", @"enrollmentState", a4, a5))
    {
      uint64_t v7 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
      uint64_t v8 = [v7 enrollmentState];

      if (v8 == 14)
      {
        id v10 = [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self enroller];
        id v9 = [v10 enrollmentError];
        [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegateEnrollmentError:v9];
      }
      else if (v8 == 10)
      {
        [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegateSuccessfullEnrollment];
      }
      else
      {
        [(DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *)self delegateStatusUpdate];
      }
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController;
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSError)enrollmentError
{
  return self->_enrollmentError;
}

- (DMTRemoteSetupBroadcastingProvider)broadcastingProvider
{
  return self->_broadcastingProvider;
}

- (DMTDeviceInformationPrimitives)deviceInformationPrimitives
{
  return self->_deviceInformationPrimitives;
}

- (DMTAutomatedDeviceEnroller)enroller
{
  return self->_enroller;
}

- (DMTTaskOperationBuilder)operationBuilder
{
  return self->_operationBuilder;
}

- (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentControllerDelegate *)WeakRetained;
}

- (DMTRemoteSetupBroadcasting)broadcaster
{
  return self->_broadcaster;
}

- (void)setBroadcaster:(id)a3
{
}

- (BOOL)isObservingEnroller
{
  return self->_observingEnroller;
}

- (void)setObservingEnroller:(BOOL)a3
{
  self->_observingEnroller = a3;
}

- (CATTaskServer)taskServer
{
  return self->_taskServer;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskServer, 0);
  objc_storeStrong((id *)&self->_broadcaster, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationBuilder, 0);
  objc_storeStrong((id *)&self->_enroller, 0);
  objc_storeStrong((id *)&self->_deviceInformationPrimitives, 0);
  objc_storeStrong((id *)&self->_broadcastingProvider, 0);
  objc_storeStrong((id *)&self->_enrollmentError, 0);
}

- (void)broadcasterUpdatedDisplayedPin:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v2, v3, "%{public}@ was asked to dismiss the Pin, since we can't tell this apart from successful pairings, we'll ignore it", v4, v5, v6, v7, v8);
}

- (void)broadcasterEncounteredError:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22D3D6000, v2, v3, "Broadcaster has encountered error, forwarding to delegate: %{public}@", v4, v5, v6, v7, v8);
}

- (void)broadcasterEncounteredError:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22D3D6000, log, OS_LOG_TYPE_DEBUG, "Broadcaster will invalidate due to successful pairing, ignoring error", v1, 2u);
}

- (void)handleServerFailureWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v2, v3, "Current enrollment state is: %{public}@, ignoring failure, we're already independent", v4, v5, v6, v7, v8);
}

- (void)handleServerFailureWithError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22D3D6000, v2, v3, "Tearing down due to enrollment state: %{public}@", v4, v5, v6, v7, v8);
}

- (void)handleServerFailureWithError:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_ERROR, "Handling server failure: %{public}@", v1, 0xCu);
}

- (void)server:clientSession:didInterruptWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_ERROR, "Client Session interrupted: %{public}@", v1, 0xCu);
}

@end