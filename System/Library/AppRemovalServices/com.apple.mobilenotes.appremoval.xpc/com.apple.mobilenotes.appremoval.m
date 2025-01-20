int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_1000024B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000024DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002504()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "App deletion completed", v2, v3, v4, v5, v6);
}

void sub_100002538()
{
  sub_1000024F8();
  sub_1000024DC((void *)&_mh_execute_header, v0, v1, "App deletion completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_1000025A0()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finished removing group.com.apple.notes.import group container files", v2, v3, v4, v5, v6);
}

void sub_1000025D4()
{
  sub_1000024F8();
  sub_1000024DC((void *)&_mh_execute_header, v0, v1, "error getting contents of Media directory: %@", v2, v3, v4, v5, v6);
}

void sub_10000263C()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to remove group.com.apple.notes.import group container files", v2, v3, v4, v5, v6);
}

void sub_100002670()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finished deleting tmp directory from group.com.apple.notes container", v2, v3, v4, v5, v6);
}

void sub_1000026A4()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to delete tmp directory from group.com.apple.notes container", v2, v3, v4, v5, v6);
}

void sub_1000026D8()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finished deleting group.com.apple.notes shared preferences", v2, v3, v4, v5, v6);
}

void sub_10000270C()
{
  sub_1000024F8();
  sub_1000024DC((void *)&_mh_execute_header, v0, v1, "error removing shared user defaults: %@", v2, v3, v4, v5, v6);
}

void sub_100002774()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to delete group.com.apple.notes shared preferences", v2, v3, v4, v5, v6);
}

void sub_1000027A8()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finished deleting com.apple.mobilenotes preferences", v2, v3, v4, v5, v6);
}

void sub_1000027DC()
{
  sub_1000024F8();
  sub_1000024DC((void *)&_mh_execute_header, v0, v1, "error removing app user defaults: %@", v2, v3, v4, v5, v6);
}

void sub_100002844()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to delete com.apple.mobilenotes preferences", v2, v3, v4, v5, v6);
}

void sub_100002878()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finished removing ~/Library/Notes/ files", v2, v3, v4, v5, v6);
}

void sub_1000028AC()
{
  sub_1000024F8();
  sub_1000024DC((void *)&_mh_execute_header, v0, v1, "error getting contents of ~/Library/Notes/: %@", v2, v3, v4, v5, v6);
}

void sub_100002914()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to remove ~/Library/Notes/ files", v2, v3, v4, v5, v6);
}

void sub_100002948()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finshed destroying HTML notes database", v2, v3, v4, v5, v6);
}

void sub_10000297C()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to destroy HTML notes database", v2, v3, v4, v5, v6);
}

void sub_1000029B0()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finished removing group.com.apple.notes group container files", v2, v3, v4, v5, v6);
}

void sub_1000029E4()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to remove group.com.apple.notes group container files", v2, v3, v4, v5, v6);
}

void sub_100002A18()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finished destroying modern notes database", v2, v3, v4, v5, v6);
}

void sub_100002A4C()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to destroy modern notes database", v2, v3, v4, v5, v6);
}

void sub_100002A80()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finished disabling all Notes accounts", v2, v3, v4, v5, v6);
}

void sub_100002AB4()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to disable all Notes accounts", v2, v3, v4, v5, v6);
}

void sub_100002AE8()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "Finished removing all keychain items", v2, v3, v4, v5, v6);
}

void sub_100002B1C()
{
  sub_1000024D0();
  sub_1000024B4((void *)&_mh_execute_header, v0, v1, "About to remove all keychain items", v2, v3, v4, v5, v6);
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

uint64_t ICNotesAppBundleIdentifier()
{
  return _ICNotesAppBundleIdentifier();
}

uint64_t NoteContextPersistentStorePath()
{
  return _NoteContextPersistentStorePath();
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_applicationDocumentsURL(void *a1, const char *a2, ...)
{
  return [a1 applicationDocumentsURL];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_deleteAppUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 deleteAppUserDefaults];
}

id objc_msgSend_deleteSharedUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 deleteSharedUserDefaults];
}

id objc_msgSend_destroyPersistentStore(void *a1, const char *a2, ...)
{
  return [a1 destroyPersistentStore];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_displayAccount(void *a1, const char *a2, ...)
{
  return [a1 displayAccount];
}

id objc_msgSend_importDocumentsURL(void *a1, const char *a2, ...)
{
  return [a1 importDocumentsURL];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_persistentStoreURL(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreURL];
}

id objc_msgSend_removeAllMainKeysFromKeychain(void *a1, const char *a2, ...)
{
  return [a1 removeAllMainKeysFromKeychain];
}

id objc_msgSend_removeSqliteAndIdxFiles(void *a1, const char *a2, ...)
{
  return [a1 removeSqliteAndIdxFiles];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedAppGroupDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedAppGroupDefaults];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_sharedState(void *a1, const char *a2, ...)
{
  return [a1 sharedState];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}