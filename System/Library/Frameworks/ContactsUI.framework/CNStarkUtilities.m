@interface CNStarkUtilities
+ (BOOL)siriLanguageMatchesSystemLanguage;
+ (BOOL)vehicleHasBuiltInMic;
@end

@implementation CNStarkUtilities

+ (BOOL)siriLanguageMatchesSystemLanguage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F1C438]];
  v4 = [(objc_class *)getAFPreferencesClass() sharedPreferences];
  v5 = [v4 languageCode];

  v6 = CNUILogStarkUtilities();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v2 languageIdentifier];
    int v12 = 138412546;
    v13 = v5;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_INFO, "#CNStarkUtilities Siri Language Code: %@ System Languages Code: %@", (uint8_t *)&v12, 0x16u);
  }
  v8 = [v5 componentsSeparatedByString:@"-"];
  v9 = [v8 objectAtIndexedSubscript:0];
  char v10 = [v3 isEqualToString:v9];

  return v10;
}

+ (BOOL)vehicleHasBuiltInMic
{
  v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  v3 = [v2 attributeForKey:*MEMORY[0x1E4F74B28]];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

@end