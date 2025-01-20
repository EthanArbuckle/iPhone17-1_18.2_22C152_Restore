@interface HMFHTTPClientGetBaseURL
@end

@implementation HMFHTTPClientGetBaseURL

void ____HMFHTTPClientGetBaseURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = v5;
  if (*(void *)(a1 + 32))
  {
    if (v8)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = v5;
      if (!v7)
      {
        id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2 reason:@"Unable to determine the address of the server"];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void ____HMFHTTPClientGetBaseURL_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x19F3A87A0]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier(v5);
      int v10 = 138543618;
      v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to resolve service with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = [*(id *)(a1 + 32) baseURL];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v3);
}

@end