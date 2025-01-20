@interface HUMediaAccountUtilities
+ (BOOL)isMusicAppInstalled;
+ (id)defaultCurrentVolumeForMediaProfiles:(id)a3;
+ (id)determineMediaPickerAvailabilityForHomePodProfiles:(id)a3 inHome:(id)a4;
+ (id)isAppleMusicSubscriptionAvailable;
+ (id)musicAppURL;
+ (id)reasonForMediaPickerNotAvailable:(int64_t)a3;
@end

@implementation HUMediaAccountUtilities

+ (BOOL)isMusicAppInstalled
{
  return MEMORY[0x1F4177C58](0, a2);
}

+ (id)isAppleMusicSubscriptionAvailable
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithBlock:&__block_literal_global_10];
}

void __60__HUMediaAccountUtilities_isAppleMusicSubscriptionAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F3C2A8]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__HUMediaAccountUtilities_isAppleMusicSubscriptionAvailable__block_invoke_2;
  v5[3] = &unk_1E63857B8;
  id v6 = v2;
  id v4 = v2;
  [v3 requestCapabilitiesWithCompletionHandler:v5];
}

void __60__HUMediaAccountUtilities_isAppleMusicSubscriptionAvailable__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v9 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v9)
  {
    [v5 setObject:&unk_1F19B3A40 forKeyedSubscript:@"HOMediaPickerUnavailableReasonKey"];
    id v6 = @"HUMediaPickerUnavailableReasonStoreKitErrorObjectKey";
    v7 = v5;
    v8 = v9;
  }
  else
  {
    if (a2) {
      goto LABEL_6;
    }
    v8 = &unk_1F19B3A58;
    id v6 = @"HOMediaPickerUnavailableReasonKey";
    v7 = v5;
  }
  [v7 setObject:v8 forKeyedSubscript:v6];
LABEL_6:
  [*(id *)(a1 + 32) finishWithResult:v5];
}

+ (id)reasonForMediaPickerNotAvailable:(int64_t)a3
{
  id v3 = @"HUTriggerMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage";
  if (a3 != 1) {
    id v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"HUTriggerMediaPickerUnavailableMusicAppUninstalledPromptMessage";
  }
}

+ (id)musicAppURL
{
  id v2 = ICBundleIdentifierForSystemApplicationType();
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_appStoreURLForBundleIdentifier:", v2);

  return v3;
}

+ (id)defaultCurrentVolumeForMediaProfiles:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = (float *)&v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HUMediaAccountUtilities_defaultCurrentVolumeForMediaProfiles___block_invoke;
  v8[3] = &unk_1E63857E0;
  v8[4] = &v9;
  objc_msgSend(v3, "na_each:", v8);
  id v4 = v10;
  float v5 = v10[6];
  if (fabsf(v5) < 0.00000011921)
  {
    v10[6] = 0.5;
    float v5 = 0.5;
  }
  v4[6] = fminf(fmaxf(v5 * 100.0, 0.0), 100.0);
  id v6 = objc_msgSend(NSNumber, "numberWithFloat:");
  _Block_object_dispose(&v9, 8);

  return v6;
}

float __64__HUMediaAccountUtilities_defaultCurrentVolumeForMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaSession];
  id v4 = [v3 audioControl];
  [v4 volume];
  float v6 = v5;

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  float result = fmaxf(*(float *)(v7 + 24), v6);
  *(float *)(v7 + 24) = result;
  return result;
}

+ (id)determineMediaPickerAvailabilityForHomePodProfiles:(id)a3 inHome:(id)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7 && (uint64_t v9 = [v7 count], v8) && v9)
  {
    v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "+[HUMediaAccountUtilities determineMediaPickerAvailabilityForHomePodProfiles:inHome:]";
      __int16 v43 = 2112;
      id v44 = v7;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%s HomePodMediaProfiles %@ Home %@", buf, 0x20u);
    }

    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    int v12 = _HULocalizedStringWithDefaultValue(@"HUMediaSelectionPickerButton", @"HUMediaSelectionPickerButton", 1);
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    if (+[HUMediaAccountUtilities isMusicAppInstalled])
    {
      v13 = +[HUMediaAccountUtilities isAppleMusicSubscriptionAvailable];
      v14 = (void *)MEMORY[0x1E4F7A0D8];
      v39 = @"HOMediaSelectionPickingForExternalPlayerKey";
      v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v40 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      v17 = [v14 futureWithResult:v16];

      v18 = HFLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v42 = (const char *)a1;
        __int16 v43 = 2112;
        id v44 = v19;
        __int16 v45 = 2112;
        id v46 = v7;
        _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ homePodMediaProfiles [%@]", buf, 0x20u);
      }
      v20 = (void *)MEMORY[0x1E4F7A0D8];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke;
      v33[3] = &unk_1E6385878;
      id v34 = v7;
      id v36 = a1;
      SEL v37 = a2;
      id v35 = v8;
      v21 = [v20 futureWithBlock:v33];
      v22 = (void *)MEMORY[0x1E4F7A0D8];
      v38[0] = v13;
      v38[1] = v17;
      v38[2] = v21;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
      v24 = [v22 combineAllFutures:v23];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_5;
      v30[3] = &unk_1E63858A0;
      id v11 = v11;
      id v31 = v11;
      SEL v32 = a2;
      v25 = [v24 flatMap:v30];
    }
    else
    {
      [v11 setObject:&unk_1F19B3A70 forKeyedSubscript:@"HOMediaPickerUnavailableReasonKey"];
      v25 = [MEMORY[0x1E4F7A0D8] futureWithResult:v11];
    }
  }
  else
  {
    v26 = HFLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "+[HUMediaAccountUtilities determineMediaPickerAvailabilityForHomePodProfiles:inHome:]";
      _os_log_error_impl(&dword_1BE345000, v26, OS_LOG_TYPE_ERROR, "%s Either the parameter mediaprofile or Home is nil", buf, 0xCu);
    }

    v27 = (void *)MEMORY[0x1E4F7A0D8];
    v47 = @"Error";
    objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 33);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v48[0] = v11;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    v25 = [v27 futureWithResult:v28];
  }

  return v25;
}

void __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke(uint64_t a1, void *a2)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v5 = objc_msgSend(v4, "ams_activeiTunesAccount");

  id v36 = (void *)v5;
  if (v5 && [*(id *)(a1 + 32) count])
  {
    v33 = v3;
    float v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v51 = v7;
      __int16 v52 = 2112;
      v53 = v8;
      __int16 v54 = 2112;
      v55 = v36;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ iTunes Account [%@]", buf, 0x20u);
    }
    int v9 = [*(id *)(a1 + 40) isMultiUserEnabled];
    v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      int v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v51 = v11;
      __int16 v52 = 2112;
      v53 = v12;
      __int16 v54 = 1024;
      LODWORD(v55) = v9;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ isMultiUserEnabled [%d]", buf, 0x1Cu);
    }
    if (v9)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F69710]);
      v14 = *(void **)(a1 + 40);
      v15 = [v14 currentUser];
      v16 = (void *)[v13 initWithHome:v14 user:v15 nameStyle:0];
      int v35 = [v16 isIdentifyVoiceEnabled];
    }
    else
    {
      int v35 = 0;
    }
    v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 48);
      v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
      v21 = objc_msgSend(*(id *)(a1 + 40), "hf_displayName");
      v22 = [*(id *)(a1 + 40) currentUser];
      v23 = [v22 name];
      *(_DWORD *)buf = 138413314;
      uint64_t v51 = v19;
      __int16 v52 = 2112;
      v53 = v20;
      __int16 v54 = 2112;
      v55 = v21;
      __int16 v56 = 2112;
      v57 = v23;
      __int16 v58 = 1024;
      int v59 = v35;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ home [%@] currentUser [%@] vrEnabled [%d]", buf, 0x30u);
    }
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          v29 = (void *)MEMORY[0x1E4F7A0D8];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_44;
          v39[3] = &unk_1E6385830;
          char v43 = v9;
          char v44 = v35;
          id v40 = *(id *)(a1 + 40);
          id v41 = v36;
          uint64_t v42 = v28;
          v30 = [v29 futureWithBlock:v39];
          [v17 addObject:v30];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v25);
    }

    id v31 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v17];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_3;
    v37[3] = &unk_1E63851B0;
    id v3 = v33;
    id v38 = v33;
    id v32 = (id)[v31 addCompletionBlock:v37];
  }
  else
  {
    v60 = @"HOMediaSelectionShowLibraryContentKey";
    v61[0] = MEMORY[0x1E4F1CC28];
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    [v3 finishWithResult:v17];
  }
}

void __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(a1 + 57))
  {
    id v4 = [MEMORY[0x1E4F68F00] sharedInstance];
    uint64_t v5 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_2;
    v10[3] = &unk_1E6385808;
    id v11 = v3;
    id v12 = *(id *)(a1 + 40);
    [v4 getHomeMediaAccountForHome:v5 withCompletion:v10];
  }
  else
  {
    float v6 = NSNumber;
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = objc_msgSend(*(id *)(a1 + 48), "hf_appleMusicCurrentLoggedInAccount");
    int v9 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "hasSameAppleMusicServiceAltDSID:", v8));
    [v3 finishWithResult:v9];
  }
}

void __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "hasSameAppleMusicServiceAltDSID:", a2));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 finishWithResult:v3];
}

void __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_3(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a2, "na_all:", &__block_literal_global_49);
  id v4 = *(void **)(a1 + 32);
  uint64_t v7 = @"HOMediaSelectionShowLibraryContentKey";
  uint64_t v5 = [NSNumber numberWithBool:v3];
  v8[0] = v5;
  float v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 finishWithResult:v6];
}

uint64_t __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

id __85__HUMediaAccountUtilities_determineMediaPickerAvailabilityForHomePodProfiles_inHome___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        id v9 = v8;
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
        id v11 = v10;

        if (v11) {
          [*(id *)(a1 + 32) addEntriesFromDictionary:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v22 = v13;
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@ mediaPicker result [%@]", buf, 0x16u);
  }
  v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];

  return v15;
}

@end