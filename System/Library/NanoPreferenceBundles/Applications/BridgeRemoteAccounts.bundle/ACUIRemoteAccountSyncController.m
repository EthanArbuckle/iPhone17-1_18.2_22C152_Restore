@interface ACUIRemoteAccountSyncController
- (ACAccountStore)accountStore;
- (ACUIRemoteAccountSyncController)initWithRemoteDevice:(id)a3;
- (ACUIRemoteAccountSyncController)syncController;
- (BOOL)_isAccount:(id)a3 equalTo:(id)a4;
- (BOOL)_isExisitingAccount:(id)a3;
- (BOOL)reloading;
- (NRDevice)device;
- (NSArray)accounts;
- (NSMutableSet)observers;
- (OS_dispatch_queue)observerQueue;
- (id)_defaultAccountTypes;
- (id)_removeAccount:(id)a3 fromArray:(id)a4;
- (id)topLevelAccounts;
- (void)_notifyAccountsChanged;
- (void)_notifyAccountsInvalidated;
- (void)_notifyStateChanged;
- (void)addObserver:(id)a3;
- (void)fetchRemoteAccounts:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeRemoteAccount:(id)a3 completion:(id)a4;
- (void)saveRemoteAccount:(id)a3 completion:(id)a4;
- (void)setAccountStore:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setDevice:(id)a3;
- (void)setObserverQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setReloading:(BOOL)a3;
- (void)setSyncController:(id)a3;
- (void)updateRemoteAccount:(id)a3 completion:(id)a4;
@end

@implementation ACUIRemoteAccountSyncController

- (ACUIRemoteAccountSyncController)initWithRemoteDevice:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v16;
  v16 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)ACUIRemoteAccountSyncController;
  v16 = [(ACUIRemoteAccountSyncController *)&v14 init];
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    v4 = (ACAccountStore *)+[ACAccountStore defaultStore];
    accountStore = v16->_accountStore;
    v16->_accountStore = v4;

    objc_storeStrong((id *)&v16->_device, location[0]);
    v6 = (NSArray *)objc_alloc_init((Class)NSArray);
    accounts = v16->_accounts;
    v16->_accounts = v6;

    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observers = v16->_observers;
    v16->_observers = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.accountsui.syncObservers", 0);
    observerQueue = v16->_observerQueue;
    v16->_observerQueue = (OS_dispatch_queue *)v10;
  }
  v13 = v16;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v13;
}

- (id)topLevelAccounts
{
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  obj = v15->_accounts;
  id v11 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v8);
      id v2 = [v13 parentAccount];
      BOOL v5 = v2 != 0;

      if (!v5) {
        [v14[0] addObject:v13];
      }
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0;
        id v9 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v4 = [v14[0] copy];
  objc_storeStrong(v14, 0);

  return v4;
}

- (void)fetchRemoteAccounts:(id)a3
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v28->_reloading)
  {
    id v26 = (id)_ACUILogSystem();
    os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
    {
      sub_2C84((uint64_t)v33, (uint64_t)"-[ACUIRemoteAccountSyncController fetchRemoteAccounts:]", 54);
      _os_log_debug_impl(&def_10DA8, (os_log_t)v26, v25, "%s (%d) \"Currently refreshing remote accounts, ignoring new request\"", v33, 0x12u);
    }
    objc_storeStrong(&v26, 0);
    int v24 = 1;
  }
  else
  {
    id v23 = [(ACUIRemoteAccountSyncController *)v28 _defaultAccountTypes];
    v31[0] = ACRemoteDeviceOptionTargetDeviceBTUUID;
    id v11 = [(ACUIRemoteAccountSyncController *)v28 device];
    dispatch_queue_t v10 = [(NRDevice *)v11 bluetoothIdentifier];
    id v9 = [(NSUUID *)v10 UUIDString];
    v32[0] = v9;
    v31[1] = ACRemoteDeviceOptionAccountQueryIgnoreCache;
    v32[1] = &__kCFBooleanTrue;
    v31[2] = ACRemoteDeviceOptionPreloadedPropertiesArray;
    v30[0] = ACPropertyKeyEnabledDataclasses;
    v30[1] = ACPropertyKeyProvisionedDataclasses;
    uint64_t v8 = +[NSArray arrayWithObjects:v30 count:2];
    v32[2] = v8;
    id v22 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

    [(ACUIRemoteAccountSyncController *)v28 setReloading:1];
    id v21 = (id)_ACUILogSystem();
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v22 objectForKeyedSubscript:ACRemoteDeviceOptionTargetDeviceBTUUID];
      id v6 = [v22 objectForKeyedSubscript:ACRemoteDeviceOptionAccountQueryIgnoreCache];
      sub_3884((uint64_t)v29, (uint64_t)"-[ACUIRemoteAccountSyncController fetchRemoteAccounts:]", 67, (uint64_t)v7, (uint64_t)v6);
      _os_log_debug_impl(&def_10DA8, (os_log_t)v21, v20, "%s (%d) \"Fetching accounts(deviceID = %{public}@; ignoreCache = %@)\"",
        v29,
        0x26u);
    }
    objc_storeStrong(&v21, 0);
    objc_initWeak(&from, v28);
    v3 = [(ACUIRemoteAccountSyncController *)v28 accountStore];
    id v4 = v23;
    id v5 = v22;
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_3908;
    v16 = &unk_18390;
    objc_copyWeak(v18, &from);
    id v17 = location[0];
    [(ACAccountStore *)v3 accountsOnPairedDeviceWithAccountTypes:v4 withOptions:v5 completion:&v12];

    objc_storeStrong(&v17, 0);
    objc_destroyWeak(v18);
    objc_destroyWeak(&from);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
    int v24 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)saveRemoteAccount:(id)a3 completion:(id)a4
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  uint64_t v32 = ACRemoteDeviceOptionTargetDeviceBTUUID;
  v12 = [(ACUIRemoteAccountSyncController *)v30 device];
  id v11 = [(NRDevice *)v12 bluetoothIdentifier];
  dispatch_queue_t v10 = [(NSUUID *)v11 UUIDString];
  v33 = v10;
  id v27 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  id v26 = (id)_ACUILogSystem();
  os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [location[0] description];
    id v24 = v9;
    uint64_t v8 = [(ACUIRemoteAccountSyncController *)v30 device];
    id v7 = [(NRDevice *)v8 bluetoothIdentifier];
    id v23 = v7;
    sub_3F08((uint64_t)v31, (uint64_t)"-[ACUIRemoteAccountSyncController saveRemoteAccount:completion:]", 87, (uint64_t)v24, (uint64_t)v23);
    _os_log_debug_impl(&def_10DA8, (os_log_t)v26, v25, "%s (%d) \"Saving account(account = %@; deviceID = %{public}@)\"",
      v31,
      0x26u);

    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_initWeak(&from, v30);
  id v4 = [(ACUIRemoteAccountSyncController *)v30 accountStore];
  id v5 = location[0];
  id v6 = v27;
  int v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = sub_3F8C;
  v18 = &unk_183B8;
  objc_copyWeak(v21, &from);
  id v19 = location[0];
  id v20 = v28;
  [(ACAccountStore *)v4 saveAccount:v5 toPairedDeviceWithOptions:v6 completion:&v14];

  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_destroyWeak(v21);
  objc_destroyWeak(&from);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)updateRemoteAccount:(id)a3 completion:(id)a4
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  uint64_t v32 = ACRemoteDeviceOptionTargetDeviceBTUUID;
  v12 = [(ACUIRemoteAccountSyncController *)v30 device];
  id v11 = [(NRDevice *)v12 bluetoothIdentifier];
  dispatch_queue_t v10 = [(NSUUID *)v11 UUIDString];
  v33 = v10;
  id v27 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  id v26 = (id)_ACUILogSystem();
  os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [location[0] description];
    id v24 = v9;
    uint64_t v8 = [(ACUIRemoteAccountSyncController *)v30 device];
    id v7 = [(NRDevice *)v8 bluetoothIdentifier];
    id v23 = v7;
    sub_3F08((uint64_t)v31, (uint64_t)"-[ACUIRemoteAccountSyncController updateRemoteAccount:completion:]", 115, (uint64_t)v24, (uint64_t)v23);
    _os_log_debug_impl(&def_10DA8, (os_log_t)v26, v25, "%s (%d) \"Updating account(account = %@; deviceID = %{public}@)\"",
      v31,
      0x26u);

    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_initWeak(&from, v30);
  id v4 = [(ACUIRemoteAccountSyncController *)v30 accountStore];
  id v5 = location[0];
  id v6 = v27;
  int v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = sub_466C;
  v18 = &unk_183B8;
  objc_copyWeak(v21, &from);
  id v19 = location[0];
  id v20 = v28;
  [(ACAccountStore *)v4 notifyRemoteDevicesOfModifiedAccount:v5 withOptions:v6 completion:&v14];

  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_destroyWeak(v21);
  objc_destroyWeak(&from);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)removeRemoteAccount:(id)a3 completion:(id)a4
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  uint64_t v32 = ACRemoteDeviceOptionTargetDeviceBTUUID;
  v12 = [(ACUIRemoteAccountSyncController *)v30 device];
  id v11 = [(NRDevice *)v12 bluetoothIdentifier];
  dispatch_queue_t v10 = [(NSUUID *)v11 UUIDString];
  v33 = v10;
  id v27 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  id v26 = (id)_ACUILogSystem();
  os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [location[0] description];
    id v24 = v9;
    uint64_t v8 = [(ACUIRemoteAccountSyncController *)v30 device];
    id v7 = [(NRDevice *)v8 bluetoothIdentifier];
    id v23 = v7;
    sub_3F08((uint64_t)v31, (uint64_t)"-[ACUIRemoteAccountSyncController removeRemoteAccount:completion:]", 132, (uint64_t)v24, (uint64_t)v23);
    _os_log_debug_impl(&def_10DA8, (os_log_t)v26, v25, "%s (%d) \"Removing account(account = %@; deviceID = %{public}@)\"",
      v31,
      0x26u);

    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_initWeak(&from, v30);
  id v4 = [(ACUIRemoteAccountSyncController *)v30 accountStore];
  id v5 = location[0];
  id v6 = v27;
  int v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = sub_4C0C;
  v18 = &unk_183B8;
  objc_copyWeak(v21, &from);
  id v19 = location[0];
  id v20 = v28;
  [(ACAccountStore *)v4 removeAccountFromPairedDevice:v5 withOptions:v6 completion:&v14];

  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_destroyWeak(v21);
  objc_destroyWeak(&from);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)addObserver:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_observerQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_4EB4;
  uint64_t v8 = &unk_183E0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)removeObserver:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_observerQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_5014;
  uint64_t v8 = &unk_183E0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_notifyAccountsChanged
{
  v8[2] = self;
  v8[1] = (id)a2;
  queue = self->_observerQueue;
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_5124;
  id v7 = &unk_18408;
  v8[0] = self;
  dispatch_async(queue, &v3);
  objc_storeStrong(v8, 0);
}

- (void)_notifyAccountsInvalidated
{
  v8[2] = self;
  v8[1] = (id)a2;
  queue = self->_observerQueue;
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_5384;
  id v7 = &unk_18408;
  v8[0] = self;
  dispatch_async(queue, &v3);
  objc_storeStrong(v8, 0);
}

- (void)_notifyStateChanged
{
  v8[2] = self;
  v8[1] = (id)a2;
  queue = self->_observerQueue;
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_55E4;
  id v7 = &unk_18408;
  v8[0] = self;
  dispatch_async(queue, &v3);
  objc_storeStrong(v8, 0);
}

- (void)setReloading:(BOOL)a3
{
  self->_reloading = a3;
  [(ACUIRemoteAccountSyncController *)self _notifyStateChanged];
}

- (id)_removeAccount:(id)a3 fromArray:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  id v11 = v16;
  id v12 = [v11 countByEnumeratingWithState:__b objects:v19 count:16];
  if (v12)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    id v9 = v12;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(v11);
      }
      uint64_t v14 = *(void *)(__b[1] + 8 * v8);
      if (![(ACUIRemoteAccountSyncController *)v18 _isAccount:v14 equalTo:location[0]]) {
        [v15 addObject:v14];
      }
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0;
        id v9 = [v11 countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v5 = [v15 copy];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (BOOL)_isExisitingAccount:(id)a3
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = v14->_accounts;
  id v9 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v6);
      if ([(ACUIRemoteAccountSyncController *)v14 _isAccount:location[0] equalTo:v12]) {
        break;
      }
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0;
        id v7 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          goto LABEL_9;
        }
      }
    }
    char v15 = 1;
    int v10 = 1;
  }
  else
  {
LABEL_9:
    int v10 = 0;
  }

  if (!v10) {
    char v15 = 0;
  }
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (BOOL)_isAccount:(id)a3 equalTo:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v6 = [location[0] identifier];
  id v7 = [v13 identifier];
  char v11 = 0;
  char v9 = 0;
  unsigned __int8 v8 = 1;
  if ((objc_msgSend(v6, "isEqualToString:") & 1) == 0)
  {
    id v12 = [location[0] parentAccountIdentifier];
    char v11 = 1;
    id v10 = [v13 identifier];
    char v9 = 1;
    unsigned __int8 v8 = objc_msgSend(v12, "isEqualToString:");
  }
  char v15 = v8 & 1;
  if (v9) {

  }
  if (v11) {
  objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (id)_defaultAccountTypes
{
  uint64_t v4 = self;
  SEL v3 = a2;
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", ACAccountTypeIdentifierSubscribedCalendar, ACAccountTypeIdentifierCalDAV, ACAccountTypeIdentifierCardDAV, ACAccountTypeIdentifierBookmarkDAV, ACAccountTypeIdentifierIMAP, ACAccountTypeIdentifierPOP, ACAccountTypeIdentifierSMTP, ACAccountTypeIdentifierExchange, ACAccountTypeIdentifierHotmail, ACAccountTypeIdentifierLDAP, ACAccountTypeIdentifierGmail, ACAccountTypeIdentifierYahoo, ACAccountTypeIdentifierAol, ACAccountTypeIdentifierOnMyDevice, ACAccountTypeIdentifierIMAPNotes, ACAccountTypeIdentifierIMAPMail, ACAccountTypeIdentifierAppleAccount,
           0);
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (BOOL)reloading
{
  return self->_reloading;
}

- (NRDevice)device
{
  return (NRDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccountStore:(id)a3
{
}

- (ACUIRemoteAccountSyncController)syncController
{
  return (ACUIRemoteAccountSyncController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSyncController:(id)a3
{
}

- (NSMutableSet)observers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setObserverQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end