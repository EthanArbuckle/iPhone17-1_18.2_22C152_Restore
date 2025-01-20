@interface HMDHomePresenceMonitor
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (HMDHomePresence)currentHomePresence;
- (HMDHomePresenceMonitor)init;
- (HMDHomePresenceMonitor)initWithCoder:(id)a3;
- (HMDHomePresenceUpdate)homePresenceUpdate;
- (NSDictionary)presenceMap;
- (NSString)timerID;
- (void)_addUser:(id)a3;
- (void)_auditPresenceMap;
- (void)_evaluatePresence:(id)a3 newUserPresence:(id)a4 presenceStatusUpdateReason:(id)a5;
- (void)_insertUserPresence:(id)a3;
- (void)_preparePresenceMap;
- (void)_reEvaluatePresenceWithReason:(id)a3;
- (void)_registerForMessages;
- (void)_removeNonExistingUsers;
- (void)_removeUserPresence:(id)a3;
- (void)_startAuditTimer;
- (void)_updateUserPresence:(id)a3 presenceAuth:(id)a4 completion:(id)a5;
- (void)addNewUser:(id)a3;
- (void)configure:(id)a3 messageDispatcher:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleHomeDataLoadedNotification:(id)a3;
- (void)handleTimerFiredNotification:(id)a3;
- (void)handleUserHomePresencePayload:(id)a3 device:(id)a4 user:(id)a5 completion:(id)a6;
- (void)handleUserPresenceUpdate:(id)a3;
- (void)handleUserPresenceUpdateNotification:(id)a3;
- (void)removeUser:(id)a3;
- (void)residentChanged;
- (void)setCurrentHomePresence:(id)a3;
@end

@implementation HMDHomePresenceMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerID, 0);
  objc_storeStrong((id *)&self->_currentHomePresence, 0);
  objc_storeStrong((id *)&self->_presenceMap, 0);
}

- (NSString)timerID
{
  return self->_timerID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDHomePresenceMonitor *)self presenceMap];
  v5 = (void *)[v6 copy];
  [v4 encodeObject:v5 forKey:@"kHMDHomePresenceMonitorPresenceMapCodingKey"];
}

- (HMDHomePresenceMonitor)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDHomePresenceMonitor *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:3];
    v8 = objc_msgSend(v6, "setWithArray:", v7, v15, v16);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kHMDHomePresenceMonitorPresenceMapCodingKey"];
    uint64_t v10 = [v9 mutableCopy];
    presenceMap = v5->_presenceMap;
    v5->_presenceMap = (NSMutableDictionary *)v10;

    if (!v5->_presenceMap)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
      v13 = v5->_presenceMap;
      v5->_presenceMap = (NSMutableDictionary *)v12;
    }
  }

  return v5;
}

- (void)_removeUserPresence:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  presenceMap = self->_presenceMap;
  id v6 = [v8 user];
  v7 = [v6 uuid];
  [(NSMutableDictionary *)presenceMap setObject:0 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)_insertUserPresence:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  presenceMap = self->_presenceMap;
  id v6 = [v8 user];
  v7 = [v6 uuid];
  [(NSMutableDictionary *)presenceMap setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
}

- (HMDHomePresenceUpdate)homePresenceUpdate
{
  v3 = [HMDHomePresenceUpdate alloc];
  id v4 = [(HMDHomePresenceMonitor *)self currentHomePresence];
  v5 = [(HMDHomePresenceUpdate *)v3 initWithHomePresence:v4 userPresence:0 update:0 causingDevice:0];

  return v5;
}

- (void)_evaluatePresence:(id)a3 newUserPresence:(id)a4 presenceStatusUpdateReason:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v45 = a4;
  id v9 = a5;
  uint64_t v10 = [(HMDHomePresenceBase *)self home];
  [(HMDHomePresenceMonitor *)self _auditPresenceMap];
  uint64_t v11 = [(HMDHomePresenceMonitor *)self presenceMap];
  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v50 = v15;
    __int16 v51 = 2112;
    v52 = (HMDHomePresenceUpdate *)v11;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Evaluating home presence with current presence map: %@", buf, 0x16u);
  }
  uint64_t v16 = [[HMDHomePresence alloc] initWithHome:v10 userPresenceMap:v11 lastUpdateByDevice:v8];
  uint64_t v17 = [(HMDHomePresenceMonitor *)v13 currentHomePresence];

  v42 = (void *)v11;
  if (v17)
  {
    uint64_t v18 = [(HMDHomePresenceMonitor *)v13 currentHomePresence];
    char v43 = HMFEqualObjects();
  }
  else
  {
    char v43 = 1;
  }
  v19 = (void *)MEMORY[0x1D9452090]();
  v20 = v13;
  v21 = HMFGetOSLogHandle();
  v46 = v10;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = HMFGetLogIdentifier();
    v23 = [(HMDHomePresenceMonitor *)v20 currentHomePresence];
    v24 = [v23 shortDescription];
    [(HMDHomePresence *)v16 shortDescription];
    v26 = id v25 = v8;
    HMFBooleanToString();
    v27 = id v41 = v9;
    *(_DWORD *)buf = 138544130;
    v50 = v22;
    __int16 v51 = 2112;
    v52 = v24;
    __int16 v53 = 2112;
    v54 = v26;
    __int16 v55 = 2112;
    v56 = v27;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating home presence from %@ to %@, Equal: %@", buf, 0x2Au);

    id v8 = v25;
    uint64_t v10 = v46;

    id v9 = v41;
  }

  v28 = (void *)MEMORY[0x1D9452090]([(HMDHomePresenceMonitor *)v20 setCurrentHomePresence:v16]);
  v29 = v20;
  v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v50 = v31;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Current home presence evaluated, sending notification", buf, 0xCu);

    uint64_t v10 = v46;
  }

  logAndPostNotification(@"HMDHomePresenceEvaluatedNotification", v29, 0);
  if ((v43 & 1) == 0)
  {
    v44 = v16;
    [v10 saveWithReason:@"HMDHomePresenceMonitorUpdatedReason" postSyncNotification:0];
    BOOL v32 = [v9 value] == 2;
    v33 = [HMDHomePresenceUpdate alloc];
    v34 = [(HMDHomePresenceMonitor *)v29 currentHomePresence];
    v35 = [(HMDHomePresenceUpdate *)v33 initWithHomePresence:v34 userPresence:v45 update:v32 causingDevice:v8];

    v36 = (void *)MEMORY[0x1D9452090]();
    v37 = v29;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v50 = v39;
      __int16 v51 = 2112;
      v52 = v35;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Sending home presence update %@", buf, 0x16u);
    }
    v47 = @"HMDHomePresenceUpdateKey";
    v48 = v35;
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    logAndPostNotification(@"HMDHomePresenceUpdateNotification", v37, v40);

    uint64_t v10 = v46;
    uint64_t v16 = v44;
  }
  [(HMDHomePresenceMonitor *)v29 _startAuditTimer];
}

- (void)_updateUserPresence:(id)a3 presenceAuth:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 presenceAuthStatus];
  char v12 = HMFEqualObjects();

  v13 = (void *)MEMORY[0x1D9452090]();
  v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      BOOL v32 = v17;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Auth and compute status are not changing for user %@", buf, 0x16u);
    }
    uint64_t v18 = _Block_copy(v10);
    v19 = v18;
    if (v18) {
      (*((void (**)(void *))v18 + 2))(v18);
    }
  }
  else
  {
    if (v16)
    {
      v20 = HMFGetLogIdentifier();
      v21 = [v8 presenceAuthStatus];
      *(_DWORD *)buf = 138544130;
      BOOL v32 = v20;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2112;
      id v36 = v9;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Presence auth status is changing from %@ to %@ for user %@", buf, 0x2Au);
    }
    v19 = [(HMDHomePresenceBase *)v14 home];
    if ([v8 isOwner])
    {
      [v19 setPresenceAuthStatus:v9];
      v22 = [v19 currentUser];
      [v22 setPresenceAuthStatus:v9];

      v23 = _Block_copy(v10);
      v24 = v23;
      if (v23) {
        (*((void (**)(void *))v23 + 2))(v23);
      }
    }
    else
    {
      v24 = (void *)[v8 newModelWithChangeType:2];
      id v25 = [v9 number];
      [v24 setPresenceAuthorizationStatus:v25];

      v26 = [v19 backingStore];
      v27 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      v28 = [v26 transaction:@"kRemoteUpdateUserPresenceNotificationKey" options:v27];

      [v28 add:v24];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __70__HMDHomePresenceMonitor__updateUserPresence_presenceAuth_completion___block_invoke;
      v29[3] = &unk_1E6A19358;
      id v30 = v10;
      [v28 run:v29];
    }
  }
}

void __70__HMDHomePresenceMonitor__updateUserPresence_presenceAuth_completion___block_invoke(uint64_t a1)
{
  v1 = (void (**)(void))_Block_copy(*(const void **)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }
}

- (void)handleUserHomePresencePayload:(id)a3 device:(id)a4 user:(id)a5 completion:(id)a6
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v59 = a4;
  id v11 = a5;
  char v12 = (void (**)(id, void *))a6;
  v13 = (void *)MEMORY[0x1D9452090]();
  v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    BOOL v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v69 = v16;
    __int16 v70 = 2112;
    id v71 = v10;
    __int16 v72 = 2112;
    id v73 = v59;
    __int16 v74 = 2112;
    id v75 = v11;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Received user presence: [%@] from device [%@] for user [%@]", buf, 0x2Au);
  }
  if (v11)
  {
    uint64_t v17 = [(HMDHomePresenceBase *)v14 home];
    if (([v17 isCurrentDeviceConfirmedPrimaryResident] & 1) == 0)
    {
      v40 = (void *)MEMORY[0x1D9452090]();
      id v41 = v14;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        char v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v69 = v43;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@This device is not the current resident, cannot process the presence update, responding with error", buf, 0xCu);
      }
      uint64_t v18 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2708];
      if (v12) {
        v12[2](v12, v18);
      }
      goto LABEL_32;
    }
    uint64_t v18 = [MEMORY[0x1E4F2EBC0] authWithDict:v10];
    if (!v18)
    {
      v19 = (void *)MEMORY[0x1E4F2EBC0];
      v20 = objc_msgSend(v10, "hmf_numberForKey:", @"kUserPresenceAuthStatusKey");
      uint64_t v18 = [v19 authWithNumber:v20];
    }
    uint64_t v57 = +[HMDUserPresenceRegion regionWithDict:v10];
    v56 = +[HMDUserPresenceUpdateReason reasonWithDict:v10];
    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = v14;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      id v25 = [v11 userID];
      *(_DWORD *)buf = 138544386;
      v69 = v24;
      __int16 v70 = 2114;
      id v71 = v18;
      __int16 v72 = 2114;
      id v73 = v57;
      __int16 v74 = 2114;
      id v75 = v56;
      __int16 v76 = 2112;
      v77 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Received user presence message with auth: %{public}@, region: %{public}@, reason: %{public}@, user: %@", buf, 0x34u);
    }
    v26 = [(HMDHomePresenceMonitor *)v22 presenceMap];
    v27 = [v11 uuid];
    v58 = [v26 objectForKeyedSubscript:v27];

    if (!v58)
    {
      v44 = (void *)MEMORY[0x1D9452090]();
      id v45 = v22;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = HMFGetLogIdentifier();
        v48 = [v11 uuid];
        *(_DWORD *)buf = 138543618;
        v69 = v47;
        __int16 v70 = 2112;
        id v71 = v48;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Could not find the user with UUID %@", buf, 0x16u);
      }
      v49 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      if (v12) {
        v12[2](v12, v49);
      }

      goto LABEL_31;
    }
    v28 = [v58 user];
    v29 = [v28 presenceAuthStatus];
    if (HMFEqualObjects())
    {
      id v30 = [v58 presenceRegionStatus];
      int v31 = HMFEqualObjects();

      if (v31)
      {
        BOOL v32 = (void *)MEMORY[0x1D9452090]([v58 setPresenceRegionStatus:v57]);
        __int16 v33 = v22;
        id v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          __int16 v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v69 = v35;
          __int16 v70 = 2112;
          id v71 = v58;
          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@User presence auth or region status for %@ are not changing, updated presence timestamp", buf, 0x16u);
        }
        [v17 saveWithReason:@"HMDHomePresenceMonitorUpdatedReason" postSyncNotification:0];
        if (v12) {
          v12[2](v12, 0);
        }
        goto LABEL_31;
      }
    }
    else
    {
    }
    v50 = [HMDUserPresence alloc];
    __int16 v51 = [v58 user];
    v52 = [MEMORY[0x1E4F1C9C8] now];
    __int16 v53 = [(HMDUserPresence *)v50 initWithUser:v51 presenceRegionStatus:v57 timeStamp:v52 presenceUpdateReason:v56 device:v59];

    objc_initWeak((id *)buf, v22);
    v54 = [(HMDUserPresence *)v53 user];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __79__HMDHomePresenceMonitor_handleUserHomePresencePayload_device_user_completion___block_invoke;
    v60[3] = &unk_1E6A07768;
    objc_copyWeak(&v67, (id *)buf);
    id v61 = v58;
    __int16 v55 = v53;
    v62 = v55;
    id v63 = v11;
    v66 = v12;
    id v64 = v59;
    id v65 = v56;
    [(HMDHomePresenceMonitor *)v22 _updateUserPresence:v54 presenceAuth:v18 completion:v60];

    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)buf);

LABEL_31:
LABEL_32:

    goto LABEL_33;
  }
  id v36 = (void *)MEMORY[0x1D9452090]();
  __int16 v37 = v14;
  id v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    uint64_t v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v69 = v39;
    _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Remote user is nil", buf, 0xCu);
  }
  uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
  if (v12) {
    v12[2](v12, v17);
  }
LABEL_33:
}

void __79__HMDHomePresenceMonitor_handleUserHomePresencePayload_device_user_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = (os_unfair_lock_s *)WeakRetained;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      v7 = [*(id *)(a1 + 32) user];
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 138544130;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Updated presence for user %@ from %@ to %@", (uint8_t *)&v14, 0x2Au);
    }
    os_unfair_lock_lock_with_options();
    id v10 = *(void **)&v4[16]._os_unfair_lock_opaque;
    uint64_t v11 = *(void *)(a1 + 40);
    char v12 = [*(id *)(a1 + 48) uuid];
    [v10 setObject:v11 forKeyedSubscript:v12];

    os_unfair_lock_unlock(v4 + 14);
    uint64_t v13 = *(void *)(a1 + 72);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
    [(os_unfair_lock_s *)v4 _evaluatePresence:*(void *)(a1 + 56) newUserPresence:*(void *)(a1 + 40) presenceStatusUpdateReason:*(void *)(a1 + 64)];
  }
}

- (void)handleUserPresenceUpdateNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHomePresenceBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HMDHomePresenceMonitor_handleUserPresenceUpdateNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__HMDHomePresenceMonitor_handleUserPresenceUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) userInfo];
    int v13 = 138543618;
    int v14 = v5;
    __int16 v15 = 2112;
    __int16 v16 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received presence update notification with note %@", (uint8_t *)&v13, 0x16u);
  }
  v7 = +[HMDAppleAccountManager sharedManager];
  id v8 = [v7 device];

  uint64_t v9 = [*(id *)(a1 + 32) home];
  id v10 = [v9 currentUser];

  uint64_t v11 = *(void **)(a1 + 32);
  char v12 = [*(id *)(a1 + 40) userInfo];
  [v11 handleUserHomePresencePayload:v12 device:v8 user:v10 completion:0];
}

- (void)handleUserPresenceUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHomePresenceBase *)self home];
  id v6 = [v4 userForHome:v5];

  v7 = [v4 messagePayload];
  id v8 = [v4 remoteSourceDevice];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__HMDHomePresenceMonitor_handleUserPresenceUpdate___block_invoke;
  v10[3] = &unk_1E6A197F0;
  id v11 = v4;
  id v9 = v4;
  [(HMDHomePresenceMonitor *)self handleUserHomePresencePayload:v7 device:v8 user:v6 completion:v10];
}

uint64_t __51__HMDHomePresenceMonitor_handleUserPresenceUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a2];
}

- (void)removeUser:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDHomePresenceMonitor *)self presenceMap];
  id v6 = [v4 uuid];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing user %@ from the presence map", buf, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    presenceMap = v9->_presenceMap;
    int v13 = [v4 uuid];
    [(NSMutableDictionary *)presenceMap removeObjectForKey:v13];

    os_unfair_lock_unlock(&v9->_lock);
    int v14 = [NSString stringWithFormat:@"Removed user : %@", v4];
    [(HMDHomePresenceMonitor *)v9 _reEvaluatePresenceWithReason:v14];
  }
  __int16 v15 = (void *)MEMORY[0x1D9452090]();
  __int16 v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = HMFGetLogIdentifier();
    uint64_t v19 = [(HMDHomePresenceMonitor *)v16 presenceMap];
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v18;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    id v25 = v19;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Presence map after removing user : %@, %@", buf, 0x20u);
  }
}

- (void)addNewUser:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding new user %@ to the presence map", (uint8_t *)&v9, 0x16u);
  }
  [(HMDHomePresenceMonitor *)v6 _addUser:v4];
  [(HMDHomePresenceMonitor *)v6 _evaluatePresence:0 newUserPresence:0 presenceStatusUpdateReason:0];
}

- (void)_addUser:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 uuid];

  if (v5)
  {
    os_unfair_lock_lock_with_options();
    id v6 = [[HMDUserPresence alloc] initWithUser:v4 presenceRegionStatus:0];
    presenceMap = self->_presenceMap;
    id v8 = [v4 uuid];
    [(NSMutableDictionary *)presenceMap setObject:v6 forKeyedSubscript:v8];

    os_unfair_lock_unlock(&self->_lock);
    int v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = [(HMDHomePresenceMonitor *)v10 presenceMap];
      int v15 = 138543874;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Presence map after adding new user : %@, %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      __int16 v16 = v14;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@UUID for user %@ is nil, not adding it to the monitor map.", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_removeNonExistingUsers
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [(HMDHomePresenceBase *)self home];
  id v3 = [v2 usersSupportingPresence];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(HMDHomePresenceMonitor *)self presenceMap];
  id obj = [v4 allValues];

  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v25;
    *(void *)&long long v6 = 138543618;
    long long v21 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "user", v21);
        char v11 = [v3 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          id v12 = (void *)MEMORY[0x1D9452090]();
          uint64_t v13 = self;
          int v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v15 = HMFGetLogIdentifier();
            __int16 v16 = [v9 user];
            *(_DWORD *)buf = v21;
            v29 = v15;
            __int16 v30 = 2112;
            int v31 = v16;
            _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing the user %@ from presence map since it isn't part of home anymore", buf, 0x16u);
          }
          p_lock = &v13->_lock;
          os_unfair_lock_lock_with_options();
          presenceMap = v13->_presenceMap;
          __int16 v19 = [v9 user];
          __int16 v20 = [v19 uuid];
          [(NSMutableDictionary *)presenceMap removeObjectForKey:v20];

          os_unfair_lock_unlock(p_lock);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }
}

- (void)_preparePresenceMap
{
  v2 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [(HMDHomePresenceBase *)self home];
  id v4 = [v3 usersSupportingPresence];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 138543618;
    long long v21 = v6;
    do
    {
      uint64_t v9 = 0;
      uint64_t v22 = v7;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        char v11 = [(HMDHomePresenceMonitor *)v2 presenceMap];
        id v12 = [v10 uuid];
        uint64_t v13 = [v11 objectForKeyedSubscript:v12];

        if (!v13)
        {
          int v14 = (void *)MEMORY[0x1D9452090]();
          int v15 = v2;
          __int16 v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            __int16 v17 = v2;
            uint64_t v18 = v8;
            v20 = __int16 v19 = v4;
            *(_DWORD *)buf = v21;
            v28 = v20;
            __int16 v29 = 2112;
            __int16 v30 = v10;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Adding home user %@ to the presence map, as it isn't present", buf, 0x16u);

            id v4 = v19;
            uint64_t v8 = v18;
            v2 = v17;
            uint64_t v7 = v22;
          }

          [(HMDHomePresenceMonitor *)v15 _addUser:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }

  [(HMDHomePresenceMonitor *)v2 _removeNonExistingUsers];
}

- (void)_startAuditTimer
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDHomePresenceMonitor *)self timerID];
  if (v3)
  {
    id v4 = +[HMDBackgroundTaskManager sharedManager];
    [v4 cancelTaskWithIdentifier:v3 onObserver:self];

    uint64_t v5 = [(HMDHomePresenceBase *)self home];
    long long v6 = [v5 primaryResident];
    uint64_t v7 = [v6 device];

    if ([v7 isCurrentDevice])
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v9 = objc_msgSend(v8, "hmf_dateComponents");

      uint64_t v10 = [v9 minute];
      [v9 setMinute:presenceMonitorAuditInMinutes + v10];
      char v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v12 = [v11 dateFromComponents:v9];

      uint64_t v13 = (void *)MEMORY[0x1D9452090]();
      int v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = HMFGetLogIdentifier();
        __int16 v17 = objc_msgSend(v12, "hmf_localTimeDescription");
        *(_DWORD *)buf = 138543874;
        __int16 v35 = v16;
        __int16 v36 = 2112;
        __int16 v37 = v3;
        __int16 v38 = 2112;
        id v39 = v17;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting the audit timer (%@) to fire at %@", buf, 0x20u);
      }
      uint64_t v18 = +[HMDBackgroundTaskManager sharedManager];
      id v33 = 0;
      char v19 = [v18 scheduleTaskWithIdentifier:v3 fireDate:v12 onObserver:v14 selector:sel_handleTimerFiredNotification_ error:&v33];
      id v20 = v33;

      if ((v19 & 1) == 0)
      {
        long long v21 = (void *)MEMORY[0x1D9452090]();
        uint64_t v22 = v14;
        long long v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          long long v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          __int16 v35 = v24;
          __int16 v36 = 2112;
          __int16 v37 = v3;
          __int16 v38 = 2112;
          id v39 = v20;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);
        }
      }
    }
    else
    {
      __int16 v29 = (void *)MEMORY[0x1D9452090]();
      __int16 v30 = self;
      int v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v35 = v32;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@This is not the resident device, not starting the audit timer", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v25 = (void *)MEMORY[0x1D9452090]();
    long long v26 = self;
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v28;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to start audit timer with nil timer id", buf, 0xCu);
    }
  }
}

- (void)_auditPresenceMap
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    long long v6 = HMFGetLogIdentifier();
    uint64_t v7 = [(HMDHomePresenceMonitor *)v4 presenceMap];
    *(_DWORD *)buf = 138543618;
    long long v25 = v6;
    __int16 v26 = 2112;
    long long v27 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Auditing the presence map %@", buf, 0x16u);
  }
  [(HMDHomePresenceMonitor *)v4 _removeNonExistingUsers];
  uint64_t v8 = [(HMDHomePresenceMonitor *)v4 presenceMap];
  uint64_t v9 = [(HMDHomePresenceBase *)v4 home];
  uint64_t v10 = [v9 primaryResident];
  char v11 = [v10 device];

  int v12 = [v11 isCurrentDevice];
  uint64_t v13 = (void *)MEMORY[0x1D9452090]();
  int v14 = v4;
  int v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      __int16 v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v11 name];
      char v19 = [v11 identifier];
      *(_DWORD *)buf = 138543874;
      long long v25 = v17;
      __int16 v26 = 2112;
      long long v27 = v18;
      __int16 v28 = 2112;
      __int16 v29 = v19;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@This device is the primary resident: [%@ / %@]", buf, 0x20u);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke;
    v23[3] = &unk_1E6A07720;
    v23[4] = v14;
    id v20 = v23;
  }
  else
  {
    if (v16)
    {
      long long v21 = HMFGetLogIdentifier();
      uint64_t v22 = [v11 identifier];
      *(_DWORD *)buf = 138543618;
      long long v25 = v21;
      __int16 v26 = 2112;
      long long v27 = v22;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@This device is not the primary resident : %@", buf, 0x16u);
    }
    id v20 = &__block_literal_global_53;
  }
  [v8 enumerateKeysAndObjectsUsingBlock:v20];
}

void __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 user];
  uint64_t v8 = [v7 presenceAuthStatus];
  uint64_t v9 = [v8 value];

  if (v9 == 1)
  {
    uint64_t v10 = [v6 presenceRegionStatus];

    if (v10)
    {
      char v11 = [v6 updateTimestamp];

      if (v11)
      {
        int v12 = [v6 updateTimestamp];
        [v12 timeIntervalSinceNow];
        double v14 = fabs(v13);

        double v15 = (double)(unint64_t)(60 * (presenceMonitorRefreshGracePeriodInMinutes + presenceFeedRefreshInMinutes));
        BOOL v16 = (void *)MEMORY[0x1D9452090]();
        id v17 = *(id *)(a1 + 32);
        uint64_t v18 = HMFGetOSLogHandle();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v14 <= v15)
        {
          if (v19)
          {
            long long v21 = HMFGetLogIdentifier();
            int v22 = 138544130;
            long long v23 = v21;
            __int16 v24 = 2112;
            id v25 = v6;
            __int16 v26 = 2048;
            double v27 = v14;
            __int16 v28 = 2048;
            double v29 = v15;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ update is still valid as the time since last update %lf is less than allowed %lf", (uint8_t *)&v22, 0x2Au);
          }
        }
        else
        {
          if (v19)
          {
            id v20 = HMFGetLogIdentifier();
            int v22 = 138544130;
            long long v23 = v20;
            __int16 v24 = 2112;
            id v25 = v6;
            __int16 v26 = 2048;
            double v27 = v14;
            __int16 v28 = 2048;
            double v29 = v15;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ update is stale as the time since last update %lf is more than allowed %lf", (uint8_t *)&v22, 0x2Au);
          }
          [v6 setPresenceRegionStatus:0];
        }
      }
    }
  }
}

uint64_t __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke_51(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setPresenceRegionStatus:0];
}

- (void)handleTimerFiredNotification:(id)a3
{
  id v4 = [a3 userInfo];
  objc_msgSend(v4, "hmf_stringForKey:", @"HMD.BGTM.NK");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(HMDHomePresenceMonitor *)self timerID];
  int v6 = HMFEqualObjects();

  if (v6)
  {
    uint64_t v7 = [NSString stringWithFormat:@"BTM Timer fired with ID: %@", v8];
    [(HMDHomePresenceMonitor *)self _reEvaluatePresenceWithReason:v7];
  }
}

- (void)_reEvaluatePresenceWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomePresenceBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMDHomePresenceMonitor__reEvaluatePresenceWithReason___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__HMDHomePresenceMonitor__reEvaluatePresenceWithReason___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Re-evaluating presence due to reason: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _evaluatePresence:0 newUserPresence:0 presenceStatusUpdateReason:0];
}

- (void)residentChanged
{
}

- (void)handleHomeDataLoadedNotification:(id)a3
{
}

- (void)setCurrentHomePresence:(id)a3
{
  id v4 = (HMDHomePresence *)a3;
  os_unfair_lock_lock_with_options();
  currentHomePresence = self->_currentHomePresence;
  self->_currentHomePresence = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDHomePresence)currentHomePresence
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentHomePresence;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)presenceMap
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_presenceMap copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)_registerForMessages
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)HMDHomePresenceMonitor;
  [(HMDHomePresenceBase *)&v11 _registerForMessages];
  id v3 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v3, "setRoles:", objc_msgSend(v3, "roles") | 4);
  id v4 = (void *)[v3 copy];
  id v5 = [(HMDHomePresenceBase *)self home];
  uint64_t v6 = [(HMDHomePresenceBase *)self msgDispatcher];
  v12[0] = v4;
  uint64_t v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:0 remoteAccessRequired:0];
  v12[1] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v6 registerForMessage:@"kRemoteUpdateUserPresenceNotificationKey" receiver:self policies:v8 selector:sel_handleUserPresenceUpdate_];

  uint64_t v9 = [v5 presenceFeeder];
  if (v9)
  {
    __int16 v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:self selector:sel_handleUserPresenceUpdateNotification_ name:@"HMDUserPresenceUpdateLocalNotification" object:v9];
  }
}

- (void)configure:(id)a3 messageDispatcher:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HMDHomePresenceMonitor;
  [(HMDHomePresenceBase *)&v10 configure:a3 messageDispatcher:a4];
  id v5 = NSString;
  uint64_t v6 = [(HMDHomePresenceBase *)self presenceMonitorMessageTargetUUID];
  uint64_t v7 = [v6 UUIDString];
  int v8 = [v5 stringWithFormat:@"presence.monitor/%@", v7];
  timerID = self->_timerID;
  self->_timerID = v8;

  [(HMDHomePresenceMonitor *)self _preparePresenceMap];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDHomePresenceMonitor;
  [(HMDHomePresenceMonitor *)&v4 dealloc];
}

- (HMDHomePresenceMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDHomePresenceMonitor;
  v2 = [(HMDHomePresenceMonitor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    presenceMap = v2->_presenceMap;
    v2->_presenceMap = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_12707 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_12707, &__block_literal_global_12708);
  }
  v2 = (void *)logCategory__hmf_once_v1_12709;
  return v2;
}

uint64_t __37__HMDHomePresenceMonitor_logCategory__block_invoke()
{
  logCategory__hmf_once_v1_12709 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end