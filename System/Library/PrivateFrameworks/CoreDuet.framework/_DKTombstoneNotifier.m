@interface _DKTombstoneNotifier
+ (void)sendDistributedNotificationsForTombstoneRequirementIdentifiers:(id)a3 queue:(id)a4;
@end

@implementation _DKTombstoneNotifier

+ (void)sendDistributedNotificationsForTombstoneRequirementIdentifiers:(id)a3 queue:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[_DKThrottledActivity standardInstance];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __93___DKTombstoneNotifier_sendDistributedNotificationsForTombstoneRequirementIdentifiers_queue___block_invoke;
        v15[3] = &unk_1E560D578;
        v15[4] = v12;
        v13 = (void *)MEMORY[0x192FB31A0](v15);
        [v7 performWithMinimumIntervalInSecondsOf:v12 name:v6 queue:v13 activityBlock:2.0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

@end