@interface HMDHomePresenceMonitor
+ (BOOL)supportsSecureCoding;
+ (id)interestingServiceTypeToCharacteristicTypesMap;
+ (id)logCategory;
- (BOOL)_setLocalActivityTimestampForUserUUID:(id)a3 timestamp:(id)a4;
- (BOOL)_shouldWeUpdateWorkingStoreAfterUpdatingUserPresence:(id)a3 withNewestLocalActivityTimeStamp:(id)a4;
- (BOOL)isUserAtHome:(id)a3;
- (HMDHomePresence)currentHomePresence;
- (HMDHomePresenceMonitor)init;
- (HMDHomePresenceMonitor)initWithCoder:(id)a3;
- (HMDHomePresenceUpdate)homePresenceUpdate;
- (NSDictionary)presenceMap;
- (NSString)timerID;
- (id)getLastLocalActivityTimeStampForUserUUID:(id)a3;
- (void)_addUser:(id)a3;
- (void)_auditPresenceMap;
- (void)_evaluatePresence:(id)a3 newUserPresence:(id)a4 presenceStatusUpdateReason:(id)a5;
- (void)_handleAllowedPeriodNotification:(id)a3 withCompletionHandler:(id)a4;
- (void)_handlePrimaryResidentChangedNotification:(id)a3;
- (void)_handlePrivilegeUpdate:(id)a3;
- (void)_handleRestrictedGuestAllowedPeriodEndedNotification:(id)a3;
- (void)_handleRestrictedGuestAllowedPeriodStartedNotification:(id)a3;
- (void)_insertUserPresence:(id)a3;
- (void)_populatePresenceMapFromWorkingStore;
- (void)_preparePresenceMap;
- (void)_reEvaluatePresenceWithReason:(id)a3;
- (void)_registerForMessages;
- (void)_removeNonExistingUsers;
- (void)_removeUserPresence:(id)a3;
- (void)_saveUserPresenceToWorkingStore:(id)a3 forUser:(id)a4;
- (void)_startAuditTimer;
- (void)_updateUserPresence:(id)a3 presenceAuth:(id)a4 completion:(id)a5;
- (void)addNewUser:(id)a3;
- (void)configure:(id)a3 messageDispatcher:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleCharacteristicsChangedNotification:(id)a3;
- (void)handleMatterLockStateChangedNotification:(id)a3;
- (void)handleTimerFiredNotification:(id)a3;
- (void)handleUpdatedCharacteristics:(id)a3 userUUIDFromNotification:(id)a4;
- (void)handleUserHomePresencePayload:(id)a3 device:(id)a4 user:(id)a5 completion:(id)a6;
- (void)handleUserPresenceUpdate:(id)a3;
- (void)handleUserPresenceUpdateNotification:(id)a3;
- (void)removeUser:(id)a3;
- (void)resolveUserFromCharacteristicNotificationContext:(id)a3 completion:(id)a4;
- (void)setCurrentHomePresence:(id)a3;
- (void)updateLastLocalActivityTimestamp:(id)a3 forUserUUID:(id)a4;
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
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDHomePresenceMonitor *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:3];
    v8 = objc_msgSend(v6, "setWithArray:", v7, v15, v16);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kHMDHomePresenceMonitorPresenceMapCodingKey"];
    uint64_t v10 = [v9 mutableCopy];
    presenceMap = v5->_presenceMap;
    v5->_presenceMap = (NSMutableDictionary *)v10;

    if (!v5->_presenceMap)
    {
      uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
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

- (BOOL)isUserAtHome:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_presenceMap objectForKeyedSubscript:v4];
  LOBYTE(self) = [v6 isAtHome];

  os_unfair_lock_unlock(p_lock);
  return (char)self;
}

- (id)getLastLocalActivityTimeStampForUserUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_presenceMap objectForKeyedSubscript:v4];
  v7 = [v6 lastLocalActivityTimeStamp];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)_shouldWeUpdateWorkingStoreAfterUpdatingUserPresence:(id)a3 withNewestLocalActivityTimeStamp:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v6 lastLocalActivityTimeStamp];
      int v19 = 138543874;
      v20 = v11;
      __int16 v21 = 2112;
      v22 = v12;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@lastTime: %@, current: %@", (uint8_t *)&v19, 0x20u);
    }
    [v6 setLastLocalActivityTimeStamp:v7];
    v13 = [v6 lastLocalActivityUpdateTimeStampInWorkingStore];
    if (v13)
    {
      v14 = [v6 lastLocalActivityUpdateTimeStampInWorkingStore];
      [v7 timeIntervalSinceDate:v14];
      double v16 = fabs(v15);
    }
    else
    {
      double v16 = 0.0;
    }

    BOOL v17 = v16 >= 3600.0 || v16 <= 0.0;
  }
  else
  {
    [v6 setLastLocalActivityTimeStamp:0];
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)_setLocalActivityTimestampForUserUUID:(id)a3 timestamp:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v9 = [(NSMutableDictionary *)self->_presenceMap objectForKeyedSubscript:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    v11 = [v9 user];
    char v12 = [v11 isRemoteAccessAllowed];

    BOOL v13 = (v12 & 1) == 0
       && [(HMDHomePresenceMonitor *)self _shouldWeUpdateWorkingStoreAfterUpdatingUserPresence:v10 withNewestLocalActivityTimeStamp:v7];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    double v15 = self;
    HMFGetOSLogHandle();
    double v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      BOOL v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v17;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Could not find the user in the presence map. %@", (uint8_t *)&v19, 0x16u);
    }
    BOOL v13 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (void)handleMatterLockStateChangedNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHomePresenceBase *)self home];
  if ([v5 isCurrentDeviceConfirmedPrimaryResident])
  {
    id v6 = [(HMDHomePresenceBase *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__HMDHomePresenceMonitor_handleMatterLockStateChangedNotification___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v8 = v4;
    v9 = self;
    id v10 = v5;
    dispatch_async(v6, block);
  }
}

void __67__HMDHomePresenceMonitor_handleMatterLockStateChangedNotification___block_invoke(id *a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v2 = [a1[4] object];
  if ([v2 conformsToProtocol:&unk_26E4FFCC0]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  v5 = [a1[4] userInfo];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = a1[5];
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = HMFGetLogIdentifier();
    id v10 = [a1[4] name];
    v11 = [v4 shortDescription];
    *(_DWORD *)buf = 138544130;
    v63 = v9;
    __int16 v64 = 2112;
    id v65 = v10;
    __int16 v66 = 2112;
    v67 = v11;
    __int16 v68 = 2112;
    v69 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Received '%@' notification for %@: %@", buf, 0x2Au);
  }
  char v12 = [v5 objectForKeyedSubscript:@"HMDAccessoryMatterLockOperationDateNotificationKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
  id v14 = v13;

  double v15 = [v5 objectForKeyedSubscript:@"HMDAccessoryMatterLockOperationTypeNotificationKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v16 = v15;
  }
  else {
    double v16 = 0;
  }
  id v17 = v16;

  unsigned int v18 = [v17 unsignedIntegerValue];
  if (v18 - 2 < 2)
  {
    v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = a1[5];
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v63 = v34;
      __int16 v64 = 2112;
      id v65 = v17;
      v35 = "%{public}@Unexpected operation type: %@";
      v36 = v33;
      os_log_type_t v37 = OS_LOG_TYPE_ERROR;
LABEL_31:
      _os_log_impl(&dword_22F52A000, v36, v37, v35, buf, 0x16u);
    }
LABEL_32:

    goto LABEL_51;
  }
  if (v18 > 1)
  {
    v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = a1[5];
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v63 = v34;
      __int16 v64 = 2112;
      id v65 = v17;
      v35 = "%{public}@Unhandled MTRDoorLockLockOperationType: %@";
      v36 = v33;
      os_log_type_t v37 = OS_LOG_TYPE_FAULT;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  [v17 unsignedIntegerValue];
  int v19 = [v5 objectForKeyedSubscript:@"HMDAccessoryMatterLockOperationSourceNotificationKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  unsigned int v22 = [v21 unsignedIntegerValue];
  if (v22 <= 0xA && ((1 << v22) & 0x508) != 0)
  {
    uint64_t v23 = [v5 objectForKeyedSubscript:@"HMDAccessoryMatterLockUserUUIDNotificationKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }
    id v25 = v24;

    if (v25)
    {
      id v60 = v21;
      id v61 = v14;
      v59 = [v4 home];
      v26 = [v59 uuid];
      v27 = [a1[6] uuid];
      char v28 = objc_msgSend(v26, "hmf_isEqualToUUID:", v27);

      if (v28)
      {
        v29 = [a1[6] userWithUUID:v25];
        if (v29)
        {
          id v21 = v60;
          if (v61)
          {
            id v30 = v12;
          }
          else
          {
            id v30 = [MEMORY[0x263EFF910] now];
          }
          v58 = v30;
          v50 = v59;
          [a1[5] updateLastLocalActivityTimestamp:v30 forUserUUID:v25];
        }
        else
        {
          v53 = (void *)MEMORY[0x230FBD990]();
          id v54 = a1[5];
          v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v56 = HMFGetLogIdentifier();
            id v57 = a1[6];
            *(_DWORD *)buf = 138543874;
            v63 = v56;
            __int16 v64 = 2112;
            id v65 = v25;
            __int16 v66 = 2112;
            v67 = v57;
            _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Unable to find user with UUID %@ in home %@", buf, 0x20u);
          }
          v50 = v59;
          id v21 = v60;
        }
      }
      else
      {
        v47 = (void *)MEMORY[0x230FBD990]();
        id v48 = a1[5];
        v49 = HMFGetOSLogHandle();
        v50 = v59;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v51 = HMFGetLogIdentifier();
          id v52 = a1[6];
          *(_DWORD *)buf = 138544130;
          v63 = v51;
          __int16 v64 = 2112;
          id v65 = v4;
          __int16 v66 = 2112;
          v67 = v52;
          __int16 v68 = 2112;
          v69 = v59;
          _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Ignoring matter lock event as it pertains to an accessory in a different home: %@, %@ != %@", buf, 0x2Au);
        }
        id v21 = v60;
      }

      id v14 = v61;
    }
    else
    {
      v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = a1[5];
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = id v41 = v14;
        *(_DWORD *)buf = 138543362;
        v63 = v42;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Matter lock state change notification does not contain the userUUID. Ignoring it.", buf, 0xCu);

        id v14 = v41;
      }
    }
  }
  else
  {
    v43 = (void *)MEMORY[0x230FBD990]();
    id v44 = a1[5];
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v63 = v46;
      __int16 v64 = 2112;
      id v65 = v21;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_DEBUG, "%{public}@Unhandled MTRDoorLockOperationSource: %@", buf, 0x16u);
    }
  }

LABEL_51:
}

- (void)updateLastLocalActivityTimestamp:(id)a3 forUserUUID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6
    && v7
    && [(HMDHomePresenceMonitor *)self _setLocalActivityTimestampForUserUUID:v7 timestamp:v6])
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v12;
      __int16 v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Was asked to update the local activity time stamp for the user uuid: %@", buf, 0x16u);
    }
    BOOL v13 = +[HMDCoreData sharedInstance];
    id v14 = [(HMDHomePresenceBase *)v10 home];
    double v15 = [v14 uuid];
    double v16 = [v13 contextWithHomeUUID:v15];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __71__HMDHomePresenceMonitor_updateLastLocalActivityTimestamp_forUserUUID___block_invoke;
    v18[3] = &unk_264A2E610;
    id v19 = v8;
    id v20 = v16;
    id v21 = v10;
    id v22 = v6;
    id v17 = v16;
    [v17 performBlock:v18];
  }
}

void __71__HMDHomePresenceMonitor_updateLastLocalActivityTimestamp_forUserUUID___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[_MKFHome findHomeMemberWithUUID:v2 context:v3];

  if (v4)
  {
    [v4 setLastLocalActivityTimeStamp:*(void *)(a1 + 56)];
    v5 = *(void **)(a1 + 40);
    id v24 = 0;
    char v6 = [v5 save:&v24];
    id v7 = v24;
    if (v6)
    {
      id v8 = (os_unfair_lock_s *)(*(void *)(a1 + 48) + 56);
      os_unfair_lock_lock_with_options();
      v9 = [MEMORY[0x263EFF910] now];
      id v10 = [*(id *)(*(void *)(a1 + 48) + 64) objectForKeyedSubscript:*(void *)(a1 + 32)];
      [v10 setLastLocalActivityUpdateTimeStampInWorkingStore:v9];

      os_unfair_lock_unlock(v8);
      v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 48);
      BOOL v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        uint64_t v15 = *(void *)(a1 + 56);
        double v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v26 = v14;
        __int16 v27 = 2112;
        uint64_t v28 = v15;
        __int16 v29 = 2112;
        id v30 = v16;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully updated home member's local activity timestamp to [%@] for user [%@] in the working store", buf, 0x20u);
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 48);
      BOOL v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        uint64_t v23 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v26 = v22;
        __int16 v27 = 2112;
        uint64_t v28 = v23;
        __int16 v29 = 2112;
        id v30 = v7;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the home member's local activity timestamp : %@, error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 48);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home member with model id : %@", buf, 0x16u);
    }
  }
}

- (void)resolveUserFromCharacteristicNotificationContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomePresenceBase *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v6 service];
  id v10 = [v9 accessory];
  v11 = [v10 home];
  id v12 = [v11 lockNotificationManager];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HMDHomePresenceMonitor_resolveUserFromCharacteristicNotificationContext_completion___block_invoke;
  aBlock[3] = &unk_264A17630;
  id v19 = v6;
  id v20 = v7;
  aBlock[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = _Block_copy(aBlock);
  double v16 = [v13 notificationContext];
  id v17 = [v10 uuid];
  [v12 resolveEncodedCharacteristicNotificationContext:v16 accessoryUUID:v17 completion:v15];
}

void __86__HMDHomePresenceMonitor_resolveUserFromCharacteristicNotificationContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 userUUID];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    v9 = [v5 userUUID];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
LABEL_5:

    goto LABEL_6;
  }
  id v10 = [v5 labelIdentifier];

  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 48);
    v9 = [v5 labelIdentifier];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v9);
    goto LABEL_5;
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    uint64_t v16 = *(void *)(a1 + 40);
    int v17 = 138543874;
    id v18 = v15;
    __int16 v19 = 2112;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to resolve user with notification context for characteristic %@: %@", (uint8_t *)&v17, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_6:
}

- (void)handleUpdatedCharacteristics:(id)a3 userUUIDFromNotification:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDHomePresenceBase *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v65 = [(HMDHomePresenceBase *)self home];
  v69 = self;
  v9 = [(id)objc_opt_class() interestingServiceTypeToCharacteristicTypesMap];
  v63 = [MEMORY[0x263EFF980] array];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v6;
  uint64_t v70 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
  if (!v70)
  {
    id v59 = 0;
    goto LABEL_40;
  }
  id v59 = 0;
  uint64_t v10 = *(void *)v73;
  uint64_t v66 = *(void *)v73;
  id v60 = v7;
  __int16 v64 = v9;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v73 != v10) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v72 + 1) + 8 * v11);
      id v13 = [v12 service];
      id v14 = [v13 type];
      uint64_t v15 = [v9 objectForKeyedSubscript:v14];

      if (!v15)
      {
        v38 = (void *)MEMORY[0x230FBD990]();
        id v39 = v69;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          id v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v77 = v41;
          __int16 v78 = 2112;
          id v79 = v13;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring service because it's not interesting: %@", buf, 0x16u);
        }
        goto LABEL_27;
      }
      uint64_t v16 = [v12 type];
      char v17 = [v15 containsObject:v16];

      if ((v17 & 1) == 0)
      {
        v38 = (void *)MEMORY[0x230FBD990]();
        id v39 = v69;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v77 = v42;
          __int16 v78 = 2112;
          id v79 = v12;
          v43 = v40;
          os_log_type_t v44 = OS_LOG_TYPE_DEBUG;
          v45 = "%{public}@Ignoring characteristic because it's not interesting: %@";
          goto LABEL_26;
        }
LABEL_27:

        goto LABEL_28;
      }
      id v18 = [v12 previousValue];

      if (!v18)
      {
        v38 = (void *)MEMORY[0x230FBD990]();
        id v39 = v69;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v77 = v42;
          __int16 v78 = 2112;
          id v79 = v12;
          v43 = v40;
          os_log_type_t v44 = OS_LOG_TYPE_INFO;
          v45 = "%{public}@Ignoring characteristic with no previous value because we don't know if it changed: %@";
LABEL_26:
          _os_log_impl(&dword_22F52A000, v43, v44, v45, buf, 0x16u);

          uint64_t v10 = v66;
        }
        goto LABEL_27;
      }
      __int16 v19 = [v13 accessory];
      v67 = [v19 home];
      uint64_t v20 = [v67 uuid];
      __int16 v21 = [v65 uuid];
      char v22 = objc_msgSend(v20, "hmf_isEqualToUUID:", v21);

      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = v69;
      __int16 v25 = HMFGetOSLogHandle();
      v26 = v25;
      if (v22)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          __int16 v27 = HMFGetLogIdentifier();
          [v12 previousValue];
          uint64_t v28 = contexta = v19;
          __int16 v29 = [v12 value];
          *(_DWORD *)buf = 138544130;
          v77 = v27;
          __int16 v78 = 2112;
          id v79 = v12;
          __int16 v80 = 2112;
          v81 = v28;
          __int16 v82 = 2112;
          v83 = v29;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Found interesting characteristic whose value has changed: <%@: %@ -> %@>", buf, 0x2Au);

          id v7 = v60;
          __int16 v19 = contexta;
        }
        [v63 addObject:v12];
        if (!v7)
        {
          id v30 = [v67 lockNotificationManager];
          v9 = v64;
          if ([v30 shouldResolveNotificationContextForCharacteristic:v12])
          {
            context = (void *)MEMORY[0x230FBD990]();
            uint64_t v31 = v24;
            id v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v33 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v77 = v33;
              __int16 v78 = 2112;
              id v79 = v12;
              _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Characteristic includes notification context that needs to be resolved: %@", buf, 0x16u);

              v9 = v64;
            }

            if (v59)
            {
              v34 = (void *)MEMORY[0x230FBD990]();
              v35 = v31;
              v36 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                os_log_type_t v37 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v77 = v37;
                __int16 v78 = 2112;
                id v79 = obj;
                _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Multiple characteristics with notification context at once, using first: %@", buf, 0x16u);

                v9 = v64;
              }
            }
            else
            {
              id v59 = v12;
            }
          }

          goto LABEL_34;
        }
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v77 = v46;
          __int16 v78 = 2112;
          id v79 = v12;
          __int16 v80 = 2112;
          v81 = v65;
          __int16 v82 = 2112;
          v83 = v67;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Ignoring updated characteristic as it belongs to an accessory in a different home: %@, %@ != %@", buf, 0x2Au);
        }
      }
      v9 = v64;
LABEL_34:

      uint64_t v10 = v66;
LABEL_28:

      ++v11;
    }
    while (v70 != v11);
    uint64_t v47 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
    uint64_t v70 = v47;
  }
  while (v47);
LABEL_40:

  if (![v63 count])
  {
    id v54 = (void *)MEMORY[0x230FBD990]();
    v55 = v69;
    v56 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      id v57 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v77 = v57;
      _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring updates since none are interesting", buf, 0xCu);
    }
    goto LABEL_49;
  }
  if (!v59)
  {
    v58 = [MEMORY[0x263EFF910] now];
    [(HMDHomePresenceMonitor *)v69 updateLastLocalActivityTimestamp:v58 forUserUUID:v7];

LABEL_49:
    v53 = v59;
    goto LABEL_50;
  }
  id v48 = (void *)MEMORY[0x230FBD990]();
  v49 = v69;
  v50 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    v51 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v77 = v51;
    _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@Resolving user from characteristic notification context", buf, 0xCu);
  }
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __80__HMDHomePresenceMonitor_handleUpdatedCharacteristics_userUUIDFromNotification___block_invoke;
  v71[3] = &unk_264A17608;
  v71[4] = v49;
  id v52 = v49;
  v53 = v59;
  [(HMDHomePresenceMonitor *)v52 resolveUserFromCharacteristicNotificationContext:v59 completion:v71];
LABEL_50:
}

void __80__HMDHomePresenceMonitor_handleUpdatedCharacteristics_userUUIDFromNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v13 = 138543874;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Characteristic notification context resolved: %@, %@", (uint8_t *)&v13, 0x20u);
  }
  if (!v5)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = [MEMORY[0x263EFF910] now];
    [v11 updateLastLocalActivityTimestamp:v12 forUserUUID:0];
  }
}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomePresenceBase *)self home];
  if ([v5 isCurrentDeviceConfirmedPrimaryResident])
  {
    id v6 = [(HMDHomePresenceBase *)self workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__HMDHomePresenceMonitor_handleCharacteristicsChangedNotification___block_invoke;
    v7[3] = &unk_264A2F820;
    id v8 = v4;
    v9 = self;
    dispatch_async(v6, v7);
  }
}

void __67__HMDHomePresenceMonitor_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"kModifiedCharacteristicsKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if ([v5 count])
  {
    id v6 = [v2 objectForKeyedSubscript:@"kUserUUIDKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    v9 = [v2 objectForKeyedSubscript:@"kMessageUserOverrideKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if (v11) {
      id v12 = v11;
    }
    else {
      id v12 = v8;
    }
    id v13 = v12;
    if (v13)
    {
      [*(id *)(a1 + 40) handleUpdatedCharacteristics:v5 userUUIDFromNotification:v13];
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 40);
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        char v22 = HMFGetLogIdentifier();
        int v23 = 138543362;
        id v24 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@The notification does not contain a user UUID.", (uint8_t *)&v23, 0xCu);
      }
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 40);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 32);
      int v23 = 138543618;
      id v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring notification with no changed characteristics: %@", (uint8_t *)&v23, 0x16u);
    }
  }
}

- (void)_handleAllowedPeriodNotification:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomePresenceBase *)self home];
  int v9 = [v8 isCurrentDeviceConfirmedPrimaryResident];

  if (v9)
  {
    uint64_t v10 = [(HMDHomePresenceBase *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__HMDHomePresenceMonitor__handleAllowedPeriodNotification_withCompletionHandler___block_invoke;
    block[3] = &unk_264A2EE80;
    void block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v10, block);
  }
}

void __81__HMDHomePresenceMonitor__handleAllowedPeriodNotification_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v28 = 138543618;
    __int16 v29 = v5;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@RG allowed period notification: %@", (uint8_t *)&v28, 0x16u);
  }
  id v7 = [*(id *)(a1 + 40) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9 && ([v9 isRestrictedGuest] & 1) != 0)
  {
    uint64_t v10 = [*(id *)(a1 + 32) presenceMap];
    id v11 = [v9 uuid];
    id v12 = [v10 objectForKeyedSubscript:v11];

    if (v12)
    {
      id v13 = (void (**)(void))_Block_copy(*(const void **)(a1 + 48));
      id v14 = v13;
      if (!v13)
      {
LABEL_20:

        goto LABEL_21;
      }
      id v15 = v13[2];
    }
    else
    {
      int v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = *(id *)(a1 + 32);
      __int16 v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        int v28 = 138543618;
        __int16 v29 = v26;
        __int16 v30 = 2112;
        id v31 = v9;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Did not find presence information for restricted guest: %@", (uint8_t *)&v28, 0x16u);
      }
      uint64_t v27 = (void (**)(void))_Block_copy(*(const void **)(a1 + 48));
      id v14 = v27;
      if (!v27) {
        goto LABEL_20;
      }
      id v15 = v27[2];
    }
    v15();
    goto LABEL_20;
  }
  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = *(id *)(a1 + 32);
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    id v20 = [*(id *)(a1 + 32) home];
    __int16 v21 = [v20 users];
    int v28 = 138543618;
    __int16 v29 = v19;
    __int16 v30 = 2112;
    id v31 = v21;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[RG] Unable to add the user in the presence map as we could not find it inside the users list in home or not RG: %@", (uint8_t *)&v28, 0x16u);
  }
  char v22 = _Block_copy(*(const void **)(a1 + 48));
  id v12 = v22;
  if (v22) {
    (*((void (**)(void *, void))v22 + 2))(v22, 0);
  }
LABEL_21:
}

- (void)_handleRestrictedGuestAllowedPeriodEndedNotification:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__HMDHomePresenceMonitor__handleRestrictedGuestAllowedPeriodEndedNotification___block_invoke;
  v3[3] = &unk_264A175E0;
  v3[4] = self;
  [(HMDHomePresenceMonitor *)self _handleAllowedPeriodNotification:a3 withCompletionHandler:v3];
}

void __79__HMDHomePresenceMonitor__handleRestrictedGuestAllowedPeriodEndedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  id v5 = [v3 rawPresenceRegionStatus];
  if ([v5 value] == 2)
  {

LABEL_8:
    char v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = *(id *)(a1 + 32);
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Not simulating user not atHome presence as RG is not atHome", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_11;
  }
  id v6 = [v4 rawPresenceRegionStatus];
  uint64_t v7 = [v6 value];

  if (!v7) {
    goto LABEL_8;
  }
  id v8 = [v4 user];
  id v9 = [HMDUserPresence alloc];
  uint64_t v10 = [v4 presenceRegionStatus];
  id v11 = [(HMDUserPresence *)v9 initWithUser:v8 presenceRegionStatus:v10];

  id v12 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_lock_with_options();
  id v13 = *(void **)(*(void *)(a1 + 32) + 64);
  id v14 = [v8 uuid];
  [v13 setObject:v11 forKeyedSubscript:v14];

  os_unfair_lock_unlock(v12);
  id v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = *(id *)(a1 + 32);
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    int v26 = 138543618;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    __int16 v29 = v11;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@RG Period Ended : %@", (uint8_t *)&v26, 0x16u);
  }
  uint64_t v19 = *(void **)(a1 + 32);
  id v20 = [(HMDUserPresence *)v11 deviceWhichUpdatedUserPresence];
  __int16 v21 = +[HMDUserPresenceUpdateReason reasonWithValue:2];
  [v19 _evaluatePresence:v20 newUserPresence:v11 presenceStatusUpdateReason:v21];

LABEL_11:
}

- (void)_handleRestrictedGuestAllowedPeriodStartedNotification:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__HMDHomePresenceMonitor__handleRestrictedGuestAllowedPeriodStartedNotification___block_invoke;
  v3[3] = &unk_264A175E0;
  v3[4] = self;
  [(HMDHomePresenceMonitor *)self _handleAllowedPeriodNotification:a3 withCompletionHandler:v3];
}

void __81__HMDHomePresenceMonitor__handleRestrictedGuestAllowedPeriodStartedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 rawPresenceRegionStatus];
    uint64_t v6 = [v5 value];

    if (v6 == 1)
    {
      uint64_t v7 = [v4 user];
      id v8 = [HMDUserPresence alloc];
      id v9 = [v4 presenceRegionStatus];
      uint64_t v10 = [(HMDUserPresence *)v8 initWithUser:v7 presenceRegionStatus:v9];

      id v11 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
      os_unfair_lock_lock_with_options();
      id v12 = *(void **)(*(void *)(a1 + 32) + 64);
      id v13 = [v7 uuid];
      [v12 setObject:v10 forKeyedSubscript:v13];

      os_unfair_lock_unlock(v11);
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = *(id *)(a1 + 32);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        uint64_t v18 = [(HMDUserPresence *)v10 shortDescription];
        int v26 = 138543618;
        uint64_t v27 = v17;
        __int16 v28 = 2112;
        __int16 v29 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@RG Period Started : %@", (uint8_t *)&v26, 0x16u);
      }
      uint64_t v19 = *(void **)(a1 + 32);
      id v20 = [(HMDUserPresence *)v10 deviceWhichUpdatedUserPresence];
      __int16 v21 = +[HMDUserPresenceUpdateReason reasonWithValue:2];
      [v19 _evaluatePresence:v20 newUserPresence:v10 presenceStatusUpdateReason:v21];
    }
    else
    {
      char v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = *(id *)(a1 + 32);
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        __int16 v25 = HMFGetLogIdentifier();
        int v26 = 138543362;
        uint64_t v27 = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Not simulating user atHome presence as RG is not atHome", (uint8_t *)&v26, 0xCu);
      }
    }
  }
}

- (HMDHomePresenceUpdate)homePresenceUpdate
{
  id v3 = [HMDHomePresenceUpdate alloc];
  id v4 = [(HMDHomePresenceMonitor *)self currentHomePresence];
  id v5 = [(HMDHomePresenceUpdate *)v3 initWithHomePresence:v4 userPresence:0 update:0 causingDevice:0];

  return v5;
}

- (void)_evaluatePresence:(id)a3 newUserPresence:(id)a4 presenceStatusUpdateReason:(id)a5
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDHomePresenceBase *)self home];
  [(HMDHomePresenceMonitor *)self _auditPresenceMap];
  uint64_t v12 = [(HMDHomePresenceMonitor *)self presenceMap];
  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v61 = v16;
    __int16 v62 = 2112;
    v63 = (HMDHomePresenceUpdate *)v12;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Evaluating home presence with current presence map: %@", buf, 0x16u);
  }
  id v17 = [[HMDHomePresence alloc] initWithHome:v11 userPresenceMap:v12 lastUpdateByDevice:v8];
  uint64_t v18 = [(HMDHomePresenceMonitor *)v14 currentHomePresence];

  v56 = (void *)v12;
  if (v18)
  {
    uint64_t v19 = [(HMDHomePresenceMonitor *)v14 currentHomePresence];
    char v54 = HMFEqualObjects();
  }
  else
  {
    char v54 = 1;
  }
  id v20 = (void *)MEMORY[0x230FBD990]();
  __int16 v21 = v14;
  char v22 = HMFGetOSLogHandle();
  id v57 = v11;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    [(HMDHomePresenceMonitor *)v21 currentHomePresence];
    id v24 = v52 = v20;
    __int16 v25 = [v24 shortDescription];
    [(HMDHomePresence *)v17 shortDescription];
    int v26 = v17;
    id v27 = v10;
    v29 = id v28 = v9;
    HMFBooleanToString();
    uint64_t v30 = v53 = v8;
    *(_DWORD *)buf = 138544130;
    id v61 = v23;
    __int16 v62 = 2112;
    v63 = v25;
    __int16 v64 = 2112;
    id v65 = v29;
    __int16 v66 = 2112;
    v67 = v30;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating home presence from %@ to %@, Equal: %@", buf, 0x2Au);

    id v9 = v28;
    id v10 = v27;
    id v17 = v26;

    id v11 = v57;
    id v20 = v52;

    id v8 = v53;
  }

  id v31 = (void *)MEMORY[0x230FBD990]([(HMDHomePresenceMonitor *)v21 setCurrentHomePresence:v17]);
  uint64_t v32 = v21;
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v61 = v34;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Current home presence evaluated, sending notification", buf, 0xCu);

    id v11 = v57;
  }

  logAndPostNotification(@"HMDHomePresenceEvaluatedNotification", v32, 0);
  v35 = v56;
  if ((v54 & 1) == 0)
  {
    [v11 saveWithReason:@"HMDHomePresenceMonitorUpdatedReason" postSyncNotification:0];
    id v55 = v10;
    uint64_t v36 = [v10 value];
    uint64_t v37 = v36 == 2;
    v38 = [v9 user];
    if ([v38 isRestrictedGuest])
    {
      BOOL v39 = v36 == 2;
      v40 = [v9 user];
      id v41 = v17;
      id v42 = v9;
      unsigned int v43 = v39 & ~[v40 isAccessCurrentlyAllowedBySchedule];

      uint64_t v37 = v39 & ~v43;
      id v9 = v42;
      id v17 = v41;
    }
    else
    {
    }
    os_log_type_t v44 = [HMDHomePresenceUpdate alloc];
    v45 = [(HMDHomePresenceMonitor *)v32 currentHomePresence];
    v46 = [(HMDHomePresenceUpdate *)v44 initWithHomePresence:v45 userPresence:v9 update:v37 causingDevice:v8];

    uint64_t v47 = (void *)MEMORY[0x230FBD990]();
    id v48 = v32;
    v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v61 = v50;
      __int16 v62 = 2112;
      v63 = v46;
      _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@Sending home presence update %@", buf, 0x16u);
    }
    v58 = @"HMDHomePresenceUpdateKey";
    id v59 = v46;
    v51 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    logAndPostNotification(@"HMDHomePresenceUpdateNotification", v48, v51);

    id v10 = v55;
    v35 = v56;
    id v11 = v57;
  }
  [(HMDHomePresenceMonitor *)v32 _startAuditTimer];
}

- (void)_saveUserPresenceToWorkingStore:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HMDCoreData sharedInstance];
  id v9 = [(HMDHomePresenceBase *)self home];
  id v10 = [v9 uuid];
  id v11 = [v8 contextWithHomeUUID:v10];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__HMDHomePresenceMonitor__saveUserPresenceToWorkingStore_forUser___block_invoke;
  v15[3] = &unk_264A2E610;
  id v16 = v7;
  id v17 = v11;
  uint64_t v18 = self;
  id v19 = v6;
  id v12 = v6;
  id v13 = v11;
  id v14 = v7;
  [v13 performBlock:v15];
}

void __66__HMDHomePresenceMonitor__saveUserPresenceToWorkingStore_forUser___block_invoke(id *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1[4] uuid];
  id v3 = [a1[5] managedObjectContext];
  id v4 = +[_MKFHome findHomeMemberWithUUID:v2 context:v3];

  if (v4)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1[7], "value"));
    [v4 setPresenceRegionStatus:v5];

    id v6 = [MEMORY[0x263EFF910] date];
    [v4 setPresenceUpdateTimeStamp:v6];

    id v7 = [v4 lastLocalActivityTimeStamp];
    if ([a1[7] value] == 2)
    {
      [v4 setLastLocalActivityTimeStamp:0];

      id v7 = 0;
    }
    id v8 = a1[5];
    id v29 = 0;
    char v9 = [v8 save:&v29];
    id v10 = v29;
    if (v9)
    {
      id v11 = a1[6];
      id v12 = [a1[4] uuid];
      [v11 _setLocalActivityTimestampForUserUUID:v12 timestamp:v7];

      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = a1[6];
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        id v17 = a1[7];
        id v18 = a1[4];
        *(_DWORD *)buf = 138544130;
        id v31 = v16;
        __int16 v32 = 2112;
        v33 = v17;
        __int16 v34 = 2112;
        id v35 = v18;
        __int16 v36 = 2112;
        id v37 = v7;
        id v19 = "%{public}@Successfully updated home member's presence to [%@] for user [%@] in the working store. [lastAccessTime: %@]";
        id v20 = v15;
        os_log_type_t v21 = OS_LOG_TYPE_INFO;
LABEL_12:
        _os_log_impl(&dword_22F52A000, v20, v21, v19, buf, 0x2Au);
      }
    }
    else
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = a1[6];
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        id v27 = a1[4];
        id v28 = a1[7];
        *(_DWORD *)buf = 138544130;
        id v31 = v16;
        __int16 v32 = 2112;
        v33 = v27;
        __int16 v34 = 2112;
        id v35 = v28;
        __int16 v36 = 2112;
        id v37 = v10;
        id v19 = "%{public}@Unable to save the home member presence for user : %@ / %@, error: %@";
        id v20 = v15;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
  char v22 = (void *)MEMORY[0x230FBD990]();
  id v23 = a1[6];
  id v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    __int16 v25 = HMFGetLogIdentifier();
    int v26 = [a1[4] uuid];
    *(_DWORD *)buf = 138543618;
    id v31 = v25;
    __int16 v32 = 2112;
    v33 = v26;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home member with model id : %@", buf, 0x16u);
  }
LABEL_14:
}

- (void)_updateUserPresence:(id)a3 presenceAuth:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 presenceAuthStatus];
  char v12 = HMFEqualObjects();

  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v32 = v17;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Auth and compute status are not changing for user %@", buf, 0x16u);
    }
    id v18 = _Block_copy(v10);
    id v19 = v18;
    if (v18) {
      (*((void (**)(void *))v18 + 2))(v18);
    }
  }
  else
  {
    if (v16)
    {
      id v20 = HMFGetLogIdentifier();
      os_log_type_t v21 = [v8 presenceAuthStatus];
      *(_DWORD *)buf = 138544130;
      __int16 v32 = v20;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2112;
      id v36 = v9;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Presence auth status is changing from %@ to %@ for user %@", buf, 0x2Au);
    }
    id v19 = [(HMDHomePresenceBase *)v14 home];
    if ([v8 isOwner])
    {
      [v19 setPresenceAuthStatus:v9];
      char v22 = [v19 currentUser];
      [v22 setPresenceAuthStatus:v9];

      id v23 = _Block_copy(v10);
      id v24 = v23;
      if (v23) {
        (*((void (**)(void *))v23 + 2))(v23);
      }
    }
    else
    {
      id v24 = (void *)[v8 newModelWithChangeType:2];
      __int16 v25 = [v9 number];
      [v24 setPresenceAuthorizationStatus:v25];

      int v26 = [v19 backingStore];
      id v27 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      id v28 = [v26 transaction:@"kRemoteUpdateUserPresenceNotificationKey" options:v27];

      [v28 add:v24];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __70__HMDHomePresenceMonitor__updateUserPresence_presenceAuth_completion___block_invoke;
      v29[3] = &unk_264A2E288;
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
    uint64_t v2 = v1;
    v1[2]();
    v1 = v2;
  }
}

- (void)handleUserHomePresencePayload:(id)a3 device:(id)a4 user:(id)a5 completion:(id)a6
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v75 = a3;
  id v74 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  char v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v86 = v15;
    __int16 v87 = 2112;
    id v88 = v75;
    __int16 v89 = 2112;
    id v90 = v74;
    __int16 v91 = 2112;
    double v92 = *(double *)&v10;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received user presence: [%@] from device [%@] for user [%@]", buf, 0x2Au);
  }
  if (v10)
  {
    BOOL v16 = [(HMDHomePresenceBase *)v13 home];
    if (([v16 isCurrentDeviceConfirmedPrimaryResident] & 1) == 0)
    {
      id v52 = (void *)MEMORY[0x230FBD990]();
      id v53 = v13;
      char v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        id v55 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v86 = v55;
        _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@This device is not the current resident, cannot process the presence update, responding with error", buf, 0xCu);
      }
      id v17 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2708];
      if (v11) {
        v11[2](v11, v17);
      }
      goto LABEL_36;
    }
    id v17 = [MEMORY[0x263F0E8C8] authWithDict:v75];
    if (!v17)
    {
      id v18 = (void *)MEMORY[0x263F0E8C8];
      id v19 = objc_msgSend(v75, "hmf_numberForKey:", @"kUserPresenceAuthStatusKey");
      id v17 = [v18 authWithNumber:v19];
    }
    long long v72 = +[HMDUserPresenceRegion regionWithDict:v75];
    v71 = +[HMDUserPresenceUpdateReason reasonWithDict:v75];
    id v20 = (void *)MEMORY[0x230FBD990]();
    os_log_type_t v21 = v13;
    char v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      id v24 = [v10 userID];
      *(_DWORD *)buf = 138544386;
      v86 = v23;
      __int16 v87 = 2114;
      id v88 = v17;
      __int16 v89 = 2114;
      id v90 = v72;
      __int16 v91 = 2114;
      double v92 = *(double *)&v71;
      __int16 v93 = 2112;
      v94 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Received user presence message with auth: %{public}@, region: %{public}@, reason: %{public}@, user: %@", buf, 0x34u);
    }
    __int16 v25 = [(HMDHomePresenceMonitor *)v21 presenceMap];
    int v26 = [v10 uuid];
    long long v73 = [v25 objectForKeyedSubscript:v26];

    if (!v73)
    {
      v56 = (void *)MEMORY[0x230FBD990]();
      id v57 = v21;
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        id v59 = HMFGetLogIdentifier();
        id v60 = [v10 uuid];
        *(_DWORD *)buf = 138543618;
        v86 = v59;
        __int16 v87 = 2112;
        id v88 = v60;
        _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Could not find the user with UUID %@", buf, 0x16u);
      }
      __int16 v37 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      if (v11) {
        v11[2](v11, v37);
      }
      goto LABEL_35;
    }
    id v27 = [v73 user];
    id v28 = [v27 presenceAuthStatus];
    if (HMFEqualObjects())
    {
      id v29 = [v73 presenceRegionStatus];
      int v30 = HMFEqualObjects();

      if (v30)
      {
        id v31 = (void *)MEMORY[0x230FBD990]([v73 setPresenceRegionStatus:v72]);
        __int16 v32 = v21;
        __int16 v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          id v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v86 = v34;
          __int16 v87 = 2112;
          id v88 = v73;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@User presence auth or region status for %@ are not changing, updated presence timestamp", buf, 0x16u);
        }
        __int16 v35 = [MEMORY[0x263F42608] sharedPreferences];
        id v36 = [v35 preferenceForKey:@"kPresenceTimestampThresholdMinutes"];
        __int16 v37 = [v36 numberValue];

        LODWORD(v36) = [(HMDUserPresence *)v37 intValue];
        id v38 = [v73 updateTimestamp];
        uint64_t v39 = [MEMORY[0x263EFF910] date];
        [v38 timeIntervalSinceDate:v39];
        double v40 = (double)(unint64_t)(60 * (int)v36);
        double v42 = fabs(v41);
        BOOL v43 = vabdd_f64(v42, v40) < 2.22044605e-16 || v42 < v40;

        if (v43)
        {
          os_log_type_t v44 = (void *)MEMORY[0x230FBD990]();
          v45 = v32;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v69 = HMFGetLogIdentifier();
            uint64_t v70 = [v73 updateTimestamp];
            uint64_t v68 = objc_msgSend(v70, "hmf_localTimeDescription");
            uint64_t v47 = [MEMORY[0x263EFF910] date];
            v67 = objc_msgSend(v47, "hmf_localTimeDescription");
            *(_DWORD *)buf = 138544130;
            v86 = v69;
            __int16 v87 = 2112;
            id v88 = v68;
            __int16 v89 = 2112;
            id v90 = v67;
            __int16 v91 = 2048;
            double v92 = v40;
            _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Not updating timestamp from %@ to %@ as it is within %f.", buf, 0x2Au);
          }
        }
        else
        {
          __int16 v66 = [v73 user];
          [(HMDHomePresenceMonitor *)v32 _saveUserPresenceToWorkingStore:v72 forUser:v66];
        }
        if (v11) {
          v11[2](v11, 0);
        }
        goto LABEL_35;
      }
    }
    else
    {
    }
    id v61 = [HMDUserPresence alloc];
    __int16 v62 = [v73 user];
    v63 = [MEMORY[0x263EFF910] now];
    __int16 v64 = [(HMDUserPresence *)v61 initWithUser:v62 presenceRegionStatus:v72 timeStamp:v63 presenceUpdateReason:v71 device:v74];

    objc_initWeak((id *)buf, v21);
    id v65 = [(HMDUserPresence *)v64 user];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __79__HMDHomePresenceMonitor_handleUserHomePresencePayload_device_user_completion___block_invoke;
    v76[3] = &unk_264A175B8;
    objc_copyWeak(&v84, (id *)buf);
    id v77 = v73;
    __int16 v37 = v64;
    __int16 v78 = v37;
    id v79 = v10;
    id v80 = v72;
    v83 = v11;
    id v81 = v74;
    id v82 = v71;
    [(HMDHomePresenceMonitor *)v21 _updateUserPresence:v65 presenceAuth:v17 completion:v76];

    objc_destroyWeak(&v84);
    objc_destroyWeak((id *)buf);
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  id v48 = (void *)MEMORY[0x230FBD990]();
  v49 = v13;
  v50 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    v51 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v86 = v51;
    _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@Remote user is nil", buf, 0xCu);
  }
  BOOL v16 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
  if (v11) {
    v11[2](v11, v16);
  }
LABEL_37:
}

void __79__HMDHomePresenceMonitor_handleUserHomePresencePayload_device_user_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = (os_unfair_lock_s *)WeakRetained;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      id v7 = [*(id *)(a1 + 32) user];
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v16 = 138544130;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Updated presence for user %@ from %@ to %@", (uint8_t *)&v16, 0x2Au);
    }
    os_unfair_lock_lock_with_options();
    id v10 = *(void **)&v4[16]._os_unfair_lock_opaque;
    uint64_t v11 = *(void *)(a1 + 40);
    char v12 = [*(id *)(a1 + 48) uuid];
    [v10 setObject:v11 forKeyedSubscript:v12];

    [*(id *)(a1 + 40) setLastLocalActivityUpdateTimeStampInWorkingStore:0];
    os_unfair_lock_unlock(v4 + 14);
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = [*(id *)(a1 + 40) user];
    [(os_unfair_lock_s *)v4 _saveUserPresenceToWorkingStore:v13 forUser:v14];

    uint64_t v15 = *(void *)(a1 + 80);
    if (v15) {
      (*(void (**)(uint64_t, void))(v15 + 16))(v15, 0);
    }
    [(os_unfair_lock_s *)v4 _evaluatePresence:*(void *)(a1 + 64) newUserPresence:*(void *)(a1 + 40) presenceStatusUpdateReason:*(void *)(a1 + 72)];
  }
}

- (void)handleUserPresenceUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomePresenceBase *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMDHomePresenceMonitor_handleUserPresenceUpdateNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__HMDHomePresenceMonitor_handleUserPresenceUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) userInfo];
    int v13 = 138543618;
    id v14 = v5;
    __int16 v15 = 2112;
    int v16 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Received presence update notification with note %@", (uint8_t *)&v13, 0x16u);
  }
  id v7 = +[HMDAppleAccountManager sharedManager];
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
  id v5 = [(HMDHomePresenceBase *)self home];
  id v6 = [v4 userForHome:v5];

  id v7 = [v4 messagePayload];
  id v8 = [v4 remoteSourceDevice];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__HMDHomePresenceMonitor_handleUserPresenceUpdate___block_invoke;
  v10[3] = &unk_264A2F3E8;
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
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomePresenceMonitor *)self presenceMap];
  id v6 = [v4 uuid];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing user %@ from the presence map", buf, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    presenceMap = v9->_presenceMap;
    int v13 = [v4 uuid];
    [(NSMutableDictionary *)presenceMap removeObjectForKey:v13];

    os_unfair_lock_unlock(&v9->_lock);
    id v14 = [NSString stringWithFormat:@"Removed user : %@", v4];
    [(HMDHomePresenceMonitor *)v9 _reEvaluatePresenceWithReason:v14];
  }
  __int16 v15 = (void *)MEMORY[0x230FBD990]();
  int v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = HMFGetLogIdentifier();
    id v19 = [(HMDHomePresenceMonitor *)v16 presenceMap];
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v18;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    __int16 v25 = v19;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Presence map after removing user : %@, %@", buf, 0x20u);
  }
}

- (void)addNewUser:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding new user %@ to the presence map", (uint8_t *)&v9, 0x16u);
  }
  [(HMDHomePresenceMonitor *)v6 _addUser:v4];
  [(HMDHomePresenceMonitor *)v6 _evaluatePresence:0 newUserPresence:0 presenceStatusUpdateReason:0];
}

- (void)_addUser:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuid];

  if (v5)
  {
    os_unfair_lock_lock_with_options();
    id v6 = [[HMDUserPresence alloc] initWithUser:v4 presenceRegionStatus:0];
    presenceMap = self->_presenceMap;
    id v8 = [v4 uuid];
    [(NSMutableDictionary *)presenceMap setObject:v6 forKeyedSubscript:v8];

    os_unfair_lock_unlock(&self->_lock);
    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = [(HMDHomePresenceMonitor *)v10 presenceMap];
      int v15 = 138543874;
      int v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Presence map after adding new user : %@, %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      int v16 = v14;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@UUID for user %@ is nil, not adding it to the monitor map.", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_removeNonExistingUsers
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HMDHomePresenceBase *)self home];
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
          id v12 = (void *)MEMORY[0x230FBD990]();
          uint64_t v13 = self;
          id v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v15 = HMFGetLogIdentifier();
            int v16 = [v9 user];
            *(_DWORD *)buf = v21;
            id v29 = v15;
            __int16 v30 = 2112;
            id v31 = v16;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing the user %@ from presence map since it isn't part of home anymore", buf, 0x16u);
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
  uint64_t v2 = self;
  uint64_t v32 = *MEMORY[0x263EF8340];
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
          id v14 = (void *)MEMORY[0x230FBD990]();
          int v15 = v2;
          int v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            __int16 v17 = v2;
            uint64_t v18 = v8;
            v20 = __int16 v19 = v4;
            *(_DWORD *)buf = v21;
            id v28 = v20;
            __int16 v29 = 2112;
            __int16 v30 = v10;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Adding home user %@ to the presence map, as it isn't present", buf, 0x16u);

            id v4 = v19;
            uint64_t v8 = v18;
            uint64_t v2 = v17;
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

- (void)_populatePresenceMapFromWorkingStore
{
  id v3 = [(HMDHomePresenceBase *)self home];
  id v4 = +[HMDCoreData sharedInstance];
  uint64_t v5 = [v3 uuid];
  long long v6 = [v4 contextWithHomeUUID:v5];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke;
  v9[3] = &unk_264A2F2F8;
  id v10 = v3;
  char v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = v3;
  [v7 unsafeSynchronousBlock:v9];
}

void __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1[4] uuid];
  id v3 = +[HMCContext findHomeWithModelID:v2];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v5 = [v3 users];
    long long v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));

    id v7 = [v3 homeMembers];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke_76;
    v21[3] = &unk_264A17590;
    id v8 = a1[4];
    id v9 = a1[5];
    id v22 = v8;
    id v23 = v9;
    id v10 = v6;
    id v24 = v10;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);

    char v11 = (os_unfair_lock_s *)((char *)a1[5] + 56);
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)a1[5] + 8, v6);
    os_unfair_lock_unlock(v11);
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1[5];
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v15;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Loaded presence map from working store: %@", buf, 0x16u);
    }
    [a1[5] _preparePresenceMap];
    [a1[6] reset];
  }
  else
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1[5];
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      __int16 v20 = [a1[4] uuid];
      *(_DWORD *)buf = 138543618;
      long long v26 = v19;
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home with model id : %@", buf, 0x16u);
    }
  }
}

void __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) users];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke_2;
  v20[3] = &unk_264A2DB60;
  id v5 = v3;
  id v21 = v5;
  long long v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v20);

  if (v6)
  {
    id v7 = [HMDUserPresence alloc];
    id v8 = [v5 presenceRegionStatus];
    id v9 = +[HMDUserPresenceRegion regionWithValue:](HMDUserPresenceRegion, "regionWithValue:", (int)[v8 intValue]);
    id v10 = [v5 presenceUpdateTimeStamp];
    char v11 = [(HMDUserPresence *)v7 initWithUser:v6 presenceRegionStatus:v9 timeStamp:v10];

    id v12 = [v5 lastLocalActivityTimeStamp];
    [(HMDUserPresence *)v11 setLastLocalActivityTimeStamp:v12];

    id v13 = [v5 lastLocalActivityTimeStamp];
    [(HMDUserPresence *)v11 setLastLocalActivityUpdateTimeStampInWorkingStore:v13];

    id v14 = *(void **)(a1 + 48);
    int v15 = [v6 uuid];
    [v14 setObject:v11 forKeyedSubscript:v15];
  }
  else
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home member [%@] which exist in working store but not in HMDHome.users", buf, 0x16u);
    }
  }
}

uint64_t __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 modelID];
  id v5 = [v3 uuid];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (void)_handlePrimaryResidentChangedNotification:(id)a3
{
  id v4 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDHomePresenceMonitor__handlePrimaryResidentChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __68__HMDHomePresenceMonitor__handlePrimaryResidentChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Loading presence map from working store due to Primary Resident change.", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _populatePresenceMapFromWorkingStore];
  return [*(id *)(a1 + 32) _reEvaluatePresenceWithReason:@"Primary resident changed"];
}

- (void)_handlePrivilegeUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kUserUUIDKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [(HMDHomePresenceBase *)self workQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__HMDHomePresenceMonitor__handlePrivilegeUpdate___block_invoke;
    v14[3] = &unk_264A2F820;
    v14[4] = self;
    v14[5] = v8;
    dispatch_async(v9, v14);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    char v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@User privilege changed but the userInfo does not have the required key inside it.", buf, 0xCu);
    }
  }
}

void __49__HMDHomePresenceMonitor__handlePrivilegeUpdate___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) home];
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v16 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@User privilege changed: Updating presence map", buf, 0xCu);
  }
  int v7 = [v2 users];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__HMDHomePresenceMonitor__handlePrivilegeUpdate___block_invoke_69;
  v14[3] = &unk_264A2DB60;
  v14[4] = *(void *)(a1 + 40);
  id v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v14);

  if (v8)
  {
    if ([v8 privilege] != 2)
    {
      [*(id *)(a1 + 32) _addUser:v8];
      [*(id *)(a1 + 32) _evaluatePresence:0 newUserPresence:0 presenceStatusUpdateReason:0];
      goto LABEL_12;
    }
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Pending user cannot be added to the presence map until they are confirmed by accepting the invitation: %@", buf, 0x16u);
LABEL_9:
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v2 users];
      *(_DWORD *)buf = 138543618;
      int v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to add the user in the presence map as we could not find it inside the users list in home: %@", buf, 0x16u);

      goto LABEL_9;
    }
  }

LABEL_12:
}

uint64_t __49__HMDHomePresenceMonitor__handlePrivilegeUpdate___block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_startAuditTimer
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomePresenceMonitor *)self timerID];
  if (v3)
  {
    uint64_t v4 = +[HMDBackgroundTaskManager sharedManager];
    [v4 cancelTaskWithIdentifier:v3 onObserver:self];

    id v5 = [(HMDHomePresenceBase *)self home];
    uint64_t v6 = [v5 primaryResident];
    int v7 = [v6 device];

    if ([v7 isCurrentDevice])
    {
      id v8 = [MEMORY[0x263EFF910] now];
      uint64_t v9 = objc_msgSend(v8, "hmf_dateComponents");

      uint64_t v10 = [v9 minute];
      [v9 setMinute:presenceMonitorAuditInMinutes + v10];
      char v11 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v12 = [v11 dateFromComponents:v9];

      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = HMFGetLogIdentifier();
        __int16 v17 = objc_msgSend(v12, "hmf_localTimeDescription");
        *(_DWORD *)buf = 138543874;
        __int16 v35 = v16;
        __int16 v36 = 2112;
        __int16 v37 = v3;
        __int16 v38 = 2112;
        id v39 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting the audit timer (%@) to fire at %@", buf, 0x20u);
      }
      uint64_t v18 = +[HMDBackgroundTaskManager sharedManager];
      id v33 = 0;
      char v19 = [v18 scheduleTaskWithIdentifier:v3 fireDate:v12 onObserver:v14 selector:sel_handleTimerFiredNotification_ error:&v33];
      id v20 = v33;

      if ((v19 & 1) == 0)
      {
        id v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = v14;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          __int16 v35 = v24;
          __int16 v36 = 2112;
          __int16 v37 = v3;
          __int16 v38 = 2112;
          id v39 = v20;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x230FBD990]();
      __int16 v30 = self;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v35 = v32;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@This is not the resident device, not starting the audit timer", buf, 0xCu);
      }
    }
  }
  else
  {
    id v25 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = self;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to start audit timer with nil timer id", buf, 0xCu);
    }
  }
}

- (void)_auditPresenceMap
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = [(HMDHomePresenceMonitor *)v4 presenceMap];
    *(_DWORD *)buf = 138543618;
    id v25 = v6;
    __int16 v26 = 2112;
    __int16 v27 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Auditing the presence map %@", buf, 0x16u);
  }
  [(HMDHomePresenceMonitor *)v4 _removeNonExistingUsers];
  id v8 = [(HMDHomePresenceMonitor *)v4 presenceMap];
  uint64_t v9 = [(HMDHomePresenceBase *)v4 home];
  uint64_t v10 = [v9 primaryResident];
  char v11 = [v10 device];

  int v12 = [v11 isCurrentDevice];
  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = v4;
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
      id v25 = v17;
      __int16 v26 = 2112;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@This device is the primary resident: [%@ / %@]", buf, 0x20u);
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke;
    v23[3] = &unk_264A17548;
    v23[4] = v14;
    id v20 = v23;
  }
  else
  {
    if (v16)
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [v11 identifier];
      *(_DWORD *)buf = 138543618;
      id v25 = v21;
      __int16 v26 = 2112;
      __int16 v27 = v22;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@This device is not the primary resident : %@", buf, 0x16u);
    }
    id v20 = &__block_literal_global_62;
  }
  [v8 enumerateKeysAndObjectsUsingBlock:v20];
}

void __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 user];
  id v8 = [v7 presenceAuthStatus];
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
        BOOL v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = *(id *)(a1 + 32);
        uint64_t v18 = HMFGetOSLogHandle();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v14 <= v15)
        {
          if (v19)
          {
            id v21 = HMFGetLogIdentifier();
            int v22 = 138544130;
            id v23 = v21;
            __int16 v24 = 2112;
            id v25 = v6;
            __int16 v26 = 2048;
            double v27 = v14;
            __int16 v28 = 2048;
            double v29 = v15;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ update is still valid as the time since last update %lf is less than allowed %lf", (uint8_t *)&v22, 0x2Au);
          }
        }
        else
        {
          if (v19)
          {
            id v20 = HMFGetLogIdentifier();
            int v22 = 138544130;
            id v23 = v20;
            __int16 v24 = 2112;
            id v25 = v6;
            __int16 v26 = 2048;
            double v27 = v14;
            __int16 v28 = 2048;
            double v29 = v15;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ update is stale as the time since last update %lf is more than allowed %lf", (uint8_t *)&v22, 0x2Au);
          }
          [v6 setPresenceRegionStatus:0];
        }
      }
    }
  }
}

uint64_t __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setPresenceRegionStatus:0];
}

- (void)handleTimerFiredNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  objc_msgSend(v4, "hmf_stringForKey:", @"HMD.BGTM.NK");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(HMDHomePresenceMonitor *)self timerID];
  int v6 = HMFEqualObjects();

  if (v6)
  {
    int v7 = [NSString stringWithFormat:@"BTM Timer fired with ID: %@", v8];
    [(HMDHomePresenceMonitor *)self _reEvaluatePresenceWithReason:v7];
  }
}

- (void)_reEvaluatePresenceWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomePresenceBase *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMDHomePresenceMonitor__reEvaluatePresenceWithReason___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__HMDHomePresenceMonitor__reEvaluatePresenceWithReason___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Re-evaluating presence due to reason: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _evaluatePresence:0 newUserPresence:0 presenceStatusUpdateReason:0];
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
  v19[2] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)HMDHomePresenceMonitor;
  [(HMDHomePresenceBase *)&v18 _registerForMessages];
  id v3 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v3, "setRoles:", objc_msgSend(v3, "roles") | 4);
  id v4 = (void *)[v3 copy];
  id v5 = [(HMDHomePresenceBase *)self home];
  uint64_t v6 = [(HMDHomePresenceBase *)self msgDispatcher];
  v19[0] = v4;
  int v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:5 remoteAccessRequired:0];
  v19[1] = v7;
  int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  [v6 registerForMessage:@"kRemoteUpdateUserPresenceNotificationKey" receiver:self policies:v8 selector:sel_handleUserPresenceUpdate_];

  uint64_t v9 = [v5 presenceFeeder];
  if (v9)
  {
    __int16 v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:self selector:sel_handleUserPresenceUpdateNotification_ name:@"HMDUserPresenceUpdateLocalNotification" object:v9];
  }
  uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = [v5 residentDeviceManager];
  [v11 addObserver:self selector:sel__handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v12];

  double v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel__handlePrivilegeUpdate_ name:@"HMDUserPrivilegeDidChangeNotification" object:0];

  double v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:self selector:sel__handleRestrictedGuestAllowedPeriodStartedNotification_ name:@"HMDUserRestrictedGuestScheduleStartedNotification" object:0];

  double v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel__handleRestrictedGuestAllowedPeriodEndedNotification_ name:@"HMDUserRestrictedGuestScheduleEndedNotification" object:0];

  BOOL v16 = [MEMORY[0x263F08A00] defaultCenter];
  [v16 addObserver:self selector:sel_handleCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:0];

  id v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 addObserver:self selector:sel_handleMatterLockStateChangedNotification_ name:@"HMDAccessoryMatterLockStateChangedNotification" object:0];
}

- (void)configure:(id)a3 messageDispatcher:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HMDHomePresenceMonitor;
  [(HMDHomePresenceBase *)&v10 configure:a3 messageDispatcher:a4];
  id v5 = NSString;
  uint64_t v6 = [(HMDHomePresenceBase *)self presenceMonitorMessageTargetUUID];
  int v7 = [v6 UUIDString];
  int v8 = [v5 stringWithFormat:@"presence.monitor/%@", v7];
  timerID = self->_timerID;
  self->_timerID = v8;

  [(HMDHomePresenceMonitor *)self _populatePresenceMapFromWorkingStore];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDHomePresenceMonitor;
  [(HMDHomePresenceMonitor *)&v4 dealloc];
}

- (HMDHomePresenceMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDHomePresenceMonitor;
  uint64_t v2 = [(HMDHomePresenceMonitor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
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

+ (id)interestingServiceTypeToCharacteristicTypesMap
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F0D798];
  uint64_t v5 = *MEMORY[0x263F0C510];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v5 count:1];
  v7[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_18173 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_18173, &__block_literal_global_18174);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_18175;
  return v2;
}

void __37__HMDHomePresenceMonitor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_18175;
  logCategory__hmf_once_v1_18175 = v0;
}

@end