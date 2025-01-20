@interface DNDAuxiliaryStateService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)setScreenIsShared:(BOOL)a3 screenIsMirrored:(BOOL)a4 error:(id *)a5;
- (id)_initWithClientIdentifier:(id)a3;
@end

@implementation DNDAuxiliaryStateService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken, &__block_literal_global);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__DNDAuxiliaryStateService_serviceForClientIdentifier___block_invoke_2;
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

uint64_t __55__DNDAuxiliaryStateService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDAppInfoService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue;
  serviceForClientIdentifier__lockQueue = (uint64_t)v1;

  serviceForClientIdentifier__serviceByClientIdentifier = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  return MEMORY[0x1F41817F8]();
}

void __55__DNDAuxiliaryStateService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (BOOL)setScreenIsShared:(BOOL)a3 screenIsMirrored:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDAuxiliaryStateService.setScreenIsShared:screenIsMirrored:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  v11 = +[DNDRemoteServiceConnection sharedInstance];
  id v12 = [NSNumber numberWithBool:v7];
  uint64_t v13 = [NSNumber numberWithBool:v6];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__DNDAuxiliaryStateService_setScreenIsShared_screenIsMirrored_error___block_invoke;
  v19[3] = &unk_1E5910F40;
  v19[4] = &v26;
  v19[5] = &v20;
  [v11 setScreenIsShared:v12 screenIsMirrored:v13 withRequestDetails:v10 completionHandler:v19];

  v14 = DNDLogAuxiliaryState;
  if (*((unsigned char *)v27 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogAuxiliaryState, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v32 = v10;
      __int16 v33 = 1024;
      *(_DWORD *)v34 = v7;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v6;
      _os_log_impl(&dword_19CC2C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set auxiliary state; isScreenShared=%d isScreenMirrored=%d",
        buf,
        0x18u);
      if (!a5) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
LABEL_6:
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogAuxiliaryState, OS_LOG_TYPE_ERROR)) {
    goto LABEL_6;
  }
  uint64_t v18 = v21[5];
  *(_DWORD *)buf = 138544130;
  v32 = v10;
  __int16 v33 = 2114;
  *(void *)v34 = v18;
  *(_WORD *)&v34[8] = 1024;
  BOOL v35 = v7;
  __int16 v36 = 1024;
  BOOL v37 = v6;
  _os_log_error_impl(&dword_19CC2C000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Error when setting auxiliary state; error='%{public}@' isScreenShared=%d isScreenMirrored=%d",
    buf,
    0x22u);
  if (!a5) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v15 = (void *)v21[5];
  if (v15) {
    *a5 = v15;
  }
LABEL_9:
  BOOL v16 = *((unsigned char *)v27 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  os_activity_scope_leave(&state);

  return v16;
}

void __69__DNDAuxiliaryStateService_setScreenIsShared_screenIsMirrored_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDAuxiliaryStateService;
  id v5 = [(DNDAuxiliaryStateService *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.donotdisturb.DNDAuxiliaryStateService", v8);
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