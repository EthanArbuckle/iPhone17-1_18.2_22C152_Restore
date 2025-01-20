@interface CTCategories
+ (CTCategories)sharedCategories;
+ (id)supportedWebBrowserBundleIdentifiersForDeviceFamily:(int64_t)a3;
+ (id)systemBlockableBundleIdentifiersForDeviceFamily:(int64_t)a3;
+ (id)systemHiddenBundleIdentifiersForDeviceFamily:(int64_t)a3;
+ (id)systemUnblockableBundleIdentifiersForDeviceFamily:(int64_t)a3;
+ (int64_t)currentIOSDevice;
+ (void)initialize;
- (CTCategories)init;
- (NSArray)availableCategoryIDs;
- (id)bundleIDForPlatform:(id)a3 fromBundleID:(id)a4 platform:(id)a5;
- (void)_emptySharedCache:(id)a3;
- (void)categoriesForBundleIDs:(id)a3 completionHandler:(id)a4;
- (void)categoriesForBundleIDs:(id)a3 platform:(id)a4 completionHandler:(id)a5;
- (void)categoriesForDomainNames:(id)a3 completionHandler:(id)a4;
- (void)categoriesForDomainURLs:(id)a3 completionHandler:(id)a4;
- (void)categoryForBundleID:(id)a3 completionHandler:(id)a4;
- (void)categoryForBundleID:(id)a3 platform:(id)a4 completionHandler:(id)a5;
- (void)categoryForDomainName:(id)a3 completionHandler:(id)a4;
- (void)categoryForDomainURL:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)emptyCache;
- (void)unCategorizedDomainsFromDomains:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation CTCategories

+ (id)systemUnblockableBundleIdentifiersForDeviceFamily:(int64_t)a3
{
  v5 = [MEMORY[0x263EFFA08] set];
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.systempreferences", @"com.apple.finder", @"com.apple.Home", @"com.apple.appleseed.FeedbackAssistant", @"com.apple.SpotlightService", @"com.apple.dock", @"com.apple.Siri", @"com.apple.exposelauncher", @"com.apple.launchpad.launcher", @"com.apple.RaftCode-3", @"com.apple.AccessibilityInspector", @"com.apple.ScreenTimeWidgetApplication", 0);
      goto LABEL_18;
    case 2:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.mobilephone", @"com.apple.Preferences", @"com.apple.TapToRadar", @"com.apple.appleseed.FeedbackAssistant", @"com.apple.Bridge", @"com.apple.Home", @"com.apple.Health", @"com.apple.compass", 0, v17, v18, v19, v20);
      goto LABEL_18;
    case 5:
      uint64_t v13 = [MEMORY[0x263EFFA08] set];
      goto LABEL_19;
    case 6:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.NanoPhone", @"com.apple.NanoSettings", @"com.apple.TapToRadar.watchkitapp", @"com.apple.NanoHome", @"com.apple.NanoCompass.watchkitapp", @"com.apple.NanoSleep.watchkitapp", @"com.apple.NanoNowPlaying", 0, v16, v17, v18, v19, v20);
      uint64_t v13 = LABEL_18:;
      goto LABEL_19;
    default:
      if (a3 == 101)
      {
        uint64_t v13 = objc_msgSend(a1, "systemUnblockableBundleIdentifiersForDeviceFamily:", objc_msgSend(a1, "currentIOSDevice"));
LABEL_19:
        v6 = v5;
        v5 = (void *)v13;
      }
      else
      {
        if (a3 != 102) {
          goto LABEL_21;
        }
        v6 = [a1 systemUnblockableBundleIdentifiersForDeviceFamily:2];
        v7 = [a1 systemUnblockableBundleIdentifiersForDeviceFamily:6];
        v8 = [a1 systemUnblockableBundleIdentifiersForDeviceFamily:1];
        v9 = [a1 systemUnblockableBundleIdentifiersForDeviceFamily:5];
        v10 = [MEMORY[0x263EFF9C0] set];
        v11 = v10;
        if (v6) {
          [v10 unionSet:v6];
        }
        if (v7) {
          [v11 unionSet:v7];
        }
        if (v8) {
          [v11 unionSet:v8];
        }
        if (v9) {
          [v11 unionSet:v9];
        }
        if (v11)
        {
          id v12 = v11;
        }
        else
        {
          id v12 = [MEMORY[0x263EFFA08] set];
        }
        id v15 = v12;

        v5 = v15;
      }

LABEL_21:
      return v5;
  }
}

+ (id)systemBlockableBundleIdentifiersForDeviceFamily:(int64_t)a3
{
  v5 = [MEMORY[0x263EFFA08] set];
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.clock", @"com.apple.Safari", @"com.apple.ist.Radar7", @"com.apple.SystemProfiler", @"com.apple.DemoWebBrowser", 0, v16, v17, v18, v19, v20, v21);
      goto LABEL_18;
    case 2:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.mobiletimer", @"com.apple.Passbook", @"com.apple.findmy", @"com.apple.mobilesafari", @"com.apple.Fitness", @"com.apple.DocumentsApp", @"com.apple.mobileme.fmip1", @"com.apple.mobileme.fmf1", @"com.apple.DemoWebBrowser", 0, v20, v21);
      goto LABEL_18;
    case 5:
      uint64_t v13 = [MEMORY[0x263EFFA08] set];
      goto LABEL_19;
    case 6:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.HeartRate", @"com.apple.NanoHeartRhythm", @"com.apple.ActivityMonitorApp", @"com.apple.NanoAlarm", @"com.apple.DeepBreathing", @"com.apple.NanoStopwatch", @"com.apple.private.NanoTimer", 0x26C49F000, @"com.apple.NanoPassbook", @"com.apple.findmy", @"com.apple.mobileme.fmf1.watchkitapp", 0);
      uint64_t v13 = LABEL_18:;
      goto LABEL_19;
    default:
      if (a3 == 101)
      {
        uint64_t v13 = objc_msgSend(a1, "systemBlockableBundleIdentifiersForDeviceFamily:", objc_msgSend(a1, "currentIOSDevice"));
LABEL_19:
        v6 = v5;
        v5 = (void *)v13;
      }
      else
      {
        if (a3 != 102) {
          goto LABEL_21;
        }
        v6 = [a1 systemBlockableBundleIdentifiersForDeviceFamily:2];
        v7 = [a1 systemBlockableBundleIdentifiersForDeviceFamily:6];
        v8 = [a1 systemBlockableBundleIdentifiersForDeviceFamily:1];
        v9 = [a1 systemBlockableBundleIdentifiersForDeviceFamily:5];
        v10 = [MEMORY[0x263EFF9C0] set];
        v11 = v10;
        if (v6) {
          [v10 unionSet:v6];
        }
        if (v7) {
          [v11 unionSet:v7];
        }
        if (v8) {
          [v11 unionSet:v8];
        }
        if (v9) {
          [v11 unionSet:v9];
        }
        if (v11)
        {
          id v12 = v11;
        }
        else
        {
          id v12 = [MEMORY[0x263EFFA08] set];
        }
        id v15 = v12;

        v5 = v15;
      }

LABEL_21:
      return v5;
  }
}

+ (id)systemHiddenBundleIdentifiersForDeviceFamily:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.SetupAssistant", @"com.apple.MigrateAssistant", @"com.apple.VoiceOverUtility", @"com.apple.SoftwareUpdate", @"com.apple.installer", @"com.apple.bni.AppleNetInstall", @"com.apple.InstallAssistant.Seed.macOS1015Seed1", @"com.apple.InstallAssistant.Catalina", @"com.apple.InstallAssistant.Jazz", @"com.apple.InstallAssistant.macOS1016", @"com.apple.siri", @"com.apple.siri.launcher", @"com.apple.Installer-Progress", @"com.apple.dt.XcodePreviews", @"com.apple.PreviewShellMac", @"com.apple.keychainaccess", @"com.apple.quicklook.QuickLook",
        @"com.apple.VNCGuestRequest",
        @"com.apple.screencaptureui",
        @"com.apple.quicklook.QuickLookUIService",
        @"com.apple.AvatarUI.AvatarPickerMemojiEditor",
        @"com.apple.ScreenSaver.Engine.legacyScreenSaver",
        @"com.apple.Trackpad-Settings.extension",
        @"com.apple.BTMNotificationAgent",
        @"com.apple.notificationcenter.askpermissions",
        @"com.apple.controlcenter.notifications.focus",
        @"com.apple.Mouse-Settings.extension",
        0);
      goto LABEL_18;
    case 2:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.purplebuddy", @"com.apple.SOSBuddy", @"com.apple.ChargingViewService", @"com.apple.Magnifier", @"com.apple.InCallService", @"com.apple.sidecar", @"com.apple.webapp", @"com.apple.BarcodeScanner", @"com.apple.assistivetouchd", @"com.apple.SiriNCService", @"com.apple.SleepLockScreen", @"com.apple.fullkeyboardaccess", @"com.apple.BluetoothUIService", @"com.apple.CarPlayTemplateUIHost", @"com.apple.commandandcontrol", @"com.apple.DeviceOMatic", @"com.apple.EscrowSecurityAlert",
        @"com.apple.SharingViewService",
        @"com.apple.PeopleViewService",
        @"com.apple.PosterBoard",
        @"com.apple.PreviewShell",
        @"com.apple.Memoji",
        0,
        v28,
        v29,
        v30,
        v31,
        v32);
      goto LABEL_18;
    case 5:
      uint64_t v11 = [MEMORY[0x263EFFA08] set];
      goto LABEL_19;
    case 6:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.nanobuddy", @"com.apple.clockface", @"com.apple.NanoDemo", @"com.apple.PreBoard", @"com.apple.ReBoard", @"com.apple.NanoSafari", @"com.apple.PreviewShell", @"com.apple.Mandrake", 0, v14, v15, v16, v17, v18, v19, v20, v21,
        v22,
        v23,
        v24,
        v25,
        v26,
        v27,
        v28,
        v29,
        v30,
        v31,
        v32);
      uint64_t v11 = LABEL_18:;
      goto LABEL_19;
    default:
      if (a3 == 101)
      {
        uint64_t v11 = objc_msgSend(a1, "systemHiddenBundleIdentifiersForDeviceFamily:", objc_msgSend(a1, "currentIOSDevice"));
LABEL_19:
        id v12 = (void *)v11;
      }
      else if (a3 == 102)
      {
        v4 = [a1 systemHiddenBundleIdentifiersForDeviceFamily:2];
        v5 = [a1 systemHiddenBundleIdentifiersForDeviceFamily:6];
        v6 = [a1 systemHiddenBundleIdentifiersForDeviceFamily:1];
        v7 = [a1 systemHiddenBundleIdentifiersForDeviceFamily:5];
        v8 = [MEMORY[0x263EFF9C0] set];
        v9 = v8;
        if (v4) {
          [v8 unionSet:v4];
        }
        if (v5) {
          [v9 unionSet:v5];
        }
        if (v6) {
          [v9 unionSet:v6];
        }
        if (v7) {
          [v9 unionSet:v7];
        }
        if (v9)
        {
          id v10 = v9;
        }
        else
        {
          id v10 = [MEMORY[0x263EFFA08] set];
        }
        id v12 = v10;
      }
      else
      {
        id v12 = 0;
      }
      return v12;
  }
}

+ (void)initialize
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.framework.ctcategories.bundle-id-categories", v2);
  v4 = (void *)_bundle_queue;
  _bundle_queue = (uint64_t)v3;

  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.framework.ctcategories.domain-categories", v7);
  v6 = (void *)_domain_queue;
  _domain_queue = (uint64_t)v5;
}

- (CTCategories)init
{
  v8.receiver = self;
  v8.super_class = (Class)CTCategories;
  v2 = [(CTCategories *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lookupLock = v2->_lookupLock;
    v2->_lookupLock = v3;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __20__CTCategories_init__block_invoke;
    block[3] = &unk_2641D9750;
    v7 = v2;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
  }
  return v2;
}

void __20__CTCategories_init__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087C8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__emptySharedCache_ name:CTCategoriesDidChangeNotification object:0];
}

- (void)dealloc
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__CTCategories_dealloc__block_invoke;
  block[3] = &unk_2641D9750;
  void block[4] = self;
  if (dealloc_onceToken != -1) {
    dispatch_once(&dealloc_onceToken, block);
  }
  v3.receiver = self;
  v3.super_class = (Class)CTCategories;
  [(CTCategories *)&v3 dealloc];
}

void __23__CTCategories_dealloc__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087C8] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32) name:CTCategoriesDidChangeNotification object:0];
}

+ (CTCategories)sharedCategories
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__CTCategories_sharedCategories__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedCategories_onceToken != -1) {
    dispatch_once(&sharedCategories_onceToken, block);
  }
  id v2 = (void *)ctSharedInstance;
  return (CTCategories *)v2;
}

void __32__CTCategories_sharedCategories__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)ctSharedInstance;
  ctSharedInstance = (uint64_t)v1;
  id v5 = v1;

  id v3 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v4 = (void *)_ctSharedCache;
  _ctSharedCache = (uint64_t)v3;
}

- (void)emptyCache
{
}

- (void)_emptySharedCache:(id)a3
{
  [(NSLock *)self->_lookupLock lock];
  [(id)_ctSharedCache removeAllObjects];
  lookupLock = self->_lookupLock;
  [(NSLock *)lookupLock unlock];
}

- (NSArray)availableCategoryIDs
{
  id v2 = +[CTCategory _DHIDtoCategoryDisplayNameMap];
  id v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)bundleIDForPlatform:(id)a3 fromBundleID:(id)a4 platform:(id)a5
{
  return +[CTCategory bundleIDForPlatform:a3 fromBundleID:a4 platform:a5];
}

- (void)categoryForBundleID:(id)a3 platform:(id)a4 completionHandler:(id)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v16[0] = a3;
  v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 arrayWithObjects:v16 count:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__CTCategories_categoryForBundleID_platform_completionHandler___block_invoke;
  v14[3] = &unk_2641D9798;
  id v15 = v8;
  id v13 = v8;
  [(CTCategories *)self categoriesForBundleIDs:v12 platform:v10 completionHandler:v14];
}

void __63__CTCategories_categoryForBundleID_platform_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    id v7 = [a2 allValues];
    v6 = [v7 firstObject];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v6, 0);
  }
}

- (void)categoryForBundleID:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v13[0] = a3;
  id v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a3;
  v9 = [v7 arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__CTCategories_categoryForBundleID_completionHandler___block_invoke;
  v11[3] = &unk_2641D9798;
  id v12 = v6;
  id v10 = v6;
  [(CTCategories *)self categoriesForBundleIDs:v9 platform:@"CTOSPlatformAll" completionHandler:v11];
}

void __54__CTCategories_categoryForBundleID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    id v7 = [a2 allValues];
    id v6 = [v7 firstObject];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v6, 0);
  }
}

- (void)categoriesForBundleIDs:(id)a3 platform:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  id v28 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke;
  v24[3] = &unk_2641D97C0;
  id v14 = v13;
  id v25 = v14;
  id v15 = v12;
  id v26 = v15;
  [v8 enumerateObjectsUsingBlock:v24];
  if ([v15 count])
  {
    uint64_t v16 = (__CFString *)v9;
    uint64_t v17 = v16;
    if (v16 == @"CTOSPlatformCurrent") {
      uint64_t v18 = @"CTOSPlatformiOS";
    }
    else {
      uint64_t v18 = v16;
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke_2;
    v19[3] = &unk_2641D9810;
    id v20 = v14;
    uint64_t v23 = v27;
    uint64_t v21 = v11;
    id v22 = v10;
    +[CTCategory categoryForBundleIdentifiers:v15 platform:v17 withCompletionHandler:v19];
  }
  else
  {
    (*((void (**)(id, id, void))v10 + 2))(v10, v14, 0);
  }

  _Block_object_dispose(v27, 8);
}

void __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_msgSend((id)_ctSharedCache, "objectForKey:");
  if (v3)
  {
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    [*(id *)(a1 + 32) setObject:v3 forKey:v5];
  }
  else
  {
    id v4 = *(id *)(a1 + 40);
    objc_sync_enter(v4);
    [*(id *)(a1 + 40) addObject:v5];
  }
  objc_sync_exit(v4);
}

void __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(void *)(v9 + 40)) {
      goto LABEL_7;
    }
    id v10 = v6;
    id v8 = *(id *)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    [*(id *)(a1 + 32) addEntriesFromDictionary:v5];
    objc_sync_exit(v8);
  }

LABEL_7:
  id v11 = *(void **)(a1 + 32);
  if (v11)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke_3;
    v13[3] = &unk_2641D97E8;
    id v14 = *(id *)(a1 + 40);
    [v11 enumerateKeysAndObjectsUsingBlock:v13];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = *(void *)(a1 + 32);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v12);
}

uint64_t __66__CTCategories_categoriesForBundleIDs_platform_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = a3;
  id v7 = a2;
  [v5 lock];
  [(id)_ctSharedCache setObject:v6 forKey:v7];

  id v8 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v8 unlock];
}

- (void)categoriesForBundleIDs:(id)a3 completionHandler:(id)a4
{
}

- (void)categoryForDomainName:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v13[0] = a3;
  id v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a3;
  uint64_t v9 = [v7 arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__CTCategories_categoryForDomainName_completionHandler___block_invoke;
  v11[3] = &unk_2641D9798;
  id v12 = v6;
  id v10 = v6;
  [(CTCategories *)self categoriesForDomainNames:v9 completionHandler:v11];
}

void __56__CTCategories_categoryForDomainName_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    id v7 = [a2 allValues];
    id v6 = [v7 firstObject];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v6, 0);
  }
}

- (void)categoryForDomainURL:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v12[0] = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__CTCategories_categoryForDomainURL_completionHandler___block_invoke;
  v10[3] = &unk_2641D9798;
  id v11 = v7;
  id v9 = v7;
  [(CTCategories *)self categoriesForDomainURLs:v8 completionHandler:v10];
}

void __55__CTCategories_categoryForDomainURL_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    id v7 = [a2 allValues];
    id v6 = [v7 firstObject];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v6, 0);
  }
}

- (void)categoriesForDomainNames:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[CTCategories categoriesForDomainNames:completionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "START %s :: %ld", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke;
  v24[3] = &unk_2641D97C0;
  id v11 = v10;
  id v25 = v11;
  id v12 = v9;
  id v26 = v12;
  [v6 enumerateObjectsUsingBlock:v24];
  uint64_t v13 = [v12 count];
  id v14 = &_os_log_internal;
  id v15 = &_os_log_internal;
  BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v16)
    {
      uint64_t v17 = [v12 count];
      *(_DWORD *)uint64_t v27 = 134217984;
      uint64_t v28 = v17;
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "categoriesForDomainNames unCachedDomains :%lu", v27, 0xCu);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke_41;
    v19[3] = &unk_2641D9810;
    id v20 = v11;
    uint64_t v23 = buf;
    uint64_t v21 = v8;
    id v22 = v7;
    +[CTCategory categoryForDomainNames:v6 withCompletionHandler:v19];
  }
  else
  {
    if (v16)
    {
      uint64_t v18 = [v11 count];
      *(_DWORD *)uint64_t v27 = 134217984;
      uint64_t v28 = v18;
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "DONE categoriesForDomainNames cachedCategories :%lu", v27, 0xCu);
    }

    (*((void (**)(id, id, void))v7 + 2))(v7, v11, 0);
  }

  _Block_object_dispose(buf, 8);
}

void __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_msgSend((id)_ctSharedCache, "objectForKey:");
  if (v3)
  {
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    [*(id *)(a1 + 32) setObject:v3 forKey:v5];
  }
  else
  {
    id v4 = *(id *)(a1 + 40);
    objc_sync_enter(v4);
    [*(id *)(a1 + 40) addObject:v5];
  }
  objc_sync_exit(v4);
}

void __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(void *)(v7 + 40)) {
      goto LABEL_7;
    }
    id v8 = v6;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    [*(id *)(a1 + 32) addEntriesFromDictionary:v5];
    objc_sync_exit(v9);
  }

LABEL_7:
  if (*(void *)(a1 + 32))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v10;
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "_ctSharedCache add %lu", buf, 0xCu);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke_42;
    v14[3] = &unk_2641D97E8;
    id v11 = *(void **)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    [v11 enumerateKeysAndObjectsUsingBlock:v14];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = v12;
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "DONE categoriesForDomainNames :%lu", buf, 0xCu);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = *(void *)(a1 + 32);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v13);
}

uint64_t __59__CTCategories_categoriesForDomainNames_completionHandler___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = a3;
  id v7 = a2;
  [v5 lock];
  [(id)_ctSharedCache setObject:v6 forKey:v7];

  id v8 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v8 unlock];
}

- (void)categoriesForDomainURLs:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CTCategories categoriesForDomainURLs:completionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "START %s :: %ld", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v32 = __Block_byref_object_copy_;
  uint64_t v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke;
  v24[3] = &unk_2641D9838;
  id v11 = v10;
  id v25 = v11;
  id v12 = v9;
  id v26 = v12;
  [v6 enumerateObjectsUsingBlock:v24];
  uint64_t v13 = [v12 count];
  id v14 = &_os_log_internal;
  id v15 = &_os_log_internal;
  BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v16)
    {
      uint64_t v17 = [v12 count];
      *(_DWORD *)uint64_t v27 = 134217984;
      uint64_t v28 = (const char *)v17;
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "categoriesForDomainURLs unCachedDomainURLs :%lu", v27, 0xCu);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke_44;
    v19[3] = &unk_2641D9810;
    id v20 = v11;
    uint64_t v23 = buf;
    uint64_t v21 = v8;
    id v22 = v7;
    +[CTCategory categoryForDomainURLs:v12 withCompletionHandler:v19];
  }
  else
  {
    if (v16)
    {
      uint64_t v18 = [v11 count];
      *(_DWORD *)uint64_t v27 = 136315394;
      uint64_t v28 = "-[CTCategories categoriesForDomainURLs:completionHandler:]";
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "DONE %s :: cachedCategories %lu", v27, 0x16u);
    }

    (*((void (**)(id, id, void))v7 + 2))(v7, v11, 0);
  }

  _Block_object_dispose(buf, 8);
}

void __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 host];
  if (v3)
  {
    uint64_t v4 = [(id)_ctSharedCache objectForKey:v3];
    if (v4)
    {
      id v5 = (id)v4;
      id v6 = *(id *)(a1 + 32);
      objc_sync_enter(v6);
      [*(id *)(a1 + 32) setObject:v5 forKey:v7];
      objc_sync_exit(v6);
    }
    else
    {
      id v5 = *(id *)(a1 + 40);
      objc_sync_enter(v5);
      [*(id *)(a1 + 40) addObject:v7];
      objc_sync_exit(v5);
    }
  }
}

void __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(void *)(v7 + 40)) {
      goto LABEL_7;
    }
    id v8 = v6;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    [*(id *)(a1 + 32) addEntriesFromDictionary:v5];
    objc_sync_exit(v9);
  }

LABEL_7:
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke_2;
    v12[3] = &unk_2641D9860;
    id v13 = *(id *)(a1 + 40);
    [v10 enumerateKeysAndObjectsUsingBlock:v12];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 136315394;
    id v15 = "-[CTCategories categoriesForDomainURLs:completionHandler:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "DONE %s :: %lu", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __58__CTCategories_categoriesForDomainURLs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = a3;
  id v7 = a2;
  [v5 lock];
  id v8 = (void *)_ctSharedCache;
  id v9 = [v7 host];

  [v8 setObject:v6 forKey:v9];
  id v10 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v10 unlock];
}

- (void)unCategorizedDomainsFromDomains:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "domainOfType:fromDomains:withCompletionHandler:", buf, 2u);
  }
  *(void *)buf = 0;
  id v32 = buf;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy_;
  uint64_t v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v17 = v6;
  id v8 = dispatch_group_create();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * v11);
        dispatch_group_enter(v8);
        id v13 = _domain_queue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke;
        block[3] = &unk_2641D98B0;
        void block[4] = v12;
        id v24 = v7;
        id v26 = buf;
        dispatch_group_t v25 = v8;
        dispatch_group_async(v25, v13, block);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v9);
  }

  id v14 = _domain_queue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke_3;
  v19[3] = &unk_2641D98D8;
  id v21 = v17;
  id v22 = buf;
  id v20 = v7;
  id v15 = v7;
  id v16 = v17;
  dispatch_group_notify(v8, v14, v19);

  _Block_object_dispose(buf, 8);
}

void __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_2641D9888;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v10 = v6;
  +[CTCategory _getCategoryTypeForDomainName:v2 withCompletionHandler:v7];
}

void __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2 != 5001 || v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(void *)(v7 + 40)) {
      goto LABEL_7;
    }
    id v8 = v5;
    id v6 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    objc_sync_exit(v6);
  }

LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __70__CTCategories_unCategorizedDomainsFromDomains_withCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[4];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

+ (id)supportedWebBrowserBundleIdentifiersForDeviceFamily:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.Safari", @"com.apple.DemoWebBrowser", 0);
      goto LABEL_16;
    case 2:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.mobilesafari", @"com.apple.DemoWebBrowser", 0);
      uint64_t v10 = LABEL_16:;
      goto LABEL_17;
    case 5:
    case 6:
      uint64_t v10 = objc_opt_new();
      goto LABEL_17;
    default:
      if (a3 == 101)
      {
        uint64_t v10 = objc_msgSend(a1, "supportedWebBrowserBundleIdentifiersForDeviceFamily:", objc_msgSend(a1, "currentIOSDevice"));
LABEL_17:
        id v9 = (void *)v10;
      }
      else if (a3 == 102)
      {
        uint64_t v4 = [a1 supportedWebBrowserBundleIdentifiersForDeviceFamily:2];
        id v5 = [a1 supportedWebBrowserBundleIdentifiersForDeviceFamily:6];
        id v6 = [a1 supportedWebBrowserBundleIdentifiersForDeviceFamily:1];
        uint64_t v7 = [a1 supportedWebBrowserBundleIdentifiersForDeviceFamily:5];
        id v8 = objc_opt_new();
        id v9 = v8;
        if (v4) {
          [v8 unionSet:v4];
        }
        if (v5) {
          [v9 unionSet:v5];
        }
        if (v6) {
          [v9 unionSet:v6];
        }
        if (v7) {
          [v9 unionSet:v7];
        }
      }
      else
      {
        id v9 = 0;
      }
      return v9;
  }
}

+ (int64_t)currentIOSDevice
{
  uint64_t v2 = (void *)MGCopyAnswer();
  if ([v2 isEqualToString:@"iPhone"])
  {
    int64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"iPad"])
  {
    int64_t v3 = 4;
  }
  else if ([v2 isEqualToString:@"iPod touch"])
  {
    int64_t v3 = 3;
  }
  else
  {
    int64_t v3 = 2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupLock, 0);
  objc_storeStrong((id *)&self->_indexVersionId, 0);
}

@end