@interface NPKAccountChangeObserver
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation NPKAccountChangeObserver

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v21 = v9;
    __int16 v22 = 1024;
    int v23 = v8;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Account change observer: account %@ will change with type %d store %@ old account %@", buf, 0x26u);
  }

  id v13 = [objc_alloc((Class)PKACAccountChange) initWithChangeType:v8 newAccount:v9 oldAccount:v11];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "NPKAccountChangeObserver detected %{public}@", buf, 0xCu);
  }

  if ([v13 type] == (char *)&dword_0 + 3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "NPKAccountChangeObserver notifying agent about deletion.", buf, 2u);
    }

    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    id v15 = objc_alloc_init((Class)NPKCompanionAgentConnection);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_37B8;
    v18[3] = &unk_40E0;
    v16 = v14;
    v19 = v16;
    [v15 handlePendingiCloudSignoutWithCompletion:v18];
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "NPKAccountChangeObserver did notify agent about deletion.", buf, 2u);
    }
  }
  return 0;
}

@end