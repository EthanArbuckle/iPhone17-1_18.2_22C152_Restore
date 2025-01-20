@interface HMSettingsMessageHandler
- (void)configureWithContext:(id)a3;
- (void)sendUpdateValueMessage:(id)a3 value:(id)a4 completionHandler:(id)a5;
@end

@implementation HMSettingsMessageHandler

- (void)configureWithContext:(id)a3
{
  if (self) {
    objc_setProperty_atomic(self, a2, a3, 8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSettingsType, 0);
  objc_storeStrong((id *)&self->_userTargetUUID, 0);
  objc_storeStrong((id *)&self->_homeTargetUUID, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)sendUpdateValueMessage:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v12 = (void (**)(void, void))v10;
  if (!self)
  {
    if (v10) {
      goto LABEL_6;
    }
LABEL_10:
    uint64_t v39 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSettingsMessageHandler sendUpdateValueMessage:value:completionHandler:]", @"completionHandler"];
    v40 = (void *)MEMORY[0x19F3A64A0]();
    v41 = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v43;
      __int16 v57 = 2112;
      v58 = (const char *)v39;
      _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v44 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v39 userInfo:0];
    objc_exception_throw(v44);
  }
  id v13 = objc_getProperty(self, v11, 8, 1);
  if (!v12) {
    goto LABEL_10;
  }
  v15 = v13;
  if (v13)
  {
    v51[0] = @"value";
    v51[1] = @"keyPath";
    v52[0] = v9;
    v52[1] = v8;
    v51[2] = @"SettingTargetType";
    id Property = objc_getProperty(self, v14, 32, 1);
    v51[3] = @"kUserUUIDKey";
    id v16 = Property;
    id v54 = objc_getProperty(self, v17, 24, 1);
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    id v19 = v54;
    v20 = [v18 dictionaryWithObjects:v52 forKeys:v51 count:4];

    v21 = (void *)MEMORY[0x1E4F654B0];
    id v22 = objc_alloc(MEMORY[0x1E4F65488]);
    v24 = objc_msgSend(v22, "initWithTarget:", objc_getProperty(self, v23, 16, 1));
    v25 = [v21 messageWithName:@"HMS.uv" destination:v24 payload:v20];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__HMSettingsMessageHandler_sendUpdateValueMessage_value_completionHandler___block_invoke;
    aBlock[3] = &unk_1E59400F8;
    v50 = v12;
    v26 = _Block_copy(aBlock);
    v28 = objc_msgSend(objc_getProperty(self, v27, 8, 1), "pendingRequests");
    v29 = [v25 identifier];
    v30 = _Block_copy(v26);
    [v28 addCompletionBlock:v30 forIdentifier:v29];

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __75__HMSettingsMessageHandler_sendUpdateValueMessage_value_completionHandler___block_invoke_2;
    v45[3] = &unk_1E5945510;
    id v46 = v28;
    id v47 = v29;
    id v48 = v26;
    id v31 = v26;
    id v32 = v29;
    id v33 = v28;
    [v25 setResponseHandler:v45];
    v34 = [v15 messageDispatcher];
    [v34 sendMessage:v25 completionHandler:0];

    goto LABEL_9;
  }
LABEL_6:
  v35 = (void *)MEMORY[0x19F3A64A0]();
  v36 = self;
  v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v38 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v56 = v38;
    __int16 v57 = 2080;
    v58 = "-[HMSettingsMessageHandler sendUpdateValueMessage:value:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  ((void (**)(void, void *))v12)[2](v12, v15);
LABEL_9:
}

uint64_t __75__HMSettingsMessageHandler_sendUpdateValueMessage_value_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__HMSettingsMessageHandler_sendUpdateValueMessage_value_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

@end