@interface GCGenericDeviceDB
@end

@implementation GCGenericDeviceDB

void __39___GCGenericDeviceDB_initWithProvider___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _os_activity_create(&dword_20AD04000, "[Generic Device DB/Config] Did Change", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v3 = WeakRetained[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __39___GCGenericDeviceDB_initWithProvider___block_invoke_2;
    block[3] = &unk_26BEC3CA8;
    v5 = WeakRetained;
    dispatch_async_and_wait(v3, block);

    os_activity_scope_leave(&state);
  }
}

uint64_t __39___GCGenericDeviceDB_initWithProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateConfigurationBundles");
}

void __39___GCGenericDeviceDB_initWithProvider___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __39___GCGenericDeviceDB_initWithProvider___block_invoke_4;
    block[3] = &unk_26BEC3CA8;
    v5 = WeakRetained;
    dispatch_async_and_wait(v3, block);
  }
}

void __39___GCGenericDeviceDB_initWithProvider___block_invoke_4(uint64_t a1)
{
  v2 = _os_activity_create(&dword_20AD04000, "[Generic Device DB/Config] Refresh", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(v2, &v3);
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateConfigurationBundles");
  os_activity_scope_leave(&v3);
}

void __37___GCGenericDeviceDB_modelForDevice___block_invoke(uint64_t a1)
{
}

void __51___GCGenericDeviceDB_preparedModelForDevice_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v6 = [v5 predicate];
  v7 = [*(id *)(a1 + 32) filteredArrayUsingPredicate:v6];
  if ([v7 count] == 1)
  {
    v8 = [v7 firstObject];
    objc_msgSend(v5, "setElementCookie:", objc_msgSend(v8, "elementCookie"));

LABEL_7:
    goto LABEL_8;
  }
  if ((unint64_t)[v7 count] < 2)
  {
    if (([v5 optional] & 1) == 0)
    {
      v21[0] = NSLocalizedDescriptionKey;
      v21[1] = NSLocalizedFailureReasonErrorKey;
      v22[0] = @"Error preparing model for device.";
      v15 = [v5 identifier];
      v16 = +[NSString stringWithFormat:@"Did not find required element matching predicate for '%@'.", v15];
      v22[1] = v16;
      v17 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      uint64_t v18 = +[NSError errorWithDomain:0x26BED8460 code:7 userInfo:v17];
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      *a3 = 1;
      goto LABEL_8;
    }
    [v5 setElementCookie:0];
    goto LABEL_7;
  }
  v23[0] = NSLocalizedDescriptionKey;
  v23[1] = NSLocalizedFailureReasonErrorKey;
  v24[0] = @"Error preparing model for device.";
  v9 = [v5 identifier];
  v10 = +[NSString stringWithFormat:@"Found multiple matching elements matching predicate for '%@'.", v9];
  v24[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  uint64_t v12 = +[NSError errorWithDomain:0x26BED8460 code:7 userInfo:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  *a3 = 1;
LABEL_8:
}

@end