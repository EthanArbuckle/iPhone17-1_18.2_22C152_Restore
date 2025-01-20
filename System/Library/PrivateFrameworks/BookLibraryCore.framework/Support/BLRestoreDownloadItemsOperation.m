@interface BLRestoreDownloadItemsOperation
+ (BOOL)isErrorBadTokenError:(id)a3;
- (BLRestoreDownloadItemsOperation)initWithDownloadItems:(id)a3 account:(id)a4 accountsHelper:(id)a5;
- (BOOL)_runWithOptions:(id)a3 error:(id *)a4;
- (NSArray)downloadItems;
- (NSArray)responses;
- (id)_bodyDictionaryWithItems:(id)a3 options:(id)a4;
- (id)_newResponseWithItems:(id)a3 error:(id)a4;
- (id)_runWithBodyDictionary:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_runWithItems:(id)a3 options:(id)a4;
- (id)_supportedDownloadKindsSorted;
- (void)_addResponse:(id)a3;
- (void)_run;
- (void)run;
@end

@implementation BLRestoreDownloadItemsOperation

- (BLRestoreDownloadItemsOperation)initWithDownloadItems:(id)a3 account:(id)a4 accountsHelper:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BLRestoreDownloadItemsOperation;
  v11 = [(BLOperation *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a4);
    objc_storeStrong((id *)&v12->_accountsHelper, a5);
    v13 = (NSArray *)[v8 copy];
    downloadItems = v12->_downloadItems;
    v12->_downloadItems = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    responses = v12->_responses;
    v12->_responses = v15;
  }
  return v12;
}

- (NSArray)downloadItems
{
  return self->_downloadItems;
}

- (NSArray)responses
{
  [(BLOperation *)self lock];
  id v3 = [(NSMutableArray *)self->_responses copy];
  [(BLOperation *)self unlock];

  return (NSArray *)v3;
}

- (void)run
{
}

- (void)_addResponse:(id)a3
{
  id v7 = a3;
  [(BLOperation *)self lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5) {
    id v6 = objc_loadWeakRetained((id *)&self->super._delegate);
  }
  else {
    id v6 = 0;
  }
  [(NSMutableArray *)self->_responses addObject:v7];
  [(BLOperation *)self unlock];
  if (v6) {
    [v6 restoreDownloadItemsOperation:self didReceiveResponse:v7];
  }
}

- (id)_newResponseWithItems:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(BLRestoreDownloadItemsResponse);
  id v9 = [BLStoreDownloadQueueResponse alloc];
  id v10 = [(ACAccount *)self->_account ams_DSID];
  v11 = [(BLStoreDownloadQueueResponse *)v9 initWithError:v6 userIdentifier:v10];

  [(BLRestoreDownloadItemsResponse *)v8 setRequestItems:v7];
  [(BLRestoreDownloadItemsResponse *)v8 setServerResponse:v11];

  return v8;
}

- (id)_bodyDictionaryWithItems:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = +[AMSDevice deviceName];
  if (v7) {
    [v6 setObject:v7 forKeyedSubscript:@"device-name"];
  }
  id v8 = +[AMSDevice deviceGUID];
  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:@"guid"];
  }
  id v9 = +[AMSDevice serialNumber];
  if (v9) {
    [v6 setObject:v9 forKeyedSubscript:@"serial-number"];
  }
  id v10 = +[AMSKeybag bl_keybagSyncDataForAccount:self->_account withTransactionType:1];
  [v6 setObject:v10 forKeyedSubscript:@"kbsync"];

  if (v5)
  {
    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v5;
    id v12 = v5;
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v20 + 1) + 8 * i) copyRestoreDictionary];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [v6 setObject:v11 forKeyedSubscript:@"items"];
    id v5 = v19;
  }

  return v6;
}

- (void)_run
{
  id v3 = BLServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(NSArray *)self->_downloadItems componentsJoinedByString:@", "];
    id v5 = [(ACAccount *)self->_account ams_DSID];
    id v6 = [(ACAccount *)self->_account ams_storefront];
    *(_DWORD *)buf = 138412802;
    CFStringRef v24 = v4;
    __int16 v25 = 2112;
    id v26 = v5;
    __int16 v27 = 2112;
    v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ContentRestore: Restoring item(s): [%@] for account: (%@ / %@)", buf, 0x20u);
  }
  id v7 = [(ACAccount *)self->_account username];
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = +[BUBag defaultBag];
    id v10 = [v9 contentRestoreMaxItemCount];
    id v20 = 0;
    id v11 = [v10 valueWithError:&v20];
    id v12 = v20;
    if (!v11)
    {
      id v13 = BLServiceLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        CFStringRef v24 = @"max-item-count";
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "ContentRestore: Error reading bag key '%{public}@', error:  %@", buf, 0x16u);
      }

      id v11 = &off_1001AF7C0;
    }
    CFStringRef v21 = @"max-item-count";
    long long v22 = v11;
    id v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v19 = v12;
    BOOL v15 = [(BLRestoreDownloadItemsOperation *)self _runWithOptions:v14 error:&v19];
    id v16 = v19;
  }
  else
  {
    id v17 = BLServiceLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      account = self->_account;
      *(_DWORD *)buf = 138412290;
      CFStringRef v24 = (const __CFString *)account;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "ContentRestore: Can't restore using account: %@ with no account name", buf, 0xCu);
    }

    sub_10004B6AC(114, 0, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [(BLRestoreDownloadItemsOperation *)self _newResponseWithItems:self->_downloadItems error:v16];
    [(BLRestoreDownloadItemsOperation *)self _addResponse:v9];
    BOOL v15 = 0;
  }

  [(BLOperation *)self setError:v16];
  [(BLOperation *)self setSuccess:v15];
}

- (id)_runWithBodyDictionary:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = +[BUBag defaultBag];
  id v9 = [v8 contentRestoreURL];
  id v10 = [[_BLContentRestoreURLRequestEncoder alloc] initWithBag:v8];
  v35 = self;
  [(_BLContentRestoreURLRequestEncoder *)v10 setAccount:self->_account];
  id v11 = [(_BLContentRestoreURLRequestEncoder *)v10 requestWithMethod:4 bagURL:v9 parameters:v7];
  id v39 = 0;
  id v12 = [v11 resultWithError:&v39];
  id v13 = v39;

  if (v13)
  {
    id v14 = 0;
  }
  else
  {
    v32 = v10;
    id v36 = v7;
    id v15 = [objc_alloc((Class)AMSProcessInfo) initWithBundleIdentifier:@"com.apple.bookassetd"];
    id v16 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    objc_msgSend(v16, "ams_configureWithProcessInfo:bag:", v15, v8);
    id v17 = [v15 bundleIdentifier];
    objc_msgSend(v16, "set_sourceApplicationBundleIdentifier:", v17);

    id v18 = [objc_alloc((Class)AMSURLSession) initWithConfiguration:v16];
    id v19 = [v18 dataTaskPromiseWithRequest:v12];
    id v38 = 0;
    uint64_t v20 = [v19 resultWithError:&v38];
    id v13 = v38;

    if (!v13)
    {
      char v34 = 1;
      id v7 = v36;
      id v14 = (void *)v20;
      id v10 = v32;
      goto LABEL_8;
    }
    id v7 = v36;
    id v14 = (void *)v20;
    id v10 = v32;
  }
  CFStringRef v21 = BLServiceLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v13;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "ContentRestore: Metadata lookup encountered error:  %@", buf, 0xCu);
  }

  char v34 = 0;
LABEL_8:
  v37 = v14;
  long long v22 = [v14 object];
  long long v23 = BLServiceLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "ContentRestore: Fetch result from restoreContent: %@", buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = 0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v33 = v12;
  CFStringRef v24 = v8;
  __int16 v25 = v9;
  id v26 = a5;
  id v27 = v7;
  v28 = [BLStoreDownloadQueueResponse alloc];
  v29 = [(ACAccount *)v35->_account ams_DSID];
  v30 = [(BLStoreDownloadQueueResponse *)v28 initWithDictionary:v22 userIdentifier:v29];

  if ((v34 & 1) == 0)
  {
    [(BLStoreDownloadQueueResponse *)v30 setError:v13];
    -[BLStoreDownloadQueueResponse setShouldCancelPurchaseBatch:](v30, "setShouldCancelPurchaseBatch:", objc_msgSend(v13, "bl_isUserCancelError"));
  }
  id v7 = v27;
  a5 = v26;
  id v9 = v25;
  id v8 = v24;
  id v12 = v33;
  if (a5) {
LABEL_16:
  }
    *a5 = v13;
LABEL_17:

  return v30;
}

- (id)_runWithItems:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BLRestoreDownloadItemsOperation *)self _bodyDictionaryWithItems:v6 options:v7];
  if (!v8)
  {
    id v17 = BLServiceLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v6;
      __int16 v27 = 2112;
      v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "ContentRestore: No body data for items: [%@] error:  %@", buf, 0x16u);
    }

LABEL_9:
    id v11 = sub_10004B6AC(0, 0, 0);
LABEL_11:
    id v18 = [BLStoreDownloadQueueResponse alloc];
    id v19 = [(ACAccount *)self->_account ams_DSID];
    id v9 = [(BLStoreDownloadQueueResponse *)v18 initWithError:v11 userIdentifier:v19];

    -[BLStoreDownloadQueueResponse setShouldCancelPurchaseBatch:](v9, "setShouldCancelPurchaseBatch:", objc_msgSend(v11, "bl_isUserCancelError"));
    goto LABEL_18;
  }
  id v24 = 0;
  id v9 = [(BLRestoreDownloadItemsOperation *)self _runWithBodyDictionary:v8 options:v7 error:&v24];
  id v10 = v24;
  id v11 = v10;
  if (!v9)
  {
    if (v10) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v12 = [(BLStoreDownloadQueueResponse *)v9 error];

  id v13 = BLServiceLog();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v6 componentsJoinedByString:@", "];
      id v16 = [(BLStoreDownloadQueueResponse *)v9 error];
      *(_DWORD *)buf = 138412546;
      id v26 = v15;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "ContentRestore: Received failure for items: [%@] response error:  %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(BLStoreDownloadQueueResponse *)v9 downloads];
      id v21 = [v20 count];
      long long v22 = [v6 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 134218242;
      id v26 = v21;
      __int16 v27 = 2112;
      v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ContentRestore: Received content restore metadata for %lu item(s) for restore items: [%@]", buf, 0x16u);
    }
    id v14 = [(BLStoreDownloadQueueResponse *)v9 keybag];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 length]) {
      +[AMSKeybag bl_importKeybagData:v14];
    }
  }

LABEL_18:

  return v9;
}

- (BOOL)_runWithOptions:(id)a3 error:(id *)a4
{
  id v82 = a3;
  id v5 = objc_alloc((Class)NSMutableSet);
  id v6 = [(BLRestoreDownloadItemsOperation *)self _supportedDownloadKindsSorted];
  id v7 = [v5 initWithArray:v6];

  id v75 = objc_alloc_init((Class)NSMutableDictionary);
  id v72 = objc_alloc_init((Class)NSMutableArray);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v86 = self;
  id v8 = self->_downloadItems;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v93 objects:v104 count:16];
  id v80 = v7;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v94;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v94 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        id v14 = [v13 downloadKind];
        if (v7 && ([v7 containsObject:v14] & 1) == 0)
        {
          id v17 = BLServiceLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v13 storeItemID];
            *(_DWORD *)buf = 138412546;
            uint64_t v98 = (uint64_t)v14;
            __int16 v99 = 2112;
            v100 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "ContentRestore: Filtering disallowed kind: \"%@\" for item: %@", buf, 0x16u);
          }
          [v72 addObject:v13];
        }
        else
        {
          id v15 = [v75 objectForKeyedSubscript:v14];
          if (v15)
          {
            id v16 = v15;
            [v15 addObject:v13];
          }
          else
          {
            id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v13, 0);
            [v75 setObject:v16 forKeyedSubscript:v14];
          }
        }
        id v7 = v80;
      }
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v93 objects:v104 count:16];
    }
    while (v10);
  }

  id v19 = self;
  if ([v72 count])
  {
    uint64_t v20 = sub_10004B6AC(400, 0, 0);
    id v21 = [(BLRestoreDownloadItemsOperation *)self _newResponseWithItems:v72 error:v20];

    [(BLRestoreDownloadItemsOperation *)self _addResponse:v21];
  }
  id v76 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = [(BLRestoreDownloadItemsOperation *)self _supportedDownloadKindsSorted];
  long long v23 = v75;
  id v24 = [v75 allKeys];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v25 = v22;
  id v71 = v25;
  id v79 = [v25 countByEnumeratingWithState:&v89 objects:v103 count:16];
  if (v79)
  {
    char v26 = 0;
    __int16 v27 = 0;
    BOOL v28 = 1;
    uint64_t v78 = *(void *)v90;
    v70 = v24;
    while (1)
    {
      for (j = 0; j != v79; j = (char *)j + 1)
      {
        if (*(void *)v90 != v78) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v89 + 1) + 8 * (void)j);
        if ([v24 containsObject:v30])
        {
          uint64_t v31 = [v23 objectForKeyedSubscript:v30];
          v32 = v30;
          v33 = (void *)v31;
          if (v27)
          {
            [v76 addObjectsFromArray:v31];
LABEL_64:

            continue;
          }
          v74 = v32;
          id v34 = objc_alloc_init((Class)NSMutableArray);
          v85 = v33;
          uint64_t v35 = (uint64_t)[v33 count];
          id v36 = [v82 objectForKeyedSubscript:@"max-item-count"];
          uint64_t v87 = v35;
          if (objc_opt_respondsToSelector()) {
            uint64_t v87 = (int)[v36 intValue];
          }
          v73 = v36;
          v37 = BLServiceLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218498;
            uint64_t v98 = v35;
            __int16 v99 = 2112;
            v100 = v74;
            __int16 v101 = 2048;
            uint64_t v102 = v87;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "ContentRestore: Restoring %ld items with kind %@ with chunk size %ld", buf, 0x20u);
          }

          __int16 v27 = 0;
          if (v35 < 1)
          {
            v33 = v85;
LABEL_63:

            id v7 = v80;
            long long v23 = v75;
            id v24 = v70;
            id v25 = v71;
            goto LABEL_64;
          }
          uint64_t v38 = 0;
          v33 = v85;
          v81 = j;
          while (2)
          {
            id v39 = [v33 objectAtIndexedSubscript:v38];
            [v34 addObject:v39];
            if ([v34 count] != (id)v87 && v38 != v35 - 1) {
              goto LABEL_60;
            }
            v40 = objc_alloc_init(BLRestoreDownloadItemsResponse);
            [(BLRestoreDownloadItemsResponse *)v40 setRequestItems:v34];
            if (![v34 count]) {
              goto LABEL_56;
            }
            v83 = v27;
            BOOL v84 = v28;
            id v41 = BLServiceLog();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              id v42 = [v34 count];
              *(_DWORD *)buf = 134218242;
              uint64_t v98 = (uint64_t)v42;
              __int16 v99 = 2112;
              v100 = v74;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "ContentRestore: Making chunk request for %lu item(s) with kind: %@", buf, 0x16u);
            }

            v43 = [(BLRestoreDownloadItemsOperation *)v19 _runWithItems:v34 options:v82];
            uint64_t v44 = objc_opt_class();
            v45 = [v43 error];
            LOBYTE(v44) = [(id)v44 isErrorBadTokenError:v45];

            if (!(v26 & 1 | ((v44 & 1) == 0)))
            {
              v46 = BLServiceLog();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                v47 = [v34 componentsJoinedByString:@", "];
                v48 = [v43 error];
                *(_DWORD *)buf = 138412546;
                uint64_t v98 = (uint64_t)v47;
                __int16 v99 = 2112;
                v100 = v48;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "ContentRestore: Encountered bad token error. Attempt to authenticate, then retry items: [%@] error:  %@", buf, 0x16u);

                id v19 = v86;
              }

              accountsHelper = v19->_accountsHelper;
              account = v19->_account;
              id v88 = 0;
              uint64_t v51 = [(BLRestoreAccountsHelper *)accountsHelper preflightAccount:account error:&v88];
              id v52 = v88;
              v53 = v86->_account;
              v86->_account = (ACAccount *)v51;
              id v19 = v86;

              if (v52)
              {
                v54 = [BLStoreDownloadQueueResponse alloc];
                v55 = [(ACAccount *)v86->_account ams_DSID];
                v56 = v54;
                id v19 = v86;
                v57 = [(BLStoreDownloadQueueResponse *)v56 initWithError:v52 userIdentifier:v55];

                [(BLStoreDownloadQueueResponse *)v57 setShouldCancelPurchaseBatch:1];
              }
              else
              {
                v58 = BLServiceLog();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v98 = (uint64_t)v34;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "ContentRestore: Authenticate successful. Retrying request for items: %@", buf, 0xCu);
                }

                v57 = [(BLRestoreDownloadItemsOperation *)v86 _runWithItems:v34 options:v82];
              }
              char v26 = 1;
              v43 = v57;
            }
            if ([v43 shouldCancelPurchaseBatch])
            {
              v59 = [v43 error];
              v60 = v59;
              if (v59)
              {
                id v61 = v59;
              }
              else
              {
                sub_10004B6AC(0, 0, 0);
                id v61 = (id)objc_claimAutoreleasedReturnValue();
              }
              id v62 = v61;

              __int16 v27 = v62;
              if (v84)
              {
LABEL_54:
                v63 = [v43 error];
                BOOL v28 = v63 == 0;

LABEL_55:
                [(BLRestoreDownloadItemsResponse *)v40 setServerResponse:v43];
                [v34 removeAllObjects];

                j = v81;
LABEL_56:
                [(BLRestoreDownloadItemsOperation *)v19 _addResponse:v40];
                if (v27 && v38 + 1 < v35)
                {
                  v64 = objc_msgSend(v85, "subarrayWithRange:");
                  [v76 addObjectsFromArray:v64];

                  id v19 = v86;
                  uint64_t v38 = v35;
                }

                v33 = v85;
LABEL_60:

                if (++v38 >= v35) {
                  goto LABEL_63;
                }
                continue;
              }
            }
            else
            {
              __int16 v27 = v83;
              if (v84) {
                goto LABEL_54;
              }
            }
            break;
          }
          BOOL v28 = 0;
          goto LABEL_55;
        }
      }
      id v79 = [v25 countByEnumeratingWithState:&v89 objects:v103 count:16];
      if (!v79) {
        goto LABEL_69;
      }
    }
  }
  __int16 v27 = 0;
  BOOL v28 = 1;
LABEL_69:

  if ([v76 count])
  {
    v65 = BLServiceLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = [v76 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412546;
      uint64_t v98 = (uint64_t)v66;
      __int16 v99 = 2112;
      v100 = v27;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "ContentRestore: Cancel restore items: [%@] error:  %@", buf, 0x16u);
    }
    id v67 = [(BLRestoreDownloadItemsOperation *)v19 _newResponseWithItems:v76 error:v27];
    [(BLRestoreDownloadItemsOperation *)v19 _addResponse:v67];

    id v25 = v71;
  }
  if (a4) {
    *a4 = 0;
  }

  return v28;
}

- (id)_supportedDownloadKindsSorted
{
  v4[0] = BLDownloadKindEBook;
  v4[1] = BLDownloadKindAudiobook;
  v4[2] = BLDownloadKindPDF;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

+ (BOOL)isErrorBadTokenError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:AMSErrorDomain])
    {
      id v6 = [v4 userInfo];
      id v7 = [v6 objectForKeyedSubscript:@"AMSServerErrorCode"];
      unsigned __int8 v8 = [v7 isEqualToNumber:&off_1001AF7D8];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_downloadItems, 0);
  objc_storeStrong((id *)&self->_accountsHelper, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end