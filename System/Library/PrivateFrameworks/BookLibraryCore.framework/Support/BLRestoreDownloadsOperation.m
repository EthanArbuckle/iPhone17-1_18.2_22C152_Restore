@interface BLRestoreDownloadsOperation
- (BLRestoreDownloadsOperation)initWithRestoreDownloadItems:(id)a3 authenticationQueue:(id)a4 responseItemBlock:(id)a5;
- (NSArray)downloadItems;
- (OS_dispatch_queue)authenticationQueue;
- (id)_sortedAccountIDs:(id)a3;
- (id)responseItemBlock;
- (void)_applyResponses:(id)a3;
- (void)_sanitizeRestoreItemAccountID:(id)a3 accountsHelper:(id)a4 error:(id *)a5;
- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4;
- (void)run;
- (void)setDownloadItems:(id)a3;
- (void)setResponseItemBlock:(id)a3;
@end

@implementation BLRestoreDownloadsOperation

- (BLRestoreDownloadsOperation)initWithRestoreDownloadItems:(id)a3 authenticationQueue:(id)a4 responseItemBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BLRestoreDownloadsOperation;
  v11 = [(BLOperation *)&v17 init];
  if (v11)
  {
    v12 = (NSArray *)[v8 copy];
    downloadItems = v11->_downloadItems;
    v11->_downloadItems = v12;

    objc_storeStrong((id *)&v11->_authenticationQueue, a4);
    id v14 = [v10 copy];
    id responseItemBlock = v11->_responseItemBlock;
    v11->_id responseItemBlock = v14;
  }
  return v11;
}

- (void)run
{
  id v79 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = [BLRestoreAccountsHelper alloc];
  v93 = self;
  v4 = [(BLRestoreDownloadsOperation *)self authenticationQueue];
  v5 = [(BLRestoreAccountsHelper *)v3 initWithAuthenticationQueue:v4];

  v92 = v5;
  [(BLRestoreAccountsHelper *)v5 establishPrimaryAccount];
  id v90 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = +[BUAccountsProvider sharedProvider];
  v7 = [v6 activeStoreAccount];

  v86 = objc_msgSend(v7, "ams_DSID");
  id v87 = objc_alloc_init((Class)NSMutableArray);
  v85 = v7;
  if (v7)
  {
    id v8 = +[BUBag defaultBag];
    id v9 = [objc_alloc((Class)AMSFamilyInfoLookupTask) initWithAccount:v7 bag:v8];
    id v10 = [v9 performFamilyInfoLookup];
    id v112 = 0;
    v11 = [v10 resultWithError:&v112];
    id v12 = v112;
    if (v12)
    {
      v13 = BLServiceLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v115 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "ContentRestore: Error looking up family info:  %@", buf, 0xCu);
      }
      id v91 = 0;
      id v14 = v79;
    }
    else
    {
      v88 = v8;
      id obj = v11;
      v15 = [v11 familyMembers];
      id v91 = objc_alloc_init((Class)NSMutableArray);
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      v13 = v15;
      id v16 = [v13 countByEnumeratingWithState:&v108 objects:v120 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v109;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v109 != v18) {
              objc_enumerationMutation(v13);
            }
            v20 = *(void **)(*((void *)&v108 + 1) + 8 * i);
            if (v86)
            {
              v21 = [*(id *)(*((void *)&v108 + 1) + 8 * i) iTunesDSID];
              unsigned __int8 v22 = [v21 isEqualToNumber:v86];

              if (v22) {
                continue;
              }
            }
            v23 = [v20 iTunesDSID];
            [v91 addObject:v23];
          }
          id v17 = [v13 countByEnumeratingWithState:&v108 objects:v120 count:16];
        }
        while (v17);
      }

      id v14 = v79;
      v11 = obj;
      v7 = v85;
      id v8 = v88;
    }
  }
  else
  {
    id v91 = 0;
    id v14 = v79;
  }
  [(BLRestoreDownloadsOperation *)v93 downloadItems];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  id v24 = [obja countByEnumeratingWithState:&v104 objects:v119 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v89 = *(void *)v105;
    id v80 = (id)ACAccountTypeIdentifieriTunesStore;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v105 != v89) {
          objc_enumerationMutation(obja);
        }
        v27 = *(void **)(*((void *)&v104 + 1) + 8 * (void)j);
        id v103 = 0;
        [(BLRestoreDownloadsOperation *)v93 _sanitizeRestoreItemAccountID:v27 accountsHelper:v92 error:&v103];
        id v28 = v103;
        uint64_t v29 = [v27 storeAccountID];
        v30 = (void *)v29;
        if (v7 && v29 && [v91 containsObject:v29])
        {
          [v27 setStoreOriginalPurchaserAccountID:v30];
          [v27 setStoreAccountID:v86];
        }
        uint64_t v31 = [v27 storeAccountID];
        if (v31)
        {
          v32 = (void *)v31;
          id v102 = 0;
          unsigned __int8 v33 = [v27 isEligibleForRestore:&v102];
          id v34 = v102;

          if (v33)
          {
            v35 = [v27 storeOriginalPurchaserAccountID];
            v36 = v35;
            if (v35)
            {
              id v37 = v35;
            }
            else
            {
              id v37 = [v27 storeAccountID];
            }
            v39 = v37;

            id v40 = [v14 objectForKeyedSubscript:v39];
            if (!v40)
            {
              id v40 = +[ACAccount bu_storeAccountWithDSID:v39];
              if (!v40)
              {
                v41 = +[ACAccountStore bu_sharedAccountStore];
                v42 = [v41 accountTypeWithAccountTypeIdentifier:v80];

                id v40 = [objc_alloc((Class)ACAccount) initWithAccountType:v42];
                objc_msgSend(v40, "ams_setDSID:", v39);
                v43 = [v40 username];

                if (!v43)
                {
                  v44 = [v27 storeAccountAppleID];
                  [v40 setUsername:v44];
                }
                v45 = objc_msgSend(v40, "ams_storefront");

                if (!v45)
                {
                  v46 = [v27 storeFrontID];
                  objc_msgSend(v40, "ams_setStorefront:", v46);
                }
                id v14 = v79;
              }
              [v14 setObject:v40 forKeyedSubscript:v39];
            }
            id v47 = [v90 objectForKeyedSubscript:v39];
            if (!v47)
            {
              id v47 = objc_alloc_init((Class)NSMutableArray);
              [v90 setObject:v47 forKeyedSubscript:v39];
            }
            [v47 addObject:v27];

            v7 = v85;
            goto LABEL_48;
          }
        }
        else
        {
          id v34 = 0;
        }
        v38 = BLServiceLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v115 = v27;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "ContentRestore: item %@ is not elligable for restore", buf, 0xCu);
        }

        [v27 setError:v34];
        [v87 addObject:v27];
LABEL_48:
      }
      id v25 = [obja countByEnumeratingWithState:&v104 objects:v119 count:16];
    }
    while (v25);
  }
  id v48 = objc_alloc_init((Class)NSMutableArray);
  v49 = v90;
  if ([v87 count])
  {
    v50 = BLServiceLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = [v87 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412290;
      id v115 = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "ContentRestore: Fail invalid restore items: [%@]", buf, 0xCu);

      id v14 = v79;
    }

    v52 = objc_alloc_init(BLRestoreDownloadItemsResponse);
    [(BLRestoreDownloadItemsResponse *)v52 setRequestItems:v87];
    [v48 addObject:v52];
  }
  if ([v48 count]) {
    [(BLRestoreDownloadsOperation *)v93 _applyResponses:v48];
  }
  if ([v90 count])
  {
    id v78 = v48;
    v53 = [(BLRestoreDownloadsOperation *)v93 _sortedAccountIDs:v90];
    id v82 = objc_alloc_init((Class)NSMutableArray);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v81 = v53;
    id v54 = [v81 countByEnumeratingWithState:&v98 objects:v118 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v99;
      LOBYTE(v57) = 1;
      do
      {
        for (k = 0; k != v55; k = (char *)k + 1)
        {
          if (*(void *)v99 != v56) {
            objc_enumerationMutation(v81);
          }
          v59 = *(void **)(*((void *)&v98 + 1) + 8 * (void)k);
          if ([v91 containsObject:v59])
          {
            id v60 = v85;
          }
          else
          {
            id v60 = [v14 objectForKeyedSubscript:v59];
          }
          v61 = v60;
          v62 = [v49 objectForKeyedSubscript:v59];
          v63 = BLServiceLog();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v115 = v59;
            __int16 v116 = 2112;
            v117 = v62;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "ContentRestore: accountID: %@, restoreItems: %@", buf, 0x16u);
          }

          v64 = [[BLRestoreDownloadItemsOperation alloc] initWithDownloadItems:v62 account:v61 accountsHelper:v92];
          if (v61)
          {
            [v82 addObject:v64];
          }
          else
          {
            v65 = BLServiceLog();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              v66 = [v62 componentsJoinedByString:@", "];
              *(_DWORD *)buf = 138412546;
              id v115 = v59;
              __int16 v116 = 2112;
              v117 = v66;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "ContentRestore: Missing account for accountID: %@, failing restore items: [%@]", buf, 0x16u);
            }
            v67 = objc_alloc_init(BLRestoreDownloadItemsResponse);
            [(BLRestoreDownloadItemsResponse *)v67 setRequestItems:v62];
            v68 = sub_10004B6AC(0, @"Missing account", 0);
            [(BLRestoreDownloadItemsResponse *)v67 setServerResponseWithError:v68];

            [(BLRestoreDownloadsOperation *)v93 restoreDownloadItemsOperation:v64 didReceiveResponse:v67];
            LOBYTE(v57) = 0;
            id v14 = v79;
          }

          v49 = v90;
        }
        id v55 = [v81 countByEnumeratingWithState:&v98 objects:v118 count:16];
      }
      while (v55);
    }
    else
    {
      LOBYTE(v57) = 1;
    }

    v70 = BLServiceLog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      id v71 = [v82 count];
      *(_DWORD *)buf = 134217984;
      id v115 = v71;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "ContentRestore: Attempting restore for %lu account(s)", buf, 0xCu);
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v72 = v82;
    id v73 = [v72 countByEnumeratingWithState:&v94 objects:v113 count:16];
    if (v73)
    {
      id v74 = v73;
      uint64_t v75 = *(void *)v95;
      v57 &= 1u;
      do
      {
        for (m = 0; m != v74; m = (char *)m + 1)
        {
          if (*(void *)v95 != v75) {
            objc_enumerationMutation(v72);
          }
          v77 = *(void **)(*((void *)&v94 + 1) + 8 * (void)m);
          [v77 setDelegate:v93];
          v57 &= [(BLOperation *)v93 runSubOperation:v77 returningError:0];
        }
        id v74 = [v72 countByEnumeratingWithState:&v94 objects:v113 count:16];
      }
      while (v74);
      id v14 = v79;
    }

    uint64_t v69 = v57 & 1;
    id v48 = v78;
  }
  else
  {
    uint64_t v69 = 0;
  }
  [(BLOperation *)v93 setSuccess:v69];
}

- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4
{
  id v7 = a4;
  id v5 = a4;
  v6 = +[NSArray arrayWithObjects:&v7 count:1];

  -[BLRestoreDownloadsOperation _applyResponses:](self, "_applyResponses:", v6, v7);
}

- (void)_applyResponses:(id)a3
{
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = a3;
  id v43 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v57;
    *(void *)&long long v4 = 138412802;
    long long v40 = v4;
    id v5 = &ACSLocateCachingServer_ptr;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v57 != v42) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v56 + 1) + 8 * v6);
        id v8 = objc_alloc_init((Class)NSMutableDictionary);
        id v9 = [v7 serverResponse];
        id v10 = BLServiceLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = [v9 error];
          id v12 = [v9 downloads];
          id v13 = [v12 count];
          *(_DWORD *)buf = v40;
          v63 = v9;
          __int16 v64 = 2112;
          v65 = v11;
          __int16 v66 = 2048;
          id v67 = v13;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ContentRestore: Server response: %@, error: %@. Got %ld download item(s)", buf, 0x20u);
        }
        uint64_t v45 = v6;

        v46 = v9;
        id v14 = [v9 downloads];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v15 = [v14 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v53;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v53 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              v20 = objc_msgSend(v5[445], "bl_numberWithItemIdentifier:", objc_msgSend(v19, "itemIdentifier", v40));
              [v8 setObject:v19 forKeyedSubscript:v20];
            }
            id v16 = [v14 countByEnumeratingWithState:&v52 objects:v61 count:16];
          }
          while (v16);
        }
        v44 = v14;
        v21 = objc_msgSend(v7, "requestItems", v40);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v47 = v21;
        id v22 = [v21 countByEnumeratingWithState:&v48 objects:v60 count:16];
        v23 = v46;
        if (v22)
        {
          id v24 = v22;
          uint64_t v25 = *(void *)v49;
          do
          {
            for (j = 0; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v49 != v25) {
                objc_enumerationMutation(v47);
              }
              v27 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
              id v28 = [v27 storeItemID];
              uint64_t v29 = [v8 objectForKeyedSubscript:v28];
              v30 = [v23 error];
              uint64_t v31 = v30;
              if (v30)
              {
                id v32 = v30;
              }
              else
              {
                unsigned __int8 v33 = v23;
                id v34 = self;
                v35 = [v33 errorForItemIdentifier:v28];
                v36 = v35;
                if (v35)
                {
                  id v37 = v35;
                }
                else
                {
                  id v37 = [v27 error];
                }
                id v32 = v37;

                self = v34;
                v23 = v46;
              }

              uint64_t v38 = [(BLRestoreDownloadsOperation *)self responseItemBlock];
              v39 = (void *)v38;
              if (v38) {
                (*(void (**)(uint64_t, void *, void *, id))(v38 + 16))(v38, v28, v29, v32);
              }
            }
            id v24 = [v47 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v24);
        }

        uint64_t v6 = v45 + 1;
        id v5 = &ACSLocateCachingServer_ptr;
      }
      while ((id)(v45 + 1) != v43);
      id v43 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    }
    while (v43);
  }
}

- (void)_sanitizeRestoreItemAccountID:(id)a3 accountsHelper:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 storeAccountID];

  if (!v9)
  {
    v11 = [v7 storeAccountAppleID];
    id v12 = +[BUAccountsProvider sharedProvider];
    id v13 = [v12 activeStoreAccount];

    if (v11)
    {
      id v20 = 0;
      id v14 = [v8 accountIDForAccountName:v11 error:&v20];
      uint64_t v10 = (uint64_t)v20;
    }
    else
    {
      if (!v13)
      {
        uint64_t v10 = 0;
LABEL_12:
        uint64_t v18 = [v7 storeAccountID];
        uint64_t v19 = v18 | v10;

        if (!v19)
        {
          uint64_t v10 = sub_10004B6AC(119, 0, 0);
        }

        if (a5) {
          goto LABEL_3;
        }
        goto LABEL_4;
      }
      id v15 = BLServiceLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v7 storeItemID];
        *(_DWORD *)buf = 138412290;
        id v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ContentRestore: Falling back to primary account to restore item: %@", buf, 0xCu);
      }
      uint64_t v17 = [v13 username];
      [v7 setStoreAccountAppleID:v17];

      id v14 = objc_msgSend(v13, "ams_DSID");
      uint64_t v10 = 0;
    }
    [v7 setStoreAccountID:v14];

    goto LABEL_12;
  }
  uint64_t v10 = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = (id) v10;
LABEL_4:
}

- (id)_sortedAccountIDs:(id)a3
{
  id v3 = a3;
  long long v4 = +[BUAccountsProvider sharedProvider];
  id v5 = [v4 activeStoreAccount];
  uint64_t v6 = objc_msgSend(v5, "ams_DSID");

  id v7 = [v3 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000110CC;
  v12[3] = &unk_1001A1468;
  id v13 = v6;
  id v14 = v3;
  id v8 = v3;
  id v9 = v6;
  uint64_t v10 = [v7 sortedArrayUsingComparator:v12];

  return v10;
}

- (OS_dispatch_queue)authenticationQueue
{
  return self->_authenticationQueue;
}

- (NSArray)downloadItems
{
  return self->_downloadItems;
}

- (void)setDownloadItems:(id)a3
{
}

- (id)responseItemBlock
{
  return self->_responseItemBlock;
}

- (void)setResponseItemBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseItemBlock, 0);
  objc_storeStrong((id *)&self->_downloadItems, 0);

  objc_storeStrong((id *)&self->_authenticationQueue, 0);
}

@end