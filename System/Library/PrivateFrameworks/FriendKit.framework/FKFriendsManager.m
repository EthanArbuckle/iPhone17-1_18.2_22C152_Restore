@interface FKFriendsManager
+ (id)collapseChangeLogsIntoChangeLog:(id)a3;
+ (id)managerForDomain:(id)a3;
+ (void)setEnableEmptyTrailingGroup:(BOOL)a3 domain:(id)a4;
+ (void)setFriendGroupTitleChangedExternallyNotificationName:(id)a3 domain:(id)a4;
+ (void)setFriendsChangedExternallyNotificationName:(id)a3 domain:(id)a4;
+ (void)setGroupSize:(unint64_t)a3 domain:(id)a4;
+ (void)setMaxGroupCount:(unint64_t)a3 domain:(id)a4;
+ (void)setRefreshAgainstContactsOnInitEnabled:(BOOL)a3 domain:(id)a4;
- (BOOL)_addressBookSequenceNumberDidChange;
- (BOOL)_canAddFriendGroup;
- (BOOL)_changeLogContainsFriendAdditionsOrUpdates;
- (BOOL)_shouldAddEmptyGroup;
- (BOOL)_shouldBypassDestinationStatusCheck;
- (BOOL)addFriend:(id)a3;
- (BOOL)canAddFriend;
- (BOOL)containsFriendWithABRecordGUID:(id)a3;
- (BOOL)didLastLoadHaveChanges;
- (BOOL)isPersonFriend:(id)a3;
- (BOOL)isRefreshAgainstContactsEnabled;
- (BOOL)refreshAgainstAddressBook;
- (BOOL)shouldAllowAddingContact:(id)a3 withContactStore:(id)a4 personValueCache:(id)a5;
- (FKDelayedOperation)saveOperation;
- (FKFriendsManager)initWithDomain:(id)a3;
- (NSMutableDictionary)changeLog;
- (NSString)serviceName;
- (__CFString)_notificationForExternalListChange;
- (id)_copyAndResetChangeLog;
- (id)_curatedFriendList;
- (id)_destinations;
- (id)_friendAtPosition:(unint64_t)a3;
- (id)allPeople;
- (id)friendGroups;
- (id)personLikePerson:(id)a3;
- (id)personWithABRecordGUID:(id)a3;
- (id)personWithDestinations:(id)a3;
- (id)reachableDestinationsForPerson:(id)a3;
- (int)_lastKnownAddressBookSequenceNumber;
- (int64_t)_compareStatus:(int64_t)a3 toStatus:(int64_t)a4;
- (int64_t)_firstEmptyPosition;
- (int64_t)statusForPerson:(id)a3 requery:(BOOL)a4;
- (unint64_t)_changeLogCount;
- (unint64_t)_indexForPosition:(unint64_t)a3 inGroup:(id)a4;
- (unint64_t)_numberOfFriendsInList:(id)a3;
- (unint64_t)groupIndexContainingFriend:(id)a3;
- (unint64_t)positionOfFriendInGroup:(id)a3;
- (void)_addCuratedFriends:(id)a3;
- (void)_addEmptyGroup;
- (void)_addEntryToChangeLogForPerson:(id)a3 changeType:(id)a4;
- (void)_addPersonToIdentifiersToPersonMap:(id)a3;
- (void)_addressBookChanged:(id)a3;
- (void)_aggdLogFriendCount;
- (void)_aggdLogFriendGroupCount;
- (void)_aggdSetValue:(int64_t)a3 forScalarKey:(__CFString *)a4;
- (void)_cleanUpFriendListIfNecessary;
- (void)_createAddressToPersonDictionary;
- (void)_createEmptyFriendList;
- (void)_deduplicateFriendListIfNecessary;
- (void)_friendsChangedExternally;
- (void)_groupTitleChangedExternally;
- (void)_idsQueryTimeoutTimerFired;
- (void)_incrementExternalChangePostCount;
- (void)_initiateIDSDestinationStatusQuery:(id)a3;
- (void)_loadFriendList;
- (void)_loadGroupTitles;
- (void)_personValuesChanged:(id)a3;
- (void)_postChangeNotificationIfNecessary;
- (void)_postGroupListChangedNotification;
- (void)_queryDestinations:(id)a3;
- (void)_removeDestinationlessFriendsIfNecessary;
- (void)_removeFriendsAtIndices:(id)a3;
- (void)_removeGroupAtIndex:(unint64_t)a3;
- (void)_removePersonFromIdentifiersToPersonMap:(id)a3;
- (void)_save;
- (void)_setupQueryController;
- (void)_startIDSQueryTimeoutTimer;
- (void)_stopIDSQueryTimeoutTimer;
- (void)_storeSourcedPerson:(id)a3;
- (void)_updateFriendGroups;
- (void)_updateFriends:(id)a3;
- (void)_updateLastKnownAddressBookSequenceNumber:(int)a3;
- (void)dealloc;
- (void)friendGroup:(id)a3 didMoveFriends:(id)a4;
- (void)friendGroup:(id)a3 didRemoveFriend:(id)a4 atPosition:(unint64_t)a5;
- (void)friendGroup:(id)a3 didSetFriend:(id)a4 atPosition:(unint64_t)a5;
- (void)idStatusUpdatedForDestinations:(id)a3;
- (void)markFriendListAsNormalized;
- (void)purgeEmptyFriendGroups;
- (void)refreshDestinationStatuses;
- (void)reloadFriendList;
- (void)save;
- (void)saveFriendGroupTitles;
- (void)setChangeLog:(id)a3;
- (void)setLastLoadHadChanges:(BOOL)a3;
- (void)setRefreshAgainstContactsEnabled:(BOOL)a3;
- (void)setSaveOperation:(id)a3;
- (void)setServiceName:(id)a3;
- (void)syncFriendGroup:(id)a3;
@end

@implementation FKFriendsManager

+ (id)managerForDomain:(id)a3
{
  id v3 = a3;
  if (managerForDomain__onceToken != -1) {
    dispatch_once(&managerForDomain__onceToken, &__block_literal_global_0);
  }
  v4 = [(id)managerForDomain___sharedFriendListManagers objectForKey:v3];
  if (!v4)
  {
    v4 = [[FKFriendsManager alloc] initWithDomain:v3];
    [(id)managerForDomain___sharedFriendListManagers setObject:v4 forKey:v3];
  }

  return v4;
}

+ (void)setGroupSize:(unint64_t)a3 domain:(id)a4
{
  v5 = NSNumber;
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(@"FKGroupSize", (CFPropertyListRef)[v5 numberWithUnsignedInteger:a3], applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

- (id)_copyAndResetChangeLog
{
  objc_initWeak(&location, self);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  changeLogQueue = self->_changeLogQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__FKFriendsManager__copyAndResetChangeLog__block_invoke;
  v6[3] = &unk_264437E90;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(changeLogQueue, v6);
  id v4 = (id)v9[5];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
  return v4;
}

+ (void)setMaxGroupCount:(unint64_t)a3 domain:(id)a4
{
  v5 = NSNumber;
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(@"FKMaxGroupCount", (CFPropertyListRef)[v5 numberWithUnsignedInteger:a3], applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

void __53__FKFriendsManager__postGroupListChangedNotification__block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"FKFriendsManagerGroupListChanged" object:0];
}

uint64_t __37__FKFriendsManager_managerForDomain___block_invoke()
{
  managerForDomain___sharedFriendListManagers = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

- (FKFriendsManager)initWithDomain:(id)a3
{
  id v4 = (__CFString *)a3;
  v49.receiver = self;
  v49.super_class = (Class)FKFriendsManager;
  v5 = [(FKFriendsManager *)&v49 init];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      id v7 = v4;
    }
    else {
      id v7 = @"com.apple.ET";
    }
    objc_storeStrong((id *)&v5->_domain, v7);
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedStatuses = v6->_cachedStatuses;
    v6->_cachedStatuses = v8;

    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    v11 = getCNContactStoreDidChangeNotification();

    if (v11)
    {
      v12 = getCNContactStoreDidChangeNotification();
      [v10 addObserver:v6 selector:sel__addressBookChanged_ name:v12 object:0];
    }
    else
    {
      v12 = _FKGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[FKFriendsManager initWithDomain:](v12);
      }
    }

    [v10 addObserver:v6 selector:sel__personValuesChanged_ name:@"FKPersonValuesChangedNotification" object:0];
    uint64_t v13 = [MEMORY[0x263F088B0] hashTableWithOptions:0];
    sourcedPersons = v6->_sourcedPersons;
    v6->_sourcedPersons = (NSHashTable *)v13;

    uint64_t v15 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    identifiersToPersonMap = v6->_identifiersToPersonMap;
    v6->_identifiersToPersonMap = (NSMapTable *)v15;

    uint64_t v17 = objc_opt_new();
    npsManager = v6->_npsManager;
    v6->_npsManager = (NPSManager *)v17;

    v19 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.FriendKit.FKFriendsManager.Save", v19);
    saveQueue = v6->_saveQueue;
    v6->_saveQueue = (OS_dispatch_queue *)v20;

    v22 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.FriendKit.FKFriendsManager.ChangeLog", v22);
    changeLogQueue = v6->_changeLogQueue;
    v6->_changeLogQueue = (OS_dispatch_queue *)v23;

    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"FKMaxGroupCount", (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    uint64_t v26 = 20;
    if (keyExistsAndHasValidFormat) {
      uint64_t v26 = AppIntegerValue;
    }
    v6->_maxFriendGroups = v26;
    CFIndex v27 = CFPreferencesGetAppIntegerValue(@"FKGroupSize", (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    uint64_t v28 = 12;
    if (keyExistsAndHasValidFormat) {
      uint64_t v28 = v27;
    }
    v6->_maxFriendsPerGroup = v28;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"FKEmptyTrailingGroupEnabled", (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v30 = AppBooleanValue == 1;
    }
    else {
      BOOL v30 = 1;
    }
    char v31 = v30;
    v6->_shouldAddEmptyTrailingGroup = v31;
    CFStringRef v32 = (const __CFString *)CFPreferencesCopyAppValue(@"FKFriendsChangedExternallyNotificationName", (CFStringRef)v6->_domain);
    v6->_friendsChangedExternallyNotificationName = (__CFString *)v32;
    if (v32 && CFStringGetLength(v32) >= 1) {
      friendsChangedExternallyNotificationName = v6->_friendsChangedExternallyNotificationName;
    }
    else {
      friendsChangedExternallyNotificationName = @"FKFriendsChangedExternallyNotification";
    }
    v6->_friendsChangedExternallyNotificationName = friendsChangedExternallyNotificationName;
    CFStringRef v34 = (const __CFString *)CFPreferencesCopyAppValue(@"FKFriendGroupTitleChangedExternallyNotificationName", (CFStringRef)v6->_domain);
    v6->_friendGroupTitleChangedExternallyNotificationName = (__CFString *)v34;
    if (v34 && CFStringGetLength(v34) >= 1) {
      friendGroupTitleChangedExternallyNotificationName = v6->_friendGroupTitleChangedExternallyNotificationName;
    }
    else {
      friendGroupTitleChangedExternallyNotificationName = @"FKFriendGroupTitleChangedExternallyNotification";
    }
    v6->_friendGroupTitleChangedExternallyNotificationName = friendGroupTitleChangedExternallyNotificationName;
    int v36 = CFPreferencesGetAppBooleanValue(@"FKDeduplicateFriendListEnabled", (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v37 = v36 == 1;
    }
    else {
      BOOL v37 = 1;
    }
    char v38 = v37;
    v6->_shouldDeduplicateFriendList = v38;
    int v39 = CFPreferencesGetAppBooleanValue(@"FKRemoveDestinationlessFriendsEnabled", (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v40 = v39 == 1;
    }
    else {
      BOOL v40 = 0;
    }
    char v41 = v40;
    v6->_shouldRemoveDestinationlessFriends = v41;
    int v42 = CFPreferencesGetAppBooleanValue(@"FKRefreshAgainstContactsOnInitEnabled", (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v43 = v42 == 1;
    }
    else {
      BOOL v43 = 1;
    }
    char v44 = v43;
    v6->_refreshAgainstContactsEnabled = v44;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_FKFriendsChangedExternallyHandler, v6->_friendsChangedExternallyNotificationName, 0, CFNotificationSuspensionBehaviorDrop);
    v46 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v46, v6, (CFNotificationCallback)_FKFriendGroupTitleChangedExternallyHandler, v6->_friendGroupTitleChangedExternallyNotificationName, 0, CFNotificationSuspensionBehaviorDrop);
    [(FKFriendsManager *)v6 _createEmptyFriendList];
    [(FKFriendsManager *)v6 _loadFriendList];
    [(FKFriendsManager *)v6 _loadGroupTitles];
  }
  return v6;
}

- (void)dealloc
{
  [(IDSBatchIDQueryController *)self->_queryController invalidate];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, self->_friendsChangedExternallyNotificationName, 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, self->_friendGroupTitleChangedExternallyNotificationName, 0);
  friendsChangedExternallyNotificationName = self->_friendsChangedExternallyNotificationName;
  if (friendsChangedExternallyNotificationName != @"FKFriendsChangedExternallyNotification") {
    CFRelease(friendsChangedExternallyNotificationName);
  }
  friendGroupTitleChangedExternallyNotificationName = self->_friendGroupTitleChangedExternallyNotificationName;
  if (friendGroupTitleChangedExternallyNotificationName != @"FKFriendGroupTitleChangedExternallyNotification") {
    CFRelease(friendGroupTitleChangedExternallyNotificationName);
  }
  v8.receiver = self;
  v8.super_class = (Class)FKFriendsManager;
  [(FKFriendsManager *)&v8 dealloc];
}

- (id)friendGroups
{
  return self->_friendGroups;
}

- (void)_addEmptyGroup
{
  objc_super v8 = [[FKFriendGroup alloc] initWithDelegate:self groupSize:self->_maxFriendsPerGroup];
  -[NSMutableArray addObject:](self->_friendGroups, "addObject:");
  unint64_t v3 = self->_maxFriendsPerGroup + [(NSMutableArray *)self->_friendList count];
  unint64_t v4 = [(NSMutableArray *)self->_friendList count];
  if (v4 < v3)
  {
    unint64_t v5 = v4;
    do
    {
      friendList = self->_friendList;
      id v7 = [MEMORY[0x263EFF9D0] null];
      [(NSMutableArray *)friendList setObject:v7 atIndexedSubscript:v5];

      ++v5;
    }
    while (v3 != v5);
  }
  [(FKFriendsManager *)self _postGroupListChangedNotification];
}

- (void)_createEmptyFriendList
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  friendList = self->_friendList;
  self->_friendList = v3;

  unint64_t v5 = [MEMORY[0x263EFF980] array];
  friendGroups = self->_friendGroups;
  self->_friendGroups = v5;

  [(FKFriendsManager *)self _addEmptyGroup];
}

- (void)reloadFriendList
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = _FKGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    unint64_t v5 = "-[FKFriendsManager reloadFriendList]";
    __int16 v6 = 1024;
    int v7 = 312;
    _os_log_impl(&dword_21CBC2000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"a friend list reload was requested\"", (uint8_t *)&v4, 0x12u);
  }

  [(FKFriendsManager *)self _loadFriendList];
}

- (void)_loadFriendList
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFPreferencesAppSynchronize((CFStringRef)self->_domain);
  unint64_t v3 = (void *)CFPreferencesCopyAppValue(@"FriendList", (CFStringRef)self->_domain);
  int v4 = _FKGetLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      __int16 v6 = &stru_26CD80ED0;
      BOOL didCompleteInitialLoading = self->_didCompleteInitialLoading;
      *(void *)&v12[4] = "-[FKFriendsManager _loadFriendList]";
      *(_DWORD *)v12 = 136315650;
      if (!didCompleteInitialLoading) {
        __int16 v6 = @" for the first time";
      }
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 321;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_21CBC2000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"loaded friend list%@\"", v12, 0x1Cu);
    }

    [(FKFriendsManager *)self _updateFriends:v3];
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)v12 = 136315394;
      *(void *)&v12[4] = "-[FKFriendsManager _loadFriendList]";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 324;
      _os_log_impl(&dword_21CBC2000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"friend list does not yet exist, starting with an empty list\"", v12, 0x12u);
    }

    [(FKFriendsManager *)self _createEmptyFriendList];
    if ([@"com.apple.ET" isEqualToString:self->_domain])
    {
      [(FKFriendsManager *)self markFriendListAsNormalized];
      uint64_t v8 = [(FKFriendsManager *)self _curatedFriendList];
      [(FKFriendsManager *)self _addCuratedFriends:v8];
    }
    self->_needsFriendListSync = 1;
    [(FKFriendsManager *)self save];
  }
  [(FKFriendsManager *)self _updateFriendGroups];
  self->_BOOL lastLoadHadChanges = [(FKFriendsManager *)self _changeLogCount] != 0;
  if (self->_didCompleteInitialLoading)
  {
    v9 = _FKGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = &stru_26CD80ED0;
      BOOL lastLoadHadChanges = self->_lastLoadHadChanges;
      *(void *)&v12[4] = "-[FKFriendsManager _loadFriendList]";
      *(_DWORD *)v12 = 136315650;
      if (!lastLoadHadChanges) {
        uint64_t v10 = @" no";
      }
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 345;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_21CBC2000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"friend list has%@ changes\"", v12, 0x1Cu);
    }
  }
  else
  {
    self->_BOOL didCompleteInitialLoading = 1;
  }
  if (![(FKFriendsManager *)self refreshAgainstAddressBook])
  {
    [(FKFriendsManager *)self _cleanUpFriendListIfNecessary];
    [(FKFriendsManager *)self _postChangeNotificationIfNecessary];
  }
  [(FKFriendsManager *)self _createAddressToPersonDictionary];
  [(FKFriendsManager *)self _aggdLogFriendCount];
  [(FKFriendsManager *)self _aggdLogFriendGroupCount];
}

- (id)_curatedFriendList
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  __int16 v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__FKFriendsManager__curatedFriendList__block_invoke;
  v8[3] = &unk_264437C38;
  v8[4] = &v9;
  +[FKAddressBook performBlock:v8];
  unint64_t v3 = [(id)v10[5] count];
  if (v3)
  {
    if (v3 > self->_maxFriendGroups * self->_maxFriendsPerGroup) {
      objc_msgSend((id)v10[5], "removeObjectsInRange:");
    }
    int v4 = _FKGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(id)v10[5] count];
      *(_DWORD *)buf = 136315650;
      v16 = "-[FKFriendsManager _curatedFriendList]";
      __int16 v17 = 1024;
      int v18 = 412;
      __int16 v19 = 2048;
      uint64_t v20 = v5;
      _os_log_impl(&dword_21CBC2000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"phone favorites import complete with %tu Digital Touch friends\"", buf, 0x1Cu);
    }

    __int16 v6 = (void *)[(id)v10[5] copy];
  }
  else
  {
    __int16 v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __38__FKFriendsManager__curatedFriendList__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263F242A8] sharedInstance];
  int v4 = [v3 entries];

  uint64_t v5 = [v4 count];
  __int16 v6 = _FKGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315650;
      int v39 = "-[FKFriendsManager _curatedFriendList]_block_invoke";
      __int16 v40 = 1024;
      int v41 = 372;
      __int16 v42 = 2048;
      uint64_t v43 = [v4 count];
      _os_log_impl(&dword_21CBC2000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"processing %tu phone favorites for Digital Touch friend import\"", buf, 0x1Cu);
    }

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    BOOL v30 = v4;
    id v12 = v4;
    __int16 v13 = v11;
    id obj = v12;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v48 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      unint64_t v17 = 0x264437000uLL;
      do
      {
        uint64_t v18 = 0;
        uint64_t v31 = v15;
        do
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(obj);
          }
          __int16 v19 = *(void **)(*((void *)&v34 + 1) + 8 * v18);
          uint64_t v20 = (void *)[objc_alloc(*(Class *)(v17 + 2536)) initWithFavorite:v19 addressBook:a2];
          uint64_t v21 = [v20 abRecordGUID];
          if (v21 && [v13 containsObject:v21])
          {
            v22 = _FKGetLogSystem();
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_19;
            }
            dispatch_queue_t v23 = [v19 displayName];
            v24 = [v19 value];
            *(_DWORD *)buf = 136316162;
            int v39 = "-[FKFriendsManager _curatedFriendList]_block_invoke";
            __int16 v40 = 1024;
            int v41 = 382;
            __int16 v42 = 2112;
            uint64_t v43 = (uint64_t)v23;
            __int16 v44 = 2112;
            v45 = v24;
            __int16 v46 = 2112;
            v47[0] = v21;
            _os_log_impl(&dword_21CBC2000, v22, OS_LOG_TYPE_DEFAULT, "%s (%d) \"not importing phone favorite [%@ | %@] with record GUID %@; person was already imported\"",
              buf,
              0x30u);

            goto LABEL_18;
          }
          if (!v20) {
            __38__FKFriendsManager__curatedFriendList__block_invoke_cold_1();
          }
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v20];
          if (v21) {
            [v13 addObject:v21];
          }
          v22 = _FKGetLogSystem();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v23 = [v19 displayName];
            [v19 value];
            uint64_t v25 = v16;
            uint64_t v26 = v13;
            v28 = uint64_t v27 = a2;
            int v29 = [v19 _abUid];
            *(_DWORD *)buf = 136316418;
            int v39 = "-[FKFriendsManager _curatedFriendList]_block_invoke";
            __int16 v40 = 1024;
            int v41 = 393;
            __int16 v42 = 2112;
            uint64_t v43 = (uint64_t)v23;
            __int16 v44 = 2112;
            v45 = v28;
            __int16 v46 = 1024;
            LODWORD(v47[0]) = v29;
            WORD2(v47[0]) = 2112;
            *(void *)((char *)v47 + 6) = v21;
            _os_log_impl(&dword_21CBC2000, v22, OS_LOG_TYPE_DEFAULT, "%s (%d) \"imported phone favorite [%@ | %@] with record ID %d and GUID %@\"", buf, 0x36u);

            a2 = v27;
            __int16 v13 = v26;
            uint64_t v16 = v25;
            unint64_t v17 = 0x264437000;
LABEL_18:

            uint64_t v15 = v31;
          }
LABEL_19:

          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
      }
      while (v15);
    }
    __int16 v6 = v13;

    int v4 = v30;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315394;
    int v39 = "-[FKFriendsManager _curatedFriendList]_block_invoke";
    __int16 v40 = 1024;
    int v41 = 396;
    _os_log_impl(&dword_21CBC2000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"no phone favorites found to import to Digital Touch friends\"", buf, 0x12u);
  }
}

- (void)_addCuratedFriends:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __39__FKFriendsManager__addCuratedFriends___block_invoke;
    v17[3] = &unk_264437C60;
    v17[4] = self;
    [v4 enumerateObjectsUsingBlock:v17];
    unint64_t v5 = [(NSMutableArray *)self->_friendList count];
    unint64_t maxFriendsPerGroup = self->_maxFriendsPerGroup;
    if (v5 % maxFriendsPerGroup)
    {
      unint64_t v7 = maxFriendsPerGroup - v5 % maxFriendsPerGroup;
      uint64_t v8 = [MEMORY[0x263EFF9D0] null];
      if (v7 <= 1) {
        unint64_t v7 = 1;
      }
      do
      {
        [(NSMutableArray *)self->_friendList addObject:v8];
        --v7;
      }
      while (v7);
    }
    [(FKFriendsManager *)self _updateFriendGroups];
    uint64_t v9 = [(NSMutableArray *)self->_friendGroups count] - 1;
    uint64_t v10 = FriendKitBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"NUMBERED_FAVORITES_FORMAT_STRING" value:&stru_26CD80ED0 table:0];

    friendGroups = self->_friendGroups;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __39__FKFriendsManager__addCuratedFriends___block_invoke_2;
    v14[3] = &unk_264437C88;
    id v15 = v11;
    uint64_t v16 = v9;
    id v13 = v11;
    [(NSMutableArray *)friendGroups enumerateObjectsUsingBlock:v14];
    [(FKFriendsManager *)self saveFriendGroupTitles];
  }
}

uint64_t __39__FKFriendsManager__addCuratedFriends___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setObject:a2 atIndexedSubscript:a3];
}

uint64_t __39__FKFriendsManager__addCuratedFriends___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v11 = v5;
  if (!a3)
  {
    uint64_t v8 = FriendKitBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"FAVORITES" value:&stru_26CD80ED0 table:0];
    [v11 setTitle:v9];

    goto LABEL_7;
  }
  unint64_t v6 = *(void *)(a1 + 40);
  if (v6 > a3 || (id v7 = v5, v6 == a3) && (v5 = (id)[v5 count], id v7 = v11, v5))
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", *(void *)(a1 + 32), (a3 + 1));
    [v11 setTitle:v8];
LABEL_7:

    id v7 = v11;
  }

  return MEMORY[0x270F9A758](v5, v7);
}

- (BOOL)_shouldAddEmptyGroup
{
  unint64_t v3 = [(NSMutableArray *)self->_friendGroups lastObject];
  if (v3) {
    BOOL v4 = [(FKFriendsManager *)self _canAddFriendGroup]
  }
      && [v3 count]
      && self->_shouldAddEmptyTrailingGroup;
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)_updateFriendGroups
{
  unint64_t v3 = [(NSMutableArray *)self->_friendGroups count];
  unint64_t v4 = [(NSMutableArray *)self->_friendList count];
  if (v4 / self->_maxFriendsPerGroup >= self->_maxFriendGroups) {
    unint64_t maxFriendGroups = self->_maxFriendGroups;
  }
  else {
    unint64_t maxFriendGroups = v4 / self->_maxFriendsPerGroup;
  }
  if (v3 <= maxFriendGroups)
  {
    unint64_t v6 = maxFriendGroups - v3;
    if (maxFriendGroups > v3)
    {
      do
      {
        friendGroups = self->_friendGroups;
        uint64_t v8 = [[FKFriendGroup alloc] initWithDelegate:self groupSize:self->_maxFriendsPerGroup];
        [(NSMutableArray *)friendGroups addObject:v8];

        --v6;
      }
      while (v6);
    }
  }
  else
  {
    -[NSMutableArray removeObjectsInRange:](self->_friendGroups, "removeObjectsInRange:", maxFriendGroups, v3 - maxFriendGroups);
  }
  if (maxFriendGroups)
  {
    for (uint64_t i = 0; i != maxFriendGroups; ++i)
    {
      uint64_t v10 = [(NSMutableArray *)self->_friendList subarrayWithRange:self->_maxFriendsPerGroup * i];
      uint64_t v11 = [(NSMutableArray *)self->_friendGroups objectAtIndexedSubscript:i];
      [v11 setFriends:v10];
    }
  }
  if ([(FKFriendsManager *)self _shouldAddEmptyGroup])
  {
    [(FKFriendsManager *)self _addEmptyGroup];
  }
  else if (v3 > maxFriendGroups)
  {
    [(FKFriendsManager *)self _postGroupListChangedNotification];
  }
}

- (BOOL)_canAddFriendGroup
{
  return [(NSMutableArray *)self->_friendGroups count] < self->_maxFriendGroups;
}

- (BOOL)canAddFriend
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(FKFriendsManager *)self _canAddFriendGroup])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    unint64_t v4 = self->_friendGroups;
    uint64_t v3 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v4);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "isFull", (void)v8))
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (unint64_t)groupIndexContainingFriend:(id)a3
{
  unint64_t v4 = [(NSMutableArray *)self->_friendList indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  else {
    return vcvtms_u32_f32((float)v4 / (float)self->_maxFriendsPerGroup);
  }
}

- (void)_removeGroupAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_friendGroups count] > a3)
  {
    [(NSMutableArray *)self->_friendGroups removeObjectAtIndex:a3];
    [(NSMutableArray *)self->_friendList removeObjectsInRange:self->_maxFriendsPerGroup * a3];
    [(FKFriendsManager *)self _postGroupListChangedNotification];
  }
}

- (void)syncFriendGroup:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = [(NSMutableArray *)self->_friendGroups indexOfObject:v4];
  unint64_t maxFriendsPerGroup = self->_maxFriendsPerGroup;
  id v12 = v4;
  unint64_t v6 = [v4 friends];
  if (self->_maxFriendsPerGroup)
  {
    unint64_t v7 = 0;
    unint64_t v8 = maxFriendsPerGroup * v13;
    do
    {
      long long v9 = [(NSMutableArray *)self->_friendList objectAtIndexedSubscript:v8 + v7];
      long long v10 = [v6 objectAtIndexedSubscript:v7];
      if (v9 != v10)
      {
        [(NSMutableArray *)self->_friendList setObject:v10 atIndexedSubscript:v8 + v7];
        self->_needsFriendListSync = 1;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v11 = _FKGetLogSystem();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            id v15 = "-[FKFriendsManager syncFriendGroup:]";
            __int16 v16 = 1024;
            int v17 = 549;
            __int16 v18 = 2112;
            __int16 v19 = v10;
            __int16 v20 = 1024;
            int v21 = v7;
            __int16 v22 = 1024;
            int v23 = v13;
            _os_log_impl(&dword_21CBC2000, v11, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"%@ was moved to position %u in group %u\"", buf, 0x28u);
          }
        }
      }

      ++v7;
    }
    while (v7 < self->_maxFriendsPerGroup);
  }
  if (self->_needsFriendListSync) {
    [(FKFriendsManager *)self save];
  }
  if ([(FKFriendsManager *)self _shouldAddEmptyGroup]) {
    [(FKFriendsManager *)self _addEmptyGroup];
  }
}

- (void)purgeEmptyFriendGroups
{
  uint64_t v3 = [(NSMutableArray *)self->_friendGroups count] - 2;
  if (v3 >= 0)
  {
    char v4 = 0;
LABEL_3:
    uint64_t v5 = v3;
    do
    {
      unint64_t v6 = [(NSMutableArray *)self->_friendGroups objectAtIndexedSubscript:v5];
      if (![v6 count])
      {
        [(FKFriendsManager *)self _removeGroupAtIndex:v5];

        uint64_t v3 = v5 - 1;
        char v4 = 1;
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    while (v5-- > 0);
    if ((v4 & 1) == 0) {
      return;
    }
LABEL_11:
    self->_needsFriendListSync = 1;
    [(FKFriendsManager *)self save];
  }
}

- (void)_aggdSetValue:(int64_t)a3 forScalarKey:(__CFString *)a4
{
  if ([@"com.apple.ET" isEqualToString:self->_domain])
  {
    MEMORY[0x270F0B6D8](a4, a3);
  }
}

- (void)_aggdLogFriendCount
{
  unint64_t v3 = [(FKFriendsManager *)self _numberOfFriendsInList:self->_friendList];

  [(FKFriendsManager *)self _aggdSetValue:v3 forScalarKey:@"com.apple.et.friendList.size"];
}

- (void)_aggdLogFriendGroupCount
{
  uint64_t v3 = [(NSMutableArray *)self->_friendGroups count] - 1;

  [(FKFriendsManager *)self _aggdSetValue:v3 forScalarKey:@"com.apple.et.friendGroups.count"];
}

- (void)_postGroupListChangedNotification
{
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_119);

  [(FKFriendsManager *)self _aggdLogFriendGroupCount];
}

+ (void)setEnableEmptyTrailingGroup:(BOOL)a3 domain:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = NSNumber;
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(@"FKEmptyTrailingGroupEnabled", (CFPropertyListRef)[v5 numberWithBool:v4], applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (void)setFriendsChangedExternallyNotificationName:(id)a3 domain:(id)a4
{
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(@"FKFriendsChangedExternallyNotificationName", a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (void)setFriendGroupTitleChangedExternallyNotificationName:(id)a3 domain:(id)a4
{
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(@"FKFriendGroupTitleChangedExternallyNotificationName", a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (void)setRefreshAgainstContactsOnInitEnabled:(BOOL)a3 domain:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = NSNumber;
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(@"FKRefreshAgainstContactsOnInitEnabled", (CFPropertyListRef)[v5 numberWithBool:v4], applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

- (BOOL)shouldAllowAddingContact:(id)a3 withContactStore:(id)a4 personValueCache:(id)a5
{
  id v8 = a5;
  long long v9 = (const void *)[a4 personFromContact:a3];
  uint64_t RecordID = ABRecordGetRecordID(v9);
  long long v11 = (void *)ABRecordCopyValue(v9, *MEMORY[0x263F24498]);
  if ([(FKFriendsManager *)self containsFriendWithABRecordGUID:v11])
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v13 = [NSNumber numberWithInt:RecordID];
    uint64_t v14 = [v8 objectForKey:v13];
    if (!v14)
    {
      id v15 = NSNumber;
      __int16 v16 = +[FKPerson allValuesForPerson:v9];
      uint64_t v14 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));

      [v8 setObject:v14 forKey:v13];
    }
    BOOL v12 = [v14 unsignedIntegerValue] != 0;
  }
  return v12;
}

- (void)friendGroup:(id)a3 didSetFriend:(id)a4 atPosition:(unint64_t)a5
{
  id v11 = a4;
  unint64_t v8 = [(FKFriendsManager *)self _indexForPosition:a5 inGroup:a3];
  unint64_t v9 = [(NSMutableArray *)self->_friendList count];
  id v10 = v11;
  if (v8 < v9)
  {
    [(NSMutableArray *)self->_friendList setObject:v11 atIndexedSubscript:v8];
    [(NSHashTable *)self->_sourcedPersons removeObject:v11];
    self->_needsFriendListSync = 1;
    [(FKFriendsManager *)self _addEntryToChangeLogForPerson:v11 changeType:@"FKFriendsManagerPersonAdded"];
    if ([(FKFriendsManager *)self _shouldAddEmptyGroup]) {
      [(FKFriendsManager *)self _addEmptyGroup];
    }
    [(FKFriendsManager *)self _postChangeNotificationIfNecessary];
    unint64_t v9 = [(FKFriendsManager *)self save];
    id v10 = v11;
  }

  MEMORY[0x270F9A758](v9, v10);
}

- (void)friendGroup:(id)a3 didRemoveFriend:(id)a4 atPosition:(unint64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  unint64_t v9 = [(FKFriendsManager *)self _indexForPosition:a5 inGroup:v13];
  if (v9 < [(NSMutableArray *)self->_friendList count])
  {
    unint64_t v10 = [(FKFriendsManager *)self groupIndexContainingFriend:v8];
    friendList = self->_friendList;
    BOOL v12 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableArray *)friendList setObject:v12 atIndexedSubscript:v9];

    self->_needsFriendListSync = 1;
    if (v8)
    {
      [(FKFriendsManager *)self _addEntryToChangeLogForPerson:v8 changeType:@"FKFriendsManagerPersonDeleted"];
      [(FKFriendsManager *)self _removePersonFromIdentifiersToPersonMap:v8];
      if (![v13 count] && self->_maxFriendGroups >= 2) {
        [(FKFriendsManager *)self _removeGroupAtIndex:v10];
      }
      [(FKFriendsManager *)self _postChangeNotificationIfNecessary];
    }
    [(FKFriendsManager *)self save];
  }
}

- (void)friendGroup:(id)a3 didMoveFriends:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  self->_needsFriendListSync = 1;
  uint64_t v8 = [(NSMutableArray *)self->_friendGroups indexOfObject:v6];
  unint64_t maxFriendsPerGroup = self->_maxFriendsPerGroup;
  unint64_t v10 = maxFriendsPerGroup * v8;
  friendList = self->_friendList;
  BOOL v12 = [v6 friends];
  -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](friendList, "replaceObjectsInRange:withObjectsFromArray:", v10, maxFriendsPerGroup, v12);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [(FKFriendsManager *)self _addEntryToChangeLogForPerson:*(void *)(*((void *)&v18 + 1) + 8 * v17++), @"FKFriendsManagerPersonMoved", (void)v18 changeType];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  [(FKFriendsManager *)self _postChangeNotificationIfNecessary];
}

- (id)allPeople
{
  v2 = [(NSMapTable *)self->_identifiersToPersonMap objectEnumerator];
  uint64_t v3 = [v2 allObjects];

  return v3;
}

- (BOOL)addFriend:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_friendGroups;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (![v9 isFull])
        {
          int v11 = 0;
          [v9 addFriend:v4 error:&v11];
          LOBYTE(v6) = v11 == 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isPersonFriend:(id)a3
{
  if (a3) {
    return -[NSMutableArray containsObject:](self->_friendList, "containsObject:");
  }
  else {
    return 0;
  }
}

- (unint64_t)positionOfFriendInGroup:(id)a3
{
  unint64_t v4 = [(NSMutableArray *)self->_friendList indexOfObject:a3];
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    return v4 % self->_maxFriendsPerGroup;
  }
  return result;
}

- (BOOL)containsFriendWithABRecordGUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [(NSMapTable *)self->_identifiersToPersonMap objectForKey:v4];
    if (v5) {
      char v6 = [(NSMutableArray *)self->_friendList containsObject:v5];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)personLikePerson:(id)a3
{
  id v4 = a3;
  if (v4 && [(NSMutableArray *)self->_friendList count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      char v6 = [(FKFriendsManager *)self _friendAtPosition:v5];
      uint64_t v7 = v6;
      if (v6)
      {
        if ([v6 isLikePerson:v4]) {
          break;
        }
      }

      if (++v5 >= (unint64_t)[(NSMutableArray *)self->_friendList count]) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_friendAtPosition:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_friendList count] <= a3)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_friendList objectAtIndex:a3];
    char v6 = [MEMORY[0x263EFF9D0] null];

    if (v5 == v6) {
      id v7 = 0;
    }
    else {
      id v7 = v5;
    }
  }

  return v7;
}

- (void)save
{
  objc_initWeak(&location, self);
  saveQueue = self->_saveQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__FKFriendsManager_save__block_invoke;
  block[3] = &unk_264437CD8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(saveQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __24__FKFriendsManager_save__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained saveOperation];
  [v4 invalidate];

  id v5 = [FKDelayedOperation alloc];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __24__FKFriendsManager_save__block_invoke_2;
  v11[3] = &unk_264437CB0;
  objc_copyWeak(&v12, v2);
  id v7 = [(FKDelayedOperation *)v5 initWithQueue:v6 delay:v11 block:0.1];
  id v8 = objc_loadWeakRetained(v2);
  [v8 setSaveOperation:v7];

  id v9 = objc_loadWeakRetained(v2);
  unint64_t v10 = [v9 saveOperation];
  [v10 execute];

  objc_destroyWeak(&v12);
}

void __24__FKFriendsManager_save__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _save];
}

- (void)_save
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_saveQueue);
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_friendList];
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [v3 count];
  id v7 = [MEMORY[0x263EFF9D0] null];
  id v8 = [NSDictionary dictionary];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      unint64_t v10 = [v3 objectAtIndex:i];
      int v11 = v10;
      if (v10 == v7)
      {
        id v12 = v8;
      }
      else
      {
        id v12 = [v10 dictionaryRepresentation];
        if ([v11 needsSave]) {
          [v5 addObject:v11];
        }
      }
      [v4 addObject:v12];
    }
  }
  if (self->_needsFriendListSync || [v5 count])
  {
    CFPreferencesSetAppValue(@"FriendList", v4, (CFStringRef)self->_domain);
    CFPreferencesAppSynchronize((CFStringRef)self->_domain);
    if (self->_needsFriendListSync && NPSHasCompletedInitialSync())
    {
      npsManager = self->_npsManager;
      domain = self->_domain;
      long long v15 = [MEMORY[0x263EFFA08] setWithObject:@"FriendList"];
      [(NPSManager *)npsManager synchronizeUserDefaultsDomain:domain keys:v15];
    }
    uint64_t v16 = _FKGetLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v29 = "-[FKFriendsManager _save]";
      __int16 v30 = 1024;
      int v31 = 849;
      _os_log_impl(&dword_21CBC2000, v16, OS_LOG_TYPE_DEFAULT, "%s (%d) \"friend list saved\"", buf, 0x12u);
    }

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__FKFriendsManager__save__block_invoke;
    block[3] = &unk_264437CB0;
    objc_copyWeak(&v26, (id *)buf);
    dispatch_async(MEMORY[0x263EF83A0], block);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v17 = v5;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * j) setNeedsSave:0];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v18);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  self->_needsFriendListSync = 0;
}

void __25__FKFriendsManager__save__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _incrementExternalChangePostCount];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = objc_loadWeakRetained(v1);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)[v4 _notificationForExternalListChange], 0, 0, 1u);
}

- (void)_incrementExternalChangePostCount
{
}

- (__CFString)_notificationForExternalListChange
{
  return self->_friendsChangedExternallyNotificationName;
}

- (id)personWithDestinations:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
  uint64_t v6 = [v5 fkSanitizedDestinationSet];
  id v7 = [v6 allObjects];

  id v8 = [(NSMapTable *)self->_identifiersToPersonMap keyEnumerator];
  id v9 = [v8 allObjects];

  unint64_t v10 = [v9 firstObjectCommonWithArray:v7];
  if (v10)
  {
    id v11 = [(NSMapTable *)self->_identifiersToPersonMap objectForKey:v10];
  }
  else
  {
    uint64_t v20 = 0;
    long long v21 = &v20;
    uint64_t v22 = 0x3032000000;
    long long v23 = __Block_byref_object_copy_;
    long long v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __43__FKFriendsManager_personWithDestinations___block_invoke;
    id v17 = &unk_264437D00;
    uint64_t v19 = &v20;
    id v18 = v7;
    +[FKAddressBook performBlock:&v14];
    -[FKFriendsManager _storeSourcedPerson:](self, "_storeSourcedPerson:", v21[5], v14, v15, v16, v17);
    id v11 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  id v12 = v11;

  return v12;
}

uint64_t __43__FKFriendsManager_personWithDestinations___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[FKPerson alloc] initWithDestinations:*(void *)(a1 + 32) addressBook:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x270F9A758](v3, v5);
}

- (id)personWithABRecordGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_identifiersToPersonMap objectForKey:v4];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  if (!v5)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    unint64_t v10 = __43__FKFriendsManager_personWithABRecordGUID___block_invoke;
    id v11 = &unk_264437D00;
    long long v13 = &v14;
    id v12 = v4;
    +[FKAddressBook performBlock:&v8];
    -[FKFriendsManager _storeSourcedPerson:](self, "_storeSourcedPerson:", v15[5], v8, v9, v10, v11);
    id v5 = (id)v15[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v14, 8);

  return v6;
}

uint64_t __43__FKFriendsManager_personWithABRecordGUID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[FKPerson alloc] initWithABRecordGUID:*(void *)(a1 + 32) addressBook:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x270F9A758](v3, v5);
}

- (void)_storeSourcedPerson:(id)a3
{
  sourcedPersons = self->_sourcedPersons;
  id v5 = a3;
  [(NSHashTable *)sourcedPersons addObject:v5];
  [(FKFriendsManager *)self _addPersonToIdentifiersToPersonMap:v5];
}

- (void)_addPersonToIdentifiersToPersonMap:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v4, "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) fkMessageCanonicalRawAddress];
        [(NSMapTable *)self->_identifiersToPersonMap setObject:v4 forKey:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v11 = [v4 abRecordGUID];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    identifiersToPersonMap = self->_identifiersToPersonMap;
    uint64_t v14 = [v4 abRecordGUID];
    [(NSMapTable *)identifiersToPersonMap setObject:v4 forKey:v14];
  }
}

- (void)_removePersonFromIdentifiersToPersonMap:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v4, "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) fkMessageCanonicalRawAddress];
        [(NSMapTable *)self->_identifiersToPersonMap removeObjectForKey:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v11 = [v4 abRecordGUID];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    identifiersToPersonMap = self->_identifiersToPersonMap;
    uint64_t v14 = [v4 abRecordGUID];
    [(NSMapTable *)identifiersToPersonMap removeObjectForKey:v14];
  }
}

- (void)_createAddressToPersonDictionary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(NSMapTable *)self->_identifiersToPersonMap removeAllObjects];
  if ([(NSMutableArray *)self->_friendList count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [(NSMutableArray *)self->_friendList objectAtIndexedSubscript:v3];
      id v5 = [MEMORY[0x263EFF9D0] null];
      if (v4 == v5) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v4;
      }
      id v7 = v6;

      if (v7) {
        [(FKFriendsManager *)self _addPersonToIdentifiersToPersonMap:v7];
      }

      ++v3;
    }
    while (v3 < [(NSMutableArray *)self->_friendList count]);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = self->_sourcedPersons;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[FKFriendsManager _addPersonToIdentifiersToPersonMap:](self, "_addPersonToIdentifiersToPersonMap:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)setServiceName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  serviceName = self->_serviceName;
  p_serviceName = &self->_serviceName;
  uint64_t v6 = serviceName;
  if (!v5 && v6 || ![(NSString *)v6 isEqualToString:v5])
  {
    objc_storeStrong((id *)p_serviceName, a3);
    uint64_t v9 = _FKGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *p_serviceName;
      int v11 = 136315650;
      uint64_t v12 = "-[FKFriendsManager setServiceName:]";
      __int16 v13 = 1024;
      int v14 = 975;
      __int16 v15 = 2112;
      long long v16 = v10;
      _os_log_impl(&dword_21CBC2000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"setting service name for reachability queries to %@\"", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (id)_destinations
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263EFF9C0] set];
  if ([(NSMutableArray *)self->_friendList count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(FKFriendsManager *)self _friendAtPosition:v4];
      uint64_t v6 = v5;
      if (v5)
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v7 = objc_msgSend(v5, "allValues", 0);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v16;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) fkMessageIDSIdentifier];
              if (v12) {
                [v3 addObject:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v9);
        }
      }
      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_friendList count]);
  }
  __int16 v13 = [v3 allObjects];

  return v13;
}

- (void)_setupQueryController
{
  [(IDSBatchIDQueryController *)self->_queryController invalidate];
  if (self->_serviceName)
  {
    id v3 = objc_alloc(MEMORY[0x263F4A008]);
    unint64_t v4 = (IDSBatchIDQueryController *)[v3 initWithService:self->_serviceName delegate:self queue:MEMORY[0x263EF83A0]];
  }
  else
  {
    unint64_t v4 = 0;
  }
  queryController = self->_queryController;
  self->_queryController = v4;

  MEMORY[0x270F9A758](v4, queryController);
}

- (void)refreshDestinationStatuses
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(NSMutableSet *)self->_highPriorityDestinations count])
  {
    id v3 = _FKGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = [(NSMutableSet *)self->_highPriorityDestinations allObjects];
      id v5 = [v4 componentsJoinedByString:@", "];
      int v10 = 136315650;
      int v11 = "-[FKFriendsManager refreshDestinationStatuses]";
      __int16 v12 = 1024;
      int v13 = 1030;
      __int16 v14 = 2112;
      long long v15 = v5;
      _os_log_impl(&dword_21CBC2000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"not starting batch query because high priority query is in progress for [ %@ ]\"", (uint8_t *)&v10, 0x1Cu);
    }
    uint64_t v6 = [(FKFriendsManager *)self _destinations];
    pendingDestinations = self->_pendingDestinations;
    self->_pendingDestinations = v6;
  }
  else
  {
    pendingDestinations = [(FKFriendsManager *)self _destinations];
    uint64_t v8 = _FKGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [pendingDestinations componentsJoinedByString:@", "];
      int v10 = 136315650;
      int v11 = "-[FKFriendsManager refreshDestinationStatuses]";
      __int16 v12 = 1024;
      int v13 = 1012;
      __int16 v14 = 2112;
      long long v15 = v9;
      _os_log_impl(&dword_21CBC2000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"setting destinations to [ %@ ]\"", (uint8_t *)&v10, 0x1Cu);
    }
    [(FKFriendsManager *)self _initiateIDSDestinationStatusQuery:pendingDestinations];
  }
}

- (int64_t)_compareStatus:(int64_t)a3 toStatus:(int64_t)a4
{
  int64_t result = 1;
  if (a3 != 1 && a4 != 1)
  {
    if (a3 || a4 != 2)
    {
      if (a4 <= a3) {
        int64_t v5 = a3;
      }
      else {
        int64_t v5 = a4;
      }
      if (a4) {
        BOOL v6 = 0;
      }
      else {
        BOOL v6 = a3 == 2;
      }
      if (v6) {
        return 0;
      }
      else {
        return v5;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)idStatusUpdatedForDestinations:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v36 = v4;
    int64_t v5 = self;
    [(FKFriendsManager *)self _stopIDSQueryTimeoutTimer];
    BOOL v6 = [MEMORY[0x263EFF9A0] dictionary];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v7 = v36;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(v7);
          }
          int v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          __int16 v12 = [v7 objectForKey:v11];
          int v13 = [v11 fkMessageCanonicalRawAddress];
          [v6 setObject:v12 forKey:v13];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v8);
    }

    __int16 v14 = _FKGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v60 = "-[FKFriendsManager idStatusUpdatedForDestinations:]";
      __int16 v61 = 1024;
      int v62 = 1061;
      __int16 v63 = 2112;
      id v64 = v7;
      _os_log_impl(&dword_21CBC2000, v14, OS_LOG_TYPE_DEFAULT, "%s (%d) \"IDS statusues updated: %@\"", buf, 0x1Cu);
    }

    [(NSMutableDictionary *)v5->_cachedStatuses addEntriesFromDictionary:v6];
    objc_initWeak(&location, v5);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__FKFriendsManager_idStatusUpdatedForDestinations___block_invoke;
    block[3] = &unk_264437CD8;
    objc_copyWeak(&v51, &location);
    id v35 = v6;
    id v50 = v35;
    dispatch_async(MEMORY[0x263EF83A0], block);
    highPriorityDestinations = v5->_highPriorityDestinations;
    if (!highPriorityDestinations || ![(NSMutableSet *)highPriorityDestinations count])
    {
      uint64_t v16 = [MEMORY[0x263EFF9C0] set];
      cachedStatuses = v5->_cachedStatuses;
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __51__FKFriendsManager_idStatusUpdatedForDestinations___block_invoke_2;
      void v47[3] = &unk_264437D28;
      id v18 = v16;
      id v48 = v18;
      [(NSMutableDictionary *)cachedStatuses enumerateKeysAndObjectsUsingBlock:v47];
      char v38 = v18;
      if ([v18 count])
      {
        id v19 = [MEMORY[0x263EFF9D0] null];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id obj = v5->_friendList;
        uint64_t v20 = 0;
        uint64_t v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v58 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v44 != v22) {
                objc_enumerationMutation(obj);
              }
              long long v24 = *(void **)(*((void *)&v43 + 1) + 8 * j);
              if (v24 != v19)
              {
                id v25 = v24;
                id v26 = [v25 allValues];
                int v27 = [v26 intersectsSet:v38];

                v20 += v27 ^ 1u;
              }
            }
            uint64_t v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v58 count:16];
          }
          while (v21);
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      [(FKFriendsManager *)v5 _aggdSetValue:v20 forScalarKey:@"com.apple.et.unreachableFriends.count"];
    }
    [v7 allKeys];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v57 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v28);
          }
          [(NSMutableSet *)v5->_highPriorityDestinations removeObject:*(void *)(*((void *)&v39 + 1) + 8 * k)];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v57 count:16];
      }
      while (v29);
    }

    if (![(NSMutableSet *)v5->_highPriorityDestinations count]
      && [(NSArray *)v5->_pendingDestinations count])
    {
      uint64_t v32 = _FKGetLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [(NSArray *)v5->_pendingDestinations componentsJoinedByString:@", "];
        *(_DWORD *)buf = 136315650;
        v60 = "-[FKFriendsManager idStatusUpdatedForDestinations:]";
        __int16 v61 = 1024;
        int v62 = 1107;
        __int16 v63 = 2112;
        id v64 = v33;
        _os_log_impl(&dword_21CBC2000, v32, OS_LOG_TYPE_DEFAULT, "%s (%d) \"High priority status request completed, starting query for pending destinations: [ %@ ]\"", buf, 0x1Cu);
      }
      [(FKFriendsManager *)v5 _initiateIDSDestinationStatusQuery:v5->_pendingDestinations];
      pendingDestinations = v5->_pendingDestinations;
      v5->_pendingDestinations = 0;
    }
    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);

    id v4 = v36;
  }
}

void __51__FKFriendsManager_idStatusUpdatedForDestinations___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v6 = @"FKFriendsManagerDestinationStatusUpdatedDestinationsKey";
  v7[0] = v4;
  int64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"FKFriendsManagerDestinationStatusUpdatedNotification" object:WeakRetained userInfo:v5];
}

void __51__FKFriendsManager_idStatusUpdatedForDestinations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 integerValue] == 1) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (int64_t)statusForPerson:(id)a3 requery:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(FKFriendsManager *)self _shouldBypassDestinationStatusCheck])
  {
    unint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [v6 allValues];
    if ([v8 count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        unint64_t v7 = -1;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            __int16 v14 = -[NSMutableDictionary objectForKey:](self->_cachedStatuses, "objectForKey:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
            long long v15 = v14;
            if (v14) {
              uint64_t v16 = [v14 integerValue];
            }
            else {
              uint64_t v16 = -1;
            }
            unint64_t v7 = [(FKFriendsManager *)self _compareStatus:v7 toStatus:v16];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
        }
        while (v11);
      }
      else
      {
        unint64_t v7 = -1;
      }

      if (v4)
      {
        [(FKFriendsManager *)self _queryDestinations:v9];
        if (v7 == -1) {
          unint64_t v7 = 0;
        }
      }
      long long v17 = _FKGetLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (v7 > 2) {
          id v18 = @"unspecified";
        }
        else {
          id v18 = off_264438020[v7];
        }
        *(_DWORD *)buf = 136315906;
        id v25 = "-[FKFriendsManager statusForPerson:requery:]";
        __int16 v26 = 1024;
        int v27 = 1142;
        __int16 v28 = 2112;
        id v29 = v6;
        __int16 v30 = 2112;
        int v31 = v18;
        _os_log_impl(&dword_21CBC2000, v17, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ has cached best status of: %@\"", buf, 0x26u);
      }
    }
    else
    {
      unint64_t v7 = 2;
    }
  }
  return v7;
}

- (id)reachableDestinationsForPerson:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = [v4 set];
  cachedStatuses = self->_cachedStatuses;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__FKFriendsManager_reachableDestinationsForPerson___block_invoke;
  v13[3] = &unk_264437D28;
  id v14 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)cachedStatuses enumerateKeysAndObjectsUsingBlock:v13];
  id v9 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v10 = [v5 allValues];

  uint64_t v11 = [v9 setWithSet:v10];

  [v11 intersectSet:v8];

  return v11;
}

void __51__FKFriendsManager_reachableDestinationsForPerson___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 integerValue] == 1) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)_queryDestinations:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_highPriorityDestinations)
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    highPriorityDestinations = self->_highPriorityDestinations;
    self->_highPriorityDestinations = v5;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  id v9 = v7;
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v10 = v8;
  char v11 = 0;
  uint64_t v12 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v7);
      }
      id v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "fkMessageIDSIdentifier", (void)v18);
      if (v14 && ([(NSMutableSet *)self->_highPriorityDestinations containsObject:v14] & 1) == 0)
      {
        [(NSMutableSet *)self->_highPriorityDestinations addObject:v14];
        char v11 = 1;
      }
    }
    uint64_t v10 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  }
  while (v10);

  if (v11)
  {
    long long v15 = [(NSMutableSet *)self->_highPriorityDestinations allObjects];
    [(FKFriendsManager *)self _initiateIDSDestinationStatusQuery:v15];

    id v9 = _FKGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(NSMutableSet *)self->_highPriorityDestinations allObjects];
      long long v17 = [v16 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 136315650;
      long long v23 = "-[FKFriendsManager _queryDestinations:]";
      __int16 v24 = 1024;
      int v25 = 1182;
      __int16 v26 = 2112;
      int v27 = v17;
      _os_log_impl(&dword_21CBC2000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"started high-priority query for [ %@ ]\"", buf, 0x1Cu);
    }
LABEL_16:
  }
}

- (void)_initiateIDSDestinationStatusQuery:(id)a3
{
  id v4 = a3;
  [(FKFriendsManager *)self _setupQueryController];
  [(IDSBatchIDQueryController *)self->_queryController setDestinations:v4];

  [(FKFriendsManager *)self _startIDSQueryTimeoutTimer];
}

- (void)_startIDSQueryTimeoutTimer
{
  if (!self->_idsQueryTimeoutTimer)
  {
    id v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__idsQueryTimeoutTimerFired selector:0 userInfo:0 repeats:30.0];
    idsQueryTimeoutTimer = self->_idsQueryTimeoutTimer;
    self->_idsQueryTimeoutTimer = v3;
    MEMORY[0x270F9A758](v3, idsQueryTimeoutTimer);
  }
}

- (void)_stopIDSQueryTimeoutTimer
{
  [(NSTimer *)self->_idsQueryTimeoutTimer invalidate];
  idsQueryTimeoutTimer = self->_idsQueryTimeoutTimer;
  self->_idsQueryTimeoutTimer = 0;
}

- (void)_idsQueryTimeoutTimerFired
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  idsQueryTimeoutTimer = self->_idsQueryTimeoutTimer;
  self->_idsQueryTimeoutTimer = 0;

  id v4 = _FKGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[FKFriendsManager _idsQueryTimeoutTimerFired]";
    __int16 v10 = 1024;
    int v11 = 1223;
    _os_log_impl(&dword_21CBC2000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"IDS Query took too long to respond, clearing request queues\"", (uint8_t *)&v8, 0x12u);
  }

  if ([(NSMutableSet *)self->_highPriorityDestinations count])
  {
    [(NSMutableSet *)self->_highPriorityDestinations removeAllObjects];
    if ([(NSArray *)self->_pendingDestinations count])
    {
      id v5 = _FKGetLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(NSArray *)self->_pendingDestinations componentsJoinedByString:@", "];
        int v8 = 136315650;
        id v9 = "-[FKFriendsManager _idsQueryTimeoutTimerFired]";
        __int16 v10 = 1024;
        int v11 = 1233;
        __int16 v12 = 2112;
        int v13 = v6;
        _os_log_impl(&dword_21CBC2000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"IDS Query timed out on high priority queue, starting query for pending destinations: [ %@ ]\"", (uint8_t *)&v8, 0x1Cu);
      }
      [(FKFriendsManager *)self _initiateIDSDestinationStatusQuery:self->_pendingDestinations];
      pendingDestinations = self->_pendingDestinations;
      self->_pendingDestinations = 0;
    }
  }
}

- (BOOL)_shouldBypassDestinationStatusCheck
{
  if (!self->_serviceName) {
    return 1;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__FKFriendsManager__shouldBypassDestinationStatusCheck__block_invoke;
  block[3] = &unk_264437B60;
  void block[4] = self;
  if (_shouldBypassDestinationStatusCheck_once != -1) {
    dispatch_once(&_shouldBypassDestinationStatusCheck_once, block);
  }
  return _shouldBypassDestinationStatusCheck___shouldBypassDestinationStatusCheck != 0;
}

void __55__FKFriendsManager__shouldBypassDestinationStatusCheck__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v2 = [v4 persistentDomainForName:*(void *)(*(void *)(a1 + 32) + 8)];
  id v3 = [v2 objectForKey:@"ETSkipHasGizmoCheck"];
  _shouldBypassDestinationStatusCheck___shouldBypassDestinationStatusChecuint64_t k = [v3 BOOLValue];
}

- (unint64_t)_indexForPosition:(unint64_t)a3 inGroup:(id)a4
{
  return a3 + self->_maxFriendsPerGroup * [(NSMutableArray *)self->_friendGroups indexOfObject:a4];
}

- (int64_t)_firstEmptyPosition
{
  if (![(NSMutableArray *)self->_friendList count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v3 = 0;
  while (1)
  {
    id v4 = [(NSMutableArray *)self->_friendList objectAtIndex:v3];
    id v5 = [MEMORY[0x263EFF9D0] null];

    if (v4 == v5) {
      break;
    }
    if (++v3 >= (unint64_t)[(NSMutableArray *)self->_friendList count]) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v3;
}

- (unint64_t)_numberOfFriendsInList:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v4 = [MEMORY[0x263EFF9D0] null];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__FKFriendsManager__numberOfFriendsInList___block_invoke;
  v8[3] = &unk_264437D50;
  id v5 = v4;
  id v9 = v5;
  __int16 v10 = &v11;
  [v3 enumerateObjectsUsingBlock:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __43__FKFriendsManager__numberOfFriendsInList___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2) {
    ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  }
  return result;
}

- (void)_postChangeNotificationIfNecessary
{
  objc_initWeak(&location, self);
  BOOL didCompleteInitialLoading = self->_didCompleteInitialLoading;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__FKFriendsManager__postChangeNotificationIfNecessary__block_invoke;
  block[3] = &unk_264437D78;
  objc_copyWeak(&v5, &location);
  BOOL v6 = didCompleteInitialLoading;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__FKFriendsManager__postChangeNotificationIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (void *)[WeakRetained _copyAndResetChangeLog];

  uint64_t v5 = [v4 count];
  if (v5)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v6 = v5;
      unint64_t v7 = _FKGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = @"entries";
        *(_DWORD *)__int16 v12 = 136316162;
        *(void *)&v12[4] = "-[FKFriendsManager _postChangeNotificationIfNecessary]_block_invoke";
        *(_WORD *)&v12[12] = 1024;
        *(_DWORD *)&v12[14] = 1299;
        *(void *)&v12[20] = @"FKFriendsManagerChangedNotification";
        *(_WORD *)&unsigned char v12[18] = 2112;
        if (v6 == 1) {
          int v8 = @"entry";
        }
        *(_WORD *)&v12[28] = 1024;
        *(_DWORD *)&v12[30] = v6;
        __int16 v13 = 2112;
        uint64_t v14 = v8;
        _os_log_impl(&dword_21CBC2000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"posting %@ with %u changelog %@\"", v12, 0x2Cu);
      }
    }
    id v9 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", *(_OWORD *)v12, *(_OWORD *)&v12[16]);
    id v10 = objc_loadWeakRetained(v2);
    [v9 postNotificationName:@"FKFriendsManagerChangedNotification" object:v10 userInfo:v4];

    id v11 = objc_loadWeakRetained(v2);
    [v11 _aggdLogFriendCount];
  }
}

- (void)_personValuesChanged:(id)a3
{
  id v4 = [a3 object];
  [(FKFriendsManager *)self _addEntryToChangeLogForPerson:v4 changeType:@"FKFriendsManagerPersonUpdated"];
  [(FKFriendsManager *)self _postChangeNotificationIfNecessary];
  if ([(NSMutableArray *)self->_friendList containsObject:v4]) {
    [(FKFriendsManager *)self save];
  }
}

- (void)_friendsChangedExternally
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t postCount = self->_postCount;
  if (postCount)
  {
    self->_unint64_t postCount = postCount - 1;
  }
  else
  {
    id v4 = _FKGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[FKFriendsManager _friendsChangedExternally]";
      __int16 v7 = 1024;
      int v8 = 1319;
      _os_log_impl(&dword_21CBC2000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Handling external friends-changed event.\"", (uint8_t *)&v5, 0x12u);
    }

    [(FKFriendsManager *)self _loadFriendList];
  }
}

- (void)_loadGroupTitles
{
  CFPreferencesAppSynchronize((CFStringRef)self->_domain);
  id v9 = (id)CFPreferencesCopyAppValue(@"ETFriendGroupTitles", (CFStringRef)self->_domain);
  unint64_t v3 = [(NSMutableArray *)self->_friendGroups count];
  unint64_t v4 = [v9 count];
  if (v3 >= v4) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = v3;
  }
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      __int16 v7 = [v9 objectAtIndexedSubscript:i];
      int v8 = [(NSMutableArray *)self->_friendGroups objectAtIndexedSubscript:i];
      [v8 setTitle:v7];
    }
  }
}

- (void)_groupTitleChangedExternally
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = _FKGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    unint64_t v5 = "-[FKFriendsManager _groupTitleChangedExternally]";
    __int16 v6 = 1024;
    int v7 = 1338;
    _os_log_impl(&dword_21CBC2000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Handling external group-title-changed event.\"", (uint8_t *)&v4, 0x12u);
  }

  [(FKFriendsManager *)self _loadGroupTitles];
}

- (void)_addressBookChanged:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = _FKGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = [v4 name];
    *(_DWORD *)buf = 136315650;
    id v9 = "-[FKFriendsManager _addressBookChanged:]";
    __int16 v10 = 1024;
    int v11 = 1343;
    __int16 v12 = 2112;
    __int16 v13 = v6;
    _os_log_impl(&dword_21CBC2000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"received %@\"", buf, 0x1Cu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__FKFriendsManager__addressBookChanged___block_invoke;
  block[3] = &unk_264437B60;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __40__FKFriendsManager__addressBookChanged___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) isValid];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 137) = 1;
    uint64_t v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_refreshAgainstAddressBook selector:0 userInfo:0 repeats:0.2];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 88);
    *(void *)(v4 + 88) = v3;
    return MEMORY[0x270F9A758](v3, v5);
  }
  return result;
}

- (void)_updateFriends:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __35__FKFriendsManager__updateFriends___block_invoke;
  id v9 = &unk_264437DF0;
  id v10 = v4;
  int v11 = self;
  id v5 = v4;
  +[FKAddressBook performBlock:&v6];
  self->_needsAddressBookRefresh = [(FKFriendsManager *)self _changeLogContainsFriendAdditionsOrUpdates];
}

void __35__FKFriendsManager__updateFriends___block_invoke(uint64_t a1, ABAddressBookRef a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = (void *)ABAddressBookCopyUniqueIdentifier();

  if (v4)
  {
    ABAddressBookRef v5 = 0;
  }
  else
  {
    *(void *)error = 0;
    ABAddressBookRef v6 = ABAddressBookCreateWithOptions(0, (CFErrorRef *)error);
    ABAddressBookRef v5 = v6;
    if (*(void *)error)
    {
      if (v6) {
        CFRelease(v6);
      }
      ABAddressBookRef v6 = a2;
    }
    a2 = v6;
  }
  CFTypeRef cf = v5;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __35__FKFriendsManager__updateFriends___block_invoke_2;
  v31[3] = &unk_264437DA0;
  uint64_t v8 = *(void **)(a1 + 32);
  v31[4] = *(void *)(a1 + 40);
  ABAddressBookRef v33 = a2;
  id v9 = v7;
  id v32 = v9;
  [v8 enumerateObjectsUsingBlock:v31];
  unint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 64) count];
  unint64_t v11 = (unint64_t)((double)*(unint64_t *)(*(void *)(a1 + 40) + 24)
                         * ceilf((float)(unint64_t)[*(id *)(a1 + 32) count]/ (float)*(unint64_t *)(*(void *)(a1 + 40) + 24)));
  if (v10 > v11)
  {
    __int16 v12 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v11, v10 - v11);
    __int16 v13 = *(void **)(*(void *)(a1 + 40) + 64);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __35__FKFriendsManager__updateFriends___block_invoke_3;
    v29[3] = &unk_264437DC8;
    id v30 = v9;
    [v13 enumerateObjectsAtIndexes:v12 options:1 usingBlock:v29];
    [*(id *)(*(void *)(a1 + 40) + 64) removeObjectsAtIndexes:v12];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v9;
  uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v19 = _FKGetLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          [v18 displayName];
          v21 = uint64_t v20 = a1;
          long long v22 = [v18 abRecordGUID];
          *(_DWORD *)error = 136315906;
          *(void *)&error[4] = "-[FKFriendsManager _updateFriends:]_block_invoke";
          __int16 v35 = 1024;
          int v36 = 1489;
          __int16 v37 = 2112;
          char v38 = v21;
          __int16 v39 = 2112;
          long long v40 = v22;
          _os_log_impl(&dword_21CBC2000, v19, OS_LOG_TYPE_DEFAULT, "%s (%d) \"[%@] [ABGUID=%@] was displaced and removed\"", error, 0x26u);

          a1 = v20;
        }

        [*(id *)(a1 + 40) _addEntryToChangeLogForPerson:v18 changeType:@"FKFriendsManagerPersonDeleted"];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v15);
  }

  if (cf) {
    CFRelease(cf);
  }
  [*(id *)(a1 + 40) save];
}

void __35__FKFriendsManager__updateFriends___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 64) count] <= a3)
  {
    ABAddressBookRef v6 = [v5 objectForKey:@"AllValues"];
    if (![v6 count]) {
      goto LABEL_55;
    }
    long long v18 = [[FKPerson alloc] initWithDictionaryRepresentation:v5 addressBook:*(void *)(a1 + 48)];
    while ([*(id *)(*(void *)(a1 + 32) + 64) count] <= a3)
      [*(id *)(a1 + 32) _addEmptyGroup];
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v18 atIndexedSubscript:a3];
    [*(id *)(*(void *)(a1 + 32) + 120) removeObject:v18];
    [*(id *)(a1 + 32) _addEntryToChangeLogForPerson:v18 changeType:@"FKFriendsManagerPersonAdded"];
LABEL_30:

    goto LABEL_55;
  }
  ABAddressBookRef v6 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndexedSubscript:a3];
  uint64_t v7 = [MEMORY[0x263EFF9D0] null];

  uint64_t v8 = [v5 allKeys];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    if (v6 != v7) {
      [*(id *)(a1 + 40) addObject:v6];
    }
    long long v18 = [MEMORY[0x263EFF9D0] null];
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v18 atIndexedSubscript:a3];
    goto LABEL_30;
  }
  if (v6 == v7 || ([v6 isEqualToDictionaryRepresentation:v5] & 1) == 0)
  {
    id v32 = v7;
    for (unint64_t i = a3 + 1; i < [*(id *)(*(void *)(a1 + 32) + 64) count]; ++i)
    {
      uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndexedSubscript:i];
      uint64_t v21 = [MEMORY[0x263EFF9D0] null];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        long long v22 = (void *)v21;
        long long v23 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndexedSubscript:i];
        char v24 = [v23 isEqualToDictionaryRepresentation:v5];

        if (v24)
        {
          id v10 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndexedSubscript:i];
          [*(id *)(a1 + 32) _addEntryToChangeLogForPerson:v10 changeType:@"FKFriendsManagerPersonMoved"];
          long long v27 = [MEMORY[0x263EFF9D0] null];
          [*(id *)(*(void *)(a1 + 32) + 64) setObject:v27 atIndexedSubscript:i];

          if (v10) {
            goto LABEL_47;
          }
          break;
        }
      }
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = *(id *)(a1 + 40);
    id v10 = (id)[v28 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v10)
    {
      uint64_t v29 = *(void *)v38;
      while (2)
      {
        for (uint64_t j = 0; j != v10; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v28);
          }
          int v31 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
          if ([v31 isEqualToDictionaryRepresentation:v5])
          {
            id v10 = v31;
            [*(id *)(a1 + 40) removeObject:v10];
            [*(id *)(a1 + 32) _addEntryToChangeLogForPerson:v10 changeType:@"FKFriendsManagerPersonMoved"];
            goto LABEL_46;
          }
        }
        id v10 = (id)[v28 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_46:

LABEL_47:
    if (v6 != v32) {
      [*(id *)(a1 + 40) addObject:v6];
    }
    if (v10) {
      [*(id *)(*(void *)(a1 + 32) + 64) setObject:v10 atIndexedSubscript:a3];
    }

    if (!v10) {
      goto LABEL_6;
    }
LABEL_52:
    if ([v10 updateFromDictionaryRepresentation:v5]) {
      [*(id *)(a1 + 32) _addEntryToChangeLogForPerson:v10 changeType:@"FKFriendsManagerPersonUpdated"];
    }
    ABAddressBookRef v6 = v10;
    goto LABEL_55;
  }
  id v10 = v6;
  if (v6) {
    goto LABEL_52;
  }
LABEL_6:
  unint64_t v11 = [[FKPerson alloc] initWithDictionaryRepresentation:v5 addressBook:*(void *)(a1 + 48)];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = *(id *)(*(void *)(a1 + 32) + 120);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
LABEL_8:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v34 != v15) {
        objc_enumerationMutation(v12);
      }
      long long v17 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
      if ([(FKPerson *)v11 isLikePerson:v17]) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v14) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
    id v25 = v17;

    if (!v25) {
      goto LABEL_33;
    }
    long long v26 = (FKPerson *)v25;

    [*(id *)(*(void *)(a1 + 32) + 120) removeObject:v26];
    unint64_t v11 = v26;
  }
  else
  {
LABEL_14:

LABEL_33:
    long long v26 = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v11 atIndexedSubscript:a3];
  [*(id *)(a1 + 32) _addEntryToChangeLogForPerson:v11 changeType:@"FKFriendsManagerPersonAdded"];

  ABAddressBookRef v6 = 0;
LABEL_55:
}

void __35__FKFriendsManager__updateFriends___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [MEMORY[0x263EFF9D0] null];

  id v4 = v5;
  if (v3 != v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

- (void)_cleanUpFriendListIfNecessary
{
  [(FKFriendsManager *)self _deduplicateFriendListIfNecessary];
  [(FKFriendsManager *)self _removeDestinationlessFriendsIfNecessary];

  [(FKFriendsManager *)self save];
}

- (void)_deduplicateFriendListIfNecessary
{
  if (self->_shouldDeduplicateFriendList)
  {
    id v3 = [MEMORY[0x263F089C8] indexSet];
    id v4 = [MEMORY[0x263EFF9C0] set];
    friendList = self->_friendList;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __53__FKFriendsManager__deduplicateFriendListIfNecessary__block_invoke;
    unint64_t v11 = &unk_264437E18;
    id v12 = v4;
    id v13 = v3;
    id v6 = v3;
    id v7 = v4;
    [(NSMutableArray *)friendList enumerateObjectsUsingBlock:&v8];
    -[FKFriendsManager _removeFriendsAtIndices:](self, "_removeFriendsAtIndices:", v6, v8, v9, v10, v11);
  }
}

void __53__FKFriendsManager__deduplicateFriendListIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v6 abRecordGUID];
    int v8 = [*(id *)(a1 + 32) containsObject:v7];
    if (v7 && v8)
    {
      [*(id *)(a1 + 40) addIndex:a3];
      uint64_t v9 = _FKGetLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v6 displayName];
        uint64_t v11 = *(void *)(a1 + 32);
        int v13 = 136316418;
        uint64_t v14 = "-[FKFriendsManager _deduplicateFriendListIfNecessary]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 1529;
        __int16 v17 = 2112;
        long long v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v7;
        __int16 v21 = 2048;
        uint64_t v22 = a3;
        __int16 v23 = 2112;
        uint64_t v24 = v11;
        _os_log_impl(&dword_21CBC2000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"deduplicating friend [%@] [ABGUID=%@] at index %lu as it is already present in the set of friend ABGUIDs analyzed so far: %@\"", (uint8_t *)&v13, 0x3Au);
      }
    }
    else
    {
      if (v7) {
        char v12 = v8;
      }
      else {
        char v12 = 1;
      }
      if ((v12 & 1) == 0) {
        [*(id *)(a1 + 32) addObject:v7];
      }
    }
  }
}

- (void)_removeDestinationlessFriendsIfNecessary
{
  if (self->_shouldRemoveDestinationlessFriends)
  {
    id v3 = [MEMORY[0x263F089C8] indexSet];
    friendList = self->_friendList;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__FKFriendsManager__removeDestinationlessFriendsIfNecessary__block_invoke;
    v6[3] = &unk_264437DC8;
    id v7 = v3;
    id v5 = v3;
    [(NSMutableArray *)friendList enumerateObjectsUsingBlock:v6];
    [(FKFriendsManager *)self _removeFriendsAtIndices:v5];
  }
}

void __60__FKFriendsManager__removeDestinationlessFriendsIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if (![v6 allValuesCount])
    {
      [*(id *)(a1 + 32) addIndex:a3];
      id v7 = _FKGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = [v6 displayName];
        uint64_t v9 = [v6 abRecordGUID];
        int v10 = 136315906;
        uint64_t v11 = "-[FKFriendsManager _removeDestinationlessFriendsIfNecessary]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 1555;
        __int16 v14 = 2112;
        __int16 v15 = v8;
        __int16 v16 = 2112;
        __int16 v17 = v9;
        _os_log_impl(&dword_21CBC2000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"culling friend [%@] [ABGUID=%@] since its destination set has become empty\"", (uint8_t *)&v10, 0x26u);
      }
    }
  }
}

- (void)_removeFriendsAtIndices:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __44__FKFriendsManager__removeFriendsAtIndices___block_invoke;
    v5[3] = &unk_264437E40;
    v5[4] = self;
    [v4 enumerateIndexesUsingBlock:v5];
    self->_needsFriendListSync = 1;
  }
}

void __44__FKFriendsManager__removeFriendsAtIndices___block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndex:a2];
  [*(id *)(a1 + 32) _addEntryToChangeLogForPerson:v7 changeType:@"FKFriendsManagerPersonDeleted"];
  uint64_t v3 = [*(id *)(a1 + 32) groupIndexContainingFriend:v7];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = v3;
    id v5 = [*(id *)(a1 + 32) friendGroups];
    id v6 = [v5 objectAtIndex:v4];

    objc_msgSend(v6, "removeFriendAtPosition:", objc_msgSend(*(id *)(a1 + 32), "positionOfFriendInGroup:", v7));
  }
}

- (unint64_t)_changeLogCount
{
  objc_initWeak(&location, self);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  changeLogQueue = self->_changeLogQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__FKFriendsManager__changeLogCount__block_invoke;
  block[3] = &unk_264437E68;
  void block[4] = &v8;
  objc_copyWeak(&v7, &location);
  dispatch_sync(changeLogQueue, block);
  unint64_t v4 = v9[3];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);
  objc_destroyWeak(&location);
  return v4;
}

void __35__FKFriendsManager__changeLogCount__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained changeLog];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 count];
}

void __42__FKFriendsManager__copyAndResetChangeLog__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v4 = [WeakRetained changeLog];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = NSDictionary;
    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = [v7 changeLog];
    uint64_t v9 = [v6 dictionaryWithDictionary:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    __int16 v12 = *(NSObject **)(*(void *)(a1 + 32) + 104);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__FKFriendsManager__copyAndResetChangeLog__block_invoke_2;
    block[3] = &unk_264437CB0;
    objc_copyWeak(&v14, v2);
    dispatch_barrier_async(v12, block);
    objc_destroyWeak(&v14);
  }
}

void __42__FKFriendsManager__copyAndResetChangeLog__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setChangeLog:0];
}

- (void)_addEntryToChangeLogForPerson:(id)a3 changeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    changeLogQueue = self->_changeLogQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__FKFriendsManager__addEntryToChangeLogForPerson_changeType___block_invoke;
    v9[3] = &unk_264437EB8;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_barrier_async(changeLogQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __61__FKFriendsManager__addEntryToChangeLogForPerson_changeType___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v4 = [WeakRetained changeLog];

  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = objc_loadWeakRetained(v2);
    [v6 setChangeLog:v5];
  }
  id v7 = objc_loadWeakRetained(v2);
  uint64_t v8 = [v7 changeLog];
  id v12 = [v8 objectForKey:*(void *)(a1 + 32)];

  uint64_t v9 = v12;
  if (!v12)
  {
    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  }
  id v13 = v9;
  [v9 addObject:*(void *)(a1 + 40)];
  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v10 changeLog];
  [v11 setObject:v13 forKey:*(void *)(a1 + 32)];
}

- (BOOL)_changeLogContainsFriendAdditionsOrUpdates
{
  objc_initWeak(&location, self);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  changeLogQueue = self->_changeLogQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__FKFriendsManager__changeLogContainsFriendAdditionsOrUpdates__block_invoke;
  block[3] = &unk_264437F08;
  objc_copyWeak(&v6, &location);
  void block[4] = &v7;
  dispatch_sync(changeLogQueue, block);
  LOBYTE(changeLogQueue) = *((unsigned char *)v8 + 24);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  objc_destroyWeak(&location);
  return (char)changeLogQueue;
}

void __62__FKFriendsManager__changeLogContainsFriendAdditionsOrUpdates__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained changeLog];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__FKFriendsManager__changeLogContainsFriendAdditionsOrUpdates__block_invoke_2;
  v4[3] = &unk_264437EE0;
  v4[4] = *(void *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __62__FKFriendsManager__changeLogContainsFriendAdditionsOrUpdates__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if (([v6 containsObject:@"FKFriendsManagerPersonAdded"] & 1) != 0
    || [v6 containsObject:@"FKFriendsManagerPersonUpdated"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)collapseChangeLogsIntoChangeLog:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __52__FKFriendsManager_collapseChangeLogsIntoChangeLog___block_invoke;
        v12[3] = &unk_264437F30;
        id v13 = v4;
        [v10 enumerateKeysAndObjectsUsingBlock:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

void __52__FKFriendsManager_collapseChangeLogsIntoChangeLog___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v10];
  uint64_t v7 = v6;
  if (!v6
    || ([v6 containsObject:@"FKFriendsManagerPersonDeleted"] & 1) == 0
    && ([v5 containsObject:@"FKFriendsManagerPersonDeleted"] & 1) != 0
    || [v7 containsObject:@"FKFriendsManagerPersonDeleted"]
    && [v5 containsObject:@"FKFriendsManagerPersonAdded"])
  {
    id v8 = v5;
  }
  else
  {
    id v8 = [v7 setByAddingObjectsFromSet:v5];
  }
  uint64_t v9 = v8;
  [*(id *)(a1 + 32) setObject:v8 forKey:v10];
}

- (int)_lastKnownAddressBookSequenceNumber
{
  CFPreferencesAppSynchronize((CFStringRef)self->_domain);
  id v3 = (void *)CFPreferencesCopyAppValue(@"ABSequenceNumber", (CFStringRef)self->_domain);
  int v4 = [v3 intValue];

  return v4;
}

- (void)_updateLastKnownAddressBookSequenceNumber:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(FKFriendsManager *)self _lastKnownAddressBookSequenceNumber] != a3)
  {
    CFPreferencesSetAppValue(@"ABSequenceNumber", (CFPropertyListRef)[NSNumber numberWithInt:v3], (CFStringRef)self->_domain);
    CFStringRef domain = (const __CFString *)self->_domain;
    CFPreferencesAppSynchronize(domain);
  }
}

- (BOOL)_addressBookSequenceNumberDidChange
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__FKFriendsManager__addressBookSequenceNumberDidChange__block_invoke;
  v4[3] = &unk_264437D00;
  v4[4] = self;
  void v4[5] = &v5;
  +[FKAddressBook performBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __55__FKFriendsManager__addressBookSequenceNumberDidChange__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _lastKnownAddressBookSequenceNumber];
  uint64_t result = ABAddressBookGetSequenceNumber();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != result;
  return result;
}

- (void)setRefreshAgainstContactsEnabled:(BOOL)a3
{
  if (self->_refreshAgainstContactsEnabled != a3)
  {
    self->_refreshAgainstContactsEnabled = a3;
    if (a3) {
      [(FKFriendsManager *)self refreshAgainstAddressBook];
    }
  }
}

- (BOOL)refreshAgainstAddressBook
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = self->_needsAddressBookRefresh
    || [(FKFriendsManager *)self _addressBookSequenceNumberDidChange];
  BOOL v4 = self->_refreshAgainstContactsEnabled && v3;
  if (v4)
  {
    uint64_t v5 = _FKGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "-[FKFriendsManager refreshAgainstAddressBook]";
      __int16 v10 = 1024;
      int v11 = 1709;
      _os_log_impl(&dword_21CBC2000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"refreshing friends against address book\"", buf, 0x12u);
    }

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __45__FKFriendsManager_refreshAgainstAddressBook__block_invoke;
    v7[3] = &unk_264437F78;
    v7[4] = self;
    +[FKAddressBook performBlock:v7];
    [(FKFriendsManager *)self _cleanUpFriendListIfNecessary];
    [(FKFriendsManager *)self _postChangeNotificationIfNecessary];
    self->_needsAddressBookRefresh = 0;
  }
  return v4;
}

uint64_t __45__FKFriendsManager_refreshAgainstAddressBook__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 64);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__FKFriendsManager_refreshAgainstAddressBook__block_invoke_2;
  v5[3] = &__block_descriptor_40_e25_v32__0__FKPerson_8Q16_B24l;
  v5[4] = a2;
  [v3 enumerateObjectsUsingBlock:v5];
  return [*(id *)(a1 + 32) _updateLastKnownAddressBookSequenceNumber:ABAddressBookGetSequenceNumber()];
}

void __45__FKFriendsManager_refreshAgainstAddressBook__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 refreshWithAddressBook:*(void *)(a1 + 32)];
  }
}

- (void)saveFriendGroupTitles
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = self->_friendGroups;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) title];
        __int16 v10 = (void *)v9;
        if (v9) {
          int v11 = (__CFString *)v9;
        }
        else {
          int v11 = &stru_26CD80ED0;
        }
        [v3 addObject:v11];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  saveQueue = self->_saveQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__FKFriendsManager_saveFriendGroupTitles__block_invoke;
  v14[3] = &unk_264437FA0;
  id v15 = v3;
  long long v16 = self;
  id v13 = v3;
  dispatch_async(saveQueue, v14);
}

void __41__FKFriendsManager_saveFriendGroupTitles__block_invoke(uint64_t a1)
{
  CFPreferencesSetAppValue(@"ETFriendGroupTitles", *(CFPropertyListRef *)(a1 + 32), *(CFStringRef *)(*(void *)(a1 + 40) + 8));
  CFPreferencesAppSynchronize(*(CFStringRef *)(*(void *)(a1 + 40) + 8));
  if (NPSHasCompletedInitialSync())
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 8);
    id v5 = [MEMORY[0x263EFFA08] setWithObject:@"ETFriendGroupTitles"];
    [v3 synchronizeUserDefaultsDomain:v4 keys:v5];
  }
}

- (void)markFriendListAsNormalized
{
  saveQueue = self->_saveQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__FKFriendsManager_markFriendListAsNormalized__block_invoke;
  block[3] = &unk_264437B60;
  void block[4] = self;
  dispatch_async(saveQueue, block);
}

void __46__FKFriendsManager_markFriendListAsNormalized__block_invoke(uint64_t a1)
{
  CFPreferencesSetAppValue(@"DidNormalizeFriendListDestinations", (CFPropertyListRef)*MEMORY[0x263EFFB40], *(CFStringRef *)(*(void *)(a1 + 32) + 8));
  CFPreferencesAppSynchronize(*(CFStringRef *)(*(void *)(a1 + 32) + 8));
  if (NPSHasCompletedInitialSync())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 8);
    id v5 = [MEMORY[0x263EFFA08] setWithObject:@"DidNormalizeFriendListDestinations"];
    [v3 synchronizeUserDefaultsDomain:v4 keys:v5];
  }
}

- (BOOL)isRefreshAgainstContactsEnabled
{
  return self->_refreshAgainstContactsEnabled;
}

- (BOOL)didLastLoadHaveChanges
{
  return self->_lastLoadHadChanges;
}

- (void)setLastLoadHadChanges:(BOOL)a3
{
  self->_BOOL lastLoadHadChanges = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (FKDelayedOperation)saveOperation
{
  return self->_saveOperation;
}

- (void)setSaveOperation:(id)a3
{
}

- (NSMutableDictionary)changeLog
{
  return self->_changeLog;
}

- (void)setChangeLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeLog, 0);
  objc_storeStrong((id *)&self->_saveOperation, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_idsQueryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_cachedStatuses, 0);
  objc_storeStrong((id *)&self->_pendingDestinations, 0);
  objc_storeStrong((id *)&self->_highPriorityDestinations, 0);
  objc_storeStrong((id *)&self->_identifiersToPersonMap, 0);
  objc_storeStrong((id *)&self->_sourcedPersons, 0);
  objc_storeStrong((id *)&self->_changeLogQueue, 0);
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_addressBookRefreshTimer, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_friendGroups, 0);
  objc_storeStrong((id *)&self->_friendList, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)initWithDomain:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[FKFriendsManager initWithDomain:]";
  __int16 v3 = 1024;
  int v4 = 193;
  _os_log_error_impl(&dword_21CBC2000, log, OS_LOG_TYPE_ERROR, "%s (%d) \"Softlinking failure for CNContactStoreDidChangeNotification; we won't be able to listen for contact database changes.\"",
    (uint8_t *)&v1,
    0x12u);
}

void __38__FKFriendsManager__curatedFriendList__block_invoke_cold_1()
{
}

@end