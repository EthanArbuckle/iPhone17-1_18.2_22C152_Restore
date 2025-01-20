@interface HMDZone
+ (BOOL)supportsSecureCoding;
- (BOOL)_handleSetRoomsTransactionWithRoomUUIDStrings:(id)a3 error:(id *)a4;
- (BOOL)updateZoneWithModel:(id)a3 message:(id)a4 error:(id *)a5;
- (HMDHome)home;
- (HMDZone)initWithCoder:(id)a3;
- (HMDZone)initWithName:(id)a3 uuid:(id)a4 home:(id)a5;
- (HMFMessageDispatcher)msgDispatcher;
- (NSArray)roomUUIDs;
- (NSArray)rooms;
- (NSDictionary)assistantObject;
- (NSString)name;
- (NSString)urlString;
- (NSUUID)spiClientIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_checkForAddValidity:(id)a3;
- (id)_initWithCoder:(id)a3;
- (id)backingStoreObjects:(int64_t)a3;
- (id)dumpState;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (void)_handleAddRoom:(id)a3;
- (void)_handleRemoveRoom:(id)a3;
- (void)_handleRename:(id)a3;
- (void)_registerForMessages;
- (void)addRoomIfNotPresent:(id)a3;
- (void)configure:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeRoom:(id)a3;
- (void)setHome:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setName:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDZone

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_spiClientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_currentRooms, 0);
  objc_storeStrong((id *)&self->_roomUUIDs, 0);
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)backingStoreObjects:(int64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDZone *)self modelObjectWithChangeType:1];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDZoneModel alloc];
  v6 = [(HMDZone *)self uuid];
  v7 = [(HMDZone *)self home];
  v8 = [v7 uuid];
  v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  v10 = [(HMDZone *)self name];
  [(HMDZoneModel *)v9 setName:v10];

  v11 = [(HMDZone *)self roomUUIDs];
  v12 = (void *)[v11 mutableCopy];
  [(HMDZoneModel *)v9 setRoomUUIDs:v12];

  return v9;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v23 = 0;
    [(HMDZone *)self updateZoneWithModel:v13 message:v10 error:&v23];
    id v14 = v23;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v25 = v18;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = (id)objc_opt_class();
      id v19 = v29;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  }
  v20 = v14;
  v21 = [v10 responseHandler];

  if (v21)
  {
    v22 = [v10 responseHandler];
    ((void (**)(void, void *, void))v22)[2](v22, v20, 0);
  }
}

- (BOOL)updateZoneWithModel:(id)a3 message:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 transactionResult];
  uint64_t v10 = [v8 name];
  if (v10)
  {
    id v11 = (void *)v10;
    v12 = [(HMDZone *)self name];
    id v13 = [v8 name];
    char v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      v15 = [v8 name];
      v16 = objc_msgSend(v15, "hm_truncatedNameString");

      v17 = [(HMDZone *)self home];
      v18 = [(HMDZone *)self name];
      id v19 = (id)[v17 replaceName:v18 withNewName:v16];

      [(HMDZone *)self setName:v16];
      [v9 markChanged];
      [v9 markSaveToAssistant];
    }
  }
  v20 = [v8 roomUUIDs];
  if (v20)
  {
    if (![(HMDZone *)self _handleSetRoomsTransactionWithRoomUUIDStrings:v20 error:a5])
    {
      BOOL v21 = 0;
      goto LABEL_9;
    }
    [v9 markChanged];
    [v9 markSaveToAssistant];
  }
  BOOL v21 = 1;
LABEL_9:

  return v21;
}

- (void)removeRoom:(id)a3
{
  id v6 = a3;
  v4 = [v6 uuid];
  v5 = [v4 UUIDString];

  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_roomUUIDs removeObject:v5];
  [(NSMutableDictionary *)self->_currentRooms setObject:0 forKeyedSubscript:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addRoomIfNotPresent:(id)a3
{
  id v7 = a3;
  v4 = [v7 uuid];
  v5 = [v4 UUIDString];

  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_currentRooms objectForKeyedSubscript:v5];

  if (!v6)
  {
    [(NSMutableDictionary *)self->_currentRooms setObject:v7 forKeyedSubscript:v5];
    [(NSMutableArray *)self->_roomUUIDs addObject:v5];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_handleSetRoomsTransactionWithRoomUUIDStrings:(id)a3 error:(id *)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v46 = self;
  v47 = [(HMDZone *)self home];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v67 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
        v12 = [v47 roomWithUUID:v11];
        if (v12) {
          [v6 setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v67 count:16];
    }
    while (v7);
  }

  id v13 = (void *)[obj mutableCopy];
  lock = &v46->_lock;
  os_unfair_lock_lock_with_options();
  char v14 = [(NSMutableDictionary *)v46->_currentRooms allKeys];
  [v13 removeObjectsInArray:v14];

  v15 = [(NSMutableDictionary *)v46->_currentRooms allKeys];
  v42 = (void *)[v15 mutableCopy];

  v16 = (void *)MEMORY[0x1D9452090]([v42 removeObjectsInArray:obj]);
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = [(NSMutableDictionary *)v46->_currentRooms allKeys];
    name = v46->_name;
    BOOL v21 = [v47 name];
    *(_DWORD *)buf = 138544386;
    id v58 = v18;
    __int16 v59 = 2112;
    v60 = v19;
    __int16 v61 = 2112;
    id v62 = obj;
    __int16 v63 = 2112;
    v64 = name;
    __int16 v65 = 2112;
    v66 = v21;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@About to update the zone from %@ to %@ in zone with name (%@) from home %@", buf, 0x34u);
  }
  v22 = (void *)MEMORY[0x1D9452090]();
  HMFGetOSLogHandle();
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v58 = v24;
    __int16 v59 = 2112;
    v60 = v42;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Removing Rooms: %@", buf, 0x16u);
  }
  v25 = (void *)MEMORY[0x1D9452090]();
  HMFGetOSLogHandle();
  __int16 v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v58 = v27;
    __int16 v59 = 2112;
    v60 = v13;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Adding Rooms: %@", buf, 0x16u);
  }
  uint64_t v28 = [obj mutableCopy];
  roomUUIDs = v46->_roomUUIDs;
  v46->_roomUUIDs = (NSMutableArray *)v28;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v43 = v13;
  uint64_t v30 = [v43 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v49;
    char v32 = 1;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(v43);
        }
        v34 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v35 = objc_msgSend(v6, "objectForKeyedSubscript:", v34, lock);
        if (v35)
        {
          [(NSMutableDictionary *)v46->_currentRooms setObject:v35 forKeyedSubscript:v34];
        }
        else
        {
          v36 = (void *)MEMORY[0x1D9452090]();
          HMFGetOSLogHandle();
          v37 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v38 = (id)objc_claimAutoreleasedReturnValue();
            v39 = [v47 name];
            *(_DWORD *)buf = 138543874;
            id v58 = v38;
            __int16 v59 = 2112;
            v60 = v34;
            __int16 v61 = 2112;
            id v62 = v39;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@_handleSetRoomsZoneTransaction:message: Couldn't find the room with UUID %@ in home %@.", buf, 0x20u);
          }
          if (a4)
          {
            [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
            char v32 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            char v32 = 0;
          }
        }
      }
      uint64_t v30 = [v43 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v30);
  }
  else
  {
    char v32 = 1;
  }

  [(NSMutableDictionary *)v46->_currentRooms removeObjectsForKeys:v42];
  os_unfair_lock_unlock(lock);

  return v32 & 1;
}

- (void)_handleRename:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 stringForKey:@"kZoneName"];
  unint64_t v6 = HMMaxLengthForNaming();
  if ([v5 length] <= v6)
  {
    id v11 = [(HMDZone *)self home];
    v12 = [(HMDZone *)self name];
    id v13 = [v11 replaceName:v12 withNewName:v5];

    if (v13)
    {
      [v4 respondWithError:v13];
    }
    else
    {
      char v14 = [HMDZoneModel alloc];
      v15 = [(HMDZone *)self uuid];
      v16 = [v11 uuid];
      v17 = [(HMDBackingStoreModelObject *)v14 initWithObjectChangeType:2 uuid:v15 parentUUID:v16];

      [(HMDZoneModel *)v17 setName:v5];
      id v18 = [v11 backingStore];
      id v19 = [v4 name];
      v20 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      BOOL v21 = [v18 transaction:v19 options:v20];

      [v21 add:v17];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __25__HMDZone__handleRename___block_invoke;
      v22[3] = &unk_1E6A196E0;
      id v23 = v4;
      id v24 = v5;
      [v21 run:v22];
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
    [v4 respondWithError:v11];
  }
}

void __25__HMDZone__handleRename___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 respondWithError:a2];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    unint64_t v6 = @"kZoneName";
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 respondWithPayload:v5];
  }
}

- (void)_handleRemoveRoom:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kRoomUUID"];
  unint64_t v6 = [(HMDZone *)self home];
  uint64_t v7 = [HMDZoneModel alloc];
  uint64_t v8 = [(HMDZone *)self uuid];
  id v9 = [v6 uuid];
  uint64_t v10 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:2 uuid:v8 parentUUID:v9];

  os_unfair_lock_lock_with_options();
  roomUUIDs = self->_roomUUIDs;
  v12 = [v5 UUIDString];
  LODWORD(roomUUIDs) = [(NSMutableArray *)roomUUIDs containsObject:v12];

  if (roomUUIDs)
  {
    id v13 = self->_roomUUIDs;
    char v14 = [v5 UUIDString];
    [(NSMutableArray *)v13 removeObject:v14];

    v15 = (void *)[(NSMutableArray *)self->_roomUUIDs copy];
    [(HMDZoneModel *)v10 setRoomUUIDs:v15];

    os_unfair_lock_unlock(&self->_lock);
    v16 = [v6 backingStore];
    v17 = [v4 name];
    id v18 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v19 = [v16 transaction:v17 options:v18];

    [v19 add:v10];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __29__HMDZone__handleRemoveRoom___block_invoke;
    v21[3] = &unk_1E6A18BA0;
    v21[4] = self;
    id v22 = v5;
    id v23 = v4;
    [v19 run:v21];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v4 respondWithError:v20];
  }
}

void __29__HMDZone__handleRemoveRoom___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    id v5 = [*(id *)(a1 + 40) UUIDString];
    [v4 addObject:v5];

    os_unfair_lock_unlock(v3);
    [*(id *)(a1 + 48) respondWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

- (id)_checkForAddValidity:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(HMDZone *)self home];
  uint64_t v6 = [v5 roomWithUUID:v4];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = 2;
  if (!v5 || !v6) {
    goto LABEL_9;
  }
  id v9 = objc_msgSend(v5, "roomForEntireHome", 2);
  uint64_t v10 = [v9 uuid];
  char v11 = [v4 isEqual:v10];

  if (v11)
  {
    uint64_t v8 = 24;
LABEL_9:
    id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v8];
    goto LABEL_10;
  }
  v12 = [v7 home];
  id v13 = [v12 uuid];
  char v14 = [v5 uuid];
  int v15 = [v13 isEqual:v14];

  if (!v15)
  {
    uint64_t v8 = 11;
    goto LABEL_9;
  }
  roomUUIDs = self->_roomUUIDs;
  v17 = [v7 uuid];
  id v18 = [v17 UUIDString];
  LOBYTE(roomUUIDs) = [(NSMutableArray *)roomUUIDs containsObject:v18];

  if (roomUUIDs)
  {
    uint64_t v8 = 1;
    goto LABEL_9;
  }
  unint64_t v21 = [(NSMutableArray *)self->_roomUUIDs count];
  if (v21 >= maximumRoomsPerZone)
  {
    id v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      v25 = [v7 name];
      name = self->_name;
      uint64_t v27 = [v5 name];
      int v28 = 138544130;
      id v29 = v24;
      __int16 v30 = 2112;
      uint64_t v31 = v25;
      __int16 v32 = 2112;
      v33 = name;
      __int16 v34 = 2112;
      v35 = v27;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Can't add room %@ to zone %@ in home %@; already at maximum rooms for zone",
        (uint8_t *)&v28,
        0x2Au);
    }
    uint64_t v8 = 49;
    goto LABEL_9;
  }
  id v19 = 0;
LABEL_10:

  return v19;
}

- (void)_handleAddRoom:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kRoomUUID"];
  uint64_t v6 = [(HMDZone *)self home];
  uint64_t v7 = [HMDZoneModel alloc];
  uint64_t v8 = [(HMDZone *)self uuid];
  id v9 = [v6 uuid];
  uint64_t v10 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:2 uuid:v8 parentUUID:v9];

  os_unfair_lock_lock_with_options();
  char v11 = [(HMDZone *)self _checkForAddValidity:v5];
  if (v11)
  {
    os_unfair_lock_unlock(&self->_lock);
    [v4 respondWithError:v11];
  }
  else
  {
    roomUUIDs = self->_roomUUIDs;
    id v13 = [v5 UUIDString];
    [(NSMutableArray *)roomUUIDs addObject:v13];

    char v14 = (void *)[(NSMutableArray *)self->_roomUUIDs copy];
    [(HMDZoneModel *)v10 setRoomUUIDs:v14];

    os_unfair_lock_unlock(&self->_lock);
    int v15 = [v6 backingStore];
    v16 = [v4 name];
    v17 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v18 = [v15 transaction:v16 options:v17];

    [v18 add:v10];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __26__HMDZone__handleAddRoom___block_invoke;
    v19[3] = &unk_1E6A18BA0;
    v19[4] = self;
    id v20 = v5;
    id v21 = v4;
    [v18 run:v19];
  }
}

void __26__HMDZone__handleAddRoom___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    id v5 = [*(id *)(a1 + 40) UUIDString];
    [v4 removeObject:v5];

    os_unfair_lock_unlock(v3);
    [*(id *)(a1 + 48) respondWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

- (void)_registerForMessages
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDZone *)self home];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 administratorHandler];
    id v6 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v23[0] = v6;
    uint64_t v7 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
    v23[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    [v5 registerForMessage:@"kAddRoomRequestKey" receiver:self policies:v8 selector:sel__handleAddRoom_];

    id v9 = [v4 administratorHandler];
    uint64_t v10 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v22[0] = v10;
    char v11 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
    v22[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    [v9 registerForMessage:@"kRemoveRoomRequestKey" receiver:self policies:v12 selector:sel__handleRemoveRoom_];

    id v13 = [v4 administratorHandler];
    char v14 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    int v15 = +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1, v14);
    v21[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    [v13 registerForMessage:@"kRenameZoneRequestKey" receiver:self policies:v16 selector:sel__handleRename_];
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not going to register for messages as home is nil", buf, 0xCu);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = [(HMDZone *)self home];
  [v11 encodeConditionalObject:v5 forKey:@"home"];

  id v6 = [(HMDZone *)self name];
  [v11 encodeObject:v6 forKey:@"zoneName"];

  uint64_t v7 = [(HMDZone *)self uuid];
  uint64_t v8 = [v7 UUIDString];
  [v11 encodeObject:v8 forKey:@"zoneUUID"];

  id v9 = [(HMDZone *)self rooms];
  objc_msgSend(v11, "hm_encodeArrayOfConditionalObjects:forKey:", v9, @"rooms");

  uint64_t v10 = [(HMDZone *)self roomUUIDs];
  [v11 encodeObject:v10 forKey:@"roomUUID"];
}

- (id)_initWithCoder:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneUUID"];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  id v9 = [(HMDZone *)self initWithName:v5 uuid:v7 home:v8];
  if (v9)
  {
    __int16 v34 = v8;
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), @"rooms");
    [v10 setArray:v11];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    char v14 = [v12 setWithArray:v13];
    int v15 = [v4 decodeObjectOfClasses:v14 forKey:@"roomUUID"];

    v33 = v10;
    if ([v15 count])
    {
      [(HMDZone *)v9 _handleSetRoomsTransactionWithRoomUUIDStrings:v15 error:0];
    }
    else
    {
      id v29 = v15;
      __int16 v30 = v7;
      uint64_t v31 = v5;
      id v32 = v4;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v16 = v10;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            currentRooms = v9->_currentRooms;
            id v23 = [v21 uuid];
            id v24 = [v23 UUIDString];
            [(NSMutableDictionary *)currentRooms setObject:v21 forKeyedSubscript:v24];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v18);
      }

      v25 = [(NSMutableDictionary *)v9->_currentRooms allKeys];
      uint64_t v26 = [v25 mutableCopy];
      roomUUIDs = v9->_roomUUIDs;
      v9->_roomUUIDs = (NSMutableArray *)v26;

      id v5 = v31;
      id v4 = v32;
      uint64_t v7 = v30;
      int v15 = v29;
    }

    uint64_t v8 = v34;
  }

  return v9;
}

- (HMDZone)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = (HMDZone *)[(HMDZone *)self _initWithCoder:v4];

  return v6;
}

- (id)dumpState
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = NSString;
  id v5 = [(HMDZone *)self name];
  id v6 = [(HMDZone *)self uuid];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [(HMDZone *)self urlString];
  id v9 = [v4 stringWithFormat:@"name: %@  uuid: %@, assistantIdentifier: %@", v5, v7, v8];

  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F64EA0]];
  uint64_t v10 = [(HMDZone *)self rooms];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E4F1CA48];
    id v13 = [(HMDZone *)self rooms];
    char v14 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v15 = [(HMDZone *)self rooms];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dumpState];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F64E70]];
  }

  return v3;
}

- (NSArray)rooms
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_currentRooms allValues];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)roomUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_roomUUIDs copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setName:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = objc_msgSend(v7, "hm_truncatedNameString");
  id v5 = (NSString *)[v4 copy];
  name = self->_name;
  self->_name = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)configure:(id)a3 queue:(id)a4
{
  id v6 = a4;
  [(HMDZone *)self setMsgDispatcher:a3];
  [(HMDZone *)self setWorkQueue:v6];

  [(HMDZone *)self _registerForMessages];
}

- (void)dealloc
{
  v3 = [(HMDZone *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [(HMDZone *)self home];
  id v5 = [v4 administratorHandler];
  [v5 deregisterReceiver:self];

  v6.receiver = self;
  v6.super_class = (Class)HMDZone;
  [(HMDZone *)&v6 dealloc];
}

- (HMDZone)initWithName:(id)a3 uuid:(id)a4 home:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HMDZone;
  uint64_t v11 = [(HMDZone *)&v29 init];
  if (v11)
  {
    v12 = objc_msgSend(v8, "hm_truncatedNameString");
    uint64_t v13 = [v12 copy];
    name = v11->_name;
    v11->_name = (NSString *)v13;

    if (v9)
    {
      uint64_t v15 = [v9 copy];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    }
    uint64_t v16 = (void *)v15;
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v15);
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v17;

    uint64_t v19 = spiClientIdentifierForUUID(v11->_uuid);
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v19);
    spiClientIdentifier = v11->_spiClientIdentifier;
    v11->_spiClientIdentifier = (NSUUID *)v20;

    objc_storeWeak((id *)&v11->_home, v10);
    uint64_t v22 = [v10 msgDispatcher];
    msgDispatcher = v11->_msgDispatcher;
    v11->_msgDispatcher = (HMFMessageDispatcher *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    currentRooms = v11->_currentRooms;
    v11->_currentRooms = (NSMutableDictionary *)v24;

    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
    roomUUIDs = v11->_roomUUIDs;
    v11->_roomUUIDs = (NSMutableArray *)v26;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)assistantObject
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDZone *)self home];
  id v4 = [(HMDZone *)self name];
  id v5 = v4;
  if (v4 && v3)
  {
    objc_super v6 = [v3 name];

    if (v6)
    {
      v20[0] = *MEMORY[0x1E4F96FF0];
      id v7 = [(HMDZone *)self name];
      v20[1] = v7;
      v19[2] = @"objectIdentifier";
      id v8 = [(HMDZone *)self urlString];
      v20[2] = v8;
      v19[3] = @"objectHome";
      id v9 = [v3 name];
      v20[3] = v9;
      v19[4] = @"objectHomeIdentifier";
      id v10 = [v3 urlString];
      void v19[5] = @"objectReference";
      v20[4] = v10;
      v20[5] = self;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];

      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDZone *)self name];
    uint64_t v16 = [(HMDZone *)self uuid];
    uint64_t v17 = [v16 UUIDString];
    *(_DWORD *)buf = 138544130;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    int v28 = v3;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because attribute(s) is nil: self %@/%@  self.home %@", buf, 0x2Au);
  }
  uint64_t v11 = 0;
LABEL_9:

  return (NSDictionary *)v11;
}

- (NSString)urlString
{
  v2 = [(HMDZone *)self uuid];
  v3 = hm_assistantIdentifier();

  return (NSString *)v3;
}

@end