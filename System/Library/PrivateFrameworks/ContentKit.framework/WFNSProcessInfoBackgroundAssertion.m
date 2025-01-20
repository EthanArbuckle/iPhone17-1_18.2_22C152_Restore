@interface WFNSProcessInfoBackgroundAssertion
+ (id)backgroundAssertionWithName:(id)a3 expirationHandler:(id)a4;
- (OS_dispatch_semaphore)semaphore;
- (WFNSProcessInfoBackgroundAssertion)initWithName:(id)a3 expirationHandler:(id)a4;
- (void)end;
- (void)setSemaphore:(id)a3;
@end

@implementation WFNSProcessInfoBackgroundAssertion

- (void).cxx_destruct
{
}

- (void)setSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)end
{
  v2 = [(WFNSProcessInfoBackgroundAssertion *)self semaphore];
  dispatch_semaphore_signal(v2);
}

- (WFNSProcessInfoBackgroundAssertion)initWithName:(id)a3 expirationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)WFNSProcessInfoBackgroundAssertion;
  v8 = [(WFNSProcessInfoBackgroundAssertion *)&v24 init];
  if (v8)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__26273;
    v22 = __Block_byref_object_dispose__26274;
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    objc_storeStrong((id *)&v8->_semaphore, (id)v19[5]);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__1;
    v16[4] = __Block_byref_object_dispose__2;
    id v17 = _Block_copy(v7);
    v9 = [MEMORY[0x263F08AB0] processInfo];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__WFNSProcessInfoBackgroundAssertion_initWithName_expirationHandler___block_invoke;
    v12[3] = &unk_26428B118;
    v14 = v16;
    v15 = &v18;
    id v13 = v6;
    [v9 performExpiringActivityWithReason:v13 usingBlock:v12];

    v10 = v8;
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(&v18, 8);
  }

  return v8;
}

void __69__WFNSProcessInfoBackgroundAssertion_initWithName_expirationHandler___block_invoke(void *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1[5] + 8);
    v4 = *(void (***)(void))(v3 + 40);
    if (v4)
    {
      v4[2]();
      uint64_t v3 = *(void *)(a1[5] + 8);
      v4 = *(void (***)(void))(v3 + 40);
    }
    *(void *)(v3 + 40) = 0;
  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v5 = *(void *)(a1[5] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    uint64_t v7 = *(void *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    v9 = getWFBackgroundAssertionLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = a1[4];
      int v11 = 136315394;
      v12 = "-[WFNSProcessInfoBackgroundAssertion initWithName:expirationHandler:]_block_invoke";
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl(&dword_216505000, v9, OS_LOG_TYPE_INFO, "%s Finished background assertion for %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

+ (id)backgroundAssertionWithName:(id)a3 expirationHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 expirationHandler:v6];

  return v8;
}

@end