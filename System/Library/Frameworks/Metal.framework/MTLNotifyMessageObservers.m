@interface MTLNotifyMessageObservers
@end

@implementation MTLNotifyMessageObservers

uint64_t ___MTLNotifyMessageObservers_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = (void *)s_notifierArray;
  uint64_t result = [(id)s_notifierArray countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        v8 = (void *)[v7 filter];
        if (!v8
          || (v9 = v8, uint64_t v10 = [v8 messageType], (objc_msgSend(*(id *)(a1 + 32), "messageType") & v10) != 0)
          && (![v9 device]
           || ![*(id *)(a1 + 32) device]
           || (uint64_t v11 = [v9 device], v11 == objc_msgSend(*(id *)(a1 + 32), "device"))))
        {
          uint64_t v12 = [v7 handler];
          (*(void (**)(uint64_t, void, void))(v12 + 16))(v12, *(void *)(a1 + 32), *(void *)(a1 + 40));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

@end