@interface LNFeatureFlags
+ (BOOL)isActionTranscriptEnabled;
+ (BOOL)isAppMetadataViaXPCEnabled;
+ (BOOL)isAppShortcutsOmittingAppNameEnabled;
+ (BOOL)isConditionallyEnabledIntentsEnabled;
+ (BOOL)isLowPowerDeviceEnabled;
+ (BOOL)isPersonaOpenApplicationOptionEnabled;
+ (BOOL)isProductionAppEventEnabled;
+ (BOOL)isRuntimeMetadataSupported;
+ (BOOL)isStaticMetadataIngestionEnabled;
+ (BOOL)isViewActionAnnotationEnabled;
+ (BOOL)isVocabularyDonationEnabled;
+ (NSDictionary)allFeatures;
+ (void)setIsAppShortcutsOmittingAppNameEnabled:(BOOL)a3;
+ (void)setIsVocabularyDonationOverrideEnabled:(BOOL)a3;
@end

@implementation LNFeatureFlags

+ (BOOL)isConditionallyEnabledIntentsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAppMetadataViaXPCEnabled
{
  return _os_feature_enabled_impl() ^ 1;
}

+ (BOOL)isProductionAppEventEnabled
{
  return 1;
}

+ (BOOL)isVocabularyDonationEnabled
{
  if (isVocabularyDonationOverrideEnabled) {
    return 1;
  }
  else {
    return _os_feature_enabled_impl();
  }
}

+ (BOOL)isPersonaOpenApplicationOptionEnabled
{
  return 0;
}

+ (void)setIsAppShortcutsOmittingAppNameEnabled:(BOOL)a3
{
  isAppShortcutsOmittingAppNameOverrideEnabled = a3;
}

+ (BOOL)isAppShortcutsOmittingAppNameEnabled
{
  if (isAppShortcutsOmittingAppNameOverrideEnabled) {
    return 1;
  }
  else {
    return _os_feature_enabled_impl();
  }
}

+ (void)setIsVocabularyDonationOverrideEnabled:(BOOL)a3
{
  isVocabularyDonationOverrideEnabled = a3;
}

+ (BOOL)isLowPowerDeviceEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isViewActionAnnotationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isStaticMetadataIngestionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isRuntimeMetadataSupported
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isActionTranscriptEnabled
{
  return _os_feature_enabled_impl();
}

+ (NSDictionary)allFeatures
{
  v17[11] = *MEMORY[0x1E4F143B8];
  v16[0] = @"Action Transcript";
  v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isActionTranscriptEnabled"));
  v17[0] = v15;
  v16[1] = @"Runtime Metadata Extraction";
  v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isRuntimeMetadataSupported"));
  v17[1] = v14;
  v16[2] = @"Static Metadata Extraction";
  v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isStaticMetadataIngestionEnabled"));
  v17[2] = v3;
  v16[3] = @"View Action Annotation";
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isViewActionAnnotationEnabled"));
  v17[3] = v4;
  v16[4] = @"Vocabulary Donation";
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isVocabularyDonationEnabled"));
  v17[4] = v5;
  v16[5] = @"Low Power Device";
  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isLowPowerDeviceEnabled"));
  v17[5] = v6;
  v16[6] = @"Conditionally Enabled Intents";
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isConditionallyEnabledIntentsEnabled"));
  v17[6] = v7;
  v16[7] = @"Allow Entitled AppShortcuts to omit AppName";
  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isAppShortcutsOmittingAppNameEnabled"));
  v17[7] = v8;
  v16[8] = @"Production AppEvent";
  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isProductionAppEventEnabled"));
  v17[8] = v9;
  v16[9] = @"App Metadata via XPC";
  v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isAppMetadataViaXPCEnabled"));
  v17[9] = v10;
  v16[10] = @"Persona Open Application Option";
  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isPersonaOpenApplicationOptionEnabled"));
  v17[10] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:11];

  return (NSDictionary *)v12;
}

@end