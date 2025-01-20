@interface _CDInteractionsStatistics
- (BOOL)hasEverSharePlayed:(id)a3;
- (BOOL)isUsingDefaultValue:(id)a3 forConversationId:(id)a4;
- (NSDictionary)queryStats;
- (_CDInteractionsStatistics)initWithDefaultValues:(id)a3;
- (_CDInteractionsStatistics)initWithProperties:(id)a3 features:(id)a4 defaultValues:(id)a5;
- (id)bundleIdForConversationId:(id)a3;
- (id)conversationIds;
- (id)description;
- (id)descriptionRedacted:(BOOL)a3;
- (id)features;
- (id)nonNilFeaturesForConversationId:(id)a3;
- (id)privatizedConversationId:(id)a3;
- (id)properties;
- (id)redactedDescription;
- (id)valueForFeature:(id)a3 forConversationId:(id)a4;
- (id)valueForProperty:(id)a3 forConversationId:(id)a4;
- (id)valueOrDefaultValueForFeature:(id)a3 forConversationId:(id)a4;
- (void)_addConversationId:(id)a3;
- (void)computeFeatureForMethod:(id)a3 arguments:(id)a4;
- (void)computeFeaturesForRecipe:(id)a3;
- (void)computePASSFeatureWithPeopleDetectedInPhoto:(id)a3;
- (void)copyFeature:(id)a3 toFeatureName:(id)a4;
- (void)divide:(id)a3 withDivisor:(id)a4 resultFeatureName:(id)a5;
- (void)exponential:(id)a3 withMultiplier:(double)a4 resultFeatureName:(id)a5;
- (void)imputeFeature:(id)a3 withConstant:(id)a4;
- (void)includeFeature:(id)a3 from:(id)a4;
- (void)incrementValueForFeature:(id)a3 andConversationId:(id)a4;
- (void)initFeature:(id)a3 withValue:(id)a4;
- (void)laplaceProbability:(id)a3 withAlpha:(double)a4 resultFeatureName:(id)a5;
- (void)laplaceProbabilityCorrected:(id)a3 withAlpha:(double)a4 resultFeatureName:(id)a5;
- (void)log:(id)a3 withBase:(double)a4 resultFeatureName:(id)a5;
- (void)multiply:(id)a3 with:(id)a4 resultFeatureName:(id)a5;
- (void)multiply:(id)a3 withMultiplier:(double)a4 resultFeatureName:(id)a5;
- (void)power:(id)a3 withExponent:(double)a4 resultFeatureName:(id)a5;
- (void)reciprocal:(id)a3 withOffset:(double)a4 resultFeatureName:(id)a5;
- (void)recordSharePlayInformation:(id)a3;
- (void)removeConversationIds:(id)a3;
- (void)renameFeature:(id)a3 withFeatureName:(id)a4;
- (void)savePersonId:(id)a3 forConversationId:(id)a4 forSyntheticInteraction:(BOOL)a5;
- (void)setQueryStats:(id)a3;
- (void)setValue:(id)a3 forFeature:(id)a4 andConversationId:(id)a5;
- (void)setValue:(id)a3 forProperty:(id)a4 andConversationId:(id)a5;
- (void)sum:(id)a3 with:(id)a4 resultFeatureName:(id)a5;
@end

@implementation _CDInteractionsStatistics

- (void)laplaceProbability:(id)a3 withAlpha:(double)a4 resultFeatureName:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v28 = a5;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v9 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        [v15 doubleValue];
        double v13 = v13 + v16;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v17 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    double v21 = v13 + a4;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        v24 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v23];
        v25 = v24;
        if (v24)
        {
          [v24 doubleValue];
          v27 = [NSNumber numberWithDouble:(v26 + a4) / v21];
          [(_CDInteractionsStatistics *)self setValue:v27 forFeature:v28 andConversationId:v23];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v19);
  }
}

- (void)reciprocal:(id)a3 withOffset:(double)a4 resultFeatureName:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        double v16 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v15];
        v17 = v16;
        if (v16)
        {
          [v16 doubleValue];
          if (v18 + a4 != 0.0)
          {
            [v17 doubleValue];
            uint64_t v20 = [NSNumber numberWithDouble:1.0 / (v19 + a4)];
            [(_CDInteractionsStatistics *)self setValue:v20 forFeature:v9 andConversationId:v15];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)exponential:(id)a3 withMultiplier:(double)a4 resultFeatureName:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        double v16 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v15];
        v17 = v16;
        if (v16)
        {
          [v16 doubleValue];
          double v19 = [NSNumber numberWithDouble:(double)exp(v18 * a4)];
          [(_CDInteractionsStatistics *)self setValue:v19 forFeature:v9 andConversationId:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)divide:(id)a3 withDivisor:(id)a4 resultFeatureName:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v24 = a5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v15 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v14];
        double v16 = [(_CDInteractionsStatistics *)self valueForFeature:v9 forConversationId:v14];
        v17 = v16;
        if (v15) {
          BOOL v18 = v16 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          [v16 doubleValue];
          if (v19 != 0.0)
          {
            [v15 doubleValue];
            double v21 = v20;
            [v17 doubleValue];
            long long v23 = [NSNumber numberWithDouble:v21 / v22];
            [(_CDInteractionsStatistics *)self setValue:v23 forFeature:v24 andConversationId:v14];
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }
}

- (void)laplaceProbabilityCorrected:(id)a3 withAlpha:(double)a4 resultFeatureName:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v30 = a5;
  id v9 = [(_CDInteractionsStatistics *)self conversationIds];
  unint64_t v10 = [v9 count];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v11 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        [v17 doubleValue];
        double v15 = v15 + v18;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v19 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v32;
    double v23 = v15 + a4 * (double)v10;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        long long v26 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v25];
        long long v27 = v26;
        if (v26)
        {
          [v26 doubleValue];
          long long v29 = [NSNumber numberWithDouble:(v28 + a4) / v23];
          [(_CDInteractionsStatistics *)self setValue:v29 forFeature:v30 andConversationId:v25];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v21);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryStats, 0);
  objc_storeStrong((id *)&self->_hasSharePlayedWith, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_personsCountsForSyntheticInteractions, 0);
  objc_storeStrong((id *)&self->_personsCountsForRealInteractions, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)power:(id)a3 withExponent:(double)a4 resultFeatureName:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v10 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        double v16 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v15];
        v17 = v16;
        if (v16)
        {
          [v16 doubleValue];
          double v19 = objc_msgSend(NSNumber, "numberWithDouble:", (double)pow(v18, a4));
          [(_CDInteractionsStatistics *)self setValue:v19 forFeature:v9 andConversationId:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)renameFeature:(id)a3 withFeatureName:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_features;
  uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 objectForKeyedSubscript:v6];
        uint64_t v15 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:v12];
        [v15 setObject:v14 forKeyedSubscript:v7];

        double v16 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:v12];
        [v16 setObject:0 forKeyedSubscript:v6];
      }
      uint64_t v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)log:(id)a3 withBase:(double)a4 resultFeatureName:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    double v14 = log(a4);
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v17 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v16];
        long long v18 = v17;
        if (v17)
        {
          [v17 doubleValue];
          long long v20 = [NSNumber numberWithDouble:(double)(log(v19) / v14)];
          [(_CDInteractionsStatistics *)self setValue:v20 forFeature:v9 andConversationId:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

- (_CDInteractionsStatistics)initWithProperties:(id)a3 features:(id)a4 defaultValues:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_CDInteractionsStatistics;
  uint64_t v12 = [(_CDInteractionsStatistics *)&v21 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_properties, a3);
    objc_storeStrong((id *)&v13->_features, a4);
    objc_storeStrong((id *)&v13->_defaultValues, a5);
    uint64_t v14 = objc_opt_new();
    hasSharePlayedWith = v13->_hasSharePlayedWith;
    v13->_hasSharePlayedWith = (NSMutableSet *)v14;

    uint64_t v16 = objc_opt_new();
    personsCountsForRealInteractions = v13->_personsCountsForRealInteractions;
    v13->_personsCountsForRealInteractions = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    personsCountsForSyntheticInteractions = v13->_personsCountsForSyntheticInteractions;
    v13->_personsCountsForSyntheticInteractions = (NSMutableDictionary *)v18;
  }
  return v13;
}

- (_CDInteractionsStatistics)initWithDefaultValues:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = [(_CDInteractionsStatistics *)self initWithProperties:v5 features:v6 defaultValues:v4];

  return v7;
}

- (void)_addConversationId:(id)a3
{
  id v14 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:");

  if (!v4)
  {
    v5 = objc_opt_new();
    [(NSMutableDictionary *)self->_properties setObject:v5 forKeyedSubscript:v14];

    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%du", arc4random());
    id v7 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v14];
    [v7 setObject:v6 forKeyedSubscript:@"privatizedConversationIdentifier"];
  }
  id v8 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:v14];

  if (!v8)
  {
    id v9 = objc_opt_new();
    [(NSMutableDictionary *)self->_features setObject:v9 forKeyedSubscript:v14];
  }
  id v10 = [(NSMutableDictionary *)self->_personsCountsForRealInteractions objectForKeyedSubscript:v14];

  if (!v10)
  {
    id v11 = objc_opt_new();
    [(NSMutableDictionary *)self->_personsCountsForRealInteractions setObject:v11 forKeyedSubscript:v14];
  }
  uint64_t v12 = [(NSMutableDictionary *)self->_personsCountsForSyntheticInteractions objectForKeyedSubscript:v14];

  if (!v12)
  {
    uint64_t v13 = objc_opt_new();
    [(NSMutableDictionary *)self->_personsCountsForSyntheticInteractions setObject:v13 forKeyedSubscript:v14];
  }
}

- (void)initFeature:(id)a3 withValue:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = [(_CDInteractionsStatistics *)self conversationIds];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [(_CDInteractionsStatistics *)self setValue:v7 forFeature:v6 andConversationId:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)setValue:(id)a3 forFeature:(id)a4 andConversationId:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    [(_CDInteractionsStatistics *)self _addConversationId:v8];
    id v11 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:v8];

    [v11 setObject:v10 forKeyedSubscript:v9];
  }
}

- (void)setValue:(id)a3 forProperty:(id)a4 andConversationId:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    [(_CDInteractionsStatistics *)self _addConversationId:v8];
    id v11 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v8];

    [v11 setObject:v10 forKeyedSubscript:v9];
  }
}

- (id)valueForFeature:(id)a3 forConversationId:(id)a4
{
  features = self->_features;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)features objectForKeyedSubscript:a4];
  id v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (id)valueOrDefaultValueForFeature:(id)a3 forConversationId:(id)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:a4];
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(NSDictionary *)self->_defaultValues objectForKeyedSubscript:v6];
  }
  id v11 = v10;

  return v11;
}

- (BOOL)isUsingDefaultValue:(id)a3 forConversationId:(id)a4
{
  features = self->_features;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)features objectForKeyedSubscript:a4];
  id v8 = [v7 objectForKeyedSubscript:v6];

  return v8 == 0;
}

- (id)valueForProperty:(id)a3 forConversationId:(id)a4
{
  properties = self->_properties;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)properties objectForKeyedSubscript:a4];
  id v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (void)incrementValueForFeature:(id)a3 andConversationId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_CDInteractionsStatistics *)self _addConversationId:v6];
  id v8 = NSNumber;
  id v13 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:v6];
  id v9 = [v13 objectForKeyedSubscript:v7];
  [v9 doubleValue];
  id v11 = [v8 numberWithDouble:v10 + 1.0];
  uint64_t v12 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:v6];

  [v12 setObject:v11 forKeyedSubscript:v7];
}

- (void)recordSharePlayInformation:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_hasSharePlayedWith, "addObject:");
  }
}

- (BOOL)hasEverSharePlayed:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_hasSharePlayedWith, "containsObject:");
  }
  else {
    return 0;
  }
}

- (void)includeFeature:(id)a3 from:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v14 = [v7 valueForFeature:v6 forConversationId:v13];
        if (v14) {
          [(_CDInteractionsStatistics *)self setValue:v14 forFeature:v6 andConversationId:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)conversationIds
{
  return (id)[(NSMutableDictionary *)self->_features allKeys];
}

- (void)removeConversationIds:(id)a3
{
  features = self->_features;
  id v5 = a3;
  [(NSMutableDictionary *)features removeObjectsForKeys:v5];
  [(NSMutableDictionary *)self->_properties removeObjectsForKeys:v5];
}

- (id)features
{
  v2 = (void *)[(NSMutableDictionary *)self->_features copy];
  return v2;
}

- (id)properties
{
  v2 = (void *)[(NSMutableDictionary *)self->_properties copy];
  return v2;
}

- (id)nonNilFeaturesForConversationId:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_defaultValues;
  uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[_CDInteractionsStatistics valueOrDefaultValueForFeature:forConversationId:](self, "valueOrDefaultValueForFeature:forConversationId:", v11, v4, (void)v15);
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)[v5 copy];
  return v13;
}

- (id)privatizedConversationId:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:a3];
  id v4 = [v3 objectForKeyedSubscript:@"privatizedConversationIdentifier"];

  return v4;
}

- (id)description
{
  return [(_CDInteractionsStatistics *)self descriptionRedacted:0];
}

- (id)redactedDescription
{
  return [(_CDInteractionsStatistics *)self descriptionRedacted:1];
}

- (id)descriptionRedacted:(BOOL)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v5, "appendString:", @"_CDInteractionsStatistics(\n");
  features = self->_features;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49___CDInteractionsStatistics_descriptionRedacted___block_invoke;
  v10[3] = &unk_1E5610728;
  id v7 = v5;
  BOOL v13 = a3;
  id v11 = v7;
  uint64_t v12 = self;
  [(NSMutableDictionary *)features enumerateKeysAndObjectsUsingBlock:v10];
  [v7 appendString:@""]);
  id v8 = v7;

  return v8;
}

- (id)bundleIdForConversationId:(id)a3
{
  return [(_CDInteractionsStatistics *)self valueForProperty:@"ConversationBundleId" forConversationId:a3];
}

- (void)savePersonId:(id)a3 forConversationId:(id)a4 forSyntheticInteraction:(BOOL)a5
{
  BOOL v5 = a5;
  id v19 = a3;
  id v8 = a4;
  uint64_t v9 = 24;
  if (v5) {
    uint64_t v9 = 32;
  }
  id v10 = *(id *)((char *)&self->super.isa + v9);
  id v11 = [v10 objectForKeyedSubscript:v8];

  if (!v11)
  {
    uint64_t v12 = objc_opt_new();
    [v10 setObject:v12 forKeyedSubscript:v8];
  }
  if (v19)
  {
    BOOL v13 = NSNumber;
    long long v14 = [v10 objectForKeyedSubscript:v8];
    long long v15 = [v14 objectForKeyedSubscript:v19];
    [v15 doubleValue];
    long long v17 = [v13 numberWithDouble:v16 + 1.0];
    long long v18 = [v10 objectForKeyedSubscript:v8];
    [v18 setObject:v17 forKeyedSubscript:v19];
  }
}

- (void)computePASSFeatureWithPeopleDetectedInPhoto:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CDInteractionsStatistics *)self conversationIds];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke;
  v7[3] = &unk_1E5610778;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (void)computeFeaturesForRecipe:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 objectAtIndexedSubscript:0];
        id v11 = objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
        [(_CDInteractionsStatistics *)self computeFeatureForMethod:v10 arguments:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)computeFeatureForMethod:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 count] <= 1)
  {
    id v8 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_CDInteractionsStatistics computeFeatureForMethod:arguments:](v8);
    }
    goto LABEL_10;
  }
  id v8 = [v7 objectAtIndexedSubscript:0];
  if ([v6 isEqualToString:@"sum:with:"])
  {
    uint64_t v9 = [v7 objectAtIndexedSubscript:1];
    id v10 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self sum:v8 with:v9 resultFeatureName:v10];
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"multiply:with:"])
  {
    uint64_t v9 = [v7 objectAtIndexedSubscript:1];
    id v10 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self multiply:v8 with:v9 resultFeatureName:v10];
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"multiply:withMultiplier:"])
  {
    id v11 = [v7 objectAtIndexedSubscript:1];
    [v11 doubleValue];
    double v13 = v12;

    uint64_t v9 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self multiply:v8 withMultiplier:v9 resultFeatureName:v13];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"divide:withDivisor:"])
  {
    uint64_t v9 = [v7 objectAtIndexedSubscript:1];
    id v10 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self divide:v8 withDivisor:v9 resultFeatureName:v10];
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"exponential:withMultiplier:"])
  {
    long long v14 = [v7 objectAtIndexedSubscript:1];
    [v14 doubleValue];
    double v16 = v15;

    uint64_t v9 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self exponential:v8 withMultiplier:v9 resultFeatureName:v16];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"reciprocal:withOffset:"])
  {
    uint64_t v17 = [v7 objectAtIndexedSubscript:1];
    [v17 doubleValue];
    double v19 = v18;

    uint64_t v9 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self reciprocal:v8 withOffset:v9 resultFeatureName:v19];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"power:withExponent:"])
  {
    uint64_t v20 = [v7 objectAtIndexedSubscript:1];
    [v20 doubleValue];
    double v22 = v21;

    uint64_t v9 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self power:v8 withExponent:v9 resultFeatureName:v22];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"laplaceProbability:withAlpha:"])
  {
    long long v23 = [v7 objectAtIndexedSubscript:1];
    [v23 doubleValue];
    double v25 = v24;

    uint64_t v9 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self laplaceProbability:v8 withAlpha:v9 resultFeatureName:v25];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"laplaceProbabilityCorrected:withAlpha:"])
  {
    uint64_t v26 = [v7 objectAtIndexedSubscript:1];
    [v26 doubleValue];
    double v28 = v27;

    uint64_t v9 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self laplaceProbabilityCorrected:v8 withAlpha:v9 resultFeatureName:v28];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"log:withBase:"])
  {
    long long v29 = [v7 objectAtIndexedSubscript:1];
    [v29 doubleValue];
    double v31 = v30;

    uint64_t v9 = [v7 objectAtIndexedSubscript:2];
    [(_CDInteractionsStatistics *)self log:v8 withBase:v9 resultFeatureName:v31];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"rename:with:"])
  {
    uint64_t v9 = [v7 objectAtIndexedSubscript:1];
    [(_CDInteractionsStatistics *)self renameFeature:v8 withFeatureName:v9];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"copy:to:"])
  {
    uint64_t v9 = [v7 objectAtIndexedSubscript:1];
    [(_CDInteractionsStatistics *)self copyFeature:v8 toFeatureName:v9];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"impute:withConstant:"])
  {
    uint64_t v9 = [v7 objectAtIndexedSubscript:1];
    [(_CDInteractionsStatistics *)self imputeFeature:v8 withConstant:v9];
    goto LABEL_9;
  }
  long long v32 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    -[_CDInteractionsStatistics computeFeatureForMethod:arguments:](v32);
  }

LABEL_10:
}

- (void)sum:(id)a3 with:(id)a4 resultFeatureName:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v23 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        double v15 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v14];
        uint64_t v16 = [(_CDInteractionsStatistics *)self valueForFeature:v9 forConversationId:v14];
        uint64_t v17 = (void *)v16;
        if (v15) {
          BOOL v18 = v16 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          [v15 doubleValue];
          double v20 = v19;
          [v17 doubleValue];
          double v22 = [NSNumber numberWithDouble:v20 + v21];
          [(_CDInteractionsStatistics *)self setValue:v22 forFeature:v23 andConversationId:v14];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
}

- (void)multiply:(id)a3 with:(id)a4 resultFeatureName:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v23 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        double v15 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v14];
        uint64_t v16 = [(_CDInteractionsStatistics *)self valueForFeature:v9 forConversationId:v14];
        uint64_t v17 = (void *)v16;
        if (v15) {
          BOOL v18 = v16 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          [v15 doubleValue];
          double v20 = v19;
          [v17 doubleValue];
          double v22 = [NSNumber numberWithDouble:v20 * v21];
          [(_CDInteractionsStatistics *)self setValue:v22 forFeature:v23 andConversationId:v14];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
}

- (void)multiply:(id)a3 withMultiplier:(double)a4 resultFeatureName:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(_CDInteractionsStatistics *)self conversationIds];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v16 = [(_CDInteractionsStatistics *)self valueForFeature:v8 forConversationId:v15];
        uint64_t v17 = v16;
        if (v16)
        {
          BOOL v18 = NSNumber;
          [v16 doubleValue];
          double v20 = [v18 numberWithDouble:v19 * a4];
          [(_CDInteractionsStatistics *)self setValue:v20 forFeature:v9 andConversationId:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)copyFeature:(id)a3 toFeatureName:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = self->_features;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v13, (void)v17);
        uint64_t v15 = [v14 objectForKeyedSubscript:v6];
        uint64_t v16 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:v13];
        [v16 setObject:v15 forKeyedSubscript:v7];
      }
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)imputeFeature:(id)a3 withConstant:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = self->_features;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v13, (void)v17);
        uint64_t v15 = [v14 objectForKeyedSubscript:v6];

        if (!v15)
        {
          uint64_t v16 = [(NSMutableDictionary *)self->_features objectForKeyedSubscript:v13];
          [v16 setObject:v7 forKeyedSubscript:v6];
        }
      }
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (NSDictionary)queryStats
{
  return self->_queryStats;
}

- (void)setQueryStats:(id)a3
{
}

- (void)computeFeatureForMethod:(os_log_t)log arguments:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "_CDInteractionsStatistics: insufficient arguments passed to computeFeatureForMethod", v1, 2u);
}

- (void)computeFeatureForMethod:(os_log_t)log arguments:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "_CDInteractionsStatistics: unknown methodName passed to computeFeatureForMethod", v1, 2u);
}

@end