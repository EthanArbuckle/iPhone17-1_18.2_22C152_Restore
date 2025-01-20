@interface CPLCloudKitReschedulerCoordinator
+ (id)_cloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5;
+ (id)cloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5;
+ (void)_saveRegisteredTaskIdentifiers;
+ (void)beginRegisteringKnownReschedulerManager;
+ (void)dropCloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3;
+ (void)endRegisteringKnownReschedulerManagers;
@end

@implementation CPLCloudKitReschedulerCoordinator

+ (void)_saveRegisteredTaskIdentifiers
{
  if ((byte_1002CE4B0 & 1) == 0)
  {
    id v3 = [(id)qword_1002CE4B8 allObjects];
    v2 = +[NSUserDefaults standardUserDefaults];
    [v2 setObject:v3 forKey:@"_CPLRegisteredTaskIdentifiers"];
  }
}

+ (id)_cloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5
{
  id v7 = a3;
  uint64_t v8 = CPLLibraryIdentifierSystemLibrary;
  id v9 = a5;
  id v10 = a4;
  LODWORD(v8) = [v7 isEqualToString:v8];
  v11 = [CPLBGSTReschedulerManager alloc];
  if (v8)
  {
    v12 = +[CPLBGSTReschedulerManager taskIdentifierForSystemLibrary];
    +[CPLBGSTReschedulerManager groupNameForSystemLibrarySync];
  }
  else
  {
    v12 = +[CPLBGSTReschedulerManager taskIdentifierForLibraryIdentifier:v7];
    +[CPLBGSTReschedulerManager groupNameForAppLibrarySync];
  v13 = };
  v14 = [(CPLBGSTReschedulerManager *)v11 initWithTaskIdentifier:v12 involvedProcesses:v10 relatedApplications:v9 groupName:v13];

  return v14;
}

+ (id)cloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100030CD4;
  v31 = sub_100030CE4;
  id v32 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v19 = sub_100030CEC;
  v20 = &unk_100277320;
  id v12 = v9;
  SEL v25 = a2;
  id v26 = a1;
  id v21 = v12;
  v24 = &v27;
  id v13 = v10;
  id v22 = v13;
  id v14 = v11;
  id v23 = v14;
  v15 = v18;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002CE4C0);
  v19((uint64_t)v15);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002CE4C0);

  id v16 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v16;
}

+ (void)dropCloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_100030CD4;
  v12[4] = sub_100030CE4;
  id v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_10003113C;
  uint64_t v8 = &unk_100277348;
  id v10 = v12;
  id v4 = a3;
  id v9 = v4;
  id v11 = a1;
  v5 = v6;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002CE4C0);
  v7((uint64_t)v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002CE4C0);

  _Block_object_dispose(v12, 8);
}

+ (void)beginRegisteringKnownReschedulerManager
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  id v4 = sub_10003137C;
  v5 = &unk_100277368;
  SEL v6 = a2;
  id v7 = a1;
  v2 = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002CE4C0);
  v4((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002CE4C0);
}

+ (void)endRegisteringKnownReschedulerManagers
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  id v4 = sub_1000314A4;
  v5 = &unk_100277390;
  SEL v6 = v8;
  id v7 = a1;
  v2 = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002CE4C0);
  v4((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002CE4C0);

  _Block_object_dispose(v8, 8);
}

@end