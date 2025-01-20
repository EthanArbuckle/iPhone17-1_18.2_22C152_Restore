@interface HDAlarmEventChanges(HDMCNotificationSyncManager)
- (void)hdmc_enumerateNotificationInstructionsFromAnalysisSampleInfo:()HDMCNotificationSyncManager block:;
@end

@implementation HDAlarmEventChanges(HDMCNotificationSyncManager)

- (void)hdmc_enumerateNotificationInstructionsFromAnalysisSampleInfo:()HDMCNotificationSyncManager block:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = a4;
  if (v6)
  {
    if ([v6 isDeleted]) {
      v8 = (objc_class *)MEMORY[0x263F43288];
    }
    else {
      v8 = (objc_class *)MEMORY[0x263F43290];
    }
    id v9 = [v8 alloc];
    v10 = [v6 UUID];
    v11 = (void *)[v9 initWithUUID:v10];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v12 = objc_msgSend(a1, "removedEvents", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16), "hdmc_notificationHoldInstruction");
          v7[2](v7, v17, v11);

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

@end