@interface HMDFetchedSettingsUtilities
+ (id)_outputGenderStringFromAFVoiceGender:(int64_t)a3;
+ (id)languageValueFromHPLanguageValue:(id)a3;
+ (id)transformHPLanguageItemsToLanguageListValue:(id)a3;
+ (int64_t)_outputGenderFromString:(id)a3;
@end

@implementation HMDFetchedSettingsUtilities

+ (id)transformHPLanguageItemsToLanguageListValue:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_138126);
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Empty language item list", (uint8_t *)&v12, 0xCu);
    }
    v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

id __75__HMDFetchedSettingsUtilities_transformHPLanguageItemsToLanguageListValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDFetchedSettingsUtilities languageValueFromHPLanguageValue:a2];
}

+ (id)languageValueFromHPLanguageValue:(id)a3
{
  v3 = (void *)MEMORY[0x263F0E348];
  id v4 = (objc_class *)MEMORY[0x263F0E740];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 recognitionLanguage];
  id v8 = [v5 outputLanguage];
  v9 = +[HMDFetchedSettingsUtilities _outputGenderStringFromAFVoiceGender:](HMDFetchedSettingsUtilities, "_outputGenderStringFromAFVoiceGender:", [v5 gender]);
  v10 = [v5 voiceName];

  v11 = (void *)[v6 initWithInputLanguageCode:v7 outputVoiceLanguageCode:v8 outputVoiceGenderCode:v9 voiceName:v10];
  int v12 = [v3 cachedInstanceForLanguageSettingValue:v11];

  return v12;
}

+ (id)_outputGenderStringFromAFVoiceGender:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 1) < 3) {
    return off_264A21178[a3 - 1];
  }
  id v5 = (void *)MEMORY[0x230FBD990](a1, a2);
  id v6 = a1;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Unknown Voice Gender Value", (uint8_t *)&v9, 0xCu);
  }
  return @"?";
}

+ (int64_t)_outputGenderFromString:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToString:@"m"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"f"])
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"n"])
  {
    int64_t v5 = 3;
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      int v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unknown gender option %@", (uint8_t *)&v11, 0x16u);
    }
    int64_t v5 = 0;
  }

  return v5;
}

@end