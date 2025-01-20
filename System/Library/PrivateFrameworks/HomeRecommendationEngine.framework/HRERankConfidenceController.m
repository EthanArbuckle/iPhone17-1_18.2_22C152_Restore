@interface HRERankConfidenceController
+ (double)_limitRankToValidRange:(double)a3;
+ (int64_t)version;
- (id)rankRecommendations:(id)a3;
- (id)rankRecommendationsFromSet:(id)a3;
- (void)calculateRankForRecommendations:(id)a3 fromTemplate:(id)a4;
@end

@implementation HRERankConfidenceController

+ (int64_t)version
{
  return 1;
}

- (id)rankRecommendationsFromSet:(id)a3
{
  v4 = [a3 allObjects];
  v5 = [(HRERankConfidenceController *)self rankRecommendations:v4];

  v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_6];

  return v6;
}

uint64_t __58__HRERankConfidenceController_rankRecommendationsFromSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 rankingConfidenceScore];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 rankingConfidenceScore];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)rankRecommendations:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_3_6);
  v6 = [v5 allValues];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HRERankConfidenceController_rankRecommendations___block_invoke_4;
  v8[3] = &unk_264CF4278;
  v8[4] = self;
  objc_msgSend(v6, "na_each:", v8);

  return v4;
}

id __51__HRERankConfidenceController_rankRecommendations___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 sourceTemplate];
  v3 = [v2 identifier];
  id v4 = v3;
  if (!v3)
  {
    if (_MergedGlobals_24 != -1) {
      dispatch_once(&_MergedGlobals_24, &__block_literal_global_9);
    }
    id v4 = (void *)qword_268944C18;
  }
  id v5 = v4;

  return v5;
}

void __51__HRERankConfidenceController_rankRecommendations___block_invoke_3()
{
  v0 = (void *)qword_268944C18;
  qword_268944C18 = @"none";
}

void __51__HRERankConfidenceController_rankRecommendations___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 firstObject];
  id v5 = [v4 sourceTemplate];

  [*(id *)(a1 + 32) calculateRankForRecommendations:v3 fromTemplate:v5];
}

- (void)calculateRankForRecommendations:(id)a3 fromTemplate:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    [v6 starterRank];
    double v9 = v8;
  }
  else
  {
    double v9 = -1.0;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
  obuint64_t j = v10;
  if (v11)
  {
    uint64_t v12 = v11;
    v35 = v7;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "involvedObjects", v35);
        v17 = [v15 changedInvolvedObjects];
        v18 = objc_msgSend(v16, "na_setByRemovingObjectsFromSet:", v17);
        double v19 = (double)(unint64_t)[v18 count];
        double v20 = v19 / (double)(unint64_t)[v16 count];
        unint64_t v21 = [v10 count];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __76__HRERankConfidenceController_calculateRankForRecommendations_fromTemplate___block_invoke_2;
        v41[3] = &unk_264CF42C0;
        id v42 = v17;
        v43 = v15;
        id v44 = &__block_literal_global_14_0;
        double v45 = v20;
        double v46 = v9;
        id v22 = v17;
        double v23 = __76__HRERankConfidenceController_calculateRankForRecommendations_fromTemplate___block_invoke_2((uint64_t)v41);
        [(id)objc_opt_class() _limitRankToValidRange:v23];
        objc_msgSend(v15, "setRankingConfidenceScore:rankVersion:", objc_msgSend((id)objc_opt_class(), "version"), v24);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v12);
    double v25 = (v20 / (double)v21 + -0.3) * 0.5;
    v7 = v35;
  }
  else
  {
    double v25 = -0.15;
  }

  if (v7)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v26 = v10;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          v32 = objc_opt_class();
          [v31 rankingConfidenceScore];
          [v32 _limitRankToValidRange:v25 + v33];
          objc_msgSend(v31, "setRankingConfidenceScore:rankVersion:", objc_msgSend((id)objc_opt_class(), "version"), v34);
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v28);
    }

    id v10 = obj;
  }
}

double __76__HRERankConfidenceController_calculateRankForRecommendations_fromTemplate___block_invoke(double a1)
{
  return a1 + -0.3;
}

double __76__HRERankConfidenceController_calculateRankForRecommendations_fromTemplate___block_invoke_2(uint64_t a1)
{
  double v2 = -5.0;
  if ([*(id *)(a1 + 32) count]
    && [*(id *)(a1 + 40) containsMeaningfulChanges])
  {
    double v3 = (*(double (**)(double))(*(void *)(a1 + 48) + 16))(*(double *)(a1 + 56));
    double v4 = (double)(unint64_t)[*(id *)(a1 + 40) numberOfEnabledRecommendationsForTemplate] * 0.2;
    double v5 = *(double *)(a1 + 64);
    [*(id *)(a1 + 40) rankModifier];
    return v4 + v3 + v5 + v6;
  }
  return v2;
}

+ (double)_limitRankToValidRange:(double)a3
{
  return fmax(fmin(a3, 5.0), -5.0);
}

@end