@interface EDHeuristicsMailboxPredictor
- (BOOL)_isAllowedRecipient:(id)a3;
- (BOOL)_limitToRecents;
- (BOOL)_modeParameterIs:(id)a3;
- (EDHeuristicsMailboxPredictor)initWithUserProfileProvider:(id)a3 messagePersistence:(id)a4 mailboxPersistence:(id)a5;
- (EDHeuristicsMailboxPredictor)initWithUserProfileProvider:(id)a3 messagePersistence:(id)a4 mailboxPersistence:(id)a5 parameters:(id)a6;
- (EDMailboxPersistence)mailboxPersistence;
- (EDMessagePersistence)messagePersistence;
- (EMUserProfileProvider)userProfileProvider;
- (NSCache)mailboxIDCache;
- (NSDictionary)parameters;
- (id)_adjustPredicateForRecent:(id)a3;
- (id)_allowedRecipientsForMessage:(id)a3;
- (id)_conversationIDCountsForMessage:(id)a3;
- (id)_countsForField:(id)a3 message:(id)a4;
- (id)_countsForPredicate:(id)a3;
- (id)_listIDCountsForMessage:(id)a3;
- (id)_mergeDefaultParameters:(id)a3 withParameters:(id)a4;
- (id)_normalizedTermFrequencyTopHitFromDictionary:(id)a3 withThreshold:(double)a4;
- (id)_objectWithMeasure:(double)a3 timesHigherThanFollowUpInMeasures:(id)a4;
- (id)_orderedModePredictionForMessage:(id)a3;
- (id)_predictionsForMessage:(id)a3 limit:(unint64_t)a4;
- (id)_recipientCountsForMessage:(id)a3;
- (id)_removeSpecialMailboxesInCounts:(id)a3 message:(id)a4;
- (id)_senderCountsForMessage:(id)a3;
- (id)_summedWeightedPredictionsForMessage:(id)a3 limit:(unint64_t)a4;
- (id)_topHitFromMailboxDictionary:(id)a3;
- (id)_topHitFromMailboxDictionary:(id)a3 message:(id)a4;
- (id)_userCreatedMailboxIDs;
- (id)_weightedModePredictionsForMessage:(id)a3;
- (id)predictMailboxIDsForMessages:(id)a3 limit:(unint64_t)a4;
- (void)setMailboxIDCache:(id)a3;
- (void)setMailboxPersistence:(id)a3;
- (void)setMessagePersistence:(id)a3;
- (void)setParameters:(id)a3;
- (void)setUserProfileProvider:(id)a3;
@end

@implementation EDHeuristicsMailboxPredictor

- (EDHeuristicsMailboxPredictor)initWithUserProfileProvider:(id)a3 messagePersistence:(id)a4 mailboxPersistence:(id)a5
{
  v24[8] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EDHeuristicsMailboxPredictor;
  v9 = [(EDHeuristicsMailboxPredictor *)&v19 init];
  v10 = v9;
  if (v9)
  {
    [(EDHeuristicsMailboxPredictor *)v9 setUserProfileProvider:v17];
    [(EDHeuristicsMailboxPredictor *)v10 setMessagePersistence:v18];
    [(EDHeuristicsMailboxPredictor *)v10 setMailboxPersistence:v8];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(EDHeuristicsMailboxPredictor *)v10 setMailboxIDCache:v11];

    uint64_t v12 = MEMORY[0x1E4F1CC38];
    v23[0] = @"mode";
    v23[1] = @"ignoreUserAddresses";
    v24[0] = @"ordered";
    v24[1] = MEMORY[0x1E4F1CC38];
    v23[2] = @"confusionThreshold";
    v23[3] = @"orderedThreshold";
    v24[2] = &unk_1F35BB710;
    v24[3] = &unk_1F35BB720;
    v23[4] = @"order";
    v22[0] = @"conversationID";
    v22[1] = @"recipient";
    v22[2] = @"listID";
    v22[3] = @"sender";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    v24[4] = v13;
    v24[5] = &unk_1F35BB720;
    v23[5] = @"weightedThreshold";
    v23[6] = @"weights";
    v20[0] = @"conversationID";
    v20[1] = @"listID";
    v21[0] = &unk_1F35BAC28;
    v21[1] = &unk_1F35BB730;
    v20[2] = @"recipient";
    v20[3] = @"sender";
    v21[2] = &unk_1F35BB730;
    v21[3] = &unk_1F35BB740;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    v23[7] = @"limitToRecentMessages";
    v24[6] = v14;
    v24[7] = v12;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
    [(EDHeuristicsMailboxPredictor *)v10 setParameters:v15];
  }
  return v10;
}

- (EDHeuristicsMailboxPredictor)initWithUserProfileProvider:(id)a3 messagePersistence:(id)a4 mailboxPersistence:(id)a5 parameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(EDHeuristicsMailboxPredictor *)self initWithUserProfileProvider:v10 messagePersistence:v11 mailboxPersistence:v12];
  v15 = v14;
  if (v14)
  {
    v16 = [(EDHeuristicsMailboxPredictor *)v14 _mergeDefaultParameters:v14->_parameters withParameters:v13];
    [(EDHeuristicsMailboxPredictor *)v15 setParameters:v16];
  }
  return v15;
}

- (id)_mergeDefaultParameters:(id)a3 withParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v18 = v7;
    goto LABEL_16;
  }
  v9 = (void *)[v7 mutableCopy];
  [v9 addEntriesFromDictionary:v8];
  id v10 = [v9 objectForKeyedSubscript:@"confusionThreshold"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [v9 objectForKeyedSubscript:@"confusionThreshold"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_6;
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"EDHeuristicsMailboxPredictor.m", 119, @"Invalid parameter not satisfying: %@", @"[mergedParams[kConfusionThresholdParameterKey] isKindOfClass:[NSNumber class]] || [mergedParams[kConfusionThresholdParameterKey] isKindOfClass:[NSNull class]]" object file lineNumber description];
  }

LABEL_6:
  id v13 = [v9 objectForKeyedSubscript:@"mode"];
  int v14 = [v13 isEqual:@"ordered"];

  if (v14)
  {
    v15 = [v9 objectForKeyedSubscript:@"order"];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"EDHeuristicsMailboxPredictor.m", 122, @"Invalid parameter not satisfying: %@", @"[mergedParams[kOrderParameterKey] isKindOfClass:[NSArray class]]" object file lineNumber description];
LABEL_14:
    }
  }
  else
  {
    objc_super v19 = [v9 objectForKeyedSubscript:@"mode"];
    int v20 = [v19 isEqual:@"weighted"];

    if (!v20)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [v9 objectForKeyedSubscript:@"mode"];
      [v17 handleFailureInMethod:a2, self, @"EDHeuristicsMailboxPredictor.m", 126, @"Unknown mode: %@", v23 object file lineNumber description];

      goto LABEL_14;
    }
    v21 = [v9 objectForKeyedSubscript:@"weights"];
    objc_opt_class();
    char v22 = objc_opt_isKindOfClass();

    if ((v22 & 1) == 0)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"EDHeuristicsMailboxPredictor.m", 124, @"Invalid parameter not satisfying: %@", @"[mergedParams[kWeightsParameterKey] isKindOfClass:[NSDictionary class]]" object file lineNumber description];
      goto LABEL_14;
    }
  }
  id v18 = (id)[v9 copy];

LABEL_16:

  return v18;
}

- (id)predictMailboxIDsForMessages:(id)a3 limit:(unint64_t)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  unint64_t v46 = a4;
  BOOL v6 = a4 > 1 || [(EDHeuristicsMailboxPredictor *)self _modeParameterIs:@"weighted"];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v45 = self;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v42;
  uint64_t v47 = [obj countByEnumeratingWithState:&v59 objects:v73 count:16];
  if (v47)
  {
    uint64_t v44 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v60 != v44) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v48 = [v8 persistentID];
        v49 = [(EDHeuristicsMailboxPredictor *)v45 _predictionsForMessage:v8 limit:v46];
        v9 = +[EDMailboxPredictionController log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v10 = [v49 count];
          id v11 = [v8 subject];
          *(_DWORD *)buf = 67109634;
          int v68 = v10;
          __int16 v69 = 2112;
          v70 = v48;
          __int16 v71 = 2112;
          v72 = v11;
          _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_INFO, "Got %u predictions for message persistentID=%@, subject=\"%@\"", buf, 0x1Cu);
        }
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v12 = v49;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v66 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v56 != v14) {
                objc_enumerationMutation(v12);
              }
              char v16 = *(void **)(*((void *)&v55 + 1) + 8 * j);
              id v17 = [v16 object];
              if (v6)
              {
                id v18 = [v7 objectForKeyedSubscript:v17];

                if (v18)
                {
                  objc_super v19 = [v7 objectForKeyedSubscript:v17];
                  [v16 measure];
                  double v21 = v20;
                  [v19 measure];
                  [v19 setMeasure:v21 + v22];
                }
                else
                {
                  v25 = (void *)MEMORY[0x1E4F60DA8];
                  [v16 measure];
                  objc_super v19 = objc_msgSend(v25, "object:withMeasure:", v17);
                  [v7 setObject:v19 forKeyedSubscript:v17];
                }
              }
              else
              {
                v23 = [v7 objectForKeyedSubscript:v17];

                if (v23)
                {
                  objc_super v19 = [v7 objectForKeyedSubscript:v17];
                  [v19 measure];
                  [v19 setMeasure:v24 + 1.0];
                }
                else
                {
                  objc_super v19 = [MEMORY[0x1E4F60DA8] object:v17 withMeasure:1.0];
                  [v7 setObject:v19 forKeyedSubscript:v17];
                }
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v66 count:16];
          }
          while (v13);
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v59 objects:v73 count:16];
    }
    while (v47);
  }

  v26 = +[EDMailboxPredictionController log];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[EDHeuristicsMailboxPredictor predictMailboxIDsForMessages:limit:]([v7 count], v65, v26);
  }

  v27 = (void *)MEMORY[0x1E4F60DA8];
  if (v46 == 1)
  {
    v28 = [v7 allValues];
    v29 = [v28 objectEnumerator];
    v30 = [v27 max:v29];
    id v31 = [v30 object];

    if (v31)
    {
      id v64 = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    }
    else
    {
      v32 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v33 = [v7 allValues];
    v34 = [v27 reverseSortedObjects:v33 limit:v46];

    v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v34, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v31 = v34;
    uint64_t v35 = [v31 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v52;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v52 != v36) {
            objc_enumerationMutation(v31);
          }
          v38 = [*(id *)(*((void *)&v51 + 1) + 8 * k) object];
          [v32 addObject:v38];
        }
        uint64_t v35 = [v31 countByEnumeratingWithState:&v51 objects:v63 count:16];
      }
      while (v35);
    }
  }
  v39 = +[EDMailboxPredictionController log];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    v40 = [v32 firstObject];
    -[EDHeuristicsMailboxPredictor predictMailboxIDsForMessages:limit:](v40, buf, v39);
  }

  return v32;
}

- (BOOL)_modeParameterIs:(id)a3
{
  id v4 = a3;
  v5 = [(EDHeuristicsMailboxPredictor *)self parameters];
  BOOL v6 = [v5 objectForKeyedSubscript:@"mode"];
  char v7 = [v6 isEqualToString:v4];

  return v7;
}

- (id)_predictionsForMessage:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  if (a4 < 2)
  {
    if ([(EDHeuristicsMailboxPredictor *)self _modeParameterIs:@"ordered"]) {
      [(EDHeuristicsMailboxPredictor *)self _orderedModePredictionForMessage:v6];
    }
    else {
    uint64_t v7 = [(EDHeuristicsMailboxPredictor *)self _weightedModePredictionsForMessage:v6];
    }
  }
  else
  {
    uint64_t v7 = [(EDHeuristicsMailboxPredictor *)self _summedWeightedPredictionsForMessage:v6 limit:a4];
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)_orderedModePredictionForMessage:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v4 = +[EDMailboxPredictionController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[EDHeuristicsMailboxPredictor _orderedModePredictionForMessage:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = [(EDHeuristicsMailboxPredictor *)self parameters];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"orderedThreshold"];
  [v13 doubleValue];
  double v15 = v14;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  char v16 = [(EDHeuristicsMailboxPredictor *)self parameters];
  obuint64_t j = [v16 objectForKeyedSubscript:@"order"];

  uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v17)
  {
    uint64_t v43 = *(void *)v49;
    id v41 = (id)MEMORY[0x1E4F1CBF0];
    *(void *)&long long v18 = 134218240;
    long long v40 = v18;
    while (2)
    {
      uint64_t v44 = v17;
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v49 != v43) {
          objc_enumerationMutation(obj);
        }
        double v20 = *(double *)(*((void *)&v48 + 1) + 8 * i);
        -[EDHeuristicsMailboxPredictor _countsForField:message:](self, "_countsForField:message:", *(void *)&v20, v45, v40);
        double v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        double v22 = [(EDHeuristicsMailboxPredictor *)self _topHitFromMailboxDictionary:v21 message:v45];
        uint64_t v23 = [(__CFString *)v21 count];
        double v24 = @"{}";
        if (v23) {
          double v24 = v21;
        }
        *(double *)&v25 = COERCE_DOUBLE(v24);
        v26 = +[EDMailboxPredictionController log];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          double v54 = v20;
          __int16 v55 = 2112;
          double v56 = *(double *)&v25;
          _os_log_debug_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEBUG, "Raw counts for %@: %@", buf, 0x16u);
        }

        if (v22)
        {
          v27 = +[EDMailboxPredictionController log];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            [v22 measure];
            double v36 = v35;
            v37 = [v22 object];
            *(_DWORD *)buf = 134218498;
            double v54 = v36;
            __int16 v55 = 2112;
            double v56 = v20;
            __int16 v57 = 2112;
            long long v58 = v37;
            _os_log_debug_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEBUG, "Found %.0lf hit for **%@** in %@", buf, 0x20u);
          }
          v28 = [v22 object];
          v29 = [v45 mailbox];
          v30 = [v29 URL];
          id v31 = [v30 absoluteString];
          int v32 = [v28 isEqual:v31];

          if (v32)
          {
            v33 = +[EDMailboxPredictionController log];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              [(EDHeuristicsMailboxPredictor *)&v46 _orderedModePredictionForMessage:v33];
            }
          }
          else
          {
            [v22 measure];
            if (v34 >= v15)
            {
              long long v52 = v22;
              id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];

              goto LABEL_27;
            }
            v33 = +[EDMailboxPredictionController log];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              [v22 measure];
              *(_DWORD *)buf = v40;
              double v54 = v38;
              __int16 v55 = 2048;
              double v56 = v15;
              _os_log_debug_impl(&dword_1DB39C000, v33, OS_LOG_TYPE_DEBUG, "Ignoring because count (%.0f) is under threshold (%.0f).", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v41 = (id)MEMORY[0x1E4F1CBF0];
  }
LABEL_27:

  return v41;
}

- (id)_summedWeightedPredictionsForMessage:(id)a3 limit:(unint64_t)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v4 = +[EDMailboxPredictionController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[EDHeuristicsMailboxPredictor _summedWeightedPredictionsForMessage:limit:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v13 = [(EDHeuristicsMailboxPredictor *)self parameters];
  obuint64_t j = [v13 objectForKeyedSubscript:@"weights"];

  uint64_t v60 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (v60)
  {
    uint64_t v59 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v60; ++i)
      {
        if (*(void *)v75 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v65 = *(void *)(*((void *)&v74 + 1) + 8 * i);
        double v14 = [(EDHeuristicsMailboxPredictor *)self parameters];
        double v15 = [v14 objectForKeyedSubscript:@"weights"];
        char v16 = [v15 objectForKeyedSubscript:v65];
        [v16 doubleValue];
        double v18 = v17;

        objc_super v19 = [(EDHeuristicsMailboxPredictor *)self _countsForField:v65 message:v61];
        uint64_t v20 = [(__CFString *)v19 count];
        double v21 = @"{}";
        if (v20) {
          double v21 = v19;
        }
        long long v62 = v21;
        double v22 = +[EDMailboxPredictionController log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v80 = v65;
          __int16 v81 = 2112;
          v82 = v62;
          _os_log_debug_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEBUG, "Raw counts for %@:\n%@", buf, 0x16u);
        }

        uint64_t v23 = [(EDHeuristicsMailboxPredictor *)self _removeSpecialMailboxesInCounts:v19 message:v61];

        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v70 objects:v85 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v71;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v71 != v26) {
                objc_enumerationMutation(v24);
              }
              v28 = *(__CFString **)(*((void *)&v70 + 1) + 8 * j);
              v29 = [v24 objectForKeyedSubscript:v28];
              [v29 doubleValue];
              double v31 = v30;

              int v32 = +[EDMailboxPredictionController log];
              double v33 = v18 * v31;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                uint64_t v80 = v65;
                __int16 v81 = 2112;
                v82 = v28;
                __int16 v83 = 2048;
                double v84 = v33;
                _os_log_debug_impl(&dword_1DB39C000, v32, OS_LOG_TYPE_DEBUG, "Found field=%@ in mailbox=%@: weightedHits=%.1lf", buf, 0x20u);
              }

              uint64_t v34 = [v12 objectForKeyedSubscript:v28];
              double v35 = (void *)v34;
              if (v34) {
                double v36 = (void *)v34;
              }
              else {
                double v36 = &unk_1F35BAC40;
              }
              id v37 = v36;

              double v38 = NSNumber;
              [v37 doubleValue];
              long long v40 = [v38 numberWithDouble:v33 + v39];

              [v12 setObject:v40 forKeyedSubscript:v28];
            }
            uint64_t v25 = [v24 countByEnumeratingWithState:&v70 objects:v85 count:16];
          }
          while (v25);
        }
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
    }
    while (v60);
  }

  id v41 = [(EDHeuristicsMailboxPredictor *)self parameters];
  id v42 = [v41 objectForKeyedSubscript:@"weightedThreshold"];
  [v42 doubleValue];
  double v44 = v43;

  id v45 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v46 = v12;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v47; ++k)
      {
        if (*(void *)v67 != v48) {
          objc_enumerationMutation(v46);
        }
        uint64_t v50 = *(void *)(*((void *)&v66 + 1) + 8 * k);
        long long v51 = [v46 objectForKeyedSubscript:v50];
        [v51 doubleValue];
        if (v52 > v44)
        {
          long long v53 = (void *)MEMORY[0x1E4F60DA8];
          [v51 doubleValue];
          double v54 = objc_msgSend(v53, "object:withMeasure:", v50);
          [v45 addObject:v54];
        }
      }
      uint64_t v47 = [v46 countByEnumeratingWithState:&v66 objects:v78 count:16];
    }
    while (v47);
  }

  if ([v45 count])
  {
    __int16 v55 = [MEMORY[0x1E4F60DA8] reverseSortedObjects:v45 limit:a4];
  }
  else
  {
    __int16 v55 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v55;
}

- (id)_weightedModePredictionsForMessage:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v4 = +[EDMailboxPredictionController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[EDHeuristicsMailboxPredictor _weightedModePredictionsForMessage:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = [(EDHeuristicsMailboxPredictor *)self parameters];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"weightedThreshold"];
  [v13 doubleValue];
  double v15 = v14;

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  char v16 = [(EDHeuristicsMailboxPredictor *)self parameters];
  obuint64_t j = [v16 objectForKeyedSubscript:@"weights"];

  uint64_t v17 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (!v17)
  {
    __int16 v57 = 0;
    goto LABEL_28;
  }
  uint64_t v59 = *(void *)v65;
  __int16 v57 = 0;
  *(void *)&long long v18 = 134218240;
  long long v56 = v18;
  do
  {
    uint64_t v60 = v17;
    for (uint64_t i = 0; i != v60; ++i)
    {
      if (*(void *)v65 != v59) {
        objc_enumerationMutation(obj);
      }
      double v20 = *(double *)(*((void *)&v64 + 1) + 8 * i);
      double v21 = [(EDHeuristicsMailboxPredictor *)self parameters];
      double v22 = [v21 objectForKeyedSubscript:@"weights"];
      uint64_t v23 = [v22 objectForKeyedSubscript:*(void *)&v20];
      [v23 doubleValue];
      double v25 = v24;

      uint64_t v26 = [(EDHeuristicsMailboxPredictor *)self _countsForField:*(void *)&v20 message:v61];
      uint64_t v27 = [(__CFString *)v26 count];
      v28 = @"{}";
      if (v27) {
        v28 = v26;
      }
      *(double *)&v29 = COERCE_DOUBLE(v28);
      double v30 = +[EDMailboxPredictionController log];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        double v70 = v20;
        __int16 v71 = 2112;
        double v72 = *(double *)&v29;
        _os_log_debug_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_DEBUG, "Raw counts for %@:\n%@", buf, 0x16u);
      }

      double v31 = [(EDHeuristicsMailboxPredictor *)self _topHitFromMailboxDictionary:v26 message:v61];
      int v32 = v31;
      if (v31)
      {
        [v31 measure];
        double v34 = v33;
        double v35 = +[EDMailboxPredictionController log];
        double v36 = v25 * v34;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          [v32 measure];
          double v47 = v46;
          uint64_t v48 = [v32 object];
          *(_DWORD *)buf = 134218754;
          double v70 = v47;
          __int16 v71 = 2048;
          double v72 = v36;
          __int16 v73 = 2112;
          double v74 = v20;
          __int16 v75 = 2112;
          long long v76 = v48;
          _os_log_debug_impl(&dword_1DB39C000, v35, OS_LOG_TYPE_DEBUG, "Found %.0lf (weighted=%.1lf) hits for **%@** in %@", buf, 0x2Au);
        }
        id v37 = [v32 object];
        double v38 = [v61 mailbox];
        double v39 = [v38 URL];
        long long v40 = [v39 absoluteString];
        int v41 = [v37 isEqual:v40];

        if (v41)
        {
          id v42 = +[EDMailboxPredictionController log];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
            [(EDHeuristicsMailboxPredictor *)&v62 _orderedModePredictionForMessage:v42];
          }
        }
        else if (v36 >= v15)
        {
          [v32 setMeasure:v36];
          [v32 measure];
          double v44 = v43;
          [v57 measure];
          if (v44 <= v45) {
            goto LABEL_24;
          }
          id v42 = v57;
          __int16 v57 = v32;
        }
        else
        {
          id v42 = +[EDMailboxPredictionController log];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v56;
            double v70 = v36;
            __int16 v71 = 2048;
            double v72 = v15;
            _os_log_debug_impl(&dword_1DB39C000, v42, OS_LOG_TYPE_DEBUG, "Ignoring because weighted (%.0f) is under threshold (%.0f).", buf, 0x16u);
          }
        }
      }
LABEL_24:
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
  }
  while (v17);
LABEL_28:

  long long v49 = +[EDMailboxPredictionController log];
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v50 = [v57 object];
    [v57 measure];
    -[EDHeuristicsMailboxPredictor _weightedModePredictionsForMessage:](v50, buf, v49, v51);
  }

  if (!v57
    || ([v57 object],
        double v52 = objc_claimAutoreleasedReturnValue(),
        BOOL v53 = v52 == 0,
        v52,
        v53))
  {
    double v54 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    long long v68 = v57;
    double v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  }

  return v54;
}

- (id)_countsForField:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isEqualToString:@"conversationID"])
  {
    uint64_t v9 = [(EDHeuristicsMailboxPredictor *)self _conversationIDCountsForMessage:v8];
LABEL_9:
    uint64_t v10 = (void *)v9;
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"sender"])
  {
    uint64_t v9 = [(EDHeuristicsMailboxPredictor *)self _senderCountsForMessage:v8];
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"recipient"])
  {
    uint64_t v9 = [(EDHeuristicsMailboxPredictor *)self _recipientCountsForMessage:v8];
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"listID"])
  {
    uint64_t v9 = [(EDHeuristicsMailboxPredictor *)self _listIDCountsForMessage:v8];
    goto LABEL_9;
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"EDHeuristicsMailboxPredictor.m", 326, @"Unknown field: %@", v7 object file lineNumber description];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
LABEL_10:

  return v10;
}

- (BOOL)_limitToRecents
{
  v2 = [(EDHeuristicsMailboxPredictor *)self parameters];
  v3 = [v2 objectForKeyedSubscript:@"limitToRecentMessages"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)_adjustPredicateForRecent:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(EDHeuristicsMailboxPredictor *)self _limitToRecents])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28B98];
    uint64_t v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*MEMORY[0x1E4F5FE38]];
    id v7 = (void *)MEMORY[0x1E4F28C68];
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_midnightNdaysAgo:", 400);
    uint64_t v9 = [v7 expressionForConstantValue:v8];
    uint64_t v10 = [v5 predicateWithLeftExpression:v6 rightExpression:v9 modifier:0 type:2 options:0];

    uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
    v15[0] = v4;
    v15[1] = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    objc_msgSend(v11, "ef_andCompoundPredicateWithSubpredicates:", v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = v4;
  }

  return v13;
}

- (id)_countsForPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EDHeuristicsMailboxPredictor *)self _adjustPredicateForRecent:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F60418]);
  id v7 = (void *)[v6 initWithTargetClass:objc_opt_class() predicate:v5 sortDescriptors:MEMORY[0x1E4F1CBF0]];
  id v8 = [(EDHeuristicsMailboxPredictor *)self messagePersistence];
  uint64_t v9 = [v8 countOfMessagesMatchingQueryPerMailbox:v7];

  return v9;
}

- (id)_conversationIDCountsForMessage:(id)a3
{
  uint64_t v4 = [a3 conversationID];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F60390] predicateForMessagesInConversation:v4];
    id v6 = [(EDHeuristicsMailboxPredictor *)self _countsForPredicate:v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

- (id)_senderCountsForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 from];
  id v6 = [v5 firstObject];
  id v7 = objc_msgSend(v6, "ea_uncommentedAddress");

  if (objc_msgSend(v7, "ea_isLegalEmailAddress"))
  {
    id v8 = [MEMORY[0x1E4F60390] predicateForMessagesWithSender:v7];
    uint64_t v9 = [(EDHeuristicsMailboxPredictor *)self _countsForPredicate:v8];
  }
  else
  {
    uint64_t v10 = +[EDMailboxPredictionController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[EDHeuristicsMailboxPredictor _senderCountsForMessage:]((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

- (id)_listIDCountsForMessage:(id)a3
{
  id v4 = [a3 listIDHash];
  if (v4)
  {
    uint64_t v5 = +[EDMessageListItemPredicates predicateForMessagesWithListIDHash:v4];
    id v6 = [(EDHeuristicsMailboxPredictor *)self _countsForPredicate:v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

- (id)_recipientCountsForMessage:(id)a3
{
  id v4 = [(EDHeuristicsMailboxPredictor *)self _allowedRecipientsForMessage:a3];
  uint64_t v5 = [v4 allObjects];

  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F60390] predicateForMessagesWithRecipients:v5];
    id v7 = [(EDHeuristicsMailboxPredictor *)self _countsForPredicate:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

- (id)_userCreatedMailboxIDs
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(EDHeuristicsMailboxPredictor *)self mailboxIDCache];
  id v4 = [v3 objectForKey:@"MFUserCreatedMailboxIDs"];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v5 = [(EDHeuristicsMailboxPredictor *)self mailboxPersistence];
    id v6 = [v5 userCreatedMailboxObjectIDs];

    id v7 = +[EDMailboxPredictionController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = [v6 count];
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "Found %u user mailboxes.", buf, 8u);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "url", (void)v16);
          uint64_t v13 = [v12 absoluteString];
          [v4 addObject:v13];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    uint64_t v14 = [(EDHeuristicsMailboxPredictor *)self mailboxIDCache];
    [v14 setObject:v4 forKey:@"MFUserCreatedMailboxIDs"];
  }

  return v4;
}

- (id)_removeSpecialMailboxesInCounts:(id)a3 message:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v6 = [a4 mailbox];
  id v7 = [v6 URL];
  id v8 = [v7 absoluteString];

  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v26;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v15 = [(EDHeuristicsMailboxPredictor *)self _userCreatedMailboxIDs];
        char v16 = [v15 containsObject:v14];

        if ((v16 & 1) == 0 || v8 && [v8 isEqualToString:v14]) {
          [v9 addObject:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  if ([v9 count])
  {
    long long v17 = +[EDMailboxPredictionController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[EDHeuristicsMailboxPredictor _removeSpecialMailboxesInCounts:message:]((uint64_t)v9, v17, v18, v19, v20, v21, v22, v23);
    }

    id v24 = (id)[v10 mutableCopy];
    [v24 removeObjectsForKeys:v9];
  }
  else
  {
    id v24 = v10;
  }

  return v24;
}

- (id)_topHitFromMailboxDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F60DA8] object:0 withMeasure:0.0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__EDHeuristicsMailboxPredictor__topHitFromMailboxDictionary___block_invoke;
  v7[3] = &unk_1E6C01410;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __61__EDHeuristicsMailboxPredictor__topHitFromMailboxDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  [v5 doubleValue];
  double v7 = v6;
  [*(id *)(a1 + 32) measure];
  if (v7 > v8)
  {
    [*(id *)(a1 + 32) setMeasure:v7];
    [*(id *)(a1 + 32) setObject:v9];
  }
}

- (id)_topHitFromMailboxDictionary:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(EDHeuristicsMailboxPredictor *)self parameters];
  id v9 = [v8 objectForKeyedSubscript:@"confusionThreshold"];

  id v10 = [(EDHeuristicsMailboxPredictor *)self _removeSpecialMailboxesInCounts:v6 message:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 doubleValue];
    -[EDHeuristicsMailboxPredictor _normalizedTermFrequencyTopHitFromDictionary:withThreshold:](self, "_normalizedTermFrequencyTopHitFromDictionary:withThreshold:", v10);
  }
  else
  {
    [(EDHeuristicsMailboxPredictor *)self _topHitFromMailboxDictionary:v10];
  uint64_t v11 = };

  return v11;
}

- (id)_objectWithMeasure:(double)a3 timesHigherThanFollowUpInMeasures:(id)a4
{
  id v5 = a4;
  if ([v5 count] == 1)
  {
    id v6 = [v5 firstObject];
  }
  else if ((unint64_t)[v5 count] < 2)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [v5 sortedArrayUsingSelector:sel_compare_];
    double v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 2);
    [v8 measure];
    double v10 = v9;

    uint64_t v11 = [v7 lastObject];
    [v11 measure];
    double v13 = v12;

    if (v13 <= v10 * a3)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [v7 lastObject];
    }
  }

  return v6;
}

- (id)_normalizedTermFrequencyTopHitFromDictionary:(id)a3 withThreshold:(double)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v6 = -[EDHeuristicsMailboxPredictor _topHitFromMailboxDictionary:](self, "_topHitFromMailboxDictionary:");
  id v7 = v6;
  if (v6)
  {
    [v6 measure];
    double v9 = v8;
    double v10 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v26;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          char v16 = [v11 objectForKeyedSubscript:v15];
          [v16 doubleValue];
          double v18 = v17;

          uint64_t v19 = [MEMORY[0x1E4F60DA8] object:v15 withMeasure:v18 / v9];
          [v10 addObject:v19];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    uint64_t v20 = [(EDHeuristicsMailboxPredictor *)self _objectWithMeasure:v10 timesHigherThanFollowUpInMeasures:a4];
    uint64_t v21 = v20;
    if (v20)
    {
      uint64_t v22 = [v20 object];
      uint64_t v23 = [v11 objectForKeyedSubscript:v22];
      [v23 doubleValue];
      objc_msgSend(v21, "setMeasure:");

      id v24 = v21;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (BOOL)_isAllowedRecipient:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "ea_isLegalEmailAddress"))
  {
    id v5 = [(EDHeuristicsMailboxPredictor *)self parameters];
    id v6 = [v5 objectForKeyedSubscript:@"ignoreUserAddresses"];
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      double v8 = [(EDHeuristicsMailboxPredictor *)self userProfileProvider];
      double v9 = [v8 allEmailAddresses];
      LODWORD(self) = [v9 containsObject:v4] ^ 1;
    }
    else
    {
      LOBYTE(self) = 1;
    }
  }
  else
  {
    self = +[EDMailboxPredictionController log];
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEBUG)) {
      -[EDHeuristicsMailboxPredictor _isAllowedRecipient:]((uint64_t)v4, &self->super, v10, v11, v12, v13, v14, v15);
    }

    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (id)_allowedRecipientsForMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = [v4 to];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "ea_uncommentedAddress");
        uint64_t v11 = [v10 lowercaseString];

        if (v11 && [(EDHeuristicsMailboxPredictor *)self _isAllowedRecipient:v11]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = objc_msgSend(v4, "cc", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        char v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "ea_uncommentedAddress");
        double v17 = [v16 lowercaseString];

        if (v17 && [(EDHeuristicsMailboxPredictor *)self _isAllowedRecipient:v17]) {
          [v5 addObject:v17];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }

  if ([v5 count]) {
    id v18 = v5;
  }
  else {
    id v18 = 0;
  }

  return v18;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (void)setUserProfileProvider:(id)a3
{
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (void)setMailboxPersistence:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSCache)mailboxIDCache
{
  return self->_mailboxIDCache;
}

- (void)setMailboxIDCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxIDCache, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_userProfileProvider, 0);
}

- (void)predictMailboxIDsForMessages:(os_log_t)log limit:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Best mailbox: %@", buf, 0xCu);
}

- (void)predictMailboxIDsForMessages:(os_log_t)log limit:.cold.2(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Aggregated %u mailboxes.", buf, 8u);
}

- (void)_orderedModePredictionForMessage:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Ignoring because it is the message's current mailbox.", buf, 2u);
}

- (void)_orderedModePredictionForMessage:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_summedWeightedPredictionsForMessage:(uint64_t)a3 limit:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_weightedModePredictionsForMessage:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log, double a4)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Winner: %@ (weighted=%.1lf)", buf, 0x16u);
}

- (void)_weightedModePredictionsForMessage:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_senderCountsForMessage:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_removeSpecialMailboxesInCounts:(uint64_t)a3 message:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_isAllowedRecipient:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end