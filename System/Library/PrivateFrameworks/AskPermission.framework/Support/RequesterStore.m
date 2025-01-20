@interface RequesterStore
+ (RequesterStore)sharedStore;
- (BOOL)containsRequestWithIdentifier:(id)a3;
- (NSMutableDictionary)itemIdentifierStore;
- (NSMutableDictionary)requestIdentifierStore;
- (NSMutableDictionary)requestItems;
- (OS_dispatch_queue)accessQueue;
- (RequestStore)requestStore;
- (RequesterStore)init;
- (id)_migrationItems;
- (id)_requesterRequestWithStoreItem:(id)a3;
- (id)requestIdentifierWithItemIdentifier:(id)a3;
- (id)requestWithIdentifier:(id)a3;
- (id)requestsMatchingUniqueIdentifier:(id)a3;
- (void)_loadItemsIntoMemory;
- (void)_saveChanges;
- (void)clearExpiredRequests;
- (void)clearRequests;
- (void)storeRequest:(id)a3;
@end

@implementation RequesterStore

- (RequesterStore)init
{
  v15.receiver = self;
  v15.super_class = (Class)RequesterStore;
  v2 = [(RequesterStore *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AskPermission.RequesterStore", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    itemIdentifierStore = v2->_itemIdentifierStore;
    v2->_itemIdentifierStore = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestIdentifierStore = v2->_requestIdentifierStore;
    v2->_requestIdentifierStore = v7;

    v9 = [[RequestStore alloc] initWithFileName:@"UniqueRequestStore.plist"];
    requestStore = v2->_requestStore;
    v2->_requestStore = v9;

    v11 = v2->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019504;
    block[3] = &unk_1000385F0;
    v14 = v2;
    dispatch_sync(v11, block);
  }
  return v2;
}

+ (RequesterStore)sharedStore
{
  if (qword_100042B20 != -1) {
    dispatch_once(&qword_100042B20, &stru_100038C60);
  }
  v2 = (void *)qword_100042B28;
  return (RequesterStore *)v2;
}

- (void)clearExpiredRequests
{
  dispatch_queue_t v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    dispatch_queue_t v3 = +[APLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing expired requests", buf, 0xCu);
  }
  v6 = [(RequesterStore *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000196F0;
  block[3] = &unk_1000385F0;
  void block[4] = self;
  dispatch_sync(v6, block);
}

- (void)clearRequests
{
  dispatch_queue_t v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    dispatch_queue_t v3 = +[APLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing requests", buf, 0xCu);
  }
  v6 = [(RequesterStore *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019A68;
  block[3] = &unk_1000385F0;
  void block[4] = self;
  dispatch_sync(v6, block);
}

- (BOOL)containsRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(RequesterStore *)self requestItems];
  v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v11 requestIdentifier];
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          if (v8)
          {
            v14 = [v11 createdDate];
            objc_super v15 = [v8 createdDate];
            id v16 = [v14 compare:v15];

            if (v16 == (id)1)
            {
              id v17 = v11;

              id v8 = v17;
            }
          }
          else
          {
            id v8 = v11;
          }
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);

    if (!v8)
    {
      LOBYTE(v7) = 0;
      goto LABEL_17;
    }
    id v7 = [v8 createdDate];
    unsigned __int8 v18 = +[NSDate isDateExpired:v7];

    LOBYTE(v7) = v18 ^ 1;
    v6 = v8;
  }

LABEL_17:
  return (char)v7;
}

- (id)requestIdentifierWithItemIdentifier:(id)a3
{
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(RequesterStore *)self requestItems];
  v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unsigned int v13 = [v12 itemIdentifier];
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          if (v9)
          {
            objc_super v15 = [v12 createdDate];
            id v16 = [v9 createdDate];
            id v17 = [v15 compare:v16];

            if (v17 == (id)1)
            {
              id v18 = v12;

              id v9 = v18;
            }
          }
          else
          {
            id v9 = v12;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);

    if (v9)
    {
      v19 = [v9 createdDate];
      unsigned __int8 v20 = +[NSDate isDateExpired:v19];

      if ((v20 & 1) == 0)
      {
        long long v21 = [v9 requestIdentifier];
        goto LABEL_18;
      }
    }
  }
  else
  {

    id v9 = 0;
  }
  long long v21 = 0;
LABEL_18:

  return v21;
}

- (id)requestWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(RequesterStore *)self requestItems];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    goto LABEL_2;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = [(RequesterStore *)self requestItems];
  v11 = [v10 allValues];

  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v12)
  {

    id v6 = 0;
    goto LABEL_21;
  }
  id v13 = v12;
  long long v25 = self;
  id v6 = 0;
  uint64_t v14 = *(void *)v27;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v27 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      id v17 = [v16 requestIdentifier];
      if ([v17 isEqualToString:v4])
      {
      }
      else
      {
        id v18 = [v16 uniqueIdentifier];
        unsigned int v19 = [v18 isEqualToString:v4];

        if (!v19) {
          continue;
        }
      }
      if (v6)
      {
        unsigned __int8 v20 = [v16 createdDate];
        long long v21 = [v6 createdDate];
        id v22 = [v20 compare:v21];

        if (v22 == (id)1)
        {
          id v23 = v16;

          id v6 = v23;
        }
      }
      else
      {
        id v6 = v16;
      }
    }
    id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v13);

  self = v25;
  if (!v6)
  {
LABEL_21:
    id v9 = 0;
    goto LABEL_22;
  }
LABEL_2:
  id v7 = [v6 createdDate];
  unsigned __int8 v8 = +[NSDate isDateExpired:v7];

  if (v8) {
    goto LABEL_21;
  }
  id v9 = [(RequesterStore *)self _requesterRequestWithStoreItem:v6];
LABEL_22:

  return v9;
}

- (id)requestsMatchingUniqueIdentifier:(id)a3
{
  id v4 = [(RequesterStore *)self requestWithIdentifier:a3];
  id v21 = objc_alloc_init((Class)NSMutableArray);
  id v22 = self;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(RequesterStore *)self requestItems];
  id v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = [v11 requestIdentifier];
        id v13 = [v4 requestIdentifier];
        unsigned int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          objc_super v15 = [v11 createdDate];
          unsigned __int8 v16 = +[NSDate isDateExpired:v15];

          if ((v16 & 1) == 0)
          {
            id v17 = [(RequesterStore *)v22 _requesterRequestWithStoreItem:v11];
            id v18 = v17;
            if (v17 && [v17 status] == (id)-1) {
              [v21 addObject:v18];
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  unsigned int v19 = +[NSArray arrayWithArray:v21];

  return v19;
}

- (void)storeRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2114;
    id v16 = v4;
    id v7 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Storing request: %{public}@", buf, 0x16u);
  }
  id v8 = [[RequestStoreItem alloc] initWithRequest:v4];
  uint64_t v9 = [(RequestStoreItem *)v8 uniqueIdentifier];

  if (v9)
  {
    accessQueue = self->_accessQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001A4FC;
    v11[3] = &unk_100038668;
    v11[4] = self;
    id v12 = v8;
    dispatch_sync((dispatch_queue_t)accessQueue, v11);
  }
}

- (id)_requesterRequestWithStoreItem:(id)a3
{
  id v3 = a3;
  id v4 = [[ApprovalRequest alloc] initWithRequestStorageItem:v3];

  return v4;
}

- (void)_saveChanges
{
  id v3 = [(RequesterStore *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(RequesterStore *)self requestItems];
  id v6 = [v5 allKeys];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v10);
        id v12 = [(RequesterStore *)self requestItems];
        id v13 = [v12 objectForKeyedSubscript:v11];

        id v14 = [v13 compile];
        if (v14) {
          [v4 addObject:v14];
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  __int16 v15 = [(RequesterStore *)self requestStore];
  [v15 storeItems:v4];
}

- (void)_loadItemsIntoMemory
{
  id v3 = [(RequesterStore *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  long long v29 = self;
  id v4 = [(RequesterStore *)self requestStore];
  id v5 = [v4 items];

  id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [[RequestStoreItem alloc] initWithDictionary:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        id v13 = v12;
        if (v12)
        {
          id v14 = [(RequestStoreItem *)v12 createdDate];
          unsigned __int8 v15 = +[NSDate isDateExpired:v14];

          if ((v15 & 1) == 0)
          {
            long long v16 = [(RequestStoreItem *)v13 modifiedDate];
            unsigned int v17 = +[NSDate isDateInFuture:v16];

            if (v17)
            {
              long long v18 = +[NSDate date];
              [(RequestStoreItem *)v13 setModifiedDate:v18];
            }
            long long v19 = [(RequestStoreItem *)v13 uniqueIdentifier];
            [(NSMutableDictionary *)v6 setObject:v13 forKeyedSubscript:v19];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v9);
  }

  unsigned __int8 v20 = [(RequesterStore *)v29 _migrationItems];
  if ([v20 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v21 = [v20 allKeys];
    id v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v30 + 1) + 8 * (void)j);
          long long v27 = [v20 objectForKeyedSubscript:v26];
          [(NSMutableDictionary *)v6 setObject:v27 forKeyedSubscript:v26];
        }
        id v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v23);
    }
  }
  requestItems = v29->_requestItems;
  v29->_requestItems = v6;
}

- (id)_migrationItems
{
  uint64_t v24 = [[RequestStore alloc] initWithFileName:@"RequestStore.plist"];
  v2 = [(RequestStore *)v24 items];
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [[RequestStoreItem alloc] initWithDictionary:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        id v9 = v8;
        if (v8)
        {
          uint64_t v10 = [(RequestStoreItem *)v8 createdDate];
          unsigned __int8 v11 = +[NSDate isDateExpired:v10];

          if ((v11 & 1) == 0)
          {
            id v12 = [(RequestStoreItem *)v9 modifiedDate];
            unsigned int v13 = +[NSDate isDateInFuture:v12];

            if (v13)
            {
              id v14 = +[NSDate date];
              [(RequestStoreItem *)v9 setModifiedDate:v14];
            }
            uint64_t v15 = [(RequestStoreItem *)v9 uniqueIdentifier];
            if (!v15
              || (long long v16 = (void *)v15,
                  [(RequestStoreItem *)v9 uniqueIdentifier],
                  unsigned int v17 = objc_claimAutoreleasedReturnValue(),
                  id v18 = [v17 length],
                  v17,
                  v16,
                  !v18))
            {
              long long v19 = [(RequestStoreItem *)v9 requestIdentifier];
              unsigned __int8 v20 = [(RequestStoreItem *)v9 createdDate];
              id v21 = +[ApprovalRequest createUniqueIDFromRequestID:v19 andCreatedDate:v20];
              [(RequestStoreItem *)v9 setUniqueIdentifier:v21];
            }
            id v22 = [(RequestStoreItem *)v9 uniqueIdentifier];
            [v25 setObject:v9 forKeyedSubscript:v22];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }

  if ([v25 count]) {
    [(RequestStore *)v24 clearCache];
  }

  return v25;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSMutableDictionary)itemIdentifierStore
{
  return self->_itemIdentifierStore;
}

- (NSMutableDictionary)requestIdentifierStore
{
  return self->_requestIdentifierStore;
}

- (NSMutableDictionary)requestItems
{
  return self->_requestItems;
}

- (RequestStore)requestStore
{
  return self->_requestStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestStore, 0);
  objc_storeStrong((id *)&self->_requestItems, 0);
  objc_storeStrong((id *)&self->_requestIdentifierStore, 0);
  objc_storeStrong((id *)&self->_itemIdentifierStore, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end