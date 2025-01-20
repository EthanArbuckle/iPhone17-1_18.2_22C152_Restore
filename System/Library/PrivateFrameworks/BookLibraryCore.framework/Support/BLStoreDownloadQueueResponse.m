@interface BLStoreDownloadQueueResponse
- (BLStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4;
- (BLStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4 preferredAssetFlavor:(id)a5;
- (BLStoreDownloadQueueResponse)initWithError:(id)a3 userIdentifier:(id)a4;
- (BOOL)shouldCancelPurchaseBatch;
- (BOOL)triggeredQueueCheck;
- (NSArray)rangesToLoad;
- (NSData)diversitybag;
- (NSData)keybag;
- (NSError)error;
- (NSNumber)userIdentifier;
- (NSOrderedSet)clusterMappings;
- (NSOrderedSet)downloads;
- (NSString)clientIdentifier;
- (NSString)storeCorrelationID;
- (id)_accountUniqueIdentifierFromValue:(id)a3;
- (id)_errorWithFailureType:(id)a3 customerMessage:(id)a4 responseDictionary:(id)a5;
- (id)_initStoreDownloadQueueResponse;
- (id)_responseDictionary:(id)a3 valueForProtocolKey:(id)a4;
- (id)errorForItemIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setShouldCancelPurchaseBatch:(BOOL)a3;
- (void)setStoreCorrelationID:(id)a3;
- (void)setTriggeredQueueCheck:(BOOL)a3;
@end

@implementation BLStoreDownloadQueueResponse

- (id)_initStoreDownloadQueueResponse
{
  v6.receiver = self;
  v6.super_class = (Class)BLStoreDownloadQueueResponse;
  v2 = [(BLStoreDownloadQueueResponse *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.bookassetd.BLStoreDownloadQueueResponse", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BLStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4
{
  return [(BLStoreDownloadQueueResponse *)self initWithDictionary:a3 userIdentifier:a4 preferredAssetFlavor:0];
}

- (BLStoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4 preferredAssetFlavor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BLStoreDownloadQueueResponse *)self _initStoreDownloadQueueResponse];
  if (v11)
  {
    v90 = v10;
    v12 = objc_opt_new();
    v13 = [v8 objectForKey:@"page-type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v13 objectForKey:@"template-name"];

      v13 = (void *)v14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v15 = [v13 isEqualToString:@"preorder-success"];
    }
    else {
      unsigned __int8 v15 = 0;
    }
    v16 = [v8 objectForKey:@"more"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = sub_1000091E8(v16);
      rangesToLoad = v11->_rangesToLoad;
      v11->_rangesToLoad = (NSArray *)v17;
    }
    v19 = [v8 objectForKey:@"failureType"];

    if (v19)
    {
      v20 = [v8 objectForKey:@"customerMessage"];
      uint64_t v21 = [(BLStoreDownloadQueueResponse *)v11 _errorWithFailureType:v19 customerMessage:v20 responseDictionary:v8];
      error = v11->_error;
      v11->_error = (NSError *)v21;
    }
    v23 = [v8 objectForKey:@"failed-items"];

    objc_opt_class();
    id v89 = v9;
    v96 = v12;
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v99 = v15;
      id v24 = v8;
      id v101 = objc_alloc_init((Class)NSMutableDictionary);
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id obj = v23;
      id v25 = v23;
      id v26 = [v25 countByEnumeratingWithState:&v122 objects:v132 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v123;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v123 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v122 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v31 = [v30 objectForKey:@"item-id"];
              v32 = [v30 objectForKey:@"failureType"];
              v33 = [v30 objectForKey:@"customerMessage"];
              v34 = [(BLStoreDownloadQueueResponse *)v11 _errorWithFailureType:v32 customerMessage:v33 responseDictionary:v24];

              if (v31) {
                BOOL v35 = v34 == 0;
              }
              else {
                BOOL v35 = 1;
              }
              if (!v35) {
                [v101 setObject:v34 forKey:v31];
              }
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v122 objects:v132 count:16];
        }
        while (v27);
      }

      v36 = (NSDictionary *)[v101 copy];
      itemErrors = v11->_itemErrors;
      v11->_itemErrors = v36;

      id v8 = v24;
      id v9 = v89;
      v12 = v96;
      v23 = obj;
      unsigned __int8 v15 = v99;
    }
    uint64_t v38 = [v8 objectForKey:@"keybag"];
    keybag = v11->_keybag;
    v11->_keybag = (NSData *)v38;

    v40 = [v8 objectForKey:@"dsPersonId"];
    v41 = [(BLStoreDownloadQueueResponse *)v11 _accountUniqueIdentifierFromValue:v40];

    if (v41) {
      v42 = v41;
    }
    else {
      v42 = v9;
    }
    v43 = (NSNumber *)[v42 copy];
    userIdentifier = v11->_userIdentifier;
    v11->_userIdentifier = v43;

    if ((v15 & 1) == 0)
    {
      uint64_t v45 = [v8 objectForKey:@"items"];

      v23 = (void *)v45;
      if (!v45)
      {
        v23 = [v8 objectForKey:@"songList"];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v85 = v41;
        id v87 = v8;
        v46 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
        downloads = v11->_downloads;
        v11->_downloads = v46;

        v48 = BLDownloadSupportedDownloadKinds();
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id obja = v23;
        id v49 = [obja countByEnumeratingWithState:&v118 objects:v131 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v119;
          do
          {
            for (j = 0; j != v50; j = (char *)j + 1)
            {
              if (*(void *)v119 != v51) {
                objc_enumerationMutation(obja);
              }
              v53 = [[BLStoreDownloadItem alloc] initWithDictionary:*(void *)(*((void *)&v118 + 1) + 8 * (void)j)];
              v54 = [(BLStoreDownloadItem *)v53 kind];
              if ([v48 containsObject:v54])
              {
                if ([(BLStoreDownloadItem *)v53 itemIdentifier])
                {
                  v55 = [(BLStoreDownloadItem *)v53 bundleIdentifier];
                  id v56 = [v55 length];

                  if (v56)
                  {
                    v57 = [(BLStoreDownloadItem *)v53 bundleIdentifier];
                    v58 = +[NSNumber numberWithUnsignedLongLong:[(BLStoreDownloadItem *)v53 itemIdentifier]];
                    [v96 setObject:v57 forKey:v58];
                  }
                }
                if ([v90 length]) {
                  [(BLStoreDownloadItem *)v53 setPreferredAssetFlavor:v90];
                }
                [(NSMutableOrderedSet *)v11->_downloads addObject:v53];
              }
              else
              {
                v59 = BLServiceLog();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v130 = v54;
                  _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Unsupported download kind: %{public}@", buf, 0xCu);
                }
              }
            }
            id v50 = [obja countByEnumeratingWithState:&v118 objects:v131 count:16];
          }
          while (v50);
        }
        v23 = obja;

        id v8 = v87;
        id v9 = v89;
        v12 = v96;
        v41 = v85;
      }
    }
    v60 = [v8 objectForKey:@"cancel-purchase-batch"];

    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v61 = [v60 BOOLValue];
    }
    else {
      unsigned __int8 v61 = 0;
    }
    v11->_shouldCancelPurchaseBatch = v61;
    v62 = [v8 objectForKey:@"appClusterAssignmentsResultSet"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v86 = v41;
      id v88 = v8;
      uint64_t v63 = objc_opt_new();
      clusterMappings = v11->_clusterMappings;
      v11->_clusterMappings = (NSMutableOrderedSet *)v63;

      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      v84 = v62;
      id v92 = v62;
      id v94 = [v92 countByEnumeratingWithState:&v114 objects:v128 count:16];
      if (v94)
      {
        uint64_t v65 = *(void *)v115;
        uint64_t v91 = *(void *)v115;
        do
        {
          uint64_t v66 = 0;
          do
          {
            if (*(void *)v115 != v65) {
              objc_enumerationMutation(v92);
            }
            uint64_t v95 = v66;
            v67 = *(void **)(*((void *)&v114 + 1) + 8 * v66);
            v68 = [v67 objectForKeyedSubscript:@"clusterVersionId"];
            v69 = [v67 objectForKeyedSubscript:@"appsClusterAssignments"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v112 = 0u;
              long long v113 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              v93 = v69;
              id v97 = v69;
              v102 = (char *)[v97 countByEnumeratingWithState:&v110 objects:v127 count:16];
              if (v102)
              {
                uint64_t v100 = *(void *)v111;
                do
                {
                  v70 = 0;
                  do
                  {
                    if (*(void *)v111 != v100) {
                      objc_enumerationMutation(v97);
                    }
                    objb = v70;
                    v71 = *(void **)(*((void *)&v110 + 1) + 8 * (void)v70);
                    v72 = [v71 objectForKeyedSubscript:@"adamId"];
                    v73 = [v12 objectForKey:v72];
                    v74 = [v71 objectForKeyedSubscript:@"clusterAssignments"];
                    if (v73)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v108 = 0u;
                        long long v109 = 0u;
                        long long v106 = 0u;
                        long long v107 = 0u;
                        v98 = v74;
                        id v75 = v74;
                        id v76 = [v75 countByEnumeratingWithState:&v106 objects:v126 count:16];
                        if (v76)
                        {
                          id v77 = v76;
                          uint64_t v78 = *(void *)v107;
                          do
                          {
                            for (k = 0; k != v77; k = (char *)k + 1)
                            {
                              if (*(void *)v107 != v78) {
                                objc_enumerationMutation(v75);
                              }
                              v80 = [[BLAppClusterMapping alloc] initWithItemID:v72 bundleID:v73 clusterVersionID:v68 dictionary:*(void *)(*((void *)&v106 + 1) + 8 * (void)k)];
                              [(NSMutableOrderedSet *)v11->_clusterMappings addObject:v80];
                            }
                            id v77 = [v75 countByEnumeratingWithState:&v106 objects:v126 count:16];
                          }
                          while (v77);
                        }

                        v12 = v96;
                        v74 = v98;
                      }
                    }

                    v70 = objb + 1;
                  }
                  while (objb + 1 != v102);
                  v102 = (char *)[v97 countByEnumeratingWithState:&v110 objects:v127 count:16];
                }
                while (v102);
              }

              uint64_t v65 = v91;
              v69 = v93;
            }

            uint64_t v66 = v95 + 1;
          }
          while ((id)(v95 + 1) != v94);
          id v94 = [v92 countByEnumeratingWithState:&v114 objects:v128 count:16];
        }
        while (v94);
      }

      id v8 = v88;
      id v9 = v89;
      v41 = v86;
      v62 = v84;
    }
    v81 = [(BLStoreDownloadQueueResponse *)v11 _responseDictionary:v8 valueForProtocolKey:@"trigger-download"];
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v82 = [v81 BOOLValue];
    }
    else {
      unsigned __int8 v82 = 0;
    }
    v11->_triggeredQueueCheck = v82;

    id v10 = v90;
  }

  return v11;
}

- (BLStoreDownloadQueueResponse)initWithError:(id)a3 userIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(BLStoreDownloadQueueResponse *)self _initStoreDownloadQueueResponse];
  id v10 = (BLStoreDownloadQueueResponse *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 4, a3);
    v11 = (NSNumber *)[v8 copy];
    userIdentifier = v10->_userIdentifier;
    v10->_userIdentifier = v11;
  }
  return v10;
}

- (NSOrderedSet)downloads
{
  id v2 = [(NSMutableOrderedSet *)self->_downloads copy];

  return (NSOrderedSet *)v2;
}

- (NSError)error
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10002D010;
  id v10 = sub_10002D020;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D028;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (id)errorForItemIdentifier:(id)a3
{
  return [(NSDictionary *)self->_itemErrors objectForKey:a3];
}

- (NSData)keybag
{
  return self->_keybag;
}

- (NSArray)rangesToLoad
{
  return self->_rangesToLoad;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002D0EC;
  v7[3] = &unk_1001A11A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v7);
}

- (void)setShouldCancelPurchaseBatch:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D184;
  v4[3] = &unk_1001A1D78;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setTriggeredQueueCheck:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D20C;
  v4[3] = &unk_1001A1D78;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (BOOL)shouldCancelPurchaseBatch
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D2C8;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)triggeredQueueCheck
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D388;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSNumber)userIdentifier
{
  return self->_userIdentifier;
}

- (id)_errorWithFailureType:(id)a3 customerMessage:(id)a4 responseDictionary:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (__CFString *)a4;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v8 = 0;
  }
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setObject:v9 forKeyedSubscript:AMSErrorUserInfoKeyServerPayload];

  if (objc_opt_respondsToSelector())
  {
    id v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 integerValue]);
    [v10 setObject:v11 forKeyedSubscript:AMSErrorUserInfoKeyServerErrorCode];

    int v12 = 39;
  }
  else
  {
    int v12 = 0;
  }
  v13 = sub_10004B7C4(v12, v8, 0, v10);

  return v13;
}

- (id)_responseDictionary:(id)a3 valueForProtocolKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKey:@"protocol"];
  uint64_t v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    uint64_t v8 = [v5 objectForKey:v6];
  }

  return v8;
}

- (id)_accountUniqueIdentifierFromValue:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 longLongValue]);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSOrderedSet)clusterMappings
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
  self->_storeCorrelationID = (NSString *)a3;
}

- (NSData)diversitybag
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  self->_clientIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diversitybag, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_itemErrors, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_clusterMappings, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end