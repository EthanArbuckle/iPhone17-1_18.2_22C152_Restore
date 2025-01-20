@interface MSComposeAnalytics
+ (EFScheduler)scheduler;
+ (void)sendAnalyticsSignal:(int64_t)a3 threadIdentifier:(id)a4 isDraft:(BOOL)a5;
@end

@implementation MSComposeAnalytics

+ (EFScheduler)scheduler
{
  if (scheduler_onceToken != -1) {
    dispatch_once(&scheduler_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)scheduler_scheduler;
  return (EFScheduler *)v2;
}

void __31__MSComposeAnalytics_scheduler__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.compose-analytics" qualityOfService:-1];
  v1 = (void *)scheduler_scheduler;
  scheduler_scheduler = v0;
}

+ (void)sendAnalyticsSignal:(int64_t)a3 threadIdentifier:(id)a4 isDraft:(BOOL)a5
{
  BOOL v5 = a5;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  switch(a3)
  {
    case 0:
      goto LABEL_8;
    case 1:
      v8 = (__CFString *)(id)*MEMORY[0x1E4F6F480];
      uint64_t v19 = *MEMORY[0x1E4F6F458];
      v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
      v20[0] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

      break;
    case 2:
      v11 = (id *)MEMORY[0x1E4F6F478];
      goto LABEL_5;
    case 3:
      v11 = (id *)MEMORY[0x1E4F6F470];
LABEL_5:
      v8 = (__CFString *)*v11;
      v10 = 0;
      break;
    default:
      v10 = 0;
      v8 = @"Unknown";
      break;
  }
  v12 = +[MSComposeAnalytics scheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__MSComposeAnalytics_sendAnalyticsSignal_threadIdentifier_isDraft___block_invoke;
  v15[3] = &unk_1E63FE898;
  v13 = v8;
  v16 = v13;
  id v17 = v7;
  id v18 = v10;
  id v14 = v10;
  [v12 performBlock:v15];

LABEL_8:
}

uint64_t __67__MSComposeAnalytics_sendAnalyticsSignal_threadIdentifier_isDraft___block_invoke(void *a1)
{
  return [MEMORY[0x1E4F6F4B0] sendSignal:a1[4] toChannel:*MEMORY[0x1E4F6F438] withNullableUniqueStringID:a1[5] withPayload:a1[6]];
}

@end