@interface _ASWebsiteNameFetchOperation
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSString)domain;
- (WBSPasswordManagerWebsiteMetadataEntry)metadataEntry;
- (_ASWebsiteNameFetchOperation)init;
- (_ASWebsiteNameFetchOperation)initWithDomain:(id)a3 metadataEntry:(id)a4 provider:(id)a5;
- (id)debugDescription;
- (void)_finish;
- (void)_run;
- (void)cancel;
- (void)start;
@end

@implementation _ASWebsiteNameFetchOperation

- (_ASWebsiteNameFetchOperation)initWithDomain:(id)a3 metadataEntry:(id)a4 provider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_ASWebsiteNameFetchOperation;
  v11 = [(_ASWebsiteNameFetchOperation *)&v22 init];
  if (v11)
  {
    v12 = NSString;
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    id v15 = [v12 stringWithFormat:@"com.apple.SafariCore.%@.%p", v14, v11];
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [v8 copy];
    domain = v11->_domain;
    v11->_domain = (NSString *)v18;

    objc_storeStrong((id *)&v11->_metadataEntry, a4);
    objc_storeWeak((id *)&v11->_provider, v10);
    [(_ASWebsiteNameFetchOperation *)v11 setName:v8];
    v20 = v11;
  }

  return v11;
}

- (_ASWebsiteNameFetchOperation)init
{
  return 0;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_ASWebsiteNameFetchOperation *)self name];
  if ([(_ASWebsiteNameFetchOperation *)self isFinished]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(_ASWebsiteNameFetchOperation *)self isReady]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  if ([(_ASWebsiteNameFetchOperation *)self isCancelled]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  if ([(_ASWebsiteNameFetchOperation *)self isExecuting]) {
    id v10 = @"YES";
  }
  else {
    id v10 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; name = %@, isFinished = %@; isReady = %@; isCancelled = %@; isExecuting = %@ >",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isFinished = v2->_state.isFinished;
  objc_sync_exit(v2);

  return isFinished;
}

- (BOOL)isExecuting
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isExecuting = v2->_state.isExecuting;
  objc_sync_exit(v2);

  return isExecuting;
}

- (BOOL)isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isCancelled = v2->_state.isCancelled;
  objc_sync_exit(v2);

  return isCancelled;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_state.isCancelled)
  {
    [(_ASWebsiteNameFetchOperation *)obj _finish];
    objc_sync_exit(obj);
  }
  else
  {
    [(_ASWebsiteNameFetchOperation *)obj willChangeValueForKey:@"isExecuting"];
    obj->_state.BOOL isExecuting = 1;
    [(_ASWebsiteNameFetchOperation *)obj didChangeValueForKey:@"isExecuting"];
    objc_sync_exit(obj);

    queue = obj->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37___ASWebsiteNameFetchOperation_start__block_invoke;
    block[3] = &unk_264395388;
    block[4] = obj;
    dispatch_async(queue, block);
  }
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_state.isCancelled)
  {
    [(_ASWebsiteNameFetchOperation *)obj willChangeValueForKey:@"isCancelled"];
    obj->_state.BOOL isCancelled = 1;
    [(_ASWebsiteNameFetchOperation *)obj didChangeValueForKey:@"isCancelled"];
    [(_ASWebsiteNameFetchOperation *)obj _finish];
  }
  objc_sync_exit(obj);
}

- (void)_run
{
  if (![(_ASWebsiteNameFetchOperation *)self isCancelled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    if (WeakRetained)
    {
      v4 = objc_opt_class();
      domain = self->_domain;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __36___ASWebsiteNameFetchOperation__run__block_invoke;
      v7[3] = &unk_264396708;
      id v8 = WeakRetained;
      id v9 = self;
      [v4 fetchWebsiteNameForDomain:domain completionHandler:v7];
    }
    else
    {
      v6 = self;
      objc_sync_enter(v6);
      [(_ASWebsiteNameFetchOperation *)v6 _finish];
      objc_sync_exit(v6);
    }
  }
}

- (void)_finish
{
  p_state = &self->_state;
  BOOL isFinished = self->_state.isFinished;
  BOOL isExecuting = self->_state.isExecuting;
  if (self->_state.isFinished)
  {
    if (self->_state.isExecuting) {
      goto LABEL_3;
    }
LABEL_6:
    *(_WORD *)&p_state->BOOL isExecuting = 256;
    if (isFinished) {
      return;
    }
    goto LABEL_7;
  }
  [(_ASWebsiteNameFetchOperation *)self willChangeValueForKey:@"isFinished"];
  if (!isExecuting) {
    goto LABEL_6;
  }
LABEL_3:
  [(_ASWebsiteNameFetchOperation *)self willChangeValueForKey:@"isExecuting"];
  *(_WORD *)&p_state->BOOL isExecuting = 256;
  [(_ASWebsiteNameFetchOperation *)self didChangeValueForKey:@"isExecuting"];
  if (isFinished) {
    return;
  }
LABEL_7:

  [(_ASWebsiteNameFetchOperation *)self didChangeValueForKey:@"isFinished"];
}

- (NSString)domain
{
  return self->_domain;
}

- (WBSPasswordManagerWebsiteMetadataEntry)metadataEntry
{
  return self->_metadataEntry;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_metadataEntry, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end