@interface ATXMagicalMomentsPredictionTable
+ (BOOL)supportsSecureCoding;
- (ATXMagicalMomentsPredictionTable)init;
- (ATXMagicalMomentsPredictionTable)initWithCoder:(id)a3;
- (ATXMagicalMomentsPredictionTable)initWithPredictionTableEntries:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)deduplicatePredictions:(id)a3;
- (id)describeTable;
- (id)predictionTableEntries;
- (id)predictionsForTriggerEvent:(id)a3;
- (id)removeRestrictedPredictions:(id)a3;
- (id)validPredictionsFromTableEntries:(id)a3 event:(id)a4;
- (unint64_t)hash;
- (void)addPrediction:(id)a3 withApplicablePredicates:(id)a4;
- (void)addPredictions:(id)a3 withApplicablePredicates:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)predictionTableEntries;
@end

@implementation ATXMagicalMomentsPredictionTable

- (ATXMagicalMomentsPredictionTable)init
{
  return [(ATXMagicalMomentsPredictionTable *)self initWithPredictionTableEntries:0];
}

- (ATXMagicalMomentsPredictionTable)initWithPredictionTableEntries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXMagicalMomentsPredictionTable;
  v5 = [(ATXMagicalMomentsPredictionTable *)&v9 init];
  if (v5)
  {
    if (v4) {
      uint64_t v6 = [v4 mutableCopy];
    }
    else {
      uint64_t v6 = objc_opt_new();
    }
    predictionTableEntries = v5->_predictionTableEntries;
    v5->_predictionTableEntries = (NSMutableArray *)v6;
  }
  return v5;
}

- (id)describeTable
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_predictionTableEntries count];
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_predictionTableEntries;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = (void *)[[NSString alloc] initWithFormat:@"[%lu of %lu] %@", v7 + i, v3, *(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      v7 += i;
    }
    while (v6);
  }

  v11 = (void *)[v4 copy];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXMagicalMomentsPredictionTable *)a3;
  if (self == v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  predictionTableEntries = v4->_predictionTableEntries;
  if (predictionTableEntries == self->_predictionTableEntries) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSMutableArray isEqualToArray:](predictionTableEntries, "isEqualToArray:");
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_predictionTableEntries hash];
}

- (void)addPredictions:(id)a3 withApplicablePredicates:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [(ATXMagicalMomentsPredictionTable *)self addPrediction:*(void *)(*((void *)&v12 + 1) + 8 * v11++) withApplicablePredicates:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)addPrediction:(id)a3 withApplicablePredicates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7 && [v7 count])
    {
      uint64_t v9 = [[ATXMagicalMomentsPredictionTableEntry alloc] initWithPrediction:v6 applicablePredicates:v8];
      if (v9)
      {
        [(NSMutableArray *)self->_predictionTableEntries addObject:v9];
      }
      else
      {
        uint64_t v10 = __atxlog_handle_default();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[ATXMagicalMomentsPredictionTable addPrediction:withApplicablePredicates:]();
        }
      }
    }
    else
    {
      __atxlog_handle_default();
      uint64_t v9 = (ATXMagicalMomentsPredictionTableEntry *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
        -[ATXMagicalMomentsPredictionTable addPrediction:withApplicablePredicates:]();
      }
    }
  }
}

- (id)predictionTableEntries
{
  predictionTableEntries = self->_predictionTableEntries;
  if (predictionTableEntries)
  {
    uint64_t v3 = (void *)[(NSMutableArray *)predictionTableEntries copy];
  }
  else
  {
    id v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ATXMagicalMomentsPredictionTable predictionTableEntries]();
    }

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)validPredictionsFromTableEntries:(id)a3 event:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        long long v14 = (void *)MEMORY[0x1D25F6CC0](v9);
        long long v15 = objc_msgSend(v13, "compoundPredicate", (void)v19);
        [v15 allowEvaluation];
        if ([v15 evaluateWithObject:v6])
        {
          long long v16 = [v13 prediction];

          if (v16)
          {
            uint64_t v17 = [v13 prediction];
            [v7 addObject:v17];
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }

  return v7;
}

- (id)deduplicatePredictions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1D25F6CC0]();
        long long v13 = [v11 predictionIdentifier];
        char v14 = [v5 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          [v4 addObject:v11];
          long long v15 = [v11 predictionIdentifier];
          [v5 addObject:v15];

          long long v16 = __atxlog_handle_default();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v11;
            _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_INFO, "ATXMM: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)removeRestrictedPredictions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v12 = [v10 predictionIdentifier];
        if ([MEMORY[0x1E4F4AF00] isInstalledAndNotRestrictedForBundle:v12])
        {
          if ([MEMORY[0x1E4F4AF00] isDeviceManagementPolicyOkForBundleId:v12])
          {
            [v4 addObject:v10];
            goto LABEL_15;
          }
          long long v13 = __atxlog_handle_default();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v22 = v12;
            char v14 = v13;
            long long v15 = "ATXMM: Skipping screen time restricted app %@.";
            goto LABEL_13;
          }
        }
        else
        {
          long long v13 = __atxlog_handle_default();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v22 = v12;
            char v14 = v13;
            long long v15 = "ATXMM: Skipping restricted app %@.";
LABEL_13:
            _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
          }
        }

LABEL_15:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)predictionsForTriggerEvent:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v6 = [(ATXMagicalMomentsPredictionTable *)self validPredictionsFromTableEntries:self->_predictionTableEntries event:v4];
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
  v14[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v9 = [v6 sortedArrayUsingDescriptors:v8];

  uint64_t v10 = [(ATXMagicalMomentsPredictionTable *)self deduplicatePredictions:v9];
  uint64_t v11 = [(ATXMagicalMomentsPredictionTable *)self removeRestrictedPredictions:v10];
  uint64_t v12 = (void *)[v11 copy];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F29008];
  id v5 = a3;
  uint64_t v6 = [v4 sortDescriptorWithKey:@"prediction.confidence" ascending:0];
  predictionTableEntries = self->_predictionTableEntries;
  v9[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(NSMutableArray *)predictionTableEntries sortUsingDescriptors:v8];

  [v5 encodeObject:self->_predictionTableEntries forKey:@"predictionTableEntries"];
}

- (ATXMagicalMomentsPredictionTable)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"predictionTableEntries"];
  uint64_t v10 = [(ATXMagicalMomentsPredictionTable *)self initWithPredictionTableEntries:v9];

  return v10;
}

- (void).cxx_destruct
{
}

- (void)addPrediction:withApplicablePredicates:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXMM: Attempted to add an entry to the prediction table without specifying any applicable predicates.", v2, v3, v4, v5, v6);
}

- (void)addPrediction:withApplicablePredicates:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXMM: Failed to insert prediction item into prediction table because we couldn't initialize a new prediction table entry object.", v2, v3, v4, v5, v6);
}

- (void)predictionTableEntries
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXMM: Attempted to access predictions from prediction table, but the prediction table was empty.", v2, v3, v4, v5, v6);
}

@end