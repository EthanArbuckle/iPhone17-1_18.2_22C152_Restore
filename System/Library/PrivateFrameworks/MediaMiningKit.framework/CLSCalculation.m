@interface CLSCalculation
+ (double)cumulativeNormalDistributionForX:(double)a3 mu:(double)a4 sigma:(double)a5;
+ (void)calculateStandardDeviationForItems:(id)a3 valueBlock:(id)a4 result:(id)a5;
@end

@implementation CLSCalculation

+ (double)cumulativeNormalDistributionForX:(double)a3 mu:(double)a4 sigma:(double)a5
{
  return fmin(erfc((a4 - a3) / a5 * 0.707106781) * 0.5, 1.0);
}

+ (void)calculateStandardDeviationForItems:(id)a3 valueBlock:(id)a4 result:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (double (**)(id, void))a4;
  v9 = (void (**)(void, double, double))a5;
  uint64_t v10 = [v7 count];
  if (v10)
  {
    unint64_t v11 = v10;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v22 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      double v16 = 0.0;
      double v17 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1D2602300]();
          double v21 = v8[2](v8, v19);
          double v17 = v17 + v21;
          double v16 = v16 + v21 * v21;
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }
    else
    {
      double v16 = 0.0;
      double v17 = 0.0;
    }

    v9[2](v9, sqrt(((double)v11 * v16 - v17 * v17) / (double)(v11 * v11)), v17 / (double)v11);
    id v7 = v22;
  }
  else
  {
    v9[2](v9, 0.0, 0.0);
  }
}

@end