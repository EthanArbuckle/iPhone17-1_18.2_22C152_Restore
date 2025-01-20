@interface WBSAnalyticsLogger
@end

@implementation WBSAnalyticsLogger

uint64_t __80__WBSAnalyticsLogger__SFWebClipsAnalyticsLogger__schedulePeriodicWebClipsReport__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performWebClipsBehaviorReport];
  objc_msgSend(*(id *)(a1 + 32), "_webClipsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime");
  v2 = *(void **)(a1 + 32);

  return [v2 schedulePeriodicWebClipsReport];
}

void __118__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didBeginDownloadWithMIMEType_uti_downloadType_promptType_browserPersona___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();
}

id __118__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didBeginDownloadWithMIMEType_uti_downloadType_promptType_browserPersona___block_invoke_2(void *a1)
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v1 = (__CFString *)a1[4];
  id v2 = (__CFString *)a1[5];
  if (!v1) {
    v1 = @"<unknown type>";
  }
  v16[0] = @"MIMEType";
  v16[1] = @"UTI";
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = @"<unknown type>";
  }
  v17[0] = v1;
  v17[1] = v3;
  v4 = @"automatic download on navigation";
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  if (v5 == 1) {
    v4 = @"explicitly downloaded";
  }
  if (v5 == 2) {
    v7 = @"save to files in share sheet";
  }
  else {
    v7 = v4;
  }
  v16[2] = @"type";
  v16[3] = @"prompt";
  v8 = @"no download prompt";
  if (v6 == 1) {
    v8 = @"download on prompt";
  }
  if (v6 == 2) {
    v8 = @"cancelled on prompt";
  }
  v17[2] = v7;
  v17[3] = v8;
  v16[4] = @"persona";
  unint64_t v9 = a1[8] - 1;
  if (v9 > 3) {
    v10 = @"Safari";
  }
  else {
    v10 = *(&off_1E5C78460 + v9);
  }
  v17[4] = v10;
  v11 = (void *)MEMORY[0x1E4F1C9E8];
  v12 = v8;
  v13 = v7;
  v14 = [v11 dictionaryWithObjects:v17 forKeys:v16 count:5];

  return v14;
}

uint64_t __74__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didAddFavoriteFromShareSheet__block_invoke()
{
  return MEMORY[0x1E4F1CC08];
}

void __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) extensionStatisticsReport];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(NSObject **)(v3 + (int)*MEMORY[0x1E4F98FD8]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke_2;
  v6[3] = &unk_1E5C72238;
  v6[4] = v3;
  id v7 = v2;
  id v5 = v2;
  dispatch_async(v4, v6);
}

void __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke_2(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke_3;
  v6[3] = &unk_1E5C783D8;
  id v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v2 reportNumberOfExtensionsWithFrequencyDictionaryProvider:v6];
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) telemetryDataForExtensions];
  [v3 reportStatusForExtensions:v4 extensionType:@"WebExtension"];

  [*(id *)(a1 + 32) reportStartPageOverrideStatistics:*(void *)(a1 + 40)];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v5 setDouble:@"LastPeriodicExtensionsReportTimePreferenceKey" forKey:CFAbsoluteTimeGetCurrent()];
}

id __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke_3(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F991F0];
  id v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "enabledCount"));
  v9[0] = v2;
  v8[1] = *MEMORY[0x1E4F991E0];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "disabledCount"));
  v9[1] = v3;
  v8[2] = *MEMORY[0x1E4F991F8];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "enabledCount"));
  v9[2] = v4;
  v8[3] = *MEMORY[0x1E4F991E8];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "disabledCount"));
  v9[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

id __102__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportCapsuleLayoutStyle_backgroundColorInTabBarEnabled___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v1 = @"bottom";
  if (*(void *)(a1 + 32) != 1) {
    v1 = @"top";
  }
  v8[1] = @"backgroundColorInTabBarEnabled";
  v9[0] = v1;
  v8[0] = @"capsuleLayoutStyle";
  id v2 = NSNumber;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v1;
  id v5 = [v2 numberWithBool:v3];
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

id __84__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didPerformFormatMenuAction_provenance___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  v8[0] = *(void *)(a1 + 32);
  v7[0] = @"action";
  v7[1] = @"provenance";
  if ((unint64_t)(v1 - 1) > 4) {
    id v2 = @"unknown";
  }
  else {
    id v2 = *(&off_1E5C78600 + v1 - 1);
  }
  v8[1] = v2;
  v7[2] = @"menuType";
  unint64_t v3 = *(void *)(a1 + 40) - 1;
  if (v3 > 4) {
    v4 = @"unknown";
  }
  else {
    v4 = *(&off_1E5C78628 + v3);
  }
  void v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

id __72__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportPrivateWindowStatus___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"status";
  uint64_t v1 = @"running";
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == 1) {
    uint64_t v1 = @"cached";
  }
  if (v2 == 2) {
    uint64_t v1 = @"no private window";
  }
  v8[0] = v1;
  unint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
  v4 = v1;
  id v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

void *__71__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportBrowserChoiceNotNow__block_invoke()
{
  return &unk_1EFBDFC68;
}

id __66__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportBrowserChoice___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v4 = @"selectedBrowser";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

@end