@interface ApproverStore
+ (ApproverStore)inMemoryStore;
+ (ApproverStore)sharedStore;
- (ApproverStore)init;
- (ApproverStore)initWithInMemoryStore:(BOOL)a3;
- (BOOL)containsApprovalRequestWithIdentifier:(id)a3;
- (NSMutableDictionary)approverStoreItems;
- (OS_dispatch_queue)accessQueue;
- (RequestStore)requestStore;
- (id)_approvalRequestWithStoreItem:(id)a3;
- (id)_migrationItems;
- (id)approvalRequestIdentifierWithItemIdentifier:(id)a3;
- (id)approvalRequestWithRequestIdentifier:(id)a3;
- (id)approvalRequestWithUniqueIdentifier:(id)a3;
- (id)approvalRequestsMatchingUniqueIdentifier:(id)a3;
- (id)getCachedApprovalRequests;
- (void)_loadItemsIntoMemory;
- (void)_saveChanges;
- (void)clearRequests;
- (void)removeApprovalRequestWithIdentifier:(id)a3;
- (void)setApproverStoreItems:(id)a3;
- (void)storeApprovalRequest:(id)a3;
@end

@implementation ApproverStore

- (ApproverStore)init
{
  return [(ApproverStore *)self initWithInMemoryStore:0];
}

- (ApproverStore)initWithInMemoryStore:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ApproverStore;
  v4 = [(ApproverStore *)&v14 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AskPermission.ApproverStore", 0);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v5;

    if (v3)
    {
      v7 = (ApproverStore *)objc_alloc_init((Class)NSMutableDictionary);
      [(ApproverStore *)v4 setApproverStoreItems:v7];
    }
    else
    {
      v8 = [[RequestStore alloc] initWithFileName:@"UniqueApproverStore.plist"];
      requestStore = v4->_requestStore;
      v4->_requestStore = v8;

      v10 = v4->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000576C;
      block[3] = &unk_1000385F0;
      v13 = v4;
      dispatch_sync(v10, block);
      v7 = v13;
    }
  }
  return v4;
}

- (NSMutableDictionary)approverStoreItems
{
  BOOL v3 = [(ApproverStore *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1000058A8;
  v12 = sub_1000058B8;
  id v13 = 0;
  v4 = [(ApproverStore *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000058C0;
  v7[3] = &unk_100038640;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSMutableDictionary *)v5;
}

- (void)setApproverStoreItems:(id)a3
{
  id v4 = a3;
  id v5 = [(ApproverStore *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(ApproverStore *)self accessQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000059A0;
  v8[3] = &unk_100038668;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

+ (ApproverStore)inMemoryStore
{
  if (qword_100042AA0 != -1) {
    dispatch_once(&qword_100042AA0, &stru_1000386A8);
  }
  v2 = (void *)qword_100042AA8;
  return (ApproverStore *)v2;
}

+ (ApproverStore)sharedStore
{
  if (qword_100042AB0 != -1) {
    dispatch_once(&qword_100042AB0, &stru_1000386C8);
  }
  v2 = (void *)qword_100042AB8;
  return (ApproverStore *)v2;
}

- (void)clearRequests
{
  BOOL v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    BOOL v3 = +[APLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing requests", buf, 0xCu);
  }
  v6 = [(ApproverStore *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C28;
  block[3] = &unk_1000385F0;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (BOOL)containsApprovalRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ApproverStore *)self approverStoreItems];
  v6 = [(id)v5 objectForKeyedSubscript:v4];

  id v7 = [v6 createdDate];
  LOBYTE(v5) = +[NSDate isDateExpired:v7];

  return v5 ^ 1;
}

- (void)removeApprovalRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    uint64_t v5 = +[APLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v4;
    id v7 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing request. Request identifier: %{public}@", buf, 0x16u);
  }
  uint64_t v8 = [(ApproverStore *)self accessQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005E9C;
  v10[3] = &unk_100038668;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (id)approvalRequestIdentifierWithItemIdentifier:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(ApproverStore *)self approverStoreItems];
  v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 itemIdentifier];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = [v10 createdDate];
          unsigned __int8 v14 = +[NSDate isDateExpired:v13];

          if (v14)
          {
            id v7 = 0;
          }
          else
          {
            id v7 = [v10 requestIdentifier];
          }
          goto LABEL_13;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)approvalRequestWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ApproverStore *)self approverStoreItems];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v9 = +[APLogConfig sharedDaemonConfig];
    if (!v9)
    {
      id v9 = +[APLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2112;
      id v20 = v4;
      id v14 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Error finding request - %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_11;
  }
  id v7 = [v6 createdDate];
  unsigned int v8 = +[NSDate isDateExpired:v7];

  if (v8)
  {
    id v9 = +[APLogConfig sharedDaemonConfig];
    if (!v9)
    {
      id v9 = +[APLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      id v13 = [v6 createdDate];
      int v17 = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Request Item Expired - %@", (uint8_t *)&v17, 0x16u);
    }
LABEL_11:

    id v15 = 0;
    goto LABEL_13;
  }
  id v15 = [(ApproverStore *)self _approvalRequestWithStoreItem:v6];
LABEL_13:

  return v15;
}

- (id)approvalRequestsMatchingUniqueIdentifier:(id)a3
{
  id v4 = [(ApproverStore *)self approvalRequestWithUniqueIdentifier:a3];
  id v21 = objc_alloc_init((Class)NSMutableArray);
  v22 = self;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [(ApproverStore *)self approverStoreItems];
  v6 = [v5 allValues];

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
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = [v11 requestIdentifier];
        id v13 = [v4 requestIdentifier];
        unsigned int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          id v15 = [v11 createdDate];
          unsigned __int8 v16 = +[NSDate isDateExpired:v15];

          if ((v16 & 1) == 0)
          {
            int v17 = [(ApproverStore *)v22 _approvalRequestWithStoreItem:v11];
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

  __int16 v19 = +[NSArray arrayWithArray:v21];

  return v19;
}

- (id)approvalRequestWithRequestIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 componentsSeparatedByString:@"_"];
    if ([v5 count] == (id)2)
    {
      v6 = [v5 firstObject];
      v31 = [v5 lastObject];
    }
    else
    {
      v31 = 0;
      v6 = 0;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = [(ApproverStore *)self approverStoreItems];
    uint64_t v9 = [v8 allValues];

    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      id v11 = v10;
      v28 = v5;
      v30 = 0;
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned int v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "createdDate", v28);
          unsigned __int8 v16 = +[NSDate isDateExpired:v15];

          if ((v16 & 1) == 0)
          {
            int v17 = [v14 uniqueIdentifier];
            unsigned __int8 v18 = [v17 isEqualToString:v4];

            if (v18)
            {
              id v7 = [(ApproverStore *)self _approvalRequestWithStoreItem:v14];

              uint64_t v9 = v30;
              uint64_t v5 = v28;
              goto LABEL_24;
            }
            __int16 v19 = [v14 requestIdentifier];
            unsigned int v20 = [v19 isEqualToString:v31];

            if (v20) {
              BOOL v21 = v6 == 0;
            }
            else {
              BOOL v21 = 1;
            }
            if (!v21)
            {
              v22 = [v14 createdDate];
              [v22 timeIntervalSinceReferenceDate];
              double v24 = v23;

              [v6 doubleValue];
              if ((uint64_t)vabdd_f64(v24, v25) <= 5)
              {
                uint64_t v26 = [(ApproverStore *)self _approvalRequestWithStoreItem:v14];

                v30 = (void *)v26;
              }
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      uint64_t v5 = v28;
      id v7 = v30;
    }
    else
    {
      id v7 = 0;
    }
LABEL_24:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)getCachedApprovalRequests
{
  id v3 = [(ApproverStore *)self approverStoreItems];
  id v4 = [v3 allValues];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000685C;
  v7[3] = &unk_1000386F0;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "ams_mapWithTransformIgnoresNil:", v7);

  return v5;
}

- (void)storeApprovalRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(ApproverStore *)self accessQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000069E4;
    v9[3] = &unk_100038668;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(v5, v9);
  }
  else
  {
    v6 = +[APLogConfig sharedDaemonConfig];
    if (!v6)
    {
      v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = (id)objc_opt_class();
      id v8 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@: Error storing request. The request is missing!", buf, 0xCu);
    }
  }
}

- (id)_approvalRequestWithStoreItem:(id)a3
{
  id v3 = a3;
  id v4 = [[ApprovalRequest alloc] initWithApproverStorageItem:v3];

  return v4;
}

- (void)_saveChanges
{
  id v3 = [(ApproverStore *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_approverStoreItems allValues];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) compile];
        if (v10) {
          [v4 addObject:v10];
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v11 = [(ApproverStore *)self requestStore];
  [v11 storeItems:v4];
}

- (void)_loadItemsIntoMemory
{
  id v3 = [(ApproverStore *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  v29 = self;
  id v4 = [(ApproverStore *)self requestStore];
  uint64_t v5 = [v4 items];

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
        long long v12 = [[ApproverStoreItem alloc] initWithDictionary:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        long long v13 = v12;
        if (v12)
        {
          long long v14 = [(ApproverStoreItem *)v12 createdDate];
          unsigned __int8 v15 = +[NSDate isDateExpired:v14];

          if ((v15 & 1) == 0)
          {
            unsigned __int8 v16 = [(ApproverStoreItem *)v13 modifiedDate];
            unsigned int v17 = +[NSDate isDateInFuture:v16];

            if (v17)
            {
              unsigned __int8 v18 = +[NSDate date];
              [(ApproverStoreItem *)v13 setModifiedDate:v18];
            }
            __int16 v19 = [(ApproverStoreItem *)v13 uniqueIdentifier];
            [(NSMutableDictionary *)v6 setObject:v13 forKeyedSubscript:v19];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v9);
  }

  unsigned int v20 = [(ApproverStore *)v29 _migrationItems];
  if ([v20 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    BOOL v21 = [v20 allKeys];
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
          v27 = [v20 objectForKeyedSubscript:v26];
          [(NSMutableDictionary *)v6 setObject:v27 forKeyedSubscript:v26];
        }
        id v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v23);
    }
  }
  approverStoreItems = v29->_approverStoreItems;
  v29->_approverStoreItems = v6;
}

- (id)_migrationItems
{
  uint64_t v24 = [[RequestStore alloc] initWithFileName:@"ApproverStore.plist"];
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
        id v8 = [[ApproverStoreItem alloc] initWithDictionary:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        id v9 = v8;
        if (v8)
        {
          uint64_t v10 = [(ApproverStoreItem *)v8 createdDate];
          unsigned __int8 v11 = +[NSDate isDateExpired:v10];

          if ((v11 & 1) == 0)
          {
            long long v12 = [(ApproverStoreItem *)v9 modifiedDate];
            unsigned int v13 = +[NSDate isDateInFuture:v12];

            if (v13)
            {
              long long v14 = +[NSDate date];
              [(ApproverStoreItem *)v9 setModifiedDate:v14];
            }
            uint64_t v15 = [(ApproverStoreItem *)v9 uniqueIdentifier];
            if (!v15
              || (unsigned __int8 v16 = (void *)v15,
                  [(ApproverStoreItem *)v9 uniqueIdentifier],
                  unsigned int v17 = objc_claimAutoreleasedReturnValue(),
                  id v18 = [v17 length],
                  v17,
                  v16,
                  !v18))
            {
              __int16 v19 = [(ApproverStoreItem *)v9 requestIdentifier];
              unsigned int v20 = [(ApproverStoreItem *)v9 createdDate];
              BOOL v21 = +[ApprovalRequest createUniqueIDFromRequestID:v19 andCreatedDate:v20];
              [(ApproverStoreItem *)v9 setUniqueIdentifier:v21];
            }
            id v22 = [(ApproverStoreItem *)v9 uniqueIdentifier];
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

- (RequestStore)requestStore
{
  return self->_requestStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestStore, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_approverStoreItems, 0);
}

@end