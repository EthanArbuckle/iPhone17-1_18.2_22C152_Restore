@interface WBSAnalyticsLogger(_SFAnalyticsLogger)
- (uint64_t)_sf_didAddFavoriteFromShareSheet;
- (uint64_t)_sf_reportBrowserChoiceNotNow;
- (uint64_t)_sf_reportCapsuleLayoutStyle:()_SFAnalyticsLogger backgroundColorInTabBarEnabled:;
- (uint64_t)_sf_reportPrivateWindowStatus:()_SFAnalyticsLogger;
- (void)_sf_didBeginDownloadWithMIMEType:()_SFAnalyticsLogger uti:downloadType:promptType:browserPersona:;
- (void)_sf_didPerformFormatMenuAction:()_SFAnalyticsLogger provenance:;
- (void)_sf_performExtensionsReportIfNecessaryWithExtensionsController:()_SFAnalyticsLogger;
- (void)_sf_reportBrowserChoice:()_SFAnalyticsLogger;
@end

@implementation WBSAnalyticsLogger(_SFAnalyticsLogger)

- (void)_sf_didBeginDownloadWithMIMEType:()_SFAnalyticsLogger uti:downloadType:promptType:browserPersona:
{
  id v12 = a3;
  id v13 = a4;
  v14 = *(NSObject **)(a1 + (int)*MEMORY[0x1E4F98FD8]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didBeginDownloadWithMIMEType_uti_downloadType_promptType_browserPersona___block_invoke;
  block[3] = &unk_1E5C78390;
  id v18 = v12;
  id v19 = v13;
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  uint64_t v22 = a7;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(v14, block);
}

- (uint64_t)_sf_didAddFavoriteFromShareSheet
{
  return [a1 _sendEvent:@"com.apple.MobileSafari.ShareSheet.AddedFavorite" usingBlock:&__block_literal_global_66];
}

- (void)_sf_performExtensionsReportIfNecessaryWithExtensionsController:()_SFAnalyticsLogger
{
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v6 doubleForKey:@"LastPeriodicExtensionsReportTimePreferenceKey"];
  double v8 = Current - v7;

  if (v8 > 604800.0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke;
    v9[3] = &unk_1E5C72238;
    id v10 = v4;
    uint64_t v11 = a1;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

- (uint64_t)_sf_reportCapsuleLayoutStyle:()_SFAnalyticsLogger backgroundColorInTabBarEnabled:
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __102__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportCapsuleLayoutStyle_backgroundColorInTabBarEnabled___block_invoke;
  v5[3] = &__block_descriptor_41_e19___NSDictionary_8__0l;
  v5[4] = a3;
  char v6 = a4;
  return [a1 _sendEvent:@"com.apple.MobileSafari.CapsuleLayoutStyle" usingBlock:v5];
}

- (void)_sf_didPerformFormatMenuAction:()_SFAnalyticsLogger provenance:
{
  if (a3)
  {
    if (a4)
    {
      uint64_t v6 = a3 - 1;
      if (unint64_t)(a3 - 1) <= 0x2F && ((0xFFFFFFFF7BDFuLL >> v6))
      {
        uint64_t v11 = v4;
        uint64_t v12 = v5;
        double v7 = *(&off_1E5C78480 + v6);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __84__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didPerformFormatMenuAction_provenance___block_invoke;
        v8[3] = &unk_1E5C78420;
        id v9 = v7;
        uint64_t v10 = a4;
        [a1 _sendEvent:@"com.apple.MobileSafari.PerformedFormatMenuAction" usingBlock:v8];
      }
    }
  }
}

- (uint64_t)_sf_reportPrivateWindowStatus:()_SFAnalyticsLogger
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportPrivateWindowStatus___block_invoke;
  v4[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v4[4] = a3;
  return [a1 _sendEvent:@"com.apple.MobileSafari.PrivateWindowStatus" usingBlock:v4];
}

- (uint64_t)_sf_reportBrowserChoiceNotNow
{
  return [a1 _sendEvent:@"com.apple.SafariViewService.BrowserChoice" usingBlock:&__block_literal_global_64_0];
}

- (void)_sf_reportBrowserChoice:()_SFAnalyticsLogger
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportBrowserChoice___block_invoke;
  v6[3] = &unk_1E5C783D8;
  id v7 = v4;
  id v5 = v4;
  [a1 _sendEvent:@"com.apple.SafariViewService.BrowserChoice" usingBlock:v6];
}

@end