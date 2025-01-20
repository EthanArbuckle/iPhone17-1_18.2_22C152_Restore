@interface HMDEventTriggerUserConfirmationSession
+ (id)logCategory;
- (HMDEventTriggerDevice)requestingDevice;
- (HMDEventTriggerExecutionSession)executionSession;
- (HMDEventTriggerUserConfirmationSession)initWithSessionID:(id)a3 eventTrigger:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6 requestingDevice:(id)a7;
- (HMDTriggerConfirmationTimer)userResponseTimer;
- (HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent)analyticsEvent;
- (NSMutableArray)analyticsSendEvents;
- (void)_askForUserPermissionFromDevice:(id)a3 executionSessionID:(id)a4;
- (void)_createBulletinNotification;
- (void)_handleUserPermissionRemoteResponse:(id)a3;
- (void)_handleUserPermissionRemoveDialogRequest:(id)a3;
- (void)_registerForMessages;
- (void)_removeUserDialog:(id)a3;
- (void)_sessionComplete;
- (void)_userResponse:(unint64_t)a3 completionHandler:(id)a4;
- (void)askForUserPermission:(id)a3;
- (void)createBulletinNotification;
- (void)dealloc;
- (void)setAnalyticsEvent:(id)a3;
- (void)setAnalyticsSendEvents:(id)a3;
- (void)setExecutionSession:(id)a3;
- (void)setUserResponseTimer:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation HMDEventTriggerUserConfirmationSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSendEvents, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_userResponseTimer, 0);
  objc_storeStrong((id *)&self->_requestingDevice, 0);
  objc_destroyWeak((id *)&self->_executionSession);
}

- (void)setAnalyticsSendEvents:(id)a3
{
}

- (NSMutableArray)analyticsSendEvents
{
  return self->_analyticsSendEvents;
}

- (void)setAnalyticsEvent:(id)a3
{
}

- (HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void)setUserResponseTimer:(id)a3
{
}

- (HMDTriggerConfirmationTimer)userResponseTimer
{
  return self->_userResponseTimer;
}

- (HMDEventTriggerDevice)requestingDevice
{
  return self->_requestingDevice;
}

- (void)setExecutionSession:(id)a3
{
}

- (HMDEventTriggerExecutionSession)executionSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_executionSession);
  return (HMDEventTriggerExecutionSession *)WeakRetained;
}

- (void)_sessionComplete
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Declaring session is complete", (uint8_t *)&v8, 0xCu);
  }
  v7 = [(HMDEventTriggerSession *)v4 eventTrigger];
  [v7 resetExecutionState];
}

- (void)_handleUserPermissionRemoveDialogRequest:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received user confirmation remove dialog request", (uint8_t *)&v9, 0xCu);
  }
  [(HMDEventTriggerUserConfirmationSession *)v6 _sessionComplete];
  [v4 respondWithPayload:0];
}

- (void)_removeUserDialog:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v21;
    *(void *)&long long v6 = 138543618;
    long long v19 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v10, "isCurrentDevice", v19, (void)v20))
        {
          uint64_t v11 = +[HMDBulletinBoard sharedBulletinBoard];
          v12 = [(HMDEventTriggerSession *)self eventTrigger];
          v13 = [v12 uuid];
          v14 = [v13 UUIDString];
          [v11 removeBulletinsForTrigger:v14];
        }
        else
        {
          v15 = (void *)MEMORY[0x230FBD990]();
          v16 = self;
          v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v19;
            v25 = v18;
            __int16 v26 = 2112;
            v27 = v10;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending the remove dialog message to %@", buf, 0x16u);
          }
          uint64_t v11 = [v10 device];
          [(HMDEventTriggerSession *)v16 sendMessage:@"kEventTriggerUserPermissionRemoveDialogKey" payload:0 device:v11 responseHandler:0];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)_handleUserPermissionRemoteResponse:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"kEventTriggerUserPermissionKey"];
  uint64_t v6 = [v5 unsignedIntegerValue];
  uint64_t v7 = [v4 remoteSourceDevice];
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    v12 = HMDUserConfirmationResponseAsString(v6);
    *(_DWORD *)buf = 138543874;
    long long v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    __int16 v25 = 2112;
    __int16 v26 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response %@ from the device %@", buf, 0x20u);
  }
  v13 = [HMDEventTriggerDevice alloc];
  v14 = [(HMDEventTriggerSession *)v9 eventTrigger];
  v15 = [v14 home];
  v16 = [(HMDEventTriggerDevice *)v13 initWithDevice:v7 forHome:v15];

  v17 = [(HMDEventTriggerUserConfirmationSession *)v9 executionSession];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __78__HMDEventTriggerUserConfirmationSession__handleUserPermissionRemoteResponse___block_invoke;
  v19[3] = &unk_264A2F3E8;
  id v20 = v4;
  id v18 = v4;
  [v17 userResponse:v6 device:v16 completionHandler:v19];
}

void __78__HMDEventTriggerUserConfirmationSession__handleUserPermissionRemoteResponse___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

- (void)_userResponse:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = HMDUserConfirmationResponseAsString(a3);
    *(_DWORD *)buf = 138543618;
    v53 = v10;
    __int16 v54 = 2112;
    v55 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Bulletin notification response ended with %@", buf, 0x16u);
  }
  if (a3 - 2 >= 2)
  {
    if (a3 == 1)
    {
      __int16 v26 = [(HMDEventTriggerUserConfirmationSession *)v8 analyticsEvent];
      uint64_t v27 = [v26 analyticsData];
      [v27 setResultErrorCode:3000];
    }
  }
  else
  {
    [MEMORY[0x263F499B8] currentTime];
    double v13 = v12;
    v14 = [(HMDEventTriggerUserConfirmationSession *)v8 analyticsEvent];
    [v14 startTime];
    double v16 = v15;
    v17 = [(HMDEventTriggerUserConfirmationSession *)v8 analyticsEvent];
    id v18 = [v17 analyticsData];
    [v18 setUserResponseDelay:(unint64_t)((v13 - v16) / 1000.0)];

    long long v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      long long v21 = HMFGetLogIdentifier();
      long long v22 = NSNumber;
      __int16 v23 = [(HMDEventTriggerUserConfirmationSession *)v8 analyticsEvent];
      v24 = [v23 analyticsData];
      __int16 v25 = objc_msgSend(v22, "numberWithUnsignedLongLong:", objc_msgSend(v24, "userResponseDelay"));
      *(_DWORD *)buf = 138543618;
      v53 = v21;
      __int16 v54 = 2112;
      v55 = v25;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@self.metricEvent.metric.userResponseDelay %@", buf, 0x16u);
    }
  }
  v28 = [(HMDEventTriggerUserConfirmationSession *)v8 requestingDevice];
  int v29 = [v28 isCurrentDevice];

  if (v29)
  {
    v30 = (void *)MEMORY[0x230FBD990]();
    v31 = v8;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v53 = v33;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Issuing trigger reponse to local execution session", buf, 0xCu);
    }
    v34 = [(HMDEventTriggerUserConfirmationSession *)v31 executionSession];
    v35 = [(HMDEventTriggerUserConfirmationSession *)v31 requestingDevice];
    [v34 userResponse:a3 device:v35 completionHandler:v6];
  }
  else
  {
    v50[0] = @"kEventTriggerExecutionSessionIdentifierKey";
    v36 = [(HMDEventTriggerSession *)v8 sessionID];
    v37 = [v36 UUIDString];
    v50[1] = @"kEventTriggerUserPermissionKey";
    v51[0] = v37;
    v38 = [NSNumber numberWithUnsignedInteger:a3];
    v51[1] = v38;
    v34 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];

    objc_initWeak(&location, v8);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__HMDEventTriggerUserConfirmationSession__userResponse_completionHandler___block_invoke;
    aBlock[3] = &unk_264A2EAE0;
    objc_copyWeak(&v48, &location);
    id v39 = v6;
    id v47 = v39;
    v40 = _Block_copy(aBlock);
    if (![(HMDEventTriggerSession *)v8 sendResidentMessage:@"kEventTriggerUserPermissionResponseKey" payload:v34 responseHandler:v40])
    {
      v41 = (void *)MEMORY[0x230FBD990]();
      v42 = v8;
      HMFGetOSLogHandle();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v53 = v44;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Could not find compatible resident, Cannot send response", buf, 0xCu);
      }
      if (v39)
      {
        v45 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
        (*((void (**)(id, void *))v39 + 2))(v39, v45);
      }
      [(HMDEventTriggerUserConfirmationSession *)v42 _sessionComplete];
    }

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }

  [(HMDEventTriggerUserConfirmationSession *)v8 setUserResponseTimer:0];
}

void __74__HMDEventTriggerUserConfirmationSession__userResponse_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending user permission response resulted with error %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v5);
  }
  [v9 _sessionComplete];
}

- (void)userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HMDEventTriggerSession *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__HMDEventTriggerUserConfirmationSession_userDidConfirmExecute_completionHandler___block_invoke;
  block[3] = &unk_264A24FC8;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __82__HMDEventTriggerUserConfirmationSession_userDidConfirmExecute_completionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 3;
  }
  return [*(id *)(a1 + 32) _userResponse:v1 completionHandler:*(void *)(a1 + 40)];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEventTriggerSession *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMDEventTriggerUserConfirmationSession_timerDidFire___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__HMDEventTriggerUserConfirmationSession_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) userResponseTimer];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@User did not respond to confirm trigger execution", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) _userResponse:1 completionHandler:0];
    [*(id *)(a1 + 40) setUserResponseTimer:0];
  }
}

- (void)_createBulletinNotification
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [(HMDEventTriggerSession *)self eventTrigger];
  if (v3)
  {
    id v4 = [HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent alloc];
    id v5 = [(HMDEventTriggerSession *)self sessionID];
    id v6 = [v5 UUIDString];
    uint64_t v7 = [(HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent *)v4 initWithSessionID:v6];
    [(HMDEventTriggerUserConfirmationSession *)self setAnalyticsEvent:v7];

    int v8 = +[HMDBulletinBoard sharedBulletinBoard];
    id v9 = (id)[v8 insertBulletinForSecureTrigger:v3];

    uint64_t v10 = [HMDTriggerConfirmationTimer alloc];
    BOOL v11 = [(HMDEventTriggerSession *)self sessionID];
    uint64_t v12 = [(HMDTriggerConfirmationTimer *)v10 initWithExecutionSessionID:v11 timeoutInterval:(double)(unint64_t)bulletinSecureTriggerTimeoutInSeconds];
    [(HMDEventTriggerUserConfirmationSession *)self setUserResponseTimer:v12];

    int v13 = [(HMDEventTriggerUserConfirmationSession *)self userResponseTimer];
    [v13 setDelegate:self];

    v14 = [(HMDEventTriggerUserConfirmationSession *)self userResponseTimer];
    [v14 resume];
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Not creating a bulletin because event trigger is nil", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)createBulletinNotification
{
  v3 = [(HMDEventTriggerSession *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDEventTriggerUserConfirmationSession_createBulletinNotification__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __68__HMDEventTriggerUserConfirmationSession_createBulletinNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createBulletinNotification];
}

- (void)_askForUserPermissionFromDevice:(id)a3 executionSessionID:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [HomeKitEventTriggerUserConfirmationSendLogEvent alloc];
    int v8 = [(HMDEventTriggerSession *)self sessionID];
    id v9 = [v8 UUIDString];
    uint64_t v10 = [(HomeKitEventTriggerUserConfirmationSendLogEvent *)v7 initWithSessionID:v9];

    uint64_t v11 = [(HMDEventTriggerUserConfirmationSession *)self analyticsSendEvents];
    [(id)v11 addObject:v10];

    v35 = @"kEventTriggerExecutionSessionIdentifierKey";
    id v36 = v6;
    v28 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__HMDEventTriggerUserConfirmationSession__askForUserPermissionFromDevice_executionSessionID___block_invoke;
    aBlock[3] = &unk_264A2E890;
    objc_copyWeak(&v33, &location);
    uint64_t v12 = v10;
    v31 = v12;
    id v13 = v29;
    id v32 = v13;
    v14 = _Block_copy(aBlock);
    __int16 v15 = [v13 device];
    id v16 = [(HMDEventTriggerSession *)self eventTrigger];
    uint64_t v17 = [v16 uuid];
    LOBYTE(v11) = [(HMDEventTriggerSession *)self sendMessage:@"kEventTriggerUserPermissionRequestKey" payload:v28 device:v15 target:v17 responseHandler:v14];

    if ((v11 & 1) == 0)
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      int v19 = self;
      HMFGetOSLogHandle();
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v38 = v21;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Cannot find the compatible resident to send the permission request, marking it as failure", buf, 0xCu);
      }
      long long v22 = [(HMDEventTriggerUserConfirmationSession *)v19 executionSession];
      [v22 userResponse:4 device:v13 completionHandler:0];

      __int16 v23 = [(HomeKitEventTriggerUserConfirmationSendLogEvent *)v12 analyticsData];
      [v23 setResultErrorCode:3007];
    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v24 = (void *)MEMORY[0x230FBD990]();
    __int16 v25 = self;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v38 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot ask for permission without execution session identifier", buf, 0xCu);
    }
  }
}

void __93__HMDEventTriggerUserConfirmationSession__askForUserPermissionFromDevice_executionSessionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = [v5 code];
  id v9 = [*(id *)(a1 + 32) analyticsData];
  [v9 setResultErrorCode:v8];

  if (v5)
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = WeakRetained;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received error for user permission request: %@, marking user permission as denied", (uint8_t *)&v15, 0x16u);
    }
    v14 = [v11 executionSession];
    [v14 userResponse:4 device:*(void *)(a1 + 40) completionHandler:0];
  }
}

- (void)askForUserPermission:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEventTriggerSession *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMDEventTriggerUserConfirmationSession_askForUserPermission___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__HMDEventTriggerUserConfirmationSession_askForUserPermission___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) executionSession];
  v3 = [v2 sessionID];
  id v4 = [v3 UUIDString];

  if (v4)
  {
    int v5 = [*(id *)(a1 + 40) isCurrentDevice];
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v9)
      {
        uint64_t v10 = HMFGetLogIdentifier();
        int v17 = 138543362;
        id v18 = v10;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@This device owns the trigger, asking the permission locally", (uint8_t *)&v17, 0xCu);
      }
      [*(id *)(a1 + 32) _createBulletinNotification];
    }
    else
    {
      if (v9)
      {
        int v15 = HMFGetLogIdentifier();
        uint64_t v16 = *(void *)(a1 + 40);
        int v17 = 138543618;
        id v18 = v15;
        __int16 v19 = 2112;
        uint64_t v20 = v16;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@This device does not own the trigger, asking the permission with the device %@", (uint8_t *)&v17, 0x16u);
      }
      [*(id *)(a1 + 32) _askForUserPermissionFromDevice:*(void *)(a1 + 40) executionSessionID:v4];
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Confirmation session is missing associated execution session identifier", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)_registerForMessages
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = [(HMDEventTriggerSession *)self eventTrigger];
  id v4 = [v3 home];
  int v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:5 remoteAccessRequired:0];

  id v6 = [(HMDEventTriggerSession *)self msgDispatcher];
  id v7 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v13[0] = v7;
  v13[1] = v5;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [v6 registerForMessage:@"kEventTriggerUserPermissionRemoveDialogKey" receiver:self policies:v8 selector:sel__handleUserPermissionRemoveDialogRequest_];

  BOOL v9 = [(HMDEventTriggerSession *)self msgDispatcher];
  uint64_t v10 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v12[0] = v10;
  v12[1] = v5;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  [v9 registerForMessage:@"kEventTriggerUserPermissionResponseKey" receiver:self policies:v11 selector:sel__handleUserPermissionRemoteResponse_];
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = +[HMDMetricsManager sharedLogEventSubmitter];
  id v4 = [(HMDEventTriggerUserConfirmationSession *)self analyticsEvent];
  [v3 submitLogEvent:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = [(HMDEventTriggerUserConfirmationSession *)self analyticsSendEvents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        id v11 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v11 submitLogEvent:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)HMDEventTriggerUserConfirmationSession;
  [(HMDEventTriggerSession *)&v12 dealloc];
}

- (HMDEventTriggerUserConfirmationSession)initWithSessionID:(id)a3 eventTrigger:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6 requestingDevice:(id)a7
{
  id v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HMDEventTriggerUserConfirmationSession;
  long long v14 = [(HMDEventTriggerSession *)&v19 initWithSessionID:a3 eventTrigger:a4 workQueue:a5 msgDispatcher:a6];
  long long v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestingDevice, a7);
    uint64_t v16 = [MEMORY[0x263EFF980] array];
    analyticsSendEvents = v15->_analyticsSendEvents;
    v15->_analyticsSendEvents = (NSMutableArray *)v16;
  }
  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_188816 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_188816, &__block_literal_global_188817);
  }
  v2 = (void *)logCategory__hmf_once_v1_188818;
  return v2;
}

void __53__HMDEventTriggerUserConfirmationSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v1_188818;
  logCategory__hmf_once_v1_188818 = v0;
}

@end