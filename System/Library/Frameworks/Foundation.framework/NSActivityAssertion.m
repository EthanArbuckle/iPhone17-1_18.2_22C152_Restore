@interface NSActivityAssertion
@end

@implementation NSActivityAssertion

uint64_t __38___NSActivityAssertion__bundleVersion__block_invoke()
{
  v0 = [+[NSBundle mainBundle] infoDictionary];
  qword_1EB1ED348 = (uint64_t)[(NSDictionary *)v0 objectForKey:*MEMORY[0x1E4F1D020]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1 = [NSString alloc];
    [(id)qword_1EB1ED348 doubleValue];
    uint64_t result = [(NSString *)v1 initWithFormat:@"%f", v2];
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result) {
      return result;
    }
    uint64_t result = @"unknown";
  }
  qword_1EB1ED348 = result;
  return result;
}

dispatch_queue_t __57___NSActivityAssertion__expiringAssertionManagementQueue__block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.expiringAssertionManagementQueue", 0);
  qword_1EB1ED310 = (uint64_t)result;
  return result;
}

dispatch_queue_t __51___NSActivityAssertion__expiringTaskExecutionQueue__block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.expiringTaskExecutionQueue", MEMORY[0x1E4F14430]);
  qword_1EB1ED320 = (uint64_t)result;
  return result;
}

NSHashTable *__43___NSActivityAssertion__expiringActivities__block_invoke()
{
  dispatch_queue_t result = [[NSHashTable alloc] initWithOptions:0 capacity:0];
  qword_1EB1ED340 = (uint64_t)result;
  return result;
}

uint64_t __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _endFromDealloc:0];
}

uint64_t __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21, 0);
  v1 = (uint64_t (*)(uint64_t, uint64_t))softLinkBKSProcessAssertionSetExpirationHandler;

  return v1((uint64_t)global_queue, (uint64_t)&__block_literal_global_55);
}

void __40___NSActivityAssertion__endFromDealloc___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "removeObject:", *(void *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];

    *(void *)(*(void *)(a1 + 32) + 72) = 0;
  }
}

uint64_t __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_3(uint64_t a1)
{
  v6[5] = *MEMORY[0x1E4F143B8];
  objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "addObject:", *(void *)(a1 + 32));
  id v2 = objc_alloc(getBKSProcessAssertionClass());
  uint64_t v3 = getpid();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_4;
  v6[3] = &unk_1E51F8F20;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  uint64_t result = [v2 initWithPID:v3 flags:1 reason:4 name:v4 withHandler:v6];
  *(void *)(*(void *)(a1 + 32) + 72) = result;
  return result;
}

void __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_4(uint64_t a1, char a2)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    [*(id *)(a1 + 32) _fireExpirationHandler];
    uint64_t v3 = +[_NSActivityAssertion _expiringAssertionManagementQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_5;
    v4[3] = &unk_1E51F71D0;
    v4[4] = *(void *)(a1 + 32);
    dispatch_async(v3, v4);
  }
}

dispatch_queue_t __56___NSActivityAssertion__expirationHandlerExecutionQueue__block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.expirationHandlerExecutionQueue", MEMORY[0x1E4F14430]);
  qword_1EB1ED330 = (uint64_t)result;
  return result;
}

uint64_t __48___NSActivityAssertion__dumpExpiringActivitives__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v0 = +[_NSActivityAssertion _expiringActivities];
  uint64_t result = [v0 countByEnumeratingWithState:&v7 objects:v6 count:16];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v0);
        }
        NSLog((NSString *)@"%lull: %@", v3 + v5, [*(id *)(*((void *)&v7 + 1) + 8 * v5) debugDescription]);
        ++v5;
      }
      while (v2 != v5);
      uint64_t result = [v0 countByEnumeratingWithState:&v7 objects:v6 count:16];
      uint64_t v2 = result;
      v3 += v5;
    }
    while (result);
  }
  return result;
}

void __42___NSActivityAssertion__expireAllActivies__block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v0 = objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "allObjects");
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v1 = [v0 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v9;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v0);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v4++) _fireExpirationHandler];
      }
      while (v2 != v4);
      uint64_t v2 = [v0 countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v2);
  }
  uint64_t v5 = +[_NSActivityAssertion _expirationHandlerExecutionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___NSActivityAssertion__expireAllActivies__block_invoke_2;
  block[3] = &unk_1E51F71D0;
  block[4] = v0;
  dispatch_barrier_async(v5, block);
}

void __42___NSActivityAssertion__expireAllActivies__block_invoke_2(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[_NSActivityAssertion _expiringAssertionManagementQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42___NSActivityAssertion__expireAllActivies__block_invoke_3;
  v3[3] = &unk_1E51F71D0;
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(v2, v3);
}

uint64_t __42___NSActivityAssertion__expireAllActivies__block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "removeObject:", *(void *)(*((void *)&v7 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_2()
{
  return +[_NSActivityAssertion _expireAllActivies];
}

void __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_5(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "removeObject:", *(void *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];

    *(void *)(*(void *)(a1 + 32) + 72) = 0;
  }
}

void __46___NSActivityAssertion__fireExpirationHandler__block_invoke(uint64_t a1)
{
  block[6] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 80);
  *(void *)(v2 + 80) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
  uint64_t v4 = +[_NSActivityAssertion _expirationHandlerExecutionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___NSActivityAssertion__fireExpirationHandler__block_invoke_2;
  block[3] = &unk_1E51F7EE0;
  block[4] = *(void *)(a1 + 32);
  void block[5] = v3;
  dispatch_async(v4, block);
}

void __46___NSActivityAssertion__fireExpirationHandler__block_invoke_2(uint64_t a1)
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void **)(a1 + 40);
  }
  else
  {
    uint64_t v3 = 0;
  }

  uint64_t v4 = +[_NSActivityAssertion _expiringAssertionManagementQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46___NSActivityAssertion__fireExpirationHandler__block_invoke_3;
  v5[3] = &unk_1E51F71D0;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async(v4, v5);
}

void __46___NSActivityAssertion__fireExpirationHandler__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = 0;
}

uint64_t __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end