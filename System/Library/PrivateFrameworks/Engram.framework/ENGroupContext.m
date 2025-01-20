@interface ENGroupContext
+ (id)_errorWithNotFoundItems:(id)a3;
+ (id)_missingItemsInNotFoundError:(id)a3 remainingErrors:(id *)a4;
- (ENAccountIdentity)accountIdentity;
- (ENGroupContext)initWithAccountIdentity:(id)a3 dataSource:(id)a4 queue:(id)a5;
- (ENGroupContextDataSource)dataSource;
- (NSArray)allMiddlewares;
- (NSMutableArray)middlewares;
- (OS_dispatch_queue)queue;
- (id)_middlwareConformingToProtocol:(id)a3;
- (id)_qCacheMiddlewares;
- (id)_qCacheMiddlewaresContainedInCost:(int64_t)a3;
- (id)_qObserverMiddlewares;
- (void)_cacheGroup:(id)a3 completion:(id)a4;
- (void)_didCacheGroup:(id)a3 completion:(id)a4;
- (void)_didCreateGroup:(id)a3 completion:(id)a4;
- (void)_didReceiveDecryptionFailureForGroup:(id)a3 completion:(id)a4;
- (void)_didReceiveRegistrationIdentityUpdateWithCompletion:(id)a3;
- (void)_didUpdateGroup:(id)a3 withNewGroup:(id)a4 completion:(id)a5;
- (void)_dropLocalCache:(id)a3;
- (void)_dropLocalCacheForGroupID:(id)a3 compeltion:(id)a4;
- (void)_fetchAllLocalKnownGroups:(id)a3;
- (void)_fetchGroupWithGroupID:(id)a3 skipCache:(BOOL)a4 completion:(id)a5;
- (void)_groupFromPublicDataRepresentation:(id)a3 completion:(id)a4;
- (void)_noteDecryptionFailureForGroup:(id)a3 completion:(id)a4;
- (void)_noteRegistrationIdentityUpdate;
- (void)_participantsForCypher:(id)a3 completion:(id)a4;
- (void)_publicDataRepresentationForGroup:(id)a3 completion:(id)a4;
- (void)_qCacheGroup:(id)a3 toMiddlewares:(id)a4 completion:(id)a5;
- (void)_qDidCacheGroup:(id)a3;
- (void)_qDidCreateGroup:(id)a3;
- (void)_qDidReceiveDecryptionFailureForGroup:(id)a3;
- (void)_qDidReceiveRegistrationIdentityUpdate;
- (void)_qDidUpdateGroup:(id)a3 withGroup:(id)a4;
- (void)_qFetchCachedGroupWithGroupID:(id)a3 completion:(id)a4;
- (void)_qFetchDataSourceGroupWithGroupID:(id)a3 completion:(id)a4;
- (void)_qUpsertGroupWithParticipants:(id)a3 previousGroup:(id)a4 sharedApplicationData:(id)a5 completion:(id)a6;
- (void)_validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5;
- (void)appendMiddleware:(id)a3;
- (void)cacheIncomingGroup:(id)a3 completion:(id)a4;
- (void)createGroupWithParticipants:(id)a3 sharedApplicationData:(id)a4 completion:(id)a5;
- (void)fetchGroupWithGroupID:(id)a3 completion:(id)a4;
- (void)fetchLatestGroupWithStableID:(id)a3 completion:(id)a4;
- (void)removeMiddleware:(id)a3;
- (void)setAccountIdentity:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setMiddlewares:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateGroup:(id)a3 withParticipants:(id)a4 sharedApplicationData:(id)a5 completion:(id)a6;
@end

@implementation ENGroupContext

- (ENGroupContext)initWithAccountIdentity:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ENGroupContext;
  v12 = [(ENGroupContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountIdentity, a3);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    middlewares = v13->_middlewares;
    v13->_middlewares = v14;

    objc_storeStrong((id *)&v13->_dataSource, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)createGroupWithParticipants:(id)a3 sharedApplicationData:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = a3;
  id v10 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v10);

  [(ENGroupContext *)self _qUpsertGroupWithParticipants:v11 previousGroup:0 sharedApplicationData:v9 completion:v8];
}

- (void)updateGroup:(id)a3 withParticipants:(id)a4 sharedApplicationData:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v14 = a3;
  v13 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v13);

  [(ENGroupContext *)self _qUpsertGroupWithParticipants:v12 previousGroup:v14 sharedApplicationData:v11 completion:v10];
}

- (void)fetchGroupWithGroupID:(id)a3 completion:(id)a4
{
}

- (void)fetchLatestGroupWithStableID:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v8);

  v22 = _os_activity_create(&dword_1DD450000, "Fetch latest group by StableGroupID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v22, &state);
  id v9 = +[ENLog groupContext];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl(&dword_1DD450000, v9, OS_LOG_TYPE_DEFAULT, "!setState stableGroupID=%@", buf, 0xCu);
  }

  id v10 = objc_alloc(MEMORY[0x1E4F59DF0]);
  id v11 = [(ENGroupContext *)self _qCacheMiddlewares];
  id v12 = (void *)[v10 initWithInput:v11 initialValue:0];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1DD456000;
  v19[3] = &unk_1E6CC5000;
  v19[4] = self;
  id v13 = v6;
  id v20 = v13;
  [v12 setReducerBlock:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DD456214;
  v16[3] = &unk_1E6CC5028;
  id v14 = v7;
  id v18 = v14;
  id v15 = v13;
  id v17 = v15;
  [v12 reduceWithCompletion:v16];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)cacheIncomingGroup:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v8);

  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v18 = _os_activity_create(&dword_1DD450000, "Cache Incoming Group", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v18, &state);
  id v9 = +[ENLog groupContext];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_1DD450000, v9, OS_LOG_TYPE_DEFAULT, "!setState newGroup=%@", buf, 0xCu);
  }

  id v10 = [v6 groupID];
  id v11 = [v10 stableGroupID];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DD456690;
  v14[3] = &unk_1E6CC50F0;
  v14[4] = self;
  id v12 = v6;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  [(ENGroupContext *)self fetchLatestGroupWithStableID:v11 completion:v14];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)appendMiddleware:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[ENLog groupContext];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1DD450000, v6, OS_LOG_TYPE_INFO, "Adding middleware {middleware: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(ENGroupContext *)self middlewares];
  [v7 addObject:v4];
}

- (void)removeMiddleware:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[ENLog groupContext];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1DD450000, v6, OS_LOG_TYPE_INFO, "Removing middleware {middleware: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(ENGroupContext *)self middlewares];
  [v7 removeObject:v4];
}

- (NSArray)allMiddlewares
{
  v3 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ENGroupContext *)self middlewares];
  v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

- (void)_didCreateGroup:(id)a3 completion:(id)a4
{
  int v8 = (void (**)(id, void))a4;
  id v6 = a3;
  id v7 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v7);

  [(ENGroupContext *)self _qDidCreateGroup:v6];
  v8[2](v8, 0);
}

- (void)_didCacheGroup:(id)a3 completion:(id)a4
{
  int v8 = (void (**)(id, void))a4;
  id v6 = a3;
  id v7 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v7);

  [(ENGroupContext *)self _qDidCacheGroup:v6];
  v8[2](v8, 0);
}

- (void)_didUpdateGroup:(id)a3 withNewGroup:(id)a4 completion:(id)a5
{
  id v11 = (void (**)(id, void))a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v10);

  [(ENGroupContext *)self _qDidUpdateGroup:v9 withGroup:v8];
  v11[2](v11, 0);
}

- (void)_didReceiveDecryptionFailureForGroup:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, void))a4;
  id v6 = a3;
  id v7 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v7);

  [(ENGroupContext *)self _qDidReceiveDecryptionFailureForGroup:v6];
  v8[2](v8, 0);
}

- (void)_didReceiveRegistrationIdentityUpdateWithCompletion:(id)a3
{
  v5 = (void (**)(id, void))a3;
  id v4 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v4);

  [(ENGroupContext *)self _qDidReceiveRegistrationIdentityUpdate];
  v5[2](v5, 0);
}

- (void)_cacheGroup:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(ENGroupContext *)self _qCacheMiddlewares];
  [(ENGroupContext *)self _qCacheGroup:v7 toMiddlewares:v9 completion:v6];
}

- (void)_fetchAllLocalKnownGroups:(id)a3
{
  id v4 = a3;
  v5 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ENGroupContext *)self _qCacheMiddlewaresContainedInCost:300];
  id v7 = objc_alloc(MEMORY[0x1E4F59DF0]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = (void *)[v7 initWithInput:v6 initialValue:v8];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DD45731C;
  v13[3] = &unk_1E6CC5140;
  v13[4] = self;
  [v9 setReducerBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DD45747C;
  v11[3] = &unk_1E6CC5168;
  id v12 = v4;
  id v10 = v4;
  [v9 reduceWithCompletion:v11];
}

- (void)_dropLocalCache:(id)a3
{
  id v4 = a3;
  v5 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ENGroupContext *)self _qCacheMiddlewaresContainedInCost:300];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F59DF0]) initWithInput:v6 initialValue:&stru_1F38A4580];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DD457670;
  v11[3] = &unk_1E6CC5140;
  void v11[4] = self;
  [v7 setReducerBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DD45777C;
  v9[3] = &unk_1E6CC5168;
  id v10 = v4;
  id v8 = v4;
  [v7 reduceWithCompletion:v9];
}

- (void)_dropLocalCacheForGroupID:(id)a3 compeltion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(ENGroupContext *)self _qCacheMiddlewaresContainedInCost:300];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F59DF0]) initWithInput:v9 initialValue:&stru_1F38A4580];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DD4578FC;
  v15[3] = &unk_1E6CC5000;
  v15[4] = self;
  id v16 = v6;
  id v11 = v6;
  [v10 setReducerBlock:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DD457A0C;
  v13[3] = &unk_1E6CC5168;
  id v14 = v7;
  id v12 = v7;
  [v10 reduceWithCompletion:v13];
}

- (void)_publicDataRepresentationForGroup:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(ENGroupContext *)self dataSource];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DD457B00;
  v11[3] = &unk_1E6CC51B8;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 publicDataRepresentationForGroup:v7 inContext:self completion:v11];
}

- (void)_groupFromPublicDataRepresentation:(id)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([v6 length])
  {
    id v9 = [(ENGroupContext *)self dataSource];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1DD457D40;
    v14[3] = &unk_1E6CC50C8;
    v14[4] = self;
    id v15 = v7;
    [v9 groupFromPublicDataRepresentation:v6 inContext:self completion:v14];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = ENGroupIDErrorDomain;
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Received group data is nil or empty";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v13 = [v10 errorWithDomain:v11 code:-4000 userInfo:v12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

- (void)_fetchGroupWithGroupID:(id)a3 skipCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v10);

  uint64_t v25 = _os_activity_create(&dword_1DD450000, "Fetch group by GroupID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v25, &state);
  id v11 = +[ENLog groupContext];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v8;
    _os_log_impl(&dword_1DD450000, v11, OS_LOG_TYPE_DEFAULT, "!setState groupID=%@", buf, 0xCu);
  }

  id v12 = +[ENLog groupContext];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [NSNumber numberWithBool:v6];
    *(_DWORD *)buf = 138412290;
    id v27 = v13;
    _os_log_impl(&dword_1DD450000, v12, OS_LOG_TYPE_DEFAULT, "!setState skipCache=%@", buf, 0xCu);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1DD4580D4;
  v21[3] = &unk_1E6CC5208;
  v21[4] = self;
  id v14 = v8;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  uint64_t v16 = MEMORY[0x1E01B5EF0](v21);
  id v17 = (void *)v16;
  if (v6)
  {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1DD458310;
    v18[3] = &unk_1E6CC5230;
    v18[4] = self;
    id v19 = v15;
    id v20 = v17;
    [(ENGroupContext *)self _qFetchCachedGroupWithGroupID:v14 completion:v18];
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_participantsForCypher:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(ENGroupContext *)self dataSource];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DD4584F8;
  v11[3] = &unk_1E6CC5258;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 participantsForCypher:v7 completion:v11];
}

- (void)_noteDecryptionFailureForGroup:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = +[ENLog groupContext];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1DD450000, v9, OS_LOG_TYPE_DEFAULT, "Noting decryption failure", v10, 2u);
  }

  [(ENGroupContext *)self _qDidReceiveDecryptionFailureForGroup:v7];
  v6[2](v6, 0);
}

- (void)_noteRegistrationIdentityUpdate
{
  v3 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[ENLog groupContext];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD450000, v4, OS_LOG_TYPE_DEFAULT, "Noting registration identity update", v5, 2u);
  }

  [(ENGroupContext *)self _qDidReceiveRegistrationIdentityUpdate];
}

- (void)_validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(ENGroupContext *)self dataSource];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DD4587D8;
  v14[3] = &unk_1E6CC5280;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v12 validateCachedGroup:v10 isParentOfGroup:v9 completion:v14];
}

- (void)_qCacheGroup:(id)a3 toMiddlewares:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ENLog groupContext];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD450000, v11, OS_LOG_TYPE_INFO, "Caching group", buf, 2u);
  }

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F59DF0]) initWithInput:v9 initialValue:&stru_1F38A4580];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1DD458B50;
  v36[3] = &unk_1E6CC5000;
  v36[4] = self;
  id v13 = v8;
  id v37 = v13;
  [v12 setReducerBlock:v36];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  *(void *)buf = 0;
  v29 = buf;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1DD458CE4;
  v32 = sub_1DD458CF4;
  id v33 = 0;
  id v14 = [v13 groupID];
  id v15 = [v14 stableGroupID];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1DD458CFC;
  v24[3] = &unk_1E6CC52A8;
  id v16 = v13;
  id v25 = v16;
  v26 = v34;
  id v27 = buf;
  [(ENGroupContext *)self fetchLatestGroupWithStableID:v15 completion:v24];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1DD458E90;
  v19[3] = &unk_1E6CC52D0;
  v19[4] = self;
  id v17 = v16;
  id v20 = v17;
  id v22 = v34;
  id v23 = buf;
  id v18 = v10;
  id v21 = v18;
  [v12 reduceWithCompletion:v19];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v34, 8);
}

- (id)_qCacheMiddlewares
{
  v3 = [(ENGroupContext *)self _middlwareConformingToProtocol:&unk_1F38A8950];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1DD459060;
  v6[3] = &unk_1E6CC52F8;
  v6[4] = self;
  id v4 = [v3 sortedArrayUsingComparator:v6];

  return v4;
}

- (id)_qObserverMiddlewares
{
  return [(ENGroupContext *)self _middlwareConformingToProtocol:&unk_1F38A91E0];
}

- (id)_middlwareConformingToProtocol:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(ENGroupContext *)self middlewares];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 conformsToProtocol:v4]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_qCacheMiddlewaresContainedInCost:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(ENGroupContext *)self _qCacheMiddlewares];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "middlewareCacheCostForContext:", self, (void)v14) <= a3) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)_qUpsertGroupWithParticipants:(id)a3 previousGroup:(id)a4 sharedApplicationData:(id)a5 completion:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v33 = _os_activity_create(&dword_1DD450000, "Create Group", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v33, &state);
  long long v14 = +[ENLog groupContext];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
    *(_DWORD *)buf = 138412290;
    id v35 = v15;
    _os_log_impl(&dword_1DD450000, v14, OS_LOG_TYPE_DEFAULT, "!setState applicationData.length=%@", buf, 0xCu);
  }
  long long v16 = +[ENLog groupContext];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    long long v17 = NSNumber;
    uint64_t v18 = [(ENGroupContext *)self middlewares];
    uint64_t v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    *(_DWORD *)buf = 138412290;
    id v35 = v19;
    _os_log_impl(&dword_1DD450000, v16, OS_LOG_TYPE_DEFAULT, "!setState middlewares.count=%@", buf, 0xCu);
  }
  id v20 = +[ENLog groupContext];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    *(_DWORD *)buf = 138412290;
    id v35 = v21;
    _os_log_impl(&dword_1DD450000, v20, OS_LOG_TYPE_DEFAULT, "!setState participatns.count=%@", buf, 0xCu);
  }
  id v22 = +[ENLog groupContext];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v35 = v10;
    _os_log_impl(&dword_1DD450000, v22, OS_LOG_TYPE_INFO, "Creating group {participants: %{private}@}", buf, 0xCu);
  }

  id v23 = [_ENGroupInfo alloc];
  id v24 = [(ENGroupContext *)self accountIdentity];
  id v25 = [(_ENGroupInfo *)v23 initWithAccountIdentity:v24 paricipants:v10 sharedApplicationData:v12];

  v26 = [(ENGroupContext *)self dataSource];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1DD4597A0;
  v29[3] = &unk_1E6CC5340;
  v29[4] = self;
  id v27 = v13;
  id v31 = v27;
  id v28 = v11;
  id v30 = v28;
  [v26 groupContext:self upsertGroupWithInfo:v25 previousGroup:v28 completion:v29];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_qFetchCachedGroupWithGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[ENLog groupContext];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD450000, v8, OS_LOG_TYPE_INFO, "Fetching from Caches", buf, 2u);
  }

  uint64_t v9 = [(ENGroupContext *)self _qCacheMiddlewares];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F59DF0]) initWithInput:v9 initialValue:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DD459C20;
  v15[3] = &unk_1E6CC5000;
  v15[4] = self;
  id v16 = v6;
  id v11 = v6;
  [v10 setReducerBlock:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DD459E68;
  v13[3] = &unk_1E6CC5168;
  id v14 = v7;
  id v12 = v7;
  [v10 reduceWithCompletion:v13];
}

- (void)_qFetchDataSourceGroupWithGroupID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ENGroupContext *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = +[ENLog groupContext];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD450000, v9, OS_LOG_TYPE_INFO, "Fetching from DataSource", buf, 2u);
  }

  id v10 = [(ENGroupContext *)self dataSource];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DD45A030;
  v12[3] = &unk_1E6CC50C8;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 groupContext:self fetchGroupWithID:v7 completion:v12];
}

- (void)_qDidCreateGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(ENGroupContext *)self _qObserverMiddlewares];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 groupContext:self didCreateGroup:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_qDidCacheGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(ENGroupContext *)self _qObserverMiddlewares];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 groupContext:self didCacheGroup:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_qDidUpdateGroup:(id)a3 withGroup:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(ENGroupContext *)self _qObserverMiddlewares];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 groupContext:self didUpdateGroup:v6 withNewGroup:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_qDidReceiveDecryptionFailureForGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(ENGroupContext *)self _qObserverMiddlewares];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 groupContext:self didReceiveDecryptionFailureForGroup:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_qDidReceiveRegistrationIdentityUpdate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[ENLog groupContext];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(ENGroupContext *)self _qObserverMiddlewares];
    *(_DWORD *)buf = 138543362;
    long long v17 = v4;
    _os_log_impl(&dword_1DD450000, v3, OS_LOG_TYPE_INFO, "Did receive registration identity update {observerMiddlewares: %{public}@}", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(ENGroupContext *)self _qObserverMiddlewares];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 groupContextDidReceiveRegistrationIdentityUpdate:self];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

+ (id)_errorWithNotFoundItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          long long v11 = (void *)MEMORY[0x1E4F28C58];
          id v24 = @"ENGroupContextErrorItemKey";
          uint64_t v25 = v10;
          long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          long long v13 = [v11 errorWithDomain:@"ENGroupContextErrorDomain" code:-2000 userInfo:v12];

          [v4 setObject:v13 forKey:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v7);
    }

    long long v14 = (void *)MEMORY[0x1E4F28C58];
    id v22 = @"ENGroupContextErrorItemKey";
    id v23 = v4;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v16 = [v14 errorWithDomain:@"ENGroupContextErrorDomain" code:-3000 userInfo:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)_missingItemsInNotFoundError:(id)a3 remainingErrors:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v44 = _os_activity_create(&dword_1DD450000, "Find missing items in error", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v44, &state);
  id v37 = v4;
  if (!v4)
  {
    long long v12 = +[ENLog groupContext];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = 0;
      long long v13 = "No error -- Fail {error: %{public}@}";
LABEL_12:
      _os_log_impl(&dword_1DD450000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    }
LABEL_13:
    v38 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_14:

    id v10 = v38;
    long long v11 = v10;
    goto LABEL_15;
  }
  id v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"ENGroupContextErrorDomain"];

  if (!v6)
  {
    long long v12 = +[ENLog groupContext];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = (uint64_t)v37;
      long long v13 = "Unexpected domain -- Fail {error: %{public}@}";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if ([v37 code] != -2000)
  {
    if ([v37 code] != -3000)
    {
      long long v12 = +[ENLog groupContext];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = (uint64_t)v37;
      long long v13 = "Unexpected code -- Fail {error: %{public}@}";
      goto LABEL_12;
    }
    long long v15 = [v37 userInfo];
    id v35 = [v15 objectForKeyedSubscript:@"ENGroupContextErrorItemKey"];

    if (!v35)
    {
      uint64_t v16 = +[ENLog groupContext];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v50 = (uint64_t)v37;
        _os_log_impl(&dword_1DD450000, v16, OS_LOG_TYPE_DEFAULT, "No items -- Fail {error: %{public}@}", buf, 0xCu);
      }
      v38 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_57:

      long long v12 = v35;
      goto LABEL_14;
    }
    uint64_t v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSObject count](v35, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v17 = v35;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (!v18) {
      goto LABEL_39;
    }
    uint64_t v19 = *(void *)v40;
LABEL_22:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v40 != v19) {
        objc_enumerationMutation(v17);
      }
      long long v21 = *(void **)(*((void *)&v39 + 1) + 8 * v20);
      id v22 = objc_msgSend(v21, "domain", v35);
      if (![v22 isEqualToString:@"ENGroupContextErrorDomain"]) {
        break;
      }
      BOOL v23 = [v21 code] == -2000;

      if (!v23) {
        goto LABEL_30;
      }
      id v24 = [v21 userInfo];
      uint64_t v25 = [v24 objectForKeyedSubscript:@"ENGroupContextErrorItemKey"];

      if (v25)
      {
        [v38 addObject:v25];
      }
      else
      {
        uint64_t v27 = +[ENLog groupContext];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v50 = (uint64_t)v21;
          _os_log_impl(&dword_1DD450000, v27, OS_LOG_TYPE_DEFAULT, "Missing item -- Ignore {suberror: %{public}@}", buf, 0xCu);
        }
      }
LABEL_37:
      if (v18 == ++v20)
      {
        uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (!v18)
        {
LABEL_39:

          if ([v16 count])
          {
            id v28 = +[ENLog groupContext];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v29 = [v16 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v50 = v29;
              _os_log_impl(&dword_1DD450000, v28, OS_LOG_TYPE_DEFAULT, "Found remaining errors {remainingErrors.count: %ld}", buf, 0xCu);
            }

            if (a4)
            {
              id v30 = (void *)MEMORY[0x1E4F28C58];
              v45 = @"ENGroupContextErrorItemKey";
              v46 = v16;
              id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
              *a4 = [v30 errorWithDomain:@"ENGroupContextErrorDomain" code:-3000 userInfo:v31];
            }
            else
            {
              id v31 = +[ENLog groupContext];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v32 = [v16 count];
                *(_DWORD *)buf = 134217984;
                uint64_t v50 = v32;
                _os_log_impl(&dword_1DD450000, v31, OS_LOG_TYPE_DEFAULT, "Ignorning remaining errors due to missing out error parameter {remainingErrors.count: %ld}", buf, 0xCu);
              }
            }
          }
          id v33 = +[ENLog groupContext];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            uint64_t v34 = [v38 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v50 = v34;
            _os_log_impl(&dword_1DD450000, v33, OS_LOG_TYPE_INFO, "Found missing items -- Done {items.count: %ld}", buf, 0xCu);
          }

          goto LABEL_57;
        }
        goto LABEL_22;
      }
    }

LABEL_30:
    v26 = +[ENLog groupContext];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = (uint64_t)v21;
      _os_log_impl(&dword_1DD450000, v26, OS_LOG_TYPE_DEFAULT, "Unexpected error -- Collect {suberror: %{public}@}", buf, 0xCu);
    }

    [v16 addObject:v21];
    goto LABEL_37;
  }
  uint64_t v7 = [v37 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"ENGroupContextErrorItemKey"];

  if (!v8)
  {
    long long v12 = +[ENLog groupContext];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v50 = (uint64_t)v37;
    long long v13 = "Missing item -- Fail {error: %{public}@";
    goto LABEL_12;
  }
  uint64_t v9 = +[ENLog groupContext];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v50 = (uint64_t)v8;
    _os_log_impl(&dword_1DD450000, v9, OS_LOG_TYPE_INFO, "Found one item {item: %{public}@}", buf, 0xCu);
  }

  v48 = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];

  long long v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_15:

  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (ENAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (void)setAccountIdentity:(id)a3
{
}

- (NSMutableArray)middlewares
{
  return self->_middlewares;
}

- (void)setMiddlewares:(id)a3
{
}

- (ENGroupContextDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allMiddlewares, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_middlewares, 0);
  objc_storeStrong((id *)&self->_accountIdentity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end