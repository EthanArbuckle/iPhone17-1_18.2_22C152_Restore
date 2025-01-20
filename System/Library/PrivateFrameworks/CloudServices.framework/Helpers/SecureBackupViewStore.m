@interface SecureBackupViewStore
+ (id)URLForViewName:(id)a3;
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BOOL)migrateBTree:(id)a3 keyClass:(id)a4;
- (BOOL)migrateFromKVS;
- (BOOL)migrateView:(id)a3;
- (BOOL)removeItemWithKey:(id)a3 error:(id *)a4;
- (BOOL)resetWithKeybag:(id)a3 error:(id *)a4;
- (NSData)backupData;
- (NSData)keybag;
- (NSData)keybagDigest;
- (NSData)manifestHash;
- (NSDictionary)backupDict;
- (NSString)recordID;
- (NSString)viewName;
- (NSURL)url;
- (SecureBackupDB)db;
- (SecureBackupViewStore)initWithViewName:(id)a3 recordID:(id)a4;
- (void)closeStore;
- (void)setRecordID:(id)a3;
@end

@implementation SecureBackupViewStore

+ (id)URLForViewName:(id)a3
{
  id v3 = a3;
  v4 = sub_100004428();
  v5 = +[NSFileManager defaultManager];
  id v17 = 0;
  v6 = [v5 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v17];
  id v7 = v17;
  v8 = [v6 URLByAppendingPathComponent:@"com.apple.sbd" isDirectory:1];

  if (v4)
  {
    uint64_t v9 = [v8 URLByAppendingPathComponent:v4 isDirectory:1];

    v8 = (void *)v9;
  }
  v10 = [v8 URLByAppendingPathComponent:v3 isDirectory:1];

  id v16 = v7;
  unsigned __int8 v11 = [v5 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v16];
  id v12 = v16;

  if (v11)
  {
    id v13 = v10;
  }
  else
  {
    v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100049378();
    }

    id v13 = 0;
  }

  return v13;
}

- (SecureBackupViewStore)initWithViewName:(id)a3 recordID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SecureBackupViewStore;
  uint64_t v9 = [(SecureBackupViewStore *)&v19 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v9->_recordID, a4);
  uint64_t v11 = [(id)objc_opt_class() URLForViewName:v7];
  url = v10->_url;
  v10->_url = (NSURL *)v11;

  id v13 = [[SecureBackupSQLite alloc] initWithURL:v10->_url recordID:v8];
  db = v10->_db;
  v10->_db = (SecureBackupDB *)v13;

  objc_storeStrong((id *)&v10->_viewName, a3);
  if (!v10->_db || !v10->_url || !v10->_viewName) {
    goto LABEL_10;
  }
  v15 = [(SecureBackupViewStore *)v10 keybagDigest];

  if (v15) {
    goto LABEL_9;
  }
  id v16 = CloudServicesLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "no keybag digest found, migrating view %@", buf, 0xCu);
  }

  if ([(SecureBackupViewStore *)v10 migrateView:v10->_url]) {
LABEL_9:
  }
    id v17 = v10;
  else {
LABEL_10:
  }
    id v17 = 0;

  return v17;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 objectForKeyedSubscript:@"data"];
    id v8 = [v6 objectForKeyedSubscript:@"hash"];
    uint64_t v9 = [v6 objectForKeyedSubscript:@"class"];
    v10 = [(SecureBackupViewStore *)self db];
    unsigned __int8 v11 = [v10 addItem:v7 withKey:v8 forClass:v9 error:a4];
  }
  else
  {
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000493EC();
    }

    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"Unexpected item type for kSecBackupEventAdd";
    id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v13];
    }

    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)removeItemWithKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(SecureBackupViewStore *)self db];
    unsigned __int8 v8 = [v7 removeItemWithKey:v6 error:a4];
  }
  else
  {
    uint64_t v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100049454();
    }

    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"Unexpected item type for kSecBackupEventRemove";
    v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v10];
    }

    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSDictionary)backupDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(SecureBackupViewStore *)self db];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008F38;
  v7[3] = &unk_100071090;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndItemsUsingBlock:v7];

  return (NSDictionary *)v5;
}

- (NSData)backupData
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(SecureBackupViewStore *)self db];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000916C;
  v16[3] = &unk_100071090;
  id v5 = v3;
  id v17 = v5;
  [v4 enumerateKeysAndItemsUsingBlock:v16];

  if ([v5 count])
  {
    CFTypeRef cf = 0;
    DERData = (void *)CFPropertyListCreateDERData();
    if (!DERData)
    {
      id v7 = CloudServicesLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000494BC((uint64_t)&cf, v7, v8, v9, v10, v11, v12, v13);
      }

      if (cf) {
        CFRelease(cf);
      }
    }
  }
  else
  {
    DERData = 0;
  }

  return (NSData *)DERData;
}

- (BOOL)resetWithKeybag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v8 = [(SecureBackupViewStore *)self keybagDigest];
    uint64_t v9 = [v6 sha1Digest];
    unsigned int v10 = [v8 isEqual:v9];

    if (v10)
    {
      uint64_t v11 = CloudServicesLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "keybag hasn't changed, skipping DB reset", (uint8_t *)&v18, 2u);
      }
    }
    else
    {
      uint64_t v13 = [(SecureBackupViewStore *)self db];
      [v13 resetDBWithKeybag:v6];

      v14 = CloudServicesLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        NSErrorUserInfoKey v15 = [(SecureBackupViewStore *)self viewName];
        int v18 = 138412290;
        objc_super v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "reset manifest for view %@", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v11 = CloudServicesLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v16 = [v6 peerIDs];
        int v18 = 138412290;
        objc_super v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "backup keybag peers: %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10004952C();
    }

    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    CFStringRef v21 = @"Unexpected item type for resetWithKeybag";
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v11];
    }
  }

  return isKindOfClass & 1;
}

- (NSData)manifestHash
{
  v2 = [(SecureBackupViewStore *)self db];
  id v3 = [v2 manifestHash];

  return (NSData *)v3;
}

- (NSData)keybagDigest
{
  v2 = [(SecureBackupViewStore *)self db];
  id v3 = [v2 keybagDigest];

  return (NSData *)v3;
}

- (NSData)keybag
{
  v2 = [(SecureBackupViewStore *)self db];
  id v3 = [v2 keybag];

  return (NSData *)v3;
}

- (void)closeStore
{
  id v2 = [(SecureBackupViewStore *)self db];
  [v2 closeDB];
}

- (BOOL)migrateFromKVS
{
  id v3 = +[NSUbiquitousKeyValueStore defaultStore];
  v4 = [v3 dictionaryForKey:@"com.apple.securebackup.record"];
  [v4 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        id v16 = 0;
        unsigned __int8 v11 = [(SecureBackupViewStore *)self addItem:v10 error:&v16];
        id v12 = v16;

        if ((v11 & 1) == 0)
        {
          v14 = CloudServicesLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_100049594();
          }

          BOOL v13 = 0;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (BOOL)migrateView:(id)a3
{
  id v4 = a3;
  id v6 = [(SecureBackupViewStore *)self db];
  unsigned int v7 = [v6 sqliteExec:@"BEGIN TRANSACTION;"];

  if (!v7)
  {
    char v32 = 1;
    int v33 = 1;
    goto LABEL_36;
  }
  uint64_t v8 = [v4 lastPathComponent];
  uint64_t v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "migrating %@", buf, 0xCu);
  }

  unsigned int v10 = [v4 URLByAppendingPathComponent:@"keybag.plist"];
  id v11 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v10];
  id v12 = v11;
  if (!v11)
  {
    id v15 = 0;
    BOOL v34 = 1;
LABEL_34:
    v38 = [(SecureBackupViewStore *)self db];
    unsigned __int8 v39 = [v38 sqliteExec:@"COMMIT TRANSACTION;"];

    int v33 = 0;
    char v32 = v39 & v34;
    goto LABEL_35;
  }
  BOOL v13 = [v11 objectForKeyedSubscript:@"keybag"];
  id v53 = 0;
  unsigned int v14 = [(SecureBackupViewStore *)self resetWithKeybag:v13 error:&v53];
  id v15 = v53;

  if (!v14)
  {
    v35 = CloudServicesLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_100049664();
    }

    BOOL v34 = 0;
    goto LABEL_34;
  }
  id v16 = [(SecureBackupViewStore *)self db];
  unsigned int v17 = [v16 sqliteExec:@"SAVEPOINT migrate_start;"];

  if (v17)
  {
    long long v18 = +[NSFileManager defaultManager];
    id v52 = v15;
    long long v19 = [v18 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v52];
    id v47 = v52;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v21)
    {
      id v22 = v21;
      v42 = v18;
      v43 = v5;
      v45 = v12;
      v46 = v10;
      id v44 = v4;
      uint64_t v23 = *(void *)v49;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v27 = [v25 pathExtension];
          unsigned int v28 = [v27 isEqualToString:@"bt3"];

          if (v28)
          {
            v29 = [v25 lastPathComponent];
            v30 = [v29 stringByDeletingPathExtension];

            if (([v30 isEqualToString:@"manifest"] & 1) == 0
              && ![(SecureBackupViewStore *)self migrateBTree:v25 keyClass:v30])
            {
              if ([v8 isEqualToString:@"KeychainV0-tomb"]
                && [(SecureBackupViewStore *)self migrateFromKVS])
              {
                unsigned int v31 = 1;
                id v5 = v43;
                id v4 = v44;
                long long v18 = v42;
              }
              else
              {
                v36 = CloudServicesLog();
                id v5 = v43;
                id v4 = v44;
                long long v18 = v42;
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                  sub_1000495FC();
                }

                v37 = [(SecureBackupViewStore *)self db];
                unsigned int v31 = [v37 sqliteExec:@"ROLLBACK TO migrate_start;"];
              }
              id v12 = v45;
              unsigned int v10 = v46;
              goto LABEL_33;
            }
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      unsigned int v31 = 1;
      id v5 = v43;
      id v4 = v44;
      unsigned int v10 = v46;
      id v12 = v45;
      long long v18 = v42;
    }
    else
    {
      unsigned int v31 = 1;
    }
LABEL_33:

    BOOL v34 = v31 != 0;
    id v15 = v47;
    goto LABEL_34;
  }
  char v32 = 1;
  int v33 = 1;
LABEL_35:

LABEL_36:
  if (v33) {
    BOOL v40 = 0;
  }
  else {
    BOOL v40 = v32;
  }

  return v40;
}

- (BOOL)migrateBTree:(id)a3 keyClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = dbopen((const char *)[v8 fileSystemRepresentation], 0, 438, DB_BTREE, 0);
  if (v9)
  {
    unsigned int v10 = v9;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    int v12 = ((uint64_t (*)(DB *, uint64_t *, uint64_t *, uint64_t))v10->seq)(v10, &v38, &v36, 3);
    if (v12)
    {
      if ((v12 & 0x80000000) == 0)
      {
LABEL_4:
        ((void (*)(DB *))v10->close)(v10);
        BOOL v13 = CloudServicesLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v11 count];
          id v15 = [v11 count];
          id v16 = "s";
          *(_DWORD *)buf = 134218498;
          id v41 = v14;
          if (v15 == (id)1) {
            id v16 = "";
          }
          __int16 v42 = 2080;
          v43 = v16;
          __int16 v44 = 2112;
          id v45 = v7;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "migrated %lu item%s in class %@", buf, 0x20u);
        }

        BOOL v17 = 1;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v34 = (uint64_t)v8;
      do
      {
        if (v39 != 20)
        {
          v30 = CloudServicesLog();
          id v8 = (id)v34;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_10004988C(&v39, v34, v30);
          }
          goto LABEL_26;
        }
        id v21 = objc_alloc((Class)NSData);
        id v22 = [v21 initWithBytes:v38 length:v39];
        uint64_t v23 = [v11 objectForKeyedSubscript:v22];

        if (v23)
        {
          unsigned int v31 = CloudServicesLog();
          id v8 = (id)v34;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_100049824();
          }

          ((void (*)(DB *))v10->close)(v10);
          goto LABEL_30;
        }
        [v11 setObject:v22 forKeyedSubscript:v22];
        id v24 = objc_alloc((Class)NSData);
        id v25 = [v24 initWithBytesNoCopy:v36 length:v37 freeWhenDone:0];
        v46[0] = @"data";
        v46[1] = @"hash";
        v47[0] = v25;
        v47[1] = v22;
        v46[2] = @"class";
        v47[2] = v7;
        v26 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
        id v35 = 0;
        unsigned __int8 v27 = [(SecureBackupViewStore *)self addItem:v26 error:&v35];
        id v28 = v35;

        if ((v27 & 1) == 0)
        {
          int v33 = CloudServicesLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "failed to add item: %@", buf, 0xCu);
          }

          ((void (*)(DB *))v10->close)(v10);
          BOOL v17 = 0;
          id v8 = (id)v34;
          goto LABEL_31;
        }

        int v29 = ((uint64_t (*)(DB *, uint64_t *, uint64_t *, uint64_t))v10->seq)(v10, &v38, &v36, 7);
      }
      while (!v29);
      id v8 = (id)v34;
      if ((v29 & 0x80000000) == 0) {
        goto LABEL_4;
      }
    }
    v30 = CloudServicesLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100049794(v30);
    }
LABEL_26:

    ((void (*)(DB *))v10->close)(v10);
LABEL_30:
    BOOL v17 = 0;
    goto LABEL_31;
  }
  int v18 = *__error();
  long long v19 = CloudServicesLog();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if (v18 == 79)
  {
    if (v20) {
      sub_1000496CC(v19);
    }

    BOOL v17 = 1;
  }
  else
  {
    if (v20) {
      sub_100049710();
    }

    BOOL v17 = 0;
  }
LABEL_32:

  return v17;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)viewName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (SecureBackupDB)db
{
  return (SecureBackupDB *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_viewName, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

@end