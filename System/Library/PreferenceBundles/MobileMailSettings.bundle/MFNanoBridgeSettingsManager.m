@interface MFNanoBridgeSettingsManager
+ (id)sharedInstance;
- (BOOL)_alwaysLoadContentDirectly;
- (BOOL)_askBeforeDeleting;
- (BOOL)_cloudNotificationsEnabled;
- (BOOL)_loadRemoteImages;
- (BOOL)_mirrorSettingsFromCompanion;
- (BOOL)_mobileMailAskBeforeDeleting;
- (BOOL)_mobileMailLoadRemoteImages;
- (BOOL)_mobileMailOrganizeByThread;
- (BOOL)_mobileMailPrivacyProtectionEnabled;
- (BOOL)_organizeByThread;
- (BOOL)alwaysLoadContentDirectly;
- (BOOL)askBeforeDeleting;
- (BOOL)cloudNotificationsEnabled;
- (BOOL)loadRemoteImages;
- (BOOL)mirrorSettingsFromCompanion;
- (BOOL)organizeByThread;
- (BOOL)privacyProtectionEnabled;
- (MFNanoBridgeSettingsManager)init;
- (NSArray)accountIdentities;
- (NSArray)activeAccounts;
- (NSArray)includeMailMailboxes;
- (NSDictionary)standaloneAccountStateByAccountId;
- (NSString)htmlSignature;
- (NSString)signature;
- (NSString)swipeRightAction;
- (id)_getValueForKey:(id)a3;
- (id)_getValueForKey:(id)a3 perGizmo:(BOOL)a4;
- (id)_includeMailMailbox;
- (id)_includeMailMailboxesFromDisk;
- (id)_loadAccounts;
- (id)_mailboxSelectionFromPreviousOSVersion;
- (id)_mobileMailDefaultAccountId;
- (id)_mobileMailSwipeRightAction;
- (id)_signature;
- (id)_swipeRightAction;
- (id)bridgeSettingsMailboxSelection;
- (id)domainAccessor;
- (id)readFromSharedPreferencesValueForKey:(id)a3;
- (unint64_t)_linesOfPreview;
- (unint64_t)linesOfPreview;
- (void)_handleDidUnpair;
- (void)_handlePairedDeviceChanged;
- (void)_saveValueToSharedPreference:(id)a3 forKey:(id)a4;
- (void)_setAlwaysLoadContentDirectly:(BOOL)a3;
- (void)_setAskBeforeDeleting:(BOOL)a3;
- (void)_setCloudNotificationsEnabled:(BOOL)a3;
- (void)_setDefaultAccountId:(id)a3;
- (void)_setIncludeMailMailboxes:(id)a3;
- (void)_setLinesOfPreview:(unint64_t)a3;
- (void)_setLoadRemoteImages:(BOOL)a3;
- (void)_setOrganizeByThread:(BOOL)a3;
- (void)_setPrivacyProtectionEnabled:(BOOL)a3;
- (void)_setSignature:(id)a3;
- (void)_setSwipeRightAction:(id)a3;
- (void)_setValue:(id)a3 forKey:(id)a4 syncWithClient:(BOOL)a5;
- (void)_setValue:(id)a3 forKey:(id)a4 syncWithClient:(BOOL)a5 perGizmo:(BOOL)a6;
- (void)addSharedSettingsToArray:(id)a3 ifFilterTypes:(unint64_t)a4 containsFilter:(unint64_t)a5;
- (void)dealloc;
- (void)notifyMirrorSettingsFromCompanionChanged;
- (void)notifyMobileMailAccountsChanged;
- (void)notifyMobileMailAskBeforeDeletingChanged;
- (void)notifyMobileMailDefaultAccountUidChanged;
- (void)notifyMobileMailLoadRemoteImagesChanged;
- (void)notifyMobileMailOrganizeByThreadChanged;
- (void)notifyMobileMailPrivacyProtectionChanged;
- (void)notifyMobileMailSwipeRightActionChanged;
- (void)reloadCachedAccounts;
- (void)setAccountIdentities:(id)a3;
- (void)setAlwaysLoadContentDirectly:(BOOL)a3;
- (void)setAskBeforeDeleting:(BOOL)a3;
- (void)setCloudNotificationsEnabled:(BOOL)a3;
- (void)setHtmlSignature:(id)a3;
- (void)setLinesOfPreview:(unint64_t)a3;
- (void)setLoadRemoteImages:(BOOL)a3;
- (void)setOrganizeByThread:(BOOL)a3;
- (void)setStandaloneAccountStateByAccountId:(id)a3;
- (void)setUpdateMailboxSelection:(id)a3;
- (void)updateSharedPreferences;
@end

@implementation MFNanoBridgeSettingsManager

+ (id)sharedInstance
{
  if (qword_40B00 != -1) {
    dispatch_once(&qword_40B00, &stru_38DD0);
  }
  v2 = (void *)qword_40AF8;

  return v2;
}

- (MFNanoBridgeSettingsManager)init
{
  if (MFDeviceSupportsNanoCompanion())
  {
    v16.receiver = self;
    v16.super_class = (Class)MFNanoBridgeSettingsManager;
    v3 = [(MFNanoBridgeSettingsManager *)&v16 init];
    if (v3)
    {
      v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      mailboxUidById = v3->_mailboxUidById;
      v3->_mailboxUidById = v4;

      v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      accountByMailboxId = v3->_accountByMailboxId;
      v3->_accountByMailboxId = v6;

      uint64_t v8 = [(MFNanoBridgeSettingsManager *)v3 _loadAccounts];
      activeAccounts = v3->_activeAccounts;
      v3->_activeAccounts = (NSArray *)v8;

      v10 = (NPSManager *)objc_alloc_init((Class)off_407B0[0]());
      syncManager = v3->_syncManager;
      v3->_syncManager = v10;

      v12 = +[NSNotificationCenter defaultCenter];
      [v12 addObserver:v3 selector:"_handleDidUnpair" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

      v13 = +[NSNotificationCenter defaultCenter];
      [v13 addObserver:v3 selector:"_handlePairedDeviceChanged" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

      [(MFNanoBridgeSettingsManager *)v3 updateSharedPreferences];
    }
    self = v3;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)updateSharedPreferences
{
  if ([(MFNanoBridgeSettingsManager *)self mirrorSettingsFromCompanion])
  {
    [(MFNanoBridgeSettingsManager *)self notifyMirrorSettingsFromCompanionChanged];
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

  v5.receiver = self;
  v5.super_class = (Class)MFNanoBridgeSettingsManager;
  [(MFNanoBridgeSettingsManager *)&v5 dealloc];
}

- (BOOL)mirrorSettingsFromCompanion
{
  return [(MFNanoBridgeSettingsManager *)self _mirrorSettingsFromCompanion];
}

- (id)bridgeSettingsMailboxSelection
{
  objc_super v16 = objc_alloc_init(MFBridgeSettingsMailboxSelection);
  v3 = [(MFNanoBridgeSettingsManager *)self includeMailMailboxes];
  v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v5 = [(MFNanoBridgeSettingsManager *)self includeMailMailboxes];
  uint64_t v6 = 0;
  id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          v12 = [v11 mailboxId];
          [v4 addObject:v12];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v10;
            unint64_t v14 = (unint64_t)[v13 mailboxFilterType];

            v6 |= v14;
          }
          else
          {
            objc_opt_class();
            v6 |= objc_opt_isKindOfClass() & 1;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [(MFBridgeSettingsMailboxSelection *)v16 setInboxesFilterTypes:v6];
  [(MFBridgeSettingsMailboxSelection *)v16 setSelectedMailboxes:v4];

  return v16;
}

- (void)setUpdateMailboxSelection:(id)a3
{
  id v14 = a3;
  v15 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [v14 mailboxesWithAllMessagesSyncEnabledIds];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v9 = [(NSMutableDictionary *)self->_mailboxUidById objectForKeyedSubscript:v8];
        if (v9)
        {
          v10 = [MFNanoBridgeSettingsAccountSpecificMailbox alloc];
          id v11 = [(NSMutableDictionary *)self->_accountByMailboxId objectForKeyedSubscript:v8];
          v12 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)v10 initWithMailboxUid:v9 account:v11];

          [v15 addObject:v12];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, [v14 aggregatedMailboxesFilterTypes], 2);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, [v14 aggregatedMailboxesFilterTypes], 4);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, [v14 aggregatedMailboxesFilterTypes], 8);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, [v14 aggregatedMailboxesFilterTypes], 16);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, [v14 aggregatedMailboxesFilterTypes], 32);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, [v14 aggregatedMailboxesFilterTypes], 64);
  if ([v14 aggregatedMailboxesFilterTypes])
  {
    id v13 = [[MFNanoBridgeSettingsUnifiedMailbox alloc] initWithType:7];
    [v15 addObject:v13];
  }
  [(MFNanoBridgeSettingsManager *)self setIncludeMailMailboxes:v15];
}

- (void)addSharedSettingsToArray:(id)a3 ifFilterTypes:(unint64_t)a4 containsFilter:(unint64_t)a5
{
  id v8 = a3;
  if ((a5 & a4) != 0)
  {
    id v7 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:+[MFNanoBridgeSettingsMailbox sourceTypeForMailboxFilterType:a5]];
    [v8 addObject:v7];
  }
}

- (NSDictionary)standaloneAccountStateByAccountId
{
  v2 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:@"kStandaloneAccountStateByAccountIdKey"];
  if (v2)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v3 = +[NSArray arrayWithObjects:&v7 count:3];
    v4 = +[NSSet setWithArray:](NSSet, "setWithArray:", v3, v7, v8);
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v2 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (void)setStandaloneAccountStateByAccountId:(id)a3
{
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:");
}

- (NSArray)accountIdentities
{
  v2 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:@"kAccountIdentitiesKey"];
  if (v2)
  {
    off_407B8[0]();
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    v3 = +[NSArray arrayWithObjects:v7 count:2];
    id v4 = +[NSSet setWithArray:v3];
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v2 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)setAccountIdentities:(id)a3
{
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:");
}

- (NSArray)includeMailMailboxes
{
  return (NSArray *)[(MFNanoBridgeSettingsManager *)self _includeMailMailbox];
}

- (unint64_t)linesOfPreview
{
  return [(MFNanoBridgeSettingsManager *)self _linesOfPreview];
}

- (void)setLinesOfPreview:(unint64_t)a3
{
}

- (BOOL)askBeforeDeleting
{
  return [(MFNanoBridgeSettingsManager *)self _askBeforeDeleting];
}

- (void)setAskBeforeDeleting:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(MFNanoBridgeSettingsManager *)self mirrorSettingsFromCompanion])
  {
    [(MFNanoBridgeSettingsManager *)self _setAskBeforeDeleting:v3];
  }
}

- (BOOL)loadRemoteImages
{
  return [(MFNanoBridgeSettingsManager *)self _loadRemoteImages];
}

- (void)setLoadRemoteImages:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(MFNanoBridgeSettingsManager *)self mirrorSettingsFromCompanion])
  {
    [(MFNanoBridgeSettingsManager *)self _setLoadRemoteImages:v3];
  }
}

- (BOOL)organizeByThread
{
  return [(MFNanoBridgeSettingsManager *)self _organizeByThread];
}

- (void)setOrganizeByThread:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(MFNanoBridgeSettingsManager *)self mirrorSettingsFromCompanion])
  {
    [(MFNanoBridgeSettingsManager *)self _setOrganizeByThread:v3];
  }
}

- (NSString)swipeRightAction
{
  return (NSString *)[(MFNanoBridgeSettingsManager *)self _swipeRightAction];
}

- (BOOL)cloudNotificationsEnabled
{
  return [(MFNanoBridgeSettingsManager *)self _cloudNotificationsEnabled];
}

- (void)setCloudNotificationsEnabled:(BOOL)a3
{
}

- (NSString)htmlSignature
{
  return (NSString *)[(MFNanoBridgeSettingsManager *)self _signature];
}

- (void)setHtmlSignature:(id)a3
{
}

- (BOOL)alwaysLoadContentDirectly
{
  return [(MFNanoBridgeSettingsManager *)self _alwaysLoadContentDirectly];
}

- (void)setAlwaysLoadContentDirectly:(BOOL)a3
{
}

- (NSString)signature
{
  v2 = +[MFNanoBridgeSettingsManager sharedInstance];
  BOOL v3 = [v2 htmlSignature];
  id v4 = [v3 dataUsingEncoding:4];

  id v5 = objc_alloc((Class)NSAttributedString);
  v19[0] = NSDocumentTypeDocumentAttribute;
  v19[1] = NSCharacterEncodingDocumentAttribute;
  v20[0] = NSHTMLTextDocumentType;
  v20[1] = &off_3B618;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v18 = 0;
  id v7 = [v5 initWithData:v4 options:v6 documentAttributes:0 error:&v18];
  id v8 = v18;

  if (v8)
  {
    uint64_t v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_24760((uint64_t)v8, v9);
    }
  }
  v10 = [v7 string];
  id v11 = +[NSCharacterSet newlineCharacterSet];
  v12 = [v10 _stringByReplacingCharactersInSet:v11 withCharacter:10];

  if (v12)
  {
    while ([v12 rangeOfString:@"\n\n"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"\n\n" withString:@"\n"];

      v12 = (void *)v13;
    }
  }
  id v14 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  v15 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  long long v16 = [v14 stringByTrimmingCharactersInSet:v15];

  return (NSString *)v16;
}

- (BOOL)privacyProtectionEnabled
{
  BOOL v3 = [(MFNanoBridgeSettingsManager *)self mirrorSettingsFromCompanion];
  if (v3)
  {
    LOBYTE(v3) = [(MFNanoBridgeSettingsManager *)self _mobileMailPrivacyProtectionEnabled];
  }
  return v3;
}

- (void)notifyMirrorSettingsFromCompanionChanged
{
  if ([(MFNanoBridgeSettingsManager *)self mirrorSettingsFromCompanion])
  {
    [(MFNanoBridgeSettingsManager *)self notifyMobileMailAskBeforeDeletingChanged];
    [(MFNanoBridgeSettingsManager *)self notifyMobileMailLoadRemoteImagesChanged];
    [(MFNanoBridgeSettingsManager *)self notifyMobileMailPrivacyProtectionChanged];
    [(MFNanoBridgeSettingsManager *)self notifyMobileMailOrganizeByThreadChanged];
    [(MFNanoBridgeSettingsManager *)self notifyMobileMailDefaultAccountUidChanged];
  }
  else
  {
    [(MFNanoBridgeSettingsManager *)self notifyMobileMailPrivacyProtectionChanged];
  }
}

- (void)notifyMobileMailAskBeforeDeletingChanged
{
  BOOL v3 = [(MFNanoBridgeSettingsManager *)self _mobileMailAskBeforeDeleting];

  [(MFNanoBridgeSettingsManager *)self _setAskBeforeDeleting:v3];
}

- (void)notifyMobileMailLoadRemoteImagesChanged
{
  BOOL v3 = [(MFNanoBridgeSettingsManager *)self _mobileMailLoadRemoteImages];

  [(MFNanoBridgeSettingsManager *)self _setLoadRemoteImages:v3];
}

- (void)notifyMobileMailPrivacyProtectionChanged
{
  BOOL v3 = [(MFNanoBridgeSettingsManager *)self privacyProtectionEnabled];

  [(MFNanoBridgeSettingsManager *)self _setPrivacyProtectionEnabled:v3];
}

- (void)notifyMobileMailOrganizeByThreadChanged
{
  BOOL v3 = [(MFNanoBridgeSettingsManager *)self _mobileMailOrganizeByThread];

  [(MFNanoBridgeSettingsManager *)self _setOrganizeByThread:v3];
}

- (void)notifyMobileMailSwipeRightActionChanged
{
  id v3 = [(MFNanoBridgeSettingsManager *)self _mobileMailSwipeRightAction];
  -[MFNanoBridgeSettingsManager _setSwipeRightAction:](self, "_setSwipeRightAction:");
}

- (void)notifyMobileMailDefaultAccountUidChanged
{
  id v3 = [(MFNanoBridgeSettingsManager *)self _mobileMailDefaultAccountId];
  -[MFNanoBridgeSettingsManager _setDefaultAccountId:](self, "_setDefaultAccountId:");
}

- (void)notifyMobileMailAccountsChanged
{
  id v18 = self->_activeAccounts;
  id v3 = [(MFNanoBridgeSettingsManager *)self _loadAccounts];
  activeAccounts = self->_activeAccounts;
  self->_activeAccounts = v3;

  long long v17 = [(MFNanoBridgeSettingsManager *)self includeMailMailboxes];
  id v5 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:");
  uint64_t v6 = [[MFNanoBridgeSettingsUnifiedMailbox alloc] initWithType:7];
  unsigned int v7 = [v5 containsObject:v6];
  if ([(NSArray *)self->_activeAccounts count] < 2
    || (char *)[(NSArray *)v18 count] != (char *)&dword_0 + 1)
  {
    if (!v7) {
      goto LABEL_22;
    }
LABEL_21:
    v15 = +[MailAccount nano_bridgeSettingsInboxesFromAccounts:self->_activeAccounts];
    [v5 addObjectsFromArray:v15];

    goto LABEL_22;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v17;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          if ([v13 type] == (char *)&dword_4 + 3 && (v7 & 1) == 0)
          {
            [v5 addObject:v6];
            LOBYTE(v7) = 1;
          }
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  if (v7) {
    goto LABEL_21;
  }
LABEL_22:
  long long v16 = [v5 allObjects];
  [(MFNanoBridgeSettingsManager *)self _setIncludeMailMailboxes:v16];
}

- (void)reloadCachedAccounts
{
  +[MailAccount reloadAccounts];
  self->_activeAccounts = [(MFNanoBridgeSettingsManager *)self _loadAccounts];

  _objc_release_x1();
}

- (BOOL)_mirrorSettingsFromCompanion
{
  return _PSIsNanoMirroringDomain(kMFMobileMailBundleIdentifier, a2);
}

- (id)_includeMailMailbox
{
  long long v19 = [(MFNanoBridgeSettingsManager *)self _mailboxSelectionFromPreviousOSVersion];
  if (v19)
  {
    v2 = MFLogGeneral();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "#Nano Mailbox selection list is from legacy OS. %{public}@", buf, 0xCu);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0;
    }
    else
    {
      v26 = v19;
      long long v20 = +[NSArray arrayWithObjects:&v26 count:1];
      -[MFNanoBridgeSettingsManager _setIncludeMailMailboxes:](self, "_setIncludeMailMailboxes:");
    }
  }
  else
  {
    long long v20 = [(MFNanoBridgeSettingsManager *)self _includeMailMailboxesFromDisk];
    id v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "#Nano Mailbox selection list read from disk. %{public}@", buf, 0xCu);
    }
  }
  id v4 = +[MailAccount nano_activeMailAccounts];
  id v5 = 0;
  if ([v4 count] && v20)
  {
    uint64_t v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v20 count]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v20;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v8) {
      goto LABEL_27;
    }
    uint64_t v9 = *(void *)v22;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ((unint64_t)[v4 count] > 1) {
            goto LABEL_21;
          }
        }
        else
        {
          if ([v11 isValid])
          {
LABEL_21:
            [v6 addObject:v11];
            goto LABEL_25;
          }
          v12 = MFLogGeneral();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v11;
            _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "#Nano Mailbox no longer available. Ignoring. %{public}@", buf, 0xCu);
          }
        }
LABEL_25:
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v8)
      {
LABEL_27:

        id v5 = v6;
        break;
      }
    }
  }
  if ([v5 count])
  {
    id v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v5;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "#Nano Mailbox selection list validated. %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "#Nano Mailbox selection list does not exist. Creating default seletion", buf, 2u);
    }

    v15 = +[MFNanoBridgeSettingsMailbox defaultSelectedMailboxes];
    id v16 = [v15 mutableCopy];

    id v5 = v16;
    [(MFNanoBridgeSettingsManager *)self _setIncludeMailMailboxes:v16];
  }

  return v5;
}

- (unint64_t)_linesOfPreview
{
  id v3 = off_407C0[0]();
  id v4 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:v3];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v5 = [v4 unsignedIntegerValue];
  }
  else {
    id v5 = (id)off_407C8[0]();
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)_askBeforeDeleting
{
  id v3 = off_407D0[0]();
  id v4 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:v3];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = off_407D8[0]();
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)_loadRemoteImages
{
  id v3 = off_407E0[0]();
  id v4 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:v3];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = off_407E8[0]();
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)_organizeByThread
{
  id v3 = off_407F0[0]();
  id v4 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:v3];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = off_407F8[0]();
  }
  BOOL v6 = v5;

  return v6;
}

- (id)_swipeRightAction
{
  id v3 = off_40800[0]();
  id v4 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:v3 perGizmo:0];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    off_40808[0]();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v6 = v5;

  return v6;
}

- (id)_signature
{
  id v3 = off_40810[0]();
  id v4 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:v3];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
  }
  else
  {
    off_40818[0]();
    BOOL v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = off_40820[0]();
    id v5 = [v6 localizedStringForKey:v7 value:&stru_39200 table:@"NanoMailKit"];
  }

  return v5;
}

- (BOOL)_alwaysLoadContentDirectly
{
  id v3 = off_40828[0]();
  id v4 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:v3];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = off_40830[0]();
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)_cloudNotificationsEnabled
{
  id v3 = off_40838[0]();
  id v4 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:v3 perGizmo:0];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = off_40840[0]();
  }
  BOOL v6 = v5;

  return v6;
}

- (void)_setIncludeMailMailboxes:(id)a3
{
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:");
}

- (id)_includeMailMailboxesFromDisk
{
  v2 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:@"kIncludeMailBoxesKey"];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
    unsigned __int8 v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v2 error:0];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_mailboxSelectionFromPreviousOSVersion
{
  uint64_t v3 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:@"NanoMailIncludeMail"];
  if (v3)
  {
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
    [(MFNanoBridgeSettingsManager *)self _setValue:0 forKey:@"NanoMailIncludeMail" syncWithClient:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_setLinesOfPreview:(unint64_t)a3
{
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = off_407C0[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1];
}

- (void)_setAskBeforeDeleting:(BOOL)a3
{
  id v5 = +[NSNumber numberWithBool:a3];
  id v4 = off_407D0[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1];
}

- (void)_setLoadRemoteImages:(BOOL)a3
{
  id v5 = +[NSNumber numberWithBool:a3];
  id v4 = off_407E0[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1];
}

- (void)_setPrivacyProtectionEnabled:(BOOL)a3
{
  id v5 = +[NSNumber numberWithBool:a3];
  id v4 = off_40848[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1];
}

- (void)_setAlwaysLoadContentDirectly:(BOOL)a3
{
  id v5 = +[NSNumber numberWithBool:a3];
  id v4 = off_40828[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1];
}

- (void)_setOrganizeByThread:(BOOL)a3
{
  id v5 = +[NSNumber numberWithBool:a3];
  id v4 = off_407F0[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1];
}

- (void)_setSwipeRightAction:(id)a3
{
  id v5 = a3;
  id v4 = off_40800[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1 perGizmo:0];
}

- (void)_setSignature:(id)a3
{
  id v5 = a3;
  id v4 = off_40810[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1];
}

- (void)_setDefaultAccountId:(id)a3
{
  id v5 = a3;
  id v4 = off_40850[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1];
}

- (void)_setCloudNotificationsEnabled:(BOOL)a3
{
  id v5 = +[NSNumber numberWithBool:a3];
  id v4 = off_40838[0]();
  [(MFNanoBridgeSettingsManager *)self _setValue:v5 forKey:v4 syncWithClient:1];
}

- (BOOL)_mobileMailAskBeforeDeleting
{
  v2 = +[NSUserDefaults em_userDefaults];
  uint64_t v3 = [v2 objectForKey:@"ShowMessageDeleteConfirmation"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_mobileMailLoadRemoteImages
{
  v2 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v3 = [v2 integerForKey:EMUserDefaultLoadRemoteContentKey];

  return (v3 & 2) == 0;
}

- (BOOL)_mobileMailPrivacyProtectionEnabled
{
  v2 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v3 = [v2 integerForKey:EMUserDefaultLoadRemoteContentKey];

  return (~v3 & 0xC) != 0;
}

- (BOOL)_mobileMailOrganizeByThread
{
  v2 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v3 = [v2 objectForKey:@"DisableThreading"];

  if (v3) {
    unsigned int v4 = [v3 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (id)_mobileMailSwipeRightAction
{
  v2 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v3 = [v2 objectForKey:@"LeftEdgeSwipeAction"];

  return v3;
}

- (id)_mobileMailDefaultAccountId
{
  v2 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v3 = [v2 objectForKey:MailDefaultSendingAccountKey];

  if (!v3)
  {
    unsigned int v4 = +[MailAccount defaultMailAccountForDelivery];
    unsigned __int8 v3 = [v4 uniqueID];
  }

  return v3;
}

- (id)_getValueForKey:(id)a3
{
  unsigned __int8 v3 = [(MFNanoBridgeSettingsManager *)self _getValueForKey:a3 perGizmo:1];

  return v3;
}

- (id)_getValueForKey:(id)a3 perGizmo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [(MFNanoBridgeSettingsManager *)self domainAccessor];
    id v8 = [v7 synchronize];

    uint64_t v9 = [(MFNanoBridgeSettingsManager *)self domainAccessor];
    uint64_t v10 = [v9 objectForKey:v6];
  }
  else
  {
    uint64_t v10 = [(MFNanoBridgeSettingsManager *)self readFromSharedPreferencesValueForKey:v6];
  }

  return v10;
}

- (void)_setValue:(id)a3 forKey:(id)a4 syncWithClient:(BOOL)a5
{
}

- (void)_setValue:(id)a3 forKey:(id)a4 syncWithClient:(BOOL)a5 perGizmo:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = [(MFNanoBridgeSettingsManager *)self readFromSharedPreferencesValueForKey:v11];
  [(MFNanoBridgeSettingsManager *)self _saveValueToSharedPreference:v10 forKey:v11];
  if (v6)
  {
    id v13 = [(MFNanoBridgeSettingsManager *)self domainAccessor];
    id v14 = [v13 objectForKey:v11];

    if (([v14 isEqual:v10] & 1) == 0)
    {
      v15 = [(MFNanoBridgeSettingsManager *)self domainAccessor];
      [v15 setObject:v10 forKey:v11];

      id v16 = [(MFNanoBridgeSettingsManager *)self domainAccessor];
      id v17 = [v16 synchronize];

      if (v7)
      {
        syncManager = self->_syncManager;
        long long v19 = +[NSSet setWithObject:v11];
        [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.NanoMail" keys:v19];
      }
    }
  }
  else
  {
    if (([v12 isEqual:v10] | !v7)) {
      goto LABEL_8;
    }
    long long v20 = self->_syncManager;
    id v14 = +[NSSet setWithObject:v11];
    [(NPSManager *)v20 synchronizeUserDefaultsDomain:@"com.apple.NanoMail" keys:v14];
  }

LABEL_8:
  long long v21 = off_407F0[0]();
  if ([v11 isEqualToString:v21])
  {
  }
  else
  {
    unsigned __int8 v22 = [v11 isEqualToString:@"kIncludeMailBoxesKey"];

    if ((v22 & 1) == 0) {
      goto LABEL_18;
    }
  }
  long long v23 = MFUserAgent();
  unsigned __int8 v24 = [v23 isMaild];

  if (v24)
  {
    v25 = MFLogGeneral();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_247D8((uint64_t)v11, v25);
    }

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 postNotificationName:@"MailDefaultsChangedNotification" object:v11 userInfo:0];
  }
  else
  {
    v27 = MFLogGeneral();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412290;
      id v30 = v11;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "#Nano Posting Darwin Notification Bridge Setting has Changed for key: %@", (uint8_t *)&v29, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"MFNanoMailImportantBridgeSettingHasChangedDarwinNotification", 0, 0, 1u);
  }
LABEL_18:
}

- (void)_saveValueToSharedPreference:(id)a3 forKey:(id)a4
{
  id value = a3;
  id v5 = (__CFString *)a4;
  CFPreferencesSetValue(v5, value, @"com.apple.NanoMail", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(@"com.apple.NanoMail", kCFPreferencesCurrentUser, kCFPreferencesAnyApplication);
}

- (id)readFromSharedPreferencesValueForKey:(id)a3
{
  unsigned __int8 v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.NanoMail", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  return v3;
}

- (void)_handleDidUnpair
{
  self->_domainAccessor = 0;
  _objc_release_x1();
}

- (void)_handlePairedDeviceChanged
{
  domainAccessor = self->_domainAccessor;
  self->_domainAccessor = 0;

  [(MFNanoBridgeSettingsManager *)self updateSharedPreferences];
}

- (id)_loadAccounts
{
  [(NSMutableDictionary *)self->_mailboxUidById removeAllObjects];
  id v14 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unsigned __int8 v3 = +[MailAccount activeAccounts];
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      id v16 = v4;
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v3);
        }
        BOOL v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v14 addObject:v6];
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          BOOL v7 = [v6 allMailboxUids];
          id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v18;
            do
            {
              for (j = 0; j != v8; j = (char *)j + 1)
              {
                if (*(void *)v18 != v9) {
                  objc_enumerationMutation(v7);
                }
                id v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
                v12 = objc_msgSend(v11, "nano_mailboxId");
                if (v12)
                {
                  [(NSMutableDictionary *)self->_accountByMailboxId setObject:v6 forKeyedSubscript:v12];
                  [(NSMutableDictionary *)self->_mailboxUidById setObject:v11 forKeyedSubscript:v12];
                }
              }
              id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v8);
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  return v14;
}

- (id)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    id v4 = (NPSDomainAccessor *)[objc_alloc(off_40858()) initWithDomain:@"com.apple.NanoMail"];
    id v5 = self->_domainAccessor;
    self->_domainAccessor = v4;

    domainAccessor = self->_domainAccessor;
  }

  return domainAccessor;
}

- (NSArray)activeAccounts
{
  return self->_activeAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccounts, 0);
  objc_storeStrong((id *)&self->_accountByMailboxId, 0);
  objc_storeStrong((id *)&self->_mailboxUidById, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);

  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end