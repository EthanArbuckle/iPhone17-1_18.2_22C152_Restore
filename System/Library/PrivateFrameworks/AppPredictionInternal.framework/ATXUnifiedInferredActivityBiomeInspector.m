@interface ATXUnifiedInferredActivityBiomeInspector
+ (id)inferredActivityStreamFromName:(id)a3;
+ (void)retrieveInferredActivitySessionsFromPublisherName:(id)a3 startTime:(double)a4 reply:(id)a5;
+ (void)retrieveInferredActivityTransitionsFromPublisherName:(id)a3 startTime:(double)a4 reply:(id)a5;
@end

@implementation ATXUnifiedInferredActivityBiomeInspector

+ (id)inferredActivityStreamFromName:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"timeBasedInferredActivity"] & 1) != 0
    || ([v3 isEqualToString:@"appLaunchInferredActivity"] & 1) != 0
    || ([v3 isEqualToString:@"heuristicInferredActivity"] & 1) != 0
    || ([v3 isEqualToString:@"computedModeActivity"] & 1) != 0
    || [v3 isEqualToString:@"unifiedInferredActivity"])
  {
    v4 = objc_opt_new();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)retrieveInferredActivitySessionsFromPublisherName:(id)a3 startTime:(double)a4 reply:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, id, void))a5;
  v9 = [a1 inferredActivityStreamFromName:a3];
  if (v9)
  {
    v10 = objc_opt_new();
    v11 = [v9 sessionPublisherFromStartTime:a4];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __110__ATXUnifiedInferredActivityBiomeInspector_retrieveInferredActivitySessionsFromPublisherName_startTime_reply___block_invoke_2;
    v16[3] = &unk_1E68B1650;
    id v17 = v10;
    id v12 = v10;
    id v13 = (id)[v11 sinkWithCompletion:&__block_literal_global_104 receiveInput:v16];
    v8[2](v8, v12, 0);

    v8 = (void (**)(id, id, void))v12;
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"Received invalid stream identifier";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v11 = (void *)[v14 initWithDomain:@"ATXUnifiedInferredActivityBiomeInspectorErrorDomain" code:-1 userInfo:v15];

    ((void (**)(id, id, void *))v8)[2](v8, (id)MEMORY[0x1E4F1CBF0], v11);
  }
}

uint64_t __110__ATXUnifiedInferredActivityBiomeInspector_retrieveInferredActivitySessionsFromPublisherName_startTime_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (void)retrieveInferredActivityTransitionsFromPublisherName:(id)a3 startTime:(double)a4 reply:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, id, void))a5;
  v9 = [a1 inferredActivityStreamFromName:a3];
  if (v9)
  {
    v10 = objc_opt_new();
    v11 = [v9 transitionPublisherFromStartTime:a4];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __113__ATXUnifiedInferredActivityBiomeInspector_retrieveInferredActivityTransitionsFromPublisherName_startTime_reply___block_invoke_2;
    v16[3] = &unk_1E68B1678;
    id v17 = v10;
    id v12 = v10;
    id v13 = (id)[v11 sinkWithCompletion:&__block_literal_global_29_1 receiveInput:v16];
    v8[2](v8, v12, 0);

    v8 = (void (**)(id, id, void))v12;
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"Received invalid stream identifier";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v11 = (void *)[v14 initWithDomain:@"ATXUnifiedInferredActivityBiomeInspectorErrorDomain" code:-1 userInfo:v15];

    ((void (**)(id, id, void *))v8)[2](v8, (id)MEMORY[0x1E4F1CBF0], v11);
  }
}

uint64_t __113__ATXUnifiedInferredActivityBiomeInspector_retrieveInferredActivityTransitionsFromPublisherName_startTime_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end