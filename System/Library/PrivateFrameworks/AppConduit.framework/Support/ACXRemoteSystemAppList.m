@interface ACXRemoteSystemAppList
+ (BOOL)supportsSecureCoding;
+ (id)availableSystemAppListForStorageBaseURL:(id)a3;
- (ACXRemoteSystemAppList)initWithCoder:(id)a3;
- (ACXRemoteSystemAppList)initWithStorageBaseURL:(id)a3;
- (BOOL)_onQueue_appIsInstallable:(id)a3 givenLocallyAvailableApps:(id)a4;
- (BOOL)needsSyncForCurrentOSBuildVersion:(id)a3;
- (BOOL)systemAppIsInstallableWithBundleID:(id)a3 error:(id *)a4;
- (NSArray)availableSystemApps;
- (NSArray)installableSystemApps;
- (NSDictionary)installableSystemAppToCompanionAppIdentifierMap;
- (NSMutableArray)waitersForInstallableList;
- (NSSet)bundleIDsOfAvailableSystemApps;
- (NSSet)bundleIDsOfInstallableSystemApps;
- (NSSet)bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability;
- (NSString)trackedOSBuildNumber;
- (NSURL)storageBaseURL;
- (OS_dispatch_queue)queue;
- (id)_onQueue_bundleIDsOfInstallableSystemAppsForLocallyAvailableApps:(id)a3;
- (id)installableSystemAppWithBundleID:(id)a3 error:(id *)a4;
- (void)_onQueue_callWaitersForInstallableSystemAppsWithLocallyAvailableApps:(id)a3;
- (void)_onQueue_saveData;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableSystemApps:(id)a3 bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability:(id)a4 forRemoteOSBuildVersion:(id)a5;
- (void)setBundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability:(id)a3;
- (void)setInstallableSystemAppBundleIDsExcludingCompanionState:(id)a3;
- (void)setStorageBaseURL:(id)a3;
- (void)waitForInstallableSystemAppBundleIDs:(id)a3;
@end

@implementation ACXRemoteSystemAppList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACXRemoteSystemAppList)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ACXRemoteSystemAppList;
  v5 = [(ACXRemoteSystemAppList *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"availableSystemApps"];
    availableSystemApps = v5->_availableSystemApps;
    v5->_availableSystemApps = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackedOSBuildNumber"];
    trackedOSBuildNumber = v5->_trackedOSBuildNumber;
    v5->_trackedOSBuildNumber = (NSString *)v10;

    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability"];
    bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability = v5->_bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability;
    v5->_bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability = (NSSet *)v14;

    uint64_t v16 = objc_opt_new();
    waitersForInstallableList = v5->_waitersForInstallableList;
    v5->_waitersForInstallableList = (NSMutableArray *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  availableSystemApps = self->_availableSystemApps;
  id v5 = a3;
  [v5 encodeObject:availableSystemApps forKey:@"availableSystemApps"];
  [v5 encodeObject:self->_trackedOSBuildNumber forKey:@"trackedOSBuildNumber"];
  [v5 encodeObject:self->_bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability forKey:@"bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability"];
}

- (ACXRemoteSystemAppList)initWithStorageBaseURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACXRemoteSystemAppList;
  uint64_t v6 = [(ACXRemoteSystemAppList *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storageBaseURL, a3);
    uint64_t v8 = objc_opt_new();
    waitersForInstallableList = v7->_waitersForInstallableList;
    v7->_waitersForInstallableList = (NSMutableArray *)v8;
  }
  return v7;
}

+ (id)availableSystemAppListForStorageBaseURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 URLByAppendingPathComponent:@"com.apple.AppConduit.ACXAvailableSystemAppList.plist" isDirectory:0];
  id v29 = 0;
  id v5 = +[NSDictionary ACX_dictionaryWithContentsOfURL:v4 options:0 error:&v29];
  id v6 = v29;
  if (!v5)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v27 = 0;
      id v10 = v3;
      objc_super v11 = [v4 path];
      v24 = v11;
      uint64_t v25 = (uint64_t)v6;
      MOLogWrite();
      id v9 = 0;
LABEL_27:
      id v15 = 0;
      id v17 = 0;
LABEL_28:

      id v18 = v6;
      id v3 = v10;
      id v5 = v27;
      goto LABEL_30;
    }
    id v9 = 0;
    goto LABEL_29;
  }
  v7 = [v5 objectForKeyedSubscript:@"AppListVersion"];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  id v12 = [v9 unsignedLongLongValue];
  if (v12 != (id)1)
  {
    id v16 = v12;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v27 = v5;
      id v10 = v3;
      objc_super v11 = [v4 path];
      uint64_t v25 = 1;
      v26 = v11;
      v24 = v16;
LABEL_26:
      MOLogWrite();
      goto LABEL_27;
    }
LABEL_29:
    id v15 = 0;
    id v17 = 0;
    id v18 = v6;
    goto LABEL_30;
  }
  v13 = [v5 objectForKeyedSubscript:@"AppListData"];
  objc_opt_class();
  id v14 = v13;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  if (!v15)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v27 = v5;
      id v10 = v3;
      objc_super v11 = [v4 path];
      v24 = v11;
      goto LABEL_26;
    }
    goto LABEL_29;
  }
  id v28 = v6;
  id v17 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v15 error:&v28];
  id v18 = v28;

  if (v17)
  {
    id v19 = [objc_alloc((Class)objc_opt_class()) initWithCoder:v17];
    if (v19)
    {
      id v20 = v19;
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        v21 = [v19 trackedOSBuildNumber];
        [v4 path];
        uint64_t v25 = v24 = v21;
        MOLogWrite();
      }
      objc_msgSend(v20, "setStorageBaseURL:", v3, v24, v25);
      goto LABEL_34;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v27 = v5;
      id v10 = v3;
      objc_super v11 = [v4 path];
      v24 = v11;
      MOLogWrite();
      goto LABEL_43;
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v27 = v5;
      id v10 = v3;
      objc_super v11 = [v4 path];
      v24 = v11;
      uint64_t v25 = (uint64_t)v18;
      MOLogWrite();
      id v17 = 0;
LABEL_43:
      id v6 = v18;
      goto LABEL_28;
    }
    id v17 = 0;
  }
LABEL_30:
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  v22 = +[NSFileManager defaultManager];
  [v22 removeItemAtURL:v4 error:0];

  id v20 = [objc_alloc((Class)objc_opt_class()) initWithStorageBaseURL:v3];
LABEL_34:

  return v20;
}

- (OS_dispatch_queue)queue
{
  if (qword_1000A54C0 != -1) {
    dispatch_once(&qword_1000A54C0, &stru_10008C928);
  }
  v2 = (void *)qword_1000A54C8;

  return (OS_dispatch_queue *)v2;
}

- (void)_onQueue_saveData
{
  id v3 = [(ACXRemoteSystemAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 setOutputFormat:200];
  [(ACXRemoteSystemAppList *)self encodeWithCoder:v4];
  id v5 = [v4 encodedData];
  v13[0] = @"AppListVersion";
  v13[1] = @"AppListData";
  v14[0] = &off_100097558;
  v14[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v7 = [(ACXRemoteSystemAppList *)self storageBaseURL];
  id v8 = [v7 URLByAppendingPathComponent:@"com.apple.AppConduit.ACXAvailableSystemAppList.plist" isDirectory:0];

  if (v8)
  {
    id v12 = 0;
    unsigned __int8 v9 = objc_msgSend(v6, "ACX_writeToURL:format:options:error:", v8, 200, 268435457, &v12);
    id v10 = v12;
    if (v9)
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        goto LABEL_12;
      }
    }
    else if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3)
    {
      goto LABEL_12;
    }
    objc_super v11 = [v8 path];
    MOLogWrite();

LABEL_12:
    goto LABEL_13;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v10 = [(ACXRemoteSystemAppList *)self storageBaseURL];
    MOLogWrite();
    goto LABEL_12;
  }
LABEL_13:
}

- (NSArray)availableSystemApps
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100003C30;
  objc_super v11 = sub_100003C40;
  id v12 = 0;
  id v3 = [(ACXRemoteSystemAppList *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003C48;
  v6[3] = &unk_10008C950;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (BOOL)_onQueue_appIsInstallable:(id)a3 givenLocallyAvailableApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXRemoteSystemAppList *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 bundleIdentifier];
  id v10 = [(ACXRemoteSystemAppList *)self bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability];
  unsigned int v11 = [v10 containsObject:v9];

  BOOL v12 = v11
     && ([v6 applicationMode] != (id)1 || (objc_msgSend(v7, "containsObject:", v9) & 1) != 0);

  return v12;
}

- (NSArray)installableSystemApps
{
  id v3 = +[ACXAvailableApplicationManager sharedApplicationManager];
  id v4 = [v3 bundleIDsOfLocallyAvailableSystemApps];

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100003C30;
  id v16 = sub_100003C40;
  id v17 = (id)objc_opt_new();
  id v5 = [(ACXRemoteSystemAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003ED4;
  block[3] = &unk_10008C978;
  block[4] = self;
  unsigned int v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(v5, block);

  id v7 = [(id)v13[5] copy];
  _Block_object_dispose(&v12, 8);

  return (NSArray *)v7;
}

- (id)installableSystemAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100003C30;
  v31 = sub_100003C40;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100003C30;
  uint64_t v25 = sub_100003C40;
  id v26 = 0;
  id v7 = +[ACXAvailableApplicationManager sharedApplicationManager];
  unsigned int v8 = [v7 systemAppIsAvailableWithBundleID:v6 error:0];

  if (v8) {
    +[NSSet setWithObject:v6];
  }
  else {
  uint64_t v9 = +[NSSet set];
  }
  id v10 = [(ACXRemoteSystemAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000042BC;
  block[3] = &unk_10008C9A0;
  block[4] = self;
  id v19 = &v27;
  id v20 = &v21;
  id v11 = v6;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  dispatch_sync(v10, block);

  v13 = (void *)v22[5];
  if (a4 && !v13)
  {
    *a4 = (id) v28[5];
    v13 = (void *)v22[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)systemAppIsInstallableWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100003C30;
  uint64_t v29 = sub_100003C40;
  id v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v7 = +[ACXAvailableApplicationManager sharedApplicationManager];
  unsigned int v8 = [v7 systemAppIsAvailableWithBundleID:v6 error:0];

  if (v8) {
    +[NSSet setWithObject:v6];
  }
  else {
  uint64_t v9 = +[NSSet set];
  }
  id v10 = [(ACXRemoteSystemAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004778;
  block[3] = &unk_10008C9A0;
  block[4] = self;
  id v19 = &v25;
  id v20 = &v21;
  id v11 = v6;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = (id) v26[5];
    int v13 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (void)_onQueue_callWaitersForInstallableSystemAppsWithLocallyAvailableApps:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXRemoteSystemAppList *)self waitersForInstallableList];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(ACXRemoteSystemAppList *)self _onQueue_bundleIDsOfInstallableSystemAppsForLocallyAvailableApps:v4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unsigned int v8 = [(ACXRemoteSystemAppList *)self waitersForInstallableList];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v12) + 16))();
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    int v13 = [(ACXRemoteSystemAppList *)self waitersForInstallableList];
    [v13 removeAllObjects];
  }
}

- (void)setAvailableSystemApps:(id)a3 bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability:(id)a4 forRemoteOSBuildVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[ACXAvailableApplicationManager sharedApplicationManager];
  id v12 = [v11 bundleIDsOfLocallyAvailableSystemApps];

  int v13 = [(ACXRemoteSystemAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C98;
  block[3] = &unk_10008C9C8;
  block[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v22 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  dispatch_sync(v13, block);
}

- (NSString)trackedOSBuildNumber
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100003C30;
  uint64_t v11 = sub_100003C40;
  id v12 = 0;
  id v3 = [(ACXRemoteSystemAppList *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004FB8;
  v6[3] = &unk_10008C950;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (NSSet)bundleIDsOfAvailableSystemApps
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100003C30;
  uint64_t v11 = sub_100003C40;
  id v12 = (id)objc_opt_new();
  id v3 = [(ACXRemoteSystemAppList *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000050FC;
  v6[3] = &unk_10008C9F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (NSSet)bundleIDsOfInstallableSystemApps
{
  id v3 = +[ACXAvailableApplicationManager sharedApplicationManager];
  id v4 = [v3 bundleIDsOfLocallyAvailableSystemApps];

  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100003C30;
  id v16 = sub_100003C40;
  id v17 = 0;
  id v5 = [(ACXRemoteSystemAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000053D4;
  block[3] = &unk_10008CA18;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (NSSet *)v7;
}

- (id)_onQueue_bundleIDsOfInstallableSystemAppsForLocallyAvailableApps:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  availableSystemApps = self->_availableSystemApps;
  if (availableSystemApps)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = availableSystemApps;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (-[ACXRemoteSystemAppList _onQueue_appIsInstallable:givenLocallyAvailableApps:](self, "_onQueue_appIsInstallable:givenLocallyAvailableApps:", v12, v4, (void)v16))
          {
            int v13 = [v12 bundleIdentifier];
            [v5 addObject:v13];
          }
        }
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }

    id v5 = 0;
  }
  id v14 = objc_msgSend(v5, "copy", (void)v16);

  return v14;
}

- (void)setInstallableSystemAppBundleIDsExcludingCompanionState:(id)a3
{
  id v4 = a3;
  id v5 = +[ACXAvailableApplicationManager sharedApplicationManager];
  id v6 = [v5 bundleIDsOfLocallyAvailableSystemApps];

  id v7 = [(ACXRemoteSystemAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000056C8;
  block[3] = &unk_10008CA40;
  block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_sync(v7, block);
}

- (NSDictionary)installableSystemAppToCompanionAppIdentifierMap
{
  id v3 = +[ACXAvailableApplicationManager sharedApplicationManager];
  id v4 = [v3 bundleIDsOfLocallyAvailableSystemApps];

  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100003C30;
  long long v16 = sub_100003C40;
  id v17 = (id)objc_opt_new();
  id v5 = [(ACXRemoteSystemAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005948;
  block[3] = &unk_10008C978;
  block[4] = self;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(v5, block);

  id v7 = [(id)v13[5] copy];
  _Block_object_dispose(&v12, 8);

  return (NSDictionary *)v7;
}

- (BOOL)needsSyncForCurrentOSBuildVersion:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(ACXRemoteSystemAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005CC8;
  block[3] = &unk_10008CA68;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)waitForInstallableSystemAppBundleIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[ACXAvailableApplicationManager sharedApplicationManager];
  id v6 = [v5 bundleIDsOfLocallyAvailableSystemApps];

  id v7 = [(ACXRemoteSystemAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005EB0;
  block[3] = &unk_10008CA90;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_sync(v7, block);
}

- (NSSet)bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability
{
  return self->_bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability;
}

- (void)setBundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability:(id)a3
{
}

- (NSURL)storageBaseURL
{
  return self->_storageBaseURL;
}

- (void)setStorageBaseURL:(id)a3
{
}

- (NSMutableArray)waitersForInstallableList
{
  return self->_waitersForInstallableList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitersForInstallableList, 0);
  objc_storeStrong((id *)&self->_storageBaseURL, 0);
  objc_storeStrong((id *)&self->_bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability, 0);
  objc_storeStrong((id *)&self->_trackedOSBuildNumber, 0);

  objc_storeStrong((id *)&self->_availableSystemApps, 0);
}

@end