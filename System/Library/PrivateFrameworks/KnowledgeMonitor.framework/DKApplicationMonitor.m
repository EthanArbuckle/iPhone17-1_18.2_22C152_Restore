@interface DKApplicationMonitor
@end

@implementation DKApplicationMonitor

BOOL __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  BOOL v3 = v2 != 0;

  return v3;
}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    v6 = [*(id *)(a1 + 48) timestamp];
    v7 = (void *)[v5 _newElementFromExistingDisplayElement:v8 newTimestamp:v6 newChangeType:3];

    [*(id *)(a1 + 56) addObject:v7];
  }
}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_13_cold_1(v4, v5);
  }
}

uint64_t __59___DKApplicationMonitor_focalApplicationFromDisplayLayout___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 isSpringBoardElement]) {
    goto LABEL_8;
  }
  BOOL v3 = [v2 identifier];
  if (v3)
  {
  }
  else
  {
    uint64_t v4 = [v2 bundleIdentifier];

    if (!v4) {
      goto LABEL_9;
    }
  }
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "layoutRole"));
  int v6 = [&unk_26D86D818 containsObject:v5];

  if (!v6)
  {
LABEL_8:
    uint64_t v4 = 0;
    goto LABEL_9;
  }
  if ([v2 layoutRole] == 4)
  {
    v7 = [v2 identifier];
    uint64_t v4 = [&unk_26D86D830 containsObject:v7];
  }
  else
  {
    uint64_t v4 = 1;
  }
LABEL_9:

  return v4;
}

void __55___DKApplicationMonitor_displayLayoutTransitionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = [WeakRetained queue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55___DKApplicationMonitor_displayLayoutTransitionHandler__block_invoke_2;
    v14[3] = &unk_264714DD0;
    v14[4] = v12;
    id v15 = v7;
    id v16 = v8;
    id v17 = v9;
    dispatch_sync(v13, v14);
  }
}

uint64_t __55___DKApplicationMonitor_displayLayoutTransitionHandler__block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 168) == *(void *)(result + 40)) {
    return objc_msgSend(*(id *)(result + 32), "layoutMonitor:didUpdateDisplayLayout:withContext:");
  }
  return result;
}

uint64_t __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 level];
  if (v6 != [v5 level])
  {
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "level"));
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "level"));
    goto LABEL_5;
  }
  id v7 = [v4 bundleIdentifier];
  id v8 = [v5 bundleIdentifier];
  uint64_t v9 = [v7 compare:v8];

  if (!v9)
  {
    v10 = [v4 identifier];
    uint64_t v11 = [v5 identifier];
LABEL_5:
    v12 = (void *)v11;
    uint64_t v9 = [v10 compare:v11];
  }
  return v9;
}

uint64_t __59___DKApplicationMonitor_focalApplicationFromDisplayLayout___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [v5 objectAtIndexedSubscript:v6];
      id v8 = [v4 objectAtIndexedSubscript:v6];
      uint64_t v9 = [v7 compare:v8];

      if (v9) {
        break;
      }
      if ([v4 count] <= (unint64_t)++v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v9 = 0;
  }

  return v9;
}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v6 = [v3 error];
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_225002000, v4, OS_LOG_TYPE_DEFAULT, "BMFrontBoardDisplayElement - Finished initializing currentFrontBoardElements with %lu elements from stream, err: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 eventBody];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 eventBody];
    [v4 _updateCurrentElementsWithDisplayElement:v5];

    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

void __29___DKApplicationMonitor_init__block_invoke(uint64_t a1)
{
  BiomeLibrary();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v6 FrontBoard];
  uint64_t v3 = [v2 DisplayElement];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 208);
  *(void *)(v4 + 208) = v3;
}

void __46___DKApplicationMonitor_platformSpecificStart__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 processUpdateHandler];
  [v3 setUpdateHandler:v4];
}

uint64_t __44___DKApplicationMonitor_ignoreAppExtension___block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.CryptoTokenKit.setoken", @"com.apple.Sharing.AirDropDiagnostic", @"com.apple.CloudDocs.MobileDocumentsFileProvider", @"com.apple.CloudDocs.iCloudDriveFileProvider", @"com.apple.CloudDocs.iCloudDriveFileProviderManaged", @"com.apple.UIKit.ShareUI", @"com.apple.WebKit.WebContent", @"com.apple.WebKit.Networking", @"com.apple.WebKit.GPU", @"com.apple.mobileslideshow.PhotosDiagnostics", @"com.apple.CarKit.CarPlayDiagnosticsExtension", @"com.apple.CloudDocsDaemon.diagnostic", @"com.apple.Maps.DEMapsExtension", @"com.apple.Search.framework.SpotlightDiagnostic", @"com.apple.BiometricKit.BioLogDiagnostic", @"com.apple.audio.toolbox.AudioToolbox.DiagnosticExtensions", @"com.apple.Symptoms.SFDiagnosticExtension.appex",
    @"com.apple.news.articlenotificationserviceextension",
    @"com.apple.DiagnosticsService.SystemReport",
    @"com.apple.FileProvider.LocalStorage",
    @"com.apple.news.diagnosticextension",
    @"com.apple.mobilesafari.SafariDiagnosticExtension",
    @"com.apple.mobilemail.DiagnosticExtension",
    @"com.apple.mobilecal.diagnosticextension",
    @"com.apple.accessibility.Accessibility.AXTapToRadar",
    @"com.apple.accessibility.Accessibility.GuidedAccessTapToRadar",
    @"com.apple.accessibility.Accessibility.HearingAidsTapToRadar",
    @"com.apple.accessibility.Accessibility.SwitchControlTapToRadar",
    @"com.apple.accessibility.Accessibility.VoiceOverTapToRadar",
    @"com.apple.audio.toolbox.AudioToolbox.DiagnosticExtensions",
    @"com.apple.duet.expertcenter.diagnosticextension",
    @"com.apple.keyboard.TypoTracker.DiagnosticExtension",
    @"com.apple.PowerlogCore.diagnosticextension",
    @"com.apple.PassKit.applepay.diagnosticextension",
    @"com.apple.HomeKit.diagnosticextensioncom.apple.MediaPlayer.DiagnosticExtension",
    @"com.apple.MobileAddressBook",
    @"com.apple.MobileBackup.framework.DiagnosticExtension",
    @"com.apple.CoreRoutine.RTDiagnosticExtension",
    @"com.apple.DiagnosticExtensions.sysdiagnose",
    @"com.apple.DiagnosticExtensions.Bluetooth",
    @"com.apple.DiagnosticExtensions.WiFi",
    @"com.apple.DiagnosticExtensions.Syslog",
    @"com.apple.DiagnosticExtensions.StackShot",
    @"com.apple.DiagnosticExtensions.Keyboard",
    @"com.apple.DiagnosticExtensions.CrashLogs",
    @"com.apple.DiagnosticExtensions.Panic",
    @"com.apple.DiagnosticExtensions.LowMemory",
    @"com.apple.DiagnosticExtensions.Siri",
  ignoreAppExtension__ignoreList = 0);
  return MEMORY[0x270F9A758]();
}

void __45___DKApplicationMonitor_processUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = [WeakRetained queue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __45___DKApplicationMonitor_processUpdateHandler__block_invoke_2;
    v14[3] = &unk_264714DD0;
    v14[4] = v12;
    id v15 = v7;
    id v16 = v9;
    id v17 = v8;
    dispatch_sync(v13, v14);
  }
}

uint64_t __45___DKApplicationMonitor_processUpdateHandler__block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 176) == *(void *)(result + 40)) {
    return objc_msgSend(*(id *)(result + 32), "processMonitor:didUpdateState:forProcess:");
  }
  return result;
}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_13_cold_1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [a1 changeType];
  id v4 = BMFrontBoardDisplayElementChangeTypeAsString();
  uint64_t v5 = [a1 identifier];
  id v6 = [a1 bundleIdentifier];
  int v7 = 138412802;
  id v8 = v4;
  __int16 v9 = 2112;
  v10 = v5;
  __int16 v11 = 2112;
  v12 = v6;
  _os_log_debug_impl(&dword_225002000, a2, OS_LOG_TYPE_DEBUG, "BMFrontBoardDisplayElement - %@ event for identifier: %@ bundleIdentifier: %@", (uint8_t *)&v7, 0x20u);
}

@end