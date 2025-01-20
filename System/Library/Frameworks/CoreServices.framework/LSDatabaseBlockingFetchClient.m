@interface LSDatabaseBlockingFetchClient
- (LSDatabaseBlockingFetchClient)initWithXPCConnection:(id)a3;
- (void)getServerStoreBlockingWithCompletionHandler:(id)a3;
@end

@implementation LSDatabaseBlockingFetchClient

- (LSDatabaseBlockingFetchClient)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSDatabaseBlockingFetchClient;
  v6 = [(LSDatabaseBlockingFetchClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)getServerStoreBlockingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[LSDatabaseBlockingFetchClient getServerStoreBlockingWithCompletionHandler:]");
  if (getServerStoreBlockingWithCompletionHandler__onceToken != -1) {
    dispatch_once(&getServerStoreBlockingWithCompletionHandler__onceToken, &__block_literal_global_35);
  }
  id v5 = +[LSDatabaseBlockingFetchServer sharedInstance];
  int v6 = [v5 isForManualRebuild];

  if (v6) {
    __LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_A_MANUAL_DATABASE_REBUILD_TO_COMPLETE__();
  }
  else {
    __LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_THE_DATABASE_TO_FINISH_SEEDING__();
  }
  v7 = self->_connection;
  _LSServer_DatabaseExecutionContext();
  v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__LSDatabaseBlockingFetchClient_getServerStoreBlockingWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E522FDD0;
  v12 = v7;
  id v13 = v4;
  id v9 = v4;
  v10 = v7;
  -[LSDBExecutionContext syncRead:](v8, v11);
}

uint64_t __77__LSDatabaseBlockingFetchClient_getServerStoreBlockingWithCompletionHandler___block_invoke()
{
  std::__function::__func<BOOL (*)(objc_object *),std::allocator<BOOL (*)(objc_object *)>,BOOL ()(objc_object *)>::~__func(__LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_THE_DATABASE_TO_FINISH_SEEDING__);

  return std::__function::__func<BOOL (*)(objc_object *),std::allocator<BOOL (*)(objc_object *)>,BOOL ()(objc_object *)>::~__func(__LAUNCH_SERVICES_CLIENTS_ARE_WAITING_FOR_A_MANUAL_DATABASE_REBUILD_TO_COMPLETE__);
}

void __77__LSDatabaseBlockingFetchClient_getServerStoreBlockingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
}

- (void).cxx_destruct
{
}

@end