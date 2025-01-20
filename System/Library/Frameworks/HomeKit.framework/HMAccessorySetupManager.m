@interface HMAccessorySetupManager
+ (NSUUID)UUID;
+ (id)logCategory;
- (HMAccessorySetupManager)init;
- (HMAccessorySetupManager)initWithContext:(id)a3;
- (void)_finishAccessorySetupWithSetupCompletedInfo:(void *)a3 completionHandler:(void *)a4 activity:;
- (void)failAccessorySetupWithError:(id)a3 completionHandler:(id)a4;
- (void)finishAccessorySetupWithCompletionHandler:(id)a3;
- (void)finishAccessorySetupWithSetupCompletedInfo:(id)a3 completionHandler:(id)a4;
- (void)performAccessorySetupUsingRequest:(HMAccessorySetupRequest *)request completionHandler:(void *)completion;
- (void)resumeAccessorySetupWithUserInfo:(id)a3 completionHandler:(id)a4;
@end

@implementation HMAccessorySetupManager

- (void).cxx_destruct
{
}

- (void)failAccessorySetupWithError:(id)a3 completionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v26 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager failAccessorySetupWithError:completionHandler:]", @"error"];
    v27 = (void *)MEMORY[0x19F3A64A0]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
LABEL_11:
    v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    __int16 v39 = 2112;
    uint64_t v40 = v26;
    _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_12:
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v26 userInfo:0];
    objc_exception_throw(v31);
  }
  v8 = v7;
  if (!v7)
  {
    uint64_t v26 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager failAccessorySetupWithError:completionHandler:]", @"completion"];
    v27 = (void *)MEMORY[0x19F3A64A0]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Failing accessory setup"];
  v10 = (void *)MEMORY[0x19F3A64A0]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    v14 = [v9 identifier];
    v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    v38 = v13;
    __int16 v39 = 2114;
    uint64_t v40 = (uint64_t)v15;
    __int16 v41 = 2112;
    id v42 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Failing accessory setup with error: %@", buf, 0x20u);
  }
  v35 = @"HMASM.mk.error";
  id v36 = v6;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  id v17 = objc_alloc(MEMORY[0x1E4F65488]);
  v18 = +[HMAccessorySetupManager UUID];
  v19 = (void *)[v17 initWithTarget:v18];

  v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASM.m.failAccessorySetup" destination:v19 payload:v16];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __73__HMAccessorySetupManager_failAccessorySetupWithError_completionHandler___block_invoke;
  v32[3] = &unk_1E5945510;
  v32[4] = v11;
  id v33 = v9;
  id v34 = v8;
  id v21 = v8;
  id v22 = v9;
  [v20 setResponseHandler:v32];
  if (v11) {
    id Property = objc_getProperty(v11, v23, 8, 1);
  }
  else {
    id Property = 0;
  }
  v25 = [Property messageDispatcher];
  [v25 sendMessage:v20];
}

void __73__HMAccessorySetupManager_failAccessorySetupWithError_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    v13 = [v12 shortDescription];
    *(_DWORD *)id v21 = 138543874;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    id v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to fail accessory setup: %@";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    v13 = [v12 shortDescription];
    *(_DWORD *)id v21 = 138543618;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully failed accessory setup";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v15, v16, v14, v21, v17);

LABEL_7:
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v18, 8, 1);
  }
  v20 = objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(void *)&v21[16], v22);
  [v20 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)finishAccessorySetupWithSetupCompletedInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager finishAccessorySetupWithSetupCompletedInfo:completionHandler:]", @"setupCompletedInfo"];
    uint32_t v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
LABEL_9:
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v20;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_10:
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v8 = v7;
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager finishAccessorySetupWithSetupCompletedInfo:completionHandler:]", @"completion"];
    uint32_t v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Finishing accessory setup with completed info"];
  v10 = (void *)MEMORY[0x19F3A64A0]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    v14 = [v9 identifier];
    v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v13;
    __int16 v24 = 2114;
    uint64_t v25 = (uint64_t)v15;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Finishing accessory setup with setup completed info: %@", buf, 0x20u);
  }
  -[HMAccessorySetupManager _finishAccessorySetupWithSetupCompletedInfo:completionHandler:activity:](v11, v6, v8, v9);
}

- (void)_finishAccessorySetupWithSetupCompletedInfo:(void *)a3 completionHandler:(void *)a4 activity:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (!v9)
    {
      uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager _finishAccessorySetupWithSetupCompletedInfo:completionHandler:activity:]", @"activity"];
      v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = a1;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v29 = v23;
        __int16 v30 = 2112;
        uint64_t v31 = v19;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
      objc_exception_throw(v24);
    }
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v7)
    {
      v12 = encodeRootObject(v7);
      [v11 setObject:v12 forKeyedSubscript:@"HMASM.mk.accessorySetupCompletedInfo"];
    }
    id v13 = objc_alloc(MEMORY[0x1E4F65488]);
    v14 = +[HMAccessorySetupManager UUID];
    v15 = (void *)[v13 initWithTarget:v14];

    uint64_t v16 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASM.m.finishAccessorySetup" destination:v15 payload:v11];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __98__HMAccessorySetupManager__finishAccessorySetupWithSetupCompletedInfo_completionHandler_activity___block_invoke;
    v25[3] = &unk_1E5945510;
    v25[4] = a1;
    id v26 = v10;
    id v27 = v8;
    [v16 setResponseHandler:v25];
    v18 = objc_msgSend(objc_getProperty(a1, v17, 8, 1), "messageDispatcher");
    [v18 sendMessage:v16];
  }
}

void __98__HMAccessorySetupManager__finishAccessorySetupWithSetupCompletedInfo_completionHandler_activity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    id v13 = [v12 shortDescription];
    *(_DWORD *)id v21 = 138543874;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    id v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to finish accessory setup: %@";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    id v13 = [v12 shortDescription];
    *(_DWORD *)id v21 = 138543618;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully finished accessory setup";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v15, v16, v14, v21, v17);

LABEL_7:
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v18, 8, 1);
  }
  v20 = objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(void *)&v21[16], v22);
  [v20 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)finishAccessorySetupWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager finishAccessorySetupWithCompletionHandler:]", @"completion"];
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
    os_log_type_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint32_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v5 = v4;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Finishing accessory setup"];
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [v6 identifier];
    v12 = [v11 shortDescription];
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = (uint64_t)v12;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Finishing accessory setup", buf, 0x16u);
  }
  -[HMAccessorySetupManager _finishAccessorySetupWithSetupCompletedInfo:completionHandler:activity:](v8, 0, v5, v6);
}

- (void)resumeAccessorySetupWithUserInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v26 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager resumeAccessorySetupWithUserInfo:completionHandler:]", @"userInfo"];
    id v27 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v28 = self;
    v29 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
LABEL_11:
    __int16 v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    __int16 v39 = 2112;
    uint64_t v40 = v26;
    _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_12:
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v26 userInfo:0];
    objc_exception_throw(v31);
  }
  id v8 = v7;
  if (!v7)
  {
    uint64_t v26 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager resumeAccessorySetupWithUserInfo:completionHandler:]", @"completion"];
    id v27 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v28 = self;
    v29 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Resuming accessory setup"];
  v10 = (void *)MEMORY[0x19F3A64A0]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    v14 = [v9 identifier];
    v15 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    v38 = v13;
    __int16 v39 = 2114;
    uint64_t v40 = (uint64_t)v15;
    __int16 v41 = 2112;
    id v42 = v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Launching HomeUIService with userInfo: %@", buf, 0x20u);
  }
  id v16 = objc_alloc(MEMORY[0x1E4F65488]);
  uint32_t v17 = +[HMAccessorySetupManager UUID];
  id v18 = (void *)[v16 initWithTarget:v17];

  v35 = @"HMASM.mk.resumeAccessorySetupUserInfo";
  id v36 = v6;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASM.m.resumeAccessorySetup" destination:v18 payload:v19];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __78__HMAccessorySetupManager_resumeAccessorySetupWithUserInfo_completionHandler___block_invoke;
  v32[3] = &unk_1E5945510;
  v32[4] = v11;
  id v33 = v9;
  id v34 = v8;
  id v21 = v8;
  id v22 = v9;
  [v20 setResponseHandler:v32];
  if (v11) {
    id Property = objc_getProperty(v11, v23, 8, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v25 = [Property messageDispatcher];
  [v25 sendMessage:v20];
}

void __78__HMAccessorySetupManager_resumeAccessorySetupWithUserInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    uint64_t v13 = [v12 shortDescription];
    *(_DWORD *)id v21 = 138543874;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    id v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to resume accessory setup: %@";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    v11 = HMFGetLogIdentifier();
    v12 = [*(id *)(a1 + 40) identifier];
    uint64_t v13 = [v12 shortDescription];
    *(_DWORD *)id v21 = 138543618;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully resumed accessory setup";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v15, v16, v14, v21, v17);

LABEL_7:
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v18, 8, 1);
  }
  v20 = objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(void *)&v21[16], v22);
  [v20 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)performAccessorySetupUsingRequest:(HMAccessorySetupRequest *)request completionHandler:(void *)completion
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = request;
  id v7 = completion;
  if (!v6)
  {
    uint64_t v37 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager performAccessorySetupUsingRequest:completionHandler:]", @"request"];
    v38 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
LABEL_20:
    __int16 v41 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v51 = v41;
    __int16 v52 = 2112;
    uint64_t v53 = v37;
    _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_21:
    id v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v37 userInfo:0];
    objc_exception_throw(v42);
  }
  id v8 = v7;
  if (!v7)
  {
    uint64_t v37 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessorySetupManager performAccessorySetupUsingRequest:completionHandler:]", @"completion"];
    v38 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  id v9 = [(HMAccessorySetupRequest *)v6 suggestedAccessoryName];
  unint64_t v10 = [v9 length];
  if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
  }
  unint64_t v11 = HMMaxLengthForNaming__hmf_once_v8;

  if (v10 <= v11)
  {
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Performing accessory setup using request"];
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      uint64_t v26 = [v21 identifier];
      id v27 = [v26 shortDescription];
      *(_DWORD *)buf = 138543874;
      v51 = v25;
      __int16 v52 = 2114;
      uint64_t v53 = (uint64_t)v27;
      __int16 v54 = 2112;
      v55 = v6;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Performing accessory setup using request: %@", buf, 0x20u);
    }
    id v28 = objc_alloc(MEMORY[0x1E4F65488]);
    v29 = [(id)objc_opt_class() UUID];
    id v19 = (id)[v28 initWithTarget:v29];

    v48 = @"HMASM.mk.request";
    __int16 v30 = encodeRootObject(v6);
    v49 = v30;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];

    id v31 = [MEMORY[0x1E4F654B0] messageWithName:@"HMASM.m.performAccessorySetup" destination:v19 payload:v20];
    objc_msgSend(v31, "hm_setXPCTimeoutDisabled:", 1);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_46;
    v43[3] = &unk_1E5945510;
    v43[4] = v23;
    id v44 = v21;
    id v45 = v8;
    id v32 = v8;
    id v33 = v21;
    [v31 setResponseHandler:v43];
    if (v23) {
      id Property = objc_getProperty(v23, v34, 8, 1);
    }
    else {
      id Property = 0;
    }
    id v36 = [Property messageDispatcher];
    [v36 sendMessage:v31 completionHandler:0];
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v51 = v15;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Suggested accessory name is longer than the pre-defined max length", buf, 0xCu);
    }
    if (v13) {
      id v17 = objc_getProperty(v13, v16, 8, 1);
    }
    else {
      id v17 = 0;
    }
    id v18 = [v17 delegateCaller];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke;
    v46[3] = &unk_1E59454C0;
    v47 = v8;
    id v19 = v8;
    [v18 invokeBlock:v46];

    v20 = v47;
  }
}

void __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_46(id *a1, void *a2, void *a3)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v42[0] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMASM.mk.result", v7);

  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = a1[4];
  unint64_t v11 = HMFGetOSLogHandle();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      v14 = [a1[5] identifier];
      v15 = [v14 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v13;
      __int16 v38 = 2114;
      __int16 v39 = v15;
      __int16 v40 = 2112;
      id v41 = v8;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully performed accessory setup using request with result: %@", buf, 0x20u);
    }
    id Property = a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v16, 8, 1);
    }
    id v18 = [Property delegateCaller];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_50;
    __int16 v30 = &unk_1E59454E8;
    id v19 = &v32;
    id v32 = a1[6];
    v20 = &v31;
    id v31 = v8;
    id v21 = &v27;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      uint64_t v23 = [a1[5] identifier];
      id v24 = [v23 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v22;
      __int16 v38 = 2114;
      __int16 v39 = v24;
      __int16 v40 = 2112;
      id v41 = v5;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to perform accessory setup using request: %@", buf, 0x20u);
    }
    id v26 = a1[4];
    if (v26) {
      id v26 = objc_getProperty(v26, v25, 8, 1);
    }
    id v18 = [v26 delegateCaller];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_49;
    v33[3] = &unk_1E59454E8;
    id v19 = &v35;
    id v35 = a1[6];
    v20 = &v34;
    id v34 = v5;
    id v21 = v33;
  }
  objc_msgSend(v18, "invokeBlock:", v21, v27, v28, v29, v30, v31);
}

uint64_t __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __79__HMAccessorySetupManager_performAccessorySetupUsingRequest_completionHandler___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (HMAccessorySetupManager)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessorySetupManager;
  id v6 = [(HMAccessorySetupManager *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (HMAccessorySetupManager)init
{
  v3 = [(HMXPCMessageTransportConfiguration *)[HMMutableXPCMessageTransportConfiguration alloc] initWithMachServiceName:@"com.apple.homed.xpc.accessory-setup"];
  HMDispatchQueueNameString(self, 0);
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (const char *)[v4 UTF8String];
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
  [(HMXPCMessageTransportConfiguration *)v3 setQueue:v7];

  [(HMXPCMessageTransportConfiguration *)v3 setRequiresHomeDataAccess:0];
  id v8 = [[_HMContext alloc] initWithXPCClientConfiguration:v3];
  objc_super v9 = [(HMAccessorySetupManager *)self initWithContext:v8];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_62821 != -1) {
    dispatch_once(&logCategory__hmf_once_t25_62821, &__block_literal_global_62822);
  }
  id v2 = (void *)logCategory__hmf_once_v26_62823;

  return v2;
}

uint64_t __38__HMAccessorySetupManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v26_62823;
  logCategory__hmf_once_v26_62823 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSUUID)UUID
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9FB82AF6-B949-4E55-B8B0-BEF7E1544816"];

  return (NSUUID *)v2;
}

@end