@interface _DKBiomeQuery
+ (BOOL)canShimDuetStreamNamed:(id)a3;
+ (BOOL)shimDisabled;
+ (id)biomeExclusiveStreamsFromEventStreams:(id)a3;
+ (id)deletionPredicateFromArray:(id)a3;
+ (id)duetExclusiveStreamsFromEventStreams:(id)a3;
+ (id)eventStreamsFromArray:(id)a3;
+ (id)eventStreamsFromPredicate:(id)a3;
- (BOOL)prepareQuery:(id *)a3;
- (_DKBiomeQuery)initWithDKEventQuery:(id)a3;
- (_DKBiomeQuery)initWithDeletionArray:(id)a3;
- (_DKBiomeQuery)initWithDeletionPredicate:(id)a3;
- (_DKBiomeQuery)initWithEventStreams:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 sortDescriptors:(id)a7 resultType:(int64_t)a8 groupByProperties:(id)a9 returnDistinctResults:(BOOL)a10 readMetadata:(BOOL)a11 excludedMetadataKeys:(id)a12;
- (id)_getCachedStreamForBiomeStreamIdentifier:(id)a3;
- (id)_publisherForQueryReturningIndividualResults:(BOOL)a3 error:(id *)a4;
- (id)_publisherForStreams:(id)a3;
- (id)bmdkEventStreams;
- (id)executeBiomeQueryError:(id *)a3;
- (id)filterExcludedMetadataWithDKEvent:(id)a3;
- (id)publisherForQueryWithError:(id *)a3;
- (unint64_t)executeDeletionQuery:(id *)a3;
- (void)_setBiomeStreamWithBlock:(id)a3;
@end

@implementation _DKBiomeQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedMetadataKeys, 0);
  objc_storeStrong((id *)&self->_groupByProperties, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_eventStreamNames, 0);
}

+ (BOOL)canShimDuetStreamNamed:(id)a3
{
  id v3 = a3;
  if (v3 && ([&unk_1EDE1E860 containsObject:v3] & 1) == 0) {
    int v4 = [v3 containsString:@"knowledge-sync"] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)prepareQuery:(id *)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  predicate = self->_predicate;
  id v47 = 0;
  BOOL v6 = +[_DKPredicateValidator validatePredicate:predicate allowedKeys:0 error:&v47];
  id v7 = v47;
  v8 = v7;
  if (v7) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6;
  }
  if (!a3 || v9)
  {
    if (self->_resultType == 6)
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"endDate" ascending:0];
      v51[0] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      sortDescriptors = self->_sortDescriptors;
      self->_sortDescriptors = v12;
    }
    v41 = v8;
    [(NSPredicate *)self->_predicate allowEvaluation];
    if (+[_DKPredicateValidator validateSortDescriptors:self->_sortDescriptors])
    {
      context = (void *)MEMORY[0x192FB2F20]();
      v14 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_sortDescriptors, "count"));
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      obj = self->_sortDescriptors;
      uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v44 != v17) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v20 = [v19 key];
            v21 = +[_DKEvent keyPathForMOKeyPath:]((uint64_t)_DKEvent, v20);

            if (v21
              && ([v19 key],
                  v22 = objc_claimAutoreleasedReturnValue(),
                  int v23 = [v21 isEqual:v22],
                  v22,
                  !v23))
            {
              v24 = [v19 comparator];

              if (v24)
              {
                v25 = (void *)MEMORY[0x1E4F29008];
                uint64_t v26 = [v19 ascending];
                v27 = [v19 comparator];
                v28 = [v25 sortDescriptorWithKey:v21 ascending:v26 comparator:v27];
              }
              else
              {
                uint64_t v29 = [v19 selector];
                v30 = (void *)MEMORY[0x1E4F29008];
                uint64_t v31 = [v19 ascending];
                if (v29) {
                  objc_msgSend(v30, "sortDescriptorWithKey:ascending:selector:", v21, v31, objc_msgSend(v19, "selector"));
                }
                else {
                v28 = [v30 sortDescriptorWithKey:v21 ascending:v31];
                }
              }
              [(NSArray *)v14 addObject:v28];
              [v28 allowEvaluation];
            }
            else
            {
              [(NSArray *)v14 addObject:v19];
              [v19 allowEvaluation];
            }
          }
          uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v50 count:16];
        }
        while (v16);
      }

      v32 = self->_sortDescriptors;
      self->_sortDescriptors = v14;

      BOOL v10 = 1;
    }
    else
    {
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v34 = NSString;
      v35 = [(NSArray *)self->_sortDescriptors valueForKey:@"key"];
      v36 = [v34 stringWithFormat:@"invalid sort descriptors %@", v35];
      v49 = v36;
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      v38 = [v33 errorWithDomain:@"BMQueryErrorDomain" code:3 userInfo:v37];

      if (a3) {
        *a3 = v38;
      }

      BOOL v10 = 0;
    }
    v8 = v41;
  }
  else
  {
    BOOL v10 = 0;
    *a3 = v7;
  }

  return v10;
}

+ (BOOL)shimDisabled
{
  return 0;
}

+ (id)duetExclusiveStreamsFromEventStreams:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___DKBiomeQuery_duetExclusiveStreamsFromEventStreams___block_invoke;
  v5[3] = &__block_descriptor_40_e24_B16__0___DKEventStream_8l;
  v5[4] = a1;
  id v3 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v5);
  return v3;
}

- (_DKBiomeQuery)initWithDKEventQuery:(id)a3
{
  id v3 = a3;
  int v4 = [v3 explicitEventStreamsOrEventStreamsInPredicate];
  v19 = +[_DKBiomeQuery biomeExclusiveStreamsFromEventStreams:v4];

  v5 = [v3 predicate];
  uint64_t v18 = [v3 limit];
  uint64_t v6 = [v3 offset];
  id v7 = [v3 sortDescriptors];
  uint64_t v8 = [v3 resultType];
  BOOL v9 = [v3 groupByProperties];
  char v10 = [v3 returnsDistinctResults];
  char v11 = [v3 readMetadata];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [v3 excludedMetadataKeys];

  v14 = [v12 setWithArray:v13];
  BYTE1(v17) = v11;
  LOBYTE(v17) = v10;
  uint64_t v15 = -[_DKBiomeQuery initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:](self, "initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:", v19, v5, v18, v6, v7, v8, v9, v17, v14);

  return v15;
}

+ (id)biomeExclusiveStreamsFromEventStreams:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55___DKBiomeQuery_biomeExclusiveStreamsFromEventStreams___block_invoke;
  v5[3] = &__block_descriptor_40_e24_B16__0___DKEventStream_8l;
  v5[4] = a1;
  id v3 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v5);
  return v3;
}

- (_DKBiomeQuery)initWithEventStreams:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 sortDescriptors:(id)a7 resultType:(int64_t)a8 groupByProperties:(id)a9 returnDistinctResults:(BOOL)a10 readMetadata:(BOOL)a11 excludedMetadataKeys:(id)a12
{
  id v17 = a12;
  id v18 = a9;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v21 = a7;
  id v22 = a9;
  id v57 = a12;
  if (![v19 count])
  {
    int v23 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[_DKBiomeQuery initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:]((uint64_t)v20, v23);
    }

    id v18 = a9;
  }
  v62.receiver = self;
  v62.super_class = (Class)_DKBiomeQuery;
  v24 = [(_DKBiomeQuery *)&v62 init];
  if (v24)
  {
    id obj = a7;
    uint64_t v25 = [v19 valueForKeyPath:@"@distinctUnionOfObjects.name"];
    eventStreamNames = v24->_eventStreamNames;
    v55 = v24;
    v24->_eventStreamNames = (NSArray *)v25;

    if (AnalyticsIsEventUsed())
    {
      unint64_t v48 = a5;
      id v49 = v22;
      unint64_t v50 = a6;
      id v51 = v18;
      id v52 = v20;
      id v53 = v19;
      uint64_t v27 = _CDCurrentOrXPCProcessName();
      v28 = (void *)v27;
      uint64_t v29 = @"unknown";
      if (v27) {
        uint64_t v29 = (__CFString *)v27;
      }
      v30 = v29;

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v31 = v55->_eventStreamNames;
      uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v58 objects:v65 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v59 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            v63[0] = @"client";
            v63[1] = @"stream";
            v64[0] = v30;
            v64[1] = v36;
            v37 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v64, v63, 2, v48, v49, v50, v51, v52, v53);
            AnalyticsSendEvent();
          }
          uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v58 objects:v65 count:16];
        }
        while (v33);
      }

      id v20 = v52;
      id v19 = v53;
      id v17 = a12;
      a6 = v50;
      id v18 = v51;
      a5 = v48;
      id v22 = v49;
    }
    BOOL v38 = a10;
    if (!v20) {
      goto LABEL_19;
    }
    [MEMORY[0x1E4F28F60] predicateWithValue:1];
    unint64_t v39 = a5;
    id v40 = v22;
    v42 = unint64_t v41 = a6;
    char v43 = [v20 isEqual:v42];

    a6 = v41;
    id v22 = v40;
    a5 = v39;
    BOOL v38 = a10;
    id v17 = a12;
    if ((v43 & 1) == 0)
    {
      long long v45 = (NSPredicate *)v20;
      v24 = v55;
      predicate = v55->_predicate;
      v55->_predicate = v45;
    }
    else
    {
LABEL_19:
      v24 = v55;
      predicate = v55->_predicate;
      v55->_predicate = 0;
    }

    if (a5 <= 0x7FFFFFFE) {
      unint64_t v46 = a5;
    }
    else {
      unint64_t v46 = 0;
    }
    v24->_limit = v46;
    v24->_offset = a6;
    objc_storeStrong((id *)&v24->_sortDescriptors, obj);
    v24->_resultType = a8;
    objc_storeStrong((id *)&v24->_groupByProperties, v18);
    v24->_returnDistinctResults = v38;
    v24->_readMetadata = a11;
    objc_storeStrong((id *)&v24->_excludedMetadataKeys, v17);
  }

  return v24;
}

+ (id)eventStreamsFromPredicate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = +[_DKBiomePredicateValueScanner searchForValuesForKey:@"streamName" inPredicate:a3];
    int v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          char v10 = +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (_DKBiomeQuery)initWithDeletionPredicate:(id)a3
{
  id v4 = a3;
  id v5 = +[_DKBiomePredicateScanner searchForKeys:&unk_1EDE1E848 inPredicate:v4];

  uint64_t v6 = +[_DKBiomeQuery eventStreamsFromPredicate:v4];
  if ([v6 count])
  {
    uint64_t v7 = +[_DKBiomeQuery biomeExclusiveStreamsFromEventStreams:v6];

    if ([v7 count])
    {
      LOBYTE(v12) = 0;
      BYTE1(v12) = v5 != 0;
      self = -[_DKBiomeQuery initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:](self, "initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:", v7, v4, 0, 0, 0, 0, 0, v12, 0);
      uint64_t v6 = v7;
      uint64_t v8 = self;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v6 = v7;
    }
  }
  else
  {
    BOOL v9 = _CDCurrentOrXPCProcessName();
    char v10 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[_DKBiomeQuery initWithDeletionPredicate:]((uint64_t)v9, v4);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)executeDeletionQuery:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!-[_DKBiomeQuery prepareQuery:](self, "prepareQuery:")) {
    return 0;
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = self->_eventStreamNames;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v4)
  {
    int v23 = self;
    id v22 = 0;
    uint64_t v5 = *(void *)v31;
    uint64_t v6 = *MEMORY[0x1E4F28358];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        BOOL v9 = (void *)MEMORY[0x192FB2F20]();
        uint64_t v26 = 0;
        uint64_t v27 = &v26;
        uint64_t v28 = 0x2020000000;
        uint64_t v29 = 0;
        char v10 = (void *)[objc_alloc((Class)getBMDKEventStreamClass()) initWithDKStreamIdentifier:v8 contentProtection:v6];
        char v11 = v10;
        if (v10)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __38___DKBiomeQuery_executeDeletionQuery___block_invoke;
          v24[3] = &unk_1E5610290;
          v24[4] = v23;
          v24[5] = &v26;
          v24[6] = &v34;
          id v25 = 0;
          [v10 pruneEventsWithError:&v25 predicateBlock:v24];
          uint64_t v12 = v25;
          if (v12)
          {
            long long v13 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v39 = v8;
              __int16 v40 = 2112;
              unint64_t v41 = v12;
              _os_log_error_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_ERROR, "[Storage][Biome] Error encountered during deletion for DK stream %@ error:%@", buf, 0x16u);
            }

            if (!v22) {
              id v22 = v12;
            }
          }
          v35[3] += v27[3];
          long long v14 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = v35[3];
            uint64_t v16 = v27[3];
            *(_DWORD *)buf = 134218498;
            uint64_t v39 = v15;
            __int16 v40 = 2048;
            unint64_t v41 = v16;
            __int16 v42 = 2112;
            uint64_t v43 = v8;
            _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_INFO, "[Storage][Biome] Deleted a total of %lu events with %lu events from Biome for DK stream %@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v12 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = v8;
            _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_INFO, "[Storage][Biome] Skipping Biome stream during deletion for DK stream %@", buf, 0xCu);
          }
        }

        _Block_object_dispose(&v26, 8);
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v4);

    if (a3)
    {
      uint64_t v17 = v22;
      if (v22)
      {
        uint64_t v17 = v22;
        *a3 = v17;
      }
    }
    else
    {
      uint64_t v17 = v22;
    }
  }
  else
  {

    uint64_t v17 = 0;
  }
  unint64_t v18 = v35[3];
  _Block_object_dispose(&v34, 8);

  return v18;
}

- (id)_publisherForQueryReturningIndividualResults:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  if (![(_DKBiomeQuery *)self prepareQuery:a4])
  {
    uint64_t v7 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = [(_DKBiomeQuery *)self bmdkEventStreams];
  uint64_t v7 = [(_DKBiomeQuery *)self _publisherForStreams:v6];

  if ([(NSArray *)self->_sortDescriptors count])
  {
    uint64_t v8 = objc_opt_new();
    BOOL v9 = [v7 reduceWithInitial:v8 nextPartialResult:&__block_literal_global_659];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_2;
    v20[3] = &unk_1E56101B0;
    v20[4] = self;
    uint64_t v7 = [v9 mapWithTransform:v20];

    if (v4)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_6;
      v17[3] = &unk_1E5610220;
      v17[4] = self;
      uint64_t v10 = [v7 flatMapWithTransform:v17];
    }
    else
    {
      if (self->_resultType) {
        goto LABEL_16;
      }
      uint64_t v10 = [v7 mapWithTransform:&__block_literal_global_672_0];
    }
    uint64_t v15 = (void *)v10;

    uint64_t v7 = v15;
  }
  else
  {
    if (!self->_resultType)
    {
      uint64_t v11 = [v7 mapWithTransform:&__block_literal_global_663];

      uint64_t v7 = (void *)v11;
    }
    if (self->_offset || self->_limit - 1 <= 0x7FFFFFFD)
    {
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      v19[3] = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_4;
      v18[3] = &unk_1E56101F8;
      v18[4] = self;
      v18[5] = v19;
      uint64_t v12 = [v7 filterWithIsIncluded:v18];

      _Block_object_dispose(v19, 8);
      uint64_t v7 = (void *)v12;
    }
    if (!v4)
    {
      long long v13 = objc_opt_new();
      uint64_t v14 = [v7 reduceWithInitial:v13 nextPartialResult:&__block_literal_global_666];

      uint64_t v7 = (void *)v14;
    }
  }
LABEL_16:
  return v7;
}

- (id)executeBiomeQueryError:(id *)a3
{
  if (-[_DKBiomeQuery prepareQuery:](self, "prepareQuery:"))
  {
    uint64_t v5 = [(_DKBiomeQuery *)self _publisherForQueryReturningIndividualResults:0 error:a3];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x3032000000;
      uint64_t v14 = __Block_byref_object_copy__20;
      uint64_t v15 = __Block_byref_object_dispose__20;
      id v16 = 0;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40___DKBiomeQuery_executeBiomeQueryError___block_invoke_679;
      v10[3] = &unk_1E5610268;
      v10[4] = &v11;
      id v7 = (id)[v5 sinkWithCompletion:&__block_literal_global_678 shouldContinue:v10];
      id v8 = (id)v12[5];
      _Block_object_dispose(&v11, 8);
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)bmdkEventStreams
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = self->_eventStreamNames;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v23;
    *(void *)&long long v4 = 138412290;
    long long v12 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * v6);
        id v8 = [getBMDKEventStreamClass() streamNameFromDKStreamName:v7];
        uint64_t v16 = 0;
        uint64_t v17 = &v16;
        uint64_t v18 = 0x3032000000;
        id v19 = __Block_byref_object_copy__20;
        id v20 = __Block_byref_object_dispose__20;
        id v21 = [(_DKBiomeQuery *)self _getCachedStreamForBiomeStreamIdentifier:v8];
        if (v17[5]
          || (v15[0] = MEMORY[0x1E4F143A8],
              v15[1] = 3221225472,
              v15[2] = __33___DKBiomeQuery_bmdkEventStreams__block_invoke,
              v15[3] = &unk_1E5610168,
              v15[4] = v7,
              v15[5] = &v16,
              [(_DKBiomeQuery *)self _setBiomeStreamWithBlock:v15],
              v17[5]))
        {
          [v14 addObject:v12];
        }
        else
        {
          BOOL v9 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v12;
            uint64_t v27 = v7;
            _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "[Storage][Biome] Skipping Biome stream for DK stream %@", buf, 0xCu);
          }
        }
        _Block_object_dispose(&v16, 8);

        ++v6;
      }
      while (v3 != v6);
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      uint64_t v3 = v10;
    }
    while (v10);
  }

  return v14;
}

- (id)_publisherForStreams:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] < 2)
  {
    if (self->_offset
      || self->_limit - 1 > 0x7FFFFFFD
      || self->_predicate
      || [(NSArray *)self->_sortDescriptors count]
      && ([(NSArray *)self->_sortDescriptors count] != 1
       || ([(NSArray *)self->_sortDescriptors firstObject],
           v35 = objc_claimAutoreleasedReturnValue(),
           [v35 key],
           uint64_t v36 = objc_claimAutoreleasedReturnValue(),
           int v37 = [v36 isEqualToString:@"creationDate"],
           v36,
           v35,
           !v37)))
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v38 = [(NSArray *)self->_sortDescriptors firstObject];
      if (v38
        && (uint64_t v39 = (void *)v38,
            [(NSArray *)self->_sortDescriptors firstObject],
            __int16 v40 = objc_claimAutoreleasedReturnValue(),
            int v41 = [v40 ascending],
            v40,
            v39,
            !v41))
      {
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_limit];
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = [NSNumber numberWithUnsignedInteger:self->_limit];
        uint64_t v15 = 0;
      }
      sortDescriptors = self->_sortDescriptors;
      self->_sortDescriptors = (NSArray *)MEMORY[0x1E4F1CBF0];

      self->_limit = 0;
    }
    uint64_t v17 = [v4 firstObject];
    id v14 = [v17 publisherWithStartTime:0 endTime:0 maxEvents:v16 lastN:v15 reversed:0];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v50 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          long long v12 = (void *)MEMORY[0x192FB2F20]();
          uint64_t v13 = [v11 publisherWithStartTime:0 endTime:0 maxEvents:0 lastN:0 reversed:0];
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v8);
    }

    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50218]) initWithPublishers:v5];
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __38___DKBiomeQuery__publisherForStreams___block_invoke;
  v48[3] = &unk_1E5610068;
  v48[4] = self;
  uint64_t v18 = [v14 mapWithTransform:v48];

  if (self->_predicate)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __38___DKBiomeQuery__publisherForStreams___block_invoke_2;
    v47[3] = &unk_1E5610090;
    v47[4] = self;
    uint64_t v19 = [v18 filterWithIsIncluded:v47];

    uint64_t v18 = (void *)v19;
  }
  id v20 = (void *)MEMORY[0x192FB2F20]();
  int64_t resultType = self->_resultType;
  if ((unint64_t)(resultType - 3) >= 4)
  {
    if (resultType == 2)
    {
      uint64_t v29 = [v18 mapWithTransform:&__block_literal_global_624];
    }
    else
    {
      if (resultType != 1)
      {
LABEL_34:
        uint64_t v27 = v18;
        goto LABEL_35;
      }
      uint64_t v29 = [v18 reduceWithInitial:&unk_1EDE1E0C0 nextPartialResult:&__block_literal_global_620];
    }
    long long v33 = (void *)v29;

    uint64_t v18 = v33;
    goto LABEL_34;
  }
  groupByProperties = self->_groupByProperties;
  if (!groupByProperties) {
    groupByProperties = (NSArray *)&unk_1EDE1E878;
  }
  long long v23 = groupByProperties;
  long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v23];
  long long v25 = v24;
  if (self->_resultType == 6) {
    [v24 addObject:@"endDate"];
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __38___DKBiomeQuery__publisherForStreams___block_invoke_3;
  v44[3] = &unk_1E56100F8;
  id v26 = v25;
  id v45 = v26;
  unint64_t v46 = self;
  uint64_t v27 = [v18 mapWithTransform:v44];

  if (self->_resultType == 5)
  {
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = [v27 groupByKey:&__block_literal_global_647];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __38___DKBiomeQuery__publisherForStreams___block_invoke_5;
    v43[3] = &unk_1E5610120;
    v43[4] = self;
    long long v30 = [v28 aggregateWithInitial:MEMORY[0x1E4F1CC08] nextPartialResult:v43];
    uint64_t v31 = [v30 flatMapWithTransform:&__block_literal_global_654];

    uint64_t v27 = (void *)v31;
  }

  if (v28)
  {
    long long v32 = (void *)MEMORY[0x192FB2F20]();
    [v28 connect];
  }
LABEL_35:

  return v27;
}

- (id)_getCachedStreamForBiomeStreamIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[_DKBiomeStreamCache sharedCache];
  id v5 = [v4 objectForKey:v3];

  return v5;
}

- (void)_setBiomeStreamWithBlock:(id)a3
{
  if (a3)
  {
    id v3 = (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    if (v3)
    {
      id v6 = v3;
      id v4 = +[_DKBiomeStreamCache sharedCache];
      id v5 = [v6 identifier];
      [v4 setObject:v6 forKey:v5];

      id v3 = v6;
    }
  }
}

- (_DKBiomeQuery)initWithDeletionArray:(id)a3
{
  id v4 = a3;
  id v5 = +[_DKBiomeQuery eventStreamsFromArray:v4];
  if ([v5 count])
  {
    id v6 = +[_DKBiomeQuery biomeExclusiveStreamsFromEventStreams:v5];

    if ([v6 count])
    {
      uint64_t v7 = +[_DKBiomeQuery deletionPredicateFromArray:v4];
      LOWORD(v12) = 0;
      self = -[_DKBiomeQuery initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:](self, "initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:", v6, v7, [v4 count], 0, 0, 0, 0, v12, 0);

      id v5 = v6;
      uint64_t v8 = self;
    }
    else
    {
      uint64_t v8 = 0;
      id v5 = v6;
    }
  }
  else
  {
    uint64_t v9 = _CDCurrentOrXPCProcessName();
    uint64_t v10 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[_DKBiomeQuery initWithDeletionArray:]((uint64_t)v9, v4);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)eventStreamsFromArray:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        id v20 = v4;
        char v9 = 0;
        uint64_t v10 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = v12;
              id v14 = [v13 stream];
              uint64_t v15 = [v14 name];

              if (v15)
              {
                uint64_t v16 = [v13 stream];
                [v5 setObject:v16 forKeyedSubscript:v15];
              }
            }
            else
            {
              char v9 = 1;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v8);

        id v4 = v20;
        if ((v9 & 1) == 0) {
          goto LABEL_19;
        }
        id v6 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          +[_DKBiomeQuery eventStreamsFromArray:](v6);
        }
      }

LABEL_19:
      uint64_t v17 = [v5 allValues];
      goto LABEL_26;
    }
    id v5 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "[Storage][Biome] Unable to initialize Biome deletion query with empty array";
      goto LABEL_24;
    }
  }
  else
  {
    id v5 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "[Storage][Biome] Unable to initialize Biome deletion query with nil array";
LABEL_24:
      _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, v18, buf, 2u);
    }
  }
  uint64_t v17 = 0;
LABEL_26:

  return v17;
}

+ (id)deletionPredicateFromArray:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x192FB2F20]();
  id v5 = [v3 valueForKey:@"UUID"];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_65);
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v7];

  return v8;
}

- (id)filterExcludedMetadataWithDKEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 metadata];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 metadata];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v9 = [v4 metadata];
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            if (!-[NSSet containsObject:](self->_excludedMetadataKeys, "containsObject:", v16, (void)v19))
            {
              uint64_t v17 = [v11 objectForKeyedSubscript:v16];
              [v10 setObject:v17 forKeyedSubscript:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }

      [v4 setMetadata:v10];
    }
  }
  return v4;
}

- (id)publisherForQueryWithError:(id *)a3
{
  return [(_DKBiomeQuery *)self _publisherForQueryReturningIndividualResults:1 error:a3];
}

- (void)initWithEventStreams:(uint64_t)a1 predicate:(NSObject *)a2 limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_FAULT, "[Storage][Biome] Unable to determine stream list, predicate %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithDeletionArray:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  int v2 = [a2 valueForKey:@"class"];
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_11(&dword_18ECEB000, v3, v4, "Deletion array does not specify any streams. Client: %@, Array: %@", v5, v6, v7, v8, v9);
}

- (void)initWithDeletionPredicate:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  int v2 = objc_msgSend(a2, "cd_sanitizeForLogging");
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_11(&dword_18ECEB000, v3, v4, "Deletion predicate does not specify any streams. Client: %@, Predicate: %@", v5, v6, v7, v8, v9);
}

+ (void)eventStreamsFromArray:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "[Storage][Biome] Deletion array contains _DKObject entries all stream enumeration needed", v1, 2u);
}

@end