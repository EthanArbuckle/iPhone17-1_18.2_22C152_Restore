@interface IMBalloonAppExtension(ImageLoading)
- (id)__ck_breadcrumbImage;
- (id)__ck_generateAssetCatalogImageForInterfaceStyle:()ImageLoading;
- (id)__ck_iconServicesBundleIdentifier;
- (id)__ck_statusImage;
- (id)_generatePlaceholderImageForInterfaceStyle:()ImageLoading;
- (id)_validProxy;
- (uint64_t)__ck_browserImageForInterfaceStyle:()ImageLoading;
- (uint64_t)__ck_browserImageGenerateSynchronously:()ImageLoading interfaceStyle:allowPlaceholder:;
- (uint64_t)__ck_preferIconServices;
- (uint64_t)__ck_tapToRadarBalloonPluginImage;
- (void)__ck_generateStatusImage:()ImageLoading;
@end

@implementation IMBalloonAppExtension(ImageLoading)

- (uint64_t)__ck_preferIconServices
{
  return 0;
}

- (id)__ck_iconServicesBundleIdentifier
{
  v2 = [a1 _validProxy];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 bundleIdentifier];
  }
  else
  {
    v5 = [a1 appBundle];
    v4 = [v5 bundleIdentifier];
  }

  return v4;
}

- (id)__ck_generateAssetCatalogImageForInterfaceStyle:()ImageLoading
{
  v5 = [a1 _validProxy];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 iconForInterfaceStyle:a3];
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v12 = +[CKUIBehavior sharedBehaviors];
  [v12 appIconSize];
  double v14 = v13;

  v15 = [a1 browserImageName];
  v16 = objc_msgSend(v15, "stringByAppendingFormat:", @"_%d", v14);
  v17 = (void *)MEMORY[0x1E4F42A80];
  v18 = [a1 appBundle];
  v19 = [v17 imageNamed:v16 inBundle:v18];

  v7 = [v19 iconForInterfaceStyle:a3];

  if (v7)
  {
LABEL_3:
    v8 = objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:", a3);
    v9 = +[CKBalloonPluginManager sharedInstance];
    v10 = [v9 iconCache];
    [v10 setObject:v7 forKey:v8];
  }
LABEL_4:

  return v7;
}

- (id)_validProxy
{
  v1 = [a1 proxy];
  v2 = [v1 containingBundle];
  v3 = [v2 appState];
  char v4 = [v3 isValid];

  if ((v4 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E4F22458];
    v6 = [v1 bundleIdentifier];
    uint64_t v7 = [v5 pluginKitProxyForIdentifier:v6];

    v1 = (void *)v7;
  }

  return v1;
}

- (id)_generatePlaceholderImageForInterfaceStyle:()ImageLoading
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v0, OS_LOG_TYPE_INFO, "Generate placeholder image", buf, 2u);
    }
  }
  v1 = [MEMORY[0x1E4F42D90] mainScreen];
  [v1 scale];
  uint64_t v3 = v2;

  uint64_t v8 = v3;
  [MEMORY[0x1E4F42A80] _iconVariantForUIApplicationIconFormat:14 scale:&v8];
  uint64_t v4 = LICreateDefaultIcon();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = [MEMORY[0x1E4F42A80] imageWithCGImage:v4];
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)__ck_browserImageForInterfaceStyle:()ImageLoading
{
  return objc_msgSend(a1, "__ck_browserImageGenerateSynchronously:interfaceStyle:allowPlaceholder:", 1, a3, 1);
}

- (uint64_t)__ck_browserImageGenerateSynchronously:()ImageLoading interfaceStyle:allowPlaceholder:
{
  return objc_msgSend(a1, "__ckImageForInterfaceStyle:generateSynchronously:allowPlaceholder:", a4, a3);
}

- (id)__ck_statusImage
{
  uint64_t v2 = [a1 _validProxy];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v2 format:15];
  }
  else
  {
    uint64_t v4 = [a1 browserImageName];
    v5 = objc_msgSend(v4, "stringByAppendingFormat:", @"_%d", 32);

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v7 = [a1 appBundle];
      uint64_t v3 = [v6 badgeIconForImageNamed:v5 inBundle:v7];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return v3;
}

- (void)__ck_generateStatusImage:()ImageLoading
{
  id v4 = a3;
  v5 = [a1 _validProxy];
  if (v5)
  {
    double v17 = 0.0;
    [MEMORY[0x1E4F42A80] _iconVariantForUIApplicationIconFormat:15 scale:&v17];
    LIIconOutputSizeForVariant();
    double v7 = v6;
    double v9 = v8;
    id v10 = objc_alloc(MEMORY[0x1E4F6F258]);
    v11 = objc_msgSend(v10, "initWithSize:scale:", v7, v9, v17);
    [v11 setDrawBorder:1];
    id v12 = objc_alloc(MEMORY[0x1E4F6F248]);
    double v13 = [v5 bundleIdentifier];
    double v14 = (void *)[v12 initWithBundleIdentifier:v13];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__IMBalloonAppExtension_ImageLoading____ck_generateStatusImage___block_invoke;
    v15[3] = &unk_1E5625EC0;
    id v16 = v4;
    [v14 getCGImageForImageDescriptor:v11 completion:v15];
  }
  else
  {
    v11 = objc_msgSend(a1, "__ck_statusImage");
    (*((void (**)(id, void *))v4 + 2))(v4, v11);
  }
}

- (id)__ck_breadcrumbImage
{
  uint64_t v2 = [a1 _validProxy];
  if (v2) {
    [MEMORY[0x1E4F42A80] _iconForResourceProxy:v2 format:16];
  }
  else {
  uint64_t v3 = objc_msgSend(a1, "__ck_statusImage");
  }

  return v3;
}

- (uint64_t)__ck_tapToRadarBalloonPluginImage
{
  return 0;
}

@end