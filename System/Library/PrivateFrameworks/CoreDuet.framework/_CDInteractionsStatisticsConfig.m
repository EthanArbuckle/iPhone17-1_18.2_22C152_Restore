@interface _CDInteractionsStatisticsConfig
+ (id)computationBlockForStatName:(uint64_t)a1;
+ (uint64_t)isDateInWeekend:(uint64_t)a1;
- (BOOL)isFallbackFetch;
- (BOOL)shouldStopRecordProcessing:(id)a3;
- (BOOL)shouldUseSuggestionEngaged;
- (NSString)bundleId;
- (NSString)topDomainURL;
- (_CDInteractionsStatisticsConfig)init;
- (_CDInteractionsStatisticsConfig)initWithAnchorDate:(id)a3 leftBoundDate:(id)a4 rightBoundDate:(id)a5 fetchLimit:(unint64_t)a6 maxComputationTime:(double)a7 featureNamesToSortWith:(id)a8 shouldSortAscending:(BOOL)a9 shouldUseSuggestionEngaged:(BOOL)a10 statsDefaultValues:(id)a11;
- (id)defaultValues;
- (id)featureNamesToSortWith;
- (id)getConversationIdAndComputeStatForStatName:(id)a3 record:(id)a4 inInteractionsStatistics:(id)a5;
- (id)getConversationIdAndComputeStatForStatNames:(void *)a3 record:(void *)a4 inInteractionsStatistics:;
- (id)interactionsSelectionPredicateBetweenStartDate:(id)a3 andEndDate:(id)a4;
- (id)predicate;
- (id)rightBoundDate;
- (int)fetchBatchSize;
- (unint64_t)fetchLimit;
- (void)computeConversationBundleIdForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeHasEverSharePlayedWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfEngagedSuggestionsFromCurrentAppWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfEngagedSuggestionsOfDetectedPeopleWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfEngagedSuggestionsOfPhotoFeaturesForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfEngagedSuggestionsOfTopDomainURLWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfEngagedSuggestionsWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfIncomingInteractionsWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfInteractionsDuringTimePeriodWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfOutgoingInteractionsWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfSharesFromCurrentAppWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfSharesOfDetectedPeopleWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfSharesOfTopDomainURLWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeNumberOfSharesWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computePhotoFeaturesForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeRecipientListConversationIdForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeStatsForInteractionRecord:(id)a3 inInteractionsStatistics:(id)a4 chunkIndex:(int)a5;
- (void)computeTimeSinceLastIncomingInteractionForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeTimeSinceLastOutgoingInteractionForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)computeTimeSinceOutgoingInteractionNumber10ForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:;
- (void)setBundleId:(id)a3;
- (void)setFeatureNamesToSortWith:(id)a3;
- (void)setFetchBatchSize:(int)a3;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setIsFallbackFetch:(BOOL)a3;
- (void)setPeopleInPhotoIdentifiers:(id)a3;
- (void)setShouldSortAscending:(BOOL)a3;
- (void)setStatsToCompute:(id)a3;
- (void)setTopDomainURL:(id)a3;
@end

@implementation _CDInteractionsStatisticsConfig

- (_CDInteractionsStatisticsConfig)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v10[0] = @"timeSinceLastOutgoingInteraction";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  LOBYTE(v9) = 0;
  v7 = [(_CDInteractionsStatisticsConfig *)self initWithAnchorDate:v3 leftBoundDate:v4 rightBoundDate:v5 fetchLimit:4000 maxComputationTime:v6 featureNamesToSortWith:1 shouldSortAscending:0.2 shouldUseSuggestionEngaged:v9 statsDefaultValues:MEMORY[0x1E4F1CC08]];

  return v7;
}

- (_CDInteractionsStatisticsConfig)initWithAnchorDate:(id)a3 leftBoundDate:(id)a4 rightBoundDate:(id)a5 fetchLimit:(unint64_t)a6 maxComputationTime:(double)a7 featureNamesToSortWith:(id)a8 shouldSortAscending:(BOOL)a9 shouldUseSuggestionEngaged:(BOOL)a10 statsDefaultValues:(id)a11
{
  v32[19] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v30 = a11;
  v31.receiver = self;
  v31.super_class = (Class)_CDInteractionsStatisticsConfig;
  v20 = [(_CDInteractionsStatisticsConfig *)&v31 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_anchorDate, a3);
    [v16 timeIntervalSinceReferenceDate];
    v21->_anchorTimeStamp = v22;
    v21->_isWeekEndShare = +[_CDInteractionsStatisticsConfig isDateInWeekend:]((uint64_t)_CDInteractionsStatisticsConfig, v16);
    objc_storeStrong((id *)&v21->_leftBoundDate, a4);
    objc_storeStrong((id *)&v21->_rightBoundDate, a5);
    v21->_fetchLimit = a6;
    objc_storeStrong((id *)&v21->_featureNamesToSortWith, a8);
    v21->_shouldSortAscending = a9;
    v21->_shouldUseSuggestionEngaged = a10;
    objc_storeStrong((id *)&v21->_statsDefaultValues, a11);
    v32[0] = @"ConversationBundleId";
    v32[1] = @"RecipientListConversationId";
    v32[2] = @"numberOfSharesWithConversation";
    v32[3] = @"numberOfSharesFromCurrentAppWithConversation";
    v32[4] = @"numberOfSharesOfTopDomainURLWithConversation";
    v32[5] = @"numberOfSharesOfDetectedPeopleWithConversation";
    v32[6] = @"numberOfSharesOfPeopleInPhotoWithConversation";
    v32[7] = @"numberOfOutgoingInteractionsWithConversation";
    v32[8] = @"numberOfIncomingInteractionsWithConversation";
    v32[9] = @"numberOfInteractionsDuringTimePeriodWithConversation";
    v32[10] = @"timeSinceLastOutgoingInteraction";
    v32[11] = @"timeSinceOutgoingInteractionNumber10";
    v32[12] = @"timeSinceLastIncomingInteraction";
    v32[13] = @"hasEverSharePlayedWithConversation";
    v32[14] = @"numberOfEngagedSuggestionsWithConversation";
    v32[15] = @"numberOfEngagedSuggestionsFromCurrentAppWithConversation";
    v32[16] = @"numberOfEngagedSuggestionsOfTopDomainURLWithConversation";
    v32[17] = @"numberOfEngagedSuggestionsOfDetectedPeopleWithConversation";
    v32[18] = @"numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation";
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:19];
    statsToCompute = v21->_statsToCompute;
    v21->_statsToCompute = (NSArray *)v23;

    v21->_fetchBatchSize = 100;
    v25 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    peopleInPhotoIdentifiers = v21->_peopleInPhotoIdentifiers;
    v21->_peopleInPhotoIdentifiers = v25;
  }
  return v21;
}

+ (uint64_t)isDateInWeekend:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (isDateInWeekend___pasOnceToken3 != -1) {
    dispatch_once(&isDateInWeekend___pasOnceToken3, &__block_literal_global_234);
  }
  uint64_t v3 = [(id)isDateInWeekend___pasExprOnceResult isDateInWeekend:v2];

  return v3;
}

- (id)interactionsSelectionPredicateBetweenStartDate:(id)a3 andEndDate:(id)a4
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_shouldUseSuggestionEngaged) {
    v8 = &unk_1EDE1E4A0;
  }
  else {
    v8 = &unk_1EDE1E4B8;
  }
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (bundleId IN %@)", &unk_1EDE1E470];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", &unk_1EDE1E488];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", v8];
  v12 = (void *)MEMORY[0x1E4F28F60];
  v13 = v6;
  if (v6)
  {
    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    if (v7)
    {
LABEL_6:
      v14 = [v12 predicateWithFormat:@"(startDate >= %@) && (startDate <= %@)", v13, v7];
      if (v6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  id v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v14 = [v12 predicateWithFormat:@"(startDate >= %@) && (startDate <= %@)", v13, v19];

  if (!v6) {
LABEL_7:
  }

LABEL_8:
  v15 = (void *)MEMORY[0x1E4F28BA0];
  v20[0] = v9;
  v20[1] = v10;
  v20[2] = v11;
  v20[3] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  id v17 = [v15 andPredicateWithSubpredicates:v16];

  return v17;
}

- (void)setPeopleInPhotoIdentifiers:(id)a3
{
  v4 = (NSSet *)[a3 copy];
  peopleInPhotoIdentifiers = self->_peopleInPhotoIdentifiers;
  self->_peopleInPhotoIdentifiers = v4;
  MEMORY[0x1F41817F8](v4, peopleInPhotoIdentifiers);
}

- (void)setStatsToCompute:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  statsToCompute = self->_statsToCompute;
  self->_statsToCompute = v4;
  MEMORY[0x1F41817F8](v4, statsToCompute);
}

+ (id)computationBlockForStatName:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (computationBlockForStatName___pasOnceToken2 != -1) {
    dispatch_once(&computationBlockForStatName___pasOnceToken2, &__block_literal_global_178);
  }
  uint64_t v3 = [(id)computationBlockForStatName__statNameToComputationBlock objectForKeyedSubscript:v2];

  return v3;
}

- (void)computeConversationBundleIdForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1)
  {
    v10 = [v8 valueForProperty:@"ConversationBundleId" forConversationId:v14];

    if (!v10)
    {
      unint64_t v11 = [v7 mechanism];
      if (v11 <= 0x14)
      {
        if (((1 << v11) & 0x30C00) != 0) {
          goto LABEL_8;
        }
        if (((1 << v11) & 0x182000) != 0)
        {
          v12 = [v7 targetBundleId];
          v13 = @"OriginShareBundleId";
          if (!v12) {
            goto LABEL_8;
          }
          goto LABEL_7;
        }
      }
      v12 = [v7 bundleId];
      v13 = @"ConversationBundleId";
      if (v12)
      {
LABEL_7:
        [v9 setValue:v12 forProperty:v13 andConversationId:v14];
      }
    }
  }
LABEL_8:
}

- (void)computeRecipientListConversationIdForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v7 direction] == 1)
    {
      uint64_t v9 = [v8 valueForProperty:@"RecipientListConversationId" forConversationId:v11];

      if (!v9)
      {
        v10 = (*((void (**)(uint64_t, void *))stringifyRecipientList + 2))((uint64_t)stringifyRecipientList, v7);
        [v8 setValue:v10 forProperty:@"RecipientListConversationId" andConversationId:v11];
      }
    }
  }
}

- (void)computeTimeSinceLastOutgoingInteractionForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v7 direction] == 1 && objc_msgSend(v7, "mechanism") != 20)
    {
      uint64_t v9 = [v8 valueForFeature:@"timeSinceLastOutgoingInteraction" forConversationId:v14];

      if (!v9)
      {
        v10 = NSNumber;
        double v11 = *(double *)(a1 + 16);
        [v7 startDate];
        v13 = [v10 numberWithDouble:v11 - v12];
        [v8 setValue:v13 forFeature:@"timeSinceLastOutgoingInteraction" andConversationId:v14];
      }
    }
  }
}

- (void)computeTimeSinceOutgoingInteractionNumber10ForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v7 direction] == 1 && objc_msgSend(v7, "mechanism") != 20)
    {
      uint64_t v9 = [v8 valueForFeature:@"numberOfOutgoingInteractionsWithConversation" forConversationId:v15];
      uint64_t v10 = [v9 integerValue];

      if (v10 == 10)
      {
        double v11 = NSNumber;
        double v12 = *(double *)(a1 + 16);
        [v7 startDate];
        id v14 = [v11 numberWithDouble:v12 - v13];
        [v8 setValue:v14 forFeature:@"timeSinceOutgoingInteractionNumber10" andConversationId:v15];
      }
    }
  }
}

- (void)computeTimeSinceLastIncomingInteractionForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if (![v7 direction])
    {
      uint64_t v9 = [v8 valueForFeature:@"timeSinceLastIncomingInteraction" forConversationId:v14];

      if (!v9)
      {
        uint64_t v10 = NSNumber;
        double v11 = *(double *)(a1 + 16);
        [v7 startDate];
        double v13 = [v10 numberWithDouble:v11 - v12];
        [v8 setValue:v13 forFeature:@"timeSinceLastIncomingInteraction" andConversationId:v14];
      }
    }
  }
}

- (void)computeNumberOfSharesWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1 && [v7 mechanism] == 13) {
    [v8 incrementValueForFeature:@"numberOfSharesWithConversation" andConversationId:v9];
  }
}

- (void)computeNumberOfSharesFromCurrentAppWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v7 mechanism] == 13)
    {
      id v9 = [v7 bundleId];
      int v10 = [v9 isEqualToString:*(void *)(a1 + 112)];

      if (v10) {
        [v8 incrementValueForFeature:@"numberOfSharesFromCurrentAppWithConversation" andConversationId:v11];
      }
    }
  }
}

- (void)computeNumberOfSharesOfTopDomainURLWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1 && [v8 mechanism] == 13 && *(void *)(a1 + 120))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v8;
    int v10 = [v8 attachments];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v19 + 1) + 8 * v14) contentURL];
          id v16 = [v15 host];
          int v17 = [v16 isEqualToString:*(void *)(a1 + 120)];

          if (v17) {
            [v9 incrementValueForFeature:@"numberOfSharesOfTopDomainURLWithConversation" andConversationId:v7];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    id v8 = v18;
  }
}

- (void)computeNumberOfSharesOfDetectedPeopleWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1 && [v8 direction] == 1)
  {
    id v19 = v7;
    int v10 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v8 attachments];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v17 = [v16 personInPhoto];

          if (v17)
          {
            id v18 = [v16 personInPhoto];
            [v10 addObject:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v10 intersectSet:*(void *)(a1 + 96)];
    id v7 = v19;
    if ([v10 count]) {
      [v9 incrementValueForFeature:@"numberOfSharesOfDetectedPeopleWithConversation" andConversationId:v19];
    }
  }
}

- (void)computePhotoFeaturesForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1 && [v8 mechanism] == 13)
  {
    int v10 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v11 = [v8 attachments];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          int v17 = [v16 personInPhoto];

          if (v17)
          {
            id v18 = [v16 personInPhoto];
            [v10 addObject:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v13);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(v9, "savePersonId:forConversationId:forSyntheticInteraction:", *(void *)(*((void *)&v24 + 1) + 8 * j), v7, 0, (void)v24);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v21);
    }
  }
}

- (void)computeNumberOfOutgoingInteractionsWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1 && [v7 direction] == 1 && objc_msgSend(v7, "mechanism") != 20) {
    [v8 incrementValueForFeature:@"numberOfOutgoingInteractionsWithConversation" andConversationId:v9];
  }
}

- (void)computeNumberOfIncomingInteractionsWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1 && ![v7 direction]) {
    [v8 incrementValueForFeature:@"numberOfIncomingInteractionsWithConversation" andConversationId:v9];
  }
}

- (void)computeNumberOfInteractionsDuringTimePeriodWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v7 direction] == 1)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v7 startDate];
      int v10 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
      int v11 = +[_CDInteractionsStatisticsConfig isDateInWeekend:]((uint64_t)_CDInteractionsStatisticsConfig, v10);

      if (*(unsigned __int8 *)(a1 + 32) == v11) {
        [v8 incrementValueForFeature:@"numberOfInteractionsDuringTimePeriodWithConversation" andConversationId:v12];
      }
    }
  }
}

- (void)computeHasEverSharePlayedWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a1)
  {
    int v10 = [v8 valueForProperty:@"RecipientListConversationId" forConversationId:v12];
    int v11 = [v9 hasEverSharePlayed:v10];

    if (v11) {
      [v9 setValue:&unk_1EDE1D838 forFeature:@"hasEverSharePlayedWithConversation" andConversationId:v12];
    }
  }
}

- (void)computeNumberOfEngagedSuggestionsWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1 && [v7 mechanism] == 20) {
    [v8 incrementValueForFeature:@"numberOfEngagedSuggestionsWithConversation" andConversationId:v9];
  }
}

- (void)computeNumberOfEngagedSuggestionsFromCurrentAppWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v7 mechanism] == 20)
    {
      id v9 = [v7 bundleId];
      int v10 = [v9 isEqualToString:*(void *)(a1 + 112)];

      if (v10) {
        [v8 incrementValueForFeature:@"numberOfEngagedSuggestionsFromCurrentAppWithConversation" andConversationId:v11];
      }
    }
  }
}

- (void)computeNumberOfEngagedSuggestionsOfTopDomainURLWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1 && [v8 mechanism] == 20 && *(void *)(a1 + 120))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v8;
    int v10 = [v8 attachments];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v19 + 1) + 8 * v14) contentURL];
          id v16 = [v15 host];
          int v17 = [v16 isEqualToString:*(void *)(a1 + 120)];

          if (v17) {
            [v9 incrementValueForFeature:@"numberOfEngagedSuggestionsOfTopDomainURLWithConversation" andConversationId:v7];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    id v8 = v18;
  }
}

- (void)computeNumberOfEngagedSuggestionsOfDetectedPeopleWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1 && [v8 mechanism] == 20)
  {
    id v19 = v7;
    int v10 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v8 attachments];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v17 = [v16 personInPhoto];

          if (v17)
          {
            id v18 = [v16 personInPhoto];
            [v10 addObject:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v10 intersectSet:*(void *)(a1 + 96)];
    id v7 = v19;
    if ([v10 count]) {
      [v9 incrementValueForFeature:@"numberOfSharesOfDetectedPeopleWithConversation" andConversationId:v19];
    }
  }
}

- (void)computeNumberOfEngagedSuggestionsOfPhotoFeaturesForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1 && [v8 mechanism] == 20)
  {
    int v10 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v11 = [v8 attachments];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          int v17 = [v16 personInPhoto];

          if (v17)
          {
            id v18 = [v16 personInPhoto];
            [v10 addObject:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v13);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(v9, "savePersonId:forConversationId:forSyntheticInteraction:", *(void *)(*((void *)&v24 + 1) + 8 * j), v7, 1, (void)v24);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v21);
    }
  }
}

- (void)computeStatsForInteractionRecord:(id)a3 inInteractionsStatistics:(id)a4 chunkIndex:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v12 = a4;
  id v8 = -[_CDInteractionsStatisticsConfig getConversationIdAndComputeStatForStatNames:record:inInteractionsStatistics:]((uint64_t)self, self->_statsToCompute, a3, v12);
  if (v8)
  {
    id v9 = [v12 valueForFeature:@"foundInInteractionStoreChunk" forConversationId:v8];
    if (!v9)
    {
      int v10 = [NSNumber numberWithInt:v5];
      [v12 setValue:v10 forFeature:@"foundInInteractionStoreChunk" andConversationId:v8];
    }
    uint64_t v11 = [NSNumber numberWithInt:v5];
    [v12 setValue:v11 forFeature:@"updatedInInteractionStoreChunk" andConversationId:v8];
  }
}

- (id)getConversationIdAndComputeStatForStatNames:(void *)a3 record:(void *)a4 inInteractionsStatistics:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_28;
  }
  int v10 = [v8 bundleId];
  if ([v10 isEqualToString:@"com.apple.MobileSMS"])
  {

LABEL_5:
    uint64_t v13 = [v8 domainIdentifier];
    goto LABEL_7;
  }
  uint64_t v11 = [v8 targetBundleId];
  int v12 = [v11 isEqualToString:@"com.apple.UIKit.activity.Message"];

  if (v12) {
    goto LABEL_5;
  }
  uint64_t v13 = [v8 derivedIntentIdentifier];
LABEL_7:
  uint64_t v14 = (void *)v13;
  id v15 = [v8 targetBundleId];
  int v16 = [v15 isEqual:@"com.apple.telephonyutilities.callservicesd"];

  if (v16)
  {
    int v17 = (*((void (**)(uint64_t, void *))stringifyRecipientList + 2))((uint64_t)stringifyRecipientList, v8);
    [v9 recordSharePlayInformation:v17];
  }
  if ([v8 mechanism] != 10 && objc_msgSend(v8, "mechanism") != 11 && objc_msgSend(v8, "mechanism") != 17) {
    goto LABEL_15;
  }
  id v18 = [v8 recipients];
  if ([v18 count] != 1)
  {

    goto LABEL_27;
  }
  id v19 = [v8 recipients];
  uint64_t v20 = [v19 anyObject];
  uint64_t v21 = [v20 identifier];

  if (!v21)
  {
LABEL_27:

LABEL_28:
    uint64_t v14 = 0;
    goto LABEL_29;
  }
  id v22 = [NSString alloc];
  long long v23 = [v8 recipients];
  long long v24 = [v23 anyObject];
  long long v25 = [v24 identifier];
  uint64_t v26 = [v22 initWithFormat:@"iMessage;-;%@", v25];

  uint64_t v14 = (void *)v26;
LABEL_15:
  if (v14)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v35 = v7;
    id v27 = v7;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = +[_CDInteractionsStatisticsConfig computationBlockForStatName:]((uint64_t)_CDInteractionsStatisticsConfig, *(void **)(*((void *)&v36 + 1) + 8 * i));
          v33 = (void *)v32;
          if (v32) {
            (*(void (**)(uint64_t, uint64_t, void *, id, id))(v32 + 16))(v32, a1, v14, v8, v9);
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v29);
    }

    id v7 = v35;
  }
LABEL_29:

  return v14;
}

- (id)getConversationIdAndComputeStatForStatName:(id)a3 record:(id)a4 inInteractionsStatistics:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = a3;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = [v8 arrayWithObjects:v15 count:1];

  uint64_t v13 = -[_CDInteractionsStatisticsConfig getConversationIdAndComputeStatForStatNames:record:inInteractionsStatistics:]((uint64_t)self, v12, v10, v9);

  return v13;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (void)setShouldSortAscending:(BOOL)a3
{
  self->_shouldSortAscending = a3;
}

- (void)setFeatureNamesToSortWith:(id)a3
{
}

- (id)rightBoundDate
{
  return self->_rightBoundDate;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (id)predicate
{
  return [(_CDInteractionsStatisticsConfig *)self interactionsSelectionPredicateBetweenStartDate:self->_leftBoundDate andEndDate:self->_rightBoundDate];
}

- (BOOL)shouldStopRecordProcessing:(id)a3
{
  if (self->_isFallbackFetch) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3);
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  return v7 - self->_anchorTimeStamp >= self->_maxComputationTime;
}

- (id)defaultValues
{
  return self->_statsDefaultValues;
}

- (id)featureNamesToSortWith
{
  return self->_featureNamesToSortWith;
}

- (BOOL)shouldUseSuggestionEngaged
{
  return self->_shouldUseSuggestionEngaged;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)topDomainURL
{
  return self->_topDomainURL;
}

- (void)setTopDomainURL:(id)a3
{
}

- (int)fetchBatchSize
{
  return self->_fetchBatchSize;
}

- (void)setFetchBatchSize:(int)a3
{
  self->_fetchBatchSize = a3;
}

- (BOOL)isFallbackFetch
{
  return self->_isFallbackFetch;
}

- (void)setIsFallbackFetch:(BOOL)a3
{
  self->_isFallbackFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topDomainURL, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_peopleInPhotoIdentifiers, 0);
  objc_storeStrong((id *)&self->_statsToCompute, 0);
  objc_storeStrong((id *)&self->_statsDefaultValues, 0);
  objc_storeStrong((id *)&self->_featureNamesToSortWith, 0);
  objc_storeStrong((id *)&self->_rightBoundDate, 0);
  objc_storeStrong((id *)&self->_leftBoundDate, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end