@interface _MKOverlayTileRequester
+ (unsigned)registerDataSource:(id)a3;
+ (unsigned)tileProviderIdentifier;
+ (void)unregisterDataSource:(unsigned int)a3;
- (BOOL)isRunning;
- (_MKOverlayTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5;
- (void)_cleanup;
- (void)_doWorkOrFinish;
- (void)_operationFailed:(id)a3 error:(id)a4;
- (void)_operationFinished:(id)a3;
- (void)_startOnWorkQueue;
- (void)cancel;
- (void)cancelKey:(long long *)a3;
- (void)dealloc;
- (void)start;
@end

@implementation _MKOverlayTileRequester

+ (unsigned)tileProviderIdentifier
{
  return *MEMORY[0x1E4F641B0];
}

+ (unsigned)registerDataSource:(id)a3
{
  id v3 = a3;
  if (qword_1E9154330 != -1) {
    dispatch_once(&qword_1E9154330, &__block_literal_global_83_0);
  }
  uint64_t v4 = qword_1E9154328;
  id v5 = v3;
  std::mutex::lock((std::mutex *)(v4 + 24));
  unsigned int v6 = *(_DWORD *)(v4 + 88) + 1;
  *(_DWORD *)(v4 + 88) = v6;
  unsigned int v9 = v6;
  v7 = std::__tree<std::__value_type<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>,std::__map_value_compare<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak},std::less<unsigned int>,true>,std::allocator<objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::piecewise_construct_t const&<>>((uint64_t **)v4, v6, &v9);
  objc_storeWeak((id *)v7 + 5, v5);
  std::mutex::unlock((std::mutex *)(v4 + 24));

  return v6;
}

+ (void)unregisterDataSource:(unsigned int)a3
{
  if (qword_1E9154330 != -1) {
    dispatch_once(&qword_1E9154330, &__block_literal_global_83_0);
  }
  uint64_t v4 = (void *)qword_1E9154328;
  id v5 = (std::mutex *)(qword_1E9154328 + 24);
  std::mutex::lock((std::mutex *)(qword_1E9154328 + 24));
  unsigned int v6 = (uint64_t *)v4[1];
  if (v6)
  {
    v7 = v4 + 1;
    uint64_t v8 = v4[1];
    do
    {
      unsigned int v9 = *(_DWORD *)(v8 + 32);
      BOOL v10 = v9 >= a3;
      if (v9 >= a3) {
        v11 = (uint64_t *)v8;
      }
      else {
        v11 = (uint64_t *)(v8 + 8);
      }
      if (v10) {
        v7 = (void *)v8;
      }
      uint64_t v8 = *v11;
    }
    while (*v11);
    if (v7 != v4 + 1 && *((_DWORD *)v7 + 8) <= a3)
    {
      v12 = (void *)v7[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (void *)*v12;
        }
        while (v12);
      }
      else
      {
        v14 = v7;
        do
        {
          v13 = (void *)v14[2];
          BOOL v15 = *v13 == (void)v14;
          v14 = v13;
        }
        while (!v15);
      }
      if ((void *)*v4 == v7) {
        *uint64_t v4 = v13;
      }
      --v4[2];
      std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, v7);
      objc_destroyWeak((id *)v7 + 5);
      operator delete(v7);
    }
  }

  std::mutex::unlock(v5);
}

- (_MKOverlayTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_MKOverlayTileRequester;
  id v5 = [(GEOTileRequester *)&v11 initWithTileRequest:a3 delegateQueue:a4 delegate:a5];
  if (v5)
  {
    if (qword_1E9154340 != -1) {
      dispatch_once(&qword_1E9154340, &__block_literal_global_85);
    }
    id v6 = (id)qword_1E9154338;
    uint64_t v7 = geo_dispatch_queue_create_with_target();
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v7;

    unsigned int v9 = v5;
  }

  return v5;
}

- (void)_doWorkOrFinish
{
  if (qword_1E9154320 != -1) {
    dispatch_once(&qword_1E9154320, &__block_literal_global_3);
  }
  while ([(NSMutableArray *)self->_waiting count])
  {
    if (_MergedGlobals_4 && (unint64_t)[(NSMutableSet *)self->_running count] > 3) {
      break;
    }
    id v3 = [(NSMutableArray *)self->_waiting lastObject];
    [(NSMutableSet *)self->_running addObject:v3];
    [(NSMutableArray *)self->_waiting removeLastObject];
    [v3 start];
  }
  running = self->_running;
  if (running)
  {
    if (![(NSMutableSet *)running count])
    {
      id v5 = [(GEOTileRequester *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42___MKOverlayTileRequester__doWorkOrFinish__block_invoke_2;
      block[3] = &unk_1E54BA960;
      block[4] = self;
      dispatch_async(v5, block);

      [(_MKOverlayTileRequester *)self _cleanup];
    }
  }
}

- (void)_cleanup
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = self->_running;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v7 cancel];
        [v7 setDelegate:0];
      }
      uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_waiting;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * j), "setDelegate:", 0, (void)v15);
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v9);
  }

  running = self->_running;
  self->_running = 0;

  waiting = self->_waiting;
  self->_waiting = 0;

  errors = self->_errors;
  self->_errors = 0;
}

- (void)_operationFinished:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_cancelled)
  {
    [(NSMutableSet *)self->_running removeObject:v4];
    uint64_t v5 = [v4 key];
    uint64_t v7 = v6;
    uint64_t v8 = [(GEOTileRequester *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46___MKOverlayTileRequester__operationFinished___block_invoke;
    block[3] = &unk_1E54BEB60;
    id v10 = v4;
    objc_super v11 = self;
    uint64_t v12 = v5;
    uint64_t v13 = v7;
    dispatch_async(v8, block);

    [(_MKOverlayTileRequester *)self _doWorkOrFinish];
  }
}

- (void)_operationFailed:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!self->_cancelled)
  {
    if (v7)
    {
      errors = self->_errors;
      if (!errors)
      {
        id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_super v11 = self->_errors;
        self->_errors = v10;

        errors = self->_errors;
      }
      [(NSMutableArray *)errors addObject:v8];
    }
    [(NSMutableSet *)self->_running removeObject:v6];
    uint64_t v12 = [v6 key];
    uint64_t v14 = v13;
    long long v15 = [(GEOTileRequester *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50___MKOverlayTileRequester__operationFailed_error___block_invoke;
    block[3] = &unk_1E54BEB60;
    void block[4] = self;
    id v17 = v8;
    uint64_t v18 = v12;
    uint64_t v19 = v14;
    dispatch_async(v15, block);

    [(_MKOverlayTileRequester *)self _doWorkOrFinish];
  }
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)_MKOverlayTileRequester;
  [(GEOTileRequester *)&v5 start];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32___MKOverlayTileRequester_start__block_invoke;
  block[3] = &unk_1E54BA960;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_startOnWorkQueue
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(GEOTileRequester *)self tileRequest];
  objc_super v5 = [v4 keyList];
  id v6 = (NSMutableArray *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));
  waiting = self->_waiting;
  self->_waiting = v6;

  uint64_t v8 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:4];
  running = self->_running;
  self->_running = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [(GEOTileRequester *)self tileRequest];
  objc_super v11 = [v10 keyList];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        long long v16 = objc_alloc_init(MKTileOverlayRequesterOp);
        -[MKTileOverlayRequesterOp setKey:](v16, "setKey:", *v15, v15[1]);
        [(MKTileOverlayRequesterOp *)v16 setDelegate:self];
        [(MKTileOverlayRequesterOp *)v16 setDelegateQueue:self->_workQueue];
        [(NSMutableArray *)self->_waiting insertObject:v16 atIndex:0];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [(_MKOverlayTileRequester *)self _doWorkOrFinish];
}

- (BOOL)isRunning
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36___MKOverlayTileRequester_isRunning__block_invoke;
  v5[3] = &unk_1E54BEB88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___MKOverlayTileRequester_cancel__block_invoke;
  block[3] = &unk_1E54BA960;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)cancelKey:(long long *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v5 = *a3;
  char v3 = *(NSObject **)(a1 + 96);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37___MKOverlayTileRequester_cancelKey___block_invoke;
  v4[3] = &unk_1E54BEBB0;
  v4[4] = a1;
  dispatch_async(v3, v4);
}

- (void)dealloc
{
  [(_MKOverlayTileRequester *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)_MKOverlayTileRequester;
  [(_MKOverlayTileRequester *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_running, 0);

  objc_storeStrong((id *)&self->_waiting, 0);
}

@end