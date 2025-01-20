@interface HMDActionSet
+ (BOOL)supportsSecureCoding;
+ (id)allowedActionClasses;
+ (id)logCategory;
- (BOOL)_fixUpActions;
- (BOOL)_handleRenameActionSetTransaction:(id)a3 message:(id)a4;
- (BOOL)_isValidCharacteristicWriteAction:(id)a3;
- (BOOL)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5;
- (BOOL)containsMediaPlaybackActions;
- (BOOL)containsSecureCharacteristic;
- (BOOL)containsShortcutActions;
- (BOOL)containsUnsecuringAction;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (HMDActionSet)initWithCoder:(id)a3;
- (HMDActionSet)initWithName:(id)a3 uuid:(id)a4 type:(id)a5 home:(id)a6 queue:(id)a7;
- (HMDActionSet)initWithName:(id)a3 uuid:(id)a4 type:(id)a5 home:(id)a6 queue:(id)a7 notificationCenter:(id)a8;
- (HMDActionSetEvent)executionActionSetEvent;
- (HMDApplicationData)appData;
- (HMDHome)home;
- (HMFMessage)executionMessage;
- (HMFMessageDispatcher)msgDispatcher;
- (HMFTimer)executionTimeoutTimer;
- (NSArray)actions;
- (NSArray)associatedAccessories;
- (NSDate)executionStart;
- (NSDate)lastExecutionDate;
- (NSDictionary)assistantObject;
- (NSDictionary)executionInitialStates;
- (NSNotificationCenter)notificationCenter;
- (NSString)description;
- (NSString)name;
- (NSString)serializedIdentifier;
- (NSString)type;
- (NSString)urlString;
- (NSUUID)spiClientIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_addAppleMediaAccessoryPowerActionModelWithUUID:(id)a3 message:(id)a4;
- (id)_addCharacteristicWriteActionModelWithUUID:(id)a3 message:(id)a4;
- (id)_addLightProfileNaturalLightingModelWithUUID:(id)a3 message:(id)a4;
- (id)_addMediaPlaybackActionModelWithUUID:(id)a3 message:(id)a4;
- (id)_createActionExecutionLogEvent:(id)a3;
- (id)_executeAppleMediaAccessoryPowerActions:(id)a3 message:(id)a4;
- (id)_executeCharacteristicWriteRequests:(id)a3 message:(id)a4;
- (id)_executeCommandActions:(id)a3 message:(id)a4;
- (id)_executeGenericActions:(id)a3 message:(id)a4;
- (id)_executeMediaPlaybackActions:(id)a3 message:(id)a4;
- (id)_executeNaturalLightingActions:(id)a3 writeRequests:(id)a4 message:(id)a5;
- (id)_executeNaturalLightingActionsForMatter:(id)a3;
- (id)_executeNaturalLightingWriteRequests:(id)a3 message:(id)a4 naturalLightingActions:(id)a5 naturalLightingActionResultByActionUUID:(id)a6;
- (id)_generateOverallError:(id)a3 forSource:(unint64_t)a4;
- (id)_getActionsForActionSetObject;
- (id)_initWithCoder:(id)a3;
- (id)actionWithUUID:(id)a3;
- (id)backingStoreObjects:(int64_t)a3;
- (id)createPayload;
- (id)dumpState;
- (id)logIdentifier;
- (id)messageDestination;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (uint64_t)_updateActionSetFromDictionary:(void *)a3 transaction:(void *)a4 response:(void *)a5 error:;
- (void)__handleActionsUpdated;
- (void)_encodeWithCoder:(id)a3;
- (void)_execute:(id)a3 activity:(id)a4;
- (void)_execute:(id)a3 captureCurrentState:(BOOL)a4 writeRequestTuples:(id)a5;
- (void)_executeAppleMediaAccessoryPowerActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6;
- (void)_executeCommandActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6;
- (void)_executeGenericActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6;
- (void)_executeMediaPlaybackActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6;
- (void)_handleAddActionRequest:(id)a3;
- (void)_handleAddAppleMediaAccessoryPowerActionTransaction:(id)a3 message:(id)a4;
- (void)_handleAddCharacteristicWriteActionTransaction:(id)a3 message:(id)a4;
- (void)_handleAddCommandActionTransaction:(id)a3 message:(id)a4;
- (void)_handleAddLightProfileNaturalLightingActionTransaction:(id)a3 message:(id)a4;
- (void)_handleAddMediaPlaybackActionTransaction:(id)a3 message:(id)a4;
- (void)_handleAddNewAction:(id)a3 message:(id)a4;
- (void)_handleAddShortcutActionTransaction:(id)a3 message:(id)a4;
- (void)_handleRemovalOfAction:(id)a3 transaction:(id)a4;
- (void)_handleRemovalOfActions:(id)a3 transaction:(id)a4;
- (void)_handleRemoveActionRequest:(id)a3;
- (void)_handleRemoveActionTransaction:(id)a3 message:(id)a4;
- (void)_handleRemoveAppDataModel:(id)a3 message:(id)a4;
- (void)_handleRenameRequest:(id)a3;
- (void)_handleUpdateActionRequest:(id)a3;
- (void)_handleUpdateActionSet:(id)a3;
- (void)_handleUpdateActionSetFromBuilder:(id)a3;
- (void)_handleUpdateAppDataModel:(id)a3 message:(id)a4;
- (void)_issueReadRequests;
- (void)_issueWriteRequests:(id)a3;
- (void)_processActionSetModelUpdated:(id)a3 message:(id)a4;
- (void)_registerForMessages;
- (void)_removeAction:(id)a3 message:(id)a4;
- (void)_removeDonatedIntent;
- (void)_updateAppleMediaAccessoryPowerAction:(id)a3 forMessage:(id)a4;
- (void)_updateNaturalLightingAction:(id)a3 forMessage:(id)a4;
- (void)_updatePlaybackAction:(id)a3 forMessage:(id)a4;
- (void)_updateWriteAction:(id)a3 forMessage:(id)a4;
- (void)addAction:(id)a3;
- (void)auditActionsForAccessory:(id)a3 transaction:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)execute:(id)a3;
- (void)executeWithTriggerSource:(id)a3 captureCurrentState:(BOOL)a4 completionHandler:(id)a5;
- (void)handleExecutionCompletionWithResponsePayload:(id)a3 error:(id)a4;
- (void)handleRemovalOfAccessory:(id)a3 transaction:(id)a4;
- (void)handleRemovalOfService:(id)a3 transaction:(id)a4;
- (void)invalidate;
- (void)isAccessValidForExecutionWithMessage:(id)a3 completion:(id)a4;
- (void)removeAction:(id)a3;
- (void)removeAllActions;
- (void)sendNotificationWithAction:(id)a3 message:(id)a4;
- (void)setActions:(id)a3;
- (void)setAppData:(id)a3;
- (void)setExecutionActionSetEvent:(id)a3;
- (void)setExecutionInitialStates:(id)a3;
- (void)setExecutionMessage:(id)a3;
- (void)setExecutionStart:(id)a3;
- (void)setExecutionTimeoutTimer:(id)a3;
- (void)setHome:(id)a3;
- (void)setLastExecutionDate:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDActionSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_executionActionSetEvent, 0);
  objc_storeStrong((id *)&self->_executionInitialStates, 0);
  objc_storeStrong((id *)&self->_executionMessage, 0);
  objc_storeStrong((id *)&self->_executionStart, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_executionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_lastExecutionDate, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_spiClientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_currentActions, 0);
}

- (void)setAppData:(id)a3
{
}

- (HMDApplicationData)appData
{
  return self->_appData;
}

- (void)setExecutionActionSetEvent:(id)a3
{
}

- (HMDActionSetEvent)executionActionSetEvent
{
  return self->_executionActionSetEvent;
}

- (void)setExecutionInitialStates:(id)a3
{
}

- (NSDictionary)executionInitialStates
{
  return self->_executionInitialStates;
}

- (void)setExecutionMessage:(id)a3
{
}

- (HMFMessage)executionMessage
{
  return self->_executionMessage;
}

- (void)setExecutionStart:(id)a3
{
}

- (NSDate)executionStart
{
  return self->_executionStart;
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

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExecutionTimeoutTimer:(id)a3
{
}

- (HMFTimer)executionTimeoutTimer
{
  return self->_executionTimeoutTimer;
}

- (void)setLastExecutionDate:(id)a3
{
}

- (NSDate)lastExecutionDate
{
  return self->_lastExecutionDate;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (id)logIdentifier
{
  if (isInternalBuild())
  {
    v3 = NSString;
    v4 = [(HMDActionSet *)self name];
    v5 = [(HMDActionSet *)self uuid];
    v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];
  }
  else
  {
    v4 = [(HMDActionSet *)self uuid];
    v6 = [v4 UUIDString];
  }

  return v6;
}

- (id)backingStoreObjects:(int64_t)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x230FBD990](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v40 = v8;
    __int16 v41 = 2048;
    int64_t v42 = a3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating backing store objects for version: %ld", buf, 0x16u);
  }
  int64_t v32 = a3;

  v9 = [MEMORY[0x263EFF980] array];
  v10 = [(HMDActionSet *)v6 modelObjectWithChangeType:1];
  [v9 addObject:v10];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v11 = [(HMDActionSet *)v6 actions];
  uint64_t v34 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v34)
  {
    uint64_t v12 = *(void *)v36;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v11);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        unint64_t v15 = [v14 type];
        if (v15 <= 5)
        {
          if (v15 == 2)
          {
            v17 = [(HMDActionSet *)v6 home];
            v18 = [(HMDActionSet *)v6 uuid];
            v19 = [v17 triggerOwnedActionSetWithUUID:v18];

            [v19 addAction:v14];
            v16 = [v14 modelObjectWithChangeType:1];

            if (v16)
            {
LABEL_11:
              [v9 addObject:v16];

              continue;
            }
          }
          else
          {
            v16 = [v14 modelObjectWithChangeType:1];
            if (v16) {
              goto LABEL_11;
            }
          }
        }
        v20 = (void *)MEMORY[0x230FBD990]();
        v21 = v6;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = v11;
          v24 = v9;
          v26 = v25 = v6;
          v27 = HMActionTypeAsString();
          *(_DWORD *)buf = 138543874;
          v40 = v26;
          __int16 v41 = 2112;
          int64_t v42 = (int64_t)v14;
          __int16 v43 = 2112;
          v44 = v27;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Did not create backing store object for action %@:%@", buf, 0x20u);

          v6 = v25;
          v9 = v24;
          v11 = v23;
          uint64_t v12 = v33;
        }
      }
      uint64_t v34 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v34);
  }

  v28 = [(HMDActionSet *)v6 appData];

  if (v32 >= 3 && v28)
  {
    v29 = [(HMDActionSet *)v6 appData];
    v30 = [v29 modelObjectWithChangeType:1];
    [v9 addObject:v30];
  }
  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDActionSetModel alloc];
  v6 = [(HMDActionSet *)self uuid];
  v7 = [(HMDActionSet *)self home];
  v8 = [v7 uuid];
  v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  v10 = [(HMDActionSet *)self name];
  [(HMDActionSetModel *)v9 setName:v10];

  v11 = [(HMDActionSet *)self type];
  [(HMDActionSetModel *)v9 setType:v11];

  uint64_t v12 = [(HMDActionSet *)self lastExecutionDate];

  if (v12)
  {
    v13 = [(HMDActionSet *)self lastExecutionDate];
    [(HMDActionSetModel *)v9 setLastExecutionDate:v13];
  }
  return v9;
}

- (void)_processActionSetModelUpdated:(id)a3 message:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = [v6 transactionResult];
  v8 = [v16 name];

  if (v8)
  {
    BOOL v9 = [(HMDActionSet *)self _handleRenameActionSetTransaction:v16 message:v6];
    [v7 markSaveToAssistant];
  }
  else
  {
    BOOL v9 = 1;
  }
  uint64_t v10 = [v16 lastExecutionDate];
  if (v10)
  {
    v11 = (void *)v10;
    uint64_t v12 = [(HMDActionSet *)self lastExecutionDate];
    v13 = [v16 lastExecutionDate];
    uint64_t v14 = [v12 compare:v13];

    if (v14 == -1)
    {
      unint64_t v15 = [v16 lastExecutionDate];
      [(HMDActionSet *)self setLastExecutionDate:v15];
    }
  }
  [v7 markChanged];
  if (!v9) {
    [v6 respondWithPayload:0];
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v9;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  if (v12)
  {
    [(HMDActionSet *)self _processActionSetModelUpdated:v12 message:v10];
    id v13 = v9;
    goto LABEL_37;
  }
  id v13 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    id v16 = [v15 uuid];
    v17 = [(HMDActionSet *)self actionWithUUID:v16];

    if (!v17)
    {
      [(HMDActionSet *)self _handleAddCharacteristicWriteActionTransaction:v15 message:v10];
LABEL_36:

      goto LABEL_37;
    }
    goto LABEL_35;
  }
  id v13 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v13;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    v20 = [v19 uuid];
    v17 = [(HMDActionSet *)self actionWithUUID:v20];

    if (!v17)
    {
      [(HMDActionSet *)self _handleAddMediaPlaybackActionTransaction:v19 message:v10];
      goto LABEL_36;
    }
LABEL_35:
    [v17 transactionObjectUpdated:v8 newValues:v13 message:v10];
    goto LABEL_36;
  }
  id v13 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v21 = v13;
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  if (v22)
  {
    v23 = [v22 uuid];
    v17 = [(HMDActionSet *)self actionWithUUID:v23];

    if (!v17)
    {
      [(HMDActionSet *)self _handleAddShortcutActionTransaction:v22 message:v10];
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  id v13 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v13;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  if (v25)
  {
    v26 = [v25 uuid];
    v17 = [(HMDActionSet *)self actionWithUUID:v26];

    if (!v17)
    {
      [(HMDActionSet *)self _handleAddLightProfileNaturalLightingActionTransaction:v25 message:v10];
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  id v13 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v27 = v13;
  }
  else {
    v27 = 0;
  }
  id v28 = v27;

  if (v28)
  {
    v29 = [v28 uuid];
    v17 = [(HMDActionSet *)self actionWithUUID:v29];

    if (!v17)
    {
      [(HMDActionSet *)self _handleAddAppleMediaAccessoryPowerActionTransaction:v28 message:v10];
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  id v13 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v30 = v13;
  }
  else {
    v30 = 0;
  }
  id v31 = v30;

  if (v31)
  {
    int64_t v32 = +[HMDCoreData featuresDataSource];
    int v33 = [v32 isRVCEnabled];

    if (v33)
    {
      uint64_t v34 = [v31 uuid];
      v17 = [(HMDActionSet *)self actionWithUUID:v34];

      if (!v17)
      {
        [(HMDActionSet *)self _handleAddCommandActionTransaction:v31 message:v10];
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  id v13 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v35 = v13;
  }
  else {
    long long v35 = 0;
  }
  id v36 = v35;

  if (v36)
  {
    long long v37 = [v36 uuid];
    long long v38 = [(HMDActionSet *)self actionWithUUID:v37];

    if (v38)
    {
      [v38 transactionObjectUpdated:v8 newValues:v13 message:v10];
    }
    else
    {
      id v55 = 0;
      char v41 = __HMDActionSetAddActionWithModel(self, v36, v10, &v55);
      id v42 = v55;
      if ((v41 & 1) == 0)
      {
        __int16 v43 = (void *)MEMORY[0x230FBD990]();
        v44 = self;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          uint64_t v46 = v54 = v43;
          *(_DWORD *)buf = 138543874;
          v57 = v46;
          __int16 v58 = 2112;
          id v59 = v36;
          __int16 v60 = 2112;
          id v61 = v42;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to process model, %@, with error: %@", buf, 0x20u);

          __int16 v43 = v54;
        }

        v47 = [v10 responseHandler];

        if (v47)
        {
          v48 = [v10 responseHandler];
          ((void (**)(void, id, void))v48)[2](v48, v42, 0);
        }
      }
    }
  }
  else
  {
    id v13 = v13;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v39 = v13;
    }
    else {
      v39 = 0;
    }
    id v40 = v39;

    if (v40)
    {
      [(HMDActionSet *)self _handleUpdateAppDataModel:v40 message:v10];
    }
    else
    {
      v49 = (void *)MEMORY[0x230FBD990]();
      v50 = self;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v57 = v52;
        __int16 v58 = 2112;
        id v59 = v13;
        __int16 v60 = 2112;
        id v61 = (id)objc_opt_class();
        id v53 = v61;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);
      }
      id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v10 respondWithError:v13];
    }
  }
LABEL_37:
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (v9)
  {
    [(HMDActionSet *)self _handleRemoveActionTransaction:v9 message:v7];
    id v10 = v6;
  }
  else
  {
    id v10 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      [(HMDActionSet *)self _handleRemoveAppDataModel:v12 message:v7];
    }
    else
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        int v18 = 138543874;
        id v19 = v16;
        __int16 v20 = 2112;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = (id)objc_opt_class();
        id v17 = v23;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v18, 0x20u);
      }
      id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v7 respondWithError:v10];
    }
  }
}

- (void)_executeGenericActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v22 = a5;
  id v11 = a6;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__30540;
  v41[4] = __Block_byref_object_dispose__30541;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__30540;
  v39[4] = __Block_byref_object_dispose__30541;
  id v40 = [MEMORY[0x263EFF9A0] dictionary];
  id v12 = [(HMDActionSet *)self workQueue];
  id v13 = dispatch_group_create();
  __int16 v20 = self;
  objc_initWeak(&location, self);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        dispatch_group_enter(v13);
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke;
        v27[3] = &unk_264A18A98;
        id v28 = v12;
        objc_copyWeak(&v33, &location);
        v29 = v17;
        id v31 = v41;
        int64_t v32 = v39;
        v30 = v13;
        [v17 executeWithSource:a4 clientName:v22 completionHandler:v27];

        objc_destroyWeak(&v33);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v14);
  }

  int v18 = [(HMDActionSet *)v20 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke_189;
  block[3] = &unk_264A2A4E0;
  id v24 = v11;
  id v25 = v41;
  v26 = v39;
  id v19 = v11;
  dispatch_group_notify(v13, v18, block);

  objc_destroyWeak(&location);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
}

void __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke_2;
  block[3] = &unk_264A18A70;
  objc_copyWeak(&v14, (id *)(a1 + 72));
  uint64_t v5 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  uint64_t v13 = *(void *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v8;
  long long v12 = v8;
  id v7 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v14);
}

void __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke_189(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(a1 + 32));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void, void))v2 + 2))(v2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    v2 = v3;
  }
}

void __75__HMDActionSet__executeGenericActions_source_clientName_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = WeakRetained;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      long long v8 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v17 = 138543874;
      int v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Action execution failed with error: %@ / %@", (uint8_t *)&v17, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v17 = 138543618;
      int v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Action execution finished with success: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  uint64_t v13 = objc_msgSend(NSDictionary, "hmd_dictionaryWithActionExecutionError:", *(void *)(a1 + 32));
  id v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v15 = [*(id *)(a1 + 40) uuid];
  id v16 = [v15 UUIDString];
  [v14 setObject:v13 forKeyedSubscript:v16];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_executeAppleMediaAccessoryPowerActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v26 = a5;
  id v24 = a6;
  id v12 = objc_alloc(MEMORY[0x263F424F0]);
  uint64_t v13 = NSString;
  id v14 = MEMORY[0x230FBBCF0](self, a2);
  uint64_t v15 = [v13 stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 3372];
  id v47 = (id)[v12 initWithName:v15];

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__30540;
  v45[4] = __Block_byref_object_dispose__30541;
  id v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__30540;
  v43[4] = __Block_byref_object_dispose__30541;
  id v44 = [MEMORY[0x263EFF9A0] dictionary];
  id v16 = dispatch_group_create();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v11;
  uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v40;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * v19);
        objc_initWeak(&location, self);
        dispatch_group_enter(v16);
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __92__HMDActionSet__executeAppleMediaAccessoryPowerActions_source_clientName_completionHandler___block_invoke;
        v31[3] = &unk_264A18A98;
        objc_copyWeak(&v37, &location);
        id v21 = v47;
        long long v35 = v45;
        long long v36 = v43;
        id v32 = v21;
        id v33 = v20;
        long long v34 = v16;
        [v20 executeWithSource:a4 clientName:v26 completionHandler:v31];

        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v17);
  }

  uint64_t v22 = [(HMDActionSet *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__HMDActionSet__executeAppleMediaAccessoryPowerActions_source_clientName_completionHandler___block_invoke_188;
  block[3] = &unk_264A2A4E0;
  id v28 = v24;
  v29 = v45;
  v30 = v43;
  id v23 = v24;
  dispatch_group_notify(v16, v22, block);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  __HMFActivityScopeLeave();
}

void __92__HMDActionSet__executeAppleMediaAccessoryPowerActions_source_clientName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = WeakRetained;
  long long v8 = HMFGetOSLogHandle();
  uint64_t v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 32) identifier];
      id v12 = [v11 shortDescription];
      int v20 = 138543874;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] ATV Power action failed with error: %@ ", (uint8_t *)&v20, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 32) identifier];
      uint64_t v15 = [v14 shortDescription];
      int v20 = 138543618;
      id v21 = v13;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] ATV Power action finished with success", (uint8_t *)&v20, 0x16u);
    }
  }
  id v16 = objc_msgSend(NSDictionary, "hmd_dictionaryWithActionExecutionError:", v4);
  uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v18 = [*(id *)(a1 + 40) uuid];
  uint64_t v19 = [v18 UUIDString];
  [v17 setObject:v16 forKeyedSubscript:v19];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __92__HMDActionSet__executeAppleMediaAccessoryPowerActions_source_clientName_completionHandler___block_invoke_188(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_executeCommandActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v27 = a5;
  id v24 = a6;
  id v11 = objc_alloc(MEMORY[0x263F424F0]);
  id v12 = NSString;
  uint64_t v13 = MEMORY[0x230FBBCF0](self, a2);
  id v14 = [v12 stringWithFormat:@"%@, %s:%ld", v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 3334];
  id v48 = (id)[v11 initWithName:v14];

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__30540;
  v46[4] = __Block_byref_object_dispose__30541;
  id v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__30540;
  v44[4] = __Block_byref_object_dispose__30541;
  id v45 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v15 = [(HMDActionSet *)self workQueue];
  id v16 = dispatch_group_create();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v10;
  uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(obj);
        }
        int v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        dispatch_group_enter(v16);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __75__HMDActionSet__executeCommandActions_source_clientName_completionHandler___block_invoke;
        v32[3] = &unk_264A18A48;
        id v33 = v15;
        long long v34 = self;
        id v21 = v48;
        long long v38 = v46;
        long long v39 = v44;
        id v35 = v21;
        long long v36 = v20;
        id v37 = v16;
        [v20 executeWithSource:a4 clientName:v27 completionHandler:v32];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v17);
  }

  __int16 v22 = [(HMDActionSet *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMDActionSet__executeCommandActions_source_clientName_completionHandler___block_invoke_187;
  block[3] = &unk_264A2A4E0;
  id v29 = v24;
  v30 = v46;
  id v31 = v44;
  id v23 = v24;
  dispatch_group_notify(v16, v22, block);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);

  __HMFActivityScopeLeave();
}

void __75__HMDActionSet__executeCommandActions_source_clientName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMDActionSet__executeCommandActions_source_clientName_completionHandler___block_invoke_2;
  block[3] = &unk_264A29EF8;
  id v5 = *(NSObject **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v13 = v3;
  uint64_t v14 = v4;
  id v7 = v6;
  uint64_t v18 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 56);
  id v15 = v7;
  uint64_t v16 = v8;
  long long v11 = *(_OWORD *)(a1 + 64);
  id v9 = (id)v11;
  long long v17 = v11;
  id v10 = v3;
  dispatch_async(v5, block);
}

uint64_t __75__HMDActionSet__executeCommandActions_source_clientName_completionHandler___block_invoke_187(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __75__HMDActionSet__executeCommandActions_source_clientName_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = [*(id *)(a1 + 48) identifier];
      id v9 = [v8 shortDescription];
      uint64_t v10 = *(void *)(a1 + 32);
      int v18 = 138543874;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      id v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Command action failed with error: %@ ", (uint8_t *)&v18, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      long long v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 48) identifier];
      id v13 = [v12 shortDescription];
      int v18 = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      id v21 = v13;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Command action finished with success", (uint8_t *)&v18, 0x16u);
    }
  }
  uint64_t v14 = objc_msgSend(NSDictionary, "hmd_dictionaryWithActionExecutionError:", *(void *)(a1 + 32));
  id v15 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v16 = [*(id *)(a1 + 56) uuid];
  long long v17 = [v16 UUIDString];
  [v15 setObject:v14 forKeyedSubscript:v17];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (void)_executeMediaPlaybackActions:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completionHandler:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v26 = a5;
  id v23 = a6;
  id v11 = objc_alloc(MEMORY[0x263F424F0]);
  id v12 = NSString;
  id v13 = MEMORY[0x230FBBCF0](self, a2);
  uint64_t v14 = [v12 stringWithFormat:@"%@, %s:%ld", v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 3283];
  id v48 = (id)[v11 initWithName:v14];

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__30540;
  v46[4] = __Block_byref_object_dispose__30541;
  id v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__30540;
  v44[4] = __Block_byref_object_dispose__30541;
  id v45 = [MEMORY[0x263EFF9A0] dictionary];
  id v15 = [(HMDActionSet *)self workQueue];
  uint64_t v16 = dispatch_group_create();
  objc_initWeak(&location, self);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v10;
  uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(obj);
        }
        __int16 v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        dispatch_group_enter(v16);
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke;
        v31[3] = &unk_264A18A20;
        id v32 = v15;
        objc_copyWeak(&v38, &location);
        id v33 = v48;
        long long v34 = v20;
        long long v36 = v46;
        id v37 = v44;
        id v35 = v16;
        [v20 executeWithSource:a4 clientName:v26 completionHandler:v31];

        objc_destroyWeak(&v38);
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v17);
  }

  id v21 = [(HMDActionSet *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke_186;
  block[3] = &unk_264A2A4E0;
  id v28 = v23;
  id v29 = v46;
  v30 = v44;
  id v22 = v23;
  dispatch_group_notify(v16, v21, block);

  objc_destroyWeak(&location);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(v46, 8);
  __HMFActivityScopeLeave();
}

void __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke_2;
  block[3] = &unk_264A189F8;
  objc_copyWeak(&v16, (id *)(a1 + 80));
  id v11 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v12 = v5;
  uint64_t v13 = v6;
  uint64_t v15 = *(void *)(a1 + 72);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v9;
  long long v14 = v9;
  id v8 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v16);
}

uint64_t __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke_186(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __81__HMDActionSet__executeMediaPlaybackActions_source_clientName_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = WeakRetained;
  uint64_t v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      long long v9 = [*(id *)(a1 + 40) identifier];
      id v10 = [v9 shortDescription];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v38 = v8;
      __int16 v39 = 2114;
      long long v40 = v10;
      __int16 v41 = 2112;
      uint64_t v42 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Play/Pause action failed with error: %@ ", buf, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    id v12 = encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 32), 0);
    id v35 = @"HM.mediaPlaybackErrorDataKey";
    long long v36 = v12;
    uint64_t v13 = NSDictionary;
    long long v14 = &v36;
    uint64_t v15 = &v35;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [*(id *)(a1 + 40) identifier];
      uint64_t v18 = [v17 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v38 = v16;
      __int16 v39 = 2114;
      long long v40 = v18;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Play/Pause action finished with success", buf, 0x16u);
    }
    uint64_t v33 = *MEMORY[0x263F0D120];
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "state"));
    long long v34 = v12;
    uint64_t v13 = NSDictionary;
    long long v14 = &v34;
    uint64_t v15 = (__CFString **)&v33;
  }
  uint64_t v19 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  __int16 v20 = objc_msgSend(*(id *)(a1 + 48), "mediaProfiles", 0);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        id v26 = [*(id *)(*((void *)&v28 + 1) + 8 * v24) uniqueIdentifier];
        id v27 = [v26 UUIDString];
        [v25 setObject:v19 forKeyedSubscript:v27];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v22);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)_issueReadRequests
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDActionSet *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc(MEMORY[0x263F424F0]);
  id v5 = NSString;
  uint64_t v6 = MEMORY[0x230FBBCF0](self, a2);
  id v7 = [v5 stringWithFormat:@"%@, %s:%ld", v6, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 3223];
  id v56 = (id)[v4 initWithName:v7];

  id v37 = [MEMORY[0x263EFF980] array];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v9 = [(HMDActionSet *)self actions];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v10)
  {
    id obj = v9;
    uint64_t v39 = *(void *)v53;
    do
    {
      uint64_t v40 = v10;
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v53 != v39) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        id v41 = v13;

        if (v41)
        {
          long long v14 = [v41 characteristic];
          if ([v14 supportsRead])
          {
            uint64_t v15 = +[HMDCharacteristicRequest requestWithCharacteristic:v14];
            [v37 addObject:v15];
          }
        }
        id v16 = v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0;
        }
        id v18 = v17;

        if (v18)
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          uint64_t v19 = [v18 mediaProfiles];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v49;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v49 != v21) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v23 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                uint64_t v24 = [v23 mediaSession];
                id v25 = [v24 state];
                id v26 = [v23 uniqueIdentifier];
                [v8 setObject:v25 forKeyedSubscript:v26];
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v57 count:16];
            }
            while (v20);
          }
        }
      }
      long long v9 = obj;
      uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v10);
  }

  id v27 = [(HMDActionSet *)self executionMessage];
  uint64_t v28 = [v27 source];

  id v29 = v56;
  [v37 count];

  objc_initWeak(&location, self);
  long long v30 = [(HMDActionSet *)self home];
  long long v31 = [(HMDActionSet *)self description];
  id v32 = [(HMDActionSet *)self executionMessage];
  uint64_t v33 = [v32 qualityOfService];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __34__HMDActionSet__issueReadRequests__block_invoke;
  v42[3] = &unk_264A291A8;
  objc_copyWeak(&v46, &location);
  id v43 = v56;
  id v34 = v37;
  id v44 = v34;
  id v35 = v8;
  id v45 = v35;
  [v30 readCharacteristicValues:v34 source:v28 sourceForLogging:v31 qualityOfService:v33 withCompletionHandler:v42];

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);

  __HMFActivityScopeLeave();
}

void __34__HMDActionSet__issueReadRequests__block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    long long v9 = [WeakRetained workQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __34__HMDActionSet__issueReadRequests__block_invoke_185;
    v15[3] = &unk_264A28EB0;
    id v16 = v5;
    uint64_t v17 = v8;
    id v18 = a1[4];
    id v19 = a1[5];
    id v20 = a1[6];
    id v21 = v6;
    dispatch_async(v9, v15);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = [a1[4] identifier];
      long long v14 = [v13 shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      id v25 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Lost self while reading characteristic values", buf, 0x16u);
    }
  }
}

void __34__HMDActionSet__issueReadRequests__block_invoke_185(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = [*(id *)(a1 + 48) identifier];
      id v7 = [v6 shortDescription];
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 32);
      int v20 = 138544130;
      id v21 = v5;
      __int16 v22 = 2114;
      uint64_t v23 = v7;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fulfill read requests (%@) before evaluating trigger: %@", (uint8_t *)&v20, 0x2Au);
    }
    [*(id *)(a1 + 40) handleExecutionCompletionWithResponsePayload:0 error:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:*(void *)(a1 + 64)];
    uint64_t v11 = (void *)MEMORY[0x230FBD990]([v10 addEntriesFromDictionary:*(void *)(a1 + 72)]);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = HMFGetLogIdentifier();
      uint64_t v15 = [*(id *)(a1 + 48) identifier];
      id v16 = [v15 shortDescription];
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 72);
      int v20 = 138544130;
      id v21 = v14;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Finished read requests %@ with response %@", (uint8_t *)&v20, 0x2Au);
    }
    id v19 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) setExecutionInitialStates:v10]);
    [*(id *)(a1 + 40) _issueWriteRequests:0];
  }
}

- (id)_executeGenericActions:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [v7 source];
    uint64_t v9 = [v7 clientName];
    uint64_t v10 = (void *)v9;
    uint64_t v11 = @"Unknown";
    if (v9) {
      uint64_t v11 = (__CFString *)v9;
    }
    id v12 = v11;

    id v17 = 0;
    uint64_t v13 = [MEMORY[0x263F42538] futureWithPromise:&v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__HMDActionSet__executeGenericActions_message___block_invoke;
    v15[3] = &unk_264A2D870;
    void v15[4] = self;
    id v16 = v17;
    [(HMDActionSet *)self _executeGenericActions:v6 source:v8 clientName:v12 completionHandler:v15];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F42538] futureWithValue:MEMORY[0x263EFFA78]];
  }

  return v13;
}

void __47__HMDActionSet__executeGenericActions_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && ![v6 count])
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute generic actions: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) rejectWithError:v5];
  }
  else
  {
    [*(id *)(a1 + 40) fulfillWithValue:v7];
  }
}

- (id)_executeAppleMediaAccessoryPowerActions:(id)a3 message:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [v7 source];
    uint64_t v9 = [v7 clientName];
    uint64_t v10 = (void *)v9;
    uint64_t v11 = @"Unknown";
    if (v9) {
      uint64_t v11 = (__CFString *)v9;
    }
    int v12 = v11;

    id v22 = 0;
    uint64_t v13 = [MEMORY[0x263F42538] futureWithPromise:&v22];
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v6 count];
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Executing apple tv power actions, count: %lu", buf, 0x16u);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __64__HMDActionSet__executeAppleMediaAccessoryPowerActions_message___block_invoke;
    v20[3] = &unk_264A2D870;
    v20[4] = v15;
    id v21 = v22;
    [(HMDActionSet *)v15 _executeAppleMediaAccessoryPowerActions:v6 source:v8 clientName:v12 completionHandler:v20];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F42538] futureWithValue:MEMORY[0x263EFFA78]];
  }

  return v13;
}

void __64__HMDActionSet__executeAppleMediaAccessoryPowerActions_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && ![v6 count])
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute apple tv power actions: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) rejectWithError:v5];
  }
  else
  {
    [*(id *)(a1 + 40) fulfillWithValue:v7];
  }
}

- (id)_executeNaturalLightingActionsForMatter:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(HMDActionSet *)self home];
    id v6 = v5;
    if (v5) {
      [v5 executeMatterNaturalLightingActions:v4];
    }
    else {
    id v7 = [MEMORY[0x263F42538] futureWithValue:MEMORY[0x263EFFA78]];
    }
  }
  else
  {
    id v7 = [MEMORY[0x263F42538] futureWithValue:MEMORY[0x263EFFA78]];
  }

  return v7;
}

- (id)_executeNaturalLightingWriteRequests:(id)a3 message:(id)a4 naturalLightingActions:(id)a5 naturalLightingActionResultByActionUUID:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    uint64_t v29 = [v11 source];
    id v35 = 0;
    __int16 v14 = [MEMORY[0x263F42538] futureWithPromise:&v35];
    id v15 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v19 = [v11 identifier];

      if (v19)
      {
        int v20 = [v11 identifier];
        [v20 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v36 = *(_OWORD *)buf;
      uint64_t v23 = [v10 count];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v38 = 2098;
      uint64_t v39 = &v36;
      __int16 v40 = 2114;
      id v41 = v16;
      __int16 v42 = 2048;
      uint64_t v43 = v23;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Executing write requests for request identifier: %{public,uuid_t}.16P from natural lighting action set: %{public}@ count: %lu", buf, 0x30u);
    }
    __int16 v24 = [(HMDActionSet *)v16 home];
    __int16 v25 = [v11 identifier];
    uint64_t v26 = [v11 transport];
    uint64_t v27 = [v11 qualityOfService];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __124__HMDActionSet__executeNaturalLightingWriteRequests_message_naturalLightingActions_naturalLightingActionResultByActionUUID___block_invoke;
    v30[3] = &unk_264A238E8;
    v30[4] = v16;
    id v31 = v35;
    id v32 = v10;
    id v33 = v12;
    id v34 = v13;
    [v24 writeCharacteristicValues:v32 source:v29 identifier:v25 transport:v26 qualityOfService:v27 withCompletionHandler:v30];
  }
  else
  {
    id v21 = (void *)MEMORY[0x263F42538];
    id v22 = (void *)[v13 copy];
    __int16 v14 = [v21 futureWithValue:v22];
  }
  return v14;
}

void __124__HMDActionSet__executeNaturalLightingWriteRequests_message_naturalLightingActions_naturalLightingActionResultByActionUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  __int16 v60 = v5;
  uint64_t v61 = a1;
  if (v5 && ![v6 count])
  {
    long long v53 = (void *)MEMORY[0x230FBD990]();
    id v54 = *(id *)(a1 + 32);
    long long v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      id v56 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v56;
      __int16 v72 = 2112;
      id v73 = v5;
      _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute natural lighting write requests: %@", buf, 0x16u);
    }
    [*(id *)(v61 + 40) rejectWithError:v5];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v11;
      __int16 v72 = 2112;
      id v73 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received response for natural lighting accessory write requests: %@", buf, 0x16u);
    }
    uint64_t v59 = [MEMORY[0x263EFF9C0] set];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v12 = v61;
    id obj = *(id *)(v61 + 48);
    uint64_t v13 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v67;
      *(void *)&long long v14 = 138543874;
      long long v57 = v14;
      uint64_t v58 = *(void *)v67;
      do
      {
        uint64_t v17 = 0;
        uint64_t v62 = v15;
        do
        {
          if (*(void *)v67 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v66 + 1) + 8 * v17);
          id v19 = objc_msgSend(v18, "identifier", v57);

          if (v19)
          {
            int v20 = *(void **)(v12 + 56);
            v65[0] = MEMORY[0x263EF8330];
            v65[1] = 3221225472;
            v65[2] = __124__HMDActionSet__executeNaturalLightingWriteRequests_message_naturalLightingActions_naturalLightingActionResultByActionUUID___block_invoke_178;
            v65[3] = &unk_264A1BD88;
            v65[4] = v18;
            id v21 = objc_msgSend(v20, "na_firstObjectPassingTest:", v65);
            if (v21)
            {
              id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
              uint64_t v23 = [v21 isNaturalLightingEnabled];
              id v64 = v22;
              __int16 v24 = v7;
              char v25 = objc_msgSend(v7, "hmd_isValidResponseForWriteRequest:naturalLightingEnabled:error:", v18, v23, &v64);
              id v26 = v64;

              uint64_t v27 = (void *)MEMORY[0x230FBD990]();
              id v28 = *(id *)(v12 + 32);
              uint64_t v29 = HMFGetOSLogHandle();
              long long v30 = v29;
              if (v25)
              {
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  id v31 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v71 = v31;
                  __int16 v72 = 2112;
                  id v73 = v21;
                  id v32 = v30;
                  os_log_type_t v33 = OS_LOG_TYPE_DEBUG;
                  id v34 = "%{public}@Successfully executed natural lighting action: %@";
                  uint32_t v35 = 22;
                  goto LABEL_17;
                }
              }
              else if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                id v31 = HMFGetLogIdentifier();
                *(_DWORD *)buf = v57;
                v71 = v31;
                __int16 v72 = 2112;
                id v73 = v21;
                __int16 v74 = 2112;
                id v75 = v26;
                id v32 = v30;
                os_log_type_t v33 = OS_LOG_TYPE_INFO;
                id v34 = "%{public}@Failed to execute natural lighting action %@:%@";
                uint32_t v35 = 32;
LABEL_17:
                _os_log_impl(&dword_22F52A000, v32, v33, v34, buf, v35);
              }
              long long v36 = objc_msgSend(NSDictionary, "hmd_dictionaryWithActionExecutionError:", v60);
              uint64_t v12 = v61;
              id v37 = *(void **)(v61 + 64);
              __int16 v38 = [v21 uuid];
              uint64_t v39 = [v38 UUIDString];
              [v37 setObject:v36 forKeyedSubscript:v39];

              __int16 v40 = [v18 characteristic];
              [v59 addObject:v40];

              id v7 = v24;
              uint64_t v16 = v58;
              uint64_t v15 = v62;
            }
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
      }
      while (v15);
    }

    if ([v59 count])
    {
      id v41 = objc_msgSend(v7, "hmd_responseByRemovingEntriesForCharacteristics:", v59);
      __int16 v42 = (void *)MEMORY[0x230FBD990]();
      id v43 = *(id *)(v12 + 32);
      uint64_t v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        id v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v71 = v45;
        __int16 v72 = 2112;
        id v73 = v59;
        __int16 v74 = 2112;
        id v75 = v7;
        __int16 v76 = 2112;
        v77 = v41;
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Updated response by removing entries for characteristics: %@ from: (%@ -> %@)", buf, 0x2Au);
      }
    }
    else
    {
      id v41 = v7;
    }
    id v46 = (void *)[v41 mutableCopy];
    id v47 = (void *)MEMORY[0x230FBD990]([v46 addEntriesFromDictionary:*(void *)(v61 + 64)]);
    id v48 = *(id *)(v61 + 32);
    long long v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      long long v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v50;
      __int16 v72 = 2112;
      id v73 = v46;
      _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@Finished executing natural lighting actions with response: %@", buf, 0x16u);
    }
    long long v51 = *(void **)(v61 + 40);
    long long v52 = (void *)[v46 copy];
    [v51 fulfillWithValue:v52];

    id v7 = v41;
  }
}

uint64_t __124__HMDActionSet__executeNaturalLightingWriteRequests_message_naturalLightingActions_naturalLightingActionResultByActionUUID___block_invoke_178(uint64_t a1, void *a2)
{
  id v3 = [a2 lightProfileUUID];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)_executeNaturalLightingActions:(id)a3 writeRequests:(id)a4 message:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v38 = a5;
  uint64_t v39 = v8;
  id v37 = v9;
  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    id v41 = (void *)[v9 mutableCopy];
    id v43 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v60 = 0;
    uint64_t v61 = (os_unfair_lock_s *)&v60;
    uint64_t v62 = 0x2810000000;
    v63 = "";
    int v64 = 0;
    __int16 v42 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v44 = self;
    HMFGetOSLogHandle();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Fetching up-to-date light profile settings before execution", buf, 0xCu);
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v57 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          uint64_t v17 = [v16 lightProfile];
          uint64_t v18 = [v16 uuid];
          id v19 = [v18 UUIDString];

          if (v17)
          {
            *(void *)buf = 0;
            int v20 = [MEMORY[0x263F42538] futureWithPromise:buf];
            v50[0] = MEMORY[0x263EF8330];
            v50[1] = 3221225472;
            v50[2] = __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke;
            v50[3] = &unk_264A189A8;
            v50[4] = v16;
            v50[5] = v44;
            long long v55 = &v60;
            id v51 = v43;
            id v52 = v19;
            id v53 = v41;
            id v54 = *(id *)buf;
            [v17 fetchNaturalLightingEnabledWithCompletion:v50];
            [v42 addObject:v20];
          }
          else
          {
            id v21 = (void *)MEMORY[0x230FBD990]();
            id v22 = v44;
            HMFGetOSLogHandle();
            uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              __int16 v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v24;
              __int16 v66 = 2112;
              long long v67 = v16;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Skipping executing natural lighting action, missing light profile: %@", buf, 0x16u);
            }
            char v25 = v61 + 8;
            os_unfair_lock_lock_with_options();
            id v26 = NSDictionary;
            uint64_t v27 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
            id v28 = objc_msgSend(v26, "hmd_dictionaryWithActionExecutionError:", v27);
            [v43 setObject:v28 forKeyedSubscript:v19];

            os_unfair_lock_unlock(v25);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v13);
    }

    id v29 = objc_alloc(MEMORY[0x263F42520]);
    long long v30 = [(HMDActionSet *)v44 workQueue];
    id v31 = (void *)[v29 initWithQueue:v30];

    id v32 = [MEMORY[0x263F42538] allSettled:v42];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_177;
    v45[3] = &unk_264A189D0;
    v45[4] = v44;
    id v33 = v41;
    id v46 = v33;
    id v47 = v38;
    id v48 = obj;
    id v34 = v43;
    id v49 = v34;
    uint32_t v35 = [v32 inContext:v31 then:v45];

    _Block_object_dispose(&v60, 8);
  }
  else
  {
    uint32_t v35 = [MEMORY[0x263F42538] futureWithValue:MEMORY[0x263EFFA78]];
  }

  return v35;
}

void __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || [*(id *)(a1 + 32) isNaturalLightingEnabled] == a2)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = *(void **)(a1 + 32);
      id v11 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      __int16 v24 = v9;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v5;
      __int16 v29 = 2112;
      long long v30 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Skipping natural lighting action %@ because either we failed to read with error: %@ or natural lighting is already enabled: %@", buf, 0x2Au);
    }
    uint64_t v12 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 80) + 8) + 32);
    os_unfair_lock_lock_with_options();
    uint64_t v13 = NSDictionary;
    if ([v5 code] == 48) {
      id v14 = 0;
    }
    else {
      id v14 = v5;
    }
    uint64_t v15 = objc_msgSend(v13, "hmd_dictionaryWithActionExecutionError:", v14);
    [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:*(void *)(a1 + 56)];

    uint64_t v16 = *(void **)(a1 + 64);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_175;
    v22[3] = &unk_264A18980;
    v22[4] = *(void *)(a1 + 32);
    uint64_t v17 = objc_msgSend(v16, "na_firstObjectPassingTest:", v22);
    if (v17)
    {
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      int v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v24 = v21;
        __int16 v25 = 2112;
        id v26 = v17;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Removing write request from list of natural lighting accessory write requests: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 64) removeObject:v17];
    }

    os_unfair_lock_unlock(v12);
  }
  [*(id *)(a1 + 72) fulfillWithValue:0];
}

uint64_t __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_177(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _executeNaturalLightingWriteRequests:*(void *)(a1 + 40) message:*(void *)(a1 + 48) naturalLightingActions:*(void *)(a1 + 56) naturalLightingActionResultByActionUUID:*(void *)(a1 + 64)];
  if (v4)
  {
    id v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_175(v7, v8);
  }
}

uint64_t __69__HMDActionSet__executeNaturalLightingActions_writeRequests_message___block_invoke_175(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 lightProfileUUID];
  id v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (id)_executeCommandActions:(id)a3 message:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [v7 source];
    uint64_t v9 = [v7 clientName];
    id v10 = (void *)v9;
    id v11 = @"Unknown";
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    uint64_t v12 = v11;

    id v22 = 0;
    uint64_t v13 = [MEMORY[0x263F42538] futureWithPromise:&v22];
    id v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v6 count];
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Executing command actions, count: %lu", buf, 0x16u);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __47__HMDActionSet__executeCommandActions_message___block_invoke;
    v20[3] = &unk_264A2D870;
    v20[4] = v15;
    id v21 = v22;
    [(HMDActionSet *)v15 _executeCommandActions:v6 source:v8 clientName:v12 completionHandler:v20];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F42538] futureWithValue:MEMORY[0x263EFFA78]];
  }

  return v13;
}

void __47__HMDActionSet__executeCommandActions_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && ![v6 count])
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute command actions: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) rejectWithError:v5];
  }
  else
  {
    [*(id *)(a1 + 40) fulfillWithValue:v7];
  }
}

- (id)_executeMediaPlaybackActions:(id)a3 message:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [v7 source];
    uint64_t v9 = [v7 clientName];
    id v10 = (void *)v9;
    id v11 = @"Unknown";
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    int v12 = v11;

    id v22 = 0;
    uint64_t v13 = [MEMORY[0x263F42538] futureWithPromise:&v22];
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v6 count];
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Executing media playback actions, count: %lu", buf, 0x16u);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __53__HMDActionSet__executeMediaPlaybackActions_message___block_invoke;
    v20[3] = &unk_264A2D870;
    v20[4] = v15;
    id v21 = v22;
    [(HMDActionSet *)v15 _executeMediaPlaybackActions:v6 source:v8 clientName:v12 completionHandler:v20];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F42538] futureWithValue:MEMORY[0x263EFFA78]];
  }

  return v13;
}

void __53__HMDActionSet__executeMediaPlaybackActions_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && ![v6 count])
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute media playback actions: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) rejectWithError:v5];
  }
  else
  {
    [*(id *)(a1 + 40) fulfillWithValue:v7];
  }
}

- (id)_executeCharacteristicWriteRequests:(id)a3 message:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [v7 source];
    id v24 = 0;
    id v9 = [MEMORY[0x263F42538] futureWithPromise:&v24];
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      __int16 v14 = [v7 identifier];

      if (v14)
      {
        id v15 = [v7 identifier];
        [v15 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v25 = *(_OWORD *)buf;
      uint64_t v16 = [v6 count];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v27 = 2098;
      id v28 = &v25;
      __int16 v29 = 2114;
      long long v30 = v11;
      __int16 v31 = 2048;
      uint64_t v32 = v16;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Executing write requests for request identifier: %{public,uuid_t}.16P from characteristic write action set: %{public}@ count: %lu", buf, 0x30u);
    }
    uint64_t v17 = [(HMDActionSet *)v11 home];
    uint64_t v18 = [v7 identifier];
    id v19 = [v7 transport];
    uint64_t v20 = [v7 qualityOfService];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __60__HMDActionSet__executeCharacteristicWriteRequests_message___block_invoke;
    v22[3] = &unk_264A2D870;
    v22[4] = v11;
    id v23 = v24;
    [v17 writeCharacteristicValues:v6 source:v8 identifier:v18 transport:v19 qualityOfService:v20 withCompletionHandler:v22];
  }
  else
  {
    id v9 = [MEMORY[0x263F42538] futureWithValue:MEMORY[0x263EFFA78]];
  }

  return v9;
}

void __60__HMDActionSet__executeCharacteristicWriteRequests_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && ![v6 count])
  {
    int v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute characteristic write requests: %@", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 40) rejectWithError:v5];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Finished executing characteristic write with response: %@", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 40) fulfillWithValue:v7];
  }
}

- (void)_issueWriteRequests:(id)a3
{
  uint64_t v191 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDActionSet *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDActionSet *)self executionMessage];
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  v140 = v4;
  uint64_t v8 = (void *)[v4 mutableCopy];
  id v9 = v8;
  v142 = (void *)v7;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x263EFF980] array];
  }
  v136 = v10;

  v141 = [MEMORY[0x263EFF980] array];
  v137 = [MEMORY[0x263EFF980] array];
  v135 = [MEMORY[0x263EFF980] array];
  uint64_t v139 = [MEMORY[0x263EFF980] array];
  uint64_t v138 = [MEMORY[0x263EFF980] array];
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id obj = [(HMDActionSet *)self actions];
  uint64_t v11 = [obj countByEnumeratingWithState:&v171 objects:v190 count:16];
  v152 = v6;
  if (!v11)
  {
LABEL_73:

    uint64_t v61 = (void *)MEMORY[0x230FBD990]();
    uint64_t v62 = self;
    v63 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      int v64 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544642;
      v179 = v64;
      __int16 v180 = 2112;
      id v181 = v136;
      __int16 v182 = 2112;
      v183 = v141;
      __int16 v184 = 2112;
      v185 = v137;
      __int16 v186 = 2112;
      v187 = v142;
      __int16 v188 = 2112;
      uint64_t v189 = v138;
      _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_DEBUG, "%{public}@Preparing to execute characteristic write actions: [%@], media playback actions: [%@], natural lighting actions: [%@] short cut actions: [%@], command actions: [%@]", buf, 0x3Eu);
    }
    v65 = (void *)[v140 mutableCopy];
    __int16 v66 = v65;
    v144 = v62;
    if (v65)
    {
      id v67 = v65;
    }
    else
    {
      id v67 = [MEMORY[0x263EFF980] array];
    }
    id obj = v67;

    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    id v76 = v136;
    uint64_t v77 = [v76 countByEnumeratingWithState:&v167 objects:v177 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v168;
      do
      {
        for (uint64_t i = 0; i != v78; ++i)
        {
          if (*(void *)v168 != v79) {
            objc_enumerationMutation(v76);
          }
          v81 = *(void **)(*((void *)&v167 + 1) + 8 * i);
          v82 = [v81 characteristic];
          v83 = [v81 targetValue];
          v84 = [v82 authorizationData];
          v85 = [v152 identifier];
          v86 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v82 value:v83 authorizationData:v84 identifier:v85 type:1];

          [obj addObject:v86];
        }
        uint64_t v78 = [v76 countByEnumeratingWithState:&v167 objects:v177 count:16];
      }
      while (v78);
    }

    v87 = [MEMORY[0x263EFF980] array];
    v146 = [MEMORY[0x263EFF980] array];
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    id v148 = v141;
    uint64_t v88 = [v148 countByEnumeratingWithState:&v163 objects:v176 count:16];
    v89 = v144;
    if (v88)
    {
      uint64_t v90 = v88;
      uint64_t v91 = *(void *)v164;
      do
      {
        for (uint64_t j = 0; j != v90; ++j)
        {
          if (*(void *)v164 != v91) {
            objc_enumerationMutation(v148);
          }
          v93 = *(void **)(*((void *)&v163 + 1) + 8 * j);
          v94 = [v93 convertedCharacteristicWriteRequests];
          if (v94)
          {
            [v87 addObject:v93];
            v95 = [v94 characteristicWriteRequests];
            uint64_t v96 = [v95 count];

            if (v96)
            {
              v97 = [v94 characteristicWriteRequests];
              [obj addObjectsFromArray:v97];
            }
            v98 = [v94 residualAction];

            if (v98)
            {
              v99 = [v94 residualAction];
              [v146 addObject:v99];
            }
          }
        }
        uint64_t v90 = [v148 countByEnumeratingWithState:&v163 objects:v176 count:16];
      }
      while (v90);
    }

    v143 = v87;
    [v148 removeObjectsInArray:v87];
    [v148 addObjectsFromArray:v146];
    uint64_t v100 = [MEMORY[0x263EFF910] date];
    v151 = [MEMORY[0x263EFF980] array];
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    id v147 = v137;
    uint64_t v101 = [v147 countByEnumeratingWithState:&v159 objects:v175 count:16];
    v145 = (void *)v100;
    if (v101)
    {
      uint64_t v102 = v101;
      uint64_t v103 = *(void *)v160;
      do
      {
        for (uint64_t k = 0; k != v102; ++k)
        {
          if (*(void *)v160 != v103) {
            objc_enumerationMutation(v147);
          }
          v105 = *(void **)(*((void *)&v159 + 1) + 8 * k);
          v106 = [v105 lightProfile];
          v107 = [v105 writeRequestForTransitionStartWithLightProfile:v106 startDate:v100 type:1];

          if (v107)
          {
            [v151 addObject:v107];
            v108 = (void *)[obj copy];
            v156[0] = MEMORY[0x263EF8330];
            v156[1] = 3221225472;
            v156[2] = __36__HMDActionSet__issueWriteRequests___block_invoke;
            v156[3] = &unk_264A18958;
            v156[4] = v105;
            id v157 = obj;
            id v158 = v151;
            objc_msgSend(v108, "na_each:", v156);
          }
          else
          {
            v109 = (void *)MEMORY[0x230FBD990]();
            v110 = v89;
            v111 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            {
              v112 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v179 = v112;
              __int16 v180 = 2112;
              id v181 = v105;
              _os_log_impl(&dword_22F52A000, v111, OS_LOG_TYPE_ERROR, "%{public}@Failed to create write request for natural lighting action: %@", buf, 0x16u);

              v89 = v144;
            }

            uint64_t v100 = (uint64_t)v145;
          }
        }
        uint64_t v102 = [v147 countByEnumeratingWithState:&v159 objects:v175 count:16];
      }
      while (v102);
    }

    v113 = (void *)MEMORY[0x263F42590];
    v114 = [(HMDActionSet *)v89 messageDestination];
    v115 = [v113 messageWithName:@"kActionSetWillStartExecutionNotificationKey" destination:v114 payload:0];

    id v6 = v152;
    objc_msgSend(v115, "setRemote:", objc_msgSend(v152, "isRemote"));
    v116 = [v152 transport];
    [v115 setTransport:v116];

    v117 = [(HMDActionSet *)v89 msgDispatcher];
    v150 = v115;
    [v117 sendMessage:v115 completionHandler:0];

    v118 = [MEMORY[0x263EFF980] array];
    v119 = [(HMDActionSet *)v89 _executeCharacteristicWriteRequests:obj message:v152];
    [v118 addObject:v119];

    v120 = [(HMDActionSet *)v89 _executeMediaPlaybackActions:v148 message:v152];
    [v118 addObject:v120];

    v121 = [(HMDActionSet *)v89 _executeNaturalLightingActions:v147 writeRequests:v151 message:v152];
    [v118 addObject:v121];

    id v73 = v142;
    id v75 = (void *)v139;
    __int16 v72 = v146;
    if ((objc_msgSend(v135, "hmf_isEmpty") & 1) == 0)
    {
      v122 = (void *)MEMORY[0x230FBD990]();
      v123 = v89;
      v124 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
      {
        v125 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v179 = v125;
        __int16 v180 = 2112;
        id v181 = v135;
        _os_log_impl(&dword_22F52A000, v124, OS_LOG_TYPE_DEBUG, "%{public}@Preparing to execute natural lighting actions for matter: [%@]", buf, 0x16u);
      }
      v126 = [(HMDActionSet *)v123 _executeNaturalLightingActionsForMatter:v135];
      [v118 addObject:v126];
    }
    v127 = [(HMDActionSet *)v89 _executeAppleMediaAccessoryPowerActions:v139 message:v152];
    [v118 addObject:v127];

    v128 = [(HMDActionSet *)v89 _executeGenericActions:v142 message:v152];
    [v118 addObject:v128];

    __int16 v74 = (void *)v138;
    v129 = [(HMDActionSet *)v89 _executeCommandActions:v138 message:v152];
    [v118 addObject:v129];

    id v130 = objc_alloc(MEMORY[0x263F42520]);
    v131 = [(HMDActionSet *)v89 workQueue];
    v132 = (void *)[v130 initWithQueue:v131];

    v133 = [MEMORY[0x263F42538] allSettled:v118];
    v155[0] = MEMORY[0x263EF8330];
    v155[1] = 3221225472;
    v155[2] = __36__HMDActionSet__issueWriteRequests___block_invoke_166;
    v155[3] = &unk_264A2BEF0;
    v155[4] = v89;
    v134 = [v133 inContext:v132 then:v155];

    v154[0] = MEMORY[0x263EF8330];
    v154[1] = 3221225472;
    v154[2] = __36__HMDActionSet__issueWriteRequests___block_invoke_170;
    v154[3] = &unk_264A2E660;
    v154[4] = v89;
    [v134 getResultWithCompletion:v154];

    goto LABEL_117;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v172;
  v149 = self;
  while (2)
  {
    uint64_t v14 = 0;
LABEL_7:
    if (*(void *)v172 != v13) {
      objc_enumerationMutation(obj);
    }
    id v15 = *(void **)(*((void *)&v171 + 1) + 8 * v14);
    switch([v15 type])
    {
      case 0:
        id v16 = v15;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0;
        }
        id v18 = v17;

        if (v18)
        {
          if ([v140 count]) {
            goto LABEL_66;
          }
          id v19 = v136;
          goto LABEL_65;
        }
        uint64_t v44 = MEMORY[0x230FBD990]();
        id v45 = self;
        id v46 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        goto LABEL_68;
      case 1:
        id v16 = v15;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v22 = v16;
        }
        else {
          id v22 = 0;
        }
        id v18 = v22;

        if (v18)
        {
          id v19 = v141;
          goto LABEL_65;
        }
        uint64_t v44 = MEMORY[0x230FBD990]();
        id v45 = self;
        id v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        goto LABEL_69;
      case 2:
        id v23 = v15;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v24 = v23;
        }
        else {
          id v24 = 0;
        }
        id v25 = v24;

        v143 = v25;
        if (!v25
          || ([v6 proxyConnection], (uint64_t v26 = objc_claimAutoreleasedReturnValue()) == 0)
          || (__int16 v27 = (void *)v26,
              char v28 = [v6 isEntitledForShortcutsAutomationAccess],
              v27,
              (v28 & 1) != 0))
        {
          [v142 addObject:v23];

LABEL_71:
          if (v12 == ++v14)
          {
            uint64_t v12 = [obj countByEnumeratingWithState:&v171 objects:v190 count:16];
            if (!v12) {
              goto LABEL_73;
            }
            continue;
          }
          goto LABEL_7;
        }
        long long v68 = (void *)MEMORY[0x230FBD990]();
        uint64_t v69 = self;
        v70 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v71 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v179 = v71;
          _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_ERROR, "%{public}@Missing ShortcutsAutomationAccess Entitlement for Execute(2)", buf, 0xCu);
        }
        __int16 v72 = [MEMORY[0x263F087E8] hmErrorWithCode:80 description:@"Missing Entitlement" reason:0 suggestion:0];
        [(HMDActionSet *)v69 handleExecutionCompletionWithResponsePayload:0 error:v72];
        id v73 = v142;
        __int16 v74 = (void *)v138;
        id v75 = (void *)v139;
LABEL_117:

        return;
      case 3:
        id v29 = v15;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v30 = v29;
        }
        else {
          long long v30 = 0;
        }
        id v18 = v30;

        if (!v18)
        {
          uint64_t v49 = MEMORY[0x230FBD990]();
          long long v50 = self;
          id v51 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            id v52 = HMFGetLogIdentifier();
            id v53 = HMActionTypeAsString();
            *(_DWORD *)buf = 138543874;
            v179 = v52;
            __int16 v180 = 2112;
            id v181 = v29;
            __int16 v182 = 2112;
            v183 = v53;
            _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

            self = v149;
            id v6 = v152;
          }

          id v54 = (void *)v49;
          goto LABEL_62;
        }
        __int16 v31 = [v18 lightProfile];

        if (!v31)
        {
          uint64_t v55 = MEMORY[0x230FBD990]();
          long long v56 = self;
          long long v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            long long v58 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v179 = v58;
            __int16 v180 = 2112;
            id v181 = v18;
            _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_ERROR, "%{public}@Skipping executing natural lighting action, missing light profile: %@", buf, 0x16u);

            self = v149;
          }

          id v54 = (void *)v55;
LABEL_62:
          goto LABEL_66;
        }
        uint64_t v32 = [v18 lightProfile];
        if ([v32 supportsCHIP])
        {
          uint64_t v33 = [v18 lightProfile];
          int v34 = [v33 isNaturalLightingSupported];

          if (v34)
          {
            id v19 = v135;
            goto LABEL_65;
          }
        }
        else
        {
        }
        id v19 = v137;
LABEL_65:
        [v19 addObject:v18];
LABEL_66:

        goto LABEL_71;
      case 4:
        id v20 = v15;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v21 = v20;
        }
        else {
          id v21 = 0;
        }
        id v18 = v21;

        if (v18)
        {
          id v19 = (void *)v139;
          goto LABEL_65;
        }
        uint64_t v44 = MEMORY[0x230FBD990]();
        id v45 = self;
        id v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          id v47 = HMFGetLogIdentifier();
          id v48 = HMActionTypeAsString();
          *(_DWORD *)buf = 138543874;
          v179 = v47;
          __int16 v180 = 2112;
          id v181 = v20;
          __int16 v182 = 2112;
          v183 = v48;
          _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

          self = v149;
        }
        goto LABEL_69;
      case 5:
        uint32_t v35 = +[HMDCoreData featuresDataSource];
        int v36 = [v35 isRVCEnabled];

        if (!v36) {
          goto LABEL_47;
        }
        id v16 = v15;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v37 = v16;
        }
        else {
          id v37 = 0;
        }
        id v18 = v37;

        if (v18)
        {
          id v19 = (void *)v138;
          goto LABEL_65;
        }
        uint64_t v44 = MEMORY[0x230FBD990]();
        id v45 = self;
        id v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
LABEL_68:
          long long v59 = HMFGetLogIdentifier();
          uint64_t v60 = HMActionTypeAsString();
          *(_DWORD *)buf = 138543874;
          v179 = v59;
          __int16 v180 = 2112;
          id v181 = v16;
          __int16 v182 = 2112;
          v183 = v60;
          _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

          id v6 = v152;
        }
LABEL_69:

        id v43 = (void *)v44;
LABEL_70:
        goto LABEL_71;
      default:
LABEL_47:
        uint64_t v38 = MEMORY[0x230FBD990]();
        uint64_t v39 = self;
        __int16 v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = HMFGetLogIdentifier();
          __int16 v42 = HMActionTypeAsString();
          *(_DWORD *)buf = 138543874;
          v179 = v41;
          __int16 v180 = 2112;
          id v181 = v15;
          __int16 v182 = 2112;
          v183 = v42;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown action type %@:%@", buf, 0x20u);

          self = v149;
        }

        id v43 = (void *)v38;
        goto LABEL_70;
    }
  }
}

void __36__HMDActionSet__issueWriteRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 characteristic];
  id v5 = [v4 accessory];

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
    uint64_t v8 = [v7 lightProfiles];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__HMDActionSet__issueWriteRequests___block_invoke_2;
    v10[3] = &unk_264A1E6A8;
    v10[4] = *(void *)(a1 + 32);
    id v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", v10);

    if (v9)
    {
      [*(id *)(a1 + 40) removeObject:v3];
      [*(id *)(a1 + 48) addObject:v3];
    }
  }
}

uint64_t __36__HMDActionSet__issueWriteRequests___block_invoke_166(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  id v5 = [v3 dictionary];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __36__HMDActionSet__issueWriteRequests___block_invoke_2_167;
  uint64_t v12 = &unk_264A2ACB8;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v5;
  id v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v9);

  id v7 = (id)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return 1;
}

void __36__HMDActionSet__issueWriteRequests___block_invoke_170(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished execution of all actions with response: %@", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 32) handleExecutionCompletionWithResponsePayload:v5 error:0];
}

void __36__HMDActionSet__issueWriteRequests___block_invoke_2_167(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Execution of action resulted in error: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    id v10 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    id v12 = v11;

    if (v12) {
      [*(id *)(a1 + 40) addEntriesFromDictionary:v12];
    }
  }
}

uint64_t __36__HMDActionSet__issueWriteRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) lightProfileUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)_createActionExecutionLogEvent:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v42 = [v3 source];
  uint64_t v44 = v3;
  if (v42 == 1)
  {
    id v43 = @"com.apple.Siri";
    id v4 = @"com.apple.Siri";
  }
  else
  {
    id v43 = [v3 clientIdentifier];
  }
  uint64_t v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = [(HMDActionSet *)self actions];
  id v7 = objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v8 = [(HMDActionSet *)self actions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v52;
    id v45 = v8;
LABEL_6:
    uint64_t v12 = 0;
    while (2)
    {
      if (*(void *)v52 != v11) {
        objc_enumerationMutation(v8);
      }
      int v13 = *(void **)(*((void *)&v51 + 1) + 8 * v12);
      switch([v13 type])
      {
        case 0:
          id v14 = v13;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v15 = v14;
          }
          else {
            __int16 v15 = 0;
          }
          id v16 = v15;

          if (v16)
          {
            uint64_t v17 = [v16 characteristic];
            id v18 = [v17 accessory];
            if (v18) {
              [v7 addObject:v18];
            }

            goto LABEL_50;
          }
          id v29 = (void *)MEMORY[0x230FBD990]();
          long long v30 = self;
          __int16 v31 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 1:
          id v14 = v13;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v21 = v14;
          }
          else {
            id v21 = 0;
          }
          id v16 = v21;

          if (v16)
          {
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v22 = [v16 mediaProfiles];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v48;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v48 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  __int16 v27 = [*(id *)(*((void *)&v47 + 1) + 8 * i) accessory];
                  if (v27) {
                    [v7 addObject:v27];
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }
              while (v24);
            }

            id v8 = v45;
            goto LABEL_60;
          }
          id v29 = (void *)MEMORY[0x230FBD990]();
          long long v30 = self;
          __int16 v31 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 3:
          id v14 = v13;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v19 = v14;
          }
          else {
            id v19 = 0;
          }
          id v16 = v19;

          if (v16)
          {
            id v20 = [v16 lightProfile];
            uint64_t v17 = [v20 accessory];

            if (v17) {
              goto LABEL_49;
            }
            goto LABEL_50;
          }
          id v29 = (void *)MEMORY[0x230FBD990]();
          long long v30 = self;
          __int16 v31 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            goto LABEL_59;
          }
          goto LABEL_58;
        case 4:
          id v14 = v13;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            char v28 = v14;
          }
          else {
            char v28 = 0;
          }
          id v16 = v28;

          if (v16) {
            goto LABEL_48;
          }
          id v29 = (void *)MEMORY[0x230FBD990]();
          long long v30 = self;
          __int16 v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            goto LABEL_58;
          }
          goto LABEL_59;
        case 5:
          uint64_t v32 = +[HMDCoreData featuresDataSource];
          int v33 = [v32 isRVCEnabled];

          if (!v33) {
            goto LABEL_61;
          }
          id v14 = v13;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            int v34 = v14;
          }
          else {
            int v34 = 0;
          }
          id v16 = v34;

          if (v16)
          {
LABEL_48:
            uint64_t v17 = [v16 accessory];
            if (v17) {
LABEL_49:
            }
              [v7 addObject:v17];
LABEL_50:
          }
          else
          {
            id v29 = (void *)MEMORY[0x230FBD990]();
            long long v30 = self;
            __int16 v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
LABEL_58:
              uint32_t v35 = HMFGetLogIdentifier();
              int v36 = HMActionTypeAsString();
              *(_DWORD *)buf = 138543874;
              long long v57 = v35;
              __int16 v58 = 2112;
              id v59 = v14;
              __int16 v60 = 2112;
              uint64_t v61 = v36;
              _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

              id v8 = v45;
            }
LABEL_59:

            id v16 = 0;
          }
LABEL_60:

LABEL_61:
          if (++v12 != v10) {
            continue;
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v62 count:16];
          if (!v10) {
            goto LABEL_63;
          }
          goto LABEL_6;
        default:
          goto LABEL_61;
      }
    }
  }
LABEL_63:

  id v37 = [HMDActionSetEvent alloc];
  uint64_t v38 = [v7 count];
  uint64_t v39 = [v44 identifier];
  __int16 v40 = [(HMDActionSetEvent *)v37 initWithActionSet:self source:v42 numAccessories:v38 bundleId:v43 transactionId:v39];

  return v40;
}

- (void)_execute:(id)a3 captureCurrentState:(BOOL)a4 writeRequestTuples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(HMDActionSet *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    int v39 = 138543362;
    __int16 v40 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Executing the action set", (uint8_t *)&v39, 0xCu);
  }
  __int16 v15 = [(HMDActionSet *)v12 actions];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    uint64_t v25 = v12;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = HMFGetLogIdentifier();
      char v28 = [v8 shortDescription];
      int v39 = 138543618;
      __int16 v40 = v27;
      __int16 v41 = 2112;
      uint64_t v42 = v28;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Not executing the action set: there are no actions in it: %@", (uint8_t *)&v39, 0x16u);
    }
    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = 25;
    goto LABEL_11;
  }
  uint64_t v17 = [(HMDActionSet *)v12 executionMessage];

  if (v17)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v12;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      int v39 = 138543362;
      __int16 v40 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not executing the action set: another execution is already in progress", (uint8_t *)&v39, 0xCu);
    }
    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = 65;
LABEL_11:
    id v29 = [v22 hmErrorWithCode:v23];
    [v8 respondWithError:v29];

    goto LABEL_12;
  }
  [(HMDActionSet *)v12 setExecutionMessage:v8];
  long long v30 = [MEMORY[0x263EFF910] date];
  [(HMDActionSet *)v12 setExecutionStart:v30];

  __int16 v31 = [(HMDActionSet *)v12 home];
  [v31 startReportingSessionForMessage:v8];

  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:1 options:600.0];
  [(HMDActionSet *)v12 setExecutionTimeoutTimer:v32];

  int v33 = [(HMDActionSet *)v12 executionTimeoutTimer];
  [v33 setDelegate:v12];

  int v34 = [(HMDActionSet *)v12 workQueue];
  uint32_t v35 = [(HMDActionSet *)v12 executionTimeoutTimer];
  [v35 setDelegateQueue:v34];

  int v36 = [(HMDActionSet *)v12 executionTimeoutTimer];
  [v36 resume];

  [(HMDActionSet *)v12 setExecutionInitialStates:0];
  id v37 = [(HMDActionSet *)v12 _createActionExecutionLogEvent:v8];
  [(HMDActionSet *)v12 setExecutionActionSetEvent:v37];

  if (v6)
  {
    [(HMDActionSet *)v12 _issueReadRequests];
  }
  else
  {
    uint64_t v38 = (void *)MEMORY[0x230FBD990]();
    [(HMDActionSet *)v12 _issueWriteRequests:v9];
  }
LABEL_12:
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDActionSet *)self executionTimeoutTimer];

  if (v5 == v4)
  {
    BOOL v6 = [(HMDActionSet *)self executionMessage];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        int v12 = 138543362;
        int v13 = v10;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Timer execution timeout triggered. Resetting executionInProgress.", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v11 = [MEMORY[0x263F087E8] hmErrorWithCode:8];
      [(HMDActionSet *)v8 handleExecutionCompletionWithResponsePayload:0 error:v11];
    }
  }
}

- (void)handleExecutionCompletionWithResponsePayload:(id)a3 error:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v45 = a3;
  id v7 = a4;
  id v8 = [(HMDActionSet *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc(MEMORY[0x263F424F0]);
  uint64_t v10 = NSString;
  uint64_t v11 = MEMORY[0x230FBBCF0](self, a2);
  int v12 = [v10 stringWithFormat:@"%@, %s:%ld", v11, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 2486];
  id v46 = (void *)[v9 initWithName:v12];

  int v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  HMFGetOSLogHandle();
  __int16 v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    long long v49 = 0uLL;
    uint64_t v17 = [(HMDActionSet *)v14 executionMessage];
    id v18 = [v17 identifier];

    if (v18)
    {
      id v19 = [(HMDActionSet *)v14 executionMessage];
      id v20 = [v19 identifier];
      [v20 getUUIDBytes:&v49];
    }
    else
    {
      long long v49 = *MEMORY[0x263F42690];
    }
    long long v50 = v49;
    *(_DWORD *)buf = 138543874;
    id v52 = v16;
    __int16 v53 = 1042;
    int v54 = 16;
    __int16 v55 = 2098;
    long long v56 = &v50;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Action set execution completed for request identifier: %{public,uuid_t}.16P", buf, 0x1Cu);
  }
  id v21 = [(HMDActionSet *)v14 executionMessage];
  id v22 = [(HMDActionSet *)v14 executionInitialStates];
  uint64_t v23 = [(HMDActionSet *)v14 executionActionSetEvent];
  [(HMDActionSet *)v14 setExecutionActionSetEvent:0];
  [(HMDActionSet *)v14 setExecutionMessage:0];
  [(HMDActionSet *)v14 setExecutionStart:0];
  [(HMDActionSet *)v14 setExecutionTimeoutTimer:0];
  [(HMDActionSet *)v14 setExecutionInitialStates:0];
  uint64_t v24 = [(HMDActionSet *)v14 home];
  if (v24)
  {
    uint64_t v25 = [MEMORY[0x263EFF910] date];
    [(HMDActionSet *)v14 setLastExecutionDate:v25];

    uint64_t v26 = [v21 name];
    __int16 v27 = (void *)v26;
    char v28 = @"kExecuteActionSetRequestKey";
    if (v26) {
      char v28 = (__CFString *)v26;
    }
    id v29 = v28;

    [v24 saveWithReason:v29 postSyncNotification:0];
    long long v47 = @"kActionSetLastexecutionDate";
    long long v30 = [(HMDActionSet *)v14 lastExecutionDate];
    long long v48 = v30;
    __int16 v31 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];

    uint64_t v32 = (void *)MEMORY[0x263F42590];
    int v33 = [(HMDActionSet *)v14 messageDestination];
    int v34 = [v32 messageWithName:@"kActionSetExecutedNotificationKey" destination:v33 payload:v31];

    uint32_t v35 = [v21 identifier];
    [v34 setIdentifier:v35];

    objc_msgSend(v34, "setRemote:", objc_msgSend(v21, "isRemote"));
    int v36 = [(HMDActionSet *)v14 msgDispatcher];
    [v36 sendMessage:v34];

    id v37 = [v21 responseHandler];

    if (v37)
    {
      id v38 = v7;
      if (!v38)
      {
        -[HMDActionSet _generateOverallError:forSource:](v14, "_generateOverallError:forSource:", v45, [v21 source]);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
      }
      int v39 = (void *)[v45 mutableCopy];
      [v39 setObject:v22 forKeyedSubscript:@"kCharacteristicValuesBeforeWrite"];
      [v21 respondWithPayload:v39 error:v38];
    }
    [v24 handleReportingSessionResponseMessage:v34];
    [v24 endReportingSessionForMessage:v21];
    __int16 v40 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v40 submitLogEvent:v23 error:v7];
  }
  else
  {
    __int16 v41 = (void *)MEMORY[0x230FBD990]();
    uint64_t v42 = v14;
    HMFGetOSLogHandle();
    uint64_t v43 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v52 = v44;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring execution completion because home reference is nil", buf, 0xCu);
    }
  }

  __HMFActivityScopeLeave();
}

- (id)_generateOverallError:(id)a3 forSource:(unint64_t)a4
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 count])
  {
    __int16 v66 = [MEMORY[0x263F087E8] hmErrorWithCode:63];
    id v67 = (void *)MEMORY[0x230FBD990]();
    long long v68 = self;
    uint64_t v69 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v70 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v111 = v70;
      __int16 v112 = 2112;
      v113 = v68;
      __int16 v114 = 2112;
      id v115 = v66;
      _os_log_impl(&dword_22F52A000, v69, OS_LOG_TYPE_ERROR, "%{public}@No accessories were changed so noting that action set %@ failed with error: %@", buf, 0x20u);
    }
    id v65 = v66;
    goto LABEL_67;
  }
  v86 = +[HMDHAPMetadata getSharedInstance];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v6 = v5;
  uint64_t v82 = [v6 countByEnumeratingWithState:&v103 objects:v109 count:16];
  if (!v82)
  {

LABEL_62:
    long long v56 = (void *)MEMORY[0x230FBD990]();
    v71 = self;
    __int16 v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      __int16 v72 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v111 = v72;
      __int16 v112 = 2112;
      v113 = v71;
      _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Execution for action set %@ completed successfully", buf, 0x16u);
    }
    __int16 v55 = 0;
    goto LABEL_65;
  }
  id v75 = v5;
  unint64_t v7 = 0;
  uint64_t v83 = *(void *)v104;
  unint64_t v8 = 0x263F08000uLL;
  uint64_t v79 = v6;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v104 != v83) {
        objc_enumerationMutation(v6);
      }
      uint64_t v84 = v9;
      uint64_t v10 = *(void *)(*((void *)&v103 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(v6, "hmf_dictionaryForKey:", v10);
      int v12 = objc_msgSend(v11, "hmf_dataForKey:", @"HM.mediaPlaybackErrorDataKey");
      objc_msgSend(*(id *)(v8 + 2024), "hmf_unarchiveFromData:error:", v12, 0);
      id v89 = (id)objc_claimAutoreleasedReturnValue();
      if (v89)
      {
        int v13 = v11;
        uint64_t v14 = (void *)MEMORY[0x230FBD990]();
        __int16 v15 = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = unint64_t v17 = v7;
          *(_DWORD *)buf = 138543874;
          v111 = v18;
          __int16 v112 = 2112;
          v113 = self;
          __int16 v114 = 2112;
          id v115 = v89;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Received media error for action set %@: %@", buf, 0x20u);

          unint64_t v7 = v17;
        }

        ++v7;
        uint64_t v11 = v13;
        goto LABEL_15;
      }
      uint64_t v19 = objc_msgSend(v11, "hmf_dataForKey:", @"HM.genericErrorDataKey");

      objc_msgSend(*(id *)(v8 + 2024), "hmf_unarchiveFromData:error:", v19, 0);
      id v89 = (id)objc_claimAutoreleasedReturnValue();
      if (!v89)
      {
        uint64_t v25 = [(HMDActionSet *)self home];
        uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v10];
        __int16 v27 = [v25 accessoryWithUUID:v26];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v28 = v27;
        }
        else {
          char v28 = 0;
        }
        id v89 = v28;

        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v29 = v11;
        uint64_t v76 = [v29 countByEnumeratingWithState:&v99 objects:v108 count:16];
        if (!v76)
        {
          id v6 = v79;
          goto LABEL_46;
        }
        uint64_t v30 = *(void *)v100;
        v85 = self;
        v81 = v11;
        uint64_t v78 = v29;
        uint64_t v74 = *(void *)v100;
        while (1)
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v100 != v30) {
              objc_enumerationMutation(v29);
            }
            uint64_t v77 = v31;
            uint64_t v32 = objc_msgSend(v29, "hmf_dictionaryForKey:");
            long long v95 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            id v33 = v32;
            uint64_t v94 = [v33 countByEnumeratingWithState:&v95 objects:v107 count:16];
            if (!v94) {
              goto LABEL_42;
            }
            uint64_t v93 = *(void *)v96;
            uint64_t v91 = v33;
            while (2)
            {
              uint64_t v34 = 0;
              uint32_t v35 = (void *)v19;
              do
              {
                if (*(void *)v96 != v93) {
                  objc_enumerationMutation(v33);
                }
                int v36 = objc_msgSend(v33, "hmf_dictionaryForKey:", *(void *)(*((void *)&v95 + 1) + 8 * v34));
                uint64_t v19 = objc_msgSend(v36, "hmf_dataForKey:", @"kCharacteristicErrorDataKey");

                if (v19)
                {
                  id v37 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v19 error:0];
                  if (v37)
                  {
                    v92 = (void *)v19;
                    id v38 = (void *)MEMORY[0x230FBD990]();
                    int v39 = self;
                    __int16 v40 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v42 = __int16 v41 = v37;
                      *(_DWORD *)buf = 138543874;
                      v111 = v42;
                      __int16 v112 = 2112;
                      v113 = self;
                      __int16 v114 = 2112;
                      id v115 = v41;
                      _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Received error for action set %@: %@", buf, 0x20u);

                      id v37 = v41;
                    }

                    ++v7;
                    if (a4 == 1)
                    {
                      unint64_t v87 = v7;
                      uint64_t v88 = v37;
                      uint64_t v43 = HAPInstanceIDFromValue();
                      uint64_t v44 = HAPInstanceIDFromValue();
                      id v45 = [v89 findCharacteristic:v43 forService:v44];
                      id v46 = [v45 type];
                      long long v47 = [v45 service];
                      long long v48 = [v47 type];
                      int v49 = [v86 requiresDeviceUnlock:v46 forService:v48];

                      if (v49)
                      {
                        __int16 v60 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:4000];
                        uint64_t v61 = (void *)MEMORY[0x230FBD990]();
                        uint64_t v62 = v39;
                        uint64_t v63 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                        {
                          int v64 = HMFGetLogIdentifier();
                          *(_DWORD *)buf = 138543874;
                          v111 = v64;
                          __int16 v112 = 2112;
                          v113 = v85;
                          __int16 v114 = 2112;
                          id v115 = v60;
                          _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@Execution for action set %@ completed with error: %@", buf, 0x20u);
                        }
                        id v65 = v60;

                        id v5 = v75;
                        goto LABEL_66;
                      }

                      self = v85;
                      unint64_t v7 = v87;
                      id v37 = v88;
                      unint64_t v8 = 0x263F08000;
                      id v33 = v91;
                      uint64_t v19 = (uint64_t)v92;
                      goto LABEL_39;
                    }
                    unint64_t v8 = 0x263F08000;
                    uint64_t v19 = (uint64_t)v92;
                  }
                  id v33 = v91;
LABEL_39:
                }
                ++v34;
                uint32_t v35 = (void *)v19;
              }
              while (v94 != v34);
              uint64_t v94 = [v33 countByEnumeratingWithState:&v95 objects:v107 count:16];
              if (v94) {
                continue;
              }
              break;
            }
LABEL_42:

            uint64_t v31 = v77 + 1;
            id v6 = v79;
            uint64_t v11 = v81;
            id v29 = v78;
            uint64_t v30 = v74;
          }
          while (v77 + 1 != v76);
          uint64_t v76 = [v78 countByEnumeratingWithState:&v99 objects:v108 count:16];
          if (!v76)
          {
LABEL_46:

            int v12 = (void *)v19;
            goto LABEL_15;
          }
        }
      }
      v80 = v11;
      id v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = uint64_t v23 = v19;
        *(_DWORD *)buf = 138543874;
        v111 = v24;
        __int16 v112 = 2112;
        v113 = self;
        __int16 v114 = 2112;
        id v115 = v89;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received error for action set %@: %@", buf, 0x20u);

        uint64_t v19 = v23;
      }

      ++v7;
      int v12 = (void *)v19;
      uint64_t v11 = v80;
LABEL_15:

      uint64_t v9 = v84 + 1;
    }
    while (v84 + 1 != v82);
    uint64_t v50 = [v6 countByEnumeratingWithState:&v103 objects:v109 count:16];
    uint64_t v82 = v50;
  }
  while (v50);

  id v5 = v75;
  if (!v7) {
    goto LABEL_62;
  }
  long long v51 = [(HMDActionSet *)self actions];
  unint64_t v52 = [v51 count];

  uint64_t v53 = v7 >= v52 ? 63 : 64;
  uint64_t v54 = [*(id *)(v8 + 2024) hmErrorWithCode:v53];
  if (!v54) {
    goto LABEL_62;
  }
  __int16 v55 = (void *)v54;
  long long v56 = (void *)MEMORY[0x230FBD990]();
  uint64_t v57 = self;
  __int16 v58 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
  {
    id v59 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v111 = v59;
    __int16 v112 = 2112;
    v113 = self;
    __int16 v114 = 2112;
    id v115 = v55;
    _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Execution for action set %@ completed with error: %@", buf, 0x20u);
  }
LABEL_65:

  id v65 = v55;
LABEL_66:

LABEL_67:
  return v65;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(HMDActionSet *)self actions];
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

- (NSArray)associatedAccessories
{
  uint64_t v2 = [(HMDActionSet *)self actions];
  id v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_157);

  return (NSArray *)v3;
}

uint64_t __37__HMDActionSet_associatedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 associatedAccessories];
}

- (void)_handleRemoveAppDataModel:(id)a3 message:(id)a4
{
  id v5 = a4;
  id v6 = [v5 transactionResult];
  [(HMDActionSet *)self setAppData:0];
  [v6 markChanged];
  [v5 respondWithPayload:0];
}

- (void)_handleUpdateAppDataModel:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 transactionResult];
  uint64_t v9 = [(HMDActionSet *)self appData];

  if (v9)
  {
    long long v10 = [(HMDActionSet *)self appData];
    [v10 updateWithModel:v6];
  }
  else
  {
    long long v11 = [HMDApplicationData alloc];
    long long v12 = [v6 appDataDictionary];
    long long v13 = [(HMDActionSet *)self uuid];
    uint64_t v14 = [(HMDApplicationData *)v11 initWithDictionary:v12 parentUUID:v13];
    [(HMDActionSet *)self setAppData:v14];

    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    unint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = [v6 appDataDictionary];
      int v20 = 138543618;
      id v21 = v18;
      __int16 v22 = 2112;
      uint64_t v23 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);
    }
  }
  [v8 markChanged];
  [v7 respondWithPayload:0];
}

- (void)_handleUpdateActionRequest:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kActionUUID"];
  id v6 = [(HMDActionSet *)self actionWithUUID:v5];
  uint64_t v7 = [(HMDActionSet *)self home];
  unint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    long long v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = 2;
  }
  else
  {
    switch([v6 type])
    {
      case 0:
        id v12 = v6;
        objc_opt_class();
        int v13 = objc_opt_isKindOfClass() & 1;
        if (v13) {
          uint64_t v14 = v12;
        }
        else {
          uint64_t v14 = 0;
        }
        id v15 = v14;

        if (v13)
        {
          [(HMDActionSet *)self _updateWriteAction:v12 forMessage:v4];
          goto LABEL_28;
        }
        uint64_t v25 = (void *)MEMORY[0x230FBD990]();
        id v29 = self;
        __int16 v27 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        goto LABEL_38;
      case 1:
        id v12 = v6;
        objc_opt_class();
        int v16 = objc_opt_isKindOfClass() & 1;
        if (v16) {
          unint64_t v17 = v12;
        }
        else {
          unint64_t v17 = 0;
        }
        id v18 = v17;

        if (v16)
        {
          [(HMDActionSet *)self _updatePlaybackAction:v12 forMessage:v4];
          goto LABEL_28;
        }
        uint64_t v25 = (void *)MEMORY[0x230FBD990]();
        uint64_t v30 = self;
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        goto LABEL_39;
      case 3:
        id v12 = v6;
        objc_opt_class();
        int v19 = objc_opt_isKindOfClass() & 1;
        if (v19) {
          int v20 = v12;
        }
        else {
          int v20 = 0;
        }
        id v21 = v20;

        if (v19)
        {
          [(HMDActionSet *)self _updateNaturalLightingAction:v12 forMessage:v4];
          goto LABEL_28;
        }
        uint64_t v25 = (void *)MEMORY[0x230FBD990]();
        uint64_t v31 = self;
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        goto LABEL_39;
      case 4:
        id v12 = v6;
        objc_opt_class();
        int v22 = objc_opt_isKindOfClass() & 1;
        if (v22) {
          uint64_t v23 = v12;
        }
        else {
          uint64_t v23 = 0;
        }
        id v24 = v23;

        if (v22)
        {
          [(HMDActionSet *)self _updateAppleMediaAccessoryPowerAction:v12 forMessage:v4];
LABEL_28:

          goto LABEL_44;
        }
        uint64_t v25 = (void *)MEMORY[0x230FBD990]();
        uint64_t v32 = self;
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
LABEL_38:
          id v33 = HMFGetLogIdentifier();
          HMActionTypeAsString();
          uint64_t v34 = (HMDActionSet *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__int16 v40 = 138543874;
          *(void *)&v40[4] = v33;
          *(_WORD *)&v40[12] = 2112;
          *(void *)&v40[14] = v12;
          *(_WORD *)&v40[22] = 2112;
          __int16 v41 = v34;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", v40, 0x20u);
        }
LABEL_39:

LABEL_40:
        uint32_t v35 = (void *)MEMORY[0x230FBD990]();
        int v36 = self;
        id v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          id v38 = HMFGetLogIdentifier();
          *(_DWORD *)__int16 v40 = 138543874;
          *(void *)&v40[4] = v38;
          *(_WORD *)&v40[12] = 2112;
          *(void *)&v40[14] = v6;
          *(_WORD *)&v40[22] = 2112;
          __int16 v41 = v36;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unknown action %@ in set %@, cannot handle update action request", v40, 0x20u);
        }
        long long v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v11 = 3;
        break;
      case 5:
        uint64_t v25 = (void *)MEMORY[0x230FBD990]();
        uint64_t v26 = self;
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          char v28 = HMFGetLogIdentifier();
          *(_DWORD *)__int16 v40 = 138543362;
          *(void *)&v40[4] = v28;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@This action type is not supported for update", v40, 0xCu);
        }
        goto LABEL_39;
      default:
        goto LABEL_40;
    }
  }
  int v39 = objc_msgSend(v10, "hmErrorWithCode:", v11, *(_OWORD *)v40, *(void *)&v40[16], v41);
  [v4 respondWithError:v39];

LABEL_44:
}

- (void)_updateAppleMediaAccessoryPowerAction:(id)a3 forMessage:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 dictionaryForKey:@"kActionInfo"];
  BOOL v9 = objc_msgSend(v8, "hmf_UUIDForKey:", *MEMORY[0x263F0B9B0]);
  long long v10 = objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x263F0B9C0]);
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  int v13 = HMFGetOSLogHandle();
  uint64_t v14 = v13;
  if (v9) {
    BOOL v15 = v10 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      uint32_t v35 = v10;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@accessoryUUID or targetSleepWakeState is nil: %@, %@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544386;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      uint32_t v35 = v8;
      __int16 v36 = 2112;
      id v37 = v9;
      __int16 v38 = 2112;
      int v39 = v10;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating Apple TV power action: %@, with action info: %@, accessoryUUID: %@, targetSleepWakeState: %@", buf, 0x34u);
    }
    int v19 = [(HMDActionSet *)v12 home];
    int v20 = [v19 backingStore];
    id v21 = [v20 context];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__HMDActionSet__updateAppleMediaAccessoryPowerAction_forMessage___block_invoke;
    v23[3] = &unk_264A28EB0;
    id v24 = v6;
    uint64_t v25 = v12;
    id v26 = v9;
    id v27 = v10;
    id v28 = v19;
    id v29 = v7;
    id v22 = v19;
    [v21 performBlock:v23];
  }
}

void __65__HMDActionSet__updateAppleMediaAccessoryPowerAction_forMessage___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[HMCContext findAppleMediaAccessoryPowerActionWithModelID:v2];

  if (!v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      unint64_t v8 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138543618;
      id v26 = v7;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to find AppleMediaAccessoryPowerAction with UUID: %@", buf, 0x16u);
    }
  }
  BOOL v9 = +[HMCContext findAppleMediaAccessoryWithModelID:*(void *)(a1 + 48)];
  [v3 setAccessory:v9];

  long long v10 = [v3 accessory];

  if (!v10)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 40);
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      BOOL v15 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find AppleMediaAccessory with UUID: %@", buf, 0x16u);
    }
  }
  [v3 setTargetSleepWakeState:*(void *)(a1 + 56)];
  int v16 = +[HMCContext currentContext];
  [v16 save];

  unint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "uuid", @"kActionUUID");
  id v18 = [v17 UUIDString];
  v24[0] = v18;
  v23[1] = @"kActionInfo";
  int v19 = [*(id *)(a1 + 32) dictionaryRepresentation];
  v24[1] = v19;
  v23[2] = @"kHomeUUID";
  int v20 = [*(id *)(a1 + 64) uuid];
  id v21 = [v20 UUIDString];
  v24[2] = v21;
  id v22 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

  [*(id *)(a1 + 72) respondWithPayload:v22];
}

- (void)_updateNaturalLightingAction:(id)a3 forMessage:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 dictionaryForKey:@"kActionInfo"];
  BOOL v9 = (void *)MEMORY[0x230FBD990]();
  long long v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v22 = 138543874;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    id v25 = v6;
    __int16 v26 = 2112;
    __int16 v27 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting action with action info %@:%@", (uint8_t *)&v22, 0x20u);
  }
  int v13 = [HMDLightProfileNaturalLightingActionModel alloc];
  uint64_t v14 = [v6 uuid];
  BOOL v15 = [(HMDActionSet *)v10 uuid];
  int v16 = [(HMDBackingStoreModelObject *)v13 initWithObjectChangeType:2 uuid:v14 parentUUID:v15];

  -[HMDLightProfileNaturalLightingActionModel setNaturalLightingEnabled:](v16, "setNaturalLightingEnabled:", objc_msgSend(v8, "hmf_BOOLForKey:", *MEMORY[0x263F0CFF8]));
  unint64_t v17 = [(HMDActionSet *)v10 home];
  id v18 = [v17 backingStore];
  int v19 = [v7 name];
  int v20 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  id v21 = [v18 transaction:v19 options:v20];

  [v21 add:v16 withMessage:v7];
  [v21 run];
}

- (void)_updatePlaybackAction:(id)a3 forMessage:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 dictionaryForKey:@"kActionInfo"];
  BOOL v9 = objc_msgSend(v8, "hmf_arrayForKey:", *MEMORY[0x263F0D110]);
  uint64_t v69 = v6;
  if (v9)
  {
    long long v10 = [MEMORY[0x263EFFA08] setWithArray:v9];
  }
  else
  {
    long long v10 = 0;
  }
  if ([v10 count])
  {
    long long v68 = objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x263F0D120]);
    uint64_t v11 = [v68 integerValue];
    v71 = objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x263F0D130]);
    id v12 = objc_msgSend(v8, "hmf_dataForKey:", *MEMORY[0x263F0D100]);
    if (v12)
    {
      v70 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:0];
    }
    else
    {
      v70 = 0;
    }

    int v19 = (void *)MEMORY[0x230FBD990]();
    int v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      uint64_t v78 = v22;
      __int16 v79 = 2112;
      v80 = v68;
      __int16 v81 = 2112;
      uint64_t v82 = v71;
      __int16 v83 = 2112;
      uint64_t v84 = v70;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@actionInfo state %@ volume %@ playbackArchive %@", buf, 0x2Au);
    }
    if (v71 || v70 || v11)
    {
      id v65 = v9;
      __int16 v66 = v8;
      id v67 = v7;
      __int16 v27 = [(HMDActionSet *)v20 home];
      uint64_t v28 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v10, "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v29 = v10;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v73 != v32) {
              objc_enumerationMutation(v29);
            }
            __int16 v34 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v72 + 1) + 8 * i)];
            uint32_t v35 = [v27 mediaProfileWithUUID:v34];
            if (v35) {
              [v28 addObject:v35];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v31);
      }

      if ([v28 count])
      {
        id v6 = v69;
        uint64_t v36 = [v69 validate];
        id v7 = v67;
        if (v36)
        {
          id v37 = (void *)v36;
          [v67 respondWithError:v36];
        }
        else
        {
          id v38 = objc_alloc((Class)[v69 modelClass]);
          int v39 = [v69 modelIdentifier];
          uint64_t v40 = [(HMDActionSet *)v20 uuid];
          int v64 = (void *)[v38 initWithObjectChangeType:2 uuid:v39 parentUUID:v40];

          uint64_t v41 = [v68 integerValue];
          if (v41 != [v69 state]) {
            [v64 setState:v68];
          }
          uint64_t v42 = [v69 volume];
          char v43 = HMFEqualObjects();

          if ((v43 & 1) == 0) {
            [v64 setVolume:v71];
          }
          uint64_t v44 = [v69 mediaProfiles];
          char v45 = HMFEqualObjects();

          if ((v45 & 1) == 0)
          {
            [v64 setProfiles:v29];
            id v46 = mapProfilesToAccessoryUUIDs(v27, v29);
            [v64 setAccessories:v46];

            long long v47 = mapProfilesToServiceUUIDs(v27, v29);
            [v64 setServices:v47];
          }
          long long v48 = [v69 playbackArchive];
          char v49 = HMFEqualObjects();

          if ((v49 & 1) == 0) {
            uint64_t v50 = [v64 setEncodedPlaybackArchive:v70];
          }
          long long v51 = (void *)MEMORY[0x230FBD990](v50);
          unint64_t v52 = v20;
          uint64_t v53 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v54 = HMFGetLogIdentifier();
            [v64 state];
            __int16 v55 = v63 = v51;
            [v64 volume];
            v56 = uint64_t v62 = v52;
            uint64_t v57 = [v64 encodedPlaybackArchive];
            *(_DWORD *)buf = 138544130;
            uint64_t v78 = v54;
            __int16 v79 = 2112;
            v80 = v55;
            __int16 v81 = 2112;
            uint64_t v82 = v56;
            __int16 v83 = 2112;
            uint64_t v84 = v57;
            _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@model state %@ volume %@ playbackArchive %@", buf, 0x2Au);

            unint64_t v52 = v62;
            long long v51 = v63;
          }
          __int16 v58 = [v27 backingStore];
          id v59 = [v67 name];
          __int16 v60 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
          uint64_t v61 = [v58 transaction:v59 options:v60];

          [v61 add:v64 withMessage:v67];
          [v61 run];

          id v37 = 0;
        }
      }
      else
      {
        id v37 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        id v7 = v67;
        [v67 respondWithError:v37];
        id v6 = v69;
      }

      BOOL v9 = v65;
      unint64_t v8 = v66;
      id v18 = v68;
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      __int16 v24 = v20;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v78 = v26;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@At least one parameter change needed in the updateAction request", buf, 0xCu);
      }
      __int16 v27 = [MEMORY[0x263F087E8] hmErrorWithCode:20 description:@"No action set in update action request" reason:0 suggestion:0];
      [v7 respondWithError:v27];
      id v18 = v68;
    }
  }
  else
  {
    int v13 = v10;
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    BOOL v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v78 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@At least one media profile needed in the updateAction request", buf, 0xCu);
    }
    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:20 description:@"At least one media profile needed in the updateAction request" reason:0 suggestion:0];
    [v7 respondWithError:v18];
    long long v10 = v13;
  }
}

- (void)_updateWriteAction:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 uuidForKey:@"kActionUUID"];
  BOOL v9 = [v7 dictionaryForKey:@"kActionInfo"];
  long long v10 = [v9 objectForKeyedSubscript:@"kCharacteristicValue"];
  if (v10)
  {
    uint64_t v11 = [v6 characteristic];
    id v25 = v10;
    id v12 = [v11 validateValueForWrite:v10 outValue:&v25];
    id v13 = v25;

    if (v12)
    {
      [v7 respondWithError:v12];
    }
    else
    {
      BOOL v15 = [HMDCharacteristicWriteActionModel alloc];
      int v16 = [(HMDActionSet *)self uuid];
      int v22 = [(HMDBackingStoreModelObject *)v15 initWithObjectChangeType:2 uuid:v8 parentUUID:v16];

      [(HMDCharacteristicWriteActionModel *)v22 setTargetValue:v10];
      unint64_t v17 = [(HMDActionSet *)self home];
      id v18 = [v17 backingStore];
      [v7 name];
      int v19 = v23 = v13;
      int v20 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      [v18 transaction:v19 options:v20];
      id v21 = v24 = v8;

      id v13 = v23;
      [v21 add:v22 withMessage:v7];
      [v21 run];

      unint64_t v8 = v24;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
    [v7 respondWithError:v14];
  }
}

- (BOOL)_handleRenameActionSetTransaction:(id)a3 message:(id)a4
{
  v28[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 name];
  BOOL v9 = objc_msgSend(v8, "hm_truncatedNameString");

  long long v10 = [(HMDActionSet *)self home];
  uint64_t v11 = [(HMDActionSet *)self name];
  id v12 = (id)[v10 replaceName:v11 withNewName:v9];

  [(HMDActionSet *)self setName:v9];
  v27[0] = @"kActionSetUUID";
  id v13 = [(HMDActionSet *)self uuid];
  uint64_t v14 = [v13 UUIDString];
  v28[0] = v14;
  v28[1] = v9;
  v27[1] = @"kActionSetName";
  v27[2] = @"kHomeUUID";
  BOOL v15 = [v10 uuid];
  int v16 = [v15 UUIDString];
  v28[2] = v16;
  unint64_t v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  id v18 = (void *)MEMORY[0x230FBD990]([v7 respondWithPayload:v17]);
  int v19 = self;
  int v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = HMFGetLogIdentifier();
    int v23 = 138543618;
    __int16 v24 = v21;
    __int16 v25 = 2112;
    __int16 v26 = v17;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Responded to client with payload : %@", (uint8_t *)&v23, 0x16u);
  }

  return 1;
}

- (void)_handleRenameRequest:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 stringForKey:@"kActionSetName"];
  id v6 = v5;
  if (!v5 || ![v5 length])
  {
    id v7 = (void *)MEMORY[0x263F0E0C8];
    unint64_t v8 = [(HMDActionSet *)self type];
    LOBYTE(v7) = [v7 isBuiltinActionSetType:v8];

    if ((v7 & 1) == 0)
    {
      uint64_t v36 = (void *)MEMORY[0x230FBD990]();
      id v37 = self;
      id v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        int v39 = HMFGetLogIdentifier();
        uint64_t v40 = [(HMDActionSet *)v37 type];
        uint64_t v41 = [(HMDActionSet *)v37 name];
        *(_DWORD *)buf = 138543874;
        long long v47 = v39;
        __int16 v48 = 2112;
        char v49 = v40;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v41;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Attempt to rename the actionSet %@/%@ to nil name", buf, 0x20u);
      }
      int v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = 20;
      goto LABEL_17;
    }
    BOOL v9 = +[HMDHome getBuiltinActionSets];
    long long v10 = [(HMDActionSet *)self type];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];
    uint64_t v12 = HMDLocalizedStringForKey(v11);

    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    BOOL v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      unint64_t v17 = [(HMDActionSet *)v14 type];
      *(_DWORD *)buf = 138543874;
      long long v47 = v16;
      __int16 v48 = 2112;
      char v49 = v17;
      __int16 v50 = 2112;
      uint64_t v51 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Resetting the name of built-in actionSet of type %@ to %@", buf, 0x20u);
    }

    id v6 = (void *)v12;
  }
  unint64_t v18 = HMMaxLengthForNaming();
  if ([v6 length] <= v18)
  {
    __int16 v25 = [(HMDActionSet *)self home];
    if (v25)
    {
      __int16 v26 = [(HMDActionSet *)self name];
      __int16 v27 = [v25 replaceActionSetName:v26 withNewName:v6];

      if (!v27)
      {
        uint64_t v28 = [HMDActionSetModel alloc];
        id v29 = [(HMDActionSet *)self uuid];
        uint64_t v30 = [v25 uuid];
        uint64_t v31 = [(HMDBackingStoreModelObject *)v28 initWithObjectChangeType:2 uuid:v29 parentUUID:v30];

        [(HMDActionSetModel *)v31 setName:v6];
        uint64_t v32 = [v25 backingStore];
        id v33 = [v4 name];
        __int16 v34 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        uint32_t v35 = [v32 transaction:v33 options:v34];

        [v35 add:v31 withMessage:v4];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __37__HMDActionSet__handleRenameRequest___block_invoke;
        v42[3] = &unk_264A2E210;
        id v43 = v25;
        id v44 = v6;
        char v45 = self;
        [v35 run:v42];

        __int16 v27 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      __int16 v27 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
    [v4 respondWithError:v27];
    goto LABEL_20;
  }
  int v19 = (void *)MEMORY[0x230FBD990]();
  int v20 = self;
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v47 = v22;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
  }
  int v23 = (void *)MEMORY[0x263F087E8];
  uint64_t v24 = 46;
LABEL_17:
  __int16 v25 = [v23 hmErrorWithCode:v24];
  [v4 respondWithError:v25];
LABEL_21:
}

void __37__HMDActionSet__handleRenameRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) name];
    id v4 = (id)[v2 replaceActionSetName:v3 withNewName:v5];
  }
}

- (void)_removeDonatedIntent
{
  id v3 = +[HMDDonationHandler sharedDonationHandler];
  [v3 removeIntentForActionSet:self];
}

- (void)_handleRemoveActionTransaction:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 transactionResult];
  BOOL v9 = [v6 uuid];
  long long v10 = [(HMDActionSet *)self actionWithUUID:v9];
  uint64_t v11 = [(HMDActionSet *)self home];
  uint64_t v12 = (void *)v11;
  if (v10 && v11)
  {
    [(HMDActionSet *)self _removeAction:v10 message:v7];
    if ([v12 isOwnerUser])
    {
      [v8 markChanged];
    }
    else if ([v12 isAdminUser])
    {
      [v8 markLocalChanged];
    }
    [v8 markSaveToAssistant];
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    BOOL v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      int v18 = 138543874;
      int v19 = v16;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      int v23 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Couldn't remove action as it was not found : %@ / %@", (uint8_t *)&v18, 0x20u);
    }
    unint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v7 respondWithError:v17];
  }
}

- (void)_handleRemovalOfActions:(id)a3 transaction:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) modelObjectWithChangeType:3];
        [v6 add:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_handleRemovalOfAction:(id)a3 transaction:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v10 count:1];

  -[HMDActionSet _handleRemovalOfActions:transaction:](self, "_handleRemovalOfActions:transaction:", v9, v7, v10, v11);
}

- (void)_handleRemoveActionRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kActionUUID"];
  id v6 = [(HMDActionSet *)self actionWithUUID:v5];
  uint64_t v7 = [(HMDActionSet *)self home];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v10];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    long long v12 = self;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v15 = HMFGetLogIdentifier();
      int v21 = 138543874;
      __int16 v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing action from actionSet : %@ / %@", (uint8_t *)&v21, 0x20u);
    }
    int v16 = [v8 backingStore];
    uint64_t v17 = [v4 name];
    int v18 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    int v19 = [v16 transaction:v17 options:v18];

    __int16 v20 = [v6 modelObjectWithChangeType:3];
    [v19 add:v20 withMessage:v4];
    [v19 run];
  }
}

- (void)_removeAction:(id)a3 message:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDActionSet *)self home];
  if (v8)
  {
    id v9 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11
      && ([v7 proxyConnection], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0)
      && (long long v13 = (void *)v12,
          char v14 = [v7 isEntitledForShortcutsAutomationAccess],
          v13,
          (v14 & 1) == 0))
    {
      int v39 = (void *)MEMORY[0x230FBD990]();
      uint64_t v40 = self;
      uint64_t v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        char v49 = v42;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Missing ShortcutsAutomationAccess Entitlement for Remove", buf, 0xCu);
      }
      id v29 = [MEMORY[0x263F087E8] hmErrorWithCode:80 description:@"Missing Entitlement" reason:0 suggestion:0];
      [v7 respondWithError:v29];
    }
    else
    {
      long long v15 = (void *)MEMORY[0x230FBD990]([(HMDActionSet *)self removeAction:v9]);
      int v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        int v18 = v45 = v6;
        [v9 uuid];
        int v19 = v44 = v7;
        [v19 UUIDString];
        v20 = id v43 = v15;
        [(HMDActionSet *)v16 uuid];
        __int16 v22 = v21 = v8;
        __int16 v23 = [v22 UUIDString];
        *(_DWORD *)buf = 138543874;
        char v49 = v18;
        __int16 v50 = 2112;
        uint64_t v51 = v20;
        __int16 v52 = 2112;
        uint64_t v53 = v23;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Remove Action uuid: %@, Action set uuid: %@", buf, 0x20u);

        id v8 = v21;
        id v7 = v44;

        long long v15 = v43;
        id v6 = v45;
      }

      v46[0] = @"kActionUUID";
      uint64_t v24 = [v9 uuid];
      __int16 v25 = [v24 UUIDString];
      v46[1] = @"kHomeUUID";
      v47[0] = v25;
      [v8 uuid];
      v27 = id v26 = v8;
      uint64_t v28 = [v27 UUIDString];
      v47[1] = v28;
      id v29 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];

      id v8 = v26;
      [v7 respondWithPayload:v29];
    }
  }
  else
  {
    uint64_t v30 = (void *)MEMORY[0x230FBD990]();
    uint64_t v31 = self;
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      __int16 v34 = [(HMDActionSet *)v31 name];
      [(HMDActionSet *)v31 uuid];
      v36 = id v35 = v6;
      [v36 UUIDString];
      v38 = id v37 = v7;
      *(_DWORD *)buf = 138543874;
      char v49 = v33;
      __int16 v50 = 2112;
      uint64_t v51 = v34;
      __int16 v52 = 2112;
      uint64_t v53 = v38;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@%@/%@: Ignoring _removeAction since home is nil", buf, 0x20u);

      id v6 = v35;
      id v7 = v37;
    }
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v7 respondWithError:v11];
  }
}

- (void)_handleAddAppleMediaAccessoryPowerActionTransaction:(id)a3 message:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@_handleAddAppleMediaAccessoryPowerActionTransaction:message: with model: %@", buf, 0x16u);
  }
  id v14 = 0;
  uint64_t v12 = [[HMDAppleMediaAccessoryPowerAction alloc] initWithModelObject:v6 parent:v9 error:&v14];
  id v13 = v14;
  if (v12) {
    [(HMDActionSet *)v9 _handleAddNewAction:v12 message:v7];
  }
  else {
    [v7 respondWithError:v13];
  }
}

- (void)_handleAddLightProfileNaturalLightingActionTransaction:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = 0;
  id v8 = [[HMDLightProfileNaturalLightingAction alloc] initWithModelObject:v7 parent:self error:&v10];

  id v9 = v10;
  if (v8) {
    [(HMDActionSet *)self _handleAddNewAction:v8 message:v6];
  }
  else {
    [v6 respondWithError:v9];
  }
}

- (void)_handleAddShortcutActionTransaction:(id)a3 message:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 data];

  if (v8)
  {
    id v9 = [HMDShortcutAction alloc];
    id v10 = [v6 data];
    id v11 = [v6 uuid];
    uint64_t v12 = [(HMDShortcutAction *)v9 initWithSerializedShortcut:v10 uuid:v11 actionSet:self];

    [(HMDActionSet *)self _handleAddNewAction:v12 message:v7];
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Add shortcut invalid parameter: no data", (uint8_t *)&v18, 0xCu);
    }
    __int16 v17 = [MEMORY[0x263F087E8] hmErrorWithCode:20 description:@"Invalid action properties" reason:0 suggestion:0];
    [v7 respondWithError:v17];
  }
}

- (void)_handleAddMediaPlaybackActionTransaction:(id)a3 message:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 profiles];
  if ([v8 count])
  {
    id v9 = [v6 volume];
    if (v9
      || ([v6 state], id v9 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "integerValue")))
    {

LABEL_5:
      uint64_t v41 = self;
      id v10 = [(HMDActionSet *)self home];
      id v11 = (void *)MEMORY[0x263EFF9C0];
      uint64_t v12 = [v6 profiles];
      id v13 = objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v14 = [v6 profiles];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v44 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v43 + 1) + 8 * i)];
            uint64_t v20 = [v10 mediaProfileWithUUID:v19];
            if (v20) {
              [v13 addObject:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v16);
      }

      if ([v13 count])
      {
        id v42 = 0;
        int v21 = [[HMDMediaPlaybackAction alloc] initWithModelObject:v6 parent:v41 error:&v42];
        id v22 = v42;
        if (v21)
        {
          [(HMDActionSet *)v41 _handleAddNewAction:v21 message:v7];
        }
        else
        {
          uint64_t v36 = (void *)MEMORY[0x230FBD990]();
          id v37 = v41;
          id v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            int v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            char v49 = v39;
            __int16 v50 = 2112;
            id v51 = v22;
            _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to add media playback action with error: %@", buf, 0x16u);
          }
          [v7 respondWithError:v22];
        }
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x230FBD990]();
        uint64_t v32 = v41;
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          __int16 v34 = HMFGetLogIdentifier();
          id v35 = [v6 profiles];
          *(_DWORD *)buf = 138543618;
          char v49 = v34;
          __int16 v50 = 2112;
          id v51 = v35;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Add media action could not match profile UUIDs to profiles. UUIDs: %@", buf, 0x16u);
        }
        id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Could not map profile UUIDs to media profiles" reason:0 suggestion:0];
        [v7 respondWithError:v22];
      }

      goto LABEL_29;
    }
    uint64_t v40 = [v6 encodedPlaybackArchive];

    if (v40) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  __int16 v23 = (void *)MEMORY[0x230FBD990]();
  uint64_t v24 = self;
  __int16 v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    id v26 = HMFGetLogIdentifier();
    uint64_t v27 = [v6 profiles];
    uint64_t v28 = [v6 volume];
    id v29 = [v6 state];
    uint64_t v30 = [v6 encodedPlaybackArchive];
    *(_DWORD *)buf = 138544386;
    char v49 = v26;
    __int16 v50 = 2112;
    id v51 = v27;
    __int16 v52 = 2112;
    uint64_t v53 = v28;
    __int16 v54 = 2112;
    __int16 v55 = v29;
    __int16 v56 = 2112;
    uint64_t v57 = v30;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Add media action invalid parameter: profiles : [%@], volume: %@, state: %@, encodedPlaybackArchive: %@", buf, 0x34u);
  }
  id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:20 description:@"Invalid action properties" reason:0 suggestion:0];
  [v7 respondWithError:v10];
LABEL_29:
}

- (void)_handleAddCommandActionTransaction:(id)a3 message:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v53 = a3;
  id v54 = a4;
  id v6 = [v53 matterPathUUIDs];

  if (v6)
  {
    __int16 v52 = [(HMDActionSet *)self home];
    uint64_t v62 = 0;
    uint64_t v63 = &v62;
    uint64_t v64 = 0x3032000000;
    id v65 = __Block_byref_object_copy__30540;
    __int16 v66 = __Block_byref_object_dispose__30541;
    id v67 = 0;
    id v7 = [v52 accessories];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __59__HMDActionSet__handleAddCommandActionTransaction_message___block_invoke;
    v59[3] = &unk_264A18910;
    uint64_t v61 = &v62;
    id v8 = v53;
    id v60 = v8;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v59);

    if (v63[5])
    {
      id v51 = [v54 transactionResult];
      if ([v51 source] == 1)
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v9 = [(HMDActionSet *)self actions];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v76 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v56;
          while (2)
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v56 != v11) {
                objc_enumerationMutation(v9);
              }
              id v13 = *(void **)(*((void *)&v55 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v14 = v13;
              }
              else {
                id v14 = 0;
              }
              uint64_t v15 = v14;
              if (v15)
              {
                uint64_t v16 = [(id)v63[5] firstObject];
                BOOL v17 = [(HMDMatterCommandAction *)v15 isActionForMatterPath:v16];

                if (v17)
                {
                  id v29 = (void *)MEMORY[0x230FBD990]();
                  uint64_t v30 = self;
                  HMFGetOSLogHandle();
                  uint64_t v31 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    id v32 = (id)objc_claimAutoreleasedReturnValue();
                    id v33 = [(id)v63[5] firstObject];
                    char v49 = [v33 endpointID];
                    __int16 v50 = [(id)v63[5] firstObject];
                    __int16 v34 = [v50 accessory];
                    id v35 = [(HMDAction *)v15 uuid];
                    *(_DWORD *)buf = 138544130;
                    id v69 = v32;
                    __int16 v70 = 2112;
                    v71 = v49;
                    __int16 v72 = 2112;
                    long long v73 = v34;
                    __int16 v74 = 2112;
                    long long v75 = v35;
                    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Action for endpoint/accessory %@/%@ has already existed with UUID %@. Cleaning from transaction store.", buf, 0x2Au);
                  }
                  uint64_t v36 = [MEMORY[0x263F087E8] hmErrorWithCode:1];
                  [v54 respondWithError:v36];

                  id v37 = [HMDMatterCommandActionModel alloc];
                  id v38 = [v8 uuid];
                  int v39 = [v8 parentUUID];
                  uint64_t v40 = [(HMDBackingStoreModelObject *)v37 initWithObjectChangeType:3 uuid:v38 parentUUID:v39];

                  uint64_t v41 = [v52 backingStore];
                  id v42 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
                  long long v43 = [v41 transaction:@"RemoveUnpushedActionModel" options:v42];

                  [v43 add:v40];
                  [v43 save];

                  goto LABEL_26;
                }
              }

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v76 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      int v18 = [v8 commands];
      id v9 = [v8 decodeSerializedMatterCommands:v18 home:v52];

      if (v9)
      {
        uint64_t v19 = [HMDMatterCommandAction alloc];
        uint64_t v20 = [MEMORY[0x263F08C38] UUID];
        int v21 = [v8 enforceExecutionOrder];
        uint64_t v15 = -[HMDMatterCommandAction initWithUUID:commands:enforceExecutionOrder:actionSet:](v19, "initWithUUID:commands:enforceExecutionOrder:actionSet:", v20, v9, [v21 BOOLValue], self);

        [(HMDActionSet *)self _handleAddNewAction:v15 message:v54];
LABEL_26:
      }
      else
      {
        long long v44 = (void *)MEMORY[0x230FBD990]();
        long long v45 = self;
        HMFGetOSLogHandle();
        long long v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v47 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v48 = [v8 commands];
          *(_DWORD *)buf = 138543618;
          id v69 = v47;
          __int16 v70 = 2112;
          v71 = v48;
          _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode matter commands from dictionary %@", buf, 0x16u);
        }
        id v9 = 0;
      }
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x230FBD990]();
      __int16 v25 = self;
      HMFGetOSLogHandle();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [v8 matterPathUUIDs];
        *(_DWORD *)buf = 138543618;
        id v69 = v27;
        __int16 v70 = 2112;
        v71 = v28;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Command with matterPaths with UUIDs %@ not found on accessory", buf, 0x16u);
      }
    }

    _Block_object_dispose(&v62, 8);
    __int16 v23 = v54;
  }
  else
  {
    id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    __int16 v23 = v54;
    [v54 respondWithError:v22];
  }
}

void __59__HMDActionSet__handleAddCommandActionTransaction_message___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  unint64_t v8 = v7;
  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v10;

  if (v8 | v11)
  {
    if (v8) {
      uint64_t v12 = (void *)v8;
    }
    else {
      uint64_t v12 = (void *)v11;
    }
    id v13 = [v12 matterAdapter];
    id v14 = [*(id *)(a1 + 32) matterPathUUIDs];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__HMDActionSet__handleAddCommandActionTransaction_message___block_invoke_2;
    v19[3] = &unk_264A188E8;
    id v20 = v13;
    id v15 = v13;
    uint64_t v16 = objc_msgSend(v14, "na_map:", v19);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    int v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *a4 = 1;
    }
  }
}

uint64_t __59__HMDActionSet__handleAddCommandActionTransaction_message___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matterPathWithUUID:a2];
}

- (void)_handleAddCharacteristicWriteActionTransaction:(id)a3 message:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 targetValue];
  if (!v8) {
    goto LABEL_26;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [v6 accessory];
  if (!v10) {
    goto LABEL_25;
  }
  unint64_t v11 = (void *)v10;
  uint64_t v12 = [v6 serviceID];
  if (!v12)
  {

LABEL_25:
    goto LABEL_26;
  }
  id v13 = (void *)v12;
  id v14 = [v6 characteristicID];

  if (!v14)
  {
LABEL_26:
    int v39 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v7 respondWithError:v39];

    goto LABEL_27;
  }
  id v15 = [(HMDActionSet *)self home];
  id v16 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v17 = [v6 accessory];
  int v18 = (void *)[v16 initWithUUIDString:v17];

  uint64_t v19 = [v15 accessoryWithUUID:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;

  id v22 = [v6 characteristicID];
  __int16 v23 = [v6 serviceID];
  uint64_t v24 = [v21 findCharacteristic:v22 forService:v23];

  id v67 = [v7 transactionResult];
  if ([v67 source] == 1)
  {
    id v61 = v21;
    uint64_t v63 = v18;
    id v65 = v15;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v59 = self;
    __int16 v25 = [(HMDActionSet *)self actions];
    uint64_t v26 = [(HMDCharacteristicWriteAction *)v25 countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v69;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v69 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v31 = v30;
          }
          else {
            uint64_t v31 = 0;
          }
          id v32 = v31;
          id v33 = v32;
          if (v32 && [v32 isActionForCharacteristic:v24])
          {
            uint64_t v40 = (void *)MEMORY[0x230FBD990]();
            uint64_t v41 = v59;
            id v42 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              long long v43 = HMFGetLogIdentifier();
              long long v44 = [v33 uuid];
              *(_DWORD *)buf = 138543874;
              long long v73 = v43;
              __int16 v74 = 2112;
              id v75 = v24;
              __int16 v76 = 2112;
              uint64_t v77 = v44;
              _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Action for chr (%@) has already existed with UUID %@. Cleaning from transaction store.", buf, 0x20u);
            }
            long long v45 = [MEMORY[0x263F087E8] hmErrorWithCode:1];
            [v7 respondWithError:v45];

            [v6 setObjectChangeType:3];
            id v15 = v65;
            long long v46 = [v65 backingStore];
            id v47 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
            __int16 v48 = [v46 transaction:@"RemoveUnpushedActionModel" options:v47];

            [v48 add:v6];
            [v48 save];

            id v21 = v61;
            int v18 = v63;
            goto LABEL_35;
          }
        }
        uint64_t v27 = [(HMDCharacteristicWriteAction *)v25 countByEnumeratingWithState:&v68 objects:v78 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }

    int v18 = v63;
    id v15 = v65;
    self = v59;
  }
  if (v24)
  {
    __int16 v34 = [HMDCharacteristicWriteAction alloc];
    id v35 = [v6 uuid];
    uint64_t v36 = [v6 targetValue];
    uint64_t v37 = [(HMDCharacteristicWriteAction *)v34 initWithUUID:v35 characteristic:v24 targetValue:v36 actionSet:self];
    id v38 = self;
    __int16 v25 = (HMDCharacteristicWriteAction *)v37;
  }
  else
  {
    uint64_t v64 = v18;
    __int16 v66 = v15;
    id v62 = v21;
    char v49 = (void *)MEMORY[0x230FBD990]();
    id v60 = self;
    __int16 v50 = self;
    id v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      __int16 v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v73 = v52;
      __int16 v74 = 2112;
      id v75 = v6;
      _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Characteristic is not yet available yet due to lack of PV or Resident sync. Create the action using the model: %@", buf, 0x16u);
    }
    long long v58 = [HMDCharacteristicWriteAction alloc];
    id v35 = [v6 uuid];
    id v53 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v36 = [v6 accessory];
    long long v57 = (void *)[v53 initWithUUIDString:v36];
    id v54 = [v6 serviceID];
    long long v55 = [v6 characteristicID];
    long long v56 = [v6 targetValue];
    __int16 v25 = [(HMDCharacteristicWriteAction *)v58 initWithUUID:v35 accessoryUUID:v57 serviceIID:v54 characteristicIID:v55 targetValue:v56 actionSet:v50];

    id v21 = v62;
    int v18 = v64;
    id v38 = v60;
    id v15 = v66;
  }

  [(HMDActionSet *)v38 _handleAddNewAction:v25 message:v7];
LABEL_35:

LABEL_27:
}

- (void)sendNotificationWithAction:(id)a3 message:(id)a4
{
  v26[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 name];
  int v9 = [v8 isEqualToString:@"kTransactionUpdate"];

  if (v9)
  {
    [v7 respondWithSuccess];
  }
  else
  {
    v25[0] = @"kActionUUID";
    uint64_t v10 = [v6 uuid];
    unint64_t v11 = [v10 UUIDString];
    v26[0] = v11;
    v25[1] = @"kActionInfo";
    uint64_t v12 = [v6 dictionaryRepresentation];
    v26[1] = v12;
    v25[2] = @"kHomeUUID";
    id v13 = [(HMDActionSet *)self home];
    id v14 = [v13 uuid];
    id v15 = [v14 UUIDString];
    v26[2] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      int v21 = 138543618;
      id v22 = v20;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Responding to client that ActionSet is successfully added : %@", (uint8_t *)&v21, 0x16u);
    }
    [v7 respondWithPayload:v16];
  }
}

- (void)_handleAddNewAction:(id)a3 message:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;

  if (v10
    && ([v7 proxyConnection], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v12 = (void *)v11,
        char v13 = [v7 isEntitledForShortcutsAutomationAccess],
        v12,
        (v13 & 1) == 0))
  {
    __int16 v25 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v46 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Missing ShortcutsAutomationAccess Entitlement for Add", buf, 0xCu);
    }
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:80 description:@"Missing Entitlement" reason:0 suggestion:0];
    [v7 respondWithError:v14];
  }
  else
  {
    [(HMDActionSet *)self addAction:v8];
    id v14 = [v7 transactionResult];
    [v14 markChanged];
    id v15 = (void *)MEMORY[0x230FBD990]([v14 markSaveToAssistant]);
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = id v43 = v10;
      uint64_t v19 = [v8 uuid];
      [v19 UUIDString];
      id v42 = v8;
      id v20 = v14;
      id v22 = v21 = v7;
      __int16 v23 = [(HMDActionSet *)v16 uuid];
      id v24 = [v23 UUIDString];
      *(_DWORD *)buf = 138543874;
      long long v46 = v18;
      __int16 v47 = 2112;
      id v48 = v22;
      __int16 v49 = 2112;
      __int16 v50 = v24;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Add Action uuid: %@, Action set uuid: %@", buf, 0x20u);

      id v7 = v21;
      id v14 = v20;
      id v8 = v42;

      id v10 = v43;
    }

    switch([v8 type])
    {
      case 0:
        id v29 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v30 = v29;
        }
        else {
          uint64_t v30 = 0;
        }
        id v31 = v30;

        if (v31) {
          goto LABEL_31;
        }
        long long v44 = v14;
        id v32 = v10;
        id v33 = (void *)MEMORY[0x230FBD990]();
        __int16 v34 = v16;
        id v35 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_33;
      case 1:
      case 3:
      case 4:
        [(HMDActionSet *)v16 sendNotificationWithAction:v8 message:v7];
        break;
      case 2:
        id v29 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v36 = v29;
        }
        else {
          uint64_t v36 = 0;
        }
        id v31 = v36;

        if (v31) {
          goto LABEL_31;
        }
        long long v44 = v14;
        id v32 = v10;
        id v33 = (void *)MEMORY[0x230FBD990]();
        __int16 v34 = v16;
        id v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        goto LABEL_34;
      case 5:
        uint64_t v37 = +[HMDCoreData featuresDataSource];
        int v38 = [v37 isRVCEnabled];

        if (!v38) {
          break;
        }
        id v29 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v39 = v29;
        }
        else {
          int v39 = 0;
        }
        id v31 = v39;

        if (v31)
        {
LABEL_31:
          [(HMDActionSet *)v16 sendNotificationWithAction:v29 message:v7];
        }
        else
        {
          long long v44 = v14;
          id v32 = v10;
          id v33 = (void *)MEMORY[0x230FBD990]();
          __int16 v34 = v16;
          id v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
LABEL_33:
            uint64_t v40 = HMFGetLogIdentifier();
            uint64_t v41 = HMActionTypeAsString();
            *(_DWORD *)buf = 138543874;
            long long v46 = v40;
            __int16 v47 = 2112;
            id v48 = v29;
            __int16 v49 = 2112;
            __int16 v50 = v41;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);
          }
LABEL_34:

          id v10 = v32;
          id v14 = v44;
        }

        break;
      default:
        break;
    }
  }
}

- (void)_handleUpdateActionSetFromBuilder:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v45 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating Home owned action set (from builder)", buf, 0xCu);
  }
  int v9 = [(HMDActionSet *)v6 home];
  id v10 = [(HMDActionSet *)v6 type];
  int v11 = [v10 isEqualToString:*MEMORY[0x263F0B948]];

  if (v11)
  {
    uint64_t v12 = [v4 responseHandler];
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v12[2](v12, v13, 0);
  }
  else
  {
    id v14 = [v9 backingStore];
    id v15 = [v4 name];
    id v16 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v17 = [v14 transaction:v15 options:v16];

    int v18 = [v4 messagePayload];
    uint64_t v19 = objc_msgSend(v18, "hmf_stringForKey:", @"kActionSetName");

    if (!v19) {
      goto LABEL_11;
    }
    id v20 = [(HMDActionSet *)v6 name];
    char v21 = [v19 isEqualToString:v20];

    if (v21) {
      goto LABEL_11;
    }
    id v22 = [(HMDActionSet *)v6 name];
    __int16 v23 = [v9 replaceActionSetName:v22 withNewName:v19];

    if (v23)
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      __int16 v25 = v6;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v45 = v27;
        __int16 v46 = 2112;
        __int16 v47 = v23;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to rename actionset with error: %@", buf, 0x16u);
      }
      [v4 respondWithError:v23];

      id v13 = 0;
      uint64_t v12 = 0;
    }
    else
    {
LABEL_11:
      uint64_t v28 = [v4 messagePayload];
      id v42 = 0;
      id v43 = 0;
      char v29 = -[HMDActionSet _updateActionSetFromDictionary:transaction:response:error:](v6, v28, v17, &v43, &v42);
      id v13 = v43;
      uint64_t v12 = (void (**)(id, id, void))v42;

      if (v29)
      {
        uint64_t v30 = (void *)MEMORY[0x230FBD990]();
        id v31 = v6;
        id v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          id v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v45 = v33;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating actionSet", buf, 0xCu);
        }
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __50__HMDActionSet__handleUpdateActionSetFromBuilder___block_invoke;
        v36[3] = &unk_264A1D1E8;
        id v37 = v4;
        id v38 = v19;
        int v39 = v31;
        id v40 = v9;
        id v13 = v13;
        id v41 = v13;
        [v17 run:v36];
      }
      else
      {
        __int16 v34 = [(HMDActionSet *)v6 name];
        id v35 = (id)[v9 replaceActionSetName:v19 withNewName:v34];

        [v4 respondWithError:v12];
      }
    }
  }
}

- (uint64_t)_updateActionSetFromDictionary:(void *)a3 transaction:(void *)a4 response:(void *)a5 error:
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    int v9 = objc_msgSend(v7, "hmf_arrayForKey:", @"kActionSetActions");
    id v81 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v10 = [a1 actions];
    v80 = (void *)[v10 mutableCopy];

    uint64_t v82 = [a1 home];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = v9;
    uint64_t v79 = [obj countByEnumeratingWithState:&v91 objects:v101 count:16];
    if (v79)
    {
      uint64_t v78 = *(void *)v92;
      id v75 = v7;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v92 != v78) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v91 + 1) + 8 * v11);
        objc_opt_class();
        id v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
        id v14 = v13;

        if (!v14) {
          break;
        }
        uint64_t v15 = [v82 actionWithDictionaryRepresentation:v14];
        if (!v15)
        {
          id v65 = (void *)MEMORY[0x230FBD990]();
          id v66 = a1;
          id v67 = HMFGetOSLogHandle();
          id v7 = v75;
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            long long v68 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v98 = v68;
            __int16 v99 = 2112;
            id v100 = v14;
            _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize action: %@", buf, 0x16u);
          }
          if (a5)
          {
            *a5 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
          }

          uint64_t v64 = obj;
LABEL_58:

          uint64_t v58 = 0;
          goto LABEL_65;
        }
        id v16 = (void *)v15;
        uint64_t v17 = +[HMDCoreData featuresDataSource];
        int v18 = [v17 isRVCEnabled];

        if (v18)
        {
          id v19 = v16;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass) {
            char v21 = v19;
          }
          else {
            char v21 = 0;
          }
          id v22 = v21;

          if (isKindOfClass) {
            [v19 addMatterPathsToTransactionIfNotStored:v8];
          }
        }
        [v81 addObject:v16];
        __int16 v23 = a1;
        [v16 updateActionSetIfNil:a1];
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v24 = v80;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v87 objects:v96 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v88;
LABEL_21:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v88 != v27) {
              objc_enumerationMutation(v24);
            }
            char v29 = *(void **)(*((void *)&v87 + 1) + 8 * v28);
            if ([v29 isCompatibleWithAction:v16]) {
              break;
            }
            if (v26 == ++v28)
            {
              uint64_t v26 = [v24 countByEnumeratingWithState:&v87 objects:v96 count:16];
              if (v26) {
                goto LABEL_21;
              }
              goto LABEL_27;
            }
          }
          id v30 = v29;

          if (!v30) {
            goto LABEL_30;
          }
          id v31 = [v30 uuid];
          [v16 setUuid:v31];

          id v32 = [v16 modelObjectWithChangeType:2];
          [v8 add:v32];

          [v24 removeObject:v30];
        }
        else
        {
LABEL_27:

LABEL_30:
          id v30 = [v16 modelObjectWithChangeType:1];
          [v8 add:v30];
        }

        ++v11;
        a1 = v23;
        if (v11 == v79)
        {
          id v7 = v75;
          uint64_t v79 = [obj countByEnumeratingWithState:&v91 objects:v101 count:16];
          if (v79) {
            goto LABEL_4;
          }
          goto LABEL_33;
        }
      }
      id v59 = (void *)MEMORY[0x230FBD990]();
      id v60 = a1;
      id v61 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        id v62 = HMFGetLogIdentifier();
        uint64_t v63 = [v60 name];
        *(_DWORD *)buf = 138543618;
        long long v98 = v62;
        __int16 v99 = 2112;
        id v100 = v63;
        _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_ERROR, "%{public}@Can't update action set %@; invalid serialized action",
          buf,
          0x16u);
      }
      id v7 = v75;
      uint64_t v64 = obj;
      if (a5)
      {
        *a5 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      }
      goto LABEL_58;
    }
LABEL_33:

    if ([v82 validateActionsDoNotConflict:v81])
    {
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v33 = v80;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v83 objects:v95 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v84;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v84 != v36) {
              objc_enumerationMutation(v33);
            }
            id v38 = [*(id *)(*((void *)&v83 + 1) + 8 * i) modelObjectWithChangeType:3];
            [v8 add:v38];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v83 objects:v95 count:16];
        }
        while (v35);
      }

      int v39 = objc_msgSend(v7, "hmf_dictionaryForKey:", @"kAppDataInformationKey");
      id v40 = [HMDApplicationData alloc];
      id v41 = [a1 uuid];
      id v42 = [(HMDApplicationData *)v40 initWithParentUUID:v41];

      id v43 = [a1 uuid];
      long long v44 = [v82 createModelForAppDataPayload:v39 existingAppData:v42 parentUUID:v43];

      if (v44) {
        [v8 add:v44];
      }
      long long v45 = objc_msgSend(v7, "hmf_stringForKey:", @"kActionSetName");
      if (v45)
      {
        __int16 v46 = [a1 name];
        char v47 = [v45 isEqualToString:v46];

        if ((v47 & 1) == 0)
        {
          uint64_t v48 = [HMDActionSetModel alloc];
          __int16 v49 = [a1 uuid];
          __int16 v50 = [v82 uuid];
          uint64_t v51 = [(HMDBackingStoreModelObject *)v48 initWithObjectChangeType:1 uuid:v49 parentUUID:v50];

          [(HMDActionSetModel *)v51 setName:v45];
          [v8 add:v51];
        }
      }
      __int16 v52 = [HMDActionSet alloc];
      id v53 = [a1 uuid];
      id v54 = [a1 type];
      long long v55 = [(HMDActionSet *)v52 initWithName:v45 uuid:v53 type:v54 home:v82 queue:0];

      [(HMDActionSet *)v55 setActions:v81];
      if (a4)
      {
        long long v56 = [(HMDActionSet *)v55 createPayload];
        long long v57 = (void *)[v56 mutableCopy];

        [v57 setObject:v39 forKeyedSubscript:@"kAppDataInformationKey"];
        *a4 = (id)[v57 copy];
      }
      uint64_t v58 = 1;
    }
    else
    {
      long long v69 = (void *)MEMORY[0x230FBD990]();
      id v70 = a1;
      long long v71 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        __int16 v72 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v98 = v72;
        __int16 v99 = 2112;
        id v100 = v70;
        _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_ERROR, "%{public}@Can't update action set %@; conflicting actions",
          buf,
          0x16u);
      }
      if (a5)
      {
        [MEMORY[0x263F087E8] hmErrorWithCode:3];
        uint64_t v58 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v58 = 0;
      }
    }
    uint64_t v64 = obj;
LABEL_65:
  }
  else
  {
    uint64_t v58 = 0;
  }

  return v58;
}

void __50__HMDActionSet__handleUpdateActionSetFromBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v12 = v3;
  if (v3)
  {
    [v4 respondWithError:v3];
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      id v6 = [*(id *)(a1 + 48) name];
      char v7 = [v5 isEqualToString:v6];

      if ((v7 & 1) == 0)
      {
        id v8 = *(void **)(a1 + 56);
        uint64_t v9 = *(void *)(a1 + 40);
        id v10 = [*(id *)(a1 + 48) name];
        id v11 = (id)[v8 replaceActionSetName:v9 withNewName:v10];
      }
    }
  }
  else
  {
    [v4 respondWithPayload:*(void *)(a1 + 64)];
  }
}

- (void)_handleUpdateActionSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 messagePayload];
    int v10 = 138543874;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to update ActionSet %@ / %@", (uint8_t *)&v10, 0x20u);
  }
  [(HMDActionSet *)v6 _handleUpdateActionSetFromBuilder:v4];
}

- (id)_addAppleMediaAccessoryPowerActionModelWithUUID:(id)a3 message:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v41 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Add Apple TV Power Action model", buf, 0xCu);
  }
  __int16 v12 = [HMDAppleMediaAccessoryPowerActionModel alloc];
  id v13 = [(HMDActionSet *)v9 uuid];
  id v33 = v6;
  __int16 v14 = [(HMDBackingStoreModelObject *)v12 initWithObjectChangeType:1 uuid:v6 parentUUID:v13];

  id v31 = v7;
  id v32 = [v7 dictionaryForKey:@"kActionInfo"];
  -[HMDAppleMediaAccessoryPowerActionModel loadModelWithActionInformation:](v14, "loadModelWithActionInformation:");
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [(HMDActionSet *)v9 actions];
  uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(id *)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v20 = v19;
        }
        else {
          id v20 = 0;
        }
        id v21 = v20;

        if (v21)
        {
          id v22 = [v21 accessory];
          __int16 v23 = [v22 uuid];
          [(HMDAppleMediaAccessoryPowerActionModel *)v14 accessoryUUID];
          uint64_t v25 = v24 = v14;
          int v26 = objc_msgSend(v23, "hmf_isEqualToUUID:", v25);

          __int16 v14 = v24;
          if (v26)
          {
            char v29 = [MEMORY[0x263F087E8] hmErrorWithCode:1];
            uint64_t v28 = v31;
            [v31 respondWithError:v29];

            uint64_t v27 = 0;
            goto LABEL_17;
          }
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  uint64_t v27 = v14;
  uint64_t v28 = v31;
LABEL_17:

  return v27;
}

- (id)_addLightProfileNaturalLightingModelWithUUID:(id)a3 message:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v32 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Add light profile natural lighting write action model", buf, 0xCu);
  }
  __int16 v12 = [v7 dictionaryForKey:@"kActionInfo"];
  id v13 = (void *)[v12 mutableCopy];

  if (!v13)
  {
    __int16 v14 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    [v7 respondWithError:v14];
    id v24 = 0;
    goto LABEL_16;
  }
  [v13 setObject:v6 forKeyedSubscript:@"kActionUUID"];
  __int16 v14 = +[HMDLightProfileNaturalLightingAction actionWithDictionaryRepresentation:v13 actionSet:v9];
  if (v14)
  {
    uint64_t v15 = [(HMDActionSet *)v9 actions];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __69__HMDActionSet__addLightProfileNaturalLightingModelWithUUID_message___block_invoke;
    v29[3] = &unk_264A22050;
    id v16 = v14;
    id v30 = v16;
    uint64_t v17 = objc_msgSend(v15, "na_firstObjectPassingTest:", v29);

    if (v17)
    {
      int v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = v9;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        id v22 = [v16 lightProfileUUID];
        *(_DWORD *)buf = 138543874;
        id v32 = v21;
        __int16 v33 = 2112;
        uint64_t v34 = v17;
        __int16 v35 = 2112;
        long long v36 = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Action already exists for light profile with UUID %@:%@", buf, 0x20u);
      }
      id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:1];
      [v7 respondWithError:v23];
    }
    else
    {
      int v26 = [v16 modelObjectWithChangeType:1 version:4];
      if (v26)
      {
        id v23 = v26;
        id v24 = v23;
        goto LABEL_14;
      }
      uint64_t v28 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v7 respondWithError:v28];

      id v23 = 0;
    }
    id v24 = 0;
LABEL_14:

    uint64_t v25 = v30;
    goto LABEL_15;
  }
  uint64_t v25 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  [v7 respondWithError:v25];
  id v24 = 0;
LABEL_15:

LABEL_16:
  return v24;
}

uint64_t __69__HMDActionSet__addLightProfileNaturalLightingModelWithUUID_message___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 lightProfileUUID];
    id v8 = [*(id *)(a1 + 32) lightProfileUUID];
    uint64_t v9 = [v7 isEqual:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_addMediaPlaybackActionModelWithUUID:(id)a3 message:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v58 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Add media playback action model", buf, 0xCu);
  }
  __int16 v12 = [HMDMediaPlaybackActionModel alloc];
  id v13 = [(HMDActionSet *)v9 uuid];
  __int16 v14 = [(HMDBackingStoreModelObject *)v12 initWithObjectChangeType:1 uuid:v6 parentUUID:v13];

  uint64_t v15 = [v7 dictionaryForKey:@"kActionInfo"];
  [(HMDMediaPlaybackActionModel *)v14 loadModelWithActionInformation:v15];
  id v16 = [(HMDActionSet *)v9 home];
  uint64_t v17 = [(HMDMediaPlaybackActionModel *)v14 profiles];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __61__HMDActionSet__addMediaPlaybackActionModelWithUUID_message___block_invoke;
  v54[3] = &unk_264A188C0;
  id v18 = v16;
  id v55 = v18;
  id v19 = objc_msgSend(v17, "na_map:", v54);

  id v20 = [(HMDMediaPlaybackActionModel *)v14 profiles];
  id v21 = mapProfilesToAccessoryUUIDs(v18, v20);
  [(HMDMediaPlaybackActionModel *)v14 setAccessories:v21];

  id v22 = [(HMDMediaPlaybackActionModel *)v14 profiles];
  id v23 = mapProfilesToServiceUUIDs(v18, v22);
  [(HMDMediaPlaybackActionModel *)v14 setServices:v23];

  if ([v19 count]
    && ([(HMDMediaPlaybackActionModel *)v14 accessories],
        id v24 = objc_claimAutoreleasedReturnValue(),
        uint64_t v25 = [v24 count],
        v24,
        v25)
    && v18)
  {
    id v46 = v18;
    id v47 = v6;
    uint64_t v48 = v15;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    int v26 = [(HMDActionSet *)v9 actions];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(id *)(*((void *)&v50 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v32 = v31;
          }
          else {
            id v32 = 0;
          }
          id v33 = v32;

          if (v33)
          {
            uint64_t v34 = [v33 mediaProfiles];
            int v35 = [v34 intersectsSet:v19];

            if (v35)
            {
              long long v44 = [MEMORY[0x263F087E8] hmErrorWithCode:1];
              [v7 respondWithError:v44];

              goto LABEL_24;
            }
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }

    int v26 = [(HMDMediaPlaybackActionModel *)v14 validate];
    if (v26)
    {
      [v7 respondWithError:v26];
LABEL_24:
      id v43 = 0;
      id v6 = v47;
    }
    else
    {
      id v43 = v14;
      id v6 = v47;
    }
    uint64_t v15 = v48;
    id v18 = v46;
  }
  else
  {
    long long v36 = (void *)MEMORY[0x230FBD990]();
    uint64_t v37 = v9;
    long long v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      int v39 = HMFGetLogIdentifier();
      [(HMDMediaPlaybackActionModel *)v14 accessories];
      __int16 v49 = v15;
      id v40 = v7;
      v42 = id v41 = v6;
      *(_DWORD *)buf = 138544386;
      uint64_t v58 = v39;
      __int16 v59 = 2112;
      id v60 = v41;
      __int16 v61 = 2112;
      id v62 = v19;
      __int16 v63 = 2112;
      uint64_t v64 = v42;
      __int16 v65 = 2112;
      id v66 = v18;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Attempt to add playback action model with UUID (%@) and mediaProfiles: (%@) and accessories (%@) on home (%@)", buf, 0x34u);

      id v6 = v41;
      id v7 = v40;
      uint64_t v15 = v49;
    }
    int v26 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v7 respondWithError:v26];
    id v43 = 0;
  }

  return v43;
}

id __61__HMDActionSet__addMediaPlaybackActionModelWithUUID_message___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  id v6 = [*(id *)(a1 + 32) mediaProfileWithUUID:v5];

  return v6;
}

- (id)_addCharacteristicWriteActionModelWithUUID:(id)a3 message:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v70 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Add characteristic write action model", buf, 0xCu);
  }
  __int16 v12 = [HMDCharacteristicWriteActionModel alloc];
  id v13 = [(HMDActionSet *)v9 uuid];
  __int16 v14 = [(HMDBackingStoreModelObject *)v12 initWithObjectChangeType:1 uuid:v6 parentUUID:v13];

  uint64_t v15 = [v7 dictionaryForKey:@"kActionInfo"];
  [(HMDCharacteristicWriteActionModel *)v14 loadModelWithActionInformation:v15];
  id v16 = [(HMDActionSet *)v9 home];
  id v17 = objc_alloc(MEMORY[0x263F08C38]);
  id v18 = [(HMDCharacteristicWriteActionModel *)v14 accessory];
  id v19 = (void *)[v17 initWithUUIDString:v18];
  id v20 = [v16 accessoryWithUUID:v19];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  id v23 = [(HMDCharacteristicWriteActionModel *)v14 characteristicID];
  id v24 = [(HMDCharacteristicWriteActionModel *)v14 serviceID];
  uint64_t v25 = [v22 findCharacteristic:v23 forService:v24];

  id v55 = (void *)v25;
  if (v25 && v16)
  {
    id v49 = v22;
    long long v50 = v16;
    long long v51 = v15;
    long long v52 = v7;
    id v53 = v6;
    id v54 = v14;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v26 = [(HMDActionSet *)v9 actions];
    uint64_t v27 = (void *)v25;
    uint64_t v61 = [v26 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (!v61) {
      goto LABEL_26;
    }
    uint64_t v28 = *(void *)v65;
    uint64_t v59 = *(void *)v65;
    id v60 = v26;
    while (1)
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v65 != v28) {
          objc_enumerationMutation(v26);
        }
        id v30 = *(id *)(*((void *)&v64 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v31 = v30;
        }
        else {
          id v31 = 0;
        }
        id v32 = v31;

        if (v32)
        {
          id v33 = [v32 characteristic];
          uint64_t v34 = [v33 accessory];
          id v62 = [v33 service];
          int v35 = [v33 instanceID];
          long long v36 = [v27 instanceID];
          if ([v35 isEqual:v36])
          {
            uint64_t v37 = [v34 uuid];
            long long v38 = [v27 accessory];
            int v39 = [v38 uuid];
            if ([v37 isEqual:v39])
            {
              [v62 instanceID];
              id v40 = v56 = v37;
              [v27 service];
              id v41 = v58 = v34;
              uint64_t v42 = [v41 instanceID];
              char v57 = [v40 isEqual:v42];

              uint64_t v27 = v55;
              uint64_t v34 = v58;

              uint64_t v28 = v59;
              id v26 = v60;
              if (v57)
              {
                id v46 = [MEMORY[0x263F087E8] hmErrorWithCode:1];
                id v7 = v52;
                [v52 respondWithError:v46];

                id v47 = 0;
                id v6 = v53;
                __int16 v14 = v54;
                id v16 = v50;
                uint64_t v15 = v51;
                id v22 = v49;
                goto LABEL_31;
              }
              goto LABEL_23;
            }

            uint64_t v28 = v59;
            id v26 = v60;
          }

LABEL_23:
        }
      }
      uint64_t v61 = [v26 countByEnumeratingWithState:&v64 objects:v68 count:16];
      if (!v61)
      {
LABEL_26:

        __int16 v14 = v54;
        id v43 = [(HMDCharacteristicWriteActionModel *)v54 targetValue];
        long long v44 = [(HMDCharacteristicWriteActionModel *)v54 targetValue];
        id v63 = v43;
        long long v45 = [v27 validateValueForWrite:v44 outValue:&v63];
        id v26 = v63;

        if (v45)
        {
          id v7 = v52;
          [v52 respondWithError:v45];
          id v47 = 0;
        }
        else
        {
          [(HMDCharacteristicWriteActionModel *)v54 setTargetValue:v26];
          id v47 = v54;
          id v7 = v52;
        }
        id v6 = v53;
        id v16 = v50;
        uint64_t v15 = v51;
        id v22 = v49;

        goto LABEL_31;
      }
    }
  }
  id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  [v7 respondWithError:v26];
  id v47 = 0;
LABEL_31:

  return v47;
}

- (void)_handleAddActionRequest:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v51 = 138543362;
    long long v52 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Add action to action set", (uint8_t *)&v51, 0xCu);
  }
  uint64_t v9 = [v4 uuidForKey:@"kNewObjectUUIDKey"];
  if (v9
    || ([v4 uuidForKey:@"kActionUUID"], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v10 = [(HMDActionSet *)v6 actions];
    unint64_t v11 = [v10 count];
    unint64_t v12 = maximumActionsPerActionSet;

    if (v11 >= v12)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = v6;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [(HMDActionSet *)v17 name];
        int v51 = 138543618;
        long long v52 = v19;
        __int16 v53 = 2112;
        id v54 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can't add action to action set %@; already at maximum actions allowed",
          (uint8_t *)&v51,
          0x16u);
      }
      id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:49];
      [v4 respondWithError:v13];
    }
    else
    {
      id v13 = [v4 dictionaryForKey:@"kActionInfo"];
      __int16 v14 = objc_msgSend(v13, "hmf_numberForKey:", @"kActionType");
      switch([v14 unsignedIntegerValue])
      {
        case 0:
          uint64_t v15 = [(HMDActionSet *)v6 _addCharacteristicWriteActionModelWithUUID:v9 message:v4];
          goto LABEL_22;
        case 1:
          uint64_t v15 = [(HMDActionSet *)v6 _addMediaPlaybackActionModelWithUUID:v9 message:v4];
          goto LABEL_22;
        case 2:
          if ([v4 isEntitledForShortcutsAutomationAccess])
          {
            uint64_t v25 = [(HMDBackingStoreModelObject *)[HMDShortcutActionModel alloc] initWithObjectChangeType:1 uuid:v9 parentUUID:v6->_uuid];
            id v26 = [v4 dictionaryForKey:@"kActionInfo"];
            [(HMDShortcutActionModel *)v25 loadModelWithActionInformation:v26];

            if (v25)
            {
LABEL_23:
              id v31 = [(HMDActionSet *)v6 home];
              id v32 = [v31 backingStore];
              id v33 = [v4 name];
              uint64_t v34 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
              int v35 = [v32 transaction:v33 options:v34];

              [v35 add:v25 withMessage:v4];
              [v35 run];
            }
            else
            {
LABEL_17:
              uint64_t v27 = (void *)MEMORY[0x230FBD990]();
              uint64_t v28 = v6;
              uint64_t v29 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                id v30 = HMFGetLogIdentifier();
                int v51 = 138543362;
                long long v52 = v30;
                _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Can't add action to action set, failed to create backing store model object", (uint8_t *)&v51, 0xCu);
              }
            }
          }
          else
          {
            id v47 = (void *)MEMORY[0x230FBD990]();
            uint64_t v48 = v6;
            id v49 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              long long v50 = HMFGetLogIdentifier();
              int v51 = 138543362;
              long long v52 = v50;
              _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Client does not have have entitlement for shortcut automation, cannot add action", (uint8_t *)&v51, 0xCu);
            }
            long long v44 = (void *)MEMORY[0x263F087E8];
            uint64_t v45 = 80;
LABEL_30:
            id v46 = [v44 hmErrorWithCode:v45];
            [v4 respondWithError:v46];
          }
          break;
        case 3:
          uint64_t v15 = [(HMDActionSet *)v6 _addLightProfileNaturalLightingModelWithUUID:v9 message:v4];
          goto LABEL_22;
        case 4:
          uint64_t v15 = [(HMDActionSet *)v6 _addAppleMediaAccessoryPowerActionModelWithUUID:v9 message:v4];
LABEL_22:
          uint64_t v25 = (HMDShortcutActionModel *)v15;
          if (v15) {
            goto LABEL_23;
          }
          goto LABEL_17;
        case 5:
          long long v36 = (void *)MEMORY[0x230FBD990]();
          uint64_t v37 = v6;
          long long v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            int v39 = HMFGetLogIdentifier();
            int v51 = 138543362;
            long long v52 = v39;
            _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Received a request to add an action that only available in HH2", (uint8_t *)&v51, 0xCu);
          }
          goto LABEL_27;
        default:
LABEL_27:
          id v40 = (void *)MEMORY[0x230FBD990]();
          id v41 = v6;
          uint64_t v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            id v43 = HMFGetLogIdentifier();
            int v51 = 138543362;
            long long v52 = v43;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Can't add action to action set, unsupported action type", (uint8_t *)&v51, 0xCu);
          }
          long long v44 = (void *)MEMORY[0x263F087E8];
          uint64_t v45 = 3;
          goto LABEL_30;
      }
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = v6;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      int v51 = 138543362;
      long long v52 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot add action to action set as UUID is nil.", (uint8_t *)&v51, 0xCu);
    }
    uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v9];
  }
}

- (void)_registerForMessages
{
  v37[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDActionSet *)self type];
  uint64_t v4 = *MEMORY[0x263F0B948];
  int v5 = [v3 isEqualToString:*MEMORY[0x263F0B948]];

  uint64_t v6 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:1];
  id v7 = (void *)v6;
  if (v5)
  {
    v37[0] = v6;
    id v8 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v37[1] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];

    int v10 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:4];
    v36[0] = v10;
    unint64_t v11 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v36[1] = v11;
    unint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];

    id v13 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v35[0] = v13;
    __int16 v14 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v35[1] = v14;
    uint64_t v15 = v35;
  }
  else
  {
    v34[0] = v6;
    id v16 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
    v34[1] = v16;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];

    id v17 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:4];
    v33[0] = v17;
    id v18 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
    v33[1] = v18;
    unint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];

    id v13 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v32[0] = v13;
    __int16 v14 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
    v32[1] = v14;
    uint64_t v15 = v32;
  }
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  id v20 = [(HMDActionSet *)self home];
  id v21 = [v20 administratorHandler];
  [v21 registerForMessage:@"kAddActionRequestKey" receiver:self policies:v9 selector:sel__handleAddActionRequest_];

  id v22 = [v20 administratorHandler];
  [v22 registerForMessage:@"kRemoveActionRequestKey" receiver:self policies:v12 selector:sel__handleRemoveActionRequest_];

  id v23 = [v20 administratorHandler];
  [v23 registerForMessage:@"kReplaceActionValueKey" receiver:self policies:v19 selector:sel__handleUpdateActionRequest_];

  id v24 = [v20 administratorHandler];
  uint64_t v25 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v31[0] = v25;
  id v26 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v31[1] = v26;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  [v24 registerForMessage:@"HMUpdateActionSetFromBuilderMessage" receiver:self policies:v27 selector:sel__handleUpdateActionSet_];

  uint64_t v28 = [(HMDActionSet *)self type];
  char v29 = [v28 isEqualToString:v4];

  if ((v29 & 1) == 0)
  {
    id v30 = [v20 administratorHandler];
    [v30 registerForMessage:@"kRenameActionSetRequestKey" receiver:self policies:v19 selector:sel__handleRenameRequest_];
  }
}

- (id)actionWithUUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [(HMDActionSet *)self actions];
    uint64_t v6 = objc_msgSend(v5, "hmf_firstObjectWithUUID:", v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)invalidate
{
  id v3 = [(HMDActionSet *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__HMDActionSet_invalidate__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __26__HMDActionSet_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) actions];
  uint64_t v3 = [v2 count];

  if (v3) {
    [*(id *)(a1 + 32) _removeDonatedIntent];
  }
  [*(id *)(a1 + 32) removeAllActions];
  id v4 = *(void **)(a1 + 32);
  return [v4 setMsgDispatcher:0];
}

- (void)handleRemovalOfAccessory:(id)a3 transaction:(id)a4
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  id v95 = a3;
  id v93 = a4;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  __int16 v99 = self;
  id obj = [(HMDActionSet *)self actions];
  uint64_t v97 = [obj countByEnumeratingWithState:&v116 objects:v128 count:16];
  if (v97)
  {
    long long v90 = v106;
    uint64_t v96 = *(void *)v117;
    *(void *)&long long v6 = 138543618;
    long long v89 = v6;
    while (1)
    {
      uint64_t v7 = 0;
      while (2)
      {
        if (*(void *)v117 != v96) {
          objc_enumerationMutation(obj);
        }
        uint64_t v98 = v7;
        id v8 = *(void **)(*((void *)&v116 + 1) + 8 * v7);
        switch(objc_msgSend(v8, "type", v89, v90))
        {
          case 0:
            id v9 = v8;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int v10 = v9;
            }
            else {
              int v10 = 0;
            }
            id v11 = v10;

            if (!v11)
            {
              __int16 v76 = (void *)MEMORY[0x230FBD990]();
              uint64_t v77 = v99;
              uint64_t v78 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                uint64_t v79 = HMFGetLogIdentifier();
                v80 = HMActionTypeAsString();
                *(_DWORD *)buf = 138543874;
                v123 = v79;
                __int16 v124 = 2112;
                id v125 = v9;
                __int16 v126 = 2112;
                v127 = v80;
                _os_log_impl(&dword_22F52A000, v78, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);
              }
              goto LABEL_86;
            }
            unint64_t v12 = [v95 uuid];
            id v13 = [v11 accessoryUUID];
            int v14 = [v12 isEqual:v13];

            if (v14) {
              goto LABEL_30;
            }
            goto LABEL_87;
          case 1:
            goto LABEL_39;
          case 3:
            id v15 = v8;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v16 = v15;
            }
            else {
              id v16 = 0;
            }
            id v17 = v16;

            if (v17)
            {
              id v18 = v95;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v19 = v18;
              }
              else {
                id v19 = 0;
              }
              id v20 = v19;

              id v21 = [v20 lightProfiles];
              v105[0] = MEMORY[0x263EF8330];
              v105[1] = 3221225472;
              v106[0] = __53__HMDActionSet_handleRemovalOfAccessory_transaction___block_invoke;
              v106[1] = &unk_264A1E6A8;
              id v107 = v17;
              id v22 = objc_msgSend(v21, "na_firstObjectPassingTest:", v105);

              if (v22)
              {
                id v23 = (void *)MEMORY[0x230FBD990]();
                id v24 = v99;
                uint64_t v25 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  id v26 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = v89;
                  v123 = v26;
                  __int16 v124 = 2112;
                  id v125 = v22;
                  _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Removing natural lighting action for light profile: %@", buf, 0x16u);
                }
                [(HMDActionSet *)v24 _handleRemovalOfAction:v15 transaction:v93];
              }
            }
            else
            {
              uint64_t v71 = (void *)MEMORY[0x230FBD990]();
              __int16 v72 = v99;
              long long v73 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                __int16 v74 = HMFGetLogIdentifier();
                id v75 = HMActionTypeAsString();
                *(_DWORD *)buf = 138543874;
                v123 = v74;
                __int16 v124 = 2112;
                id v125 = v15;
                __int16 v126 = 2112;
                v127 = v75;
                _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);
              }
            }

            goto LABEL_88;
          case 4:
            id v9 = v8;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v27 = v9;
            }
            else {
              uint64_t v27 = 0;
            }
            id v11 = v27;

            if (v11)
            {
              uint64_t v28 = [v11 accessory];
              char v29 = [v28 uuid];
              id v30 = [v95 uuid];
              int v31 = objc_msgSend(v29, "hmf_isEqualToUUID:", v30);

              if (v31) {
LABEL_30:
              }
                [(HMDActionSet *)v99 _handleRemovalOfAction:v9 transaction:v93];
            }
            else
            {
              __int16 v76 = (void *)MEMORY[0x230FBD990]();
              uint64_t v77 = v99;
              uint64_t v78 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                id v81 = HMFGetLogIdentifier();
                uint64_t v82 = HMActionTypeAsString();
                *(_DWORD *)buf = 138543874;
                v123 = v81;
                __int16 v124 = 2112;
                id v125 = v9;
                __int16 v126 = 2112;
                v127 = v82;
                _os_log_impl(&dword_22F52A000, v78, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);
              }
LABEL_86:
            }
LABEL_87:

            goto LABEL_88;
          case 5:
            id v32 = +[HMDCoreData featuresDataSource];
            int v33 = [v32 isRVCEnabled];

            if (!v33) {
              goto LABEL_39;
            }
            id v34 = v8;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int v35 = v34;
            }
            else {
              int v35 = 0;
            }
            id v36 = v35;

            if (v36)
            {
              uint64_t v37 = [v95 uuid];
              long long v38 = [v36 accessory];
              int v39 = [v38 uuid];
              int v40 = [v37 isEqual:v39];

              if (v40) {
                [(HMDActionSet *)v99 _handleRemovalOfAction:v34 transaction:v93];
              }

LABEL_39:
              id v41 = v8;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v42 = v41;
              }
              else {
                uint64_t v42 = 0;
              }
              id v43 = v42;

              if (v43)
              {
                long long v44 = [v43 mediaProfiles];
                uint64_t v45 = (void *)[v44 mutableCopy];

                long long v114 = 0u;
                long long v115 = 0u;
                long long v112 = 0u;
                long long v113 = 0u;
                id v46 = [v95 accessoryProfiles];
                uint64_t v104 = [v46 countByEnumeratingWithState:&v112 objects:v121 count:16];
                if (!v104) {
                  goto LABEL_72;
                }
                id v91 = v41;
                long long v92 = v43;
                char v100 = 0;
                uint64_t v102 = v45;
                uint64_t v103 = *(void *)v113;
                id v47 = v46;
                long long v101 = v46;
                do
                {
                  for (uint64_t i = 0; i != v104; ++i)
                  {
                    if (*(void *)v113 != v103) {
                      objc_enumerationMutation(v47);
                    }
                    id v49 = *(id *)(*((void *)&v112 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      long long v50 = v49;
                    }
                    else {
                      long long v50 = 0;
                    }
                    id v51 = v50;

                    if (v51)
                    {
                      long long v110 = 0u;
                      long long v111 = 0u;
                      long long v108 = 0u;
                      long long v109 = 0u;
                      id v52 = v45;
                      uint64_t v53 = [v52 countByEnumeratingWithState:&v108 objects:v120 count:16];
                      if (v53)
                      {
                        uint64_t v54 = v53;
                        uint64_t v55 = *(void *)v109;
                        do
                        {
                          for (uint64_t j = 0; j != v54; ++j)
                          {
                            if (*(void *)v109 != v55) {
                              objc_enumerationMutation(v52);
                            }
                            char v57 = *(void **)(*((void *)&v108 + 1) + 8 * j);
                            uint64_t v58 = [v57 uniqueIdentifier];
                            uint64_t v59 = [v51 uniqueIdentifier];
                            int v60 = [v58 isEqual:v59];

                            if (v60)
                            {
                              [v52 removeObject:v57];
                              char v100 = 1;
                              goto LABEL_62;
                            }
                          }
                          uint64_t v54 = [v52 countByEnumeratingWithState:&v108 objects:v120 count:16];
                        }
                        while (v54);
LABEL_62:
                        id v47 = v101;
                        uint64_t v45 = v102;
                      }
                    }
                    else
                    {
                      uint64_t v61 = (void *)MEMORY[0x230FBD990]();
                      id v62 = v99;
                      id v63 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                      {
                        long long v64 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138543362;
                        v123 = v64;
                        _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_DEBUG, "%{public}@Accessory Media Profile is NIL", buf, 0xCu);
                      }
                    }
                  }
                  uint64_t v104 = [v47 countByEnumeratingWithState:&v112 objects:v121 count:16];
                }
                while (v104);

                id v43 = v92;
                if (v100)
                {
                  if ([v45 count])
                  {
                    id v46 = [v92 modelObjectWithUpdatedMediaProfiles:v45];
                    [v93 add:v46];
LABEL_72:
                  }
                  else
                  {
                    [(HMDActionSet *)v99 _handleRemovalOfAction:v91 transaction:v93];
                  }
                }
              }
              else
              {
                id v65 = v41;
                long long v66 = (void *)MEMORY[0x230FBD990]();
                long long v67 = v99;
                long long v68 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  long long v69 = HMFGetLogIdentifier();
                  id v70 = HMActionTypeAsString();
                  *(_DWORD *)buf = 138543874;
                  v123 = v69;
                  __int16 v124 = 2112;
                  id v125 = v65;
                  __int16 v126 = 2112;
                  v127 = v70;
                  _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);
                }
              }

              goto LABEL_88;
            }
            long long v83 = (void *)MEMORY[0x230FBD990]();
            long long v84 = v99;
            long long v85 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              long long v86 = HMFGetLogIdentifier();
              long long v87 = HMActionTypeAsString();
              *(_DWORD *)buf = 138543874;
              v123 = v86;
              __int16 v124 = 2112;
              id v125 = v34;
              __int16 v126 = 2112;
              v127 = v87;
              _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);
            }
LABEL_88:
            uint64_t v7 = v98 + 1;
            if (v98 + 1 != v97) {
              continue;
            }
            uint64_t v88 = [obj countByEnumeratingWithState:&v116 objects:v128 count:16];
            uint64_t v97 = v88;
            if (!v88) {
              goto LABEL_95;
            }
            break;
          default:
            goto LABEL_88;
        }
        break;
      }
    }
  }
LABEL_95:
}

uint64_t __53__HMDActionSet_handleRemovalOfAccessory_transaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) lightProfileUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  id v4 = [(HMDActionSet *)self messageTargetUUID];
  uint64_t v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)_encodeWithCoder:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDActionSet *)self home];
  [v4 encodeConditionalObject:v5 forKey:@"home"];
  long long v6 = [(HMDActionSet *)self uuid];
  uint64_t v7 = [v6 UUIDString];
  [v4 encodeObject:v7 forKey:@"actionSetUUID"];

  int v8 = objc_msgSend(v4, "hmd_isForXPCTransport");
  int v9 = objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess");
  unsigned int v10 = objc_msgSend(v4, "hmd_homeManagerOptions");
  long long v64 = self;
  if (v8)
  {
    int v63 = v9;
    if ((v9 & (v10 >> 10)) == 1)
    {
      id v11 = [(HMDActionSet *)self actions];
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __33__HMDActionSet__encodeWithCoder___block_invoke;
      v77[3] = &unk_264A22050;
      v77[4] = self;
      unint64_t v12 = objc_msgSend(v11, "na_filter:", v77);
    }
    else
    {
      int v58 = v8;
      int v60 = v5;
      id v62 = v4;
      int v31 = (void *)MEMORY[0x263EFF980];
      id v32 = self;
      int v33 = [(HMDActionSet *)self actions];
      id v34 = objc_msgSend(v31, "arrayWithCapacity:", objc_msgSend(v33, "count"));

      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id obja = [(HMDActionSet *)self actions];
      uint64_t v35 = [obja countByEnumeratingWithState:&v73 objects:v85 count:16];
      int v36 = v63;
      if (v35)
      {
        uint64_t v37 = v35;
        uint64_t v38 = *(void *)v74;
        long long v66 = v34;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v74 != v38) {
              objc_enumerationMutation(obja);
            }
            int v40 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            switch([v40 type])
            {
              case 0:
                id v41 = v40;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v42 = v41;
                }
                else {
                  uint64_t v42 = 0;
                }
                id v43 = v42;

                if (v43)
                {
                  if ([(HMDActionSet *)v32 _isValidCharacteristicWriteAction:v43])
                  {
                    goto LABEL_42;
                  }
                  goto LABEL_49;
                }
                uint64_t v45 = (void *)MEMORY[0x230FBD990]();
                id v46 = v32;
                id v47 = HMFGetOSLogHandle();
                if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_47;
                }
                goto LABEL_46;
              case 1:
              case 3:
              case 4:
              case 5:
                if (v36) {
                  [v34 addObject:v40];
                }
                break;
              case 2:
                id v41 = v40;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  long long v44 = v41;
                }
                else {
                  long long v44 = 0;
                }
                id v43 = v44;

                if (v43)
                {
                  if (v36)
                  {
LABEL_42:
                    [v34 addObject:v41];
                  }
                  else
                  {
                    long long v50 = (void *)[v43 copy];
                    id v51 = [v50 removeShortcut];

                    [v34 addObject:v51];
                  }
                }
                else
                {
                  uint64_t v45 = (void *)MEMORY[0x230FBD990]();
                  id v46 = v32;
                  id v47 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  {
LABEL_46:
                    uint64_t v48 = HMFGetLogIdentifier();
                    id v49 = HMActionTypeAsString();
                    *(_DWORD *)buf = 138543874;
                    v80 = v48;
                    __int16 v81 = 2112;
                    id v82 = v41;
                    __int16 v83 = 2112;
                    long long v84 = v49;
                    _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                    int v36 = v63;
                    id v32 = v64;
                  }
LABEL_47:

                  id v34 = v66;
                }
LABEL_49:

                break;
              default:
                continue;
            }
          }
          uint64_t v37 = [obja countByEnumeratingWithState:&v73 objects:v85 count:16];
        }
        while (v37);
      }

      unint64_t v12 = (void *)[v34 copy];
      uint64_t v5 = v60;
      id v4 = v62;
      int v8 = v58;
    }
    [v4 encodeObject:v12 forKey:@"actionSetActions"];
  }
  else
  {
    uint64_t v59 = v5;
    uint64_t v61 = v4;
    unint64_t v12 = [MEMORY[0x263EFF980] array];
    id obj = [MEMORY[0x263EFF980] array];
    id v13 = [MEMORY[0x263EFF980] array];
    int v14 = [MEMORY[0x263EFF980] array];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v15 = [(HMDActionSet *)self actions];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v18 = self;
      uint64_t v19 = *(void *)v70;
      id v65 = v15;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v70 != v19) {
            objc_enumerationMutation(v15);
          }
          id v21 = *(void **)(*((void *)&v69 + 1) + 8 * v20);
          switch([v21 type])
          {
            case 0:
              id v23 = v12;
              goto LABEL_13;
            case 1:
              id v23 = obj;
LABEL_13:
              [v23 addObject:v21];
              goto LABEL_14;
            case 2:
LABEL_14:
              id v22 = v13;
              goto LABEL_15;
            case 3:
            case 4:
              id v22 = v14;
LABEL_15:
              [v22 addObject:v21];
              break;
            case 5:
              id v24 = v14;
              uint64_t v25 = v12;
              id v26 = (void *)MEMORY[0x230FBD990]();
              uint64_t v27 = v18;
              uint64_t v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                char v29 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v80 = v29;
                _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Attempting to encode an action only available in HH2", buf, 0xCu);

                id v18 = v64;
              }

              unint64_t v12 = v25;
              int v14 = v24;
              id v15 = v65;
              break;
            default:
              break;
          }
          ++v20;
        }
        while (v17 != v20);
        uint64_t v30 = [v15 countByEnumeratingWithState:&v69 objects:v78 count:16];
        uint64_t v17 = v30;
      }
      while (v30);
    }

    id v4 = v61;
    [v61 encodeObject:v12 forKey:@"actionSetActions"];
    [v61 encodeObject:obj forKey:@"HM.actionSetMediaPlaybackActionsCodingKey"];
    [v61 encodeObject:v13 forKey:@"HM.actions.3"];
    [v61 encodeObject:v14 forKey:@"HM.actions.4"];

    uint64_t v5 = v59;
    int v8 = 0;
  }

  id v52 = [(HMDActionSet *)v64 executionMessage];
  [v4 encodeBool:v52 != 0 forKey:@"HM.actionSetExecutionInProgress"];

  if ((v8 & 1) != 0 || objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    uint64_t v53 = [(HMDActionSet *)v64 lastExecutionDate];
    [v4 encodeObject:v53 forKey:@"HM.actionSetLastExecutionDate"];
  }
  if ((objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    uint64_t v54 = [(HMDActionSet *)v64 name];
    [v4 encodeObject:v54 forKey:@"actionSetName"];

    uint64_t v55 = [(HMDActionSet *)v64 type];
    [v4 encodeObject:v55 forKey:@"actionSetType"];
  }
  long long v56 = [(HMDActionSet *)v64 appData];
  char v57 = v56;
  if (v8) {
    [v56 encodeForXPCTransportWithCoder:v4 key:@"HM.appData"];
  }
  else {
    [v4 encodeObject:v56 forKey:@"HM.appDataRepository"];
  }
}

uint64_t __33__HMDActionSet__encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v6 = v5;
    }
    else {
      long long v6 = 0;
    }
    id v7 = v6;

    uint64_t v4 = [*(id *)(a1 + 32) _isValidCharacteristicWriteAction:v7];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  [(HMDActionSet *)self _encodeWithCoder:v5];
}

- (BOOL)_isValidCharacteristicWriteAction:(id)a3
{
  id v3 = [a3 characteristic];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_initWithCoder:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  long long v6 = objc_msgSend(v4, "hm_decodeAndCacheTruncatedNameStringForKey:", @"actionSetName");
  id v7 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"actionSetType");
  if (![v7 length])
  {
    id v8 = (id)*MEMORY[0x263F0B958];

    id v7 = v8;
  }
  if ([MEMORY[0x263F0E0C8] isBuiltinActionSetType:self->_type])
  {
    int v9 = (void *)MEMORY[0x263F08C38];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    id v11 = [WeakRetained uuid];
    v39[0] = self->_type;
    unint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
    id v13 = objc_msgSend(v9, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v11, 0, v12);
  }
  else
  {
    id WeakRetained = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionSetUUID"];
    id v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:WeakRetained];
  }

  int v14 = [(HMDActionSet *)self initWithName:v6 uuid:v13 type:v7 home:v5 queue:0];
  if (v14)
  {
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.appDataRepository"];
    appData = v14->_appData;
    v14->_appData = (HMDApplicationData *)v15;

    [(HMDApplicationData *)v14->_appData updateParentUUIDIfNil:v14->_uuid];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.actionSetLastExecutionDate"];
    lastExecutionDate = v14->_lastExecutionDate;
    v14->_lastExecutionDate = (NSDate *)v17;

    uint64_t v19 = +[HMDActionSet allowedActionClasses];
    if ([v4 containsValueForKey:@"HM.actions.3"])
    {
      int v33 = v6;
      currentActions = v14->_currentActions;
      id v21 = [v4 decodeObjectOfClasses:v19 forKey:@"HM.actions.3"];
      [(NSMutableArray *)currentActions setArray:v21];

      uint64_t v22 = [v4 decodeObjectOfClasses:v19 forKey:@"HM.actions.4"];
      id v23 = (void *)v22;
      id v24 = (void *)MEMORY[0x263EFFA68];
      if (v22) {
        id v24 = (void *)v22;
      }
      id v25 = v24;

      [(NSMutableArray *)v14->_currentActions addObjectsFromArray:v25];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v26 = v14->_currentActions;
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        id v32 = v5;
        uint64_t v29 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v35 != v29) {
              objc_enumerationMutation(v26);
            }
            objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "updateActionSetIfNil:", v14, v32);
          }
          uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v28);
        id v5 = v32;
      }
      long long v6 = v33;
    }
    else
    {
      id v25 = [v4 decodeObjectOfClasses:v19 forKey:@"actionSetActions"];
      [(NSMutableArray *)v14->_currentActions setArray:v25];
      id v26 = [v4 decodeObjectOfClasses:v19 forKey:@"HM.actionSetMediaPlaybackActionsCodingKey"];
      [(NSMutableArray *)v14->_currentActions addObjectsFromArray:v26];
    }
  }
  return v14;
}

- (HMDActionSet)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  long long v6 = (HMDActionSet *)[(HMDActionSet *)self _initWithCoder:v4];

  return v6;
}

- (BOOL)containsShortcutActions
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(HMDActionSet *)self actions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) type] == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsMediaPlaybackActions
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(HMDActionSet *)self actions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) type] == 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsUnsecuringAction
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDActionSet *)self actions];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_84];

  id v5 = (void *)MEMORY[0x230FBD990]();
  long long v6 = self;
  long long v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    long long v8 = HMFGetLogIdentifier();
    long long v9 = HMFBooleanToString();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Does this actionSet contain any unsecuring action : %@", (uint8_t *)&v11, 0x16u);
  }
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __40__HMDActionSet_containsUnsecuringAction__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isUnsecuringAction];
  if (result) {
    *a4 = 1;
  }
  return result;
}

- (BOOL)containsSecureCharacteristic
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDActionSet *)self actions];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_30754];

  id v5 = (void *)MEMORY[0x230FBD990]();
  long long v6 = self;
  long long v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    long long v8 = HMFGetLogIdentifier();
    long long v9 = HMFBooleanToString();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Does this actionSet contain any Secure class accessory : %@", (uint8_t *)&v11, 0x16u);
  }
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __44__HMDActionSet_containsSecureCharacteristic__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 requiresDeviceUnlock];
  if (result) {
    *a4 = 1;
  }
  return result;
}

- (BOOL)_fixUpActions
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDActionSet *)self actions];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v57 objects:v73 count:16];
  long long v56 = self;
  if (v6)
  {
    uint64_t v8 = v6;
    char v52 = 0;
    uint64_t v9 = *(void *)v58;
    *(void *)&long long v7 = 138544642;
    long long v49 = v7;
    id v51 = v4;
    id v54 = v5;
    uint64_t v55 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        switch(objc_msgSend(v11, "type", v49))
        {
          case 0:
            id v18 = v11;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v19 = v18;
            }
            else {
              uint64_t v19 = 0;
            }
            id v20 = v19;

            if (v20)
            {
              id v21 = [v20 characteristic];
              if (v21
                && ([v20 targetValue],
                    uint64_t v22 = objc_claimAutoreleasedReturnValue(),
                    v22,
                    v22))
              {
                [v4 addObject:v20];
              }
              else
              {
                long long v35 = (void *)MEMORY[0x230FBD990]();
                long long v36 = v56;
                long long v37 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v38 = HMFGetLogIdentifier();
                  [(HMDActionSet *)v36 name];
                  int v39 = v50 = v35;
                  int v40 = [(HMDActionSet *)v36 uuid];
                  [v20 uuid];
                  id v41 = v53 = v8;
                  uint64_t v42 = [v20 targetValue];
                  *(_DWORD *)buf = v49;
                  id v62 = v38;
                  __int16 v63 = 2112;
                  id v64 = v39;
                  __int16 v65 = 2112;
                  long long v66 = v40;
                  __int16 v67 = 2112;
                  long long v68 = v41;
                  __int16 v69 = 2112;
                  long long v70 = v21;
                  __int16 v71 = 2112;
                  long long v72 = v42;
                  _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ActionSet %@/%@: Removing write action %@/%@ since the characteristic %@ or value is nil", buf, 0x3Eu);

                  uint64_t v8 = v53;
                  uint64_t v4 = v51;

                  long long v35 = v50;
                }

                char v52 = 1;
                id v5 = v54;
              }
              uint64_t v9 = v55;
            }
            else
            {
              id v43 = (void *)MEMORY[0x230FBD990]();
              long long v44 = v56;
              uint64_t v45 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                id v46 = HMFGetLogIdentifier();
                id v47 = HMActionTypeAsString();
                *(_DWORD *)buf = 138543874;
                id v62 = v46;
                __int16 v63 = 2112;
                id v64 = v18;
                __int16 v65 = 2112;
                long long v66 = v47;
                _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                id v5 = v54;
              }

              uint64_t v9 = v55;
            }

            break;
          case 1:
          case 5:
            uint64_t v12 = v8;
            id v13 = v11;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int v14 = v13;
            }
            else {
              int v14 = 0;
            }
            id v15 = v14;

            if (v15)
            {
              uint64_t v16 = [v15 mediaProfiles];
              uint64_t v17 = [v16 count];

              if (v17)
              {
                [v4 addObject:v15];
              }
              else
              {
                uint64_t v28 = (void *)MEMORY[0x230FBD990]();
                uint64_t v29 = v56;
                uint64_t v30 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  int v31 = HMFGetLogIdentifier();
                  id v32 = [(HMDActionSet *)v29 name];
                  int v33 = [(HMDActionSet *)v29 uuid];
                  long long v34 = [v15 uuid];
                  *(_DWORD *)buf = 138544130;
                  id v62 = v31;
                  __int16 v63 = 2112;
                  id v64 = v32;
                  __int16 v65 = 2112;
                  long long v66 = v33;
                  __int16 v67 = 2112;
                  long long v68 = v34;
                  _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ActionSet %@/%@: Removing media action %@ since there are no media profiles", buf, 0x2Au);

                  uint64_t v9 = v55;
                  uint64_t v4 = v51;
                }
                char v52 = 1;
                id v5 = v54;
              }
            }
            else
            {
              id v23 = (void *)MEMORY[0x230FBD990]();
              id v24 = v56;
              id v25 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                id v26 = HMFGetLogIdentifier();
                uint64_t v27 = HMActionTypeAsString();
                *(_DWORD *)buf = 138543874;
                id v62 = v26;
                __int16 v63 = 2112;
                id v64 = v13;
                __int16 v65 = 2112;
                long long v66 = v27;
                _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                uint64_t v4 = v51;
              }

              id v5 = v54;
              uint64_t v9 = v55;
            }

            uint64_t v8 = v12;
            break;
          case 2:
          case 3:
          case 4:
            [v4 addObject:v11];
            break;
          default:
            continue;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v8);
  }
  else
  {
    char v52 = 0;
  }

  [(HMDActionSet *)v56 setActions:v4];
  return v52 & 1;
}

- (NSString)serializedIdentifier
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(HMDActionSet *)self home];
  id v5 = [v4 uuid];
  uint64_t v6 = [v5 UUIDString];
  long long v7 = [(HMDActionSet *)self uuid];
  uint64_t v8 = [v7 UUIDString];
  uint64_t v9 = [v3 stringWithFormat:@"%@/%@", v6, v8];

  return (NSString *)v9;
}

- (NSArray)actions
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)[(NSMutableArray *)self->_currentActions copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)removeAllActions
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_currentActions removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  [(HMDActionSet *)self __handleActionsUpdated];
}

- (void)removeAction:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_currentActions removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  [(HMDActionSet *)self __handleActionsUpdated];
}

- (void)addAction:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_currentActions addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  [(HMDActionSet *)self __handleActionsUpdated];
}

- (void)__handleActionsUpdated
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableArray *)self->_currentActions count];
  uint64_t v5 = [(NSMutableArray *)self->_currentActions count];
  os_unfair_lock_unlock(p_lock);
  if (v5)
  {
    if (v4 != 1) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    long long v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Last action removed - removing donated intents", buf, 0xCu);
    }
    long long v10 = (void *)MEMORY[0x230FBD990]([(HMDActionSet *)v7 _removeDonatedIntent]);
    int v11 = v7;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending notification for now empty action set %@", buf, 0x16u);
    }
    int v14 = [(HMDActionSet *)v11 notificationCenter];
    id v15 = [(HMDActionSet *)v11 home];
    uint64_t v27 = @"HMDActionSetNotificationKey";
    *(void *)buf = v11;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:buf forKeys:&v27 count:1];
    [v14 postNotificationName:@"HMDHomeActionSetEmptiedNotification" object:v15 userInfo:v16];
  }
  uint64_t v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v20;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@ActionSet empty/non-empty edges - re-evaluating triggers in the home", buf, 0xCu);
  }
  id v21 = [(HMDActionSet *)v18 home];
  [v21 reEvaluateTriggers];

LABEL_12:
  uint64_t v22 = (void *)MEMORY[0x230FBD990]();
  id v23 = self;
  id v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v25;
    __int16 v29 = 2112;
    uint64_t v30 = v23;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Sending notification for updated action set %@", buf, 0x16u);
  }
  id v26 = [(HMDActionSet *)v23 notificationCenter];
  [v26 postNotificationName:@"HMDActionSetActionsUpdatedNotification" object:v23 userInfo:0];
}

- (void)setActions:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_currentActions setArray:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(HMDActionSet *)self setHome:v8];
  [(HMDActionSet *)self setMsgDispatcher:v9];
  [(HMDActionSet *)self setWorkQueue:v10];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v11 = [(HMDActionSet *)self actions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v15++) configureWithHome:v8];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  BOOL v16 = [(HMDActionSet *)self _fixUpActions];
  [(HMDActionSet *)self _registerForMessages];

  return v16;
}

- (void)auditActionsForAccessory:(id)a3 transaction:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = self;
  id v8 = [(HMDActionSet *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  __int16 v29 = v11;
  if (v11)
  {
    id v26 = v7;
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v13 = [(HMDActionSet *)v30 actions];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      id v27 = v9;
      uint64_t v28 = v12;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v18 isStaleWithAccessory:v9])
          {
            long long v19 = (void *)MEMORY[0x230FBD990]();
            long long v20 = v30;
            long long v21 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              uint64_t v22 = HMFGetLogIdentifier();
              [v29 shortDescription];
              uint64_t v23 = v16;
              id v25 = v24 = v13;
              *(_DWORD *)buf = 138543874;
              long long v36 = v22;
              __int16 v37 = 2112;
              uint64_t v38 = v25;
              __int16 v39 = 2112;
              int v40 = v18;
              _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Audit: Associated characteristic(s) no longer exists on accessory %@ for action %@", buf, 0x20u);

              uint64_t v13 = v24;
              uint64_t v16 = v23;

              id v9 = v27;
              uint64_t v12 = v28;
            }

            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v15);
    }

    id v7 = v26;
    if ((objc_msgSend(v12, "hmf_isEmpty") & 1) == 0) {
      [(HMDActionSet *)v30 _handleRemovalOfActions:v12 transaction:v26];
    }
  }
}

- (void)handleRemovalOfService:(id)a3 transaction:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v22 = a4;
  id v24 = [v6 accessory];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v21 = self;
  id obj = [(HMDActionSet *)self actions];
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    id v23 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v26 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        id v13 = v12;

        if (v13)
        {
          uint64_t v14 = [v13 serviceID];
          uint64_t v15 = [v6 instanceID];
          if ([v14 isEqualToNumber:v15])
          {
            uint64_t v16 = [v13 accessoryUUID];
            [v24 uuid];
            uint64_t v17 = v8;
            long long v19 = v18 = v9;
            int v20 = [v16 isEqual:v19];

            uint64_t v9 = v18;
            uint64_t v8 = v17;

            id v6 = v23;
            if (v20) {
              [(HMDActionSet *)v21 _handleRemovalOfAction:v11 transaction:v22];
            }
          }
          else
          {
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
}

- (void)executeWithTriggerSource:(id)a3 captureCurrentState:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(HMDActionSet *)self workQueue];

  if (v10)
  {
    id v11 = [(HMDActionSet *)self workQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __79__HMDActionSet_executeWithTriggerSource_captureCurrentState_completionHandler___block_invoke;
    v19[3] = &unk_264A2B340;
    void v19[4] = self;
    id v20 = v8;
    id v21 = v9;
    BOOL v22 = a4;
    dispatch_async(v11, v19);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = [(HMDActionSet *)v13 name];
      uint64_t v17 = [(HMDActionSet *)v13 actions];
      *(_DWORD *)buf = 138543874;
      id v24 = v15;
      __int16 v25 = 2112;
      long long v26 = v16;
      __int16 v27 = 2048;
      uint64_t v28 = [v17 count];
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Work queue hasn't been configured, bailing out the execution for action set %@ with number of actions: %lu", buf, 0x20u);
    }
    if (v9)
    {
      uint64_t v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
      (*((void (**)(id, void *, void))v9 + 2))(v9, v18, 0);
    }
  }
}

void __79__HMDActionSet_executeWithTriggerSource_captureCurrentState_completionHandler___block_invoke(uint64_t a1)
{
  void v32[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 138543618;
    long long v26 = v5;
    __int16 v27 = 2112;
    uint64_t v28 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Execute triggered action set: %@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 40) triggerType] == 2) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 3;
  }
  id v8 = (void *)MEMORY[0x263F42590];
  id v9 = [MEMORY[0x263F42570] allMessageDestinations];
  v31[0] = @"sourceType";
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7];
  v32[0] = v10;
  v31[1] = @"triggerSourceUUID";
  id v11 = [*(id *)(a1 + 40) uuid];
  uint64_t v12 = [v11 UUIDString];
  v32[1] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  uint64_t v14 = [v8 messageWithName:@"triggerSourceInternalMessage" destination:v9 payload:v13];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __79__HMDActionSet_executeWithTriggerSource_captureCurrentState_completionHandler___block_invoke_74;
  void v23[3] = &unk_264A273E0;
  id v24 = *(id *)(a1 + 48);
  uint64_t v15 = (void *)MEMORY[0x230FBD990]([v14 setResponseHandler:v23]);
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    long long v19 = [*(id *)(a1 + 32) name];
    id v20 = [*(id *)(a1 + 40) name];
    *(_DWORD *)buf = 138543874;
    long long v26 = v18;
    __int16 v27 = 2112;
    uint64_t v28 = v19;
    __int16 v29 = 2112;
    uint64_t v30 = v20;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Executing actionSet %@ due to trigger %@", buf, 0x20u);
  }
  id v21 = *(void **)(a1 + 32);
  BOOL v22 = (void *)[v14 copy];
  [v21 _execute:v22 captureCurrentState:*(unsigned __int8 *)(a1 + 56) writeRequestTuples:0];
}

uint64_t __79__HMDActionSet_executeWithTriggerSource_captureCurrentState_completionHandler___block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_execute:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDActionSet *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if ([v6 isRemote])
  {
    id v9 = [(HMDActionSet *)self home];
    uint64_t v10 = [v9 writeRequestTuplesFromMessage:v6 outUnhandledRequests:0];
  }
  else
  {
    uint64_t v10 = 0;
  }
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __34__HMDActionSet__execute_activity___block_invoke;
  v14[3] = &unk_264A18878;
  objc_copyWeak(&v18, &location);
  id v11 = v7;
  id v15 = v11;
  id v12 = v6;
  id v16 = v12;
  id v13 = v10;
  id v17 = v13;
  [(HMDActionSet *)self isAccessValidForExecutionWithMessage:v12 completion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __34__HMDActionSet__execute_activity___block_invoke(id *a1, char a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v8 = [WeakRetained workQueue];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __34__HMDActionSet__execute_activity___block_invoke_68;
      v22[3] = &unk_264A2E610;
      v22[4] = v7;
      id v23 = a1[4];
      id v24 = a1[5];
      id v25 = a1[6];
      dispatch_async(v8, v22);
    }
    else
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = v7;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v19 = HMFGetLogIdentifier();
        id v20 = [a1[4] identifier];
        id v21 = [v20 shortDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v27 = v19;
        __int16 v28 = 2114;
        __int16 v29 = v21;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Access validation failed before executing the action set", buf, 0x16u);
      }
      [a1[5] respondWithError:v5];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[4] identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v11;
      __int16 v28 = 2114;
      __int16 v29 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] HMDActionSet has been set to nil", buf, 0x16u);
    }
    id v14 = a1[5];
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v14 respondWithError:v15];
  }
}

uint64_t __34__HMDActionSet__execute_activity___block_invoke_68(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) identifier];
    id v7 = [v6 shortDescription];
    id v8 = [*(id *)(a1 + 32) name];
    [*(id *)(a1 + 48) isEntitledForSPIAccess];
    id v9 = HMFBooleanToString();
    uint64_t v10 = [*(id *)(a1 + 48) clientIdentifier];
    int v12 = 138544386;
    id v13 = v5;
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    long long v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Executing actionSet %@ for message %@/%@", (uint8_t *)&v12, 0x34u);
  }
  return [*(id *)(a1 + 32) _execute:*(void *)(a1 + 48) captureCurrentState:0 writeRequestTuples:*(void *)(a1 + 56)];
}

- (void)execute:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x263F424F0]);
  id v7 = NSString;
  id v8 = MEMORY[0x230FBBCF0](self, a2);
  id v9 = [v7 stringWithFormat:@"%@, %s:%ld", v8, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Action Sets/HMDActionSet.m", 298];
  id v15 = (id)[v6 initWithName:v9];

  uint64_t v10 = [(HMDActionSet *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__HMDActionSet_execute___block_invoke;
  block[3] = &unk_264A2F2F8;
  void block[4] = self;
  id v13 = v5;
  id v14 = v15;
  id v11 = v5;
  dispatch_async(v10, block);

  __HMFActivityScopeLeave();
}

uint64_t __24__HMDActionSet_execute___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _execute:*(void *)(a1 + 40) activity:*(void *)(a1 + 48)];
}

- (void)isAccessValidForExecutionWithMessage:(id)a3 completion:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  unint64_t v8 = [v6 source];
  id v9 = [(HMDActionSet *)self home];
  int v10 = [v9 synchronouslyFetchIsCarPlayConnectedStatus];
  if (![v9 applyDeviceLockStatus:v6]
    || ![(HMDActionSet *)self containsSecureCharacteristic]
    || ![(HMDActionSet *)self containsUnsecuringAction] && (v8 | 8) == 9)
  {
    goto LABEL_18;
  }
  if (v10 && [v9 isCarPlayAccessAllowedForActionSet:self withMessage:v6 fromSource:v8])
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    int v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v40 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Access is allowed by CarPlay access rules for action set execution", buf, 0xCu);
    }
    v7[2](v7, 1, 0);
    goto LABEL_28;
  }
  if ([v6 isEntitledForSPIAccess]) {
    int v15 = 1;
  }
  else {
    int v15 = [v6 isInternal];
  }
  if (v8 == 1)
  {
    id inited = objc_initWeak(&location, self);
    id v17 = (void *)MEMORY[0x230FBD990](inited);
    __int16 v18 = self;
    HMFGetOSLogHandle();
    long long v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v40 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Checking siri unlock access for siri triggered action set execution", buf, 0xCu);
    }
    id v21 = [v9 siriSecureAccessoryAccessController];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    void v34[2] = __64__HMDActionSet_isAccessValidForExecutionWithMessage_completion___block_invoke;
    v34[3] = &unk_264A18850;
    objc_copyWeak(&v36, &location);
    long long v35 = v7;
    char v37 = v15;
    [v21 isUnsecuringSiriActionAllowedWithCompletion:v34];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    goto LABEL_28;
  }
  if (([v6 isEntitledForSecureAccess] & 1) == 0)
  {
    uint64_t v30 = (void *)MEMORY[0x263F087E8];
    BOOL v31 = +[HMDDeviceCapabilities supportsDeviceLock];
    uint64_t v32 = 10;
    if (v15) {
      uint64_t v32 = 2003;
    }
    if (v31) {
      uint64_t v33 = 82;
    }
    else {
      uint64_t v33 = v32;
    }
    uint64_t v22 = [v30 hmErrorWithCode:v33];
  }
  else
  {
LABEL_18:
    uint64_t v22 = 0;
  }
  id v23 = (void *)MEMORY[0x230FBD990]();
  id v24 = self;
  id v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    long long v26 = HMFGetLogIdentifier();
    if (v22) {
      __int16 v27 = @"denied";
    }
    else {
      __int16 v27 = @"allowed";
    }
    if (v8 > 9) {
      __int16 v28 = @"Unknown";
    }
    else {
      __int16 v28 = off_264A1BC48[v8];
    }
    __int16 v29 = v28;
    *(_DWORD *)buf = 138544130;
    int v40 = v26;
    __int16 v41 = 2112;
    uint64_t v42 = v27;
    __int16 v43 = 2112;
    long long v44 = v29;
    __int16 v45 = 2112;
    id v46 = v22;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Access is %@ for action set execution from source: %@ for reason: %@", buf, 0x2Au);
  }
  ((void (**)(id, uint64_t, void *))v7)[2](v7, v22 == 0, v22);

LABEL_28:
}

void __64__HMDActionSet_isAccessValidForExecutionWithMessage_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = (void *)v8;
      int v10 = @"denied";
      if (a2) {
        int v10 = @"allowed";
      }
      int v19 = 138543618;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Access is %@ by siri watch unlock check for action set execution", (uint8_t *)&v19, 0x16u);
    }
    if (a2)
    {
      id v11 = 0;
    }
    else
    {
      id v14 = (void *)MEMORY[0x263F087E8];
      int v15 = *(unsigned __int8 *)(a1 + 48);
      BOOL v16 = +[HMDDeviceCapabilities supportsDeviceLock];
      uint64_t v17 = 2003;
      if (!v15) {
        uint64_t v17 = 10;
      }
      if (v16) {
        uint64_t v18 = 82;
      }
      else {
        uint64_t v18 = v17;
      }
      id v11 = [v14 hmErrorWithCode:v18];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
}

- (id)createPayload
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMDActionSet *)self uuid];
  id v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"kActionSetUUID"];

  id v6 = [(HMDActionSet *)self type];
  [v3 setObject:v6 forKeyedSubscript:@"kActionSetType"];

  id v7 = [(HMDActionSet *)self name];
  [v3 setObject:v7 forKeyedSubscript:@"kActionSetName"];

  uint64_t v8 = [(HMDActionSet *)self actions];
  id v9 = [v8 valueForKey:@"dictionaryRepresentation"];
  [v3 setObject:v9 forKeyedSubscript:@"kActionSetActions"];

  int v10 = (void *)[v3 copy];
  return v10;
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
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)dumpState
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 v29 = (void *)MEMORY[0x263F089D8];
  id v4 = [(HMDActionSet *)self name];
  uint64_t v32 = [(HMDActionSet *)self uuid];
  id v5 = [v32 UUIDString];
  uint64_t v30 = [(HMDActionSet *)self spiClientIdentifier];
  id v6 = [v30 UUIDString];
  id v7 = [(HMDActionSet *)self type];
  uint64_t v8 = [(HMDActionSet *)self lastExecutionDate];
  id v9 = [(HMDActionSet *)self actions];
  uint64_t v10 = [v9 count];
  id v11 = [(HMDActionSet *)self urlString];
  uint64_t v12 = [v29 stringWithFormat:@"ActionSet name: %@, uuid: %@, spiClientIdentifier: %@, type: %@, lastExecutionDate: %@, numActions: %tu, assistantIdentifier: %@", v4, v5, v6, v7, v8, v10, v11];

  uint64_t v33 = (void *)v12;
  [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x263F41FA8]];
  id v13 = [(HMDActionSet *)self appData];
  id v14 = [v13 dumpState];
  [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x263F41E98]];

  int v15 = [(HMDActionSet *)self actions];
  BOOL v16 = (void *)[v15 copy];

  if ([v16 count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    BOOL v31 = v16;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v23 = (void *)MEMORY[0x230FBD990]();
          [v22 type];
          id v24 = HMActionTypeAsString();
          id v25 = [v3 objectForKeyedSubscript:v24];
          if (!v25)
          {
            id v25 = [MEMORY[0x263EFF980] array];
            [v3 setObject:v25 forKeyedSubscript:v24];
          }
          long long v26 = [v22 stateDump];
          [v25 addObject:v26];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v19);
    }

    BOOL v16 = v31;
  }
  __int16 v27 = (void *)[v3 copy];

  return v27;
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x263F089D8];
  id v4 = [(HMDActionSet *)self name];
  id v5 = [(HMDActionSet *)self uuid];
  id v6 = [v5 UUIDString];
  id v7 = [(HMDActionSet *)self spiClientIdentifier];
  uint64_t v8 = [v7 UUIDString];
  id v9 = [(HMDActionSet *)self type];
  uint64_t v10 = [(HMDActionSet *)self lastExecutionDate];
  id v11 = [(HMDActionSet *)self actions];
  uint64_t v12 = [v3 stringWithFormat:@"ActionSet name: %@, uuid: %@, spiClientIdentifier: %@, type: %@, lastExecutionDate: %@, numActions: %tu", v4, v6, v8, v9, v10, objc_msgSend(v11, "count")];

  return (NSString *)v12;
}

- (void)dealloc
{
  id v3 = [(HMDActionSet *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [(HMDActionSet *)self home];
  id v5 = [v4 administratorHandler];
  [v5 deregisterReceiver:self];

  v6.receiver = self;
  v6.super_class = (Class)HMDActionSet;
  [(HMDActionSet *)&v6 dealloc];
}

- (HMDActionSet)initWithName:(id)a3 uuid:(id)a4 type:(id)a5 home:(id)a6 queue:(id)a7 notificationCenter:(id)a8
{
  v45[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v44.receiver = self;
  v44.super_class = (Class)HMDActionSet;
  uint64_t v20 = [(HMDActionSet *)&v44 init];
  if (v20)
  {
    id v42 = v19;
    id v43 = v14;
    __int16 v21 = (void *)MEMORY[0x263F425C8];
    uint64_t v22 = objc_msgSend(v14, "hm_truncatedNameString");
    uint64_t v23 = objc_msgSend(v21, "hmf_cachedInstanceForString:", v22);
    name = v20->_name;
    v20->_name = (NSString *)v23;

    uint64_t v25 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v16);
    type = v20->_type;
    v20->_type = (NSString *)v25;

    if (v16 && v17 && [MEMORY[0x263F0E0C8] isBuiltinActionSetType:v16])
    {
      __int16 v27 = (void *)MEMORY[0x263F08C38];
      __int16 v28 = [v17 uuid];
      v45[0] = v16;
      __int16 v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
      uint64_t v30 = objc_msgSend(v27, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v28, 0, v29);
    }
    else
    {
      if (v15)
      {
        uint64_t v31 = [v15 copy];
      }
      else
      {
        uint64_t v31 = [MEMORY[0x263F08C38] UUID];
      }
      uint64_t v30 = (void *)v31;
    }
    uint64_t v32 = objc_msgSend(MEMORY[0x263F425D0], "hmf_cachedInstanceForNSUUID:", v30);
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v32;

    long long v34 = spiClientIdentifierForUUID(v20->_uuid);
    uint64_t v35 = objc_msgSend(MEMORY[0x263F425D0], "hmf_cachedInstanceForNSUUID:", v34);
    spiClientIdentifier = v20->_spiClientIdentifier;
    v20->_spiClientIdentifier = (NSUUID *)v35;

    objc_storeStrong((id *)&v20->_workQueue, a7);
    objc_storeWeak((id *)&v20->_home, v17);
    uint64_t v37 = [v17 msgDispatcher];
    msgDispatcher = v20->_msgDispatcher;
    v20->_msgDispatcher = (HMFMessageDispatcher *)v37;

    uint64_t v39 = [MEMORY[0x263EFF980] array];
    currentActions = v20->_currentActions;
    v20->_currentActions = (NSMutableArray *)v39;

    v20->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_notificationCenter, a8);
    if (v18) {
      [(HMDActionSet *)v20 _registerForMessages];
    }

    id v19 = v42;
    id v14 = v43;
  }

  return v20;
}

- (HMDActionSet)initWithName:(id)a3 uuid:(id)a4 type:(id)a5 home:(id)a6 queue:(id)a7
{
  uint64_t v12 = (void *)MEMORY[0x263F08A00];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v12 defaultCenter];
  id v19 = [(HMDActionSet *)self initWithName:v17 uuid:v16 type:v15 home:v14 queue:v13 notificationCenter:v18];

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t236 != -1) {
    dispatch_once(&logCategory__hmf_once_t236, &__block_literal_global_193);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v237;
  return v2;
}

void __27__HMDActionSet_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v237;
  logCategory__hmf_once_v237 = v0;
}

+ (id)allowedActionClasses
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:7];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9, v10, v11);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_getActionsForActionSetObject
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HMDActionSet *)self actions];
  id v3 = (void *)[v2 count];

  if (!v3) {
    goto LABEL_63;
  }
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  id v5 = [(HMDActionSet *)self actions];
  long long v89 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  uint64_t v6 = [(HMDActionSet *)self actions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v100 objects:v111 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v101;
    uint64_t v95 = *MEMORY[0x263F65320];
    uint64_t v86 = *MEMORY[0x263F65340];
    uint64_t v94 = *MEMORY[0x263F65478];
    *(void *)&long long v8 = 138543618;
    long long v85 = v8;
    uint64_t v93 = *(void *)v101;
    uint64_t v88 = v6;
    do
    {
      uint64_t v11 = 0;
      uint64_t v92 = v9;
      do
      {
        if (*(void *)v101 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v100 + 1) + 8 * v11);
        switch(objc_msgSend(v12, "type", v85))
        {
          case 0:
            id v13 = v12;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v14 = v13;
            }
            else {
              id v14 = 0;
            }
            id v15 = v14;

            if (v15)
            {
              id v16 = [v15 characteristic];
              id v17 = [v16 service];
              id v18 = [v15 targetValue];
              if (isMetricLocale_onceToken != -1) {
                dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_188923);
              }
              id v19 = getTupleForCharacteristic(v16, v18, isMetricLocale_isMetricLocale);

              if (v19)
              {
                id v20 = objc_alloc_init(MEMORY[0x263F64908]);
                __int16 v21 = [v19 attribute];
                [v20 setAttribute:v21];

                [v20 setActionType:v95];
                uint64_t v22 = [v19 value];
                [v20 setValue:v22];

                id v23 = objc_alloc_init(MEMORY[0x263F64958]);
                id v24 = NSURL;
                [v17 urlString];
                v26 = uint64_t v25 = v11;
                __int16 v27 = [v24 URLWithString:v26];
                [v23 setEntityId:v27];

                uint64_t v9 = v92;
                uint64_t v11 = v25;
                [v23 setAction:v20];
                [v89 addObject:v23];
              }
              uint64_t v10 = v93;
              uint64_t v6 = v88;
              goto LABEL_57;
            }
            uint64_t v60 = v11;
            uint64_t v61 = (void *)MEMORY[0x230FBD990]();
            id v62 = self;
            __int16 v63 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              id v64 = HMFGetLogIdentifier();
              __int16 v65 = HMActionTypeAsString();
              *(_DWORD *)buf = 138543874;
              long long v106 = v64;
              __int16 v107 = 2112;
              id v108 = v13;
              __int16 v109 = 2112;
              long long v110 = v65;
              _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

              uint64_t v9 = v92;
              uint64_t v10 = v93;
            }
            goto LABEL_45;
          case 1:
            uint64_t v91 = v11;
            id v40 = v12;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              __int16 v41 = v40;
            }
            else {
              __int16 v41 = 0;
            }
            id v42 = v41;

            if (v42)
            {
              long long v98 = 0u;
              long long v99 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              id v43 = [v42 mediaProfiles];
              uint64_t v44 = [v43 countByEnumeratingWithState:&v96 objects:v104 count:16];
              if (v44)
              {
                uint64_t v45 = v44;
                id v87 = v42;
                id v46 = 0;
                id v47 = 0;
                uint64_t v48 = *(void *)v97;
                do
                {
                  uint64_t v49 = 0;
                  long long v50 = v46;
                  id v51 = v47;
                  do
                  {
                    if (*(void *)v97 != v48) {
                      objc_enumerationMutation(v43);
                    }
                    char v52 = *(void **)(*((void *)&v96 + 1) + 8 * v49);
                    id v47 = objc_alloc_init(MEMORY[0x263F64908]);

                    [v47 setActionType:v95];
                    id v53 = objc_alloc_init(MEMORY[0x263F64920]);
                    [v53 setValue:1];
                    [v47 setValue:v53];
                    id v46 = objc_alloc_init(MEMORY[0x263F64958]);

                    id v54 = NSURL;
                    uint64_t v55 = [v52 urlString];
                    long long v56 = [v54 URLWithString:v55];
                    [v46 setEntityId:v56];

                    [v46 setAction:v47];
                    [v47 setAttribute:v94];
                    [v89 addObject:v46];

                    ++v49;
                    long long v50 = v46;
                    id v51 = v47;
                  }
                  while (v45 != v49);
                  uint64_t v45 = [v43 countByEnumeratingWithState:&v96 objects:v104 count:16];
                }
                while (v45);

                id v42 = v87;
                uint64_t v6 = v88;
                uint64_t v9 = v92;
              }

              uint64_t v10 = v93;
            }
            else
            {
              long long v68 = (void *)MEMORY[0x230FBD990]();
              __int16 v69 = self;
              long long v70 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                __int16 v71 = HMFGetLogIdentifier();
                long long v72 = HMActionTypeAsString();
                *(_DWORD *)buf = 138543874;
                long long v106 = v71;
                __int16 v107 = 2112;
                id v108 = v40;
                __int16 v109 = 2112;
                long long v110 = v72;
                _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                uint64_t v10 = v93;
                uint64_t v9 = v92;
              }
            }

            uint64_t v11 = v91;
            break;
          case 3:
            id v28 = v12;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              __int16 v29 = v28;
            }
            else {
              __int16 v29 = 0;
            }
            id v15 = v29;

            if (v15)
            {
              uint64_t v30 = [v15 lightProfile];
              uint64_t v31 = v30;
              if (v30)
              {
                uint64_t v32 = [v30 service];
                id v33 = objc_alloc_init(MEMORY[0x263F64908]);
                [v33 setActionType:v95];
                uint64_t v34 = v11;
                id v35 = objc_alloc_init(MEMORY[0x263F64920]);
                objc_msgSend(v35, "setValue:", objc_msgSend(v15, "isNaturalLightingEnabled"));
                [v33 setValue:v35];
                [v33 setAttribute:v86];
                id v36 = objc_alloc_init(MEMORY[0x263F64958]);
                uint64_t v37 = NSURL;
                uint64_t v38 = [v32 urlString];
                uint64_t v39 = [v37 URLWithString:v38];
                [v36 setEntityId:v39];

                uint64_t v9 = v92;
                [v36 setAction:v33];
                [v89 addObject:v36];

                uint64_t v11 = v34;
              }
              else
              {
                uint64_t v79 = (void *)MEMORY[0x230FBD990]();
                v80 = self;
                __int16 v81 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                {
                  id v82 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = v85;
                  long long v106 = v82;
                  __int16 v107 = 2112;
                  id v108 = v15;
                  _os_log_impl(&dword_22F52A000, v81, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting action doesn't have a light profile %@", buf, 0x16u);

                  uint64_t v9 = v92;
                }
              }

              uint64_t v10 = v93;
            }
            else
            {
              uint64_t v60 = v11;
              uint64_t v61 = (void *)MEMORY[0x230FBD990]();
              id v62 = self;
              __int16 v63 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                long long v66 = HMFGetLogIdentifier();
                __int16 v67 = HMActionTypeAsString();
                *(_DWORD *)buf = 138543874;
                long long v106 = v66;
                __int16 v107 = 2112;
                id v108 = v28;
                __int16 v109 = 2112;
                long long v110 = v67;
                _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                uint64_t v10 = v93;
                uint64_t v9 = v92;
              }
LABEL_45:

              uint64_t v11 = v60;
            }
LABEL_57:

            break;
          case 4:
            id v57 = v12;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              long long v58 = v57;
            }
            else {
              long long v58 = 0;
            }
            id v59 = v58;

            if (v59)
            {
            }
            else
            {
              long long v73 = (void *)MEMORY[0x230FBD990]();
              uint64_t v74 = self;
              long long v75 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                long long v76 = HMFGetLogIdentifier();
                HMActionTypeAsString();
                v78 = uint64_t v77 = v11;
                *(_DWORD *)buf = 138543874;
                long long v106 = v76;
                __int16 v107 = 2112;
                id v108 = v57;
                __int16 v109 = 2112;
                long long v110 = v78;
                _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_ERROR, "%{public}@Action doesn't match its type %@:%@", buf, 0x20u);

                uint64_t v11 = v77;
                uint64_t v9 = v92;
              }
            }
            break;
          default:
            break;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v100 objects:v111 count:16];
    }
    while (v9);
  }

  id v3 = v89;
  if (v89 && [v89 count]) {
    __int16 v83 = (void *)[v89 copy];
  }
  else {
LABEL_63:
  }
    __int16 v83 = 0;

  return v83;
}

- (NSDictionary)assistantObject
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [(HMDActionSet *)self home];
  id v4 = [(HMDActionSet *)self name];
  id v5 = v4;
  if (v4 && v3)
  {
    uint64_t v6 = [v3 name];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x263EFF980] array];
      long long v8 = [(HMDActionSet *)self actions];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        if ([(HMDActionSet *)self containsSecureCharacteristic])
        {
          BOOL v10 = [(HMDActionSet *)self containsUnsecuringAction];
          uint64_t v11 = (void *)MEMORY[0x263F655B0];
          if (!v10) {
            uint64_t v11 = (void *)MEMORY[0x263F655A8];
          }
          [v7 addObject:*v11];
        }
        if (![(HMDActionSet *)self containsMediaPlaybackActions]) {
          goto LABEL_17;
        }
        uint64_t v12 = (void *)MEMORY[0x263F655A0];
      }
      else
      {
        uint64_t v12 = (void *)MEMORY[0x263F655B8];
      }
      [v7 addObject:*v12];
LABEL_17:
      id v33 = v7;
      uint64_t v32 = [(HMDActionSet *)self _getActionsForActionSetObject];
      id v31 = objc_alloc(MEMORY[0x263EFF9A0]);
      v35[0] = *MEMORY[0x263F655E0];
      v34[0] = @"objectType";
      v34[1] = @"objectName";
      id v20 = [(HMDActionSet *)self name];
      v35[1] = v20;
      void v34[2] = @"objectIdentifier";
      __int16 v21 = [(HMDActionSet *)self urlString];
      void v35[2] = v21;
      v34[3] = @"objectHome";
      uint64_t v22 = [v3 name];
      v35[3] = v22;
      void v34[4] = @"objectHomeIdentifier";
      id v23 = [v3 urlString];
      v35[4] = v23;
      v35[5] = self;
      v34[5] = @"objectReference";
      v34[6] = @"objectSceneType";
      id v24 = [(HMDActionSet *)self type];
      v35[6] = v24;
      v34[7] = @"objectSPIIdentifier";
      uint64_t v25 = [(HMDActionSet *)self spiClientIdentifier];
      long long v26 = [v25 UUIDString];
      v35[7] = v26;
      __int16 v27 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:8];
      id v28 = (void *)[v31 initWithDictionary:v27];

      if (v32) {
        [v28 setObject:v32 forKey:@"objectSceneActions"];
      }
      if ([v33 count])
      {
        __int16 v29 = (void *)[v33 copy];
        [v28 setObject:v29 forKey:@"objectStatus"];
      }
      id v19 = (void *)[v28 copy];

      goto LABEL_22;
    }
  }
  else
  {
  }
  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [(HMDActionSet *)self name];
    id v17 = [(HMDActionSet *)self uuid];
    id v18 = [v17 UUIDString];
    *(_DWORD *)buf = 138544130;
    uint64_t v37 = v15;
    __int16 v38 = 2112;
    uint64_t v39 = v16;
    __int16 v40 = 2112;
    __int16 v41 = v18;
    __int16 v42 = 2112;
    id v43 = v3;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because attribute(s) is nil: actionSet %@/%@  actionSet.home %@", buf, 0x2Au);
  }
  id v19 = 0;
LABEL_22:

  return (NSDictionary *)v19;
}

- (NSString)urlString
{
  uint64_t v2 = [(HMDActionSet *)self uuid];
  id v3 = hm_assistantIdentifier();

  return (NSString *)v3;
}

@end