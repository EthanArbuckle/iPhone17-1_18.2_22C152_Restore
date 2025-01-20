@interface LCFProactiveMetricsComputation
+ (id)mrr:(id)a3;
@end

@implementation LCFProactiveMetricsComputation

+ (id)mrr:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
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
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) doubleValue];
        double v7 = v7 + 1.0 / v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }
  v10 = objc_msgSend(NSNumber, "numberWithDouble:", v7 / (double)(unint64_t)objc_msgSend(v3, "count"));

  return v10;
}

@end