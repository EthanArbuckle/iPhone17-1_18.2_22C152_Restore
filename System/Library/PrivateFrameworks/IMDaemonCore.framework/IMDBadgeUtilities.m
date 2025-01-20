@interface IMDBadgeUtilities
+ (BOOL)_iMessageEnabled;
+ (BOOL)_iMessageFailedAccountIsIrreparable;
+ (BOOL)_isTryingToLogin;
+ (BOOL)_isUsableSendingForAccount:(id)a3;
+ (BOOL)_isUserIntentNotLoggedOut;
+ (id)_accountsArrayForServiceIMessage;
+ (id)sharedInstance;
- (BOOL)_isUnexpectedlyLogOutValue;
- (BOOL)_isUnexpectedlyLoggedOut;
- (BOOL)_shouldShowFailureString;
- (BOOL)addedObserverForUnexpectedlyLoggedOut;
- (BOOL)isInAppleStoreDemoMode;
- (BOOL)isShowingFailure;
- (BOOL)isStewieActive;
- (BOOL)isUnexpectedlyLoggedOut;
- (IMDBadgeUtilities)init;
- (IMDBadgeUtilities)initWithMessageStore:(id)a3;
- (IMDBadgeUtilities)initWithMessageStore:(id)a3 defaultsStore:(id)a4;
- (IMDMessageStore)messageStore;
- (IMDefaults)sharedDefaultsInstance;
- (NSMutableDictionary)pendingSatelliteMessagesPerService;
- (UNUserNotificationCenter)notificationCenter;
- (int64_t)_savedFailureDate;
- (int64_t)lastFailedMessageDate;
- (unint64_t)unreadCount;
- (void)_cacheFailureDate:(int64_t)a3;
- (void)_checkIfUnexpectedlyLoggedOut;
- (void)_clearFailureBadge;
- (void)_compareLastFailureDateAndUpdateBadge:(int64_t)a3;
- (void)_postBadgeNumber:(id)a3;
- (void)_postBadgeString:(id)a3;
- (void)_rebuildUnreadMessageCount;
- (void)_saveFailureDate:(int64_t)a3;
- (void)_stopSuppressingSound;
- (void)_updateBadge;
- (void)_updateBadgeForLastFailedMessageDateChangeIfNeeded:(int64_t)a3;
- (void)_updateBadgeForUnreadCountChangeIfNeeded:(int64_t)a3;
- (void)checkIfUnexpectedlyLoggedOut;
- (void)clearFailureBadge;
- (void)dealloc;
- (void)satelliteStateDidChange:(BOOL)a3;
- (void)setAddedObserverForUnexpectedlyLoggedOut:(BOOL)a3;
- (void)setIsStewieActive:(BOOL)a3;
- (void)setLastFailedMessageDate:(int64_t)a3;
- (void)setMessageStore:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPendingSatelliteMessagesPerService:(id)a3;
- (void)setSharedDefaultsInstance:(id)a3;
- (void)setShowingFailure:(BOOL)a3;
- (void)setUnexpectedlyLoggedOut:(BOOL)a3;
- (void)setUnreadCount:(unint64_t)a3;
- (void)updateBadgeForLastFailedMessageDateChangeIfNeeded:(int64_t)a3;
- (void)updateBadgeForPendingSatelliteMessagesIfNeeded:(int64_t)a3 onService:(id)a4;
- (void)updateBadgeForUnreadCountChangeIfNeeded:(int64_t)a3;
- (void)updateBadgeInCaseOfMistakenLoginInvalidation;
@end

@implementation IMDBadgeUtilities

+ (BOOL)_isUsableSendingForAccount:(id)a3
{
  id v3 = a3;
  if (![v3 isActive]) {
    goto LABEL_14;
  }
  if (![v3 accountType]) {
    goto LABEL_9;
  }
  v4 = [v3 service];
  int v5 = [v4 supportsRegistration];

  if (!v5) {
    goto LABEL_9;
  }
  if ([v3 accountType] == 2)
  {
    if ([v3 registrationStatus] != 5)
    {
      char v6 = [v3 registrationStatus] == 2;
      goto LABEL_15;
    }
LABEL_9:
    char v6 = 1;
    goto LABEL_15;
  }
  if ([v3 accountType] == 1)
  {
    if ([v3 registrationStatus] == 2) {
      goto LABEL_9;
    }
    if ([v3 registrationStatus] != 5)
    {
LABEL_14:
      char v6 = 0;
      goto LABEL_15;
    }
  }
  v7 = [v3 aliases];
  if ([v7 count])
  {
    if ([v7 count] == 1)
    {
      v8 = [v7 lastObject];
      char v9 = [v8 isEqualToIgnoringCase:*MEMORY[0x1E4F6C7B8]];

      char v6 = v9 ^ 1;
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

LABEL_15:
  return v6;
}

+ (BOOL)_isUserIntentNotLoggedOut
{
  if (IMGetUserLoginIntent() == 2) {
    return 0;
  }
  else {
    return IMGetUserIgnoreLogoutIntent() ^ 1;
  }
}

- (void)_checkIfUnexpectedlyLoggedOut
{
  BOOL v3 = ([(id)objc_opt_class() _iMessageEnabled] & 1) == 0
    && ([(id)objc_opt_class() _isTryingToLogin] & 1) == 0
    && ([(id)objc_opt_class() _iMessageFailedAccountIsIrreparable] & 1) == 0
    && ([(id)objc_opt_class() _isUserIntentNotLoggedOut] & 1) != 0;
  self->_unexpectedlyLoggedOut = v3;

  [(IMDBadgeUtilities *)self _updateBadge];
}

+ (BOOL)_iMessageFailedAccountIsIrreparable
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _accountsArrayForServiceIMessage];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v2);
        }
        char v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 session];
        uint64_t v11 = [v10 registrationStatus];

        if (v11 == -1)
        {
          v12 = [v9 session];
          BOOL v13 = [v12 registrationError] != 26;

          v6 |= v13;
          char v5 = 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
    char v6 = 0;
  }

  return v5 & ~v6 & 1;
}

+ (BOOL)_iMessageEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _accountsArrayForServiceIMessage];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend((id)objc_opt_class(), "_isUsableSendingForAccount:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9))
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

+ (BOOL)_isTryingToLogin
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _accountsArrayForServiceIMessage];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "loginStatus", (void)v7) == 3)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (id)_accountsArrayForServiceIMessage
{
  id v2 = +[IMDAccountController sharedInstance];
  uint64_t v3 = +[IMDServiceController sharedController];
  uint64_t v4 = [v3 serviceWithName:*MEMORY[0x1E4F6E1B0]];
  uint64_t v5 = [v2 accountsForService:v4];

  return v5;
}

- (void)_updateBadge
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(IMDBadgeUtilities *)self _shouldShowFailureString])
  {
    MEMORY[0x1F4181798](self, sel__postBadgeString_);
  }
  else
  {
    uint64_t v8 = 0;
    long long v9 = &v8;
    uint64_t v10 = 0x2020000000;
    unint64_t unreadCount = self->_unreadCount;
    if (self->_isStewieActive)
    {
      uint64_t v3 = [(IMDBadgeUtilities *)self pendingSatelliteMessagesPerService];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = sub_1D986FC3C;
      v7[3] = &unk_1E6B78488;
      v7[4] = &v8;
      [v3 enumerateKeysAndObjectsUsingBlock:v7];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = v9[3];
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = v5;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Updating unread message count badge to %ld", buf, 0xCu);
      }
    }
    char v6 = [NSNumber numberWithUnsignedInteger:v9[3]];
    [(IMDBadgeUtilities *)self _postBadgeNumber:v6];

    _Block_object_dispose(&v8, 8);
  }
}

- (BOOL)_shouldShowFailureString
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(IMDBadgeUtilities *)self isInAppleStoreDemoMode]
    || ([MEMORY[0x1E4F6E5D8] sharedManager],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isAssistiveAccessRunning],
        v3,
        (v4 & 1) != 0))
  {
    LOBYTE(v5) = 0;
  }
  else if (self->_showingFailure {
         || (BOOL v5 = [(IMDBadgeUtilities *)self _isUnexpectedlyLoggedOut]))
  }
  {
    if (IMOSLoggingEnabled())
    {
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        BOOL showingFailure = self->_showingFailure;
        BOOL v8 = [(IMDBadgeUtilities *)self _isUnexpectedlyLoggedOut];
        long long v9 = @"YES";
        if (showingFailure) {
          uint64_t v10 = @"YES";
        }
        else {
          uint64_t v10 = @"NO";
        }
        if (!v8) {
          long long v9 = @"NO";
        }
        int v12 = 138412546;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        long long v15 = v9;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "_shouldShowFailureString _showingFailure %@ _isUnexpectedlyLoggedOut %@ ", (uint8_t *)&v12, 0x16u);
      }
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isInAppleStoreDemoMode
{
  if (qword_1EBE2BC70 != -1) {
    dispatch_once(&qword_1EBE2BC70, &unk_1F3392360);
  }
  return byte_1EBE2BCD0;
}

- (void)_postBadgeNumber:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Call notification center to post badge number %@", (uint8_t *)&v7, 0xCu);
    }
  }
  char v6 = [(IMDBadgeUtilities *)self notificationCenter];
  objc_msgSend(v6, "setBadgeCount:withCompletionHandler:", objc_msgSend(v4, "integerValue"), &unk_1F3392320);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)_isUnexpectedlyLoggedOut
{
  return 0;
}

- (void)clearFailureBadge
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D968DA98;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)checkIfUnexpectedlyLoggedOut
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D968DA90;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_clearFailureBadge
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      if (self->_showingFailure) {
        id v4 = @"YES";
      }
      else {
        id v4 = @"NO";
      }
      int v5 = 138412290;
      char v6 = v4;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Clearing failure badge, old value = %@", (uint8_t *)&v5, 0xCu);
    }
  }
  self->_BOOL showingFailure = 0;
  [(IMDBadgeUtilities *)self _updateBadge];
}

+ (id)sharedInstance
{
  if (qword_1EBE2B900 != -1) {
    dispatch_once(&qword_1EBE2B900, &unk_1F3392300);
  }
  id v2 = (void *)qword_1EBE2BA40;

  return v2;
}

- (IMDBadgeUtilities)init
{
  uint64_t v3 = +[IMDMessageStore sharedInstance];
  id v4 = [(IMDBadgeUtilities *)self initWithMessageStore:v3];

  return v4;
}

- (IMDBadgeUtilities)initWithMessageStore:(id)a3
{
  return (IMDBadgeUtilities *)MEMORY[0x1F4181798](self, sel_initWithMessageStore_defaultsStore_);
}

- (IMDBadgeUtilities)initWithMessageStore:(id)a3 defaultsStore:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)IMDBadgeUtilities;
  id v8 = [(IMDBadgeUtilities *)&v26 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("IMDBadgeUtilitiesQueue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_messageStore, v6);
    v8->_unint64_t unreadCount = [v6 unreadMessagesCount];
    long long v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingSatelliteMessagesPerService = v8->_pendingSatelliteMessagesPerService;
    v8->_pendingSatelliteMessagesPerService = v11;

    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        unint64_t unreadCount = (void *)v8->_unreadCount;
        *(_DWORD *)buf = 134217984;
        v28 = unreadCount;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Initializing IMDBadgeUtilities with unread count: %ld", buf, 0xCu);
      }
    }
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.MobileSMS"];
    notificationCenter = v8->_notificationCenter;
    v8->_notificationCenter = (UNUserNotificationCenter *)v15;

    long long v17 = +[IMDChorosController sharedController];
    [v17 addObserver:v8];

    *(_WORD *)&v8->_BOOL showingFailure = 0;
    v8->_addedObserverForUnexpectedlyLoggedOut = 0;
    objc_storeStrong((id *)&v8->_sharedDefaultsInstance, a4);
    uint64_t v18 = [(IMDBadgeUtilities *)v8 _savedFailureDate];
    v8->_lastFailedMessageDate = v18;
    if (v18 <= 0)
    {
      uint64_t v19 = [v6 lastFailedMessageDate];
      v8->_lastFailedMessageDate = v19;
      [(IMDBadgeUtilities *)v8 _saveFailureDate:v19];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = [NSNumber numberWithLongLong:v8->_lastFailedMessageDate];
        v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "lastFailedMessageDate"));
        *(_DWORD *)buf = 138412546;
        v28 = v21;
        __int16 v29 = 2112;
        v30 = v22;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "_lastFailedMessageDate saved date %@  last failed message data in DB %@ ", buf, 0x16u);
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)sub_1D968D9C0, @"__kMessagesBadgeControllerClearFailureBadgeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v24 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v24, v8, (CFNotificationCallback)sub_1D986F4A0, @"__kIMDBadgeUtilitiesRebuildUnreadMessageCountNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(IMDBadgeUtilities *)v8 _updateBadge];
  }

  return v8;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"__kMessagesBadgeControllerClearFailureBadgeNotification", 0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"__kIMDBadgeUtilitiesRebuildUnreadMessageCountNotification", 0);
  if (self->_addedObserverForUnexpectedlyLoggedOut)
  {
    int v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v5, self, @"com.apple.IMSharedUtilities.IMUserLoginIntentChangedInternal", 0);
    id v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v6, self, @"__kIMDBadgeUtilitiesLoginStatusChangedNotification", 0);
    id v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v7, self, @"__kIMDBadgeUtilitiesOperationalAccountsChangedNotification", 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)IMDBadgeUtilities;
  [(IMDBadgeUtilities *)&v8 dealloc];
}

- (void)updateBadgeForUnreadCountChangeIfNeeded:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1D986F674;
  v4[3] = &unk_1E6B74C60;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_updateBadgeForUnreadCountChangeIfNeeded:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1D986F6F4;
  v4[3] = &unk_1E6B74C60;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)updateBadgeForLastFailedMessageDateChangeIfNeeded:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1D986F90C;
  v4[3] = &unk_1E6B74C60;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_updateBadgeForLastFailedMessageDateChangeIfNeeded:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1D986F98C;
  v4[3] = &unk_1E6B74C60;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)updateBadgeInCaseOfMistakenLoginInvalidation
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D986FB14;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateBadgeForPendingSatelliteMessagesIfNeeded:(int64_t)a3 onService:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D986FBC4;
  block[3] = &unk_1E6B74108;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_postBadgeString:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(IMDBadgeUtilities *)self notificationCenter];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Call notification center to post badge string %@", buf, 0xCu);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D986FDE8;
  v9[3] = &unk_1E6B73218;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

- (BOOL)isUnexpectedlyLoggedOut
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D987003C;
  v11[3] = &unk_1E6B73268;
  v11[4] = self;
  if (qword_1EBE2BE48 != -1) {
    dispatch_once(&qword_1EBE2BE48, v11);
  }
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D98701FC;
  block[3] = &unk_1E6B77D78;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_rebuildUnreadMessageCount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageStore);
  [WeakRetained rebuildUnreadMessageCount];
}

- (void)_compareLastFailureDateAndUpdateBadge:(int64_t)a3
{
  int64_t lastFailedMessageDate = self->_lastFailedMessageDate;
  if (lastFailedMessageDate < a3)
  {
    self->_int64_t lastFailedMessageDate = a3;
    BOOL v4 = 1;
LABEL_5:
    self->_BOOL showingFailure = v4;
    goto LABEL_6;
  }
  if (lastFailedMessageDate > a3)
  {
    BOOL v4 = 0;
    goto LABEL_5;
  }
LABEL_6:
  [(IMDBadgeUtilities *)self _updateBadge];
}

- (void)_stopSuppressingSound
{
  IMSetDomainValueForKey();

  IMSetDomainValueForKey();
}

- (void)_cacheFailureDate:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int64_t lastFailedMessageDate = self->_lastFailedMessageDate;
        int v7 = 134218240;
        int64_t v8 = lastFailedMessageDate;
        __int16 v9 = 2048;
        int64_t v10 = a3;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Cached failure id %lld    alert failure id %lld", (uint8_t *)&v7, 0x16u);
      }
    }
    [(IMDBadgeUtilities *)self _saveFailureDate:a3];
  }
}

- (IMDefaults)sharedDefaultsInstance
{
  sharedDefaultsInstance = self->_sharedDefaultsInstance;
  if (!sharedDefaultsInstance)
  {
    BOOL v4 = [MEMORY[0x1E4F6E720] sharedInstance];
    int v5 = self->_sharedDefaultsInstance;
    self->_sharedDefaultsInstance = v4;

    sharedDefaultsInstance = self->_sharedDefaultsInstance;
  }

  return sharedDefaultsInstance;
}

- (int64_t)_savedFailureDate
{
  id v2 = [(IMDBadgeUtilities *)self sharedDefaultsInstance];
  uint64_t v3 = [v2 getValueFromDomain:@"com.apple.imdbadgeutilities" forKey:@"lastMadridFailureID"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v4 = [v3 longLongValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)_saveFailureDate:(int64_t)a3
{
  id v5 = [NSNumber numberWithLongLong:a3];
  int64_t v4 = [(IMDBadgeUtilities *)self sharedDefaultsInstance];
  [v4 setValue:v5 forDomain:@"com.apple.imdbadgeutilities" forKey:@"lastMadridFailureID"];
}

- (BOOL)_isUnexpectedlyLogOutValue
{
  return self->_unexpectedlyLoggedOut;
}

- (void)satelliteStateDidChange:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1D98705C4;
  v4[3] = &unk_1E6B784B0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (void)setUnreadCount:(unint64_t)a3
{
  self->_unint64_t unreadCount = a3;
}

- (int64_t)lastFailedMessageDate
{
  return self->_lastFailedMessageDate;
}

- (void)setLastFailedMessageDate:(int64_t)a3
{
  self->_int64_t lastFailedMessageDate = a3;
}

- (BOOL)isShowingFailure
{
  return self->_showingFailure;
}

- (void)setShowingFailure:(BOOL)a3
{
  self->_BOOL showingFailure = a3;
}

- (void)setUnexpectedlyLoggedOut:(BOOL)a3
{
  self->_unexpectedlyLoggedOut = a3;
}

- (BOOL)addedObserverForUnexpectedlyLoggedOut
{
  return self->_addedObserverForUnexpectedlyLoggedOut;
}

- (void)setAddedObserverForUnexpectedlyLoggedOut:(BOOL)a3
{
  self->_addedObserverForUnexpectedlyLoggedOut = a3;
}

- (BOOL)isStewieActive
{
  return self->_isStewieActive;
}

- (void)setIsStewieActive:(BOOL)a3
{
  self->_isStewieActive = a3;
}

- (NSMutableDictionary)pendingSatelliteMessagesPerService
{
  return self->_pendingSatelliteMessagesPerService;
}

- (void)setPendingSatelliteMessagesPerService:(id)a3
{
}

- (void)setNotificationCenter:(id)a3
{
}

- (void)setSharedDefaultsInstance:(id)a3
{
}

- (IMDMessageStore)messageStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageStore);

  return (IMDMessageStore *)WeakRetained;
}

- (void)setMessageStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageStore);
  objc_storeStrong((id *)&self->_sharedDefaultsInstance, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_pendingSatelliteMessagesPerService, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end