@interface MKMapItemMetadataRequester
+ (id)sharedInstance;
- (MKMapItemMetadataRequester)init;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)cancelRequestsForMapItem:(id)a3;
- (void)dealloc;
- (void)handleTask:(id)a3 withData:(id)a4 error:(id)a5;
- (void)sendRequest:(id)a3;
@end

@implementation MKMapItemMetadataRequester

+ (id)sharedInstance
{
  if (qword_1E9154108 != -1) {
    dispatch_once(&qword_1E9154108, &__block_literal_global_33);
  }
  v2 = (void *)_MergedGlobals_1_3;

  return v2;
}

void __44__MKMapItemMetadataRequester_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MKMapItemMetadataRequester);
  v1 = (void *)_MergedGlobals_1_3;
  _MergedGlobals_1_3 = (uint64_t)v0;
}

- (MKMapItemMetadataRequester)init
{
  v16.receiver = self;
  v16.super_class = (Class)MKMapItemMetadataRequester;
  v2 = [(MKMapItemMetadataRequester *)&v16 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F290E0];
    v4 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    v5 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v6 = [v3 sessionWithConfiguration:v4 delegate:v2 delegateQueue:v5];
    session = v2->_session;
    v2->_session = (NSURLSession *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    tasksForURLs = v2->_tasksForURLs;
    v2->_tasksForURLs = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    requestsForURLs = v2->_requestsForURLs;
    v2->_requestsForURLs = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    dataForTasks = v2->_dataForTasks;
    v2->_dataForTasks = (NSMapTable *)v12;

    v14 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_requestsForURLs;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(NSMapTable *)self->_tasksForURLs objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        [v8 cancel];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)MKMapItemMetadataRequester;
  [(MKMapItemMetadataRequester *)&v9 dealloc];
}

- (void)sendRequest:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 url];
  uint64_t v6 = [(NSMapTable *)self->_requestsForURLs objectForKey:v5];
  uint64_t v7 = v6;
  requestsForURLs = self->_requestsForURLs;
  if (v6)
  {
    objc_super v9 = [v6 arrayByAddingObject:v4];
    [(NSMapTable *)requestsForURLs setObject:v9 forKey:v5];
  }
  else
  {
    v16[0] = v4;
    long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [(NSMapTable *)requestsForURLs setObject:v10 forKey:v5];

    long long v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__MKMapItemMetadataRequester_sendRequest___block_invoke;
    block[3] = &unk_1E54B8270;
    id v13 = v4;
    v14 = self;
    id v15 = v5;
    dispatch_async(v11, block);
  }
}

void __42__MKMapItemMetadataRequester_sendRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) urlRequest];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MKMapItemMetadataRequester_sendRequest___block_invoke_2;
  block[3] = &unk_1E54B8270;
  v3 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v6 = v3;
  id v7 = v2;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __42__MKMapItemMetadataRequester_sendRequest___block_invoke_2(void *a1)
{
  v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];

  if (v2)
  {
    id v5 = [*(id *)(a1[4] + 8) dataTaskWithRequest:a1[6]];
    [*(id *)(a1[4] + 24) setObject:v5 forKey:a1[5]];
    v3 = *(void **)(a1[4] + 32);
    id v4 = [MEMORY[0x1E4F1CA58] data];
    [v3 setObject:v4 forKey:v5];

    [v5 resume];
  }
}

- (void)cancelRequestsForMapItem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [(NSMapTable *)self->_requestsForURLs objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v11 count])
        {
          long long v12 = [v11 objectAtIndex:0];
          id v13 = [v12 url];
          id v14 = [v12 mapItem];

          if (v14 == v4 && v13 != 0) {
            [v5 addObject:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        -[NSMapTable removeObjectForKey:](self->_requestsForURLs, "removeObjectForKey:", v21, (void)v23);
        v22 = [(NSMapTable *)self->_tasksForURLs objectForKey:v21];
        [v22 cancel];
        if (v22) {
          [(NSMapTable *)self->_dataForTasks removeObjectForKey:v22];
        }
        [(NSMapTable *)self->_tasksForURLs removeObjectForKey:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }
}

- (void)handleTask:(id)a3 withData:(id)a4 error:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v8 originalRequest];
  long long v12 = [v11 URL];

  id v13 = [(NSMapTable *)self->_requestsForURLs objectForKey:v12];
  id v14 = v13;
  if (v10)
  {
    long long v29 = 0uLL;
    long long v30 = 0uLL;
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) handleError:v10];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v16);
    }
  }
  else
  {
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    uint64_t v19 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * j) handleData:v9];
        }
        uint64_t v20 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v20);
    }
  }
  [(NSMapTable *)self->_dataForTasks removeObjectForKey:v8];
  [(NSMapTable *)self->_requestsForURLs removeObjectForKey:v12];
  [(NSMapTable *)self->_tasksForURLs removeObjectForKey:v12];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a5;
  uint64_t v7 = [(NSMapTable *)self->_dataForTasks objectForKey:a4];
  if (v8) {
    [v7 appendData:v8];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  dataForTasks = self->_dataForTasks;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(NSMapTable *)dataForTasks objectForKey:v9];
  [(MKMapItemMetadataRequester *)self handleTask:v9 withData:v10 error:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataForTasks, 0);
  objc_storeStrong((id *)&self->_tasksForURLs, 0);
  objc_storeStrong((id *)&self->_requestsForURLs, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end