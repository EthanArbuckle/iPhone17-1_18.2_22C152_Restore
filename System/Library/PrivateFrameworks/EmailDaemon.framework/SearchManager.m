@interface SearchManager
- (SearchManager)init;
- (id)fullSearchUsingSearchContext:(id)a3;
- (void)dealloc;
- (void)searchOperationDidFinish:(id)a3;
@end

@implementation SearchManager

- (SearchManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)SearchManager;
  v2 = [(SearchManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    workQueue = v3->_workQueue;
    v3->_workQueue = v4;

    [(NSOperationQueue *)v3->_workQueue setQualityOfService:25];
    [(NSOperationQueue *)v3->_workQueue setMaxConcurrentOperationCount:3];
  }
  return v3;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_workQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)SearchManager;
  [(SearchManager *)&v3 dealloc];
}

- (id)fullSearchUsingSearchContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 referencedMailboxes];
  v6 = [[SearchOperation alloc] initWithDelegate:self mailboxes:v5 searchContext:v4];
  if (v6)
  {
    [(NSOperationQueue *)self->_workQueue addOperation:v6];
    objc_super v7 = [(SearchOperation *)v6 progress];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (void)searchOperationDidFinish:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  unsigned int v5 = [v3 isCancelled];
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [v3 searchContext];
    int v10 = 138543874;
    v11 = v4;
    __int16 v12 = 1024;
    unsigned int v13 = v5;
    __int16 v14 = 1024;
    unsigned int v15 = [v7 useLocalIndex];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#search-manager FinishedSearchOperation identifier:%{public}@ isCancelled:%{BOOL}d useLocalIndex: %{BOOL}d", (uint8_t *)&v10, 0x18u);
  }
  v8 = [v3 searchContext];
  v9 = [v8 delegate];
  [v9 remoteSearchDidFinish];
}

- (void).cxx_destruct
{
}

@end