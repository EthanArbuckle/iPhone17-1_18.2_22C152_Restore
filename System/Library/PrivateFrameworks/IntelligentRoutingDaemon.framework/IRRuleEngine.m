@interface IRRuleEngine
+ (id)executeRules:(id)a3 withCandiatesContainer:(id)a4 systemStatus:(id)a5 historyEventsContainer:(id)a6 miloPrediction:(id)a7 nearbyDeviceContainer:(id)a8 date:(id)a9;
+ (id)new;
- (IRRuleEngine)init;
@end

@implementation IRRuleEngine

- (IRRuleEngine)init
{
}

+ (id)new
{
}

+ (id)executeRules:(id)a3 withCandiatesContainer:(id)a4 systemStatus:(id)a5 historyEventsContainer:(id)a6 miloPrediction:(id)a7 nearbyDeviceContainer:(id)a8 date:(id)a9
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v28 = (id)objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v18 = v14;
  id obj = [v14 allKeys];
  uint64_t v19 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v24 = [v18 objectForKey:v23];
        v25 = [v24 executeRuleWithCandiatesContainer:v31 systemStatus:v30 historyContainer:v29 miloPrediction:v15 nearbyDeviceContainer:v16 date:v17];
        [v28 setObject:v25 forKey:v23];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v20);
  }

  return v28;
}

@end