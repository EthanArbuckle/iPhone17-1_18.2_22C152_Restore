@interface IMBalloonPlugin(ImageLoading)
+ (id)__ck_appIconFromPayloadDictionary:()ImageLoading pluginBundleID:withCompletionBlock:;
+ (id)__ck_placeholderImageForInterfaceStyle:()ImageLoading;
+ (uint64_t)__ck_appIconFromPayloadDictionary:()ImageLoading withCompletionBlock:;
- (id)__ckImageForInterfaceStyle:()ImageLoading generateSynchronously:allowPlaceholder:;
- (id)__ck_badgeImage;
- (id)__ck_browserImageName:()ImageLoading;
- (id)__ck_cacheKeyForInterfaceStyle:()ImageLoading;
- (id)__ck_cachedAssetCatalogImageForInterfaceStyle:()ImageLoading;
- (id)__ck_generateAssetCatalogImageForInterfaceStyle:()ImageLoading;
- (id)__ck_generateIconForInterfaceStyle:()ImageLoading notify:;
- (id)__ck_iconServicesBundleIdentifier;
- (id)__ck_iconServicesDescriptor;
- (id)__ck_iconServicesIconForInterfaceStyle:()ImageLoading;
- (id)__ck_statusImage;
- (id)__ck_statusImageForTransport;
- (id)__ck_statusJPEGImageDataForTransportWithCompressionFactor:()ImageLoading;
- (id)_scaledImage:()ImageLoading xscale:yscale:;
- (id)appStoreBadgeIcon;
- (id)description;
- (id)recentsBadgeIcon;
- (uint64_t)__ck_browserImageForInterfaceStyle:()ImageLoading;
- (uint64_t)__ck_browserImageGenerateSynchronously:()ImageLoading interfaceStyle:allowPlaceholder:;
- (uint64_t)__ck_preferIconServices;
- (void)__ck_generateStatusImage:()ImageLoading;
- (void)__ck_postImageUpdateNotificationWithImage:()ImageLoading;
- (void)__ck_prefetchBrowserImageForInterfaceStyle:()ImageLoading;
@end

@implementation IMBalloonPlugin(ImageLoading)

- (id)__ck_cacheKeyForInterfaceStyle:()ImageLoading
{
  v4 = [a1 identifier];
  v5 = +[CKPluginImageCacheKey keyWithStringIdentifier:v4 integerIdentifier:a3];

  return v5;
}

- (void)__ck_postImageUpdateNotificationWithImage:()ImageLoading
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"IMBalloonPluginIdentifierKey";
  id v4 = a3;
  v5 = [a1 identifier];
  v10[0] = v5;
  v9[1] = @"IMBalloonPluginExtensionIdentifierKey";
  v6 = [a1 extensionIdentifier];
  v9[2] = @"UpdatedIMBalloonPluginIconKey";
  v10[1] = v6;
  v10[2] = v4;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v8 postNotificationName:*MEMORY[0x1E4F6B870] object:0 userInfo:v7];
}

- (uint64_t)__ck_preferIconServices
{
  return 0;
}

- (id)__ck_iconServicesBundleIdentifier
{
  char v6 = 0;
  id v2 = (id)objc_msgSend(a1, "__ck_browserImageName:", &v6);
  if (v6) {
    CKFrameworkBundle();
  }
  else {
  v3 = [a1 pluginBundle];
  }
  id v4 = [v3 bundleIdentifier];

  return v4;
}

- (id)__ck_iconServicesDescriptor
{
  v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 scale];
  double v2 = v1;

  v3 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2A0]];
  id v4 = +[CKUIBehavior sharedBehaviors];
  [v4 appIconSize];
  objc_msgSend(v3, "setSize:");

  [v3 setScale:v2];
  [v3 setShape:4];

  return v3;
}

+ (id)__ck_placeholderImageForInterfaceStyle:()ImageLoading
{
  if (__ck_placeholderImageForInterfaceStyle__once != -1) {
    dispatch_once(&__ck_placeholderImageForInterfaceStyle__once, &__block_literal_global_88);
  }
  v0 = (void *)__ck_placeholderImageForInterfaceStyle__placeholderImage;

  return v0;
}

- (id)__ck_cachedAssetCatalogImageForInterfaceStyle:()ImageLoading
{
  v5 = +[CKBalloonPluginManager sharedInstance];
  char v6 = [v5 iconCache];

  v7 = objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:", a3);
  v8 = [v6 objectForKey:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)__ck_generateAssetCatalogImageForInterfaceStyle:()ImageLoading
{
  char v13 = 0;
  v5 = objc_msgSend(a1, "__ck_browserImageName:", &v13);
  if (v13) {
    CKFrameworkBundle();
  }
  else {
  char v6 = [a1 pluginBundle];
  }
  v7 = [MEMORY[0x1E4F42A80] imageNamed:v5 inBundle:v6];
  v8 = [v7 iconForInterfaceStyle:a3];

  if (v8)
  {
    id v9 = objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:", a3);
    v10 = +[CKBalloonPluginManager sharedInstance];
    v11 = [v10 iconCache];
    [v11 setObject:v8 forKey:v9];
  }

  return v8;
}

- (id)__ck_iconServicesIconForInterfaceStyle:()ImageLoading
{
  v5 = +[CKBalloonPluginManager sharedInstance];
  char v6 = [v5 iconCache];

  v7 = objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:", a3);
  v8 = [v6 objectForKey:v7];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v8;
  }
  else
  {
    v10 = objc_msgSend(a1, "__ck_iconServicesBundleIdentifier");
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v10];
    id location = 0;
    objc_initWeak(&location, a1);
    v12 = iconGenerationForDisplayQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__IMBalloonPlugin_ImageLoading____ck_iconServicesIconForInterfaceStyle___block_invoke;
    block[3] = &unk_1E5622AB8;
    objc_copyWeak(&v16, &location);
    id v9 = v11;
    id v15 = v9;
    dispatch_async(v12, block);

    [v6 setObject:v9 forKey:v7];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (id)__ck_generateIconForInterfaceStyle:()ImageLoading notify:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "__ck_preferIconServices"))
  {
    v7 = objc_msgSend(a1, "__ck_iconServicesIconForInterfaceStyle:", a3);
    v8 = objc_msgSend(a1, "__ck_iconServicesDescriptor");
    v20[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v7 prepareImagesForImageDescriptors:v9];

    v10 = objc_msgSend(a1, "__ck_iconServicesDescriptor");
    v11 = [v7 imageForDescriptor:v10];

    if (v11 && ([v11 placeholder] & 1) == 0)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:", objc_msgSend(v11, "CGImage"));
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = objc_msgSend(a1, "__ck_generateAssetCatalogImageForInterfaceStyle:", a3);
  }
  if (a4 && v12)
  {
    char v13 = [a1 identifier];
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412546;
        v17 = v13;
        __int16 v18 = 2048;
        uint64_t v19 = a3;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Update icon with new image for app with identifier %@ interface style %ld", (uint8_t *)&v16, 0x16u);
      }
    }
    objc_msgSend(a1, "__ck_postImageUpdateNotificationWithImage:", v12);
  }

  return v12;
}

- (id)__ckImageForInterfaceStyle:()ImageLoading generateSynchronously:allowPlaceholder:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "__ck_preferIconServices"))
  {
    id v9 = objc_msgSend(a1, "__ck_iconServicesDescriptor");
    v10 = objc_msgSend(a1, "__ck_iconServicesIconForInterfaceStyle:", a3);
    v11 = [v10 imageForDescriptor:v9];

    if (!v11)
    {
      v14 = 0;
      goto LABEL_15;
    }
    if (([v11 placeholder] & 1) == 0)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:", objc_msgSend(v11, "CGImage"));
      goto LABEL_14;
    }
    if (a4)
    {
      uint64_t v12 = objc_msgSend(a1, "__ck_generateIconForInterfaceStyle:notify:", a3, 0);
LABEL_14:
      v14 = (void *)v12;
LABEL_15:

      if (v14) {
        goto LABEL_27;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(a1, "__ck_cachedAssetCatalogImageForInterfaceStyle:", a3);
    v14 = (void *)v13;
    if (!v13 && a4)
    {
      v14 = objc_msgSend(a1, "__ck_generateIconForInterfaceStyle:notify:", a3, 0);
      if (v14) {
        goto LABEL_27;
      }
      goto LABEL_19;
    }
    if (v13) {
      goto LABEL_27;
    }
  }
  *(void *)id location = 0;
  objc_initWeak((id *)location, a1);
  id v15 = iconGenerationForDisplayQueue();
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __99__IMBalloonPlugin_ImageLoading____ckImageForInterfaceStyle_generateSynchronously_allowPlaceholder___block_invoke;
  v24 = &unk_1E5625EE8;
  objc_copyWeak(v25, (id *)location);
  v25[1] = a3;
  dispatch_async(v15, &v21);

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)location);
  v14 = 0;
LABEL_19:
  if (a5)
  {
    if (IMOSLoggingEnabled())
    {
      int v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [a1 identifier];
        __int16 v18 = (void *)v17;
        uint64_t v19 = @"NO";
        if (a4) {
          uint64_t v19 = @"YES";
        }
        *(_DWORD *)id location = 138412546;
        *(void *)&location[4] = v17;
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Didn't get an icon for identifier %@ synchronous:%@", location, 0x16u);
      }
    }
    v14 = objc_msgSend(MEMORY[0x1E4F6BC08], "__ck_placeholderImageForInterfaceStyle:", a3, v21, v22, v23, v24);
  }
LABEL_27:

  return v14;
}

- (void)__ck_prefetchBrowserImageForInterfaceStyle:()ImageLoading
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a1, "__ck_cacheKeyForInterfaceStyle:");
  char v6 = +[CKBalloonPluginManager sharedInstance];
  v7 = [v6 iconCache];
  v8 = [v7 objectForKey:v5];

  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v5;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Icon already in cache, not prefetching browser icon key - %@", buf, 0xCu);
      }
LABEL_5:
    }
  }
  else
  {
    v10 = +[CKBalloonPluginManager sharedInstance];
    v11 = [v10 prefetchIconKeys];
    int v12 = [v11 containsObject:v5];

    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (!v13) {
        goto LABEL_18;
      }
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v5;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Icon already prefetching, not prefetching browser icon key - %@", buf, 0xCu);
      }
      goto LABEL_5;
    }
    if (v13)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v5;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Prefetching browser icon for key - %@", buf, 0xCu);
      }
    }
    id v15 = +[CKBalloonPluginManager sharedInstance];
    int v16 = [v15 prefetchIconKeys];
    [v16 addObject:v5];

    if (iconPrefetchQueue_once != -1) {
      dispatch_once(&iconPrefetchQueue_once, &__block_literal_global_214_0);
    }
    uint64_t v17 = iconPrefetchQueue_sQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__IMBalloonPlugin_ImageLoading____ck_prefetchBrowserImageForInterfaceStyle___block_invoke;
    block[3] = &unk_1E5620E38;
    void block[4] = a1;
    uint64_t v20 = a3;
    id v19 = v5;
    dispatch_async(v17, block);
  }
LABEL_18:
}

- (uint64_t)__ck_browserImageForInterfaceStyle:()ImageLoading
{
  return objc_msgSend(a1, "__ck_browserImageGenerateSynchronously:interfaceStyle:allowPlaceholder:", 1, a3, 1);
}

- (uint64_t)__ck_browserImageGenerateSynchronously:()ImageLoading interfaceStyle:allowPlaceholder:
{
  return objc_msgSend(a1, "__ckImageForInterfaceStyle:generateSynchronously:allowPlaceholder:", a4, a3);
}

- (id)__ck_browserImageName:()ImageLoading
{
  v5 = [a1 identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F6CB80]];

  if (v6)
  {
    *a3 = 1;
    v7 = NSString;
    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 appIconSize];
    objc_msgSend(v7, "stringWithFormat:", @"AppStoreIcon-%f", v9);
  }
  else
  {
    v10 = [a1 identifier];
    int v11 = [v10 isEqualToString:@"com.apple.messages.browser.MorePlugin"];

    if (v11)
    {
      *a3 = 1;
      int v12 = NSString;
      v8 = +[CKUIBehavior sharedBehaviors];
      [v8 appIconSize];
      objc_msgSend(v12, "stringWithFormat:", @"MoreIcon-%f", v13);
    }
    else
    {
      v14 = [a1 identifier];
      int v15 = [v14 isEqualToString:@"com.apple.messages.browser.RecentPlugin"];
      uint64_t v16 = __CurrentTestName;

      if ((v15 & 1) == 0 && !v16)
      {
        *a3 = 0;
        uint64_t v17 = +[CKUIBehavior sharedBehaviors];
        [v17 appIconSize];
        double v19 = v18;

        v8 = [a1 browserImageName];
        uint64_t v20 = objc_msgSend(v8, "stringByAppendingFormat:", @"_%d", v19);
        goto LABEL_10;
      }
      *a3 = 1;
      uint64_t v21 = NSString;
      v8 = +[CKUIBehavior sharedBehaviors];
      [v8 appIconSize];
      objc_msgSend(v21, "stringWithFormat:", @"RecentsIcon-%f", v22);
    }
  uint64_t v20 = };
LABEL_10:
  uint64_t v23 = (void *)v20;

  return v23;
}

- (id)__ck_badgeImage
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v2 = [a1 identifier];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F6CB80]];

  if (v3)
  {
    uint64_t v4 = [a1 appStoreBadgeIcon];
LABEL_5:
    id v7 = (id)v4;
    goto LABEL_16;
  }
  v5 = [a1 identifier];
  int v6 = [v5 isEqualToString:@"com.apple.messages.browser.RecentPlugin"];

  if (v6)
  {
    uint64_t v4 = [a1 recentsBadgeIcon];
    goto LABEL_5;
  }
  v8 = [a1 browserImageName];
  uint64_t v9 = objc_msgSend(v8, "stringByAppendingFormat:", @"_%d", 32);

  v10 = +[CKPluginImageCacheKey keyWithStringIdentifier:v9 integerIdentifier:32];
  int v11 = +[CKBalloonPluginManager sharedInstance];
  int v12 = [v11 iconCache];

  uint64_t v13 = [v12 objectForKey:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F42A80];
    int v15 = [a1 pluginBundle];
    id v7 = [v14 badgeIconForImageNamed:v9 inBundle:v15];

    if (v7)
    {
      [v12 setObject:v7 forKey:v10];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = [a1 pluginBundle];
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = v9;
          __int16 v21 = 2112;
          uint64_t v22 = v17;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "IMBalloonPlugin __ck_badgeImage: failed to find an image named: %@ in bundle: %@", buf, 0x16u);
        }
      }
      id v7 = 0;
    }
  }

LABEL_16:

  return v7;
}

- (id)__ck_statusImage
{
  double v2 = [a1 browserImageName];
  int v3 = objc_msgSend(v2, "stringByAppendingFormat:", @"_%d", 32);
  if ([v3 length])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F42A80];
    v5 = [a1 pluginBundle];
    int v6 = [v4 imageNamed:v3 inBundle:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)__ck_generateStatusImage:()ImageLoading
{
  v5 = a3;
  objc_msgSend(a1, "__ck_statusImage");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id))a3)[2](v5, v6);
}

- (id)__ck_statusImageForTransport
{
  double v2 = objc_msgSend(a1, "__ck_statusImage");
  int v3 = [a1 _scaledImage:v2 xscale:1.0 yscale:1.0];

  return v3;
}

- (id)__ck_statusJPEGImageDataForTransportWithCompressionFactor:()ImageLoading
{
  objc_msgSend(a1, "__ck_statusImage");
  int v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    v5 = UIImageJPEGRepresentation(v3, a2);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_scaledImage:()ImageLoading xscale:yscale:
{
  if (a3)
  {
    id v3 = a3;
    [v3 size];
    CGFloat v5 = v4 / 3.0;
    [v3 size];
    v12.width = v5;
    v12.CGFloat height = v7 / 3.0;
    CGFloat height = v12.height;
    UIGraphicsBeginImageContextWithOptions(v12, 1, 1.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(CurrentContext, 0.333333333, 0.333333333);
    objc_msgSend(v3, "drawInRect:", *MEMORY[0x1E4F1DAD8] - v5 * 0.5, *(double *)(MEMORY[0x1E4F1DAD8] + 8) - height * 0.5, v5, height);

    uint64_t v9 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (uint64_t)__ck_appIconFromPayloadDictionary:()ImageLoading withCompletionBlock:
{
  return objc_msgSend(a1, "__ck_appIconFromPayloadDictionary:pluginBundleID:withCompletionBlock:", a3, 0, a4);
}

+ (id)__ck_appIconFromPayloadDictionary:()ImageLoading pluginBundleID:withCompletionBlock:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = IMSanitizedAppIconDataForIMExtensionPayloadAppIconKey();
  int v11 = [MEMORY[0x1E4F42A80] imageWithData:v10];
  if (v11)
  {
    CGSize v12 = IMBalloonExtensionIDWithSuffix();
    if (([v8 isEqualToString:v12] & 1) == 0)
    {
      uint64_t v13 = IMBalloonExtensionIDWithSuffix();
      if (![v8 isEqualToString:v13])
      {
        double v18 = IMBalloonExtensionIDWithSuffix();
        char v19 = [v8 isEqualToString:v18];

        if ((v19 & 1) == 0)
        {
          uint64_t v14 = 15;
          goto LABEL_7;
        }
LABEL_6:
        uint64_t v14 = 0;
LABEL_7:
        int v15 = [v11 _applicationIconImageForFormat:v14 precomposed:1];
        goto LABEL_13;
      }
    }
    goto LABEL_6;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v20 = 134217984;
      uint64_t v21 = [v10 length];
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Failed to generate icon from payloadDictionary, length: %tu", (uint8_t *)&v20, 0xCu);
    }
  }
  int v15 = 0;
LABEL_13:

  return v15;
}

- (id)description
{
  double v2 = NSString;
  uint64_t v3 = objc_opt_class();
  double v4 = [a1 identifier];
  CGFloat v5 = [v2 stringWithFormat:@"%@<%p> : %@", v3, a1, v4];

  return v5;
}

- (id)appStoreBadgeIcon
{
  if (appStoreBadgeIcon_once != -1) {
    dispatch_once(&appStoreBadgeIcon_once, &__block_literal_global_174);
  }
  v0 = (void *)appStoreBadgeIcon_sBehavior;

  return v0;
}

- (id)recentsBadgeIcon
{
  if (recentsBadgeIcon_once != -1) {
    dispatch_once(&recentsBadgeIcon_once, &__block_literal_global_176);
  }
  v0 = (void *)recentsBadgeIcon_sBehavior;

  return v0;
}

@end