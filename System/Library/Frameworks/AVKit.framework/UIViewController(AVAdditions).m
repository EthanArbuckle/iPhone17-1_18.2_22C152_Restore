@interface UIViewController(AVAdditions)
- (__CFString)avkit_infoPanelKindIdentifier;
- (uint64_t)avkit_isEffectivelyFullScreen;
- (void)avkit_setNeedsUpdatePreferencesIfNeeded;
@end

@implementation UIViewController(AVAdditions)

- (__CFString)avkit_infoPanelKindIdentifier
{
  v0 = @"Custom";
  return @"Custom";
}

- (uint64_t)avkit_isEffectivelyFullScreen
{
  return 0;
}

- (void)avkit_setNeedsUpdatePreferencesIfNeeded
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "avkit_isEffectivelyFullScreen"))
  {
    v2 = [a1 viewIfLoaded];
    v3 = [v2 window];
    v4 = [v3 windowScene];

    v5 = [v4 statusBarManager];
    int v6 = [a1 prefersStatusBarHidden];
    uint64_t v7 = [a1 preferredStatusBarStyle];
    if (v6 != [v5 isStatusBarHidden] || objc_msgSend(v5, "statusBarStyle") != v7)
    {
      [a1 setNeedsStatusBarAppearanceUpdate];
      v8 = _AVLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = "NO";
        *(_DWORD *)v20 = 136315650;
        *(void *)&v20[4] = "-[UIViewController(AVAdditions) avkit_setNeedsUpdatePreferencesIfNeeded]";
        *(void *)&v20[14] = "prefersStatusBarHidden";
        *(_WORD *)&v20[12] = 2080;
        if (v6) {
          v9 = "YES";
        }
        *(_WORD *)&v20[22] = 2080;
        v21 = v9;
        _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s %s %s", v20, 0x20u);
      }
    }
    uint64_t v10 = objc_msgSend(a1, "preferredWhitePointAdaptivityStyle", *(_OWORD *)v20, *(void *)&v20[16]);
    v11 = [v4 _effectiveUIClientSettings];
    uint64_t v12 = [v11 whitePointAdaptivityStyle];

    if (v12 != v10)
    {
      [a1 setNeedsWhitePointAdaptivityStyleUpdate];
      v13 = _AVLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = "NO";
        *(_DWORD *)v20 = 136315650;
        *(void *)&v20[4] = "-[UIViewController(AVAdditions) avkit_setNeedsUpdatePreferencesIfNeeded]";
        *(void *)&v20[14] = "UIWhitePointAdaptivityStyleVideo == preferredWhitePointAdaptivityStyle";
        *(_WORD *)&v20[12] = 2080;
        if (v10 == 3) {
          v14 = "YES";
        }
        *(_WORD *)&v20[22] = 2080;
        v21 = v14;
        _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s %s %s", v20, 0x20u);
      }
    }
    int v15 = objc_msgSend(a1, "prefersHomeIndicatorAutoHidden", *(void *)v20, *(_OWORD *)&v20[8]);
    v16 = [v4 _effectiveUIClientSettings];
    int v17 = [v16 homeIndicatorAutoHidden];

    if (v15 != v17)
    {
      [a1 setNeedsUpdateOfHomeIndicatorAutoHidden];
      v18 = _AVLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = "NO";
        *(_DWORD *)v20 = 136315650;
        *(void *)&v20[4] = "-[UIViewController(AVAdditions) avkit_setNeedsUpdatePreferencesIfNeeded]";
        *(void *)&v20[14] = "prefersHomeIndicatorAutoHidden";
        *(_WORD *)&v20[12] = 2080;
        if (v15) {
          v19 = "YES";
        }
        *(_WORD *)&v20[22] = 2080;
        v21 = v19;
        _os_log_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_DEFAULT, "%s %s %s", v20, 0x20u);
      }
    }
  }
}

@end