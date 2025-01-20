@interface HMDCameraRecordingManager
+ (id)logCategory;
- (BOOL)didShutDown;
- (BOOL)isMotionActive;
- (BOOL)supportsDeviceWithCapabilities:(id)a3;
- (HMDCameraProfile)camera;
- (HMDCameraRecordingBulkSendSessionInitiator)bulkSendSessionInitiator;
- (HMDCameraRecordingBulkSendSessionReader)currentBulkSendSessionReader;
- (HMDCameraRecordingLoadBalancer)cameraLoadBalancer;
- (HMDCameraRecordingManager)initWithCamera:(id)a3 recordingManagementService:(id)a4;
- (HMDCameraRecordingManager)initWithCamera:(id)a3 recordingManagementService:(id)a4 workQueue:(id)a5 dependencyFactory:(id)a6 notificationCenter:(id)a7;
- (HMDCameraRecordingManagerDependencyFactory)dependencyFactory;
- (HMDCameraRecordingSession)currentRecordingSession;
- (HMDCameraRecordingSessionLogEvent)recordingSessionLogEvent;
- (HMDCameraRecordingSessionNotificationTrigger)notificationTrigger;
- (HMDCameraRecordingSessionRetryContext)sessionRetryContext;
- (HMDCameraRecordingSettingsControl)recordingSettingsControl;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDHAPAccessory)accessory;
- (HMFMessageDispatcher)msgDispatcher;
- (HMFTimer)sessionRetryTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSDictionary)stateDump;
- (NSMutableSet)activeRecordingSessions;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)cameraUUID;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)_createRecordingSessionWithSelectedConfiguration:(id)a3 homePresenceByPairingIdentity:(id)a4;
- (id)homePresenceByPairingIdentity;
- (id)logIdentifier;
- (id)messagePayloadForStartRecordingSessionWithTriggerType:(unint64_t)a3;
- (unsigned)_closeEventReasonForRecordingSessionError:(id)a3;
- (void)_clipManagerDidStartUpCloudZone;
- (void)_closeCurrentSessionsWithReason:(unsigned __int16)a3;
- (void)_closeCurrentSessionsWithReason:(unsigned __int16)a3 error:(id)a4;
- (void)_configureRecordingSession:(id)a3 withTrigger:(unint64_t)a4;
- (void)_coordinateRecordingSessionForTrigger:(unint64_t)a3;
- (void)_forwardRecordingSessionForTrigger:(unint64_t)a3 withLoadBalancerDecision:(id)a4 deviceFilter:(id)a5 sessionCoordinationLogEvent:(id)a6 retryAttemptNumber:(int64_t)a7;
- (void)_handleBulkSendSessionCreated:(id)a3;
- (void)_loadBalanceRecordingSessionForTrigger:(unint64_t)a3;
- (void)_prepareRecordingSessionForTrigger:(unint64_t)a3 homePresenceByPairingIdentity:(id)a4 reason:(id)a5;
- (void)_prepareRecordingSessionForTrigger:(unint64_t)a3 homePresenceByPairingIdentity:(id)a4 reason:(id)a5 completionCallback:(id)a6;
- (void)_resetCurrentRecordingSession:(id)a3;
- (void)_resetRetryContextWithReason:(id)a3;
- (void)_shutDown;
- (void)_start;
- (void)_startRecordingSessionForTrigger:(unint64_t)a3 homePresenceByPairingIdentity:(id)a4 reason:(id)a5 selectedConfiguration:(id)a6 completionCallback:(id)a7;
- (void)_startSessionRetryTimer;
- (void)_submitLoadBalancingEventWithDecision:(id)a3 numberOfRetries:(unint64_t)a4;
- (void)_submitRecordingSessionLogEventWithError:(id)a3;
- (void)assignAccessoryConnectionInfoUsingMessagePayload:(id)a3;
- (void)bulkSendSessionReader:(id)a3 didFinishWithReason:(unsigned __int16)a4;
- (void)bulkSendSessionReader:(id)a3 didReadFragment:(id)a4;
- (void)clipManagerDidStartUpCloudZone:(id)a3;
- (void)clipManagerDidStop:(id)a3;
- (void)dealloc;
- (void)handleCameraSettingsDidChangeNotification:(id)a3;
- (void)handleStartRecordingSessionRequest:(id)a3;
- (void)notificationTrigger:(id)a3 didObserveTriggerType:(unint64_t)a4 changeToActive:(BOOL)a5;
- (void)recordingSettingsControlDidConfigure:(id)a3;
- (void)session:(id)a3 didEndWithError:(id)a4;
- (void)setAccessory:(id)a3;
- (void)setCamera:(id)a3;
- (void)setCurrentBulkSendSessionReader:(id)a3;
- (void)setCurrentRecordingSession:(id)a3;
- (void)setDidShutDown:(BOOL)a3;
- (void)setMotionActive:(BOOL)a3;
- (void)setRecordingSessionLogEvent:(id)a3;
- (void)setSessionRetryContext:(id)a3;
- (void)setSessionRetryTimer:(id)a3;
- (void)shutDown;
- (void)start;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCameraRecordingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionRetryContext, 0);
  objc_storeStrong((id *)&self->_sessionRetryTimer, 0);
  objc_storeStrong((id *)&self->_currentBulkSendSessionReader, 0);
  objc_storeStrong((id *)&self->_currentRecordingSession, 0);
  objc_destroyWeak((id *)&self->_camera);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_recordingSessionLogEvent, 0);
  objc_storeStrong((id *)&self->_bulkSendSessionInitiator, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
  objc_storeStrong((id *)&self->_recordingSettingsControl, 0);
  objc_storeStrong((id *)&self->_notificationTrigger, 0);
  objc_storeStrong((id *)&self->_activeRecordingSessions, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_cameraUUID, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_cameraLoadBalancer, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (void)setMotionActive:(BOOL)a3
{
  self->_motionActive = a3;
}

- (BOOL)isMotionActive
{
  return self->_motionActive;
}

- (void)setDidShutDown:(BOOL)a3
{
  self->_didShutDown = a3;
}

- (BOOL)didShutDown
{
  return self->_didShutDown;
}

- (void)setSessionRetryContext:(id)a3
{
}

- (HMDCameraRecordingSessionRetryContext)sessionRetryContext
{
  return (HMDCameraRecordingSessionRetryContext *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSessionRetryTimer:(id)a3
{
}

- (HMFTimer)sessionRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCurrentBulkSendSessionReader:(id)a3
{
}

- (HMDCameraRecordingBulkSendSessionReader)currentBulkSendSessionReader
{
  return (HMDCameraRecordingBulkSendSessionReader *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCurrentRecordingSession:(id)a3
{
}

- (HMDCameraRecordingSession)currentRecordingSession
{
  return (HMDCameraRecordingSession *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCamera:(id)a3
{
}

- (HMDCameraProfile)camera
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_camera);
  return (HMDCameraProfile *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)setRecordingSessionLogEvent:(id)a3
{
}

- (HMDCameraRecordingSessionLogEvent)recordingSessionLogEvent
{
  return (HMDCameraRecordingSessionLogEvent *)objc_getProperty(self, a2, 120, 1);
}

- (HMDCameraRecordingBulkSendSessionInitiator)bulkSendSessionInitiator
{
  return (HMDCameraRecordingBulkSendSessionInitiator *)objc_getProperty(self, a2, 112, 1);
}

- (HMDCameraRecordingManagerDependencyFactory)dependencyFactory
{
  return (HMDCameraRecordingManagerDependencyFactory *)objc_getProperty(self, a2, 104, 1);
}

- (HMDCameraRecordingSettingsControl)recordingSettingsControl
{
  return (HMDCameraRecordingSettingsControl *)objc_getProperty(self, a2, 96, 1);
}

- (HMDCameraRecordingSessionNotificationTrigger)notificationTrigger
{
  return (HMDCameraRecordingSessionNotificationTrigger *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableSet)activeRecordingSessions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 72, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)cameraUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCameraRecordingLoadBalancer)cameraLoadBalancer
{
  return (HMDCameraRecordingLoadBalancer *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  id v3 = a3;
  if ([v3 supportsCameraRecording]
    && [v3 supportsFaceClassification])
  {
    char v4 = [v3 supportsCameraPackageDetection];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)handleCameraSettingsDidChangeNotification:(id)a3
{
  char v4 = [(HMDCameraRecordingManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HMDCameraRecordingManager_handleCameraSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __71__HMDCameraRecordingManager_handleCameraSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) didShutDown])
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    char v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Ignoring handleCameraSettingsDidChangeNotification: because recording manager was shut down", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    v6 = [*(id *)(a1 + 32) camera];
    v7 = [v6 currentSettings];
    [v7 currentAccessMode];

    if (HMIsRecordingAllowedForCameraAccessMode())
    {
      if ([*(id *)(a1 + 32) isMotionActive])
      {
        v8 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) _resetRetryContextWithReason:@"Settings changed to allow recording"]);
        id v9 = *(id *)(a1 + 32);
        v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = HMFGetLogIdentifier();
          int v17 = 138543362;
          v18 = v11;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Motion is active and settings changed to allow recording, attempting to coordinate a recording session", (uint8_t *)&v17, 0xCu);
        }
        [*(id *)(a1 + 32) _coordinateRecordingSessionForTrigger:0];
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 32);
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        v16 = HMCameraAccessModeAsString();
        int v17 = 138543618;
        v18 = v15;
        __int16 v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Closing current session because current access mode is: %@", (uint8_t *)&v17, 0x16u);
      }
      [*(id *)(a1 + 32) _closeCurrentSessionsWithReason:3];
    }
  }
}

- (void)session:(id)a3 didEndWithError:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if ([(HMDCameraRecordingManager *)self didShutDown])
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v22 = 138543362;
      v23 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Ignoring closeSession:withError: delegate callback because recording manager was shut down", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    id v13 = [(HMDCameraRecordingManager *)self currentRecordingSession];

    if (v13 == v6)
    {
      uint64_t v14 = [(HMDCameraRecordingManager *)self _closeEventReasonForRecordingSessionError:v7];
      v15 = (void *)MEMORY[0x1D9452090]();
      v16 = self;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        int v22 = 138543618;
        v23 = v18;
        __int16 v24 = 1024;
        int v25 = v14;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Closing current session with reason: %d", (uint8_t *)&v22, 0x12u);
      }
      [(HMDCameraRecordingManager *)v16 _closeCurrentSessionsWithReason:v14 error:v7];
    }
    __int16 v19 = [(HMDCameraRecordingManager *)self activeRecordingSessions];
    [v19 removeObject:v6];

    v20 = [(HMDCameraRecordingManager *)self cameraLoadBalancer];
    uint64_t v21 = [(HMDCameraRecordingManager *)self cameraUUID];
    [v20 recordingDidEndForCameraWithUUID:v21];
  }
}

- (id)logIdentifier
{
  v2 = [(HMDCameraRecordingManager *)self camera];
  id v3 = [v2 logIdentifier];

  return v3;
}

- (void)bulkSendSessionReader:(id)a3 didFinishWithReason:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  [(HMDCameraRecordingManager *)self _closeCurrentSessionsWithReason:v4];
}

- (void)bulkSendSessionReader:(id)a3 didReadFragment:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDCameraRecordingManager *)self recordingSessionLogEvent];
  [v7 setDidReadFirstFragment:1];

  id v8 = [(HMDCameraRecordingManager *)self currentRecordingSession];
  [v8 handleFragment:v5];
}

- (void)_resetCurrentRecordingSession:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingManager *)self currentRecordingSession];

  if (v6)
  {
    id v7 = [(HMDCameraRecordingManager *)self bulkSendSessionInitiator];
    [v7 stop];

    id v8 = [(HMDCameraRecordingManager *)self currentRecordingSession];
    [(HMDCameraRecordingManager *)self setCurrentRecordingSession:0];
    [v8 handleNoMoreFragmentsAvailable];
    id v9 = [v8 identifier];
    BOOL v10 = [(HMDCameraRecordingManager *)self isMotionActive];
    if (v4)
    {
      BOOL v11 = v10;
      if ([v4 code] != 14)
      {
        if ([v4 code] == 21)
        {
          v12 = [(HMDCameraRecordingManager *)self recordingSettingsControl];
          [v12 handleAccessoryIsNotConfiguredError];
LABEL_7:

          goto LABEL_8;
        }
        if (v11)
        {
          v18 = (void *)MEMORY[0x1D9452090]();
          __int16 v19 = self;
          v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = HMFGetLogIdentifier();
            [(HMDCameraRecordingManager *)v19 isMotionActive];
            int v22 = HMFBooleanToString();
            *(_DWORD *)buf = 138544130;
            v33 = v21;
            __int16 v34 = 2112;
            v35 = v9;
            __int16 v36 = 2112;
            v37 = v22;
            __int16 v38 = 2112;
            id v39 = v4;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Retrying session with identifier: %@ because motion active: %@, error: %@", buf, 0x2Au);
          }
          v23 = [(HMDCameraRecordingManager *)v19 sessionRetryContext];

          if (!v23)
          {
            __int16 v24 = (void *)MEMORY[0x1D9452090]();
            int v25 = v19;
            uint64_t v26 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              v27 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v33 = v27;
              _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Creating session retry context", buf, 0xCu);
            }
            v28 = [(HMDCameraRecordingManager *)v25 dependencyFactory];
            v29 = [(HMDCameraRecordingManager *)v25 workQueue];
            v30 = [v8 homePresenceByPairingIdentity];
            v31 = [v28 createRecordingSessionRetryContextWithWorkQueue:v29 homePresenceByPairingIdentity:v30];
            [(HMDCameraRecordingManager *)v25 setSessionRetryContext:v31];
          }
          [(HMDCameraRecordingManager *)v19 _startSessionRetryTimer];
          goto LABEL_11;
        }
      }
LABEL_8:
      id v13 = (void *)MEMORY[0x1D9452090]();
      uint64_t v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        [(HMDCameraRecordingManager *)v14 isMotionActive];
        int v17 = HMFBooleanToString();
        *(_DWORD *)buf = 138544130;
        v33 = v16;
        __int16 v34 = 2112;
        v35 = v9;
        __int16 v36 = 2112;
        v37 = v17;
        __int16 v38 = 2112;
        id v39 = v4;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Not retrying session with identifier: %@ because motion active: %@, error: %@", buf, 0x2Au);
      }
LABEL_11:

      goto LABEL_12;
    }
    v12 = [NSString stringWithFormat:@"Session with identifier: %@ succeeded", v9];
    [(HMDCameraRecordingManager *)self _resetRetryContextWithReason:v12];
    goto LABEL_7;
  }
LABEL_12:
}

- (void)_startSessionRetryTimer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingManager *)self sessionRetryTimer];

  if (v4) {
    _HMFPreconditionFailure();
  }
  id v5 = [(HMDCameraRecordingManager *)self sessionRetryContext];
  [v5 retryInterval];
  double v7 = v6;

  id v8 = [(HMDCameraRecordingManager *)self sessionRetryContext];
  [v8 computeNextRetryInterval];

  id v9 = (void *)MEMORY[0x1D9452090]();
  BOOL v10 = self;
  BOOL v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v19 = 138543618;
    v20 = v12;
    __int16 v21 = 2048;
    double v22 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting session retry timer with interval: %f", (uint8_t *)&v19, 0x16u);
  }
  id v13 = [(HMDCameraRecordingManager *)v10 dependencyFactory];
  uint64_t v14 = [v13 createTimerWithTimeInterval:v7];
  [(HMDCameraRecordingManager *)v10 setSessionRetryTimer:v14];

  v15 = [(HMDCameraRecordingManager *)v10 sessionRetryTimer];
  [v15 setDelegate:v10];

  v16 = [(HMDCameraRecordingManager *)v10 workQueue];
  int v17 = [(HMDCameraRecordingManager *)v10 sessionRetryTimer];
  [v17 setDelegateQueue:v16];

  v18 = [(HMDCameraRecordingManager *)v10 sessionRetryTimer];
  [v18 resume];
}

- (void)_resetRetryContextWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  double v6 = [(HMDCameraRecordingManager *)self sessionRetryContext];

  if (v6)
  {
    double v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Resetting session retry context with reason: %@", (uint8_t *)&v11, 0x16u);
    }
    [(HMDCameraRecordingManager *)v8 setSessionRetryTimer:0];
    [(HMDCameraRecordingManager *)v8 setSessionRetryContext:0];
  }
}

- (void)_closeCurrentSessionsWithReason:(unsigned __int16)a3 error:(id)a4
{
  uint64_t v4 = a3;
  id v11 = a4;
  double v6 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  double v7 = [(HMDCameraRecordingManager *)self currentBulkSendSessionReader];
  [(HMDCameraRecordingManager *)self setCurrentBulkSendSessionReader:0];
  [v7 stopWithReason:v4];
  if (!v4)
  {
    id v9 = self;
    id v8 = 0;
    goto LABEL_5;
  }
  if (v11)
  {
    id v8 = v11;
    id v9 = self;
LABEL_5:
    [(HMDCameraRecordingManager *)v9 _submitRecordingSessionLogEventWithError:v8];
    goto LABEL_7;
  }
  id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDCameraRecordingBulkSessionCloseReason" code:v4 userInfo:0];
  [(HMDCameraRecordingManager *)self _submitRecordingSessionLogEventWithError:v10];

LABEL_7:
  [(HMDCameraRecordingManager *)self _resetCurrentRecordingSession:v11];
}

- (void)_closeCurrentSessionsWithReason:(unsigned __int16)a3
{
}

- (unsigned)_closeEventReasonForRecordingSessionError:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    if ([v4 code] == 1) {
      unsigned __int16 v6 = 8;
    }
    else {
      unsigned __int16 v6 = 5;
    }
  }
  else
  {
    unsigned __int16 v6 = 0;
  }

  return v6;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingManager *)self sessionRetryTimer];

  if (v6 == v4)
  {
    [(HMDCameraRecordingManager *)self setSessionRetryTimer:0];
    if ([(HMDCameraRecordingManager *)self isMotionActive])
    {
      double v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        BOOL v10 = HMFGetLogIdentifier();
        int v13 = 138543362;
        id v14 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting recording session after session retry timer has expired", (uint8_t *)&v13, 0xCu);
      }
      id v11 = [(HMDCameraRecordingManager *)v8 sessionRetryContext];
      v12 = [v11 homePresenceByPairingIdentity];
      [(HMDCameraRecordingManager *)v8 _prepareRecordingSessionForTrigger:0 homePresenceByPairingIdentity:v12 reason:@"Retry timer expired"];
    }
  }
}

- (void)_handleBulkSendSessionCreated:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  double v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v24 = 138543618;
    int v25 = v9;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Created bulk send session: %@", (uint8_t *)&v24, 0x16u);
  }
  BOOL v10 = [(HMDCameraRecordingManager *)v7 dependencyFactory];
  id v11 = [v10 preferences];
  v12 = [v11 preferenceForKey:@"bulkSendSessionReadTimeoutFactor"];
  int v13 = [v12 numberValue];

  if ([v13 integerValue] < 1) {
    double v14 = 2.0;
  }
  else {
    double v14 = (double)[v13 integerValue];
  }
  uint64_t v15 = [(HMDCameraRecordingManager *)v7 currentRecordingSession];
  [v15 configuredFragmentDuration];
  double v17 = v14 * v16;

  v18 = [(HMDCameraRecordingManager *)v7 dependencyFactory];
  int v19 = [(HMDCameraRecordingManager *)v7 workQueue];
  v20 = [(HMDCameraRecordingManager *)v7 logIdentifier];
  __int16 v21 = [v18 createBulkSendSessionReaderWithWorkQueue:v19 session:v4 readTimeout:v20 logIdentifier:v17];
  [(HMDCameraRecordingManager *)v7 setCurrentBulkSendSessionReader:v21];

  double v22 = [(HMDCameraRecordingManager *)v7 currentBulkSendSessionReader];
  [v22 setDelegate:v7];

  uint64_t v23 = [(HMDCameraRecordingManager *)v7 currentBulkSendSessionReader];
  [v23 start];
}

- (void)_startRecordingSessionForTrigger:(unint64_t)a3 homePresenceByPairingIdentity:(id)a4 reason:(id)a5 selectedConfiguration:(id)a6 completionCallback:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void))a7;
  double v16 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v16);

  double v17 = (void *)MEMORY[0x1D9452090]();
  v18 = self;
  int v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v58 = v20;
    __int16 v59 = 2112;
    id v60 = v13;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting recording session with reason: %@", buf, 0x16u);
  }
  __int16 v21 = [(HMDCameraRecordingManager *)v18 sessionRetryTimer];

  if (v21)
  {
    double v22 = (void *)MEMORY[0x1D9452090]();
    uint64_t v23 = v18;
    int v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = HMFGetLogIdentifier();
      __int16 v26 = [(HMDCameraRecordingManager *)v23 sessionRetryTimer];
      [v26 timeInterval];
      *(_DWORD *)buf = 138543618;
      v58 = v25;
      __int16 v59 = 2048;
      id v60 = v27;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Waiting for retry timer with duration: %f to expire", buf, 0x16u);
    }
    v15[2](v15, 0);
    goto LABEL_16;
  }
  uint64_t v28 = [(HMDCameraRecordingManager *)v18 cameraLoadBalancer];
  v29 = [(HMDCameraRecordingManager *)v18 cameraUUID];
  char v30 = [v28 isReadyToRecordForCameraWithUUID:v29];

  if ((v30 & 1) == 0)
  {
    __int16 v38 = (void *)MEMORY[0x1D9452090]();
    id v39 = v18;
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v41;
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unable to start recording session, no backing store available", buf, 0xCu);
    }
    __int16 v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = 3302;
    goto LABEL_15;
  }
  v31 = [(HMDCameraRecordingManager *)v18 currentBulkSendSessionReader];

  if (v31)
  {
    v32 = (void *)MEMORY[0x1D9452090]();
    v33 = v18;
    __int16 v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v35;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@A bulk send session is already opened", buf, 0xCu);
    }
    __int16 v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = 3303;
LABEL_15:
    v42 = [v36 hmInternalErrorWithCode:v37];
    ((void (**)(id, void *))v15)[2](v15, v42);

    goto LABEL_16;
  }
  v43 = [(HMDCameraRecordingManager *)v18 bulkSendSessionInitiator];
  int v44 = [v43 isSessionOpenInProgress];

  v45 = (void *)MEMORY[0x1D9452090]();
  v46 = v18;
  v47 = HMFGetOSLogHandle();
  BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
  if (v44)
  {
    if (v48)
    {
      v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v49;
      _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@A bulk send session open is already in progress", buf, 0xCu);
    }
    __int16 v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = 3304;
    goto LABEL_15;
  }
  if (v48)
  {
    v50 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v58 = v50;
    _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Opening new bulk send session", buf, 0xCu);
  }
  v51 = [(HMDCameraRecordingManager *)v46 bulkSendSessionInitiator];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __140__HMDCameraRecordingManager__startRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_selectedConfiguration_completionCallback___block_invoke;
  v52[3] = &unk_1E6A05390;
  v52[4] = v46;
  v55 = v15;
  id v53 = v14;
  id v54 = v12;
  unint64_t v56 = a3;
  [v51 openNewSessionWithCallback:v52];

LABEL_16:
}

void __140__HMDCameraRecordingManager__startRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_selectedConfiguration_completionCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    id v8 = [*(id *)(a1 + 32) _createRecordingSessionWithSelectedConfiguration:*(void *)(a1 + 40) homePresenceByPairingIdentity:*(void *)(a1 + 48)];
    if (v8)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = *(id *)(a1 + 32);
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        int v24 = 138543618;
        int v25 = v12;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Created recording session: %@", (uint8_t *)&v24, 0x16u);
      }
      [*(id *)(a1 + 32) setCurrentRecordingSession:v8];
      id v13 = [*(id *)(a1 + 32) activeRecordingSessions];
      [v13 addObject:v8];

      [*(id *)(a1 + 32) _configureRecordingSession:v8 withTrigger:*(void *)(a1 + 64)];
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = [v5 session];
      [v14 _handleBulkSendSessionCreated:v15];

      double v16 = [*(id *)(a1 + 32) cameraLoadBalancer];
      double v17 = [*(id *)(a1 + 32) cameraUUID];
      [v16 recordingDidStartForCameraWithUUID:v17];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
      (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = *(id *)(a1 + 32);
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v24 = 138543618;
      int v25 = v21;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to open bulk send session: %@", (uint8_t *)&v24, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_prepareRecordingSessionForTrigger:(unint64_t)a3 homePresenceByPairingIdentity:(id)a4 reason:(id)a5 completionCallback:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    double v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v39 = v16;
    __int16 v40 = 2112;
    id v41 = v11;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Configuring recording session with reason: %@", buf, 0x16u);
  }
  double v17 = [HMDCameraRecordingSessionLogEvent alloc];
  v18 = [(HMDCameraRecordingManager *)v14 accessory];
  id v19 = [v18 identifier];
  v20 = [(HMDCameraRecordingSessionLogEvent *)v17 initWithAccessoryIdentifier:v19];
  [(HMDCameraRecordingManager *)v14 setRecordingSessionLogEvent:v20];

  __int16 v21 = [(HMDCameraRecordingManager *)v14 sessionRetryContext];

  if (v21)
  {
    uint64_t v22 = [(HMDCameraRecordingManager *)v14 sessionRetryContext];
    uint64_t v23 = [v22 retryCount];
    int v24 = [(HMDCameraRecordingManager *)v14 recordingSessionLogEvent];
    [v24 setRetryCount:v23];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__HMDCameraRecordingManager__prepareRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_completionCallback___block_invoke;
  aBlock[3] = &unk_1E6A17D78;
  aBlock[4] = v14;
  id v37 = v12;
  id v25 = v12;
  __int16 v26 = _Block_copy(aBlock);
  id v27 = [(HMDCameraRecordingManager *)v14 recordingSettingsControl];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __120__HMDCameraRecordingManager__prepareRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_completionCallback___block_invoke_2;
  v31[3] = &unk_1E6A05368;
  id v34 = v26;
  unint64_t v35 = a3;
  v31[4] = v14;
  id v32 = v10;
  id v33 = v11;
  id v28 = v11;
  id v29 = v10;
  id v30 = v26;
  [v27 configureCameraRecordingSettingsWithCompletion:v31];
}

void __120__HMDCameraRecordingManager__prepareRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_completionCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1 + 32) _submitRecordingSessionLogEventWithError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __120__HMDCameraRecordingManager__prepareRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_completionCallback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _startRecordingSessionForTrigger:*(void *)(a1 + 64) homePresenceByPairingIdentity:*(void *)(a1 + 40) reason:*(void *)(a1 + 48) selectedConfiguration:v5 completionCallback:*(void *)(a1 + 56)];
  }
  else
  {
    double v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure camera recording settings: %@", (uint8_t *)&v11, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_prepareRecordingSessionForTrigger:(unint64_t)a3 homePresenceByPairingIdentity:(id)a4 reason:(id)a5
{
  id v8 = a5;
  id v10 = a4;
  id v9 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v9);

  [(HMDCameraRecordingManager *)self _prepareRecordingSessionForTrigger:a3 homePresenceByPairingIdentity:v10 reason:v8 completionCallback:&__block_literal_global_1367];
}

- (void)_submitRecordingSessionLogEventWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingManager *)self recordingSessionLogEvent];
  if (v5)
  {
    id v6 = [(HMDCameraRecordingManager *)self logEventSubmitter];
    [v6 submitLogEvent:v5 error:v4];

    [(HMDCameraRecordingManager *)self setRecordingSessionLogEvent:0];
  }
  else
  {
    double v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@There is no recording session log event to submit.", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)handleStartRecordingSessionRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  double v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    v31 = v9;
    __int16 v32 = 2112;
    id v33 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to handle recording session: %@", buf, 0x16u);
  }
  int v11 = [v4 messagePayload];
  id v12 = objc_msgSend(v11, "hmf_dictionaryForKey:", @"HMDCameraRecordingHomePresenceByPairingIdentity");

  if (v12)
  {
    uint64_t v13 = [v4 messagePayload];
    [(HMDCameraRecordingManager *)v7 assignAccessoryConnectionInfoUsingMessagePayload:v13];

    id v14 = [v4 messagePayload];
    uint64_t v15 = objc_msgSend(v14, "hmf_numberForKey:", @"notificationTriggerType");

    if (v15)
    {
      [(HMDCameraRecordingManager *)v7 _resetRetryContextWithReason:@"Received recording session trigger from primary resident"];
      uint64_t v16 = [v15 integerValue];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __64__HMDCameraRecordingManager_handleStartRecordingSessionRequest___block_invoke;
      v28[3] = &unk_1E6A197F0;
      id v29 = v4;
      [(HMDCameraRecordingManager *)v7 _prepareRecordingSessionForTrigger:v16 homePresenceByPairingIdentity:v12 reason:@"request from primary resident" completionCallback:v28];
      double v17 = v29;
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x1D9452090]();
      int v24 = v7;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = HMFGetLogIdentifier();
        id v27 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v31 = v26;
        __int16 v32 = 2112;
        id v33 = v27;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not find trigger in message payload: %@", buf, 0x16u);
      }
      double v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v4 respondWithError:v17];
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = v7;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      uint64_t v22 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      __int16 v32 = 2112;
      id v33 = v22;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find home presence by pairing identity in message payload: %@", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v15];
  }
}

void __64__HMDCameraRecordingManager_handleStartRecordingSessionRequest___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 responseHandler];
  v4[2](v4, v3, 0);
}

- (void)assignAccessoryConnectionInfoUsingMessagePayload:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"HMDCameraRecordingAccessorySocketInfo");
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F5BE18]) initWithDictionary:v5];
    if (v6)
    {
      double v7 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"HMDCameraRecordingAccessoryBonjourDeviceInfo");
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = self;
      id v10 = HMFGetOSLogHandle();
      int v11 = v10;
      if (v7)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v12 = HMFGetLogIdentifier();
          int v23 = 138543362;
          int v24 = v12;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Assigning connection info to accessory", (uint8_t *)&v23, 0xCu);
        }
        uint64_t v13 = [(HMDCameraRecordingManager *)v9 accessory];
        [v13 assignBonjourDeviceInfo:v7 socketInfo:v6];
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v22 = HMFGetLogIdentifier();
          int v23 = 138543362;
          int v24 = v22;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@No bonjour device info received for start recording session request", (uint8_t *)&v23, 0xCu);
        }
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = self;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = HMFGetLogIdentifier();
        int v23 = 138543618;
        int v24 = v21;
        __int16 v25 = 2112;
        __int16 v26 = v5;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HAPSocketInfo for start recording request with dictionary: %@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      double v17 = HMFGetLogIdentifier();
      int v23 = 138543362;
      int v24 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@No socket info received for start recording session request", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)_configureRecordingSession:(id)a3 withTrigger:(unint64_t)a4
{
  id v14 = a3;
  id v6 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  [v14 setDelegate:self];
  [v14 configure];
  double v7 = [v14 timelineManager];
  id v8 = [v7 creationDateForFragmentAtTimeOffset:0.0];

  if (a4 == 1)
  {
    uint64_t v13 = [v14 timelineManager];
    [v13 handleDoorbellDidActivateAtDate:v8];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v9 = [v14 timelineManager];
    [v9 handleMotionActive:1 didChangeAtDate:v8];

    id v10 = [v14 timelineManager];
    BOOL v11 = [(HMDCameraRecordingManager *)self isMotionActive];
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v10 handleMotionActive:v11 didChangeAtDate:v12];

    uint64_t v13 = [(HMDCameraRecordingManager *)self currentRecordingSession];
    objc_msgSend(v13, "handleMotionActive:", -[HMDCameraRecordingManager isMotionActive](self, "isMotionActive"));
  }

LABEL_6:
}

- (id)_createRecordingSessionWithSelectedConfiguration:(id)a3 homePresenceByPairingIdentity:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDCameraRecordingManager *)self camera];
  id v10 = [v9 hapAccessory];
  BOOL v11 = [v10 home];
  id v12 = [v9 clipManager];
  uint64_t v13 = [v12 localZone];

  if (v9 && v10 && v11 && v13)
  {
    id v14 = [v6 generalConfiguration];
    uint64_t v15 = [v14 mediaContainerConfigurations];
    [v15 firstObject];
    uint64_t v16 = v41 = v7;
    [v16 parameters];
    double v17 = v42 = v11;
    v18 = [v17 fragmentLength];
    [v18 doubleValue];
    double v20 = v19 / 1000.0;

    __int16 v21 = [v6 generalConfiguration];
    uint64_t v22 = [v21 prebufferLength];
    [v22 doubleValue];
    double v24 = v23;

    __int16 v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v24 / -1000.0];
    __int16 v26 = [(HMDCameraRecordingManager *)self dependencyFactory];
    uint64_t v27 = [(HMDCameraRecordingManager *)self workQueue];
    id v28 = [v9 uniqueIdentifier];
    id v29 = [v28 UUIDString];
    [v26 createTimelineManagerWithWorkQueue:v27 fragmentDuration:v25 fragmentCreationReferenceDate:v29 logIdentifier:v20];
    v30 = id v40 = v6;

    id v7 = v41;
    v31 = [(HMDCameraRecordingManager *)self dependencyFactory];
    __int16 v32 = [(HMDCameraRecordingManager *)self workQueue];
    id v33 = [v31 createRecordingSessionWithWorkQueue:v32 camera:v9 hapAccessory:v10 home:v42 localZone:v13 configuredFragmentDuration:v30 timelineManager:v20 homePresenceByPairingIdentity:v41];

    BOOL v11 = v42;
    id v6 = v40;
  }
  else
  {
    uint64_t v34 = (void *)MEMORY[0x1D9452090]();
    unint64_t v35 = self;
    __int16 v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      __int16 v38 = v37 = v7;
      *(_DWORD *)buf = 138544386;
      int v44 = v38;
      __int16 v45 = 2112;
      v46 = v9;
      __int16 v47 = 2112;
      BOOL v48 = v10;
      __int16 v49 = 2112;
      v50 = v11;
      __int16 v51 = 2112;
      v52 = v13;
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Cannot start recording session because camera=%@ accessory=%@ home=%@ localZone=%@", buf, 0x34u);

      id v7 = v37;
    }

    id v33 = 0;
  }

  return v33;
}

- (void)_submitLoadBalancingEventWithDecision:(id)a3 numberOfRetries:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v35 = [v5 analysisNode];
  id v6 = [v35 metrics];
  id v33 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"recordingSessionSummaries");

  id v7 = [v5 cameraUUID];
  id v8 = [v7 UUIDString];
  id v9 = [v33 objectForKeyedSubscript:v8];
  BOOL v31 = v9 != 0;

  id v29 = [HMDCameraRecordingLoadBalancerLogEvent alloc];
  double v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "numberOfAvailableDevices"));
  __int16 v26 = [NSNumber numberWithUnsignedInteger:a4];
  __int16 v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "totalNumberOfJobSlots"));
  id v10 = NSNumber;
  uint64_t v11 = [v5 remainingNumberOfJobSlots];

  id v12 = [v10 numberWithInteger:v11];
  id v30 = [v35 residentDevice];
  id v28 = [v30 device];
  uint64_t v27 = [v28 productInfo];
  [v27 productClass];
  __int16 v21 = HMFProductClassToString();
  double v24 = [v35 metrics];
  uint64_t v13 = [v24 objectForKeyedSubscript:@"numberOfActiveRecordingSessions"];
  uint64_t v22 = [v35 metrics];
  id v14 = [v22 objectForKeyedSubscript:@"systemResourceUsageLevel"];
  uint64_t v15 = [v35 metrics];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"numberOfFullJobSlots"];
  double v17 = [v35 metrics];
  v18 = [v17 objectForKeyedSubscript:@"numberOfPartialJobSlots"];
  LOBYTE(v20) = v31;
  __int16 v32 = [(HMDCameraRecordingLoadBalancerLogEvent *)v29 initWithNumberOfResidents:v23 numberOfRetries:v26 totalNumberOfJobSlots:v25 remainingNumberOfJobSlots:v12 selectedResidentDeviceType:v21 selectedResidentNumberOfActiveStreams:v13 selectedResidentSystemResourceUsageLevel:v14 selectedResidentJobSlots:v16 selectedResidentPartialJobSlots:v18 selectedResidentHasActiveSessionWithCamera:v20];

  double v19 = [(HMDCameraRecordingManager *)self logEventSubmitter];
  [v19 submitLogEvent:v32];
}

- (void)_forwardRecordingSessionForTrigger:(unint64_t)a3 withLoadBalancerDecision:(id)a4 deviceFilter:(id)a5 sessionCoordinationLogEvent:(id)a6 retryAttemptNumber:(int64_t)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v15);

  if (a7 >= 4) {
    _HMFPreconditionFailure();
  }
  [v14 setRetryCount:a7];
  uint64_t v42 = [v12 analysisNode];
  id v41 = [v42 residentDevice];
  uint64_t v16 = [v41 device];
  unint64_t v40 = a3;
  if ([v16 isCurrentDevice])
  {
    double v17 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    double v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v52 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@We are the best device for recording session, starting locally", buf, 0xCu);
    }
    [v14 setUsingRemoteDeviceAnalysisNode:0];
    __int16 v21 = [(HMDCameraRecordingManager *)v18 homePresenceByPairingIdentity];
    [(HMDCameraRecordingManager *)v18 _prepareRecordingSessionForTrigger:v40 homePresenceByPairingIdentity:v21 reason:@"current device picked itself"];

    [(HMDCameraRecordingManager *)v18 _submitLoadBalancingEventWithDecision:v12 numberOfRetries:a7];
    uint64_t v22 = [(HMDCameraRecordingManager *)v18 logEventSubmitter];
    [(HMDRemoteDeviceMessageDestination *)v22 submitLogEvent:v14];
    double v23 = v41;
  }
  else
  {
    __int16 v38 = v13;
    [v14 setUsingRemoteDeviceAnalysisNode:1];
    double v24 = [HMDRemoteDeviceMessageDestination alloc];
    __int16 v25 = [(HMDCameraRecordingManager *)self messageTargetUUID];
    uint64_t v22 = [(HMDRemoteDeviceMessageDestination *)v24 initWithTarget:v25 device:v16];

    id v37 = [(HMDCameraRecordingManager *)self messagePayloadForStartRecordingSessionWithTriggerType:a3];
    id v39 = [[HMDRemoteMessage alloc] initWithName:@"kStartRecordingSessionRequestKey" qualityOfService:25 destination:v22 payload:v37 type:0 timeout:1 secure:120.0];
    __int16 v26 = (void *)MEMORY[0x1D9452090]();
    uint64_t v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = HMFGetLogIdentifier();
      [v16 shortDescription];
      v30 = id v36 = v12;
      BOOL v31 = [(HMFObject *)v39 shortDescription];
      *(_DWORD *)buf = 138543874;
      v52 = v29;
      __int16 v53 = 2114;
      id v54 = v30;
      __int16 v55 = 2114;
      unint64_t v56 = v31;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Forwarding recording session to %{public}@ via message: %{public}@", buf, 0x20u);

      id v12 = v36;
    }

    __int16 v32 = [(HMDCameraRecordingManager *)v27 dependencyFactory];
    id v33 = [(HMDCameraRecordingManager *)v27 logIdentifier];
    uint64_t v34 = [v32 createLoadBalancingAttemptWithLocalResponseTimeout:v33 logIdentifier:2.0];

    unint64_t v35 = [(HMDCameraRecordingManager *)v27 msgDispatcher];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke;
    v43[3] = &unk_1E6A05340;
    v43[4] = v27;
    id v44 = v16;
    id v45 = v14;
    id v46 = v12;
    int64_t v49 = a7;
    double v23 = v41;
    id v47 = v41;
    id v13 = v38;
    id v48 = v38;
    unint64_t v50 = v40;
    [v34 startWithMessage:v39 messageDispatcher:v35 completion:v43];
  }
}

void __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (+[HMDCameraRecordingSessionLogEvent isRecordingSessionAlreadyInProgressError:v3])
    {
      id v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = *(id *)(a1 + 32);
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = HMFGetLogIdentifier();
        id v8 = [*(id *)(a1 + 40) shortDescription];
        *(_DWORD *)buf = 138543874;
        v74 = v7;
        __int16 v75 = 2114;
        v76 = v8;
        __int16 v77 = 2112;
        id v78 = v3;
        id v9 = "%{public}@Received error that a session is already in progress on device %{public}@: %@";
LABEL_11:
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, v9, buf, 0x20u);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if ([v3 code] == 14)
    {
      id v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = *(id *)(a1 + 32);
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = HMFGetLogIdentifier();
        id v8 = [*(id *)(a1 + 40) shortDescription];
        *(_DWORD *)buf = 138543874;
        v74 = v7;
        __int16 v75 = 2114;
        v76 = v8;
        __int16 v77 = 2112;
        id v78 = v3;
        id v9 = "%{public}@Received error that accessory is already in a recording session from device %{public}@: %@";
        goto LABEL_11;
      }
LABEL_12:

      double v17 = [*(id *)(a1 + 32) logEventSubmitter];
      [v17 submitLogEvent:*(void *)(a1 + 48) error:v3];
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v18 = [v3 code];
    double v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = *(id *)(a1 + 32);
    __int16 v21 = HMFGetOSLogHandle();
    uint64_t v22 = v21;
    if (v18 == 21)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        double v23 = HMFGetLogIdentifier();
        double v24 = [*(id *)(a1 + 40) shortDescription];
        *(_DWORD *)buf = 138543874;
        v74 = v23;
        __int16 v75 = 2114;
        v76 = v24;
        __int16 v77 = 2112;
        id v78 = v3;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Received error that accessory is not configured from device %{public}@: %@", buf, 0x20u);
      }
      __int16 v25 = [*(id *)(a1 + 32) logEventSubmitter];
      [v25 submitLogEvent:*(void *)(a1 + 48) error:v3];

      double v17 = [*(id *)(a1 + 32) workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_67;
      block[3] = &unk_1E6A19B30;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v17, block);
      goto LABEL_13;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      uint64_t v27 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543874;
      v74 = v26;
      __int16 v75 = 2114;
      v76 = v27;
      __int16 v77 = 2112;
      id v78 = v3;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to forward recording session to device %{public}@: %@", buf, 0x20u);
    }
    id v28 = [*(id *)(a1 + 32) logEventSubmitter];
    [v28 submitLogEvent:*(void *)(a1 + 48) error:v3];

    id v29 = [*(id *)(a1 + 32) cameraLoadBalancer];
    [v29 handleRecordingSessionForwardingFailureForDecision:*(void *)(a1 + 56)];

    id v30 = [HMDCameraRecordingSessionCoordinationLogEvent alloc];
    [*(id *)(a1 + 48) startTime];
    double v17 = -[HMMLogEvent initWithStartTime:](v30, "initWithStartTime:");
    BOOL v31 = [*(id *)(a1 + 32) camera];
    if (!v31)
    {
      v43 = (void *)MEMORY[0x1D9452090]();
      id v44 = *(id *)(a1 + 32);
      id v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        id v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v74 = v46;
        _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@Camera reference is nil", buf, 0xCu);
      }
      id v47 = [*(id *)(a1 + 32) logEventSubmitter];
      id v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v47 submitLogEvent:v17 error:v48];

      goto LABEL_36;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_68;
    aBlock[3] = &unk_1E6A052F0;
    id v70 = *(id *)(a1 + 64);
    id v71 = *(id *)(a1 + 72);
    __int16 v32 = _Block_copy(aBlock);
    id v33 = [*(id *)(a1 + 32) cameraLoadBalancer];
    uint64_t v34 = [v33 loadBalancingDecisionForCamera:v31 deviceFilter:v32];

    if (*(uint64_t *)(a1 + 80) < 3)
    {
      int64_t v49 = [v34 analysisNode];

      if (v49)
      {
        unint64_t v50 = [*(id *)(a1 + 32) workQueue];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_69;
        v63[3] = &unk_1E6A05318;
        uint64_t v51 = *(void *)(a1 + 88);
        v63[4] = *(void *)(a1 + 32);
        uint64_t v67 = v51;
        id v64 = v34;
        id v66 = v32;
        v52 = v17;
        uint64_t v53 = *(void *)(a1 + 80);
        v65 = v52;
        uint64_t v68 = v53;
        dispatch_async(v50, v63);

LABEL_35:
        id v47 = v70;
LABEL_36:

        goto LABEL_13;
      }
      v62 = v34;
      id v54 = (void *)MEMORY[0x1D9452090]();
      id v55 = *(id *)(a1 + 32);
      unint64_t v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        uint64_t v57 = HMFGetLogIdentifier();
        [*(id *)(a1 + 32) accessory];
        v58 = uint64_t v61 = v17;
        *(_DWORD *)buf = 138543618;
        v74 = v57;
        __int16 v75 = 2112;
        v76 = v58;
        _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_ERROR, "%{public}@Exhausted devices, failed to start recording session for accessory %@", buf, 0x16u);

        double v17 = v61;
      }

      unint64_t v40 = [*(id *)(a1 + 32) logEventSubmitter];
      id v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = 3301;
    }
    else
    {
      v62 = v34;
      unint64_t v35 = (void *)MEMORY[0x1D9452090]();
      id v36 = *(id *)(a1 + 32);
      id v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        __int16 v38 = v60 = v17;
        id v39 = [*(id *)(a1 + 32) accessory];
        *(_DWORD *)buf = 138543618;
        v74 = v38;
        __int16 v75 = 2112;
        v76 = v39;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Reached retry limit, failed to start recording session for accessory %@", buf, 0x16u);

        double v17 = v60;
      }

      unint64_t v40 = [*(id *)(a1 + 32) logEventSubmitter];
      id v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = 3300;
    }
    __int16 v59 = [v41 hmInternalErrorWithCode:v42];
    [v40 submitLogEvent:v17 error:v59];

    uint64_t v34 = v62;
    goto LABEL_35;
  }
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    id v14 = [*(id *)(a1 + 40) shortDescription];
    *(_DWORD *)buf = 138543618;
    v74 = v13;
    __int16 v75 = 2114;
    v76 = v14;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully forwarded recording session to %{public}@", buf, 0x16u);
  }
  uint64_t v15 = [*(id *)(a1 + 32) logEventSubmitter];
  [v15 submitLogEvent:*(void *)(a1 + 48)];

  uint64_t v16 = [*(id *)(a1 + 32) cameraLoadBalancer];
  [v16 handleRecordingSessionForwardingSuccessForDecision:*(void *)(a1 + 56)];

  [*(id *)(a1 + 32) _submitLoadBalancingEventWithDecision:*(void *)(a1 + 56) numberOfRetries:*(void *)(a1 + 80)];
LABEL_14:
}

void __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_67(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) recordingSettingsControl];
  [v1 handleAccessoryIsNotConfiguredError];
}

uint64_t __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v4;
}

uint64_t __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_69(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forwardRecordingSessionForTrigger:*(void *)(a1 + 64) withLoadBalancerDecision:*(void *)(a1 + 40) deviceFilter:*(void *)(a1 + 56) sessionCoordinationLogEvent:*(void *)(a1 + 48) retryAttemptNumber:*(void *)(a1 + 72) + 1];
}

- (id)messagePayloadForStartRecordingSessionWithTriggerType:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v6 forKeyedSubscript:@"notificationTriggerType"];

  id v7 = [(HMDCameraRecordingManager *)self homePresenceByPairingIdentity];
  [v5 setObject:v7 forKeyedSubscript:@"HMDCameraRecordingHomePresenceByPairingIdentity"];

  id v8 = [(HMDCameraRecordingManager *)self accessory];
  id v9 = [v8 socketInfo];
  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [v9 dictionaryRepresentation];
      int v23 = 138543618;
      double v24 = v13;
      __int16 v25 = 2112;
      __int16 v26 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Adding socket info to outgoing start recording message payload: %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v15 = [v9 dictionaryRepresentation];
    [v5 setObject:v15 forKeyedSubscript:@"HMDCameraRecordingAccessorySocketInfo"];
  }
  uint64_t v16 = [v8 bonjourDeviceInfo];
  if (v16)
  {
    double v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = self;
    double v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = HMFGetLogIdentifier();
      int v23 = 138543618;
      double v24 = v20;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Adding bonjour device info to outgoing start recording message: %@", (uint8_t *)&v23, 0x16u);
    }
    [v5 setObject:v16 forKeyedSubscript:@"HMDCameraRecordingAccessoryBonjourDeviceInfo"];
  }
  __int16 v21 = (void *)[v5 copy];

  return v21;
}

- (id)homePresenceByPairingIdentity
{
  id v3 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDCameraRecordingManager *)self accessory];
  id v5 = [v4 home];
  id v6 = [v5 presenceMonitor];
  id v7 = [v6 currentHomePresence];
  id v8 = [v7 serializedIdentifierDictionary];

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

- (void)_loadBalanceRecordingSessionForTrigger:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(HMDCameraRecordingSessionCoordinationLogEvent);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HMDCameraRecordingManager__loadBalanceRecordingSessionForTrigger___block_invoke;
  aBlock[3] = &unk_1E6A0F028;
  void aBlock[4] = self;
  id v6 = _Block_copy(aBlock);
  id v7 = [(HMDCameraRecordingManager *)self camera];
  if (v7)
  {
    id v8 = [(HMDCameraRecordingManager *)self cameraLoadBalancer];
    id v9 = [v8 loadBalancingDecisionForCamera:v7 deviceFilter:v6];

    id v10 = [v9 analysisNode];

    if (v10)
    {
      [(HMDCameraRecordingManager *)self _forwardRecordingSessionForTrigger:a3 withLoadBalancerDecision:v9 deviceFilter:v6 sessionCoordinationLogEvent:v5 retryAttemptNumber:0];
    }
    else
    {
      double v17 = (void *)MEMORY[0x1D9452090]();
      uint64_t v18 = self;
      double v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v25 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@No device found for recording session, optimistically trying self", buf, 0xCu);
      }
      __int16 v21 = [(HMDCameraRecordingManager *)v18 logEventSubmitter];
      [v21 submitLogEvent:v5];

      uint64_t v22 = [(HMDCameraRecordingManager *)v18 homePresenceByPairingIdentity];
      [(HMDCameraRecordingManager *)v18 _prepareRecordingSessionForTrigger:a3 homePresenceByPairingIdentity:v22 reason:@"primary resident picked itself"];
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [(HMDCameraRecordingManager *)v12 cameraUUID];
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v14;
      __int16 v26 = 2112;
      uint64_t v27 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Camera object with UUID:%@ is nil", buf, 0x16u);
    }
    id v9 = [(HMDCameraRecordingManager *)v12 logEventSubmitter];
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v9 submitLogEvent:v5 error:v16];
  }
}

uint64_t __68__HMDCameraRecordingManager__loadBalanceRecordingSessionForTrigger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) camera];
  id v5 = [v4 currentSettings];
  id v6 = [v5 activityZones];
  if ([v6 count])
  {
    id v7 = [v3 capabilities];
    int v8 = [v7 supportsCameraActivityZones];

    if (!v8) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v9 = [v4 hapAccessory];
  id v10 = [v9 home];
  id v11 = [v10 personManagerSettings];
  if ([v11 isFaceClassificationEnabled])
  {
    id v12 = [v3 capabilities];
    int v13 = [v12 supportsFaceClassification];

    if (!v13) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v14 = [v4 currentSettings];
  if (([v14 recordingEventTriggers] & 0x10) != 0)
  {
    uint64_t v15 = [v3 capabilities];
    int v16 = [v15 supportsCameraPackageDetection];

    if (!v16) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  double v17 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v18 = [v17 preferenceForKey:@"HMDCameraRecordingManagerExcludePrimaryResident"];
  int v19 = [v18 BOOLValue];

  if (!v19
    || ![v3 isCurrentDevice]
    || ([*(id *)(a1 + 32) accessory],
        id v20 = objc_claimAutoreleasedReturnValue(),
        [v20 home],
        __int16 v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v21 isCurrentDeviceConfirmedPrimaryResident],
        v21,
        v20,
        !v22))
  {
    uint64_t v29 = 1;
    goto LABEL_20;
  }
  int v23 = (void *)MEMORY[0x1D9452090]();
  id v24 = *(id *)(a1 + 32);
  __int16 v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    __int16 v26 = HMFGetLogIdentifier();
    uint64_t v27 = [v3 device];
    uint64_t v28 = [v27 shortDescription];
    int v31 = 138543618;
    __int16 v32 = v26;
    __int16 v33 = 2112;
    uint64_t v34 = v28;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Excluding current device from camera recording load balancing because it is the primary resident: %@", (uint8_t *)&v31, 0x16u);
  }
LABEL_18:
  uint64_t v29 = 0;
LABEL_20:

  return v29;
}

- (void)_coordinateRecordingSessionForTrigger:(unint64_t)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingManager *)self camera];
  id v7 = v6;
  if (v6)
  {
    int v8 = [v6 hapAccessory];
    id v9 = v8;
    if (!v8)
    {
      int v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = self;
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v39 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot coordinate recording session because accessory reference is nil", buf, 0xCu);
      }
      goto LABEL_21;
    }
    id v10 = [v8 home];
    id v11 = v10;
    if (v10)
    {
      if ([v10 isCurrentDeviceConfirmedPrimaryResident])
      {
        id v12 = [v7 currentSettings];
        [v12 currentAccessMode];

        if (HMIsRecordingAllowedForCameraAccessMode())
        {
          int v13 = [(HMDCameraRecordingManager *)self recordingSettingsControl];
          char v14 = [v13 isCameraConfiguredForRecording];

          if (v14)
          {
            [(HMDCameraRecordingManager *)self _loadBalanceRecordingSessionForTrigger:a3];
          }
          else
          {
            __int16 v32 = (void *)MEMORY[0x1D9452090]();
            __int16 v33 = self;
            uint64_t v34 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              uint64_t v35 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              id v39 = v35;
              _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Synchronizing settings with camera because settings have recording enabled, but camera is not configured for recording", buf, 0xCu);
            }
            id v36 = [v9 cameraProfileSettingsManager];
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __67__HMDCameraRecordingManager__coordinateRecordingSessionForTrigger___block_invoke;
            v37[3] = &unk_1E6A19690;
            v37[4] = v33;
            v37[5] = a3;
            [v36 synchronizeSettingsToCameraWithCompletion:v37];
          }
          goto LABEL_20;
        }
        int v23 = (void *)MEMORY[0x1D9452090]();
        id v24 = self;
        __int16 v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          id v30 = HMFGetLogIdentifier();
          int v31 = HMCameraAccessModeAsString();
          *(_DWORD *)buf = 138543618;
          id v39 = v30;
          __int16 v40 = 2112;
          id v41 = v31;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Current access mode does not allow recording: %@", buf, 0x16u);
        }
LABEL_19:

LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      int v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = self;
      __int16 v25 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v39 = v26;
      uint64_t v27 = "%{public}@Current device is not the primary resident, not coordinating recording session";
      uint64_t v28 = v25;
      os_log_type_t v29 = OS_LOG_TYPE_INFO;
    }
    else
    {
      int v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = self;
      __int16 v25 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v39 = v26;
      uint64_t v27 = "%{public}@Cannot coordinate recording session because home reference is nil";
      uint64_t v28 = v25;
      os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1D49D5000, v28, v29, v27, buf, 0xCu);

    goto LABEL_19;
  }
  uint64_t v15 = (void *)MEMORY[0x1D9452090]();
  int v16 = self;
  double v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v39 = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot coordinate recording session because camera reference is nil", buf, 0xCu);
  }
LABEL_22:
}

void __67__HMDCameraRecordingManager__coordinateRecordingSessionForTrigger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to synchronize settings with camera while coordinating recording session: %@", buf, 0x16u);
    }
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__HMDCameraRecordingManager__coordinateRecordingSessionForTrigger___block_invoke_49;
    v10[3] = &unk_1E6A189D0;
    uint64_t v9 = *(void *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v9;
    dispatch_async(v8, v10);
  }
}

uint64_t __67__HMDCameraRecordingManager__coordinateRecordingSessionForTrigger___block_invoke_49(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Successfully synchronized settings with camera while coordinating recording session", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _loadBalanceRecordingSessionForTrigger:*(void *)(a1 + 40)];
}

- (void)_clipManagerDidStartUpCloudZone
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCameraRecordingManager *)self didShutDown])
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Ignoring clipManagerDidStartUpCloudZone because recording manager was shut down", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    int v8 = [(HMDCameraRecordingManager *)self cameraLoadBalancer];
    uint64_t v9 = [(HMDCameraRecordingManager *)self cameraUUID];
    [v8 setReadyToRecord:1 forCameraWithUUID:v9];

    [(HMDCameraRecordingManager *)self _resetRetryContextWithReason:@"Clip manager started up cloud zone"];
    if ([(HMDCameraRecordingManager *)self isMotionActive])
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = HMFGetLogIdentifier();
        int v14 = 138543362;
        uint64_t v15 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Clip manager started up cloud zone and motion is active, attempting to coordinate a recording session", (uint8_t *)&v14, 0xCu);
      }
      [(HMDCameraRecordingManager *)v11 _coordinateRecordingSessionForTrigger:0];
    }
  }
}

- (void)_shutDown
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(HMDCameraRecordingManager *)self didShutDown]) {
    _HMFPreconditionFailure();
  }
  id v3 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Shutting down", (uint8_t *)&v10, 0xCu);
  }
  [(HMDCameraRecordingManager *)v5 setDidShutDown:1];
  int v8 = [(HMDCameraRecordingManager *)v5 cameraLoadBalancer];
  uint64_t v9 = [(HMDCameraRecordingManager *)v5 cameraUUID];
  [v8 setReadyToRecord:0 forCameraWithUUID:v9];

  [(HMDCameraRecordingManager *)v5 _closeCurrentSessionsWithReason:3];
}

- (void)_start
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCameraRecordingManager *)self didShutDown]) {
    _HMFPreconditionFailure();
  }
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v30 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);
  }
  int v8 = [(HMDCameraRecordingManager *)v5 cameraLoadBalancer];
  uint64_t v9 = [(HMDCameraRecordingManager *)v5 cameraUUID];
  [v8 setReadyToRecord:0 forCameraWithUUID:v9];

  int v10 = [(HMDCameraRecordingManager *)v5 accessory];
  id v11 = [v10 home];

  uint64_t v12 = [v11 residentDeviceManager];
  [v12 addDataSource:v5];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __35__HMDCameraRecordingManager__start__block_invoke;
  v27[3] = &unk_1E6A197F0;
  v27[4] = v5;
  [v12 confirmWithCompletionHandler:v27];
  __int16 v13 = [(HMDCameraRecordingManager *)v5 recordingSettingsControl];
  [v13 setDelegate:v5];

  int v14 = [(HMDCameraRecordingManager *)v5 recordingSettingsControl];
  [v14 start];

  uint64_t v15 = [(HMDCameraRecordingManager *)v5 bulkSendSessionInitiator];
  [v15 configure];

  uint64_t v16 = [(HMDCameraRecordingManager *)v5 notificationTrigger];
  [v16 setDelegate:v5];

  double v17 = [(HMDCameraRecordingManager *)v5 notificationTrigger];
  [v17 start];

  uint64_t v18 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v11 userPrivilege:0 remoteAccessRequired:1];
  int v19 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v19, "setRoles:", objc_msgSend(v19, "roles") | 4);
  id v20 = (void *)[v19 copy];
  __int16 v21 = [(HMDCameraRecordingManager *)v5 camera];
  int v22 = [(HMDCameraRecordingManager *)v5 msgDispatcher];
  v28[0] = v18;
  v28[1] = v20;
  int v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v22 registerForMessage:@"kStartRecordingSessionRequestKey" receiver:v5 policies:v23 selector:sel_handleStartRecordingSessionRequest_];

  id v24 = [(HMDCameraRecordingManager *)v5 notificationCenter];
  __int16 v25 = [v21 accessory];
  [v24 addObserver:v5 selector:sel_handleCameraSettingsDidChangeNotification_ name:@"HMDCameraProfileSettingsDidChangeNotification" object:v25];

  __int16 v26 = [v21 clipManager];
  LODWORD(v23) = [v26 hasStartedUpCloudZone];

  if (v23) {
    [(HMDCameraRecordingManager *)v5 _clipManagerDidStartUpCloudZone];
  }
}

void __35__HMDCameraRecordingManager__start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  int v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      uint64_t v9 = "%{public}@Failed to confirm primary resident with error: %@";
      int v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    int v14 = v8;
    uint64_t v9 = "%{public}@Successfully confirmed primary resident";
    int v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (void)recordingSettingsControlDidConfigure:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  int v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v21 = 138543362;
    int v22 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Recording settings control did configure", (uint8_t *)&v21, 0xCu);
  }
  BOOL v10 = [(HMDCameraRecordingManager *)v7 didShutDown];
  os_log_type_t v11 = (void *)MEMORY[0x1D9452090]();
  uint32_t v12 = v7;
  int v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      __int16 v15 = HMFGetLogIdentifier();
      int v21 = 138543362;
      int v22 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Ignoring recordingSettingsControlDidConfigure: because recording manager was shut down", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if (v14)
    {
      id v16 = HMFGetLogIdentifier();
      int v21 = 138543362;
      int v22 = v16;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Closing current session if one exists because recording settings have been configured", (uint8_t *)&v21, 0xCu);
    }
    [(HMDCameraRecordingManager *)v12 _closeCurrentSessionsWithReason:0];
    if ([(HMDCameraRecordingManager *)v12 isMotionActive])
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      uint64_t v18 = v12;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        int v21 = 138543362;
        int v22 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Motion is active and camera did configure successfully, attempting to coordinate a recording session", (uint8_t *)&v21, 0xCu);
      }
      [(HMDCameraRecordingManager *)v18 _coordinateRecordingSessionForTrigger:0];
    }
  }
}

- (void)clipManagerDidStop:(id)a3
{
  id v4 = [(HMDCameraRecordingManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDCameraRecordingManager_clipManagerDidStop___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __48__HMDCameraRecordingManager_clipManagerDidStop___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) didShutDown])
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Ignoring clipManagerDidStop: because recording manager was shut down", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) cameraLoadBalancer];
    int v7 = [*(id *)(a1 + 32) cameraUUID];
    [v6 setReadyToRecord:0 forCameraWithUUID:v7];

    int v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Closing current session because clip manager became unavailable", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) _closeCurrentSessionsWithReason:3];
  }
}

- (void)clipManagerDidStartUpCloudZone:(id)a3
{
  id v4 = [(HMDCameraRecordingManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HMDCameraRecordingManager_clipManagerDidStartUpCloudZone___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __60__HMDCameraRecordingManager_clipManagerDidStartUpCloudZone___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clipManagerDidStartUpCloudZone];
}

- (void)notificationTrigger:(id)a3 didObserveTriggerType:(unint64_t)a4 changeToActive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(HMDCameraRecordingManager *)self workQueue];
  dispatch_assert_queue_V2(v9);

  if (![(HMDCameraRecordingManager *)self didShutDown])
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    if (a4 == 1)
    {
      if (!v5)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v18 = [(HMDCameraRecordingManager *)self currentRecordingSession];
      int v19 = [v18 timelineManager];
      [v19 handleDoorbellDidActivateAtDate:v14];
    }
    else
    {
      if (!a4)
      {
        [(HMDCameraRecordingManager *)self setMotionActive:v5];
        __int16 v15 = [(HMDCameraRecordingManager *)self currentRecordingSession];
        id v16 = [v15 timelineManager];
        [v16 handleMotionActive:v5 didChangeAtDate:v14];

        uint64_t v17 = [(HMDCameraRecordingManager *)self currentRecordingSession];
        [v17 handleMotionActive:v5];
      }
      if (!v5) {
        goto LABEL_15;
      }
    }
    id v20 = (void *)MEMORY[0x1D9452090]([(HMDCameraRecordingManager *)self _resetRetryContextWithReason:@"Received recording session trigger from accessory"]);
    int v21 = self;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v24 = 138543618;
      __int16 v25 = v23;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Coordinating recording session for active trigger of type %lu", (uint8_t *)&v24, 0x16u);
    }
    [(HMDCameraRecordingManager *)v21 _coordinateRecordingSessionForTrigger:a4];
    goto LABEL_15;
  }
  BOOL v10 = (void *)MEMORY[0x1D9452090]();
  os_log_type_t v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    int v24 = 138543362;
    __int16 v25 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Ignoring notificationTrigger:didObserveTriggerType:changeToActive: because recording manager was shut down", (uint8_t *)&v24, 0xCu);
  }
LABEL_16:
}

- (void)shutDown
{
  id v3 = [(HMDCameraRecordingManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HMDCameraRecordingManager_shutDown__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__HMDCameraRecordingManager_shutDown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutDown];
}

- (void)start
{
  id v3 = [(HMDCameraRecordingManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HMDCameraRecordingManager_start__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __34__HMDCameraRecordingManager_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (NSDictionary)stateDump
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(HMDCameraRecordingManager *)self workQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  BOOL v10 = __38__HMDCameraRecordingManager_stateDump__block_invoke;
  os_log_type_t v11 = &unk_1E6A197C8;
  id v12 = v3;
  int v13 = self;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return (NSDictionary *)v6;
}

void __38__HMDCameraRecordingManager_stateDump__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) currentRecordingSession];
  v2 = [v3 stateDump];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"Recording Session"];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    os_log_type_t v11 = v4;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Camera recording manager: %p destroyed", buf, 0x16u);
  }
  [(HMDCameraRecordingLoadBalancer *)v4->_cameraLoadBalancer removeDataForCameraWithUUID:v4->_cameraUUID];
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraRecordingManager;
  [(HMDCameraRecordingManager *)&v7 dealloc];
}

- (HMDCameraRecordingManager)initWithCamera:(id)a3 recordingManagementService:(id)a4 workQueue:(id)a5 dependencyFactory:(id)a6 notificationCenter:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v42.receiver = self;
  v42.super_class = (Class)HMDCameraRecordingManager;
  uint64_t v17 = [(HMDCameraRecordingManager *)&v42 init];
  if (v17)
  {
    uint64_t v18 = [v12 hapAccessory];
    uint64_t v19 = [v12 uniqueIdentifier];
    cameraUUID = v17->_cameraUUID;
    v17->_cameraUUID = (NSUUID *)v19;

    objc_storeStrong((id *)&v17->_dependencyFactory, a6);
    objc_storeStrong((id *)&v17->_notificationCenter, a7);
    objc_storeWeak((id *)&v17->_accessory, v18);
    uint64_t v21 = [v12 msgDispatcher];
    msgDispatcher = v17->_msgDispatcher;
    v17->_msgDispatcher = (HMFMessageDispatcher *)v21;

    objc_storeWeak((id *)&v17->_camera, v12);
    uint64_t v23 = [v12 messageTargetUUID];
    messageTargetUUID = v17->_messageTargetUUID;
    v17->_messageTargetUUID = (NSUUID *)v23;

    __int16 v25 = [v18 home];
    __int16 v26 = [v25 homeManager];
    uint64_t v27 = [v26 cameraLoadBalancer];
    cameraLoadBalancer = v17->_cameraLoadBalancer;
    v17->_cameraLoadBalancer = (HMDCameraRecordingLoadBalancer *)v27;

    objc_storeStrong((id *)&v17->_workQueue, a5);
    uint64_t v29 = [v15 createSessionNotificationTrigger:v12 workQueue:v14];
    notificationTrigger = v17->_notificationTrigger;
    v17->_notificationTrigger = (HMDCameraRecordingSessionNotificationTrigger *)v29;

    uint64_t v31 = [v15 createSettingsControl:v14 accessory:v18 managementService:v13];
    recordingSettingsControl = v17->_recordingSettingsControl;
    v17->_recordingSettingsControl = (HMDCameraRecordingSettingsControl *)v31;

    uint64_t v33 = [v15 createBulkSendSessionInitiatorWithWorkQueue:v14 accessory:v18];
    bulkSendSessionInitiator = v17->_bulkSendSessionInitiator;
    v17->_bulkSendSessionInitiator = (HMDCameraRecordingBulkSendSessionInitiator *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CA80] set];
    activeRecordingSessions = v17->_activeRecordingSessions;
    v17->_activeRecordingSessions = (NSMutableSet *)v35;

    uint64_t v37 = [v15 featuresDataSource];
    featuresDataSource = v17->_featuresDataSource;
    v17->_featuresDataSource = (HMDFeaturesDataSource *)v37;

    uint64_t v39 = [v15 logEventSubmitter];
    logEventSubmitter = v17->_logEventSubmitter;
    v17->_logEventSubmitter = (HMMLogEventSubmitting *)v39;
  }
  return v17;
}

- (HMDCameraRecordingManager)initWithCamera:(id)a3 recordingManagementService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  HMDispatchQueueNameString();
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (const char *)[v8 UTF8String];
  __int16 v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
  id v12 = objc_alloc_init(HMDCameraRecordingManagerDependencyFactory);
  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v14 = [(HMDCameraRecordingManager *)self initWithCamera:v7 recordingManagementService:v6 workQueue:v11 dependencyFactory:v12 notificationCenter:v13];

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t64 != -1) {
    dispatch_once(&logCategory__hmf_once_t64, &__block_literal_global_94);
  }
  v2 = (void *)logCategory__hmf_once_v65;
  return v2;
}

uint64_t __40__HMDCameraRecordingManager_logCategory__block_invoke()
{
  logCategory__hmf_once_v65 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end