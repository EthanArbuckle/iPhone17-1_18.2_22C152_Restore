@interface _DPSubmissionRateLimiter
+ (id)budgetNameForKey:(id)a3;
+ (id)rateLimitsFromBudgetProperties;
+ (id)sharedInstance;
- (NSMutableDictionary)limitDictionary;
- (OS_dispatch_queue)limiterQueue;
- (_DPSubmissionRateLimiter)init;
- (_DPSubmissionRateLimiter)initWithLimits:(id)a3;
- (unint64_t)debit:(unint64_t)a3 forKey:(id)a4;
- (void)credit:(id)a3 amount:(unint64_t)a4;
- (void)setLimitDictionary:(id)a3;
@end

@implementation _DPSubmissionRateLimiter

- (_DPSubmissionRateLimiter)init
{
  return 0;
}

- (_DPSubmissionRateLimiter)initWithLimits:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DPSubmissionRateLimiter;
  v6 = [(_DPSubmissionRateLimiter *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_limitDictionary, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.DifferentialPrivacy.ratelimiter", v8);
    limiterQueue = v7->_limiterQueue;
    v7->_limiterQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___DPSubmissionRateLimiter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

+ (id)rateLimitsFromBudgetProperties
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  +[_DPPrivacyBudgetProperties allBudgetPropertiesKeys];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v8 = +[_DPPrivacyBudgetProperties budgetPropertiesForKey:v7];
        dispatch_queue_t v9 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        [v2 setObject:v9 forKeyedSubscript:v7];
        v10 = [v8 refillInterval];
        [v9 setObject:v10 forKeyedSubscript:@"interval"];

        v11 = [v8 refillAmount];
        [v9 setObject:v11 forKeyedSubscript:@"refill_amount"];

        objc_super v12 = [v8 intervalChunksValue];
        [v9 setObject:v12 forKeyedSubscript:@"chunks_amount"];

        v13 = NSNumber;
        v14 = [v8 refillAmount];
        uint64_t v15 = [v14 unsignedIntegerValue];
        v16 = [v8 intervalChunksValue];
        v17 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") * v15);
        [v9 setObject:v17 forKeyedSubscript:@"limit"];

        v18 = [MEMORY[0x1E4F1C9C8] date];
        [v9 setObject:v18 forKeyedSubscript:@"checkpoint"];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  return v2;
}

- (unint64_t)debit:(unint64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  limiterQueue = self->_limiterQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41___DPSubmissionRateLimiter_debit_forKey___block_invoke;
  v11[3] = &unk_1E6C44190;
  v11[4] = self;
  id v12 = v6;
  v13 = &v15;
  unint64_t v14 = a3;
  id v8 = v6;
  dispatch_sync(limiterQueue, v11);
  unint64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)credit:(id)a3 amount:(unint64_t)a4
{
  id v6 = a3;
  limiterQueue = self->_limiterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___DPSubmissionRateLimiter_credit_amount___block_invoke;
  block[3] = &unk_1E6C441B8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(limiterQueue, block);
}

+ (id)budgetNameForKey:(id)a3
{
  uint64_t v3 = +[_DPKeyNames keyPropertiesForKey:a3];
  uint64_t v4 = [v3 budget];
  uint64_t v5 = [v4 name];

  return v5;
}

- (OS_dispatch_queue)limiterQueue
{
  return self->_limiterQueue;
}

- (NSMutableDictionary)limitDictionary
{
  return self->_limitDictionary;
}

- (void)setLimitDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitDictionary, 0);
  objc_storeStrong((id *)&self->_limiterQueue, 0);
}

@end