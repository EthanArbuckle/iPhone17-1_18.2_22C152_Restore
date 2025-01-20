@interface WKNavigationAction(SafariServicesExtras)
- (uint64_t)_sf_allowsExternalRedirectWithoutPrompting;
- (uint64_t)_sf_shouldAskAboutInsecureFormSubmission;
- (uint64_t)_sf_shouldPerformDownload;
- (void)_sf_setAllowsExternalRedirectWithoutPrompting:()SafariServicesExtras;
@end

@implementation WKNavigationAction(SafariServicesExtras)

- (uint64_t)_sf_shouldAskAboutInsecureFormSubmission
{
  if ([a1 navigationType] != 1) {
    return 0;
  }
  if ([a1 _isRedirect])
  {
    v2 = [a1 request];
    v3 = [v2 HTTPMethod];
    char v4 = [v3 isEqualToString:@"GET"];

    if (v4) {
      return 0;
    }
  }
  v5 = [a1 request];
  v6 = [v5 URL];
  int v7 = objc_msgSend(v6, "safari_hasScheme:", @"http");

  if (!v7) {
    return 0;
  }
  v8 = [a1 sourceFrame];
  v9 = [v8 request];
  v10 = [v9 URL];
  uint64_t v11 = objc_msgSend(v10, "safari_hasScheme:", @"https");

  return v11;
}

- (uint64_t)_sf_shouldPerformDownload
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a1 _shouldPerformDownload])
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    v3 = [a1 targetFrame];
    char v4 = [a1 request];
    v5 = [v4 URL];

    if (v3
      && ([v3 isMainFrame] & 1) == 0
      && ([a1 sourceFrame], v6 = objc_claimAutoreleasedReturnValue(), v6, v3 == v6))
    {
      v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
      uint64_t v11 = 1;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v13 = 138739971;
        v14 = v5;
        v10 = "Downloading download-attributed same-frame subframe link to %{sensitive}@";
        goto LABEL_15;
      }
    }
    else
    {
      int v7 = [v2 BOOLForKey:*MEMORY[0x1E4F788D0]];
      v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (!v7)
      {
        if (v9)
        {
          int v13 = 138739971;
          v14 = v5;
          _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_INFO, "Allowing provisional navigation with download attribute to %{sensitive}@", (uint8_t *)&v13, 0xCu);
        }
        uint64_t v11 = 0;
        goto LABEL_16;
      }
      if (v9)
      {
        int v13 = 138739971;
        v14 = v5;
        v10 = "Using download attribute for main frame navigation to %{sensitive}@";
        uint64_t v11 = 1;
LABEL_15:
        _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 0xCu);
        goto LABEL_16;
      }
      uint64_t v11 = 1;
    }
LABEL_16:

    return v11;
  }
  return 0;
}

- (uint64_t)_sf_allowsExternalRedirectWithoutPrompting
{
  v1 = objc_getAssociatedObject(a1, (const void *)allowsExternalRedirectWithoutPromptingKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_sf_setAllowsExternalRedirectWithoutPrompting:()SafariServicesExtras
{
  uint64_t v2 = (const void *)allowsExternalRedirectWithoutPromptingKey;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);
}

@end