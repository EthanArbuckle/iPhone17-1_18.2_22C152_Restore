id sABSValueToABValueTransform_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t vars8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if (objc_opt_isKindOfClass())
  {
    v3 = [MEMORY[0x263F33590] dateFromDayComponents:v2];
  }

  return v3;
}

id sABValueToABSValueTransform_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  v3 = v2;
  if (objc_opt_isKindOfClass())
  {
    v3 = [MEMORY[0x263F33590] dayComponentsFromDate:v2];
  }

  return v3;
}

Class initCNAssistantConversion()
{
  if (LoadContactsAssistantServices_loadPredicate != -1) {
    dispatch_once(&LoadContactsAssistantServices_loadPredicate, &__block_literal_global_2);
  }
  Class result = objc_getClass("CNAssistantConversion");
  classCNAssistantConversion = (uint64_t)result;
  getCNAssistantConversionClass = (uint64_t (*)())CNAssistantConversionFunction;
  return result;
}

id CNAssistantConversionFunction()
{
  return (id)classCNAssistantConversion;
}

void __LoadContactsAssistantServices_block_invoke()
{
  LoadContactsAssistantServices_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ContactsAssistantServices.framework/ContactsAssistantServices", 1);
  if (!LoadContactsAssistantServices_frameworkLibrary && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __LoadContactsAssistantServices_block_invoke_cold_1();
  }
}

void sub_214A0B78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_214A0B95C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A0BAD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214A0BC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t ABSIsLogEnabled(uint64_t a1)
{
  v1 = [NSString stringWithFormat:@"ABS%@LogEnabled", a1];
  id v2 = [MEMORY[0x263F33698] standardPreferences];
  uint64_t v3 = [v2 userHasOptedInToPreference:v1];

  return v3;
}

uint64_t ABSIsAPILogEnabled()
{
  if (ABSIsAPILogEnabled_onceToken != -1) {
    dispatch_once(&ABSIsAPILogEnabled_onceToken, &__block_literal_global_4);
  }
  return ABSIsAPILogEnabled_result;
}

uint64_t __ABSIsAPILogEnabled_block_invoke()
{
  uint64_t result = ABSIsLogEnabled(@"API");
  ABSIsAPILogEnabled_uint64_t result = result;
  return result;
}

uint64_t ABSRecordGetTypeID()
{
  if (gABRegisteredWithCF != -1) {
    dispatch_once(&gABRegisteredWithCF, &__block_literal_global_5);
  }
  return kABCRecordTypeID;
}

uint64_t __ABSRecordGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kABCRecordTypeID = result;
  return result;
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  uint64_t v2 = *(void *)&property;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if ([MEMORY[0x263F08B88] isMainThread]) {
        v5 = "YES";
      }
      else {
        v5 = "NO";
      }
      v6 = +[ABSPerson nameForProperty:v2];
      int v10 = 136315650;
      v11 = v5;
      __int16 v12 = 2080;
      v13 = "CFTypeRef ABRecordCopyValue(ABRecordRef, ABPropertyID)";
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  v7 = (const void *)[(id)record copyValueForProperty:v2];
  if (ABSIsAPILogEnabled())
  {
    v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "CFTypeRef ABRecordCopyValue(ABRecordRef, ABPropertyID)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

BOOL ABRecordSetValue(ABRecordRef record, ABPropertyID property, CFTypeRef value, CFErrorRef *error)
{
  uint64_t v6 = *(void *)&property;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [MEMORY[0x263F08B88] isMainThread];
      int v10 = "NO";
      if (v9) {
        int v10 = "YES";
      }
      int v14 = 136315650;
      v15 = v10;
      __int16 v16 = 2080;
      v17 = "_Bool ABRecordSetValue(ABRecordRef, ABPropertyID, CFTypeRef, CFErrorRef *)";
      __int16 v18 = 2112;
      v19 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v14, 0x20u);
    }
  }
  char v11 = [(id)record setValue:value forProperty:v6 withError:error];
  if (ABSIsAPILogEnabled())
  {
    __int16 v12 = +[ABSLog apiLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      v15 = "_Bool ABRecordSetValue(ABRecordRef, ABPropertyID, CFTypeRef, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

BOOL ABRecordRemoveValue(ABRecordRef record, ABPropertyID property, CFErrorRef *error)
{
  uint64_t v4 = *(void *)&property;
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      v8 = "NO";
      if (v7) {
        v8 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      __int16 v16 = v8;
      __int16 v17 = 2080;
      __int16 v18 = "_Bool ABRecordRemoveValue(ABRecordRef, ABPropertyID, CFErrorRef *)";
      __int16 v19 = 2112;
      uint64_t v20 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  id v14 = 0;
  char v9 = [(id)record removeProperty:v4 withError:&v14];
  id v10 = v14;
  char v11 = v10;
  if (error && (v9 & 1) == 0) {
    *error = (CFErrorRef)v10;
  }
  if (ABSIsAPILogEnabled())
  {
    __int16 v12 = +[ABSLog apiLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v16 = "_Bool ABRecordRemoveValue(ABRecordRef, ABPropertyID, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v9;
}

CFStringRef ABRecordCopyCompositeName(ABRecordRef record)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v9 = 136315650;
      id v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = "CFStringRef ABRecordCopyCompositeName(ABRecordRef)";
      __int16 v13 = 2112;
      id v14 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
  v5 = [(id)record compositeName];
  CFStringRef v6 = (const __CFString *)[v5 copy];

  if (ABSIsAPILogEnabled())
  {
    int v7 = +[ABSLog apiLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "CFStringRef ABRecordCopyCompositeName(ABRecordRef)";
      _os_log_impl(&dword_214A03000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

ABRecordRef ABGroupCreate(void)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    v0 = +[ABSLog apiLog];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      int v1 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v2 = "NO";
      if (v1) {
        uint64_t v2 = "YES";
      }
      int v6 = 136315650;
      int v7 = v2;
      __int16 v8 = 2080;
      int v9 = "ABRecordRef ABGroupCreate(void)";
      __int16 v10 = 2112;
      __int16 v11 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }
  }
  ABSRecordGetTypeID();
  int v3 = objc_alloc_init(ABSGroup);
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      int v7 = "ABRecordRef ABGroupCreate(void)";
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

ABRecordRef ABGroupCreateInSource(ABRecordRef source)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v8 = 136315650;
      int v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "ABRecordRef ABGroupCreateInSource(ABRecordRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  v5 = [[ABSGroup alloc] initWithSource:source];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "ABRecordRef ABGroupCreateInSource(ABRecordRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

ABRecordRef ABGroupCopySource(ABRecordRef group)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v8 = 136315650;
      int v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "ABRecordRef ABGroupCopySource(ABRecordRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  v5 = [(id)group source];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "ABRecordRef ABGroupCopySource(ABRecordRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

CFArrayRef ABGroupCopyArrayOfAllMembers(ABRecordRef group)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v9 = 136315650;
      __int16 v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = "CFArrayRef ABGroupCopyArrayOfAllMembers(ABRecordRef)";
      __int16 v13 = 2112;
      uint64_t v14 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
  v5 = [(id)group addressBook];
  CFArrayRef v6 = [v5 peopleInGroup:group sortOrder:0xFFFFFFFFLL];
  if (ABSIsAPILogEnabled())
  {
    int v7 = +[ABSLog apiLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      __int16 v10 = "CFArrayRef ABGroupCopyArrayOfAllMembers(ABRecordRef)";
      _os_log_impl(&dword_214A03000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

CFArrayRef ABGroupCopyArrayOfAllMembersWithSortOrdering(ABRecordRef group, ABPersonSortOrdering sortOrdering)
{
  uint64_t v2 = *(void *)&sortOrdering;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v11 = 136315650;
      __int16 v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = "CFArrayRef ABGroupCopyArrayOfAllMembersWithSortOrdering(ABRecordRef, ABPersonSortOrdering)";
      __int16 v15 = 2112;
      __int16 v16 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v11, 0x20u);
    }
  }
  int v7 = [(id)group addressBook];
  CFArrayRef v8 = [v7 peopleInGroup:group sortOrder:v2];
  if (ABSIsAPILogEnabled())
  {
    int v9 = +[ABSLog apiLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      __int16 v12 = "CFArrayRef ABGroupCopyArrayOfAllMembersWithSortOrdering(ABRecordRef, ABPersonSortOrdering)";
      _os_log_impl(&dword_214A03000, v9, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v11, 0xCu);
    }
  }
  return v8;
}

BOOL ABGroupAddMember(ABRecordRef group, ABRecordRef person, CFErrorRef *error)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v8 = "NO";
      if (v7) {
        CFArrayRef v8 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = v8;
      __int16 v18 = 2080;
      __int16 v19 = "_Bool ABGroupAddMember(ABRecordRef, ABRecordRef, CFErrorRef *)";
      __int16 v20 = 2112;
      uint64_t v21 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  int v9 = [(id)group addressBook];
  id v15 = 0;
  char v10 = [v9 addMember:person toGroup:group error:&v15];
  id v11 = v15;
  __int16 v12 = v11;
  if ((v10 & 1) == 0 && error && v11) {
    *error = (CFErrorRef)v11;
  }
  if (ABSIsAPILogEnabled())
  {
    __int16 v13 = +[ABSLog apiLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "_Bool ABGroupAddMember(ABRecordRef, ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v13, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v10;
}

BOOL ABGroupRemoveMember(ABRecordRef group, ABRecordRef member, CFErrorRef *error)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v8 = "NO";
      if (v7) {
        CFArrayRef v8 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = v8;
      __int16 v18 = 2080;
      __int16 v19 = "_Bool ABGroupRemoveMember(ABRecordRef, ABRecordRef, CFErrorRef *)";
      __int16 v20 = 2112;
      uint64_t v21 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  int v9 = [(id)group addressBook];
  id v15 = 0;
  char v10 = [v9 removeMember:member fromGroup:group error:&v15];
  id v11 = v15;
  __int16 v12 = v11;
  if ((v10 & 1) == 0 && error && v11) {
    *error = (CFErrorRef)v11;
  }
  if (ABSIsAPILogEnabled())
  {
    __int16 v13 = +[ABSLog apiLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "_Bool ABGroupRemoveMember(ABRecordRef, ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v13, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v10;
}

ABRecordRef ABAddressBookGetGroupWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  uint64_t v2 = *(void *)&recordID;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v10 = 136315650;
      id v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "ABRecordRef ABAddressBookGetGroupWithRecordID(ABAddressBookRef, ABRecordID)";
      __int16 v14 = 2112;
      id v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  int v7 = (const void *)[(id)addressBook groupWithRecordID:v2];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "ABRecordRef ABAddressBookGetGroupWithRecordID(ABAddressBookRef, ABRecordID)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

CFIndex ABAddressBookGetGroupCount(ABAddressBookRef addressBook)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v8 = 136315650;
      int v9 = v4;
      __int16 v10 = 2080;
      id v11 = "CFIndex ABAddressBookGetGroupCount(ABAddressBookRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  CFIndex v5 = [(id)addressBook groupCount];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "CFIndex ABAddressBookGetGroupCount(ABAddressBookRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

CFArrayRef ABAddressBookCopyArrayOfAllGroups(ABAddressBookRef addressBook)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v9 = 136315650;
      __int16 v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = "CFArrayRef ABAddressBookCopyArrayOfAllGroups(ABAddressBookRef)";
      __int16 v13 = 2112;
      uint64_t v14 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
  CFIndex v5 = [(id)addressBook allGroups];
  CFArrayRef v6 = (const __CFArray *)[v5 copy];

  if (ABSIsAPILogEnabled())
  {
    int v7 = +[ABSLog apiLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      __int16 v10 = "CFArrayRef ABAddressBookCopyArrayOfAllGroups(ABAddressBookRef)";
      _os_log_impl(&dword_214A03000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

CFArrayRef ABAddressBookCopyArrayOfAllGroupsInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "CFArrayRef ABAddressBookCopyArrayOfAllGroupsInSource(ABAddressBookRef, ABRecordRef)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  CFArrayRef v7 = [(id)addressBook groupsInSource:source];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "CFArrayRef ABAddressBookCopyArrayOfAllGroupsInSource(ABAddressBookRef, ABRecordRef)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

uint64_t ABSAddressBookGetTypeID()
{
  if (gABRegisteredWithCF_0 != -1) {
    dispatch_once(&gABRegisteredWithCF_0, &__block_literal_global_6);
  }
  return kABCAddressBookTypeID;
}

uint64_t __ABSAddressBookGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kABCAddressBookTypeID = result;
  return result;
}

ABAuthorizationStatus ABAddressBookGetAuthorizationStatus(void)
{
  return +[ABSAddressBook authorizationStatus];
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      __int16 v18 = "ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef, CFErrorRef *)";
      __int16 v19 = 2112;
      __int16 v20 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  if (gABRegisteredWithCF_0 != -1) {
    dispatch_once(&gABRegisteredWithCF_0, &__block_literal_global_6);
  }
  id v14 = 0;
  CFArrayRef v7 = [[ABSAddressBook alloc] initWithOptions:options error:&v14];
  id v8 = v14;
  int v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = error == 0;
  }
  if (!v10 && v8 != 0) {
    *error = (CFErrorRef)v8;
  }
  if (ABSIsAPILogEnabled())
  {
    __int16 v12 = +[ABSLog apiLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v7;
}

ABSAddressBook *ABAddressBookCreateWithOptionsAndPolicy(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      id v8 = "NO";
      if (v7) {
        id v8 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      __int16 v18 = "ABAddressBookRef ABAddressBookCreateWithOptionsAndPolicy(CFDictionaryRef, ABCreatePolicy, CFErrorRef *)";
      __int16 v19 = 2112;
      __int16 v20 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  if (gABRegisteredWithCF_0 != -1) {
    dispatch_once(&gABRegisteredWithCF_0, &__block_literal_global_6);
  }
  id v14 = 0;
  int v9 = [[ABSAddressBook alloc] initWithOptions:a1 policy:a2 error:&v14];
  id v10 = v14;
  __int16 v11 = v10;
  if (a3 && !v9) {
    *a3 = v10;
  }
  if (ABSIsAPILogEnabled())
  {
    __int16 v12 = +[ABSLog apiLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "ABAddressBookRef ABAddressBookCreateWithOptionsAndPolicy(CFDictionaryRef, ABCreatePolicy, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v9;
}

ABAddressBookRef ABAddressBookCreate(void)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    v0 = +[ABSLog apiLog];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      int v1 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v2 = "NO";
      if (v1) {
        uint64_t v2 = "YES";
      }
      int v6 = 136315650;
      int v7 = v2;
      __int16 v8 = 2080;
      int v9 = "ABAddressBookRef ABAddressBookCreate(void)";
      __int16 v10 = 2112;
      __int16 v11 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }
  }
  if (gABRegisteredWithCF_0 != -1) {
    dispatch_once(&gABRegisteredWithCF_0, &__block_literal_global_6);
  }
  int v3 = objc_alloc_init(ABSAddressBook);
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      int v7 = "ABAddressBookRef ABAddressBookCreate(void)";
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

void ABAddressBookRequestAccessWithCompletion(ABAddressBookRef addressBook, ABAddressBookRequestAccessCompletionHandler completion)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  ABAddressBookRequestAccessCompletionHandler v2 = completion;
  if (ABSIsAPILogEnabled())
  {
    int v3 = +[ABSLog apiLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [MEMORY[0x263F08B88] isMainThread];
      int v5 = "NO";
      if (v4) {
        int v5 = "YES";
      }
      int v7 = 136315650;
      __int16 v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "void ABAddressBookRequestAccessWithCompletion(ABAddressBookRef, __strong ABAddressBookRequestAccessCompletionHandler)";
      __int16 v11 = 2112;
      uint64_t v12 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v3, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v7, 0x20u);
    }
  }
  +[ABSAddressBook requestAccessWithCompletion:v2];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      __int16 v8 = "void ABAddressBookRequestAccessWithCompletion(ABAddressBookRef, __strong ABAddressBookRequestAccessCompletionHandler)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v7, 0xCu);
    }
  }
}

BOOL ABAddressBookSave(ABAddressBookRef addressBook, CFErrorRef *error)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    int v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      int v6 = "NO";
      if (v5) {
        int v6 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      __int16 v18 = "_Bool ABAddressBookSave(ABAddressBookRef, CFErrorRef *)";
      __int16 v19 = 2112;
      __int16 v20 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  int v7 = +[ABSLog log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    ABAddressBookSave_cold_2(v7);
  }

  id v14 = 0;
  char v8 = [(id)addressBook save:&v14];
  id v9 = v14;
  __int16 v10 = v9;
  if ((v8 & 1) == 0 && error && v9) {
    *error = (CFErrorRef)v9;
  }
  __int16 v11 = +[ABSLog log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    ABAddressBookSave_cold_1(v8, v11);
  }

  if (ABSIsAPILogEnabled())
  {
    uint64_t v12 = +[ABSLog apiLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "_Bool ABAddressBookSave(ABAddressBookRef, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v8;
}

BOOL ABAddressBookAddRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      char v8 = "NO";
      if (v7) {
        char v8 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      __int16 v18 = "_Bool ABAddressBookAddRecord(ABAddressBookRef, ABRecordRef, CFErrorRef *)";
      __int16 v19 = 2112;
      __int16 v20 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  id v14 = 0;
  char v9 = [(id)addressBook addRecord:record error:&v14];
  id v10 = v14;
  __int16 v11 = v10;
  if (error && (v9 & 1) == 0) {
    *error = (CFErrorRef)v10;
  }
  if (ABSIsAPILogEnabled())
  {
    uint64_t v12 = +[ABSLog apiLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "_Bool ABAddressBookAddRecord(ABAddressBookRef, ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v9;
}

BOOL ABAddressBookRemoveRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      char v8 = "NO";
      if (v7) {
        char v8 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      __int16 v18 = "_Bool ABAddressBookRemoveRecord(ABAddressBookRef, ABRecordRef, CFErrorRef *)";
      __int16 v19 = 2112;
      __int16 v20 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  id v14 = 0;
  char v9 = [(id)addressBook removeRecord:record error:&v14];
  id v10 = v14;
  __int16 v11 = v10;
  if (error && (v9 & 1) == 0) {
    *error = (CFErrorRef)v10;
  }
  if (ABSIsAPILogEnabled())
  {
    uint64_t v12 = +[ABSLog apiLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "_Bool ABAddressBookRemoveRecord(ABAddressBookRef, ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v9;
}

CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef label)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    ABAddressBookRequestAccessCompletionHandler v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      int v4 = "NO";
      if (v3) {
        int v4 = "YES";
      }
      int v8 = 136315650;
      char v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef)";
      __int16 v12 = 2112;
      uint64_t v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  CFStringRef v5 = +[ABSAddressBook localizedLabelForLabel:label];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      char v9 = "CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      int v8 = "NO";
      if (v7) {
        int v8 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v8;
      __int16 v12 = 2080;
      uint64_t v13 = "void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef, ABExternalChangeCallback, void *)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  [(id)addressBook registerExternalChangeCallback:callback context:context];
  if (ABSIsAPILogEnabled())
  {
    char v9 = +[ABSLog apiLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef, ABExternalChangeCallback, void *)";
      _os_log_impl(&dword_214A03000, v9, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
}

void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      int v8 = "NO";
      if (v7) {
        int v8 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v8;
      __int16 v12 = 2080;
      uint64_t v13 = "void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef, ABExternalChangeCallback, void *)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  [(id)addressBook unregisterExternalChangeCallback:callback context:context];
  if (ABSIsAPILogEnabled())
  {
    char v9 = +[ABSLog apiLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef, ABExternalChangeCallback, void *)";
      _os_log_impl(&dword_214A03000, v9, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    ABAddressBookRequestAccessCompletionHandler v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      int v4 = "NO";
      if (v3) {
        int v4 = "YES";
      }
      int v6 = 136315650;
      int v7 = v4;
      __int16 v8 = 2080;
      char v9 = "void ABAddressBookRevert(ABAddressBookRef)";
      __int16 v10 = 2112;
      __int16 v11 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }
  }
  [(id)addressBook revert];
  if (ABSIsAPILogEnabled())
  {
    CFStringRef v5 = +[ABSLog apiLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      int v7 = "void ABAddressBookRevert(ABAddressBookRef)";
      _os_log_impl(&dword_214A03000, v5, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t ABAddressBookCopyMe(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t ABAddressBookCopyUniqueIdentifier(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

BOOL ABAddressBookForceNullDatabaseForAccessDeniedIsEnabled()
{
  return CFPreferencesGetAppBooleanValue(@"ABForceNullDatabaseForAccessDenied", @".GlobalPreferences", 0) != 0;
}

uint64_t ABAddressBookForceNullDatabaseForAccessDeniedSetEnabled(CFPropertyListRef value)
{
  CFPreferencesSetAppValue(@"ABForceNullDatabaseForAccessDenied", value, @".GlobalPreferences");
  CFStringRef v1 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE50];

  return CFPreferencesSynchronize(@".GlobalPreferences", v1, v2);
}

uint64_t ABInitialize()
{
  return +[ABSAddressBook ABInitialize];
}

BOOL ABValidateAlternateBirthday(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"calendarIdentifier"];
  if (v2)
  {
    int v3 = (void *)v2;
    uint64_t v4 = [v1 objectForKeyedSubscript:@"month"];
    if (!v4)
    {
      int v10 = 0;
LABEL_20:

      goto LABEL_21;
    }
    CFStringRef v5 = (void *)v4;
    int v6 = [v1 objectForKeyedSubscript:@"day"];

    if (v6)
    {
      int v7 = [v1 objectForKeyedSubscript:@"calendarIdentifier"];
      __int16 v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F0]) initWithCalendarIdentifier:v7];

      if (v8)
      {

        goto LABEL_10;
      }
      __int16 v11 = [v7 lowercaseString];

      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F0]) initWithCalendarIdentifier:v11];
      if (v12)
      {
LABEL_10:
        uint64_t v13 = (void *)MEMORY[0x263EFF8F0];
        __int16 v14 = [v1 objectForKeyedSubscript:@"calendarIdentifier"];
        int v3 = [v13 calendarWithIdentifier:v14];

        if (v3)
        {
          id v15 = objc_alloc_init(MEMORY[0x263EFF918]);
          [v15 setCalendar:v3];
          uint64_t v16 = [v1 objectForKeyedSubscript:@"month"];
          objc_msgSend(v15, "setMonth:", objc_msgSend(v16, "integerValue"));

          __int16 v17 = [v1 objectForKeyedSubscript:@"day"];
          objc_msgSend(v15, "setDay:", objc_msgSend(v17, "integerValue"));

          __int16 v18 = [v1 objectForKeyedSubscript:@"isLeapMonth"];

          if (v18)
          {
            __int16 v19 = [v1 objectForKeyedSubscript:@"isLeapMonth"];
            objc_msgSend(v15, "setLeapMonth:", objc_msgSend(v19, "BOOLValue"));
          }
          __int16 v20 = [v1 objectForKeyedSubscript:@"era"];

          if (v20)
          {
            uint64_t v21 = [v1 objectForKeyedSubscript:@"era"];
            objc_msgSend(v15, "setEra:", objc_msgSend(v21, "integerValue"));
          }
          uint64_t v22 = [v1 objectForKeyedSubscript:@"year"];

          if (v22)
          {
            v23 = [v1 objectForKeyedSubscript:@"year"];
            objc_msgSend(v15, "setYear:", objc_msgSend(v23, "integerValue"));
          }
          int v10 = [v15 isValidDate];
        }
        else
        {
          int v10 = 1;
        }
        goto LABEL_20;
      }
    }
  }
  int v10 = 0;
LABEL_21:

  return v10 != 0;
}

uint64_t __CNGuardOSLog_block_invoke()
{
  CNGuardOSLog_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts", "api");

  return MEMORY[0x270F9A758]();
}

uint64_t ABSPeoplePickerPrefs()
{
  uint64_t result = ABSPeoplePickerPrefs__peoplePickerPrefs;
  if (!ABSPeoplePickerPrefs__peoplePickerPrefs)
  {
    if (ABSPeoplePickerPrefs___once_peoplePickerPrefs != -1) {
      dispatch_once(&ABSPeoplePickerPrefs___once_peoplePickerPrefs, &__block_literal_global_10);
    }
    return ABSPeoplePickerPrefs__peoplePickerPrefs;
  }
  return result;
}

uint64_t __ABSPeoplePickerPrefs_block_invoke()
{
  uint64_t result = CPCopySharedResourcesPreferencesDomainForDomain();
  ABSPeoplePickerPrefs__peoplePickerPrefs = result;
  return result;
}

void sub_214A13E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214A178D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t ABSMultiValueGetTypeID()
{
  if (gABMultiValueRegisteredWithCF != -1) {
    dispatch_once(&gABMultiValueRegisteredWithCF, &__block_literal_global_12);
  }
  return kABCMultiValueTypeID;
}

uint64_t __ABSMultiValueGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kABCMultiValueTypeID = result;
  return result;
}

ABPropertyType ABMultiValueGetPropertyType(ABMultiValueRef multiValue)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v8 = 136315650;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "ABPropertyType ABMultiValueGetPropertyType(ABMultiValueRef)";
      __int16 v12 = 2112;
      uint64_t v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  ABPropertyType v5 = [(id)multiValue propertyType];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "ABPropertyType ABMultiValueGetPropertyType(ABMultiValueRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v9 = 136315650;
      __int16 v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = "CFIndex ABMultiValueGetCount(ABMultiValueRef)";
      __int16 v13 = 2112;
      uint64_t v14 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
  ABPropertyType v5 = [(id)multiValue values];
  CFIndex v6 = [v5 count];

  if (ABSIsAPILogEnabled())
  {
    int v7 = +[ABSLog apiLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      __int16 v10 = "CFIndex ABMultiValueGetCount(ABMultiValueRef)";
      _os_log_impl(&dword_214A03000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFIndex v6 = "NO";
      if (v5) {
        CFIndex v6 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef, CFIndex)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  int v7 = (const void *)[(id)multiValue copyValueAtIndex:index];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef, CFIndex)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

CFArrayRef ABMultiValueCopyArrayOfAllValues(ABMultiValueRef multiValue)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v9 = 136315650;
      int v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = "CFArrayRef ABMultiValueCopyArrayOfAllValues(ABMultiValueRef)";
      __int16 v13 = 2112;
      __int16 v14 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
  int v5 = [(id)multiValue allValues];
  if ([v5 count]) {
    CFArrayRef v6 = (const __CFArray *)[v5 copy];
  }
  else {
    CFArrayRef v6 = 0;
  }
  if (ABSIsAPILogEnabled())
  {
    int v7 = +[ABSLog apiLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "CFArrayRef ABMultiValueCopyArrayOfAllValues(ABMultiValueRef)";
      _os_log_impl(&dword_214A03000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef, CFIndex)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  CFStringRef v7 = [(id)multiValue labelAtIndex:index];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef, CFIndex)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef multiValue, ABMultiValueIdentifier identifier)
{
  uint64_t v2 = *(void *)&identifier;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef, ABMultiValueIdentifier)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  CFIndex v7 = [(id)multiValue indexForIdentifier:v2];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef, ABMultiValueIdentifier)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  else {
    return v7;
  }
}

ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef, CFIndex)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  ABMultiValueIdentifier v7 = [(id)multiValue identifierAtIndex:index];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef, CFIndex)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

CFIndex ABMultiValueGetFirstIndexOfValue(ABMultiValueRef multiValue, CFTypeRef value)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "CFIndex ABMultiValueGetFirstIndexOfValue(ABMultiValueRef, CFTypeRef)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  CFIndex v7 = [(id)multiValue indexOfValue:value];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "CFIndex ABMultiValueGetFirstIndexOfValue(ABMultiValueRef, CFTypeRef)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  else {
    return v7;
  }
}

ABMutableMultiValueRef ABMultiValueCreateMutable(ABPropertyType type)
{
  uint64_t v1 = *(void *)&type;
  if (gABMultiValueRegisteredWithCF != -1) {
    dispatch_once(&gABMultiValueRegisteredWithCF, &__block_literal_global_12);
  }
  uint64_t v2 = [ABSMultiValue alloc];

  return [(ABSMultiValue *)v2 initWithPropertyType:v1 mutable:1 values:0];
}

ABMutableMultiValueRef ABMultiValueCreateMutableCopy(ABMultiValueRef multiValue)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v8 = 136315650;
      int v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "ABMutableMultiValueRef ABMultiValueCreateMutableCopy(ABMultiValueRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  if (gABMultiValueRegisteredWithCF != -1) {
    dispatch_once(&gABMultiValueRegisteredWithCF, &__block_literal_global_12);
  }
  int v5 = (const void *)[(id)multiValue mutableCopy];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "ABMutableMultiValueRef ABMultiValueCreateMutableCopy(ABMultiValueRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

BOOL ABMultiValueAddValueAndLabel(ABMutableMultiValueRef multiValue, CFTypeRef value, CFStringRef label, ABMultiValueIdentifier *outIdentifier)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [MEMORY[0x263F08B88] isMainThread];
      __int16 v10 = "NO";
      if (v9) {
        __int16 v10 = "YES";
      }
      int v14 = 136315650;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      __int16 v17 = "_Bool ABMultiValueAddValueAndLabel(ABMutableMultiValueRef, CFTypeRef, CFStringRef, ABMultiValueIdentifier *)";
      __int16 v18 = 2112;
      __int16 v19 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v14, 0x20u);
    }
  }
  char v11 = [(id)multiValue addValue:value label:label outIdentifier:outIdentifier];
  if (ABSIsAPILogEnabled())
  {
    __int16 v12 = +[ABSLog apiLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      uint64_t v15 = "_Bool ABMultiValueAddValueAndLabel(ABMutableMultiValueRef, CFTypeRef, CFStringRef, ABMultiValueIdentifier *)";
      _os_log_impl(&dword_214A03000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

BOOL ABMultiValueInsertValueAndLabelAtIndex(ABMutableMultiValueRef multiValue, CFTypeRef value, CFStringRef label, CFIndex index, ABMultiValueIdentifier *outIdentifier)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    __int16 v10 = +[ABSLog apiLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [MEMORY[0x263F08B88] isMainThread];
      __int16 v12 = "NO";
      if (v11) {
        __int16 v12 = "YES";
      }
      int v16 = 136315650;
      __int16 v17 = v12;
      __int16 v18 = 2080;
      __int16 v19 = "_Bool ABMultiValueInsertValueAndLabelAtIndex(ABMutableMultiValueRef, CFTypeRef, CFStringRef, CFIndex, ABMult"
            "iValueIdentifier *)";
      __int16 v20 = 2112;
      uint64_t v21 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v10, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v16, 0x20u);
    }
  }
  char v13 = [(id)multiValue insertValue:value label:label atIndex:index outIdentifier:outIdentifier];
  if (ABSIsAPILogEnabled())
  {
    int v14 = +[ABSLog apiLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      __int16 v17 = "_Bool ABMultiValueInsertValueAndLabelAtIndex(ABMutableMultiValueRef, CFTypeRef, CFStringRef, CFIndex, ABMult"
            "iValueIdentifier *)";
      _os_log_impl(&dword_214A03000, v14, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v16, 0xCu);
    }
  }
  return v13;
}

BOOL ABMultiValueRemoveValueAndLabelAtIndex(ABMutableMultiValueRef multiValue, CFIndex index)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v10 = 136315650;
      int v11 = v6;
      __int16 v12 = 2080;
      char v13 = "_Bool ABMultiValueRemoveValueAndLabelAtIndex(ABMutableMultiValueRef, CFIndex)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  char v7 = [(id)multiValue removeValueAtIndex:index];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "_Bool ABMultiValueRemoveValueAndLabelAtIndex(ABMutableMultiValueRef, CFIndex)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

BOOL ABMultiValueReplaceValueAtIndex(ABMutableMultiValueRef multiValue, CFTypeRef value, CFIndex index)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      int v8 = "NO";
      if (v7) {
        int v8 = "YES";
      }
      int v12 = 136315650;
      char v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = "_Bool ABMultiValueReplaceValueAtIndex(ABMutableMultiValueRef, CFTypeRef, CFIndex)";
      __int16 v16 = 2112;
      __int16 v17 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v12, 0x20u);
    }
  }
  char v9 = [(id)multiValue replaceValue:value atIndex:index];
  if (ABSIsAPILogEnabled())
  {
    int v10 = +[ABSLog apiLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      char v13 = "_Bool ABMultiValueReplaceValueAtIndex(ABMutableMultiValueRef, CFTypeRef, CFIndex)";
      _os_log_impl(&dword_214A03000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v12, 0xCu);
    }
  }
  return v9;
}

BOOL ABMultiValueReplaceLabelAtIndex(ABMutableMultiValueRef multiValue, CFStringRef label, CFIndex index)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      int v8 = "NO";
      if (v7) {
        int v8 = "YES";
      }
      int v12 = 136315650;
      char v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = "_Bool ABMultiValueReplaceLabelAtIndex(ABMutableMultiValueRef, CFStringRef, CFIndex)";
      __int16 v16 = 2112;
      __int16 v17 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v12, 0x20u);
    }
  }
  char v9 = [(id)multiValue replaceLabel:label atIndex:index];
  if (ABSIsAPILogEnabled())
  {
    int v10 = +[ABSLog apiLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      char v13 = "_Bool ABMultiValueReplaceLabelAtIndex(ABMutableMultiValueRef, CFStringRef, CFIndex)";
      _os_log_impl(&dword_214A03000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v12, 0xCu);
    }
  }
  return v9;
}

CGImageRef ABImageUtilsCreateImageFromData(const __CFData *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = CGImageSourceCreateWithData(a1, 0);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  if (CGImageSourceGetCount(v1))
  {
    pthread_once(&__thumbnailPropertiesOnce, (void (*)(void))__initializeThumbnailProperties);
    CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v2, 0, (CFDictionaryRef)__thumbnailProperties);
  }
  else
  {
    CGImageRef ThumbnailAtIndex = 0;
  }
  CFRelease(v2);
  return ThumbnailAtIndex;
}

CFDataRef ABImageUtilsCopyImageSourceAndGetSizeFromData(const __CFData *result, CGImageSource **a2, int *a3, int *a4)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (result)
  {
    int v7 = CGImageSourceCreateWithData(result, 0);
    if (v7)
    {
      int v8 = v7;
      CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
      if (v9)
      {
        CFDictionaryRef v10 = v9;
        int valuePtr = 0;
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x263F0F4C8]);
        if (Value)
        {
          CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
          BOOL v12 = valuePtr > 4;
        }
        else
        {
          BOOL v12 = 0;
        }
        CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F0F4F8]);
        if (v14 && CFNumberGetValue(v14, kCFNumberIntType, &valuePtr))
        {
          if (v12)
          {
            if (a4) {
              *a4 = valuePtr;
            }
          }
          else if (a3)
          {
            *a3 = valuePtr;
          }
        }
        CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F0F4F0]);
        if (v15 && CFNumberGetValue(v15, kCFNumberIntType, &valuePtr))
        {
          if (v12)
          {
            if (a3) {
              *a3 = valuePtr;
            }
          }
          else if (a4)
          {
            *a4 = valuePtr;
          }
        }
        CFRelease(v10);
        if (a2)
        {
          *a2 = v8;
          int v13 = 1;
          return (const __CFData *)(v13 != 0);
        }
        int v13 = 1;
      }
      else
      {
        int v13 = 0;
      }
      CFRelease(v8);
      return (const __CFData *)(v13 != 0);
    }
    int v13 = 0;
    return (const __CFData *)(v13 != 0);
  }
  return result;
}

double ABImageUtilsCenteredSquareForRect(double result, double a2, double a3, double a4)
{
  if (a3 > a4) {
    return result + (a3 - a4) * 0.5;
  }
  return result;
}

double ABImageUtilsCenteredOverflowRectWithFullScreenRatioForRectWithAvailableSize(double result, double a2, double a3, double a4, double a5, double a6)
{
  if (a3 / a4 >= 0.666666667)
  {
    if (ceil(a3 / 0.666666667) > a6) {
      return floor(result + (a3 - a6 * 0.666666667) * 0.5);
    }
  }
  else
  {
    double v7 = ceil(a4 * 0.666666667);
    if (v7 <= a5)
    {
      double v8 = floor(result + (v7 - a3) * -0.5);
      uint64_t result = 0.0;
      if (v8 > 0.0)
      {
        double v9 = v7 + v8 - a5;
        double v10 = floor(v8 - v9);
        if (v9 <= 0.0) {
          return v8;
        }
        else {
          return v10;
        }
      }
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

CGImageRef ABImageUtilsCreateImageFromImageWithCropRect(CGImage *a1, double a2, double a3, double a4, double a5)
{
  if (!a1) {
    return 0;
  }
  CGRect v30 = CGRectStandardize(*(CGRect *)&a2);
  CGRect v31 = CGRectIntegral(v30);
  DeviceRGB = 0;
  if (v31.size.width <= 0.0) {
    return DeviceRGB;
  }
  double height = v31.size.height;
  if (v31.size.height <= 0.0) {
    return DeviceRGB;
  }
  double x = v31.origin.x;
  double y = v31.origin.y;
  double width = v31.size.width;
  double v11 = (double)CGImageGetWidth(a1);
  double v12 = (double)CGImageGetHeight(a1);
  v32.origin.double x = 0.0;
  v32.origin.double y = 0.0;
  v32.size.double width = v11;
  v32.size.double height = v12;
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  CGRect v33 = CGRectIntersection(v32, v43);
  CGRect v34 = CGRectStandardize(v33);
  if (v34.size.width < width || v34.size.height < height)
  {
    DeviceRGB = 0;
    if (v34.size.width < 0.0) {
      return DeviceRGB;
    }
    if (v34.size.height < 0.0) {
      return DeviceRGB;
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if (!DeviceRGB) {
      return DeviceRGB;
    }
    CFNumberRef v14 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, vcvtd_n_u64_f64(width, 2uLL), DeviceRGB, 0x2006u);
    CGColorSpaceRelease(DeviceRGB);
    if (v14)
    {
      CGContextSetFillColor(v14, ABImageUtilsCreateImageFromImageWithCropRect_black);
      v35.origin.double x = 0.0;
      v35.origin.double y = 0.0;
      v35.size.double width = width;
      v35.size.double height = height;
      CGContextFillRect(v14, v35);
      v36.origin.double x = x;
      v36.origin.double y = y;
      v36.size.double width = width;
      v36.size.double height = height;
      CGImageRef v15 = CGImageCreateWithImageInRect(a1, v36);
      if (v15)
      {
        __int16 v16 = v15;
        v44.origin.double x = -x;
        v44.origin.double y = -y;
        v37.origin.double x = 0.0;
        v37.origin.double y = 0.0;
        v37.size.double width = width;
        v37.size.double height = height;
        v44.size.double width = v11;
        v44.size.double height = v12;
        CGRect v38 = CGRectIntersection(v37, v44);
        CGFloat v17 = v38.origin.x;
        CGFloat v18 = v38.origin.y;
        CGFloat v19 = v38.size.width;
        CGFloat v20 = v38.size.height;
        memset(&v28, 0, sizeof(v28));
        CGAffineTransformMakeScale(&v28, 1.0, -1.0);
        memset(&v27, 0, sizeof(v27));
        CGAffineTransformMakeTranslation(&v27, 0.0, height);
        CGAffineTransform v26 = v28;
        v39.origin.double x = v17;
        v39.origin.double y = v18;
        v39.size.double width = v19;
        v39.size.double height = v20;
        CGRect v40 = CGRectApplyAffineTransform(v39, &v26);
        CGAffineTransform v26 = v27;
        CGRect v41 = CGRectApplyAffineTransform(v40, &v26);
        CGRect v42 = CGRectStandardize(v41);
        CGContextDrawImage(v14, v42, v16);
        DeviceRGB = CGBitmapContextCreateImage(v14);
        CGImageRelease(v16);
      }
      else
      {
        DeviceRGB = 0;
      }
      CFRelease(v14);
      return DeviceRGB;
    }
    return 0;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;

  return CGImageCreateWithImageInRect(a1, *(CGRect *)&v22);
}

CGImageRef ABImageUtilsCreateImageFromImageSourceWithSizeCropRectMaxSize(CGImageSource *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  if (!a1 || !CGImageSourceGetCount(a1)) {
    return 0;
  }
  double v28 = a5;
  CGFloat v18 = (void *)*MEMORY[0x263F0F5A8];
  keys[0] = *(void **)MEMORY[0x263F0F5B8];
  keys[1] = v18;
  keys[2] = *(void **)MEMORY[0x263F0F638];
  double v19 = fmin(a6 / a8, a7 / a9);
  values[0] = *(void **)MEMORY[0x263EFFB40];
  values[1] = values[0];
  unsigned int valuePtr = vcvtpd_s64_f64(fmax(a3, a2) / v19);
  CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  CFDictionaryRef v21 = CFDictionaryCreate(v20, (const void **)keys, (const void **)values, 3, 0, 0);
  if (v21)
  {
    CFDictionaryRef v22 = v21;
    CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a1, 0, v21);
    if (ThumbnailAtIndex)
    {
      double v24 = ThumbnailAtIndex;
      if (v19 >= 1.0)
      {
        a4 = round(a4 / v19);
        double v25 = round(v28 / v19);
        a6 = a8;
        a7 = a9;
      }
      else
      {
        double v25 = v28;
      }
      CGImageRef ImageFromImageWithCropRect = ABImageUtilsCreateImageFromImageWithCropRect(ThumbnailAtIndex, a4, v25, a6, a7);
      CFRelease(v24);
    }
    else
    {
      CGImageRef ImageFromImageWithCropRect = 0;
    }
    CFRelease(v22);
  }
  else
  {
    CGImageRef ImageFromImageWithCropRect = 0;
  }
  CFRelease(cf);
  return ImageFromImageWithCropRect;
}

__CFData *ABImageUtilsCreateScaledImageData(CGImage *a1, unsigned int a2, const __CFString *a3, void *a4, double a5, double a6, double a7)
{
  if (a2 != 5 && a2 != 8) {
    ABImageUtilsCreateScaledImageData_cold_1();
  }
  ImageData = 0;
  if (a2 == 5) {
    uint32_t v15 = 4102;
  }
  else {
    uint32_t v15 = 8198;
  }
  BOOL v16 = a7 <= 0.0 || a1 == 0;
  if (!v16 && a6 > 0.0 && a5 > 0.0)
  {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if (DeviceRGB)
    {
      CGFloat v18 = DeviceRGB;
      double v19 = round(a5 * a7);
      double v20 = round(a6 * a7);
      size_t Width = CGImageGetWidth(a1);
      size_t Height = CGImageGetHeight(a1);
      if (a3 && (v19 == (double)Width ? (BOOL v23 = v20 == (double)Height) : (BOOL v23 = 0), v23))
      {
        ImageData = _ABImageUtilsCreateImageData(a1, a3, a7);
        if (a4) {
          *a4 = CFRetain(a1);
        }
      }
      else
      {
        double v24 = 4.0;
        if (a2 == 5) {
          double v24 = 2.0;
        }
        double v25 = CGBitmapContextCreate(0, (unint64_t)v19, (unint64_t)v20, a2, (unint64_t)(v19 * v24), v18, v15);
        if (v25)
        {
          CGAffineTransform v26 = v25;
          v32.origin.double x = 0.0;
          v32.origin.double y = 0.0;
          v32.size.double width = v19;
          v32.size.double height = v20;
          CGContextDrawImage(v25, v32, a1);
          if (a3)
          {
            Image = CGBitmapContextCreateImage(v26);
            ImageData = _ABImageUtilsCreateImageData(Image, a3, a7);
            if (a4) {
              *a4 = Image;
            }
            else {
              CGImageRelease(Image);
            }
          }
          else
          {
            CFAllocatorRef v28 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
            Data = (const UInt8 *)CGBitmapContextGetData(v26);
            size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v26);
            ImageData = CFDataCreate(v28, Data, (uint64_t)(v19 * (double)BytesPerRow));
          }
          CFRelease(v26);
        }
        else
        {
          ImageData = 0;
        }
      }
      CGColorSpaceRelease(v18);
    }
    else
    {
      return 0;
    }
  }
  return ImageData;
}

__CFData *_ABImageUtilsCreateImageData(CGImage *a1, const __CFString *a2, double a3)
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  double v8 = CGImageDestinationCreateWithData(Mutable, a2, 1uLL, 0);
  if (v8)
  {
    double v9 = v8;
    if (a3 == 1.0)
    {
      CGImageDestinationAddImage(v8, a1, 0);
    }
    else
    {
      double v14 = a3 * 72.0;
      CFNumberRef v10 = CFNumberCreate(v6, kCFNumberDoubleType, &v14);
      double v11 = (void *)*MEMORY[0x263F0F198];
      keys[0] = *(void **)MEMORY[0x263F0F1A0];
      keys[1] = v11;
      values[0] = v10;
      values[1] = v10;
      CFDictionaryRef v12 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CGImageDestinationAddImage(v9, a1, v12);
      CFRelease(v12);
      CFRelease(v10);
    }
    CGImageDestinationFinalize(v9);
    CFRelease(v9);
  }
  if (Mutable && !CFDataGetLength(Mutable))
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t ABPersonImageFormatGetPixelWidth(int a1)
{
  if (a1) {
    return 0;
  }
  else {
    return 320;
  }
}

uint64_t ABPersonImageFormatGetPixelHeight(int a1)
{
  if (a1) {
    return 0;
  }
  else {
    return 320;
  }
}

float ABPersonImageFormatGetScale()
{
  return 1.0;
}

BOOL ABPersonImageFormatIsLessThanOrEqualToPixelSize(int a1, int a2, int a3)
{
  if (a1) {
    int v3 = 0;
  }
  else {
    int v3 = 320;
  }
  return v3 <= a2 && v3 <= a3;
}

__CFData *ABSCreateThumbnailDataAndCropRectFromImageData(const __CFData *a1, double *a2)
{
  CFTypeRef cf = 0;
  uint64_t v25 = 0;
  ScaledImageData = 0;
  if (ABImageUtilsCopyImageSourceAndGetSizeFromData(a1, (CGImageSource **)&cf, (int *)&v25 + 1, (int *)&v25))
  {
    int v5 = v25;
    int v4 = HIDWORD(v25);
    double v6 = (double)SHIDWORD(v25);
    double v7 = (double)(int)v25;
    if ((double)SHIDWORD(v25) <= (double)(int)v25)
    {
      double v9 = 0.0;
      double v10 = (double)SHIDWORD(v25);
      double v11 = (double)(int)v25;
      double v8 = 0.0;
      if (v7 > v6)
      {
        double v8 = (v7 - v6) * 0.5 + 0.0;
        if (v8 >= 0.0)
        {
          double v10 = (double)SHIDWORD(v25);
          double v11 = (double)SHIDWORD(v25);
        }
        else
        {
          CFDictionaryRef v12 = [NSNumber numberWithDouble:0.0];
          int v13 = [NSNumber numberWithDouble:(v7 - v6) * 0.5 + 0.0];
          double v14 = [NSNumber numberWithDouble:v6];
          uint32_t v15 = [NSNumber numberWithDouble:v6];
          BOOL v16 = [NSNumber numberWithInt:v25];
          NSLog(&cfstr_ThumbnailCropR.isa, v12, v13, v14, v15, v16);

          double v10 = v6;
          double v11 = v6;
          double v8 = 0.0;
        }
      }
    }
    else
    {
      double v8 = 0.0;
      double v9 = (v6 - v7) * 0.5 + 0.0;
      double v10 = (double)(int)v25;
      double v11 = (double)(int)v25;
    }
    BOOL v17 = v4 > 319;
    BOOL v18 = v5 > 319;
    if (v17 && v18) {
      double v19 = 320.0;
    }
    else {
      double v19 = v10;
    }
    if (v17 && v18) {
      double v20 = 320.0;
    }
    else {
      double v20 = v11;
    }
    ImageFromImageSourceWithSizeCropRectMaxSize = ABImageUtilsCreateImageFromImageSourceWithSizeCropRectMaxSize((CGImageSource *)cf, v6, v7, v9, v8, v10, v11, v19, v20);
    if (ImageFromImageSourceWithSizeCropRectMaxSize)
    {
      CFDictionaryRef v22 = ImageFromImageSourceWithSizeCropRectMaxSize;
      ScaledImageData = ABImageUtilsCreateScaledImageData(ImageFromImageSourceWithSizeCropRectMaxSize, 8u, @"public.jpeg", 0, v19, v20, 1.0);
      if (a2)
      {
        *a2 = v9;
        a2[1] = v8;
        a2[2] = v10;
        a2[3] = v11;
      }
      CFRelease(v22);
    }
    else
    {
      ScaledImageData = 0;
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return ScaledImageData;
}

CFDictionaryRef __initializeThumbnailProperties()
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  v0 = (void *)*MEMORY[0x263F0F5A8];
  keys[0] = *(void **)MEMORY[0x263F0F5B8];
  keys[1] = v0;
  values[0] = *(void **)MEMORY[0x263EFFB40];
  values[1] = values[0];
  CFDictionaryRef result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 2, 0, 0);
  __thumbnailProperties = (uint64_t)result;
  return result;
}

void ABSPersonConstantsInitialize()
{
  kABPersonKindPerson = (const CFNumberRef)&unk_26C591C10;
  kABPersonKindOrganization = (const CFNumberRef)&unk_26C591C28;
}

id _createDictionaryFromFile(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  int v3 = [v1 bundleWithIdentifier:@"com.apple.AddressBook"];
  int v4 = [v3 URLForResource:v2 withExtension:0];

  int v5 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v4];

  return v5;
}

id socialProfileURLForServiceAndUsername(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (socialProfileURLForServiceAndUsername_onceToken != -1) {
    dispatch_once(&socialProfileURLForServiceAndUsername_onceToken, &__block_literal_global_13);
  }
  int v5 = (void *)socialProfileURLForServiceAndUsername_formats;
  if (!v3 || !socialProfileURLForServiceAndUsername_formats)
  {
LABEL_9:
    double v6 = [v5 objectForKeyedSubscript:@"UnknownServiceURLFormat"];
    if (v4) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  double v6 = [(id)socialProfileURLForServiceAndUsername_formats objectForKeyedSubscript:v3];
  if (!v6)
  {
    int v5 = (void *)socialProfileURLForServiceAndUsername_formats;
    goto LABEL_9;
  }
  if (v4)
  {
LABEL_7:
    double v7 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    double v8 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v7];

    double v9 = objc_msgSend(NSString, "stringWithFormat:", v6, v8);

    goto LABEL_11;
  }
LABEL_10:
  double v9 = 0;
LABEL_11:

  return v9;
}

uint64_t __socialProfileURLForServiceAndUsername_block_invoke()
{
  socialProfileURLForServiceAndUsername_formats = _createDictionaryFromFile(@"SocialServicesURLFormats.plist");

  return MEMORY[0x270F9A758]();
}

id socialProfileFromURL(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v32 = a4;
  CFAllocatorRef v28 = v8;
  if (socialProfileFromURL_onceToken != -1) {
    dispatch_once(&socialProfileFromURL_onceToken, &__block_literal_global_12);
  }
  CGAffineTransform v27 = v9;
  CGRect v31 = [MEMORY[0x263EFF9A0] dictionary];
  [(id)socialProfileFromURL_servicesDict allKeys];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        double v14 = (void *)MEMORY[0x2166AC860]();
        id v38 = 0;
        uint32_t v15 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v13 options:1 error:&v38];
        id v16 = v38;
        uint64_t v17 = [v7 length];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __socialProfileFromURL_block_invoke_2;
        v33[3] = &unk_264224138;
        id v18 = v7;
        id v19 = v7;
        id v34 = v19;
        id v35 = v31;
        id v36 = v32;
        uint64_t v37 = v13;
        id v20 = v19;
        id v7 = v18;
        objc_msgSend(v15, "enumerateMatchesInString:options:range:usingBlock:", v20, 0, 0, v17, v33);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v11);
  }

  CFDictionaryRef v21 = [v31 objectForKey:@"url"];

  if (v21)
  {
    id v23 = v27;
    CFDictionaryRef v22 = v28;
    goto LABEL_25;
  }
  double v24 = (void *)[objc_alloc(NSURL) initWithString:v7];
  uint64_t v25 = [v24 scheme];

  CFDictionaryRef v22 = v28;
  if (v25)
  {
    [v31 setObject:v7 forKey:@"url"];
    id v23 = v27;
    if (v27 || (_socialProfileUsernameFromURL((uint64_t)v7), (id v23 = (id)objc_claimAutoreleasedReturnValue()) != 0)) {
      [v31 setObject:v23 forKey:@"username"];
    }
    if (!v28)
    {
      CFDictionaryRef v22 = _socialProfileServiceFromURL((uint64_t)v7);
      if (!v22) {
        goto LABEL_24;
      }
    }
  }
  else
  {
    if (!v7 || !v28)
    {
      id v23 = v27;
      goto LABEL_24;
    }
    id v23 = v7;

    socialProfileURLForServiceAndUsername(v28, v23);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [v31 setObject:v7 forKey:@"url"];
    [v31 setObject:v23 forKey:@"username"];
  }
  [v31 setObject:v22 forKey:@"service"];
LABEL_24:

LABEL_25:

  return v31;
}

uint64_t __socialProfileFromURL_block_invoke()
{
  socialProfileFromURL_servicesDict = _createDictionaryFromFile(@"SocialServicesURLRegexes.plist");

  return MEMORY[0x270F9A758]();
}

void __socialProfileFromURL_block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ((unint64_t)[v10 numberOfRanges] >= 3)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v10 rangeAtIndex:2];
    double v6 = objc_msgSend(v3, "substringWithRange:", v4, v5);
    id v7 = [v6 stringByRemovingPercentEncoding];

    [*(id *)(a1 + 40) setObject:v7 forKey:@"username"];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    [*(id *)(a1 + 40) setObject:v8 forKey:@"identifier"];
  }
  id v9 = [(id)socialProfileFromURL_servicesDict objectForKey:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) setObject:v9 forKey:@"service"];
  [*(id *)(a1 + 40) setObject:*(void *)(a1 + 32) forKey:@"url"];
}

id _socialProfileUsernameFromURL(uint64_t a1)
{
  uint64_t v1 = [NSURL URLWithString:a1];
  id v2 = [v1 scheme];
  id v3 = [v2 lowercaseString];
  if (([v3 isEqualToString:@"x-apple"] & 1) == 0)
  {

    uint64_t v5 = 0;
    goto LABEL_5;
  }
  uint64_t v4 = [v1 resourceSpecifier];

  if (v4)
  {
    id v2 = [v1 resourceSpecifier];
    uint64_t v5 = [v2 stringByRemovingPercentEncoding];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v5 = 0;
LABEL_7:

  return v5;
}

id _socialProfileServiceFromURL(uint64_t a1)
{
  id v3 = [NSURL URLWithString:a1];
  uint64_t v4 = [v3 scheme];
  uint64_t v5 = [v4 lowercaseString];
  char v6 = [v5 isEqualToString:@"http"];
  if ((v6 & 1) == 0)
  {
    uint64_t v1 = [v3 scheme];
    id v2 = [v1 lowercaseString];
    if (![v2 isEqualToString:@"https"])
    {

      uint64_t v8 = 0;
LABEL_9:

      uint64_t v4 = (void *)v8;
      goto LABEL_11;
    }
  }
  id v7 = [v3 host];

  if ((v6 & 1) == 0)
  {
  }
  if (v7)
  {
    uint64_t v4 = [v3 host];
    if (![v4 hasPrefix:@"www."]) {
      goto LABEL_11;
    }
    uint64_t v8 = [v4 substringFromIndex:4];
    goto LABEL_9;
  }
  uint64_t v4 = 0;
LABEL_11:

  return v4;
}

id completedSocialProfileFromSocialProfile(void *a1)
{
  uint64_t v1 = (void *)[a1 mutableCopy];
  id v2 = [v1 objectForKeyedSubscript:@"url"];
  id v3 = [v1 objectForKeyedSubscript:@"service"];
  uint64_t v4 = [v1 objectForKeyedSubscript:@"username"];
  uint64_t v5 = [v1 objectForKeyedSubscript:@"identifier"];
  char v6 = (void *)v5;
  if (!v2)
  {
    if (v3) {
      BOOL v10 = (v4 | v5) == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      goto LABEL_26;
    }
    if (v4) {
      uint64_t v11 = (void *)v4;
    }
    else {
      uint64_t v11 = (void *)v5;
    }
    id v9 = socialProfileURLForServiceAndUsername(v3, v11);
    if (v9) {
      [v1 setObject:v9 forKeyedSubscript:@"url"];
    }
    goto LABEL_25;
  }
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    goto LABEL_26;
  }
  uint64_t v8 = socialProfileFromURL(v2, 0, 0, 0);
  id v9 = v8;
  if (!v3)
  {
    CFDictionaryRef v12 = [v8 objectForKeyedSubscript:@"service"];
    if (v12) {
      [v1 setObject:v12 forKeyedSubscript:@"service"];
    }

    if (v4) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if (!v4)
  {
LABEL_22:
    uint64_t v13 = [v9 objectForKeyedSubscript:@"username"];
    if (v13) {
      [v1 setObject:v13 forKeyedSubscript:@"username"];
    }
  }
LABEL_25:

LABEL_26:

  return v1;
}

ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef addressBook)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    id v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v8 = 136315650;
      id v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef)";
      __int16 v12 = 2112;
      uint64_t v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  uint64_t v5 = [(id)addressBook defaultSource];
  if (ABSIsAPILogEnabled())
  {
    char v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

ABRecordRef ABAddressBookGetSourceWithRecordID(ABAddressBookRef addressBook, ABRecordID sourceID)
{
  uint64_t v2 = *(void *)&sourceID;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      char v6 = "NO";
      if (v5) {
        char v6 = "YES";
      }
      int v10 = 136315650;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      uint64_t v13 = "ABRecordRef ABAddressBookGetSourceWithRecordID(ABAddressBookRef, ABRecordID)";
      __int16 v14 = 2112;
      uint32_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  BOOL v7 = (const void *)[(id)addressBook sourceWithRecordID:v2];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "ABRecordRef ABAddressBookGetSourceWithRecordID(ABAddressBookRef, ABRecordID)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

CFArrayRef ABAddressBookCopyArrayOfAllSources(ABAddressBookRef addressBook)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v4 = "NO";
      if (v3) {
        uint64_t v4 = "YES";
      }
      int v9 = 136315650;
      int v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = "CFArrayRef ABAddressBookCopyArrayOfAllSources(ABAddressBookRef)";
      __int16 v13 = 2112;
      __int16 v14 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
  int v5 = [(id)addressBook allSources];
  CFArrayRef v6 = (const __CFArray *)[v5 copy];

  if (ABSIsAPILogEnabled())
  {
    BOOL v7 = +[ABSLog apiLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "CFArrayRef ABAddressBookCopyArrayOfAllSources(ABAddressBookRef)";
      _os_log_impl(&dword_214A03000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

uint64_t ABSourceCreate()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    v0 = +[ABSLog apiLog];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      int v1 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v2 = "NO";
      if (v1) {
        uint64_t v2 = "YES";
      }
      int v8 = 136315650;
      int v9 = v2;
      __int16 v10 = 2080;
      __int16 v11 = "ABRecordRef ABSourceCreate(void)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  int v3 = [ABSSource alloc];
  id v4 = objc_alloc_init(MEMORY[0x263EFEB00]);
  uint64_t v5 = [(ABSSource *)v3 initWithMutableContainer:v4];

  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "ABRecordRef ABSourceCreate(void)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

uint64_t ABAddressBookCopyLocalSource(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v8 = 136315650;
      int v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "ABRecordRef ABAddressBookCopyLocalSource(ABAddressBookRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  uint64_t v5 = [a1 localSource];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "ABRecordRef ABAddressBookCopyLocalSource(ABAddressBookRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

ABRecordRef ABPersonCreate(void)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    v0 = +[ABSLog apiLog];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      int v1 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v2 = "NO";
      if (v1) {
        uint64_t v2 = "YES";
      }
      int v6 = 136315650;
      BOOL v7 = v2;
      __int16 v8 = 2080;
      int v9 = "ABRecordRef ABPersonCreate(void)";
      __int16 v10 = 2112;
      __int16 v11 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }
  }
  ABSRecordGetTypeID();
  int v3 = objc_alloc_init(ABSPerson);
  if (ABSIsAPILogEnabled())
  {
    id v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      BOOL v7 = "ABRecordRef ABPersonCreate(void)";
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

ABRecordRef ABPersonCreateInSource(ABRecordRef source)
{
  uint64_t v2 = [ABSPerson alloc];

  return [(ABSPerson *)v2 initWithSource:source];
}

ABRecordRef ABPersonCopySource(ABRecordRef person)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v8 = 136315650;
      int v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "ABRecordRef ABPersonCopySource(ABRecordRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  uint64_t v5 = [(id)person source];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "ABRecordRef ABPersonCopySource(ABRecordRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

CFArrayRef ABPersonCopyArrayOfAllLinkedPeople(ABRecordRef person)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v8 = 136315650;
      int v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "CFArrayRef ABPersonCopyArrayOfAllLinkedPeople(ABRecordRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  CFArrayRef v5 = [(id)person linkedPeople];
  if (ABSIsAPILogEnabled())
  {
    int v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "CFArrayRef ABPersonCopyArrayOfAllLinkedPeople(ABRecordRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

uint64_t ABPersonLinkPerson(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  CFArrayRef v5 = [v4 addressBook];
  uint64_t v6 = [v5 linkPerson:v4 toPerson:v3];

  return v6;
}

uint64_t ABPersonUnlink(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 addressBook];
  uint64_t v3 = [v2 unlinkPerson:v1];

  return v3;
}

ABPropertyType ABPersonGetTypeOfProperty(ABPropertyID property)
{
  uint64_t v1 = *(void *)&property;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v8 = 136315650;
      int v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "ABPropertyType ABPersonGetTypeOfProperty(ABPropertyID)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  ABPropertyType v5 = +[ABSPerson typeForProperty:v1];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "ABPropertyType ABPersonGetTypeOfProperty(ABPropertyID)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

CFStringRef ABPersonCopyLocalizedPropertyName(ABPropertyID property)
{
  uint64_t v1 = *(void *)&property;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v8 = 136315650;
      int v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "CFStringRef ABPersonCopyLocalizedPropertyName(ABPropertyID)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  CFStringRef v5 = +[ABSPerson localizedNameForProperty:v1];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "CFStringRef ABPersonCopyLocalizedPropertyName(ABPropertyID)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

ABPersonCompositeNameFormat ABPersonGetCompositeNameFormat(void)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    v0 = +[ABSLog apiLog];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      int v1 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v2 = "NO";
      if (v1) {
        uint64_t v2 = "YES";
      }
      int v6 = 136315650;
      BOOL v7 = v2;
      __int16 v8 = 2080;
      int v9 = "ABPersonCompositeNameFormat ABPersonGetCompositeNameFormat(void)";
      __int16 v10 = 2112;
      __int16 v11 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }
  }
  ABPersonCompositeNameFormat v3 = +[ABSPerson compositeNameFormat];
  if (ABSIsAPILogEnabled())
  {
    id v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      BOOL v7 = "ABPersonCompositeNameFormat ABPersonGetCompositeNameFormat(void)";
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

ABPersonCompositeNameFormat ABPersonGetCompositeNameFormatForRecord(ABRecordRef record)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      __int16 v10 = v4;
      __int16 v11 = 2080;
      uint64_t v12 = "ABPersonCompositeNameFormat ABPersonGetCompositeNameFormatForRecord(ABRecordRef)";
      __int16 v13 = 2112;
      uint64_t v14 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  CFStringRef v5 = (id)record;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ABPersonCompositeNameFormat v6 = [v5 compositeNameFormat];
  }
  else
  {
    ABPersonCompositeNameFormat v6 = +[ABSPerson compositeNameFormat];
    if (v5) {
      NSLog(&cfstr_WarningUnexpec.isa, v5);
    }
  }
  if (ABSIsAPILogEnabled())
  {
    BOOL v7 = +[ABSLog apiLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v10 = "ABPersonCompositeNameFormat ABPersonGetCompositeNameFormatForRecord(ABRecordRef)";
      _os_log_impl(&dword_214A03000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v6;
}

CFStringRef ABPersonCopyCompositeNameDelimiterForRecord(ABRecordRef record)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      __int16 v10 = v4;
      __int16 v11 = 2080;
      uint64_t v12 = "CFStringRef ABPersonCopyCompositeNameDelimiterForRecord(ABRecordRef)";
      __int16 v13 = 2112;
      uint64_t v14 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  CFStringRef v5 = (id)record;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSLog(&cfstr_WarningUnexpec_0.isa, v5);
    ABPersonCompositeNameFormat v6 = &stru_26C58E308;
  }
  else
  {
    ABPersonCompositeNameFormat v6 = +[ABSPerson copyCompositeNameDelimiterForPerson:v5];
    if (ABSIsAPILogEnabled())
    {
      BOOL v7 = +[ABSLog apiLog];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v10 = "CFStringRef ABPersonCopyCompositeNameDelimiterForRecord(ABRecordRef)";
        _os_log_impl(&dword_214A03000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
      }
    }
  }

  return v6;
}

uint64_t ABPersonSetCompositeNameFormat(uint64_t a1)
{
  return +[ABSPerson setCompositeNameFormat:a1];
}

uint64_t ABPersonCopyCompositeName(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

BOOL ABPersonSetImageData(ABRecordRef person, CFDataRef imageData, CFErrorRef *error)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    ABPersonCompositeNameFormat v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      __int16 v8 = "NO";
      if (v7) {
        __int16 v8 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      id v18 = "_Bool ABPersonSetImageData(ABRecordRef, CFDataRef, CFErrorRef *)";
      __int16 v19 = 2112;
      id v20 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  id v14 = 0;
  char v9 = [(id)person setImageData:imageData withError:&v14];
  id v10 = v14;
  __int16 v11 = v10;
  if (error && (v9 & 1) == 0) {
    *error = (CFErrorRef)v10;
  }
  if (ABSIsAPILogEnabled())
  {
    uint64_t v12 = +[ABSLog apiLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "_Bool ABPersonSetImageData(ABRecordRef, CFDataRef, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v12, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v9;
}

CFDataRef ABPersonCopyImageData(ABRecordRef person)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v8 = 136315650;
      char v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "CFDataRef ABPersonCopyImageData(ABRecordRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  CFDataRef v5 = (const __CFData *)[(id)person copyImageData];
  if (ABSIsAPILogEnabled())
  {
    ABPersonCompositeNameFormat v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      char v9 = "CFDataRef ABPersonCopyImageData(ABRecordRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

CFDataRef ABPersonCopyImageDataWithFormat(ABRecordRef person, ABPersonImageFormat format)
{
  uint64_t v2 = *(void *)&format;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    id v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      ABPersonCompositeNameFormat v6 = "NO";
      if (v5) {
        ABPersonCompositeNameFormat v6 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "CFDataRef ABPersonCopyImageDataWithFormat(ABRecordRef, ABPersonImageFormat)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  CFDataRef v7 = (const __CFData *)[(id)person copyImageDataWithFormat:v2];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "CFDataRef ABPersonCopyImageDataWithFormat(ABRecordRef, ABPersonImageFormat)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

BOOL ABPersonHasImageData(ABRecordRef person)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v8 = 136315650;
      char v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "_Bool ABPersonHasImageData(ABRecordRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  char v5 = [(id)person hasImageData];
  if (ABSIsAPILogEnabled())
  {
    ABPersonCompositeNameFormat v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      char v9 = "_Bool ABPersonHasImageData(ABRecordRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

BOOL ABPersonRemoveImageData(ABRecordRef person, CFErrorRef *error)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    id v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      ABPersonCompositeNameFormat v6 = "NO";
      if (v5) {
        ABPersonCompositeNameFormat v6 = "YES";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      uint64_t v16 = "_Bool ABPersonRemoveImageData(ABRecordRef, CFErrorRef *)";
      __int16 v17 = 2112;
      id v18 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", buf, 0x20u);
    }
  }
  id v12 = 0;
  char v7 = [(id)person removeImageDataWithError:&v12];
  id v8 = v12;
  char v9 = v8;
  if (error && (v7 & 1) == 0) {
    *error = (CFErrorRef)v8;
  }
  if (ABSIsAPILogEnabled())
  {
    __int16 v10 = +[ABSLog apiLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "_Bool ABPersonRemoveImageData(ABRecordRef, CFErrorRef *)";
      _os_log_impl(&dword_214A03000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", buf, 0xCu);
    }
  }
  return v7;
}

CFComparisonResult ABPersonComparePeopleByName(ABRecordRef person1, ABRecordRef person2, ABPersonSortOrdering ordering)
{
  uint64_t v3 = *(void *)&ordering;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    ABPersonCompositeNameFormat v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      id v8 = "NO";
      if (v7) {
        id v8 = "YES";
      }
      int v12 = 136315650;
      __int16 v13 = v8;
      __int16 v14 = 2080;
      __int16 v15 = "CFComparisonResult ABPersonComparePeopleByName(ABRecordRef, ABRecordRef, ABPersonSortOrdering)";
      __int16 v16 = 2112;
      __int16 v17 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v12, 0x20u);
    }
  }
  CFComparisonResult v9 = [(id)person1 comparePersonByName:person2 sortOrdering:v3];
  if (ABSIsAPILogEnabled())
  {
    __int16 v10 = +[ABSLog apiLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      __int16 v13 = "CFComparisonResult ABPersonComparePeopleByName(ABRecordRef, ABRecordRef, ABPersonSortOrdering)";
      _os_log_impl(&dword_214A03000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v12, 0xCu);
    }
  }
  return v9;
}

CFIndex ABAddressBookGetPersonCount(ABAddressBookRef addressBook)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v8 = 136315650;
      CFComparisonResult v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "CFIndex ABAddressBookGetPersonCount(ABAddressBookRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  CFIndex v5 = [(id)addressBook personCount];
  if (ABSIsAPILogEnabled())
  {
    ABPersonCompositeNameFormat v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      CFComparisonResult v9 = "CFIndex ABAddressBookGetPersonCount(ABAddressBookRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  uint64_t v2 = *(void *)&recordID;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    id v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      ABPersonCompositeNameFormat v6 = "NO";
      if (v5) {
        ABPersonCompositeNameFormat v6 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef, ABRecordID)";
      __int16 v14 = 2112;
      __int16 v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  int v7 = (const void *)[(id)addressBook personWithRecordID:v2];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef, ABRecordID)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

CFArrayRef ABAddressBookCopyArrayOfAllPeople(ABAddressBookRef addressBook)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v9 = 136315650;
      int v10 = v4;
      __int16 v11 = 2080;
      __int16 v12 = "CFArrayRef ABAddressBookCopyArrayOfAllPeople(ABAddressBookRef)";
      __int16 v13 = 2112;
      __int16 v14 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
  int v5 = [(id)addressBook allPeople];
  CFArrayRef v6 = (const __CFArray *)[v5 copy];

  if (ABSIsAPILogEnabled())
  {
    int v7 = +[ABSLog apiLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "CFArrayRef ABAddressBookCopyArrayOfAllPeople(ABAddressBookRef)";
      _os_log_impl(&dword_214A03000, v7, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    id v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v10 = 136315650;
      __int16 v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSource(ABAddressBookRef, ABRecordRef)";
      __int16 v14 = 2112;
      uint64_t v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  CFArrayRef v7 = [(id)addressBook peopleInSource:source sortOrder:0xFFFFFFFFLL];
  if (ABSIsAPILogEnabled())
  {
    int v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSource(ABAddressBookRef, ABRecordRef)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(ABAddressBookRef addressBook, ABRecordRef source, ABPersonSortOrdering sortOrdering)
{
  uint64_t v3 = *(void *)&sortOrdering;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [MEMORY[0x263F08B88] isMainThread];
      int v8 = "NO";
      if (v7) {
        int v8 = "YES";
      }
      int v12 = 136315650;
      __int16 v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = "CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(ABAddressBookRef, ABRecordRef, ABPersonSortOrdering)";
      __int16 v16 = 2112;
      __int16 v17 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v12, 0x20u);
    }
  }
  CFArrayRef v9 = [(id)addressBook peopleInSource:source sortOrder:v3];
  if (ABSIsAPILogEnabled())
  {
    int v10 = +[ABSLog apiLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      __int16 v13 = "CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(ABAddressBookRef, ABRecordRef, ABPersonSortOrdering)";
      _os_log_impl(&dword_214A03000, v10, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v12, 0xCu);
    }
  }
  return v9;
}

CFArrayRef ABAddressBookCopyPeopleWithName(ABAddressBookRef addressBook, CFStringRef name)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    id v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v11 = 136315650;
      int v12 = v6;
      __int16 v13 = 2080;
      __int16 v14 = "CFArrayRef ABAddressBookCopyPeopleWithName(ABAddressBookRef, CFStringRef)";
      __int16 v15 = 2112;
      __int16 v16 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v11, 0x20u);
    }
  }
  int v7 = [(id)addressBook peopleMatchingNameString:name];
  CFArrayRef v8 = (const __CFArray *)[v7 copy];

  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v9 = +[ABSLog apiLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      int v12 = "CFArrayRef ABAddressBookCopyPeopleWithName(ABAddressBookRef, CFStringRef)";
      _os_log_impl(&dword_214A03000, v9, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v11, 0xCu);
    }
  }
  return v8;
}

CFArrayRef ABPersonCreatePeopleInSourceWithVCardRepresentation(ABRecordRef source, CFDataRef vCardData)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    id v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F08B88] isMainThread];
      CFArrayRef v6 = "NO";
      if (v5) {
        CFArrayRef v6 = "YES";
      }
      int v10 = 136315650;
      int v11 = v6;
      __int16 v12 = 2080;
      __int16 v13 = "CFArrayRef ABPersonCreatePeopleInSourceWithVCardRepresentation(ABRecordRef, CFDataRef)";
      __int16 v14 = 2112;
      __int16 v15 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v10, 0x20u);
    }
  }
  CFArrayRef v7 = +[ABSPerson createPeopleInSource:source withVCardRepresentation:vCardData];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v8 = +[ABSLog apiLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "CFArrayRef ABPersonCreatePeopleInSourceWithVCardRepresentation(ABRecordRef, CFDataRef)";
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

CFDataRef ABPersonCreateVCardRepresentationWithPeople(CFArrayRef people)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    uint64_t v2 = +[ABSLog apiLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [MEMORY[0x263F08B88] isMainThread];
      id v4 = "NO";
      if (v3) {
        id v4 = "YES";
      }
      int v8 = 136315650;
      CFArrayRef v9 = v4;
      __int16 v10 = 2080;
      int v11 = "CFDataRef ABPersonCreateVCardRepresentationWithPeople(CFArrayRef)";
      __int16 v12 = 2112;
      __int16 v13 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v2, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v8, 0x20u);
    }
  }
  CFDataRef v5 = +[ABSPerson vCardRepresentationForPeople:people];
  if (ABSIsAPILogEnabled())
  {
    CFArrayRef v6 = +[ABSLog apiLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      CFArrayRef v9 = "CFDataRef ABPersonCreateVCardRepresentationWithPeople(CFArrayRef)";
      _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

ABPersonSortOrdering ABPersonGetSortOrdering(void)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (ABSIsAPILogEnabled())
  {
    v0 = +[ABSLog apiLog];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      int v1 = [MEMORY[0x263F08B88] isMainThread];
      uint64_t v2 = "NO";
      if (v1) {
        uint64_t v2 = "YES";
      }
      int v6 = 136315650;
      CFArrayRef v7 = v2;
      __int16 v8 = 2080;
      CFArrayRef v9 = "ABPersonSortOrdering ABPersonGetSortOrdering(void)";
      __int16 v10 = 2112;
      int v11 = &stru_26C58E308;
      _os_log_impl(&dword_214A03000, v0, OS_LOG_TYPE_DEFAULT, "<< Main thread:%s %s %@", (uint8_t *)&v6, 0x20u);
    }
  }
  ABPersonSortOrdering v3 = +[ABSPerson sortOrdering];
  if (ABSIsAPILogEnabled())
  {
    id v4 = +[ABSLog apiLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      CFArrayRef v7 = "ABPersonSortOrdering ABPersonGetSortOrdering(void)";
      _os_log_impl(&dword_214A03000, v4, OS_LOG_TYPE_DEFAULT, ">> %s", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

void *ABAddressBookFindPersonMatchingURL(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  CFDataRef v5 = [a1 findPersonMatchingURL:a2];
  [v5 getIdentifier:a3 label:0 forMultiValueMatchingValue:a2 property:22];

  return v5;
}

void *ABAddressBookFindPersonMatchingEmailAddress(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  CFDataRef v5 = [a1 findPersonMatchingEmailAddress:a2];
  [v5 getIdentifier:a3 label:0 forMultiValueMatchingValue:a2 property:4];

  return v5;
}

void *ABAddressBookFindPersonMatchingPhoneNumber(void *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  return ABAddressBookFindPersonMatchingPhoneNumberWithCountry(a1, a2, 0, a3, a4);
}

void *ABAddressBookFindPersonMatchingPhoneNumberWithCountry(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  if (!a2) {
    return 0;
  }
  CFArrayRef v9 = [a1 findPersonMatchingPhoneNumber:a2 country:a3];
  if (a4 | a5)
  {
    int v16 = 0;
    __int16 v10 = [MEMORY[0x263EFEB28] fullyQualifiedStringForStringValue:a2 countryCode:a3];
    id v15 = 0;
    int v11 = [v9 getIdentifier:&v16 label:&v15 forMultiValueMatchingValue:v10 property:3];
    id v12 = v15;
    __int16 v13 = v12;
    if (v11)
    {
      if (a5) {
        *(void *)a5 = v12;
      }
      if (a4) {
        *(_DWORD *)a4 = v16;
      }
    }
  }
  return v9;
}

uint64_t ABAddressBookCopyPersonMatchingInternalUUID(void *a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  if (!a2) {
    return 0;
  }
  v7[0] = a2;
  ABPersonSortOrdering v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v4 = [a1 peopleWithCNIdentifiers:v3];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

uint64_t ABPersonCopyCompositeNameIgnoringOrganization(void *a1, uint64_t a2)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t ABPersonCopyShortName(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 shortName];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

BOOL ABPersonGetShortNameFormatEnabled()
{
  return +[ABSPerson shortNameFormatEnabled];
}

BOOL ABPersonGetShortNamePreferNicknames()
{
  return +[ABSPerson shortNameFormatPrefersNicknames];
}

uint64_t ABPersonCopySoundIdentifierForMultiValueIdentifier(void *a1, uint64_t a2)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t ABPersonSetSoundIdentifierForMultiValueIdentifier(void *a1, const char *a2, uint64_t a3)
{
  return [a1 setValue:a3 forSoundIdentifier:a2];
}

void __LoadContactsAssistantServices_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_214A03000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/ContactsAssistantServices.framework/ContactsAssistantServices (%d)", (uint8_t *)v1, 8u);
}

void ABAddressBookSave_cold_1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  ABPersonSortOrdering v3 = [NSNumber numberWithBool:a1 & 1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_214A03000, a2, OS_LOG_TYPE_DEBUG, "Did save AddressBook with result %@", (uint8_t *)&v4, 0xCu);
}

void ABAddressBookSave_cold_2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_214A03000, log, OS_LOG_TYPE_DEBUG, "Will save AddressBook", v1, 2u);
}

void ABImageUtilsCreateScaledImageData_cold_1()
{
  __assert_rtn("ABImageUtilsCreateScaledImageData", "ABSImageUtils.m", 361, "bitsPerComponent == 5 || bitsPerComponent == 8");
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

uint64_t CNLinkedOnOrAfter()
{
  return MEMORY[0x270EE40A0]();
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x270F0CD20]();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x270F9AAF0](lhs, rhs);
}