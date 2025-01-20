@interface SGMISubmodelsManager
+ (void)addSubmodelStatsToLog:(id)a3;
+ (void)checkForAndProcessVersionChange;
+ (void)incrementalSubmodelUpdateWithSaliencyModelConfig:(id)a3 store:(id)a4 shouldContinue:(id)a5 finalGroundTruthDate:(id)a6 withSimulatedCSSearchableItemForTesting:(id)a7 limit:(unint64_t)a8;
+ (void)incrementalSubmodelUpdateWithSaliencyModelConfig:(id)a3 store:(id)a4 shouldContinue:(id)a5 finalGroundTruthDate:(id)a6 withSimulatedCSSearchableItemForTesting:(id)a7 limit:(unint64_t)a8 log:(id)a9;
+ (void)incrementalSubmodelUpdateWithStore:(id)a3 limit:(unint64_t)a4 log:(id)a5;
+ (void)incrementalSubmodelUpdateWithStore:(id)a3 shouldContinue:(id)a4 limit:(unint64_t)a5 log:(id)a6;
+ (void)pruneDB;
+ (void)purgeDeletedEmailsReferencesFromStore:(id)a3;
+ (void)purgeOldTokensFromStore:(id)a3;
+ (void)purgeTokensToMatchCappingPolicyFromStore:(id)a3;
@end

@implementation SGMISubmodelsManager

+ (void)addSubmodelStatsToLog:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[SGSqlEntityStore defaultStore];
  v5 = +[SGMISaliencyModelConfig defaultConfig];
  unint64_t v6 = [v5 minCountToConsiderATokenAsHighlyDiscriminant];
  unint64_t v7 = [v5 minCountToConsiderATokenAsExtremelyDiscriminant];
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  unint64_t v49 = v8;
  if (v8)
  {
    [v5 ratioToConsiderATokenAsHighlyDiscriminant];
    double v10 = v9;
    [v5 ratioToConsiderATokenAsExtremelyDiscriminant];
    if (v10 >= v11) {
      double v10 = v11;
    }
    v12 = objc_opt_new();
    v13 = [v4 sgmiFeatureStore];
    v14 = [v13 submodelsAgesInDays];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v50 = [&unk_1F2536B00 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v50)
    {
      id v44 = v3;
      v45 = v12;
      v47 = v14;
      v48 = v4;
      id v15 = 0;
      uint64_t v46 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v57 != v46) {
            objc_enumerationMutation(&unk_1F2536B00);
          }
          v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v18 = objc_opt_new();
          [v18 setNbHighlyDiscriminantTokensForSaliency:0];
          [v18 setNbHighlyDiscriminantTokensForIgnorability:0];
          [v18 setNbExtremelyDiscriminantTokensForSaliency:0];
          [v18 setNbExtremelyDiscriminantTokensForIgnorability:0];
          v19 = [v14 objectForKeyedSubscript:v17];
          if (v19)
          {
            v20 = [v14 objectForKeyedSubscript:v17];
            objc_msgSend(v18, "setAgeOfTheSubmodelInDays:", objc_msgSend(v20, "unsignedIntValue"));
          }
          else
          {
            [v18 setAgeOfTheSubmodelInDays:0];
          }

          v51 = v17;
          v21 = objc_msgSend(v48, "highlyDiscriminantTokensForFeature:minCount:minRatio:", (int)objc_msgSend(v17, "intValue"), v49, v10);

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v15 = v21;
          uint64_t v22 = [v15 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v53 != v24) {
                  objc_enumerationMutation(v15);
                }
                v26 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                v27 = objc_msgSend(v26, "salientCount", v44);
                unint64_t v28 = [v27 unsignedIntegerValue];

                v29 = [v26 regularCount];
                unint64_t v30 = [v29 unsignedIntegerValue];

                unint64_t v31 = v30 + v28;
                double v32 = (double)(v30 + v28);
                unint64_t v33 = [v5 minCountToConsiderATokenAsHighlyDiscriminant];
                if (v28 <= v30)
                {
                  double v37 = (double)v30 / v32;
                  if (v31 >= v33)
                  {
                    [v5 ratioToConsiderATokenAsHighlyDiscriminant];
                    if (v37 >= v38) {
                      objc_msgSend(v18, "setNbHighlyDiscriminantTokensForIgnorability:", objc_msgSend(v18, "nbHighlyDiscriminantTokensForIgnorability") + 1);
                    }
                  }
                  if (v31 >= [v5 minCountToConsiderATokenAsExtremelyDiscriminant])
                  {
                    [v5 ratioToConsiderATokenAsExtremelyDiscriminant];
                    if (v37 >= v39) {
                      objc_msgSend(v18, "setNbExtremelyDiscriminantTokensForIgnorability:", objc_msgSend(v18, "nbExtremelyDiscriminantTokensForIgnorability") + 1);
                    }
                  }
                }
                else
                {
                  double v34 = (double)v28 / v32;
                  if (v31 >= v33)
                  {
                    [v5 ratioToConsiderATokenAsHighlyDiscriminant];
                    if (v34 >= v35) {
                      objc_msgSend(v18, "setNbHighlyDiscriminantTokensForSaliency:", objc_msgSend(v18, "nbHighlyDiscriminantTokensForSaliency") + 1);
                    }
                  }
                  if (v31 >= [v5 minCountToConsiderATokenAsExtremelyDiscriminant])
                  {
                    [v5 ratioToConsiderATokenAsExtremelyDiscriminant];
                    if (v34 >= v36) {
                      objc_msgSend(v18, "setNbExtremelyDiscriminantTokensForSaliency:", objc_msgSend(v18, "nbExtremelyDiscriminantTokensForSaliency") + 1);
                    }
                  }
                }
              }
              uint64_t v23 = [v15 countByEnumeratingWithState:&v52 objects:v61 count:16];
            }
            while (v23);
          }

          +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)[v18 nbHighlyDiscriminantTokensForSaliency]);
          [v18 setNbHighlyDiscriminantTokensForSaliency:v40];
          +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)[v18 nbHighlyDiscriminantTokensForIgnorability]);
          [v18 setNbHighlyDiscriminantTokensForIgnorability:v41];
          +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)[v18 nbExtremelyDiscriminantTokensForSaliency]);
          [v18 setNbExtremelyDiscriminantTokensForSaliency:v42];
          +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)[v18 nbExtremelyDiscriminantTokensForIgnorability]);
          [v18 setNbExtremelyDiscriminantTokensForIgnorability:v43];
          switch([v51 intValue])
          {
            case 0x3E8u:
              [v45 setPersonFromSenderStats:v18];
              break;
            case 0x3E9u:
              [v45 setPersonToRecipientsStats:v18];
              break;
            case 0x3EAu:
              [v45 setPersonCCRecipientsStats:v18];
              break;
            case 0x3EBu:
              [v45 setSubjectContentStats:v18];
              break;
            case 0x3ECu:
              [v45 setDomainFromSenderStats:v18];
              break;
            case 0x3EDu:
              [v45 setPersonFromSenderInDyadicConversationStats:v18];
              break;
            case 0x3F0u:
              [v45 setConversationStats:v18];
              break;
            default:
              break;
          }

          v14 = v47;
        }
        uint64_t v50 = [&unk_1F2536B00 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v50);

      id v3 = v44;
      v12 = v45;
      v4 = v48;
    }
    objc_msgSend(v3, "setSubmodelsStats:", v12, v44);
  }
  else
  {
    v12 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA650000, v12, OS_LOG_TYPE_FAULT, "SGMISubmodelsManager: Invalid min counts requirements in SGMISaliencyModelConfig.", buf, 2u);
    }
  }
}

+ (void)checkForAndProcessVersionChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = +[SGSqlEntityStore defaultStore];
  id v3 = [v2 getNSStringForKey:@"lastSGMIModelInferenceVersion"];
  v4 = [v2 getNSStringForKey:@"lastSGMIModelGroundTruthVersion"];
  v5 = +[SGMISaliencyModelConfig inferenceVersion];
  unint64_t v6 = +[SGMISaliencyModelConfig groundTruthVersion];
  unint64_t v7 = v6;
  if (v3) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    double v9 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: No prior model version data. Not processing as version change.", (uint8_t *)&v15, 2u);
    }
LABEL_15:

    if (!v5)
    {
      if (!v7) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
LABEL_29:
    [v2 setNSString:v5 forKey:@"lastSGMIModelInferenceVersion"];
    if (!v7) {
      goto LABEL_31;
    }
LABEL_30:
    [v2 setNSString:v7 forKey:@"lastSGMIModelGroundTruthVersion"];
    goto LABEL_31;
  }
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    double v9 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGMISubmodelsManager: Current model version data is not set. Is OTA / Trial configuration for both inference and ground truth versions correct? Not processing as version change.", (uint8_t *)&v15, 2u);
    }
    goto LABEL_15;
  }
  if (([v6 isEqualToString:v4] & 1) == 0)
  {
    v14 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      v16 = v4;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: Ground truth model version updated from %@ to %@. Purging all stateful data.", (uint8_t *)&v15, 0x16u);
    }

    [v2 clearMailIntelligence];
    goto LABEL_29;
  }
  char v11 = [v5 isEqualToString:v3];
  v12 = sgMailIntelligenceLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) == 0)
  {
    if (v13)
    {
      int v15 = 138412546;
      v16 = v3;
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: Inference version updated from %@ to %@ without change in ground truth model version. Retaining submodels and setting all saliency scores to 0.", (uint8_t *)&v15, 0x16u);
    }

    [v2 setAllMailIntelligenceAsNotSalient];
    goto LABEL_29;
  }
  if (v13)
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: No version update to process.", (uint8_t *)&v15, 2u);
  }

LABEL_31:
}

+ (void)purgeTokensToMatchCappingPolicyFromStore:(id)a3
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1F25360F0;
  v8[1] = &unk_1F2536150;
  v9[0] = &unk_1F2536138;
  v9[1] = &unk_1F2536168;
  v8[2] = &unk_1F2536180;
  v8[3] = &unk_1F2536108;
  v9[2] = &unk_1F2536138;
  v9[3] = &unk_1F2536168;
  v8[4] = &unk_1F2536120;
  v9[4] = &unk_1F2536168;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
  v4 = +[SGSqlEntityStore defaultStore];
  v5 = [v4 getViolationsToTokenCountsPolicy:v3];

  unint64_t v6 = +[SGSqlEntityStore defaultStore];
  LODWORD(v7) = 1036831949;
  [v6 applyCappingPolicy:v3 byDiscardingTokensCounts:v5 withMargin:v7];
}

+ (void)purgeOldTokensFromStore:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  v5 = [v3 dateWithTimeIntervalSinceNow:-31536000.0];
  unint64_t v6 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    BOOL v8 = v5;
    _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: Clearing all tokens from submodel token store that haven't been since %@ or earlier", (uint8_t *)&v7, 0xCu);
  }

  [v4 purgeTokensWhichLastUpdateWasBefore:v5];
}

+ (void)purgeDeletedEmailsReferencesFromStore:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "SGMISubmodelsManager: Starting purge of deleted emails references", buf, 2u);
  }

  uint64_t v22 = 0;
  uint64_t v23 = 0;
  *(void *)buf = @"SGMISubmodelsManager - Purge deleted emails references";
  uint64_t v5 = mach_absolute_time();
  uint64_t v22 = v5;
  uint64_t v6 = *MEMORY[0x1E4F22B18];
  v26[0] = &unk_1F25360F0;
  v26[1] = &unk_1F2536108;
  uint64_t v7 = *MEMORY[0x1E4F233C8];
  v27[0] = v6;
  v27[1] = v7;
  v26[2] = &unk_1F2536120;
  v27[2] = *MEMORY[0x1E4F22A38];
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  uint64_t v9 = [v3 getSGMIStoredAddresses];
  BOOL v10 = objc_opt_new();
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  __int16 v17 = __62__SGMISubmodelsManager_purgeDeletedEmailsReferencesFromStore___block_invoke;
  v18 = &unk_1E65BF880;
  id v11 = v8;
  id v19 = v11;
  id v12 = v10;
  id v20 = v12;
  [v9 enumerateKeysAndObjectsUsingBlock:&v15];
  objc_msgSend(v3, "deleteTokensForDeletedEmailAddresses:", v12, v15, v16, v17, v18);
  BOOL v13 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = mach_absolute_time() - v5;
    if (SGMachTimeToNanoseconds_onceToken != -1) {
      dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_16442);
    }
    *(_DWORD *)uint64_t v24 = 134217984;
    double v25 = (double)(v14 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1EB9F00D4)
        * 0.000000001;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "Purging deleted emails references took %f seconds", v24, 0xCu);
  }

  SGRecordMeasurementState(buf);
}

void __62__SGMISubmodelsManager_purgeDeletedEmailsReferencesFromStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v6 count];
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "SGMLISubModelUpdater: Number of email addresses to validate: %lu", buf, 0xCu);
  }

  BOOL v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v8)
  {
    if ([MEMORY[0x1E4F93B10] isUnlocked])
    {
      id v14 = 0;
      uint64_t v9 = +[SGMISpotlightUtility findDeletedEmailAddresses:v6 mdSearchableItemAttribute:v8 fromDaysAgo:365 error:&v14];
      BOOL v10 = v14;
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
      id v11 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v9 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = (uint64_t)v8;
        __int16 v17 = 2048;
        uint64_t v18 = v12;
        _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_INFO, "SGMISubmodelsManager: Emails to delete for %@: %lu", buf, 0x16u);
      }
    }
    else
    {
      BOOL v10 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGMISubmodelsManager lost Spotlight connection (device got locked)", buf, 2u);
      }
    }
  }
  else
  {
    BOOL v10 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      BOOL v13 = +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v5 intValue]);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = (uint64_t)v13;
      _os_log_fault_impl(&dword_1CA650000, v10, OS_LOG_TYPE_FAULT, "SGMISubmodelsManager: Failed to map email address feature %@ to MDIAttribute", buf, 0xCu);
    }
  }
}

+ (void)pruneDB
{
  id v2 = +[SGSqlEntityStore defaultStore];
  +[SGMISubmodelsManager purgeTokensToMatchCappingPolicyFromStore:v2];
  +[SGMISubmodelsManager purgeOldTokensFromStore:v2];
  +[SGMISubmodelsManager purgeDeletedEmailsReferencesFromStore:v2];
}

+ (void)incrementalSubmodelUpdateWithSaliencyModelConfig:(id)a3 store:(id)a4 shouldContinue:(id)a5 finalGroundTruthDate:(id)a6 withSimulatedCSSearchableItemForTesting:(id)a7 limit:(unint64_t)a8 log:(id)a9
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v66 = a4;
  v75 = (uint64_t (**)(void))a5;
  id v72 = a6;
  id v71 = a7;
  id v64 = a9;
  BOOL v13 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: Updating Submodels", buf, 2u);
  }

  v73 = [v66 getNSDateForKey:@"earliestNextSGMIUpdaterProcessingDate"];
  if (v73)
  {
    [v73 timeIntervalSinceNow];
    double v15 = v14;
    if (v14 > 0.0)
    {
      __int16 v17 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v116 = *(void *)&v15;
        _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager is not allowed to run during the next %.0f seconds.", buf, 0xCu);
      }
      goto LABEL_47;
    }
    [v66 deleteValueForKey:@"earliestNextSGMIUpdaterProcessingDate"];
  }
  objc_msgSend(v64, "setIsSubmodelRebuilt:", objc_msgSend(v66, "areSubModelsEmpty") ^ 1);
  uint64_t v16 = [v66 getNSDateForKey:@"lastSGMIUpdaterProcessingDate"];
  uint64_t v63 = v16;
  if (v16) {
    [v16 earlierDate:v72];
  }
  else {
  v60 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-7776000.0];
  }
  [v60 timeIntervalSinceNow];
  double v19 = v18;
  long long v59 = [v61 groundTruthEstimatorFeatures];
  id v20 = +[SGMIFeature submodeledFeatures];
  long long v58 = objc_msgSend(v20, "_pas_mappedArrayWithTransform:", &__block_literal_global_34_28115);

  v67 = [v59 arrayByAddingObjectsFromArray:v58];
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  uint64_t v113 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x2020000000;
  uint64_t v109 = 0;
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x2020000000;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x2020000000;
  uint64_t v101 = 0;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 0;
  id v21 = v66;
  v70 = objc_opt_new();
  v69 = objc_opt_new();
  v68 = objc_opt_new();
  uint64_t v22 = [v21 getInt64NSNumberForKey:@"totalSGMIUpdaterMailsProcessed"];
  uint64_t v23 = (void *)v22;
  uint64_t v24 = &unk_1F25360D8;
  if (v22) {
    uint64_t v24 = (void *)v22;
  }
  id v62 = v24;

  uint64_t v65 = [v62 integerValue];
  unint64_t v25 = (unint64_t)(v19 / -86400.0 + 1.0);
  if (v25)
  {
    uint64_t v26 = 0;
    unint64_t v27 = 0;
    unint64_t v28 = 0;
    uint64_t v29 = 86400 - 86400 * v25;
    while (1)
    {
      unint64_t v30 = [MEMORY[0x1E4F1C9C8] now];
      unint64_t v31 = [v30 dateByAddingTimeInterval:(double)v29];

      if ((v75[2]() & 1) == 0) {
        break;
      }
      double v32 = [[SGMIFeatureVectorCollator alloc] initWithMessagesFromDaysAgo:v25 + v26 throughDaysAgo:v25 + v26 - 1 limit:a8 withBiomeData:1 store:v21 useSpotlightDataForMissingBiomeData:1 preLoadedFeatureNames:v67 simulatedCSSIs:v71];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __165__SGMISubmodelsManager_incrementalSubmodelUpdateWithSaliencyModelConfig_store_shouldContinue_finalGroundTruthDate_withSimulatedCSSearchableItemForTesting_limit_log___block_invoke_40;
      v80[3] = &unk_1E65BB1F8;
      v86 = v75;
      id v81 = v72;
      id v33 = v21;
      id v82 = v33;
      v87 = &v110;
      uint64_t v92 = v65;
      uint64_t v93 = v25 + v26;
      id v83 = v70;
      v88 = &v106;
      v89 = &v102;
      v90 = &v94;
      v91 = &v98;
      id v84 = v69;
      id v85 = v68;
      [(SGMIFeatureVectorCollator *)v32 forEach:v80];
      if (v111[3] >= a8)
      {
        uint64_t v35 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:7200.0];

        [v33 setNSDate:v35 forKey:@"earliestNextSGMIUpdaterProcessingDate"];
        double v36 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v37 = v111[3];
          *(_DWORD *)buf = 134218752;
          unint64_t v116 = v37;
          __int16 v117 = 2048;
          unint64_t v118 = v27;
          __int16 v119 = 2048;
          unint64_t v120 = (unint64_t)(v19 / -86400.0 + 1.0);
          __int16 v121 = 2048;
          uint64_t v122 = 0x40BC200000000000;
          _os_log_impl(&dword_1CA650000, v36, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager processed %lu emails in this session (corresponding to %lu / %lu days) and should stop. Next training will be possible in %.0f seconds", buf, 0x2Au);
        }

        BOOL v34 = 0;
        v73 = (void *)v35;
      }
      else
      {
        BOOL v34 = v71 == 0;
      }

      if (!v34) {
        goto LABEL_28;
      }
      ++v27;
      --v26;
      v29 += 86400;
      unint64_t v28 = v31;
      if (v25 == v27)
      {
        unint64_t v27 = (unint64_t)(v19 / -86400.0 + 1.0);
        goto LABEL_28;
      }
    }
    double v38 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v116 = v27;
      __int16 v117 = 2048;
      unint64_t v118 = (unint64_t)(v19 / -86400.0 + 1.0);
      _os_log_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager received signal to not continue, stopping at day %lu of %lu", buf, 0x16u);
    }
  }
  else
  {
    unint64_t v27 = 0;
    unint64_t v31 = 0;
  }
LABEL_28:
  [v70 commitToStore:v21 updateDate:v69];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v39 = v68;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v76 objects:v114 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v77 != v41) {
          objc_enumerationMutation(v39);
        }
        [v21 commitSaliency:*(void *)(*((void *)&v76 + 1) + 8 * i)];
      }
      uint64_t v40 = [v39 countByEnumeratingWithState:&v76 objects:v114 count:16];
    }
    while (v40);
  }

  [v64 setDaysAvailableDuringIncrementalUpdate:v25];
  [v64 setDaysProcessedDuringIncrementalUpdate:v27];
  [v64 setMailsProcessedDuringIncrementalUpdate:*((unsigned int *)v111 + 6)];
  if (v31)
  {
    [v21 setNSDate:v31 forKey:@"lastSGMIUpdaterProcessingDate"];
    if (v63)
    {
      [v31 timeIntervalSinceDate:v63];
      [v64 setHoursSinceLastIncrementalUpdate:(v43 / 3600.0)];
    }
  }
  id v44 = NSNumber;
  int v45 = [v62 intValue];
  uint64_t v46 = [v44 numberWithInt:(v45 + *((_DWORD *)v111 + 6))];
  [v21 setInt64NSNumber:v46 forKey:@"totalSGMIUpdaterMailsProcessed"];
  if (v103[3] + v107[3] + v99[3] + v95[3])
  {
    v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v21 incrementInt64NSNumber:v47 forKey:@"kTotalSGMITruePositivePredictions"];

    v48 = [NSNumber numberWithUnsignedInteger:v103[3]];
    [v21 incrementInt64NSNumber:v48 forKey:@"kTotalSGMIFalsePositivePredictions"];

    unint64_t v49 = [NSNumber numberWithUnsignedInteger:v99[3]];
    [v21 incrementInt64NSNumber:v49 forKey:@"kTotalSGMITrueNegativePredictions"];

    uint64_t v50 = [NSNumber numberWithUnsignedInteger:v95[3]];
    [v21 incrementInt64NSNumber:v50 forKey:@"kTotalSGMIFalseNegativePredictions"];

    unint64_t v51 = v107[3];
    double v52 = 0.0;
    double v53 = 0.0;
    unint64_t v54 = v103[3] + v51;
    if (v54) {
      double v53 = (double)v51 * 100.0 / (double)v54;
    }
    unint64_t v55 = v95[3] + v51;
    if (v55) {
      double v52 = (double)v51 * 100.0 / (double)v55;
    }
    long long v56 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v57 = v111[3];
      *(_DWORD *)buf = 134218496;
      unint64_t v116 = v57;
      __int16 v117 = 2048;
      unint64_t v118 = *(void *)&v53;
      __int16 v119 = 2048;
      unint64_t v120 = *(void *)&v52;
      _os_log_impl(&dword_1CA650000, v56, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager performed incremental update of %lu mails. Model had a precision of %.2f%% and a recall of %.2f%% on them.", buf, 0x20u);
    }
  }
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);

  __int16 v17 = v63;
LABEL_47:
}

void __165__SGMISubmodelsManager_incrementalSubmodelUpdateWithSaliencyModelConfig_store_shouldContinue_finalGroundTruthDate_withSimulatedCSSearchableItemForTesting_limit_log___block_invoke_40(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (([v5 hasHashedMessageId] & 1) == 0)
  {
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))())
    {
      uint64_t v6 = [v5 estimateGroundTruth];
      uint64_t v7 = [v5 mailMessage];
      BOOL v8 = [v7 date];
      uint64_t v9 = [v8 compare:*(void *)(a1 + 32)];

      if (v6 == 1 || v9 == -1)
      {
        BOOL v10 = *(void **)(a1 + 40);
        id v11 = [v5 messageId];
        uint64_t v12 = [v10 saliencyForMessageId:v11];

        if (v12
          || (+[SGMISaliencyModelConfig defaultConfig],
              double v15 = objc_claimAutoreleasedReturnValue(),
              id v17 = 0,
              +[SGMISaliencyInference evaluate:v5 enablePreFiltering:1 config:v15 error:&v17], v12 = objc_claimAutoreleasedReturnValue(), id v13 = v17, v15, !v13))
        {
          if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + *(void *)(a1 + 120) >= 0x65uLL
            && *(void *)(a1 + 128) <= 0xFuLL)
          {
            [v12 setGteSaliency:v6];
            [v5 logOrStageWithSaliency:v12];
          }
          id v13 = 0;
          int v14 = 1;
          if (!v12) {
            goto LABEL_26;
          }
        }
        else
        {
          int v14 = 0;
          if (!v12)
          {
LABEL_26:

            goto LABEL_27;
          }
        }
        if (([v12 isCounted] & 1) == 0)
        {
          [*(id *)(a1 + 48) ingest:v5 asSalient:v6 == 1];
          ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
          if (v14)
          {
            if ([v12 isSalient])
            {
              if (v6 == 1) {
                uint64_t v16 = a1 + 88;
              }
              else {
                uint64_t v16 = a1 + 96;
              }
            }
            else if (v6 == 1)
            {
              uint64_t v16 = a1 + 104;
            }
            else
            {
              uint64_t v16 = a1 + 112;
            }
            ++*(void *)(*(void *)(*(void *)v16 + 8) + 24);
          }
          [v12 setGteSaliency:v6 == 1];
          [v12 setIsCounted:1];
          [v12 setCreationDate:*(void *)(a1 + 56)];
          if (([v5 hasHashedMessageId] & 1) == 0) {
            [*(id *)(a1 + 64) addObject:v12];
          }
        }
        goto LABEL_26;
      }
    }
    else
    {
      *a3 = 1;
    }
  }
LABEL_27:
}

uint64_t __165__SGMISubmodelsManager_incrementalSubmodelUpdateWithSaliencyModelConfig_store_shouldContinue_finalGroundTruthDate_withSimulatedCSSearchableItemForTesting_limit_log___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 submodeledFeature];
  return [v2 numberWithInteger:v3];
}

+ (void)incrementalSubmodelUpdateWithSaliencyModelConfig:(id)a3 store:(id)a4 shouldContinue:(id)a5 finalGroundTruthDate:(id)a6 withSimulatedCSSearchableItemForTesting:(id)a7 limit:(unint64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = (id)objc_opt_new();
  [a1 incrementalSubmodelUpdateWithSaliencyModelConfig:v18 store:v17 shouldContinue:v16 finalGroundTruthDate:v15 withSimulatedCSSearchableItemForTesting:v14 limit:a8 log:v19];
}

+ (void)incrementalSubmodelUpdateWithStore:(id)a3 shouldContinue:(id)a4 limit:(unint64_t)a5 log:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[SGMISaliencyModelConfig defaultConfig];
  if (v13)
  {
    id v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
    [a1 incrementalSubmodelUpdateWithSaliencyModelConfig:v13 store:v10 shouldContinue:v11 finalGroundTruthDate:v14 withSimulatedCSSearchableItemForTesting:0 limit:a5 log:v12];
  }
  else
  {
    id v15 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA650000, v15, OS_LOG_TYPE_FAULT, "Error loading model config during incremental submodel update", buf, 2u);
    }
  }
}

+ (void)incrementalSubmodelUpdateWithStore:(id)a3 limit:(unint64_t)a4 log:(id)a5
{
}

uint64_t __69__SGMISubmodelsManager_incrementalSubmodelUpdateWithStore_limit_log___block_invoke()
{
  return 1;
}

@end