@interface ATXBiomeStreamInspector
+ (void)_makeStreamJSONForStream:(id)a3 publisher:(id)a4 maxNumEvents:(unint64_t)a5 callback:(id)a6;
+ (void)makeJSONRepresentationForStreamWithBlock:(id)a3;
+ (void)makeJSONRepresentationForStreamWithBlock:(id)a3 blendingPublisher:(id)a4 clientPublisher:(id)a5 uiPublisher:(id)a6 spotlightUIPublisher:(id)a7 appLaunchPublisher:(id)a8 appIntentPublisher:(id)a9 inferredModePublisher:(id)a10;
@end

@implementation ATXBiomeStreamInspector

+ (void)makeJSONRepresentationForStreamWithBlock:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  [v3 timeIntervalSinceReferenceDate];
  double v6 = v5 + -7200.0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7 + -86400.0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v10 = v9 + -604800.0;
  v11 = objc_opt_class();
  id v31 = (id)objc_opt_new();
  v34 = [v31 publisherFromStartTime:v6];
  v30 = objc_opt_new();
  v33 = [v30 publisherFromStartTime:v6];
  v29 = objc_opt_new();
  v32 = [v29 genericEventPublisherFromStartTime:v8];
  v28 = objc_opt_new();
  v12 = [v28 publisherFromStartTime:v8];
  v27 = BiomeLibrary();
  v26 = [v27 App];
  v25 = [v26 InFocus];
  v24 = [NSNumber numberWithDouble:v6];
  v20 = objc_msgSend(v25, "atx_publisherFromStartTime:", v24);
  v23 = BiomeLibrary();
  v22 = [v23 App];
  v21 = [v22 Intent];
  v13 = [NSNumber numberWithDouble:v6];
  v14 = objc_msgSend(v21, "atx_publisherFromStartTime:", v13);
  v15 = BiomeLibrary();
  v16 = [v15 UserFocus];
  v17 = [v16 InferredMode];
  v18 = [NSNumber numberWithDouble:v10];
  v19 = objc_msgSend(v17, "atx_publisherFromStartTime:", v18);
  [v11 makeJSONRepresentationForStreamWithBlock:v4 blendingPublisher:v34 clientPublisher:v33 uiPublisher:v32 spotlightUIPublisher:v12 appLaunchPublisher:v20 appIntentPublisher:v14 inferredModePublisher:v19];
}

+ (void)makeJSONRepresentationForStreamWithBlock:(id)a3 blendingPublisher:(id)a4 clientPublisher:(id)a5 uiPublisher:(id)a6 spotlightUIPublisher:(id)a7 appLaunchPublisher:(id)a8 appIntentPublisher:(id)a9 inferredModePublisher:(id)a10
{
  id v30 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v23 = (void *)MEMORY[0x1D25F6CC0]();
  [a1 _makeStreamJSONForStream:@"blending" publisher:v16 maxNumEvents:500 callback:v30];
  v24 = (void *)MEMORY[0x1D25F6CC0]();
  [a1 _makeStreamJSONForStream:@"clientModel" publisher:v17 maxNumEvents:250 callback:v30];
  v25 = (void *)MEMORY[0x1D25F6CC0]();
  [a1 _makeStreamJSONForStream:@"ui" publisher:v18 maxNumEvents:2000 callback:v30];
  v26 = (void *)MEMORY[0x1D25F6CC0]();
  [a1 _makeStreamJSONForStream:@"spotlightUI" publisher:v19 maxNumEvents:1000 callback:v30];
  v27 = (void *)MEMORY[0x1D25F6CC0]();
  [a1 _makeStreamJSONForStream:@"appLaunch" publisher:v20 maxNumEvents:500 callback:v30];
  v28 = (void *)MEMORY[0x1D25F6CC0]();
  [a1 _makeStreamJSONForStream:@"appIntent" publisher:v21 maxNumEvents:500 callback:v30];
  v29 = (void *)MEMORY[0x1D25F6CC0]();
  [a1 _makeStreamJSONForStream:@"inferredMode" publisher:v22 maxNumEvents:500 callback:v30];
}

+ (void)_makeStreamJSONForStream:(id)a3 publisher:(id)a4 maxNumEvents:(unint64_t)a5 callback:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, id, void *))a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v12 setDateStyle:1];
  [v12 setTimeStyle:1];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__15;
  v24 = __Block_byref_object_dispose__15;
  id v25 = (id)objc_opt_new();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__ATXBiomeStreamInspector__makeStreamJSONForStream_publisher_maxNumEvents_callback___block_invoke_2;
  v16[3] = &unk_1E68AD560;
  id v13 = v12;
  id v17 = v13;
  id v18 = &v20;
  unint64_t v19 = a5;
  id v14 = (id)[v10 sinkWithCompletion:&__block_literal_global_32 receiveInput:v16];
  v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v21[5] options:1 error:0];
  v11[2](v11, v9, v15);

  _Block_object_dispose(&v20, 8);
}

void __84__ATXBiomeStreamInspector__makeStreamJSONForStream_publisher_maxNumEvents_callback___block_invoke_2(void *a1, void *a2)
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  context = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v22 = [v3 eventBody];
  v25[0] = @"timestamp";
  id v4 = (void *)a1[4];
  double v5 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 timestamp];
  double v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  double v7 = [v4 stringFromDate:v6];
  v26[0] = v7;
  v25[1] = @"timestampRaw";
  double v8 = NSNumber;
  [v3 timestamp];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  v26[1] = v9;
  v25[2] = @"data_size";
  id v10 = NSNumber;
  v11 = [v3 frame];
  id v12 = [v11 data];
  id v13 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
  v26[2] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v15 = (void *)[v14 mutableCopy];

  if (objc_opt_respondsToSelector())
  {
    id v16 = (void *)MEMORY[0x1E4F28D90];
    id v17 = [v22 json];
    id v24 = 0;
    id v18 = [v16 JSONObjectWithData:v17 options:2 error:&v24];
    id v19 = v24;

    if (v19)
    {
      id v20 = [v19 localizedDescription];
      printf("JSON deserialization error occurs: %s", (const char *)[v20 UTF8String]);
    }
  }
  else
  {
    id v21 = NSString;
    objc_msgSend((id)objc_msgSend(v3, "dataType"), "description");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = [v21 stringWithFormat:@"Event class %@ does not support JSON output", v19];
  }
  [v15 setObject:v18 forKeyedSubscript:@"event"];

  if ([*(id *)(*(void *)(a1[5] + 8) + 40) count] == a1[6]) {
    [*(id *)(*(void *)(a1[5] + 8) + 40) removeObjectAtIndex:0];
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v15];
}

@end