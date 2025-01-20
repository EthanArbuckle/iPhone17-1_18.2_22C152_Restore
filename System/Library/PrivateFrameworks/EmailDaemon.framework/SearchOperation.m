@interface SearchOperation
- (NSArray)mailboxes;
- (NSNumber)identifier;
- (NSProgress)progress;
- (SearchOperation)initWithDelegate:(id)a3 mailboxes:(id)a4 searchContext:(id)a5;
- (SearchOperationDelegate)delegate;
- (SourceSearchContext)searchContext;
- (SourceSearchContext)serverSearchContext;
- (id)_orderedEnumeratorForMailboxes:(id)a3 withAccount:(id)a4;
- (id)_orderedMailboxesForAccount:(id)a3;
- (id)_performRemoteSearchesForAccount:(id)a3;
- (id)_performRemoteSearchesWithMailboxes:(id)a3 accountID:(id)a4;
- (id)_searchableMailboxesByAccount;
- (id)accounts;
- (void)_performRemoteSearchForAccount:(id)a3 coordinator:(id)a4;
- (void)accountsChanged:(id)a3;
- (void)cancel;
- (void)main;
- (void)performRemoteSearches;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)updateWithAccounts:(id)a3;
@end

@implementation SearchOperation

- (SearchOperation)initWithDelegate:(id)a3 mailboxes:(id)a4 searchContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v41.receiver = self;
  v41.super_class = (Class)SearchOperation;
  v11 = [(SearchOperation *)&v41 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    v13 = (NSArray *)[v9 copy];
    mailboxes = v12->_mailboxes;
    v12->_mailboxes = v13;

    v15 = (SourceSearchContext *)[v10 copy];
    searchContext = v12->_searchContext;
    v12->_searchContext = v15;

    v17 = [v10 criterion];
    v18 = [v17 mailServerSideCriterion];

    if (v18)
    {
      v19 = [SourceSearchContext alloc];
      v20 = [v10 query];
      v21 = [v10 delegate];
      v22 = [v10 offset];
      v23 = -[SourceSearchContext initWithQuery:criterion:delegate:offset:useLocalIndex:sessionID:](v19, "initWithQuery:criterion:delegate:offset:useLocalIndex:sessionID:", v20, v18, v21, v22, [v10 useLocalIndex], objc_msgSend(v10, "sessionID"));

      serverSearchContext = v12->_serverSearchContext;
      v12->_serverSearchContext = v23;

      v12->_accountsLock._os_unfair_lock_opaque = 0;
      v25 = +[MailAccount activeAccounts];
      [(SearchOperation *)v12 updateWithAccounts:v25];

      uint64_t v26 = +[NSProgress discreteProgressWithTotalUnitCount:1];
      progress = v12->_progress;
      v12->_progress = (NSProgress *)v26;

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v12);
      v28 = v12->_progress;
      v35 = _NSConcreteStackBlock;
      uint64_t v36 = 3221225472;
      v37 = sub_1000B9494;
      v38 = &unk_10013A038;
      objc_copyWeak(&v39, &location);
      [(NSProgress *)v28 setCancellationHandler:&v35];
      v12->_remoteSearchCoordinatorsByAccountIdentifierLock._os_unfair_lock_opaque = 0;
      uint64_t v29 = objc_opt_new();
      remoteSearchCoordinatorsByAccountIdentifier = v12->_remoteSearchCoordinatorsByAccountIdentifier;
      v12->_remoteSearchCoordinatorsByAccountIdentifier = (NSMutableDictionary *)v29;

      v31 = +[NSNotificationCenter defaultCenter];
      v32 = +[DaemonAppController sharedController];
      [v31 addObserver:v12 selector:"accountsChanged:" name:ECMailAccountsDidChangeNotification object:v32];

      v33 = v12;
      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)cancel
{
  p_remoteSearchCoordinatorsByAccountIdentifierLock = &self->_remoteSearchCoordinatorsByAccountIdentifierLock;
  os_unfair_lock_lock(&self->_remoteSearchCoordinatorsByAccountIdentifierLock);
  [(NSMutableDictionary *)self->_remoteSearchCoordinatorsByAccountIdentifier enumerateKeysAndObjectsUsingBlock:&stru_10013E0C8];
  os_unfair_lock_unlock(p_remoteSearchCoordinatorsByAccountIdentifierLock);
  v4.receiver = self;
  v4.super_class = (Class)SearchOperation;
  [(SearchOperation *)&v4 cancel];
}

- (void)main
{
  v3 = [(SearchOperation *)self identifier];
  unsigned int v4 = [(SearchOperation *)self isCancelled];
  v5 = [(SearchOperation *)self searchContext];
  unsigned int v6 = [v5 useLocalIndex];

  v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(SearchOperation *)self serverSearchContext];
    int v13 = 138544130;
    v14 = v3;
    __int16 v15 = 1024;
    unsigned int v16 = v4;
    __int16 v17 = 1024;
    unsigned int v18 = v6;
    __int16 v19 = 1024;
    BOOL v20 = v8 != 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#search-manager SearchOperation [%{public}@] cancelled:%{BOOL}d useLocalIndex:%{BOOL}d hasServerSearchContext:%{BOOL}d", (uint8_t *)&v13, 0x1Eu);
  }
  if ((v4 & 1) == 0) {
    [(SearchOperation *)self performRemoteSearches];
  }
  id v9 = [(SearchOperation *)self delegate];
  [v9 searchOperationDidFinish:self];

  if (([(SearchOperation *)self isCancelled] & 1) == 0)
  {
    id v10 = [(SearchOperation *)self progress];
    id v11 = [v10 totalUnitCount];
    v12 = [(SearchOperation *)self progress];
    [v12 setCompletedUnitCount:v11];
  }
}

- (id)accounts
{
  p_accountsLock = &self->_accountsLock;
  os_unfair_lock_lock(&self->_accountsLock);
  unsigned int v4 = self->_accounts;
  os_unfair_lock_unlock(p_accountsLock);

  return v4;
}

- (void)updateWithAccounts:(id)a3
{
  id v4 = a3;
  +[LocalAccount localAccount];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000B9B18;
  unsigned int v16 = v24[3] = &unk_10013B2C0;
  v24[4] = v16;
  unsigned int v18 = objc_msgSend(v4, "ef_filter:", v24);

  os_unfair_lock_lock(&self->_accountsLock);
  __int16 v19 = self->_accounts;
  v5 = (NSSet *)[objc_alloc((Class)NSSet) initWithArray:v18];
  accounts = self->_accounts;
  self->_accounts = v5;

  v7 = self->_accounts;
  os_unfair_lock_unlock(&self->_accountsLock);
  id v8 = [(NSSet *)v19 mutableCopy];
  __int16 v17 = v7;
  [v8 minusSet:v7];
  os_unfair_lock_lock(&self->_remoteSearchCoordinatorsByAccountIdentifierLock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        remoteSearchCoordinatorsByAccountIdentifier = self->_remoteSearchCoordinatorsByAccountIdentifier;
        v14 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v12) uniqueID];
        __int16 v15 = [(NSMutableDictionary *)remoteSearchCoordinatorsByAccountIdentifier objectForKeyedSubscript:v14];

        [v15 cancel];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_remoteSearchCoordinatorsByAccountIdentifierLock);
}

- (void)accountsChanged:(id)a3
{
  id v4 = +[MailAccount activeAccounts];
  -[SearchOperation updateWithAccounts:](self, "updateWithAccounts:");
}

- (id)_searchableMailboxesByAccount
{
  v3 = +[NSMutableDictionary dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(SearchOperation *)self mailboxes];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = [v8 store];
        unsigned __int8 v10 = [v9 canFetchSearchResults];

        if (v10)
        {
          uint64_t v11 = [v8 account];
          v12 = [v11 uniqueID];

          if (!v12)
          {
            v14 = +[NSAssertionHandler currentHandler];
            [v14 handleFailureInMethod:a2 object:self file:@"SearchOperation.m" lineNumber:150 description:@"Need accountID for source"];
          }
          int v13 = [v3 objectForKeyedSubscript:v12];
          if (!v13)
          {
            int v13 = +[NSMutableArray array];
            [v3 setObject:v13 forKeyedSubscript:v12];
          }
          [v13 addObject:v8];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)performRemoteSearches
{
  v3 = [(SearchOperation *)self progress];
  [v3 becomeCurrentWithPendingUnitCount:1];
  id v4 = [(SearchOperation *)self _searchableMailboxesByAccount];
  id v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(SearchOperation *)self identifier];
      *(_DWORD *)buf = 138543618;
      v27 = v7;
      __int16 v28 = 1024;
      unsigned int v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] Begin remote searches for %u accounts (A)", buf, 0x12u);
    }
    +[NSProgress progressWithTotalUnitCount:v5];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000BA1F0;
    v23[3] = &unk_10013E0F0;
    v23[4] = self;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v24;
    [v4 enumerateKeysAndObjectsUsingBlock:v23];
  }
  else
  {
    id v9 = [(SearchOperation *)self mailboxes];
    id v10 = [v9 count];

    if (v10) {
      goto LABEL_7;
    }
    uint64_t v11 = [(SearchOperation *)self accounts];
    if ([v11 count])
    {
      v12 = MFLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = [(SearchOperation *)self identifier];
        *(_DWORD *)buf = 138543618;
        v27 = v13;
        __int16 v28 = 1024;
        unsigned int v29 = [v11 count];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] Begin remote searches for %u accounts (B)", buf, 0x12u);
      }
      v14 = +[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", [v11 count]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v11;
      id v15 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v20;
        do
        {
          long long v17 = 0;
          do
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v8);
            }
            long long v18 = -[SearchOperation _performRemoteSearchesForAccount:](self, "_performRemoteSearchesForAccount:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v17), (void)v19);
            [v14 addChild:v18 withPendingUnitCount:1];

            long long v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v15);
      }
    }
    else
    {
      id v8 = v11;
    }
  }

LABEL_7:
  objc_msgSend(v3, "resignCurrent", (void)v19);
}

- (id)_performRemoteSearchesWithMailboxes:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", [v6 count]);
  id v9 = +[MailAccount accountWithUniqueId:v7];
  id v10 = [(SearchOperation *)self accounts];
  unsigned __int8 v11 = [v10 containsObject:v9];

  if (v11)
  {
    v12 = [RemoteSearchCoordinator alloc];
    int v13 = [(SearchOperation *)self serverSearchContext];
    v14 = [(SearchOperation *)self identifier];
    id v15 = [(RemoteSearchCoordinator *)v12 initWithAccount:v9 searchContext:v13 logIdentifier:v14 progress:v8];

    uint64_t v16 = [(SearchOperation *)self searchContext];
    long long v17 = [v16 delegate];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v17);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000BA574;
    v22[3] = &unk_10013E118;
    objc_copyWeak(&v23, &location);
    [(RemoteSearchCoordinator *)v15 setFoundMessages:v22];
    [(SearchOperation *)self _orderedEnumeratorForMailboxes:v6 withAccount:v9];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000BA5E8;
    v20[3] = &unk_10013E140;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = v18;
    [(RemoteSearchCoordinator *)v15 setNextSearchableMailbox:v20];
    [(SearchOperation *)self _performRemoteSearchForAccount:v9 coordinator:v15];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    [v8 cancel];
  }

  return v8;
}

- (id)_performRemoteSearchesForAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[NSProgress discreteProgressWithTotalUnitCount:-1];
  id v6 = [(SearchOperation *)self accounts];
  unsigned __int8 v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    [v5 cancel];
    goto LABEL_9;
  }
  id v8 = [RemoteSearchCoordinator alloc];
  id v9 = [(SearchOperation *)self serverSearchContext];
  id v10 = [(SearchOperation *)self identifier];
  unsigned __int8 v11 = [(RemoteSearchCoordinator *)v8 initWithAccount:v4 searchContext:v9 logIdentifier:v10 progress:v5];

  v12 = [(SearchOperation *)self searchContext];
  int v13 = [v12 delegate];

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, v13);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000BAAE4;
  v42[3] = &unk_10013E118;
  __int16 v28 = &v43;
  objc_copyWeak(&v43, location);
  [(RemoteSearchCoordinator *)v11 setFoundMessages:v42];
  v14 = [v4 allMailMailboxUid];
  id v15 = v14;
  if (!v14) {
    goto LABEL_7;
  }
  uint64_t v16 = [v14 store];
  unsigned int v17 = [v16 canFetchSearchResults];

  if (!v17)
  {

LABEL_7:
    long long v19 = -[SearchOperation _orderedMailboxesForAccount:](self, "_orderedMailboxesForAccount:", v4, v13, &v43);
    long long v20 = [v19 objectEnumerator];
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2020000000;
    id v41 = (id)0xAAAAAAAAAAAAAAAALL;
    id v41 = [v19 count];
    [v5 setTotalUnitCount:v39[3]];
    id v21 = [(SearchOperation *)self identifier];
    long long v22 = [v4 uniqueID];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000BABB4;
    v29[3] = &unk_10013E190;
    id v23 = v20;
    id v30 = v23;
    id v31 = v5;
    v34 = &v38;
    id v24 = v21;
    id v32 = v24;
    id v33 = v22;
    id v25 = v22;
    [(RemoteSearchCoordinator *)v11 setNextSearchableMailbox:v29];

    _Block_object_dispose(&v38, 8);
    id v18 = 0;
    int v13 = v27;
    goto LABEL_8;
  }
  [v5 setTotalUnitCount:1];
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  LOBYTE(v41) = 1;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000BAB58;
  v35[3] = &unk_10013E168;
  v37 = &v38;
  id v18 = v15;
  id v36 = v18;
  [(RemoteSearchCoordinator *)v11 setNextSearchableMailbox:v35];

  _Block_object_dispose(&v38, 8);
LABEL_8:
  [(SearchOperation *)self _performRemoteSearchForAccount:v4 coordinator:v11];

  objc_destroyWeak(v28);
  objc_destroyWeak(location);

LABEL_9:

  return v5;
}

- (void)_performRemoteSearchForAccount:(id)a3 coordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueID];
  os_unfair_lock_lock(&self->_remoteSearchCoordinatorsByAccountIdentifierLock);
  [(NSMutableDictionary *)self->_remoteSearchCoordinatorsByAccountIdentifier setObject:v7 forKeyedSubscript:v8];
  os_unfair_lock_unlock(&self->_remoteSearchCoordinatorsByAccountIdentifierLock);
  if (([(SearchOperation *)self isCancelled] & 1) == 0)
  {
    id v9 = [(SearchOperation *)self accounts];
    unsigned int v10 = [v9 containsObject:v6];

    if (v10)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000BAF08;
      v11[3] = &unk_100139C48;
      v11[4] = self;
      [v7 setStopEarly:v11];
      [v7 performSearch];
    }
  }
  os_unfair_lock_lock(&self->_remoteSearchCoordinatorsByAccountIdentifierLock);
  [(NSMutableDictionary *)self->_remoteSearchCoordinatorsByAccountIdentifier setObject:0 forKeyedSubscript:v8];
  os_unfair_lock_unlock(&self->_remoteSearchCoordinatorsByAccountIdentifierLock);
}

- (id)_orderedEnumeratorForMailboxes:(id)a3 withAccount:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  id v21 = v5;
  if ([v5 count] == (id)1)
  {
    id v6 = [v5 objectEnumerator];
    goto LABEL_31;
  }
  long long v20 = objc_opt_new();
  id v23 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v7)
  {

    unsigned int v10 = 0;
    id v9 = 0;
    id v8 = 0;
    goto LABEL_24;
  }
  id v8 = 0;
  id v9 = 0;
  unsigned int v10 = 0;
  uint64_t v11 = *(void *)v25;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(obj);
      }
      int v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if (!v8 && [*(id *)(*((void *)&v24 + 1) + 8 * i) type] == (id)7)
      {
        id v8 = v13;
LABEL_17:
        id v14 = v13;
        continue;
      }
      if (!v9 && ([v13 isSentMailboxUid] & 1) != 0)
      {
        id v9 = v13;
        goto LABEL_17;
      }
      if (!v10 && [v13 type] == (id)5)
      {
        unsigned int v10 = v13;
        goto LABEL_17;
      }
      [v23 addObject:v13];
    }
    id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v7);

  if (v8) {
    [v20 addObject:v8];
  }
LABEL_24:
  if ([v23 count])
  {
    id v15 = +[MFMailMessageLibrary defaultInstance];
    uint64_t v16 = [v15 mailboxFrecencyController];

    unsigned int v17 = [v16 sortedArrayOfMailboxes:v23];
    [v20 addObjectsFromArray:v17];
  }
  if (v9) {
    [v20 addObject:v9];
  }
  if (v10) {
    [v20 addObject:v10];
  }
  id v6 = [v20 objectEnumerator];

LABEL_31:

  return v6;
}

- (id)_orderedMailboxesForAccount:(id)a3
{
  id v20 = a3;
  id v23 = +[NSMutableArray array];
  long long v26 = [v20 primaryMailboxUid];
  long long v24 = objc_opt_new();
  unsigned int v3 = [v20 isSyncingNotes];
  id v4 = +[MFMailMessageLibrary defaultInstance];
  id v5 = [v4 mailboxFrecencyController];

  id v21 = v5;
  long long v22 = [v5 sortedArrayOfMailboxesForAccount:v20];
  id v6 = objc_alloc((Class)NSMutableOrderedSet);
  id v7 = +[NSOrderedSet orderedSetWithArray:v22];
  id v8 = [v6 initWithOrderedSet:v7];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v8;
  id v9 = 0;
  unsigned int v10 = 0;
  id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v3)
        {
          unsigned __int8 v15 = [*(id *)(*((void *)&v27 + 1) + 8 * i) isNotesMailboxUid];
          if (v14 == v26) {
            char v16 = 1;
          }
          else {
            char v16 = v15;
          }
          if (v16) {
            continue;
          }
        }
        else if (v14 == v26)
        {
          continue;
        }
        if (!v9 && ([v14 isSentMailboxUid] & 1) != 0)
        {
          id v9 = v14;
LABEL_19:
          id v17 = v14;
          continue;
        }
        if (!v10
          && (+[MFMailboxUid isDraftsMailboxType:](MFMailboxUid, "isDraftsMailboxType:", [v14 mailboxType]) & 1) != 0)
        {
          unsigned int v10 = v14;
          goto LABEL_19;
        }
        [v24 addObject:v14];
      }
      id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  if (v26) {
    [v23 addObject:v26];
  }
  if ([v24 count]) {
    [v23 addObjectsFromArray:v24];
  }
  if (v9) {
    [v23 addObject:v9];
  }
  if (v10) {
    [v23 addObject:v10];
  }
  id v18 = v23;

  return v18;
}

- (SearchOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (SourceSearchContext)searchContext
{
  return self->_searchContext;
}

- (SourceSearchContext)serverSearchContext
{
  return self->_serverSearchContext;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_serverSearchContext, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteSearchCoordinatorsByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_accounts, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

@end