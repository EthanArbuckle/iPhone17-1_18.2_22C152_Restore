@interface _MPStoreSocialTransientState
- (BOOL)isEqual:(id)a3;
- (MPModelSocialPerson)person;
- (_MPStoreSocialTransientState)initWithPerson:(id)a3;
- (id)completionBlock;
- (id)newOperationForTransientFollowPendingRequestState:(int64_t)a3 completion:(id)a4;
- (id)newOperationForTransientFollowState:(int64_t)a3 completion:(id)a4;
- (int64_t)followPendingRequestState;
- (int64_t)followState;
- (unint64_t)hash;
- (void)_endIfNeeded;
- (void)setCompletionBlock:(id)a3;
@end

@implementation _MPStoreSocialTransientState

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_latestFollowPendingRequestOperation, 0);
  objc_storeStrong((id *)&self->_latestFollowOperation, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (MPModelSocialPerson)person
{
  return self->_person;
}

- (unint64_t)hash
{
  v2 = [(MPModelObject *)self->_person identifiers];
  v3 = [v2 universalStore];
  v4 = [v3 socialProfileID];
  unint64_t v5 = [v4 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [v4 person];
    v6 = [v5 identifiers];
    v7 = [v6 universalStore];
    v8 = [v7 socialProfileID];
    v9 = [(MPModelObject *)self->_person identifiers];
    v10 = [v9 universalStore];
    v11 = [v10 socialProfileID];
    char v12 = [v8 isEqualToString:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)_endIfNeeded
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__81;
  v14 = __Block_byref_object_dispose__82;
  id v15 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___MPStoreSocialTransientState__endIfNeeded__block_invoke;
  block[3] = &unk_1E57F9278;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v6;
  dispatch_sync(accessQueue, block);
  uint64_t v4 = v11[5];
  if (v4 && *((unsigned char *)v7 + 24)) {
    (*(void (**)(uint64_t, _MPStoreSocialTransientState *))(v4 + 16))(v4, self);
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (id)newOperationForTransientFollowPendingRequestState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = a3;
  if (a3 != 1)
  {
    if (a3 != 2)
    {
LABEL_8:
      [(_MPStoreSocialTransientState *)self _endIfNeeded];
      v16 = 0;
      goto LABEL_9;
    }
    int64_t v7 = 3;
  }
  uint64_t v8 = [[MPStoreSocialPendingFollowRequestOperationDataSource alloc] initWithAction:v7];
  if (!v8) {
    goto LABEL_8;
  }
  char v9 = v8;
  [(MPStoreSocialPendingFollowRequestOperationDataSource *)v8 setPerson:self->_person];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke;
  block[3] = &unk_1E57F9F20;
  block[4] = self;
  block[5] = v39;
  dispatch_sync(accessQueue, block);
  v11 = [[MPStoreSocialRequestOperation alloc] initWithDataSource:v9];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_2;
  v31[3] = &unk_1E57F9200;
  objc_copyWeak(&v34, &location);
  objc_copyWeak(v35, &from);
  v33 = v39;
  v31[4] = self;
  id v32 = v6;
  v35[1] = (id)a3;
  [(MPStoreSocialRequestOperation *)v11 setResponseHandler:v31];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_6;
  v28[3] = &unk_1E57F9228;
  objc_copyWeak(&v29, &location);
  objc_copyWeak(&v30, &from);
  [(MPStoreSocialRequestOperation *)v11 setCompletionBlock:v28];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__52681;
  v26 = __Block_byref_object_dispose__52682;
  id v27 = 0;
  uint64_t v12 = self->_accessQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_8;
  v21[3] = &unk_1E57F9F20;
  v21[4] = self;
  v21[5] = &v22;
  dispatch_sync(v12, v21);
  if (v23[5]) {
    -[MPStoreSocialRequestOperation addDependency:](v11, "addDependency:");
  }
  v13 = self->_accessQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_9;
  v18[3] = &unk_1E57F9250;
  v18[4] = self;
  int64_t v20 = a3;
  v14 = v11;
  v19 = v14;
  dispatch_barrier_async(v13, v18);
  id v15 = v19;
  v16 = v14;

  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);

  objc_destroyWeak(v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(v39, 8);

LABEL_9:
  return v16;
}

- (int64_t)followPendingRequestState
{
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57___MPStoreSocialTransientState_followPendingRequestState__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)newOperationForTransientFollowState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 1:
    case 3:
      int64_t v7 = MPStoreSocialFollowOperationDataSource;
      goto LABEL_7;
    case 2:
      uint64_t v8 = [[MPStoreSocialPendingFollowRequestOperationDataSource alloc] initWithAction:2];
      goto LABEL_8;
    case 4:
      int64_t v7 = MPStoreSocialUnfollowOperationDataSource;
      goto LABEL_7;
    case 5:
      int64_t v7 = MPStoreSocialBlockOperationDataSource;
      goto LABEL_7;
    case 6:
      int64_t v7 = MPStoreSocialUnblockOperationDataSource;
LABEL_7:
      uint64_t v8 = (MPStoreSocialPendingFollowRequestOperationDataSource *)objc_alloc_init(v7);
LABEL_8:
      uint64_t v9 = v8;
      if (!v8) {
        goto LABEL_12;
      }
      [(MPStoreSocialPendingFollowRequestOperationDataSource *)v8 setPerson:self->_person];
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x2020000000;
      v39[3] = 0;
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke;
      block[3] = &unk_1E57F9F20;
      block[4] = self;
      block[5] = v39;
      dispatch_sync(accessQueue, block);
      v11 = [[MPStoreSocialRequestOperation alloc] initWithDataSource:v9];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v11);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_2;
      v31[3] = &unk_1E57F9200;
      objc_copyWeak(&v34, &location);
      objc_copyWeak(v35, &from);
      v33 = v39;
      v31[4] = self;
      id v32 = v6;
      v35[1] = (id)a3;
      [(MPStoreSocialRequestOperation *)v11 setResponseHandler:v31];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_6;
      v28[3] = &unk_1E57F9228;
      objc_copyWeak(&v29, &location);
      objc_copyWeak(&v30, &from);
      [(MPStoreSocialRequestOperation *)v11 setCompletionBlock:v28];
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__52681;
      v26 = __Block_byref_object_dispose__52682;
      id v27 = 0;
      uint64_t v12 = self->_accessQueue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_8;
      v21[3] = &unk_1E57F9F20;
      v21[4] = self;
      v21[5] = &v22;
      dispatch_sync(v12, v21);
      if (v23[5]) {
        -[MPStoreSocialRequestOperation addDependency:](v11, "addDependency:");
      }
      v13 = self->_accessQueue;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_9;
      v18[3] = &unk_1E57F9250;
      v18[4] = self;
      int64_t v20 = a3;
      v14 = v11;
      v19 = v14;
      dispatch_barrier_async(v13, v18);
      id v15 = v19;
      v16 = v14;

      _Block_object_dispose(&v22, 8);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&v29);

      objc_destroyWeak(v35);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      _Block_object_dispose(v39, 8);

      break;
    default:
LABEL_12:
      [(_MPStoreSocialTransientState *)self _endIfNeeded];
      v16 = 0;
      break;
  }

  return v16;
}

- (int64_t)followState
{
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43___MPStoreSocialTransientState_followState__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (_MPStoreSocialTransientState)initWithPerson:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPStoreSocialTransientState;
  unint64_t v5 = [(_MPStoreSocialTransientState *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifiers];
    uint64_t v7 = [v4 copyWithIdentifiers:v6 block:&__block_literal_global_52733];
    person = v5->_person;
    v5->_person = (MPModelSocialPerson *)v7;

    v5->_followState = 0;
    v5->_followPendingRequestState = 0;
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaPlayer._MPStoreSocialTransientState.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MediaPlayer._MPStoreSocialTransientState.calloutQueue", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v11;
  }
  return v5;
}

@end