@interface GEOAPUtils
+ (id)GEOAPApplicationIdentifier;
+ (id)GEOAPCachePath;
+ (id)currentDailyAggregationTimestamp;
+ (id)daemonIdAdditions;
+ (id)daemonSet;
+ (id)dailyAggregationTimestampFromDate:(id)a3;
+ (id)firstPartySet;
+ (int)functionalAppGroup;
+ (int)myAppType;
+ (void)appTypeForAppId:(id)a3 resultBlock:(id)a4;
@end

@implementation GEOAPUtils

void __23__GEOAPUtils_myAppType__block_invoke()
{
  v0 = objc_opt_class();
  GEOApplicationIdentifierOrProcessName();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v0 appTypeForAppId:v1 resultBlock:&__block_literal_global_66];
}

+ (void)appTypeForAppId:(id)a3 resultBlock:(id)a4
{
  id v17 = a3;
  v5 = (void (**)(id, void, uint64_t))a4;
  if ([v17 isEqualToString:*MEMORY[0x263F416F0]])
  {
    v5[2](v5, 0, 1);
    goto LABEL_13;
  }
  v6 = [v17 componentsSeparatedByString:@"."];
  if ((unint64_t)[v6 count] >= 3)
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    if ([v7 isEqualToString:@"com"])
    {
      v8 = [v6 objectAtIndexedSubscript:1];
      int v9 = [v8 isEqualToString:@"apple"];

      if (v9)
      {
        v10 = [v6 lastObject];
        v11 = [v10 lowercaseString];

        v12 = [(id)objc_opt_class() firstPartySet];
        char v13 = [v12 containsObject:v11];

        if (v13)
        {
          uint64_t v14 = 0;
        }
        else
        {
          v15 = [(id)objc_opt_class() daemonSet];
          int v16 = [v15 containsObject:v11];

          if (v16) {
            uint64_t v14 = 3;
          }
          else {
            uint64_t v14 = 1;
          }
        }

        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  if ([v6 count] == 1) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 2;
  }
LABEL_12:
  v5[2](v5, v14, 0);

LABEL_13:
}

void __23__GEOAPUtils_myAppType__block_invoke_2(uint64_t a1, int a2)
{
  dword_26B201B6C = a2;
}

void __32__GEOAPUtils_functionalAppGroup__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v1 = [*(id *)(a1 + 32) GEOAPApplicationIdentifier];
  v2 = [v1 lowercaseString];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v3 = GEOConfigGetArray();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v32 + 1) + 8 * v7) lowercaseString];
        int v9 = [v8 isEqualToString:v2];

        if (v9)
        {
          unint64_t v22 = 0x26B201000;
          int v23 = 1;
LABEL_29:
          *(_DWORD *)(v22 + 2920) = v23;

          goto LABEL_30;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v3 = GEOConfigGetArray();
  uint64_t v10 = [v3 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v3);
        }
        uint64_t v14 = [*(id *)(*((void *)&v28 + 1) + 8 * v13) lowercaseString];
        int v15 = [v14 isEqualToString:v2];

        if (v15)
        {
          unint64_t v22 = 0x26B201000;
          int v23 = 2;
          goto LABEL_29;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v3 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = GEOConfigGetArray();
  uint64_t v16 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    while (2)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v3);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v19), "lowercaseString", (void)v24);
        int v21 = [v20 isEqualToString:v2];

        if (v21)
        {
          unint64_t v22 = 0x26B201000uLL;
          int v23 = 3;
          goto LABEL_29;
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  _MergedGlobals_11 = 0;
LABEL_30:
}

+ (id)GEOAPApplicationIdentifier
{
  if (GEOAPOverrideApplicationId)
  {
    id v2 = (id)GEOAPOverrideApplicationId;
  }
  else
  {
    GEOApplicationIdentifierOrProcessName();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (int)myAppType
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__GEOAPUtils_myAppType__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26B201B98 != -1) {
    dispatch_once(&qword_26B201B98, block);
  }
  return dword_26B201B6C;
}

+ (id)currentDailyAggregationTimestamp
{
  v3 = [MEMORY[0x263F41BB8] sharedManager];
  uint64_t v4 = [v3 bestReferenceDate];

  uint64_t v5 = [a1 dailyAggregationTimestampFromDate:v4];

  return v5;
}

+ (id)dailyAggregationTimestampFromDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  uint64_t v7 = [v6 components:60 fromDate:v4];

  objc_msgSend(v7, "setHour:", objc_msgSend(v7, "hour") - 4);
  v8 = [v6 dateFromComponents:v7];
  int v9 = [v6 components:28 fromDate:v8];
  uint64_t v10 = [v6 dateFromComponents:v9];
  id v11 = objc_alloc_init(MEMORY[0x263F088C0]);
  uint64_t v12 = [MEMORY[0x263EFFA18] localTimeZone];
  [v11 setTimeZone:v12];

  [v11 setFormatOptions:883];
  uint64_t v13 = [v11 stringFromDate:v10];

  return v13;
}

+ (int)functionalAppGroup
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__GEOAPUtils_functionalAppGroup__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26B201B70 != -1) {
    dispatch_once(&qword_26B201B70, block);
  }
  return _MergedGlobals_11;
}

+ (id)firstPartySet
{
  if (qword_26B201B80 != -1) {
    dispatch_once(&qword_26B201B80, &__block_literal_global_10);
  }
  id v2 = (void *)qword_26B201B78;
  return v2;
}

uint64_t __27__GEOAPUtils_firstPartySet__block_invoke()
{
  qword_26B201B78 = [MEMORY[0x263EFFA08] setWithArray:&unk_270162B60];
  return MEMORY[0x270F9A758]();
}

+ (id)daemonIdAdditions
{
  return (id)GEOConfigGetArray();
}

+ (id)daemonSet
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__GEOAPUtils_daemonSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26B201B90 != -1) {
    dispatch_once(&qword_26B201B90, block);
  }
  id v2 = (void *)qword_26B201B88;
  return v2;
}

void __23__GEOAPUtils_daemonSet__block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v0 addObjectsFromArray:&unk_270162B78];
  id v1 = [(id)objc_opt_class() daemonIdAdditions];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length])
        {
          uint64_t v7 = [v6 lowercaseString];
          [v0 addObject:v7];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  uint64_t v8 = [v0 copy];
  int v9 = (void *)qword_26B201B88;
  qword_26B201B88 = v8;
}

+ (id)GEOAPCachePath
{
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = [v3 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];

  uint64_t v5 = [a1 GEOAPApplicationIdentifier];
  uint64_t v6 = [v4 URLByAppendingPathComponent:v5];

  uint64_t v7 = [v6 path];

  return v7;
}

@end