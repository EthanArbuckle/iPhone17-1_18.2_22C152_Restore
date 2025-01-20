void sub_3B04(id a1)
{
  uint64_t vars8;

  qword_15C98 = (uint64_t)os_log_create("com.apple.contacts.accounts", "dataclass-owner");
  _objc_release_x1();
}

void sub_491C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_4BAC(id a1)
{
  qword_15CA8 = (uint64_t)os_log_create("com.apple.contacts.accounts-plugin", "contacts-dataclass-owner");
  _objc_release_x1();
}

BOOL sub_5244(id a1, ACAccount *a2)
{
  return [(ACAccount *)a2 _cn_isCardDAV];
}

NSArray *__cdecl sub_524C(id a1, ACAccount *a2)
{
  return (NSArray *)[(ACAccount *)a2 childAccounts];
}

CNPair *__cdecl sub_5254(id a1, ACAccount *a2)
{
  v2 = a2;
  v3 = [(ACAccount *)v2 identifier];
  uint64_t v4 = [(ACAccount *)v2 _cn_altDSID];

  v5 = +[CNPair pairWithFirst:v3 second:v4];

  return (CNPair *)v5;
}

void sub_61F4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_6214()
{
  return v0;
}

void sub_6280(id a1)
{
  qword_15CB8 = (uint64_t)os_log_create("com.apple.contacts.accounts-plugin", "contacts-dataclass-owner");
  _objc_release_x1();
}

void sub_6744(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_67DC;
  v6[3] = &unk_10430;
  id v7 = v3;
  id v5 = v3;
  objc_msgSend(v4, "_cn_each:", v6);
}

id sub_67DC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateContainer:a2];
}

void sub_67E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
    sub_9F84();
  }
}

id sub_6940(uint64_t a1, void *a2)
{
  return [a2 updateContainer:*(void *)(a1 + 32)];
}

void sub_694C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_9FEC();
  }
}

id sub_6C14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containersInAccountWithExternalIdentifier:a2];
}

uint64_t sub_6C20(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isContainerEmpty:a2] ^ 1;
}

void sub_6E78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6F10;
  v6[3] = &unk_104F8;
  id v7 = v3;
  id v5 = v3;
  objc_msgSend(v4, "_cn_each:", v6);
}

id sub_6F10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteContact:a2];
}

void sub_6F1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_A228(a1, v4, (uint64_t)v3);
  }
}

void sub_723C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 addContainer:v2 toAccountWithIdentifier:v5];
}

void sub_72AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
    sub_A3A8();
  }
}

void sub_72FC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setContainer:v2 asDefaultContainerOfAccountWithIdentifier:v5];
}

void sub_736C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
    sub_A410();
  }
}

id sub_7794(uint64_t a1, void *a2)
{
  return [a2 addAccount:*(void *)(a1 + 32)];
}

void sub_77A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
    sub_A478();
  }
}

void sub_7944(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() removeDelegate:v2];
}

id sub_7C3C(uint64_t a1, void *a2)
{
  return [a2 removeAccount:*(void *)(a1 + 32)];
}

void sub_7C48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_A684(a1, v4, (uint64_t)v3);
  }
}

void sub_81D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_81F8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 contactsInContainer:v3];
  id v5 = objc_msgSend(v4, "_cn_map:", &stru_106D0);
  v6 = +[CNPair pairWithFirst:v3 second:v5];

  return v6;
}

void sub_8290(void *a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 second];
  if (((*(uint64_t (**)(void, void *))(CNIsArrayEmpty + 16))(CNIsArrayEmpty, v3) & 1) == 0)
  {
    id v4 = (void *)a1[4];
    id v5 = [v6 first];
    LOBYTE(v4) = [v4 moveContacts:v3 fromContainer:v5 toContainer:a1[5]];

    if ((v4 & 1) == 0) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
  }
}

void sub_88D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_88F0(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

id sub_9048(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

BOOL sub_912C(id a1, CNContainer *a2)
{
  return [(CNContainer *)a2 isEnabled];
}

CNMutableContainer *__cdecl sub_9134(id a1, CNContainer *a2)
{
  id v2 = [(CNContainer *)a2 mutableCopy];
  return (CNMutableContainer *)v2;
}

CNMutableContact *__cdecl sub_9160(id a1, CNMutableContact *a2)
{
  id v2 = [(CNMutableContact *)a2 mutableCopy];
  return (CNMutableContact *)v2;
}

void sub_918C(id a1, CNMutableContainer *a2)
{
}

void sub_91EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_9208(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_9264(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_927C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_92C0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_92E0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

uint64_t sub_9328()
{
  return v0;
}

void sub_9388(id a1)
{
  qword_15CC8 = (uint64_t)os_log_create("com.apple.contacts.accounts", "dataclass-owner-plugin");
  _objc_release_x1();
}

Class sub_9778()
{
  if (qword_15CE0 != -1) {
    dispatch_once(&qword_15CE0, &stru_10750);
  }
  Class result = objc_getClass("DMFiCloudPolicyMonitor");
  qword_15CD0 = (uint64_t)result;
  off_15C88 = (uint64_t (*)())sub_97DC;
  return result;
}

id sub_97DC()
{
  return (id)qword_15CD0;
}

void sub_97E8(id a1)
{
  qword_15CD8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement", 1);
  if (!qword_15CD8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_AEE8();
  }
}

void sub_9834()
{
  sub_4904();
  sub_491C(&dword_0, v0, v1, "(%p) actionsForEnablingDataclassOnAppleAccount - No local data to merge into sync data. (%@)");
}

void sub_989C()
{
  sub_4904();
  sub_491C(&dword_0, v0, v1, "(%p) actionsForEnablingDataclassOnAppleAccount - Will merge local data into sync. (%@)");
}

void sub_9904()
{
  sub_4904();
  sub_491C(&dword_0, v0, v1, "%p actionsForEnablingDataclassOnGenericAccount - No local data to merge into sync data. (%@)");
}

void sub_996C()
{
  sub_4904();
  sub_491C(&dword_0, v0, v1, "%p actionsForEnablingDataclassOnGenericAccount - Will merge local data into sync. (%@)");
}

void sub_99D4()
{
  sub_4904();
  sub_491C(&dword_0, v0, v1, "%p actionsForDeletingAppleAccount - Restricted. (%@)");
}

void sub_9A3C()
{
  sub_4904();
  sub_491C(&dword_0, v0, v1, "%p actionsForDeletingAppleAccount - Sources Empty. (%@)");
}

void sub_9AA4()
{
  sub_4904();
  sub_491C(&dword_0, v0, v1, "%p actionsForDeletingAppleAccount (%@)");
}

void sub_9B0C()
{
  sub_4904();
  sub_491C(&dword_0, v0, v1, "%p actionsForDeletingGenericAccount (%@)");
}

void sub_9B74()
{
  sub_6220();
  id v2 = [v1 account];
  id v3 = [v2 accountType];
  [v3 identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_6214() account];
  uint64_t v5 = [v4 username];
  sub_61DC();
  sub_61F4(&dword_0, v6, v7, "Failed to create an Contacts account for iCloud account %@ (%@)", v8, v9, v10, v11, v12);
}

void sub_9C48()
{
  sub_6220();
  id v2 = [v1 account];
  id v3 = [v2 accountType];
  [v3 identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_6214() account];
  uint64_t v5 = [v4 username];
  sub_61DC();
  sub_61F4(&dword_0, v6, v7, "Could not from the Contacts container for iCloud account %@ (%@) into the Contacts local container", v8, v9, v10, v11, v12);
}

void sub_9D1C()
{
  sub_6220();
  id v2 = [v1 account];
  id v3 = [v2 accountType];
  [v3 identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_6214() account];
  uint64_t v5 = [v4 username];
  sub_61DC();
  sub_61F4(&dword_0, v6, v7, "Failed to remove the Contacts account for iCloud account %@ (%@)", v8, v9, v10, v11, v12);
}

void sub_9DF0()
{
  sub_6220();
  id v2 = [v1 account];
  id v3 = [v2 accountType];
  [v3 description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_6214() account];
  uint64_t v5 = [v4 username];
  sub_61DC();
  sub_61F4(&dword_0, v6, v7, "Failed to remove the Contacts account for account %@ (%@)", v8, v9, v10, v11, v12);
}

void sub_9EC4()
{
  sub_92B4();
  id v3 = [v2 identifier];
  uint64_t v4 = [v1 valueForKey:@"identifier"];
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  sub_9264(&dword_0, v0, v5, "Could not find local CN account for account with external identifier  %{public}@  and child external identifiers  %{public}@. Skipping container enablement.", (uint8_t *)&v6);
}

void sub_9F84()
{
  sub_9228();
  sub_91EC(&dword_0, v0, v1, "failed to enable containers: %@", v2, v3, v4, v5, v6);
}

void sub_9FEC()
{
  sub_9228();
  sub_91EC(&dword_0, v0, v1, "failed to enable local container: %@", v2, v3, v4, v5, v6);
}

void sub_A054()
{
  sub_92B4();
  uint64_t v2 = [v1 identifier];
  sub_9228();
  __int16 v5 = 2114;
  uint64_t v6 = v3;
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "Containers associated with account (external identifier = %{public}@) are %{public}@", v4, 0x16u);
}

void sub_A114()
{
  sub_92B4();
  [v1 count];
  [v0 iOSLegacyIdentifier];
  sub_924C();
  sub_927C(&dword_0, v2, v3, "emptyLocalContainer deleted %ld contacts from the local store (legacy id = %d).", v4, v5, v6, v7, v8);
}

void sub_A1A0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "emptyLocalContainer encountered a nil result while fetching local container contacts.", v1, 2u);
}

void sub_A1E4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "emptyLocalContainer found 0 contacts in the local store, no need to delete anything.", v1, 2u);
}

void sub_A228(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [(id)sub_9328() count];
  sub_9300();
  uint64_t v8 = a3;
  sub_9264(&dword_0, v3, v6, "error deleting %ld contacts: %{public}@", v7);
}

void sub_A2C4(void *a1)
{
  uint64_t v2 = [0 identifier];
  uint64_t v3 = [a1 valueForKey:@"identifier"];
  sub_92C0(&dword_0, v4, v5, "defaultContainerForParentACAccountWithIdentifier could not find a CN account associated with external identifier %{public}@ and child account external idententfiers %{public}@ (createIfNecessary = %{public}@)", v6, v7, v8, v9, 2u);
}

void sub_A3A8()
{
  sub_9228();
  sub_91EC(&dword_0, v0, v1, "error creating container: %@", v2, v3, v4, v5, v6);
}

void sub_A410()
{
  sub_9228();
  sub_91EC(&dword_0, v0, v1, "error setting container as default container: %@", v2, v3, v4, v5, v6);
}

void sub_A478()
{
  sub_9228();
  sub_9208(&dword_0, v0, v1, "error creating account %@: %@");
}

void sub_A4F0()
{
  sub_9228();
  sub_91EC(&dword_0, v0, v1, "Asked to remove account with external identifier %{public}@ but could not find it", v2, v3, v4, v5, v6);
}

void sub_A558()
{
  sub_9234();
  sub_9208(&dword_0, v0, v1, "Removing delegate with altDSID: %{public}@ failed: %{public}@");
}

void sub_A5C0(void *a1, NSObject *a2)
{
  [a1 identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)sub_9328() externalIdentifierString];
  [a1 iOSLegacyIdentifier];
  sub_929C();
  __int16 v8 = 1024;
  int v9 = v6;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Removing CN account (identifier %{public}@  external identifier = %{public}@  legacy id = %d)", v7, 0x1Cu);
}

void sub_A684(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v6 = [(id)sub_9328() externalIdentifierString];
  sub_9228();
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  sub_9264(&dword_0, v3, v7, "cound not remove account %@: %@", v8);
}

void sub_A734(void *a1)
{
  uint64_t v2 = [a1 identifier];
  [a1 iOSLegacyIdentifier];
  sub_924C();
  sub_927C(&dword_0, v3, v4, "contactsInContainer returned 0 contacts for local container, no need to merge contacts from container (identifier = %{public}@ legacy id: %d)", v5, v6, v7, v8, v9);
}

void sub_A7CC()
{
  sub_9234();
  sub_9208(&dword_0, v0, v1, "did not migrate contacts to from container %@ to local container: %{public}@");
}

void sub_A834(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  sub_9228();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "no account syncing Contacts found on parent account %@", v4, 0xCu);
}

void sub_A8C8()
{
  sub_9228();
  sub_91EC(&dword_0, v0, v1, "did not find local container %@", v2, v3, v4, v5, v6);
}

void sub_A930(void *a1)
{
  uint64_t v2 = [a1 identifier];
  [a1 iOSLegacyIdentifier];
  sub_924C();
  sub_927C(&dword_0, v3, v4, "Found local container, identifier: %{public}@ legacy id = %d", v5, v6, v7, v8, v9);
}

void sub_A9C8(void *a1)
{
  uint64_t v2 = [a1 identifier];
  uint64_t v3 = [a1 externalIdentifierString];
  sub_9314();
  sub_92C0(&dword_0, v4, v5, "did not find a default container for account with CN identifier: %{public}@ external identifier: %{public}@ error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_AA7C(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a1 identifier];
  LODWORD(v5) = [v5 iOSLegacyIdentifier];
  uint64_t v7 = [a2 identifier];
  uint64_t v8 = [a2 externalIdentifierString];
  int v9 = 138544386;
  uint8_t v10 = v6;
  __int16 v11 = 1024;
  int v12 = (int)v5;
  __int16 v13 = 2114;
  v14 = v7;
  __int16 v15 = 2114;
  v16 = v8;
  __int16 v17 = 1024;
  unsigned int v18 = [a2 iOSLegacyIdentifier];
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "Found default container (identifier: %{public}@  legacy id = %d) for account (identifier: %{public}@  external identifier: %{public}@ legacy id = %d)", (uint8_t *)&v9, 0x2Cu);
}

void sub_AB90()
{
  sub_9234();
  sub_9208(&dword_0, v0, v1, "error fetching account with external identifier %{public}@ error: %{public}@");
}

void sub_ABF8(void *a1)
{
  uint64_t v2 = [a1 identifier];
  uint64_t v3 = [a1 externalIdentifierString];
  [a1 iOSLegacyIdentifier];
  sub_9314();
  sub_92E0(&dword_0, v4, v5, "Matched CNAccount (identifier: %{public}@ external identifier: %{public}@ legacy id = %d) to account with external identifier %{public}@", v6, v7, v8, v9, v10);
}

void sub_ACC8()
{
  sub_92B4();
  uint64_t v3 = [v2 externalIdentifierString];
  sub_9300();
  uint64_t v6 = v1;
  sub_9264(&dword_0, v0, v4, "error fetching containers for account with external identifier %{public}@ error: %{public}@", v5);
}

void sub_AD60()
{
  sub_92B4();
  [v1 count];
  id v2 = [(id)sub_9328() identifier];
  uint64_t v3 = [v0 externalIdentifierString];
  [v0 iOSLegacyIdentifier];
  sub_929C();
  sub_92E0(&dword_0, v4, v5, "Found %ld containers associated with account (identifier: %{public}@ external identifier: %{public}@ legacy id = %d)", v6, v7, v8, v9, v10);
}

void sub_AE2C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Will continue as though logout is not restricted", v1, 2u);
}

void sub_AE70(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error requesting iCloud logout policy: %@", (uint8_t *)&v2, 0xCu);
}

void sub_AEE8()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement (%d)", (uint8_t *)v1, 8u);
}

uint64_t CNAbstractMethodException()
{
  return _CNAbstractMethodException();
}

uint64_t CNLogicalNot()
{
  return _CNLogicalNot();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_MCIsManaged(void *a1, const char *a2, ...)
{
  return [a1 MCIsManaged];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountProvider(void *a1, const char *a2, ...)
{
  return [a1 accountProvider];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelDueToRestrictions(void *a1, const char *a2, ...)
{
  return [a1 cancelDueToRestrictions];
}

id objc_msgSend_childAccounts(void *a1, const char *a2, ...)
{
  return [a1 childAccounts];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createSyncDataStore(void *a1, const char *a2, ...)
{
  return [a1 createSyncDataStore];
}

id objc_msgSend_createSyncDataStoreDeleteLocalData(void *a1, const char *a2, ...)
{
  return [a1 createSyncDataStoreDeleteLocalData];
}

id objc_msgSend_createSyncDataStoreKeepLocalData(void *a1, const char *a2, ...)
{
  return [a1 createSyncDataStoreKeepLocalData];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_deleteSyncData(void *a1, const char *a2, ...)
{
  return [a1 deleteSyncData];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_emptyLocalContainer(void *a1, const char *a2, ...)
{
  return [a1 emptyLocalContainer];
}

id objc_msgSend_externalIdentifierString(void *a1, const char *a2, ...)
{
  return [a1 externalIdentifierString];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return [a1 first];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_iOSLegacyIdentifier(void *a1, const char *a2, ...)
{
  return [a1 iOSLegacyIdentifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_implementation(void *a1, const char *a2, ...)
{
  return [a1 implementation];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isLocalContainerEmpty(void *a1, const char *a2, ...)
{
  return [a1 isLocalContainerEmpty];
}

id objc_msgSend_isLocalSourceEmpty(void *a1, const char *a2, ...)
{
  return [a1 isLocalSourceEmpty];
}

id objc_msgSend_isiCloudSignoutRestrictionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isiCloudSignoutRestrictionEnabled];
}

id objc_msgSend_localContainer(void *a1, const char *a2, ...)
{
  return [a1 localContainer];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_mergeLocalDataIntoSyncData(void *a1, const char *a2, ...)
{
  return [a1 mergeLocalDataIntoSyncData];
}

id objc_msgSend_mergeSyncDataIntoLocalData(void *a1, const char *a2, ...)
{
  return [a1 mergeSyncDataIntoLocalData];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}