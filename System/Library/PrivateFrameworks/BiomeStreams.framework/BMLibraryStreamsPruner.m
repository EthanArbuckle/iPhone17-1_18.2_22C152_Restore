@interface BMLibraryStreamsPruner
+ (BOOL)shouldPruneStoreEvent:(id)a3 forDeletedContactIdentifiers:(id)a4;
+ (BOOL)shouldPruneStoreEvent:(id)a3 forDeletedGroupIdentifiers:(id)a4 bundleId:(id)a5;
+ (BOOL)shouldPruneStoreEvent:(id)a3 forDeletedIntentIdentifiers:(id)a4 bundleId:(id)a5;
+ (BOOL)shouldPruneStoreEvent:(id)a3 forInstalledApplications:(id)a4 installedAppExtensions:(id)a5;
+ (BOOL)shouldPruneStoreEvent:(id)a3 forLearnFromThisAppDisabledBundleIdentifiers:(id)a4;
+ (BOOL)shouldPruneStoreEvent:(id)a3 forUninstalledBundleId:(id)a4;
+ (BOOL)shouldPruneStoreEventForSiriAndDictationHistoryDeletion:(id)a3;
+ (BOOL)shouldPruneStoreEventForSiriDisabled:(id)a3;
+ (id)bundleIdentifiersFromStoreEvent:(id)a3;
+ (id)contactIdentifiersFromStoreEvent:(id)a3;
+ (id)intentGroupIdentifierFromStoreEvent:(id)a3;
+ (id)intentIdentifierFromStoreEvent:(id)a3;
+ (id)isDonatedBySiriFromStoreEvent:(id)a3;
+ (void)_pruneStream:(id)a3 policy:(id)a4 shouldPruneBlock:(id)a5;
+ (void)_pruneStreamWithIdentifier:(id)a3 policy:(id)a4 shouldPruneBlock:(id)a5;
+ (void)pruneForResetKeyboardDictionary;
+ (void)pruneForResetPrivacyAndLocationWarnings;
+ (void)pruneLearnFromThisAppDisabled:(id)a3;
+ (void)pruneLearnFromThisAppDisabledForMessages;
+ (void)pruneSiriAndDictationHistory;
+ (void)pruneSiriDisabled;
+ (void)pruneWithDeletedContactIdentifiers:(id)a3;
+ (void)pruneWithDeletedIntentGroupIdentifiers:(id)a3 bundleId:(id)a4;
+ (void)pruneWithDeletedIntentIdentifiers:(id)a3 bundleId:(id)a4;
+ (void)pruneWithInstalledApplications:(id)a3 installedAppExtensions:(id)a4;
+ (void)pruneWithUninstalledBundleIdentifier:(id)a3;
@end

@implementation BMLibraryStreamsPruner

+ (void)pruneLearnFromThisAppDisabled:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_18E67D000, v5, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneLearnFromThisAppDisabled: %@", buf, 0xCu);
    }

    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __56__BMLibraryStreamsPruner_pruneLearnFromThisAppDisabled___block_invoke;
    v14 = &unk_1E55D77E8;
    id v16 = a1;
    id v6 = v4;
    id v15 = v6;
    v7 = _Block_copy(&v11);
    v8 = getBMAppIntentIdentifier();
    objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v8, @"learn-from-this-app", v7, v11, v12, v13, v14);

    v9 = getBMIntelligenceEngineInteractionDonationIdentifier();
    [a1 _pruneStreamWithIdentifier:v9 policy:@"learn-from-this-app" shouldPruneBlock:v7];

    v10 = getBMSiriRemembersAudioHistoryIdentifier();
    [a1 _pruneStreamWithIdentifier:v10 policy:@"learn-from-this-app" shouldPruneBlock:v7];

    if ([v6 containsObject:@"com.apple.MobileSMS"]) {
      [a1 pruneLearnFromThisAppDisabledForMessages];
    }
  }
}

+ (void)_pruneStreamWithIdentifier:(id)a3 policy:(id)a4 shouldPruneBlock:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = BiomeLibraryNodeBridge();
  id v17 = 0;
  uint64_t v12 = [v11 streamWithIdentifier:v8 error:&v17];
  id v13 = v17;

  if (v13)
  {
    v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_error_impl(&dword_18E67D000, v14, OS_LOG_TYPE_ERROR, "%@ - _pruneStreamWithIdentifier could not find stream for identifier: %@, err: %@", buf, 0x20u);
    }
  }
  else
  {
    [a1 _pruneStream:v12 policy:v9 shouldPruneBlock:v10];
  }
}

+ (void)_pruneStream:(id)a3 policy:(id)a4 shouldPruneBlock:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 identifier];
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_18E67D000, v10, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner pruning stream: %@ with policy: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v12 = [v7 pruner];
  [v12 deleteWithPolicy:v8 eventsPassingTest:v9];
}

+ (void)pruneWithInstalledApplications:(id)a3 installedAppExtensions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18E67D000, v8, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithInstalledApplications:installedAppExtensions", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__BMLibraryStreamsPruner_pruneWithInstalledApplications_installedAppExtensions___block_invoke;
  aBlock[3] = &unk_1E55D77C0;
  id v25 = v7;
  id v26 = a1;
  id v24 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = getBMAppInFocusIdentifier();
  [a1 _pruneStreamWithIdentifier:v12 policy:@"app-uninstall" shouldPruneBlock:v11];

  int v13 = getBMAppIntentIdentifier();
  [a1 _pruneStreamWithIdentifier:v13 policy:@"app-uninstall" shouldPruneBlock:v11];

  v14 = getBMSiriRemembersInteractionHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v14 policy:@"app-uninstall" shouldPruneBlock:v11];

  __int16 v15 = getBMSiriRemembersMessageHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v15 policy:@"app-uninstall" shouldPruneBlock:v11];

  id v16 = getBMSiriRemembersCallHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v16 policy:@"app-uninstall" shouldPruneBlock:v11];

  uint64_t v17 = getBMSiriRemembersAudioHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v17 policy:@"app-uninstall" shouldPruneBlock:v11];

  id v18 = getBMFrontBoardDisplayElementIdentifier();
  [a1 _pruneStreamWithIdentifier:v18 policy:@"app-uninstall" shouldPruneBlock:v11];

  uint64_t v19 = getBMScreenTimeAppUsageIdentifier();
  [a1 _pruneStreamWithIdentifier:v19 policy:@"app-uninstall" shouldPruneBlock:v11];

  __int16 v20 = getBMIntelligenceEngineInteractionDonationIdentifier();
  [a1 _pruneStreamWithIdentifier:v20 policy:@"app-uninstall" shouldPruneBlock:v11];

  id v21 = getBMAppLocationActivityIdentifier();
  [a1 _pruneStreamWithIdentifier:v21 policy:@"app-uninstall" shouldPruneBlock:v11];

  __int16 v22 = getBMMediaNowPlayingIdentifier();
  [a1 _pruneStreamWithIdentifier:v22 policy:@"app-uninstall" shouldPruneBlock:v11];
}

uint64_t __80__BMLibraryStreamsPruner_pruneWithInstalledApplications_installedAppExtensions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) shouldPruneStoreEvent:a2 forInstalledApplications:*(void *)(a1 + 32) installedAppExtensions:*(void *)(a1 + 40)];
}

+ (void)pruneWithUninstalledBundleIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_18E67D000, v5, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithUninstalledBundleIdentifier:%@", buf, 0xCu);
  }

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  __int16 v22 = __63__BMLibraryStreamsPruner_pruneWithUninstalledBundleIdentifier___block_invoke;
  id v23 = &unk_1E55D77E8;
  id v24 = v4;
  id v25 = a1;
  id v6 = v4;
  id v7 = _Block_copy(&v20);
  id v8 = getBMAppInFocusIdentifier();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v8, @"app-uninstall", v7, v20, v21, v22, v23);

  id v9 = getBMAppIntentIdentifier();
  [a1 _pruneStreamWithIdentifier:v9 policy:@"app-uninstall" shouldPruneBlock:v7];

  id v10 = getBMSiriRemembersInteractionHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v10 policy:@"app-uninstall" shouldPruneBlock:v7];

  uint64_t v11 = getBMSiriRemembersMessageHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v11 policy:@"app-uninstall" shouldPruneBlock:v7];

  uint64_t v12 = getBMSiriRemembersCallHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v12 policy:@"app-uninstall" shouldPruneBlock:v7];

  int v13 = getBMSiriRemembersAudioHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v13 policy:@"app-uninstall" shouldPruneBlock:v7];

  v14 = getBMFrontBoardDisplayElementIdentifier();
  [a1 _pruneStreamWithIdentifier:v14 policy:@"app-uninstall" shouldPruneBlock:v7];

  __int16 v15 = getBMScreenTimeAppUsageIdentifier();
  [a1 _pruneStreamWithIdentifier:v15 policy:@"app-uninstall" shouldPruneBlock:v7];

  id v16 = getBMIntelligenceEngineInteractionDonationIdentifier();
  [a1 _pruneStreamWithIdentifier:v16 policy:@"app-uninstall" shouldPruneBlock:v7];

  uint64_t v17 = getBMAppLocationActivityIdentifier();
  [a1 _pruneStreamWithIdentifier:v17 policy:@"app-uninstall" shouldPruneBlock:v7];

  id v18 = getBMMediaNowPlayingIdentifier();
  [a1 _pruneStreamWithIdentifier:v18 policy:@"app-uninstall" shouldPruneBlock:v7];

  uint64_t v19 = getBMSiriRemembersAssistantSuggestionsIdentifier();
  [a1 _pruneStreamWithIdentifier:v19 policy:@"app-uninstall" shouldPruneBlock:v7];
}

uint64_t __63__BMLibraryStreamsPruner_pruneWithUninstalledBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) shouldPruneStoreEvent:a2 forUninstalledBundleId:*(void *)(a1 + 32)];
}

+ (void)pruneWithDeletedIntentIdentifiers:(id)a3 bundleId:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_18E67D000, v8, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithDeletedIntentIdentifiers:%@ bundleId:%@", buf, 0x16u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__BMLibraryStreamsPruner_pruneWithDeletedIntentIdentifiers_bundleId___block_invoke;
  aBlock[3] = &unk_1E55D77C0;
  id v19 = v7;
  id v20 = a1;
  id v18 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = getBMAppIntentIdentifier();
  [a1 _pruneStreamWithIdentifier:v12 policy:@"intent-deletion" shouldPruneBlock:v11];

  int v13 = getBMSiriRemembersInteractionHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v13 policy:@"intent-deletion" shouldPruneBlock:v11];

  v14 = getBMSiriRemembersMessageHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v14 policy:@"intent-deletion" shouldPruneBlock:v11];

  __int16 v15 = getBMSiriRemembersCallHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v15 policy:@"intent-deletion" shouldPruneBlock:v11];

  id v16 = getBMSiriRemembersAudioHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v16 policy:@"intent-deletion" shouldPruneBlock:v11];
}

uint64_t __69__BMLibraryStreamsPruner_pruneWithDeletedIntentIdentifiers_bundleId___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) shouldPruneStoreEvent:a2 forDeletedIntentIdentifiers:*(void *)(a1 + 32) bundleId:*(void *)(a1 + 40)];
}

+ (void)pruneWithDeletedIntentGroupIdentifiers:(id)a3 bundleId:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_18E67D000, v8, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithDeletedIntentGroupIdentifiers:%@ bundleId:%@", buf, 0x16u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__BMLibraryStreamsPruner_pruneWithDeletedIntentGroupIdentifiers_bundleId___block_invoke;
  aBlock[3] = &unk_1E55D77C0;
  id v19 = v7;
  id v20 = a1;
  id v18 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = getBMAppIntentIdentifier();
  [a1 _pruneStreamWithIdentifier:v12 policy:@"intent-deletion" shouldPruneBlock:v11];

  int v13 = getBMSiriRemembersInteractionHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v13 policy:@"intent-deletion" shouldPruneBlock:v11];

  v14 = getBMSiriRemembersMessageHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v14 policy:@"intent-deletion" shouldPruneBlock:v11];

  __int16 v15 = getBMSiriRemembersCallHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v15 policy:@"intent-deletion" shouldPruneBlock:v11];

  id v16 = getBMSiriRemembersAudioHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v16 policy:@"intent-deletion" shouldPruneBlock:v11];
}

uint64_t __74__BMLibraryStreamsPruner_pruneWithDeletedIntentGroupIdentifiers_bundleId___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) shouldPruneStoreEvent:a2 forDeletedGroupIdentifiers:*(void *)(a1 + 32) bundleId:*(void *)(a1 + 40)];
}

+ (void)pruneSiriAndDictationHistory
{
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18E67D000, v3, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneSiriAndDictationHistory", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__BMLibraryStreamsPruner_pruneSiriAndDictationHistory__block_invoke;
  aBlock[3] = &__block_descriptor_40_e26_B24__0__BMStoreEvent_8_B16l;
  void aBlock[4] = a1;
  id v4 = _Block_copy(aBlock);
  v5 = getBMAppIntentIdentifier();
  [a1 _pruneStreamWithIdentifier:v5 policy:@"delete-siri-dictation-history" shouldPruneBlock:v4];

  id v6 = getBMSiriRemembersInteractionHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v6 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  id v7 = getBMSiriRemembersMessageHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v7 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  id v8 = getBMSiriRemembersCallHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v8 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  id v9 = getBMSiriRemembersAssistantSuggestionsIdentifier();
  [a1 _pruneStreamWithIdentifier:v9 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  id v10 = getBMSiriRemembersAudioHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v10 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  uint64_t v11 = getBMSiriAppSelectionMusicIdentifier();
  [a1 _pruneStreamWithIdentifier:v11 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  uint64_t v12 = getBMIntelligenceEngineInteractionDonationIdentifier();
  [a1 _pruneStreamWithIdentifier:v12 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  int v13 = getBMSiriExecutionIdentifier();
  [a1 _pruneStreamWithIdentifier:v13 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  v14 = getBMSiriFeedbackLearningUserInteractionsIdentifier();
  [a1 _pruneStreamWithIdentifier:v14 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  __int16 v15 = getBMSiriPostSiriEngagementIdentifier();
  [a1 _pruneStreamWithIdentifier:v15 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  id v16 = getBMSiriPrivateLearningSELFEventIdentifier();
  [a1 _pruneStreamWithIdentifier:v16 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  uint64_t v17 = getBMSiriRemembersIntentIdentifier();
  [a1 _pruneStreamWithIdentifier:v17 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  id v18 = getBMSiriSELFProcessedEventIdentifier();
  [a1 _pruneStreamWithIdentifier:v18 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  id v19 = getBMDictationUserEditIdentifier();
  [a1 _pruneStreamWithIdentifier:v19 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  id v20 = getBMProactiveHarvestingSiriQueryIdentifier();
  [a1 _pruneStreamWithIdentifier:v20 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  uint64_t v21 = getBMSiriDictationIdentifier();
  [a1 _pruneStreamWithIdentifier:v21 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];

  id v22 = getBMSiriServiceIdentifier();
  [a1 _pruneStreamWithIdentifier:v22 policy:@"delete-siri-dictation-history" shouldPruneBlock:&__block_literal_global_13];
}

uint64_t __54__BMLibraryStreamsPruner_pruneSiriAndDictationHistory__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldPruneStoreEventForSiriAndDictationHistoryDeletion:a2];
}

uint64_t __54__BMLibraryStreamsPruner_pruneSiriAndDictationHistory__block_invoke_2()
{
  return 1;
}

+ (void)pruneSiriDisabled
{
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18E67D000, v3, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneSiriDisabled", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__BMLibraryStreamsPruner_pruneSiriDisabled__block_invoke;
  aBlock[3] = &__block_descriptor_40_e26_B24__0__BMStoreEvent_8_B16l;
  void aBlock[4] = a1;
  id v4 = _Block_copy(aBlock);
  v5 = getBMAppIntentIdentifier();
  [a1 _pruneStreamWithIdentifier:v5 policy:@"disable-siri" shouldPruneBlock:v4];

  id v6 = getBMSiriRemembersInteractionHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v6 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  id v7 = getBMSiriRemembersMessageHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v7 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  id v8 = getBMSiriRemembersCallHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v8 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  id v9 = getBMSiriRemembersAssistantSuggestionsIdentifier();
  [a1 _pruneStreamWithIdentifier:v9 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  id v10 = getBMSiriRemembersAudioHistoryIdentifier();
  [a1 _pruneStreamWithIdentifier:v10 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  uint64_t v11 = getBMSiriAppSelectionMusicIdentifier();
  [a1 _pruneStreamWithIdentifier:v11 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  uint64_t v12 = getBMIntelligenceEngineInteractionDonationIdentifier();
  [a1 _pruneStreamWithIdentifier:v12 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  int v13 = getBMSiriExecutionIdentifier();
  [a1 _pruneStreamWithIdentifier:v13 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  v14 = getBMSiriFeedbackLearningUserInteractionsIdentifier();
  [a1 _pruneStreamWithIdentifier:v14 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  __int16 v15 = getBMSiriPostSiriEngagementIdentifier();
  [a1 _pruneStreamWithIdentifier:v15 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  id v16 = getBMSiriPrivateLearningSELFEventIdentifier();
  [a1 _pruneStreamWithIdentifier:v16 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  uint64_t v17 = getBMSiriRemembersIntentIdentifier();
  [a1 _pruneStreamWithIdentifier:v17 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  id v18 = getBMSiriSELFProcessedEventIdentifier();
  [a1 _pruneStreamWithIdentifier:v18 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  id v19 = getBMDictationUserEditIdentifier();
  [a1 _pruneStreamWithIdentifier:v19 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  id v20 = getBMProactiveHarvestingSiriQueryIdentifier();
  [a1 _pruneStreamWithIdentifier:v20 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  uint64_t v21 = getBMSiriDictationIdentifier();
  [a1 _pruneStreamWithIdentifier:v21 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];

  id v22 = getBMSiriServiceIdentifier();
  [a1 _pruneStreamWithIdentifier:v22 policy:@"disable-siri" shouldPruneBlock:&__block_literal_global_9];
}

uint64_t __43__BMLibraryStreamsPruner_pruneSiriDisabled__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldPruneStoreEventForSiriDisabled:a2];
}

uint64_t __43__BMLibraryStreamsPruner_pruneSiriDisabled__block_invoke_2()
{
  return 1;
}

+ (void)pruneForResetPrivacyAndLocationWarnings
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getBMLocationSemanticIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMLibraryStreamsPruner.m", 32, @"%s", dlerror());

  __break(1u);
}

uint64_t __65__BMLibraryStreamsPruner_pruneForResetPrivacyAndLocationWarnings__block_invoke()
{
  return 1;
}

uint64_t __56__BMLibraryStreamsPruner_pruneLearnFromThisAppDisabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) shouldPruneStoreEvent:a2 forLearnFromThisAppDisabledBundleIdentifiers:*(void *)(a1 + 32)];
}

+ (void)pruneLearnFromThisAppDisabledForMessages
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getBMAutonamingMessagesMessageIdsIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMLibraryStreamsPruner.m", 45, @"%s", dlerror());

  __break(1u);
}

uint64_t __66__BMLibraryStreamsPruner_pruneLearnFromThisAppDisabledForMessages__block_invoke()
{
  return 1;
}

+ (void)pruneForResetKeyboardDictionary
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getBMKeyboardTokenFrequencyIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMLibraryStreamsPruner.m", 36, @"%s", dlerror());

  __break(1u);
}

uint64_t __57__BMLibraryStreamsPruner_pruneForResetKeyboardDictionary__block_invoke()
{
  return 1;
}

+ (void)pruneWithDeletedContactIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_18E67D000, v5, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithDeletedContactIdentifiers: %@", buf, 0xCu);
  }

  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __61__BMLibraryStreamsPruner_pruneWithDeletedContactIdentifiers___block_invoke;
  uint64_t v12 = &unk_1E55D77E8;
  id v13 = v4;
  id v14 = a1;
  id v6 = v4;
  id v7 = _Block_copy(&v9);
  id v8 = getBMIntelligenceEngineInteractionDonationIdentifier();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v8, @"contact-deleted", v7, v9, v10, v11, v12);
}

uint64_t __61__BMLibraryStreamsPruner_pruneWithDeletedContactIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) shouldPruneStoreEvent:a2 forDeletedContactIdentifiers:*(void *)(a1 + 32)];
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forInstalledApplications:(id)a4 installedAppExtensions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 eventBody];
  if (v11)
  {
    uint64_t v12 = [a1 bundleIdentifiersFromStoreEvent:v8];
    if ([v12 count])
    {
      int v13 = [v9 intersectsSet:v12];
      int v14 = (v13 | [v10 intersectsSet:v12]) ^ 1;
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forUninstalledBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 eventBody];
  if (v8)
  {
    id v9 = [a1 bundleIdentifiersFromStoreEvent:v6];
    if ([v9 count]) {
      char v10 = [v9 containsObject:v7];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forDeletedIntentIdentifiers:(id)a4 bundleId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)a5;
  uint64_t v11 = [v8 eventBody];
  if (v11)
  {
    uint64_t v12 = [a1 intentIdentifierFromStoreEvent:v8];
    uint64_t v13 = [a1 bundleIdentifiersFromStoreEvent:v8];
    int v14 = (void *)v13;
    if (!(v10 | v13))
    {
LABEL_3:
      BOOL v15 = 1;
LABEL_13:

      goto LABEL_14;
    }
    if (v12)
    {
      if ([(id)v13 containsObject:v10]
        && ([v9 containsObject:v12] & 1) != 0)
      {
        goto LABEL_3;
      }
    }
    else
    {
      id v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[BMLibraryStreamsPruner shouldPruneStoreEvent:forDeletedIntentIdentifiers:bundleId:]();
      }

      [v14 containsObject:v10];
    }
    BOOL v15 = 0;
    goto LABEL_13;
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forDeletedGroupIdentifiers:(id)a4 bundleId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 eventBody];
  if (v9)
  {
    unint64_t v10 = [a1 intentGroupIdentifierFromStoreEvent:v7];
    if (v10) {
      char v11 = [v8 containsObject:v10];
    }
    else {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)shouldPruneStoreEventForSiriAndDictationHistoryDeletion:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventBody];
  if (v5)
  {
    id v6 = [a1 isDonatedBySiriFromStoreEvent:v4];
    id v7 = v6;
    if (v6) {
      char v8 = [v6 BOOLValue];
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)shouldPruneStoreEventForSiriDisabled:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventBody];
  if (v5)
  {
    id v6 = [a1 isDonatedBySiriFromStoreEvent:v4];
    id v7 = v6;
    if (v6) {
      char v8 = [v6 BOOLValue];
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forLearnFromThisAppDisabledBundleIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 eventBody];
  if (v8)
  {
    id v9 = [a1 bundleIdentifiersFromStoreEvent:v6];
    if (v9) {
      char v10 = [v7 intersectsSet:v9];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forDeletedContactIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 eventBody];
  if (v8)
  {
    id v9 = [a1 contactIdentifiersFromStoreEvent:v6];
    if (v9) {
      char v10 = [v7 intersectsSet:v9];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (id)bundleIdentifiersFromStoreEvent:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 eventBody];
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_44;
  }
  v5 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__BMLibraryStreamsPruner_bundleIdentifiersFromStoreEvent___block_invoke;
  aBlock[3] = &unk_1E55D7850;
  id v31 = v5;
  id v41 = v31;
  id v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2050000000;
  id v7 = (void *)getBMAppInFocusClass_softClass;
  uint64_t v46 = getBMAppInFocusClass_softClass;
  if (!getBMAppInFocusClass_softClass)
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __getBMAppInFocusClass_block_invoke;
    v42[3] = &unk_1E55D6DA8;
    v42[4] = &v43;
    __getBMAppInFocusClass_block_invoke((uint64_t)v42);
    id v7 = (void *)v44[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v43, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getBMAppIntentClass();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      getBMSiriInteractionHistoryClass();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (getBMSiriMessageHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
        || (getBMSiriCallHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
        || (getBMSiriAssistantSuggestionsClass(), (objc_opt_isKindOfClass() & 1) != 0)
        || (getBMSiriAudioHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v9 = [v4 interaction];
        int v14 = [v9 appBundleId];
        v6[2](v6, v14);

        goto LABEL_42;
      }
      getBMFrontBoardDisplayElementClass();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [v4 bundleIdentifier];
        v6[2](v6, v9);
        goto LABEL_42;
      }
      getBMScreenTimeAppUsageClass();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        getBMIntelligenceEngineInteractionClass();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v4;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          obuint64_t j = [v9 candidateInteractions];
          uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v37 != v16) {
                  objc_enumerationMutation(obj);
                }
                id v18 = [*(id *)(*((void *)&v36 + 1) + 8 * i) candidateId];
                id v19 = [v18 bundleId];
                v6[2](v6, v19);
              }
              uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
            }
            while (v15);
          }

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v20 = [v9 tupleInteraction];
          uint64_t v21 = [v20 candidateIds];

          uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v47 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v33 != v23) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v25 = [*(id *)(*((void *)&v32 + 1) + 8 * j) bundleId];
                v6[2](v6, v25);
              }
              uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v47 count:16];
            }
            while (v22);
          }

          goto LABEL_42;
        }
        getBMAppLocationActivityClass();
        if (objc_opt_isKindOfClass())
        {
          id v26 = v4;
          id v27 = [v26 bundleID];
          v6[2](v6, v27);

          id v9 = [v26 sourceBundleID];

          v6[2](v6, v9);
          goto LABEL_42;
        }
        getBMMediaNowPlayingClass();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v29 = __biome_log_for_category();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            +[BMLibraryStreamsPruner bundleIdentifiersFromStoreEvent:]();
          }

          id v10 = 0;
          goto LABEL_43;
        }
      }
    }
    id v9 = [v4 bundleID];
    v6[2](v6, v9);
    goto LABEL_42;
  }
  id v9 = v4;
  if ([v9 launchType] != 3)
  {
    char v11 = [v9 bundleID];
    v6[2](v6, v11);

    uint64_t v12 = [v9 parentBundleID];
    v6[2](v6, v12);

    uint64_t v13 = [v9 extensionHostID];
    v6[2](v6, v13);

LABEL_42:
    id v10 = v31;
    goto LABEL_43;
  }
  id v10 = [MEMORY[0x1E4F1CAD0] set];

LABEL_43:
LABEL_44:

  return v10;
}

uint64_t __58__BMLibraryStreamsPruner_bundleIdentifiersFromStoreEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    if (([v3 isEqualToString:&stru_1EDD7E578] & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }

  return MEMORY[0x1F41817F8]();
}

+ (id)intentIdentifierFromStoreEvent:(id)a3
{
  id v3 = [a3 eventBody];
  if (v3)
  {
    getBMAppIntentClass();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 itemID];
      goto LABEL_13;
    }
    getBMSiriInteractionHistoryClass();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (getBMSiriMessageHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
      || (getBMSiriCallHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
      || (getBMSiriAudioHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = [v3 interaction];
      id v4 = [v5 appIntentInteractionIdentifier];

      goto LABEL_13;
    }
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[BMLibraryStreamsPruner intentIdentifierFromStoreEvent:]();
    }
  }
  id v4 = 0;
LABEL_13:

  return v4;
}

+ (id)intentGroupIdentifierFromStoreEvent:(id)a3
{
  id v3 = [a3 eventBody];
  if (v3)
  {
    getBMAppIntentClass();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 groupIdentifier];
      goto LABEL_13;
    }
    getBMSiriInteractionHistoryClass();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (getBMSiriMessageHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
      || (getBMSiriCallHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
      || (getBMSiriAudioHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = [v3 interaction];
      id v4 = [v5 groupIdentifier];

      goto LABEL_13;
    }
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[BMLibraryStreamsPruner intentGroupIdentifierFromStoreEvent:]();
    }
  }
  id v4 = 0;
LABEL_13:

  return v4;
}

+ (id)isDonatedBySiriFromStoreEvent:(id)a3
{
  id v3 = [a3 eventBody];
  if (v3)
  {
    getBMAppIntentClass();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 donatedBySiri];
      id v5 = (void *)[objc_alloc(NSNumber) initWithBool:v4];
      goto LABEL_8;
    }
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[BMLibraryStreamsPruner isDonatedBySiriFromStoreEvent:]();
    }
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

+ (id)contactIdentifiersFromStoreEvent:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 eventBody];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__BMLibraryStreamsPruner_contactIdentifiersFromStoreEvent___block_invoke;
    aBlock[3] = &unk_1E55D7850;
    id v5 = v4;
    id v34 = v5;
    id v6 = (void (**)(void *, void *))_Block_copy(aBlock);
    getBMIntelligenceEngineInteractionClass();
    if (objc_opt_isKindOfClass())
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v24 = v3;
      id v7 = [v24 candidateInteractions];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = [*(id *)(*((void *)&v29 + 1) + 8 * i) candidateId];
            uint64_t v13 = [v12 identifier];
            v6[2](v6, v13);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v36 count:16];
        }
        while (v9);
      }

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      int v14 = [v24 tupleInteraction];
      uint64_t v15 = [v14 candidateIds];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = [*(id *)(*((void *)&v25 + 1) + 8 * j) identifier];
            v6[2](v6, v20);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v35 count:16];
        }
        while (v17);
      }

      id v21 = v5;
    }
    else
    {
      uint64_t v22 = __biome_log_for_category();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        +[BMLibraryStreamsPruner contactIdentifiersFromStoreEvent:]();
      }

      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

uint64_t __59__BMLibraryStreamsPruner_contactIdentifiersFromStoreEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    if (([v3 isEqualToString:&stru_1EDD7E578] & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }

  return MEMORY[0x1F41817F8]();
}

+ (void)shouldPruneStoreEvent:forDeletedIntentIdentifiers:bundleId:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = objc_opt_class();
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "%@ could not find identifier from event: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)bundleIdentifiersFromStoreEvent:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_5(&dword_18E67D000, v3, v4, "%@ - unhandled class in bundleIdentifiersFromStoreEvent: %@", v5, v6, v7, v8, 2u);
}

+ (void)intentIdentifierFromStoreEvent:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_5(&dword_18E67D000, v4, v5, "%@ - unhandled class in intentIdentifierFromStoreEvent: %@", v6, v7, v8, v9, v10);
}

+ (void)intentGroupIdentifierFromStoreEvent:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_5(&dword_18E67D000, v4, v5, "%@ - unhandled class in intentGroupIdentifierFromStoreEvent: %@", v6, v7, v8, v9, v10);
}

+ (void)isDonatedBySiriFromStoreEvent:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_5(&dword_18E67D000, v4, v5, "%@ - unhandled class in isDonatedBySiriFromStoreEvent: %@", v6, v7, v8, v9, v10);
}

+ (void)contactIdentifiersFromStoreEvent:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_5(&dword_18E67D000, v4, v5, "%@ - unhandled class in bundleIdentifiersFromStoreEvent: %@", v6, v7, v8, v9, v10);
}

@end