@interface HKHealthDataclassOwner
+ (id)dataclasses;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6 withError:(id *)a7;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
@end

@implementation HKHealthDataclassOwner

+ (id)dataclasses
{
  uint64_t v4 = kAccountDataclassHealth;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  uint64_t v4 = +[_HKBehavior sharedBehavior];
  unsigned int v5 = [v4 isDeviceSupported];

  if (v5)
  {
    v6 = +[ACDataclassAction actionWithType:2];
    v7 = +[ACDataclassAction destructiveActionWithType:](ACDataclassAction, "destructiveActionWithType:", 3, v6);
    v11[1] = v7;
    v8 = +[ACDataclassAction actionWithType:0];
    v11[2] = v8;
    v9 = +[NSArray arrayWithObjects:v11 count:3];
  }
  else
  {
    v9 = &__NSArray0__struct;
  }
  return v9;
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  return [(HKHealthDataclassOwner *)self actionsForDisablingDataclassOnAccount:a3 forDataclass:a4];
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6 withError:(id *)a7
{
  id v11 = a3;
  v12 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v33 = a5;
  id v13 = a6;
  _HKInitializeLogging();
  v14 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v49 = v12;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing dataclass action %{public}@ for account %@", buf, 0x20u);
  }
  if ([v11 type] == (char *)&dword_0 + 3)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v49 = sub_5490;
    v50 = sub_54A0;
    id v51 = 0;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    id v16 = objc_alloc_init((Class)HKHealthStore);
    id v17 = [objc_alloc((Class)HKDatabaseControl) initWithHealthStore:v16];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_54A8;
    v34[3] = &unk_8278;
    v36 = &v38;
    v37 = buf;
    v18 = v15;
    v35 = v18;
    [v17 obliterateHealthDataWithOptions:1 completion:v34];
    dispatch_time_t v19 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v18, v19))
    {
      v20 = +[NSError hk_error:100 description:@"Timed out waiting for database to obliterate"];
      _HKInitializeLogging();
      v21 = HKLogSync;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = [v20 localizedDescription];
        sub_65A8((uint64_t)self, v22, v42, v21);
      }

      id v23 = v20;
      v24 = v23;
      if (v23)
      {
        if (a7) {
          *a7 = v23;
        }
        else {
          _HKLogDroppedError();
        }
      }

      char v25 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v26 = HKLogSync;
      if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
      {
        if (*((unsigned char *)v39 + 24)) {
          CFStringRef v27 = @"YES";
        }
        else {
          CFStringRef v27 = @"no";
        }
        uint64_t v28 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v42 = 138543874;
        v43 = self;
        __int16 v44 = 2114;
        CFStringRef v45 = v27;
        __int16 v46 = 2114;
        uint64_t v47 = v28;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Database obliterated with success=%{public}@, error=%{public}@", v42, 0x20u);
      }
      id v29 = *(id *)(*(void *)&buf[8] + 40);
      v30 = v29;
      if (v29)
      {
        if (a7) {
          *a7 = v29;
        }
        else {
          _HKLogDroppedError();
        }
      }

      char v25 = *((unsigned char *)v39 + 24) != 0;
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    char v25 = 1;
  }

  return v25;
}

@end