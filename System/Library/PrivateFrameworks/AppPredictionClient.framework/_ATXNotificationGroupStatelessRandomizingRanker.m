@interface _ATXNotificationGroupStatelessRandomizingRanker
+ (id)rankerId;
- (double)_standardUniformDistribution;
- (id)randomlySwapGroups:(id)a3;
- (id)rankNotificationGroups:(id)a3 modeId:(id)a4;
- (unint64_t)_generateNumSwaps:(id)a3;
@end

@implementation _ATXNotificationGroupStatelessRandomizingRanker

- (unint64_t)_generateNumSwaps:(id)a3
{
  id v4 = a3;
  [(_ATXNotificationGroupStatelessRandomizingRanker *)self _standardUniformDistribution];
  double v6 = v5;
  if ((unint64_t)[v4 count] < 0xA || v6 >= 0.02)
  {
    unint64_t v8 = [v4 count];
    unint64_t v7 = v6 < 0.08 && v8 > 5;
  }
  else
  {
    unint64_t v7 = 2;
  }

  return v7;
}

- (double)_standardUniformDistribution
{
  return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0;
}

- (id)randomlySwapGroups:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_ATXNotificationGroupStatelessRandomizingRanker *)self _generateNumSwaps:v4];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = objc_opt_new();
    unint64_t v8 = objc_opt_new();
    if ((unint64_t)[v4 count] >= 4)
    {
      unint64_t v9 = 0;
      double v10 = 1.0;
      double v11 = 1.0;
      do
      {
        v12 = [NSNumber numberWithDouble:v10];
        [v7 addObject:v12];

        v13 = [NSNumber numberWithDouble:v11];
        [v8 addObject:v13];

        double v10 = v10 * 0.9;
        double v11 = v11 * 0.9;
        ++v9;
      }
      while (v9 < (unint64_t)[v4 count] >> 2);
    }
    v14 = [MEMORY[0x1E4F4B658] sampleWeightedArray:v7 numToSample:v6];
    v15 = [MEMORY[0x1E4F4B658] sampleWeightedArray:v8 numToSample:v6];
    id v16 = (id)[v4 mutableCopy];
    unint64_t v17 = [v14 count];
    unint64_t v18 = [v15 count];
    if (v17 >= v18) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = v17;
    }
    if (v19)
    {
      unint64_t v20 = 0;
      do
      {
        v21 = [v14 objectAtIndexedSubscript:v20];
        uint64_t v22 = [v21 unsignedIntegerValue];

        v23 = [v15 objectAtIndexedSubscript:v20];
        uint64_t v24 = [v23 unsignedIntegerValue];
        unint64_t v25 = v24 + ((unint64_t)[v4 count] >> 1);

        v26 = [v4 objectAtIndexedSubscript:v22];
        [v16 setObject:v26 atIndexedSubscript:v25];

        v27 = [v4 objectAtIndexedSubscript:v25];
        [v16 setObject:v27 atIndexedSubscript:v22];

        ++v20;
        unint64_t v28 = [v14 count];
        unint64_t v29 = [v15 count];
        if (v28 >= v29) {
          unint64_t v30 = v29;
        }
        else {
          unint64_t v30 = v28;
        }
      }
      while (v30 > v20);
    }
  }
  else
  {
    id v16 = v4;
  }

  return v16;
}

- (id)rankNotificationGroups:(id)a3 modeId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = objc_opt_new();
  unint64_t v9 = [v8 rankNotificationGroups:v7 modeId:v6];

  double v10 = [(_ATXNotificationGroupStatelessRandomizingRanker *)self randomlySwapGroups:v9];

  return v10;
}

+ (id)rankerId
{
  return @"_ATXNotificationGroupStatelessRandomizingRanker";
}

@end