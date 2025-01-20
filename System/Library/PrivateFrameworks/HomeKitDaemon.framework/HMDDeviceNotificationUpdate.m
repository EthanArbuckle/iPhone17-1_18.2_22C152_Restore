@interface HMDDeviceNotificationUpdate
- (HMDDeviceNotificationUpdate)initWithRequestID:(id)a3;
- (HMDDeviceNotificationUpdate)updateWithCharacteristicUpdates:(id)a3 notificationUpdateID:(id)a4 completion:(id)a5;
- (HMDDeviceNotificationUpdate)updateWithUpdatedActionSetResponses:(id)a3 notificationUpdateID:(id)a4 completion:(id)a5;
- (HMDDeviceNotificationUpdate)updateWithUpdatedMediaPropertiesByMediaResponses:(id)a3 notificationUpdateID:(id)a4 completion:(id)a5;
- (NSArray)actionSetResponses;
- (NSArray)characteristicUpdateTuples;
- (NSArray)completions;
- (NSArray)mediaProperties;
- (NSString)notificationUpdateID;
- (NSString)requestID;
- (void)_updateWithNotificationUpdateID:(id)a3 completion:(id)a4;
@end

@implementation HMDDeviceNotificationUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationUpdateID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_updatedActionSetResponsesByActionSetUUID, 0);
  objc_storeStrong((id *)&self->_updatedMediaPropertiesByMediaProfile, 0);
  objc_storeStrong((id *)&self->_characteristicUpdateTuples, 0);
  objc_storeStrong((id *)&self->_notificationsCompletions, 0);
}

- (NSString)notificationUpdateID
{
  return self->_notificationUpdateID;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSArray)completions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  notificationsCompletions = self->_notificationsCompletions;
  if (!notificationsCompletions) {
    notificationsCompletions = (NSMutableArray *)MEMORY[0x263EFFA68];
  }
  v5 = notificationsCompletions;
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSArray)characteristicUpdateTuples
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [(NSMapTable *)self->_characteristicUpdateTuples objectEnumerator];
  uint64_t v5 = [v4 allObjects];
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x263EFFA68];
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v8;
}

- (NSArray)actionSetResponses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [(NSMutableDictionary *)self->_updatedActionSetResponsesByActionSetUUID na_flatMap:&__block_literal_global_235];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

id __49__HMDDeviceNotificationUpdate_actionSetResponses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = a3;
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  uint64_t v5 = [v3 arrayWithObjects:v7 count:1];

  return v5;
}

- (NSArray)mediaProperties
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_updatedMediaPropertiesByMediaProfile na_flatMap:&__block_literal_global_232];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

uint64_t __46__HMDDeviceNotificationUpdate_mediaProperties__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 allValues];
}

- (HMDDeviceNotificationUpdate)updateWithCharacteristicUpdates:(id)a3 notificationUpdateID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock_with_options();
  [(HMDDeviceNotificationUpdate *)self _updateWithNotificationUpdateID:v9 completion:v10];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95__HMDDeviceNotificationUpdate_updateWithCharacteristicUpdates_notificationUpdateID_completion___block_invoke;
  v12[3] = &unk_264A179B8;
  v12[4] = self;
  objc_msgSend(v8, "na_each:", v12);
  os_unfair_lock_unlock(&self->_lock);

  return result;
}

void __95__HMDDeviceNotificationUpdate_updateWithCharacteristicUpdates_notificationUpdateID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 characteristic];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v4];

  if (v5)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the existing changed characteristic: %@ to send notifications", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v3 forKey:v4];
}

- (HMDDeviceNotificationUpdate)updateWithUpdatedActionSetResponses:(id)a3 notificationUpdateID:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock_with_options();
  v19 = v9;
  [(HMDDeviceNotificationUpdate *)self _updateWithNotificationUpdateID:v9 completion:v10];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        updatedActionSetResponsesByActionSetUUID = self->_updatedActionSetResponsesByActionSetUUID;
        v17 = [v15 actionSetUUID];
        [(NSMutableDictionary *)updatedActionSetResponsesByActionSetUUID setObject:v15 forKeyedSubscript:v17];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_lock);
  return result;
}

- (HMDDeviceNotificationUpdate)updateWithUpdatedMediaPropertiesByMediaResponses:(id)a3 notificationUpdateID:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock_with_options();
  v27 = v9;
  v28 = v10;
  [(HMDDeviceNotificationUpdate *)self _updateWithNotificationUpdateID:v9 completion:v10];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        updatedMediaPropertiesByMediaProfile = self->_updatedMediaPropertiesByMediaProfile;
        v16 = [v14 request];
        v17 = [v16 mediaProfile];
        v18 = [v17 uniqueIdentifier];
        v19 = [(NSMutableDictionary *)updatedMediaPropertiesByMediaProfile objectForKeyedSubscript:v18];

        if (!v19)
        {
          v19 = [MEMORY[0x263EFF9A0] dictionary];
        }
        long long v20 = [v14 request];
        long long v21 = [v20 property];
        [v19 setObject:v14 forKeyedSubscript:v21];

        long long v22 = self->_updatedMediaPropertiesByMediaProfile;
        long long v23 = [v14 request];
        v24 = [v23 mediaProfile];
        uint64_t v25 = [v24 uniqueIdentifier];
        [(NSMutableDictionary *)v22 setObject:v19 forKeyedSubscript:v25];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
  return result;
}

- (void)_updateWithNotificationUpdateID:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v10) {
    objc_storeStrong((id *)&self->_notificationUpdateID, a3);
  }
  if (v7)
  {
    notificationsCompletions = self->_notificationsCompletions;
    id v9 = _Block_copy(v7);
    [(NSMutableArray *)notificationsCompletions addObject:v9];
  }
}

- (HMDDeviceNotificationUpdate)initWithRequestID:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDDeviceNotificationUpdate;
  v6 = [(HMDDeviceNotificationUpdate *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestID, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    notificationsCompletions = v7->_notificationsCompletions;
    v7->_notificationsCompletions = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    characteristicUpdateTuples = v7->_characteristicUpdateTuples;
    v7->_characteristicUpdateTuples = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    updatedMediaPropertiesByMediaProfile = v7->_updatedMediaPropertiesByMediaProfile;
    v7->_updatedMediaPropertiesByMediaProfile = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    updatedActionSetResponsesByActionSetUUID = v7->_updatedActionSetResponsesByActionSetUUID;
    v7->_updatedActionSetResponsesByActionSetUUID = (NSMutableDictionary *)v14;
  }
  return v7;
}

@end