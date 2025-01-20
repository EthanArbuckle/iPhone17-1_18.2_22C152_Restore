@interface MPStoreSocialServiceController
+ (id)_internalErrorForHTTPResponseCode:(int64_t)a3;
- (MPStoreSocialServiceController)init;
- (id)_newOperationForRemovingFollower:(id)a3 completion:(id)a4;
- (id)_transientStateForPerson:(id)a3 shouldCreate:(BOOL)a4;
- (int64_t)transientFollowPendingRequestStateForPerson:(id)a3;
- (int64_t)transientFollowStateForPerson:(id)a3;
- (void)_notifyTransientStatesDidChangeWithSnapshot:(id)a3;
- (void)_performTransientFollowPendingRequestState:(int64_t)a3 onPerson:(id)a4 completion:(id)a5;
- (void)_performTransientFollowState:(int64_t)a3 onPerson:(id)a4 completion:(id)a5;
- (void)_populateTransientStatesSnapshot:(id)a3;
- (void)_queue_transientStatesDidChange;
- (void)_transientStatesDidChange;
- (void)acceptAllFollowRequestsWithCompletion:(id)a3;
- (void)acceptFollowRequestFromPerson:(id)a3 completion:(id)a4;
- (void)blockPerson:(id)a3 completion:(id)a4;
- (void)cancelFollowRequestOnPerson:(id)a3 completion:(id)a4;
- (void)declineFollowRequestFromPerson:(id)a3 completion:(id)a4;
- (void)followPerson:(id)a3 completion:(id)a4;
- (void)removeFollower:(id)a3 completion:(id)a4;
- (void)requestFollowPerson:(id)a3 completion:(id)a4;
- (void)unblockPerson:(id)a3 completion:(id)a4;
- (void)unfollowPerson:(id)a3 completion:(id)a4;
@end

@implementation MPStoreSocialServiceController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientStates, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (id)_newOperationForRemovingFollower:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MPStoreSocialRemoveFollowerOperationDataSource);
  [(MPStoreSocialRemoveFollowerOperationDataSource *)v7 setPerson:v6];

  v8 = [[MPStoreSocialRequestOperation alloc] initWithDataSource:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__MPStoreSocialServiceController__newOperationForRemovingFollower_completion___block_invoke;
  v11[3] = &unk_1E57F9168;
  id v12 = v5;
  id v9 = v5;
  [(MPStoreSocialRequestOperation *)v8 setResponseHandler:v11];

  return v8;
}

void __78__MPStoreSocialServiceController__newOperationForRemovingFollower_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__MPStoreSocialServiceController__newOperationForRemovingFollower_completion___block_invoke_2;
    v6[3] = &unk_1E57F9140;
    id v8 = v5;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __78__MPStoreSocialServiceController__newOperationForRemovingFollower_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_queue_transientStatesDidChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = objc_alloc_init(MPStoreSocialServiceTransientStatesSnapshot);
  [(MPStoreSocialServiceController *)self _populateTransientStatesSnapshot:v3];
  id v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__MPStoreSocialServiceController__queue_transientStatesDidChange__block_invoke;
  v6[3] = &unk_1E57F9F98;
  void v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __65__MPStoreSocialServiceController__queue_transientStatesDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyTransientStatesDidChangeWithSnapshot:*(void *)(a1 + 40)];
}

- (void)_transientStatesDidChange
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_accessQueue);
  v3 = objc_alloc_init(MPStoreSocialServiceTransientStatesSnapshot);
  accessQueue = self->_accessQueue;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __59__MPStoreSocialServiceController__transientStatesDidChange__block_invoke;
  id v9 = &unk_1E57F9F98;
  v10 = self;
  v11 = v3;
  id v5 = v3;
  dispatch_sync(accessQueue, &v6);
  -[MPStoreSocialServiceController _notifyTransientStatesDidChangeWithSnapshot:](self, "_notifyTransientStatesDidChangeWithSnapshot:", v5, v6, v7, v8, v9, v10);
}

uint64_t __59__MPStoreSocialServiceController__transientStatesDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _populateTransientStatesSnapshot:*(void *)(a1 + 40)];
}

- (void)_notifyTransientStatesDidChangeWithSnapshot:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  id v8 = @"MPStoreSocialServiceControllerTransientStatesSnapshotKey";
  v9[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"MPStoreSocialServiceControllerTransientStatesDidChangeNotification" object:self userInfo:v7];
}

- (void)_populateTransientStatesSnapshot:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_transientStates;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "followState", (void)v14);
        uint64_t v12 = [v10 followPendingRequestState];
        v13 = [v10 person];
        [v4 _addTransientFollowState:v11 transientFollowPendingRequestState:v12 forPerson:v13];
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)_transientStateForPerson:(id)a3 shouldCreate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__52681;
  v29 = __Block_byref_object_dispose__52682;
  id v30 = 0;
  uint64_t v7 = [v6 identifiers];
  uint64_t v8 = [v7 universalStore];
  id v9 = [v8 socialProfileID];

  if ([v9 length])
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke;
    block[3] = &unk_1E57F9F48;
    block[4] = self;
    id v23 = v9;
    v24 = &v25;
    dispatch_sync(accessQueue, block);
  }
  uint64_t v11 = (void *)v26[5];
  if (!v11 && v4)
  {
    uint64_t v12 = [[_MPStoreSocialTransientState alloc] initWithPerson:v6];
    v13 = (void *)v26[5];
    v26[5] = (uint64_t)v12;

    objc_initWeak(&location, self);
    long long v14 = (void *)v26[5];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_3;
    v19[3] = &unk_1E57F9118;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    [v14 setCompletionBlock:v19];
    long long v15 = self->_accessQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_5;
    v18[3] = &unk_1E57F9F20;
    v18[4] = self;
    v18[5] = &v25;
    dispatch_barrier_async(v15, v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    uint64_t v11 = (void *)v26[5];
  }
  id v16 = v11;

  _Block_object_dispose(&v25, 8);

  return v16;
}

void __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_2;
  v5[3] = &unk_1E57F90F0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_4;
    block[3] = &unk_1E57FA038;
    block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v5;
    dispatch_barrier_async(v6, block);
  }
}

uint64_t __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_5(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__handleTransientStateForPersonDidChangeNotification_ name:@"_MPStoreSocialTransientStateDidChangeNotification" object:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  id v3 = *(void **)(a1 + 32);

  return objc_msgSend(v3, "_queue_transientStatesDidChange");
}

uint64_t __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_4(void *a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:a1[4] name:@"_MPStoreSocialTransientStateDidChangeNotification" object:a1[5]];

  [*(id *)(a1[6] + 24) removeObject:a1[5]];
  id v3 = (void *)a1[4];

  return objc_msgSend(v3, "_queue_transientStatesDidChange");
}

void __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  id v6 = [v11 person];
  uint64_t v7 = [v6 identifiers];
  id v8 = [v7 universalStore];
  id v9 = [v8 socialProfileID];
  int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_performTransientFollowPendingRequestState:(int64_t)a3 onPerson:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(MPStoreSocialServiceController *)self _transientStateForPerson:a4 shouldCreate:1];
  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__MPStoreSocialServiceController__performTransientFollowPendingRequestState_onPerson_completion___block_invoke;
    v14[3] = &unk_1E57F90C8;
    id v10 = v8;
    id v15 = v10;
    id v11 = (void *)[v9 newOperationForTransientFollowPendingRequestState:a3 completion:v14];
    if (v11)
    {
      [(NSOperationQueue *)self->_operationQueue addOperation:v11];
    }
    else if (v10)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPStoreSocialErrorDomain" code:-3000 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }
  else if (v8)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPStoreSocialErrorDomain" code:-3000 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v12);
  }
}

uint64_t __97__MPStoreSocialServiceController__performTransientFollowPendingRequestState_onPerson_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performTransientFollowState:(int64_t)a3 onPerson:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(MPStoreSocialServiceController *)self _transientStateForPerson:a4 shouldCreate:1];
  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__MPStoreSocialServiceController__performTransientFollowState_onPerson_completion___block_invoke;
    v14[3] = &unk_1E57F90C8;
    id v10 = v8;
    id v15 = v10;
    id v11 = (void *)[v9 newOperationForTransientFollowState:a3 completion:v14];
    if (v11)
    {
      [(NSOperationQueue *)self->_operationQueue addOperation:v11];
    }
    else if (v10)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPStoreSocialErrorDomain" code:-3000 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }
  else if (v8)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPStoreSocialErrorDomain" code:-3000 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v12);
  }
}

uint64_t __83__MPStoreSocialServiceController__performTransientFollowState_onPerson_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)transientFollowPendingRequestStateForPerson:(id)a3
{
  id v3 = [(MPStoreSocialServiceController *)self _transientStateForPerson:a3 shouldCreate:0];
  uint64_t v4 = v3;
  if (v3) {
    int64_t v5 = [v3 followPendingRequestState];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)declineFollowRequestFromPerson:(id)a3 completion:(id)a4
{
}

- (void)acceptFollowRequestFromPerson:(id)a3 completion:(id)a4
{
}

- (void)acceptAllFollowRequestsWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [[MPStoreSocialPendingFollowRequestOperationDataSource alloc] initWithAction:0];
  int64_t v5 = [[MPStoreSocialRequestOperation alloc] initWithDataSource:v6];
  [(MPStoreSocialRequestOperation *)v5 setResponseHandler:v4];

  [(NSOperationQueue *)self->_operationQueue addOperation:v5];
}

- (int64_t)transientFollowStateForPerson:(id)a3
{
  id v3 = [(MPStoreSocialServiceController *)self _transientStateForPerson:a3 shouldCreate:0];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 followState];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)removeFollower:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__MPStoreSocialServiceController_removeFollower_completion___block_invoke;
  v10[3] = &unk_1E57F90A0;
  id v7 = v6;
  id v11 = v7;
  id v8 = [(MPStoreSocialServiceController *)self _newOperationForRemovingFollower:a3 completion:v10];
  if (v8)
  {
    [(NSOperationQueue *)self->_operationQueue addOperation:v8];
  }
  else if (v7)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPStoreSocialErrorDomain" code:-3000 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
}

uint64_t __60__MPStoreSocialServiceController_removeFollower_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)unblockPerson:(id)a3 completion:(id)a4
{
}

- (void)blockPerson:(id)a3 completion:(id)a4
{
}

- (void)cancelFollowRequestOnPerson:(id)a3 completion:(id)a4
{
}

- (void)requestFollowPerson:(id)a3 completion:(id)a4
{
}

- (void)unfollowPerson:(id)a3 completion:(id)a4
{
}

- (void)followPerson:(id)a3 completion:(id)a4
{
}

- (MPStoreSocialServiceController)init
{
  v10.receiver = self;
  v10.super_class = (Class)MPStoreSocialServiceController;
  v2 = [(MPStoreSocialServiceController *)&v10 init];
  if (v2)
  {
    id v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:25];
    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.MediaPlayer.MPStoreSocialServiceController.operationQueue"];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreSocialServiceController.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    transientStates = v2->_transientStates;
    v2->_transientStates = v7;
  }
  return v2;
}

+ (id)_internalErrorForHTTPResponseCode:(int64_t)a3
{
  uint64_t v3 = -3000;
  if (a3 > 403)
  {
    uint64_t v5 = -3004;
    if (a3 == 404) {
      uint64_t v3 = -3002;
    }
    BOOL v4 = a3 == 409;
    goto LABEL_7;
  }
  if (a3 != 200)
  {
    BOOL v4 = a3 == 403;
    uint64_t v5 = -3003;
LABEL_7:
    if (v4) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = v3;
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPStoreSocialErrorDomain" code:v6 userInfo:0];
    goto LABEL_11;
  }
  id v7 = 0;
LABEL_11:

  return v7;
}

@end