@interface EMSearchableIndexTopHitsQueryResult
+ (id)log;
- (CSTopHitQuery)topHitSearchQuery;
- (EMSearchableIndexTopHitsQueryResult)initWithTopHitSearchQuery:(id)a3 foundItems:(id)a4 foundMatchingHintsByPersistentID:(id)a5;
- (NSArray)foundItems;
- (NSArray)searchableItemIdentifiers;
- (NSDictionary)foundMatchingHintsByPersistentID;
- (NSDictionary)mailRankingSignalsByPersistentID;
- (NSDictionary)matchingHintsByPersistentID;
- (int64_t)rankingIndexForConversationID:(id)a3;
- (int64_t)rankingIndexForMessageLibraryID:(id)a3;
- (unint64_t)getDaysSinceTheDate:(id)a3;
- (void)setFoundItems:(id)a3;
- (void)setFoundMatchingHintsByPersistentID:(id)a3;
- (void)setMailRankingSignalsByPersistentID:(id)a3;
- (void)setSearchableItemIdentifiers:(id)a3;
- (void)setTopHitSearchQuery:(id)a3;
- (void)userDidInteractWithConversationID:(id)a3;
- (void)userDidInteractWithLibraryIdentifier:(id)a3;
@end

@implementation EMSearchableIndexTopHitsQueryResult

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EMSearchableIndexTopHitsQueryResult_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_38 != -1) {
    dispatch_once(&log_onceToken_38, block);
  }
  v2 = (void *)log_log_38;
  return v2;
}

void __42__EMSearchableIndexTopHitsQueryResult_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_38;
  log_log_38 = (uint64_t)v1;
}

- (EMSearchableIndexTopHitsQueryResult)initWithTopHitSearchQuery:(id)a3 foundItems:(id)a4 foundMatchingHintsByPersistentID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMSearchableIndexTopHitsQueryResult;
  v12 = [(EMSearchableIndexTopHitsQueryResult *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topHitSearchQuery, a3);
    uint64_t v14 = [v10 copy];
    foundItems = v13->_foundItems;
    v13->_foundItems = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    foundMatchingHintsByPersistentID = v13->_foundMatchingHintsByPersistentID;
    v13->_foundMatchingHintsByPersistentID = (NSDictionary *)v16;
  }
  return v13;
}

- (NSArray)searchableItemIdentifiers
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  searchableItemIdentifiers = self->_searchableItemIdentifiers;
  if (!searchableItemIdentifiers)
  {
    v23 = self;
    v5 = (NSArray *)objc_opt_new();
    v6 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = [(EMSearchableIndexTopHitsQueryResult *)v23 foundItems];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v2 = +[EMSearchableIndex persistentIDForSearchableItem:v11];
          if (v2)
          {
            [(NSArray *)v5 addObject:v2];
            v12 = [v11 attributeSet];
            v13 = [v12 matchingHints];
            [v6 setObject:v13 forKeyedSubscript:v2];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v8);
    }

    if (_os_feature_enabled_impl())
    {
      uint64_t v14 = [v6 allValues];
      v15 = +[EMSearchableIndexTopHitsQueryResult log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = [v14 count];
        uint64_t v21 = [v14 count];
        if (v21)
        {
          v2 = [v14 firstObject];
          v22 = +[EMCSLoggingAdditions publicDescriptionForSnippetHintsArray:v2];
        }
        else
        {
          v22 = @"No values found.";
        }
        *(_DWORD *)buf = 134218242;
        uint64_t v29 = v20;
        __int16 v30 = 2112;
        v31 = v22;
        _os_log_debug_impl(&dword_1BEFDB000, v15, OS_LOG_TYPE_DEBUG, "Top hits query collected %lu snippet hints: %@", buf, 0x16u);
        if (v21)
        {
        }
      }
    }
    uint64_t v16 = [v6 copy];
    matchingHintsByPersistentID = v23->_matchingHintsByPersistentID;
    v23->_matchingHintsByPersistentID = (NSDictionary *)v16;

    v18 = v23->_searchableItemIdentifiers;
    v23->_searchableItemIdentifiers = v5;

    searchableItemIdentifiers = v23->_searchableItemIdentifiers;
  }
  return searchableItemIdentifiers;
}

- (NSDictionary)mailRankingSignalsByPersistentID
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  mailRankingSignalsByPersistentID = self->_mailRankingSignalsByPersistentID;
  if (mailRankingSignalsByPersistentID)
  {
    id v3 = mailRankingSignalsByPersistentID;
  }
  else
  {
    id v69 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    obuint64_t j = [(EMSearchableIndexTopHitsQueryResult *)self foundItems];
    uint64_t v71 = [obj countByEnumeratingWithState:&v81 objects:v92 count:16];
    if (v71)
    {
      uint64_t v70 = *(void *)v82;
      v65 = v86;
      uint64_t v68 = *MEMORY[0x1E4F23790];
      uint64_t v66 = *MEMORY[0x1E4F23760];
      do
      {
        for (uint64_t i = 0; i != v71; ++i)
        {
          if (*(void *)v82 != v70) {
            objc_enumerationMutation(obj);
          }
          v5 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          v73 = +[EMSearchableIndex persistentIDForSearchableItem:](EMSearchableIndex, "persistentIDForSearchableItem:", v5, v65);
          if (v73)
          {
            uint64_t v87 = 0;
            v88 = &v87;
            uint64_t v89 = 0x2050000000;
            v6 = (void *)getSFMailRankingSignalsClass_softClass;
            uint64_t v90 = getSFMailRankingSignalsClass_softClass;
            if (!getSFMailRankingSignalsClass_softClass)
            {
              v85[0] = MEMORY[0x1E4F143A8];
              v85[1] = 3221225472;
              v86[0] = __getSFMailRankingSignalsClass_block_invoke;
              v86[1] = &unk_1E63E62D8;
              v86[2] = &v87;
              __getSFMailRankingSignalsClass_block_invoke((uint64_t)v85);
              v6 = (void *)v88[3];
            }
            v7 = v6;
            _Block_object_dispose(&v87, 8);
            id v75 = objc_alloc_init(v7);
            uint64_t v8 = [v5 attributeSet];
            uint64_t v9 = [v8 attributeDictionary];
            v72 = [v9 valueForKey:v68];

            objc_msgSend(v75, "setIsSemanticMatch:", ((unint64_t)objc_msgSend(v72, "integerValue") >> 1) & 1);
            objc_msgSend(v75, "setIsSyntacticMatch:", objc_msgSend(v72, "integerValue") & 1);
            if ([v75 isSemanticMatch])
            {
              id v10 = [v5 attributeSet];
              id v11 = [v10 attributeDictionary];
              v12 = [v11 valueForKey:v66];

              if ([v12 count] == 3)
              {
                v13 = [v12 objectAtIndexedSubscript:0];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  v15 = [v12 objectAtIndexedSubscript:0];
                  [v15 floatValue];
                  float v17 = v16;

                  if (v17 >= 0.0 && v17 <= 4.0)
                  {
                    *(float *)&double v18 = (float)(v17 * -0.5) + 1.0;
                    objc_super v19 = [NSNumber numberWithFloat:v18];
                    [v75 setSemanticScore:v19];
                  }
                }
              }
            }
            uint64_t v20 = NSNumber;
            uint64_t v21 = [v5 attributeSet];
            v22 = [v21 mailResultScoreL1];
            [v22 doubleValue];
            v23 = objc_msgSend(v20, "numberWithDouble:");
            [v75 setSyntacticScore:v23];

            long long v24 = [v5 attributeSet];
            long long v25 = [v24 mailFlagged];
            objc_msgSend(v75, "setIsFlagged:", objc_msgSend(v25, "BOOLValue"));

            long long v26 = [v5 attributeSet];
            long long v27 = [v26 mailRepliedTo];
            objc_msgSend(v75, "setIsRepliedTo:", objc_msgSend(v27, "BOOLValue"));

            v28 = NSNumber;
            uint64_t v29 = [v5 attributeSet];
            __int16 v30 = [v29 mailResultScoreL1];
            [v30 doubleValue];
            v31 = objc_msgSend(v28, "numberWithDouble:");
            [v75 setL1Score:v31];

            v32 = NSNumber;
            uint64_t v33 = [v5 attributeSet];
            v34 = [v33 mailResultScoreL2];
            [v34 doubleValue];
            v35 = objc_msgSend(v32, "numberWithDouble:");
            [v75 setL2Score:v35];

            v36 = [v5 attributeSet];
            v37 = [v36 mailUseCount];
            objc_msgSend(v75, "setNumEngagements:", objc_msgSend(v37, "unsignedLongLongValue"));

            v38 = [v5 attributeSet];
            v39 = [v38 mailDateReceived];
            objc_msgSend(v75, "setDaysSinceReceipt:", -[EMSearchableIndexTopHitsQueryResult getDaysSinceTheDate:](self, "getDaysSinceTheDate:", v39));

            id v40 = objc_alloc(MEMORY[0x1E4F1CA80]);
            v41 = [v5 attributeSet];
            v42 = [v41 mailUsedDates];
            v43 = objc_msgSend(v40, "initWithCapacity:", objc_msgSend(v42, "count"));

            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            v44 = [v5 attributeSet];
            v45 = [v44 mailUsedDates];

            uint64_t v46 = [v45 countByEnumeratingWithState:&v77 objects:v91 count:16];
            if (v46)
            {
              int v47 = 0;
              int v48 = 0;
              uint64_t v76 = 0;
              uint64_t v49 = *(void *)v78;
              double v50 = -1.0;
              double v51 = -1.0;
              double v52 = -1.0;
              double v53 = -1.0;
              do
              {
                for (uint64_t j = 0; j != v46; ++j)
                {
                  if (*(void *)v78 != v49) {
                    objc_enumerationMutation(v45);
                  }
                  unint64_t v55 = [(EMSearchableIndexTopHitsQueryResult *)self getDaysSinceTheDate:*(void *)(*((void *)&v77 + 1) + 8 * j)];
                  if (v55 <= 0x1E)
                  {
                    v56 = [NSNumber numberWithUnsignedInteger:v55];
                    [v43 addObject:v56];

                    if (v55 > 6)
                    {
                      if (v55 > 0xD)
                      {
                        if (v55 > 0x14)
                        {
                          if (v55 <= 0x1D)
                          {
                            double v53 = v53 + (double)v55 + 1.0;
                            LODWORD(v76) = v76 + 1;
                          }
                        }
                        else
                        {
                          double v52 = v52 + (double)v55 + 1.0;
                          ++HIDWORD(v76);
                        }
                      }
                      else
                      {
                        double v51 = v51 + (double)v55 + 1.0;
                        ++v48;
                      }
                    }
                    else
                    {
                      double v50 = v50 + (double)v55 + 1.0;
                      ++v47;
                    }
                  }
                }
                uint64_t v46 = [v45 countByEnumeratingWithState:&v77 objects:v91 count:16];
              }
              while (v46);

              if (v47 >= 1) {
                double v50 = (v50 + 1.0) / (double)v47;
              }
              if (v48 >= 1) {
                double v51 = (v51 + 1.0) / (double)v48;
              }
              if (SHIDWORD(v76) >= 1) {
                double v52 = (v52 + 1.0) / (double)SHIDWORD(v76);
              }
              if ((int)v76 >= 1) {
                double v53 = (v53 + 1.0) / (double)(int)v76;
              }
            }
            else
            {

              double v52 = -1.0;
              double v50 = -1.0;
              double v51 = -1.0;
              double v53 = -1.0;
            }
            v57 = [NSNumber numberWithDouble:v50];
            [v75 setAverageEngagementAgeLast7Days:v57];

            v58 = [NSNumber numberWithDouble:v51];
            [v75 setAverageEngagementAgeLast14Days:v58];

            v59 = [NSNumber numberWithDouble:v52];
            [v75 setAverageEngagementAgeLast21Days:v59];

            v60 = [NSNumber numberWithDouble:v53];
            [v75 setAverageEngagementAgeLast30Days:v60];

            objc_msgSend(v75, "setNumDaysEngagedLast30Days:", objc_msgSend(v43, "count"));
            [v69 setObject:v75 forKeyedSubscript:v73];
          }
        }
        uint64_t v71 = [obj countByEnumeratingWithState:&v81 objects:v92 count:16];
      }
      while (v71);
    }

    uint64_t v61 = [v69 copy];
    v63 = self->_mailRankingSignalsByPersistentID;
    p_mailRankingSignalsByPersistentID = (id *)&self->_mailRankingSignalsByPersistentID;
    id *p_mailRankingSignalsByPersistentID = (id)v61;

    id v3 = (NSDictionary *)*p_mailRankingSignalsByPersistentID;
  }
  return v3;
}

- (unint64_t)getDaysSinceTheDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v5 setTimeZone:v4];
    v6 = [MEMORY[0x1E4F1C9C8] date];
    v7 = [v5 components:16 fromDate:v3 toDate:v6 options:0];
    if ([v7 day] < 0) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = [v7 day];
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)userDidInteractWithLibraryIdentifier:(id)a3
{
  id v8 = a3;
  int64_t v4 = -[EMSearchableIndexTopHitsQueryResult rankingIndexForMessageLibraryID:](self, "rankingIndexForMessageLibraryID:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [(EMSearchableIndexTopHitsQueryResult *)self topHitSearchQuery];
    v6 = [(EMSearchableIndexTopHitsQueryResult *)self foundItems];
    v7 = [v6 objectAtIndexedSubscript:v4];
    [v5 userEngagedWithResult:v7 interactionType:0];
  }
}

- (int64_t)rankingIndexForMessageLibraryID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = [(EMSearchableIndexTopHitsQueryResult *)self foundItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__EMSearchableIndexTopHitsQueryResult_rankingIndexForMessageLibraryID___block_invoke;
  v9[3] = &unk_1E63E6288;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __71__EMSearchableIndexTopHitsQueryResult_rankingIndexForMessageLibraryID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int64_t v7 = [a2 attributeSet];
  id v8 = [v7 uniqueIdentifier];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)userDidInteractWithConversationID:(id)a3
{
  id v8 = a3;
  int64_t v4 = -[EMSearchableIndexTopHitsQueryResult rankingIndexForConversationID:](self, "rankingIndexForConversationID:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [(EMSearchableIndexTopHitsQueryResult *)self topHitSearchQuery];
    id v6 = [(EMSearchableIndexTopHitsQueryResult *)self foundItems];
    int64_t v7 = [v6 objectAtIndexedSubscript:v4];
    [v5 userEngagedWithResult:v7 interactionType:0];
  }
}

- (int64_t)rankingIndexForConversationID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = [(EMSearchableIndexTopHitsQueryResult *)self foundItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__EMSearchableIndexTopHitsQueryResult_rankingIndexForConversationID___block_invoke;
  v9[3] = &unk_1E63E6288;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __69__EMSearchableIndexTopHitsQueryResult_rankingIndexForConversationID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int64_t v7 = [a2 attributeSet];
  id v8 = [v7 mailConversationID];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)setSearchableItemIdentifiers:(id)a3
{
}

- (NSDictionary)matchingHintsByPersistentID
{
  return self->_matchingHintsByPersistentID;
}

- (void)setMailRankingSignalsByPersistentID:(id)a3
{
}

- (CSTopHitQuery)topHitSearchQuery
{
  return self->_topHitSearchQuery;
}

- (void)setTopHitSearchQuery:(id)a3
{
}

- (NSArray)foundItems
{
  return self->_foundItems;
}

- (void)setFoundItems:(id)a3
{
}

- (NSDictionary)foundMatchingHintsByPersistentID
{
  return self->_foundMatchingHintsByPersistentID;
}

- (void)setFoundMatchingHintsByPersistentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundMatchingHintsByPersistentID, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
  objc_storeStrong((id *)&self->_topHitSearchQuery, 0);
  objc_storeStrong((id *)&self->_mailRankingSignalsByPersistentID, 0);
  objc_storeStrong((id *)&self->_matchingHintsByPersistentID, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifiers, 0);
}

@end