@interface MPCFuture
- (BOOL)isDisconnected;
- (BOOL)isFinalized;
- (BOOL)isInvalid;
- (MPCFuture)initWithQueue:(id)a3;
- (NSError)error;
- (NSMapTable)invalidBlocks;
- (NSMutableArray)completionBlocks;
- (NSMutableArray)failureBlocks;
- (NSMutableArray)successBlocks;
- (NSString)debugLabel;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)calloutQueue;
- (id)description;
- (id)onCompletion:(id)a3;
- (id)onFailure:(id)a3;
- (id)onInvalid:(id)a3;
- (id)onSuccess:(id)a3;
- (id)result;
- (void)_onQueue_finalize;
- (void)dealloc;
- (void)disconnect;
- (void)finishWithError:(id)a3;
- (void)finishWithValue:(id)a3;
- (void)invalidate;
- (void)setDebugLabel:(id)a3;
@end

@implementation MPCFuture

uint64_t __23__MPCFuture_onSuccess___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __23__MPCFuture_disconnect__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 10)) {
    *(unsigned char *)(v1 + 10) = 1;
  }
  return result;
}

void __23__MPCFuture_onFailure___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    v3 = *(void **)(v2 + 24);
    if (v3)
    {
      id v4 = v3;
      v5 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __23__MPCFuture_onFailure___block_invoke_2;
      block[3] = &unk_2643C55A8;
      id v6 = *(id *)(a1 + 40);
      id v14 = v4;
      id v15 = v6;
      id v7 = v4;
      dispatch_async(v5, block);
    }
  }
  else
  {
    v8 = *(void **)(v2 + 64);
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x263EFF980] array];
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 64);
      *(void *)(v10 + 64) = v9;

      v8 = *(void **)(*(void *)(a1 + 32) + 64);
    }
    id v12 = _Block_copy(*(const void **)(a1 + 40));
    [v8 addObject:v12];
  }
}

void __23__MPCFuture_onSuccess___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    if (!*(void *)(v2 + 24))
    {
      id v3 = *(id *)(v2 + 16);
      id v4 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __23__MPCFuture_onSuccess___block_invoke_2;
      block[3] = &unk_2643C55A8;
      id v5 = *(id *)(a1 + 40);
      id v13 = v3;
      id v14 = v5;
      id v6 = v3;
      dispatch_async(v4, block);
    }
  }
  else
  {
    id v7 = *(void **)(v2 + 56);
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x263EFF980] array];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;

      id v7 = *(void **)(*(void *)(a1 + 32) + 56);
    }
    id v11 = _Block_copy(*(const void **)(a1 + 40));
    [v7 addObject:v11];
  }
}

- (id)onCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __26__MPCFuture_onCompletion___block_invoke;
  v8[3] = &unk_2643C55A8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v8);

  return self;
}

void __29__MPCFuture_finishWithValue___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

- (id)onInvalid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(MPCFutureInvalidationToken);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__MPCFuture_onInvalid___block_invoke;
  block[3] = &unk_2643C5620;
  void block[4] = self;
  id v14 = v4;
  id v7 = v5;
  long long v13 = v7;
  id v8 = v4;
  dispatch_async(accessQueue, block);
  uint64_t v9 = v13;
  uint64_t v10 = v7;

  return v10;
}

- (id)onSuccess:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __23__MPCFuture_onSuccess___block_invoke;
  v8[3] = &unk_2643C55A8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v8);

  return self;
}

- (id)onFailure:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __23__MPCFuture_onFailure___block_invoke;
  v8[3] = &unk_2643C55A8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v8);

  return self;
}

void __29__MPCFuture_finishWithValue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"MPCFuture.m" lineNumber:132 description:@"Finish with value on already finalized future."];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 16), *(id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) copy];
  id v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__MPCFuture_finishWithValue___block_invoke_2;
  block[3] = &unk_2643C6660;
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v12 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, block);
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_finalize");
}

- (void)_onQueue_finalize
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  self->_finalized = 1;
  successBlocks = self->_successBlocks;
  self->_successBlocks = 0;

  failureBlocks = self->_failureBlocks;
  self->_failureBlocks = 0;

  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;
}

void __23__MPCFuture_onInvalid___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 9))
  {
    uint64_t v3 = *(NSObject **)(v2 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __23__MPCFuture_onInvalid___block_invoke_2;
    block[3] = &unk_2643C54B8;
    id v10 = *(id *)(a1 + 48);
    dispatch_async(v3, block);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setFuture:");
    id v4 = *(void **)(*(void *)(a1 + 32) + 80);
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 80);
      *(void *)(v6 + 80) = v5;

      id v4 = *(void **)(*(void *)(a1 + 32) + 80);
    }
    id v8 = _Block_copy(*(const void **)(a1 + 48));
    [v4 setObject:v8 forKey:*(void *)(a1 + 40)];
  }
}

- (void)setDebugLabel:(id)a3
{
}

- (MPCFuture)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPCFuture;
  uint64_t v6 = [(MPCFuture *)&v11 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCFuture.accessQueue", v7);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_calloutQueue, a3);
  }

  return v6;
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

void __23__MPCFuture_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    *(unsigned char *)(v1 + 9) = 1;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 80) objectEnumerator];
    id v4 = [v3 allObjects];
    id v5 = (void *)[v4 copy];

    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __23__MPCFuture_invalidate__block_invoke_2;
    block[3] = &unk_2643C5FC8;
    id v11 = v5;
    id v7 = v5;
    dispatch_async(v6, block);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 80);
    *(void *)(v8 + 80) = 0;
  }
}

- (void)finishWithValue:(id)a3
{
  id v5 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__MPCFuture_finishWithValue___block_invoke;
  block[3] = &unk_2643C61D0;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_sync(accessQueue, block);
}

- (void)invalidate
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__MPCFuture_invalidate__block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)disconnect
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__MPCFuture_disconnect__block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidBlocks, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_failureBlocks, 0);
  objc_storeStrong((id *)&self->_successBlocks, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_result, 0);
}

void __23__MPCFuture_invalidate__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!self->_finalized && !self->_invalid)
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v6 = self;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_FAULT, "Deallocating future that wasn't finalized or invalidated: %{public}@", buf, 0xCu);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCFuture;
  [(MPCFuture *)&v4 dealloc];
}

void __26__MPCFuture_onCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    id v3 = *(id *)(v2 + 16);
    id v4 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__MPCFuture_onCompletion___block_invoke_2;
    block[3] = &unk_2643C5620;
    id v6 = *(id *)(a1 + 40);
    id v16 = v4;
    id v17 = v6;
    id v15 = v3;
    id v7 = v4;
    id v8 = v3;
    dispatch_async(v5, block);
  }
  else
  {
    long long v9 = *(void **)(v2 + 72);
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x263EFF980] array];
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 72);
      *(void *)(v11 + 72) = v10;

      long long v9 = *(void **)(*(void *)(a1 + 32) + 72);
    }
    id v13 = _Block_copy(*(const void **)(a1 + 40));
    [v9 addObject:v13];
  }
}

uint64_t __23__MPCFuture_onInvalid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __26__MPCFuture_onCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSMapTable)invalidBlocks
{
  return self->_invalidBlocks;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (NSMutableArray)failureBlocks
{
  return self->_failureBlocks;
}

- (NSMutableArray)successBlocks
{
  return self->_successBlocks;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSString)debugLabel
{
  return self->_debugLabel;
}

- (BOOL)isDisconnected
{
  return self->_disconnected;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (NSError)error
{
  return self->_error;
}

- (id)result
{
  return self->_result;
}

- (id)description
{
  id v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p:", objc_opt_class(), self];
  id v4 = v3;
  if (self->_debugLabel) {
    [v3 appendFormat:@" debugLabel=%@", self->_debugLabel];
  }
  if (self->_finalized) {
    [v4 appendFormat:@" finalized=YES"];
  }
  if (self->_invalid) {
    [v4 appendFormat:@" invalid=YES"];
  }
  if (self->_disconnected) {
    [v4 appendFormat:@" disconnected=YES"];
  }
  if (self->_error) {
    [v4 appendFormat:@" error=%@", self->_error];
  }
  [v4 appendString:@">"];

  return v4;
}

- (void)finishWithError:(id)a3
{
  id v5 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__MPCFuture_finishWithError___block_invoke;
  block[3] = &unk_2643C61D0;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_sync(accessQueue, block);
}

void __29__MPCFuture_finishWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"MPCFuture.m" lineNumber:151 description:@"Finish with error on already finalized future."];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 24), *(id *)(a1 + 40));
  id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) copy];
  id v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 72) copy];
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__MPCFuture_finishWithError___block_invoke_2;
  block[3] = &unk_2643C6660;
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v12 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, block);
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_finalize");
}

void __29__MPCFuture_finishWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

uint64_t __23__MPCFuture_onFailure___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end