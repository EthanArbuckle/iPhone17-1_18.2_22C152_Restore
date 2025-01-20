@interface AXSpringBoardServerHelper
- (id)_gaxWallpaperAssertion;
- (id)_wallpaperStyleAnimationFactoryWithDelay:(double)a3;
- (id)_windowsToHost;
- (id)serverInstance:(id)a3 appIconForBundleID:(id)a4 format:(int)a5;
- (id)serverInstance:(id)a3 appNameForDisplayID:(id)a4;
- (void)_gaxSetWallpaperAssertion:(id)a3;
- (void)animateWallpaperStyleToNormalWithServerInstance:(id)a3;
- (void)animateWallpaperStyleToOriginalWithServerInstance:(id)a3;
- (void)beginRequiringWallpaperWithServerInstance:(id)a3;
- (void)endRequiringWallpaperWithServerInstance:(id)a3;
- (void)quitTopApplicationWithServerInstance:(id)a3;
- (void)serverInstance:(id)a3 activateApp:(id)a4;
- (void)updateLockAndIdleTimersWithServerInstance:(id)a3;
@end

@implementation AXSpringBoardServerHelper

- (id)serverInstance:(id)a3 appIconForBundleID:(id)a4 format:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = a4;
  v9 = +[AXSpringBoardServerHelper _iconController];
  v10 = [v9 safeValueForKey:@"model"];

  if (objc_opt_respondsToSelector())
  {
    char v19 = 0;
    v11 = [v10 applicationIconForBundleIdentifier:v8];
    v12 = __UIAccessibilitySafeClass();

    v13 = +[UIScreen mainScreen];
    [v13 scale];
    uint64_t v15 = v14;

    uint64_t v18 = v15;
    +[UIImage _iconVariantForUIApplicationIconFormat:v5 scale:&v18];
    LIIconOutputSizeForVariant();
    v16 = objc_msgSend(v12, "generateIconImageWithInfo:");
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)serverInstance:(id)a3 appNameForDisplayID:(id)a4
{
  id v4 = a4;
  uint64_t v5 = +[AXSpringBoardServerHelper _applicationController];
  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 applicationWithBundleIdentifier:v4];
    id v7 = [v6 safeValueForKey:@"displayName"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)serverInstance:(id)a3 activateApp:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AXPerformSafeBlock();
}

- (void)quitTopApplicationWithServerInstance:(id)a3
{
}

- (void)updateLockAndIdleTimersWithServerInstance:(id)a3
{
}

- (id)_gaxWallpaperAssertion
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &unk_37A88);
}

- (void)_gaxSetWallpaperAssertion:(id)a3
{
}

- (void)beginRequiringWallpaperWithServerInstance:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSpringBoardServerHelper _wallpaperController];
  v6 = [(AXSpringBoardServerHelper *)self _gaxWallpaperAssertion];
  [v6 invalidate];

  char v16 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_14930;
  uint64_t v14 = sub_14940;
  id v15 = 0;
  id v7 = v5;
  AXPerformSafeBlock();
  id v8 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  v9 = __UIAccessibilityCastAsProtocol();

  if (v16) {
    abort();
  }
  [(AXSpringBoardServerHelper *)self _gaxSetWallpaperAssertion:v9];
}

- (void)endRequiringWallpaperWithServerInstance:(id)a3
{
  id v4 = [(AXSpringBoardServerHelper *)self _gaxWallpaperAssertion];
  [v4 invalidate];

  [(AXSpringBoardServerHelper *)self _gaxSetWallpaperAssertion:0];
}

- (void)animateWallpaperStyleToNormalWithServerInstance:(id)a3
{
  id v4 = +[AXSpringBoardServerHelper _wallpaperController];
  id v3 = v4;
  AXPerformSafeBlock();
}

- (void)animateWallpaperStyleToOriginalWithServerInstance:(id)a3
{
  id v4 = +[AXSpringBoardServerHelper _wallpaperController];
  id v3 = v4;
  AXPerformSafeBlock();
}

- (id)_windowsToHost
{
  v2 = +[NSMutableArray array];
  objc_opt_class();
  id v3 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  id v4 = [v3 safeValueForKey:@"_activeDisplaySwitcherController"];
  id v5 = [v4 safeValueForKey:@"switcherWindow"];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  if (v6)
  {
    [v2 addObject:v6];
  }
  else
  {
    id v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1607C(v7);
    }
  }
  v25 = (void *)v6;
  id v8 = [(id)AXSafeClassFromString() safeValueForKey:@"mainWorkspace"];
  v9 = [v8 safeValueForKey:@"transientOverlayPresentationManager"];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  char v38 = 0;
  objc_opt_class();
  v24 = v9;
  uint64_t v10 = [v9 safeValueForKey:@"_presentersByWindowScene"];
  v11 = __UIAccessibilityCastAsClass();

  uint64_t v12 = [v11 objectEnumerator];

  id obj = v12;
  id v28 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v13;
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v15 = [v14 safeArrayForKey:@"_entities"];
        id v16 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v31;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v31 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              char v38 = 0;
              objc_opt_class();
              v21 = [v20 safeValueForKey:@"window"];
              v22 = __UIAccessibilityCastAsClass();

              if (v38) {
                abort();
              }
              if (v22 && ([v22 isHidden] & 1) == 0) {
                [v2 addObject:v22];
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v17);
        }

        ++v13;
      }
      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v28);
  }

  return v2;
}

- (id)_wallpaperStyleAnimationFactoryWithDelay:(double)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_14930;
  v9 = sub_14940;
  id v10 = 0;
  AXPerformSafeBlock();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

@end