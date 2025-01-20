@interface ACRemoteDataclassOwnersManager
- (ACRemoteDataclassOwnersManager)init;
- (id)_accountStore;
- (id)_dataclassOwnerBundles;
- (id)_dataclassToOwnerMap;
- (id)_ownerForDataclass:(id)a3;
- (void)_cacheDataclassOwnersLimitedToDataclass:(id)a3 withOwnerLoadBlock:(id)a4;
- (void)_decrementBusyCounterForAccount:(id)a3;
- (void)_incrementBusyCounterForAccount:(id)a3;
- (void)_setDataclassOwnerBundles:(id)a3;
- (void)_setOwner:(id)a3 forDataclass:(id)a4;
- (void)actionsForAddingAccount:(id)a3 affectingDataclass:(id)a4 completion:(id)a5;
- (void)actionsForDeletingAccount:(id)a3 affectingDataclass:(id)a4 completion:(id)a5;
- (void)actionsForDisablingDataclass:(id)a3 onAccount:(id)a4 completion:(id)a5;
- (void)actionsForEnablingDataclass:(id)a3 onAccount:(id)a4 completion:(id)a5;
- (void)isPerformingDataclassActionsForAccount:(id)a3 completion:(id)a4;
- (void)performDataclassActions:(id)a3 forAccount:(id)a4 withChildren:(id)a5 completion:(id)a6;
- (void)preloadDataclassOwnersWithCompletion:(id)a3;
@end

@implementation ACRemoteDataclassOwnersManager

- (ACRemoteDataclassOwnersManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ACRemoteDataclassOwnersManager;
  v2 = [(ACRemoteDataclassOwnersManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.accounts.dom.actions", v3);
    dataclassActionQueue = v2->_dataclassActionQueue;
    v2->_dataclassActionQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingActionBatches = v2->_pendingActionBatches;
    v2->_pendingActionBatches = v6;
  }
  return v2;
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    dispatch_queue_t v4 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (void)preloadDataclassOwnersWithCompletion:(id)a3
{
  dispatch_queue_t v4 = (void (**)(id, void))a3;
  v5 = sub_100005828();
  uint64_t v6 = _ACSignpostCreate();

  v7 = sub_100005828();
  v8 = v7;
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "DataclassPreload", (const char *)&unk_100007411, buf, 2u);
  }

  objc_super v9 = sub_100005828();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100005A24(v6, v9);
  }

  [(ACRemoteDataclassOwnersManager *)self _cacheDataclassOwnersLimitedToDataclass:0 withOwnerLoadBlock:0];
  v10 = _ACLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000059E0(v10);
  }

  _ACSignpostGetNanoseconds();
  v11 = sub_100005828();
  v12 = v11;
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v6, "DataclassPreload", (const char *)&unk_100007411, v14, 2u);
  }

  v13 = sub_100005828();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100005974();
  }

  v4[2](v4, 0);
}

- (void)actionsForAddingAccount:(id)a3 affectingDataclass:(id)a4 completion:(id)a5
{
  id v8 = a4;
  objc_super v9 = (void (**)(id, void *, void))a5;
  id v10 = a3;
  v11 = sub_100005828();
  os_signpost_id_t v12 = _ACSignpostCreate();

  v13 = sub_100005828();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v23 = 138543362;
    id v24 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ActionsForAdding", " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ", (uint8_t *)&v23, 0xCu);
  }

  v15 = sub_100005828();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100005B70();
  }

  v16 = [(ACRemoteDataclassOwnersManager *)self _accountStore];
  [v10 _setAccountStore:v16];

  v17 = [(ACRemoteDataclassOwnersManager *)self _ownerForDataclass:v8];
  v18 = [v17 actionsForAddingAccount:v10 forDataclass:v8];

  v19 = _ACLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100005B08();
  }

  _ACSignpostGetNanoseconds();
  v20 = sub_100005828();
  v21 = v20;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v12, "ActionsForAdding", (const char *)&unk_100007411, (uint8_t *)&v23, 2u);
  }

  v22 = sub_100005828();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100005A9C();
  }

  v9[2](v9, v18, 0);
}

- (void)actionsForDeletingAccount:(id)a3 affectingDataclass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  v11 = sub_100005828();
  os_signpost_id_t v12 = _ACSignpostCreate();

  v13 = sub_100005828();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ActionsForDeleting", " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ", buf, 0xCu);
  }

  v15 = sub_100005828();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100005C44();
  }

  v16 = [(ACRemoteDataclassOwnersManager *)self _accountStore];
  [v8 _setAccountStore:v16];

  v17 = [(ACRemoteDataclassOwnersManager *)self _ownerForDataclass:v9];
  if (objc_opt_respondsToSelector())
  {
    id v24 = 0;
    v18 = [v17 actionsForDeletingAccount:v8 forDataclass:v9 withError:&v24];
    id v19 = v24;
  }
  else if (objc_opt_respondsToSelector())
  {
    v18 = [v17 actionsForDeletingAccount:v8 forDataclass:v9];
    id v19 = 0;
  }
  else
  {
    id v19 = 0;
    v18 = 0;
  }
  v20 = _ACLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100005B08();
  }

  _ACSignpostGetNanoseconds();
  v21 = sub_100005828();
  v22 = v21;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v12, "ActionsForDeleting", (const char *)&unk_100007411, buf, 2u);
  }

  int v23 = sub_100005828();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100005BD8();
  }

  v10[2](v10, v18, v19);
}

- (void)actionsForEnablingDataclass:(id)a3 onAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  v11 = sub_100005828();
  os_signpost_id_t v12 = _ACSignpostCreate();

  v13 = sub_100005828();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ActionsForEnabling", " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ", buf, 0xCu);
  }

  v15 = sub_100005828();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100005D18();
  }

  v16 = [(ACRemoteDataclassOwnersManager *)self _accountStore];
  [v9 _setAccountStore:v16];

  v17 = [(ACRemoteDataclassOwnersManager *)self _ownerForDataclass:v8];
  if (objc_opt_respondsToSelector())
  {
    id v24 = 0;
    v18 = [v17 actionsForEnablingDataclassOnAccount:v9 forDataclass:v8 withError:&v24];
    id v19 = v24;
  }
  else if (objc_opt_respondsToSelector())
  {
    v18 = [v17 actionsForEnablingDataclassOnAccount:v9 forDataclass:v8];
    id v19 = 0;
  }
  else
  {
    id v19 = 0;
    v18 = 0;
  }
  v20 = _ACLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100005B08();
  }

  _ACSignpostGetNanoseconds();
  v21 = sub_100005828();
  v22 = v21;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v12, "ActionsForEnabling", (const char *)&unk_100007411, buf, 2u);
  }

  int v23 = sub_100005828();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100005CAC();
  }

  v10[2](v10, v18, v19);
}

- (void)actionsForDisablingDataclass:(id)a3 onAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  v11 = sub_100005828();
  os_signpost_id_t v12 = _ACSignpostCreate();

  v13 = sub_100005828();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ActionsForDisabling", " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ", buf, 0xCu);
  }

  v15 = sub_100005828();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100005DEC();
  }

  v16 = [(ACRemoteDataclassOwnersManager *)self _accountStore];
  [v9 _setAccountStore:v16];

  v17 = [(ACRemoteDataclassOwnersManager *)self _ownerForDataclass:v8];
  if (objc_opt_respondsToSelector())
  {
    id v24 = 0;
    v18 = [v17 actionsForDisablingDataclassOnAccount:v9 forDataclass:v8 withError:&v24];
    id v19 = v24;
  }
  else if (objc_opt_respondsToSelector())
  {
    v18 = [v17 actionsForDisablingDataclassOnAccount:v9 forDataclass:v8];
    id v19 = 0;
  }
  else
  {
    id v19 = 0;
    v18 = 0;
  }
  v20 = _ACLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100005B08();
  }

  _ACSignpostGetNanoseconds();
  v21 = sub_100005828();
  v22 = v21;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v12, "ActionsForDisabling", (const char *)&unk_100007411, buf, 2u);
  }

  int v23 = sub_100005828();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100005D80();
  }

  v10[2](v10, v18, v19);
}

- (void)performDataclassActions:(id)a3 forAccount:(id)a4 withChildren:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v35 = a6;
  v13 = sub_100005828();
  uint64_t v14 = _ACSignpostCreate();
  uint64_t v34 = v15;

  v16 = sub_100005828();
  v17 = v16;
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PerformActions", "actions: %@", buf, 0xCu);
  }

  v18 = sub_100005828();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100005E54((uint64_t)v10, v14, v18);
  }
  id v19 = v10;

  v20 = [(ACRemoteDataclassOwnersManager *)self _accountStore];
  [v11 _setAccountStore:v20];

  long long v47 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  id v21 = v12;
  id v22 = [v21 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v45;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v25);
        v27 = [(ACRemoteDataclassOwnersManager *)self _accountStore];
        [v26 _setAccountStore:v27];

        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v23);
  }

  [(ACRemoteDataclassOwnersManager *)self _incrementBusyCounterForAccount:v11];
  dataclassActionQueue = self->_dataclassActionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000043DC;
  block[3] = &unk_100008250;
  v29 = v19;
  id v37 = v19;
  id v38 = v11;
  v39 = self;
  id v40 = v21;
  uint64_t v42 = v14;
  uint64_t v43 = v34;
  id v41 = v35;
  id v30 = v35;
  id v31 = v21;
  id v32 = v11;
  id v33 = v29;
  dispatch_async((dispatch_queue_t)dataclassActionQueue, block);
}

- (void)isPerformingDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  id v12 = a3;
  uint64_t v6 = (void (**)(id, BOOL, void))a4;
  v7 = [(ACRemoteDataclassOwnersManager *)self _accountStore];
  [v12 _setAccountStore:v7];

  id v8 = self->_pendingActionBatches;
  objc_sync_enter(v8);
  pendingActionBatches = self->_pendingActionBatches;
  id v10 = [v12 identifier];
  id v11 = [(NSMutableDictionary *)pendingActionBatches objectForKey:v10];

  objc_sync_exit(v8);
  v6[2](v6, [v11 unsignedIntegerValue] != 0, 0);
}

- (void)_incrementBusyCounterForAccount:(id)a3
{
  id v12 = a3;
  dispatch_queue_t v4 = self->_pendingActionBatches;
  objc_sync_enter(v4);
  pendingActionBatches = self->_pendingActionBatches;
  uint64_t v6 = [v12 identifier];
  v7 = [(NSMutableDictionary *)pendingActionBatches objectForKey:v6];

  objc_sync_exit(v4);
  if (v7)
  {
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v7 unsignedIntegerValue] + 1);
    id v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = &off_100008330;
  }
  id v9 = self->_pendingActionBatches;
  objc_sync_enter(v9);
  id v10 = self->_pendingActionBatches;
  id v11 = [v12 identifier];
  [(NSMutableDictionary *)v10 setObject:v8 forKey:v11];

  objc_sync_exit(v9);
}

- (void)_decrementBusyCounterForAccount:(id)a3
{
  id v12 = a3;
  dispatch_queue_t v4 = self->_pendingActionBatches;
  objc_sync_enter(v4);
  pendingActionBatches = self->_pendingActionBatches;
  uint64_t v6 = [v12 identifier];
  v7 = [(NSMutableDictionary *)pendingActionBatches objectForKey:v6];

  objc_sync_exit(v4);
  if (v7 && [v7 unsignedIntegerValue])
  {
    uint64_t v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v7 unsignedIntegerValue] - 1);

    v7 = (void *)v8;
  }
  id v9 = self->_pendingActionBatches;
  objc_sync_enter(v9);
  if (v7)
  {
    id v10 = self->_pendingActionBatches;
    id v11 = [v12 identifier];
    [(NSMutableDictionary *)v10 setObject:v7 forKey:v11];
  }
  objc_sync_exit(v9);
}

- (id)_ownerForDataclass:(id)a3
{
  id v4 = a3;
  v5 = [(ACRemoteDataclassOwnersManager *)self _dataclassToOwnerMap];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = +[NSNull null];

    if (v6 == v7) {
      id v8 = 0;
    }
    else {
      id v8 = v6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = sub_100004610;
    uint64_t v15 = sub_100004620;
    id v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004F70;
    v10[3] = &unk_100008278;
    v10[4] = &v11;
    [(ACRemoteDataclassOwnersManager *)self _cacheDataclassOwnersLimitedToDataclass:v4 withOwnerLoadBlock:v10];
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  return v8;
}

- (void)_cacheDataclassOwnersLimitedToDataclass:(id)a3 withOwnerLoadBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void, id))a4;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [(ACRemoteDataclassOwnersManager *)self _dataclassOwnerBundles];
  id v40 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v40)
  {
    char v34 = 0;
    uint64_t v39 = *(void *)v46;
    id v37 = v6;
    id v35 = v7;
    while (1)
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v11 = [v9 principalClass];
        id v12 = _ACLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "\"Loading dataclasses for class %@...\"", buf, 0xCu);
        }

        uint64_t v13 = [v11 dataclasses];
        uint64_t v14 = _ACLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v53 = v11;
          __int16 v54 = 2112;
          v55 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "\"Loaded dataclasses for class %@: %@\"", buf, 0x16u);
        }

        if (v6)
        {
          if (([v13 containsObject:v6] & 1) == 0) {
            goto LABEL_33;
          }
          uint64_t v15 = _ACLogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v31 = [v9 bundlePath];
            *(_DWORD *)buf = 138412546;
            id v53 = v6;
            __int16 v54 = 2112;
            v55 = v31;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "\"Found owner of dataclass %@ at path %@\"", buf, 0x16u);
          }
          char v34 = 1;
        }
        else
        {
          id v16 = v7;
          v17 = v10;
          v18 = [(ACRemoteDataclassOwnersManager *)self _dataclassToOwnerMap];
          id v19 = [v13 firstObject];
          v20 = [v18 objectForKey:v19];

          if (v20)
          {
            id v10 = v17;
            v7 = v16;
            id v6 = v37;
            goto LABEL_33;
          }
          uint64_t v15 = _ACLogSystem();
          id v10 = v17;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_1000060A8(v50, v9, &v51, v15);
          }
        }

        id v21 = _ACLogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "\"Initializing dataclass owner class %@...\"", buf, 0xCu);
        }
        id v38 = v10;

        id v22 = objc_alloc_init((Class)v11);
        id v23 = _ACLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "\"Initialized dataclass owner class %@\"", buf, 0xCu);
        }

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v24 = v13;
        id v25 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v42;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v42 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
              id v30 = [(ACRemoteDataclassOwnersManager *)self _dataclassToOwnerMap];
              [v30 setObject:v22 forKey:v29];
            }
            id v26 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v26);
        }

        v7 = v35;
        if (v35) {
          v35[2](v35, v22);
        }

        id v6 = v37;
        id v10 = v38;
LABEL_33:
      }
      id v40 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
      if (!v40) {
        goto LABEL_37;
      }
    }
  }
  char v34 = 0;
LABEL_37:

  if (v6 && (v34 & 1) == 0)
  {
    id v32 = [(ACRemoteDataclassOwnersManager *)self _dataclassToOwnerMap];
    id v33 = +[NSNull null];
    [v32 setObject:v33 forKey:v6];
  }
}

- (void)_setDataclassOwnerBundles:(id)a3
{
}

- (id)_dataclassOwnerBundles
{
  dataclassOwnerBundles = self->_dataclassOwnerBundles;
  if (!dataclassOwnerBundles)
  {
    id v4 = _ACLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "\"ACRemoteDataclassOwnersManager is loading all dataclass owners!\"", v8, 2u);
    }

    v5 = +[ACDPluginLoader pluginBundlesAtSubpath:@"DataclassOwners"];
    id v6 = self->_dataclassOwnerBundles;
    self->_dataclassOwnerBundles = v5;

    dataclassOwnerBundles = self->_dataclassOwnerBundles;
  }

  return dataclassOwnerBundles;
}

- (void)_setOwner:(id)a3 forDataclass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACRemoteDataclassOwnersManager *)self _dataclassToOwnerMap];
  [v8 setObject:v7 forKey:v6];
}

- (id)_dataclassToOwnerMap
{
  dataclassToOwnerMap = self->_dataclassToOwnerMap;
  if (!dataclassToOwnerMap)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5 = self->_dataclassToOwnerMap;
    self->_dataclassToOwnerMap = v4;

    dataclassToOwnerMap = self->_dataclassToOwnerMap;
  }

  return dataclassToOwnerMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_pendingActionBatches, 0);
  objc_storeStrong((id *)&self->_dataclassActionQueue, 0);
  objc_storeStrong((id *)&self->_dataclassToOwnerMap, 0);

  objc_storeStrong((id *)&self->_dataclassOwnerBundles, 0);
}

@end