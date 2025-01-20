@interface IXSAppRemovabilityManager
+ (id)sharedInstance;
+ (id)stringForRemovability:(unint64_t)a3;
- (BOOL)_onQueue_writeRemovabilityWithError:(id *)a3;
- (BOOL)clearRemovabilityStateForIdentity:(id)a3 error:(id *)a4;
- (BOOL)setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 error:(id *)a6;
- (IXDataStoreClock)removabilityChangeClock;
- (IXSAppRemovabilityManager)init;
- (NSMutableDictionary)allAppRemovability;
- (NSURL)removabilityURL;
- (OS_dispatch_queue)queue;
- (id)removabilityDataWithChangeClock:(id *)a3;
- (id)removabilityInfoForAllIdentities;
- (id)removabilityMetadataForAppWithIdentity:(id)a3;
- (unint64_t)removabilityForAppWithIdentity:(id)a3 client:(unint64_t)a4;
- (void)_enumerateRemovability:(id)a3;
- (void)_onQueue_handleStateChangeForIdentity:(id)a3 updatedRemovability:(unint64_t)a4;
- (void)_onQueue_removeLegacyRemovabilityFiles;
- (void)setAllAppRemovability:(id)a3;
- (void)setRemovabilityChangeClock:(id)a3;
@end

@implementation IXSAppRemovabilityManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008348C;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109FC0 != -1) {
    dispatch_once(&qword_100109FC0, block);
  }
  v2 = (void *)qword_100109FC8;

  return v2;
}

- (IXSAppRemovabilityManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)IXSAppRemovabilityManager;
  v2 = [(IXSAppRemovabilityManager *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.installcoordinationd.IXSAppRemovabilityManager.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    BOOL v20 = 0;
    id v19 = 0;
    v6 = sub_10003586C(&v19, &v20);
    v7 = (IXDataStoreClock *)v19;
    v8 = (NSMutableDictionary *)[v6 mutableCopy];
    allAppRemovability = v2->_allAppRemovability;
    v2->_allAppRemovability = v8;

    removabilityChangeClock = v2->_removabilityChangeClock;
    v2->_removabilityChangeClock = v7;
    v11 = v7;

    id v12 = [v6 count];
    v13 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100083620;
    block[3] = &unk_1000EB438;
    id v17 = v12;
    BOOL v18 = v20;
    v16 = v2;
    dispatch_sync(v13, block);
  }
  return v2;
}

+ (id)stringForRemovability:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"unknown";
  }
  else {
    return *(&off_1000EB520 + a3 - 1);
  }
}

- (void)_onQueue_handleStateChangeForIdentity:(id)a3 updatedRemovability:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(IXSAppRemovabilityManager *)self queue];
  dispatch_assert_queue_V2(v7);

  v8 = [v6 bundleID];
  v9 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v21 = "-[IXSAppRemovabilityManager _onQueue_handleStateChangeForIdentity:updatedRemovability:]";
    __int16 v22 = 2112;
    CFStringRef v23 = @"com.apple.installcoordination.AppRemovabilityChanged";
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Posting distributed notification %@ because removability for %@ has changed", buf, 0x20u);
  }

  v10 = +[NSDistributedNotificationCenter defaultCenter];
  v19[0] = v8;
  v11 = [(IXSAppRemovabilityManager *)self removabilityChangeClock];
  id v12 = [v11 notificationDictionary];
  v19[1] = v12;
  v18[2] = @"RemovabilityVal";
  v13 = +[NSNumber numberWithUnsignedInteger:a4];
  v19[2] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  if (([v6 isPersonalPersonaPlaceholder] & 1) == 0)
  {
    id v15 = [v14 mutableCopy];
    v16 = [v6 personaUniqueString];
    [v15 setObject:v16 forKeyedSubscript:@"PersonaUniqueString"];

    id v17 = [v15 copy];
    v14 = v17;
  }
  [v10 postNotificationName:@"com.apple.installcoordination.AppRemovabilityChanged" object:0 userInfo:v14 deliverImmediately:1];
}

- (NSURL)removabilityURL
{
  v2 = sub_100034F3C();
  if (!v2) {
    sub_10009A1B0();
  }

  return (NSURL *)v2;
}

- (id)removabilityMetadataForAppWithIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100083B70;
  v16 = sub_100083B80;
  id v17 = 0;
  v5 = [(IXSAppRemovabilityManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083B88;
  block[3] = &unk_1000E90F0;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (unint64_t)removabilityForAppWithIdentity:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 1;
  id v7 = [(IXSAppRemovabilityManager *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100083D0C;
  v11[3] = &unk_1000EB460;
  v11[4] = self;
  id v12 = v6;
  v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);

  unint64_t v9 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_100083B70;
  v40 = sub_100083B80;
  id v41 = 0;
  if (a3 - 2 < 2)
  {
    v13 = [(IXSAppRemovabilityManager *)self queue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000841F4;
    v24[3] = &unk_1000EB488;
    v24[4] = self;
    unint64_t v28 = a5;
    unint64_t v29 = a3;
    id v25 = v10;
    v26 = &v42;
    v27 = &v36;
    dispatch_sync(v13, v24);

    id v12 = v25;
    goto LABEL_6;
  }
  if (!a3)
  {
    unint64_t v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009A264();
    }

    uint64_t v16 = sub_10003DAE4((uint64_t)"-[IXSAppRemovabilityManager setRemovability:forAppWithIdentity:byClient:error:]", 223, @"IXErrorDomain", 4uLL, 0, 0, @"Setting app removability to \"unknown\" is not allowed", v15, v23);
    goto LABEL_13;
  }
  if (a3 != 1)
  {
    uint64_t v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009A1CC(a3, v17);
    }

    uint64_t v16 = sub_10003DAE4((uint64_t)"-[IXSAppRemovabilityManager setRemovability:forAppWithIdentity:byClient:error:]", 227, @"IXErrorDomain", 4uLL, 0, 0, @"Setting app removability to an unrecognized value (%lu) is not allowed", v18, a3);
LABEL_13:
    id v19 = (void *)v37[5];
    v37[5] = v16;

    goto LABEL_14;
  }
  v11 = [(IXSAppRemovabilityManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000840BC;
  block[3] = &unk_1000EB488;
  void block[4] = self;
  unint64_t v34 = a5;
  uint64_t v35 = 1;
  id v31 = v10;
  v32 = &v42;
  v33 = &v36;
  dispatch_sync(v11, block);

  id v12 = v31;
LABEL_6:

LABEL_14:
  int v20 = *((unsigned __int8 *)v43 + 24);
  if (a6 && !*((unsigned char *)v43 + 24))
  {
    *a6 = (id) v37[5];
    int v20 = *((unsigned __int8 *)v43 + 24);
  }
  BOOL v21 = v20 != 0;
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v21;
}

- (void)_onQueue_removeLegacyRemovabilityFiles
{
  v2 = [(IXSAppRemovabilityManager *)self queue];
  dispatch_assert_queue_V2(v2);

  v3 = sub_100035224();
  id v4 = +[IXFileManager defaultManager];
  id v20 = 0;
  unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v20];
  id v6 = v20;

  if ((v5 & 1) == 0)
  {
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009A2DC();
    }
  }
  id v8 = sub_10003512C();
  unint64_t v9 = +[IXFileManager defaultManager];
  id v19 = 0;
  unsigned __int8 v10 = [v9 removeItemAtURL:v8 error:&v19];
  id v11 = v19;

  if ((v10 & 1) == 0)
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009A2DC();
    }
  }
  v13 = sub_100035034();
  unint64_t v14 = +[IXFileManager defaultManager];
  id v18 = 0;
  unsigned __int8 v15 = [v14 removeItemAtURL:v13 error:&v18];
  id v16 = v18;

  if ((v15 & 1) == 0)
  {
    uint64_t v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009A2DC();
    }
  }
}

- (BOOL)_onQueue_writeRemovabilityWithError:(id *)a3
{
  unsigned __int8 v5 = [(IXSAppRemovabilityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(IXSAppRemovabilityManager *)self removabilityChangeClock];
  [v6 increment];
  id v7 = [(IXSAppRemovabilityManager *)self allAppRemovability];
  id v8 = sub_10003535C(v7, v6);

  if (v8)
  {
    unint64_t v9 = [(IXSAppRemovabilityManager *)self removabilityURL];
    id v20 = 0;
    unsigned __int8 v10 = [v8 writeToURL:v9 options:268435457 error:&v20];
    id v11 = v20;

    if (v10)
    {
      id v12 = 0;
      goto LABEL_13;
    }
    unsigned __int8 v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10009A3EC();
    }

    id v16 = [(IXSAppRemovabilityManager *)self removabilityURL];
    sub_10003DAE4((uint64_t)"-[IXSAppRemovabilityManager _onQueue_writeRemovabilityWithError:]", 289, @"IXErrorDomain", 1uLL, v11, 0, @"Failed to write app removability data to URL %@", v17, (uint64_t)v16);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a3) {
      goto LABEL_11;
    }
  }
  else
  {
    v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10009A374();
    }

    sub_10003DAE4((uint64_t)"-[IXSAppRemovabilityManager _onQueue_writeRemovabilityWithError:]", 279, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to convert app removability and change clock to data", v14, v19);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0;
    if (a3)
    {
LABEL_11:
      if (v12)
      {
        id v12 = v12;
        *a3 = v12;
      }
    }
  }
LABEL_13:

  return v12 == 0;
}

- (void)_enumerateRemovability:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(IXSAppRemovabilityManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000847E0;
  v7[3] = &unk_1000E9948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)removabilityInfoForAllIdentities
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100084974;
  v6[3] = &unk_1000EB4D8;
  id v7 = (id)objc_opt_new();
  id v3 = v7;
  [(IXSAppRemovabilityManager *)self _enumerateRemovability:v6];
  id v4 = [v3 copy];

  return v4;
}

- (BOOL)clearRemovabilityStateForIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v7 = [(IXSAppRemovabilityManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084B8C;
  block[3] = &unk_1000E9208;
  void block[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v17;
  dispatch_sync(v7, block);

  int v9 = *((unsigned __int8 *)v18 + 24);
  if (a4 && !*((unsigned char *)v18 + 24))
  {
    unsigned __int8 v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10009A484((uint64_t)v8, v10);
    }

    sub_10003DAE4((uint64_t)"-[IXSAppRemovabilityManager clearRemovabilityStateForIdentity:error:]", 358, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to find removability entry for %@", v11, (uint64_t)v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    int v9 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v12 = v9 != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (id)removabilityDataWithChangeClock:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100083B70;
  uint64_t v19 = sub_100083B80;
  id v20 = 0;
  uint64_t v9 = 0;
  unsigned __int8 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  BOOL v12 = sub_100083B70;
  v13 = sub_100083B80;
  id v14 = 0;
  unsigned __int8 v5 = [(IXSAppRemovabilityManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008509C;
  block[3] = &unk_1000E9710;
  void block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3) {
    *a3 = (id) v16[5];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

- (NSMutableDictionary)allAppRemovability
{
  return self->_allAppRemovability;
}

- (void)setAllAppRemovability:(id)a3
{
}

- (IXDataStoreClock)removabilityChangeClock
{
  return self->_removabilityChangeClock;
}

- (void)setRemovabilityChangeClock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_removabilityChangeClock, 0);

  objc_storeStrong((id *)&self->_allAppRemovability, 0);
}

@end