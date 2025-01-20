@interface HUHomeFeatureOnboardingUtilities
+ (BOOL)_checkIdentifyVoicePrerequisitesSimpleForHome:(id)a3;
+ (BOOL)_userHasSaidYesToShowTVViewingProfilesIn:(id)a3;
+ (BOOL)hasUserSaidYesToVoiceIdentificationInResults:(id)a3;
+ (BOOL)home:(id)a3 hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:(id)a4;
+ (BOOL)home:(id)a3 voiceRecognitionIsSupportedForCurrentUserOnMediaAccessory:(id)a4 languageOption:(id)a5;
+ (BOOL)isDeviceUsingASupportedVoiceRecognitionSiriLanguage:(id)a3 shouldFallbackToBestSupportedLanguage:(BOOL)a4;
+ (BOOL)isVoiceProfileAvailableOnThisDeviceForLanguage:(id)a3;
+ (id)_checkIdentifyVoicePrerequisitesForHome:(id)a3;
+ (id)_fetchSupportedMultiUserLanguagesSynchronously;
+ (id)analyzeHomeAssistantDevicesForSupportedVoiceRecognitionLanguages:(id)a3 home:(id)a4;
+ (id)atLeastOneHomePodHasLanguageSettingsForHomeFuture:(id)a3;
+ (id)checkSiriForiCloudEnabledPromptingUser:(id)a3;
+ (id)checkVoiceProfileAvailabiltyForLanguage:(id)a3;
+ (id)createPersonalIdentityDeviceLanguageMismatchList:(id)a3;
+ (id)fetchSupportedVoiceRecognitionLanguages;
+ (id)groupedFeaturesForOnboardingFlowKeyPaths:(id)a3;
+ (id)home:(id)a3 createMultiUserLanguageToHomePodsMapping:(id)a4;
+ (id)home:(id)a3 onboardAllFeaturesFromPresentingViewController:(id)a4 usageOptions:(id)a5;
+ (id)home:(id)a3 onboardFeaturesForKeyPaths:(id)a4 presentingViewController:(id)a5 usageOptions:(id)a6;
+ (id)home:(id)a3 onboardHomeHub2FromPresentingViewController:(id)a4 devices:(id)a5 usageOptions:(id)a6;
+ (id)home:(id)a3 onboardIdentifyVoiceFromPresentingViewController:(id)a4 usageOptions:(id)a5;
+ (id)home:(id)a3 onboardPersonalRequestsFromPresentingViewController:(id)a4;
+ (id)home:(id)a3 processHomeFeatureOnboarderResults:(id)a4;
+ (id)processLanguageAndMediaProfileInfo:(id)a3;
+ (unint64_t)home:(id)a3 checkForMultiUserDeviceUpgradeRequirements:(id)a4;
+ (unint64_t)home:(id)a3 checkForOwnerUpgradeRequirementsFromResults:(id)a4;
+ (void)_initializeSiriLanguageOptionsManagerIfNecessaryForHomePods:(id)a3;
+ (void)fetchSupportedVoiceRecognitionLanguagesWithCompletion:(id)a3;
+ (void)initialize;
+ (void)presentAlertConfirmingTurningOfVoiceRecognitionFrom:(id)a3;
+ (void)presentAlertConfirmingTurningOffPersonalRequestsFrom:(id)a3;
@end

@implementation HUHomeFeatureOnboardingUtilities

+ (id)atLeastOneHomePodHasLanguageSettingsForHomeFuture:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v49 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v43 = v3;
  v44 = objc_msgSend(v3, "hf_homePods");
  id v4 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v4 setQualityOfService:33];
  v46 = v4;
  [v4 setMaxConcurrentOperationCount:-1];
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v81[3] = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  char v80 = 0;
  v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v6 = [v5 homeManager];
  int v50 = [v6 hasOptedToHH2];

  if (![v44 count])
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v41 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v83 = a1;
      __int16 v84 = 2112;
      v85 = v41;
      _os_log_debug_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEBUG, "%@:%@ No HomePods found in the home.", buf, 0x16u);
    }
    [v49 finishWithResult:MEMORY[0x1E4F1CC28]];
    id v8 = v49;
    goto LABEL_39;
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    +[HUHomeFeatureOnboardingUtilities _initializeSiriLanguageOptionsManagerIfNecessaryForHomePods:v44];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke;
    block[3] = &unk_1E6386018;
    id v76 = v44;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v44;
  uint64_t v9 = [obj countByEnumeratingWithState:&v71 objects:v92 count:16];
  if (!v9)
  {
LABEL_32:

    if ((v50 & 1) == 0) {
      goto LABEL_36;
    }
    goto LABEL_38;
  }
  uint64_t v48 = *(void *)v72;
  uint64_t v45 = *MEMORY[0x1E4F67FC0];
  *(void *)&long long v10 = 138413314;
  long long v42 = v10;
LABEL_10:
  uint64_t v47 = v9;
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v72 != v48) {
      objc_enumerationMutation(obj);
    }
    if (*((unsigned char *)v78 + 24))
    {
      id v8 = v49;

      goto LABEL_39;
    }
    v12 = *(void **)(*((void *)&v71 + 1) + 8 * v11);
    v13 = [v12 mediaProfile];
    v14 = v13;
    if (!v50) {
      break;
    }
    v15 = (void *)MEMORY[0x1E4F28B48];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_2;
    v63[3] = &unk_1E63884C0;
    id v16 = v13;
    id v64 = v16;
    v67 = v81;
    v68 = &v77;
    id v69 = a1;
    SEL v70 = a2;
    id v17 = v49;
    id v65 = v17;
    id v18 = v46;
    id v66 = v18;
    v19 = [v15 blockOperationWithBlock:v63];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_102;
    v56[3] = &unk_1E63884E8;
    v59 = &v77;
    v60 = v81;
    id v57 = obj;
    id v61 = a1;
    SEL v62 = a2;
    id v58 = v17;
    [v19 setCompletionBlock:v56];
    v20 = objc_msgSend(v16, "hf_backingAccessory");
    v21 = [v20 name];
    [v19 setName:v21];

    v22 = [v18 operations];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_103;
    v54[3] = &unk_1E6388510;
    id v23 = v19;
    id v55 = v23;
    v24 = objc_msgSend(v22, "na_firstObjectPassingTest:", v54);

    if (!v24) {
      [v18 addOperation:v23];
    }

LABEL_30:
    if (v47 == ++v11)
    {
      uint64_t v9 = [obj countByEnumeratingWithState:&v71 objects:v92 count:16];
      if (v9) {
        goto LABEL_10;
      }
      goto LABEL_32;
    }
  }
  v25 = objc_msgSend(v13, "hf_settingsAdapterManager");
  v26 = [v25 adapterForIdentifier:v45];
  objc_opt_class();
  id v27 = v26;
  if (objc_opt_isKindOfClass()) {
    v28 = v27;
  }
  else {
    v28 = 0;
  }
  id v29 = v28;

  v30 = [v29 selectedLanguageOption];
  v31 = [v29 availableLanguageOptions];
  v32 = v31;
  if (v30 && [v31 count])
  {
    v33 = HFLogForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = NSStringFromSelector(a2);
      *(_DWORD *)buf = v42;
      id v83 = a1;
      __int16 v84 = 2112;
      v85 = v34;
      __int16 v86 = 2112;
      v87 = v12;
      __int16 v88 = 2112;
      v89 = v30;
      __int16 v90 = 2112;
      v91 = v32;
      _os_log_impl(&dword_1BE345000, v33, OS_LOG_TYPE_DEFAULT, "%@:%@ Found HomePod [%@] has selected language option [%@] and available language options [%@] from the Adapter.", buf, 0x34u);
    }
    *((unsigned char *)v78 + 24) = 1;
    v35 = [NSNumber numberWithBool:1];
    [v49 finishWithResult:v35];
    int v36 = 0;
    char v37 = 1;
  }
  else
  {
    v35 = HFLogForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v38 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v83 = a1;
      __int16 v84 = 2112;
      v85 = v38;
      __int16 v86 = 2112;
      v87 = v12;
      _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri Language Setting For HomePod [%@] Not Found.", buf, 0x20u);
    }
    char v37 = 0;
    int v36 = 1;
  }

  if (v36) {
    goto LABEL_30;
  }

  id v8 = v49;
  if ((v37 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_36:
  if (!*((unsigned char *)v78 + 24)) {
    [v49 finishWithResult:MEMORY[0x1E4F1CC28]];
  }
LABEL_38:
  v39 = objc_msgSend(MEMORY[0x1E4F7A0F0], "mainThreadScheduler", v42);
  id v8 = [v49 reschedule:v39];

LABEL_39:
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(v81, 8);

  return v8;
}

+ (void)initialize
{
  if (_MergedGlobals_619 != -1) {
    dispatch_once(&_MergedGlobals_619, &__block_literal_global_25_1);
  }
  v2 = (void *)qword_1EBA477F8;

  objc_storeStrong((id *)&_supportedVoiceRecognitionLanguages, v2);
}

void __46__HUHomeFeatureOnboardingUtilities_initialize__block_invoke_2()
{
  uint64_t v0 = +[HUHomeFeatureOnboardingUtilities _fetchSupportedMultiUserLanguagesSynchronously];
  v1 = (void *)qword_1EBA477F8;
  qword_1EBA477F8 = v0;
}

+ (id)_fetchSupportedMultiUserLanguagesSynchronously
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  id v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = objc_alloc_init(MEMORY[0x1E4F4E570]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__HUHomeFeatureOnboardingUtilities__fetchSupportedMultiUserLanguagesSynchronously__block_invoke;
  v8[3] = &unk_1E6388380;
  long long v10 = &v12;
  SEL v11 = a2;
  v5 = v3;
  uint64_t v9 = v5;
  [v4 fetchSupportedMultiUserLanguageCodes:v8];
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

void __82__HUHomeFeatureOnboardingUtilities__fetchSupportedMultiUserLanguagesSynchronously__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v10 = 138412546;
      SEL v11 = v9;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "%@ THIS SHOULD NOT HAPPEN. Error fetching multi-user language codes %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)home:(id)a3 onboardPersonalRequestsFromPresentingViewController:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    int v10 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v9;

    id v8 = (void *)_staticOnboardingFuture;
  }
  if (([v8 isFinished] & 1) == 0)
  {
    SEL v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v23 = v12;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);
    }
  }
  id v13 = (void *)_staticOnboardingFuture;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__HUHomeFeatureOnboardingUtilities_home_onboardPersonalRequestsFromPresentingViewController___block_invoke;
  v18[3] = &unk_1E6387BB0;
  id v19 = v6;
  id v20 = v7;
  SEL v21 = a2;
  id v14 = v7;
  id v15 = v6;
  id v16 = [v13 flatMap:v18];

  return v16;
}

id __93__HUHomeFeatureOnboardingUtilities_home_onboardPersonalRequestsFromPresentingViewController___block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v20 = @"OnboardingDisplayOption_OnboardingFromUserInput";
  v21[0] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7;
  id v18 = __Block_byref_object_dispose__7;
  id v19 = [[HUHomeFeatureOnboarder alloc] initWithFeatures:&unk_1F19B56D8 home:*(void *)(a1 + 32) usageOptions:v4];
  [(id)v15[5] startOnboardingWithPresentingViewController:*(void *)(a1 + 40) usageOptions:v4];
  v5 = [(id)v15[5] completionFuture];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__HUHomeFeatureOnboardingUtilities_home_onboardPersonalRequestsFromPresentingViewController___block_invoke_32;
  v9[3] = &unk_1E63883A8;
  uint64_t v6 = *(void *)(a1 + 48);
  __int16 v12 = &v14;
  uint64_t v13 = v6;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v7 = [v5 flatMap:v9];

  _Block_object_dispose(&v14, 8);

  return v7;
}

id __93__HUHomeFeatureOnboardingUtilities_home_onboardPersonalRequestsFromPresentingViewController___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) restart];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  id v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (Identify Voice))", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) onboardPersonalRequestsFromPresentingViewController:*(void *)(a1 + 40)];
  }
  else
  {
    if (v8)
    {
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v14 = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) processHomeFeatureOnboarderResults:v3];
  }
  __int16 v12 = (void *)v10;

  return v12;
}

+ (id)home:(id)a3 onboardIdentifyVoiceFromPresentingViewController:(id)a4 usageOptions:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    uint64_t v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    uint64_t v13 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v12;

    id v11 = (void *)_staticOnboardingFuture;
  }
  if (([v11 isFinished] & 1) == 0)
  {
    int v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v29 = v15;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);
    }
  }
  __int16 v16 = (void *)_staticOnboardingFuture;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __103__HUHomeFeatureOnboardingUtilities_home_onboardIdentifyVoiceFromPresentingViewController_usageOptions___block_invoke;
  v23[3] = &unk_1E63883F8;
  id v24 = v8;
  id v25 = v10;
  id v26 = v9;
  SEL v27 = a2;
  id v17 = v9;
  id v18 = v10;
  id v19 = v8;
  id v20 = (id)[v16 flatMap:v23];
  id v21 = (id)_staticOnboardingFuture;

  return v21;
}

id __103__HUHomeFeatureOnboardingUtilities_home_onboardIdentifyVoiceFromPresentingViewController_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = &unk_1F19B56F0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ started with feature flows %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v17 = __Block_byref_object_copy__7;
  id v18 = __Block_byref_object_dispose__7;
  id v19 = [[HUHomeFeatureOnboarder alloc] initWithFeatures:&unk_1F19B56F0 home:*(void *)(a1 + 32) usageOptions:*(void *)(a1 + 40)];
  [*(id *)(*(void *)&buf[8] + 40) startOnboardingWithPresentingViewController:*(void *)(a1 + 48) usageOptions:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(*(void *)&buf[8] + 40) completionFuture];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __103__HUHomeFeatureOnboardingUtilities_home_onboardIdentifyVoiceFromPresentingViewController_usageOptions___block_invoke_42;
  v10[3] = &unk_1E63883D0;
  uint64_t v7 = *(void *)(a1 + 56);
  int v14 = buf;
  uint64_t v15 = v7;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  id v8 = [v6 flatMap:v10];

  _Block_object_dispose(buf, 8);

  return v8;
}

id __103__HUHomeFeatureOnboardingUtilities_home_onboardIdentifyVoiceFromPresentingViewController_usageOptions___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) restart];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v14 = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (Identify Voice))", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) onboardIdentifyVoiceFromPresentingViewController:*(void *)(a1 + 40) usageOptions:*(void *)(a1 + 48)];
  }
  else
  {
    if (v8)
    {
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v14 = 138412546;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) processHomeFeatureOnboarderResults:v3];
  }
  id v12 = (void *)v10;

  return v12;
}

+ (id)home:(id)a3 onboardAllFeaturesFromPresentingViewController:(id)a4 usageOptions:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    uint64_t v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    int v14 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v13;

    id v12 = (void *)_staticOnboardingFuture;
  }
  if (([v12 isFinished] & 1) == 0)
  {
    uint64_t v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v31 = v16;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);
    }
  }
  id v17 = (void *)_staticOnboardingFuture;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__HUHomeFeatureOnboardingUtilities_home_onboardAllFeaturesFromPresentingViewController_usageOptions___block_invoke;
  v24[3] = &unk_1E6388420;
  id v28 = a1;
  SEL v29 = a2;
  id v25 = v9;
  id v26 = v11;
  id v27 = v10;
  id v18 = v10;
  id v19 = v11;
  id v20 = v9;
  id v21 = (id)[v17 flatMap:v24];
  id v22 = (id)_staticOnboardingFuture;

  return v22;
}

id __101__HUHomeFeatureOnboardingUtilities_home_onboardAllFeaturesFromPresentingViewController_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  uint64_t v5 = [v4 homeManager];
  int v6 = [v5 hasOptedToHH2];

  if (v6) {
    int v7 = objc_msgSend(*(id *)(a1 + 32), "hf_hasReachableResidents");
  }
  else {
    int v7 = 1;
  }
  BOOL v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v31) = v6;
    WORD2(v31) = 1024;
    *(_DWORD *)((char *)&v31 + 6) = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: hasOptedToHH2 %{BOOL}d, shouldShowResidentDependantFlows = %{BOOL}d", buf, 0x22u);
  }
  id v11 = [MEMORY[0x1E4F1CA48] array];
  if (objc_msgSend(*(id *)(a1 + 32), "hf_shouldBlockCurrentUserFromHome"))
  {
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = *(void *)(a1 + 56);
      id v22 = NSStringFromSelector(*(SEL *)(a1 + 64));
      id v23 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&long long v31 = v23;
      _os_log_debug_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEBUG, "%@:%@: User is blocked from home %@, skipping all onboarding flows", buf, 0x20u);
    }
    uint64_t v13 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    int v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"OnboardingDisplayOption_ShowSwitchHomeScreen"];
    char v15 = [v14 BOOLValue];

    if ((v15 & 1) != 0 || HFForceSwitchHomeWelcomeOnboarding()) {
      [v11 addObject:&unk_1F19B5708];
    }
    if (v7)
    {
      [v11 addObject:&unk_1F19B5720];
      [v11 addObject:&unk_1F19B5738];
      if (_os_feature_enabled_impl()) {
        [v11 addObject:&unk_1F19B5750];
      }
      [v11 addObject:&unk_1F19B5768];
      [v11 addObject:&unk_1F19B5780];
      [v11 addObject:&unk_1F19B5798];
      [v11 addObject:&unk_1F19B57B0];
    }
    [v11 addObject:&unk_1F19B57C8];
    __int16 v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ started with grouped feature flows %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&long long v31 = __Block_byref_object_copy__7;
    *((void *)&v31 + 1) = __Block_byref_object_dispose__7;
    uint64_t v32 = [[HUHomeFeatureOnboarder alloc] initWithGroupedFeatures:v11 home:*(void *)(a1 + 32) usageOptions:*(void *)(a1 + 40)];
    [*(id *)(*(void *)&buf[8] + 40) startOnboardingWithPresentingViewController:*(void *)(a1 + 48) usageOptions:*(void *)(a1 + 40)];
    id v18 = [*(id *)(*(void *)&buf[8] + 40) completionFuture];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __101__HUHomeFeatureOnboardingUtilities_home_onboardAllFeaturesFromPresentingViewController_usageOptions___block_invoke_90;
    v24[3] = &unk_1E63883D0;
    uint64_t v19 = *(void *)(a1 + 64);
    id v28 = buf;
    uint64_t v29 = v19;
    id v25 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 48);
    id v27 = *(id *)(a1 + 40);
    uint64_t v13 = [v18 flatMap:v24];

    _Block_object_dispose(buf, 8);
  }

  return v13;
}

id __101__HUHomeFeatureOnboardingUtilities_home_onboardAllFeaturesFromPresentingViewController_usageOptions___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) restart];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  int v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v14 = 138412290;
      char v15 = v9;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (All Features))", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) onboardAllFeaturesFromPresentingViewController:*(void *)(a1 + 40) usageOptions:*(void *)(a1 + 48)];
  }
  else
  {
    if (v8)
    {
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v14 = 138412546;
      char v15 = v11;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) processHomeFeatureOnboarderResults:v3];
  }
  id v12 = (void *)v10;

  return v12;
}

+ (id)home:(id)a3 onboardFeaturesForKeyPaths:(id)a4 presentingViewController:(id)a5 usageOptions:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    uint64_t v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    __int16 v16 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v15;

    int v14 = (void *)_staticOnboardingFuture;
  }
  if (([v14 isFinished] & 1) == 0)
  {
    id v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);
    }
  }
  uint64_t v19 = (void *)_staticOnboardingFuture;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __106__HUHomeFeatureOnboardingUtilities_home_onboardFeaturesForKeyPaths_presentingViewController_usageOptions___block_invoke;
  v27[3] = &unk_1E6388470;
  id v31 = v12;
  SEL v32 = a2;
  id v28 = v11;
  id v29 = v10;
  id v30 = v13;
  id v20 = v12;
  id v21 = v13;
  id v22 = v10;
  id v23 = v11;
  id v24 = (id)[v19 flatMap:v27];
  id v25 = (id)_staticOnboardingFuture;

  return v25;
}

id __106__HUHomeFeatureOnboardingUtilities_home_onboardFeaturesForKeyPaths_presentingViewController_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    int v4 = +[HUHomeFeatureOnboardingUtilities groupedFeaturesForOnboardingFlowKeyPaths:](HUHomeFeatureOnboardingUtilities, "groupedFeaturesForOnboardingFlowKeyPaths:");
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v4 count];
      *(_WORD *)&buf[22] = 2112;
      uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t))v4;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ started with grouped feature flows (%lu groups) %@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__7;
    id v20 = __Block_byref_object_dispose__7;
    id v21 = [[HUHomeFeatureOnboarder alloc] initWithGroupedFeatures:v4 home:*(void *)(a1 + 40) usageOptions:*(void *)(a1 + 48)];
    [*(id *)(*(void *)&buf[8] + 40) startOnboardingWithPresentingViewController:*(void *)(a1 + 56) usageOptions:*(void *)(a1 + 48)];
    int v7 = [*(id *)(*(void *)&buf[8] + 40) completionFuture];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __106__HUHomeFeatureOnboardingUtilities_home_onboardFeaturesForKeyPaths_presentingViewController_usageOptions___block_invoke_91;
    v11[3] = &unk_1E6388448;
    uint64_t v8 = *(void *)(a1 + 64);
    __int16 v16 = buf;
    uint64_t v17 = v8;
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 48);
    uint64_t v9 = [v7 flatMap:v11];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
  }

  return v9;
}

id __106__HUHomeFeatureOnboardingUtilities_home_onboardFeaturesForKeyPaths_presentingViewController_usageOptions___block_invoke_91(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) restart];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  int v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 72));
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (Keypaths))", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) onboardFeaturesForKeyPaths:*(void *)(a1 + 40) presentingViewController:*(void *)(a1 + 48) usageOptions:*(void *)(a1 + 56)];
  }
  else
  {
    if (v8)
    {
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
      int v14 = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) processHomeFeatureOnboarderResults:v3];
  }
  id v12 = (void *)v10;

  return v12;
}

+ (id)home:(id)a3 onboardHomeHub2FromPresentingViewController:(id)a4 devices:(id)a5 usageOptions:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    uint64_t v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    __int16 v16 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v15;

    int v14 = (void *)_staticOnboardingFuture;
  }
  if (([v14 isFinished] & 1) == 0)
  {
    id v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);
    }
  }
  uint64_t v19 = (void *)_staticOnboardingFuture;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __106__HUHomeFeatureOnboardingUtilities_home_onboardHomeHub2FromPresentingViewController_devices_usageOptions___block_invoke;
  v27[3] = &unk_1E6388470;
  id v31 = v11;
  SEL v32 = a2;
  id v28 = v10;
  id v29 = v12;
  id v30 = v13;
  id v20 = v11;
  id v21 = v13;
  id v22 = v12;
  id v23 = v10;
  id v24 = (id)[v19 flatMap:v27];
  id v25 = (id)_staticOnboardingFuture;

  return v25;
}

id __106__HUHomeFeatureOnboardingUtilities_home_onboardHomeHub2FromPresentingViewController_devices_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = &unk_1F19B57E0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ started with feature flows %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__7;
  uint64_t v19 = __Block_byref_object_dispose__7;
  id v20 = [[HUHomeFeatureOnboarder alloc] initWithFeatures:&unk_1F19B57E0 home:*(void *)(a1 + 32) devices:*(void *)(a1 + 40) usageOptions:*(void *)(a1 + 48)];
  [*(id *)(*(void *)&buf[8] + 40) startOnboardingWithPresentingViewController:*(void *)(a1 + 56) usageOptions:*(void *)(a1 + 48)];
  int v6 = [*(id *)(*(void *)&buf[8] + 40) completionFuture];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __106__HUHomeFeatureOnboardingUtilities_home_onboardHomeHub2FromPresentingViewController_devices_usageOptions___block_invoke_97;
  v10[3] = &unk_1E6388448;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v15 = buf;
  uint64_t v16 = v7;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  BOOL v8 = [v6 flatMap:v10];

  _Block_object_dispose(buf, 8);

  return v8;
}

id __106__HUHomeFeatureOnboardingUtilities_home_onboardHomeHub2FromPresentingViewController_devices_usageOptions___block_invoke_97(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) restart];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 72));
      int v14 = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (Identify Voice))", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) onboardHomeHub2FromPresentingViewController:*(void *)(a1 + 40) devices:*(void *)(a1 + 48) usageOptions:*(void *)(a1 + 56)];
  }
  else
  {
    if (v8)
    {
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
      int v14 = 138412546;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) processHomeFeatureOnboarderResults:v3];
  }
  id v12 = (void *)v10;

  return v12;
}

uint64_t __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke(uint64_t a1)
{
  return +[HUHomeFeatureOnboardingUtilities _initializeSiriLanguageOptionsManagerIfNecessaryForHomePods:*(void *)(a1 + 32)];
}

void __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "hf_siriLanguageOptionsManager");
  id v3 = [v2 selectedLanguageOption];
  int v4 = [v2 availableSiriLanguageOptions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_3;
  v9[3] = &unk_1E6388498;
  long long v5 = *(_OWORD *)(a1 + 56);
  id v10 = v3;
  long long v6 = *(_OWORD *)(a1 + 72);
  long long v14 = v5;
  long long v15 = v6;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v7 = v3;
  id v8 = (id)[v4 addCompletionBlock:v9];
}

void __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v7 = v5;
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    LOBYTE(v9) = [v7 count] != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v9;
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 80);
    id v12 = NSStringFromSelector(*(SEL *)(a1 + 88));
    id v13 = objc_msgSend(*(id *)(a1 + 40), "hf_backingAccessory");
    long long v14 = [v13 name];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = [v8 count];
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    int v18 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    int v19 = 138413826;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v14;
    __int16 v25 = 2112;
    uint64_t v26 = v15;
    __int16 v27 = 2048;
    uint64_t v28 = v16;
    __int16 v29 = 2048;
    uint64_t v30 = v17;
    __int16 v31 = 1024;
    int v32 = v18;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ OptionsManager - HomePodProfile [%@], selectedLanguageOption: [%@], languageOptions: [%ld], futuresCompleted: %lu, hasLanguageSettings: %{BOOL}d", (uint8_t *)&v19, 0x44u);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [*(id *)(a1 + 48) finishWithResult:MEMORY[0x1E4F1CC38]];
    [*(id *)(a1 + 56) cancelAllOperations];
  }
}

uint64_t __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_102(uint64_t result)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 56) + 8) + 24);
    result = [*(id *)(result + 32) count];
    if (v2 == result)
    {
      id v3 = HFLogForCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(v1 + 64);
        id v5 = NSStringFromSelector(*(SEL *)(v1 + 72));
        uint64_t v6 = *(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 24);
        int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(v1 + 48) + 8) + 24);
        int v8 = 138413058;
        uint64_t v9 = v4;
        __int16 v10 = 2112;
        uint64_t v11 = v5;
        __int16 v12 = 2048;
        uint64_t v13 = v6;
        __int16 v14 = 1024;
        int v15 = v7;
        _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%@: No homepod language options found. futuresCompleted: %lu, hasLanguageSettings: %{BOOL}d", (uint8_t *)&v8, 0x26u);
      }
      return [*(id *)(v1 + 40) finishWithResult:MEMORY[0x1E4F1CC28]];
    }
  }
  return result;
}

BOOL __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_103(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [*(id *)(a1 + 32) name];
  BOOL v5 = v3 == v4;

  return v5;
}

+ (void)_initializeSiriLanguageOptionsManagerIfNecessaryForHomePods:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138412290;
    long long v13 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        __int16 v10 = objc_msgSend(v9, "mediaProfile", v13);

        if (v10)
        {
          uint64_t v11 = [v9 mediaProfile];
          __int16 v12 = objc_msgSend(v11, "hf_siriLanguageOptionsManager");
        }
        else
        {
          __int16 v12 = HFLogForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            int v19 = v9;
            _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "mediaProfile is NULL for %@:", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }
}

+ (BOOL)home:(id)a3 hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v7, "hf_hasHomePods"))
  {
    uint64_t v9 = +[HUHomeFeatureOnboardingUtilities home:v7 createMultiUserLanguageToHomePodsMapping:v8];
    __int16 v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      int v15 = 138413058;
      id v16 = a1;
      __int16 v17 = 2112;
      int v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = [v9 count];
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ %lu HomePods on Supported Languages (languageToHomePodsMapping %@)", (uint8_t *)&v15, 0x2Au);
    }
    BOOL v12 = [v9 count] != 0;
  }
  else
  {
    uint64_t v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = NSStringFromSelector(a2);
      int v15 = 138412290;
      id v16 = v13;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: There are no HomePods so we will return NO in this case", (uint8_t *)&v15, 0xCu);
    }
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)fetchSupportedVoiceRecognitionLanguages
{
  uint64_t v2 = (void *)_supportedVoiceRecognitionLanguages;
  if (!_supportedVoiceRecognitionLanguages)
  {
    id v3 = NSStringFromSelector(a2);
    NSLog(&cfstr_Fetchsupported.isa, v3);

    uint64_t v2 = (void *)_supportedVoiceRecognitionLanguages;
  }
  uint64_t v4 = (void *)[v2 copy];

  return v4;
}

+ (void)fetchSupportedVoiceRecognitionLanguagesWithCompletion:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F4E570];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 fetchSupportedMultiUserLanguageCodes:v4];
}

+ (void)presentAlertConfirmingTurningOfVoiceRecognitionFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v27 = v4;
    __int16 v28 = 2112;
    __int16 v29 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: Now presenting alert to turn OFF Voice Recognition", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x1E4F42728];
  id v8 = _HULocalizedStringWithDefaultValue(@"HUTurnOffVoiceRecognition_Alert_Title", @"HUTurnOffVoiceRecognition_Alert_Title", 1);
  uint64_t v9 = _HULocalizedStringWithDefaultValue(@"HUTurnOffVoiceRecognition_Alert_Detail", @"HUTurnOffVoiceRecognition_Alert_Detail", 1);
  __int16 v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  uint64_t v11 = (void *)MEMORY[0x1E4F42720];
  BOOL v12 = _HULocalizedStringWithDefaultValue(@"HUTurnOffVoiceRecognition_Confirmation_TurnOff", @"HUTurnOffVoiceRecognition_Confirmation_TurnOff", 1);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __88__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOfVoiceRecognitionFrom___block_invoke;
  v24[3] = &unk_1E6385188;
  id v13 = v4;
  id v25 = v13;
  long long v14 = [v11 actionWithTitle:v12 style:1 handler:v24];
  [v10 addAction:v14];

  int v15 = (void *)MEMORY[0x1E4F42720];
  id v16 = _HULocalizedStringWithDefaultValue(@"HUTurnOffVoiceRecognition_Confirmation_DontTurnOff", @"HUTurnOffVoiceRecognition_Confirmation_DontTurnOff", 1);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  __int16 v21 = __88__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOfVoiceRecognitionFrom___block_invoke_126;
  id v22 = &unk_1E6385188;
  id v23 = v13;
  id v17 = v13;
  int v18 = [v15 actionWithTitle:v16 style:0 handler:&v19];
  objc_msgSend(v10, "addAction:", v18, v19, v20, v21, v22);

  [v17 presentViewController:v10 animated:1 completion:0];
}

void __88__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOfVoiceRecognitionFrom___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    int v6 = 136315394;
    id v7 = "+[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOfVoiceRecognitionFrom:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) userTappedContinueFromWarning];
}

void __88__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOfVoiceRecognitionFrom___block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    int v6 = 136315394;
    id v7 = "+[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOfVoiceRecognitionFrom:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) userTappedCancelFromWarning];
}

+ (void)presentAlertConfirmingTurningOffPersonalRequestsFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v22 = v4;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: Now presenting alert to turn OFF Personal Requests", buf, 0x16u);
  }
  id v7 = _HULocalizedStringWithDefaultValue(@"HUTurnOffPersonalRequests_Alert_Detail", @"HUTurnOffPersonalRequests_Alert_Detail", 1);
  __int16 v8 = _HULocalizedStringWithDefaultValue(@"HUTurnOffPersonalRequests_Alert_Detail", @"HUTurnOffPersonalRequests_Alert_Detail", 1);

  uint64_t v9 = (void *)MEMORY[0x1E4F42728];
  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUTurnOffPersonalRequests_Alert_Title", @"HUTurnOffPersonalRequests_Alert_Title", 1);
  uint64_t v11 = [v9 alertControllerWithTitle:v10 message:v8 preferredStyle:1];

  BOOL v12 = (void *)MEMORY[0x1E4F42720];
  id v13 = _HULocalizedStringWithDefaultValue(@"HUTurnOffPersonalRequests_Confirmation_TurnOff", @"HUTurnOffPersonalRequests_Confirmation_TurnOff", 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOffPersonalRequestsFrom___block_invoke;
  v19[3] = &unk_1E6385188;
  id v20 = v4;
  id v14 = v4;
  int v15 = [v12 actionWithTitle:v13 style:1 handler:v19];
  [v11 addAction:v15];

  id v16 = (void *)MEMORY[0x1E4F42720];
  id v17 = _HULocalizedStringWithDefaultValue(@"HUTurnOffPersonalRequests_Confirmation_DontTurnOff", @"HUTurnOffPersonalRequests_Confirmation_DontTurnOff", 1);
  int v18 = [v16 actionWithTitle:v17 style:0 handler:&__block_literal_global_141];
  [v11 addAction:v18];

  [v14 presentViewController:v11 animated:1 completion:0];
}

void __89__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOffPersonalRequestsFrom___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    int v6 = 136315394;
    id v7 = "+[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOffPersonalRequestsFrom:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped turn off button '%@' from the alert popup", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) userTappedContinueFromWarning];
}

void __89__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOffPersonalRequestsFrom___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 title];
    int v5 = 136315394;
    int v6 = "+[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOffPersonalRequestsFrom:]_block_invoke";
    __int16 v7 = 2112;
    __int16 v8 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped don't turn off button '%@' from the alert popup", (uint8_t *)&v5, 0x16u);
  }
}

+ (BOOL)home:(id)a3 voiceRecognitionIsSupportedForCurrentUserOnMediaAccessory:(id)a4 languageOption:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 isMultiUserEnabled] && objc_msgSend(v10, "hf_supportsMultiUser"))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F69710]);
    id v13 = [v9 currentUser];
    id v14 = (void *)[v12 initWithHome:v9 user:v13 nameStyle:0];

    if (![v14 isIdentifyVoiceEnabled])
    {
      char v22 = 0;
LABEL_16:

      goto LABEL_17;
    }
    int v15 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
    id v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = NSStringFromSelector(a2);
      int v26 = 138413058;
      id v27 = a1;
      __int16 v28 = 2112;
      __int16 v29 = v17;
      __int16 v30 = 2048;
      uint64_t v31 = [v15 count];
      __int16 v32 = 2112;
      uint64_t v33 = v15;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", (uint8_t *)&v26, 0x2Au);
    }
    if (v15)
    {
      if (v11)
      {
        int v18 = [v11 recognitionLanguage];
        char v19 = [v15 containsObject:v18];
        uint64_t v20 = [MEMORY[0x1E4F4E538] sharedPreferences];
        __int16 v21 = [(id)v20 languageCode];

        LOBYTE(v20) = [v18 isEqualToString:v21];
        char v22 = v19 & v20;
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      __int16 v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = NSStringFromSelector(a2);
        int v26 = 138412290;
        id v27 = v25;
        _os_log_error_impl(&dword_1BE345000, v23, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v26, 0xCu);
      }
    }
    char v22 = 0;
    goto LABEL_15;
  }
  char v22 = 0;
LABEL_17:

  return v22;
}

+ (id)checkSiriForiCloudEnabledPromptingUser:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__7;
  int v26 = __Block_byref_object_dispose__7;
  id v27 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  if ([MEMORY[0x1E4F69758] isSiriForiCloudEnabled])
  {
    [(id)v23[5] finishWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    int v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v29 = a1;
      __int16 v30 = 2112;
      uint64_t v31 = v7;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri for iCloud is not enabled, prompting user to enable before enabling Voice Recognition", buf, 0x16u);
    }
    __int16 v8 = (void *)MEMORY[0x1E4F42728];
    id v9 = _HULocalizedStringWithDefaultValue(@"HUTurnOnSiriIniCloud_Alert_Title", @"HUTurnOnSiriIniCloud_Alert_Title", 1);
    id v10 = _HULocalizedStringWithDefaultValue(@"HUTurnOnSiriIniCloud_Alert_Message", @"HUTurnOnSiriIniCloud_Alert_Message", 1);
    id v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    id v12 = (void *)MEMORY[0x1E4F42720];
    id v13 = _HULocalizedStringWithDefaultValue(@"HUTurnOnSiriIniCloud_Confirmation_TurnOn", @"HUTurnOnSiriIniCloud_Confirmation_TurnOn", 1);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke;
    v21[3] = &unk_1E6388560;
    v21[4] = &v22;
    v21[5] = a1;
    v21[6] = a2;
    id v14 = [v12 actionWithTitle:v13 style:0 handler:v21];

    int v15 = (void *)MEMORY[0x1E4F42720];
    id v16 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke_159;
    v20[3] = &unk_1E6388588;
    v20[4] = &v22;
    id v17 = [v15 actionWithTitle:v16 style:0 handler:v20];

    [v11 addAction:v14];
    [v11 addAction:v17];
    [v5 presentViewController:v11 animated:1 completion:0];
  }
  id v18 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v18;
}

void __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    *(_DWORD *)buf = 136315394;
    id v10 = "+[HUHomeFeatureOnboardingUtilities checkSiriForiCloudEnabledPromptingUser:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Turn On Siri In iCloud - TurnOn' button '%@' from the alert popup", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke_154;
  v6[3] = &unk_1E6388538;
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  [MEMORY[0x1E4F69758] updateSiriForiCloudEnabled:1 completionHandler:v6];
}

void __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke_154(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v7 = 138412802;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: There was an error enabling iCloud for Siri: %@", (uint8_t *)&v7, 0x20u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) finishWithError:v3];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) finishWithResult:MEMORY[0x1E4F1CC38]];
  }
}

uint64_t __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke_159(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "+[HUHomeFeatureOnboardingUtilities checkSiriForiCloudEnabledPromptingUser:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from the alert popup", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) finishWithResult:MEMORY[0x1E4F1CC28]];
}

+ (id)home:(id)a3 processHomeFeatureOnboarderResults:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v5 = a4;
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    id v67 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Postprocessing Feature Onboarding results %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v67) = 0;
  uint64_t v8 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_FinishedOnboarding"];
  __int16 v9 = v8;
  uint64_t v10 = *(void *)&buf[8];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    char v11 = 1;
  }
  else
  {
    char v11 = [v8 BOOLValue];
    uint64_t v10 = *(void *)&buf[8];
  }
  *(unsigned char *)(v10 + 24) = v11;
  id v12 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_Announce_FinishedOnboarding"];

  char v38 = [v12 BOOLValue];
  uint64_t v13 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_HomeTheater_FinishedOnboarding"];

  char v37 = [v13 BOOLValue];
  id v14 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_TVViewingProfiles_FinishedOnboarding"];

  char v36 = [v14 BOOLValue];
  int v15 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_TVViewingProfiles_DismissReminderBanner"];

  char v16 = [v15 BOOLValue];
  id v17 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_NaturalLighting_FinishedOnboarding"];

  char v18 = [v17 BOOLValue];
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  char v19 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"];

  uint64_t v20 = v63;
  if (*((unsigned char *)v63 + 24))
  {
    char v21 = 1;
  }
  else
  {
    char v21 = [v19 BOOLValue];
    uint64_t v20 = v63;
  }
  *((unsigned char *)v20 + 24) = v21;
  uint64_t v22 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_CameraRecording_FinishedOnboarding"];

  char v23 = [v22 BOOLValue];
  uint64_t v24 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_CameraRecording_DismissReminderBanner"];

  char v25 = [v24 BOOLValue];
  int v26 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_AccessoryFirmwareUpdate_FinishedOnboarding"];

  char v27 = [v26 BOOLValue];
  __int16 v28 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_UtilityDiscovery_FinishedOnboarding"];

  char v29 = [v28 BOOLValue];
  if (+[HUHomeFeatureOnboardingUtilities hasUserSaidYesToVoiceIdentificationInResults:v5])
  {
    __int16 v30 = +[HUHomeFeatureOnboardingUtilities _checkIdentifyVoicePrerequisitesForHome:v39];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke;
    v58[3] = &unk_1E63885D8;
    id v60 = a1;
    SEL v61 = a2;
    id v59 = v39;
    id v31 = (id)[v30 flatMap:v58];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_172;
    v57[3] = &unk_1E6388600;
    v57[4] = buf;
    v57[5] = &v62;
    id v32 = (id)[v30 flatMap:v57];
  }
  else
  {
    __int16 v30 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_173;
  v42[3] = &unk_1E6388628;
  id v33 = v39;
  id v46 = a1;
  SEL v47 = a2;
  id v43 = v33;
  v44 = buf;
  uint64_t v45 = &v62;
  char v48 = v36;
  char v49 = v16;
  char v50 = v23;
  char v51 = v25;
  char v52 = v38;
  char v53 = v37;
  char v54 = v18;
  char v55 = v27;
  char v56 = v29;
  uint64_t v34 = [v30 flatMap:v42];

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(buf, 8);

  return v34;
}

id __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    id v60 = v5;
    __int16 v61 = 2112;
    uint64_t v62 = v6;
    __int16 v63 = 1024;
    LODWORD(v64) = [v3 BOOLValue];
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Voice Identification pre-requisites are satisfied? %{BOOL}d ...", buf, 0x1Cu);
  }
  if ([v3 BOOLValue])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F69710]);
    uint64_t v8 = *(void **)(a1 + 32);
    __int16 v9 = [v8 currentUser];
    uint64_t v10 = (void *)[v7 initWithHome:v8 user:v9 nameStyle:0];

    char v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *(void **)(a1 + 40);
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v14 = [v10 user];
      int v15 = [v14 name];
      *(_DWORD *)buf = 138412802;
      id v60 = v12;
      __int16 v61 = 2112;
      uint64_t v62 = v13;
      __int16 v63 = 2112;
      uint64_t v64 = v15;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: ...starting to enable Identify Voice for user %@", buf, 0x20u);
    }
    if ([*(id *)(a1 + 32) isMultiUserEnabled])
    {
      char v16 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
    else
    {
      char v21 = HFLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void **)(a1 + 40);
        char v23 = NSStringFromSelector(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 138412546;
        id v60 = v22;
        __int16 v61 = 2112;
        uint64_t v62 = v23;
        _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@: FAIL-SAFE: THIS SHOULD NOT HAPPEN. Enabling Multi User in HomeKit, because we are turning on Identify Voice", buf, 0x16u);
      }
      uint64_t v24 = [MEMORY[0x1E4F69110] sharedHandler];
      char v25 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 51);
      [v24 handleError:v25 operationType:*MEMORY[0x1E4F687C0] options:0 retryBlock:0 cancelBlock:0];

      int v26 = (void *)MEMORY[0x1E4F7A0D8];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_162;
      v56[3] = &unk_1E6385090;
      id v57 = *(id *)(a1 + 32);
      char v16 = [v26 futureWithErrorOnlyHandlerAdapterBlock:v56];
    }
    char v27 = [v10 setPlaybackInfluencesForYou:1];
    __int16 v28 = [v10 user];
    char v29 = [v10 home];
    __int16 v30 = [v28 userListeningHistoryUpdateControlForHome:v29];
    id v31 = (void *)[v30 mutableCopy];

    id v32 = [v10 home];
    id v33 = [v32 accessories];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2;
    v54[3] = &unk_1E6385EE8;
    id v34 = v31;
    id v55 = v34;
    objc_msgSend(v33, "na_each:", v54);

    uint64_t v35 = HFLogForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      char v36 = [v34 accessories];
      char v37 = [v10 user];
      char v38 = [v10 home];
      *(_DWORD *)buf = 138412802;
      id v60 = v36;
      __int16 v61 = 2112;
      uint64_t v62 = v37;
      __int16 v63 = 2112;
      uint64_t v64 = v38;
      _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "Updating user listening history setting for accessories: %@ | user: %@ | home: %@", buf, 0x20u);
    }
    id v39 = (void *)MEMORY[0x1E4F7A0D8];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_165;
    v51[3] = &unk_1E6385D90;
    id v52 = v10;
    id v53 = v34;
    id v40 = v34;
    id v41 = v10;
    long long v42 = [v39 futureWithBlock:v51];

    id v43 = (void *)MEMORY[0x1E4F7A0D8];
    v58[0] = v16;
    v44 = [v41 setEnableIdentifyVoice:1];
    v58[1] = v44;
    v58[2] = v42;
    uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:3];
    id v46 = [v43 chainFutures:v45];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_169;
    v48[3] = &unk_1E63885B0;
    long long v50 = *(_OWORD *)(a1 + 40);
    id v49 = v3;
    uint64_t v20 = [v46 flatMap:v48];
  }
  else
  {
    id v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = *(void **)(a1 + 40);
      char v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v60 = v18;
      __int16 v61 = 2112;
      uint64_t v62 = v19;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: ...NOT enabling Identify Voice.", buf, 0x16u);
    }
    uint64_t v20 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }

  return v20;
}

uint64_t __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_162(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) enableMultiUserWithCompletionHandler:a2];
}

void __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_supportsUserLevelUpdateListeningHistorySetting")) {
    [*(id *)(a1 + 32) addAccessory:v3];
  }
}

void __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_165(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) user];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) home];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_166;
  v8[3] = &unk_1E6386708;
  id v9 = v3;
  id v7 = v3;
  [v4 updateUserListeningHistoryUpdateControl:v5 forHome:v6 completionHandler:v8];
}

void __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_166(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Failed to update user listening history with error: %@", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    if (v5)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Successfully updated user listening history", (uint8_t *)&v6, 2u);
    }

    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

id __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_169(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__7;
  uint64_t v13 = __Block_byref_object_dispose__7;
  id v14 = objc_alloc_init(MEMORY[0x1E4F4E570]);
  int v4 = (void *)v10[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_170;
  v7[3] = &unk_1E6388538;
  long long v8 = *(_OWORD *)(a1 + 40);
  v7[4] = &v9;
  [v4 homeOnboardingFlowInvoked:1 completion:v7];
  BOOL v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_170(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = HFLogForCategory();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v11 = 138412802;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "%@:%@: ...Error with homeOnboardingFlowInvoked [%@]", (uint8_t *)&v11, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: Successfully invoked AFSettingsConnection homeOnboardingFlowInvoked.", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

id __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_172(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v3 BOOLValue];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v5 + 24) = v6;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = [v4 BOOLValue];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
  uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v9;
}

id __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_173(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F69710]);
  uint64_t v5 = *(void **)(a1 + 32);
  char v6 = [v5 currentUser];
  uint64_t v7 = (void *)[v4 initWithHome:v5 user:v6 nameStyle:0];

  char v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v36 = 138413058;
    uint64_t v37 = v9;
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 1024;
    int v41 = v11;
    __int16 v42 = 1024;
    int v43 = v12;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ VOICE ID: Onboarding dismissed? %{BOOL}d / Banner dismissed? %{BOOL}d", (uint8_t *)&v36, 0x22u);
  }
  __int16 v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 56);
    __int16 v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v16 = *(unsigned __int8 *)(a1 + 72);
    int v17 = *(unsigned __int8 *)(a1 + 73);
    int v36 = 138413058;
    uint64_t v37 = v14;
    __int16 v38 = 2112;
    id v39 = v15;
    __int16 v40 = 1024;
    int v41 = v16;
    __int16 v42 = 1024;
    int v43 = v17;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ TV VIEWING PROFILE: Onboarding dismissed? %{BOOL}d / Banner dismissed? %{BOOL}d", (uint8_t *)&v36, 0x22u);
  }
  char v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v21 = *(unsigned __int8 *)(a1 + 74);
    int v22 = *(unsigned __int8 *)(a1 + 75);
    int v36 = 138413058;
    uint64_t v37 = v19;
    __int16 v38 = 2112;
    id v39 = v20;
    __int16 v40 = 1024;
    int v41 = v21;
    __int16 v42 = 1024;
    int v43 = v22;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ CAMERA RECORDING: Onboarding dismissed? %{BOOL}d / Banner dismissed? %{BOOL}d", (uint8_t *)&v36, 0x22u);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    id v23 = (id)[v7 setDismissIdentifyVoiceReminderBanner:1];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    id v24 = (id)[v7 setDismissIdentifyVoiceOnboarding:1];
  }
  if (*(unsigned char *)(a1 + 76)) {
    id v25 = (id)[v7 setDismissAnnounceOnboarding:1];
  }
  if (*(unsigned char *)(a1 + 77)) {
    id v26 = (id)[v7 setDismissHomeTheaterOnboarding:1];
  }
  if (*(unsigned char *)(a1 + 78)) {
    id v27 = (id)[v7 setDismissNaturalLightingOnboarding:1];
  }
  if (*(unsigned char *)(a1 + 73)) {
    id v28 = (id)[v7 setDismissTVViewingProfilesReminderBanner:1];
  }
  if (*(unsigned char *)(a1 + 72)) {
    id v29 = (id)[v7 setDismissTVViewingProfilesOnboarding:1];
  }
  if (*(unsigned char *)(a1 + 75)) {
    id v30 = (id)[v7 setDismissCameraRecordingReminderBanner:1];
  }
  if (*(unsigned char *)(a1 + 74)) {
    id v31 = (id)[v7 setDismissCameraRecordingOnboarding:1];
  }
  if (*(unsigned char *)(a1 + 79)) {
    id v32 = (id)[v7 setDismissAccessoryFirmwareUpdateOnboarding:1];
  }
  if (*(unsigned char *)(a1 + 80)) {
    id v33 = (id)[v7 setDismissUtilityOnboarding:1];
  }
  id v34 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v34;
}

+ (BOOL)_checkIdentifyVoicePrerequisitesSimpleForHome:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = objc_msgSend(v5, "hf_hasHomePods");
  int v7 = objc_msgSend(v5, "hf_hasRMVCapableAppleTV");
  int v8 = v7;
  if ((v6 & 1) != 0 || v7)
  {
    uint64_t v10 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
    int v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = NSStringFromSelector(a2);
      int v32 = 138413058;
      id v33 = a1;
      __int16 v34 = 2112;
      uint64_t v35 = v12;
      __int16 v36 = 2048;
      uint64_t v37 = [v10 count];
      __int16 v38 = 2112;
      id v39 = v10;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", (uint8_t *)&v32, 0x2Au);
    }
    if (!v10)
    {
      __int16 v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v31 = NSStringFromSelector(a2);
        int v32 = 138412290;
        id v33 = v31;
        _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v32, 0xCu);
      }
      BOOL v9 = 0;
      goto LABEL_30;
    }
    if ((v8 | v6 ^ 1))
    {
      if (+[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:v10 shouldFallbackToBestSupportedLanguage:0])
      {
        BOOL v9 = 1;
LABEL_31:

        goto LABEL_32;
      }
      __int16 v13 = 0;
    }
    else
    {
      __int16 v13 = +[HUHomeFeatureOnboardingUtilities home:v5 createMultiUserLanguageToHomePodsMapping:v10];
      uint64_t v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = NSStringFromSelector(a2);
        uint64_t v16 = [v13 count];
        int v32 = 138413058;
        id v33 = a1;
        __int16 v34 = 2112;
        uint64_t v35 = v15;
        __int16 v36 = 2048;
        uint64_t v37 = v16;
        __int16 v38 = 2112;
        id v39 = v13;
        _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ languageToHomePodsMapping (%lu) %@", (uint8_t *)&v32, 0x2Au);
      }
      int v17 = objc_msgSend(v5, "hf_homePods");
      int v18 = objc_msgSend(v17, "na_any:", &__block_literal_global_176);

      if (v18 && ![v13 count])
      {
        uint64_t v19 = HFLogForCategory();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        id v26 = NSStringFromSelector(a2);
        int v32 = 138412802;
        id v33 = a1;
        __int16 v34 = 2112;
        uint64_t v35 = v26;
        __int16 v36 = 2112;
        uint64_t v37 = (uint64_t)v10;
        id v27 = "%@:%@: No HomePods on supported voice recognition languages (%@)";
        id v28 = v19;
        uint32_t v29 = 32;
        goto LABEL_27;
      }
      if (+[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:v10 shouldFallbackToBestSupportedLanguage:0])
      {
        uint64_t v19 = +[HUHomeFeatureOnboardingUtilities createPersonalIdentityDeviceLanguageMismatchList:v13];
        uint64_t v20 = objc_msgSend(v5, "hf_numberOfHomePods");
        int v21 = HFLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = NSStringFromSelector(a2);
          uint64_t v23 = [v19 count];
          int v32 = 138413314;
          id v33 = a1;
          __int16 v34 = 2112;
          uint64_t v35 = v22;
          __int16 v36 = 2048;
          uint64_t v37 = v23;
          __int16 v38 = 2112;
          id v39 = v19;
          __int16 v40 = 2048;
          uint64_t v41 = v20;
          _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ This is the list of %lu mismatching HomePods %@ out of %lu HomePods", (uint8_t *)&v32, 0x34u);
        }
        if ([v19 count] != v20)
        {
          BOOL v9 = 1;
          goto LABEL_29;
        }
        id v24 = HFLogForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = NSStringFromSelector(a2);
          int v32 = 138412802;
          id v33 = a1;
          __int16 v34 = 2112;
          uint64_t v35 = v25;
          __int16 v36 = 2048;
          uint64_t v37 = v20;
          _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: None of the %lu HomePod(s) in the home match the phone's language", (uint8_t *)&v32, 0x20u);
        }
        goto LABEL_28;
      }
    }
    uint64_t v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = NSStringFromSelector(a2);
      int v32 = 138412546;
      id v33 = a1;
      __int16 v34 = 2112;
      uint64_t v35 = v26;
      id v27 = "%@:%@: This iOS device is NOT on a supported voice recognition language";
      id v28 = v19;
      uint32_t v29 = 22;
LABEL_27:
      _os_log_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v32, v29);
    }
LABEL_28:
    BOOL v9 = 0;
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  BOOL v9 = 0;
LABEL_32:

  return v9;
}

uint64_t __82__HUHomeFeatureOnboardingUtilities__checkIdentifyVoicePrerequisitesSimpleForHome___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsMultiUser];
}

+ (id)_checkIdentifyVoicePrerequisitesForHome:(id)a3
{
  if (+[HUHomeFeatureOnboardingUtilities _checkIdentifyVoicePrerequisitesSimpleForHome:a3])
  {
    +[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:0];
  }
  else
  {
    [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
  id v3 = };

  return v3;
}

+ (BOOL)_userHasSaidYesToShowTVViewingProfilesIn:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", @"HUTVViewingProfilesOnboardingKey_UserInput", (void)v13))
        {
          BOOL v9 = [v3 objectForKey:v8];
          if (![v9 unsignedIntegerValue] || objc_msgSend(v9, "unsignedIntegerValue") == 1)
          {

LABEL_14:
            BOOL v11 = 1;
            goto LABEL_15;
          }
          uint64_t v10 = [v9 unsignedIntegerValue];

          if (v10 == 2) {
            goto LABEL_14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

+ (BOOL)isDeviceUsingASupportedVoiceRecognitionSiriLanguage:(id)a3 shouldFallbackToBestSupportedLanguage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 count])
  {
    int v8 = [MEMORY[0x1E4F4E538] sharedPreferences];
    BOOL v9 = [v8 languageCode];

    if (v9) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = !v4;
    }
    if (!v10)
    {
      BOOL v11 = [MEMORY[0x1E4F4E538] sharedPreferences];
      BOOL v9 = [v11 bestSupportedLanguageCodeForLanguageCode:0];

      int v12 = HFLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v22 = a1;
        __int16 v23 = 2112;
        id v24 = v13;
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@: This iOS device has no Siri language, fallback to best supported language: %@. ", buf, 0x20u);
      }
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __126__HUHomeFeatureOnboardingUtilities_isDeviceUsingASupportedVoiceRecognitionSiriLanguage_shouldFallbackToBestSupportedLanguage___block_invoke;
    v19[3] = &unk_1E63881D0;
    id v14 = v9;
    id v20 = v14;
    int v15 = objc_msgSend(v7, "na_any:", v19);
    long long v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413570;
      id v22 = a1;
      __int16 v23 = 2112;
      id v24 = v17;
      __int16 v25 = 2112;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v14;
      __int16 v29 = 1024;
      int v30 = v15;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: This iOS device is on %@. %@ is a supported voice recognition language?: %{BOOL}d, (%@)", buf, 0x3Au);
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

uint64_t __126__HUHomeFeatureOnboardingUtilities_isDeviceUsingASupportedVoiceRecognitionSiriLanguage_shouldFallbackToBestSupportedLanguage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  return v7;
}

+ (BOOL)hasUserSaidYesToVoiceIdentificationInResults:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v22 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v9 isEqualToString:@"HUVoiceProfileOnboardingKey_UserInput"])
        {
          BOOL v10 = [v3 objectForKey:v9];
          if ([v10 unsignedIntegerValue])
          {
            int v15 = HFLogForCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              id v28 = a1;
              __int16 v29 = 2112;
              int v30 = v16;
              int v17 = "%@:%@: NO: 'no' from Voice Profile Setup";
              goto LABEL_35;
            }
            goto LABEL_36;
          }

          char v6 = 1;
        }
        if ([v9 isEqualToString:@"HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput"])
        {
          BOOL v10 = [v3 objectForKey:v9];
          if ([v10 unsignedIntegerValue])
          {
            int v15 = HFLogForCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              id v28 = a1;
              __int16 v29 = 2112;
              int v30 = v16;
              int v17 = "%@:%@: NO: 'no' from Assistant Device Setup";
              goto LABEL_35;
            }
LABEL_36:

            BOOL v14 = 0;
            BOOL v11 = v3;
            goto LABEL_37;
          }

          BYTE4(v22) = 1;
        }
        if ([v9 isEqualToString:@"HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput"])
        {
          BOOL v10 = [v3 objectForKey:v9];
          if ([v10 unsignedIntegerValue] != 3 && objc_msgSend(v10, "unsignedIntegerValue") != 4)
          {
            int v15 = HFLogForCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              id v28 = a1;
              __int16 v29 = 2112;
              int v30 = v16;
              int v17 = "%@:%@: NO: 'no' from Personal Device Setup";
LABEL_35:
              _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
            }
            goto LABEL_36;
          }

          LOBYTE(v22) = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v22 = 0;
    char v6 = 0;
  }

  BOOL v11 = HFLogForCategory();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6 & 1) != 0 || (v22 & 0x100000000) != 0 || (v22)
  {
    if (v12)
    {
      uint64_t v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v28 = a1;
      __int16 v29 = 2112;
      int v30 = v18;
      __int16 v31 = 2112;
      id v32 = v3;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: YES: 'yes' returned for at least one of the voice identification flows (& 0 'no's) in user input results [%@]", buf, 0x20u);
    }
    BOOL v14 = 1;
  }
  else
  {
    if (v12)
    {
      long long v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v28 = a1;
      __int16 v29 = 2112;
      int v30 = v13;
      __int16 v31 = 2112;
      id v32 = v3;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: NO: 'yes' returned for none of the voice identification flows in user input results [%@]", buf, 0x20u);
    }
    BOOL v14 = 0;
  }
LABEL_37:

  return v14;
}

+ (unint64_t)home:(id)a3 checkForOwnerUpgradeRequirementsFromResults:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([v7 isMultiUserEnabled] & 1) != 0
    || (objc_msgSend(v7, "hf_currentUserIsOwner") & 1) != 0
    || (int v9 = objc_msgSend(v7, "hf_hasHomePods"), v10 = objc_msgSend(v7, "hf_hasAppleTVs"), v11 = v10, (v9 & 1) == 0)
    && !v10)
  {
    unint64_t v12 = 0;
    goto LABEL_6;
  }
  if (v9)
  {
    if (+[HUHomeFeatureOnboardingUtilities _checkIdentifyVoicePrerequisitesSimpleForHome:v7])
    {
      int v9 = +[HUHomeFeatureOnboardingUtilities hasUserSaidYesToVoiceIdentificationInResults:v8];
      BOOL v14 = HFLogForCategory();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (!v15) {
          goto LABEL_22;
        }
        long long v16 = NSStringFromSelector(a2);
        *(_DWORD *)id v20 = 138412546;
        *(void *)&v20[4] = a1;
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = v16;
        int v17 = "%@:%@ Found at least 1 HomePod which will work for Multi User if the owner upgrades";
      }
      else
      {
        if (!v15) {
          goto LABEL_22;
        }
        long long v16 = NSStringFromSelector(a2);
        *(_DWORD *)id v20 = 138412546;
        *(void *)&v20[4] = a1;
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = v16;
        int v17 = "%@:%@ Found at least 1 HomePod which could work for Multi User if the owner upgrades, but user did not tur"
              "n on Identify Voice, so ignoring";
      }
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, v17, v20, 0x16u);

LABEL_22:
      if (!v11) {
        goto LABEL_23;
      }
LABEL_14:
      BOOL v18 = +[HUHomeFeatureOnboardingUtilities _userHasSaidYesToShowTVViewingProfilesIn:](HUHomeFeatureOnboardingUtilities, "_userHasSaidYesToShowTVViewingProfilesIn:", v8, *(_OWORD *)v20, *(void *)&v20[16], v21);
      if (v9 & v18)
      {
        unint64_t v12 = 3;
        goto LABEL_6;
      }
      uint64_t v19 = 2;
      if (!v18) {
        uint64_t v19 = 0;
      }
      goto LABEL_24;
    }
    int v9 = 0;
  }
  if (v11) {
    goto LABEL_14;
  }
LABEL_23:
  uint64_t v19 = 0;
LABEL_24:
  if (v9) {
    unint64_t v12 = 1;
  }
  else {
    unint64_t v12 = v19;
  }
LABEL_6:

  return v12;
}

+ (unint64_t)home:(id)a3 checkForMultiUserDeviceUpgradeRequirements:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v30 = 0;
  __int16 v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  char v33 = objc_msgSend(v7, "hf_hasHomePods");
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  char v29 = objc_msgSend(v7, "hf_hasAppleTVs");
  if (!*((unsigned char *)v31 + 24) && !*((unsigned char *)v27 + 24)) {
    goto LABEL_15;
  }
  int v9 = [v7 accessories];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __84__HUHomeFeatureOnboardingUtilities_home_checkForMultiUserDeviceUpgradeRequirements___block_invoke;
  v25[3] = &unk_1E6388650;
  v25[4] = &v30;
  v25[5] = &v26;
  objc_msgSend(v9, "na_each:", v25);

  int v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = NSStringFromSelector(a2);
    BOOL v12 = *((unsigned char *)v31 + 24) == 0;
    BOOL v13 = *((unsigned char *)v27 + 24) == 0;
    *(_DWORD *)buf = 138413058;
    id v35 = a1;
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    __int16 v38 = 1024;
    BOOL v39 = v12;
    __int16 v40 = 1024;
    BOOL v41 = v13;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Some HomePods already support Multi User features?: %{BOOL}d, Some Apple TVs already support Multi User features?: %{BOOL}d", buf, 0x22u);
  }
  if (!*((unsigned char *)v31 + 24))
  {
    if (*((unsigned char *)v27 + 24))
    {
      int v16 = 0;
LABEL_20:
      id v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v35 = a1;
        __int16 v36 = 2112;
        uint64_t v37 = v21;
        _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Found at least 1 AppleTV which needs upgrade for Multi User", buf, 0x16u);
      }
      BOOL v22 = +[HUHomeFeatureOnboardingUtilities _userHasSaidYesToShowTVViewingProfilesIn:v8];
      if (v16 & v22)
      {
        unint64_t v18 = 3;
        goto LABEL_31;
      }
      uint64_t v23 = 2;
      if (!v22) {
        uint64_t v23 = 0;
      }
      goto LABEL_28;
    }
LABEL_15:
    unint64_t v18 = 0;
    goto LABEL_31;
  }
  if (!+[HUHomeFeatureOnboardingUtilities _checkIdentifyVoicePrerequisitesSimpleForHome:v7])
  {
    BOOL v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v35 = a1;
      __int16 v36 = 2112;
      uint64_t v37 = v17;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Found at least 1 HomePod which could need upgrade for Multi User, but prequisistes aren't satisfied, so ignoring", buf, 0x16u);
    }
    goto LABEL_18;
  }
  if (!+[HUHomeFeatureOnboardingUtilities hasUserSaidYesToVoiceIdentificationInResults:v8])
  {
    BOOL v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v35 = a1;
      __int16 v36 = 2112;
      uint64_t v37 = v19;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Found at least 1 HomePod which could need upgrade for Multi User, but user did not turn on Identify Voice, so ignoring", buf, 0x16u);
    }
LABEL_18:
    int v16 = 0;
    goto LABEL_19;
  }
  BOOL v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v35 = a1;
    __int16 v36 = 2112;
    uint64_t v37 = v15;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Found at least 1 HomePod which needs upgrade for Multi User", buf, 0x16u);
  }
  int v16 = 1;
LABEL_19:

  if (*((unsigned char *)v27 + 24)) {
    goto LABEL_20;
  }
  uint64_t v23 = 0;
LABEL_28:
  if (v16) {
    unint64_t v18 = 1;
  }
  else {
    unint64_t v18 = v23;
  }
LABEL_31:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

void __84__HUHomeFeatureOnboardingUtilities_home_checkForMultiUserDeviceUpgradeRequirements___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isHomePod") && objc_msgSend(v3, "supportsMultiUser")) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  if (objc_msgSend(v3, "hf_isAppleTV") && objc_msgSend(v3, "supportsMultiUser")) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

+ (id)groupedFeaturesForOnboardingFlowKeyPaths:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v9 = *MEMORY[0x1E4F684B8];
    uint64_t v10 = *MEMORY[0x1E4F68490];
    uint64_t v29 = *MEMORY[0x1E4F684B0];
    uint64_t v28 = *MEMORY[0x1E4F684D8];
    uint64_t v26 = *MEMORY[0x1E4F68498];
    uint64_t v27 = *MEMORY[0x1E4F684D0];
    uint64_t v24 = *MEMORY[0x1E4F684E8];
    uint64_t v25 = *MEMORY[0x1E4F684C8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        char v13 = objc_msgSend(v12, "isEqualToString:", v9, v24);
        BOOL v14 = &unk_1F19B57F8;
        if (v13) {
          goto LABEL_15;
        }
        char v15 = [v12 isEqualToString:v10];
        BOOL v14 = &unk_1F19B5810;
        if (v15) {
          goto LABEL_15;
        }
        char v16 = [v12 isEqualToString:v29];
        BOOL v14 = &unk_1F19B5828;
        if (v16) {
          goto LABEL_15;
        }
        char v17 = [v12 isEqualToString:v28];
        BOOL v14 = &unk_1F19B5840;
        if (v17) {
          goto LABEL_15;
        }
        char v18 = [v12 isEqualToString:v27];
        BOOL v14 = &unk_1F19B5858;
        if ((v18 & 1) == 0)
        {
          char v19 = [v12 isEqualToString:v26];
          BOOL v14 = &unk_1F19B5870;
          if ((v19 & 1) == 0)
          {
            char v20 = [v12 isEqualToString:v25];
            BOOL v14 = &unk_1F19B5888;
            if ((v20 & 1) == 0)
            {
              if (![v12 isEqualToString:v24]) {
                continue;
              }
              int v21 = _os_feature_enabled_impl();
              BOOL v14 = &unk_1F19B58A0;
              if (!v21) {
                continue;
              }
            }
          }
        }
LABEL_15:
        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  BOOL v22 = (void *)[v4 copy];

  return v22;
}

+ (id)analyzeHomeAssistantDevicesForSupportedVoiceRecognitionLanguages:(id)a3 home:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  __int16 v38 = objc_msgSend(v5, "hf_allHomePodProfileContainers");
  objc_msgSend(v7, "na_safeAddObjectsFromArray:");
  uint64_t v8 = objc_msgSend(v5, "hf_allSiriEndPointProfileContainers");
  objc_msgSend(v7, "na_safeAddObjectsFromArray:", v8);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v35 = v8;
    id v36 = v5;
    uint64_t v37 = v6;
    BOOL v39 = 0;
    __int16 v40 = 0;
    uint64_t v12 = *(void *)v45;
    unint64_t v13 = 0x1E4F2E000uLL;
    unint64_t v14 = 0x1E4F69000uLL;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        char v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        objc_opt_class();
        id v17 = v16;
        if (objc_opt_isKindOfClass()) {
          char v18 = v17;
        }
        else {
          char v18 = 0;
        }
        id v19 = v18;

        char v20 = [*(id *)(v14 + 680) siriLanguageOptionFor:v17];
        int v21 = HFLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          id v43 = v19;
          uint64_t v22 = v11;
          uint64_t v23 = v12;
          unint64_t v24 = v14;
          unint64_t v25 = v13;
          uint64_t v27 = v26 = v9;
          *(_DWORD *)buf = 138412802;
          id v49 = v27;
          __int16 v50 = 2112;
          id v51 = v17;
          __int16 v52 = 2112;
          uint64_t v53 = (uint64_t)v20;
          _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%@ Fetched selectedLanguageOption language option for mediaProfile [%@] = %@", buf, 0x20u);

          id v9 = v26;
          unint64_t v13 = v25;
          unint64_t v14 = v24;
          uint64_t v12 = v23;
          uint64_t v11 = v22;
          id v19 = v43;
        }

        if (v20)
        {
          uint64_t v28 = [v20 recognitionLanguage];
          if ([v42 containsObject:v28])
          {
            uint64_t v29 = v39;
            if (!v39)
            {
              uint64_t v29 = objc_opt_new();
              BOOL v39 = v29;
            }
          }
          else
          {
            uint64_t v29 = v40;
            if (!v40)
            {
              uint64_t v29 = objc_opt_new();
              __int16 v40 = v29;
            }
          }
          objc_msgSend(v29, "addObject:", v19, v35, v36);
        }
        else
        {
          uint64_t v28 = HFLogForCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            long long v30 = NSStringFromSelector(a2);
            uint64_t v31 = [v38 count];
            *(_DWORD *)buf = 138412802;
            id v49 = v30;
            __int16 v50 = 2112;
            id v51 = v19;
            __int16 v52 = 2048;
            uint64_t v53 = v31;
            _os_log_error_impl(&dword_1BE345000, v28, OS_LOG_TYPE_ERROR, "%@ Recognition Language unavailable for device with MediaProfile [%@] (1 of %lu HomePods)", buf, 0x20u);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v11);

    uint64_t v6 = v37;
    if (v40) {
      [v37 setObject:v40 forKey:@"languageMismatch"];
    }
    uint64_t v8 = v35;
    id v5 = v36;
    long long v32 = v39;
    if (v39) {
      [v37 setObject:v39 forKey:@"supportingLanguages"];
    }
    long long v33 = v40;
  }
  else
  {

    long long v32 = 0;
    long long v33 = 0;
  }

  return v6;
}

+ (id)home:(id)a3 createMultiUserLanguageToHomePodsMapping:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v32 = a4;
  uint64_t v6 = objc_opt_new();
  uint64_t v27 = objc_msgSend(v5, "hf_allHomePodProfileContainers");
  objc_msgSend(v6, "na_safeAddObjectsFromArray:");
  id v26 = objc_msgSend(v5, "hf_allSiriEndPointProfileContainers");
  objc_msgSend(v6, "na_safeAddObjectsFromArray:");
  uint64_t v7 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    uint64_t v29 = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        id v13 = v12;
        if (objc_opt_isKindOfClass()) {
          unint64_t v14 = v13;
        }
        else {
          unint64_t v14 = 0;
        }
        id v15 = v14;

        char v16 = [MEMORY[0x1E4F692A8] siriLanguageOptionFor:v13];
        id v17 = v16;
        if (v16)
        {
          char v18 = [v16 recognitionLanguage];
          id v19 = HFLogForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            char v20 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413058;
            id v38 = a1;
            __int16 v39 = 2112;
            id v40 = v20;
            __int16 v41 = 2112;
            id v42 = v15;
            __int16 v43 = 2112;
            long long v44 = v18;
            _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@ Found HomePod %@ with language %@", buf, 0x2Au);

            uint64_t v7 = v29;
          }

          if ([v32 containsObject:v18])
          {
            int v21 = [v7 objectForKey:v18];
            if (!v21)
            {
              int v21 = [MEMORY[0x1E4F1CA48] array];
            }
            [v21 addObject:v15];
            [v7 setObject:v21 forKey:v18];
          }
          else
          {
            int v21 = HFLogForCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = NSStringFromSelector(a2);
              uint64_t v23 = [v17 recognitionLanguage];
              *(_DWORD *)buf = 138412802;
              id v38 = v22;
              __int16 v39 = 2112;
              id v40 = v15;
              __int16 v41 = 2112;
              id v42 = v23;
              _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%@ MultiUser Language Check: HomePod [%@] in unsupported language: %@", buf, 0x20u);

              uint64_t v7 = v29;
            }
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v9);
  }

  unint64_t v24 = (void *)[v7 copy];

  return v24;
}

+ (id)createPersonalIdentityDeviceLanguageMismatchList:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F4E538] sharedPreferences];
  uint64_t v6 = [v5 languageCode];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", v6, (void)v15) & 1) == 0) {
          [v4 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = (void *)[v4 copy];

  return v13;
}

+ (id)processLanguageAndMediaProfileInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v17);
        uint64_t v12 = [MEMORY[0x1E4F4E4C8] sharedInstance];
        id v13 = [v12 localizedNameForSiriLanguage:v10 inDisplayLanguage:0];

        v21[0] = @"languageCodeKey";
        v21[1] = @"localizedLanguageNameKey";
        v22[0] = v10;
        v22[1] = v13;
        void v21[2] = @"mediaProfilesKey";
        v22[2] = v11;
        unint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  long long v15 = (void *)[v4 copy];

  return v15;
}

+ (id)checkVoiceProfileAvailabiltyForLanguage:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F4E538] sharedPreferences];
    id v7 = [v8 languageCode];
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F7A0D8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HUHomeFeatureOnboardingUtilities_checkVoiceProfileAvailabiltyForLanguage___block_invoke;
  v15[3] = &unk_1E63886A0;
  id v17 = a1;
  SEL v18 = a2;
  id v16 = v7;
  id v10 = v7;
  uint64_t v11 = [v9 futureWithBlock:v15];
  uint64_t v12 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  id v13 = [v11 reschedule:v12];

  return v13;
}

void __76__HUHomeFeatureOnboardingUtilities_checkVoiceProfileAvailabiltyForLanguage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    SEL v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Starting to check for Hey Siri Voice Profile in iCloud for %@", buf, 0x20u);
  }
  uint64_t v8 = [MEMORY[0x1E4FA5720] sharedInstance];
  uint64_t v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HUHomeFeatureOnboardingUtilities_checkVoiceProfileAvailabiltyForLanguage___block_invoke_212;
  v11[3] = &unk_1E6388678;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v12 = v9;
  id v13 = v3;
  id v10 = v3;
  [v8 isVoiceProfileUploadedToiCloudForLanguageCode:v12 withCompletionBlock:v11];
}

void __76__HUHomeFeatureOnboardingUtilities_checkVoiceProfileAvailabiltyForLanguage___block_invoke_212(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v9 = *(void *)(a1 + 32);
    int v12 = 138413314;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    long long v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 1024;
    int v19 = a3;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Hey Siri Voice Profile for %@ available in iCloud?: %{BOOL}d | error = %@", (uint8_t *)&v12, 0x30u);
  }
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [NSNumber numberWithBool:a3];
  [v10 finishWithResult:v11 error:v5];
}

+ (BOOL)isVoiceProfileAvailableOnThisDeviceForLanguage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F4E538] sharedPreferences];
    id v7 = [v8 languageCode];
  }
  uint64_t v9 = [MEMORY[0x1E4FA5720] sharedInstance];
  int v10 = [v9 isSATEnrolledForSiriProfileId:0 forLanguageCode:v7];

  uint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = NSStringFromSelector(a2);
    int v14 = 138413058;
    id v15 = a1;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 1024;
    int v21 = v10;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Hey Siri Voice Profile exists on this device for language: %@ ? Answer: %{BOOL}d", (uint8_t *)&v14, 0x26u);
  }
  return v10;
}

@end