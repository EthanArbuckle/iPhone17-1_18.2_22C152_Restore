@interface ATXActionPredictionsProcessor
+ (BOOL)actionPredictionsContainsAlarmAction:(id)a3;
+ (BOOL)isBlockedEmailAddressContainedInAddresses:(id)a3;
+ (BOOL)isBlockedPhoneNumberContainedInNumbers:(id)a3;
+ (BOOL)scoredActionsAreDuplicatesWithScoredAction1:(id)a3 scoredAction2:(id)a4;
+ (BOOL)validTimeToSuggestAlarmForAlarmComponents:(id)a3 currentDate:(id)a4;
+ (id)_contactIdentifiersReferencedByAction:(id)a3;
+ (id)hourAndMinuteComponentsFromDateComponents:(id)a3;
+ (id)indicesOfNonDuplicateScoredActions:(id)a3;
+ (id)removeAlarmActionsInconsistentWithAlarmAppState:(id)a3;
+ (id)removeAlarmActionsInconsistentWithAlarmAppState:(id)a3 enabledAlarms:(id)a4 disabledAlarms:(id)a5 currentDate:(id)a6;
+ (id)removeDuplicateActionPredictions:(id)a3;
+ (id)removeDuplicateTVActionPredictions:(id)a3;
+ (id)removeMissingOrBlockedRecipientPredictions:(id)a3;
+ (id)userAlarms;
+ (void)addEligibleCreateAlarmIndexesToAcceptedIndexes:(id)a3 currentDate:(id)a4 enabledAlarms:(id)a5 idx:(unint64_t)a6 params:(id)a7 parameterCombinations:(id)a8;
+ (void)addEligibleToggleAlarmIndexesToAcceptedIndexes:(id)a3 currentDate:(id)a4 disabledAlarms:(id)a5 enabledAlarms:(id)a6 idx:(unint64_t)a7 params:(id)a8 parameterCombinations:(id)a9;
+ (void)userAlarms;
@end

@implementation ATXActionPredictionsProcessor

+ (id)removeMissingOrBlockedRecipientPredictions:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__83;
  v15[4] = __Block_byref_object_dispose__83;
  id v16 = 0;
  v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke;
  v11[3] = &unk_1E68B4098;
  id v14 = a1;
  id v6 = v5;
  id v12 = v6;
  v13 = v15;
  [v4 enumerateObjectsUsingBlock:v11];
  uint64_t v7 = [v6 count];
  if (v7 == [v4 count])
  {
    id v8 = v4;
  }
  else
  {
    id v8 = [v4 objectsAtIndexes:v6];
  }
  v9 = v8;

  _Block_object_dispose(v15, 8);
  return v9;
}

void __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v73[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v7 = [v5 scoredAction];
  id v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 48);
    v10 = [v7 predictedItem];
    v11 = [v9 _contactIdentifiersReferencedByAction:v10];

    if ([v11 count])
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        uint64_t v12 = objc_opt_new();
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
      id v16 = [v15 allObjects];

      v17 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v16];
      v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v19 = *MEMORY[0x1E4F1ADC8];
      v73[0] = *MEMORY[0x1E4F1AEE0];
      v73[1] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
      id v69 = 0;
      v21 = [v18 unifiedContactsMatchingPredicate:v17 keysToFetch:v20 error:&v69];
      id v54 = v69;

      if (v21)
      {
        unint64_t v22 = [v21 count];
        if (v22 >= [v16 count])
        {
          v48 = v17;
          uint64_t v49 = a1;
          v50 = v16;
          v51 = v8;
          uint64_t v46 = a3;
          v52 = v6;
          v53 = v5;
          v26 = v21;
          v27 = objc_opt_new();
          v28 = objc_opt_new();
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          v47 = v26;
          obuint64_t j = v26;
          uint64_t v29 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v56 = *(void *)v66;
            do
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v66 != v56) {
                  objc_enumerationMutation(obj);
                }
                v32 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                long long v61 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                v33 = [v32 phoneNumbers];
                uint64_t v34 = [v33 countByEnumeratingWithState:&v61 objects:v71 count:16];
                if (v34)
                {
                  uint64_t v35 = v34;
                  uint64_t v36 = *(void *)v62;
                  do
                  {
                    for (uint64_t j = 0; j != v35; ++j)
                    {
                      if (*(void *)v62 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      v38 = [*(id *)(*((void *)&v61 + 1) + 8 * j) value];
                      [v27 addObject:v38];
                    }
                    uint64_t v35 = [v33 countByEnumeratingWithState:&v61 objects:v71 count:16];
                  }
                  while (v35);
                }

                long long v59 = 0u;
                long long v60 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                v39 = [v32 emailAddresses];
                uint64_t v40 = [v39 countByEnumeratingWithState:&v57 objects:v70 count:16];
                if (v40)
                {
                  uint64_t v41 = v40;
                  uint64_t v42 = *(void *)v58;
                  do
                  {
                    for (uint64_t k = 0; k != v41; ++k)
                    {
                      if (*(void *)v58 != v42) {
                        objc_enumerationMutation(v39);
                      }
                      v44 = [*(id *)(*((void *)&v57 + 1) + 8 * k) value];
                      [v28 addObject:v44];
                    }
                    uint64_t v41 = [v39 countByEnumeratingWithState:&v57 objects:v70 count:16];
                  }
                  while (v41);
                }
              }
              uint64_t v30 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
            }
            while (v30);
          }

          id v5 = v53;
          v24 = v54;
          if (([*(id *)(v49 + 48) isBlockedPhoneNumberContainedInNumbers:v27] & 1) != 0
            || [*(id *)(v49 + 48) isBlockedEmailAddressContainedInAddresses:v28])
          {
            v45 = __atxlog_handle_action_prediction();
            id v8 = v51;
            id v6 = v52;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
              __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_3(v53);
            }
          }
          else
          {
            [*(id *)(v49 + 32) addIndex:v46];
            id v8 = v51;
            id v6 = v52;
          }

          id v16 = v50;
          v21 = v47;
          v17 = v48;
        }
        else
        {
          v23 = __atxlog_handle_action_prediction();
          v24 = v54;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_2(v5);
          }
        }
      }
      else
      {
        v25 = __atxlog_handle_action_prediction();
        v24 = v54;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_1((uint64_t)v54, v25);
        }

        [*(id *)(a1 + 32) addIndex:a3];
      }
    }
    else
    {
      [*(id *)(a1 + 32) addIndex:a3];
      id v16 = v11;
    }
  }
}

+ (id)_contactIdentifiersReferencedByAction:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 intent];

  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  id v5 = [v3 intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 recipients];
LABEL_9:
    id v8 = v6;
    uint64_t v7 = contactIdentifiersFromINPersons(v6);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [v5 contacts];
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  id v8 = v5;
  v10 = [v8 payee];
  v11 = [v10 contactIdentifier];
  if (v11)
  {
    uint64_t v12 = [v8 payee];
    uint64_t v13 = [v12 contactIdentifier];
    v14[0] = v13;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

LABEL_10:
LABEL_11:

LABEL_12:
  return v7;
}

+ (BOOL)isBlockedEmailAddressContainedInAddresses:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v24 = 0;
        v25 = &v24;
        uint64_t v26 = 0x2020000000;
        id v8 = (uint64_t (*)(uint64_t))getCMFItemCreateWithEmailAddressSymbolLoc_ptr;
        v27 = getCMFItemCreateWithEmailAddressSymbolLoc_ptr;
        if (!getCMFItemCreateWithEmailAddressSymbolLoc_ptr)
        {
          uint64_t v19 = MEMORY[0x1E4F143A8];
          uint64_t v20 = 3221225472;
          v21 = __getCMFItemCreateWithEmailAddressSymbolLoc_block_invoke;
          unint64_t v22 = &unk_1E68AB438;
          v23 = &v24;
          v9 = (void *)CommunicationsFilterLibrary();
          v10 = dlsym(v9, "CMFItemCreateWithEmailAddress");
          *(void *)(v23[1] + 24) = v10;
          getCMFItemCreateWithEmailAddressSymbolLoc_ptr = *(_UNKNOWN **)(v23[1] + 24);
          id v8 = (uint64_t (*)(uint64_t))v25[3];
        }
        _Block_object_dispose(&v24, 8);
        if (!v8) {
          +[ATXActionPredictionsProcessor isBlockedEmailAddressContainedInAddresses:]();
        }
        uint64_t v11 = v8(v7);
        uint64_t v12 = (const void *)v11;
        if (v11)
        {
          BOOL v13 = atx_CMFBlockListIsItemBlocked(v11) == 0;
          CFRelease(v12);
          if (!v13)
          {
            LOBYTE(v4) = 1;
            goto LABEL_15;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v28 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v4;
}

+ (BOOL)isBlockedPhoneNumberContainedInNumbers:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x1E4F5A498];
        v9 = [v7 stringValue];
        v10 = [v8 countryCodeForNumber:v9];

        uint64_t v11 = [v7 stringValue];
        uint64_t v12 = (const void *)CFPhoneNumberCreate();

        if (v12)
        {
          uint64_t v29 = 0;
          uint64_t v30 = &v29;
          uint64_t v31 = 0x2020000000;
          BOOL v13 = (uint64_t (*)(const void *))getCMFItemCreateWithPhoneNumberSymbolLoc_ptr;
          v32 = getCMFItemCreateWithPhoneNumberSymbolLoc_ptr;
          if (!getCMFItemCreateWithPhoneNumberSymbolLoc_ptr)
          {
            uint64_t v24 = MEMORY[0x1E4F143A8];
            uint64_t v25 = 3221225472;
            uint64_t v26 = __getCMFItemCreateWithPhoneNumberSymbolLoc_block_invoke;
            v27 = &unk_1E68AB438;
            v28 = &v29;
            id v14 = (void *)CommunicationsFilterLibrary();
            long long v15 = dlsym(v14, "CMFItemCreateWithPhoneNumber");
            *(void *)(v28[1] + 24) = v15;
            getCMFItemCreateWithPhoneNumberSymbolLoc_ptr = *(_UNKNOWN **)(v28[1] + 24);
            BOOL v13 = (uint64_t (*)(const void *))v30[3];
          }
          _Block_object_dispose(&v29, 8);
          if (!v13) {
            +[ATXActionPredictionsProcessor isBlockedPhoneNumberContainedInNumbers:]();
          }
          uint64_t v16 = v13(v12);
          long long v17 = (const void *)v16;
          if (v16)
          {
            BOOL v18 = atx_CMFBlockListIsItemBlocked(v16) != 0;
            CFRelease(v17);
          }
          else
          {
            BOOL v18 = 0;
          }
          CFRelease(v12);

          if (v18)
          {
            LOBYTE(v4) = 1;
            goto LABEL_19;
          }
        }
        else
        {
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v33 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  return v4;
}

+ (id)removeDuplicateTVActionPredictions:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v4 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:@"com.apple.tv" actionType:@"INPlayMediaIntent"];
  uint64_t v5 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = [v11 actionKey];
        int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v14 = [v11 scoredAction];
          long long v15 = [v14 predictedItem];
          uint64_t v16 = [v15 intent];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v17 = [v16 proxiedBundleIdentifier];
            if (v17) {
              [v5 addObject:v17];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  id v18 = v6;
  uint64_t v19 = v18;
  if ([v5 count])
  {
    long long v20 = (void *)MEMORY[0x1E4F28F60];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __68__ATXActionPredictionsProcessor_removeDuplicateTVActionPredictions___block_invoke;
    v24[3] = &unk_1E68B40C0;
    id v25 = v5;
    id v26 = v4;
    long long v21 = [v20 predicateWithBlock:v24];
    uint64_t v19 = [v18 filteredArrayUsingPredicate:v21];
  }

  return v19;
}

uint64_t __68__ATXActionPredictionsProcessor_removeDuplicateTVActionPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 scoredAction];
  id v6 = [v5 predictedItem];
  uint64_t v7 = [v6 bundleId];
  if ([v4 containsObject:v7])
  {
    uint64_t v8 = [v3 actionKey];
    uint64_t v9 = [v8 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

+ (id)removeDuplicateActionPredictions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_178);
  id v6 = [a1 indicesOfNonDuplicateScoredActions:v5];
  uint64_t v7 = [v4 objectsAtIndexes:v6];

  return v7;
}

uint64_t __66__ATXActionPredictionsProcessor_removeDuplicateActionPredictions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 scoredAction];
}

+ (id)indicesOfNonDuplicateScoredActions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
  if (![v4 count]) {
    goto LABEL_18;
  }
  unint64_t v6 = 0;
  do
  {
    uint64_t v7 = [v4 objectAtIndexedSubscript:v6];
    if (([v5 containsIndex:v6] & 1) == 0)
    {
      unint64_t v9 = v6 + 1;
      goto LABEL_15;
    }
    uint64_t v8 = objc_opt_new();
    unint64_t v9 = v6 + 1;
    if (v6 + 1 >= [v4 count]) {
      goto LABEL_11;
    }
    unint64_t v10 = v6 + 1;
    while (1)
    {
      uint64_t v11 = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v12 = [v4 objectAtIndexedSubscript:v10];
      if (![v5 containsIndex:v10]
        || ![a1 scoredActionsAreDuplicatesWithScoredAction1:v7 scoredAction2:v12])
      {
        goto LABEL_10;
      }
      [v7 score];
      float v14 = v13;
      [v12 score];
      if (v14 < v15) {
        break;
      }
      [v8 addIndex:v10];
LABEL_10:

      if (++v10 >= [v4 count]) {
        goto LABEL_11;
      }
    }
    [v5 removeIndex:v6];

LABEL_11:
    if ([v5 containsIndex:v6]) {
      [v5 removeIndexes:v8];
    }

LABEL_15:
    unint64_t v6 = v9;
  }
  while (v9 < [v4 count]);
LABEL_18:

  return v5;
}

+ (BOOL)scoredActionsAreDuplicatesWithScoredAction1:(id)a3 scoredAction2:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 predictedItem];
  uint64_t v8 = [v6 predictedItem];
  if (+[_ATXActionUtils isTitleEquivalenceBetweenAction:v7 other:v8])
  {
    BOOL v9 = 1;
  }
  else
  {
    unint64_t v10 = [v5 predictedItem];
    uint64_t v11 = [v6 predictedItem];
    if (+[_ATXActionUtils isContainmentBetweenAction:v10 other:v11])
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v12 = [v5 predictedItem];
      float v13 = [v6 predictedItem];
      BOOL v9 = +[_ATXActionUtils isCallIntentEquivalenceBetweenAction:v12 other:v13];
    }
  }

  return v9;
}

+ (BOOL)actionPredictionsContainsAlarmAction:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:@"com.apple.mobiletimer" actionType:@"MTToggleAlarmIntent"];
  id v5 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:@"com.apple.mobiletimer" actionType:@"MTCreateAlarmIntent"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) scoredAction];
        uint64_t v12 = [v11 predictedItem];
        float v13 = [v12 actionKey];

        if (([v13 isEqualToString:v4] & 1) != 0
          || [v13 isEqualToString:v5])
        {
          float v15 = __atxlog_handle_action_prediction();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v17 = 0;
            _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Found alarm action in alarm prediction candidates.", v17, 2u);
          }

          BOOL v14 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      BOOL v14 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_15:

  return v14;
}

+ (id)removeAlarmActionsInconsistentWithAlarmAppState:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[ATXActionPredictionsProcessor actionPredictionsContainsAlarmAction:v4])
  {
    id v5 = [a1 userAlarms];
    id v6 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          float v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          BOOL v14 = objc_opt_new();
          objc_msgSend(v14, "setHour:", objc_msgSend(v13, "hour", (void)v23));
          objc_msgSend(v14, "setMinute:", objc_msgSend(v13, "minute"));
          if ([v13 isEnabled]) {
            float v15 = v6;
          }
          else {
            float v15 = v7;
          }
          [v15 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v10);
    }

    uint64_t v16 = __atxlog_handle_action_prediction();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v6 count];
      uint64_t v18 = [v7 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu enabled alarms and %lu disabled alarms.", buf, 0x16u);
    }

    long long v19 = __atxlog_handle_action_prediction();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = (uint64_t)v6;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "Enabled alarms: %@", buf, 0xCu);
    }

    long long v20 = objc_opt_new();
    id v21 = +[ATXActionPredictionsProcessor removeAlarmActionsInconsistentWithAlarmAppState:v4 enabledAlarms:v6 disabledAlarms:v7 currentDate:v20];
  }
  else
  {
    id v21 = v4;
  }

  return v21;
}

+ (id)userAlarms
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__83;
  long long v23 = __Block_byref_object_dispose__83;
  id v24 = 0;
  uint64_t v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = __Block_byref_object_copy__83;
  v17[3] = __Block_byref_object_dispose__83;
  id v18 = 0;
  id v3 = [MEMORY[0x1E4F494E0] sharedAlarmManager];
  id v4 = [v3 alarmsIncludingSleepAlarm:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__ATXActionPredictionsProcessor_userAlarms__block_invoke;
  v12[3] = &unk_1E68B2B10;
  BOOL v14 = &v19;
  float v15 = &v16;
  id v5 = v2;
  float v13 = v5;
  id v6 = (id)[v4 addCompletionBlock:v12];

  [MEMORY[0x1E4F93B18] waitForSemaphore:v5 timeoutSeconds:0 onAcquire:&__block_literal_global_45_0 onTimeout:5.0];
  if (*(void *)(v17[0] + 40))
  {
    uint64_t v7 = __atxlog_handle_action_prediction();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ATXActionPredictionsProcessor userAlarms];
    }
  }
  id v8 = (void *)v20[5];
  if (!v8)
  {
    uint64_t v9 = __atxlog_handle_action_prediction();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ATXActionPredictionsProcessor userAlarms](v9);
    }

    id v8 = (void *)v20[5];
  }
  id v10 = v8;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

void __43__ATXActionPredictionsProcessor_userAlarms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __43__ATXActionPredictionsProcessor_userAlarms__block_invoke_2()
{
  v0 = __atxlog_handle_action_prediction();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__ATXActionPredictionsProcessor_userAlarms__block_invoke_2_cold_1(v0);
  }
}

+ (id)removeAlarmActionsInconsistentWithAlarmAppState:(id)a3 enabledAlarms:(id)a4 disabledAlarms:(id)a5 currentDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  float v13 = objc_opt_new();
  BOOL v14 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:@"com.apple.mobiletimer" actionType:@"MTToggleAlarmIntent"];
  float v15 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:@"com.apple.mobiletimer" actionType:@"MTCreateAlarmIntent"];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __122__ATXActionPredictionsProcessor_removeAlarmActionsInconsistentWithAlarmAppState_enabledAlarms_disabledAlarms_currentDate___block_invoke;
  __int16 v29 = &unk_1E68B4108;
  id v30 = v14;
  id v16 = v13;
  id v31 = v16;
  id v32 = v12;
  id v33 = v11;
  id v34 = v10;
  id v35 = v15;
  id v17 = v15;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v21 = v14;
  [v9 enumerateObjectsUsingBlock:&v26];
  uint64_t v22 = objc_msgSend(v16, "count", v26, v27, v28, v29);
  if (v22 == [v9 count])
  {
    id v23 = v9;
  }
  else
  {
    id v23 = [v9 objectsAtIndexes:v16];
  }
  id v24 = v23;

  return v24;
}

void __122__ATXActionPredictionsProcessor_removeAlarmActionsInconsistentWithAlarmAppState_enabledAlarms_disabledAlarms_currentDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v6 = [v14 scoredAction];
  uint64_t v7 = [v6 predictedItem];

  id v8 = [v7 actionKey];
  id v9 = [v7 intent];
  id v10 = objc_msgSend(v9, "atx_nonNilParametersByName");

  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  id v12 = [v10 allKeys];
  float v13 = [v11 setWithArray:v12];

  if ([v8 isEqualToString:*(void *)(a1 + 32)])
  {
    +[ATXActionPredictionsProcessor addEligibleToggleAlarmIndexesToAcceptedIndexes:*(void *)(a1 + 40) currentDate:*(void *)(a1 + 48) disabledAlarms:*(void *)(a1 + 56) enabledAlarms:*(void *)(a1 + 64) idx:a3 params:v13 parameterCombinations:v10];
  }
  else if ([v8 isEqualToString:*(void *)(a1 + 72)])
  {
    +[ATXActionPredictionsProcessor addEligibleCreateAlarmIndexesToAcceptedIndexes:*(void *)(a1 + 40) currentDate:*(void *)(a1 + 48) enabledAlarms:*(void *)(a1 + 64) idx:a3 params:v13 parameterCombinations:v10];
  }
  else
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

+ (void)addEligibleToggleAlarmIndexesToAcceptedIndexes:(id)a3 currentDate:(id)a4 disabledAlarms:(id)a5 enabledAlarms:(id)a6 idx:(unint64_t)a7 params:(id)a8 parameterCombinations:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  if ([v18 containsObject:@"state"])
  {
    if ([v18 containsObject:@"alarm"])
    {
      id v20 = [v19 objectForKeyedSubscript:@"alarm"];
      id v21 = [v20 valueForKey:@"dateComponents"];

      if (v21)
      {
        uint64_t v22 = [v19 objectForKeyedSubscript:@"state"];
        int v23 = [v22 intValue];

        id v24 = [v19 objectForKeyedSubscript:@"alarm"];
        long long v25 = [v24 valueForKey:@"dateComponents"];

        uint64_t v26 = +[ATXActionPredictionsProcessor hourAndMinuteComponentsFromDateComponents:v25];
        if (v23 == 1
          && ([v17 containsObject:v26] & 1) == 0
          && [v16 containsObject:v26]
          && +[ATXActionPredictionsProcessor validTimeToSuggestAlarmForAlarmComponents:v26 currentDate:v15])
        {
          [v14 addIndex:a7];
        }
        else
        {
          uint64_t v27 = __atxlog_handle_action_prediction();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v28 = 0;
            _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "Suppressing MTToggleAlarmIntent because it is not toggling on an alarm that is disabled or the alarm time is over 12 hours away.", v28, 2u);
          }
        }
      }
    }
  }
}

+ (void)addEligibleCreateAlarmIndexesToAcceptedIndexes:(id)a3 currentDate:(id)a4 enabledAlarms:(id)a5 idx:(unint64_t)a6 params:(id)a7 parameterCombinations:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if ([a7 containsObject:@"dateComponents"])
  {
    id v17 = [v16 objectForKeyedSubscript:@"dateComponents"];
    id v18 = +[ATXActionPredictionsProcessor hourAndMinuteComponentsFromDateComponents:v17];
    if (([v15 containsObject:v18] & 1) != 0
      || !+[ATXActionPredictionsProcessor validTimeToSuggestAlarmForAlarmComponents:v18 currentDate:v14])
    {
      id v19 = __atxlog_handle_action_prediction();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "Suppressing MTCreateAlarmIntent because there already exists an enabled alarm for the same time or the alarm time is over 12 hours away.", v20, 2u);
      }
    }
    else
    {
      [v13 addIndex:a6];
    }
  }
}

+ (id)hourAndMinuteComponentsFromDateComponents:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setHour:", objc_msgSend(v3, "hour"));
  uint64_t v5 = [v3 minute];

  [v4 setMinute:v5];
  return v4;
}

+ (BOOL)validTimeToSuggestAlarmForAlarmComponents:(id)a3 currentDate:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 currentCalendar];
  id v9 = [v8 components:96 fromDate:v6];

  id v10 = [v8 dateFromComponents:v9];
  id v11 = [v8 dateFromComponents:v7];

  [v11 timeIntervalSinceDate:v10];
  if (v12 <= 0.0) {
    double v12 = v12 + 86400.0;
  }
  BOOL v13 = v12 <= 43200.0;

  return v13;
}

void __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Failed to load contacts matching identifier predicate: %@", (uint8_t *)&v2, 0xCu);
}

void __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_2(void *a1)
{
  v1 = [a1 scoredAction];
  int v2 = [v1 predictedItem];
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v3, v4, "Suppressing predicted action %@ due to missing contact referenced by intent.", v5, v6, v7, v8, 2u);
}

void __76__ATXActionPredictionsProcessor_removeMissingOrBlockedRecipientPredictions___block_invoke_cold_3(void *a1)
{
  v1 = [a1 scoredAction];
  int v2 = [v1 predictedItem];
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v3, v4, "Suppressing predicted action %@ due to blocked contact referenced by intent.", v5, v6, v7, v8, 2u);
}

+ (void)isBlockedEmailAddressContainedInAddresses:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"CMFItemRef atx_CMFItemCreateWithEmailAddress(CFStringRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXActionPredictionsProcessor.m", 28, @"%s", dlerror());

  __break(1u);
}

+ (void)isBlockedPhoneNumberContainedInNumbers:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"CMFItemRef atx_CMFItemCreateWithPhoneNumber(CFPhoneNumberRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXActionPredictionsProcessor.m", 27, @"%s", dlerror());

  __break(1u);
}

+ (void)userAlarms
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve alarms with error: %@", (uint8_t *)&v3, 0xCu);
}

void __43__ATXActionPredictionsProcessor_userAlarms__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "XPC call to retrieve alarms timed out.", v1, 2u);
}

@end