@interface NSHTTPCookieStorageInternal
- (void)_syncCookies;
- (void)dealloc;
- (void)registerForPostingNotificationsWithContext:(id)a3;
@end

@implementation NSHTTPCookieStorageInternal

- (void)dealloc
{
  storage = self->storage;
  if (storage)
  {
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    HTTPCookieStorage::setDefaultNotificationHandler((uint64_t)storage + 16, 0);
    CFRelease(self->storage);
    self->storage = 0;
  }
  privateStorage = self->privateStorage;
  if (privateStorage)
  {
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    HTTPCookieStorage::setDefaultNotificationHandler((uint64_t)privateStorage + 16, 0);
    CFRelease(self->privateStorage);
    self->privateStorage = 0;
  }
  dataLock = self->dataLock;
  if (dataLock)
  {

    self->dataLock = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NSHTTPCookieStorageInternal;
  [(NSHTTPCookieStorageInternal *)&v6 dealloc];
}

- (void)registerForPostingNotificationsWithContext:(id)a3
{
  storage = self->storage;
  if (storage)
  {
    if (a3)
    {
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __74__NSHTTPCookieStorageInternal_registerForPostingNotificationsWithContext___block_invoke;
      v8[3] = &unk_1E5258228;
      v8[4] = a3;
      HTTPCookieStorage::setDefaultNotificationHandler((uint64_t)storage + 16, v8);
      storage = self->storage;
    }
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    *((unsigned char *)storage + 80) = 1;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__syncCookies, @"UIApplicationSuspendedNotification", 0);
  }
  if (a3)
  {
    privateStorage = self->privateStorage;
    if (privateStorage)
    {
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
      }
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __74__NSHTTPCookieStorageInternal_registerForPostingNotificationsWithContext___block_invoke_2;
      v7[3] = &unk_1E5258228;
      v7[4] = a3;
      HTTPCookieStorage::setDefaultNotificationHandler((uint64_t)privateStorage + 16, v7);
    }
  }
}

- (void)_syncCookies
{
  storage = self->storage;
  if (storage)
  {
    if (newCookieStorageEnabled(void)::onceToken != -1) {
      dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1187);
    }
    if (!newCookieStorageEnabled(void)::enabled)
    {
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
      }
      HTTPCookieStorage::syncStorageWithCompletion((uint64_t)storage + 16, 1, 0);
    }
  }
}

uint64_t __74__NSHTTPCookieStorageInternal_registerForPostingNotificationsWithContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  return [v2 postNotificationName:@"NSHTTPCookieManagerCookiesChangedNotification" object:v1];
}

uint64_t __74__NSHTTPCookieStorageInternal_registerForPostingNotificationsWithContext___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  return [v2 postNotificationName:@"NSHTTPCookieManagerCookiesChangedNotification" object:v1];
}

@end