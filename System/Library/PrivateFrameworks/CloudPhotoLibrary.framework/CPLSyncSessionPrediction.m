@interface CPLSyncSessionPrediction
- (CPLSyncSessionPrediction)init;
- (CPLSyncSessionPrediction)initWithPredictedValuesAndTypes:(id)a3;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (id)predictedValueForType:(id)a3;
- (id)updatedPredictionWithValuesAndTypes:(id)a3;
@end

@implementation CPLSyncSessionPrediction

- (void).cxx_destruct
{
}

- (id)description
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(NSDictionary *)self->_predictions count])
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSDictionary count](self->_predictions, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    self;
    if (onceToken != -1) {
      dispatch_once(&onceToken, &__block_literal_global_103);
    }
    id obj = (id)_orderedPredictionTypes;
    uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v24;
      v7 = v3;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * v8);
          if (v9) {
            uint64_t v10 = *(void *)(v9 + 8);
          }
          else {
            uint64_t v10 = 0;
          }
          v11 = [(NSDictionary *)self->_predictions objectForKeyedSubscript:v10];
          if ([v11 longLongValue] >= 1)
          {
            if (v9) {
              v12 = *(void **)(v9 + 16);
            }
            else {
              v12 = 0;
            }
            id v13 = v12;
            id v14 = [NSString alloc];
            if (v9) {
              v15 = *(void **)(v9 + 8);
            }
            else {
              v15 = 0;
            }
            id v16 = v15;
            v17 = [v13 stringForObjectValue:v11];
            v18 = (void *)[v14 initWithFormat:@"%@: %@", v16, v17];

            v3 = v7;
            [v7 addObject:v18];
          }
          ++v8;
        }
        while (v5 != v8);
        uint64_t v19 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        uint64_t v5 = v19;
      }
      while (v19);
    }

    if ([v3 count])
    {
      v20 = [v3 componentsJoinedByString:@", "];
    }
    else
    {
      v20 = @"<no predictions>";
    }
  }
  else
  {
    v20 = @"<no predictions>";
  }
  return v20;
}

- (id)updatedPredictionWithValuesAndTypes:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__344;
  id v13 = __Block_byref_object_dispose__345;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CPLSyncSessionPrediction_updatedPredictionWithValuesAndTypes___block_invoke;
  v8[3] = &unk_1E60A8E88;
  v8[4] = self;
  v8[5] = &v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  if (v10[5])
  {
    uint64_t v5 = [CPLSyncSessionPrediction alloc];
    uint64_t v6 = [(CPLSyncSessionPrediction *)v5 initWithPredictedValuesAndTypes:v10[5]];
  }
  else
  {
    uint64_t v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __64__CPLSyncSessionPrediction_updatedPredictionWithValuesAndTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    id v7 = v5;
LABEL_15:
    [v6 setObject:v7 forKeyedSubscript:v17];
    goto LABEL_16;
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v17];
  id v9 = v5;
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9)
    {
      char v11 = [v8 isEqualToNumber:v9];
    }
    else
    {
      char v11 = [v8 isEqualToNumber:&unk_1F0D91088];
    }

    if (v11) {
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (v9)
  {
    char v12 = [v9 isEqualToNumber:&unk_1F0D91088];

    if ((v12 & 1) == 0)
    {
LABEL_11:
      id v13 = *(void **)(*(void *)(a1 + 32) + 8);
      if (v13) {
        uint64_t v14 = [v13 mutableCopy];
      }
      else {
        uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      }
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v7 = v10;
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSDictionary *)self->_predictions objectForKeyedSubscript:a3];
}

- (id)predictedValueForType:(id)a3
{
  return [(NSDictionary *)self->_predictions objectForKeyedSubscript:a3];
}

- (CPLSyncSessionPrediction)initWithPredictedValuesAndTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLSyncSessionPrediction *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    predictions = v5->_predictions;
    v5->_predictions = (NSDictionary *)v6;
  }
  return v5;
}

- (CPLSyncSessionPrediction)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLSyncSessionPrediction;
  return [(CPLSyncSessionPrediction *)&v3 init];
}

@end