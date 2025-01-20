@interface FLTelemetryAnalyticsController
- (void)_captureItem:(id)a3 event:(id)a4 source:(id)a5;
- (void)captureActionForItem:(id)a3 withEvent:(unint64_t)a4 source:(unint64_t)a5;
- (void)captureCurrentState:(id)a3;
- (void)captureItemAddition:(id)a3;
- (void)captureItemRemoval:(id)a3;
- (void)captureItemView:(id)a3;
@end

@implementation FLTelemetryAnalyticsController

- (void)captureActionForItem:(id)a3 withEvent:(unint64_t)a4 source:(unint64_t)a5
{
  id v13 = a3;
  v8 = [v13 clientIdentifier];
  char v9 = [v8 isEqualToString:@"com.apple.followup.tests"];

  if ((v9 & 1) == 0)
  {
    v10 = @"other";
    v11 = @"other";
    if (a5 - 1 <= 3) {
      v11 = off_1E637AF88[a5 - 1];
    }
    if (a4 == 2) {
      v10 = @"userActivate";
    }
    if (a4 == 1) {
      v12 = @"userClear";
    }
    else {
      v12 = v10;
    }
    [(FLTelemetryAnalyticsController *)self _captureItem:v13 event:v12 source:v11];
  }
}

- (void)captureCurrentState:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F28BD0]);
  v5 = objc_msgSend(v3, "fl_map:", &__block_literal_global_5);
  v6 = (void *)[v4 initWithArray:v5];

  v27 = @"all";
  v19 = v3;
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v28[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  char v9 = (void *)[v8 mutableCopy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v16 = [v15 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
        v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "countForObject:", v15));
        [v9 setObject:v17 forKeyedSubscript:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__FLTelemetryAnalyticsController_captureCurrentState___block_invoke_2;
  v20[3] = &unk_1E637AF40;
  id v21 = v9;
  id v18 = v9;
  +[FLTelemetryAnalyticsSender sendAnalyticsForEvent:@"com.apple.followup.groupCounts" builder:v20];
}

uint64_t __54__FLTelemetryAnalyticsController_captureCurrentState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupIdentifier];
}

id __54__FLTelemetryAnalyticsController_captureCurrentState___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)captureItemAddition:(id)a3
{
}

- (void)captureItemView:(id)a3
{
}

- (void)captureItemRemoval:(id)a3
{
}

- (void)_captureItem:(id)a3 event:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__FLTelemetryAnalyticsController__captureItem_event_source___block_invoke;
  v13[3] = &unk_1E637AF68;
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  +[FLTelemetryAnalyticsSender sendAnalyticsForEvent:@"com.apple.followup.items" builder:v13];
}

id __60__FLTelemetryAnalyticsController__captureItem_event_source___block_invoke(uint64_t a1)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"identifier";
  v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  v14[0] = v2;
  v13[1] = @"client";
  uint64_t v3 = [*(id *)(a1 + 32) clientIdentifier];
  id v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"none";
  }
  v14[1] = v5;
  v13[2] = @"group";
  uint64_t v6 = [*(id *)(a1 + 32) groupIdentifier];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"none";
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v14[2] = v8;
  v14[3] = v9;
  v13[3] = @"type";
  void v13[4] = @"source";
  v14[4] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

@end