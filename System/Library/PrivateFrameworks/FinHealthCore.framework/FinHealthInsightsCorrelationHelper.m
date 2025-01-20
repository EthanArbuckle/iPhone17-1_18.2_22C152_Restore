@interface FinHealthInsightsCorrelationHelper
+ (id)kendallCoefficientWithIndexedAmountSums:(id)a3;
+ (id)spearmanCoefficientWithIndexedAmountSums:(id)a3;
@end

@implementation FinHealthInsightsCorrelationHelper

+ (id)kendallCoefficientWithIndexedAmountSums:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3 || (unint64_t)[v3 count] < 2) {
    goto LABEL_14;
  }
  if ([v4 count] == 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    do
    {
      for (unint64_t i = v7; i < [v4 count]; ++i)
      {
        v9 = [v4 objectAtIndex:v7];
        v10 = [v4 objectAtIndex:i];
        int v11 = [v9 lessThan:v10];

        if (v11)
        {
          ++v5;
        }
        else
        {
          v12 = [v4 objectAtIndex:v7];
          v13 = [v4 objectAtIndex:i];
          unsigned int v14 = [v12 greaterThan:v13];

          v6 += v14;
        }
      }
      ++v7;
    }
    while (v7 < [v4 count] - 1);
  }
  if (v6 + v5) {
    v15 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:(double)(v5 - v6) / (double)(v6 + v5)];
  }
  else {
LABEL_14:
  }
    v15 = 0;

  return v15;
}

+ (id)spearmanCoefficientWithIndexedAmountSums:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && (unint64_t)[v3 count] >= 2)
  {
    unint64_t v5 = [v4 count];
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t v7 = 0x263F08000uLL;
    unint64_t v41 = v5;
    if (v5 < 2)
    {
      double v20 = (double)v5;
      unint64_t v9 = 1;
      uint64_t v21 = 1;
    }
    else
    {
      uint64_t v8 = 0;
      unint64_t v9 = 1;
      unint64_t v10 = v5;
      for (uint64_t i = 1; i != v5; ++i)
      {
        v12 = objc_msgSend(v4, "objectAtIndex:", i, v41);
        v13 = [v4 objectAtIndex:i - 1];
        uint64_t v14 = [v12 compare:v13];

        if (v14)
        {
          if (v9)
          {
            unint64_t v43 = v5 - i;
            double v15 = (double)v10 / (double)v9;
            uint64_t v16 = v8;
            for (unint64_t j = 1; j <= v9; ++j)
            {
              v18 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v15];
              v19 = [v4 objectAtIndex:v16];
              [v6 setObject:v18 forKey:v19];

              --v16;
            }
            unint64_t v9 = 1;
            unint64_t v5 = v41;
            unint64_t v10 = v43;
          }
          else
          {
            unint64_t v9 = 1;
            unint64_t v10 = v5 - i;
          }
        }
        else
        {
          v10 += v5 - i;
          ++v9;
        }
        ++v8;
      }
      unint64_t v7 = 0x263F08000;
      if (!v9) {
        goto LABEL_19;
      }
      double v20 = (double)v10 / (double)v9;
      uint64_t v21 = v5;
    }
    uint64_t v23 = v21 - 1;
    for (unint64_t k = 1; k <= v9; ++k)
    {
      v25 = (void *)[objc_alloc(*(Class *)(v7 + 1968)) initWithDouble:v20];
      v26 = [v4 objectAtIndex:v23];
      [v6 setObject:v25 forKey:v26];

      --v23;
    }
LABEL_19:
    uint64_t v27 = objc_msgSend(*(id *)(v7 + 1968), "zero", v41);
    v28 = (void *)v27;
    if (v5)
    {
      uint64_t v29 = 0;
      unint64_t v30 = v5;
      do
      {
        v31 = (void *)[objc_alloc(*(Class *)(v7 + 1968)) initWithInteger:v30];
        v32 = [v4 objectAtIndex:v29];
        v33 = [v6 objectForKey:v32];
        v34 = [v31 decimalNumberBySubtracting:v33];
        v35 = [v34 decimalNumberByRaisingToPower:2];

        v36 = [v28 decimalNumberByAdding:v35];

        unint64_t v7 = 0x263F08000;
        ++v29;
        v28 = v36;
        --v30;
      }
      while (v30);
    }
    else
    {
      v36 = (void *)v27;
    }
    v37 = (void *)[objc_alloc(*(Class *)(v7 + 1968)) initWithDouble:((double)v42 * (double)v42 + -1.0) * (double)v42 / 6.0];
    v38 = [*(id *)(v7 + 1968) one];
    v39 = [v36 decimalNumberByDividingBy:v37];
    v22 = [v38 decimalNumberBySubtracting:v39];

    goto LABEL_25;
  }
  v22 = 0;
LABEL_25:

  return v22;
}

@end