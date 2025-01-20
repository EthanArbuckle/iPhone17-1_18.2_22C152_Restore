@interface IMBalloonPlugin
@end

@implementation IMBalloonPlugin

void __72__IMBalloonPlugin_ImageLoading____ck_placeholderImageForInterfaceStyle___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] placeholderExtensionIcon];
  v1 = (void *)__ck_placeholderImageForInterfaceStyle__placeholderImage;
  __ck_placeholderImageForInterfaceStyle__placeholderImage = v0;
}

void __72__IMBalloonPlugin_ImageLoading____ck_iconServicesIconForInterfaceStyle___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id to = 0;
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(&to);
  v3 = objc_msgSend(v2, "__ck_iconServicesDescriptor");

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v7[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v4 prepareImagesForImageDescriptors:v5];
  }
  objc_destroyWeak(&to);
}

void __99__IMBalloonPlugin_ImageLoading____ckImageForInterfaceStyle_generateSynchronously_allowPlaceholder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)objc_msgSend(WeakRetained, "__ck_generateIconForInterfaceStyle:notify:", *(void *)(a1 + 40), 1);
}

void __76__IMBalloonPlugin_ImageLoading____ck_prefetchBrowserImageForInterfaceStyle___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) identifier];
  v4 = objc_msgSend(*v2, "__ck_generateIconForInterfaceStyle:notify:", *(void *)(a1 + 48), 0);
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Create icon image for app with identifier %@ interface style %ld", buf, 0x16u);
    }
  }
  if (!v4 && IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to generate icon for app with identifier %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__IMBalloonPlugin_ImageLoading____ck_prefetchBrowserImageForInterfaceStyle___block_invoke_160;
  block[3] = &unk_1E5620C40;
  id v9 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__IMBalloonPlugin_ImageLoading____ck_prefetchBrowserImageForInterfaceStyle___block_invoke_160(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Finished prefetching browser icon for key - %@", (uint8_t *)&v6, 0xCu);
    }
  }
  v4 = +[CKBalloonPluginManager sharedInstance];
  v5 = [v4 prefetchIconKeys];
  [v5 removeObject:*(void *)(a1 + 32)];
}

void __50__IMBalloonPlugin_ImageLoading__appStoreBadgeIcon__block_invoke()
{
  uint64_t v0 = objc_msgSend(NSString, "stringWithFormat:", @"AppStoreIcon-%f", 0x4040000000000000);
  v1 = (void *)MEMORY[0x1E4F42A80];
  id v2 = CKFrameworkBundle();
  uint64_t v3 = [v1 badgeIconForImageNamed:v0 inBundle:v2];

  v4 = (void *)appStoreBadgeIcon_sBehavior;
  appStoreBadgeIcon_sBehavior = v3;
}

void __49__IMBalloonPlugin_ImageLoading__recentsBadgeIcon__block_invoke()
{
  uint64_t v0 = objc_msgSend(NSString, "stringWithFormat:", @"RecentsIcon-%f", 0x4040000000000000);
  v1 = (void *)MEMORY[0x1E4F42A80];
  id v2 = CKFrameworkBundle();
  uint64_t v3 = [v1 badgeIconForImageNamed:v0 inBundle:v2];

  v4 = (void *)recentsBadgeIcon_sBehavior;
  recentsBadgeIcon_sBehavior = v3;
}

@end