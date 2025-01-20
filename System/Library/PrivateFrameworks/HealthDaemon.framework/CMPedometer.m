@interface CMPedometer
@end

@implementation CMPedometer

uint64_t __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke_367(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  if (v3)
  {
    v4();
    v5 = [v3 lastObject];
    v6 = objc_msgSend(v5, "hd_datestamp");

    if (v6) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning pedometer updates from %{public}@.", buf, 0x16u);
    }
    v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke_369;
    v15[3] = &unk_1E630D650;
    v15[4] = v13;
    id v16 = *(id *)(a1 + 40);
    [v13 startPedometerUpdatesFromDate:v14 withHandler:v15];
  }
  else
  {
    v4();
  }
}

void __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke_369(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Received datum %@, error: %{public}@.", buf, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v5)
  {
    id v11 = v5;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
}

@end