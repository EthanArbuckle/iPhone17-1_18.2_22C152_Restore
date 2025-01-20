@interface FMFLocationSharingViewController
- (BOOL)_isFamilyMemberAFollower:(id)a3;
- (BOOL)_isHandleAFollower:(id)a3;
- (BOOL)areMeDeviceInfoLoaded;
- (BOOL)areSpecifiersLoaded;
- (BOOL)isAccessibilitySize;
- (BOOL)isFindMyDeviceOn;
- (BOOL)isMyLocationEnabled;
- (BOOL)meDeviceChangePending;
- (BOOL)noMeDeviceSelected:(id)a3;
- (BOOL)phoneNumberMatches:(id)a3 phone2:(id)a4;
- (BOOL)useFamilyCirclePhotos;
- (BOOL)useFamilyCirclePhotosLoaded;
- (FMFHandle)lastSelectedHandle;
- (FMFLocationSharingViewController)init;
- (NSArray)allFollowersHandles;
- (NSArray)deviceSpecifiers;
- (NSArray)familyMembers;
- (NSArray)familySpecifiers;
- (NSArray)followersHandles;
- (NSArray)followersSpecifiers;
- (NSArray)hashedFamilyDsids;
- (NSMutableDictionary)dsidToFamilyPhoto;
- (NSSet)meDevices;
- (OS_dispatch_queue)specifiersQueue;
- (UIAlertController)genericErrorAlert;
- (id)_defaultSpecifiers;
- (id)_findMyDeviceSpecifiers;
- (id)_findMyDeviceStatus:(id)a3;
- (id)_followerHandleWithHashedDSID:(id)a3;
- (id)_shareSwitchEnabled:(id)a3;
- (id)_specifierForFamilyMember:(id)a3;
- (id)_specifierForHandle:(id)a3;
- (id)allHandlesMatchingABCardForSelectedHandle:(id)a3;
- (id)formatStringForHours:(int64_t)a3 minutes:(int64_t)a4;
- (id)genericAlertController;
- (id)identifierForHandle:(id)a3;
- (id)monogramForHandle:(id)a3;
- (id)offerTimeRemaining:(double)a3;
- (id)reverseString:(id)a3;
- (id)sortedFollowersWithCombinedRecords:(id)a3;
- (id)specifiers;
- (id)stringByKeepingCharacterSet:(id)a3 inString:(id)a4;
- (void)_findMyDeviceSpecifierWasTapped:(id)a3;
- (void)_loadFamilyMemberPhotos;
- (void)_loadFamilyMembers:(BOOL)a3;
- (void)_loadSpecifiers;
- (void)_meDeviceSpecifierWasTapped:(id)a3;
- (void)_pushAddressBookUIForHandle:(id)a3;
- (void)_setShareSwitchEnabled:(id)a3 forSpecifier:(id)a4;
- (void)_showFamilyMemberDetails:(id)a3;
- (void)_showHandleDetails:(id)a3;
- (void)addRemoveActionToContactViewController:(id)a3;
- (void)addShareActionToContactViewController:(id)a3;
- (void)dealloc;
- (void)didReceiveServerError:(id)a3;
- (void)displayAlertController:(id)a3;
- (void)emitNavigationEvent;
- (void)networkReachabilityUpdated:(BOOL)a3;
- (void)reloadSpecifiersOnMainQueue;
- (void)removeFollower:(id)a3;
- (void)saveActiveDeviceSelection;
- (void)setAllFollowersHandles:(id)a3;
- (void)setAreMeDeviceInfoLoaded:(BOOL)a3;
- (void)setAreSpecifiersLoaded:(BOOL)a3;
- (void)setDeviceSpecifiers:(id)a3;
- (void)setDsidToFamilyPhoto:(id)a3;
- (void)setFamilyMembers:(id)a3;
- (void)setFamilySpecifiers:(id)a3;
- (void)setFollowersHandles:(id)a3;
- (void)setFollowersSpecifiers:(id)a3;
- (void)setGenericErrorAlert:(id)a3;
- (void)setHashedFamilyDsids:(id)a3;
- (void)setIsAccessibilitySize:(BOOL)a3;
- (void)setIsFindMyDeviceOn:(BOOL)a3;
- (void)setIsMyLocationEnabled:(BOOL)a3;
- (void)setLastSelectedHandle:(id)a3;
- (void)setMeDeviceChangePending:(BOOL)a3;
- (void)setMeDevices:(id)a3;
- (void)setSpecifiersQueue:(id)a3;
- (void)setUseFamilyCirclePhotos:(BOOL)a3;
- (void)setUseFamilyCirclePhotosLoaded:(BOOL)a3;
- (void)shareMyLocation:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFindMyDeviceStatus;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMFLocationSharingViewController

- (FMFLocationSharingViewController)init
{
  v17.receiver = self;
  v17.super_class = (Class)FMFLocationSharingViewController;
  v2 = [(FMFLocationSharingViewController *)&v17 init];
  if (v2)
  {
    v3 = [(id)*MEMORY[0x263F1D020] preferredContentSizeCategory];
    v2->_isAccessibilitySize = UIContentSizeCategoryIsAccessibilityCategory(v3);

    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.icloud.fmfui.fmflocationsharingviewcontroller.specifiersqueue", v4);
    specifiersQueue = v2->_specifiersQueue;
    v2->_specifiersQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    followersSpecifiers = v2->_followersSpecifiers;
    v2->_followersSpecifiers = (NSArray *)v7;

    uint64_t v9 = objc_opt_new();
    familySpecifiers = v2->_familySpecifiers;
    v2->_familySpecifiers = (NSArray *)v9;

    uint64_t v11 = objc_opt_new();
    deviceSpecifiers = v2->_deviceSpecifiers;
    v2->_deviceSpecifiers = (NSArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    dsidToFamilyPhoto = v2->_dsidToFamilyPhoto;
    v2->_dsidToFamilyPhoto = (NSMutableDictionary *)v13;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_fmipStateChangeNotificationReceived, (CFStringRef)*MEMORY[0x263F3CC80], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (BOOL)useFamilyCirclePhotos
{
  return 1;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F3BA80] sharedInstance];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)FMFLocationSharingViewController;
  [(FMFLocationSharingViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)FMFLocationSharingViewController;
  [(FMFLocationSharingViewController *)&v9 viewDidLoad];
  v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188D1000, v3, OS_LOG_TYPE_DEFAULT, "FMFLocationSharingViewController: viewDidLoad", buf, 2u);
  }

  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  dispatch_queue_t v5 = [v4 localizedStringForKey:@"APP_NAME_TITLE" value:&stru_26CA0AD00 table:@"LocalizableUI"];
  [(FMFLocationSharingViewController *)self setTitle:v5];

  v6 = [(FMFLocationSharingViewController *)self specifiersQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__FMFLocationSharingViewController_viewDidLoad__block_invoke;
  block[3] = &unk_2643438F0;
  block[4] = self;
  dispatch_async(v6, block);
}

void __47__FMFLocationSharingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F3BA80] sharedInstance];
  [v2 setDelegate:v1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FMFLocationSharingViewController;
  [(FMFLocationSharingViewController *)&v9 viewWillAppear:a3];
  objc_super v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2188D1000, v4, OS_LOG_TYPE_DEFAULT, "FMFLocationSharingViewController: viewWillAppear", v8, 2u);
  }

  dispatch_queue_t v5 = [MEMORY[0x263F3B9E8] sharedInstance];
  [v5 startMonitoring];

  [(FMFLocationSharingViewController *)self updateFindMyDeviceStatus];
  [(FMFLocationSharingViewController *)self _loadFamilyMembers:0];
  [(FMFLocationSharingViewController *)self reloadSpecifiers];
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_contactStoreDidChange_ name:@"ContactStoreDidChange" object:0];

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_updateFindMyDeviceStatus name:@"FMFFindMyDeviceStateChanged" object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMFLocationSharingViewController;
  [(FMFLocationSharingViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl(&dword_2188D1000, v4, OS_LOG_TYPE_DEFAULT, "FMFLocationSharingViewController: viewDidAppear", v5, 2u);
  }

  [(FMFLocationSharingViewController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  v15[1] = *MEMORY[0x263EF8340];
  v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.AppleAccount/LOCATION_SHARING"];
  id v4 = objc_alloc(MEMORY[0x263F08DB0]);
  dispatch_queue_t v5 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 bundleURL];
  v8 = (void *)[v4 initWithKey:@"Find My" table:0 locale:v5 bundleURL:v7];

  id v9 = objc_alloc(MEMORY[0x263F08DB0]);
  v10 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  uint64_t v13 = (void *)[v9 initWithKey:@"Apple Account" table:0 locale:v10 bundleURL:v12];

  v15[0] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [(FMFLocationSharingViewController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.findmy" title:v8 localizedNavigationComponents:v14 deepLink:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FMFLocationSharingViewController;
  [(FMFLocationSharingViewController *)&v7 viewWillDisappear:a3];
  id v4 = [MEMORY[0x263F3BA80] sharedInstance];
  [v4 setDelegate:0];

  dispatch_queue_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"ContactStoreDidChange" object:0];

  objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:@"FMFFindMyDeviceStateChanged" object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMFLocationSharingViewController;
  [(FMFLocationSharingViewController *)&v4 viewDidDisappear:a3];
  v3 = [MEMORY[0x263F3B9E8] sharedInstance];
  [v3 stopMonitoring];
}

- (id)specifiers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if ([MEMORY[0x263F3BA80] FMFAllowed])
  {
    if ([(FMFLocationSharingViewController *)self areSpecifiersLoaded])
    {
      objc_super v4 = [(FMFLocationSharingViewController *)self _findMyDeviceSpecifiers];
      [v3 addObjectsFromArray:v4];

      dispatch_queue_t v5 = [(FMFLocationSharingViewController *)self deviceSpecifiers];
      [v3 addObjectsFromArray:v5];

      objc_super v6 = [(FMFLocationSharingViewController *)self familySpecifiers];
      [v3 addObjectsFromArray:v6];

      uint64_t v7 = [(FMFLocationSharingViewController *)self followersSpecifiers];
    }
    else
    {
      if ([(FMFLocationSharingViewController *)self areMeDeviceInfoLoaded])
      {
        v8 = [(FMFLocationSharingViewController *)self _findMyDeviceSpecifiers];
        [v3 addObjectsFromArray:v8];

        id v9 = [(FMFLocationSharingViewController *)self deviceSpecifiers];
        [v3 addObjectsFromArray:v9];

        v10 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        uint64_t v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:15 edit:0];
        [v3 addObject:v10];
        [v3 addObject:v11];

        goto LABEL_9;
      }
      uint64_t v7 = [(FMFLocationSharingViewController *)self _defaultSpecifiers];
    }
  }
  else
  {
    uint64_t v7 = [(FMFLocationSharingViewController *)self _findMyDeviceSpecifiers];
  }
  v10 = (void *)v7;
  [v3 addObjectsFromArray:v7];
LABEL_9:

  v12 = LogCategory_Daemon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = [v3 count];
    _os_log_impl(&dword_2188D1000, v12, OS_LOG_TYPE_DEFAULT, "FMFLocationSharingViewController: specifiers to show %ld", buf, 0xCu);
  }

  uint64_t v13 = (int)*MEMORY[0x263F5FDB8];
  v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v13);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)v3;
  id v15 = v3;

  id v16 = *(id *)((char *)&self->super.super.super.super.super.isa + v13);
  return v16;
}

- (void)_loadFamilyMembers:(BOOL)a3
{
  dispatch_queue_t v5 = [(FMFLocationSharingViewController *)self specifiersQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke;
  v6[3] = &unk_264343968;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F3BA18]) initWithDescription:@"family-follower-display" andTimeout:2.0];
  id v3 = objc_alloc_init(MEMORY[0x263F3BF48]);
  [v3 setForceServerFetch:*(unsigned __int8 *)(a1 + 40)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_2;
  v6[3] = &unk_264343940;
  uint64_t v4 = *(void *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 40);
  v6[4] = v4;
  id v7 = v2;
  id v5 = v2;
  [v3 startRequestWithCompletionHandler:v6];
  [v5 wait];
}

void __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_2_cold_1();
    }
  }
  char v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 members];
    *(_DWORD *)buf = 138412546;
    v25 = v9;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl(&dword_2188D1000, v8, OS_LOG_TYPE_DEFAULT, "Family members received: %@ in circle: %@", buf, 0x16u);
  }
  v10 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = [v5 members];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = [v5 members];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_76;
    v21 = &unk_264343918;
    id v14 = v10;
    id v22 = v14;
    [v13 enumerateObjectsUsingBlock:&v18];

    id v15 = objc_msgSend(v14, "valueForKey:", @"hashedDSID", v18, v19, v20, v21);
    [*(id *)(a1 + 32) setHashedFamilyDsids:v15];
  }
  id v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"appleID" ascending:1];
  v23 = v16;
  objc_super v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  [v10 sortUsingDescriptors:v17];

  [*(id *)(a1 + 32) setFamilyMembers:v10];
  if (*(unsigned char *)(a1 + 48) && [*(id *)(a1 + 32) useFamilyCirclePhotos]) {
    [*(id *)(a1 + 32) _loadFamilyMemberPhotos];
  }
  [*(id *)(a1 + 32) reloadSpecifiersOnMainQueue];
  [*(id *)(a1 + 40) signal];
}

void __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 appleID];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_2188D1000, v4, OS_LOG_TYPE_DEFAULT, "Family member received: %@", (uint8_t *)&v6, 0xCu);
  }
  if (([v3 isMe] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_loadFamilyMemberPhotos
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(FMFLocationSharingViewController *)self familyMembers];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 count];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        id v10 = objc_alloc(MEMORY[0x263F3BF58]);
        uint64_t v11 = [v9 dsid];
        uint64_t v12 = (void *)[v10 initWithFamilyMemberDSID:v11 size:1 localFallback:1];

        [v12 setMonogramDiameter:36.0];
        [v12 setBackgroundType:1];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __59__FMFLocationSharingViewController__loadFamilyMemberPhotos__block_invoke;
        v14[3] = &unk_264343990;
        v14[4] = self;
        v14[5] = v9;
        v14[6] = v19;
        v14[7] = v5;
        [v12 startRequestWithCompletionHandler:v14];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(v19, 8);
}

void __59__FMFLocationSharingViewController__loadFamilyMemberPhotos__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v6 = a4;
  if (v12 && [v12 length])
  {
    uint64_t v7 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v8 = [MEMORY[0x263F1C920] mainScreen];
    [v8 scale];
    id v9 = objc_msgSend(v7, "imageWithData:scale:", v12);

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) dsidToFamilyPhoto];
      uint64_t v11 = [*(id *)(a1 + 40) dsid];
      [v10 setObject:v9 forKeyedSubscript:v11];
    }
  }
  if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *(void *)(a1 + 56)) {
    [*(id *)(a1 + 32) reloadSpecifiersOnMainQueue];
  }
}

- (void)_loadSpecifiers
{
  id v3 = [MEMORY[0x263F3BA80] sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke;
  v4[3] = &unk_264343A58;
  v4[4] = self;
  [v3 getActiveLocationSharingDevice:v4];
}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)*MEMORY[0x263F1D020] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  uint64_t v6 = *MEMORY[0x263F1D600];
  uint64_t v7 = [*(id *)(a1 + 32) specifiersQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_2;
  v10[3] = &unk_264343A30;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v3;
  uint64_t v12 = v8;
  BOOL v14 = IsAccessibilityCategory;
  uint64_t v13 = v6;
  id v9 = v3;
  dispatch_async(v7, v10);
}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_2(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  id v3 = [MEMORY[0x263F3BA80] sharedInstance];
  uint64_t v4 = [v3 getAllDevices];

  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [MEMORY[0x263F3BA80] FMFRestricted] ^ 1;
  if (([MEMORY[0x263F00A60] locationServicesEnabled] & 1) != 0
    || ([v5 isThisDevice] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = v7;
    id v9 = @"SHARE_MY_LOCATION_FOOTER";
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = v7;
    id v9 = @"SHARE_FOOTER_LOC_SVCS_OFF";
  }
  id v10 = [v7 localizedStringForKey:v9 value:&stru_26CA0AD00 table:@"LocalizableUI"];

  v45 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v45 setProperty:v10 forKey:*MEMORY[0x263F600F8]];
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"SHARE_MY_LOCATION" value:&stru_26CA0AD00 table:@"LocalizableUI"];

  v44 = (void *)v12;
  uint64_t v13 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v12 target:*(void *)(a1 + 40) set:sel__setShareSwitchEnabled_forSpecifier_ get:sel__shareSwitchEnabled_ detail:0 cell:6 edit:0];
  BOOL v14 = [NSNumber numberWithBool:v6];
  uint64_t v15 = *MEMORY[0x263F600A8];
  v43 = v13;
  [v13 setProperty:v14 forKey:*MEMORY[0x263F600A8]];

  if ([*(id *)(a1 + 40) meDeviceChangePending])
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      v41 = v10;
      v42 = v4;
      char v19 = v6;
      uint64_t v20 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v51 != v20) {
            objc_enumerationMutation(v16);
          }
          id v22 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ([v22 isThisDevice])
          {
            id v23 = v22;

            id v5 = v23;
            goto LABEL_16;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v18) {
          continue;
        }
        break;
      }
LABEL_16:
      LOBYTE(v6) = v19;
      id v10 = v41;
      uint64_t v4 = v42;
    }
  }
  if (![v4 count])
  {
    uint64_t v28 = v45;
    [v2 addObject:v45];
    goto LABEL_35;
  }
  v24 = [v5 deviceName];

  if (!v24)
  {
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v26 = v25;
    id v27 = @"NOT_SELECTED";
    goto LABEL_25;
  }
  if ([v5 isThisDevice] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 40), "meDeviceChangePending"))
  {
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v26 = v25;
    id v27 = @"THIS_DEVICE_SELECTION";
LABEL_25:
    v29 = [v25 localizedStringForKey:v27 value:&stru_26CA0AD00 table:@"LocalizableUI"];

    goto LABEL_26;
  }
  v29 = [v5 deviceName];
LABEL_26:
  if ([v5 isAutoMeCapable])
  {
    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"AND_WATCHES" value:&stru_26CA0AD00 table:@"LocalizableUI"];
  }
  else
  {
    v31 = 0;
  }
  v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:*(void *)(a1 + 40) set:0 get:0 detail:0 cell:-1 edit:0];
  [v32 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v32 setProperty:v29 forKey:@"ActiveDeviceLinkNameKey"];
  [v32 setProperty:v31 forKey:@"ActiveDeviceLinkDetailsKey"];
  [v32 setProperty:MEMORY[0x263EFFA88] forKey:v15];
  if (*(unsigned char *)(a1 + 56) || v31)
  {
    v33 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  }
  else
  {
    v33 = &unk_26CA0F610;
  }
  [v32 setProperty:v33 forKey:*MEMORY[0x263F602A8]];

  uint64_t v28 = v45;
  [v2 addObject:v45];
  if (v32)
  {
    [v2 addObject:v32];
  }
LABEL_35:
  if (([v5 isThisDevice] & 1) == 0 && (objc_msgSend(*(id *)(a1 + 40), "meDeviceChangePending") & 1) == 0)
  {
    v34 = (void *)MEMORY[0x263F5FC40];
    v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v36 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"CHANGE_ME_DEVICE"];
    v37 = [v35 localizedStringForKey:v36 value:&stru_26CA0AD00 table:@"LocalizableUI"];
    v38 = [v34 preferenceSpecifierNamed:v37 target:*(void *)(a1 + 40) set:0 get:0 detail:0 cell:13 edit:0];

    uint64_t v28 = v45;
    [v38 setButtonAction:sel_saveActiveDeviceSelection];
    [v2 addObject:v38];
  }
  [v2 addObject:v43];
  [*(id *)(a1 + 40) setDeviceSpecifiers:v2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_122;
  block[3] = &unk_2643439B8;
  block[4] = *(void *)(a1 + 40);
  id v49 = v4;
  id v39 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  v40 = [*(id *)(a1 + 40) specifiersQueue];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_2_123;
  v46[3] = &unk_264343968;
  v46[4] = *(void *)(a1 + 40);
  char v47 = v6;
  dispatch_async(v40, v46);
}

uint64_t __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_122(uint64_t a1)
{
  [*(id *)(a1 + 32) setMeDevices:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setAreMeDeviceInfoLoaded:1];
  id v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_2_123(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = objc_opt_new();
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x263F3BA80] sharedInstance];
  uint64_t v6 = [v5 getHandlesFollowingMyLocation];
  uint64_t v7 = [v4 sortedFollowersWithCombinedRecords:v6];
  [*(id *)(a1 + 32) setAllFollowersHandles:v7];

  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"FAMILY_HEADER" value:&stru_26CA0AD00 table:@"LocalizableUI"];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"FAMILY_FOOTER" value:&stru_26CA0AD00 table:@"LocalizableUI"];

  uint64_t v12 = (void *)v9;
  uint64_t v13 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  uint64_t v30 = *MEMORY[0x263F600F8];
  v31 = (void *)v11;
  objc_msgSend(v13, "setProperty:forKey:", v11);
  BOOL v14 = [*(id *)(a1 + 32) familyMembers];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    [v2 addObject:v13];
    id v16 = [*(id *)(a1 + 32) familyMembers];
    uint64_t v17 = (void *)[v16 copy];

    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_3;
    v37[3] = &unk_2643439E0;
    v37[4] = *(void *)(a1 + 32);
    char v39 = *(unsigned char *)(a1 + 40);
    id v38 = v2;
    [v17 enumerateObjectsUsingBlock:v37];
  }
  [*(id *)(a1 + 32) setFamilySpecifiers:v2];
  uint64_t v18 = objc_opt_new();
  char v19 = [MEMORY[0x263EFF980] array];
  uint64_t v20 = [*(id *)(a1 + 32) allFollowersHandles];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_4;
  v33[3] = &unk_264343A08;
  v33[4] = *(void *)(a1 + 32);
  char v36 = *(unsigned char *)(a1 + 40);
  id v21 = v18;
  id v34 = v21;
  id v22 = v19;
  id v35 = v22;
  [v20 enumerateObjectsUsingBlock:v33];

  [*(id *)(a1 + 32) setFollowersHandles:v22];
  id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"FOLLOWERS_HEADER" value:&stru_26CA0AD00 table:@"LocalizableUI"];

  v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v24 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  if ([v21 count])
  {
    [v3 addObject:v25];
    [v3 addObjectsFromArray:v21];
    __int16 v26 = v31;
  }
  else
  {
    __int16 v26 = v31;
    if (![v2 count] && !objc_msgSend(v21, "count"))
    {
      v29 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v27 = [v28 localizedStringForKey:@"NO_FOLLOWERS_HEADER" value:&stru_26CA0AD00 table:@"LocalizableUI"];
      [v29 setProperty:v27 forKey:v30];

      [v3 addObject:v29];
    }
  }
  [*(id *)(a1 + 32) setFollowersSpecifiers:v3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_5;
  block[3] = &unk_2643438F0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _specifierForFamilyMember:a2];
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v4 setProperty:v3 forKey:*MEMORY[0x263F600A8]];

  [*(id *)(a1 + 40) addObject:v4];
}

void __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) hashedFamilyDsids];
  id v4 = [v8 hashedDSID];
  char v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [*(id *)(a1 + 32) _specifierForHandle:v8];
    uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600A8]];

    [*(id *)(a1 + 40) addObject:v6];
    [*(id *)(a1 + 48) addObject:v8];
  }
}

uint64_t __51__FMFLocationSharingViewController__loadSpecifiers__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setAreSpecifiersLoaded:1];
  id v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

- (id)_defaultSpecifiers
{
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"SHARE_MY_LOCATION_FOOTER" value:&stru_26CA0AD00 table:@"LocalizableUI"];

  uint64_t v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v6 setProperty:v5 forKey:*MEMORY[0x263F600F8]];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SHARE_MY_LOCATION" value:&stru_26CA0AD00 table:@"LocalizableUI"];

  uint64_t v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:6 edit:0];
  uint64_t v10 = *MEMORY[0x263F600A8];
  uint64_t v11 = MEMORY[0x263EFFA80];
  [v9 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  uint64_t v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:1 edit:0];
  [v12 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v12 setProperty:v11 forKey:v10];
  [v12 setProperty:&unk_26CA0F610 forKey:*MEMORY[0x263F602A8]];
  uint64_t v13 = [(FMFLocationSharingViewController *)self _findMyDeviceSpecifiers];
  [v3 addObjectsFromArray:v13];

  if ([MEMORY[0x263F3BA80] FMFAllowed])
  {
    [v3 addObject:v6];
    [v3 addObject:v9];
    [v3 addObject:v12];
    BOOL v14 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    uint64_t v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:15 edit:0];
    [v3 addObject:v14];
    [v3 addObject:v15];
  }
  return v3;
}

- (id)_findMyDeviceSpecifiers
{
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v5 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FIND_MY_DEVICE_FOOTER"];
  uint64_t v6 = [v4 localizedStringForKey:v5 value:&stru_26CA0AD00 table:@"LocalizableUI"];

  uint64_t v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v7 setProperty:v6 forKey:*MEMORY[0x263F600F8]];
  id v8 = (void *)MEMORY[0x263F5FC40];
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FIND_MY_DEVICE_SWITCH"];
  uint64_t v11 = [v9 localizedStringForKey:v10 value:&stru_26CA0AD00 table:@"LocalizableUI"];
  uint64_t v12 = [v8 preferenceSpecifierNamed:v11 target:self set:0 get:sel__findMyDeviceStatus_ detail:0 cell:2 edit:0];

  [v12 setControllerLoadAction:sel__findMyDeviceSpecifierWasTapped_];
  [v12 setIdentifier:@"FindMyDevice-Settings"];
  [v3 addObject:v7];
  [v3 addObject:v12];

  return v3;
}

- (id)_findMyDeviceStatus:(id)a3
{
  BOOL v3 = [(FMFLocationSharingViewController *)self isFindMyDeviceOn];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v5 = v4;
  if (v3) {
    uint64_t v6 = @"FIND_MY_DEVICE_ON";
  }
  else {
    uint64_t v6 = @"FIND_MY_DEVICE_OFF";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26CA0AD00 table:@"LocalizableUI"];

  return v7;
}

- (id)sortedFollowersWithCombinedRecords:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __71__FMFLocationSharingViewController_sortedFollowersWithCombinedRecords___block_invoke;
  v15[3] = &unk_264343A80;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v8 = v7;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v15];

  uint64_t v10 = [v9 allValues];
  uint64_t v11 = [v8 setByAddingObjectsFromArray:v10];

  uint64_t v12 = [v11 allObjects];
  uint64_t v13 = [v12 sortedArrayUsingSelector:sel_prettyNameCompare_];

  return v13;
}

void __71__FMFLocationSharingViewController_sortedFollowersWithCombinedRecords___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 identifierForHandle:v4];
  id v6 = (id)v5;
  if (v5) {
    [*(id *)(a1 + 40) setObject:v4 forKey:v5];
  }
  else {
    [*(id *)(a1 + 48) addObject:v4];
  }
}

- (BOOL)noMeDeviceSelected:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isActiveDevice", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (id)_specifierForHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 prettyName];
  uint64_t v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:2 edit:0];
  [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  uint64_t v7 = [(FMFLocationSharingViewController *)self monogramForHandle:v4];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F60140]];

  [v6 setControllerLoadAction:sel__showHandleDetails_];
  BOOL v8 = [MEMORY[0x263F3BA80] sharedInstance];
  id v9 = [v8 getOfferExpirationForHandle:v4 groupId:*MEMORY[0x263F3BA38] callerId:0];

  long long v10 = [MEMORY[0x263F3BA80] sharedInstance];
  long long v11 = [v10 getOfferExpirationForHandle:v4 groupId:*MEMORY[0x263F3BA48] callerId:0];

  long long v12 = [MEMORY[0x263F3BA80] sharedInstance];
  long long v13 = [v12 getOfferExpirationForHandle:v4 groupId:*MEMORY[0x263F3BA40] callerId:0];

  BOOL v14 = [MEMORY[0x263EFF910] date];
  uint64_t v15 = [v14 laterDate:v9];
  id v16 = [v15 laterDate:v11];

  id v17 = [v16 laterDate:v13];

  if ([v14 compare:v17] == -1)
  {
    [v17 timeIntervalSinceNow];
    uint64_t v18 = -[FMFLocationSharingViewController offerTimeRemaining:](self, "offerTimeRemaining:");
    [v6 setProperty:v18 forKey:*MEMORY[0x263F602C8]];
  }
  char v19 = [(id)*MEMORY[0x263F1D020] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v19);

  if (IsAccessibilityCategory)
  {
    id v21 = [NSNumber numberWithDouble:*MEMORY[0x263F1D600]];
  }
  else
  {
    id v21 = &unk_26CA0F610;
  }
  [v6 setProperty:v21 forKey:*MEMORY[0x263F602A8]];

  return v6;
}

- (id)_specifierForFamilyMember:(id)a3
{
  id v4 = (void *)MEMORY[0x263F3BA60];
  id v5 = a3;
  uint64_t v6 = [v5 appleID];
  uint64_t v7 = [v4 handleWithId:v6];

  BOOL v8 = [v5 hashedDSID];
  [v7 setHashedDSID:v8];

  id v9 = [(FMFLocationSharingViewController *)self dsidToFamilyPhoto];
  long long v10 = [v5 dsid];

  long long v11 = [v9 objectForKeyedSubscript:v10];
  long long v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(FMFLocationSharingViewController *)self monogramForHandle:v7];
  }
  BOOL v14 = v13;

  uint64_t v15 = [v7 prettyName];
  id v16 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:2 edit:0];
  [v16 setControllerLoadAction:sel__showFamilyMemberDetails_];
  [v16 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v16 setProperty:v14 forKey:*MEMORY[0x263F60140]];
  if (![(FMFLocationSharingViewController *)self _isFamilyMemberAFollower:v7])
  {
    id v17 = [MEMORY[0x263F1C550] tableCellGrayTextColor];
    [v16 setProperty:v17 forKey:@"PSFollowerDetailsTitleTextColorKey"];

    uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v19 = [v18 localizedStringForKey:@"FAMILY_HIDING" value:&stru_26CA0AD00 table:@"LocalizableUI"];
    [v16 setProperty:v19 forKey:*MEMORY[0x263F602C8]];
  }
  uint64_t v20 = objc_alloc_init(FollowerDetailsLinkCell);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__FMFLocationSharingViewController__specifierForFamilyMember___block_invoke;
  block[3] = &unk_264343AA8;
  __int16 v26 = v20;
  id v21 = v16;
  id v27 = v21;
  uint64_t v28 = self;
  id v22 = v20;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  id v23 = v21;

  return v23;
}

void __62__FMFLocationSharingViewController__specifierForFamilyMember___block_invoke(id *a1)
{
  [a1[4] refreshCellContentsWithSpecifier:a1[5]];
  id v2 = a1[4];
  id v3 = [a1[6] view];
  [v3 bounds];
  objc_msgSend(v2, "sizeThatFits:", v4, 3.40282347e38);
  double v6 = v5;

  if (([a1[6] isAccessibilitySize] & 1) != 0 || v6 > 52.0)
  {
    uint64_t v7 = [NSNumber numberWithDouble:*MEMORY[0x263F1D600]];
  }
  else
  {
    uint64_t v7 = &unk_26CA0F610;
  }
  id v8 = v7;
  [a1[5] setProperty:v7 forKey:*MEMORY[0x263F602A8]];
}

- (id)monogramForHandle:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!monogramForHandle__monogrammer)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFEC28]) initWithStyle:0 diameter:36.0];
    double v5 = (void *)monogramForHandle__monogrammer;
    monogramForHandle__monogrammer = v4;
  }
  double v6 = [v3 recordId];
  uint64_t v7 = (void *)monogramForHandle__monogrammer;
  if (v6)
  {
    id v8 = [MEMORY[0x263F3BA50] sharedInstance];
    id v9 = [MEMORY[0x263EFEC28] descriptorForRequiredKeysIncludingImage:1];
    v14[0] = v9;
    long long v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    long long v11 = [v8 getContactForHandle:v3 keysToFetch:v10];
    long long v12 = [v7 monogramForContact:v11];
  }
  else
  {
    long long v12 = [(id)monogramForHandle__monogrammer silhouetteMonogram];
  }

  return v12;
}

- (id)offerTimeRemaining:(double)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = (uint64_t)a3 / 60 % 60;
  unint64_t v6 = (uint64_t)a3 + 3599;
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = v7;
  if (v6 >= 0x1C1F)
  {
    uint64_t v14 = v4 / 3600;
    uint64_t v15 = [(FMFLocationSharingViewController *)self formatStringForHours:v14 minutes:v5];
    uint64_t v10 = [v8 localizedStringForKey:v15 value:&stru_26CA0AD00 table:@"LocalizableUI"];

    id v16 = [NSNumber numberWithInteger:v14];
    id v17 = FMFLocalizedStringForNumber(v16);

    uint64_t v18 = [NSNumber numberWithInteger:v5];
    char v19 = FMFLocalizedStringForNumber(v18);

    id v13 = objc_msgSend(NSString, "stringWithFormat:", v10, v17, v19);

LABEL_8:
    id v8 = (void *)v10;
    goto LABEL_10;
  }
  if (v5 >= 1)
  {
    if (v5 == 1) {
      id v9 = @"OFFER_TIME_REMAINING_MINUTE";
    }
    else {
      id v9 = @"OFFER_TIME_REMAINING_MINUTES";
    }
    uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_26CA0AD00 table:@"LocalizableUI"];

    long long v11 = [NSNumber numberWithInteger:v5];
    long long v12 = FMFLocalizedStringForNumber(v11);

    id v13 = objc_msgSend(NSString, "stringWithFormat:", v10, v12);

    goto LABEL_8;
  }
  id v13 = [v7 localizedStringForKey:@"OFFER_TIME_REMAINING_LESS_THAN_A_MINUTE" value:&stru_26CA0AD00 table:@"LocalizableUI"];
LABEL_10:

  return v13;
}

- (id)formatStringForHours:(int64_t)a3 minutes:(int64_t)a4
{
  if (a3 >= 2 && a4 > 1) {
    return @"OFFER_TIME_REMAINING_HOURS_MINUTES";
  }
  if (a3 == 1 && a4 > 1) {
    return @"OFFER_TIME_REMAINING_HOUR_MINUTES";
  }
  if (a4 != 1 || a3 <= 1) {
    return @"OFFER_TIME_REMAINING_HOUR_MINUTE";
  }
  else {
    return @"OFFER_TIME_REMAINING_HOURS_MINUTE";
  }
}

- (void)_setShareSwitchEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  unint64_t v6 = [MEMORY[0x263F3BA80] sharedInstance];
  int v7 = [v5 BOOLValue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__FMFLocationSharingViewController__setShareSwitchEnabled_forSpecifier___block_invoke;
  v10[3] = &unk_264343AD0;
  uint64_t v8 = v7 ^ 1u;
  void v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [v6 setHideMyLocationEnabled:v8 completion:v10];
}

void __72__FMFLocationSharingViewController__setShareSwitchEnabled_forSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = LogCategory_Daemon();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__FMFLocationSharingViewController__setShareSwitchEnabled_forSpecifier___block_invoke_cold_1();
    }

    unint64_t v6 = *(void **)(a1 + 32);
    id v5 = [v6 genericAlertController];
    [v6 displayAlertController:v5];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_INFO, "Preferences setHideMyLocationEnabled: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) reloadSpecifiersOnMainQueue];
}

- (id)genericAlertController
{
  id v2 = [MEMORY[0x263F3B9E8] sharedInstance];
  char v3 = [v2 isNetworkUp];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F1C3F8];
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v6 = [v5 localizedStringForKey:@"GENERIC_ALERT_TITLE" value:&stru_26CA0AD00 table:@"LocalizableUI"];
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v8 = [v7 localizedStringForKey:@"GENERIC_ALERT_TEXT" value:&stru_26CA0AD00 table:@"LocalizableUI"];
    id v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

    uint64_t v10 = (void *)MEMORY[0x263F1C3F0];
    id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v12 = [v11 localizedStringForKey:@"OK_BUTTON" value:&stru_26CA0AD00 table:@"LocalizableUI"];
    id v13 = [v10 actionWithTitle:v12 style:1 handler:0];
    [v9 addAction:v13];
  }
  else
  {
    id v9 = +[FMFNoNetworkAlert newAlertController];
  }
  return v9;
}

- (void)displayAlertController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__FMFLocationSharingViewController_displayAlertController___block_invoke;
  v6[3] = &unk_2643439B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __59__FMFLocationSharingViewController_displayAlertController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) genericErrorAlert];
  if (!v2
    || (char v3 = (void *)v2,
        [*(id *)(a1 + 32) presentedViewController],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    [*(id *)(a1 + 32) setGenericErrorAlert:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 genericErrorAlert];
    [v5 presentViewController:v6 animated:1 completion:0];
  }
}

- (id)_shareSwitchEnabled:(id)a3
{
  BOOL v3 = [(FMFLocationSharingViewController *)self isMyLocationEnabled];
  id v4 = NSNumber;
  return (id)[v4 numberWithBool:v3];
}

- (void)_showHandleDetails:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FMFLocationSharingViewController *)self followersSpecifiers];
  uint64_t v6 = [v5 indexOfObject:v4] - 1;

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FMFLocationSharingViewController _showHandleDetails:]();
    }
  }
  else
  {
    int v8 = [(FMFLocationSharingViewController *)self followersHandles];
    id v7 = [v8 objectAtIndex:v6];

    [(FMFLocationSharingViewController *)self setLastSelectedHandle:v7];
    id v9 = LogCategory_Daemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v7 identifier];
      int v11 = 138412290;
      long long v12 = v10;
      _os_log_impl(&dword_2188D1000, v9, OS_LOG_TYPE_DEFAULT, "_showHandleDetails: %@", (uint8_t *)&v11, 0xCu);
    }
    [(FMFLocationSharingViewController *)self _pushAddressBookUIForHandle:v7];
  }
}

- (void)_showFamilyMemberDetails:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = [a3 identifier];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(FMFLocationSharingViewController *)self familyMembers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v11 = (void *)MEMORY[0x263F3BA60];
        long long v12 = [v10 appleID];
        uint64_t v13 = [v11 handleWithId:v12];

        uint64_t v14 = [v13 prettyName];
        if ([v4 isEqualToString:v14])
        {
          uint64_t v15 = (void *)MEMORY[0x263F3BA60];
          id v16 = [v10 appleID];
          id v17 = [v10 dsid];
          uint64_t v18 = [v15 familyHandleWithId:v16 dsid:v17];

          char v19 = [v10 hashedDSID];
          [v18 setHashedDSID:v19];

          [(FMFLocationSharingViewController *)self setLastSelectedHandle:v18];
          uint64_t v20 = LogCategory_Daemon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v18 identifier];
            id v22 = [v18 hashedDSID];
            *(_DWORD *)buf = 138412546;
            uint64_t v28 = v21;
            __int16 v29 = 2112;
            uint64_t v30 = v22;
            _os_log_impl(&dword_2188D1000, v20, OS_LOG_TYPE_DEFAULT, "_showFamilyMemberDetails: %@ %@", buf, 0x16u);
          }
          [(FMFLocationSharingViewController *)self _pushAddressBookUIForHandle:v18];

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_pushAddressBookUIForHandle:(id)a3
{
  v73[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(FMFLocationSharingViewController *)self _isHandleAFollower:v4];
  uint64_t v6 = [v4 identifier];
  BOOL IsEmail = FMFSMLStringIsEmail(v6);

  int v7 = [v4 isFamilyMember];
  uint64_t v8 = [v4 recordId];

  if (v8)
  {
    [MEMORY[0x263F3BA50] sharedInstance];
    id v9 = v55 = v5;
    uint64_t v10 = [MEMORY[0x263EFEBF0] descriptorForRequiredKeys];
    int v11 = (void *)*MEMORY[0x263EFDF80];
    v73[0] = v10;
    v73[1] = v11;
    long long v12 = (void *)*MEMORY[0x263EFE070];
    v73[2] = *MEMORY[0x263EFE070];
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:3];
    id v14 = [v9 getContactForHandle:v4 keysToFetch:v13];

    BOOL v5 = v55;
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x263EFEBF0] viewControllerForContact:v14];
      [v15 setAllowsActions:0];
      id v16 = [(FMFLocationSharingViewController *)self allHandlesMatchingABCardForSelectedHandle:v4];
      if ([v16 count] == 1) {
        int v17 = 1;
      }
      else {
        int v17 = v7;
      }
      if (v17 != 1) {
        goto LABEL_45;
      }
      id v18 = v12;
      char v19 = v18;
      if (IsEmail)
      {
        v57 = v15;
        id v20 = v11;

        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v21 = [v14 emailAddresses];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v63 objects:v72 count:16];
        if (!v22)
        {
          uint64_t v30 = 0;
LABEL_44:

          [v15 highlightPropertyWithKey:v20 identifier:v30];
LABEL_45:
          v48 = [v15 contentViewController];
          if (v5) {
            [(FMFLocationSharingViewController *)self addRemoveActionToContactViewController:v48];
          }
          else {
            [(FMFLocationSharingViewController *)self addShareActionToContactViewController:v48];
          }

          id v49 = LogCategory_Daemon();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v70 = v14;
            _os_log_impl(&dword_2188D1000, v49, OS_LOG_TYPE_DEFAULT, "_pushAddressBookUIForHandle: %@", buf, 0xCu);
          }

          v37 = [(FMFLocationSharingViewController *)self navigationController];
          id v38 = v37;
          char v39 = v15;
          goto LABEL_51;
        }
        uint64_t v23 = v22;
        id v50 = v20;
        long long v51 = v16;
        id v53 = v14;
        uint64_t v24 = *(void *)v64;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v64 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            id v27 = [v26 value];
            uint64_t v28 = [v4 identifier];
            int v29 = [v27 isEqualToString:v28];

            if (v29)
            {
              uint64_t v30 = [v26 identifier];
              goto LABEL_38;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v63 objects:v72 count:16];
          if (v23) {
            continue;
          }
          break;
        }
        uint64_t v30 = 0;
LABEL_38:
        id v16 = v51;
        id v14 = v53;
        uint64_t v15 = v57;
        BOOL v5 = v55;
      }
      else
      {
        id v50 = v18;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v21 = [v14 phoneNumbers];
        uint64_t v40 = [v21 countByEnumeratingWithState:&v59 objects:v71 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          long long v52 = v16;
          id v54 = v14;
          v58 = v15;
          uint64_t v42 = *(void *)v60;
          while (2)
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v60 != v42) {
                objc_enumerationMutation(v21);
              }
              v44 = [*(id *)(*((void *)&v59 + 1) + 8 * j) value];
              v45 = [v44 stringValue];
              v46 = [v4 identifier];
              BOOL v47 = [(FMFLocationSharingViewController *)self phoneNumberMatches:v45 phone2:v46];

              if (v47)
              {
                uint64_t v30 = [v4 identifier];

                goto LABEL_40;
              }
            }
            uint64_t v41 = [v21 countByEnumeratingWithState:&v59 objects:v71 count:16];
            if (v41) {
              continue;
            }
            break;
          }
          uint64_t v30 = 0;
LABEL_40:
          id v20 = v50;
          id v16 = v52;
          id v14 = v54;
          uint64_t v15 = v58;
          BOOL v5 = v55;
          goto LABEL_44;
        }
        uint64_t v30 = 0;
      }
      id v20 = v50;
      goto LABEL_44;
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFEAF0]);
  uint64_t v15 = [v4 identifier];
  if (v15)
  {
    if (IsEmail)
    {
      id v31 = objc_alloc(MEMORY[0x263EFEAD0]);
      uint64_t v32 = (void *)[v31 initWithLabel:*MEMORY[0x263EFE8C0] value:v15];
      v68 = v32;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v68 count:1];
      [v14 setEmailAddresses:v33];
    }
    else
    {
      uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v15];
      if (!v32)
      {
LABEL_23:

        goto LABEL_24;
      }
      id v34 = objc_alloc(MEMORY[0x263EFEAD0]);
      v33 = (void *)[v34 initWithLabel:*MEMORY[0x263EFE8C0] value:v32];
      v67 = v33;
      id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
      [v14 setPhoneNumbers:v35];
    }
    goto LABEL_23;
  }
LABEL_24:
  id v16 = [MEMORY[0x263EFEBF0] viewControllerForUnknownContact:v14];
  [v16 setAllowsActions:0];
  char v36 = [v16 contentViewController];
  if (v5) {
    [(FMFLocationSharingViewController *)self addRemoveActionToContactViewController:v36];
  }
  else {
    [(FMFLocationSharingViewController *)self addShareActionToContactViewController:v36];
  }

  v37 = [(FMFLocationSharingViewController *)self navigationController];
  id v38 = v37;
  char v39 = v16;
LABEL_51:
  [v37 pushViewController:v39 animated:1];
}

- (BOOL)_isHandleAFollower:(id)a3
{
  id v4 = a3;
  if ([v4 isFamilyMember])
  {
    char v5 = [(FMFLocationSharingViewController *)self _isFamilyMemberAFollower:v4];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F3BA60];
    int v7 = [v4 identifier];
    uint64_t v8 = [v6 handleWithId:v7];

    id v9 = [MEMORY[0x263F3BA80] sharedInstance];
    char v5 = [v9 canShareLocationWithHandle:v8 groupId:0 callerId:0];

    id v4 = (id)v8;
  }

  return v5;
}

- (BOOL)_isFamilyMemberAFollower:(id)a3
{
  id v4 = a3;
  char v5 = [(FMFLocationSharingViewController *)self allFollowersHandles];
  uint64_t v6 = [v5 valueForKey:@"hashedDSID"];
  int v7 = [v4 hashedDSID];

  LOBYTE(v4) = [v6 containsObject:v7];
  return (char)v4;
}

- (BOOL)phoneNumberMatches:(id)a3 phone2:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F08708];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alphanumericCharacterSet];
  uint64_t v10 = [v9 invertedSet];
  int v11 = [(FMFLocationSharingViewController *)self stringByKeepingCharacterSet:v10 inString:v8];

  long long v12 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  uint64_t v13 = [v12 invertedSet];
  id v14 = [(FMFLocationSharingViewController *)self stringByKeepingCharacterSet:v13 inString:v7];

  uint64_t v15 = [(FMFLocationSharingViewController *)self reverseString:v11];

  id v16 = [(FMFLocationSharingViewController *)self reverseString:v14];

  if ((unint64_t)[v15 length] < 0xA || (unint64_t)objc_msgSend(v16, "length") < 0xA)
  {
    char v19 = 0;
  }
  else
  {
    int v17 = objc_msgSend(v15, "substringWithRange:", 0, 10);

    uint64_t v18 = objc_msgSend(v16, "substringWithRange:", 0, 10);

    char v19 = [v17 isEqualToString:v18];
    id v16 = (void *)v18;
    uint64_t v15 = v17;
  }

  return v19;
}

- (id)stringByKeepingCharacterSet:(id)a3 inString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 rangeOfCharacterFromSet:v5];
  id v9 = v6;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v7;
    int v11 = v6;
    do
    {
      id v9 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", v10, v8, &stru_26CA0AD00);

      uint64_t v10 = [v9 rangeOfCharacterFromSet:v5];
      int v11 = v9;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v9;
}

- (id)reverseString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F089D8] string];
  uint64_t v5 = [v3 length];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    do
    {
      uint64_t v7 = objc_msgSend(v3, "substringWithRange:", v6, 1);
      [v4 appendString:v7];

      --v6;
    }
    while (v6 != -1);
  }

  return v4;
}

- (id)identifierForHandle:(id)a3
{
  id v3 = (void *)MEMORY[0x263F3BA50];
  id v4 = a3;
  uint64_t v5 = [v3 sharedInstance];
  uint64_t v6 = [v5 getContactForHandle:v4];

  uint64_t v7 = [v6 identifier];

  return v7;
}

- (void)addRemoveActionToContactViewController:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x263F3BA80] FMFRestricted] & 1) == 0)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"REMOVE_FOLLOWER" value:&stru_26CA0AD00 table:@"LocalizableUI"];
    uint64_t v6 = [v7 cardBottomGroup];
    [v7 addActionWithTitle:v5 target:self selector:sel_removeFollower_ inGroup:v6 destructive:1];
  }
}

- (void)addShareActionToContactViewController:(id)a3
{
  id v9 = a3;
  char v4 = [MEMORY[0x263F3BA80] FMFRestricted];
  int v5 = [MEMORY[0x263F3BA80] FMFAllowed];
  if ((v4 & 1) == 0 && v5)
  {
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"SHARE_MY_LOCATION" value:&stru_26CA0AD00 table:@"LocalizableUI"];
    uint64_t v8 = [v9 cardBottomGroup];
    [v9 addActionWithTitle:v7 target:self selector:sel_shareMyLocation_ inGroup:v8 destructive:0];
  }
}

- (void)removeFollower:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (objc_msgSend(MEMORY[0x263F3BA80], "FMFRestricted", a3))
  {
    char v4 = LogCategory_Daemon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D1000, v4, OS_LOG_TYPE_INFO, "Cannot remove follower due to restrictions.", buf, 2u);
    }
  }
  else
  {
    int v5 = [(FMFLocationSharingViewController *)self lastSelectedHandle];
    int v6 = [v5 isFamilyMember];

    id v7 = [(FMFLocationSharingViewController *)self lastSelectedHandle];
    uint64_t v8 = v7;
    if (v6)
    {
      id v9 = [v7 hashedDSID];
      uint64_t v10 = [(FMFLocationSharingViewController *)self _followerHandleWithHashedDSID:v9];

      int v11 = LogCategory_Daemon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        long long v12 = [(FMFLocationSharingViewController *)self lastSelectedHandle];
        uint64_t v13 = [(FMFLocationSharingViewController *)self lastSelectedHandle];
        id v14 = [v13 dsid];
        *(_DWORD *)buf = 138412546;
        uint64_t v30 = v12;
        __int16 v31 = 2112;
        uint64_t v32 = v14;
        _os_log_impl(&dword_2188D1000, v11, OS_LOG_TYPE_INFO, "Removing Share My Location For Family Member: %@ %@", buf, 0x16u);
      }
      uint64_t v15 = LogCategory_Daemon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [v10 hashedDSID];
        *(_DWORD *)buf = 138412546;
        uint64_t v30 = v10;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_impl(&dword_2188D1000, v15, OS_LOG_TYPE_INFO, "Removing Share My Location For Actual Handle: %@ %@", buf, 0x16u);
      }
      int v17 = (void *)MEMORY[0x263EFFA08];
      uint64_t v18 = (void *)MEMORY[0x263F3BA60];
      char v19 = [v10 identifier];
      id v20 = [v18 handleWithId:v19];
      id v21 = [v17 setWithObject:v20];

      uint64_t v22 = [MEMORY[0x263F3BA80] sharedInstance];
      uint64_t v23 = *MEMORY[0x263F3BA48];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __51__FMFLocationSharingViewController_removeFollower___block_invoke;
      v28[3] = &unk_264343AF8;
      v28[4] = self;
      [v22 stopSharingMyLocationWithHandles:v21 groupId:v23 callerId:0 completion:v28];
    }
    else
    {
      uint64_t v10 = [(FMFLocationSharingViewController *)self allHandlesMatchingABCardForSelectedHandle:v7];

      uint64_t v24 = LogCategory_Daemon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v10;
        _os_log_impl(&dword_2188D1000, v24, OS_LOG_TYPE_INFO, "Removing Share My Location Followers: %@", buf, 0xCu);
      }

      id v21 = [MEMORY[0x263F3BA80] sharedInstance];
      uint64_t v25 = *MEMORY[0x263F3BA48];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __51__FMFLocationSharingViewController_removeFollower___block_invoke_234;
      v27[3] = &unk_264343AF8;
      v27[4] = self;
      [v21 stopSharingMyLocationWithHandles:v10 groupId:v25 callerId:0 completion:v27];
    }

    char v4 = [(FMFLocationSharingViewController *)self navigationController];
    id v26 = (id)[v4 popViewControllerAnimated:1];
  }
}

uint64_t __51__FMFLocationSharingViewController_removeFollower___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersOnMainQueue];
}

uint64_t __51__FMFLocationSharingViewController_removeFollower___block_invoke_234(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersOnMainQueue];
}

- (id)_followerHandleWithHashedDSID:(id)a3
{
  char v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"hashedDSID = %@", a3];
  int v5 = [(FMFLocationSharingViewController *)self allFollowersHandles];
  int v6 = [v5 filteredArrayUsingPredicate:v4];
  id v7 = [v6 lastObject];

  return v7;
}

- (void)shareMyLocation:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (objc_msgSend(MEMORY[0x263F3BA80], "FMFRestricted", a3))
  {
    char v4 = LogCategory_Daemon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D1000, v4, OS_LOG_TYPE_INFO, "Cannot add follower due to restrictions.", buf, 2u);
    }
  }
  else
  {
    int v5 = [(FMFLocationSharingViewController *)self lastSelectedHandle];
    char v4 = [v5 hashedDSID];

    int v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(FMFLocationSharingViewController *)self lastSelectedHandle];
      *(_DWORD *)buf = 138412546;
      id v21 = v4;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      _os_log_impl(&dword_2188D1000, v6, OS_LOG_TYPE_DEFAULT, "hashed: %@ %@", buf, 0x16u);
    }
    uint64_t v8 = LogCategory_Daemon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(FMFLocationSharingViewController *)self hashedFamilyDsids];
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_impl(&dword_2188D1000, v8, OS_LOG_TYPE_DEFAULT, "hashed: %@", buf, 0xCu);
    }
    uint64_t v10 = [(FMFLocationSharingViewController *)self lastSelectedHandle];
    int v11 = [v10 isFamilyMember];

    if (v11)
    {
      long long v12 = LogCategory_Daemon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [(FMFLocationSharingViewController *)self lastSelectedHandle];
        id v14 = [(FMFLocationSharingViewController *)self lastSelectedHandle];
        uint64_t v15 = [v14 dsid];
        *(_DWORD *)buf = 138412546;
        id v21 = v13;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        _os_log_impl(&dword_2188D1000, v12, OS_LOG_TYPE_INFO, "Starting Share My Location For Family Member: %@ %@", buf, 0x16u);
      }
    }
    id v16 = [MEMORY[0x263F3BA80] sharedInstance];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __52__FMFLocationSharingViewController_shareMyLocation___block_invoke;
    v19[3] = &unk_264343868;
    void v19[4] = self;
    [v16 iCloudAccountNameWithCompletion:v19];

    int v17 = [(FMFLocationSharingViewController *)self navigationController];
    id v18 = (id)[v17 popViewControllerAnimated:1];
  }
}

void __52__FMFLocationSharingViewController_shareMyLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__FMFLocationSharingViewController_shareMyLocation___block_invoke_2;
  v5[3] = &unk_2643439B8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __52__FMFLocationSharingViewController_shareMyLocation___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [*(id *)(a1 + 32) lastSelectedHandle];
  id v4 = [v2 setWithObject:v3];

  int v5 = [MEMORY[0x263F3BA60] handleWithId:*(void *)(a1 + 40)];
  id v6 = [MEMORY[0x263F3BA80] sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__FMFLocationSharingViewController_shareMyLocation___block_invoke_3;
  v7[3] = &unk_264343B20;
  v7[4] = *(void *)(a1 + 32);
  [v6 sendFriendshipOfferToHandles:v4 groupId:0 callerId:v5 endDate:0 completion:v7];
}

uint64_t __52__FMFLocationSharingViewController_shareMyLocation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersOnMainQueue];
}

- (id)allHandlesMatchingABCardForSelectedHandle:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [(FMFLocationSharingViewController *)self identifierForHandle:v5];
  [v6 addObject:v5];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F3BA80] sharedInstance];
    id v9 = [v8 getHandlesFollowingMyLocation];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__FMFLocationSharingViewController_allHandlesMatchingABCardForSelectedHandle___block_invoke;
    v11[3] = &unk_264343A80;
    v11[4] = self;
    id v12 = v7;
    id v13 = v6;
    [v9 enumerateObjectsUsingBlock:v11];
  }
  return v6;
}

void __78__FMFLocationSharingViewController_allHandlesMatchingABCardForSelectedHandle___block_invoke(id *a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(a1[4], "identifierForHandle:");
  if ([a1[5] isEqualToString:v3]) {
    [a1[6] addObject:v4];
  }
}

- (void)_meDeviceSpecifierWasTapped:(id)a3
{
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2188D1000, v3, OS_LOG_TYPE_DEFAULT, "_meDeviceSpecifierWasTapped", v4, 2u);
  }
}

- (void)_findMyDeviceSpecifierWasTapped:(id)a3
{
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_2188D1000, v4, OS_LOG_TYPE_DEFAULT, "_findMyDeviceSpecifierWasTapped", v9, 2u);
  }

  id v5 = objc_opt_new();
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  id v7 = objc_alloc_init(getFMDUIFMIPiCloudSettingsViewControllerClass());
  [v7 setAccount:v6];
  uint64_t v8 = [(FMFLocationSharingViewController *)self navigationController];
  [v8 pushViewController:v7 animated:1];
}

- (void)reloadSpecifiersOnMainQueue
{
  [(FMFLocationSharingViewController *)self _loadSpecifiers];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__FMFLocationSharingViewController_reloadSpecifiersOnMainQueue__block_invoke;
  block[3] = &unk_2643438F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__FMFLocationSharingViewController_reloadSpecifiersOnMainQueue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (BOOL)isMyLocationEnabled
{
  uint64_t v2 = [MEMORY[0x263F3BA80] sharedInstance];
  char v3 = [v2 isMyLocationEnabled];

  return v3;
}

- (void)didReceiveServerError:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "Received server error: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(FMFLocationSharingViewController *)self genericAlertController];
  [(FMFLocationSharingViewController *)self displayAlertController:v6];
}

- (void)networkReachabilityUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "Updated network reachability status, Is reachable: %d", (uint8_t *)v8, 8u);
  }

  if (v3)
  {
    id v6 = [MEMORY[0x263F3BA80] sharedInstance];
    [v6 forceRefresh];

    [(FMFLocationSharingViewController *)self reloadSpecifiersOnMainQueue];
  }
  else
  {
    id v7 = +[FMFNoNetworkAlert newAlertController];
    [(FMFLocationSharingViewController *)self displayAlertController:v7];
  }
}

- (void)saveActiveDeviceSelection
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2188D1000, log, OS_LOG_TYPE_ERROR, "No FMFSession instance available.", v1, 2u);
}

void __61__FMFLocationSharingViewController_saveActiveDeviceSelection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setMeDeviceChangePending:0];
  if (v3)
  {
    id v4 = LogCategory_Daemon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__FMFLocationSharingViewController_saveActiveDeviceSelection__block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) reloadSpecifiersOnMainQueue];
}

- (void)updateFindMyDeviceStatus
{
  id v3 = [MEMORY[0x263F3CC60] sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__FMFLocationSharingViewController_updateFindMyDeviceStatus__block_invoke;
  v4[3] = &unk_264343B70;
  v4[4] = self;
  [v3 fmipStateWithCompletion:v4];
}

uint64_t __60__FMFLocationSharingViewController_updateFindMyDeviceStatus__block_invoke(uint64_t a1, unint64_t a2)
{
  [*(id *)(a1 + 32) setIsFindMyDeviceOn:a2 < 2];
  id v3 = *(void **)(a1 + 32);
  return [v3 reloadSpecifiersOnMainQueue];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FMFLocationSharingViewController;
  [(FMFLocationSharingViewController *)&v5 traitCollectionDidChange:a3];
  id v4 = [(id)*MEMORY[0x263F1D020] preferredContentSizeCategory];
  [(FMFLocationSharingViewController *)self setIsAccessibilitySize:UIContentSizeCategoryIsAccessibilityCategory(v4)];
}

- (NSArray)followersSpecifiers
{
  return self->_followersSpecifiers;
}

- (void)setFollowersSpecifiers:(id)a3
{
}

- (NSArray)familySpecifiers
{
  return self->_familySpecifiers;
}

- (void)setFamilySpecifiers:(id)a3
{
}

- (NSArray)deviceSpecifiers
{
  return self->_deviceSpecifiers;
}

- (void)setDeviceSpecifiers:(id)a3
{
}

- (NSArray)allFollowersHandles
{
  return self->_allFollowersHandles;
}

- (void)setAllFollowersHandles:(id)a3
{
}

- (NSArray)followersHandles
{
  return self->_followersHandles;
}

- (void)setFollowersHandles:(id)a3
{
}

- (NSMutableDictionary)dsidToFamilyPhoto
{
  return self->_dsidToFamilyPhoto;
}

- (void)setDsidToFamilyPhoto:(id)a3
{
}

- (NSArray)hashedFamilyDsids
{
  return self->_hashedFamilyDsids;
}

- (void)setHashedFamilyDsids:(id)a3
{
}

- (FMFHandle)lastSelectedHandle
{
  return self->_lastSelectedHandle;
}

- (void)setLastSelectedHandle:(id)a3
{
}

- (void)setIsMyLocationEnabled:(BOOL)a3
{
  self->_isMyLocationEnabled = a3;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
}

- (UIAlertController)genericErrorAlert
{
  return self->_genericErrorAlert;
}

- (void)setGenericErrorAlert:(id)a3
{
}

- (void)setUseFamilyCirclePhotos:(BOOL)a3
{
  self->_useFamilyCirclePhotos = a3;
}

- (BOOL)useFamilyCirclePhotosLoaded
{
  return self->_useFamilyCirclePhotosLoaded;
}

- (void)setUseFamilyCirclePhotosLoaded:(BOOL)a3
{
  self->_useFamilyCirclePhotosLoaded = a3;
}

- (BOOL)areSpecifiersLoaded
{
  return self->_areSpecifiersLoaded;
}

- (void)setAreSpecifiersLoaded:(BOOL)a3
{
  self->_areSpecifiersLoaded = a3;
}

- (BOOL)areMeDeviceInfoLoaded
{
  return self->_areMeDeviceInfoLoaded;
}

- (void)setAreMeDeviceInfoLoaded:(BOOL)a3
{
  self->_areMeDeviceInfoLoaded = a3;
}

- (BOOL)isFindMyDeviceOn
{
  return self->_isFindMyDeviceOn;
}

- (void)setIsFindMyDeviceOn:(BOOL)a3
{
  self->_isFindMyDeviceOn = a3;
}

- (BOOL)meDeviceChangePending
{
  return self->_meDeviceChangePending;
}

- (void)setMeDeviceChangePending:(BOOL)a3
{
  self->_meDeviceChangePending = a3;
}

- (BOOL)isAccessibilitySize
{
  return self->_isAccessibilitySize;
}

- (void)setIsAccessibilitySize:(BOOL)a3
{
  self->_isAccessibilitySize = a3;
}

- (OS_dispatch_queue)specifiersQueue
{
  return self->_specifiersQueue;
}

- (void)setSpecifiersQueue:(id)a3
{
}

- (NSSet)meDevices
{
  return self->_meDevices;
}

- (void)setMeDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meDevices, 0);
  objc_storeStrong((id *)&self->_specifiersQueue, 0);
  objc_storeStrong((id *)&self->_genericErrorAlert, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_lastSelectedHandle, 0);
  objc_storeStrong((id *)&self->_hashedFamilyDsids, 0);
  objc_storeStrong((id *)&self->_dsidToFamilyPhoto, 0);
  objc_storeStrong((id *)&self->_followersHandles, 0);
  objc_storeStrong((id *)&self->_allFollowersHandles, 0);
  objc_storeStrong((id *)&self->_deviceSpecifiers, 0);
  objc_storeStrong((id *)&self->_familySpecifiers, 0);
  objc_storeStrong((id *)&self->_followersSpecifiers, 0);
}

void __55__FMFLocationSharingViewController__loadFamilyMembers___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2188D1000, v0, v1, "Error loading family members: %@", v2, v3, v4, v5, v6);
}

void __72__FMFLocationSharingViewController__setShareSwitchEnabled_forSpecifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2188D1000, v0, v1, "Preference change failed because of error - %@", v2, v3, v4, v5, v6);
}

- (void)_showHandleDetails:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2188D1000, v0, v1, "Error finding specifier in _showHandleDetails: %@", v2, v3, v4, v5, v6);
}

void __61__FMFLocationSharingViewController_saveActiveDeviceSelection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2188D1000, v0, v1, "Error while setting active device. Error - %@", v2, v3, v4, v5, v6);
}

@end