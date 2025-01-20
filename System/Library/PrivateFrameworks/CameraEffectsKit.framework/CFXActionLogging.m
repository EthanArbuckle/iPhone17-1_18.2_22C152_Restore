@interface CFXActionLogging
+ (NSNumber)remainingMemory;
+ (id)CFX_actionLogDictionaryWithEvent:(id)a3 atLocation:(id)a4 withEffectStack:(id)a5;
+ (id)actionLogAsJSONForEvent:(id)a3 atLocation:(id)a4 withEffectStack:(id)a5;
+ (id)actionLogAsStringForEvent:(id)a3 atLocation:(id)a4 withEffectStack:(id)a5;
@end

@implementation CFXActionLogging

+ (NSNumber)remainingMemory
{
  v2 = NSNumber;
  uint64_t v3 = MEMORY[0x237DD1770](a1, a2);
  return (NSNumber *)[v2 numberWithUnsignedInteger:v3];
}

+ (id)actionLogAsStringForEvent:(id)a3 atLocation:(id)a4 withEffectStack:(id)a5
{
  v5 = NSString;
  v6 = objc_msgSend(a1, "CFX_actionLogDictionaryWithEvent:atLocation:withEffectStack:", a3, a4, a5);
  v7 = [v5 stringWithFormat:@"%@", v6];

  return v7;
}

+ (id)actionLogAsJSONForEvent:(id)a3 atLocation:(id)a4 withEffectStack:(id)a5
{
  v5 = (void *)MEMORY[0x263F08900];
  v6 = objc_msgSend(a1, "CFX_actionLogDictionaryWithEvent:atLocation:withEffectStack:", a3, a4, a5);
  uint64_t v10 = 0;
  v7 = [v5 dataWithJSONObject:v6 options:1 error:&v10];

  if (v7) {
    v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  }
  else {
    v8 = 0;
  }

  return v8;
}

+ (id)CFX_actionLogDictionaryWithEvent:(id)a3 atLocation:(id)a4 withEffectStack:(id)a5
{
  id v24 = a1;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v25 = a4;
  id v7 = a5;
  v8 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v14 = NSStringFromJFXEffectType(objc_msgSend(v13, "type", v24));
        v15 = [v13 displayName];
        v16 = [v13 effectID];
        if ([v13 type] == 2)
        {
          id v17 = v13;
          v18 = [v17 trackingProps];
          v19 = NSStringFromJFXTrackingType([v18 trackingType]);

          v36[0] = @"effectType";
          v36[1] = @"name";
          v37[0] = v14;
          v37[1] = v15;
          v36[2] = @"ID";
          v36[3] = @"track-type";
          v37[2] = v16;
          v37[3] = v19;
          v20 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
          [v8 addObject:v20];
        }
        else
        {
          v34[0] = @"effectType";
          v34[1] = @"name";
          v35[0] = v14;
          v35[1] = v15;
          v34[2] = @"ID";
          v35[2] = v16;
          id v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
          [v8 addObject:v17];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v10);
  }

  v33[0] = v26;
  v32[0] = @"event";
  v32[1] = @"memoryRemaining";
  v21 = [v24 remainingMemory];
  v33[1] = v21;
  v33[2] = v25;
  v32[2] = @"view";
  v32[3] = @"effectsApplied";
  v33[3] = v8;
  v22 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];

  return v22;
}

@end