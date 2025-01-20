@interface NSURL(LSURLOverrideAdditions)
- (BOOL)conformsToOverridePatternWithKey:()LSURLOverrideAdditions;
- (BOOL)isiWorkURL;
- (__CFString)iWorkDocumentName;
- (id)fmfURL;
- (id)fmipURL;
- (id)iCloudEmailPrefsURL;
- (id)iTunesStoreURL;
- (id)iWorkApplicationName;
- (id)keynoteLiveURL;
- (id)keynoteLiveURL_noFragment;
- (uint64_t)iCloudSharingURL;
- (uint64_t)iCloudSharingURL_noFragment;
- (uint64_t)mapsURL;
- (uint64_t)photosURL;
@end

@implementation NSURL(LSURLOverrideAdditions)

- (BOOL)conformsToOverridePatternWithKey:()LSURLOverrideAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [a1 absoluteString];
    if (v6)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:@"/var/mobile/Library/Caches/com.apple.itunesstored/url-resolution.plist"];
      v8 = v7;
      if (v7 && ([v7 objectForKey:v4], (v9 = objc_claimAutoreleasedReturnValue()) != 0)
        || (v10 = (LaunchServices::URLOverrides *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:@"/System/Library/CoreServices/iTunesStoreURLPatterns.plist"], (v11 = v10) != 0)&& (-[LaunchServices::URLOverrides objectForKey:](v10, "objectForKey:", v4), v9 = objc_claimAutoreleasedReturnValue(), v11, v9))
      {
        v12 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v9 options:1 error:0];
        BOOL v5 = objc_msgSend(v12, "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL
          || v13 != 0;
      }
      else
      {
        v9 = LaunchServices::URLOverrides::getLog(v10);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138477827;
          id v17 = v4;
          _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEFAULT, "No URL pattern found for key %{private}@", (uint8_t *)&v16, 0xCu);
        }
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (BOOL)isiWorkURL
{
  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v5, a1, 1);
  if (v6 | v7) {
    BOOL v1 = v8 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1 || !LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&v5, &cfstr_Iw.isa))
  {
    BOOL v3 = 0;
  }
  else
  {
    v2 = [v5 fragment];
    BOOL v3 = v2 != 0;
  }
  return v3;
}

- (id)iWorkApplicationName
{
  if (![a1 isiWorkURL])
  {
    unsigned __int8 v6 = 0;
    goto LABEL_16;
  }
  v2 = [a1 fragment];
  BOOL v3 = [v2 componentsSeparatedByString:@"/"];

  if ([v3 count])
  {
    id v4 = [v3 objectAtIndex:0];
    if ([v4 isEqualToString:@"pages"])
    {
      id v5 = @"com.apple.Pages";
    }
    else if ([v4 isEqualToString:@"keynote"])
    {
      id v5 = @"com.apple.Keynote";
    }
    else
    {
      if (![v4 isEqualToString:@"numbers"]) {
        goto LABEL_13;
      }
      id v5 = @"com.apple.Numbers";
    }
    unsigned __int8 v7 = +[LSApplicationWorkspace defaultWorkspace];
    char v8 = [v7 applicationIsInstalled:v5];

    if (v8)
    {
      v9 = +[LSApplicationProxy applicationProxyForIdentifier:v5];
      uint64_t v10 = [v9 localizedName];
LABEL_14:
      unsigned __int8 v6 = (void *)v10;

      goto LABEL_15;
    }
LABEL_13:
    v9 = [v3 objectAtIndex:0];
    uint64_t v10 = [v9 capitalizedString];
    goto LABEL_14;
  }
  unsigned __int8 v6 = 0;
LABEL_15:

LABEL_16:

  return v6;
}

- (__CFString)iWorkDocumentName
{
  if ([a1 isiWorkURL])
  {
    v2 = [a1 fragment];
    BOOL v3 = [v2 componentsSeparatedByString:@"/"];

    if ((unint64_t)[v3 count] < 3)
    {
      id v5 = 0;
    }
    else
    {
      CFStringRef v4 = (const __CFString *)objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "count") - 1);
      id v5 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, &stru_1ECB1A570);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (uint64_t)mapsURL
{
  return 0;
}

- (id)fmfURL
{
  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v3, a1, 1);
  if (v4 | v5 && (_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v1 = +[_LSURLOverride fmfURL:&v3];
  }
  else
  {
    BOOL v1 = 0;
  }

  return v1;
}

- (id)fmipURL
{
  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v3, a1, 1);
  if (v4 | v5 && (_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v1 = +[_LSURLOverride fmipURL:&v3];
  }
  else
  {
    BOOL v1 = 0;
  }

  return v1;
}

- (id)iTunesStoreURL
{
  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v3, a1, 1);
  if (v4 | v5 && (_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v1 = +[_LSURLOverride iTunesStoreURL:&v3];
  }
  else
  {
    BOOL v1 = 0;
  }

  return v1;
}

- (id)iCloudEmailPrefsURL
{
  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)v3, a1, 1);
  if (_os_feature_enabled_impl())
  {
    BOOL v1 = 0;
  }
  else
  {
    BOOL v1 = +[_LSURLOverride iCloudEmailPrefsURL:v3];
  }

  return v1;
}

- (uint64_t)photosURL
{
  return 0;
}

- (id)keynoteLiveURL
{
  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)v3, a1, 1);
  if (_os_feature_enabled_impl())
  {
    BOOL v1 = 0;
  }
  else
  {
    BOOL v1 = +[_LSURLOverride keynoteLiveURL:v3];
  }

  return v1;
}

- (id)keynoteLiveURL_noFragment
{
  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)v3, a1, 1);
  if (_os_feature_enabled_impl())
  {
    BOOL v1 = 0;
  }
  else
  {
    BOOL v1 = +[_LSURLOverride keynoteLiveURL_noFragment:v3];
  }

  return v1;
}

- (uint64_t)iCloudSharingURL
{
  return 0;
}

- (uint64_t)iCloudSharingURL_noFragment
{
  return 0;
}

@end