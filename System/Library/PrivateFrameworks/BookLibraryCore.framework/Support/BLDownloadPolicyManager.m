@interface BLDownloadPolicyManager
- (BLDatabaseManager)databaseManager;
- (BLDownloadPolicyManager)initWithDatabaseManager:(id)a3;
- (BOOL)addOrUpdateDownloadPolicyWithInfo:(id)a3 withPolicyID:(id)a4 storePlaylistIdentifier:(id)a5;
- (BOOL)addOrUpdateDownloadPolicyWithInfo:(id)a3 withPolicyID:(id)a4 storePlaylistIdentifier:(id)a5 updateAssociated:(BOOL)a6;
- (BOOL)dq_addOrUpdateDownloadPolicyWithInfo:(id)a3 withPolicyID:(id)a4 storePlaylistIdentifier:(id)a5 updateAssociated:(BOOL)a6;
- (NSMutableDictionary)policies;
- (NSMutableDictionary)policiesByStorePlaylistIdentifier;
- (NSMutableDictionary)sizeLimitOverrides;
- (OS_dispatch_queue)dispatchQueue;
- (id)downloadPolicyForID:(id)a3;
- (id)dq_policiesWithStorePlaylistIdentifier:(id)a3;
- (id)overrideDownloadSizeLimitForDownloadIdentifier:(id)a3;
- (void)dq_addOrUpdateInMemoryPolicy:(id)a3 updateAssociated:(BOOL)a4;
- (void)dq_initializePolicy;
- (void)dq_trackByStorePlaylistIdentifierPolicy:(id)a3;
- (void)dq_untrackByStorePlaylistIdentifierPolicy:(id)a3;
- (void)removeOverrideDownloadSizeLimitForDownloadIdentifier:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setOverrideDownloadSizeLimit:(int64_t)a3 forDownloadIdentifier:(id)a4;
- (void)setPolicies:(id)a3;
- (void)setPoliciesByStorePlaylistIdentifier:(id)a3;
- (void)setSizeLimitOverrides:(id)a3;
@end

@implementation BLDownloadPolicyManager

- (BLDownloadPolicyManager)initWithDatabaseManager:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BLDownloadPolicyManager;
  v5 = [(BLDownloadPolicyManager *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_databaseManager, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    policies = v6->_policies;
    v6->_policies = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    policiesByStorePlaylistIdentifier = v6->_policiesByStorePlaylistIdentifier;
    v6->_policiesByStorePlaylistIdentifier = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.bookassetd.BLDownloadPolicyManager", v11);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v12;

    v14 = v6->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002B0D4;
    block[3] = &unk_1001A0FE8;
    v17 = v6;
    dispatch_async(v14, block);
  }
  return v6;
}

- (BOOL)addOrUpdateDownloadPolicyWithInfo:(id)a3 withPolicyID:(id)a4 storePlaylistIdentifier:(id)a5
{
  return [(BLDownloadPolicyManager *)self addOrUpdateDownloadPolicyWithInfo:a3 withPolicyID:a4 storePlaylistIdentifier:a5 updateAssociated:1];
}

- (BOOL)addOrUpdateDownloadPolicyWithInfo:(id)a3 withPolicyID:(id)a4 storePlaylistIdentifier:(id)a5 updateAssociated:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v13 = [(BLDownloadPolicyManager *)self dispatchQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002B240;
  v18[3] = &unk_1001A1D28;
  id v21 = v12;
  v22 = &v24;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  BOOL v23 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(v13, v18);

  LOBYTE(self) = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return (char)self;
}

- (BOOL)dq_addOrUpdateDownloadPolicyWithInfo:(id)a3 withPolicyID:(id)a4 storePlaylistIdentifier:(id)a5 updateAssociated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(BLDownloadPolicyManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v13);

  id v14 = [(NSMutableDictionary *)self->_policies objectForKeyedSubscript:v11];
  id v15 = [v14 info];
  unsigned __int8 v16 = [v15 isEqual:v10];

  if ((v16 & 1) == 0)
  {
    id v17 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v17 encodeObject:v10 forKey:@"Info"];
    [v17 finishEncoding];
    objc_super v18 = [v17 encodedData];
    if (v18)
    {
      id v19 = objc_alloc_init(BLDownloadPolicy);
      id v20 = v19;
      if (v19)
      {
        [(BLDownloadPolicy *)v19 setPolicyID:v11];
        [(BLDownloadPolicy *)v20 setPolicyData:v18];
        [(BLDownloadPolicy *)v20 setStorePlaylistIdentifier:v12];
        [(BLDownloadPolicyManager *)self dq_addOrUpdateInMemoryPolicy:v20 updateAssociated:v6];
        id v21 = [(BLDownloadPolicyManager *)self databaseManager];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10002B460;
        v23[3] = &unk_1001A14B8;
        uint64_t v24 = v20;
        [v21 saveOrUpdateDownloadPolicy:v24 completion:v23];
      }
    }
  }
  return 1;
}

- (id)downloadPolicyForID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10002B680;
  unsigned __int8 v16 = sub_10002B690;
  id v17 = 0;
  v5 = [(BLDownloadPolicyManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B698;
  block[3] = &unk_1001A1D50;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)overrideDownloadSizeLimitForDownloadIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10002B680;
  unsigned __int8 v16 = sub_10002B690;
  id v17 = 0;
  v5 = [(BLDownloadPolicyManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B848;
  block[3] = &unk_1001A1D50;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)removeOverrideDownloadSizeLimitForDownloadIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(BLDownloadPolicyManager *)self dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002B954;
    v6[3] = &unk_1001A11A8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)setOverrideDownloadSizeLimit:(int64_t)a3 forDownloadIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(BLDownloadPolicyManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BA7C;
  block[3] = &unk_1001A17E0;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)dq_addOrUpdateInMemoryPolicy:(id)a3 updateAssociated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BLDownloadPolicyManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 policyID];
  v9 = [(NSMutableDictionary *)self->_policies objectForKey:v8];

  id v10 = [v6 cellularResult];
  int64_t v11 = BLServiceLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      __int16 v30 = 2048;
      id v31 = v10;
      v13 = "[Download-Policy]: Updating download policy %{public}@ with cellularResult %ld";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
    }
  }
  else if (v12)
  {
    *(_DWORD *)buf = 138543618;
    v29 = v8;
    __int16 v30 = 2048;
    id v31 = v10;
    v13 = "[Download-Policy]: Adding download policy %{public}@ with cellularResult %ld";
    goto LABEL_6;
  }

  [(NSMutableDictionary *)self->_policies setObject:v6 forKey:v8];
  uint64_t v14 = [v6 storePlaylistIdentifier];
  id v15 = v14;
  if (v4 && [v14 longLongValue])
  {
    unsigned __int8 v16 = [(BLDownloadPolicyManager *)self dq_policiesWithStorePlaylistIdentifier:v15];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v22 = [v6 policyData];
          [v21 setPolicyData:v22];

          [(BLDownloadPolicyManager *)self dq_addOrUpdateInMemoryPolicy:v21 updateAssociated:0];
        }
        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v18);
    }
  }
  [(BLDownloadPolicyManager *)self dq_trackByStorePlaylistIdentifierPolicy:v6];
}

- (void)dq_initializePolicy
{
  v3 = [(BLDownloadPolicyManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = [(BLDownloadPolicyManager *)self databaseManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BE44;
  v7[3] = &unk_1001A1620;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 fetchListOfAllDownloadPoliciesWithCompletion:v7];
}

- (void)dq_trackByStorePlaylistIdentifierPolicy:(id)a3
{
  id v9 = a3;
  id v4 = [(BLDownloadPolicyManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [v9 storePlaylistIdentifier];
  if ([v5 longLongValue])
  {
    id v6 = [(BLDownloadPolicyManager *)self policiesByStorePlaylistIdentifier];
    id v7 = [v6 objectForKeyedSubscript:v5];

    if (!v7)
    {
      id v7 = objc_alloc_init((Class)NSMutableSet);
      id v8 = [(BLDownloadPolicyManager *)self policiesByStorePlaylistIdentifier];
      [v8 setObject:v7 forKeyedSubscript:v5];
    }
    [v7 addObject:v9];
  }
}

- (void)dq_untrackByStorePlaylistIdentifierPolicy:(id)a3
{
  id v8 = a3;
  id v4 = [(BLDownloadPolicyManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [v8 storePlaylistIdentifier];
  if ([v5 longLongValue])
  {
    id v6 = [(BLDownloadPolicyManager *)self policiesByStorePlaylistIdentifier];
    id v7 = [v6 objectForKeyedSubscript:v5];

    if (v7) {
      [v7 removeObject:v8];
    }
  }
}

- (id)dq_policiesWithStorePlaylistIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(BLDownloadPolicyManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BLDownloadPolicyManager *)self policiesByStorePlaylistIdentifier];
  id v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [v7 copy];

  return v8;
}

- (BLDatabaseManager)databaseManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManager);

  return (BLDatabaseManager *)WeakRetained;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)policies
{
  return self->_policies;
}

- (void)setPolicies:(id)a3
{
}

- (NSMutableDictionary)policiesByStorePlaylistIdentifier
{
  return self->_policiesByStorePlaylistIdentifier;
}

- (void)setPoliciesByStorePlaylistIdentifier:(id)a3
{
}

- (NSMutableDictionary)sizeLimitOverrides
{
  return self->_sizeLimitOverrides;
}

- (void)setSizeLimitOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeLimitOverrides, 0);
  objc_storeStrong((id *)&self->_policiesByStorePlaylistIdentifier, 0);
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_destroyWeak((id *)&self->_databaseManager);
}

@end