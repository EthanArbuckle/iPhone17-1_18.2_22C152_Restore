@interface SFWebAppDataProvider
- (BOOL)_isWhiteColor:(id)a3;
- (SFWebAppDataProviderDelegate)delegate;
- (UIViewController)activityViewController;
- (void)_downloadManifestIconWithCompletionHandler:(id)a3;
- (void)_updateManifestValues;
- (void)_updateMonogramIconForWebClip;
- (void)dealloc;
- (void)prepareWithManifestData:(id)a3;
- (void)setContentReadyForDisplay;
- (void)setDelegate:(id)a3;
- (void)updateWebClipIcon:(id)a3;
- (void)updateWithStagedCookiesDirectoryURL:(id)a3 sandboxExtensionToken:(id)a4;
- (void)updateWithWebClipMetadata:(id)a3;
- (void)webClip:(id)a3 iconRequestDidFinishWithImage:(id)a4 precomposed:(BOOL)a5;
- (void)webClip:(id)a3 startupImageRequestDidFinishWithImage:(id)a4;
- (void)webClip:(id)a3 startupLandscapeImageRequestDidFinishWithImage:(id)a4;
- (void)webClipViewController:(id)a3 didFinishWithResult:(BOOL)a4;
@end

@implementation SFWebAppDataProvider

- (void)setContentReadyForDisplay
{
  if (self->_webClipViewController)
  {
    wrappingNavigationController = self->_wrappingNavigationController;
    if (wrappingNavigationController)
    {
      v4 = [(UINavigationController *)wrappingNavigationController topViewController];
      webClipViewController = self->_webClipViewController;

      if (v4 != webClipViewController)
      {
        v6 = self->_wrappingNavigationController;
        v7 = self->_webClipViewController;
        [(UINavigationController *)v6 pushViewController:v7 animated:1];
      }
    }
  }
}

- (void)dealloc
{
  [(_SFWebClipViewController *)self->_webClipViewController setDelegate:0];
  [(UIWebClip *)self->_webClip cancelMediaUpdate];
  [(UIWebClip *)self->_webClip setDelegate:0];
  [(WKWebView *)self->_webView setNavigationDelegate:0];
  [(WKWebView *)self->_webView stopLoading];
  v3.receiver = self;
  v3.super_class = (Class)SFWebAppDataProvider;
  [(SFWebAppDataProvider *)&v3 dealloc];
}

- (UIViewController)activityViewController
{
  wrappingNavigationController = self->_wrappingNavigationController;
  if (!wrappingNavigationController)
  {
    v4 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_webClipViewController];
    v5 = self->_wrappingNavigationController;
    self->_wrappingNavigationController = v4;

    wrappingNavigationController = self->_wrappingNavigationController;
  }

  return (UIViewController *)wrappingNavigationController;
}

- (void)prepareWithManifestData:(id)a3
{
  id v4 = a3;
  v5 = [[_SFWebClipViewController alloc] initWithStyle:1];
  webClipViewController = self->_webClipViewController;
  self->_webClipViewController = v5;

  [(_SFWebClipViewController *)self->_webClipViewController setDelegate:self];
  -[NSDictionary safari_applicationManifestForKey:](v4, @"Manifest");
  v7 = (_WKApplicationManifest *)objc_claimAutoreleasedReturnValue();
  manifest = self->_manifest;
  self->_manifest = v7;

  -[NSDictionary safari_colorForKey:](v4, @"PageThemeColor");
  v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  pageThemeColor = self->_pageThemeColor;
  self->_pageThemeColor = v9;

  -[NSDictionary safari_colorForKey:](v4, @"UnderPageBackgroundColor");
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  underPageBackgroundColor = self->_underPageBackgroundColor;
  self->_underPageBackgroundColor = v11;

  objc_msgSend(v4, "safari_URLForKey:", @"PageURL");
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (UIWebClip *)objc_alloc_init(MEMORY[0x1E4FB1F10]);
  webClip = self->_webClip;
  self->_webClip = v13;

  [(UIWebClip *)self->_webClip setDelegate:self];
  v15 = objc_msgSend(v4, "safari_stringForKey:", @"PageTitle");

  [(UIWebClip *)self->_webClip setTitle:v15];
  [(UIWebClip *)self->_webClip setPageURL:v18];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = [WeakRetained trustedClientBundleIdentifier];

  if ([v17 length] && (objc_opt_respondsToSelector() & 1) != 0) {
    [(UIWebClip *)self->_webClip addTrustedClientBundleIdentifier:v17];
  }
  [(_SFWebClipViewController *)self->_webClipViewController setWebClip:self->_webClip];
}

- (void)updateWithWebClipMetadata:(id)a3
{
  id v4 = a3;
  [(SFWebAppDataProvider *)self setContentReadyForDisplay];
  v5 = objc_msgSend(v4, "safari_dictionaryForKey:", @"MetaAndLinkTags");

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SFWebAppDataProvider_updateWithWebClipMetadata___block_invoke;
  v6[3] = &unk_1E5C74128;
  v6[4] = self;
  +[_SFWebClipMetadataFetcher parseRawMetadataDictionary:v5 consumer:v6];
  [(_SFWebClipViewController *)self->_webClipViewController setCanEditAndSave:1];
  [(_SFWebClipViewController *)self->_webClipViewController updateUIAnimated:0];
  self->_webClipConfigured = 1;
  [(SFWebAppDataProvider *)self _updateManifestValues];
  if (+[_SFFeatureAvailability isHSWADisabled]) {
    [(UIWebClip *)self->_webClip setFullScreen:0];
  }
}

uint64_t __50__SFWebAppDataProvider_updateWithWebClipMetadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) configureWithMetaTags:a2 linkTags:a3];
}

- (void)updateWebClipIcon:(id)a3
{
  id v4 = a3;
  webClip = self->_webClip;
  if (webClip && !self->_touchIcon)
  {
    id v6 = v4;
    [(UIWebClip *)webClip setIconImage:v4 isPrecomposed:0];
    [(_SFWebClipViewController *)self->_webClipViewController updateUIAnimated:1];
    id v4 = v6;
  }
}

- (void)updateWithStagedCookiesDirectoryURL:(id)a3 sandboxExtensionToken:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v7 UTF8String];
  uint64_t v8 = sandbox_extension_consume();
  if (v8 == -1)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SFWebAppDataProvider updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:]((uint64_t)v7, v16);
    }
  }
  else
  {
    uint64_t v9 = v8;
    id v10 = objc_alloc_init(MEMORY[0x1E4F98E00]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __82__SFWebAppDataProvider_updateWithStagedCookiesDirectoryURL_sandboxExtensionToken___block_invoke;
    v23[3] = &__block_descriptor_40_e5_v8__0l;
    v23[4] = v9;
    [v10 setHandler:v23];
    uint64_t v11 = [(UIWebClip *)self->_webClip _sf_stagedCookiesURL];
    v12 = (void *)v11;
    if (v6 && v11)
    {
      v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v22 = 0;
      [v13 copyItemAtURL:v6 toURL:v12 error:&v22];
      id v14 = v22;

      if (v14)
      {
        v15 = WBS_LOG_CHANNEL_PREFIXWebApp();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[SFWebAppDataProvider updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:](v15, v14);
        }
      }
    }
    else
    {
      v17 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = v17;
        v19 = [v6 absoluteString];
        v20 = [v12 absoluteString];
        v21 = [(UIWebClip *)self->_webClip identifier];
        *(_DWORD *)buf = 138543874;
        v25 = v19;
        __int16 v26 = 2114;
        v27 = v20;
        __int16 v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A690B000, v18, OS_LOG_TYPE_ERROR, "Received invalid paths to copy cookies from: %{public}@ to: %{public}@, for web clip with identifier: %{public}@", buf, 0x20u);
      }
    }
  }
}

uint64_t __82__SFWebAppDataProvider_updateWithStagedCookiesDirectoryURL_sandboxExtensionToken___block_invoke()
{
  return sandbox_extension_release();
}

- (void)webClipViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SFWebAppDataProvider *)self delegate];
  [v6 dataProvider:self didFinishWithResult:v4];

  id v7 = [(UIWebClip *)self->_webClip _sf_stagedCookiesURL];
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = [v7 path];
    int v10 = [v8 fileExistsAtPath:v9];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v17 = 0;
      [v11 removeItemAtURL:v7 error:&v17];
      id v12 = v17;

      if (v12)
      {
        v13 = WBS_LOG_CHANNEL_PREFIXWebApp();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SFWebAppDataProvider webClipViewController:didFinishWithResult:]((uint64_t)v7, v13);
        }
      }
    }
  }
  wrappingNavigationController = self->_wrappingNavigationController;
  self->_wrappingNavigationController = 0;

  [(_SFWebClipViewController *)self->_webClipViewController setDelegate:0];
  webClipViewController = self->_webClipViewController;
  self->_webClipViewController = 0;

  [(UIWebClip *)self->_webClip setDelegate:0];
  webClip = self->_webClip;
  self->_webClip = 0;
}

- (void)webClip:(id)a3 iconRequestDidFinishWithImage:(id)a4 precomposed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = (UIWebClip *)a3;
  id v8 = a4;
  if (v8 && self->_webClip == v9)
  {
    [(UIWebClip *)v9 setIconImage:v8 isPrecomposed:v5];
    [(_SFWebClipViewController *)self->_webClipViewController updateUIAnimated:1];
    objc_storeStrong((id *)&self->_touchIcon, a4);
    self->_touchIconPrecomposed = v5;
  }
}

- (void)webClip:(id)a3 startupImageRequestDidFinishWithImage:(id)a4
{
  id v7 = (UIWebClip *)a3;
  id v6 = a4;
  if (v6
    && self->_webClip == v7
    && objc_msgSend(v6, "sf_isLaunchImageSizedForOrientation:includesStatusBar:", 1, 0))
  {
    [(UIWebClip *)v7 setStartupImage:v6];
  }
}

- (void)webClip:(id)a3 startupLandscapeImageRequestDidFinishWithImage:(id)a4
{
  id v7 = (UIWebClip *)a3;
  id v6 = a4;
  if (v6
    && self->_webClip == v7
    && objc_msgSend(v6, "sf_isLaunchImageSizedForOrientation:includesStatusBar:", 4, 0))
  {
    [(UIWebClip *)v7 setStartupLandscapeImage:v6];
  }
}

- (void)_updateManifestValues
{
  v2 = self;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  manifest = self->_manifest;
  if (manifest)
  {
    BOOL v4 = [(_WKApplicationManifest *)manifest safari_name];
    webClip = v2->_webClip;
    if (v4)
    {
      [(UIWebClip *)webClip setTitle:v4];
    }
    else
    {
      id v6 = [(UIWebClip *)webClip title];
      [(UIWebClip *)v2->_webClip setTitle:v6];
    }
    id v7 = [(_WKApplicationManifest *)v2->_manifest startURL];
    id v8 = v2->_webClip;
    if (v7)
    {
      [(UIWebClip *)v8 setPageURL:v7];
    }
    else
    {
      uint64_t v9 = [(UIWebClip *)v8 pageURL];
      [(UIWebClip *)v2->_webClip setPageURL:v9];
    }
    BOOL v10 = [(_WKApplicationManifest *)v2->_manifest displayMode] == 3
       || [(_WKApplicationManifest *)v2->_manifest displayMode] == 2;
    [(UIWebClip *)v2->_webClip setFullScreen:v10];
    uint64_t v11 = [(_WKApplicationManifest *)v2->_manifest icons];
    id v12 = (void *)v11;
    if (v11)
    {
      v35 = (void *)v11;
      v36 = v2;
      id v13 = [(_WKApplicationManifest *)v2->_manifest icons];
      v37 = [MEMORY[0x1E4F1CA48] array];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = v13;
      uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            v19 = [v18 purposes];
            int v20 = [v19 containsObject:&unk_1EFBDEBA8];

            if (v20)
            {
              id v21 = objc_alloc_init(MEMORY[0x1E4FB1F18]);
              id v22 = [v18 src];
              [v21 setUrl:v22];

              [v21 setSiteWide:1];
              [v21 setPrecomposed:0];
              v23 = [v18 sizes];

              if (v23)
              {
                v24 = [v18 sizes];
                v25 = [v24 firstObject];
                __int16 v26 = [v25 componentsSeparatedByString:@"x"];
                v27 = [v26 firstObject];
                uint64_t v28 = [v27 integerValue];

                if (v28) {
                  objc_msgSend(v21, "setBestSize:", (double)v28, (double)v28);
                }
              }
              [v37 addObject:v21];
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v15);
      }

      if ([v37 count]) {
        v29 = v37;
      }
      else {
        v29 = 0;
      }
      uint64_t v30 = v29;

      v2 = v36;
      manifestIcons = v36->_manifestIcons;
      v36->_manifestIcons = v30;

      id v12 = v35;
    }
    else
    {
      v32 = v2->_manifestIcons;
      v2->_manifestIcons = 0;
    }
    v33 = [(_WKApplicationManifest *)v2->_manifest manifestId];
    [(UIWebClip *)v2->_webClip setManifestId:v33];

    [(UIWebClip *)v2->_webClip _sf_setApplicationManifest:v2->_manifest];
  }
  [(_SFWebClipViewController *)v2->_webClipViewController setCanEditAndSave:1];
  [(_SFWebClipViewController *)v2->_webClipViewController updateUIAnimated:0];
  v2->_webClipConfigured = 1;
  touchIcon = v2->_touchIcon;
  if (touchIcon)
  {
    [(UIWebClip *)v2->_webClip setIconImage:touchIcon isPrecomposed:v2->_touchIconPrecomposed];
  }
  else
  {
    [(SFWebAppDataProvider *)v2 _updateMonogramIconForWebClip];
    if (v2->_manifestIcons)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __45__SFWebAppDataProvider__updateManifestValues__block_invoke;
      v39[3] = &unk_1E5C74150;
      v39[4] = v2;
      [(SFWebAppDataProvider *)v2 _downloadManifestIconWithCompletionHandler:v39];
    }
  }
}

uint64_t __45__SFWebAppDataProvider__updateManifestValues__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(*(void *)(result + 32) + 24) setIconImage:a2 isPrecomposed:0];
    objc_super v3 = *(void **)(*(void *)(v2 + 32) + 16);
    return [v3 updateUIAnimated:1];
  }
  return result;
}

- (BOOL)_isWhiteColor:(id)a3
{
  double v7 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  if (![a3 getRed:&v7 green:&v6 blue:&v5 alpha:0]) {
    return 1;
  }
  BOOL v3 = v7 == 1.0;
  if (v6 != 1.0) {
    BOOL v3 = 0;
  }
  return v5 == 1.0 && v3;
}

- (void)_updateMonogramIconForWebClip
{
  if (self->_touchIcon || self->_bestManifestIcon) {
    return;
  }
  webView = self->_webView;
  if (webView)
  {
    BOOL v4 = [(WKWebView *)webView themeColor];
    pageThemeColor = self->_pageThemeColor;
    self->_pageThemeColor = v4;

    double v6 = [(WKWebView *)self->_webView underPageBackgroundColor];
    underPageBackgroundColor = self->_underPageBackgroundColor;
    self->_underPageBackgroundColor = v6;
  }
  v25 = [MEMORY[0x1E4F785A0] defaultIconKeyColor];
  manifest = self->_manifest;
  if (manifest)
  {
    uint64_t v9 = [(_WKApplicationManifest *)manifest themeColor];
    if (v9)
    {
      BOOL v10 = (void *)v9;
      uint64_t v11 = [(_WKApplicationManifest *)self->_manifest themeColor];
      BOOL v12 = [(SFWebAppDataProvider *)self _isWhiteColor:v11];

      if (!v12)
      {
        uint64_t v15 = [(_WKApplicationManifest *)self->_manifest themeColor];
LABEL_18:
        uint64_t v16 = v15;

        id v13 = v16;
        goto LABEL_19;
      }
    }
  }
  if (self->_pageThemeColor && !-[SFWebAppDataProvider _isWhiteColor:](self, "_isWhiteColor:"))
  {
    uint64_t v14 = self->_pageThemeColor;
LABEL_17:
    uint64_t v15 = v14;
    goto LABEL_18;
  }
  if (self->_underPageBackgroundColor && !-[SFWebAppDataProvider _isWhiteColor:](self, "_isWhiteColor:"))
  {
    uint64_t v14 = self->_underPageBackgroundColor;
    goto LABEL_17;
  }
  id v13 = v25;
LABEL_19:
  id v26 = v13;
  if (([(UIColor *)v13 sf_isDarkColor] & 1) == 0)
  {
    uint64_t v17 = objc_msgSend(v26, "sf_darkenedColor");

    id v26 = (id)v17;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F98F10]);
  [MEMORY[0x1E4F785A0] defaultSize];
  objc_msgSend(v18, "setIconSize:");
  v19 = (void *)MEMORY[0x1E4F785A0];
  if (_SFDeviceIsPad()) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 1;
  }
  [v19 fontPointSizeForIconSize:v20];
  objc_msgSend(v18, "setFontSize:");
  [v18 setFontWeight:1];
  [v18 setBackgroundColor:v26];
  [MEMORY[0x1E4F785A0] cornerRadius];
  objc_msgSend(v18, "setCornerRadius:");
  id v21 = (void *)MEMORY[0x1E4F98F18];
  id v22 = [(UIWebClip *)self->_webClip title];
  v23 = [(UIWebClip *)self->_webClip pageURL];
  v24 = [v21 monogramWithTitle:v22 url:v23 monogramConfiguration:v18 shouldRemoveGrammaticalArticles:1];

  [(UIWebClip *)self->_webClip setIconImage:v24 isPrecomposed:1];
  [(_SFWebClipViewController *)self->_webClipViewController updateUIAnimated:1];
}

- (void)_downloadManifestIconWithCompletionHandler:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_bestManifestIcon)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    double v6 = [(NSArray *)self->_manifestIcons safari_maximumUsingComparator:&__block_literal_global_14];
    double v7 = [MEMORY[0x1E4F98BC0] sharedManager];
    id v8 = [v6 url];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__SFWebAppDataProvider__downloadManifestIconWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E5C74198;
    v9[4] = self;
    id v10 = v5;
    [v7 downloadImageWithURL:v8 options:1 completionHandler:v9];
  }
}

uint64_t __67__SFWebAppDataProvider__downloadManifestIconWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 preferringDeviceIconSizes:1];
}

void __67__SFWebAppDataProvider__downloadManifestIconWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  if (*(void *)(v5 + 80)) {
    goto LABEL_2;
  }
  if (!v4)
  {
    [(id)v5 _updateMonogramIconForWebClip];
LABEL_2:
    double v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  objc_storeStrong((id *)(v5 + 48), a2);
  double v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_5:
  v6();
}

- (SFWebAppDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFWebAppDataProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_underPageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pageThemeColor, 0);
  objc_storeStrong((id *)&self->_webClipMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_activityJSController, 0);
  objc_storeStrong((id *)&self->_touchIcon, 0);
  objc_storeStrong((id *)&self->_applicationManifestFetcher, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_manifestIcons, 0);
  objc_storeStrong((id *)&self->_bestManifestIcon, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_webClipViewController, 0);

  objc_storeStrong((id *)&self->_wrappingNavigationController, 0);
}

- (void)updateWithStagedCookiesDirectoryURL:(uint64_t)a1 sandboxExtensionToken:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  int v4 = *__error();
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to consume sandbox extension, Sandbox Extension %@, errno = %d", (uint8_t *)&v5, 0x12u);
}

- (void)updateWithStagedCookiesDirectoryURL:(void *)a1 sandboxExtensionToken:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  int v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to copy staged cookies into webClip's directory %@", (uint8_t *)&v5, 0xCu);
}

- (void)webClipViewController:(uint64_t)a1 didFinishWithResult:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Failed to remove stageCookies at URL %@", (uint8_t *)&v2, 0xCu);
}

@end