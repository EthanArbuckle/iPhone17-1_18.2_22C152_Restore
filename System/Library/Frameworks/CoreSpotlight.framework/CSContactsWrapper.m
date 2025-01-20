@interface CSContactsWrapper
+ (Class)CNContactClass;
+ (Class)CNContactFetchRequestClass;
+ (Class)CNContactFormatterClass;
+ (Class)CNContactStoreClass;
+ (id)CNContactNicknameKey;
+ (id)sharedInstance;
- (Class)CNContactPropertyClass;
- (NSString)CNContactEmailAddressesKeyString;
@end

@implementation CSContactsWrapper

- (NSString)CNContactEmailAddressesKeyString
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void **)getCNContactEmailAddressesKeySymbolLoc_ptr_0;
  uint64_t v10 = getCNContactEmailAddressesKeySymbolLoc_ptr_0;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_0)
  {
    v3 = (void *)ContactsLibrary_0();
    v8[3] = (uint64_t)dlsym(v3, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr_0 = v8[3];
    v2 = (void **)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    IsSyndicatedPhotos_cold_1 = (_Unwind_Exception *)CSSectionIsSyndicatedPhotos_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(IsSyndicatedPhotos_cold_1);
  }
  v4 = *v2;

  return (NSString *)v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_30);
  }
  v2 = (void *)sharedInstance_sContactsWrapper;

  return v2;
}

uint64_t __35__CSContactsWrapper_sharedInstance__block_invoke()
{
  sharedInstance_sContactsWrapper = objc_alloc_init(CSContactsWrapper);

  return MEMORY[0x1F41817F8]();
}

+ (Class)CNContactClass
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getCNContactClass_softClass;
  uint64_t v9 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getCNContactClass_block_invoke;
    v5[3] = &unk_1E5548E88;
    v5[4] = &v6;
    __getCNContactClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (Class)CNContactFetchRequestClass
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getCNContactFetchRequestClass_softClass;
  uint64_t v9 = getCNContactFetchRequestClass_softClass;
  if (!getCNContactFetchRequestClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getCNContactFetchRequestClass_block_invoke;
    v5[3] = &unk_1E5548E88;
    v5[4] = &v6;
    __getCNContactFetchRequestClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (Class)CNContactFormatterClass
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getCNContactFormatterClass_softClass;
  uint64_t v9 = getCNContactFormatterClass_softClass;
  if (!getCNContactFormatterClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getCNContactFormatterClass_block_invoke;
    v5[3] = &unk_1E5548E88;
    v5[4] = &v6;
    __getCNContactFormatterClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (Class)CNContactStoreClass
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getCNContactStoreClass_softClass_0;
  uint64_t v9 = getCNContactStoreClass_softClass_0;
  if (!getCNContactStoreClass_softClass_0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getCNContactStoreClass_block_invoke_0;
    v5[3] = &unk_1E5548E88;
    v5[4] = &v6;
    __getCNContactStoreClass_block_invoke_0((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (id)CNContactNicknameKey
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void **)getCNContactNicknameKeySymbolLoc_ptr;
  uint64_t v10 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    id v3 = (void *)ContactsLibrary_0();
    v8[3] = (uint64_t)dlsym(v3, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr = v8[3];
    v2 = (void **)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    IsSyndicatedPhotos_cold_1 = (_Unwind_Exception *)CSSectionIsSyndicatedPhotos_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(IsSyndicatedPhotos_cold_1);
  }
  v4 = *v2;

  return v4;
}

- (Class)CNContactPropertyClass
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getCNContactPropertyClass_softClass;
  uint64_t v9 = getCNContactPropertyClass_softClass;
  if (!getCNContactPropertyClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getCNContactPropertyClass_block_invoke;
    v5[3] = &unk_1E5548E88;
    v5[4] = &v6;
    __getCNContactPropertyClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

@end