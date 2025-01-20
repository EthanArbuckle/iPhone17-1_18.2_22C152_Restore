@interface RemoteSearchOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)shouldStartSearchContext:(id)a3;
- (id)followUpContextForSearchContext:(id)a3 searchResult:(id)a4;
- (unint64_t)emitFoundMessagesForResult:(id)a3;
- (void)didFailToGetResultWithError:(id)a3 searchContext:(id)a4;
- (void)didGetResult:(id)a3 searchContext:(id)a4;
- (void)runForSearchContext:(id)a3;
- (void)start;
@end

@implementation RemoteSearchOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  if (self)
  {
    int v2 = atomic_load((unsigned __int8 *)&self->_state);
    LOBYTE(self) = v2 == 1;
  }
  return (char)self;
}

- (BOOL)isFinished
{
  if (self)
  {
    int v2 = atomic_load((unsigned __int8 *)&self->_state);
    LOBYTE(self) = v2 == 2;
  }
  return (char)self;
}

- (void)start
{
  if (([(RemoteSearchOperation *)self isCancelled] & 1) == 0)
  {
    sub_1000B78F0((unsigned __int8 *)self, 1u);
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v4 = self->_logPrefix;
        mailbox = self->_mailbox;
      }
      else
      {
        v4 = 0;
        mailbox = 0;
      }
      v6 = mailbox;
      v7 = [(MFMailboxUid *)v6 ef_publicDescription];
      int v9 = 138543618;
      v10 = v4;
      __int16 v11 = 2114;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] Begin search on mailbox %{public}@", (uint8_t *)&v9, 0x16u);
    }
    if (self) {
      searchContext = self->_searchContext;
    }
    else {
      searchContext = 0;
    }
    [(RemoteSearchOperation *)self runForSearchContext:searchContext];
  }
}

- (void)runForSearchContext:(id)a3
{
  id v4 = a3;
  sub_1000B7F98((uint64_t)self, 0);
  if (self) {
    ++self->_contextCount;
  }
  if ([(RemoteSearchOperation *)self shouldStartSearchContext:v4])
  {
    if (self) {
      mailbox = self->_mailbox;
    }
    else {
      mailbox = 0;
    }
    v6 = mailbox;
    v7 = [(MFMailboxUid *)v6 store];
    v8 = [v4 query];
    int v9 = [v4 criterion];
    v10 = [v4 offset];
    if (self) {
      BOOL useLocalIndex = self->_useLocalIndex;
    }
    else {
      BOOL useLocalIndex = 0;
    }
    v12 = [v7 storeSearchResultMatchingQuery:v8 criterion:v9 limit:500 offset:v10 useLocalIndex:useLocalIndex];
    sub_1000B7F98((uint64_t)self, v12);

    if (self && self->_currentFuture)
    {
      if (self->_contextCount >= 2)
      {
        v13 = MFLogGeneral();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          logPrefix = self->_logPrefix;
          unint64_t contextCount = self->_contextCount;
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = logPrefix;
          __int16 v28 = 1024;
          int v29 = contextCount;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] context #%u", buf, 0x12u);
        }
      }
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      id v16 = self->_currentFuture;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000B7FB0;
      v24[3] = &unk_10013E058;
      objc_copyWeak(&v26, (id *)buf);
      id v17 = v4;
      id v25 = v17;
      [v16 addSuccessBlock:v24];

      id v18 = self->_currentFuture;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000B8034;
      v21[3] = &unk_10013ADE8;
      objc_copyWeak(&v23, (id *)buf);
      id v22 = v17;
      [v18 addFailureBlock:v21];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(RemoteSearchOperation *)self didFailToGetResultWithError:0 searchContext:v4];
    }
  }
  else
  {
    v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        v20 = self->_logPrefix;
      }
      else {
        v20 = 0;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] Done", buf, 0xCu);
    }

    sub_1000B78F0((unsigned __int8 *)self, 2u);
  }
}

- (BOOL)shouldStartSearchContext:(id)a3
{
  if (([(RemoteSearchOperation *)self isCancelled] & 1) == 0)
  {
    if (a3) {
      return 1;
    }
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v7 = self->_logPrefix;
        mailbox = self->_mailbox;
      }
      else
      {
        v7 = 0;
        mailbox = 0;
      }
      int v9 = mailbox;
      v10 = [(MFMailboxUid *)v9 ef_publicDescription];
      if (self) {
        int totalSearchResultCount = self->_totalSearchResultCount;
      }
      else {
        int totalSearchResultCount = 0;
      }
      int v13 = 138544130;
      v14 = v7;
      __int16 v15 = 2114;
      id v16 = v10;
      __int16 v17 = 1024;
      int v18 = totalSearchResultCount;
      __int16 v19 = 1024;
      unsigned int v20 = [(RemoteSearchOperation *)self isCancelled];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] finished search on mailbox %{public}@: Found %u messages, is cancelled: %{BOOL}d", (uint8_t *)&v13, 0x22u);
    }
    if (self) {
      progress = self->_progress;
    }
    else {
      progress = 0;
    }
    [(NSProgress *)progress setCompletedUnitCount:1];
  }
  return 0;
}

- (void)didGetResult:(id)a3 searchContext:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unint64_t v7 = [(RemoteSearchOperation *)self emitFoundMessagesForResult:v9];
  if (self) {
    self->_totalSearchResultCount += v7;
  }
  v8 = [(RemoteSearchOperation *)self followUpContextForSearchContext:v6 searchResult:v9];
  [(RemoteSearchOperation *)self runForSearchContext:v8];
}

- (void)didFailToGetResultWithError:(id)a3 searchContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        logPrefix = self->_logPrefix;
      }
      else {
        logPrefix = 0;
      }
      int v10 = 138543618;
      __int16 v11 = logPrefix;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] Failed with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(RemoteSearchOperation *)self runForSearchContext:0];
}

- (unint64_t)emitFoundMessagesForResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  id v6 = sub_1000B85E0((id *)&self->super.super.isa);
  [v6 remoteSearchOperation:self didFindResults:v5 != 0];

  if (v5)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    if (self) {
      searchContext = self->_searchContext;
    }
    else {
      searchContext = 0;
    }
    v8 = searchContext;
    id v9 = [(SourceSearchContext *)v8 criterion];
    unsigned __int8 v10 = [v9 requiresBody];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B8618;
    v13[3] = &unk_10013E080;
    unsigned __int8 v14 = v10;
    v13[4] = self;
    v13[5] = &v15;
    [v4 enumerateMailboxesAndRemoteIDsUsingBlock:v13];
    unint64_t v11 = v16[3];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)followUpContextForSearchContext:(id)a3 searchResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 continueOffset];
  unsigned __int8 v9 = [(RemoteSearchOperation *)self isCancelled];
  if (v8) {
    char v10 = v9;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) != 0 || self && self->_totalSearchResultCount >= 0x1F4)
  {
    unint64_t v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        __int16 v12 = self->_logPrefix;
        mailbox = self->_mailbox;
      }
      else
      {
        __int16 v12 = 0;
        mailbox = 0;
      }
      unsigned __int8 v14 = mailbox;
      uint64_t v15 = [(MFMailboxUid *)v14 ef_publicDescription];
      id v16 = (void *)v15;
      if (self) {
        int totalSearchResultCount = self->_totalSearchResultCount;
      }
      else {
        int totalSearchResultCount = 0;
      }
      int v30 = 138543874;
      v31 = v12;
      __int16 v32 = 2114;
      uint64_t v33 = v15;
      __int16 v34 = 1024;
      int v35 = totalSearchResultCount;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] mailbox %{public}@: Found %u messages, will stop", (uint8_t *)&v30, 0x1Cu);
    }
    uint64_t v18 = 0;
  }
  else
  {
    __int16 v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        unsigned int v20 = self->_logPrefix;
        v21 = self->_mailbox;
      }
      else
      {
        unsigned int v20 = 0;
        v21 = 0;
      }
      id v22 = v21;
      uint64_t v23 = [(MFMailboxUid *)v22 ef_publicDescription];
      v24 = (void *)v23;
      if (self) {
        int v25 = self->_totalSearchResultCount;
      }
      else {
        int v25 = 0;
      }
      int v30 = 138544130;
      v31 = v20;
      __int16 v32 = 2114;
      uint64_t v33 = v23;
      __int16 v34 = 1024;
      int v35 = v25;
      __int16 v36 = 2114;
      v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] mailbox %{public}@: Found %u messages, will continue searching with offset %{public}@", (uint8_t *)&v30, 0x26u);
    }
    id v26 = [SourceSearchContext alloc];
    unint64_t v11 = [v6 query];
    v27 = [v6 criterion];
    __int16 v28 = [v6 delegate];
    if (self) {
      self = (RemoteSearchOperation *)self->_useLocalIndex;
    }
    uint64_t v18 = -[SourceSearchContext initWithQuery:criterion:delegate:offset:useLocalIndex:sessionID:](v26, "initWithQuery:criterion:delegate:offset:useLocalIndex:sessionID:", v11, v27, v28, v8, self, [v6 sessionID]);
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopEarly, 0);
  objc_storeStrong(&self->_foundMessages, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);

  objc_storeStrong(&self->_currentFuture, 0);
}

@end