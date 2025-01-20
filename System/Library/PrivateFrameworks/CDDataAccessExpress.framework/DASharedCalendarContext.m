@interface DASharedCalendarContext
- (BOOL)shouldSyncCalendar;
- (DASharedCalendarContext)initWithCalendarID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6;
- (NSString)accountID;
- (NSString)calendarID;
- (OS_dispatch_queue)queue;
- (id)completionBlock;
- (void)finishedWithError:(id)a3;
- (void)setShouldSyncCalendar:(BOOL)a3;
@end

@implementation DASharedCalendarContext

- (DASharedCalendarContext)initWithCalendarID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11) {
    -[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]();
  }
  if (!v12) {
    -[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]();
  }
  v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)DASharedCalendarContext;
  v16 = [(DASharedCalendarContext *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_calendarID, a3);
    objc_storeStrong((id *)&v17->_accountID, a4);
    objc_storeStrong((id *)&v17->_queue, a5);
    uint64_t v18 = [v15 copy];
    id completionBlock = v17->_completionBlock;
    v17->_id completionBlock = (id)v18;
  }
  return v17;
}

- (void)finishedWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    calendarID = self->_calendarID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138412546;
    v16 = calendarID;
    __int16 v17 = 2112;
    uint64_t v18 = accountID;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_DEBUG, "Share of calendar ID %@ for account %@ completed.", buf, 0x16u);
  }

  if (!v4 && [(DASharedCalendarContext *)self shouldSyncCalendar])
  {
    v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__DASharedCalendarContext_finishedWithError___block_invoke;
    block[3] = &unk_1E6573B20;
    block[4] = self;
    dispatch_async(v8, block);
  }
  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v10 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    id v11 = v10;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__DASharedCalendarContext_finishedWithError___block_invoke_2;
    v12[3] = &unk_1E6573AF8;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v11, v12);
  }
}

void __45__DASharedCalendarContext_finishedWithError___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = +[CDDADConnection sharedConnection];
  v4[0] = *(void *)(*(void *)(a1 + 32) + 16);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 updateContentsOfFoldersWithKeys:v3 forAccountID:*(void *)(*(void *)(a1 + 32) + 24) andDataclass:4 isUserRequested:1];
}

uint64_t __45__DASharedCalendarContext_finishedWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

- (NSString)calendarID
{
  return self->_calendarID;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (BOOL)shouldSyncCalendar
{
  return self->_shouldSyncCalendar;
}

- (void)setShouldSyncCalendar:(BOOL)a3
{
  self->_shouldSyncCalendar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_calendarID, 0);
}

- (void)initWithCalendarID:accountID:queue:completionBlock:.cold.1()
{
}

- (void)initWithCalendarID:accountID:queue:completionBlock:.cold.2()
{
}

@end