@interface CDObservationCenter
@end

@implementation CDObservationCenter

uint64_t __38___CDObservationCenter_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __79___CDObservationCenter__postNotificationName_userInfo_sender_observerObserver___block_invoke(uint64_t a1)
{
}

void __79___CDObservationCenter__postNotificationName_userInfo_sender_observerObserver___block_invoke_2(void **a1)
{
}

uint64_t __78___CDObservationCenter_addObserverChangesObserver_onName_queue_usingSelector___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3;
  [*(id *)(a1 + 32) setArgument:&v5 atIndex:3];
  return [*(id *)(a1 + 32) invoke];
}

void __75___CDObservationCenter_addObserverChangesObserver_onName_queue_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:@"observerCount"];
  (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), [v4 unsignedIntegerValue]);
}

@end