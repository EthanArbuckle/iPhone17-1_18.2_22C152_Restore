@interface IDSGroupContextDataSource
- (IDSGroupContextDataSource)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_groupContextCacheMiddleware;
- (id)_groupContextDataSource;
- (int64_t)middlewareCacheCostForContext:(id)a3;
- (void)deleteAllKnownGroupsForGroupContext:(id)a3 completion:(id)a4;
- (void)deleteCachedValueForForGroupContext:(id)a3 withGroupID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 cacheGroup:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 cachedGroupWithID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 fetchAllKnownGroups:(id)a4;
- (void)groupContext:(id)a3 fetchGroupWithID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 latestCachedGroupWithStableID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 upsertGroupWithInfo:(id)a4 previousGroup:(id)a5 completion:(id)a6;
- (void)groupFromPublicDataRepresentation:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)participantsForCypher:(id)a3 completion:(id)a4;
- (void)publicDataRepresentationForGroup:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)setQueue:(id)a3;
- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5;
@end

@implementation IDSGroupContextDataSource

- (IDSGroupContextDataSource)initWithQueue:(id)a3
{
  id v4 = a3;
  if (_IDSRunningInDaemon())
  {
    v5 = [MEMORY[0x1E4F61160] groupContext];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v5);
    }

    v6 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSGroupContextDataSource;
    v7 = [(IDSGroupContextDataSource *)&v11 init];
    if (v7)
    {
      v8 = [MEMORY[0x1E4F61160] groupContext];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_INFO, "Daemon Interfaced Group context controller starting up", v10, 2u);
      }

      [(IDSGroupContextDataSource *)v7 setQueue:v4];
    }
    self = v7;
    v6 = self;
  }

  return v6;
}

- (void)groupContext:(id)a3 upsertGroupWithInfo:(id)a4 previousGroup:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = [(IDSGroupContextDataSource *)self _groupContextDataSource];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_191A2286C;
  v14[3] = &unk_1E572D860;
  v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [v12 upsertGroupWithInfo:v11 previousGroup:v10 completion:v14];
}

- (void)groupContext:(id)a3 fetchGroupWithID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(IDSGroupContextDataSource *)self _groupContextDataSource];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191A22A34;
  v11[3] = &unk_1E572D860;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 fetchGroupWithID:v8 completion:v11];
}

- (void)publicDataRepresentationForGroup:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(IDSGroupContextDataSource *)self _groupContextDataSource];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191A22BFC;
  v11[3] = &unk_1E572D888;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 publicDataRepresentationForGroup:v8 completion:v11];
}

- (void)groupFromPublicDataRepresentation:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(IDSGroupContextDataSource *)self _groupContextDataSource];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191A22DC4;
  v11[3] = &unk_1E572D860;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 groupFromPublicDataRepresentation:v8 completion:v11];
}

- (void)participantsForCypher:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSGroupContextDataSource *)self _groupContextDataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191A22F8C;
  v10[3] = &unk_1E572D8B0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 participantsForCypher:v7 completion:v10];
}

- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IDSGroupContextDataSource *)self _groupContextDataSource];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_191A23154;
  v13[3] = &unk_1E572D8D8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 validateCachedGroup:v10 isParentOfGroup:v9 completion:v13];
}

- (int64_t)middlewareCacheCostForContext:(id)a3
{
  return 200;
}

- (void)groupContext:(id)a3 cacheGroup:(id)a4 completion:(id)a5
{
}

- (void)groupContext:(id)a3 cachedGroupWithID:(id)a4 completion:(id)a5
{
}

- (void)groupContext:(id)a3 latestCachedGroupWithStableID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(IDSGroupContextDataSource *)self _groupContextCacheMiddleware];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191A2332C;
  v11[3] = &unk_1E572D900;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 latestCachedGroupWithStableID:v8 completion:v11];
}

- (void)groupContext:(id)a3 fetchAllKnownGroups:(id)a4
{
  id v5 = a4;
  id v6 = [(IDSGroupContextDataSource *)self _groupContextCacheMiddleware];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191A234B8;
  v8[3] = &unk_1E572B1F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 fetchAllKnownGroups:v8];
}

- (void)deleteAllKnownGroupsForGroupContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(IDSGroupContextDataSource *)self _groupContextCacheMiddleware];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191A23644;
  v8[3] = &unk_1E5729230;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 deleteAllKnownGroupsWithCompletion:v8];
}

- (void)deleteCachedValueForForGroupContext:(id)a3 withGroupID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(IDSGroupContextDataSource *)self _groupContextCacheMiddleware];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191A237BC;
  v11[3] = &unk_1E5729230;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 deleteAllCachedValuesForGroupWithID:v8 WithCompletion:v11];
}

- (id)_groupContextDataSource
{
  v2 = +[IDSDaemonProtocolController sharedInstance];
  v3 = [v2 groupContextDataSource];

  return v3;
}

- (id)_groupContextCacheMiddleware
{
  v2 = +[IDSDaemonProtocolController sharedInstance];
  v3 = [v2 groupContextCacheMiddleware];

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end