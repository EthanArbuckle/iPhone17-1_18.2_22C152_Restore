void sub_182C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_185C(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 migrateImagesDatabase:v6 index:a3];
  LOBYTE(a3) = [*(id *)(a1 + 32) migrateMainDatabase:v6 index:a3];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= a3;
}

void sub_1E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25A0()
{
  v0 = (const char *)_CPCreateUTF8StringFromCFString();
  if (!v0) {
    return 0;
  }
  v1 = (char *)v0;
  memset(&v4, 0, sizeof(v4));
  if (stat(v0, &v4)) {
    uint64_t st_size_low = 0;
  }
  else {
    uint64_t st_size_low = LODWORD(v4.st_size);
  }
  free(v1);
  return st_size_low;
}

Class sub_2670(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_8290)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_279C;
    v3[4] = &unk_42A0;
    v3[5] = v3;
    long long v4 = off_4288;
    uint64_t v5 = 0;
    qword_8290 = _sl_dlopen();
  }
  if (!qword_8290) {
    sub_2AC8(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("NSPersonNameComponentsFormatterPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_2B48();
  }
  qword_8288 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_279C()
{
  uint64_t result = _sl_dlopen();
  qword_8290 = result;
  return result;
}

Class sub_2810(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_82A0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_293C;
    v3[4] = &unk_42A0;
    v3[5] = v3;
    long long v4 = off_42C0;
    uint64_t v5 = 0;
    qword_82A0 = _sl_dlopen();
  }
  if (!qword_82A0) {
    sub_2BC4(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CNContactMetadataPersistentStoreManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_2C44();
  }
  qword_8298 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_293C()
{
  uint64_t result = _sl_dlopen();
  qword_82A0 = result;
  return result;
}

void sub_29B0(void *a1, NSObject *a2)
{
  v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "AB Migration - Contact metadata db was not migrated, %@", (uint8_t *)&v4, 0xCu);
}

void sub_2A4C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "AB Migration - Failed to save Contact Provider content deletion, %@", (uint8_t *)&v3, 0xCu);
}

void sub_2AC8(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *IntlPreferencesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AddressBookDataMigrator.m", 31, @"%s", *a1);

  __break(1u);
}

void sub_2B48()
{
  v0 = +[NSAssertionHandler currentHandler];
  v1 = +[NSString stringWithUTF8String:"Class getNSPersonNameComponentsFormatterPreferencesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AddressBookDataMigrator.m", 32, @"Unable to find class %s", "NSPersonNameComponentsFormatterPreferences");

  __break(1u);
}

void sub_2BC4(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *ContactsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AddressBookDataMigrator.m", 34, @"%s", *a1);

  __break(1u);
}

void sub_2C44()
{
  v0 = +[NSAssertionHandler currentHandler];
  v1 = +[NSString stringWithUTF8String:"Class getCNContactMetadataPersistentStoreManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AddressBookDataMigrator.m", 35, @"Unable to find class %s", "CNContactMetadataPersistentStoreManager");

  __break(1u);
  ABAddressBookCopyArrayOfAllSources(v2);
}

CFArrayRef ABAddressBookCopyArrayOfAllSources(ABAddressBookRef addressBook)
{
  return _ABAddressBookCopyArrayOfAllSources(addressBook);
}

ABAddressBookRef ABAddressBookCreate(void)
{
  return _ABAddressBookCreate();
}

CFIndex ABAddressBookGetGroupCount(ABAddressBookRef addressBook)
{
  return _ABAddressBookGetGroupCount(addressBook);
}

uint64_t ABAddressBookGetIntegerProperty()
{
  return _ABAddressBookGetIntegerProperty();
}

BOOL ABAddressBookHasUnsavedChanges(ABAddressBookRef addressBook)
{
  return _ABAddressBookHasUnsavedChanges(addressBook);
}

BOOL ABAddressBookRemoveRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return _ABAddressBookRemoveRecord(addressBook, record, error);
}

BOOL ABAddressBookSave(ABAddressBookRef addressBook, CFErrorRef *error)
{
  return _ABAddressBookSave(addressBook, error);
}

uint64_t ABAddressBookSetIntegerProperty()
{
  return _ABAddressBookSetIntegerProperty();
}

uint64_t ABCAddressBookCopyDBDirectory()
{
  return _ABCAddressBookCopyDBDirectory();
}

uint64_t ABCAddressBookCopyDBPath()
{
  return _ABCAddressBookCopyDBPath();
}

uint64_t ABCAddressBookCopyDelegateDBDirectories()
{
  return _ABCAddressBookCopyDelegateDBDirectories();
}

uint64_t ABCCreateAddressBookWithDatabaseDirectoryAndForceInProcessMigrationInProcessLinkingAndResetSortKeys()
{
  return _ABCCreateAddressBookWithDatabaseDirectoryAndForceInProcessMigrationInProcessLinkingAndResetSortKeys();
}

uint64_t ABCImageStoreCopyDatabasePathForDatabaseDirectory()
{
  return _ABCImageStoreCopyDatabasePathForDatabaseDirectory();
}

uint64_t ABCImageStoreCopyPath()
{
  return _ABCImageStoreCopyPath();
}

uint64_t ABCImageStoreCreateWithPathAndForceInProcessMigration()
{
  return _ABCImageStoreCreateWithPathAndForceInProcessMigration();
}

uint64_t ABCImageStoreGetCountOfImagesWithFormat()
{
  return _ABCImageStoreGetCountOfImagesWithFormat();
}

uint64_t ABCIsSortDataValid()
{
  return _ABCIsSortDataValid();
}

uint64_t ABCRebuildSearchIndex()
{
  return _ABCRebuildSearchIndex();
}

uint64_t ABCResetSortData()
{
  return _ABCResetSortData();
}

uint64_t ABChangeHistoryInsertPersonImageChangeRecordForRecordsWithIdentifiers()
{
  return _ABChangeHistoryInsertPersonImageChangeRecordForRecordsWithIdentifiers();
}

uint64_t ABOSLogGeneral()
{
  return _ABOSLogGeneral();
}

uint64_t ABPeoplePickerPrefs()
{
  return _ABPeoplePickerPrefs();
}

uint64_t ABRecordGetIntValue()
{
  return _ABRecordGetIntValue();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPRecordStoreDestroy()
{
  return _CPRecordStoreDestroy();
}

uint64_t CPSqliteUtilitiesGetIntegerQueryResultAtPath()
{
  return _CPSqliteUtilitiesGetIntegerQueryResultAtPath();
}

uint64_t CPSqliteUtilitiesGetSchemaVersionAtPath()
{
  return _CPSqliteUtilitiesGetSchemaVersionAtPath();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CPCreateUTF8StringFromCFString()
{
  return __CPCreateUTF8StringFromCFString();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void free(void *a1)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

id objc_msgSend_changedImagePersonIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 changedImagePersonIdentifiers];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_getDatabasePaths(void *a1, const char *a2, ...)
{
  return [a1 getDatabasePaths];
}

id objc_msgSend_imageDbTime(void *a1, const char *a2, ...)
{
  return [a1 imageDbTime];
}

id objc_msgSend_mainDbTime(void *a1, const char *a2, ...)
{
  return [a1 mainDbTime];
}

id objc_msgSend_migrateContactMetadataDatabase(void *a1, const char *a2, ...)
{
  return [a1 migrateContactMetadataDatabase];
}

id objc_msgSend_migrateUserDefaultsToNSPersonNameComponentsFormatter(void *a1, const char *a2, ...)
{
  return [a1 migrateUserDefaultsToNSPersonNameComponentsFormatter];
}

id objc_msgSend_resetContactProviderFeature(void *a1, const char *a2, ...)
{
  return [a1 resetContactProviderFeature];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}