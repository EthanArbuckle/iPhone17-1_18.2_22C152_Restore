@interface ACAccount
@end

@implementation ACAccount

void __59__ACAccount_DeviceManagementClient__dmc_accountQuotaString__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = *DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve quota size for account: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    v12 = (void *)getAAQuotaInfoResponseClass_softClass;
    uint64_t v28 = getAAQuotaInfoResponseClass_softClass;
    if (!getAAQuotaInfoResponseClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAAQuotaInfoResponseClass_block_invoke;
      v30 = &unk_1E5CFD440;
      v31 = &v25;
      __getAAQuotaInfoResponseClass_block_invoke((uint64_t)buf);
      v12 = (void *)v26[3];
    }
    v13 = v12;
    _Block_object_dispose(&v25, 8);
    id v14 = [v13 alloc];
    v15 = objc_msgSend(v8, "httpResponse", v25);
    v16 = [v8 data];
    v17 = (void *)[v14 initWithHTTPResponse:v15 data:v16];

    v18 = [v17 totalStorageInBytes];
    uint64_t v19 = [v18 longLongValue];

    if (v19)
    {
      uint64_t v20 = NSLocalizedFileSizeDescription();
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;
    }
    else
    {
      v23 = *DMCLogObjects();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v24;
        _os_log_impl(&dword_1A7863000, v23, OS_LOG_TYPE_ERROR, "Quota size for account: %{public}@ is 0!", buf, 0xCu);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end