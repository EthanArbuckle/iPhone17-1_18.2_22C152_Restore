@interface NSURL(SLFacebookURLAdditions)
+ (BOOL)_isBetaSwitchEnabledForKey:()SLFacebookURLAdditions;
+ (id)URLForFacebookGraphAPIWithDomain:()SLFacebookURLAdditions path:;
+ (id)URLForFacebookPageAtPath:()SLFacebookURLAdditions;
+ (id)URLForFacebookRESTMethod:()SLFacebookURLAdditions;
+ (uint64_t)URLForFacebookGraphAPIWithPath:()SLFacebookURLAdditions;
- (BOOL)isAssetURL;
- (uint64_t)isAppStoreURL;
- (uint64_t)isMusicStoreURL;
- (uint64_t)loadingInUIWebViewWillLaunchAnotherApp;
@end

@implementation NSURL(SLFacebookURLAdditions)

+ (BOOL)_isBetaSwitchEnabledForKey:()SLFacebookURLAdditions
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  if (_startObservingPreferenceChanges_once != -1) {
    dispatch_once(&_startObservingPreferenceChanges_once, &__block_literal_global_5);
  }
  v4 = _preferencesQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__NSURL_SLFacebookURLAdditions___isBetaSwitchEnabledForKey___block_invoke;
  v7[3] = &unk_1E6467E38;
  v7[4] = &v8;
  v7[5] = a3;
  dispatch_sync(v4, v7);

  BOOL v5 = [(id)v9[5] integerValue] == 1;
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)URLForFacebookRESTMethod:()SLFacebookURLAdditions
{
  id v4 = a3;
  int v5 = [a1 _isBetaSwitchEnabledForKey:@"SLFacebookRESTAPIShouldUseBeta"];
  v6 = @"api.facebook.com";
  if (v5) {
    v6 = @"api.beta.facebook.com";
  }
  v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = [NSString stringWithFormat:@"https://%@/method/%@", v6, v4];

  v9 = [v7 URLWithString:v8];

  return v9;
}

+ (uint64_t)URLForFacebookGraphAPIWithPath:()SLFacebookURLAdditions
{
  return [MEMORY[0x1E4F1CB10] URLForFacebookGraphAPIWithDomain:0 path:a3];
}

+ (id)URLForFacebookGraphAPIWithDomain:()SLFacebookURLAdditions path:
{
  v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    if ([a1 _isBetaSwitchEnabledForKey:@"SLFacebookGraphAPIShouldUseBeta"]) {
      v6 = @"graph.beta.facebook.com";
    }
    else {
      v6 = @"graph.facebook.com";
    }
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
  v9 = [NSString stringWithFormat:@"https://%@/%@", v6, v7];
  uint64_t v10 = [v8 URLWithString:v9];

  return v10;
}

+ (id)URLForFacebookPageAtPath:()SLFacebookURLAdditions
{
  id v4 = a3;
  int v5 = [a1 _isBetaSwitchEnabledForKey:@"SLFacebookRESTAPIShouldUseBeta"];
  v6 = @"m.facebook.com";
  if (v5) {
    v6 = @"m.beta.facebook.com";
  }
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = [NSString stringWithFormat:@"https://%@/%@", v6, v4];

  v9 = [v7 URLWithString:v8];

  return v9;
}

- (uint64_t)isMusicStoreURL
{
  v2 = [a1 host];
  uint64_t v3 = 1;
  if ([v2 compare:@"itun.es" options:1])
  {
    if ([v2 compare:@"itunes.apple.com" options:1])
    {
      uint64_t v3 = 0;
      goto LABEL_13;
    }
    id v4 = [a1 path];
    uint64_t v5 = [v4 rangeOfString:@"/"];
    if (!v6) {
      goto LABEL_10;
    }
    id v7 = [v4 substringFromIndex:v5 + v6];

    uint64_t v8 = [v7 rangeOfString:@"/"];
    if (!v9)
    {
      uint64_t v3 = 0;
      id v4 = v7;
      goto LABEL_12;
    }
    id v4 = [v7 substringFromIndex:v8 + v9];

    if (([v4 hasPrefix:@"album/"] & 1) != 0
      || ([v4 hasPrefix:@"movie/"] & 1) != 0
      || [v4 hasPrefix:@"tv-season"])
    {
      uint64_t v3 = 1;
    }
    else
    {
LABEL_10:
      uint64_t v3 = 0;
    }
LABEL_12:
  }
LABEL_13:

  return v3;
}

- (uint64_t)isAppStoreURL
{
  v2 = [a1 host];
  uint64_t v3 = 1;
  if ([v2 compare:@"appsto.re" options:1])
  {
    if ([v2 compare:@"itunes.apple.com" options:1])
    {
      uint64_t v3 = 0;
    }
    else
    {
      id v4 = [a1 path];
      uint64_t v5 = [v4 rangeOfString:@"/"];
      if (v6)
      {
        id v7 = [v4 substringFromIndex:v5 + v6];

        uint64_t v8 = [v7 rangeOfString:@"/"];
        if (v9)
        {
          id v4 = [v7 substringFromIndex:v8 + v9];

          uint64_t v3 = [v4 hasPrefix:@"app/"];
        }
        else
        {
          uint64_t v3 = 0;
          id v4 = v7;
        }
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
  }

  return v3;
}

- (BOOL)isAssetURL
{
  v1 = [a1 scheme];
  BOOL v2 = [v1 compare:@"assets-library" options:1] == 0;

  return v2;
}

- (uint64_t)loadingInUIWebViewWillLaunchAnotherApp
{
  uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v4 = [v3 URLOverrideForURL:a1];

  uint64_t v5 = [v4 scheme];
  uint64_t v6 = v5;
  if (v5)
  {
    if (![v5 compare:@"http" options:1]
      || (uint64_t v7 = 1, ![v6 compare:@"https" options:1]))
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }
  _SLLog(v1, 6, @"URL %@ overridden to %@ scheme %@ will launch another app? %d");

  return v7;
}

@end