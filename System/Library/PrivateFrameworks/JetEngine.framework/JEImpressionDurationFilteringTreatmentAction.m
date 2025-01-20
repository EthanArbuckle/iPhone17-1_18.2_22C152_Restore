@interface JEImpressionDurationFilteringTreatmentAction
- (JEImpressionDurationFilteringTreatmentAction)initWithField:(id)a3 configuration:(id)a4;
- (NSPredicate)filters;
- (id)filteredDurationArray:(id)a3;
- (id)filteredViewedInfoDetailed:(id)a3;
- (id)performAction:(id)a3 context:(id)a4;
- (id)updatedImpression:(id)a3;
- (int64_t)durationThreshold;
@end

@implementation JEImpressionDurationFilteringTreatmentAction

- (JEImpressionDurationFilteringTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)JEImpressionDurationFilteringTreatmentAction;
  v7 = [(JETreatmentAction *)&v15 initWithField:a3 configuration:v6];
  if (!v7)
  {
LABEL_12:
    v9 = v7;
    goto LABEL_13;
  }
  v8 = [v6 objectForKeyedSubscript:@"threshold"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }

  if (v9)
  {
    v7->_durationThreshold = [(JEImpressionDurationFilteringTreatmentAction *)v9 longValue];
    v10 = [v6 objectForKeyedSubscript:@"filters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:v11];
      filters = v7->_filters;
      v7->_filters = (NSPredicate *)v12;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v9;
}

- (id)performAction:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)JEImpressionDurationFilteringTreatmentAction;
  v5 = [(JETreatmentAction *)&v21 performAction:a3 context:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    v7 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          filters = self->_filters;
          if (filters
            && !-[NSPredicate evaluateWithObject:](filters, "evaluateWithObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17))
          {
            [v7 addObject:v13];
          }
          else
          {
            objc_super v15 = -[JEImpressionDurationFilteringTreatmentAction updatedImpression:](self, "updatedImpression:", v13, (void)v17);
            if (v15) {
              [v7 addObject:v15];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)updatedImpression:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
  id v6 = [v4 objectForKeyedSubscript:@"viewedInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(JEImpressionDurationFilteringTreatmentAction *)self filteredDurationArray:v6];
    [v5 setObject:v7 forKeyedSubscript:@"viewedInfo"];
  }
  id v8 = [v4 objectForKeyedSubscript:@"viewedInfoDetailed"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(JEImpressionDurationFilteringTreatmentAction *)self filteredViewedInfoDetailed:v8];
    [v5 setObject:v9 forKeyedSubscript:@"viewedInfoDetailed"];
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"viewedInfo"];
  if ([v10 count])
  {

LABEL_8:
    id v14 = v5;
    goto LABEL_9;
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:@"viewedInfoDetailed"];
  uint64_t v12 = [v11 allKeys];
  uint64_t v13 = [v12 count];

  if (v13) {
    goto LABEL_8;
  }
  id v14 = 0;
LABEL_9:

  return v14;
}

- (id)filteredViewedInfoDetailed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [v3 allKeys];
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
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [(JEImpressionDurationFilteringTreatmentAction *)self filteredDurationArray:v11];
          if ([v12 count]) {
            [v4 setObject:v12 forKeyedSubscript:v10];
          }
          else {
            [v4 removeObjectForKey:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)filteredDurationArray:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  int64_t durationThreshold = self->_durationThreshold;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v3, "predicateWithFormat:", @"d >= %ld", durationThreshold);
  uint64_t v7 = [v5 filteredArrayUsingPredicate:v6];

  return v7;
}

- (int64_t)durationThreshold
{
  return self->_durationThreshold;
}

- (NSPredicate)filters
{
  return self->_filters;
}

- (void).cxx_destruct
{
}

@end