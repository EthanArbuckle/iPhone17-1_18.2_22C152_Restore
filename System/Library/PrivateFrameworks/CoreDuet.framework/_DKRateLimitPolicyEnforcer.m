@interface _DKRateLimitPolicyEnforcer
+ (id)rateLimitPolicyEnforcer;
- (id)filterObjectsByEnforcingRateLimit:(id)a3;
- (void)creditForDeletion:(id)a3;
@end

@implementation _DKRateLimitPolicyEnforcer

+ (id)rateLimitPolicyEnforcer
{
  if (rateLimitPolicyEnforcer_onceToken != -1) {
    dispatch_once(&rateLimitPolicyEnforcer_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)rateLimitPolicyEnforcer_enforcer;
  return v2;
}

- (id)filterObjectsByEnforcingRateLimit:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_8;
        }
        v11 = objc_msgSend(v10, "stream", (void)v15);
        v12 = [v11 name];

        v13 = +[_CDEventStreams rateLimiterForEventStreamName:v12];

        if (!v13)
        {
LABEL_8:
          v13 = +[_CDRateLimiter sharedRateLimiter];
        }
        if ([v13 debited]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)creditForDeletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [v8 stream];
          v10 = [v9 name];

          v11 = +[_CDEventStreams rateLimiterForEventStreamName:v10];
          if (!v11)
          {
            v11 = +[_CDRateLimiter sharedRateLimiter];
          }
          [v11 credit];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

@end