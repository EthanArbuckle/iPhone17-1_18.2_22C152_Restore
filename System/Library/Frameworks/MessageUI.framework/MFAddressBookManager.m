@interface MFAddressBookManager
+ (BOOL)isAuthorizedToUseAddressBook;
+ (id)sharedManager;
- (MFAddressBookManager)init;
- (id)_clientsArray;
- (void)_handleAddressBookChangeNotification;
- (void)_handleAddressBookPrefsChangeNotification;
- (void)addClient:(id)a3;
- (void)addressBook;
- (void)dealloc;
- (void)removeClient:(id)a3;
@end

@implementation MFAddressBookManager

- (void)addClient:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_clients addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

- (void)addressBook
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  result = self->_addressBook;
  if (!result)
  {
    CFErrorRef error = 0;
    v4 = (void *)ABAddressBookCreateWithOptions(0, &error);
    self->_addressBook = v4;
    if (v4)
    {
      ABAddressBookRegisterChangeCallback();
      ABAddressBookRegisterExternalChangeCallback(self->_addressBook, (ABExternalChangeCallback)_AddressBookEventHandler, self);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_addressBookPreferencesChanged, @"com.apple.AddressBook.PreferenceChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if (error) {
      CFRelease(error);
    }
    return self->_addressBook;
  }
  return result;
}

void __37__MFAddressBookManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(MFAddressBookManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;
}

- (MFAddressBookManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFAddressBookManager;
  v2 = [(MFAddressBookManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    clients = v3->_clients;
    v3->_clients = (NSHashTable *)v4;
  }
  return v3;
}

+ (BOOL)isAuthorizedToUseAddressBook
{
  if (isAuthorizedToUseAddressBook_onceToken != -1) {
    dispatch_once(&isAuthorizedToUseAddressBook_onceToken, &__block_literal_global_2);
  }
  return isAuthorizedToUseAddressBook_sIsAuthorizedToUseAddressBook;
}

ABAuthorizationStatus __52__MFAddressBookManager_isAuthorizedToUseAddressBook__block_invoke()
{
  ABAuthorizationStatus result = ABAddressBookGetAuthorizationStatus();
  isAuthorizedToUseAddressBook_sIsAuthorizedToUseAddressBook = (unint64_t)(result - 3) < 0xFFFFFFFFFFFFFFFELL;
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  if (self->_addressBook)
  {
    ABAddressBookUnregisterChangeCallback();
    ABAddressBookUnregisterExternalChangeCallback(self->_addressBook, (ABExternalChangeCallback)_AddressBookEventHandler, self);
    CFRelease(self->_addressBook);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFAddressBookManager;
  [(MFAddressBookManager *)&v5 dealloc];
}

- (id)_clientsArray
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSHashTable *)self->_clients allObjects];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_handleAddressBookChangeNotification
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  addressBook = self->_addressBook;
  if (addressBook) {
    ABAddressBookRevert(addressBook);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v4 = [(MFAddressBookManager *)self _clientsArray];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) addressBookManager:self addressBookDidChange:self->_addressBook];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_handleAddressBookPrefsChangeNotification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(MFAddressBookManager *)self _clientsArray];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) addressBookPreferencesChangedForAddressBookManager:self];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)removeClient:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_clients removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end