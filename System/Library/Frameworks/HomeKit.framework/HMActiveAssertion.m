@interface HMActiveAssertion
@end

@implementation HMActiveAssertion

void __43____HMActiveAssertion__setAssertionActive___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3A64A0]();
  v8 = HMFGetOSLogHandle();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = *(unsigned __int8 *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      __int16 v21 = 1024;
      int v22 = v11;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set assertion active to %{BOOL}d: %@", buf, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = *(unsigned __int8 *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      __int16 v21 = 1024;
      int v22 = v13;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Posting HMActiveAssertionDidSendStateNotification with active: %{BOOL}d", buf, 0x12u);
    }
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v15 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32), @"HMActiveAssertionActiveStateNotificationKey");
    v18 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [v14 postNotificationName:@"HMActiveAssertionDidSendStateNotification" object:0 userInfo:v16];
  }
}

void __31____HMActiveAssertion_acquire___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isValid]) {
    -[__HMActiveAssertion _setAssertionActive:](WeakRetained, 1);
  }
}

@end