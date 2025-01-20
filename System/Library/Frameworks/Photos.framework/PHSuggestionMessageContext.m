@interface PHSuggestionMessageContext
- (NSArray)cnParticipants;
- (NSArray)messageTokens;
- (NSArray)messages;
- (NSArray)phParticipants;
- (NSArray)resolvedParticipants;
- (NSDateInterval)dateInterval;
- (NSMutableDictionary)suggestionMatchingResultsBySuggestionIdentifier;
- (PHPhotoLibrary)photoLibrary;
- (PHSuggestionMessageContext)initWithMessages:(id)a3;
- (PHSuggestionMessageContext)initWithMessages:(id)a3 participantsFromContacts:(id)a4 photoLibrary:(id)a5;
- (PHSuggestionMessageContext)initWithMessages:(id)a3 participantsFromPersons:(id)a4 photoLibrary:(id)a5;
- (id)_mostRecentSuggestionFromSuggestions:(id)a3;
- (id)_suggestionsMatchingType:(int64_t)a3;
- (id)confidentMatchSuggestionUsingStrategy:(unint64_t)a3;
- (id)description;
- (id)detailedDescription;
- (id)matchingResultWithSuggestion:(id)a3;
- (unint64_t)numberOfParticipants;
- (void)matchWithSuggestions:(id)a3;
- (void)setCnParticipants:(id)a3;
- (void)setMessageTokens:(id)a3;
- (void)setPhParticipants:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setResolvedParticipants:(id)a3;
@end

@implementation PHSuggestionMessageContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_suggestionMatchingResultsBySuggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_phParticipants, 0);
  objc_storeStrong((id *)&self->_cnParticipants, 0);
  objc_storeStrong((id *)&self->_messageTokens, 0);
  objc_storeStrong((id *)&self->_resolvedParticipants, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_messages, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSMutableDictionary)suggestionMatchingResultsBySuggestionIdentifier
{
  return self->_suggestionMatchingResultsBySuggestionIdentifier;
}

- (NSArray)phParticipants
{
  return self->_phParticipants;
}

- (NSArray)cnParticipants
{
  return self->_cnParticipants;
}

- (unint64_t)numberOfParticipants
{
  return self->_numberOfParticipants;
}

- (void)setMessageTokens:(id)a3
{
}

- (void)setResolvedParticipants:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)messages
{
  return self->_messages;
}

- (id)_mostRecentSuggestionFromSuggestions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 anyObject];
  v5 = [v4 startDate];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "startDate", (void)v16);
        if ([v12 compare:v5] >= 1)
        {
          id v13 = v12;

          id v14 = v11;
          v5 = v13;
          v4 = v14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)confidentMatchSuggestionUsingStrategy:(unint64_t)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  v5 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PHSuggestionMessageContext *)self suggestionMatchingResultsBySuggestionIdentifier];
    uint64_t v7 = [v6 count];
    unint64_t v8 = [(PHSuggestionMessageContext *)self numberOfParticipants];
    uint64_t v9 = [(PHSuggestionMessageContext *)self messages];
    *(_DWORD *)buf = 134218752;
    unint64_t v101 = a3;
    __int16 v102 = 2048;
    double v103 = *(double *)&v7;
    __int16 v104 = 2048;
    unint64_t v105 = v8;
    __int16 v106 = 1024;
    BOOL v107 = [v9 count] != 0;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: Searching confident match suggestion using strategy %lu among %lu suggestions using message context (%lu participants, message string available: %d)", buf, 0x26u);
  }
  if (![(NSMutableDictionary *)self->_suggestionMatchingResultsBySuggestionIdentifier count])
  {
    v27 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: Error no suggestions are found", buf, 2u);
    }
    id v26 = 0;
    goto LABEL_90;
  }
  v10 = [(NSMutableDictionary *)self->_suggestionMatchingResultsBySuggestionIdentifier allValues];
  v11 = [(PHSuggestionMessageContext *)self dateInterval];

  v12 = [MEMORY[0x1E4F1CA80] set];
  id v13 = [MEMORY[0x1E4F1CA80] set];
  v76 = v11;
  v78 = self;
  v79 = v10;
  if (v11)
  {
    id v14 = [MEMORY[0x1E4F1CA80] set];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v93 objects:v99 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v94 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          [v20 scoreForSuggestionMatchingType:3];
          if (v21 > 0.0)
          {
            [v14 addObject:v20];
            v22 = [v20 suggestion];
            [v12 addObject:v22];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v93 objects:v99 count:16];
      }
      while (v17);
    }

    uint64_t v23 = [v14 count];
    if (!(a3 | v23))
    {
      v24 = PLPhotoKitGetLog();
      id v25 = v13;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: No result - NLP Date range is found and no suggestion is matching it", buf, 2u);
      }
      id v26 = 0;
      v27 = v79;
      goto LABEL_89;
    }
    id v25 = v13;
    if (v23)
    {
      v27 = v79;
      if (v23 == 1)
      {
        v28 = [v14 anyObject];
        id v26 = [v28 suggestion];

        v24 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [v26 localIdentifier];
          *(_DWORD *)buf = 138412290;
          unint64_t v101 = (unint64_t)v29;
          _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - unique suggestion matching NLP Date Range", buf, 0xCu);
        }
        goto LABEL_89;
      }
      [v13 unionSet:v14];
      v30 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = [v14 count];
        *(_DWORD *)buf = 134217984;
        unint64_t v101 = v31;
        _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: filtering out the candidate set to the %lu suggestions matching NLP Date Range", buf, 0xCu);
      }
    }
  }
  else
  {
    id v25 = [v10 mutableCopy];
    id v14 = v13;
  }
  v77 = v12;

  v32 = [MEMORY[0x1E4F1CA80] set];
  v84 = [MEMORY[0x1E4F1CA80] set];
  v83 = [MEMORY[0x1E4F1CA80] set];
  v82 = [MEMORY[0x1E4F1CA48] array];
  v81 = [MEMORY[0x1E4F1CA48] array];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v25 = v25;
  uint64_t v33 = [v25 countByEnumeratingWithState:&v89 objects:v98 count:16];
  id v80 = v25;
  if (!v33)
  {
    id v14 = 0;
    double v37 = 0.0;
    goto LABEL_50;
  }
  uint64_t v34 = v33;
  id v14 = 0;
  uint64_t v35 = *(void *)v90;
  double v36 = 0.0;
  double v37 = 0.0;
  do
  {
    for (uint64_t j = 0; j != v34; ++j)
    {
      if (*(void *)v90 != v35) {
        objc_enumerationMutation(v25);
      }
      v39 = *(void **)(*((void *)&v89 + 1) + 8 * j);
      v40 = [v39 suggestion];
      [v39 scoreForSuggestionMatchingType:2];
      if (v41 > 0.0)
      {
        double v42 = v41;
        v43 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = [v40 localIdentifier];
          *(_DWORD *)buf = 138412546;
          unint64_t v101 = (unint64_t)v44;
          __int16 v102 = 2048;
          double v103 = v42;
          _os_log_impl(&dword_19B043000, v43, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: suggestion %@ matching nlp context with score %f", buf, 0x16u);

          id v25 = v80;
        }

        v45 = [NSNumber numberWithDouble:v42];
        [v82 addObject:v45];

        [v84 addObject:v40];
        if (v42 > v37)
        {
          id v46 = v40;

          id v14 = v46;
          double v37 = v42;
        }
      }
      [v39 scoreForSuggestionMatchingType:1];
      if (v47 > 0.0)
      {
        double v48 = v47;
        v49 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = [v40 localIdentifier];
          *(_DWORD *)buf = 138412546;
          unint64_t v101 = (unint64_t)v50;
          __int16 v102 = 2048;
          double v103 = v48;
          _os_log_impl(&dword_19B043000, v49, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: suggestion %@ matching participant with score %f", buf, 0x16u);
        }
        v51 = [NSNumber numberWithDouble:v48];
        [v81 addObject:v51];

        [v83 addObject:v40];
        if (v48 <= v36)
        {
          if (v48 != v36) {
            goto LABEL_46;
          }
        }
        else
        {
          [v32 removeAllObjects];
          double v36 = v48;
        }
        [v32 addObject:v40];
      }
LABEL_46:
    }
    uint64_t v34 = [v25 countByEnumeratingWithState:&v89 objects:v98 count:16];
  }
  while (v34);
LABEL_50:

  uint64_t v52 = [v84 count];
  v12 = v77;
  if (!v52)
  {
    uint64_t v57 = [v83 count];
    v24 = v32;
    if (v57)
    {
      if (v57 == 1)
      {
        id v26 = [v83 anyObject];
        v54 = PLPhotoKitGetLog();
        v27 = v79;
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_87;
        }
        v55 = [v14 localIdentifier];
        *(_DWORD *)buf = 138412290;
        unint64_t v101 = (unint64_t)v55;
        v56 = "Message sharing suggestion: found a matching suggestion (%@) - unique suggestion matching participants";
      }
      else
      {
        v27 = v79;
        if ([(PHSuggestionMessageContext *)v78 numberOfParticipants] >= 2)
        {
          uint64_t v69 = [v32 count];
          v70 = PLPhotoKitGetLog();
          BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
          if (v69 == 1)
          {
            if (v71)
            {
              v72 = [v14 localIdentifier];
              *(_DWORD *)buf = 138412290;
              unint64_t v101 = (unint64_t)v72;
              _os_log_impl(&dword_19B043000, v70, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - suggestion that matches the most participants in the group thread", buf, 0xCu);
            }
            uint64_t v73 = [v32 anyObject];
          }
          else
          {
            if (v71)
            {
              v75 = [v14 localIdentifier];
              *(_DWORD *)buf = 138412290;
              unint64_t v101 = (unint64_t)v75;
              _os_log_impl(&dword_19B043000, v70, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - suggestion that matches the most participants in the group thread and is the most recent", buf, 0xCu);
            }
            uint64_t v73 = [(PHSuggestionMessageContext *)v78 _mostRecentSuggestionFromSuggestions:v32];
          }
          id v26 = (id)v73;
          goto LABEL_88;
        }
        id v26 = [(PHSuggestionMessageContext *)v78 _mostRecentSuggestionFromSuggestions:v83];
        v54 = PLPhotoKitGetLog();
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_87;
        }
        v55 = [v26 localIdentifier];
        *(_DWORD *)buf = 138412290;
        unint64_t v101 = (unint64_t)v55;
        v56 = "Message sharing suggestion: found a matching suggestion (%@) - most recent suggestion matching participants";
      }
    }
    else
    {
      v27 = v79;
      if (!v76)
      {
        id v26 = 0;
        goto LABEL_88;
      }
      id v26 = [(PHSuggestionMessageContext *)v78 _mostRecentSuggestionFromSuggestions:v77];
      v54 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_87;
      }
      v55 = [v26 localIdentifier];
      *(_DWORD *)buf = 138412290;
      unint64_t v101 = (unint64_t)v55;
      v56 = "Message sharing suggestion: found several matching suggestions matching NLP Date Range - returning the most recent one %@";
    }
LABEL_86:
    _os_log_impl(&dword_19B043000, v54, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);

    goto LABEL_87;
  }
  uint64_t v53 = v52;
  if (v52 == 1)
  {
    id v26 = [v84 anyObject];
    v54 = PLPhotoKitGetLog();
    v27 = v79;
    v24 = v32;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = [v14 localIdentifier];
      *(_DWORD *)buf = 138412290;
      unint64_t v101 = (unint64_t)v55;
      v56 = "Message sharing suggestion: found a matching suggestion (%@) - unique suggestion matching NLP Context";
      goto LABEL_86;
    }
LABEL_87:
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v58 = v82;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v85 objects:v97 count:16];
    v27 = v79;
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = 0;
      uint64_t v62 = *(void *)v86;
      while (2)
      {
        for (uint64_t k = 0; k != v60; ++k)
        {
          if (*(void *)v86 != v62) {
            objc_enumerationMutation(v58);
          }
          [*(id *)(*((void *)&v85 + 1) + 8 * k) doubleValue];
          if (v64 == v37)
          {
            if (v61) {
              goto LABEL_72;
            }
            uint64_t v61 = 1;
          }
          else if (v37 < v64 + v64)
          {
LABEL_72:

            id v26 = [(PHSuggestionMessageContext *)v78 _mostRecentSuggestionFromSuggestions:v84];
            v67 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              v68 = [v26 localIdentifier];
              *(_DWORD *)buf = 138412546;
              unint64_t v101 = (unint64_t)v68;
              __int16 v102 = 2048;
              double v103 = *(double *)&v53;
              _os_log_impl(&dword_19B043000, v67, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - most recent suggestion among the %lu suggestions matching NLP context", buf, 0x16u);
            }
            goto LABEL_75;
          }
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v85 objects:v97 count:16];
        if (v60) {
          continue;
        }
        break;
      }
    }

    v65 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = [v14 localIdentifier];
      *(_DWORD *)buf = 138412546;
      unint64_t v101 = (unint64_t)v66;
      __int16 v102 = 2048;
      double v103 = *(double *)&v53;
      _os_log_impl(&dword_19B043000, v65, OS_LOG_TYPE_DEFAULT, "Message sharing suggestion: found a matching suggestion (%@) - outlier high score among %lu suggestions matching NLP context", buf, 0x16u);
    }
    id v26 = v14;
LABEL_75:
    id v25 = v80;
    v24 = v32;
  }
LABEL_88:

LABEL_89:
LABEL_90:

  return v26;
}

- (id)matchingResultWithSuggestion:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v61 = [[PHSuggestionMessageMatchingResult alloc] initWithSuggestion:v4 messageContext:self];
  v5 = self->_dateInterval;
  if (v5)
  {
    id v6 = [v4 startDate];
    uint64_t v7 = [v4 endDate];
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 endDate:v7];
    if ([(NSDateInterval *)v5 intersectsDateInterval:v8]) {
      [(PHSuggestionMessageMatchingResult *)v61 registerMatchingType:3 weight:1.0];
    }
  }
  uint64_t v9 = [v4 featuresProperties];
  v10 = [v9 objectForKeyedSubscript:@"features"];
  if ([v10 count])
  {
    uint64_t v60 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v59 = objc_opt_new();
    unint64_t numberOfParticipants = self->_numberOfParticipants;
    if (numberOfParticipants | [(NSArray *)self->_messages count])
    {
      uint64_t v62 = self;
      v55 = v9;
      v56 = v5;
      id v57 = v4;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      v54 = v10;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v77 objects:v88 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v78 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = +[PHTextFeature textFeatureWithData:*(void *)(*((void *)&v77 + 1) + 8 * i)];
            if (!v17)
            {
              uint64_t v18 = PLPhotoKitGetLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v84 = v4;
                _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "Failure reading text features from data for suggestion %@", buf, 0xCu);
              }
              goto LABEL_18;
            }
            [v60 addObject:v17];
            if (numberOfParticipants && [v17 type] == 1)
            {
              uint64_t v18 = [v17 string];
              [v59 addObject:v18];
LABEL_18:
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v77 objects:v88 count:16];
        }
        while (v14);
      }

      if (numberOfParticipants && [v59 count])
      {
        long long v19 = [(PHSuggestionMessageContext *)v62 resolvedParticipants];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v73 objects:v87 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v74;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v74 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v73 + 1) + 8 * j);
              id v25 = [v24 localIdentifier];
              id v26 = [v25 lowercaseString];
              int v27 = [v59 containsObject:v26];

              if (v27)
              {
                v28 = PLPhotoKitGetLog();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  v29 = [v24 localIdentifier];
                  v30 = [v4 localIdentifier];
                  *(_DWORD *)buf = 138412546;
                  id v84 = v29;
                  __int16 v85 = 2112;
                  long long v86 = v30;
                  _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEFAULT, "PHSuggestionMessageContext: Matched participant %@ between message context and suggestion %@", buf, 0x16u);
                }
                [(PHSuggestionMessageMatchingResult *)v61 registerMatchingType:1 weight:1.0];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v73 objects:v87 count:16];
          }
          while (v21);
        }
      }
      uint64_t v31 = [(PHSuggestionMessageContext *)v62 messageTokens];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      obuint64_t j = v60;
      uint64_t v64 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
      if (v64)
      {
        uint64_t v63 = *(void *)v70;
        do
        {
          for (uint64_t k = 0; k != v64; ++k)
          {
            if (*(void *)v70 != v63) {
              objc_enumerationMutation(obj);
            }
            uint64_t v33 = [*(id *)(*((void *)&v69 + 1) + 8 * k) string];
            uint64_t v34 = [v33 componentsSeparatedByString:@"_"];
            uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v36 = v34;
            uint64_t v37 = [v36 countByEnumeratingWithState:&v65 objects:v81 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              unint64_t v39 = 0;
              uint64_t v40 = *(void *)v66;
              do
              {
                for (uint64_t m = 0; m != v38; ++m)
                {
                  if (*(void *)v66 != v40) {
                    objc_enumerationMutation(v36);
                  }
                  double v42 = *(void **)(*((void *)&v65 + 1) + 8 * m);
                  if ([v31 containsObject:v42])
                  {
                    [v35 addObject:v42];
                    unint64_t v43 = [v42 length];
                    if (v43 > v39) {
                      unint64_t v39 = v43;
                    }
                  }
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v65 objects:v81 count:16];
              }
              while (v38);
            }
            else
            {
              unint64_t v39 = 0;
            }

            uint64_t v44 = [v35 count];
            if (v44)
            {
              unint64_t v45 = v44;
              uint64_t v46 = [v36 count];
              if (v45 == v46)
              {
                double v47 = PLPhotoKitGetLog();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  double v48 = [v35 componentsJoinedByString:@", "];
                  *(_DWORD *)buf = 138412546;
                  id v84 = v48;
                  __int16 v85 = 2112;
                  long long v86 = v33;
                  _os_log_impl(&dword_19B043000, v47, OS_LOG_TYPE_DEFAULT, "PHSuggestionMessageContext: Matched message tokens [%@] between message context and suggestion text feature %@", buf, 0x16u);
                }
                double v49 = 1.0;
              }
              else
              {
                if (v39 < 4) {
                  goto LABEL_62;
                }
                unint64_t v50 = v46;
                v51 = PLPhotoKitGetLog();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v52 = [v35 componentsJoinedByString:@", "];
                  *(_DWORD *)buf = 138412546;
                  id v84 = v52;
                  __int16 v85 = 2112;
                  long long v86 = v33;
                  _os_log_impl(&dword_19B043000, v51, OS_LOG_TYPE_DEFAULT, "PHSuggestionMessageContext: Matched message tokens [%@] between message context and suggestion text feature %@", buf, 0x16u);
                }
                double v49 = (double)v45 / (double)v50;
              }
              [(PHSuggestionMessageMatchingResult *)v61 registerMatchingType:2 weight:v49];
            }
LABEL_62:
          }
          uint64_t v64 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
        }
        while (v64);
      }

      id v4 = v57;
      uint64_t v9 = v55;
      v5 = v56;
      v10 = v54;
    }
  }

  return v61;
}

- (void)matchWithSuggestions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self->_suggestionMatchingResultsBySuggestionIdentifier;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  suggestionMatchingResultsBySuggestionIdentifier = self->_suggestionMatchingResultsBySuggestionIdentifier;
  self->_suggestionMatchingResultsBySuggestionIdentifier = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "localIdentifier", (void)v17);
        uint64_t v15 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v14];
        if (v15)
        {
          [(NSMutableDictionary *)self->_suggestionMatchingResultsBySuggestionIdentifier setObject:v15 forKeyedSubscript:v14];
        }
        else
        {
          uint64_t v16 = [(PHSuggestionMessageContext *)self matchingResultWithSuggestion:v13];
          [(NSMutableDictionary *)self->_suggestionMatchingResultsBySuggestionIdentifier setObject:v16 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (id)_suggestionsMatchingType:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [(NSMutableDictionary *)self->_suggestionMatchingResultsBySuggestionIdentifier allValues];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
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
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v11 scoreForSuggestionMatchingType:a3];
        if (v12 != 0.0)
        {
          uint64_t v13 = [v11 suggestion];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)detailedDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = [(PHSuggestionMessageContext *)self _suggestionsMatchingType:3];
  uint64_t v21 = [(PHSuggestionMessageContext *)self _suggestionsMatchingType:2];
  uint64_t v20 = [(PHSuggestionMessageContext *)self _suggestionsMatchingType:1];
  id v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%lu", -[PHSuggestionMessageContext numberOfParticipants](self, "numberOfParticipants"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(PHSuggestionMessageContext *)self resolvedParticipants];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [v9 localIdentifier];
        uint64_t v11 = [v9 name];
        [v3 appendFormat:@" %@ (%@)", v11, v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  long long v19 = NSString;
  double v12 = [(NSArray *)self->_messages componentsJoinedByString:@", "];
  dateInterval = self->_dateInterval;
  if (!dateInterval) {
    dateInterval = (NSDateInterval *)@"None";
  }
  long long v18 = dateInterval;
  uint64_t v14 = [(PHSuggestionMessageContext *)self messageTokens];
  long long v15 = [v14 componentsJoinedByString:@" "];
  long long v16 = [v19 stringWithFormat:@"Message Context:\n\tParticipants: %@\n\tMessages: %@\n\tTime constraint: %@\n\tTokens:%@\n\tSuggestions: %lu\n\tSuggestions matching time constraints: %lu\n\tSuggestions matching message: %lu\n\tSuggestions matching participants: %lu", v3, v12, v18, v15, self->_suggestionMatchingResultsBySuggestionIdentifier, objc_msgSend(v22, "count"), objc_msgSend(v21, "count"), objc_msgSend(v20, "count")];

  return v16;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PHSuggestionMessageContext;
  id v4 = [(PHSuggestionMessageContext *)&v9 description];
  unint64_t v5 = [(PHSuggestionMessageContext *)self numberOfParticipants];
  uint64_t v6 = [(NSArray *)self->_messages componentsJoinedByString:@" "];
  uint64_t v7 = [v3 stringWithFormat:@"%@ Participants=%lu, messages=%@", v4, v5, v6];

  return v7;
}

- (NSArray)messageTokens
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  messageTokens = self->_messageTokens;
  if (!messageTokens)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v5 = self->_messages;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)MEMORY[0x1E4F8A9D0];
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v9), "lowercaseString", (void)v16);
          double v12 = [v10 tokensFromString:v11 options:14];

          [v4 addObjectsFromArray:v12];
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];
    uint64_t v14 = self->_messageTokens;
    self->_messageTokens = v13;

    messageTokens = self->_messageTokens;
  }

  return messageTokens;
}

- (NSArray)resolvedParticipants
{
  resolvedParticipants = self->_resolvedParticipants;
  if (!resolvedParticipants)
  {
    if ([(NSArray *)self->_phParticipants count])
    {
      id v4 = [MEMORY[0x1E4F1C978] arrayWithArray:self->_phParticipants];
      unint64_t v5 = self->_resolvedParticipants;
      self->_resolvedParticipants = v4;
    }
    else
    {
      if ([(NSArray *)self->_cnParticipants count])
      {
        cnParticipants = self->_cnParticipants;
        uint64_t v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
        uint64_t v8 = +[PHPerson fetchPersonsForContacts:cnParticipants options:v7];
      }
      else
      {
        uint64_t v9 = [PHManualFetchResult alloc];
        photoLibrary = self->_photoLibrary;
        uint64_t v7 = +[PHPerson fetchType];
        uint64_t v8 = [(PHManualFetchResult *)v9 initWithOids:MEMORY[0x1E4F1CBF0] photoLibrary:photoLibrary fetchType:v7 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
      }
      unint64_t v5 = (NSArray *)v8;

      uint64_t v11 = [(NSArray *)v5 fetchedObjects];
      double v12 = self->_resolvedParticipants;
      self->_resolvedParticipants = v11;
    }
    resolvedParticipants = self->_resolvedParticipants;
  }

  return resolvedParticipants;
}

- (void)setPhParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_phParticipants, a3);
  id v6 = a3;
  resolvedParticipants = self->_resolvedParticipants;
  self->_resolvedParticipants = 0;
}

- (void)setCnParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_cnParticipants, a3);
  id v6 = a3;
  resolvedParticipants = self->_resolvedParticipants;
  self->_resolvedParticipants = 0;
}

- (PHSuggestionMessageContext)initWithMessages:(id)a3 participantsFromPersons:(id)a4 photoLibrary:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PHSuggestionMessageContext *)self initWithMessages:a3];
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a5);
    objc_storeStrong((id *)&v12->_phParticipants, a4);
    v12->_unint64_t numberOfParticipants = [v9 count];
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    suggestionMatchingResultsBySuggestionIdentifier = v12->_suggestionMatchingResultsBySuggestionIdentifier;
    v12->_suggestionMatchingResultsBySuggestionIdentifier = (NSMutableDictionary *)v13;
  }
  return v12;
}

- (PHSuggestionMessageContext)initWithMessages:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHSuggestionMessageContext;
  unint64_t v5 = [(PHSuggestionMessageContext *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    messages = v5->_messages;
    v5->_messages = (NSArray *)v6;

    messageTokens = v5->_messageTokens;
    v5->_messageTokens = 0;

    id v9 = [v4 componentsJoinedByString:@"\n"];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = [MEMORY[0x1E4F8A9D0] dateIntervalsFromMessage:v9 onDate:v10];
    if ([v11 count])
    {
      uint64_t v12 = [v11 firstObject];
      dateInterval = v5->_dateInterval;
      v5->_dateInterval = (NSDateInterval *)v12;
    }
    else
    {
      dateInterval = v5->_dateInterval;
      v5->_dateInterval = 0;
    }
  }
  return v5;
}

- (PHSuggestionMessageContext)initWithMessages:(id)a3 participantsFromContacts:(id)a4 photoLibrary:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PHSuggestionMessageContext *)self initWithMessages:a3];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a5);
    objc_storeStrong((id *)&v12->_cnParticipants, a4);
    v12->_unint64_t numberOfParticipants = [v9 count];
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    suggestionMatchingResultsBySuggestionIdentifier = v12->_suggestionMatchingResultsBySuggestionIdentifier;
    v12->_suggestionMatchingResultsBySuggestionIdentifier = (NSMutableDictionary *)v13;
  }
  return v12;
}

@end