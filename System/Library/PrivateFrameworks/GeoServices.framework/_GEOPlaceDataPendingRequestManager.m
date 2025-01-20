@interface _GEOPlaceDataPendingRequestManager
- (_GEOPlaceDataPendingRequestManager)init;
- (id)_finished:(id)a3 withResult:(id)a4 error:(id)a5;
- (id)identifiersRequested:(id)a3 forHandler:(id)a4;
- (void)_cleanUpFinishedHandlers:(id)a3;
- (void)_failAllPendingRequests;
- (void)didResolveItems:(id)a3 forIdentifiers:(id)a4;
- (void)failedToResolveIdentifiers:(id)a3 withError:(id)a4;
- (void)willUpdateExpiredIdentifiers:(id)a3;
@end

@implementation _GEOPlaceDataPendingRequestManager

- (_GEOPlaceDataPendingRequestManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_GEOPlaceDataPendingRequestManager;
  v2 = [(_GEOPlaceDataPendingRequestManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    requestHandlersPending = v2->_requestHandlersPending;
    v2->_requestHandlersPending = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)willUpdateExpiredIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = +[_GEOPlaceDataRequestHelper helperExpiredIdentifiers:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestHandlersPending, "objectForKeyedSubscript:", v11, (void)v13);
        if (!v12)
        {
          v12 = +[NSMutableArray arrayWithCapacity:1];
          [(NSMutableDictionary *)self->_requestHandlersPending setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v5];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)identifiersRequested:(id)a3 forHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSOrderedSet orderedSetWithArray:v6];
  uint64_t v9 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
  v20 = v6;
  v10 = +[_GEOPlaceDataRequestHelper helperForHandler:v7 identifiers:v6];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v17 = [(NSMutableDictionary *)self->_requestHandlersPending objectForKeyedSubscript:v16];
        if (v17)
        {
          v18 = (void *)v17;
          [v9 addObject:v16];
        }
        else
        {
          v18 = +[NSMutableArray arrayWithCapacity:1];
          [(NSMutableDictionary *)self->_requestHandlersPending setObject:v18 forKeyedSubscript:v16];
        }
        [v18 addObject:v10];
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  return v9;
}

- (id)_finished:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [(NSMutableDictionary *)self->_requestHandlersPending objectForKeyedSubscript:v8];
    if (v11)
    {
      id v12 = +[NSMutableArray array];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000463D4;
      v25[3] = &unk_100073328;
      id v26 = v8;
      id v27 = v9;
      id v28 = v10;
      id v13 = v12;
      id v29 = v13;
      [v11 enumerateObjectsUsingBlock:v25];
      uint64_t v14 = v29;
      id v15 = v13;
    }
    else
    {
      BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v17) {
        sub_10004D14C(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      id v15 = &__NSArray0__struct;
    }
  }
  else
  {
    id v15 = &__NSArray0__struct;
  }

  return v15;
}

- (void)_cleanUpFinishedHandlers:(id)a3
{
  id v4 = a3;
  if ([v4 count] && -[NSMutableDictionary count](self->_requestHandlersPending, "count"))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = [(NSMutableDictionary *)self->_requestHandlersPending allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          id v11 = [(NSMutableDictionary *)self->_requestHandlersPending objectForKeyedSubscript:v10];
          [v11 removeObjectsInArray:v4];
          if (![v11 count]) {
            [(NSMutableDictionary *)self->_requestHandlersPending removeObjectForKey:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)didResolveItems:(id)a3 forIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 count];
    id v9 = [v7 count];
    uint64_t v10 = +[NSMutableArray array];
    if (v8 == v9)
    {
      id v11 = 0;
    }
    else
    {
      id v11 = +[NSMutableIndexSet indexSet];
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000468CC;
    v31[3] = &unk_100073350;
    BOOL v36 = v8 == v9;
    id v12 = v7;
    id v32 = v12;
    id v13 = v11;
    id v33 = v13;
    id v14 = v10;
    id v34 = v14;
    v35 = self;
    [v6 enumerateObjectsUsingBlock:v31];
    [(_GEOPlaceDataPendingRequestManager *)self _cleanUpFinishedHandlers:v14];
    if (v8 != v9)
    {
      id v15 = [v13 count];
      if (v15 != [v12 count])
      {
        id v16 = [v12 mutableCopy];
        [v16 removeObjectsAtIndexes:v13];
        BOOL v17 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = [v16 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543362;
          v38 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[For MUID] Server error fetching muids: %{public}@", buf, 0xCu);
        }
        BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
        if (v19) {
          sub_10004D188(v19, v20, v21, v22, v23, v24, v25, v26);
        }
        if ([v6 count])
        {
          id v27 = 0;
        }
        else
        {
          id v27 = +[NSError GEOErrorWithCode:-7 reason:@"failed to return all requested ids"];
        }
        id v28 = +[NSSet setWithArray:v16];
        [(_GEOPlaceDataPendingRequestManager *)self failedToResolveIdentifiers:v28 withError:v27];
      }
    }
    id v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = [(NSMutableDictionary *)self->_requestHandlersPending allKeys];
      *(_DWORD *)buf = 138477827;
      v38 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Remaining requests in progress: %{private}@", buf, 0xCu);
    }
  }
}

- (void)failedToResolveIdentifiers:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = +[NSMutableArray array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = -[_GEOPlaceDataPendingRequestManager _finished:withResult:error:](self, "_finished:withResult:error:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v13), 0, v7, (void)v17);
          [v8 addObjectsFromArray:v14];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v11);
    }

    [(_GEOPlaceDataPendingRequestManager *)self _cleanUpFinishedHandlers:v8];
    id v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = [(NSMutableDictionary *)self->_requestHandlersPending allKeys];
      *(_DWORD *)buf = 138477827;
      uint64_t v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Remaining requests in progress: %{private}@", buf, 0xCu);
    }
  }
}

- (void)_failAllPendingRequests
{
  uint64_t v3 = +[NSMutableSet set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(NSMutableDictionary *)self->_requestHandlersPending allValues];
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v20 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_requestHandlersPending removeAllObjects];
  if ([v3 count])
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = [v3 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Found %d request helpers that should have finished by now", buf, 8u);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v3;
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v15), "failAllRemainingRequests", (void)v16);
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void).cxx_destruct
{
}

@end