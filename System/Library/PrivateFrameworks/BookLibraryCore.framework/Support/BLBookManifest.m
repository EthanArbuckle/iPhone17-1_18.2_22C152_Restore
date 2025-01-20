@interface BLBookManifest
+ (id)purchasedBookManifest;
+ (id)sharedPurchasedBookManifest;
+ (id)syncedBookManifest;
+ (void)unloadPurchaseManifest;
- (BLBookManifest)initWithManifestPath:(id)a3;
- (BOOL)removeManifestEntryWithDownloadPermalink:(id)a3;
- (BOOL)removeManifestEntryWithPackageHash:(id)a3;
- (BOOL)removeManifestEntryWithStoreItemID:(id)a3;
- (NSMutableDictionary)manifest;
- (NSString)manifestPath;
- (OS_dispatch_queue)dispatchQueue;
- (id)_entries;
- (id)_manifest;
- (id)_stringFromObject:(id)a3;
- (id)bookPathForAdamID:(id)a3 withPublicationVersion:(id)a4;
- (id)bookPathPermalink:(id)a3;
- (id)manifestEntriesWithProperty:(id)a3 equalToNumber:(id)a4 limitCount:(int64_t)a5;
- (id)manifestEntriesWithProperty:(id)a3 equalToValue:(id)a4 limitCount:(int64_t)a5;
- (id)manifestEntryForAdamID:(id)a3 withPublicationVersion:(id)a4;
- (void)_invalidateAfterExternalChange;
- (void)addManifestEntries:(id)a3;
- (void)addManifestEntry:(id)a3;
- (void)dealloc;
- (void)setDispatchQueue:(id)a3;
- (void)setManifest:(id)a3;
- (void)setManifestPath:(id)a3;
- (void)synchronizeData;
@end

@implementation BLBookManifest

- (BLBookManifest)initWithManifestPath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLBookManifest;
  v5 = [(BLBookManifest *)&v13 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ibooks.BLService.BLBookManifest", v6);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = (NSString *)[v4 copy];
    manifestPath = v5->_manifestPath;
    v5->_manifestPath = v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_10004D8D8, @"com.apple.books.plist.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v5;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.books.plist.changed", 0);
  v4.receiver = self;
  v4.super_class = (Class)BLBookManifest;
  [(BLBookManifest *)&v4 dealloc];
}

+ (void)unloadPurchaseManifest
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"BLManifestTestEnv"];

  if (v3)
  {
    objc_super v4 = (void *)qword_1001C81A0;
    qword_1001C81A0 = 0;
  }
}

+ (id)purchasedBookManifest
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"BLManifestTestEnv"];

  if (v3)
  {
    objc_super v4 = +[IMLibraryPlist libraryPlistWithKind:1];
    v5 = [BLBookManifest alloc];
    v6 = [v4 path];
    dispatch_queue_t v7 = [(BLBookManifest *)v5 initWithManifestPath:v6];
    v8 = (void *)qword_1001C81A0;
    qword_1001C81A0 = (uint64_t)v7;
  }
  else if (qword_1001C81B8 != -1)
  {
    dispatch_once(&qword_1001C81B8, &stru_1001A26A0);
  }
  v9 = (void *)qword_1001C81A0;

  return v9;
}

+ (id)sharedPurchasedBookManifest
{
  if (qword_1001C81C0 != -1) {
    dispatch_once(&qword_1001C81C0, &stru_1001A26C0);
  }
  id v2 = (id)qword_1001C81A8;
  unsigned int v3 = +[NSUserDefaults standardUserDefaults];
  objc_super v4 = [v3 valueForKey:@"BLLibrarySimulateMultiUser"];

  if (v4)
  {
    v5 = +[NSUserDefaults standardUserDefaults];
    unsigned int v6 = [v5 BOOLForKey:@"BLLibrarySimulateMultiUser"];

    if (v6)
    {
      dispatch_queue_t v7 = +[IMLibraryPlist libraryPlistWithKind:3];
      v8 = [v7 path];
      if (v8)
      {
        v9 = [BLBookManifest alloc];
        uint64_t v10 = [v7 path];
        v11 = [(BLBookManifest *)v9 initWithManifestPath:v10];

        id v2 = (id)v10;
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
      dispatch_queue_t v7 = v2;
    }

    id v2 = v11;
  }

  return v2;
}

+ (id)syncedBookManifest
{
  if (qword_1001C81C8 != -1) {
    dispatch_once(&qword_1001C81C8, &stru_1001A26E0);
  }
  id v2 = (void *)qword_1001C81B0;

  return v2;
}

- (void)addManifestEntry:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    v5 = +[NSArray arrayWithObjects:&v6 count:1];

    -[BLBookManifest addManifestEntries:](self, "addManifestEntries:", v5, v6);
  }
}

- (void)addManifestEntries:(id)a3
{
  id v4 = a3;
  v5 = [(BLBookManifest *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DF74;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)bookPathPermalink:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  v5 = [(BLBookManifest *)self manifestEntriesWithProperty:@"iTunesU Permlink" equalToValue:v4 limitCount:1];
  if ([v5 count] != (id)1)
  {
    id v8 = 0;
    goto LABEL_7;
  }
  id v6 = [v5 objectAtIndex:0];

  if (!v6)
  {
LABEL_5:
    id v8 = 0;
    goto LABEL_8;
  }
  dispatch_queue_t v7 = [v6 objectForKey:@"Path"];
  id v8 = [(BLBookManifest *)self _stringFromObject:v7];

  v5 = v6;
LABEL_7:

LABEL_8:

  return v8;
}

- (id)bookPathForAdamID:(id)a3 withPublicationVersion:(id)a4
{
  v5 = [(BLBookManifest *)self manifestEntryForAdamID:a3 withPublicationVersion:a4];
  id v6 = [v5 objectForKey:@"Path"];
  dispatch_queue_t v7 = [(BLBookManifest *)self _stringFromObject:v6];

  return v7;
}

- (id)manifestEntryForAdamID:(id)a3 withPublicationVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_8;
  }
  id v8 = [(BLBookManifest *)self manifestEntriesWithProperty:@"s" equalToValue:v6 limitCount:1];
  if ([v8 count] == (id)1)
  {
    id v9 = [v8 objectAtIndex:0];

    if (v9)
    {
      objc_opt_class();
      uint64_t v10 = [v9 objectForKey:@"Publication Version"];
      v11 = BUDynamicCast();

      v12 = 0;
      if (v7 && v11)
      {
        if ([v11 isEqualToNumber:v7])
        {
          id v9 = v9;
          v12 = v9;
        }
        else
        {
          v12 = 0;
        }
      }

      id v8 = v9;
      goto LABEL_12;
    }
LABEL_8:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_12:

LABEL_13:

  return v12;
}

- (id)manifestEntriesWithProperty:(id)a3 equalToValue:(id)a4 limitCount:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[NSMutableArray array];
  v11 = [(BLBookManifest *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E520;
  block[3] = &unk_1001A2708;
  block[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v12 = v10;
  id v21 = v12;
  int64_t v22 = a5;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, block);

  v15 = v21;
  id v16 = v12;

  return v16;
}

- (id)manifestEntriesWithProperty:(id)a3 equalToNumber:(id)a4 limitCount:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[NSMutableArray array];
  v11 = [(BLBookManifest *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E7EC;
  block[3] = &unk_1001A2708;
  block[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v12 = v10;
  id v21 = v12;
  int64_t v22 = a5;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, block);

  v15 = v21;
  id v16 = v12;

  return v16;
}

- (NSString)manifestPath
{
  return self->_manifestPath;
}

- (BOOL)removeManifestEntryWithStoreItemID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(BLBookManifest *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EB4C;
  block[3] = &unk_1001A2228;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)removeManifestEntryWithDownloadPermalink:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(BLBookManifest *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EE44;
  block[3] = &unk_1001A2228;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)removeManifestEntryWithPackageHash:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(BLBookManifest *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F120;
  block[3] = &unk_1001A2228;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)synchronizeData
{
  unsigned int v3 = [(BLBookManifest *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F394;
  block[3] = &unk_1001A0FE8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)_entries
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v3 = [(BLBookManifest *)self _manifest];
  objc_opt_class();
  id v4 = [v3 objectForKey:@"Books"];
  v5 = BUDynamicCast();

  if (!v5)
  {
    objc_opt_class();
    id v6 = [v3 objectForKey:@"Purchases"];
    v5 = BUDynamicCast();
  }

  return v5;
}

- (void)_invalidateAfterExternalChange
{
  unsigned int v3 = BLBookInstallLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    manifestPath = self->_manifestPath;
    *(_DWORD *)buf = 138412290;
    id v8 = manifestPath;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[BookManifest]: Invalidating after external change: %@", buf, 0xCu);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F5C4;
  block[3] = &unk_1001A0FE8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (id)_manifest
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  manifest = self->_manifest;
  if (!manifest)
  {
    id v4 = objc_alloc_init((Class)NSFileManager);
    if (([v4 fileExistsAtPath:self->_manifestPath] & 1) == 0)
    {
      uint64_t v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      char v14 = self->_manifest;
      self->_manifest = v13;

LABEL_13:
      manifest = self->_manifest;
      goto LABEL_14;
    }
    id v5 = objc_alloc((Class)NSData);
    manifestPath = self->_manifestPath;
    id v19 = 0;
    id v7 = [v5 initWithContentsOfFile:manifestPath options:0 error:&v19];
    id v8 = v19;
    if (v7)
    {
      id v18 = 0;
      id v9 = +[NSPropertyListSerialization propertyListWithData:v7 options:2 format:0 error:&v18];
      id v10 = v18;

      uint64_t v11 = self->_manifest;
      self->_manifest = v9;

      if (self->_manifest)
      {
LABEL_12:

        goto LABEL_13;
      }
      id v12 = BLBookInstallLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[BookManifest]: Could not unserialize data: %{public}@", buf, 0xCu);
      }
      id v8 = v10;
    }
    else
    {
      id v12 = BLBookInstallLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[BookManifest]: Could not read data: %{public}@", buf, 0xCu);
      }
    }

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v16 = self->_manifest;
    self->_manifest = v15;

    id v10 = v8;
    goto LABEL_12;
  }
LABEL_14:

  return manifest;
}

- (id)_stringFromObject:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v4 = BUDynamicCast();
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v5 = BUDynamicCast();
      id v4 = [v5 stringValue];

      goto LABEL_10;
    }
    id v6 = BLDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2114;
      id v12 = (id)objc_opt_class();
      id v7 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%{public}@] could not be converted to neither an NSString nor an NSNumber", (uint8_t *)&v9, 0x16u);
    }
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

- (void)setManifestPath:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_manifestPath, 0);
}

@end