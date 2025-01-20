@interface LTTranslator
@end

@implementation LTTranslator

uint64_t __27___LTTranslator_initialize__block_invoke()
{
  v0 = _LTOSLogXPC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __27___LTTranslator_initialize__block_invoke_cold_1(v0);
  }
  return [(id)_interruptionController _didReceiveInterruption];
}

void __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_2;
  v7[3] = &unk_2651DC918;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 onDeviceModeEnabled:v7];
}

uint64_t __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __29___LTTranslator__clearCaches__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __29___LTTranslator__clearCaches__block_invoke_cold_1();
  }
}

uint64_t __29___LTTranslator__clearCaches__block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 clearCaches];
}

void __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_2;
  v8[3] = &unk_2651DC988;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = v5;
  id v7 = v5;
  [a2 languageAssetsWithOptions:v6 completion:v8];
}

uint64_t __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) assetRequestWithService:a2 done:a3];
}

void __42___LTTranslator_addLanguages_useCellular___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42___LTTranslator_addLanguages_useCellular___block_invoke_cold_1();
  }
}

void __42___LTTranslator_addLanguages_useCellular___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v6 = a3;
  [a2 addLanguages:v4 useCellular:v5];
  v6[2]();
}

void __33___LTTranslator_removeLanguages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __33___LTTranslator_removeLanguages___block_invoke_cold_1();
  }
}

void __33___LTTranslator_removeLanguages___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a3;
  [a2 removeLanguages:v4];
  v5[2]();
}

void __40___LTTranslator__offlineLanguageStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __40___LTTranslator__offlineLanguageStatus___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40___LTTranslator__offlineLanguageStatus___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40___LTTranslator__offlineLanguageStatus___block_invoke_2;
  v7[3] = &unk_2651DC988;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 _offlineLanguageStatus:v7];
}

uint64_t __40___LTTranslator__offlineLanguageStatus___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_2;
  v9[3] = &unk_2651DCA50;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  [a2 _downloadAssetForLanguagePair:v7 userInitiated:v6 completion:v9];
}

uint64_t __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_2;
  v9[3] = &unk_2651DCA50;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  [a2 _purgeAssetForLanguagePair:v7 userInitiated:v6 completion:v9];
}

uint64_t __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_2;
  v8[3] = &unk_2651DCA50;
  id v9 = *(id *)(a1 + 32);
  id v10 = v5;
  id v7 = v5;
  [a2 _purgeAllAssetsExcludingConfig:v6 completion:v8];
}

uint64_t __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __34___LTTranslator__updateAllAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __34___LTTranslator__updateAllAssets___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __34___LTTranslator__updateAllAssets___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34___LTTranslator__updateAllAssets___block_invoke_2;
  v7[3] = &unk_2651DCA50;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 _updateAllAssets:v7];
}

uint64_t __34___LTTranslator__updateAllAssets___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __31___LTTranslator__updateHotfix___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __31___LTTranslator__updateHotfix___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __31___LTTranslator__updateHotfix___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31___LTTranslator__updateHotfix___block_invoke_2;
  v7[3] = &unk_2651DCA50;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 _updateHotfix:v7];
}

uint64_t __31___LTTranslator__updateHotfix___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __31___LTTranslator__deleteHotfix___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __31___LTTranslator__deleteHotfix___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __31___LTTranslator__deleteHotfix___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31___LTTranslator__deleteHotfix___block_invoke_2;
  v7[3] = &unk_2651DCA50;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 _deleteHotfix:v7];
}

uint64_t __31___LTTranslator__deleteHotfix___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __34___LTTranslator_installedLocales___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __34___LTTranslator_installedLocales___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __34___LTTranslator_installedLocales___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34___LTTranslator_installedLocales___block_invoke_2;
  v7[3] = &unk_2651DCAC8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 installedLocales:v7];
}

uint64_t __34___LTTranslator_installedLocales___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __52___LTTranslator_installedLocalesForTask_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52___LTTranslator_installedLocalesForTask_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52___LTTranslator_installedLocalesForTask_completion___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52___LTTranslator_installedLocalesForTask_completion___block_invoke_2;
  v8[3] = &unk_2651DCAC8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = v5;
  id v7 = v5;
  [a2 installedLocalesForTask:v6 completion:v8];
}

uint64_t __52___LTTranslator_installedLocalesForTask_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __31___LTTranslator__getAssetSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __31___LTTranslator__getAssetSize___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __31___LTTranslator__getAssetSize___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31___LTTranslator__getAssetSize___block_invoke_2;
  v7[3] = &unk_2651DCB18;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 _getAssetSize:v7];
}

uint64_t __31___LTTranslator__getAssetSize___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __50___LTTranslator_installOfflineLocales_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _LTOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __50___LTTranslator_installOfflineLocales_completion___block_invoke_39(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _startInstallationWithService:a2 done:a3];
}

void __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_2;
  v8[3] = &unk_2651DCAC8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = v5;
  id v7 = v5;
  [a2 availableLocalePairsForTask:v6 completion:v8];
}

uint64_t __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_2;
  v8[3] = &unk_2651DCAC8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 additionalLikelyPreferredLocalesForLocale:v6 completion:v8];
}

uint64_t __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_2;
  v9[3] = &unk_2651DCB68;
  id v10 = *(id *)(a1 + 48);
  id v11 = v5;
  id v8 = v5;
  [a2 configInfoForLocale:v6 otherLocale:v7 completion:v9];
}

uint64_t __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __39___LTTranslator_onDeviceModeSupported___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39___LTTranslator_onDeviceModeSupported___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39___LTTranslator_onDeviceModeSupported___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39___LTTranslator_onDeviceModeSupported___block_invoke_2;
  v7[3] = &unk_2651DCBB8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 onDeviceModeSupported:v7];
}

uint64_t __39___LTTranslator_onDeviceModeSupported___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_2;
  v7[3] = &unk_2651DC918;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 shouldPresentSystemFirstUseConsent:v7];
}

uint64_t __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFF960];
  id v7 = a2;
  id v8 = [v6 currentLocale];
  id v9 = [v8 objectForKey:*MEMORY[0x263EFF4D0]];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_2;
  v12[3] = &unk_2651DC918;
  uint64_t v10 = *(void *)(a1 + 40);
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v11 = v5;
  [v7 task:v10 isSupportedInCountry:v9 completion:v12];
}

uint64_t __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_2;
  v7[3] = &unk_2651DCAC8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 autoDetectSpeechUnsupportedPairsWithCompletion:v7];
}

uint64_t __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_2;
  v7[3] = &unk_2651DCBE0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 modalitiesPerLocaleWithCompletion:v7];
}

uint64_t __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_2;
  v7[3] = &unk_2651DCC08;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 textStreamingConfigurationWithCompletion:v7];
}

uint64_t __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke_2;
  v9[3] = &unk_2651DC918;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  [a2 task:v7 isSupportedInCountry:v6 completion:v9];
}

uint64_t __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __44___LTTranslator_languageForText_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44___LTTranslator_languageForText_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44___LTTranslator_languageForText_completion___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44___LTTranslator_languageForText_completion___block_invoke_2;
  v8[3] = &unk_2651DCC58;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 languageForText:v6 completion:v8];
}

uint64_t __44___LTTranslator_languageForText_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_2;
  v10[3] = &unk_2651DCC80;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v9 = v5;
  [a2 languagesForText:v8 usingModel:v6 strategy:v7 completion:v10];
}

uint64_t __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke_70(uint64_t a1)
{
  id v2 = _LTOSLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24639B000, v2, OS_LOG_TYPE_INFO, "Connection done", v4, 2u);
  }
  return [*(id *)(a1 + 32) invalidate];
}

void __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke_74(uint64_t a1)
{
  id v2 = _LTOSLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24639B000, v2, OS_LOG_TYPE_INFO, "Text translation connection done", v4, 2u);
  }
  return [*(id *)(a1 + 32) invalidate];
}

void __69___LTTranslator__getSyncServiceProxyWithDelegate_errorHandler_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __39___LTTranslator_preheatForRequestSync___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __39___LTTranslator_preheatForRequestSync___block_invoke_cold_1();
  }
}

void __39___LTTranslator_preheatForRequestSync___block_invoke_77(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 requestContext];
  [v3 preheatWithContext:v4 completion:&__block_literal_global_79];
}

void __46___LTTranslator_preheatForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46___LTTranslator_preheatForRequest_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46___LTTranslator_preheatForRequest_completion___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 requestContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46___LTTranslator_preheatForRequest_completion___block_invoke_2;
  v10[3] = &unk_2651DCA50;
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v9 = v5;
  [v7 preheatWithContext:v8 completion:v10];
}

uint64_t __46___LTTranslator_preheatForRequest_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __24___LTTranslator_cleanup__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24___LTTranslator_cleanup__block_invoke_cold_1();
  }
}

void __24___LTTranslator_cleanup__block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 cleanup];
  v4[2]();
}

void __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) _translationFailedWithError:v3];
}

uint64_t __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_93(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _startTranslationWithTextService:a2 done:a3];
}

void __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_2_cold_1();
  }
  [*(id *)(a1 + 32) _translationFailedWithError:v3];
}

uint64_t __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _startTranslationWithService:a2 done:a3];
}

void __21___LTTranslator_log___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __21___LTTranslator_log___block_invoke_cold_1();
  }
}

void __21___LTTranslator_log___block_invoke_98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  [a2 logWithRequestData:v4];
  v5[2]();
}

void __42___LTTranslator_selfLoggingEventWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42___LTTranslator_selfLoggingEventWithData___block_invoke_cold_1(a1, v4);
  }
}

void __42___LTTranslator_selfLoggingEventWithData___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  [a2 selfLoggingEventWithData:v4];
  v5[2]();
}

void __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke_cold_1(a1, v4);
  }
}

void __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = a3;
  [a2 selfLoggingInvocationStartedWithData:v4 invocationStartedTier1Data:v5];
  v6[2]();
}

void __71___LTTranslator_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42___LTTranslator_selfLoggingEventWithData___block_invoke_cold_1(a1, v4);
  }
}

void __71___LTTranslator_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a3;
  [a2 selfLoggingLanguageIdentificationCompletedWithLIDData:v4];
  v5[2]();
}

void __54___LTTranslator_selfLoggingInvocationCancelledForIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54___LTTranslator_selfLoggingInvocationCancelledForIDs___block_invoke_cold_1();
  }
}

void __54___LTTranslator_selfLoggingInvocationCancelledForIDs___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a3;
  [a2 selfLoggingInvocationCancelledForIDs:v4];
  v5[2]();
}

void __60___LTTranslator_selfLoggingInvocationDidError_invocationId___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60___LTTranslator_selfLoggingInvocationDidError_invocationId___block_invoke_cold_1();
  }
}

void __60___LTTranslator_selfLoggingInvocationDidError_invocationId___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = a3;
  [a2 selfLoggingInvocationDidError:v4 invocationId:v5];
  v6[2]();
}

void __27___LTTranslator_initialize__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Connection to translationd was interrupted, the process exited or crashed", v1, 2u);
}

void __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_24639B000, v0, v1, "Failed to complete onDeviceModeEnabled check, using dedicated mach port %{BOOL}i: %@");
}

void __29___LTTranslator__clearCaches__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to clear caches: %@", v2, v3, v4, v5, v6);
}

void __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to get language asset status %@", v2, v3, v4, v5, v6);
}

void __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to install offline locales: %@", v2, v3, v4, v5, v6);
}

void __42___LTTranslator_addLanguages_useCellular___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to add language %@", v2, v3, v4, v5, v6);
}

void __33___LTTranslator_removeLanguages___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed remove language %@", v2, v3, v4, v5, v6);
}

void __40___LTTranslator__offlineLanguageStatus___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete get offline language status: %@", v2, v3, v4, v5, v6);
}

void __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete _downloadAssetForLanguagePair %@", v2, v3, v4, v5, v6);
}

void __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete _purgeAssetForLanguagePair %@", v2, v3, v4, v5, v6);
}

void __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete purging all assets: %@", v2, v3, v4, v5, v6);
}

void __34___LTTranslator__updateAllAssets___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete updating all assets: %@", v2, v3, v4, v5, v6);
}

void __31___LTTranslator__updateHotfix___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete updating hotfix: %@", v2, v3, v4, v5, v6);
}

void __31___LTTranslator__deleteHotfix___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete deleting hotfix: %@", v2, v3, v4, v5, v6);
}

void __34___LTTranslator_installedLocales___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete installedLocales %@", v2, v3, v4, v5, v6);
}

void __52___LTTranslator_installedLocalesForTask_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete -installedLocalesForTask:completion: %@", v2, v3, v4, v5, v6);
}

void __31___LTTranslator__getAssetSize___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete getting asset size: %@", v2, v3, v4, v5, v6);
}

void __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_24639B000, v0, v1, "Failed to complete availableLocalePairsForTask, using dedicated mach port: %i: %@");
}

void __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete additionalLikelyPreferredLocalesForLocale %@", v2, v3, v4, v5, v6);
}

void __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete configInfoForLocale %@", v2, v3, v4, v5, v6);
}

void __39___LTTranslator_onDeviceModeSupported___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete onDeviceModeSupported check: %@", v2, v3, v4, v5, v6);
}

void __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete checking whether to present system first time use consent: %@", v2, v3, v4, v5, v6);
}

void __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete taskIsSupportedInCurrentRegion %@", v2, v3, v4, v5, v6);
}

void __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete autoDetectSpeechUnsupportedPairsWithCompletion %@", v2, v3, v4, v5, v6);
}

void __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete modalitiesPerLocaleWithCompletion %@", v2, v3, v4, v5, v6);
}

void __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete textStreamingConfigurationWithCompletion %@", v2, v3, v4, v5, v6);
}

void __44___LTTranslator_languageForText_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete text-LID request %@", v2, v3, v4, v5, v6);
}

void __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_24639B000, v0, v1, "Failed to complete text-LID %{public}@-based request %@");
}

void __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Connection error: %@", v2, v3, v4, v5, v6);
}

void __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Text translation connection error: %@", v2, v3, v4, v5, v6);
}

void __39___LTTranslator_preheatForRequestSync___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete sync preheat request: %@", v2, v3, v4, v5, v6);
}

void __46___LTTranslator_preheatForRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete preheat request %@", v2, v3, v4, v5, v6);
}

void __24___LTTranslator_cleanup__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to initiate cleanup: %@", v2, v3, v4, v5, v6);
}

void __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete getting text service for translation with dedicated mach port: %@", v2, v3, v4, v5, v6);
}

void __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete getting text service for translation without dedicated mach port: %@", v2, v3, v4, v5, v6);
}

void __21___LTTranslator_log___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Failed to complete logging request: %@", v2, v3, v4, v5, v6);
}

void __42___LTTranslator_selfLoggingEventWithData___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 invocationId];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_24639B000, v5, v6, "Failed to send SELF logging event [%@] %@", v7, v8, v9, v10, v11);
}

void __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 invocationId];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_24639B000, v5, v6, "Failed to send SELF logging invocation started and started tier 1 [%{public}@] %@", v7, v8, v9, v10, v11);
}

void __54___LTTranslator_selfLoggingInvocationCancelledForIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_24639B000, v0, v1, "Failed to send SELF logging invocation cancelled [%{public}@] %@");
}

void __60___LTTranslator_selfLoggingInvocationDidError_invocationId___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_24639B000, v0, v1, "Failed to send SELF logging invocation did error [%{public}@] %@");
}

@end