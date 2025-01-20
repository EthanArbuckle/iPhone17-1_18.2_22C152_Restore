@interface DNDHearingTestService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)setHearingTestIsActive:(BOOL)a3 error:(id *)a4;
- (id)_initWithClientIdentifier:(id)a3;
@end

@implementation DNDHearingTestService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_6 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_6, &__block_literal_global_10);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__DNDHearingTestService_serviceForClientIdentifier___block_invoke_2;
  block[3] = &unk_1E5910F18;
  id v10 = v4;
  v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __52__DNDHearingTestService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDAppInfoService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_6;
  serviceForClientIdentifier__lockQueue_6 = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  uint64_t v4 = serviceForClientIdentifier__serviceByClientIdentifier_6;
  serviceForClientIdentifier__serviceByClientIdentifier_6 = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

void __52__DNDHearingTestService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_6 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_6;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (BOOL)setHearingTestIsActive:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDHearingTestService.setHearingTestIsActive:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  uint64_t v10 = [NSNumber numberWithBool:v5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__DNDHearingTestService_setHearingTestIsActive_error___block_invoke;
  v16[3] = &unk_1E5910F40;
  v16[4] = &v23;
  v16[5] = &v17;
  [v9 setHearingTestIsActive:v10 withRequestDetails:v8 completionHandler:v16];

  v11 = DNDLogHearingTest;
  if (*((unsigned char *)v24 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogHearingTest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      __int16 v30 = 1024;
      LODWORD(v31) = v5;
      _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set hearing test state; isHearingTestActive=%d",
        buf,
        0x12u);
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
LABEL_6:
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogHearingTest, OS_LOG_TYPE_ERROR)) {
    goto LABEL_6;
  }
  uint64_t v15 = v18[5];
  *(_DWORD *)buf = 138543874;
  v29 = v8;
  __int16 v30 = 2114;
  uint64_t v31 = v15;
  __int16 v32 = 1024;
  BOOL v33 = v5;
  _os_log_error_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error when setting hearing test state; error='%{public}@' isHearingTestActive=%d",
    buf,
    0x1Cu);
  if (!a4) {
    goto LABEL_9;
  }
LABEL_7:
  id v12 = (void *)v18[5];
  if (v12) {
    *a4 = v12;
  }
LABEL_9:
  BOOL v13 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v13;
}

void __54__DNDHearingTestService_setHearingTestIsActive_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDHearingTestService;
  id v5 = [(DNDHearingTestService *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.donotdisturb.DNDHearingTestService", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end