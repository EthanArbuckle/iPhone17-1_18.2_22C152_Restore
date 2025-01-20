@interface NCABContactsSyncHelper
+ (id)localDeviceContactsCount;
+ (int)_contactsCountStatusForFamilyMember:(id)a3;
+ (int)contactsCountStatusForFamilyMember:(id)a3 contactsSyncAndNetworkAccessEnabled:(BOOL)a4;
+ (void)triggerContactsSyncForFamilyMember:(id)a3;
@end

@implementation NCABContactsSyncHelper

+ (int)contactsCountStatusForFamilyMember:(id)a3 contactsSyncAndNetworkAccessEnabled:(BOOL)a4
{
  if (a4) {
    return [a1 _contactsCountStatusForFamilyMember:a3];
  }
  else {
    return 1;
  }
}

+ (int)_contactsCountStatusForFamilyMember:(id)a3
{
  v3 = +[CNContactStore storeForFamilyMember:a3];
  id v4 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:&__NSArray0__struct];
  id v21 = 0;
  v5 = [v3 contactCountForFetchRequest:v4 error:&v21];
  id v6 = v21;
  id v7 = [v5 unsignedIntegerValue];
  BOOL v8 = v7 != 0;
  v9 = NCABCSH_ContactCounts_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v23 = "+[NCABContactsSyncHelper _contactsCountStatusForFamilyMember:]";
    __int16 v24 = 2114;
    v25 = v5;
    __int16 v26 = 1024;
    BOOL v27 = v7 != 0;
    __int16 v28 = 2114;
    id v29 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s - contactCountNumber: %{public}@ -> hasContacts: %d, error: %{public}@", buf, 0x26u);
  }

  if (v6 || v7)
  {
    v10 = v5;
    if (v6) {
      goto LABEL_12;
    }
  }
  else
  {
    [v4 setShouldFailIfAccountNotYetSynced:1];
    id v20 = 0;
    v10 = [v3 contactCountForFetchRequest:v4 error:&v20];
    id v6 = v20;

    id v11 = [v10 unsignedIntegerValue];
    BOOL v8 = v11 != 0;
    v12 = NCABCSH_ContactCounts_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "+[NCABContactsSyncHelper _contactsCountStatusForFamilyMember:]";
      __int16 v24 = 2114;
      v25 = v10;
      __int16 v26 = 1024;
      BOOL v27 = v11 != 0;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s - RETRIED with shouldFailIfAccountNotYetSynced; contactCountNumber: %{public}@ -> hasContacts: %d, error: %{public}@",
        buf,
        0x26u);
    }

    if (v6) {
      goto LABEL_12;
    }
  }
  if (v8)
  {
    int v13 = 5;
    goto LABEL_27;
  }
LABEL_12:
  if (v6) {
    int v14 = 1;
  }
  else {
    int v14 = v8;
  }
  if (v14 != 1)
  {
    int v13 = 4;
    goto LABEL_27;
  }
  v15 = [v6 domain];
  if (![v15 isEqual:CNErrorDomain])
  {

    goto LABEL_23;
  }
  v16 = (char *)[v6 code];

  if (v16 != &stru_3D8.segname[7])
  {
LABEL_23:
    v17 = NCABCSH_ContactCounts_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_F894((uint64_t)v4, (uint64_t)v6, v17);
    }
    int v13 = 3;
    goto LABEL_26;
  }
  v17 = NCABCSH_ContactCounts_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v23 = "+[NCABContactsSyncHelper _contactsCountStatusForFamilyMember:]";
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}s - got CNErrorAccountNotYetSynced", buf, 0xCu);
  }
  int v13 = 2;
LABEL_26:

LABEL_27:
  v18 = NCABCSH_ContactCounts_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v23 = "+[NCABContactsSyncHelper _contactsCountStatusForFamilyMember:]";
    __int16 v24 = 1024;
    LODWORD(v25) = v13;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}s - contactsCountStatus: %d", buf, 0x12u);
  }

  return v13;
}

+ (id)localDeviceContactsCount
{
  id v2 = objc_alloc_init((Class)CNContactStore);
  id v3 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:&__NSArray0__struct];
  id v8 = 0;
  id v4 = [v2 contactCountForFetchRequest:v3 error:&v8];
  id v5 = v8;
  id v6 = NCABCSH_ContactCounts_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v10 = "+[NCABContactsSyncHelper localDeviceContactsCount]";
    __int16 v11 = 2114;
    v12 = v4;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s - contactCountNumber: %{public}@, error: %{public}@", buf, 0x20u);
  }

  return v4;
}

+ (void)triggerContactsSyncForFamilyMember:(id)a3
{
  id v3 = a3;
  id v4 = NCABCSH_ContactCounts_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "+[NCABContactsSyncHelper triggerContactsSyncForFamilyMember:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: %@", (uint8_t *)&v5, 0x16u);
  }

  +[CNAccount requestAccountSyncWithOptions:1];
}

@end