@interface CacheDeleteAppInFocus
+ (void)subscribeToAppInFocusStreamBeginning:(id)a3 callback:(id)a4;
@end

@implementation CacheDeleteAppInFocus

void __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v21 = a2;
  v3 = [v21 eventBody];
  v4 = [v3 bundleID];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [v21 eventBody];
    v7 = [v6 bundleID];
    LOBYTE(v5) = [v5 containsObject:v7];

    if ((v5 & 1) == 0)
    {
      if (*(void *)(a1 + 40))
      {
        v8 = [v21 eventBody];
        char v9 = [v8 starting];

        if ((v9 & 1) == 0)
        {
          v10 = *(void **)(a1 + 32);
          v11 = [v21 eventBody];
          v12 = [v11 bundleID];
          [v10 addObject:v12];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
      else
      {
        v13 = (void *)MEMORY[0x1E4F1C9C8];
        [v21 timestamp];
        v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = [v21 eventBody];
        if ([v15 starting]) {
          v16 = "Entering";
        }
        else {
          v16 = " Leaving";
        }
        v17 = [v21 eventBody];
        v18 = [v17 bundleID];
        v19 = [v21 eventBody];
        v20 = [v19 launchReason];
        NSLog(&cfstr_DSubscribetoap.isa, 153, v14, v16, v18, v20);
      }
    }
  }
}

void __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  id v4 = [v2 error];

  NSLog(&cfstr_Subscribetoapp.isa, v3, v4);
}

+ (void)subscribeToAppInFocusStreamBeginning:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (BiomeLibraryLibraryCore())
  {
    if (qword_1EB30C4E0 != -1) {
      dispatch_once(&qword_1EB30C4E0, &__block_literal_global_10);
    }
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    v7 = (void (*)(void))off_1EB30C500;
    v27 = off_1EB30C500;
    if (!off_1EB30C500)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __getBiomeLibrarySymbolLoc_block_invoke;
      v23[3] = &unk_1E5C51D18;
      v23[4] = &v24;
      __getBiomeLibrarySymbolLoc_block_invoke((uint64_t)v23);
      v7 = (void (*)(void))v25[3];
    }
    _Block_object_dispose(&v24, 8);
    if (!v7)
    {
      dlerror();
      v19 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v24, 8);
      _Unwind_Resume(v19);
    }
    v8 = v7();
    char v9 = [v8 App];
    v10 = [v9 InFocus];

    v11 = (void *)MEMORY[0x1AD0BA160]();
    v12 = objc_opt_new();
    id v13 = objc_alloc((Class)_MergedGlobals_8);
    v14 = [MEMORY[0x1E4F1C9C8] date];
    v15 = (void *)[v13 initWithStartDate:v14 endDate:v5 maxEvents:0 lastN:0 reversed:1];

    v16 = [v10 publisherWithOptions:v15];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke_3;
    v20[3] = &unk_1E5C51CD8;
    id v21 = v12;
    id v22 = v6;
    id v17 = v12;
    id v18 = (id)[v16 sinkWithCompletion:&__block_literal_global_36_0 receiveInput:v20];
  }
}

void __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke()
{
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2050000000;
  v0 = (void *)qword_1EB30C4F8;
  uint64_t v5 = qword_1EB30C4F8;
  if (!qword_1EB30C4F8)
  {
    BiomeLibraryLibraryCore();
    v3[3] = (uint64_t)objc_getClass("BMPublisherOptions");
    qword_1EB30C4F8 = v3[3];
    v0 = (void *)v3[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v2, 8);
  _MergedGlobals_8 = (uint64_t)v1;
}

@end