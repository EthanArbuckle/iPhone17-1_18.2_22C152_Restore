@interface _ATXActionUtils
+ (BOOL)isActionKey:(id)a3;
+ (BOOL)isCallIntentEquivalenceBetweenAction:(id)a3 other:(id)a4;
+ (BOOL)isContainmentBetweenAction:(id)a3 other:(id)a4;
+ (BOOL)isINStartCallIntentSupportedForAction:(id)a3;
+ (BOOL)isNSUAType:(id)a3;
+ (BOOL)isTitleEquivalenceBetweenAction:(id)a3 other:(id)a4;
+ (BOOL)shouldAcceptAudioOrVideoCallIntent:(id)a3;
+ (BOOL)shouldAcceptMessageContent:(id)a3;
+ (BOOL)shouldPredictRecipient:(id)a3 withDate:(id)a4 andRecipientDate:(id)a5;
+ (BOOL)uniqueRecipientsMatchedBetweenIntent:(id)a3 andIntent:(id)a4;
+ (double)calculateWeightWith:(unint64_t)a3 strength:(double)a4 termFreq:(unint64_t)a5 docFreq:(unint64_t)a6 docLength:(unint64_t)a7;
+ (double)computeNormalizedBetaDistEngagementScoreWithPriorAlpha:(int)a3 priorBeta:(int)a4 confirms:(double)a5 rejects:(double)a6 totalConfirms:(double)a7 totalRejects:(double)a8;
+ (id)_extractValueInKeyValueBlob:(id)a3 withKey:(id)a4;
+ (id)actionKeyFilterForCandidateBundleIds:(id)a3 candidateActionTypes:(id)a4 blacklist:(id)a5;
+ (id)atxActionFromProactiveSuggestion:(id)a3;
+ (id)atxActionsFromProactiveSuggestions:(id)a3;
+ (id)filterContainersWithNilAction:(id)a3;
+ (id)firstIntent:(id)a3 inAppLaunchSession:(id)a4;
+ (id)getActionTypeFromActionKey:(id)a3;
+ (id)getActionTypesFromActionKeys:(id)a3;
+ (id)getActivityTypeFromNSUAType:(id)a3;
+ (id)getBundleIdAndActionTypeFromActionKey:(id)a3;
+ (id)getBundleIdFromActionKey:(id)a3;
+ (id)getBundleIdsFromActionKeys:(id)a3;
+ (id)limitParameterCombinations:(id)a3 limit:(int)a4;
+ (id)markTodayInTitleAndUserActivityString:(id)a3 withActionKey:(id)a4;
+ (id)partOfWeekStringForDate:(id)a3;
+ (id)recipientFromMessageIntent:(id)a3;
+ (id)sha256hex:(id)a3;
+ (id)slotSetsForAction:(id)a3;
+ (id)slotSetsForAction:(id)a3 intentCache:(id)a4;
+ (id)stringForCoarseGeohash:(int64_t)a3;
+ (id)stringForCoarseTimePOWLocation:(id)a3 timeZone:(id)a4 coarseGeohash:(int64_t)a5;
+ (id)stringForDayOfWeek:(id)a3 timeZone:(id)a4;
+ (id)stringForSpecificGeohash:(int64_t)a3;
+ (id)stringForSpecificTimeDOWLocation:(id)a3 timeZone:(id)a4 geohash:(int64_t)a5;
+ (id)stringForTimeOfDayAndDayOfWeek:(id)a3 timeZone:(id)a4;
+ (id)stringForTwoHourTimeWindow:(id)a3 timeZone:(id)a4;
+ (id)stringForZoom7Geohash:(int64_t)a3;
+ (id)swapUserActivityString:(id)a3 withActionKey:(id)a4 withNewTitle:(id)a5 withNewDateString:(id)a6;
+ (id)timeOfDayAndDayOfWeekForDate:(id)a3 timeZone:(id)a4;
+ (int)timeBucketFromZeroToTwentyFour:(id)a3 timeZone:(id)a4;
+ (int)timeBucketFromZeroToTwentyFour:(unint64_t)a3;
+ (int64_t)localHourOfDayFromDate:(id)a3;
+ (void)fetchDataAndUpdateContentAttributeSetForAction:(id)a3;
+ (void)prefillActionHistograms;
+ (void)prefillActionSlotDatabase;
+ (void)resetActionPredictions;
@end

@implementation _ATXActionUtils

+ (id)getBundleIdAndActionTypeFromActionKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@":" options:2];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v5 = v4,
        uint64_t v6 = v4 + 1,
        objc_msgSend(v3, "rangeOfString:options:range:", @":", 2, v4 + 1, objc_msgSend(v3, "length") + ~v4) != 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = 0;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F93BB8]);
    v8 = [v3 substringToIndex:v5];
    v9 = [v3 substringFromIndex:v6];
    v10 = (void *)[v7 initWithFirst:v8 second:v9];
  }
  return v10;
}

+ (id)getActivityTypeFromNSUAType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"NSUA_" options:2];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v3 substringFromIndex:objc_msgSend(@"NSUA_", "length") + v4];
  }

  return v5;
}

+ (BOOL)isNSUAType:(id)a3
{
  return [a3 hasPrefix:@"NSUA_"];
}

+ (id)getBundleIdFromActionKey:(id)a3
{
  id v3 = +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:a3];
  uint64_t v4 = [v3 first];

  return v4;
}

+ (id)getActionTypeFromActionKey:(id)a3
{
  id v3 = +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:a3];
  uint64_t v4 = [v3 second];

  return v4;
}

+ (id)getActionTypesFromActionKeys:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    unint64_t v11 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = [a1 getActionTypeFromActionKey:v13];
        if (!v14)
        {
          v15 = [*(id *)(v11 + 2816) currentHandler];
          [v15 handleFailureInMethod:a2, a1, @"_ATXActionUtils.m", 74, @"No action type in action key: '%@'", v13 object file lineNumber description];

          unint64_t v11 = 0x1E4F28000;
        }
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (BOOL)isActionKey:(id)a3
{
  return [a3 containsString:@":"];
}

+ (id)getBundleIdsFromActionKeys:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    unint64_t v11 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = [a1 getBundleIdFromActionKey:v13];
        if (!v14)
        {
          v15 = [*(id *)(v11 + 2816) currentHandler];
          [v15 handleFailureInMethod:a2, a1, @"_ATXActionUtils.m", 90, @"No bundleId in action key: '%@'", v13 object file lineNumber description];

          unint64_t v11 = 0x1E4F28000;
        }
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)limitParameterCombinations:(id)a3 limit:(int)a4
{
  id v7 = a3;
  if (a4 < 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"_ATXActionUtils.m", 98, @"Invalid parameter not satisfying: %@", @"limit >= 0" object file lineNumber description];
  }
  if ([v7 count] > (unint64_t)a4)
  {
    uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_254];
    uint64_t v9 = objc_msgSend(v8, "subarrayWithRange:", 0, a4);
    uint64_t v10 = [v9 copy];

    id v7 = (id)v10;
  }
  return v7;
}

+ (id)slotSetsForAction:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = +[ATXIntentMetadataCache sharedInstance];
  uint64_t v6 = [v4 slotSetsForAction:v3 intentCache:v5];

  return v6;
}

+ (id)slotSetsForAction:(id)a3 intentCache:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 intent];
  if ([v5 actionType] && objc_msgSend(v5, "actionType") != 2)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F4B308]) initWithOpaqueParameters];
    id v24 = [v22 setWithObject:v23];

    goto LABEL_53;
  }
  uint64_t v8 = [v6 validParameterCombinationsWithSchemaForIntent:v7];
  uint64_t v9 = [v5 predictableParameterCombinations];
  uint64_t v10 = [v9 count];

  id v59 = v6;
  id v60 = v5;
  if (v10)
  {
    unint64_t v11 = objc_opt_new();
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v12 = [v5 predictableParameterCombinations];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v61 = v8;
      uint64_t v15 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v71 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          long long v18 = [v17 parameterKeys];

          if (v18)
          {
            id v19 = objc_alloc_init(MEMORY[0x1E4F30588]);
            long long v20 = [v17 parameterKeys];
            [v11 setObject:v19 forKeyedSubscript:v20];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v14);
      v21 = v61;
    }
    else
    {
      v21 = v8;
    }
    goto LABEL_35;
  }
  if (v6 && v8) {
    goto LABEL_37;
  }
  v25 = (void *)MEMORY[0x1E4F4AF00];
  v26 = [v5 bundleId];
  v21 = [v25 schemaWithoutFallbackForBundle:v26];

  v27 = (void *)MEMORY[0x1E4F4AF00];
  v28 = [v5 bundleId];
  int v29 = [v27 isSystemAppForBundleId:v28];

  if (v21)
  {
    uint64_t v30 = [v7 _validParameterCombinationsWithSchema:v21];

    [v6 setValidParameterCombinationsWithSchema:v30 intent:v7];
    uint64_t v8 = (void *)v30;
  }
  if ([v8 count]) {
    int v31 = 0;
  }
  else {
    int v31 = v29;
  }
  if (v31 == 1)
  {
    unint64_t v11 = [v7 _validParameterCombinations];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_36:

      uint64_t v8 = v11;
LABEL_37:
      v45 = __atxlog_handle_action_prediction();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        +[_ATXActionUtils slotSetsForAction:intentCache:](v8, v45);
      }

      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v63 = v8;
      v46 = [v8 allKeys];
      v47 = +[_ATXGlobals sharedInstance];
      v48 = +[_ATXActionUtils limitParameterCombinations:limit:](_ATXActionUtils, "limitParameterCombinations:limit:", v46, [v47 maximumParameterCombinations]);

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v49 = v48;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v64 objects:v74 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v65 != v52) {
              objc_enumerationMutation(v49);
            }
            v54 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_48;
            }
            id v55 = v7;
            if (![v54 containsObject:@"content"]
              || +[_ATXActionUtils shouldAcceptMessageContent:v55])
            {

LABEL_48:
              id v55 = (id)[objc_alloc(MEMORY[0x1E4F4B308]) initWithParameters:v54];
              [v24 addObject:v55];
            }
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v64 objects:v74 count:16];
        }
        while (v51);
      }

      id v6 = v59;
      id v5 = v60;
      uint64_t v8 = v63;
      goto LABEL_52;
    }
    v12 = [v7 buckets];
    if ([v12 count])
    {
      v32 = objc_opt_new();
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __49___ATXActionUtils_slotSetsForAction_intentCache___block_invoke;
      v68[3] = &unk_1E68B6908;
      id v62 = v32;
      id v69 = v62;
      [v11 enumerateKeysAndObjectsUsingBlock:v68];
      v33 = [MEMORY[0x1E4F1CAD0] setWithObject:@"buckets"];
      v34 = [v11 objectForKeyedSubscript:v33];

      if (v34)
      {
        unint64_t v35 = [v12 count];
        uint64_t v36 = 4;
        if (v35 < 4) {
          uint64_t v36 = v35;
        }
        if (v36)
        {
          unint64_t v37 = 0;
          do
          {
            v38 = [v11 objectForKeyedSubscript:v33];
            v39 = (void *)MEMORY[0x1E4F1CAD0];
            v40 = objc_msgSend(NSString, "stringWithFormat:", @"bucket_%i", ++v37);
            v41 = [v39 setWithObject:v40];
            [v62 setObject:v38 forKeyedSubscript:v41];

            unint64_t v42 = [v12 count];
            unint64_t v43 = 4;
            if (v42 < 4) {
              unint64_t v43 = v42;
            }
          }
          while (v43 > v37);
        }
      }
      id v44 = v62;

      unint64_t v11 = v44;
    }
LABEL_35:

    goto LABEL_36;
  }
  v57 = (void *)MEMORY[0x1E4F1CAD0];
  v58 = (void *)[objc_alloc(MEMORY[0x1E4F4B308]) initWithOpaqueParameters];
  id v24 = [v57 setWithObject:v58];

LABEL_52:
LABEL_53:

  return v24;
}

+ (id)filterContainersWithNilAction:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:&__block_literal_global_62_2];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

+ (void)fetchDataAndUpdateContentAttributeSetForAction:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 itemIdentifier];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v3 bundleId];

    if (v6)
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      uint64_t v8 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
      uint64_t v9 = *MEMORY[0x1E4F22CD0];
      v23[0] = @"_kMDItemThumbnailDataPath";
      v23[1] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      uint64_t v11 = *MEMORY[0x1E4F28340];
      v12 = [v3 bundleId];
      uint64_t v13 = [v3 itemIdentifier];
      uint64_t v22 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      long long v18 = __66___ATXActionUtils_fetchDataAndUpdateContentAttributeSetForAction___block_invoke;
      id v19 = &unk_1E68B4DB8;
      id v20 = v3;
      dispatch_semaphore_t v21 = v7;
      uint64_t v15 = v7;
      [v8 slowFetchAttributes:v10 protectionClass:v11 bundleID:v12 identifiers:v14 completionHandler:&v16];

      objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v15, 5.0, v16, v17, v18, v19);
    }
  }
}

+ (id)actionKeyFilterForCandidateBundleIds:(id)a3 candidateActionTypes:(id)a4 blacklist:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87___ATXActionUtils_actionKeyFilterForCandidateBundleIds_candidateActionTypes_blacklist___block_invoke;
  aBlock[3] = &unk_1E68B4D20;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  uint64_t v13 = _Block_copy(aBlock);

  return v13;
}

+ (void)prefillActionHistograms
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v2 = +[_ATXAppLaunchHistogramManager sharedInstance];
  long long v65 = [v2 histogramForLaunchType:14];
  long long v64 = [v2 histogramForLaunchType:17];
  v63 = [v2 histogramForLaunchType:20];
  id v62 = [v2 histogramForLaunchType:16];
  v61 = [v2 histogramForLaunchType:19];
  v58 = v2;
  id v60 = [v2 histogramForLaunchType:22];
  id v3 = objc_opt_new();
  uint64_t v4 = [v3 dateByAddingTimeInterval:-1209600.0];
  id v55 = +[_ATXDuetHelper sharedInstance];
  id v5 = [v55 getAppLaunchesBetweenStartDate:v4 endDate:v3];
  id v6 = objc_alloc_init(MEMORY[0x1E4F4B100]);
  long long v66 = [v6 getIntentEventsBetweenStartDate:v4 endDate:v3 forSource:1];

  id v7 = objc_alloc_init(MEMORY[0x1E4F4B3B8]);
  v56 = (void *)v4;
  v57 = v3;
  id v59 = [v7 getActivityIntentEventsBetweenStartDate:v4 endDate:v3];

  id v8 = __atxlog_handle_action_prediction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v75 = [v5 count];
    __int16 v76 = 2048;
    uint64_t v77 = [v66 count];
    __int16 v78 = 2048;
    uint64_t v79 = [v59 count];
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Prefilling histograms with %lu app sessions, %lu intent events, %lu activity events", buf, 0x20u);
  }

  [v65 resetData];
  [v64 resetData];
  [v63 resetData];
  [v62 resetData];
  [v61 resetData];
  [v60 resetData];
  v54 = +[ATXActionFeedback sharedInstance];
  [v54 resetData];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v69 objects:v73 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v70 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v16 = [v14 bundleId];
        if (v16)
        {
          id v17 = (void *)v16;
          uint64_t v18 = [v14 startDate];
          if (!v18) {
            goto LABEL_16;
          }
          id v19 = (void *)v18;
          uint64_t v20 = [v14 endDate];
          if (!v20) {
            goto LABEL_15;
          }
          dispatch_semaphore_t v21 = (void *)v20;
          uint64_t v22 = [v14 startDate];
          [v14 endDate];
          v68 = v19;
          v23 = v15;
          uint64_t v24 = v11;
          uint64_t v25 = v12;
          v27 = id v26 = v9;
          [v22 timeIntervalSinceDate:v27];
          double v29 = v28;

          id v9 = v26;
          uint64_t v12 = v25;
          uint64_t v11 = v24;
          uint64_t v15 = v23;

          if (v29 < 0.0)
          {
            id v17 = [a1 firstIntent:v66 inAppLaunchSession:v14];
            if (v17
              || ([a1 firstIntent:v59 inAppLaunchSession:v14],
                  (id v17 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v30 = (void *)MEMORY[0x1E4F4AE38];
              int v31 = [v17 bundleId];
              v32 = [v17 intentType];
              id v19 = [v30 getActionKeyForBundleId:v31 actionType:v32];

              v33 = [v17 dateInterval];
              v34 = [v33 startDate];
              LODWORD(v35) = 1.0;
              [v65 addLaunchWithBundleId:v19 date:v34 timeZone:0 weight:v35];

              uint64_t v36 = [v17 dateInterval];
              unint64_t v37 = [v36 startDate];
              LODWORD(v38) = 1.0;
              [v64 addLaunchWithBundleId:v19 date:v37 timeZone:0 weight:v38];

              v39 = [v17 dateInterval];
              v40 = [v39 startDate];
              LODWORD(v41) = 1.0;
              [v63 addLaunchWithBundleId:v19 date:v40 timeZone:0 weight:v41];

              unint64_t v42 = [v17 bundleId];
              unint64_t v43 = [v17 dateInterval];
              id v44 = [v43 startDate];
              LODWORD(v45) = 1.0;
              [v62 addLaunchWithBundleId:v42 date:v44 timeZone:0 weight:v45];

              v46 = [v17 bundleId];
              v47 = [v17 dateInterval];
              v48 = [v47 startDate];
              LODWORD(v49) = 1.0;
              [v61 addLaunchWithBundleId:v46 date:v48 timeZone:0 weight:v49];

              uint64_t v50 = [v17 bundleId];
              uint64_t v51 = [v17 dateInterval];
              uint64_t v52 = [v51 startDate];
              LODWORD(v53) = 1.0;
              [v60 addLaunchWithBundleId:v50 date:v52 timeZone:0 weight:v53];

LABEL_15:
LABEL_16:
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v69 objects:v73 count:16];
    }
    while (v11);
  }

  if ([v58 persistentStore])
  {
    flushHistogram(v65);
    flushHistogram(v64);
    flushHistogram(v63);
    flushHistogram(v62);
    flushHistogram(v61);
    flushHistogram(v60);
  }
}

+ (void)prefillActionSlotDatabase
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  id v3 = [v2 dateByAddingTimeInterval:-1209600.0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F4B100]);
  id v5 = [v4 getIntentEventsBetweenStartDate:v3 endDate:v2 forSource:1];

  id v6 = objc_alloc_init(MEMORY[0x1E4F4B3B8]);
  id v7 = [v6 getActivityIntentEventsBetweenStartDate:v3 endDate:v2];

  id v8 = __atxlog_handle_action_prediction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v35 = [v5 count];
    __int16 v36 = 2048;
    uint64_t v37 = [v7 count];
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Prefilling slot database with %lu intent events, %lu activity events", buf, 0x16u);
  }

  id v9 = +[_ATXDataStore sharedInstance];
  [v9 removeAllSlotsFromActionLog];
  uint64_t v10 = +[_ATXAppPredictor sharedInstance];
  uint64_t v11 = [v10 appIntentMonitor];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        LODWORD(v14) = 1.0;
        [v11 updateActionPredictionSlotResolutionForIntentEvent:*(void *)(*((void *)&v28 + 1) + 8 * v17++) weight:0 prevLocationUUID:0 locationUUID:4 currentMotionType:0 appSessionStartDate:0 appSessionEndDate:v14 geohash:-1 coarseGeohash:-1];
      }
      while (v15 != v17);
      uint64_t v15 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v15);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v18);
        }
        LODWORD(v20) = 1.0;
        objc_msgSend(v11, "updateActionPredictionSlotResolutionForIntentEvent:weight:prevLocationUUID:locationUUID:currentMotionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:", *(void *)(*((void *)&v24 + 1) + 8 * v23++), 0, 0, 4, 0, 0, v20, -1, -1, (void)v24);
      }
      while (v21 != v23);
      uint64_t v21 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v21);
  }
}

+ (id)firstIntent:(id)a3 inAppLaunchSession:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 startDate];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  uint64_t v10 = [v6 endDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v29;
    double v18 = -INFINITY;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v13);
        }
        double v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend(v20, "startDate", (void)v28);
        uint64_t v22 = v21;
        if (v21)
        {
          [v21 timeIntervalSinceReferenceDate];
          if (v9 <= v23 && v23 <= v12)
          {
            double v25 = v23;
            if (!v16 || v23 < v18)
            {
              id v26 = v20;

              uint64_t v16 = v26;
              double v18 = v25;
            }
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (void)resetActionPredictions
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = +[_ATXAppLaunchHistogramManager sharedInstance];
  id v3 = [v2 histogramForLaunchType:14];
  [v3 resetData];

  id v4 = [v2 histogramForLaunchType:16];
  [v4 resetData];

  id v5 = [v2 histogramForLaunchType:17];
  [v5 resetData];

  id v6 = [v2 histogramForLaunchType:19];
  [v6 resetData];

  id v7 = [v2 histogramForLaunchType:20];
  [v7 resetData];

  double v8 = [v2 histogramForLaunchType:22];
  [v8 resetData];

  double v9 = [v2 histogramForLaunchType:23];
  [v9 resetData];

  uint64_t v10 = [v2 histogramForLaunchType:25];
  [v10 resetData];

  double v11 = [v2 histogramForLaunchType:26];
  [v11 resetData];

  __int16 v36 = v2;
  double v12 = [v2 histogramForLaunchType:28];
  [v12 resetData];

  +[_ATXAppLaunchHistogramManager resetDataForCategoricalHistograms];
  id v13 = +[ATXActionFeedback sharedInstance];
  [v13 resetData];

  uint64_t v14 = objc_opt_new();
  [v14 resetAppIntentLocationData];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v15 = +[_ATXAppInfoManager sharedInstance];
  uint64_t v16 = [v15 allApps];

  obuint64_t j = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v38 = *(void *)v44;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v44 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * v19);
        uint64_t v21 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v22 = +[ATXHistogramBundleIdTable sharedInstance];
        double v23 = [MEMORY[0x1E4F1CA80] setWithObject:v20];
        long long v24 = +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:v23 candidateActionTypes:0 blacklist:0];
        double v25 = [v22 allKeysFilteredBy:v24];

        id v26 = +[_ATXAppLaunchSequenceManager sharedInstance];
        long long v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v25];
        [v26 deleteAllLaunchesForAppActions:v27];

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v28 = v25;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v40;
          do
          {
            uint64_t v32 = 0;
            do
            {
              if (*(void *)v40 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v39 + 1) + 8 * v32);
              v34 = +[ATXHistogramBundleIdTable sharedInstance];
              [v34 remove:v33];

              ++v32;
            }
            while (v30 != v32);
            uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v30);
        }

        ++v19;
      }
      while (v19 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v18);
  }

  uint64_t v35 = +[_ATXDataStore sharedInstance];
  [v35 removeAllSlotsFromActionLog];
  [v35 removeAllSlotsFromActionFeedback];
  [v35 removeAllSlotsFromSlotSetKey];
}

+ (id)_extractValueInKeyValueBlob:(id)a3 withKey:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v20 = v5;
  id v7 = [v5 componentsSeparatedByString:@",'"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v13 containsString:@"'="])
        {
          uint64_t v14 = [v13 componentsSeparatedByString:@"'="];
        }
        else
        {
          uint64_t v14 = 0;
        }
        if ([v14 count] == 2)
        {
          uint64_t v15 = [v14 objectAtIndex:0];
          int v16 = [v15 isEqualToString:v6];

          if (v16)
          {
            uint64_t v17 = [v14 objectAtIndex:1];
            uint64_t v18 = [v17 stringByRemovingPercentEncoding];

            uint64_t v10 = (void *)v18;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)swapUserActivityString:(id)a3 withActionKey:(id)a4 withNewTitle:(id)a5 withNewDateString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 componentsSeparatedByString:@"'"];
  uint64_t v15 = [v14 objectAtIndexedSubscript:1];

  int v16 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"{}"];
  uint64_t v17 = [v10 componentsSeparatedByCharactersInSet:v16];
  uint64_t v18 = [v17 objectAtIndex:1];
  uint64_t v19 = [v18 substringFromIndex:1];

  if (v19 && [v11 isEqualToString:*MEMORY[0x1E4F4AD60]])
  {
    uint64_t v20 = [a1 _extractValueInKeyValueBlob:v19 withKey:*MEMORY[0x1E4F4AD58]];
    long long v21 = (void *)v20;
    if (v15 && v20)
    {
      long long v22 = [v10 stringByReplacingOccurrencesOfString:v15 withString:v12];
      id v23 = [v22 stringByReplacingOccurrencesOfString:v21 withString:v13];

      goto LABEL_8;
    }
  }
  else
  {
    long long v21 = 0;
  }
  id v23 = v10;
LABEL_8:

  return v23;
}

+ (id)markTodayInTitleAndUserActivityString:(id)a3 withActionKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v8 = [v5 dateInterval];
  uint64_t v9 = [v8 startDate];
  id v10 = [v7 startOfDayForDate:v9];

  id v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v12 = (void *)MEMORY[0x1E4F4AE38];
  id v13 = [v5 action];
  uint64_t v14 = [v13 userActivityString];
  v63 = v6;
  uint64_t v15 = [v12 getDateFromUserActivityString:v14 forActionKey:v6];
  int v16 = [v11 startOfDayForDate:v15];

  if (v10 && v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = v10;
    uint64_t v19 = objc_opt_new();
    [v19 setDateFormat:@"MMMM dd, yyyy"];
    uint64_t v20 = [v5 action];
    long long v21 = [v20 userActivity];
    long long v22 = [v21 title];
    id v23 = [v22 stringByRemovingPercentEncoding];
    uint64_t v24 = [v19 dateFromString:v23];

    id v62 = (void *)v24;
    if (!v24)
    {
      id v25 = v5;

      id v10 = v18;
      int v16 = v17;
      goto LABEL_13;
    }
    v61 = v19;
    id v25 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v10 = v18;
    uint64_t v26 = v18;
    int v16 = v17;
    long long v27 = [v25 components:16 fromDate:v26 toDate:v17 options:0];
    uint64_t v28 = [v27 day];

    if (v28)
    {
      unint64_t v29 = 0x1E4F4A000;
      if (v28 != 1)
      {
        int v49 = 1;
LABEL_11:

        if (!v49) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      uint64_t v30 = @"$TOMORROW_FROM_REFERENCE_DATE$";
      uint64_t v31 = @"$TOMORROW$";
    }
    else
    {
      uint64_t v30 = @"$TODAY_FROM_REFERENCE_DATE$";
      uint64_t v31 = @"$TODAY$";
      unint64_t v29 = 0x1E4F4A000uLL;
    }
    uint64_t v32 = ATXLocalizationNotNeeded();
    uint64_t v33 = [v5 action];
    v34 = [v33 userActivity];
    [v34 setTitle:v32];

    uint64_t v35 = [v5 action];
    __int16 v36 = [v35 userActivityString];
    id v60 = +[_ATXActionUtils swapUserActivityString:v36 withActionKey:v63 withNewTitle:v31 withNewDateString:v30];

    id v37 = objc_alloc(*(Class *)(v29 + 3640));
    v58 = [v5 action];
    id v59 = [v58 actionUUID];
    v57 = [v5 action];
    double v53 = [v57 bundleId];
    v56 = [v5 action];
    uint64_t v38 = [v56 itemIdentifier];
    v54 = [v5 action];
    long long v39 = [v54 contentAttributeSet];
    uint64_t v52 = [v5 action];
    long long v40 = [v52 heuristic];
    long long v41 = [v5 action];
    long long v42 = [v41 heuristicMetadata];
    long long v43 = [v5 action];
    LOBYTE(v51) = [v43 isFutureMedia];
    id v55 = (void *)[v37 initWithNSUserActivityString:v60 actionUUID:v59 bundleId:v53 itemIdentifier:v38 contentAttributeSet:v39 heuristic:v40 heuristicMetadata:v42 isFutureMedia:v51 title:0 subtitle:0];

    id v44 = objc_alloc(MEMORY[0x1E4F4B0F8]);
    long long v45 = [v5 action];
    long long v46 = [v45 bundleId];
    v47 = [v5 intentType];
    v48 = [v5 dateInterval];
    id v25 = (id)[v44 initWithBundleId:v46 intentType:v47 dateInterval:v48 action:v55];

    int v49 = 0;
    goto LABEL_11;
  }
LABEL_12:
  id v25 = v5;
LABEL_13:

  return v25;
}

+ (int64_t)localHourOfDayFromDate:(id)a3
{
  int64_t v8 = 0;
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  [v5 getHour:&v8 minute:0 second:0 nanosecond:0 fromDate:v4];

  int64_t v6 = v8;
  return v6;
}

+ (id)timeOfDayAndDayOfWeekForDate:(id)a3 timeZone:(id)a4
{
  id v5 = a4;
  int64_t v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a3;
  int64_t v8 = [v6 currentCalendar];
  uint64_t v9 = v8;
  if (v5) {
    [v8 setTimeZone:v5];
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v16 = 0;
  uint64_t v10 = [v9 component:512 fromDate:v7] - 1;
  [v9 getHour:&v18 minute:&v17 second:&v16 nanosecond:0 fromDate:v7];

  id v11 = (void *)MEMORY[0x1E4F93BB8];
  id v12 = [NSNumber numberWithInteger:3600 * v18 + 60 * v17 + v16];
  id v13 = [NSNumber numberWithInteger:v10];
  uint64_t v14 = [v11 tupleWithFirst:v12 second:v13];

  return v14;
}

+ (id)stringForTimeOfDayAndDayOfWeek:(id)a3 timeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v8 = v7;
  if (v6) {
    [v7 setTimeZone:v6];
  }
  uint64_t v9 = [v8 components:544 fromDate:v5];
  uint64_t v10 = [v9 weekday] - 1;
  int v11 = [v9 hour];
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%01d%01d", (v11 / 4), v10);

  return v12;
}

+ (id)stringForTwoHourTimeWindow:(id)a3 timeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v8 = v7;
  if (v6) {
    [v7 setTimeZone:v6];
  }
  uint64_t v9 = [v8 components:32 fromDate:v5];
  int v10 = [v9 hour];
  int v11 = objc_msgSend(NSString, "stringWithFormat:", @"%02d", (v10 / 12));

  return v11;
}

+ (id)stringForDayOfWeek:(id)a3 timeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v8 = v7;
  if (v6) {
    [v7 setTimeZone:v6];
  }
  uint64_t v9 = [v8 components:512 fromDate:v5];
  int v10 = [v9 weekday];
  int v11 = objc_msgSend(NSString, "stringWithFormat:", @"%01d", (v10 - 1));

  return v11;
}

+ (int)timeBucketFromZeroToTwentyFour:(unint64_t)a3
{
  return (int)a3 / 3456;
}

+ (int)timeBucketFromZeroToTwentyFour:(id)a3 timeZone:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a3;
  int64_t v8 = [v6 currentCalendar];
  uint64_t v9 = v8;
  if (v5) {
    [v8 setTimeZone:v5];
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v13 = 0;
  int v10 = [v9 component:512 fromDate:v7];
  [v9 getHour:&v15 minute:&v14 second:&v13 nanosecond:0 fromDate:v7];

  int v11 = (3600 * (int)v15 + 86400 * v10 + 60 * (int)v14 + (int)v13 - 86400) % 86400 / 3456;
  return v11;
}

+ (id)stringForSpecificTimeDOWLocation:(id)a3 timeZone:(id)a4 geohash:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v10 = v9;
  if (v8) {
    [v9 setTimeZone:v8];
  }
  int v11 = [v10 components:608 fromDate:v7];
  uint64_t v12 = [v11 weekday] - 1;
  int v13 = [v11 hour];
  int v14 = [v11 minute];
  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d-%01d-%lld", ((v14 + 60 * v13) / 30), v12, a5);

  return v15;
}

+ (id)stringForCoarseTimePOWLocation:(id)a3 timeZone:(id)a4 coarseGeohash:(int64_t)a5
{
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1C9A8];
  id v9 = a3;
  int v10 = [v8 currentCalendar];
  int v11 = v10;
  if (v7) {
    [v10 setTimeZone:v7];
  }
  uint64_t v12 = [v11 components:544 fromDate:v9];
  unsigned int v13 = [v11 isDateInWeekend:v9];

  int v14 = [v12 hour];
  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%01d-%01d-%lld", (v14 / 4), v13, a5);

  return v15;
}

+ (id)stringForSpecificGeohash:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
}

+ (id)stringForCoarseGeohash:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
}

+ (id)stringForZoom7Geohash:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
}

+ (BOOL)uniqueRecipientsMatchedBetweenIntent:(id)a3 andIntent:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [v5 recipients];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = [*(id *)(*((void *)&v27 + 1) + 8 * v12) displayName];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  int v14 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v15 = objc_msgSend(v6, "recipients", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v23 + 1) + 8 * v19) displayName];
        [v14 addObject:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  char v21 = [v7 isEqualToSet:v14];
  return v21;
}

+ (BOOL)isTitleEquivalenceBetweenAction:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([MEMORY[0x1E4F4B2B8] isActionEligibleForSettingsSuggestions:v5] & 1) != 0
    || ([MEMORY[0x1E4F4B2B8] isActionEligibleForSettingsSuggestions:v6] & 1) != 0
    || ([v5 actionKey],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v6 actionKey],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        !v9))
  {
    char v15 = 0;
  }
  else
  {
    uint64_t v10 = [v5 actionTitle];
    uint64_t v11 = [v6 actionTitle];
    uint64_t v12 = [v5 actionSubtitle];
    unsigned int v13 = [v6 actionSubtitle];
    if (v10 == v11)
    {
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
      if (v10 && v11) {
        char v14 = [v10 isEqualToString:v11];
      }
    }
    if (v12 == v13)
    {
      char v17 = 1;
    }
    else
    {
      char v17 = 0;
      if (v12 && v13) {
        char v17 = [v12 isEqualToString:v13];
      }
    }
    char v15 = v14 & v17;
  }
  return v15;
}

+ (BOOL)isCallIntentEquivalenceBetweenAction:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 bundleId];
  id v8 = [v6 bundleId];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [v5 intent];
    uint64_t v11 = [v10 _className];

    uint64_t v12 = [v6 intent];
    unsigned int v13 = [v12 _className];

    char v14 = [v11 isEqualToString:@"INStartAudioCallIntent"];
    char v15 = v13;
    if ((v14 & 1) != 0
      || (v16 = [v11 isEqualToString:@"INStartVideoCallIntent"], char v15 = v13, (v16 & 1) != 0)
      || (char v17 = [v13 isEqualToString:@"INStartAudioCallIntent"], v15 = v11, (v17 & 1) != 0)
      || (int v18 = [v13 isEqualToString:@"INStartVideoCallIntent"], v15 = v11, v18))
    {
      LOBYTE(v9) = [v15 isEqualToString:@"INStartCallIntent"];
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

+ (BOOL)isContainmentBetweenAction:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 == v6)
  {
    LOBYTE(v8) = 1;
    goto LABEL_17;
  }
  LOBYTE(v8) = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [v5 actionType];
    if (v9 == [v7 actionType])
    {
      uint64_t v10 = [v5 actionKey];
      uint64_t v11 = [v7 actionKey];
      int v8 = [v10 isEqualToString:v11];

      if (!v8) {
        goto LABEL_17;
      }
      if (![v5 actionType] || objc_msgSend(v5, "actionType") == 2)
      {
        uint64_t v12 = [v5 slotSet];
        unsigned int v13 = [v7 slotSet];
        char v14 = [v12 parameters];
        char v15 = [v13 parameters];
        char v16 = [v14 isSubsetOfSet:v15];

        char v17 = v12;
        if (v16) {
          goto LABEL_10;
        }
        int v18 = [v13 parameters];
        uint64_t v19 = [v12 parameters];
        int v20 = [v18 isSubsetOfSet:v19];

        char v17 = v13;
        if (v20)
        {
LABEL_10:
          id v21 = v17;
          long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F4B300]) initWithAction:v5 slots:v21];
          long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F4B300]) initWithAction:v7 slots:v21];
          LOBYTE(v8) = [v22 isEqual:v23];
        }
        else
        {
          LOBYTE(v8) = 0;
        }

        goto LABEL_17;
      }
      if ([v5 actionType] == 1)
      {
        LOBYTE(v8) = [v5 isEqual:v7];
        goto LABEL_17;
      }
    }
    LOBYTE(v8) = 0;
  }
LABEL_17:

  return v8;
}

+ (id)sha256hex:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  uint64_t v4 = 0;
  id v5 = v15;
  v6.i64[0] = 0x9F9F9F9F9F9F9F9FLL;
  v6.i64[1] = 0x9F9F9F9F9F9F9F9FLL;
  v7.i64[0] = 0x3030303030303030;
  v7.i64[1] = 0x3030303030303030;
  v8.i64[0] = 0x3737373737373737;
  v8.i64[1] = 0x3737373737373737;
  v9.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v9.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v10.i64[0] = 0x909090909090909;
  v10.i64[1] = 0x909090909090909;
  do
  {
    int8x16_t v11 = *(int8x16_t *)&md[v4];
    v19.val[0] = (int8x16_t)vsraq_n_u8((uint8x16_t)vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v11, v6), v8, v7), (uint8x16_t)v11, 4uLL);
    int8x16_t v12 = vandq_s8(v11, v9);
    v19.val[1] = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v12, v10), v8, v7), v12);
    vst2q_s8((char *)v5, v19);
    v5 += 32;
    v4 += 16;
  }
  while (v4 != 32);
  unsigned int v13 = (void *)[[NSString alloc] initWithBytes:v15 length:64 encoding:1];

  return v13;
}

+ (double)calculateWeightWith:(unint64_t)a3 strength:(double)a4 termFreq:(unint64_t)a5 docFreq:(unint64_t)a6 docLength:(unint64_t)a7
{
  switch(a3)
  {
    case 0uLL:
      double v11 = (double)a7;
      return 1.0 / pow(v11, a4);
    case 1uLL:
      return 1.0 / (a4 + 1.0);
    case 2uLL:
      double v13 = log((double)a7 + 1.0);
      long double v14 = ((double)a5 + 1.0) * (log((double)a5 + 1.0) * v13);
      long double v15 = log((double)a6 + 1.0);
      return 1.0 / pow(v15 * v14, a4);
    case 3uLL:
      long double v16 = pow((double)(a6 * a5), 2.0 - a4);
      return v16 / (double)(a6 * a5) * (1.0 / pow((double)(a7 * a5), a4 + -1.0));
    case 4uLL:
      double v11 = (double)(a7 * a6);
      return 1.0 / pow(v11, a4);
    default:
      __break(1u);
      JUMPOUT(0x1D1378FB0);
  }
}

+ (BOOL)shouldPredictRecipient:(id)a3 withDate:(id)a4 andRecipientDate:(id)a5
{
  if (!a5) {
    return 1;
  }
  [a4 timeIntervalSinceDate:a5];
  double v6 = v5;
  int8x16_t v7 = +[_ATXGlobals sharedInstance];
  BOOL v8 = v6 > (double)(int)[v7 messageContentTimeElapsed];

  return v8;
}

+ (BOOL)shouldAcceptMessageContent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_ATXGlobals sharedInstance];
  double v5 = [v3 content];

  if (!v5) {
    goto LABEL_6;
  }
  double v6 = [v5 componentsSeparatedByString:@" "];
  if ((unint64_t)[v6 count] <= 1)
  {

    goto LABEL_6;
  }
  int8x16_t v7 = [v4 messageContentBlacklist];
  int v8 = [v7 containsObject:v5];

  if (v8)
  {
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

+ (id)recipientFromMessageIntent:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 conversationIdentifier];
  double v5 = [v4 lowercaseString];

  if (!v5)
  {
    double v6 = [v3 speakableGroupName];
    int8x16_t v7 = [v6 spokenPhrase];
    double v5 = [v7 lowercaseString];

    if (!v5)
    {
      int v8 = [v3 recipients];
      if ([v8 count])
      {
        BOOL v9 = objc_opt_new();
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              long double v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              long double v16 = objc_msgSend(v15, "contactIdentifier", (void)v23);

              if (v16)
              {
                uint64_t v17 = [v15 contactIdentifier];
              }
              else
              {
                int v18 = [v15 displayName];

                if (!v18)
                {
                  id v21 = __atxlog_handle_action_prediction();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
                    +[_ATXActionUtils recipientFromMessageIntent:](v21);
                  }

                  goto LABEL_21;
                }
                uint64_t v17 = [v15 displayName];
              }
              int8x16x2_t v19 = v17;
              int v20 = [v17 lowercaseString];
              [v9 addObject:v20];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        [v9 sortUsingSelector:sel_caseInsensitiveCompare_];
        double v5 = [v9 componentsJoinedByString:@","];
      }
      else
      {
        BOOL v9 = __atxlog_handle_action_prediction();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          +[_ATXActionUtils recipientFromMessageIntent:](v9);
        }
LABEL_21:
        double v5 = 0;
      }
    }
  }

  return v5;
}

+ (id)partOfWeekStringForDate:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  double v5 = [v3 currentCalendar];
  int v6 = [v5 isDateInWeekend:v4];

  if (v6) {
    int8x16_t v7 = @"weekend";
  }
  else {
    int8x16_t v7 = @"weekday";
  }
  int v8 = v7;

  return v8;
}

+ (BOOL)isINStartCallIntentSupportedForAction:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F4AF00];
  id v4 = [a3 bundleId];
  double v5 = [v3 appInfoForBundle:v4];

  int v6 = [v5 supportedActions];
  char v7 = [v6 containsObject:@"INStartCallIntent"];

  return v7;
}

+ (BOOL)shouldAcceptAudioOrVideoCallIntent:(id)a3
{
  id v4 = a3;
  if ([v4 actionType]) {
    goto LABEL_2;
  }
  char v7 = [v4 intent];
  int v8 = [v7 _className];
  if ([v8 isEqual:@"INStartAudioCallIntent"])
  {
  }
  else
  {
    BOOL v9 = [v4 intent];
    id v10 = [v9 _className];
    int v11 = [v10 isEqual:@"INStartVideoCallIntent"];

    if (!v11) {
      goto LABEL_2;
    }
  }
  if ([a1 isINStartCallIntentSupportedForAction:v4])
  {
    BOOL v5 = 0;
    goto LABEL_3;
  }
LABEL_2:
  BOOL v5 = 1;
LABEL_3:

  return v5;
}

+ (double)computeNormalizedBetaDistEngagementScoreWithPriorAlpha:(int)a3 priorBeta:(int)a4 confirms:(double)a5 rejects:(double)a6 totalConfirms:(double)a7 totalRejects:(double)a8
{
  int v8 = a4 + a3;
  double v9 = (double)a3 + a7;
  double v10 = (double)a4 + a8;
  return (v9 / (v9 + v10) * (double)v8 + a5)
       / (v10 / (v9 + v10) * (double)v8 + v9 / (v9 + v10) * (double)v8 + a5 + a6)
       / (v9
        / (v9 + v10)
        * (double)v8
        / (v9 / (v9 + v10) * (double)v8 + v10 / (v9 + v10) * (double)v8));
}

+ (id)atxActionFromProactiveSuggestion:(id)a3
{
  id v3 = [a3 executableSpecification];
  if ([v3 executableType] == 2
    && ([v3 executableObject],
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    int v6 = [v3 executableObject];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

+ (id)atxActionsFromProactiveSuggestions:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___ATXActionUtils_atxActionsFromProactiveSuggestions___block_invoke;
  v5[3] = &__block_descriptor_40_e32__16__0__ATXProactiveSuggestion_8l;
  v5[4] = a1;
  id v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);
  return v3;
}

+ (void)slotSetsForAction:(void *)a1 intentCache:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Donation Processing - # slots received: %lu", (uint8_t *)&v3, 0xCu);
}

+ (void)recipientFromMessageIntent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "No recipients found for INSendMessageIntent", v1, 2u);
}

+ (void)recipientFromMessageIntent:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "No contactIdentifier or display name found for the recipients in the INSendMessageIntent", v1, 2u);
}

@end