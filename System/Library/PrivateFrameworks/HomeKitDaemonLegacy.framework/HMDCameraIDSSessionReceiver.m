@interface HMDCameraIDSSessionReceiver
+ (id)logCategory;
- (HMDCameraIDSSessionInviterDeviceVerifier)sessionInviterDeviceVerifier;
- (HMDCameraIDSSessionReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 sessionInviterDeviceVerifier:(id)a5 delegate:(id)a6;
- (HMDCameraIDSSessionReceiverDelegate)delegate;
- (IDSSession)session;
- (NSString)remoteDestination;
- (id)logIdentifier;
- (void)_callSessionEndedWithError:(id)a3;
- (void)_callSessionSetup:(id)a3;
- (void)_receivedIDSSession:(id)a3;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDCameraIDSSessionReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInviterDeviceVerifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMDCameraIDSSessionInviterDeviceVerifier)sessionInviterDeviceVerifier
{
  return self->_sessionInviterDeviceVerifier;
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraIDSSessionReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraIDSSessionReceiverDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraIDSSessionHandler *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v21 = 138544130;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 1024;
      unsigned int v26 = a4;
      __int16 v27 = 2112;
      id v28 = v9;
      v16 = "%{public}@Session %@ has failed with reason: %u and error: %@";
      v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 38;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v17, v18, v16, (uint8_t *)&v21, v19);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = HMFGetLogIdentifier();
    int v21 = 138543874;
    v22 = v15;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 1024;
    unsigned int v26 = a4;
    v16 = "%{public}@Session %@ has ended with reason: %u";
    v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 28;
    goto LABEL_6;
  }

  v20 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1030 underlyingError:v9];
  [(HMDCameraIDSSessionReceiver *)v12 _callSessionEndedWithError:v20];
}

- (void)sessionStarted:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Session %{public}@ has started", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraIDSSessionHandler *)v7 sessionID];
  [v10 markMilestoneFor:@"IDSSessionStartedOnReceiver"];

  [(HMDCameraIDSSessionReceiver *)v7 _callSessionSetup:0];
}

- (void)_receivedIDSSession:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v9;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received invitation for session %@", buf, 0x16u);
  }
  [(HMDCameraIDSSessionHandler *)v7 setIdsSession:v4];
  v10 = [(HMDCameraIDSSessionHandler *)v7 idsSession];
  int v11 = [(HMDCameraIDSSessionHandler *)v7 workQueue];
  [v10 setDelegate:v7 queue:v11];

  v12 = +[HMDApplicationVendorIDStore sharedStore];
  __int16 v13 = [(HMDCameraIDSSessionHandler *)v7 sessionID];
  id v14 = [v13 hostProcessBundleIdentifier];
  uint64_t v15 = [v12 machUUIDsForApplication:v14];

  if (v15)
  {
    v16 = [v15 lastObject];
    v17 = [v16 UUIDString];

    os_log_type_t v18 = [(HMDCameraIDSSessionHandler *)v7 idsSession];
    uint64_t v32 = *MEMORY[0x1E4F6AA88];
    v33 = v17;
    uint32_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    [v18 setPreferences:v19];
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    int v21 = v7;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = HMFGetLogIdentifier();
      id v24 = [(HMDCameraIDSSessionHandler *)v21 sessionID];
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      __int16 v36 = 2112;
      id v37 = v24;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Could not find any mach UUIDs for session %@", buf, 0x16u);
    }
  }
  __int16 v25 = (void *)MEMORY[0x1D9452090]();
  unsigned int v26 = v7;
  __int16 v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = HMFGetLogIdentifier();
    uint64_t v29 = [(HMDCameraIDSSessionHandler *)v26 idsSession];
    *(_DWORD *)buf = 138543618;
    v35 = v28;
    __int16 v36 = 2112;
    id v37 = v29;
    _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Accepting invitation for session %@", buf, 0x16u);
  }
  v30 = [(HMDCameraIDSSessionHandler *)v26 idsSession];
  [v30 acceptInvitation];

  v31 = [(HMDCameraIDSSessionHandler *)v26 sessionID];
  [v31 markMilestoneFor:@"IDSSessionInvitationReceived"];
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v17);

  os_log_type_t v18 = (void *)MEMORY[0x1D9452090]();
  uint32_t v19 = self;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v56 = v21;
    __int16 v57 = 2112;
    id v58 = v14;
    __int16 v59 = 2112;
    id v60 = v15;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Received invitation for session %@ from %@", buf, 0x20u);
  }
  v22 = +[HMDDeviceHandle deviceHandleForDestination:v15];
  if (!v22)
  {
    v34 = (void *)MEMORY[0x1D9452090]();
    v35 = v19;
    __int16 v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v37;
      __int16 v57 = 2112;
      id v58 = v15;
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not determine device handle for fromID: %@", buf, 0x16u);
    }
    goto LABEL_17;
  }
  __int16 v23 = [(HMDCameraIDSSessionReceiver *)v19 sessionInviterDeviceVerifier];
  char v24 = [v23 canAcceptInvitationFromDeviceWithHandle:v22];

  if ((v24 & 1) == 0)
  {
    v34 = (void *)MEMORY[0x1D9452090]();
    v35 = v19;
    uint64_t v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v39;
      __int16 v57 = 2112;
      id v58 = v22;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Ignoring invitation from %@", buf, 0x16u);
    }
LABEL_17:

    goto LABEL_26;
  }
  __int16 v25 = (void *)MEMORY[0x1E4F28DC0];
  unsigned int v26 = getIDSSessionOptionsAllowedClasses();
  id v54 = 0;
  __int16 v27 = [v25 unarchivedObjectOfClasses:v26 fromData:v16 error:&v54];
  id v53 = v54;

  if (v27)
  {
    id v50 = v12;
    id v51 = v13;
    id v28 = v27;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = 0;
    }
    id v30 = v29;

    v31 = [v30 objectForKeyedSubscript:@"kCameraSessionID"];
    uint64_t v32 = [(HMDCameraIDSSessionReceiver *)v19 sessionInviterDeviceVerifier];
    char v33 = [v32 canAcceptInvitationForSessionWithIdentifier:v31];

    if (v33)
    {
      [(HMDCameraIDSSessionReceiver *)v19 _receivedIDSSession:v14];
    }
    else
    {
      v45 = (void *)MEMORY[0x1D9452090]();
      v46 = v19;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v48 = v49 = v45;
        *(_DWORD *)buf = 138543618;
        v56 = v48;
        __int16 v57 = 2112;
        id v58 = v31;
        _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring invitation for camera session ID: %@", buf, 0x16u);

        v45 = v49;
      }
    }

    id v12 = v50;
    id v13 = v51;
  }
  else
  {
    v40 = (void *)MEMORY[0x1D9452090]();
    v41 = v19;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v52 = v13;
      v44 = id v43 = v12;
      *(_DWORD *)buf = 138543618;
      v56 = v44;
      __int16 v57 = 2112;
      id v58 = v53;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request id from context: %@", buf, 0x16u);

      id v12 = v43;
      id v13 = v52;
    }
  }

LABEL_26:
}

- (void)_callSessionEndedWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling didEndSession delegate with error %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraIDSSessionReceiver *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 sessionReceiver:v7 didEndSessionWithError:v4];
  }
}

- (void)_callSessionSetup:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling didSetup delegate with error %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraIDSSessionReceiver *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 sessionReceiver:v7 didSetUpWithError:v4];
  }
}

- (NSString)remoteDestination
{
  v3 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraIDSSessionHandler *)self idsSession];
  v5 = [v4 destination];

  return (NSString *)v5;
}

- (IDSSession)session
{
  v3 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return [(HMDCameraIDSSessionHandler *)self idsSession];
}

- (HMDCameraIDSSessionReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 sessionInviterDeviceVerifier:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    os_log_type_t v18 = (void *)_HMFPreconditionFailure();
    return (HMDCameraIDSSessionReceiver *)+[HMDCameraIDSSessionReceiver logCategory];
  }
  id v14 = v13;
  v20.receiver = self;
  v20.super_class = (Class)HMDCameraIDSSessionReceiver;
  uint64_t v15 = [(HMDCameraIDSSessionHandler *)&v20 initWithSessionID:v10 workQueue:v11];
  id v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeStrong((id *)&v16->_sessionInviterDeviceVerifier, a5);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_133844 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_133844, &__block_literal_global_133845);
  }
  v2 = (void *)logCategory__hmf_once_v15_133846;
  return v2;
}

uint64_t __42__HMDCameraIDSSessionReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v15_133846;
  logCategory__hmf_once_v15_133846 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end