@interface ATXHeroPredictionsTracker
+ (id)hashedPredictionsForPredictions:(id)a3;
- (BOOL)didPredictionsChange:(id)a3;
- (void)setPredictionsInDefaults:(id)a3;
@end

@implementation ATXHeroPredictionsTracker

- (BOOL)didPredictionsChange:(id)a3
{
  id v3 = a3;
  v4 = +[ATXHeroAndClipConstants sharedInstance];
  id v5 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v7 = [v4 heroAppPredictionsKey];
  v8 = [v6 objectForKey:v7];

  v9 = [(id)objc_opt_class() hashedPredictionsForPredictions:v3];
  uint64_t v10 = [v8 count];
  if (v10 == [v9 count])
  {
    if ([v9 count])
    {
      unint64_t v11 = 0;
      do
      {
        v12 = [v9 objectAtIndexedSubscript:v11];
        char v13 = [v8 containsObject:v12];

        if ((v13 & 1) == 0) {
          break;
        }
        ++v11;
      }
      while ([v9 count] > v11);
      char v14 = v13 ^ 1;
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (void)setPredictionsInDefaults:(id)a3
{
  id v3 = a3;
  id v8 = +[ATXHeroAndClipConstants sharedInstance];
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v6 = [(id)objc_opt_class() hashedPredictionsForPredictions:v3];

  v7 = [v8 heroAppPredictionsKey];
  [v5 setObject:v6 forKey:v7];
}

+ (id)hashedPredictionsForPredictions:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_40);
}

uint64_t __61__ATXHeroPredictionsTracker_hashedPredictionsForPredictions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(a2, "hash"));
}

@end