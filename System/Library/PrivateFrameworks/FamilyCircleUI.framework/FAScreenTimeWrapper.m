@interface FAScreenTimeWrapper
- (BOOL)activityEnabledForUser;
- (BOOL)activityEnablementChanged;
- (BOOL)previousState;
- (FAScreenTimeWrapper)initWithUserDSID:(id)a3;
- (NSNumber)userDSID;
- (STUsageSummaryTableViewCellProvider)provider;
- (id)getScreenTimeUsageGraphForUser;
- (void)refresh;
- (void)setPreviousState:(BOOL)a3;
- (void)setProvider:(id)a3;
- (void)setUserDSID:(id)a3;
@end

@implementation FAScreenTimeWrapper

- (FAScreenTimeWrapper)initWithUserDSID:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FAScreenTimeWrapper;
  v5 = [(FAScreenTimeWrapper *)&v16 init];
  if (v5 && [v4 intValue] != -1)
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__FAScreenTimeWrapper_initWithUserDSID___block_invoke;
    block[3] = &unk_2643491B8;
    v13 = v5;
    id v14 = v4;
    v8 = v6;
    v15 = v8;
    dispatch_sync(v7, block);

    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    if (dispatch_group_wait(v8, v9))
    {
      v10 = _FALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[FAScreenTimeWrapper initWithUserDSID:](v10);
      }
    }
  }

  return v5;
}

void __40__FAScreenTimeWrapper_initWithUserDSID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x263F673F8]) initWithUserDSID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  [*(id *)(a1 + 32) setUserDSID:*(void *)(a1 + 40)];
  v5 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v5);
}

- (id)getScreenTimeUsageGraphForUser
{
  uint64_t v3 = [(FAScreenTimeWrapper *)self userDSID];
  int v4 = [v3 intValue];

  if (v4 == -1)
  {
    provider = 0;
  }
  else
  {
    provider = self->_provider;
    if (provider)
    {
      provider = [provider usageSummaryTableViewCellForUser];
    }
  }
  return provider;
}

- (BOOL)activityEnabledForUser
{
  provider = self->_provider;
  if (provider) {
    uint64_t v4 = [(STUsageSummaryTableViewCellProvider *)provider shouldShowUsageSummaryForUser];
  }
  else {
    uint64_t v4 = 0;
  }
  [(FAScreenTimeWrapper *)self setPreviousState:v4];
  return v4;
}

- (BOOL)activityEnablementChanged
{
  BOOL v3 = [(FAScreenTimeWrapper *)self previousState];
  return v3 ^ [(FAScreenTimeWrapper *)self activityEnabledForUser];
}

- (void)refresh
{
  provider = self->_provider;
  if (provider) {
    [(STUsageSummaryTableViewCellProvider *)provider refresh];
  }
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
  self->_userDSID = (NSNumber *)a3;
}

- (STUsageSummaryTableViewCellProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (BOOL)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(BOOL)a3
{
  self->_previousState = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithUserDSID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "Failed FAScreenTimeWrapper provider create! Timed out", v1, 2u);
}

@end