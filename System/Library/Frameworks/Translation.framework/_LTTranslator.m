@interface _LTTranslator
+ (_LTInterruptionHandler)interruptionController;
+ (id)interruptionHandler;
+ (void)_clearCaches;
+ (void)_deleteHotfix:(id)a3;
+ (void)_downloadAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
+ (void)_getAssetSize:(id)a3;
+ (void)_getServiceProxyWithDelegate:(id)a3 errorHandler:(id)a4 block:(id)a5;
+ (void)_getSyncServiceProxyWithDelegate:(id)a3 errorHandler:(id)a4 block:(id)a5;
+ (void)_getTextServiceProxyWithDelegate:(id)a3 useDedicatedTextMachPort:(BOOL)a4 errorHandler:(id)a5 block:(id)a6;
+ (void)_offlineLanguageStatus:(id)a3;
+ (void)_purgeAllAssets:(id)a3;
+ (void)_purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4;
+ (void)_purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
+ (void)_updateAllAssets:(id)a3;
+ (void)_updateHotfix:(id)a3;
+ (void)addLanguages:(id)a3 useCellular:(BOOL)a4;
+ (void)additionalLikelyPreferredLocalesForLocale:(id)a3 completion:(id)a4;
+ (void)autoDetectSpeechUnsupportedPairsWithCompletion:(id)a3;
+ (void)availableLocalePairsForTask:(int64_t)a3 completion:(id)a4;
+ (void)availableLocalePairsForTask:(int64_t)a3 useDedicatedMachPort:(BOOL)a4 completion:(id)a5;
+ (void)configInfoForLocale:(id)a3 otherLocale:(id)a4 completion:(id)a5;
+ (void)initialize;
+ (void)installOfflineLocales:(id)a3 completion:(id)a4;
+ (void)installedLocales:(id)a3;
+ (void)installedLocalesForTask:(int64_t)a3 completion:(id)a4;
+ (void)languageAssetsWithOptions:(unint64_t)a3 completion:(id)a4;
+ (void)languageForText:(id)a3 completion:(id)a4;
+ (void)languagesForText:(id)a3 completion:(id)a4;
+ (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 completion:(id)a5;
+ (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 strategy:(unint64_t)a5 useDedicatedTextMachPort:(BOOL)a6 completion:(id)a7;
+ (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 useDedicatedTextMachPort:(BOOL)a5 completion:(id)a6;
+ (void)modalitiesPerLocaleWithCompletion:(id)a3;
+ (void)onDeviceModeEnabled:(id)a3;
+ (void)onDeviceModeEnabledWithDedicatedMachPort:(BOOL)a3 completion:(id)a4;
+ (void)onDeviceModeSupported:(id)a3;
+ (void)removeLanguages:(id)a3;
+ (void)selfLoggingEventWithData:(id)a3;
+ (void)selfLoggingInvocationCancelledForIDs:(id)a3;
+ (void)selfLoggingInvocationDidError:(id)a3 invocationId:(id)a4;
+ (void)selfLoggingInvocationStartedWithData:(id)a3 invocationStartedTier1Data:(id)a4;
+ (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3;
+ (void)setInterruptionHandler:(id)a3;
+ (void)setLanguageAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6;
+ (void)shouldPresentSystemFirstUseConsentWithDedicatedMachPort:(BOOL)a3 completion:(id)a4;
+ (void)task:(int64_t)a3 isSupportedInCountry:(id)a4 completion:(id)a5;
+ (void)taskIsSupportedInCurrentRegion:(int64_t)a3 completion:(id)a4;
+ (void)textStreamingConfigurationWithCompletion:(id)a3;
- (id)startTranslationSession;
- (id)startTranslationSessionWithSELFLoggingInvocationId:(id)a3;
- (void)cleanup;
- (void)log:(id)a3;
- (void)preheatForRequest:(id)a3 completion:(id)a4;
- (void)preheatForRequestSync:(id)a3;
- (void)translate:(id)a3;
- (void)translate:(id)a3 useDedicatedTextMachPort:(BOOL)a4;
@end

@implementation _LTTranslator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(_LTInterruptionHandler);
    v3 = (void *)_interruptionController;
    _interruptionController = (uint64_t)v2;

    v4 = objc_alloc_init(_LTBlockBasedInterruptionHandler);
    v5 = (void *)_legacyInterruptionHandler;
    _legacyInterruptionHandler = (uint64_t)v4;

    [(id)_interruptionController addObserver:_legacyInterruptionHandler];
    v6 = (void *)internalInterruptionHandler;
    internalInterruptionHandler = (uint64_t)&__block_literal_global_14;
  }
}

+ (id)interruptionHandler
{
  v2 = [(id)_legacyInterruptionHandler handler];
  v3 = v2;
  if (!v2) {
    v2 = &__block_literal_global_5;
  }
  v4 = _Block_copy(v2);

  return v4;
}

+ (void)setInterruptionHandler:(id)a3
{
}

+ (_LTInterruptionHandler)interruptionController
{
  return (_LTInterruptionHandler *)(id)_interruptionController;
}

+ (void)onDeviceModeEnabled:(id)a3
{
}

+ (void)onDeviceModeEnabledWithDedicatedMachPort:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke;
  v9[3] = &unk_2651DC8F0;
  BOOL v11 = v4;
  id v10 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_7;
  v7[3] = &unk_2651DC940;
  id v8 = v10;
  id v6 = v10;
  +[_LTTranslator _getTextServiceProxyWithDelegate:0 useDedicatedTextMachPort:v4 errorHandler:v9 block:v7];
}

+ (void)_clearCaches
{
}

+ (void)languageAssetsWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke;
  v10[3] = &unk_2651DC730;
  id v11 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_16;
  v7[3] = &unk_2651DC9B0;
  id v8 = v11;
  unint64_t v9 = a3;
  id v6 = v11;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v10 block:v7];
}

+ (void)setLanguageAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [[_LTLanguageAssetRequest alloc] initWithLanguageAssets:v11 options:a4 progress:v10 completion:v9];

  v13 = v12;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke;
  v17[3] = &unk_2651DC730;
  id v18 = v9;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_20;
  v15[3] = &unk_2651DC9D8;
  v16 = v13;
  id v14 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:v13 errorHandler:v17 block:v15];
}

+ (void)addLanguages:(id)a3 useCellular:(BOOL)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42___LTTranslator_addLanguages_useCellular___block_invoke_23;
  v7[3] = &unk_2651DCA00;
  id v8 = v5;
  BOOL v9 = a4;
  id v6 = v5;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:&__block_literal_global_22_0 block:v7];
}

+ (void)removeLanguages:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33___LTTranslator_removeLanguages___block_invoke_26;
  v5[3] = &unk_2651DC9D8;
  id v6 = v3;
  id v4 = v3;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:&__block_literal_global_25_0 block:v5];
}

+ (void)_offlineLanguageStatus:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40___LTTranslator__offlineLanguageStatus___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40___LTTranslator__offlineLanguageStatus___block_invoke_27;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)_downloadAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke;
  v15[3] = &unk_2651DC730;
  id v16 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_28;
  v11[3] = &unk_2651DCA78;
  BOOL v14 = a4;
  id v12 = v7;
  id v13 = v16;
  id v9 = v16;
  id v10 = v7;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v15 block:v11];
}

+ (void)_purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke;
  v15[3] = &unk_2651DC730;
  id v16 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_29;
  v11[3] = &unk_2651DCA78;
  BOOL v14 = a4;
  id v12 = v7;
  id v13 = v16;
  id v9 = v16;
  id v10 = v7;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v15 block:v11];
}

+ (void)_purgeAllAssets:(id)a3
{
}

+ (void)_purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke;
  v10[3] = &unk_2651DC730;
  id v11 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_30;
  v7[3] = &unk_2651DCAA0;
  BOOL v9 = a3;
  id v8 = v11;
  id v6 = v11;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v10 block:v7];
}

+ (void)_updateAllAssets:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34___LTTranslator__updateAllAssets___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34___LTTranslator__updateAllAssets___block_invoke_31;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)_updateHotfix:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31___LTTranslator__updateHotfix___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31___LTTranslator__updateHotfix___block_invoke_32;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)_deleteHotfix:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31___LTTranslator__deleteHotfix___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31___LTTranslator__deleteHotfix___block_invoke_33;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)installedLocales:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34___LTTranslator_installedLocales___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34___LTTranslator_installedLocales___block_invoke_34;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)installedLocalesForTask:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52___LTTranslator_installedLocalesForTask_completion___block_invoke;
  v10[3] = &unk_2651DC730;
  id v11 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52___LTTranslator_installedLocalesForTask_completion___block_invoke_36;
  v7[3] = &unk_2651DCAF0;
  id v8 = v11;
  int64_t v9 = a3;
  id v6 = v11;
  +[_LTTranslator _getTextServiceProxyWithDelegate:0 useDedicatedTextMachPort:1 errorHandler:v10 block:v7];
}

+ (void)_getAssetSize:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31___LTTranslator__getAssetSize___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31___LTTranslator__getAssetSize___block_invoke_37;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)installOfflineLocales:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  [v7 setCompletionHandler:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50___LTTranslator_installOfflineLocales_completion___block_invoke;
  v12[3] = &unk_2651DC730;
  id v13 = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50___LTTranslator_installOfflineLocales_completion___block_invoke_39;
  v10[3] = &unk_2651DC9D8;
  id v11 = v7;
  id v8 = v7;
  id v9 = v6;
  +[_LTTranslator _getServiceProxyWithDelegate:v8 errorHandler:v12 block:v10];
}

+ (void)availableLocalePairsForTask:(int64_t)a3 completion:(id)a4
{
}

+ (void)availableLocalePairsForTask:(int64_t)a3 useDedicatedMachPort:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke;
  v12[3] = &unk_2651DC8F0;
  BOOL v14 = v5;
  id v13 = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_40;
  v9[3] = &unk_2651DCAF0;
  id v10 = v13;
  int64_t v11 = a3;
  id v8 = v13;
  +[_LTTranslator _getTextServiceProxyWithDelegate:0 useDedicatedTextMachPort:v5 errorHandler:v12 block:v9];
}

+ (void)additionalLikelyPreferredLocalesForLocale:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke;
  v12[3] = &unk_2651DC730;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_41;
  v9[3] = &unk_2651DCB40;
  id v10 = v5;
  id v11 = v13;
  id v7 = v13;
  id v8 = v5;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v12 block:v9];
}

+ (void)configInfoForLocale:(id)a3 otherLocale:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke;
  v17[3] = &unk_2651DC730;
  id v18 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_42;
  v13[3] = &unk_2651DCB90;
  id v14 = v7;
  id v15 = v8;
  id v16 = v18;
  id v10 = v18;
  id v11 = v8;
  id v12 = v7;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v17 block:v13];
}

+ (void)onDeviceModeSupported:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39___LTTranslator_onDeviceModeSupported___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39___LTTranslator_onDeviceModeSupported___block_invoke_44;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)shouldPresentSystemFirstUseConsentWithDedicatedMachPort:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(id, void))a4;
  id v6 = [MEMORY[0x263F086E0] mainBundle];
  id v7 = [v6 infoDictionary];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFFB58]];

  if ([v8 isEqualToString:@"com.apple.Translate"])
  {
    id v9 = _LTOSLogOnboarding();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24639B000, v9, OS_LOG_TYPE_INFO, "Not showing first-use consent because it's running in the Translate app", buf, 2u);
    }
    v5[2](v5, 0);
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke;
    v12[3] = &unk_2651DC730;
    id v13 = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_47;
    v10[3] = &unk_2651DC940;
    id v11 = v13;
    +[_LTTranslator _getTextServiceProxyWithDelegate:0 useDedicatedTextMachPort:v4 errorHandler:v12 block:v10];
  }
}

+ (void)taskIsSupportedInCurrentRegion:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke;
  v10[3] = &unk_2651DC730;
  id v11 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_48;
  v7[3] = &unk_2651DC9B0;
  id v8 = v11;
  int64_t v9 = a3;
  id v6 = v11;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v10 block:v7];
}

+ (void)autoDetectSpeechUnsupportedPairsWithCompletion:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_50;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)modalitiesPerLocaleWithCompletion:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_51;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)textStreamingConfigurationWithCompletion:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_2651DC730;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_53;
  v5[3] = &unk_2651DCA28;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)task:(int64_t)a3 isSupportedInCountry:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke;
  v15[3] = &unk_2651DC730;
  id v16 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke_55;
  v11[3] = &unk_2651DCC30;
  id v13 = v16;
  int64_t v14 = a3;
  id v12 = v7;
  id v9 = v16;
  id v10 = v7;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v15 block:v11];
}

+ (void)languageForText:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44___LTTranslator_languageForText_completion___block_invoke;
  v12[3] = &unk_2651DC730;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44___LTTranslator_languageForText_completion___block_invoke_56;
  v9[3] = &unk_2651DCB40;
  id v10 = v5;
  id v11 = v13;
  id v7 = v13;
  id v8 = v5;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v12 block:v9];
}

+ (void)languagesForText:(id)a3 completion:(id)a4
{
}

+ (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 completion:(id)a5
{
}

+ (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 useDedicatedTextMachPort:(BOOL)a5 completion:(id)a6
{
}

+ (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 strategy:(unint64_t)a5 useDedicatedTextMachPort:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a7;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke;
  v20[3] = &unk_2651DC8F0;
  BOOL v22 = v8;
  id v21 = v12;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_64;
  v15[3] = &unk_2651DCCA8;
  unint64_t v18 = a4;
  unint64_t v19 = a5;
  id v16 = v11;
  id v17 = v21;
  id v13 = v21;
  id v14 = v11;
  +[_LTTranslator _getTextServiceProxyWithDelegate:0 useDedicatedTextMachPort:v8 errorHandler:v20 block:v15];
}

+ (void)_getServiceProxyWithDelegate:(id)a3 errorHandler:(id)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _LTOSLogXPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24639B000, v10, OS_LOG_TYPE_INFO, "Creating service proxy", buf, 2u);
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.translationd" options:0];
  id v12 = _LTTranslationServiceXPCInterface();
  [v11 setRemoteObjectInterface:v12];

  if (v7)
  {
    [v11 setExportedObject:v7];
    id v13 = _LTTranslationServiceDelegateXPCInterface();
    [v11 setExportedInterface:v13];
  }
  [v11 setInterruptionHandler:internalInterruptionHandler];
  [v11 resume];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke;
  v21[3] = &unk_2651DCCD0;
  id v14 = v11;
  id v22 = v14;
  id v23 = v8;
  id v15 = v8;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke_70;
  v19[3] = &unk_2651DBC00;
  id v20 = v14;
  id v17 = (void (*)(void *, void *, void *))v9[2];
  id v18 = v14;
  v17(v9, v16, v19);
}

+ (void)_getTextServiceProxyWithDelegate:(id)a3 useDedicatedTextMachPort:(BOOL)a4 errorHandler:(id)a5 block:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = _LTOSLogXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24639B000, v12, OS_LOG_TYPE_INFO, "Creating text-only service proxy", buf, 2u);
  }
  id v13 = @"com.apple.translationd";
  if (v8) {
    id v13 = @"com.apple.translation.text";
  }
  id v14 = (objc_class *)MEMORY[0x263F08D68];
  id v15 = v13;
  id v16 = (void *)[[v14 alloc] initWithMachServiceName:v15 options:0];

  id v17 = _LTTextTranslationServiceXPCInterface();
  [v16 setRemoteObjectInterface:v17];

  if (v9)
  {
    [v16 setExportedObject:v9];
    id v18 = _LTTranslationServiceDelegateXPCInterface();
    [v16 setExportedInterface:v18];
  }
  [v16 setInterruptionHandler:internalInterruptionHandler];
  [v16 resume];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke;
  v26[3] = &unk_2651DCCD0;
  id v19 = v16;
  id v27 = v19;
  id v28 = v10;
  id v20 = v10;
  id v21 = [v19 remoteObjectProxyWithErrorHandler:v26];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke_74;
  v24[3] = &unk_2651DBC00;
  id v25 = v19;
  id v22 = (void (*)(void *, void *, void *))v11[2];
  id v23 = v19;
  v22(v11, v21, v24);
}

+ (void)_getSyncServiceProxyWithDelegate:(id)a3 errorHandler:(id)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = _LTOSLogXPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24639B000, v10, OS_LOG_TYPE_INFO, "Creating SYNC service proxy", buf, 2u);
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.translationd" options:0];
  id v12 = _LTTranslationServiceXPCInterface();
  [v11 setRemoteObjectInterface:v12];

  if (v7)
  {
    [v11 setExportedObject:v7];
    id v13 = _LTTranslationServiceDelegateXPCInterface();
    [v11 setExportedInterface:v13];
  }
  [v11 setInterruptionHandler:internalInterruptionHandler];
  [v11 resume];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __69___LTTranslator__getSyncServiceProxyWithDelegate_errorHandler_block___block_invoke;
  id v20 = &unk_2651DCCD0;
  id v21 = v11;
  id v22 = v8;
  id v14 = v8;
  id v15 = v11;
  id v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:&v17];
  v9[2](v9, v16);

  objc_msgSend(v15, "invalidate", v17, v18, v19, v20);
}

- (void)preheatForRequestSync:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39___LTTranslator_preheatForRequestSync___block_invoke_77;
  v5[3] = &unk_2651DCCF8;
  id v6 = v3;
  id v4 = v3;
  +[_LTTranslator _getSyncServiceProxyWithDelegate:0 errorHandler:&__block_literal_global_76 block:v5];
}

- (void)preheatForRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46___LTTranslator_preheatForRequest_completion___block_invoke;
  v12[3] = &unk_2651DC730;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46___LTTranslator_preheatForRequest_completion___block_invoke_80;
  v9[3] = &unk_2651DCB40;
  id v10 = v5;
  id v11 = v13;
  id v7 = v13;
  id v8 = v5;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v12 block:v9];
}

- (void)cleanup
{
}

- (void)translate:(id)a3
{
}

- (void)translate:(id)a3 useDedicatedTextMachPort:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _LTOSLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v22 = v4;
    _os_log_impl(&dword_24639B000, v6, OS_LOG_TYPE_INFO, "Starting translation for request (using dedicated text mach port = %{BOOL}i)", buf, 8u);
  }
  id v7 = [v5 serviceDelegate];
  if (v4)
  {
    if ([v5 _canUseTextService])
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke;
      v19[3] = &unk_2651DCD40;
      id v20 = v5;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_93;
      v17[3] = &unk_2651DCD68;
      id v18 = v20;
      +[_LTTranslator _getTextServiceProxyWithDelegate:v7 useDedicatedTextMachPort:1 errorHandler:v19 block:v17];

      id v8 = v20;
    }
    else
    {
      id v9 = _LTOSLogXPC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_LTTranslator translate:useDedicatedTextMachPort:](v9);
      }
      id v10 = (void *)MEMORY[0x263F087E8];
      id v8 = [MEMORY[0x263F086E0] mainBundle];
      id v11 = [v8 localizedStringForKey:@"CLIENT_REQUIRES_TEXT_SERVICE_ERROR_DESCRIPTION" value:&stru_26FAADE68 table:0];
      id v12 = objc_msgSend(v10, "lt_errorWithCode:description:userInfo:", 17, v11, 0);
      [v5 _translationFailedWithError:v12];
    }
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_2;
    v15[3] = &unk_2651DCD40;
    id v16 = v5;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_94;
    v13[3] = &unk_2651DC9D8;
    id v14 = v16;
    +[_LTTranslator _getServiceProxyWithDelegate:v7 errorHandler:v15 block:v13];

    id v8 = v16;
  }
}

- (void)log:(id)a3
{
  id v8 = 0;
  id v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  id v4 = v8;
  if (v4)
  {
    id v5 = _LTOSLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_LTTranslator log:]();
    }
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __21___LTTranslator_log___block_invoke_98;
    v6[3] = &unk_2651DC9D8;
    id v7 = v3;
    +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:&__block_literal_global_97 block:v6];
  }
}

- (id)startTranslationSession
{
  id v3 = [_LTTranslationSession alloc];
  id v4 = [MEMORY[0x263F08C38] UUID];
  id v5 = [(_LTTranslationSession *)v3 initWithTranslator:self selfLoggingInvocationId:v4];

  return v5;
}

- (id)startTranslationSessionWithSELFLoggingInvocationId:(id)a3
{
  id v4 = a3;
  id v5 = [[_LTTranslationSession alloc] initWithTranslator:self selfLoggingInvocationId:v4];

  return v5;
}

+ (void)selfLoggingEventWithData:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42___LTTranslator_selfLoggingEventWithData___block_invoke;
  v7[3] = &unk_2651DCD40;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42___LTTranslator_selfLoggingEventWithData___block_invoke_101;
  v5[3] = &unk_2651DC9D8;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getServiceProxyWithDelegate:0 errorHandler:v7 block:v5];
}

+ (void)selfLoggingInvocationStartedWithData:(id)a3 invocationStartedTier1Data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke;
  v12[3] = &unk_2651DCD40;
  id v13 = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke_102;
  v9[3] = &unk_2651DCD90;
  id v10 = v13;
  id v11 = v6;
  id v7 = v6;
  id v8 = v13;
  +[_LTTranslator _getTextServiceProxyWithDelegate:0 useDedicatedTextMachPort:1 errorHandler:v12 block:v9];
}

+ (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71___LTTranslator_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke;
  v7[3] = &unk_2651DCD40;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71___LTTranslator_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke_103;
  v5[3] = &unk_2651DCD68;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getTextServiceProxyWithDelegate:0 useDedicatedTextMachPort:1 errorHandler:v7 block:v5];
}

+ (void)selfLoggingInvocationCancelledForIDs:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54___LTTranslator_selfLoggingInvocationCancelledForIDs___block_invoke;
  v7[3] = &unk_2651DCD40;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54___LTTranslator_selfLoggingInvocationCancelledForIDs___block_invoke_104;
  v5[3] = &unk_2651DCD68;
  id v6 = v8;
  id v4 = v8;
  +[_LTTranslator _getTextServiceProxyWithDelegate:0 useDedicatedTextMachPort:1 errorHandler:v7 block:v5];
}

+ (void)selfLoggingInvocationDidError:(id)a3 invocationId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60___LTTranslator_selfLoggingInvocationDidError_invocationId___block_invoke;
  v12[3] = &unk_2651DCD40;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60___LTTranslator_selfLoggingInvocationDidError_invocationId___block_invoke_105;
  v9[3] = &unk_2651DCD90;
  id v10 = v5;
  id v11 = v13;
  id v7 = v13;
  id v8 = v5;
  +[_LTTranslator _getTextServiceProxyWithDelegate:0 useDedicatedTextMachPort:1 errorHandler:v12 block:v9];
}

- (void).cxx_destruct
{
}

- (void)translate:(os_log_t)log useDedicatedTextMachPort:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Refusing to translate text since request isn't allowed to use dedicated mach port", v1, 2u);
}

- (void)log:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to serialize logging request: %@", v2, v3, v4, v5, v6);
}

@end