@interface MFContactsManager
+ (BOOL)isAuthorizedToUseContacts;
+ (id)sharedManager;
- (CNContactStore)contactStore;
- (MFContactsManager)init;
- (MFContactsManager)initWithContactStore:(id)a3;
@end

@implementation MFContactsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_15);
  }
  v2 = (void *)sharedManager_sharedManager_0;

  return v2;
}

void __34__MFContactsManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(MFContactsManager);
  v1 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v0;
}

+ (BOOL)isAuthorizedToUseContacts
{
  if (isAuthorizedToUseContacts_onceToken != -1) {
    dispatch_once(&isAuthorizedToUseContacts_onceToken, &__block_literal_global_2_0);
  }
  return isAuthorizedToUseContacts_sIsAuthorizedToUseContacts;
}

uint64_t __46__MFContactsManager_isAuthorizedToUseContacts__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
  isAuthorizedToUseContacts_sIsAuthorizedToUseContacts = (unint64_t)(result - 3) < 0xFFFFFFFFFFFFFFFELL;
  return result;
}

- (MFContactsManager)init
{
  v3 = MSSharedContactStore();
  v4 = [(MFContactsManager *)self initWithContactStore:v3];

  return v4;
}

- (MFContactsManager)initWithContactStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFContactsManager;
  v6 = [(MFContactsManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactStore, a3);
  }

  return v7;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end