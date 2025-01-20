@interface HDNotificationInstructionQueryServer
+ (Class)queryClass;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (void)_queue_start;
@end

@implementation HDNotificationInstructionQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)_queue_start
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [(HDQueryServer *)self configuration];
  v4 = [v3 debugIdentifier];

  _HKInitializeLogging();
  v5 = (id *)MEMORY[0x1E4F29F80];
  v6 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    id v8 = *(id *)&buf[4];
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Query Started", buf, 0x16u);
  }
  v39.receiver = self;
  v39.super_class = (Class)HDNotificationInstructionQueryServer;
  [(HDQueryServer *)&v39 _queue_start];
  v9 = [(HDQueryServer *)self clientProxy];
  v10 = [v9 remoteObjectProxy];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__199;
  v46 = __Block_byref_object_dispose__199;
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v11 = [HDNotificationInstructionDiagnostics alloc];
  v12 = [(HDQueryServer *)self profile];
  v13 = [(HDNotificationInstructionDiagnostics *)v11 initWithProfile:v12];

  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __52__HDNotificationInstructionQueryServer__queue_start__block_invoke;
  v23[3] = &unk_1E630D900;
  v23[4] = self;
  v25 = &v31;
  v26 = buf;
  id v14 = v10;
  id v24 = v14;
  v27 = &v35;
  v28 = v30;
  BOOL v15 = [(HDNotificationInstructionDiagnostics *)v13 enumerateAllNotificationInstructionsWithError:&v29 enumerationHandler:v23];
  id v16 = v29;
  if (!*((unsigned char *)v32 + 24))
  {
    if (v15)
    {
      uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
      int v18 = *((unsigned __int8 *)v36 + 24);
      v19 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v14, "client_deliverNotificationInstructions:clearPending:isFinalBatch:queryUUID:", v17, v18 != 0, 1, v19);
    }
    else
    {
      v19 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v14, "client_deliverError:forQuery:", v16, v19);
    }
  }
  _HKInitializeLogging();
  v20 = *v5;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_opt_class();
    *(_DWORD *)v40 = 138543618;
    v41 = v21;
    __int16 v42 = 2114;
    v43 = v4;
    id v22 = v21;
    _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Query Finished", v40, 0x16u);
  }
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);
}

uint64_t __52__HDNotificationInstructionQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([*(id *)(a1 + 32) _shouldStopProcessingQuery] & 1) != 0
    || [*(id *)(a1 + 32) _shouldSuspendQuery])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 128, @"Query suspended or aborted");
    uint64_t v6 = 0;
  }
  else
  {
    if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] >= 0xC8)
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      v9 = *(void **)(a1 + 40);
      v10 = [*(id *)(a1 + 32) queryUUID];
      objc_msgSend(v9, "client_deliverNotificationInstructions:clearPending:isFinalBatch:queryUUID:", v7, v8, 0, v10);

      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v5];
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v6 = 1;
  }

  return v6;
}

@end