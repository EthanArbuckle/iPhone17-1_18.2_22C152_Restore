@interface AutoFetchCreateJobListPrivate
- (BOOL)isCompacting;
- (BOOL)isForced;
- (BOOL)isForegroundRequest;
- (BOOL)isUserRequested;
- (BOOL)shouldGrowFetchWindow;
- (BOOL)shouldLoadOlderMessages;
- (NSArray)jobList;
- (id)initForAccounts:(id)a3 accountResponsiveness:(id)a4 fetchType:(int)a5;
- (void)run;
@end

@implementation AutoFetchCreateJobListPrivate

- (id)initForAccounts:(id)a3 accountResponsiveness:(id)a4 fetchType:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    v17.receiver = self;
    v17.super_class = (Class)AutoFetchCreateJobListPrivate;
    v10 = [(AutoFetchCreateJobListPrivate *)&v17 init];
    if (v10)
    {
      v11 = (NSArray *)[v8 copy];
      accounts = v10->_accounts;
      v10->_accounts = v11;

      v13 = (NSMutableDictionary *)[v9 mutableCopy];
      accountResponsiveness = v10->_accountResponsiveness;
      v10->_accountResponsiveness = v13;

      v10->_fetchType = a5;
    }
    self = v10;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isUserRequested
{
  return (LOBYTE(self->_fetchType) >> 5) & 1;
}

- (BOOL)isForegroundRequest
{
  return (LOBYTE(self->_fetchType) >> 6) & 1;
}

- (BOOL)shouldGrowFetchWindow
{
  return LOBYTE(self->_fetchType) >> 7;
}

- (BOOL)shouldLoadOlderMessages
{
  return BYTE2(self->_fetchType) & 1;
}

- (BOOL)isCompacting
{
  return BYTE1(self->_fetchType) >> 7;
}

- (BOOL)isForced
{
  return self->_fetchType & 1;
}

- (void)run
{
  v2 = self;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obj = self->_accounts;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v62;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v62 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = [*(id *)(*((void *)&v61 + 1) + 8 * i) primaryMailboxUid];
        v7 = [v6 uniqueId];

        if (v7)
        {
          id v8 = [(NSMutableDictionary *)v2->_accountResponsiveness objectForKey:v7];
          BOOL v9 = v8 == 0;

          if (v9)
          {
            accountResponsiveness = v2->_accountResponsiveness;
            v11 = +[NSNumber numberWithDouble:0.0];
            [(NSMutableDictionary *)accountResponsiveness setObject:v11 forKey:v7];
          }
        }
      }
      id v3 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v73 count:16];
    }
    while (v3);
  }

  id objb = [(NSArray *)v2->_accounts sortedArrayUsingFunction:sub_10002AC1C context:v2->_accountResponsiveness];
  v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  jobList = v2->_jobList;
  v2->_jobList = v12;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obja = objb;
  id v44 = [obja countByEnumeratingWithState:&v57 objects:v72 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v58;
    v14 = &OBJC_IVAR___DaemonAppController__accountsProvider;
    do
    {
      for (j = 0; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v58 != v43) {
          objc_enumerationMutation(obja);
        }
        v15 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
        v45 = [v15 pushedMailboxUids];
        v16 = MFAutoFetchLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v17 = objc_msgSend(v15, "ef_publicDescription");
          id v18 = [v45 count];
          *(_DWORD *)buf = 138543618;
          v66 = v17;
          __int16 v67 = 2048;
          id v68 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ is pushing %lu folders", buf, 0x16u);
        }
        v19 = MFPowerLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v15, "ef_publicDescription");
          *(_DWORD *)buf = 138543362;
          v66 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Push Incoming] account=%{public}@", buf, 0xCu);
        }
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v50 = v45;
        id v21 = [v50 countByEnumeratingWithState:&v53 objects:v71 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v54;
          do
          {
            for (k = 0; k != v21; k = (char *)k + 1)
            {
              if (*(void *)v54 != v22) {
                objc_enumerationMutation(v50);
              }
              v24 = *(void **)(*((void *)&v53 + 1) + 8 * (void)k);
              if (![(AutoFetchCreateJobListPrivate *)v2 isUserRequested]
                && ![(AutoFetchCreateJobListPrivate *)v2 isForegroundRequest]
                && ![(AutoFetchCreateJobListPrivate *)v2 isForced])
              {
                v25 = (void *)qword_10016B818;
                v26 = [v24 fullPath];
                id v27 = [v25 objectForKeyedSubscript:v26];

                if (v27)
                {
                  double Current = CFAbsoluteTimeGetCurrent();
                  [v27 lastFetchTime];
                  if (Current - v29 < 60.0)
                  {
                    v30 = MFAutoFetchLog();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                    {
                      v31 = objc_msgSend(v24, "ef_publicDescription");
                      *(_DWORD *)buf = 138543362;
                      v66 = v31;
                      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ because it is too close to the last fetch", buf, 0xCu);
                    }
                    goto LABEL_40;
                  }
                }
              }
              v32 = MFAutoFetchLog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = objc_msgSend(v15, "ef_publicDescription");
                v34 = objc_msgSend(v24, "ef_publicDescription");
                *(_DWORD *)buf = 138543618;
                v66 = v33;
                __int16 v67 = 2114;
                id v68 = v34;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Preparing to autofetch %{public}@ mailbox %{public}@", buf, 0x16u);
              }
              v35 = MFPowerLog();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                v52 = objc_msgSend(v15, "ef_publicDescription");
                [v24 accountRelativePath];
                v51 = k;
                v36 = v2;
                id v37 = v21;
                uint64_t v38 = v22;
                v39 = v15;
                v40 = v14;
                id v41 = (id)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v24, "ef_publicDescription");
                *(_DWORD *)buf = 138543874;
                v66 = v52;
                __int16 v67 = 2112;
                id v68 = v41;
                __int16 v69 = 2114;
                v70 = v42;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[Fetch Initiated] account=%{public}@ mailboxPath=%@ mailbox=%{public}@", buf, 0x20u);

                v14 = v40;
                v15 = v39;
                uint64_t v22 = v38;
                id v21 = v37;
                v2 = v36;
                k = v51;
              }
              id v27 = [objc_alloc((Class)(v14 + 792)) initRequestForMailboxUid:v24];
              v30 = [v24 uniqueId];
              if (v30) {
                [v27 setKey:v30];
              }
              objc_msgSend(v27, "setIsUserRequested:", -[AutoFetchCreateJobListPrivate isUserRequested](v2, "isUserRequested"));
              objc_msgSend(v27, "setIsForegroundRequest:", -[AutoFetchCreateJobListPrivate isForegroundRequest](v2, "isForegroundRequest"));
              objc_msgSend(v27, "setShouldGrowFetchWindow:", -[AutoFetchCreateJobListPrivate shouldGrowFetchWindow](v2, "shouldGrowFetchWindow"));
              objc_msgSend(v27, "setShouldCompact:", -[AutoFetchCreateJobListPrivate isCompacting](v2, "isCompacting"));
              objc_msgSend(v27, "setShouldLoadMessageBody:", -[AutoFetchCreateJobListPrivate isCompacting](v2, "isCompacting") ^ 1);
              [(NSMutableArray *)v2->_jobList addObject:v27];
LABEL_40:
            }
            id v21 = [v50 countByEnumeratingWithState:&v53 objects:v71 count:16];
          }
          while (v21);
        }
      }
      id v44 = [obja countByEnumeratingWithState:&v57 objects:v72 count:16];
    }
    while (v44);
  }
}

- (NSArray)jobList
{
  return &self->_jobList->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountResponsiveness, 0);
  objc_storeStrong((id *)&self->_accounts, 0);

  objc_storeStrong((id *)&self->_jobList, 0);
}

@end