@interface BMCoreRoutineProvider
- (id)locationEvents;
@end

@implementation BMCoreRoutineProvider

- (id)locationEvents
{
  v2 = [MEMORY[0x263F37F08] defaultManager];
  v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-2419200.0];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = [MEMORY[0x263EFF980] array];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__BMCoreRoutineProvider_locationEvents__block_invoke;
  v8[3] = &unk_2645468D8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  [v2 fetchLocationsOfInterestVisitedSinceDate:v3 withHandler:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __39__BMCoreRoutineProvider_locationEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v33 = v5;
    uint64_t v39 = a1;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v5;
    uint64_t v36 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v50;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v50 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v7;
          v8 = *(void **)(*((void *)&v49 + 1) + 8 * v7);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          v41 = v8;
          id v38 = [v8 visits];
          uint64_t v42 = [v38 countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v42)
          {
            uint64_t v40 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v46 != v40) {
                  objc_enumerationMutation(v38);
                }
                v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                uint64_t v11 = (void *)MEMORY[0x223C621B0]();
                v12 = [v41 identifier];
                uint64_t v13 = [v12 UUIDString];

                if (v13)
                {
                  v44 = v11;
                  v14 = +[BMItemType locationIdentifier];
                  v43 = +[BMItem itemWithType:v14 stringValue:v13];

                  v15 = [BMEvent alloc];
                  id v16 = [v10 entryDate];
                  v17 = [v10 exitDate];
                  v18 = [(BMEvent *)v15 initWithStartDate:v16 endDate:v17 item:v43];

                  [*(id *)(*(void *)(*(void *)(v39 + 40) + 8) + 40) addObject:v18];
                  v19 = [BMItem alloc];
                  v20 = +[BMItemType enterLocation];
                  v21 = [(BMItem *)v19 initWithType:v20 value:v13];

                  v22 = [BMEvent alloc];
                  v23 = [v10 entryDate];
                  v24 = [v10 entryDate];
                  v25 = [(BMEvent *)v22 initWithStartDate:v23 endDate:v24 item:v21];

                  [*(id *)(*(void *)(*(void *)(v39 + 40) + 8) + 40) addObject:v25];
                  v26 = [BMItem alloc];
                  v27 = +[BMItemType exitLocation];
                  v28 = [(BMItem *)v26 initWithType:v27 value:v13];

                  v29 = [BMEvent alloc];
                  v30 = [v10 exitDate];
                  v31 = [v10 exitDate];
                  v32 = [(BMEvent *)v29 initWithStartDate:v30 endDate:v31 item:v28];

                  uint64_t v11 = v44;
                  [*(id *)(*(void *)(*(void *)(v39 + 40) + 8) + 40) addObject:v32];
                }
              }
              uint64_t v42 = [v38 countByEnumeratingWithState:&v45 objects:v53 count:16];
            }
            while (v42);
          }

          uint64_t v7 = v37 + 1;
        }
        while (v37 + 1 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v36);
    }

    id v6 = 0;
    id v5 = v33;
    a1 = v39;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end