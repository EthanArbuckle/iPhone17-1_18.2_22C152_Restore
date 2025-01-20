@interface HMDTrigger
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_isTriggerFiredNotificationEntitled;
- (BOOL)active;
- (BOOL)compatible:(id)a3 user:(id)a4;
- (BOOL)hasNoActions;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (BOOL)isConfigured;
- (BOOL)isOwnedByThisDevice;
- (BOOL)modelContainsTriggerFired:(id)a3;
- (BOOL)requiresDataVersion4;
- (BOOL)shouldActivateOnLocalDevice;
- (BOOL)shouldEncodeLastFireDate:(id)a3;
- (BOOL)supportsDeviceWithCapabilities:(id)a3;
- (HMDDevice)owningDevice;
- (HMDHome)home;
- (HMDTrigger)initWithCoder:(id)a3;
- (HMDTrigger)initWithModel:(id)a3 home:(id)a4;
- (HMDTrigger)initWithName:(id)a3 uuid:(id)a4;
- (HMDTriggerPolicy)policy;
- (HMDUser)owner;
- (HMFMessageDispatcher)msgDispatcher;
- (NSArray)actionSets;
- (NSDate)mostRecentFireDate;
- (NSDictionary)actionContext;
- (NSDictionary)bulletinContext;
- (NSMutableArray)actionSetUUIDs;
- (NSMutableDictionary)actionSetMappings;
- (NSString)configuredName;
- (NSString)contextID;
- (NSString)name;
- (NSString)urlString;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_initWithCoder:(id)a3;
- (id)actionSetForKey:(id)a3;
- (id)actionSetMapKeys;
- (id)attributeDescriptions;
- (id)backingStoreObjects:(int64_t)a3;
- (id)canRenameTriggerWithNewName:(id)a3 configuredName:(id)a4 error:(id *)a5;
- (id)dumpState;
- (id)emptyModelObject;
- (id)logIdentifier;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(id)a4;
- (id)spiClientIdentifier;
- (id)updateEventTriggerMessage:(int)a3 message:(id)a4 relay:(BOOL)a5;
- (unint64_t)triggerType;
- (void)_actionSetsUpdated:(id)a3 message:(id)a4;
- (void)_activate:(BOOL)a3 completionHandler:(id)a4;
- (void)_activateTriggerRequest:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_addActionSet:(id)a3;
- (void)_checkForNoActions;
- (void)_encodeWithCoder:(id)a3;
- (void)_executeActionSets:(id)a3 captureCurrentState:(BOOL)a4 completionHandler:(id)a5;
- (void)_executeActionSetsWithCompletionHandler:(id)a3;
- (void)_fillBaseObjectChangeModel:(id)a3;
- (void)_forceEvaluate;
- (void)_handleActivateTriggerRequest:(id)a3;
- (void)_handleAddActionSetRequest:(id)a3;
- (void)_handleAddTriggerOwnedActionSetRequest:(id)a3;
- (void)_handleRemoveActionSetRequest:(id)a3 postUpdate:(BOOL)a4;
- (void)_handleRemoveTriggerOwnedActionSetRequest:(id)a3 postUpdate:(BOOL)a4;
- (void)_handleRemoveTriggerPolicyRequest:(id)a3;
- (void)_handleRenameRequest:(id)a3;
- (void)_handleTriggerUpdate:(id)a3 message:(id)a4;
- (void)_handleUpdateActionSetRequest:(id)a3;
- (void)_handleUpdateTriggerPolicyRequest:(id)a3;
- (void)_recentFireDateUpdated:(id)a3;
- (void)_registerForMessages;
- (void)_renameRequest:(id)a3;
- (void)_transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)_updateActionSetRequest:(id)a3 postUpdate:(BOOL)a4;
- (void)activateAfterResidentChangeWithCompletion:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5;
- (void)confirmResident;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)executeCompleteWithError:(id)a3;
- (void)invalidate;
- (void)markChangedForMessage:(id)a3;
- (void)markChangedForMessage:(id)a3 triggerModel:(id)a4;
- (void)reEvaluate:(unint64_t)a3;
- (void)removeActionSet:(id)a3 postUpdate:(BOOL)a4;
- (void)removeActionSetForKey:(id)a3;
- (void)removeAllActionSets;
- (void)sendTriggerFiredNotification:(id)a3;
- (void)setActionSetForKey:(id)a3 value:(id)a4;
- (void)setActionSetMappings:(id)a3;
- (void)setActionSetUUIDs:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setConfiguredName:(id)a3;
- (void)setEnabled:(BOOL)a3 message:(id)a4;
- (void)setHome:(id)a3;
- (void)setMostRecentFireDate:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setName:(id)a3;
- (void)setOwner:(id)a3;
- (void)setOwningDevice:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setTriggerType:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)triggerFired;
- (void)userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation HMDTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentFireDate, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_actionSetUUIDs, 0);
  objc_storeStrong((id *)&self->_actionSetMappings, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_owningDevice, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setMostRecentFireDate:(id)a3
{
}

- (NSDate)mostRecentFireDate
{
  return self->_mostRecentFireDate;
}

- (void)setTriggerType:(unint64_t)a3
{
  self->_triggerType = a3;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setActionSetUUIDs:(id)a3
{
}

- (NSMutableArray)actionSetUUIDs
{
  return self->_actionSetUUIDs;
}

- (void)setActionSetMappings:(id)a3
{
}

- (NSMutableDictionary)actionSetMappings
{
  return self->_actionSetMappings;
}

- (void)setPolicy:(id)a3
{
}

- (HMDTriggerPolicy)policy
{
  return self->_policy;
}

- (void)setOwningDevice:(id)a3
{
}

- (HMDDevice)owningDevice
{
  return self->_owningDevice;
}

- (void)setOwner:(id)a3
{
}

- (HMDUser)owner
{
  return self->_owner;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)_addActionSet:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  id v6 = [v5 UUIDString];

  [(HMDTrigger *)self setActionSetForKey:v6 value:v4];
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HMDTrigger *)self actionSets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    int v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 containsShortcutActions]) {
          v9 &= [v4 supportsShortcutActions];
        }
        if ([v11 containsMediaPlaybackActions]) {
          v9 &= [v4 supportsMediaActions];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9 & 1;
}

- (void)confirmResident
{
  if ([(HMDTrigger *)self isConfigured])
  {
    v3 = [(HMDTrigger *)self home];
    id v4 = [v3 residentDeviceManager];

    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __29__HMDTrigger_confirmResident__block_invoke;
    v5[3] = &unk_1E6A197F0;
    v5[4] = self;
    [v4 confirmWithCompletionHandler:v5];
  }
}

void __29__HMDTrigger_confirmResident__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      long long v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      int v9 = "%{public}@Failed to confirm primary resident with error: %@";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    long long v14 = v8;
    int v9 = "%{public}@Successfully confirmed primary resident";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (id)updateEventTriggerMessage:(int)a3 message:(id)a4 relay:(BOOL)a5
{
  id v8 = a4;
  int v9 = [(HMDTrigger *)self home];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HMDTrigger_updateEventTriggerMessage_message_relay___block_invoke;
  aBlock[3] = &unk_1E6A05258;
  id v10 = v8;
  id v19 = v10;
  objc_copyWeak(&v21, &location);
  id v11 = v9;
  id v20 = v11;
  int v22 = a3;
  BOOL v23 = a5;
  uint32_t v12 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  if (![v11 isSharedAdmin]) {
    goto LABEL_5;
  }
  int v13 = [v11 primaryResident];
  long long v14 = v13;
  if (v13 && ([v13 isReachable] & 1) != 0)
  {

LABEL_5:
    long long v14 = (void *)[v10 mutableCopy];
    [v14 setResponseHandler:v12];
    objc_msgSend(v14, "setRemote:", objc_msgSend(v10, "isRemote"));
    __int16 v15 = (void *)[v14 copy];
    goto LABEL_7;
  }
  id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:91];
  v12[2](v12, v16, 0);

  __int16 v15 = 0;
LABEL_7:

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v15;
}

void __54__HMDTrigger_updateEventTriggerMessage_message_relay___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = objc_alloc_init(HomeKitEventTriggerUpdateLogEvent);
    id v8 = [*(id *)(a1 + 32) remoteSourceID];

    if (v8)
    {
      int v9 = [(HomeKitEventTriggerUpdateLogEvent *)v7 analyticsData];
      id v10 = v9;
      uint64_t v11 = 3;
    }
    else if ([*(id *)(a1 + 40) isOwnerUser])
    {
      int v9 = [(HomeKitEventTriggerUpdateLogEvent *)v7 analyticsData];
      id v10 = v9;
      uint64_t v11 = 1;
    }
    else
    {
      if (![*(id *)(a1 + 40) isAdminUser]) {
        goto LABEL_11;
      }
      int v9 = [(HomeKitEventTriggerUpdateLogEvent *)v7 analyticsData];
      id v10 = v9;
      uint64_t v11 = 2;
    }
    [v9 setRequestOrigin:v11];

LABEL_11:
    uint64_t v13 = *(unsigned int *)(a1 + 56);
    long long v14 = [(HomeKitEventTriggerUpdateLogEvent *)v7 analyticsData];
    [v14 setUpdateType:v13];

    __int16 v15 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v15 submitLogEvent:v7];

    if (!v21 && *(unsigned char *)(a1 + 60) && [*(id *)(a1 + 40) isSharedAdmin])
    {
      uint64_t v18 = (void *)[*(id *)(a1 + 32) mutableCopy];
      [v18 setResponseHandler:0];
      id v19 = [*(id *)(a1 + 40) administratorHandler];
      id v20 = [v19 operationForMessage:v18 error:0];
      if (v20) {
        [v19 addOperation:v20];
      }
    }
    id v16 = [*(id *)(a1 + 32) responseHandler];

    if (v16)
    {
      uint64_t v17 = [*(id *)(a1 + 32) responseHandler];
      ((void (**)(void, id, id))v17)[2](v17, v21, v5);
    }
    goto LABEL_14;
  }
  uint32_t v12 = [*(id *)(a1 + 32) responseHandler];

  if (!v12) {
    goto LABEL_15;
  }
  uint64_t v7 = [*(id *)(a1 + 32) responseHandler];
  (*(void (**)(HomeKitEventTriggerUpdateLogEvent *, id, id))&v7->super._endTime)(v7, v21, v5);
LABEL_14:

LABEL_15:
}

- (id)emptyModelObject
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)backingStoreObjects:(int64_t)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return [(HMDTrigger *)self modelObjectWithChangeType:a3 version:0];
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  id v8 = NSString;
  int v9 = NSStringFromSelector(a2);
  id v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (void)_transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = NSString;
  id v11 = NSStringFromSelector(a2);
  uint32_t v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  id v13 = NSString;
  long long v14 = NSStringFromSelector(a2);
  __int16 v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (id)spiClientIdentifier
{
  return spiClientIdentifierForUUID(self->_uuid);
}

- (void)_encodeWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDTrigger *)self home];
  [v4 encodeConditionalObject:v5 forKey:@"home"];
  id v6 = [(HMDTrigger *)self name];
  [v4 encodeObject:v6 forKey:@"triggerName"];

  id v7 = [(HMDTrigger *)self uuid];
  id v8 = [v7 UUIDString];
  [v4 encodeObject:v8 forKey:@"triggerUUID"];

  id v9 = [(HMDTrigger *)self actionSets];
  [v4 encodeObject:v9 forKey:@"triggerActionSets"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDTrigger active](self, "active"), @"triggerActive");
  id v10 = [(HMDTrigger *)self configuredName];
  [v4 encodeObject:v10 forKey:*MEMORY[0x1E4F2E1D8]];

  LODWORD(v10) = objc_msgSend(v4, "hmd_isForXPCTransport");
  int v11 = objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess");
  if (!v10)
  {
    uint64_t v18 = [(HMDTrigger *)self actionSetUUIDs];
    [v4 encodeObject:v18 forKey:@"triggerActionSetUUIDs"];

    id v19 = [(HMDTrigger *)self owningDevice];
    [v4 encodeObject:v19 forKey:@"HM.device"];

    id v20 = [(HMDTrigger *)self owner];
    [v4 encodeObject:v20 forKey:@"HM.user"];

    id v21 = [(HMDTrigger *)self policy];
    [v4 encodeObject:v21 forKey:*MEMORY[0x1E4F2E1F8]];

    goto LABEL_8;
  }
  int v12 = v11;
  BOOL v13 = [(HMDTrigger *)self shouldEncodeLastFireDate:v4];
  if (!v12) {
    goto LABEL_5;
  }
  long long v14 = [(HMDTrigger *)self policy];
  [v4 encodeObject:v14 forKey:*MEMORY[0x1E4F2E1F8]];

  __int16 v15 = [(HMDTrigger *)self owningDevice];
  [v4 encodeObject:v15 forKey:@"HM.device"];

  id v16 = [(HMDTrigger *)self owner];

  if (v16)
  {
    uint64_t v17 = [(HMDTrigger *)self owner];
    [v4 encodeObject:v17 forKey:@"HM.user"];

LABEL_5:
    if (!v13) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v23 = (void *)MEMORY[0x1D9452090]();
  v24 = self;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    int v27 = 138543362;
    v28 = v26;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Owner user is not set in the trigger", (uint8_t *)&v27, 0xCu);
  }
  if (v13)
  {
LABEL_8:
    int v22 = [(HMDTrigger *)self mostRecentFireDate];
    [v4 encodeObject:v22 forKey:@"triggerLastFireDate"];
  }
LABEL_9:
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x1D9452090]();
  [(HMDTrigger *)self _encodeWithCoder:v5];
}

- (id)_initWithCoder:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerUUID"];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  id v8 = [(HMDTrigger *)self initWithName:v5 uuid:v7];
  if (v8)
  {
    v42 = v7;
    v43 = v6;
    v44 = v5;
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    objc_storeWeak((id *)&v8->_home, v9);

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    uint64_t v12 = [v10 setWithArray:v11];

    BOOL v13 = (void *)MEMORY[0x1E4F1CAD0];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    __int16 v15 = [v13 setWithArray:v14];
    id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"triggerActionSetUUIDs"];

    v41 = (void *)v12;
    uint64_t v17 = [v4 decodeObjectOfClasses:v12 forKey:@"triggerActionSets"];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v17);
          }
          int v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          BOOL v23 = [v22 uuid];
          v24 = [v23 UUIDString];
          [(HMDTrigger *)v8 setActionSetForKey:v24 value:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v19);
    }
    if (v16)
    {
      v25 = (void *)[v16 mutableCopy];
      [(HMDTrigger *)v8 setActionSetUUIDs:v25];
    }
    else
    {
      v25 = [(HMDTrigger *)v8 actionSetMapKeys];
      v26 = (void *)[v25 mutableCopy];
      [(HMDTrigger *)v8 setActionSetUUIDs:v26];
    }
    id v7 = v42;
    id v6 = v43;

    -[HMDTrigger setActive:](v8, "setActive:", [v4 decodeBoolForKey:@"triggerActive"]);
    int v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerLastFireDate"];
    [(HMDTrigger *)v8 setMostRecentFireDate:v27];

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.user"];
    owner = v8->_owner;
    v8->_owner = (HMDUser *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.device"];
    owningDevice = v8->_owningDevice;
    v8->_owningDevice = (HMDDevice *)v30;

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E1D8]];
    uint64_t v33 = objc_msgSend(v32, "hm_truncatedNameString");
    configuredName = v8->_configuredName;
    v8->_configuredName = (NSString *)v33;

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v49 = objc_opt_class();
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    v37 = [v35 setWithArray:v36];

    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:*MEMORY[0x1E4F2E1F8]];
    policy = v8->_policy;
    v8->_policy = (HMDTriggerPolicy *)v38;

    id v5 = v44;
  }

  return v8;
}

- (HMDTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = (HMDTrigger *)[(HMDTrigger *)self _initWithCoder:v4];

  return v6;
}

- (void)executeCompleteWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDTrigger *)self policy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      long long v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Trigger is marked to be deleted after execution (finished with error: %@), removing...", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v12 = [(HMDTrigger *)v9 home];
    [v12 removeTrigger:v9];
  }
}

- (BOOL)shouldEncodeLastFireDate:(id)a3
{
  return 1;
}

- (void)_handleTriggerUpdate:(id)a3 message:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v6 setProperties];
    *(_DWORD *)buf = 138543874;
    v75 = v11;
    __int16 v76 = 2112;
    id v77 = v6;
    __int16 v78 = 2112;
    v79 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling base trigger update: %@, %@", buf, 0x20u);
  }
  int v13 = [v6 setProperties];
  int v14 = [v13 containsObject:@"currentActionSets"];

  if (v14) {
    [(HMDTrigger *)v9 _actionSetsUpdated:v6 message:v7];
  }
  __int16 v15 = [v6 setProperties];
  unint64_t v16 = 0x1E4F1C000;
  if ([v15 containsObject:@"name"])
  {
  }
  else
  {
    uint64_t v17 = [v6 setProperties];
    int v18 = [v17 containsObject:@"configuredName"];

    if (!v18) {
      goto LABEL_13;
    }
  }
  v69 = [(HMDTrigger *)v9 name];
  uint64_t v19 = [(HMDTrigger *)v9 configuredName];
  uint64_t v20 = [v6 name];
  [(HMDTrigger *)v9 setName:v20];

  id v21 = [v6 configuredName];
  [(HMDTrigger *)v9 setConfiguredName:v21];

  int v22 = (void *)MEMORY[0x1D9452090]();
  BOOL v23 = v9;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = HMFGetLogIdentifier();
    v26 = [(HMDTrigger *)v23 name];
    int v27 = [(HMDTrigger *)v23 configuredName];
    *(_DWORD *)buf = 138544386;
    v75 = v25;
    __int16 v76 = 2112;
    id v77 = v69;
    __int16 v78 = 2112;
    v79 = v26;
    __int16 v80 = 2112;
    v81 = v19;
    __int16 v82 = 2112;
    v83 = v27;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Parameter configured From : [%@, %@] To: [%@, %@]", buf, 0x34u);

    unint64_t v16 = 0x1E4F1C000uLL;
  }

  uint64_t v28 = *(void **)(v16 + 2656);
  uint64_t v29 = [v7 messagePayload];
  uint64_t v30 = [v28 dictionaryWithDictionary:v29];

  v31 = [(HMDTrigger *)v23 name];
  [v30 setObject:v31 forKeyedSubscript:@"kTriggerName"];

  v32 = [(HMDTrigger *)v23 configuredName];
  [v30 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F2E1E0]];

  uint64_t v33 = HMDRemoteMessagePayloadKeysForTransportMetadata();
  [v30 removeObjectsForKeys:v33];

  v34 = (void *)MEMORY[0x1D9452090]();
  v35 = v23;
  v36 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v75 = v37;
    __int16 v76 = 2112;
    id v77 = v30;
    _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@name parameter configured : payload : %@", buf, 0x16u);
  }
  [v7 respondWithPayload:v30];

LABEL_13:
  uint64_t v38 = [v6 setProperties];
  int v39 = [v38 containsObject:@"mostRecentFireDate"];

  if (v39)
  {
    v40 = [v6 mostRecentFireDate];
    [(HMDTrigger *)v9 _recentFireDateUpdated:v40];
  }
  v41 = [v6 setProperties];
  int v42 = [v41 containsObject:@"owner"];

  if (v42)
  {
    v43 = [(HMDTrigger *)v9 home];
    v44 = [v6 owner];
    long long v45 = [v44 uuid];
    long long v46 = [v43 userWithUUID:v45];
    [(HMDTrigger *)v9 setOwner:v46];

    [v7 respondWithPayload:0];
  }
  long long v47 = [v6 setProperties];
  int v48 = [v47 containsObject:@"owningDevice"];

  if (v48)
  {
    uint64_t v49 = [v6 owningDevice];
    [(HMDTrigger *)v9 setOwningDevice:v49];

    v72[0] = @"kTriggerUUID";
    v50 = [(HMDTrigger *)v9 uuid];
    v51 = [v50 UUIDString];
    v72[1] = @"HM.device";
    v73[0] = v51;
    v52 = [(HMDTrigger *)v9 owningDevice];
    v53 = encodeRootObjectForIncomingXPCMessage(v52, 0);
    v73[1] = v53;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];

    [v7 respondWithPayload:v54];
  }
  v55 = [v6 setProperties];
  int v56 = [v55 containsObject:@"active"];

  if (v56)
  {
    v57 = [v6 active];
    -[HMDTrigger setActive:](v9, "setActive:", [v57 BOOLValue]);

    v70 = @"kTriggerActivate";
    v58 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDTrigger active](v9, "active"));
    v71 = v58;
    v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];

    [v7 respondWithPayload:v59];
  }
  v60 = [v6 setProperties];
  int v61 = [v60 containsObject:@"autoDelete"];

  if (v61)
  {
    v62 = [v6 autoDelete];
    int v63 = [v62 BOOLValue];

    if (v63)
    {
      v64 = objc_alloc_init(HMDTriggerDeleteAfterExecutionPolicy);
      [(HMDTrigger *)v9 setPolicy:v64];

      v65 = [(HMDTrigger *)v9 policy];
      v66 = [v65 uuid];
    }
    else
    {
      [(HMDTrigger *)v9 setPolicy:0];
      v66 = 0;
    }
    v67 = [*(id *)(v16 + 2656) dictionaryWithCapacity:1];
    if (v66)
    {
      v68 = [v66 UUIDString];
      [v67 setObject:v68 forKeyedSubscript:*MEMORY[0x1E4F2E210]];
    }
    [v7 respondWithPayload:v67];
  }
  [(HMDTrigger *)v9 markChangedForMessage:v7 triggerModel:v6];
}

- (void)_fillBaseObjectChangeModel:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTrigger *)self name];
  [v4 setName:v5];

  id v6 = [(HMDTrigger *)self configuredName];
  [v4 setConfiguredName:v6];

  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDTrigger active](self, "active"));
  [v4 setActive:v7];

  id v8 = [(HMDTrigger *)self actionSetUUIDs];
  id v9 = (void *)[v8 copy];
  [v4 setCurrentActionSets:v9];

  id v10 = [(HMDTrigger *)self mostRecentFireDate];
  [v4 setMostRecentFireDate:v10];

  int v11 = [(HMDTrigger *)self owner];
  [v4 setOwner:v11];

  uint64_t v12 = [(HMDTrigger *)self owningDevice];
  [v4 setOwningDevice:v12];

  int v13 = [(HMDTrigger *)self policy];
  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  [NSNumber numberWithBool:v12 & (v13 != 0)];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setAutoDelete:v14];
}

- (void)_registerForMessages
{
  v29[4] = *MEMORY[0x1E4F143B8];
  BOOL v23 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v23, "setRoles:", objc_msgSend(v23, "roles") | 4);
  uint64_t v3 = (void *)[v23 copy];
  v24 = [(HMDTrigger *)self home];
  id v4 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v24 userPrivilege:4 remoteAccessRequired:0];
  id v5 = [(HMDTrigger *)self msgDispatcher];
  id v6 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v29[0] = v6;
  v29[1] = v3;
  v29[2] = v4;
  id v7 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v29[3] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v5 registerForMessage:@"kRenameTriggerRequestKey" receiver:self policies:v8 selector:sel__handleRenameRequest_];

  id v9 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v28[0] = v9;
  v28[1] = v3;
  v28[2] = v4;
  id v10 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:5];
  v28[3] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  [v5 registerForMessage:@"kUpdateActionSetTriggerRequestKey" receiver:self policies:v11 selector:sel__handleUpdateActionSetRequest_];

  uint64_t v12 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v27[0] = v12;
  v27[1] = v3;
  v27[2] = v4;
  int v13 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v27[3] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [v5 registerForMessage:@"kActivateTriggerRequestKey" receiver:self policies:v14 selector:sel__handleActivateTriggerRequest_];

  uint64_t v15 = *MEMORY[0x1E4F2E220];
  unint64_t v16 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v26[0] = v16;
  v26[1] = v3;
  v26[2] = v4;
  uint64_t v17 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v26[3] = v17;
  int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  [v5 registerForMessage:v15 receiver:self policies:v18 selector:sel__handleUpdateTriggerPolicyRequest_];

  uint64_t v19 = *MEMORY[0x1E4F2E218];
  uint64_t v20 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v25[0] = v20;
  v25[1] = v3;
  v25[2] = v4;
  id v21 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:4];
  v25[3] = v21;
  int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  [v5 registerForMessage:v19 receiver:self policies:v22 selector:sel__handleRemoveTriggerPolicyRequest_];
}

- (void)userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  id v7 = [v5 hmErrorWithCode:22];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)_executeActionSets:(id)a3 captureCurrentState:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v38 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v35 = (void (**)(id, void *, void))a5;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v34;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Executing action sets: %@", buf, 0x16u);
  }
  int v11 = +[HMDLostModeManager sharedManager];
  int v12 = [v11 isLost];

  if (v12)
  {
    int v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = v8;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Not executing action sets: device is in lost mode", buf, 0xCu);
    }
    v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
    v35[2](v35, v36, 0);
  }
  else
  {
    uint64_t v17 = [(HMDTrigger *)v8 msgDispatcher];
    BOOL v18 = v17 == 0;

    if (v18)
    {
      v26 = (void *)MEMORY[0x1D9452090]();
      int v27 = v8;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not executing action sets: trigger is unconfigured", buf, 0xCu);
      }
      v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      v35[2](v35, v36, 0);
    }
    else
    {
      v36 = objc_msgSend(v34, "na_filter:", &__block_literal_global_67);
      if ([v36 count])
      {
        uint64_t v19 = dispatch_group_create();
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        int v56 = __Block_byref_object_copy_;
        v57 = __Block_byref_object_dispose_;
        id v58 = 0;
        v52[0] = 0;
        v52[1] = v52;
        v52[2] = 0x3032000000;
        v52[3] = __Block_byref_object_copy_;
        void v52[4] = __Block_byref_object_dispose_;
        id v53 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id obj = v36;
        uint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v49;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v49 != v21) {
                objc_enumerationMutation(obj);
              }
              BOOL v23 = *(void **)(*((void *)&v48 + 1) + 8 * v22);
              dispatch_group_enter(v19);
              v43[0] = MEMORY[0x1E4F143A8];
              v43[1] = 3221225472;
              v43[2] = __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_68;
              v43[3] = &unk_1E6A05230;
              v43[4] = v8;
              long long v46 = buf;
              v24 = v19;
              long long v47 = v52;
              v44 = v24;
              long long v45 = v23;
              [v23 executeWithTriggerSource:v8 captureCurrentState:v38 completionHandler:v43];

              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
          }
          while (v20);
        }

        v25 = [(HMDTrigger *)v8 workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_3;
        block[3] = &unk_1E6A106B8;
        v40 = v35;
        v41 = buf;
        int v42 = v52;
        dispatch_group_notify(v19, v25, block);

        _Block_object_dispose(v52, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        uint64_t v30 = (void *)MEMORY[0x1D9452090]();
        v31 = v8;
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v33;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Not executing action sets: all action sets have an empty list of actions", buf, 0xCu);
        }
        uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:25];
        v35[2](v35, v19, 0);
      }
    }
  }
}

void __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_2;
  v14[3] = &unk_1E6A11648;
  uint64_t v8 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v19 = v8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 48);
  id v16 = v9;
  uint64_t v17 = v11;
  uint64_t v20 = v10;
  id v18 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v7, v14);
}

uint64_t __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = [*(id *)(a1 + 48) uuid];
  [v3 setObject:v4 forKeyedSubscript:v5];
}

BOOL __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_executeActionSetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTrigger *)self actionSets];
  [(HMDTrigger *)self _executeActionSets:v5 captureCurrentState:0 completionHandler:v4];
}

- (void)_handleRemoveTriggerPolicyRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDTrigger *)self policy];

  if (v5)
  {
    id v6 = [(HMDTrigger *)self emptyModelObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v9 = [NSNumber numberWithBool:0];
    [v8 setAutoDelete:v9];

    uint64_t v10 = [(HMDTrigger *)self home];
    uint64_t v11 = [v10 backingStore];
    id v12 = [v4 name];
    id v13 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v14 = [v11 transaction:v12 options:v13];

    [v14 add:v8 withMessage:v4];
    [v14 run];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Policy already removed", (uint8_t *)&v19, 0xCu);
    }
    [v4 respondWithSuccess];
  }
}

- (void)_handleUpdateTriggerPolicyRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDTrigger *)self home];
  if (v5)
  {
    id v6 = [v4 dictionaryForKey:*MEMORY[0x1E4F2E200]];
    char v25 = 0;
    uint64_t v7 = objc_msgSend(v6, "hmf_BOOLForKey:isPresent:", *MEMORY[0x1E4F2E1F0], &v25);
    if (v25)
    {
      uint64_t v8 = v7;
      id v9 = [(HMDTrigger *)self emptyModelObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;

      id v12 = [NSNumber numberWithBool:v8];
      [v11 setAutoDelete:v12];

      id v13 = [v5 backingStore];
      id v14 = [v4 name];
      id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      id v16 = [v13 transaction:v14 options:v15];

      [v16 add:v11 withMessage:v4];
      [v16 run];
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x1D9452090](v7);
      uint64_t v22 = self;
      BOOL v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v27 = v24;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid payload for update policy request", buf, 0xCu);
      }
      id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v4 respondWithError:v16];
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v27 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Trigger not associated to a home", buf, 0xCu);
    }
    id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v4 respondWithError:v6];
  }
}

- (void)_activateTriggerRequest:(id)a3
{
  id v10 = a3;
  id v4 = [(HMDTrigger *)self home];
  if (v4)
  {
    id v5 = [v10 numberForKey:@"kTriggerActivate"];
    if (v5)
    {
      id v6 = v5;
      -[HMDTrigger setEnabled:message:](self, "setEnabled:message:", [v5 BOOLValue], v10);
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:20 userInfo:0];
      id v9 = [v10 responseHandler];
      ((void (**)(void, void *, void))v9)[2](v9, v8, 0);

      id v6 = 0;
    }
  }
  else
  {
    id v6 = [v10 responseHandler];
    uint64_t v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(void, void *, void))v6)[2](v6, v7, 0);
  }
}

- (void)_handleActivateTriggerRequest:(id)a3
{
  uint64_t v4 = [(HMDTrigger *)self updateEventTriggerMessage:10 message:a3 relay:1];
  if (v4) {
    [(HMDTrigger *)self _activateTriggerRequest:v4];
  }
  MEMORY[0x1F41817F8]();
}

- (void)_actionSetsUpdated:(id)a3 message:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v81 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA80];
  v72 = v6;
  uint64_t v8 = [v6 currentActionSets];
  id v9 = [v7 setWithArray:v8];

  id v10 = (void *)MEMORY[0x1E4F1CA80];
  id v11 = [(HMDTrigger *)self actionSetMapKeys];
  uint64_t v12 = [v10 setWithArray:v11];

  v73 = (void *)v12;
  v74 = v9;
  id v13 = (void *)MEMORY[0x1D9452090]([v9 minusSet:v12]);
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v97 = v16;
    __int16 v98 = 2112;
    v99 = v9;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@addedActionSets: %@", buf, 0x16u);
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
  id v18 = [v72 currentActionSets];
  int v19 = [v17 setWithArray:v18];
  uint64_t v20 = v73;
  [v73 minusSet:v19];

  uint64_t v21 = (void *)MEMORY[0x1D9452090]();
  uint64_t v22 = v14;
  BOOL v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v97 = v24;
    __int16 v98 = 2112;
    v99 = v73;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@removedActionSets: %@", buf, 0x16u);
  }
  __int16 v80 = v22;
  if ([v74 count])
  {
    char v25 = [(HMDTrigger *)v22 home];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v26 = v74;
    uint64_t v79 = [v26 countByEnumeratingWithState:&v86 objects:v95 count:16];
    if (v79)
    {
      char v76 = 0;
      id v77 = *(id *)v87;
      id obj = v26;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(id *)v87 != v77) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v86 + 1) + 8 * v27);
          uint64_t v29 = (void *)MEMORY[0x1D9452090]();
          uint64_t v30 = v22;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v97 = v32;
            __int16 v98 = 2112;
            v99 = v28;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Action set %@ has been added", buf, 0x16u);
          }
          uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v28];
          id v34 = [v25 actionSetWithUUID:v33];
          if (v34
            || ([v25 triggerOwnedActionSetWithUUID:v33],
                (id v34 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (([v34 containsShortcutActions] & 1) != 0
              || [v34 containsMediaPlaybackActions])
            {
              char v76 = 1;
            }
            [(HMDTrigger *)v30 setActionSetForKey:v28 value:v34];
            v35 = [(HMDTrigger *)v30 actionSetUUIDs];
            char v36 = [v35 containsObject:v28];

            if ((v36 & 1) == 0)
            {
              v37 = [(HMDTrigger *)v30 actionSetUUIDs];
              [v37 addObject:v28];
            }
            v94[0] = v28;
            v93[0] = @"kTriggerActionSetUUIDKey";
            v93[1] = @"kActionSetName";
            BOOL v38 = [v34 name];
            v94[1] = v38;
            v93[2] = @"kTriggerActionSetTypeKey";
            int v39 = [v34 type];
            v93[3] = @"kTriggerAddActionSetKey";
            v94[2] = v39;
            v94[3] = MEMORY[0x1E4F1CC38];
            v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:4];

            v41 = (void *)MEMORY[0x1D9452090]();
            int v42 = v30;
            v43 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              v44 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v97 = v44;
              _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Responding to clients that actionSet has been added to the trigger.", buf, 0xCu);

              uint64_t v22 = v80;
            }

            [v81 respondWithPayload:v40];
          }
          else
          {
            long long v45 = (void *)MEMORY[0x1D9452090]();
            long long v46 = v30;
            long long v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              long long v48 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v97 = v48;
              __int16 v98 = 2112;
              v99 = v28;
              _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Action set %@ could not be found", buf, 0x16u);
            }
          }

          ++v27;
        }
        while (v79 != v27);
        uint64_t v49 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
        uint64_t v79 = v49;
      }
      while (v49);

      if (v76) {
        [(HMDTrigger *)v30 confirmResident];
      }
    }
    else
    {
    }
    uint64_t v20 = v73;
  }
  if ([v20 count])
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v78 = v20;
    uint64_t v50 = [v78 countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v83 != v52) {
            objc_enumerationMutation(v78);
          }
          v54 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          v55 = (void *)MEMORY[0x1D9452090]();
          int v56 = v22;
          v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            id v58 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v97 = v58;
            __int16 v98 = 2112;
            v99 = v54;
            _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_INFO, "%{public}@Action set %@ has been deleted", buf, 0x16u);
          }
          uint64_t v59 = [(HMDTrigger *)v56 actionSetForKey:v54];
          if (v59)
          {
            [(HMDTrigger *)v56 removeActionSetForKey:v54];
            v60 = [(HMDTrigger *)v56 actionSetUUIDs];
            [v60 removeObject:v54];

            v91[0] = v54;
            v90[0] = @"kTriggerActionSetUUIDKey";
            v90[1] = @"kActionSetName";
            int v61 = [v59 name];
            v91[1] = v61;
            v90[2] = @"kTriggerActionSetTypeKey";
            v62 = [v59 type];
            v90[3] = @"kTriggerAddActionSetKey";
            v91[2] = v62;
            v91[3] = MEMORY[0x1E4F1CC28];
            int v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:4];

            v64 = (void *)MEMORY[0x1D9452090]();
            v65 = v56;
            v66 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              v67 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v97 = v67;
              _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_INFO, "%{public}@Notifying clients that actionSet has been removed from the trigger.", buf, 0xCu);
            }
            [v81 respondWithPayload:v63];

            uint64_t v22 = v80;
          }
          else
          {
            v68 = (void *)MEMORY[0x1D9452090]();
            v69 = v56;
            v70 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              v71 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v97 = v71;
              __int16 v98 = 2112;
              v99 = v54;
              _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_INFO, "%{public}@Action set %@ could not be found", buf, 0x16u);
            }
          }
        }
        uint64_t v51 = [v78 countByEnumeratingWithState:&v82 objects:v92 count:16];
      }
      while (v51);
    }

    uint64_t v20 = v73;
  }
}

- (void)_updateActionSetRequest:(id)a3 postUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [v15 numberForKey:@"kTriggerAddActionSetKey"];
  if (v6)
  {
    uint64_t v7 = [(HMDTrigger *)self home];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = [v15 stringForKey:@"kTriggerActionSetTypeKey"];
      int v10 = [v9 isEqualToString:*MEMORY[0x1E4F2C950]];
      int v11 = [v6 BOOLValue];
      if (v10)
      {
        if ([v15 isEntitledForSPIAccess] & 1) != 0 || (objc_msgSend(v15, "isRemote"))
        {
          if (v11) {
            [(HMDTrigger *)self _handleAddTriggerOwnedActionSetRequest:v15];
          }
          else {
            [(HMDTrigger *)self _handleRemoveTriggerOwnedActionSetRequest:v15 postUpdate:v4];
          }
        }
        else
        {
          id v13 = [v15 responseHandler];
          id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
          ((void (**)(void, void *, void))v13)[2](v13, v14, 0);
        }
      }
      else if (v11)
      {
        [(HMDTrigger *)self _handleAddActionSetRequest:v15];
      }
      else
      {
        [(HMDTrigger *)self _handleRemoveActionSetRequest:v15 postUpdate:v4];
      }
    }
    else
    {
      id v9 = [v15 responseHandler];
      uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      ((void (**)(void, void *, void))v9)[2](v9, v12, 0);

      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:20 userInfo:0];
    id v9 = [v15 responseHandler];
    ((void (**)(void, void *, void))v9)[2](v9, v8, 0);
  }
}

- (void)_handleUpdateActionSetRequest:(id)a3
{
  uint64_t v4 = [(HMDTrigger *)self updateEventTriggerMessage:9 message:a3 relay:1];
  if (v4) {
    [(HMDTrigger *)self _updateActionSetRequest:v4 postUpdate:1];
  }
  MEMORY[0x1F41817F8]();
}

- (void)_handleRemoveTriggerOwnedActionSetRequest:(id)a3 postUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 uuidForKey:@"kTriggerActionSetUUIDKey"];
  if (v7)
  {
    uint64_t v8 = [(HMDTrigger *)self home];
    id v9 = [v8 backingStore];
    int v10 = [v6 name];
    int v11 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v12 = [v9 transaction:v10 options:v11];

    id v13 = [HMDActionSetModel alloc];
    id v14 = [v8 uuid];
    id v15 = [(HMDBackingStoreModelObject *)v13 initWithObjectChangeType:3 uuid:v7 parentUUID:v14];

    uint64_t v16 = [v12 add:v15 withMessage:0];
    if (v4)
    {
      uint64_t v17 = [(HMDTrigger *)self emptyModelObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
      id v19 = v18;

      uint64_t v20 = [(HMDTrigger *)self actionSetUUIDs];
      uint64_t v21 = [v7 UUIDString];
      [v20 removeObject:v21];

      uint64_t v22 = [(HMDTrigger *)self actionSetUUIDs];
      BOOL v23 = (void *)[v22 copy];
      [v19 setCurrentActionSets:v23];

      [v12 add:v19 withMessage:v6];
    }
    else
    {
      v24 = (void *)MEMORY[0x1D9452090](v16);
      char v25 = self;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        int v28 = 138543362;
        uint64_t v29 = v27;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Remove of trigger owned action set, not posting event trigger update model as requested", (uint8_t *)&v28, 0xCu);
      }
    }
    [v12 run];
  }
  else
  {
    uint64_t v8 = [v6 responseHandler];
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    ((void (**)(void, void *, void))v8)[2](v8, v12, 0);
  }
}

- (void)_handleRemoveActionSetRequest:(id)a3 postUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 uuidForKey:@"kTriggerActionSetUUIDKey"];
  if (v7)
  {
    if (v4)
    {
      uint64_t v8 = [(HMDTrigger *)self emptyModelObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      int v11 = [(HMDTrigger *)self actionSetUUIDs];
      uint64_t v12 = [v7 UUIDString];
      [v11 removeObject:v12];

      id v13 = [(HMDTrigger *)self actionSetUUIDs];
      id v14 = (void *)[v13 copy];
      [v10 setCurrentActionSets:v14];

      id v15 = [(HMDTrigger *)self home];
      uint64_t v16 = [v15 backingStore];
      uint64_t v17 = [v6 name];
      id v18 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      id v19 = [v16 transaction:v17 options:v18];

      [v19 add:v10 withMessage:v6];
      [v19 run];
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x1D9452090]();
      BOOL v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        char v25 = HMFGetLogIdentifier();
        int v26 = 138543362;
        uint64_t v27 = v25;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Remove of trigger action set, not posting event trigger update model as requested", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v20 = [v6 responseHandler];
    uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    ((void (**)(void, void *, void))v20)[2](v20, v21, 0);
  }
}

- (void)_handleAddTriggerOwnedActionSetRequest:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kNewObjectUUIDKey"];
  if (v5)
  {
    id v6 = [(HMDTrigger *)self home];
    uint64_t v7 = [HMDActionSetModel alloc];
    uint64_t v8 = [v6 uuid];
    id v9 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:1 uuid:v5 parentUUID:v8];

    id v10 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", v5);
    int v11 = [v10 UUIDString];
    [(HMDActionSetModel *)v9 setName:v11];

    [(HMDActionSetModel *)v9 setType:*MEMORY[0x1E4F2C950]];
    uint64_t v12 = [(HMDTrigger *)self emptyModelObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    id v15 = [(HMDTrigger *)self actionSetUUIDs];
    uint64_t v16 = [v5 UUIDString];
    [v15 addObject:v16];

    uint64_t v17 = [(HMDTrigger *)self actionSetUUIDs];
    id v18 = (void *)[v17 copy];
    [v14 setCurrentActionSets:v18];

    id v19 = [v6 backingStore];
    uint64_t v20 = [v4 name];
    uint64_t v21 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v22 = [v19 transaction:v20 options:v21];

    [v22 add:v9 withMessage:0];
    [v22 add:v14 withMessage:v4];

    [v22 run];
    goto LABEL_10;
  }
  BOOL v23 = (void *)MEMORY[0x1D9452090]();
  v24 = self;
  char v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = HMFGetLogIdentifier();
    int v28 = 138543362;
    uint64_t v29 = v26;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ActionSetUUID not set.", (uint8_t *)&v28, 0xCu);
  }
  uint64_t v27 = [v4 responseHandler];

  if (v27)
  {
    id v6 = [v4 responseHandler];
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    ((void (**)(void, HMDActionSetModel *, void))v6)[2](v6, v9, 0);
LABEL_10:
  }
}

- (void)_handleAddActionSetRequest:(id)a3
{
  id v18 = a3;
  id v4 = [v18 uuidForKey:@"kTriggerActionSetUUIDKey"];
  if (v4)
  {
    id v5 = [(HMDTrigger *)self emptyModelObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = [(HMDTrigger *)self actionSetUUIDs];
    id v9 = [v4 UUIDString];
    [v8 addObject:v9];

    id v10 = [(HMDTrigger *)self actionSetUUIDs];
    int v11 = (void *)[v10 copy];
    [v7 setCurrentActionSets:v11];

    uint64_t v12 = [(HMDTrigger *)self home];
    id v13 = [v12 backingStore];
    id v14 = [v18 name];
    id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v16 = [v13 transaction:v14 options:v15];

    [v16 add:v7 withMessage:v18];
    [v16 run];
  }
  else
  {
    uint64_t v16 = [v18 responseHandler];
    uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    ((void (**)(void, void *, void))v16)[2](v16, v17, 0);
  }
}

- (id)canRenameTriggerWithNewName:(id)a3 configuredName:(id)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDTrigger *)self home];
  int v11 = [v10 homeManager];
  uint64_t v12 = [v11 nameValidator];
  id v13 = [v12 trimNotAllowedCharactersFromName:v8 error:a5];

  if (*a5)
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      id v18 = *a5;
      *(_DWORD *)buf = 138543618;
      uint64_t v51 = v17;
      __int16 v52 = 2112;
      id v53 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Invalid characters found in trigger name. %@", buf, 0x16u);
    }
    id v19 = 0;
    goto LABEL_26;
  }
  uint64_t v20 = [v13 length];
  uint64_t v21 = (void *)MEMORY[0x1D9452090]();
  uint64_t v22 = self;
  BOOL v23 = HMFGetOSLogHandle();
  v24 = v23;
  if (!v20)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v51 = v37;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Name cannot be empty.", buf, 0xCu);
    }
    v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = 20;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    char v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v51 = v25;
    __int16 v52 = 2112;
    id v53 = v13;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@New Trigger name after trimming invalid characters : %@", buf, 0x16u);
  }
  int v26 = [(HMDTrigger *)v22 name];
  int v27 = [v26 isEqualToString:v13];

  if (v27)
  {
    int v28 = [(HMDTrigger *)v22 configuredName];
    int v29 = [v28 isEqualToString:v9];

    uint64_t v30 = (void *)MEMORY[0x1D9452090]();
    v31 = v22;
    v32 = HMFGetOSLogHandle();
    uint64_t v33 = v32;
    if (v29)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v51 = v34;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot rename the trigger as new trigger name & configured names are same.", buf, 0xCu);
      }
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = 48;
LABEL_16:
      [v35 hmErrorWithCode:v36];
      id v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      long long v45 = HMFGetLogIdentifier();
      long long v46 = [(HMDTrigger *)v31 name];
      long long v47 = [(HMDTrigger *)v31 configuredName];
      *(_DWORD *)buf = 138544130;
      uint64_t v51 = v45;
      __int16 v52 = 2112;
      id v53 = v46;
      __int16 v54 = 2112;
      v55 = v13;
      __int16 v56 = 2112;
      v57 = v47;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Allowing rename request as current name : %@ & strippedName are same : %@ but configuredName [%@] is different", buf, 0x2Au);
    }
    id v19 = v13;
  }
  else
  {
    BOOL v38 = [(HMDTrigger *)v22 name];
    int v39 = [v10 replaceName:v38 withNewName:v13];

    if (v39)
    {
      v40 = (void *)MEMORY[0x1D9452090]();
      v41 = v22;
      int v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        [(HMDTrigger *)v41 name];
        v44 = uint64_t v49 = v40;
        *(_DWORD *)buf = 138544130;
        uint64_t v51 = v43;
        __int16 v52 = 2112;
        id v53 = v44;
        __int16 v54 = 2112;
        v55 = v13;
        __int16 v56 = 2112;
        v57 = v39;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Cannot rename the trigger from %@ to %@ due to %@", buf, 0x2Au);

        v40 = v49;
      }

      id v19 = 0;
      *a5 = v39;
    }
    else
    {
      id v19 = v13;
    }
  }
LABEL_26:

  return v19;
}

- (void)_renameRequest:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 stringForKey:@"kTriggerName"];
  id v6 = v5;
  if (!v5 || ![v5 length])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 20;
LABEL_8:
    id v14 = [v12 hmErrorWithCode:v13];
    [v4 respondWithError:v14];
    goto LABEL_9;
  }
  unint64_t v7 = HMMaxLengthForNaming();
  if ([v6 length] > v7)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 46;
    goto LABEL_8;
  }
  id v14 = [v4 stringForKey:*MEMORY[0x1E4F2E1E0]];
  id v15 = [(HMDTrigger *)self home];
  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = [(HMDTrigger *)v17 name];
      uint64_t v21 = [(HMDTrigger *)v17 configuredName];
      *(_DWORD *)buf = 138544386;
      v35 = v19;
      __int16 v36 = 2112;
      v37 = v20;
      __int16 v38 = 2112;
      int v39 = v6;
      __int16 v40 = 2112;
      v41 = v21;
      __int16 v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Rename request received : [%@, %@] [%@, %@]", buf, 0x34u);
    }
    id v33 = 0;
    uint64_t v22 = [(HMDTrigger *)v17 canRenameTriggerWithNewName:v6 configuredName:v14 error:&v33];
    id v23 = v33;
    if (v23 || !v22)
    {
      [v4 respondWithError:v23];
    }
    else
    {
      v24 = [(HMDTrigger *)v17 emptyModelObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v25 = v24;
      }
      else {
        char v25 = 0;
      }
      id v26 = v25;

      [v26 setName:v22];
      [v26 setConfiguredName:v14];
      int v27 = [v15 backingStore];
      int v28 = [v4 name];
      int v29 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      [v27 transaction:v28 options:v29];
      uint64_t v30 = v32 = v14;

      [v30 add:v26 withMessage:v4];
      [v30 run];

      id v14 = v32;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v4 respondWithError:v31];
  }
LABEL_9:
}

- (void)_handleRenameRequest:(id)a3
{
  uint64_t v4 = [(HMDTrigger *)self updateEventTriggerMessage:8 message:a3 relay:1];
  if (v4) {
    [(HMDTrigger *)self _renameRequest:v4];
  }
  MEMORY[0x1F41817F8]();
}

- (void)_activate:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v7 = [(HMDTrigger *)self actionSets];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) actions];
          v10 += [v13 count];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);

      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:25 userInfo:0];
    v6[2](v6, v14);

    goto LABEL_14;
  }
LABEL_10:
  if (v6) {
    v6[2](v6, 0);
  }
LABEL_14:
}

- (void)markChangedForMessage:(id)a3 triggerModel:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDTrigger *)self home];
  uint64_t v9 = [v6 transactionResult];
  if ([v8 isOwnerUser])
  {
    [v9 markChanged];
  }
  else if ([v8 isAdminUser])
  {
    [v9 markLocalChanged];
  }
  BOOL v10 = [(HMDTrigger *)self modelContainsTriggerFired:v7];
  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  uint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      long long v15 = HMFGetLogIdentifier();
      int v17 = 138543362;
      long long v18 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Not re-activating the trigger after applying the trigger model since it only contains mostRecentFireDate", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    if (v14)
    {
      long long v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      long long v18 = v16;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Activating the trigger after applying the trigger model", (uint8_t *)&v17, 0xCu);
    }
    [(HMDTrigger *)v12 activateWithCompletion:0];
  }
}

- (void)markChangedForMessage:(id)a3
{
}

- (BOOL)modelContainsTriggerFired:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 setProperties];
  if ([v4 count] == 1)
  {
    id v5 = [v3 setProperties];
    char v6 = [v5 containsObject:@"mostRecentFireDate"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)activateAfterResidentChangeWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  char v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    BOOL v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Re-evaluating trigger after resident change", (uint8_t *)&v9, 0xCu);
  }
  [(HMDTrigger *)v6 activateWithCompletion:v4];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))_Block_copy(a3);
  if (v4)
  {
    id v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    v4[2](v4, v3);
  }
}

- (void)activateWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDTrigger *)self isConfigured])
  {
    id v5 = [(HMDTrigger *)self workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__HMDTrigger_activateWithCompletion___block_invoke;
    v10[3] = &unk_1E6A19530;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    char v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Work queue is not configured, cannot activate", buf, 0xCu);
    }
  }
}

uint64_t __37__HMDTrigger_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (BOOL)isConfigured
{
  v2 = [(HMDTrigger *)self workQueue];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldActivateOnLocalDevice
{
  return ![(HMDTrigger *)self hasNoActions];
}

- (BOOL)isOwnedByThisDevice
{
  BOOL v3 = [(HMDTrigger *)self owner];
  if ([v3 isCurrentUser])
  {
    id v4 = [(HMDTrigger *)self owningDevice];
    if (v4)
    {
      id v5 = [(HMDTrigger *)self owningDevice];
      char v6 = [v5 isCurrentDevice];
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating trigger", buf, 0xCu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(HMDTrigger *)v4 actionSets];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HMDTrigger *)v4 removeActionSet:*(void *)(*((void *)&v13 + 1) + 8 * v11++) postUpdate:0];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(HMDTrigger *)v4 removeAllActionSets];
  uint64_t v12 = [(HMDTrigger *)v4 actionSetUUIDs];
  [v12 removeAllObjects];

  [(HMDTrigger *)v4 setMsgDispatcher:0];
}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HMDTrigger *)self home];

  if (v10 != v15)
  {
    [(HMDTrigger *)self setHome:v15];
    uint64_t v11 = [(HMDTrigger *)self owner];
    uint64_t v12 = [v11 uuid];
    long long v13 = [v15 userWithUUID:v12];
    [(HMDTrigger *)self setOwner:v13];
  }
  [(HMDTrigger *)self setMsgDispatcher:v8];
  [(HMDTrigger *)self setWorkQueue:v9];

  [(HMDTrigger *)self _registerForMessages];
  long long v14 = [v15 residentDeviceManager];
  [v14 addDataSource:self];
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(HMDTrigger *)self actionSets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isAssociatedWithAccessory:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_isTriggerFiredNotificationEntitled
{
  return 0;
}

- (void)sendTriggerFiredNotification:(id)a3
{
  id v4 = a3;
  if ([(HMDTrigger *)self _isTriggerFiredNotificationEntitled]) {
    [MEMORY[0x1E4F65480] entitledMessageWithName:@"kTriggerFiredNotificationKey" messagePayload:v4];
  }
  else {
  id v7 = [MEMORY[0x1E4F65480] messageWithName:@"kTriggerFiredNotificationKey" messagePayload:v4];
  }

  id v5 = [(HMDTrigger *)self msgDispatcher];
  uint64_t v6 = [(HMDTrigger *)self uuid];
  [v5 sendMessage:v7 target:v6];
}

- (void)_recentFireDateUpdated:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    -[HMDTrigger setMostRecentFireDate:](self, "setMostRecentFireDate:");
    id v9 = @"kTriggerInfo";
    id v7 = @"kTriggerLastFireDateKey";
    id v4 = [(HMDTrigger *)self mostRecentFireDate];
    id v8 = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    v10[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

    [(HMDTrigger *)self sendTriggerFiredNotification:v6];
  }
}

- (void)triggerFired
{
  BOOL v3 = [(HMDTrigger *)self emptyModelObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setMostRecentFireDate:v6];

  id v7 = [(HMDTrigger *)self home];
  id v8 = [v7 backingStore];
  id v9 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
  id v10 = [v8 transaction:@"kTriggerFiredNotificationKey" options:v9];

  [v10 add:v5 withMessage:0];
  [v10 run];
}

- (void)reEvaluate:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(HMDTrigger *)self isConfigured])
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      long long v13 = v10;
      long long v11 = "%{public}@Cannot re-evaluate trigger, work queue has not been configured yet";
LABEL_12:
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v12, 0xCu);
    }
LABEL_13:

    return;
  }
  id v5 = [(HMDTrigger *)self home];
  char v6 = [v5 isOwnerUser];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      long long v13 = v10;
      long long v11 = "%{public}@Cannot re-evaluate trigger, not a owner user";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    [(HMDTrigger *)self _forceEvaluate];
  }
  else if (!a3)
  {
    [(HMDTrigger *)self _checkForNoActions];
  }
}

- (void)removeActionSet:(id)a3 postUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDTrigger *)self home];
  char v8 = [v7 isOwnerUser];

  if (v8)
  {
    id v9 = [(HMDTrigger *)self actionSets];
    int v10 = [v9 containsObject:v6];

    if (v10)
    {
      long long v11 = (void *)MEMORY[0x1D9452090]();
      int v12 = self;
      long long v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v28 = v14;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Action set %@ has been removed from home, cleaning the trigger", buf, 0x16u);
      }
      uint64_t v15 = (void *)MEMORY[0x1E4F654B0];
      v26[0] = MEMORY[0x1E4F1CC28];
      long long v16 = objc_msgSend(v6, "uuid", @"kTriggerAddActionSetKey", @"kTriggerActionSetUUIDKey");
      int v17 = [v16 UUIDString];
      v26[1] = v17;
      v25[2] = @"kTriggerActionSetTypeKey";
      long long v18 = [v6 type];
      v26[2] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
      uint64_t v20 = [v15 messageWithName:@"kUpdateActionSetTriggerRequestKey" messagePayload:v19];

      [v20 setRemote:1];
      [(HMDTrigger *)v12 _updateActionSetRequest:v20 postUpdate:v4];
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    uint64_t v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v28 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Not the owner of this home, cannot clean up the action set reference", buf, 0xCu);
    }
  }
}

- (void)_forceEvaluate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(HMDTrigger *)self active])
  {
    BOOL v3 = (void *)MEMORY[0x1D9452090]();
    BOOL v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      char v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Trigger is active. Hence force evaluating", (uint8_t *)&v7, 0xCu);
    }
    [(HMDTrigger *)v4 _activateWithCompletion:0];
  }
}

- (void)_checkForNoActions
{
}

- (BOOL)hasNoActions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(HMDTrigger *)self actionSets];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) actions];
        uint64_t v8 = [v7 count];

        if (v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)setEnabled:(BOOL)a3 message:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int v7 = [(HMDTrigger *)self emptyModelObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  int v10 = [NSNumber numberWithBool:v4];
  [v9 setActive:v10];

  long long v11 = [(HMDTrigger *)self home];
  long long v12 = [v11 backingStore];
  long long v13 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  id v14 = [v12 transaction:@"setEnabled" options:v13];

  [v14 add:v9 withMessage:v6];
  [v14 run];
}

- (BOOL)compatible:(id)a3 user:(id)a4
{
  return 0;
}

- (BOOL)requiresDataVersion4
{
  return 0;
}

- (NSArray)actionSets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = [(HMDTrigger *)self actionSetMappings];
  uint64_t v5 = [v4 allValues];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (id)actionSetMapKeys
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = [(HMDTrigger *)self actionSetMappings];
  uint64_t v5 = [v4 allKeys];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)removeAllActionSets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = [(HMDTrigger *)self actionSetMappings];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeActionSetForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v6 = [(HMDTrigger *)self actionSetMappings];
    [v6 removeObjectForKey:v7];

    os_unfair_lock_unlock(p_lock);
    id v4 = v7;
  }
}

- (id)actionSetForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v6 = [(HMDTrigger *)self actionSetMappings];
    id v7 = [v6 objectForKey:v4];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setActionSetForKey:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 && v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    uint64_t v8 = [(HMDTrigger *)self actionSetMappings];
    [v8 setObject:v6 forKey:v9];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setConfiguredName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)configuredName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_configuredName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

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

- (unint64_t)triggerType
{
  return 0;
}

- (id)dumpState
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v34 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  __int16 v36 = NSString;
  uint64_t v3 = [(HMDTrigger *)self name];
  id v4 = [(HMDTrigger *)self configuredName];
  uint64_t v5 = [(HMDTrigger *)self uuid];
  id v6 = [v5 UUIDString];
  [(HMDTrigger *)self active];
  id v7 = HMFBooleanToString();
  [(HMDTrigger *)self shouldActivateOnLocalDevice];
  uint64_t v8 = HMFBooleanToString();
  id v9 = [(HMDTrigger *)self mostRecentFireDate];
  int v10 = [(HMDTrigger *)self policy];
  uint64_t v11 = [v36 stringWithFormat:@"name: %@, configuredName: %@, uuid: %@, enabled: %@, activeOnLocalDevice: %@, lastFireDate: %@, Policy: %@", v3, v4, v6, v7, v8, v9, v10];

  long long v12 = v34;
  id v33 = (void *)v11;
  [v34 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F64EA0]];
  long long v13 = [(HMDTrigger *)self actionSets];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v16 = [(HMDTrigger *)self actionSets];
    v37 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = [(HMDTrigger *)self actionSets];
    uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      uint64_t v20 = *MEMORY[0x1E4F2C950];
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v23 = [v22 type];
          int v24 = [v23 isEqualToString:v20];

          if (v24)
          {
            char v25 = [v22 dumpState];
            [v37 addObject:v25];
          }
          else
          {
            id v26 = NSString;
            char v25 = [v22 name];
            int v27 = [v22 type];
            int v28 = [v22 uuid];
            __int16 v29 = [v28 UUIDString];
            id v30 = [v22 actions];
            uint64_t v31 = [v26 stringWithFormat:@"name: %@, type: %@, uuid: %@, numActions: %ld", v25, v27, v29, objc_msgSend(v30, "count")];
            [v37 addObject:v31];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v18);
    }

    long long v12 = v34;
    [v34 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F64D78]];
  }
  return v12;
}

- (id)attributeDescriptions
{
  v35[9] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v34 = [(HMDTrigger *)self name];
  id v33 = (void *)[v3 initWithName:@"NM" value:v34];
  v35[0] = v33;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v32 = [(HMDTrigger *)self configuredName];
  uint64_t v31 = (void *)[v4 initWithName:@"CN" value:v32];
  v35[1] = v31;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v30 = [(HMDTrigger *)self uuid];
  __int16 v29 = (void *)[v5 initWithName:@"UUID" value:v30];
  v35[2] = v29;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDTrigger *)self active];
  int v28 = HMFBooleanToString();
  int v27 = (void *)[v6 initWithName:@"ACT" value:v28];
  v35[3] = v27;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDTrigger *)self shouldActivateOnLocalDevice];
  id v26 = HMFBooleanToString();
  char v25 = (void *)[v7 initWithName:@"AOLD" value:v26];
  v35[4] = v25;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v24 = [(HMDTrigger *)self owningDevice];
  id v9 = [v24 identifier];
  int v10 = (void *)[v8 initWithName:@"DE" value:v9];
  v35[5] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  long long v12 = [(HMDTrigger *)self owner];
  long long v13 = [v12 userID];
  uint64_t v14 = [MEMORY[0x1E4F65538] defaultFormatter];
  uint64_t v15 = (void *)[v11 initWithName:@"USR" value:v13 options:2 formatter:v14];
  v35[6] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v17 = [(HMDTrigger *)self actionSets];
  uint64_t v18 = (void *)[v16 initWithName:@"AS" value:v17];
  v35[7] = v18;
  id v19 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v20 = [(HMDTrigger *)self policy];
  uint64_t v21 = (void *)[v19 initWithName:@"PO" value:v20];
  v35[8] = v21;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:9];

  return v23;
}

- (void)dealloc
{
  id v3 = [(HMDTrigger *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDTrigger;
  [(HMDTrigger *)&v4 dealloc];
}

- (id)logIdentifier
{
  if (isInternalBuild())
  {
    id v3 = NSString;
    objc_super v4 = [(HMDTrigger *)self name];
    id v5 = [(HMDTrigger *)self uuid];
    id v6 = [v5 UUIDString];
    id v7 = [v3 stringWithFormat:@"%@/%@", v4, v6];
  }
  else
  {
    objc_super v4 = [(HMDTrigger *)self uuid];
    id v7 = [v4 UUIDString];
  }

  return v7;
}

- (HMDTrigger)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 name];
  id v9 = [v6 uuid];
  int v10 = [(HMDTrigger *)self initWithName:v8 uuid:v9];

  if (v10)
  {
    objc_storeWeak((id *)&v10->_home, v7);
    id v11 = [v6 configuredName];
    uint64_t v12 = objc_msgSend(v11, "hm_truncatedNameString");
    configuredName = v10->_configuredName;
    v10->_configuredName = (NSString *)v12;

    uint64_t v14 = [v6 active];
    v10->_active = [v14 BOOLValue];

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    actionSetMappings = v10->_actionSetMappings;
    v10->_actionSetMappings = (NSMutableDictionary *)v15;

    uint64_t v17 = [v6 mostRecentFireDate];
    mostRecentFireDate = v10->_mostRecentFireDate;
    v10->_mostRecentFireDate = (NSDate *)v17;

    id v19 = [v6 owner];
    uint64_t v20 = [v19 uuid];

    if (v20)
    {
      uint64_t v21 = [v6 owner];
      uint64_t v22 = [v21 uuid];
      uint64_t v23 = [v7 userWithUUID:v22];
      owner = v10->_owner;
      v10->_owner = (HMDUser *)v23;
    }
    uint64_t v25 = [v6 owningDevice];
    owningDevice = v10->_owningDevice;
    v10->_owningDevice = (HMDDevice *)v25;

    int v27 = [v6 autoDelete];
    int v28 = [v27 BOOLValue];
    if (v28) {
      __int16 v29 = objc_alloc_init(HMDTriggerDeleteAfterExecutionPolicy);
    }
    else {
      __int16 v29 = 0;
    }
    objc_storeStrong((id *)&v10->_policy, v29);
    if (v28) {

    }
    [(HMDTrigger *)v10 _actionSetsUpdated:v6 message:0];
  }

  return v10;
}

- (HMDTrigger)initWithName:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDTrigger;
    int v10 = [(HMDTrigger *)&v19 init];
    if (v10)
    {
      id v11 = objc_msgSend(v6, "hm_truncatedNameString");
      uint64_t v12 = [v11 copy];
      name = v10->_name;
      v10->_name = (NSString *)v12;

      objc_storeStrong((id *)&v10->_uuid, a4);
      v10->_active = 0;
      uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
      actionSetUUIDs = v10->_actionSetUUIDs;
      v10->_actionSetUUIDs = (NSMutableArray *)v14;

      uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
      actionSetMappings = v10->_actionSetMappings;
      v10->_actionSetMappings = (NSMutableDictionary *)v16;

      v10->_lock._os_unfair_lock_opaque = 0;
    }
    self = v10;
    id v9 = self;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_670 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_670, &__block_literal_global_671);
  }
  v2 = (void *)logCategory__hmf_once_v1_672;
  return v2;
}

uint64_t __25__HMDTrigger_logCategory__block_invoke()
{
  logCategory__hmf_once_v1_672 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

- (NSDictionary)bulletinContext
{
  v18[7] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDTrigger *)self home];
  v17[0] = @"home";
  uint64_t v16 = [v3 contextID];
  v18[0] = v16;
  v17[1] = @"trigger";
  uint64_t v15 = [(HMDTrigger *)self contextID];
  v18[1] = v15;
  v17[2] = *MEMORY[0x1E4F2CA98];
  uint64_t v14 = [v3 contextSPIUniqueIdentifier];
  objc_super v4 = [v14 UUIDString];
  v18[2] = v4;
  v17[3] = *MEMORY[0x1E4F2CAB8];
  id v5 = [(HMDTrigger *)self contextSPIUniqueIdentifier];
  id v6 = [v5 UUIDString];
  v18[3] = v6;
  v17[4] = *MEMORY[0x1E4F2CAC0];
  id v7 = [(HMDTrigger *)self name];
  v18[4] = v7;
  v17[5] = @"home.uuid.internal";
  id v8 = [v3 uuid];
  id v9 = [v8 UUIDString];
  v18[5] = v9;
  v17[6] = @"trigger.uuid.internal";
  int v10 = [(HMDTrigger *)self uuid];
  id v11 = [v10 UUIDString];
  v18[6] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];

  return (NSDictionary *)v12;
}

- (NSDictionary)actionContext
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"itemType";
  v15[1] = @"identifier";
  v16[0] = @"TRIGGER";
  v16[1] = @"trigger_execute";
  v15[2] = @"title";
  v2 = HMDLocalizedStringForKey(@"CONFIRM_EXECUTE_SECURE_TRIGGER_ACTION_YES");
  v15[3] = @"shouldDismiss";
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  v16[2] = v2;
  v16[3] = MEMORY[0x1E4F1CC38];
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  v13[0] = @"itemType";
  v13[1] = @"identifier";
  v14[0] = @"TRIGGER";
  v14[1] = @"trigger_doNotExecute";
  v13[2] = @"title";
  id v5 = HMDLocalizedStringForKey(@"CONFIRM_EXECUTE_SECURE_TRIGGER_ACTION_NO");
  v13[3] = @"shouldDismiss";
  v14[2] = v5;
  v14[3] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  v10[1] = v6;
  v11[0] = @"buttonCategory";
  v11[1] = @"bulletinActionButtonDescription";
  v12[0] = &unk_1F2DC7180;
  v10[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v12[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return (NSDictionary *)v8;
}

- (NSString)contextID
{
  v2 = [(HMDTrigger *)self uuid];
  uint64_t v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (NSString)urlString
{
  v2 = [(HMDTrigger *)self uuid];
  uint64_t v3 = hm_assistantIdentifier();

  return (NSString *)v3;
}

@end