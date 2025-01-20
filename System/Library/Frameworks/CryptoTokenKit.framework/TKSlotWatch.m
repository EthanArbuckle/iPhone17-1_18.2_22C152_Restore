@interface TKSlotWatch
+ (BOOL)smartCard:(id)a3 mightHandleAIDFromExtension:(id)a4 foundAID:(id *)a5;
+ (id)supportedAIDsOfExtension:(id)a3;
+ (void)parseAIDForAttribute:(id)a3 into:(id)a4;
- (NSString)name;
- (TKSlotWatch)initWithName:(id)a3 endpoint:(id)a4 slotType:(id)a5 watcher:(id)a6;
- (void)dealloc;
- (void)getTokenIDs:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)remove;
- (void)startObserving;
- (void)tokenArrived;
- (void)tokenRemoved;
@end

@implementation TKSlotWatch

- (TKSlotWatch)initWithName:(id)a3 endpoint:(id)a4 slotType:(id)a5 watcher:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v32.receiver = self;
  v32.super_class = (Class)TKSlotWatch;
  v15 = [(TKSlotWatch *)&v32 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_slotType, a5);
    objc_storeStrong((id *)&v16->_endpoint, a4);
    objc_storeWeak((id *)&v16->_slotWatcher, v14);
    v16->_previousSlotState = 1;
    uint64_t v17 = +[NSMutableDictionary dictionary];
    tokenConnections = v16->_tokenConnections;
    v16->_tokenConnections = (NSMutableDictionary *)v17;

    id v31 = 0;
    v19 = (TKSmartCardSlot *)[objc_alloc((Class)TKSmartCardSlot) initWithEndpoint:v12 error:&v31];
    id v20 = v31;
    smartCardSlot = v16->_smartCardSlot;
    v16->_smartCardSlot = v19;

    if (v16->_smartCardSlot)
    {
      id v22 = +[NSString stringWithFormat:@"slotwatch:%@", v11];
      [v22 UTF8String];
      uint64_t v23 = os_transaction_create();
      transaction = v16->_transaction;
      v16->_transaction = (OS_os_transaction *)v23;

      v25 = +[NSString stringWithFormat:@"slotwatch:%@", v11];
      v26 = (const char *)[(TKSlotWatch *)v25 UTF8String];
      v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v28 = dispatch_queue_create(v26, v27);
      queue = v16->_queue;
      v16->_queue = (OS_dispatch_queue *)v28;
    }
    else
    {
      v27 = sub_10000B334();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100014598((uint64_t)v20, v27);
      }
      v25 = v16;
      v16 = 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  smartCardSlot = self->_smartCardSlot;
  v4 = NSStringFromSelector("state");
  [(TKSmartCardSlot *)smartCardSlot removeObserver:self forKeyPath:v4 context:0];

  v5.receiver = self;
  v5.super_class = (Class)TKSlotWatch;
  [(TKSlotWatch *)&v5 dealloc];
}

- (void)startObserving
{
  smartCardSlot = self->_smartCardSlot;
  NSStringFromSelector("state");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(TKSmartCardSlot *)smartCardSlot addObserver:self forKeyPath:v4 options:7 context:0];
}

- (void)remove
{
  [(TKSlotWatch *)self tokenRemoved];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slotWatcher);
  [WeakRetained removeSlotWatch:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v7 = objc_msgSend(a5, "objectForKey:", NSKeyValueChangeNewKey, a4);
  id v8 = [v7 integerValue];

  int64_t previousSlotState = self->_previousSlotState;
  if (v8 != (id)2)
  {
    if (v8 == (id)previousSlotState)
    {
      int64_t previousSlotState = (int64_t)v8;
    }
    else if (v8)
    {
      if (v8 == (id)1)
      {
        queue = self->_queue;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10000B620;
        v12[3] = &unk_100020600;
        v12[4] = self;
        dispatch_async(queue, v12);
        int64_t previousSlotState = 1;
      }
      else
      {
        int64_t previousSlotState = (int64_t)v8;
        if (v8 == (id)4)
        {
          v10 = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000B618;
          block[3] = &unk_100020600;
          block[4] = self;
          dispatch_async(v10, block);
          int64_t previousSlotState = 4;
        }
      }
    }
    else
    {
      [(TKSlotWatch *)self remove];
      int64_t previousSlotState = 0;
    }
  }
  self->_int64_t previousSlotState = previousSlotState;
}

- (void)getTokenIDs:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(NSMutableDictionary *)v5->_tokenConnections allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) stringRepresentation];
        [v4 addObject:v10];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

+ (void)parseAIDForAttribute:(id)a3 into:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    if (v7) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  id v8 = v5;
  char v17 = 0;
  *(_WORD *)__str = 0;
  +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (unint64_t)[v8 length] >> 1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  v10 = [v9 UTF8String];
  int v11 = 0;
  while (1)
  {
    int v12 = *v10;
    if (v12 != 32)
    {
      if (!*v10) {
        goto LABEL_14;
      }
      __str[v11++] = v12;
      if (v11 == 2) {
        break;
      }
    }
LABEL_12:
    ++v10;
  }
  __endptr = 0;
  uint64_t v13 = strtol(__str, &__endptr, 16);
  if (v13 <= 255 && __endptr == &v17)
  {
    char v14 = v13;
    [v7 appendBytes:&v14 length:1];
    int v11 = 0;
    goto LABEL_12;
  }

  id v7 = 0;
LABEL_14:

  if (v7)
  {
LABEL_15:
    [v6 addObject:v7];
  }
LABEL_16:
}

+ (id)supportedAIDsOfExtension:(id)a3
{
  id v4 = [a3 attributes];
  id v5 = [v4 objectForKeyedSubscript:TKTokenClassDriverApplicationIDKey];

  if (v5)
  {
    id v6 = +[NSMutableArray array];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(a1, "parseAIDForAttribute:into:", *(void *)(*((void *)&v13 + 1) + 8 * i), v6, (void)v13);
          }
          id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
    else
    {
      [a1 parseAIDForAttribute:v5 into:v6];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)smartCard:(id)a3 mightHandleAIDFromExtension:(id)a4 foundAID:(id *)a5
{
  id v28 = a3;
  id v26 = a4;
  id v7 = objc_msgSend(a1, "supportedAIDsOfExtension:");
  id v8 = v7;
  if (v7)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = sub_10000BDF8;
    v42 = sub_10000BE08;
    id v43 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v35;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          id v33 = 0;
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_10000BE10;
          v29[3] = &unk_100020730;
          id v13 = v28;
          id v30 = v13;
          uint64_t v31 = v12;
          objc_super v32 = &v38;
          unsigned __int8 v14 = [v13 inSessionWithError:&v33 executeBlock:v29];
          id v15 = v33;
          if ((v14 & 1) == 0)
          {
            v18 = sub_10000B334();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = [v13 slot];
              v24 = [v23 name];
              *(_DWORD *)buf = 138543618;
              v45 = v24;
              __int16 v46 = 2114;
              id v47 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error connecting SmartCard in slot %{public}@: %{public}@", buf, 0x16u);
            }
            goto LABEL_16;
          }
          BOOL v16 = v39[5] == 0;

          if (!v16) {
            goto LABEL_16;
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    v19 = (void *)v39[5];
    BOOL v17 = v19 != 0;
    if (v19)
    {
      *a5 = v19;
    }
    else
    {
      id v20 = sub_10000B334();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = [v26 identifier];
        sub_100014610(v21, (uint64_t)buf, v20);
      }
    }
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (void)tokenArrived
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v39 = _os_activity_create((void *)&_mh_execute_header, "token inserted", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v39, &state);
  v3 = sub_10000B334();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100014660((uint64_t)self, v3, v4);
  }

  v42 = [(TKSmartCardSlot *)self->_smartCardSlot makeSmartCard];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slotWatcher);
  id v6 = [WeakRetained registry];

  id v7 = objc_loadWeakRetained((id *)&self->_slotWatcher);
  id v8 = [v7 registry];
  uint64_t v40 = [v8 beginTransaction:@"tokenArrived"];

  [v40 tokenExtensions];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  uint64_t v38 = v50 = 0u;
  id v9 = [v38 allValues];
  id v10 = [v9 countByEnumeratingWithState:&v49 objects:v60 count:16];
  char v11 = 0;
  if (v10)
  {
    uint64_t v46 = *(void *)v50;
    uint64_t v45 = TKTokenTypeKey;
    v41 = v6;
    id obj = v9;
    do
    {
      id v47 = v10;
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v50 != v46) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        unsigned __int8 v14 = [v13 attributes];
        id v15 = [v14 objectForKeyedSubscript:v45];
        unsigned __int8 v16 = [v15 isEqual:@"smartcard"];

        if (v16)
        {
          BOOL v17 = objc_opt_class();
          id v48 = 0;
          unsigned __int8 v18 = [v17 smartCard:v42 mightHandleAIDFromExtension:v13 foundAID:&v48];
          id v19 = v48;
          if (v18)
          {
            id v20 = [v6 driverCache];
            v44 = [v20 hostTokenDriverFromExtension:v13];

            v21 = [[TKHostTokenConnection alloc] initWithDriver:v44 slot:self->_endpoint AID:v19 registry:v6 error:0];
            if (v21)
            {
              id v22 = v19;
              uint64_t v23 = self;
              objc_sync_enter(v23);
              tokenConnections = self->_tokenConnections;
              v25 = [(TKHostTokenConnection *)v21 token];
              id v26 = [v25 tokenID];
              [(NSMutableDictionary *)tokenConnections setObject:v21 forKey:v26];

              id v19 = v22;
              v27 = sub_10000B334();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                name = self->_name;
                v29 = [v13 identifier];
                id v30 = [(TKHostTokenConnection *)v21 token];
                uint64_t v31 = [v30 tokenID];
                *(_DWORD *)buf = 138543874;
                v55 = name;
                __int16 v56 = 2114;
                v57 = v29;
                __int16 v58 = 2114;
                v59 = v31;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ is handling %{public}@", buf, 0x20u);

                id v6 = v41;
                id v19 = v22;
              }
              objc_sync_exit(v23);
              char v11 = 1;
              goto LABEL_19;
            }
            if (v11)
            {
              char v11 = 1;
            }
            else
            {
              sub_10000B334();
              uint64_t v23 = (TKSlotWatch *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_DEFAULT))
              {
                objc_super v32 = [v13 identifier];
                id v33 = self->_name;
                *(_DWORD *)buf = 138543618;
                v55 = v32;
                __int16 v56 = 2114;
                v57 = v33;
                _os_log_impl((void *)&_mh_execute_header, &v23->super, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot handle token in slot %{public}@", buf, 0x16u);
              }
              char v11 = 0;
LABEL_19:
            }
          }

          continue;
        }
      }
      id v9 = obj;
      id v10 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v10);
  }

  [v40 commit];
  if ((v11 & 1) == 0)
  {
    long long v34 = sub_10000B334();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      long long v35 = [(TKSmartCardSlot *)self->_smartCardSlot ATR];
      long long v36 = [(TKSmartCardSlot *)self->_smartCardSlot ATR];
      long long v37 = [v36 bytes];
      *(_DWORD *)buf = 138543618;
      v55 = v35;
      __int16 v56 = 2114;
      v57 = v37;
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "No token driver found for card %{public}@ (ATR: %{public}@)", buf, 0x16u);
    }
  }

  os_activity_scope_leave(&state);
}

- (void)tokenRemoved
{
  v3 = sub_10000B334();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000146D4((uint64_t)self, v3, v4);
  }

  id v5 = self;
  objc_sync_enter(v5);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(NSMutableDictionary *)v5->_tokenConnections allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        id WeakRetained = objc_loadWeakRetained((id *)&v5->_slotWatcher);
        uint64_t v12 = [WeakRetained registry];
        [v12 removeTokenWithTokenID:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)v5->_tokenConnections removeAllObjects];
  objc_sync_exit(v5);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_tokenConnections, 0);
  objc_storeStrong((id *)&self->_driverCache, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_destroyWeak((id *)&self->_slotWatcher);
  objc_storeStrong((id *)&self->_slotType, 0);

  objc_storeStrong((id *)&self->_smartCardSlot, 0);
}

@end