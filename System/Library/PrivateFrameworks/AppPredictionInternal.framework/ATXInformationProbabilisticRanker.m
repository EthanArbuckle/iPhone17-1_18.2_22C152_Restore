@interface ATXInformationProbabilisticRanker
- (double)_standardUniformDistribution;
- (double)_tieBreakingScoreForSuggestion:(id)a3;
- (id)_groupSuggestionsByConfidenceLevel:(id)a3;
- (id)_rankNumbersProbabilistically:(id)a3;
- (id)_rankSuggestionsProbabilistically:(id)a3;
- (id)_smooth:(id)a3;
- (id)_tieBreakingScoresForSuggestions:(id)a3;
- (id)sortFeaturizedSuggestions:(id)a3 withFeatureWeights:(id)a4;
@end

@implementation ATXInformationProbabilisticRanker

- (id)sortFeaturizedSuggestions:(id)a3 withFeatureWeights:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v65 = a4;
  v7 = __atxlog_handle_gi();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)v85 = "-[ATXInformationProbabilisticRanker sortFeaturizedSuggestions:withFeatureWeights:]";
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "ATXInformationProbabilisticRanker %s", buf, 0xCu);
  }

  context = (void *)MEMORY[0x1D25F6CC0]();
  v8 = [(ATXInformationProbabilisticRanker *)self _groupSuggestionsByConfidenceLevel:v6];
  v64 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:19];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v60 = v8;
  v9 = [v8 objectForKeyedSubscript:&unk_1F27F0BD0];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v79 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v78 + 1) + 8 * i) suggestion];
        [v14 setClientModelId:v64];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v78 objects:v88 count:16];
    }
    while (v11);
  }

  v57 = v6;
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = [v60 allKeys];
  v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
  v87 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  v19 = [v16 sortedArrayUsingDescriptors:v18];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = v19;
  uint64_t v61 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v75;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v75 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v74 + 1) + 8 * v20);
        v22 = [v60 objectForKeyedSubscript:v21];
        uint64_t v62 = v20;
        if ((unint64_t)[v22 count] >= 2)
        {
          v23 = __atxlog_handle_gi();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = [v22 count];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v85 = v24;
            *(_WORD *)&v85[4] = 2112;
            *(void *)&v85[6] = v21;
            _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "ATXInformationProbabilisticRanker: %d candidates at the same level %@. Rank probabilistically.", buf, 0x12u);
          }

          uint64_t v25 = [(ATXInformationProbabilisticRanker *)self _rankSuggestionsProbabilistically:v22];

          v22 = (void *)v25;
        }
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v26 = v22;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v70 objects:v83 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v71;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v71 != v29) {
                objc_enumerationMutation(v26);
              }
              v31 = *(void **)(*((void *)&v70 + 1) + 8 * j);
              [v31 scoreWithFeatureWeights:v65];
              double v33 = v32;
              [(ATXInformationProbabilisticRanker *)self _tieBreakingScoreForSuggestion:v31];
              double v35 = v33 + v34;
              v36 = [ATXScoredInfoSuggestion alloc];
              v37 = [v31 suggestion];
              v38 = [v31 featureSet];
              v39 = [(ATXScoredInfoSuggestion *)v36 initWithSuggestion:v37 featureSet:v38 score:v35];
              [v15 addObject:v39];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v70 objects:v83 count:16];
          }
          while (v28);
        }

        uint64_t v20 = v62 + 1;
      }
      while (v62 + 1 != v61);
      uint64_t v61 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
    }
    while (v61);
  }

  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v63 = objc_opt_new();
  v41 = objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v42 = v15;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v66 objects:v82 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v67 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v66 + 1) + 8 * k);
        v48 = [v47 suggestion];
        v49 = [v48 clientModelId];
        int v50 = [v49 isEqualToString:v64];

        v51 = v40;
        if (v50)
        {
          v52 = [v47 suggestion];
          uint64_t v53 = [v52 confidenceLevel];

          if (v53 == 1) {
            v51 = v63;
          }
          else {
            v51 = v41;
          }
        }
        [v51 addObject:v47];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v66 objects:v82 count:16];
    }
    while (v44);
  }

  v54 = [v41 sortedArrayUsingComparator:&__block_literal_global_32];
  [v40 addObjectsFromArray:v54];

  [v40 addObjectsFromArray:v63];

  return v40;
}

uint64_t __82__ATXInformationProbabilisticRanker_sortFeaturizedSuggestions_withFeatureWeights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 suggestion];
  id v6 = [v5 startDate];
  v7 = [v4 suggestion];

  v8 = [v7 startDate];
  [v6 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 > 0.0) {
    return -1;
  }
  else {
    return v10 < 0.0;
  }
}

- (id)_groupSuggestionsByConfidenceLevel:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = NSNumber;
        uint64_t v12 = objc_msgSend(v10, "featureSet", (void)v18);
        [v12 valueForFeature:4];
        LODWORD(v14) = llround(v13);
        v15 = [v11 numberWithInt:v14];

        v16 = [v4 objectForKeyedSubscript:v15];
        if (!v16)
        {
          v16 = objc_opt_new();
          [v4 setObject:v16 forKeyedSubscript:v15];
        }
        [v16 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_rankSuggestionsProbabilistically:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v6 = [(ATXInformationProbabilisticRanker *)self _tieBreakingScoresForSuggestions:v4];
  uint64_t v7 = [(ATXInformationProbabilisticRanker *)self _rankNumbersProbabilistically:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
          double v13 = objc_msgSend(v4, "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "intValue"));
          [v5 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }

  return v5;
}

- (id)_tieBreakingScoresForSuggestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        uint64_t v11 = NSNumber;
        -[ATXInformationProbabilisticRanker _tieBreakingScoreForSuggestion:](self, "_tieBreakingScoreForSuggestion:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  double v13 = [(ATXInformationProbabilisticRanker *)self _smooth:v5];

  return v13;
}

- (double)_tieBreakingScoreForSuggestion:(id)a3
{
  id v3 = [a3 featureSet];
  [v3 valueForFeature:2];
  double v5 = v4;

  return v5 + 0.00001;
}

- (id)_smooth:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v29;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) doubleValue];
          double v8 = v8 + v10;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    unint64_t v12 = [v4 count];
    id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v4;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      double v16 = v8 / (double)v12;
      uint64_t v17 = *(void *)v25;
      double v18 = v8 + v8;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = NSNumber;
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "doubleValue", (void)v24);
          v22 = [v20 numberWithDouble:(v16 + v21) / v18];
          [v11 addObject:v22];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v15);
    }
  }
  else
  {
    id v11 = v3;
  }

  return v11;
}

- (id)_rankNumbersProbabilistically:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForKeyPath:@"@sum.self"];
  [v5 doubleValue];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    double v33 = __atxlog_handle_gi();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      -[ATXInformationProbabilisticRanker _rankNumbersProbabilistically:](v33, v7);
    }

    unint64_t v12 = 0;
  }
  else
  {
    int v8 = [v4 count];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    if (v8 >= 1)
    {
      uint64_t v10 = 0;
      do
      {
        id v11 = [NSNumber numberWithInt:v10];
        [v9 addObject:v11];

        uint64_t v10 = (v10 + 1);
      }
      while (v8 != v10);
    }
    unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    if (v8 > 1)
    {
      int v13 = 0;
      int v14 = v8 - 2;
      do
      {
        [(ATXInformationProbabilisticRanker *)self _standardUniformDistribution];
        double v16 = v15;
        int v17 = [v9 count];
        if (v17 < 2)
        {
          LODWORD(v21) = 0;
        }
        else
        {
          uint64_t v19 = 0;
          double v20 = v7 * v16;
          uint64_t v21 = (v17 - 1);
          double v18 = 0.0;
          while (1)
          {
            double v22 = v18;
            uint64_t v23 = [v9 objectAtIndexedSubscript:v19];
            long long v24 = objc_msgSend(v4, "objectAtIndexedSubscript:", (int)objc_msgSend(v23, "intValue"));
            [v24 doubleValue];
            double v26 = v25;

            double v18 = v22 + v26;
            if (v20 >= v22 && v20 < v18) {
              break;
            }
            if (v21 == ++v19) {
              goto LABEL_15;
            }
          }
          LODWORD(v21) = v19;
        }
LABEL_15:
        long long v27 = objc_msgSend(v9, "objectAtIndexedSubscript:", v21, v18);
        [v12 addObject:v27];

        long long v28 = [v9 objectAtIndexedSubscript:v21];
        long long v29 = objc_msgSend(v4, "objectAtIndexedSubscript:", (int)objc_msgSend(v28, "intValue"));
        [v29 doubleValue];
        double v7 = v7 - v30;

        [v9 removeObjectAtIndex:v21];
      }
      while (v13++ != v14);
    }
    if ([v9 count] != 1) {
      -[ATXInformationProbabilisticRanker _rankNumbersProbabilistically:]();
    }
    double v32 = [v9 firstObject];
    [v12 addObject:v32];
  }
  return v12;
}

- (double)_standardUniformDistribution
{
  return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0;
}

- (void)_rankNumbersProbabilistically:.cold.1()
{
  __assert_rtn("-[ATXInformationProbabilisticRanker _rankNumbersProbabilistically:]", "ATXInformationRanker.m", 245, "indices.count == 1");
}

- (void)_rankNumbersProbabilistically:(os_log_t)log .cold.2(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[ATXInformationProbabilisticRanker _rankNumbersProbabilistically:]";
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXInformationProbabilisticRanker %s: sum of nums == %lf <= 0 is invalid", (uint8_t *)&v2, 0x16u);
}

@end