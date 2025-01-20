@interface FBSDisplayLayoutService
@end

@implementation FBSDisplayLayoutService

void __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v3 = *(char *)(a1 + 40);
  if (v3 >= 3) {
    uint64_t v4 = 9;
  }
  else {
    uint64_t v4 = 4 * v3 + 17;
  }
  id v5 = a2;
  v6 = [off_1E58F4580 serviceWithClass:v4];
  [v5 setServiceQuality:v6];

  [v5 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  v7 = +[FBSDisplayLayoutMonitor interface];
  [v5 setInterface:v7];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_3;
  v10[3] = &unk_1E58F62D0;
  id v11 = *(id *)(a1 + 32);
  [v5 setInterruptionHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_4;
  v8[3] = &unk_1E58F62D0;
  id v9 = *(id *)(a1 + 32);
  [v5 setInvalidationHandler:v8];
}

uint64_t __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke(uint64_t a1, void *a2)
{
  return [a2 encodeInt64:*(char *)(a1 + 32) forKey:@"qos"];
}

uint64_t __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteDisconnected];
}

void __47___FBSDisplayLayoutService_addObserver_forKey___block_invoke(void *a1)
{
  v2 = a1 + 4;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 32));
  id v3 = *(id *)(*v2 + 48);
  uint64_t v4 = *v2;
  if (v2[3] == *(void *)(*v2 + 56))
  {
    id v5 = [*(id *)(v4 + 40) objectForKey:a1[5]];
    v6 = (void *)a1[6];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
    if (v5 == v6)
    {
      if (!a1[7])
      {
        v7 = FBLogCommon();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __47___FBSDisplayLayoutService_addObserver_forKey___block_invoke_cold_1((uint64_t)v2, v7);
        }
      }
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  }
}

void __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 _noteDisconnected];
  [v3 activate];
}

void __47___FBSDisplayLayoutService_addObserver_forKey___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(*(void *)a1 + 8) instance];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "FBSDisplayLayoutService: timed out waiting for initial layout update from %{public}@; publishing nil.",
    (uint8_t *)&v4,
    0xCu);
}

@end