@interface HMDHAPAccessoryTask
- (BOOL)allResponsesReceived;
- (BOOL)supportsMultiPartResponse;
- (HMDHAPAccessoryTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5;
- (HMDHAPAccessoryTaskContext)context;
- (NSArray)characteristicResponses;
- (NSArray)requests;
- (NSDate)executionTime;
- (NSMapTable)requestToResponseMap;
- (NSNumber)identifier;
- (NSString)debugDescription;
- (NSString)description;
- (double)executionTimeInterval;
- (id)_updatedCompletion:(id)a3;
- (id)activity;
- (id)completion;
- (id)logEventsFromAccessoryRequestMap:(id)a3 accessoryList:(id)a4;
- (id)operationName;
- (id)requestIdentifier;
- (id)workQueue;
- (unint64_t)completedRequestsCount;
- (unint64_t)sourceType;
- (void)_sendCharacteristicNotificationsForTaskInProgress:(id)a3 completion:(id)a4;
- (void)_updateCharacteristicsWithResponses:(id)a3 accessoryRequests:(id)a4 completedGroup:(id)a5;
- (void)addCharacteristicResponses:(id)a3 isRemote:(BOOL)a4;
- (void)execute;
- (void)finishTaskWithCharacteristicResponses:(id)a3 completion:(id)a4;
- (void)sendCharacteristicNotificationsForCompletedTask:(id)a3 completion:(id)a4;
- (void)sendCharacteristicNotificationsForTaskInProgress:(id)a3 completion:(id)a4;
- (void)setExecutionTime:(id)a3;
@end

@implementation HMDHAPAccessoryTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_requestToResponseMap, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setExecutionTime:(id)a3
{
}

- (NSDate)executionTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (id)completion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSMapTable)requestToResponseMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)requests
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHAPAccessoryTaskContext)context
{
  return (HMDHAPAccessoryTaskContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)execute
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)_updatedCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HMDHAPAccessoryTask__updatedCompletion___block_invoke;
  aBlock[3] = &unk_1E6A18FF8;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  v6 = _Block_copy(aBlock);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __42__HMDHAPAccessoryTask__updatedCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addCharacteristicResponses:v3 isRemote:0];
    int v6 = [v5 supportsMultiPartResponse];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
    }
    else
    {
      v11 = [v5 characteristicResponses];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for fallback task completion handler", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)addCharacteristicResponses:(id)a3 isRemote:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__HMDHAPAccessoryTask_addCharacteristicResponses_isRemote___block_invoke;
  v4[3] = &unk_1E6A18F00;
  v4[4] = self;
  objc_msgSend(a3, "na_each:", v4, a4);
}

void __59__HMDHAPAccessoryTask_addCharacteristicResponses_isRemote___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 requestToResponseMap];
  id v4 = [v3 request];
  [v5 setObject:v3 forKey:v4];
}

- (BOOL)supportsMultiPartResponse
{
  v2 = [(HMDHAPAccessoryTask *)self context];
  char v3 = [v2 supportsMultiPartResponse];

  return v3;
}

- (void)finishTaskWithCharacteristicResponses:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHAPAccessoryTask *)self context];
  int v9 = [v8 isComplete];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      uint64_t v14 = [(HMDHAPAccessoryTask *)v11 context];
      v15 = [v14 requestMessage];
      int v17 = 138543874;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v11;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] associated context is already completed: %@", (uint8_t *)&v17, 0x20u);
    }
    (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, 1, 0, 0);
  }
  else
  {
    [(HMDHAPAccessoryTask *)self addCharacteristicResponses:v6 isRemote:0];
    if ([(HMDHAPAccessoryTask *)self supportsMultiPartResponse]
      && ![(HMDHAPAccessoryTask *)self allResponsesReceived])
    {
      [(HMDHAPAccessoryTask *)self sendCharacteristicNotificationsForTaskInProgress:v6 completion:v7];
    }
    else
    {
      v16 = [(HMDHAPAccessoryTask *)self characteristicResponses];
      [(HMDHAPAccessoryTask *)self sendCharacteristicNotificationsForCompletedTask:v16 completion:v7];
    }
  }
}

- (void)sendCharacteristicNotificationsForCompletedTask:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  id v7 = (void *)MEMORY[0x1D9452090](objc_msgSend(v6, "na_each:", &__block_literal_global_151));
  v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v10;
    __int16 v37 = 2112;
    v38 = v8;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[%@] Sending characteristic notifications for completed task", buf, 0x16u);
  }
  v11 = [(HMDHAPAccessoryTask *)v8 context];
  int v12 = [v11 requestMessage];

  v13 = [(HMDHAPAccessoryTask *)v8 context];
  uint64_t v14 = [v13 workQueue];

  v15 = [(HMDHAPAccessoryTask *)v8 context];
  v16 = [v15 home];

  int v17 = [(HMDHAPAccessoryTask *)v8 requests];
  v18 = objc_msgSend(v17, "na_map:", &__block_literal_global_155_186439);

  objc_initWeak((id *)buf, v16);
  __int16 v19 = [(HMDHAPAccessoryTask *)v8 context];
  v20 = [v19 requestMessageIdentifier];
  uint64_t v21 = [(HMDHAPAccessoryTask *)v8 supportsMultiPartResponse];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_2;
  v28[3] = &unk_1E6A18FD0;
  objc_copyWeak(&v34, (id *)buf);
  id v22 = v12;
  id v29 = v22;
  id v23 = v18;
  id v30 = v23;
  id v24 = v14;
  id v31 = v24;
  id v25 = v27;
  id v33 = v25;
  id v26 = v6;
  id v32 = v26;
  [v16 _notifyChangedCharacteristics:v26 identifier:v20 multiPartResponse:v21 moreMessagesInMultipart:0 requestMessage:v22 withCompletionHandler:v28];

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

void __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if ([*(id *)(a1 + 32) isRemote]) {
    [WeakRetained _sendCoalescedRemoteNotificationsForRequestMessage:*(void *)(a1 + 32) accessories:*(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 32) respondWithPayload:v6 error:v5])
  {
    v8 = 0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
  }
  int v9 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_3;
  block[3] = &unk_1E6A193D0;
  id v14 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 56);
  id v13 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

uint64_t __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

uint64_t __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_152(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

void __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 request];
  [v2 setCompleted:1];
}

- (void)_sendCharacteristicNotificationsForTaskInProgress:(id)a3 completion:(id)a4
{
  v69[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v51 = v7;
  int v9 = objc_msgSend(v7, "na_filter:", &__block_literal_global_137_186443);
  if ([v9 count])
  {
    id v10 = [(HMDHAPAccessoryTask *)self context];
    v11 = [v10 requestMessage];

    id v12 = [(HMDHAPAccessoryTask *)self context];
    v50 = [v12 workQueue];

    id v13 = [(HMDHAPAccessoryTask *)self context];
    id v14 = [v13 home];

    if ([v11 isRemote])
    {
      uint64_t v15 = objc_msgSend(v9, "na_map:", &__block_literal_global_148_186450);
      v16 = [v11 stringForKey:@"kRequestIdentifierKey"];
      int v17 = v16;
      if (!v16)
      {
        id v4 = [v11 identifier];
        int v17 = [v4 UUIDString];
      }
      BOOL v18 = [(HMDHAPAccessoryTask *)self supportsMultiPartResponse];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_5;
      v52[3] = &unk_1E6A18F68;
      id v53 = v50;
      id v55 = v8;
      id v54 = v9;
      [v14 _handleSendingNotificationsForRequest:v11 requestIdentifier:v17 supportsMultiPartResponse:v18 characteristicUpdates:v15 completion:v52];
      __int16 v19 = (HMDCharacteristicResponseNotificationContext *)v15;
      if (!v16)
      {
      }
      v20 = v53;
    }
    else
    {
      uint64_t v21 = [HMDCharacteristicResponseNotificationContext alloc];
      id v22 = [v11 identifier];
      __int16 v19 = [(HMDCharacteristicResponseNotificationContext *)v21 initWithRequestIdentifier:v22 responses:v9 pendingMultiPartResponses:1];

      v68[0] = @"kModifiedCharacteristicsForAccessoryKey";
      id v23 = [(HMDCharacteristicResponseNotificationContext *)v19 notificationPayloadByAccessoryUUID];
      v69[0] = v23;
      v68[1] = @"kHomeUUID";
      id v24 = [v14 uuid];
      [v24 UUIDString];
      id v25 = v49 = v14;
      v68[2] = @"kMultiPartResponseKey";
      v69[1] = v25;
      v69[2] = MEMORY[0x1E4F1CC38];
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];

      id v14 = v49;
      id v27 = objc_alloc(MEMORY[0x1E4F65488]);
      v28 = [v49 uuid];
      uint64_t v29 = [v27 initWithTarget:v28];

      id v30 = objc_alloc(MEMORY[0x1E4F654B0]);
      uint64_t v31 = [v11 qualityOfService];
      if (v31) {
        uint64_t v32 = v31;
      }
      else {
        uint64_t v32 = 17;
      }
      v47 = (void *)v29;
      v48 = (void *)v26;
      id v33 = (void *)[v30 initWithName:@"kMultipleCharacteristicValuesUpdatedNotificationKey" qualityOfService:v32 destination:v29 payload:v26];
      id v34 = [v11 identifier];
      [v33 setIdentifier:v34];

      v35 = (void *)MEMORY[0x1D9452090](objc_msgSend(v33, "setRequiresSPIEntitlement:", objc_msgSend(v11, "requiresSPIEntitlement")));
      v36 = self;
      __int16 v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v38 = v45 = v19;
        uint64_t v39 = [v9 count];
        [v11 shortDescription];
        v40 = id v46 = v8;
        *(_DWORD *)buf = 138544130;
        v61 = v38;
        __int16 v62 = 2112;
        v63 = v36;
        __int16 v64 = 2048;
        uint64_t v65 = v39;
        id v14 = v49;
        __int16 v66 = 2112;
        v67 = v40;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Sending the multi-part responses[%ld] to local client: %@", buf, 0x2Au);

        id v8 = v46;
        __int16 v19 = v45;
      }

      objc_msgSend(v9, "na_each:", &__block_literal_global_143_186449);
      v41 = [v11 proxyConnection];
      if ([v41 canSendMessage:v33])
      {
        [v14 handleReportingSessionResponseMessage:v33];
        v42 = v19;
        v43 = (void *)[v33 copy];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_2;
        v56[3] = &unk_1E6A18F68;
        id v57 = v50;
        id v59 = v8;
        id v58 = v9;
        [v41 sendMessage:v43 completionHandler:v56];

        __int16 v19 = v42;
        v44 = v57;
      }
      else
      {
        v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
        (*((void (**)(id, void, void *, void *))v8 + 2))(v8, 0, v9, v44);
      }

      v20 = v47;
      v16 = v48;
    }
  }
  else
  {
    (*((void (**)(id, void, void *, void))v8 + 2))(v8, 0, v9, 0);
  }
}

void __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_3;
  block[3] = &unk_1E6A193D0;
  id v9 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if ([v3 isHMError])
  {
    id v4 = v3;
    if ([v3 code] == 48)
    {

      id v4 = 0;
    }
  }
  id v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_6;
  block[3] = &unk_1E6A193D0;
  id v10 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v9 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], 0, a1[4], a1[5]);
}

HMDCharacteristicUpdateTuple *__84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [HMDCharacteristicUpdateTuple alloc];
  id v4 = [v2 request];
  id v5 = [v4 characteristic];
  id v6 = [v2 value];
  id v7 = [(HMDCharacteristicUpdateTuple *)v3 initWithCharacteristic:v5 updatedValue:v6 isBroadcast:0];

  [(HMDCharacteristicUpdateTuple *)v7 setCharacteristicResponse:v2];
  return v7;
}

uint64_t __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], 0, a1[4], a1[5]);
}

void __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_141(uint64_t a1, void *a2)
{
  id v2 = [a2 request];
  [v2 setCompleted:1];
}

BOOL __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 request];
  if ([v3 isCompleted])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v2 error];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (void)sendCharacteristicNotificationsForTaskInProgress:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "na_filter:", &__block_literal_global_133_186455);
  id v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v20 = v12;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = [v8 count];
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[%@] Sending characteristic notifications (%ld) for task in progress.", buf, 0x20u);
  }
  if ([v8 count])
  {
    id v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    [(HMDHAPAccessoryTask *)v10 addCharacteristicResponses:v8 isRemote:0];
    [(HMDHAPAccessoryTask *)v10 _updateCharacteristicsWithResponses:v8 accessoryRequests:0 completedGroup:v13];
    id v14 = [(HMDHAPAccessoryTask *)v10 context];
    uint64_t v15 = [v14 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__HMDHAPAccessoryTask_sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_134;
    block[3] = &unk_1E6A193D0;
    void block[4] = v10;
    id v17 = v8;
    id v18 = v7;
    dispatch_group_notify(v13, v15, block);
  }
  else
  {
    (*((void (**)(id, void, void *, void))v7 + 2))(v7, 0, v8, 0);
  }
}

uint64_t __83__HMDHAPAccessoryTask_sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_134(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCharacteristicNotificationsForTaskInProgress:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

BOOL __83__HMDHAPAccessoryTask_sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 request];
  if ([v3 isCompleted])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v2 error];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (void)_updateCharacteristicsWithResponses:(id)a3 accessoryRequests:(id)a4 completedGroup:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = v9;
    if (!v12)
    {
      id v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __92__HMDHAPAccessoryTask__updateCharacteristicsWithResponses_accessoryRequests_completedGroup___block_invoke;
      v21[3] = &unk_1E6A18F00;
      id v12 = v13;
      id v22 = v12;
      objc_msgSend(v8, "na_each:", v21);
    }
    id v14 = [MEMORY[0x1E4F1CA60] dictionary];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __92__HMDHAPAccessoryTask__updateCharacteristicsWithResponses_accessoryRequests_completedGroup___block_invoke_2;
    v19[3] = &unk_1E6A18F00;
    id v20 = v14;
    id v15 = v14;
    objc_msgSend(v8, "na_each:", v19);
    v16 = [(HMDHAPAccessoryTask *)self context];
    id v17 = [v16 home];

    __int16 v23 = @"kModifiedCharacteristicsForAccessoryKey";
    v24[0] = v15;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    [v17 _addResponseTuplesFromDictionary:v18 accessoryRequestMapTable:v12 responseTuples:0 completedGroup:v10 logEvents:0];
  }
  else
  {
    dispatch_group_leave(v10);
  }
}

void __92__HMDHAPAccessoryTask__updateCharacteristicsWithResponses_accessoryRequests_completedGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  BOOL v4 = *(void **)(a1 + 32);
  id v12 = v3;
  id v5 = [v3 accessory];
  id v6 = [v4 objectForKey:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
  }
  id v9 = v8;

  [v9 addObject:v12];
  id v10 = *(void **)(a1 + 32);
  v11 = [v12 accessory];
  [v10 setObject:v9 forKey:v11];
}

void __92__HMDHAPAccessoryTask__updateCharacteristicsWithResponses_accessoryRequests_completedGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v22 = a2;
  id v3 = [v22 request];
  BOOL v4 = [v3 characteristic];

  id v5 = [v4 service];
  id v6 = [v4 instanceID];
  id v7 = [v6 stringValue];

  id v8 = [v4 accessory];
  id v9 = [v8 uuid];
  id v10 = [v9 UUIDString];

  v11 = [v5 instanceID];
  id v12 = [v11 stringValue];

  if (v7 && v12 && v10)
  {
    id v13 = objc_msgSend(*(id *)(a1 + 32), "hmf_mutableDictionaryForKey:", v10);
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v16 = v15;

    id v17 = objc_msgSend(v16, "hmf_mutableDictionaryForKey:", v12);
    id v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v20 = v19;

    __int16 v21 = [v22 characteristicUpdateDictionary];
    [v20 setObject:v21 forKeyedSubscript:v7];

    [v16 setObject:v20 forKeyedSubscript:v12];
    [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v10];
  }
}

- (id)logEventsFromAccessoryRequestMap:(id)a3 accessoryList:(id)a4
{
  id v23 = a4;
  id v22 = a3;
  id v6 = [(HMDHAPAccessoryTask *)self context];
  id v7 = [v6 home];

  uint64_t v25 = [(HMDHAPAccessoryTask *)self context];
  BOOL v8 = [v25 operationType] == 1;
  [MEMORY[0x1E4F6A278] currentTime];
  double v10 = v9;
  uint64_t v24 = [(HMDHAPAccessoryTask *)self context];
  v11 = [v24 requestMessageIdentifier];
  __int16 v21 = [(HMDHAPAccessoryTask *)self context];
  id v12 = [v21 requestMessage];
  id v13 = [v12 userForHome:v7];
  id v14 = [v13 uuid];
  id v15 = [(HMDHAPAccessoryTask *)self context];
  uint64_t v16 = [v15 sourceType];
  id v17 = [(HMDHAPAccessoryTask *)self context];
  id v18 = [v17 clientIdentifier];
  id v19 = [v7 _getLogEventsForOperation:v8 startTime:v23 accessories:v22 requestMap:v11 identifier:v14 userUUID:v16 source:v10 bundleID:v18];

  return v19;
}

- (NSString)description
{
  id v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(HMDHAPAccessoryTask *)self requestIdentifier];
  id v7 = [v6 UUIDString];
  BOOL v8 = [(HMDHAPAccessoryTask *)self identifier];
  unint64_t v9 = [(HMDHAPAccessoryTask *)self completedRequestsCount];
  double v10 = [(HMDHAPAccessoryTask *)self requests];
  v11 = [v3 stringWithFormat:@"%@(%@/%@)[%ld/%ld]", v5, v7, v8, v9, objc_msgSend(v10, "count")];

  return (NSString *)v11;
}

- (NSString)debugDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  BOOL v4 = [MEMORY[0x1E4F28E78] string];
  id v5 = [(HMDHAPAccessoryTask *)self requests];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __39__HMDHAPAccessoryTask_debugDescription__block_invoke;
  id v17 = &unk_1E6A18ED8;
  id v18 = self;
  id v19 = v3;
  id v20 = v4;
  id v6 = v4;
  id v7 = v3;
  objc_msgSend(v5, "na_each:", &v14);

  BOOL v8 = NSString;
  unint64_t v9 = NSNumber;
  double v10 = [(HMDHAPAccessoryTask *)self requests];
  v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  id v12 = [v8 stringWithFormat:@"Requests[%@]: (\n%@%@)", v11, v6, v7, v14, v15, v16, v17, v18];

  return (NSString *)v12;
}

void __39__HMDHAPAccessoryTask_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  id v5 = [*(id *)(a1 + 32) requestToResponseMap];
  id v6 = [v5 objectForKey:v26];

  int v7 = [v26 isCompleted];
  uint64_t v8 = 48;
  if (v7) {
    uint64_t v8 = 40;
  }
  id v9 = *(id *)(a1 + v8);
  int v10 = [v26 isCompleted];
  v11 = @"-";
  if (v10) {
    v11 = @"*";
  }
  uint64_t v25 = v11;
  uint64_t v12 = [v6 value];
  id v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_1F2C9F1A8;
  }
  uint64_t v15 = [v6 error];
  if (v15)
  {
    uint64_t v16 = NSString;
    uint64_t v24 = [v6 error];
    uint64_t v17 = [v24 domain];
    id v18 = NSNumber;
    id v2 = [v6 error];
    id v3 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v2, "code"));
    id v23 = (void *)v17;
    id v19 = [v16 stringWithFormat:@"%@/%@", v17, v3];
  }
  else
  {
    id v19 = &stru_1F2C9F1A8;
  }
  uint64_t v20 = [v6 valueUpdatedTime];
  __int16 v21 = (void *)v20;
  if (v20) {
    id v22 = (__CFString *)v20;
  }
  else {
    id v22 = &stru_1F2C9F1A8;
  }
  [v9 appendFormat:@"\t[%@] %@ --> Response: <%@%@(%@)>\n", v25, v26, v14, v19, v22];

  if (v15)
  {
  }
}

- (double)executionTimeInterval
{
  id v3 = [(HMDHAPAccessoryTask *)self executionTime];
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = [(HMDHAPAccessoryTask *)self executionTime];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (unint64_t)completedRequestsCount
{
  id v2 = [(HMDHAPAccessoryTask *)self requests];
  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_99_186487);
  unint64_t v4 = [v3 count];

  return v4;
}

uint64_t __45__HMDHAPAccessoryTask_completedRequestsCount__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCompleted];
}

- (BOOL)allResponsesReceived
{
  id v2 = self;
  id v3 = [(HMDHAPAccessoryTask *)self requests];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__HMDHAPAccessoryTask_allResponsesReceived__block_invoke;
  v5[3] = &unk_1E6A18E90;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "na_allObjectsPassTest:", v5);

  return (char)v2;
}

BOOL __43__HMDHAPAccessoryTask_allResponsesReceived__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  unint64_t v4 = [v2 requestToResponseMap];
  id v5 = [v4 objectForKey:v3];

  return v5 != 0;
}

- (NSArray)characteristicResponses
{
  id v2 = [(HMDHAPAccessoryTask *)self requestToResponseMap];
  id v3 = [v2 objectEnumerator];
  unint64_t v4 = [v3 allObjects];
  id v5 = v4;
  if (!v4) {
    unint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v6 = v4;

  return v6;
}

- (id)activity
{
  id v2 = [(HMDHAPAccessoryTask *)self context];
  id v3 = [v2 activity];

  return v3;
}

- (unint64_t)sourceType
{
  id v2 = [(HMDHAPAccessoryTask *)self context];
  unint64_t v3 = [v2 sourceType];

  return v3;
}

- (id)workQueue
{
  id v2 = [(HMDHAPAccessoryTask *)self context];
  unint64_t v3 = [v2 workQueue];

  return v3;
}

- (id)requestIdentifier
{
  id v2 = [(HMDHAPAccessoryTask *)self context];
  unint64_t v3 = [v2 requestMessageIdentifier];

  return v3;
}

- (id)operationName
{
  id v2 = [(HMDHAPAccessoryTask *)self context];
  unint64_t v3 = [v2 operationName];

  return v3;
}

- (NSNumber)identifier
{
  id v2 = [(HMDHAPAccessoryTask *)self context];
  unint64_t v3 = [v2 identifier];

  return (NSNumber *)v3;
}

- (HMDHAPAccessoryTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDHAPAccessoryTask;
  uint64_t v12 = [(HMDHAPAccessoryTask *)&v19 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_requests, a4);
    uint64_t v14 = [(HMDHAPAccessoryTask *)v13 _updatedCompletion:v11];
    id completion = v13->_completion;
    v13->_id completion = (id)v14;

    uint64_t v16 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    requestToResponseMap = v13->_requestToResponseMap;
    v13->_requestToResponseMap = (NSMapTable *)v16;
  }
  return v13;
}

@end