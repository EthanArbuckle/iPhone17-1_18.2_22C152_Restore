@interface HMDWatchSyncState
+ (BOOL)isNewBetter:(unint64_t)a3 present:(unint64_t)a4;
- (BOOL)removeSync;
- (HMDPairedSync)pairedSync;
- (HMDWatchSync)currentSync;
- (HMDWatchSyncState)initWithDeviceId:(id)a3 pairedSync:(id)a4;
- (NSString)deviceId;
- (NSString)identifier;
- (id)description;
- (void)addNewSync:(id)a3;
- (void)dealloc;
@end

@implementation HMDWatchSyncState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSync, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_syncs, 0);
}

- (HMDPairedSync)pairedSync
{
  return self->_pairedSync;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDWatchSyncState *)self identifier];
  v5 = [v3 stringWithFormat:@"<%@, %@>", v4, self->_syncs];

  return v5;
}

- (void)dealloc
{
  v3 = [(HMDWatchSyncState *)self pairedSync];

  if (v3)
  {
    uint64_t v4 = [(NSMutableArray *)self->_syncs count];
    if (v4)
    {
      uint64_t v5 = v4;
      do
      {
        [(HMDWatchSyncState *)self removeSync];
        --v5;
      }
      while (v5);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)HMDWatchSyncState;
  [(HMDWatchSyncState *)&v6 dealloc];
}

- (BOOL)removeSync
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_syncs count])
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      objc_super v6 = [(HMDWatchSyncState *)self identifier];
      v7 = [(NSMutableArray *)self->_syncs objectAtIndex:0];
      int v10 = 138543874;
      v11 = v5;
      __int16 v12 = 2112;
      v13 = v6;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@%@ Removing sync option %@, marking sync complete", (uint8_t *)&v10, 0x20u);
    }
    [(NSMutableArray *)self->_syncs removeObjectAtIndex:0];
    v8 = [(HMDWatchSyncState *)self pairedSync];
    [v8 syncComplete];
  }
  return [(NSMutableArray *)self->_syncs count] != 0;
}

- (void)addNewSync:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v5 = self->_syncs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ((objc_msgSend(v10, "inProgress", (void)v35) & 1) == 0)
        {
          BOOL v17 = +[HMDWatchSyncState isNewBetter:present:](HMDWatchSyncState, "isNewBetter:present:", [v4 syncOption], objc_msgSend(v10, "syncOption"));
          v18 = (void *)MEMORY[0x1D9452090]();
          v19 = HMFGetOSLogHandle();
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
          if (v17)
          {
            if (v20)
            {
              v21 = HMFGetLogIdentifier();
              unint64_t v22 = [v4 syncOption];
              if (v22 > 2) {
                v23 = @"Unknown watch sync option";
              }
              else {
                v23 = off_1E6A07D58[v22];
              }
              v33 = v23;
              *(_DWORD *)buf = 138543874;
              v40 = v21;
              __int16 v41 = 2112;
              v42 = v10;
              __int16 v43 = 2112;
              v44 = v33;
              _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Upgrading %@ with %@", buf, 0x20u);
            }
            objc_msgSend(v10, "setSyncOption:", objc_msgSend(v4, "syncOption"));
          }
          else
          {
            if (v20)
            {
              v24 = HMFGetLogIdentifier();
              unint64_t v25 = [v4 syncOption];
              if (v25 > 2) {
                v26 = @"Unknown watch sync option";
              }
              else {
                v26 = off_1E6A07D58[v25];
              }
              v34 = v26;
              *(_DWORD *)buf = 138543874;
              v40 = v24;
              __int16 v41 = 2112;
              v42 = v10;
              __int16 v43 = 2112;
              v44 = v34;
              _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Not upgrading %@ with %@", buf, 0x20u);
            }
          }
          goto LABEL_31;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v11 = (void *)MEMORY[0x1D9452090]();
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    __int16 v14 = [(HMDWatchSyncState *)self identifier];
    unint64_t v15 = [v4 syncOption];
    if (v15 > 2) {
      uint64_t v16 = @"Unknown watch sync option";
    }
    else {
      uint64_t v16 = off_1E6A07D58[v15];
    }
    v27 = v16;
    *(_DWORD *)buf = 138543874;
    v40 = v13;
    __int16 v41 = 2112;
    v42 = v14;
    __int16 v43 = 2112;
    v44 = v27;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@%@ Adding the sync option: %@", buf, 0x20u);
  }
  [(NSMutableArray *)self->_syncs addObject:v4];
  v28 = [(HMDWatchSyncState *)self pairedSync];

  if (v28)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      v32 = [(HMDWatchSyncState *)self identifier];
      *(_DWORD *)buf = 138543618;
      v40 = v31;
      __int16 v41 = 2112;
      v42 = v32;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@%@ Need to sync to watch", buf, 0x16u);
    }
    uint64_t v5 = [(HMDWatchSyncState *)self pairedSync];
    [(NSMutableArray *)v5 needToSync];
LABEL_31:
  }
}

- (NSString)identifier
{
  v2 = NSString;
  v3 = [(HMDWatchSyncState *)self deviceId];
  id v4 = [v2 stringWithFormat:@"[HMDWatchSyncState: %@]", v3];

  return (NSString *)v4;
}

- (HMDWatchSync)currentSync
{
  v3 = (void *)[(NSMutableArray *)self->_syncs count];
  if (v3)
  {
    v3 = [(NSMutableArray *)self->_syncs objectAtIndex:0];
  }
  return (HMDWatchSync *)v3;
}

- (HMDWatchSyncState)initWithDeviceId:(id)a3 pairedSync:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDWatchSyncState;
  uint64_t v8 = [(HMDWatchSyncState *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    deviceId = v8->_deviceId;
    v8->_deviceId = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    syncs = v8->_syncs;
    v8->_syncs = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v8->_pairedSync, a4);
  }

  return v8;
}

+ (BOOL)isNewBetter:(unint64_t)a3 present:(unint64_t)a4
{
  BOOL v4 = a3 - 1 < 2;
  if (a4) {
    BOOL v4 = 0;
  }
  if (a4 == 2) {
    return a3 == 1;
  }
  else {
    return v4;
  }
}

@end