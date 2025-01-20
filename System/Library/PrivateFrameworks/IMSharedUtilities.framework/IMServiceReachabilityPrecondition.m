@interface IMServiceReachabilityPrecondition
+ (id)_preconditionClasses;
+ (id)preconditionWithDictionary:(id)a3;
- (id)_latestResultsForServiceName:(id)a3 fromLatestResults:(id)a4;
- (unint64_t)evaluateWithLatestResults:(id)a3 requestedServices:(id)a4;
@end

@implementation IMServiceReachabilityPrecondition

+ (id)_preconditionClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)preconditionWithDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = +[IMServiceReachabilityPrecondition _preconditionClasses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) preconditionWithDictionary:v3];
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)evaluateWithLatestResults:(id)a3 requestedServices:(id)a4
{
  return 1;
}

- (id)_latestResultsForServiceName:(id)a3 fromLatestResults:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = objc_msgSend(v6, "allValues", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = [v13 service];
        int v15 = [v14 isEqualToString:v5];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  v16 = (void *)[v7 copy];

  return v16;
}

@end