@interface HMDAssistantCommandHelper
+ (id)logCategory;
- (BOOL)executingActionSet;
- (HMDAssistantCommandHelper)initWithQueue:(id)a3 msgDispatcher:(id)a4;
- (HMDHome)home;
- (HMFMessageDispatcher)msgDispatcher;
- (NSArray)mediaRequests;
- (NSArray)requests;
- (NSMutableArray)mediaResponses;
- (NSMutableArray)responses;
- (NSUUID)messageId;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (id)mediaResponseHandler;
- (id)responseHandler;
- (unint64_t)numErrors;
- (void)__handleAccessoryCharacteristicsChanged:(id)a3;
- (void)_register;
- (void)_reportOperationStartedForAccessory:(id)a3;
- (void)_reportResponses;
- (void)_reportResponsesForMediaRequests;
- (void)addActionSetRequest:(id)a3 actionSet:(id)a4 completionHandler:(id)a5;
- (void)addMediaWriteRequests:(id)a3 withRequestProperty:(id)a4 completion:(id)a5;
- (void)addReadRequests:(id)a3 home:(id)a4 completion:(id)a5;
- (void)addWriteRequests:(id)a3 home:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)handleAccessoryCharacteristicsChangedNotification:(id)a3;
- (void)removeResponses:(id)a3;
- (void)reportOperationStartedForAccessory:(id)a3;
- (void)setExecutingActionSet:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setMediaRequests:(id)a3;
- (void)setMediaResponseHandler:(id)a3;
- (void)setMediaResponses:(id)a3;
- (void)setMessageId:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setNumErrors:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRequests:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setResponses:(id)a3;
- (void)setUuid:(id)a3;
- (void)timeoutAndReportResults;
@end

@implementation HMDAssistantCommandHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaResponses, 0);
  objc_storeStrong((id *)&self->_mediaRequests, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong(&self->_mediaResponseHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setMediaResponses:(id)a3
{
}

- (NSMutableArray)mediaResponses
{
  return self->_mediaResponses;
}

- (void)setMediaRequests:(id)a3
{
}

- (NSArray)mediaRequests
{
  return self->_mediaRequests;
}

- (void)setRequests:(id)a3
{
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setExecutingActionSet:(BOOL)a3
{
  self->_executingActionSet = a3;
}

- (BOOL)executingActionSet
{
  return self->_executingActionSet;
}

- (void)setNumErrors:(unint64_t)a3
{
  self->_numErrors = a3;
}

- (unint64_t)numErrors
{
  return self->_numErrors;
}

- (void)setResponses:(id)a3
{
}

- (NSMutableArray)responses
{
  return self->_responses;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setMessageId:(id)a3
{
}

- (NSUUID)messageId
{
  return self->_messageId;
}

- (void)setMediaResponseHandler:(id)a3
{
}

- (id)mediaResponseHandler
{
  return self->_mediaResponseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)removeResponses:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAssistantCommandHelper *)self responses];
  [v5 removeObjectsInArray:v4];
}

- (void)addActionSetRequest:(id)a3 actionSet:(id)a4 completionHandler:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc(MEMORY[0x1E4F653F0]);
  v13 = NSString;
  v14 = MEMORY[0x1D94505D0](self, a2);
  v15 = [v13 stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommandHelper.m", 516];
  v33 = (void *)[v12 initWithName:v15];

  v16 = [MEMORY[0x1E4F29128] UUID];
  [(HMDAssistantCommandHelper *)self setMessageId:v16];

  v17 = (void *)MEMORY[0x1D9452090]();
  v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    v21 = [(HMDAssistantCommandHelper *)v18 messageId];
    v22 = [v21 UUIDString];
    v23 = [v10 name];
    *(_DWORD *)buf = 138544130;
    v42 = v20;
    __int16 v43 = 2112;
    v44 = v22;
    __int16 v45 = 2112;
    v46 = v23;
    __int16 v47 = 2112;
    id v48 = v9;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending execute action set %@ with id %@ to home %@", buf, 0x2Au);
  }
  v40[0] = &unk_1F2DC7A80;
  v39[0] = @"sourceType";
  v39[1] = @"kActionSetUUID";
  v24 = [v10 uuid];
  v25 = [v24 UUIDString];
  v40[1] = v25;
  v39[2] = @"kApplyDeviceUnlockKey";
  v26 = [NSNumber numberWithInt:!isPasscodeEnabledOnThisDevice()];
  v40[2] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6A09868;
  id v28 = v11;
  id v38 = v28;
  v29 = _Block_copy(aBlock);
  [(HMDAssistantCommandHelper *)v18 setResponseHandler:v29];
  [(HMDAssistantCommandHelper *)v18 setExecutingActionSet:1];
  objc_initWeak((id *)buf, v18);
  v30 = (void *)MEMORY[0x1E4F65480];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke_2;
  v34[3] = &unk_1E6A17958;
  objc_copyWeak(&v36, (id *)buf);
  id v31 = v33;
  id v35 = v31;
  v32 = [v30 internalMessageWithName:@"kExecuteActionSetRequestKey" messagePayload:v27 responseHandler:v34];
  [v9 executeActionSet:v32];

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);
}

void __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = [a3 firstObject];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke_3;
    v10[3] = &unk_1E6A18668;
    id v11 = *(id *)(a1 + 32);
    id v12 = v8;
    id v13 = v6;
    id v14 = v5;
    dispatch_async(v9, v10);
  }
}

void __77__HMDAssistantCommandHelper_addActionSetRequest_actionSet_completionHandler___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 40) responseHandler];
  [*(id *)(a1 + 40) setResponseHandler:0];
  v2 = (void (**)(void, void, void))v4;
  if (v4)
  {
    if (*(void *)(a1 + 48))
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", *(void *)(a1 + 48), 0);
      v2 = (void (**)(void, void, void))v4;
    }
    else
    {
      v3 = 0;
    }
    ((void (**)(id, void, void *))v2)[2](v4, *(void *)(a1 + 56), v3);

    v2 = (void (**)(void, void, void))v4;
  }
}

- (void)addWriteRequests:(id)a3 home:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if ([v8 count])
  {
    id v11 = [MEMORY[0x1E4F29128] UUID];
    [(HMDAssistantCommandHelper *)self setMessageId:v11];

    [(HMDAssistantCommandHelper *)self setHome:v9];
    [(HMDAssistantCommandHelper *)self setResponseHandler:v10];
    id v12 = (void *)MEMORY[0x1D9452090]([(HMDAssistantCommandHelper *)self _register]);
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [(HMDAssistantCommandHelper *)v13 messageId];
      v17 = [v16 UUIDString];
      *(_DWORD *)buf = 138544130;
      v27 = v15;
      __int16 v28 = 2112;
      id v29 = v17;
      __int16 v30 = 2112;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Sending write request with id %@ to home %@ with write request tupes: %@", buf, 0x2Au);
    }
    [(HMDAssistantCommandHelper *)v13 setRequests:v8];
    objc_initWeak((id *)buf, v13);
    v18 = [(HMDAssistantCommandHelper *)v13 messageId];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__HMDAssistantCommandHelper_addWriteRequests_home_completion___block_invoke;
    v24[3] = &unk_1E6A17958;
    objc_copyWeak(&v25, (id *)buf);
    v24[4] = v13;
    [v9 writeCharacteristicValues:v8 source:1 message:0 identifier:v18 qualityOfService:25 withCompletionHandler:v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Received write request to home %@ with no request tuples, reporting invalid parameters error", buf, 0x16u);
    }
    v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
    v10[2](v10, v23, 0);
  }
}

void __62__HMDAssistantCommandHelper_addWriteRequests_home_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 32) messageId];
      id v14 = [v13 UUIDString];
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      __int16 v21 = 2112;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Write request with id %@ to home failed with error: %@", buf, 0x20u);
    }
    v15 = [v8 queue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__HMDAssistantCommandHelper_addWriteRequests_home_completion___block_invoke_22;
    v16[3] = &unk_1E6A197C8;
    id v17 = v8;
    id v18 = v5;
    dispatch_async(v15, v16);
  }
}

void __62__HMDAssistantCommandHelper_addWriteRequests_home_completion___block_invoke_22(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) responseHandler];
  [*(id *)(a1 + 32) setResponseHandler:0];
  v2 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 40), 0);
    v2 = (void *)v3;
  }
}

- (void)addReadRequests:(id)a3 home:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if ([v8 count])
  {
    id v11 = [MEMORY[0x1E4F29128] UUID];
    [(HMDAssistantCommandHelper *)self setMessageId:v11];

    [(HMDAssistantCommandHelper *)self setHome:v9];
    [(HMDAssistantCommandHelper *)self setResponseHandler:v10];
    id v12 = (void *)MEMORY[0x1D9452090]([(HMDAssistantCommandHelper *)self _register]);
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [(HMDAssistantCommandHelper *)v13 messageId];
      id v17 = [v16 UUIDString];
      *(_DWORD *)buf = 138544130;
      v27 = v15;
      __int16 v28 = 2112;
      id v29 = v17;
      __int16 v30 = 2112;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Sending read request with id %@ to home %@ with characteristics: %@", buf, 0x2Au);
    }
    [(HMDAssistantCommandHelper *)v13 setRequests:v8];
    objc_initWeak((id *)buf, v13);
    id v18 = [(HMDAssistantCommandHelper *)v13 messageId];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __61__HMDAssistantCommandHelper_addReadRequests_home_completion___block_invoke;
    v24[3] = &unk_1E6A17A08;
    objc_copyWeak(&v25, (id *)buf);
    [v9 readCharacteristicValues:v8 identifier:v18 source:1 qualityOfService:25 withCompletionHandler:v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Received read request to home %@ with no characteristics, reporting invalid parameters error", buf, 0x16u);
    }
    __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
    v10[2](v10, v23, 0);
  }
}

void __61__HMDAssistantCommandHelper_addReadRequests_home_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = v8;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v10 messageId];
      id v14 = [v13 UUIDString];
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      __int16 v21 = 2112;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Read request with id %@ failed with error: %@", buf, 0x20u);
    }
    v15 = [v10 queue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__HMDAssistantCommandHelper_addReadRequests_home_completion___block_invoke_21;
    v16[3] = &unk_1E6A197C8;
    id v17 = v10;
    id v18 = v5;
    dispatch_async(v15, v16);
  }
}

void __61__HMDAssistantCommandHelper_addReadRequests_home_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) responseHandler];
  [*(id *)(a1 + 32) setResponseHandler:0];
  v2 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 40), 0);
    v2 = (void *)v3;
  }
}

- (void)addMediaWriteRequests:(id)a3 withRequestProperty:(id)a4 completion:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v37 = a4;
  id v9 = a5;
  id v36 = (void (**)(void, void, void))v9;
  id v33 = v8;
  if ([v8 count])
  {
    [(HMDAssistantCommandHelper *)self setMediaResponseHandler:v9];
    [(HMDAssistantCommandHelper *)self setMediaRequests:v8];
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    [(HMDAssistantCommandHelper *)self setMediaResponses:v10];

    id v35 = self;
    objc_initWeak(&location, self);
    *(void *)&long long v56 = 0;
    *((void *)&v56 + 1) = &v56;
    uint64_t v57 = 0x2020000000;
    int v58 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v11)
    {
      uint64_t v38 = *(void *)v47;
      uint64_t v34 = *MEMORY[0x1E4F2D140];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v47 != v38) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v14 = [v13 mediaProfile];
          v15 = [v14 accessory];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v16 = v15;
          }
          else {
            v16 = 0;
          }
          id v17 = v16;

          if (v17)
          {
            id v18 = [v17 mediaProfile];
            v19 = [v13 value];
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __82__HMDAssistantCommandHelper_addMediaWriteRequests_withRequestProperty_completion___block_invoke;
            void v40[3] = &unk_1E6A19938;
            objc_copyWeak(&v45, &location);
            v44 = &v56;
            id v20 = v37;
            id v41 = v20;
            id v42 = v17;
            id v43 = obj;
            [v18 handleSetValue:v19 withRequestProperty:v20 withCompletionHandler:v40];

            objc_destroyWeak(&v45);
          }
          else
          {
            __int16 v21 = (void *)MEMORY[0x1D9452090]();
            v22 = v35;
            HMFGetOSLogHandle();
            __int16 v23 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v24 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v25 = [v13 mediaProfile];
              v26 = [v25 uniqueIdentifier];
              *(_DWORD *)buf = 138543618;
              id v52 = v24;
              __int16 v53 = 2112;
              v54 = v26;
              _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Media Profile (%@) does not contain HMDAppleMediaAccessory type accessory, something went wrong.", buf, 0x16u);
            }
            v27 = [MEMORY[0x1E4F28C58] errorWithDomain:v34 code:22 userInfo:0];
            ((void (**)(void, void *, void))v36)[2](v36, v27, 0);
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v11);
    }

    _Block_object_dispose(&v56, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v28 = (void *)MEMORY[0x1D9452090]();
    id v29 = self;
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = HMFGetLogIdentifier();
      LODWORD(v56) = 138543362;
      *(void *)((char *)&v56 + 4) = v31;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Received write request with no apple media accessory, reporting invalid parameters error", (uint8_t *)&v56, 0xCu);
    }
    __int16 v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
    ((void (**)(void, void *, void))v36)[2](v36, v32, 0);
  }
}

void __82__HMDAssistantCommandHelper_addMediaWriteRequests_withRequestProperty_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__HMDAssistantCommandHelper_addMediaWriteRequests_withRequestProperty_completion___block_invoke_2;
    block[3] = &unk_1E6A09840;
    uint64_t v17 = *(void *)(a1 + 56);
    id v11 = v5;
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    id v14 = v8;
    id v15 = v6;
    id v16 = *(id *)(a1 + 48);
    dispatch_async(v9, block);
  }
}

void __82__HMDAssistantCommandHelper_addMediaWriteRequests_withRequestProperty_completion___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = [*(id *)(a1 + 48) mediaProfile];
    id v4 = +[HMDMediaPropertyRequest requestWithProperty:v2 mediaProfile:v3];

    id v5 = +[HMDMediaPropertyResponse responseWithRequest:v4 error:*(void *)(a1 + 32)];
    id v6 = [*(id *)(a1 + 56) mediaResponses];
    v12[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v8 = +[HMDMediaPropertyResponse serializeResponses:v7];
    [v6 addObject:v8];
  }
  else
  {
    if (!*(void *)(a1 + 64)) {
      goto LABEL_6;
    }
    id v4 = [*(id *)(a1 + 56) mediaResponses];
    [v4 addObject:*(void *)(a1 + 64)];
  }

LABEL_6:
  uint64_t v9 = *(int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  if ([*(id *)(a1 + 72) count] == v9)
  {
    id v10 = [*(id *)(a1 + 56) mediaResponseHandler];
    [*(id *)(a1 + 56) setMediaResponseHandler:0];
    id v11 = [*(id *)(a1 + 56) mediaResponses];
    [*(id *)(a1 + 56) setMediaResponses:0];
    if (v10) {
      ((void (**)(void, void, void *))v10)[2](v10, 0, v11);
    }
  }
}

- (void)handleAccessoryCharacteristicsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAssistantCommandHelper *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__HMDAssistantCommandHelper_handleAccessoryCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __79__HMDAssistantCommandHelper_handleAccessoryCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  objc_msgSend(v1, "__handleAccessoryCharacteristicsChanged:", v2);
}

- (void)__handleAccessoryCharacteristicsChanged:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v114 = v8;
    __int16 v115 = 2112;
    id v116 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing characteristic reponses for Siri: %@", buf, 0x16u);
  }
  v66 = v4;
  uint64_t v9 = objc_msgSend(v4, "hmf_UUIDForKey:", @"kModifiedCharacteristicsMessageIdentifierKey");
  id v10 = [(HMDAssistantCommandHelper *)v6 messageId];
  v65 = v9;
  LODWORD(v9) = [v9 isEqual:v10];

  if (v9)
  {
    id v11 = [(HMDAssistantCommandHelper *)v6 responseHandler];

    if (v11)
    {
      objc_msgSend(v4, "hmf_dictionaryForKey:", @"kModifiedCharacteristicsForAccessoryKey");
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v68 = [obj countByEnumeratingWithState:&v104 objects:v112 count:16];
      if (v68)
      {
        uint64_t v67 = *(void *)v105;
        v79 = v6;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v105 != v67) {
              objc_enumerationMutation(obj);
            }
            uint64_t v70 = v12;
            id v13 = *(void **)(*((void *)&v104 + 1) + 8 * v12);
            id v14 = objc_msgSend(obj, "hmf_dictionaryForKey:", v13);
            id v15 = [(HMDAssistantCommandHelper *)v6 home];
            v87 = v13;
            id v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
            uint64_t v17 = [v15 accessoryWithUUID:v16];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v18 = v17;
            }
            else {
              id v18 = 0;
            }
            id v75 = v18;

            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            id v73 = v14;
            uint64_t v72 = [v73 countByEnumeratingWithState:&v100 objects:v111 count:16];
            if (v72)
            {
              uint64_t v71 = *(void *)v101;
              do
              {
                uint64_t v19 = 0;
                do
                {
                  if (*(void *)v101 != v71) {
                    objc_enumerationMutation(v73);
                  }
                  uint64_t v74 = v19;
                  id v20 = objc_msgSend(v73, "hmf_dictionaryForKey:");
                  long long v96 = 0u;
                  long long v97 = 0u;
                  long long v98 = 0u;
                  long long v99 = 0u;
                  id v78 = v20;
                  uint64_t v77 = [v78 countByEnumeratingWithState:&v96 objects:v110 count:16];
                  if (v77)
                  {
                    uint64_t v76 = *(void *)v97;
                    do
                    {
                      for (uint64_t i = 0; i != v77; uint64_t i = v53 + 1)
                      {
                        if (*(void *)v97 != v76) {
                          objc_enumerationMutation(v78);
                        }
                        uint64_t v82 = i;
                        uint64_t v22 = *(void *)(*((void *)&v96 + 1) + 8 * i);
                        uint64_t v23 = HAPInstanceIDFromValue();
                        HAPInstanceIDFromValue();
                        uint64_t v81 = v85 = (void *)v23;
                        v83 = objc_msgSend(v75, "findCharacteristic:forService:", v23);
                        v80 = objc_msgSend(v78, "hmf_dictionaryForKey:", v22);
                        v84 = [v80 errorFromDataForKey:@"kCharacteristicErrorDataKey"];
                        if (v84) {
                          [(HMDAssistantCommandHelper *)v6 setNumErrors:[(HMDAssistantCommandHelper *)v6 numErrors] + 1];
                        }
                        long long v94 = 0u;
                        long long v95 = 0u;
                        long long v92 = 0u;
                        long long v93 = 0u;
                        id v24 = [(HMDAssistantCommandHelper *)v6 requests];
                        uint64_t v25 = [v24 countByEnumeratingWithState:&v92 objects:v109 count:16];
                        if (v25)
                        {
                          uint64_t v26 = v25;
                          uint64_t v27 = *(void *)v93;
LABEL_27:
                          uint64_t v28 = 0;
                          while (1)
                          {
                            if (*(void *)v93 != v27) {
                              objc_enumerationMutation(v24);
                            }
                            id v29 = *(void **)(*((void *)&v92 + 1) + 8 * v28);
                            __int16 v30 = [v29 characteristic];
                            id v31 = [v30 accessory];
                            __int16 v32 = [v31 uuid];

                            id v33 = [v30 instanceID];
                            uint64_t v34 = [v32 UUIDString];
                            if ([v87 isEqual:v34])
                            {
                              char v35 = [v85 isEqual:v33];

                              if (v35)
                              {
                                uint64_t v36 = +[HMDCharacteristicResponse responseWithRequest:v29 error:v84];

                                id v6 = v79;
                                v86 = (void *)v36;
                                if (v36) {
                                  goto LABEL_41;
                                }
                                goto LABEL_38;
                              }
                            }
                            else
                            {
                            }
                            if (v26 == ++v28)
                            {
                              uint64_t v26 = [v24 countByEnumeratingWithState:&v92 objects:v109 count:16];
                              if (v26) {
                                goto LABEL_27;
                              }
                              break;
                            }
                          }
                        }

                        id v6 = v79;
LABEL_38:
                        id v37 = (void *)MEMORY[0x1D9452090]();
                        uint64_t v38 = v6;
                        v39 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                        {
                          v40 = HMFGetLogIdentifier();
                          *(_DWORD *)buf = 138543874;
                          v114 = v40;
                          __int16 v115 = 2112;
                          id v116 = v87;
                          __int16 v117 = 2112;
                          v118 = v85;
                          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find a request corresponding to %@/%@ - creating a dummy request", buf, 0x20u);
                        }
                        id v41 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v83 value:&unk_1F2DC7A68 authorizationData:0 type:0];
                        v86 = +[HMDCharacteristicResponse responseWithRequest:v41 error:v84];

LABEL_41:
                        long long v90 = 0u;
                        long long v91 = 0u;
                        long long v88 = 0u;
                        long long v89 = 0u;
                        id v42 = [(HMDAssistantCommandHelper *)v6 responses];
                        uint64_t v43 = [v42 countByEnumeratingWithState:&v88 objects:v108 count:16];
                        if (v43)
                        {
                          uint64_t v44 = v43;
                          uint64_t v45 = *(void *)v89;
LABEL_43:
                          uint64_t v46 = 0;
                          while (1)
                          {
                            if (*(void *)v89 != v45) {
                              objc_enumerationMutation(v42);
                            }
                            long long v47 = *(void **)(*((void *)&v88 + 1) + 8 * v46);
                            long long v48 = [v47 request];
                            long long v49 = [v48 characteristic];
                            v50 = [v86 request];
                            v51 = [v50 characteristic];
                            char v52 = [v49 isEqual:v51];

                            if (v52) {
                              break;
                            }
                            if (v44 == ++v46)
                            {
                              uint64_t v44 = [v42 countByEnumeratingWithState:&v88 objects:v108 count:16];
                              if (v44) {
                                goto LABEL_43;
                              }
                              id v6 = v79;
                              goto LABEL_50;
                            }
                          }
                          id v56 = v47;

                          id v6 = v79;
                          v55 = v80;
                          v54 = (void *)v81;
                          uint64_t v53 = v82;
                          if (!v56) {
                            goto LABEL_54;
                          }
                          uint64_t v57 = [(HMDAssistantCommandHelper *)v79 responses];
                          [v57 removeObject:v56];

                          id v42 = v56;
                        }
                        else
                        {
LABEL_50:
                          v54 = (void *)v81;
                          uint64_t v53 = v82;
                          v55 = v80;
                        }

LABEL_54:
                        int v58 = [(HMDAssistantCommandHelper *)v6 responses];
                        [v58 addObject:v86];
                      }
                      uint64_t v77 = [v78 countByEnumeratingWithState:&v96 objects:v110 count:16];
                    }
                    while (v77);
                  }

                  uint64_t v19 = v74 + 1;
                }
                while (v74 + 1 != v72);
                uint64_t v72 = [v73 countByEnumeratingWithState:&v100 objects:v111 count:16];
              }
              while (v72);
            }

            uint64_t v12 = v70 + 1;
          }
          while (v70 + 1 != v68);
          uint64_t v68 = [obj countByEnumeratingWithState:&v104 objects:v112 count:16];
        }
        while (v68);
      }

      if ((objc_msgSend(v66, "hmf_BOOLForKey:", @"kMultiPartResponseKey") & 1) == 0) {
        [(HMDAssistantCommandHelper *)v6 _reportResponses];
      }
    }
    else
    {
      uint64_t v59 = (void *)MEMORY[0x1D9452090]();
      v60 = v6;
      v61 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        v62 = HMFGetLogIdentifier();
        v63 = [v66 shortDescription];
        v64 = [v65 UUIDString];
        *(_DWORD *)buf = 138543874;
        v114 = v62;
        __int16 v115 = 2112;
        id v116 = v63;
        __int16 v117 = 2112;
        v118 = v64;
        _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_INFO, "%{public}@Characteristic change notification '%@' too late for request %@", buf, 0x20u);
      }
    }
  }
}

- (void)_reportOperationStartedForAccessory:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v4 = [v40 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v57 = v10;
    __int16 v58 = 2112;
    id v59 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Reporting operation started for accessory: %@", buf, 0x16u);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = [(HMDAssistantCommandHelper *)v8 requests];
  uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    id v42 = v8;
    id v43 = v6;
    uint64_t v41 = *(void *)v53;
    do
    {
      uint64_t v14 = 0;
      uint64_t v44 = v12;
      do
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v47 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
        id v15 = [v47 characteristic];
        id v16 = [v15 accessory];
        uint64_t v17 = [v16 uuid];

        id v18 = [v15 instanceID];
        uint64_t v19 = [v6 uuid];
        int v20 = objc_msgSend(v17, "hmf_isEqualToUUID:", v19);

        if (v20)
        {
          uint64_t v46 = v15;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          __int16 v21 = [(HMDAssistantCommandHelper *)v8 responses];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v62 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v49;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v49 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = [*(id *)(*((void *)&v48 + 1) + 8 * i) request];
                uint64_t v27 = [v26 characteristic];

                uint64_t v28 = [v27 accessory];
                id v29 = [v28 uuid];

                __int16 v30 = [v27 instanceID];
                if (HMFEqualObjects() && HMFEqualObjects())
                {

                  id v8 = v42;
                  goto LABEL_25;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v62 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          id v31 = (void *)MEMORY[0x1D9452090]();
          id v8 = v42;
          __int16 v32 = v42;
          id v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            uint64_t v34 = HMFGetLogIdentifier();
            char v35 = [v17 UUIDString];
            *(_DWORD *)buf = 138543874;
            uint64_t v57 = v34;
            __int16 v58 = 2112;
            id v59 = v35;
            __int16 v60 = 2112;
            v61 = v18;
            _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@No response for requests with characteristic %@/%@ - inserting operation started error response", buf, 0x20u);
          }
          __int16 v21 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2404];
          uint64_t v27 = +[HMDCharacteristicResponse responseWithRequest:v47 error:v21];
          [(HMDAssistantCommandHelper *)v32 setNumErrors:[(HMDAssistantCommandHelper *)v32 numErrors] + 1];
          id v29 = [(HMDAssistantCommandHelper *)v32 responses];
          [v29 addObject:v27];
LABEL_25:
          uint64_t v13 = v41;

          id v6 = v43;
          uint64_t v12 = v44;
          id v15 = v46;
        }

        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v12);
  }

  uint64_t v36 = [(HMDAssistantCommandHelper *)v8 requests];
  uint64_t v37 = [v36 count];
  uint64_t v38 = [(HMDAssistantCommandHelper *)v8 responses];
  uint64_t v39 = [v38 count];

  if (v37 == v39) {
    [(HMDAssistantCommandHelper *)v8 _reportResponses];
  }
}

- (void)reportOperationStartedForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAssistantCommandHelper *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDAssistantCommandHelper_reportOperationStartedForAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__HMDAssistantCommandHelper_reportOperationStartedForAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportOperationStartedForAccessory:*(void *)(a1 + 40)];
}

- (void)_reportResponses
{
  id v2 = self;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDAssistantCommandHelper *)self responseHandler];

  if (v3)
  {
    id v4 = [(HMDAssistantCommandHelper *)v2 responseHandler];
    [(HMDAssistantCommandHelper *)v2 setResponseHandler:0];
    id v5 = (void *)MEMORY[0x1E4F1CA48];
    id v6 = [(HMDAssistantCommandHelper *)v2 requests];
    v61 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    if ([(HMDAssistantCommandHelper *)v2 executingActionSet])
    {
      uint64_t v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
    }
    else
    {
      uint64_t v14 = [(HMDAssistantCommandHelper *)v2 requests];
      uint64_t v15 = [v14 count];
      id v16 = [(HMDAssistantCommandHelper *)v2 responses];
      uint64_t v17 = [v16 count];

      id v18 = [(HMDAssistantCommandHelper *)v2 responses];
      if (v15 == v17)
      {

        v61 = v18;
      }
      else
      {
        id v59 = v4;
        [v61 addObjectsFromArray:v18];

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id obj = [(HMDAssistantCommandHelper *)v2 requests];
        uint64_t v65 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
        if (v65)
        {
          uint64_t v63 = *(void *)v73;
          uint64_t v64 = v2;
          do
          {
            for (uint64_t i = 0; i != v65; ++i)
            {
              if (*(void *)v73 != v63) {
                objc_enumerationMutation(obj);
              }
              v66 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              int v20 = [v66 characteristic];
              __int16 v21 = [v20 accessory];
              uint64_t v22 = [v21 uuid];

              uint64_t v67 = v20;
              uint64_t v23 = [v20 instanceID];
              long long v68 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              uint64_t v24 = [(HMDAssistantCommandHelper *)v2 responses];
              uint64_t v25 = [v24 countByEnumeratingWithState:&v68 objects:v83 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v69;
                while (2)
                {
                  for (uint64_t j = 0; j != v26; ++j)
                  {
                    if (*(void *)v69 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    id v29 = [*(id *)(*((void *)&v68 + 1) + 8 * j) request];
                    __int16 v30 = [v29 characteristic];

                    id v31 = [v30 accessory];
                    __int16 v32 = [v31 uuid];

                    id v33 = [v30 instanceID];
                    if (HMFEqualObjects() && HMFEqualObjects())
                    {

                      id v2 = v64;
                      uint64_t v44 = v67;
                      goto LABEL_33;
                    }
                  }
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v68 objects:v83 count:16];
                  if (v26) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v34 = v66;
              char v35 = [v66 characteristic];
              uint64_t v24 = [v35 accessory];

              if ([v24 isSuspendCapable]
                && (uint64_t v82 = v66,
                    [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1],
                    uint64_t v36 = objc_claimAutoreleasedReturnValue(),
                    int v37 = [v24 canWakeBasedOnCharacteristicRequests:v36],
                    v36,
                    v37))
              {
                uint64_t v38 = (void *)MEMORY[0x1D9452090]();
                id v2 = v64;
                uint64_t v39 = v64;
                id v40 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  uint64_t v41 = HMFGetLogIdentifier();
                  [v22 UUIDString];
                  id v42 = v60 = v38;
                  *(_DWORD *)buf = 138543874;
                  uint64_t v77 = v41;
                  __int16 v78 = 2112;
                  v79 = v42;
                  __int16 v80 = 2112;
                  uint64_t v81 = v23;
                  _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@No response for wakeable write requests with characteristic %@/%@ - for suspeded accessory inserting operation started error response", buf, 0x20u);

                  uint64_t v38 = v60;
                }

                uint64_t v43 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2404];
              }
              else
              {
                uint64_t v45 = (void *)MEMORY[0x1D9452090]();
                id v2 = v64;
                uint64_t v46 = v64;
                long long v47 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  long long v48 = HMFGetLogIdentifier();
                  long long v49 = [v22 UUIDString];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v77 = v48;
                  __int16 v78 = 2112;
                  v79 = v49;
                  __int16 v80 = 2112;
                  uint64_t v81 = v23;
                  _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@No response for requests with characteristic %@/%@ - inserting an in-progress error response", buf, 0x20u);

                  uint64_t v34 = v66;
                }

                uint64_t v43 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
              }
              __int16 v30 = (void *)v43;
              uint64_t v44 = v67;
              __int16 v32 = +[HMDCharacteristicResponse responseWithRequest:v34 error:v43];
              [(HMDAssistantCommandHelper *)v2 setNumErrors:[(HMDAssistantCommandHelper *)v2 numErrors] + 1];
              [v61 addObject:v32];
LABEL_33:
            }
            uint64_t v65 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
          }
          while (v65);
        }

        id v4 = v59;
      }
      if (![(HMDAssistantCommandHelper *)v2 numErrors])
      {
        long long v52 = 0;
LABEL_43:
        long long v53 = (void *)MEMORY[0x1D9452090]();
        long long v54 = v2;
        long long v55 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          id v56 = HMFGetLogIdentifier();
          uint64_t v57 = [(HMDAssistantCommandHelper *)v54 messageId];
          __int16 v58 = [v57 UUIDString];
          *(_DWORD *)buf = 138543618;
          uint64_t v77 = v56;
          __int16 v78 = 2112;
          v79 = v58;
          _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@Calling response handler for the id %@", buf, 0x16u);
        }
        ((void (**)(void, void *, void *))v4)[2](v4, v52, v61);

        return;
      }
      unint64_t v50 = [(HMDAssistantCommandHelper *)v2 numErrors];
      if (v50 >= [v61 count]) {
        uint64_t v51 = 74;
      }
      else {
        uint64_t v51 = 73;
      }
      uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:v51 userInfo:0];
    }
    long long v52 = (void *)v7;
    goto LABEL_43;
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = v2;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [(HMDAssistantCommandHelper *)v9 messageId];
    uint64_t v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138543618;
    uint64_t v77 = v11;
    __int16 v78 = 2112;
    v79 = v13;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Results already reported for Siri command %@ - ignoring the notification/timer", buf, 0x16u);
  }
}

- (void)_reportResponsesForMediaRequests
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDAssistantCommandHelper *)self mediaResponseHandler];

  if (v3)
  {
    id v4 = [(HMDAssistantCommandHelper *)self mediaResponseHandler];
    [(HMDAssistantCommandHelper *)self setMediaResponseHandler:0];
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v6 = [(HMDAssistantCommandHelper *)self mediaRequests];
    uint64_t v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    id v8 = [(HMDAssistantCommandHelper *)self mediaResponses];
    uint64_t v9 = [v8 count];
    id v10 = [(HMDAssistantCommandHelper *)self mediaRequests];
    uint64_t v11 = [v10 count];

    uint64_t v12 = [(HMDAssistantCommandHelper *)self mediaResponses];
    if (v9 == v11)
    {
    }
    else
    {
      int v37 = v4;
      uint64_t v38 = v7;
      [v7 addObjectsFromArray:v12];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = [(HMDAssistantCommandHelper *)self mediaRequests];
      uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v40 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v46 != v40) {
              objc_enumerationMutation(obj);
            }
            int v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            __int16 v21 = [v20 mediaProfile];
            uint64_t v22 = [v21 uniqueIdentifier];
            uint64_t v23 = [v22 UUIDString];

            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v24 = [(HMDAssistantCommandHelper *)self mediaResponses];
            uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v54 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v42;
LABEL_14:
              uint64_t v28 = 0;
              while (1)
              {
                if (*(void *)v42 != v27) {
                  objc_enumerationMutation(v24);
                }
                id v29 = [*(id *)(*((void *)&v41 + 1) + 8 * v28) objectForKey:v23];

                if (v29) {
                  break;
                }
                if (v26 == ++v28)
                {
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v54 count:16];
                  if (v26) {
                    goto LABEL_14;
                  }
                  goto LABEL_20;
                }
              }
            }
            else
            {
LABEL_20:

              __int16 v30 = (void *)MEMORY[0x1D9452090]();
              id v31 = self;
              __int16 v32 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                id v33 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                uint64_t v51 = v33;
                __int16 v52 = 2112;
                long long v53 = v23;
                _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@No response for requests for media profile %@ - inserting an in-progress error response", buf, 0x16u);
              }
              uint64_t v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
              uint64_t v24 = +[HMDMediaPropertyResponse responseWithRequest:v20 error:v34];

              long long v49 = v24;
              char v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
              uint64_t v36 = +[HMDMediaPropertyResponse serializeResponses:v35];
              [v38 addObject:v36];
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v18);
      }

      id v4 = v37;
      uint64_t v12 = v38;
    }
    ((void (**)(void, void, void *))v4)[2](v4, 0, v12);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v51 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Media results already reported for Siri command - ignoring the notification/timer", buf, 0xCu);
    }
  }
}

- (void)timeoutAndReportResults
{
  uint64_t v3 = [(HMDAssistantCommandHelper *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMDAssistantCommandHelper_timeoutAndReportResults__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __52__HMDAssistantCommandHelper_timeoutAndReportResults__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Timeout current requests execution - reporting results", (uint8_t *)&v10, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) mediaRequests];
  uint64_t v7 = [v6 count];

  id v8 = *(void **)(a1 + 32);
  if (v7) {
    return [v8 _reportResponsesForMediaRequests];
  }
  else {
    return [v8 _reportResponses];
  }
}

- (void)_register
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleAccessoryCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsResponseReceivedNotification" object:0];
}

- (void)dealloc
{
  id v3 = [(HMDAssistantCommandHelper *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HMDAssistantCommandHelper;
  [(HMDAssistantCommandHelper *)&v5 dealloc];
}

- (HMDAssistantCommandHelper)initWithQueue:(id)a3 msgDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDAssistantCommandHelper;
  uint64_t v9 = [(HMDAssistantCommandHelper *)&v17 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_msgDispatcher, a4);
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    responses = v10->_responses;
    v10->_responses = (NSMutableArray *)v13;

    v10->_numErrors = 0;
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v10 selector:sel_reportOperationStartedForAccessory_ name:@"kHMDAccessoryWakeNotificationStarted" object:0];
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_35032 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_35032, &__block_literal_global_35033);
  }
  id v2 = (void *)logCategory__hmf_once_v1_35034;
  return v2;
}

uint64_t __40__HMDAssistantCommandHelper_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_35034;
  logCategory__hmf_once_v1_35034 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end