@interface NSUserDefaults(MobileSafariExtras)
+ (id)safari_sfAppDefaults;
- (uint64_t)pm_passwordManagerIsInDemoMode;
- (uint64_t)safari_isJavaScriptEnabled;
- (uint64_t)safari_javaScriptCanOpenWindowsAutomatically;
- (uint64_t)safari_setShouldAutomaticallyDownloadReadingListItems:()MobileSafariExtras;
- (uint64_t)safari_shouldAutomaticallyDownloadReadingListItems;
- (uint64_t)safari_warnAboutFraudulentWebsites;
- (void)safari_registerMobileSafariDefaults;
@end

@implementation NSUserDefaults(MobileSafariExtras)

- (void)safari_registerMobileSafariDefaults
{
  v54[43] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  uint64_t v4 = *MEMORY[0x1E4F78890];
  v53[0] = *MEMORY[0x1E4F99188];
  v53[1] = v4;
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  v54[0] = MEMORY[0x1E4F1CC38];
  v54[1] = MEMORY[0x1E4F1CC28];
  uint64_t v6 = *MEMORY[0x1E4F788C8];
  v53[2] = *MEMORY[0x1E4F788A0];
  v53[3] = v6;
  v54[2] = MEMORY[0x1E4F1CC38];
  v54[3] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = *MEMORY[0x1E4F788E0];
  v53[4] = *MEMORY[0x1E4F788D8];
  v53[5] = v7;
  v54[4] = MEMORY[0x1E4F1CC38];
  v54[5] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = *MEMORY[0x1E4F78900];
  v53[6] = *MEMORY[0x1E4F788F8];
  v53[7] = v8;
  v54[6] = MEMORY[0x1E4F1CC28];
  v54[7] = &unk_1EFBDFB98;
  uint64_t v9 = *MEMORY[0x1E4F78910];
  v53[8] = *MEMORY[0x1E4F78908];
  v53[9] = v9;
  v54[8] = MEMORY[0x1E4F1CC38];
  v54[9] = MEMORY[0x1E4F1CC28];
  uint64_t v10 = *MEMORY[0x1E4F78920];
  v54[10] = MEMORY[0x1E4F1CC28];
  uint64_t v11 = *MEMORY[0x1E4F78928];
  v53[10] = v10;
  v53[11] = v11;
  v12 = [NSNumber numberWithInt:_SFDeviceIsPad() ^ 1];
  uint64_t v13 = *MEMORY[0x1E4F78930];
  v54[11] = v12;
  v54[12] = v3;
  uint64_t v14 = *MEMORY[0x1E4F78940];
  v53[12] = v13;
  v53[13] = v14;
  uint64_t v15 = *MEMORY[0x1E4F78950];
  v54[13] = v3;
  v54[14] = v3;
  uint64_t v16 = *MEMORY[0x1E4F78958];
  v53[14] = v15;
  v53[15] = v16;
  uint64_t v17 = *MEMORY[0x1E4F78970];
  v54[15] = v5;
  v54[16] = v3;
  uint64_t v18 = *MEMORY[0x1E4F78978];
  v53[16] = v17;
  v53[17] = v18;
  v54[17] = v5;
  v53[18] = *MEMORY[0x1E4F78980];
  v19 = [NSNumber numberWithBool:_SFDeviceIsPad()];
  uint64_t v20 = *MEMORY[0x1E4F789D0];
  v54[18] = v19;
  v54[19] = v5;
  uint64_t v21 = *MEMORY[0x1E4F789D8];
  v53[19] = v20;
  v53[20] = v21;
  uint64_t v22 = *MEMORY[0x1E4F789E0];
  v54[20] = v5;
  v54[21] = v3;
  uint64_t v23 = *MEMORY[0x1E4F789F0];
  v53[21] = v22;
  v53[22] = v23;
  uint64_t v24 = *MEMORY[0x1E4F789F8];
  v54[22] = v3;
  v54[23] = v3;
  uint64_t v25 = *MEMORY[0x1E4F78898];
  v53[23] = v24;
  v53[24] = v25;
  uint64_t v26 = *MEMORY[0x1E4F99528];
  v54[24] = v3;
  v54[25] = v3;
  uint64_t v27 = *MEMORY[0x1E4F78748];
  v53[25] = v26;
  v53[26] = v27;
  uint64_t v28 = *MEMORY[0x1E4F786D8];
  v54[26] = &unk_1EFBDE9B0;
  v54[27] = v3;
  uint64_t v29 = *MEMORY[0x1E4F786E0];
  v53[27] = v28;
  v53[28] = v29;
  uint64_t v30 = *MEMORY[0x1E4F78858];
  v54[28] = v3;
  v54[29] = v3;
  uint64_t v31 = *MEMORY[0x1E4F786E8];
  v53[29] = v30;
  v53[30] = v31;
  uint64_t v32 = *MEMORY[0x1E4F785E8];
  v54[30] = v3;
  v54[31] = &unk_1EFBDE9C8;
  uint64_t v33 = *MEMORY[0x1E4F786B0];
  v53[31] = v32;
  v53[32] = v33;
  uint64_t v34 = *MEMORY[0x1E4F786F0];
  v54[32] = v3;
  v54[33] = v3;
  uint64_t v35 = *MEMORY[0x1E4F786F8];
  v53[33] = v34;
  v53[34] = v35;
  uint64_t v52 = *MEMORY[0x1E4F78640];
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  uint64_t v37 = *MEMORY[0x1E4F78860];
  v54[34] = v36;
  v54[35] = v5;
  v53[35] = v37;
  v53[36] = @"DebugStreamlinedCompletionList";
  uint64_t v38 = *MEMORY[0x1E4F78720];
  v53[37] = @"DebugLabelPreviousSearchesInCompletionList";
  v53[38] = v38;
  uint64_t v39 = *MEMORY[0x1E4F787D0];
  v54[38] = &unk_1EFBDE9E0;
  v54[39] = &unk_1EFBDE9F8;
  uint64_t v40 = *MEMORY[0x1E4F78728];
  v53[39] = v39;
  v53[40] = v40;
  v54[36] = v3;
  v54[37] = v3;
  uint64_t v41 = *MEMORY[0x1E4F787D8];
  v54[40] = &unk_1EFBDE9E0;
  v54[41] = &unk_1EFBDE9E0;
  uint64_t v42 = *MEMORY[0x1E4F99030];
  v53[41] = v41;
  v53[42] = v42;
  v54[42] = v3;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:43];
  v44 = [v2 dictionaryWithDictionary:v43];

  v45 = WBSTabOrderManagerDefaultPreferenceValues();
  [v44 addEntriesFromDictionary:v45];

  v46 = defaultTranslationPreferenceValues();
  [v44 addEntriesFromDictionary:v46];

  v47 = SFDefaultWebExtensionsPreferenceValues();
  [v44 addEntriesFromDictionary:v47];

  uint64_t v48 = *MEMORY[0x1E4F78750];
  v49 = [a1 objectForKey:*MEMORY[0x1E4F78750]];

  if (v49)
  {
    v50 = [a1 objectForKey:v32];

    if (!v50)
    {
      if ([a1 BOOLForKey:v48]) {
        uint64_t v51 = 0;
      }
      else {
        uint64_t v51 = 2;
      }
      [a1 setInteger:v51 forKey:v32];
    }
    [a1 removeObjectForKey:v48];
  }
  [a1 registerDefaults:v44];
}

- (uint64_t)safari_isJavaScriptEnabled
{
  uint64_t v2 = *MEMORY[0x1E4F78940];
  if (restrictedValueForKey((void *)*MEMORY[0x1E4F78940]) == 2) {
    return 0;
  }

  return [a1 BOOLForKey:v2];
}

- (uint64_t)safari_javaScriptCanOpenWindowsAutomatically
{
  uint64_t v2 = *MEMORY[0x1E4F78938];
  if (restrictedValueForKey((void *)*MEMORY[0x1E4F78938]) == 2) {
    return 0;
  }

  return [a1 BOOLForKey:v2];
}

- (uint64_t)safari_warnAboutFraudulentWebsites
{
  uint64_t v2 = *MEMORY[0x1E4F789E0];
  uint64_t result = restrictedValueForKey((void *)*MEMORY[0x1E4F789E0]);
  if (result == 2) {
    return 0;
  }
  if (result != 1)
  {
    return [a1 BOOLForKey:v2];
  }
  return result;
}

+ (id)safari_sfAppDefaults
{
  if (safari_sfAppDefaults_onceToken != -1) {
    dispatch_once(&safari_sfAppDefaults_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)safari_sfAppDefaults_sfAppDefaults;

  return v0;
}

- (uint64_t)safari_shouldAutomaticallyDownloadReadingListItems
{
  if ([a1 BOOLForKey:*MEMORY[0x1E4F788A8]]) {
    return 1;
  }
  uint64_t v3 = *MEMORY[0x1E4F789B0];

  return [a1 BOOLForKey:v3];
}

- (uint64_t)safari_setShouldAutomaticallyDownloadReadingListItems:()MobileSafariExtras
{
  return [a1 setBool:a3 forKey:*MEMORY[0x1E4F788A8]];
}

- (uint64_t)pm_passwordManagerIsInDemoMode
{
  return [a1 BOOLForKey:*MEMORY[0x1E4F99190]];
}

@end