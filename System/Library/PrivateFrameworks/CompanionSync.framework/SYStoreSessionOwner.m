@interface SYStoreSessionOwner
- (BOOL)isResetSync;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (BOOL)syncSession:(id)a3 rollbackChangesWithError:(id *)a4;
- (NSDictionary)context;
- (NSDictionary)idsOptions;
- (SYSession)session;
- (SYStore)store;
- (id)errorCallback;
- (id)onComplete;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)setContext:(id)a3;
- (void)setErrorCallback:(id)a3;
- (void)setIdsOptions:(id)a3;
- (void)setOnComplete:(id)a3;
- (void)setSession:(id)a3;
- (void)setStore:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation SYStoreSessionOwner

- (BOOL)isResetSync
{
  return 0;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2001 userInfo:0];
  }
  return 5;
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2001 userInfo:0];
  }
  return 0;
}

- (BOOL)syncSession:(id)a3 rollbackChangesWithError:(id *)a4
{
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2008 userInfo:0];
  }
  return 0;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  v6 = (objc_class *)MEMORY[0x263F087E8];
  id v7 = a5;
  id v8 = (id)[[v6 alloc] initWithSYError:2001 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v7, 0, v8);
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v8 = [WeakRetained delegate];
  int v9 = [v6 isResetSync];

  if (!v12)
  {
    if (!v9) {
      goto LABEL_10;
    }
    v10 = [WeakRetained persistentStore];
    [v10 setCompletedSync:1];
LABEL_9:

    goto LABEL_10;
  }
  if (!v9)
  {
    if ((WeakRetained[8] & 0x400) == 0) {
      goto LABEL_10;
    }
    v10 = [(SYStoreSessionOwner *)self context];
    [v8 syncStore:WeakRetained encounteredError:v12 context:v10];
    goto LABEL_9;
  }
  if ((WeakRetained[8] & 0x200) != 0) {
    [v8 syncStore:WeakRetained encounteredErrorInFullSync:v12];
  }
LABEL_10:
  if (self->_onComplete)
  {
    v11 = [WeakRetained delegateQueue];
    dispatch_async(v11, self->_onComplete);
  }
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
}

- (SYStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  return (SYStore *)WeakRetained;
}

- (void)setStore:(id)a3
{
}

- (id)errorCallback
{
  return self->_errorCallback;
}

- (void)setErrorCallback:(id)a3
{
}

- (id)onComplete
{
  return self->_onComplete;
}

- (void)setOnComplete:(id)a3
{
}

- (SYSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_onComplete, 0);
  objc_storeStrong(&self->_errorCallback, 0);
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_idsOptions, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end