@interface DPSubmissionRateLimiter
@end

@implementation DPSubmissionRateLimiter

void __42___DPSubmissionRateLimiter_sharedInstance__block_invoke(uint64_t a1)
{
  id v4 = +[_DPSubmissionRateLimiter rateLimitsFromBudgetProperties];
  uint64_t v2 = [objc_alloc(*(Class *)(a1 + 32)) initWithLimits:v4];
  v3 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v2;
}

void __41___DPSubmissionRateLimiter_debit_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() budgetNameForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v22 = v2;
    v3 = [*(id *)(a1 + 32) limitDictionary];
    id v4 = [v3 objectForKeyedSubscript:v22];

    v5 = [v4 objectForKeyedSubscript:@"interval"];
    unint64_t v6 = [v5 unsignedIntegerValue];

    if (v6)
    {
      v7 = [v4 objectForKeyedSubscript:@"chunks_amount"];
      unint64_t v8 = [v7 unsignedIntegerValue];

      if (v8 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v8;
      }
      v10 = [v4 objectForKeyedSubscript:@"refill_amount"];
      uint64_t v11 = [v10 unsignedIntegerValue];

      v12 = [v4 objectForKeyedSubscript:@"limit"];
      uint64_t v13 = [v12 unsignedIntegerValue];

      v14 = [v4 objectForKeyedSubscript:@"checkpoint"];
      v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSinceDate:v14];
      unint64_t v17 = (unint64_t)v16 / v6;

      unint64_t v18 = v13 + v11 * v9 * v17;
      v19 = [v14 dateByAddingTimeInterval:(double)(v17 * v6)];

      unint64_t v20 = *(void *)(a1 + 56);
      if (v20 >= v18) {
        unint64_t v20 = v18;
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v20;
      [v4 setObject:v19 forKeyedSubscript:@"checkpoint"];
      v21 = [NSNumber numberWithUnsignedInteger:v18 - *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      [v4 setObject:v21 forKeyedSubscript:@"limit"];
    }
    uint64_t v2 = v22;
  }
}

void __42___DPSubmissionRateLimiter_credit_amount___block_invoke(uint64_t a1)
{
  id v7 = [(id)objc_opt_class() budgetNameForKey:*(void *)(a1 + 40)];
  if (v7)
  {
    uint64_t v2 = [*(id *)(a1 + 32) limitDictionary];
    v3 = [v2 objectForKeyedSubscript:v7];

    id v4 = NSNumber;
    v5 = [v3 objectForKeyedSubscript:@"limit"];
    unint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", *(void *)(a1 + 48) + objc_msgSend(v5, "unsignedIntegerValue"));
    [v3 setObject:v6 forKeyedSubscript:@"limit"];
  }
}

@end