@interface _SFSearchEngineInfo
- (BOOL)searchShouldUseSafeSearchTemplate;
- (Class)classForCoder;
@end

@implementation _SFSearchEngineInfo

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (BOOL)searchShouldUseSafeSearchTemplate
{
  if ((isWebFilterEnabled_determinedWebFilterState & 1) == 0)
  {
    if (WebContentAnalysisLibraryCore())
    {
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x2050000000;
      v2 = (void *)getWFUserSettingsClass_softClass;
      uint64_t v12 = getWFUserSettingsClass_softClass;
      if (!getWFUserSettingsClass_softClass)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __getWFUserSettingsClass_block_invoke;
        v8[3] = &unk_1E5C723B0;
        v8[4] = &v9;
        __getWFUserSettingsClass_block_invoke((uint64_t)v8);
        v2 = (void *)v10[3];
      }
      v3 = v2;
      _Block_object_dispose(&v9, 8);
      id v4 = [v3 alloc];
      v5 = NSUserName();
      v6 = (void *)[v4 initWithUserName:v5];

      isWebFilterEnabled_webFilterEnabled = [v6 restrictionType] != 0;
    }
    isWebFilterEnabled_determinedWebFilterState = 1;
  }
  return isWebFilterEnabled_webFilterEnabled;
}

@end