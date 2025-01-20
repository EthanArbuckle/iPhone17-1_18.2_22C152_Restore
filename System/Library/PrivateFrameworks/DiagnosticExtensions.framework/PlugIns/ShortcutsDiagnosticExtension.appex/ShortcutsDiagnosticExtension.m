id sub_100003128()
{
  void *v0;
  uint64_t vars8;

  if (qword_100008190 != -1) {
    dispatch_once(&qword_100008190, &stru_100004140);
  }
  v0 = (void *)qword_100008198;
  return v0;
}

void sub_10000317C(id a1)
{
  qword_100008198 = (uint64_t)os_log_create(WFLogSubsystem, "DiagnosticExtension");
  _objc_release_x1();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutoreleaseReturnValue(id a1)
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

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_exportedDatabaseAttachment(void *a1, const char *a2, ...)
{
  return [a1 exportedDatabaseAttachment];
}

id objc_msgSend_exportedSyncEventsAttachment(void *a1, const char *a2, ...)
{
  return [a1 exportedSyncEventsAttachment];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return [a1 persistentStores];
}

id objc_msgSend_wf_shortcutsDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wf_shortcutsDirectoryURL");
}
v30;
  __int16 v31;
  id v32;
  uint64_t vars8;

  v2 = sub_100003128();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[ShortcutsDiagnosticExtension exportedDatabaseAttachment]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Loading database", buf, 0xCu);
  }

  v3 = objc_alloc((Class)WFDatabase);
  v4 = +[NSPersistentStoreDescription wf_shortcutsConfiguration];
  v26 = 0;
  v5 = [v3 initWithStoreDescription:v4 runMigrationsIfNecessary:1 useLockFile:1 error:&v26];
  v6 = v26;

  if (v5)
  {
    v7 = [v5 context];
    v8 = [v7 persistentStoreCoordinator];

    v9 = [v8 persistentStores];
    v10 = [v9 firstObject];

    if (!v10)
    {
      v12 = sub_100003128();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[ShortcutsDiagnosticExtension exportedDatabaseAttachment]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Unable to load persistent store from database", buf, 0xCu);
      }
      v21 = 0;
      goto LABEL_27;
    }
    v11 = NSTemporaryDirectory();
    v12 = +[NSURL fileURLWithPath:v11];

    v13 = [v12 URLByAppendingPathComponent:@"Shortcuts.sqlite"];
    if ([v13 checkResourceIsReachableAndReturnError:0])
    {
      v14 = sub_100003128();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[ShortcutsDiagnosticExtension exportedDatabaseAttachment]";
        v31 = 2112;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Found existing exported database at %@. Removing it.", buf, 0x16u);
      }

      v15 = +[NSFileManager defaultManager];
      v25 = v6;
      v16 = [v15 removeItemAtURL:v13 error:&v25];
      v17 = v25;

      if ((v16 & 1) == 0)
      {
        v18 = sub_100003128();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[ShortcutsDiagnosticExtension exportedDatabaseAttachment]";
          v31 = 2112;
          v32 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Failed to remove existing database: %@", buf, 0x16u);
        }
        goto LABEL_25;
      }
      v6 = v17;
    }
    v27 = NSSQLitePragmasOption;
    v28 = &off_100004200;
    v18 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v19 = sub_100003128();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[ShortcutsDiagnosticExtension exportedDatabaseAttachment]";
      v31 = 2112;
      v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Saving a copy of the database to %@", buf, 0x16u);
    }

    v24 = v6;
    v20 = [v8 migratePersistentStore:v10 toURL:v13 options:v18 withType:NSSQLiteStoreType error:&v24];
    v17 = v24;

    if (v20)
    {
      v21 = +[DEAttachmentItem attachmentWithPathURL:v13];
      [v21 setShouldCompress:&__kCFBooleanTrue];
      [v21 setDeleteOnAttach:&__kCFBooleanTrue];
LABEL_26:

      v6 = v17;
LABEL_27:

      goto LABEL_28;
    }
    v22 = sub_100003128();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[ShortcutsDiagnosticExtension exportedDatabaseAttachment]";
      v31 = 2112;
      v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Failed to copy database: %@", buf, 0x16u);
    }

LABEL_25:
    v21 = 0;
    goto LABEL_26;
  }
  v8 = sub_100003128();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[ShortcutsDiagnosticExtension exportedDatabaseAttachment]";
    v31 = 2112;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unable to load database: %@", buf, 0x16u);
  }
  v21 = 0;
LABEL_28:

  return v21;
}

@end