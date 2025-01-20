@interface CLSPartOfDayInformant
+ (id)classIdentifier;
+ (id)familyIdentifier;
+ (id)informantDependenciesIdentifiers;
- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4;
@end

@implementation CLSPartOfDayInformant

+ (id)informantDependenciesIdentifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)classIdentifier
{
  return @"partofday";
}

+ (id)familyIdentifier
{
  v2 = @"com.apple.mediaminingkit.informant.core";
  return @"com.apple.mediaminingkit.informant.core";
}

- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [v4 clueCollection];
  v7 = [v6 localDates];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v22 = v6;
    v9 = [v4 feeder];
    v10 = +[CLSPartOfDayCalculation partsOfDayForFeeder:v9];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v17 = [v11 objectForKeyedSubscript:v16];
          [v17 doubleValue];
          double v19 = v18;

          v20 = +[CLSOutputClue clueWithValue:v16 forKey:@"Time of Day" confidence:v19 relevance:0.0];
          [v5 addObject:v20];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    v6 = v22;
  }

  return v5;
}

@end