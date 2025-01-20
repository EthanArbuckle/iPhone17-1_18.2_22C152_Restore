@interface CalDAVOperation
- (CalDAVOperation)init;
- (CalDAVOperation)initWithPrincipal:(id)a3;
- (CalDAVPrincipal)principal;
- (NSMutableSet)outstandingTaskGroups;
- (void)_tearDownAllTaskGroupsWithBlock:(id)a3;
- (void)bailWithError:(id)a3;
- (void)cancelTaskGroup;
- (void)dealloc;
- (void)setOutstandingTaskGroups:(id)a3;
- (void)setPrincipal:(id)a3;
@end

@implementation CalDAVOperation

- (CalDAVOperation)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CalDAVOperation.m" lineNumber:23 description:@"You must call initWithPrincipal:"];

  return 0;
}

- (CalDAVOperation)initWithPrincipal:(id)a3
{
  id v5 = a3;
  v6 = [v5 taskManager];
  v11.receiver = self;
  v11.super_class = (Class)CalDAVOperation;
  v7 = [(CoreDAVTaskGroup *)&v11 initWithAccountInfoProvider:v5 taskManager:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_principal, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    outstandingTaskGroups = v7->_outstandingTaskGroups;
    v7->_outstandingTaskGroups = v8;
  }
  return v7;
}

- (void)dealloc
{
  if ([(NSMutableSet *)self->_outstandingTaskGroups count])
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"CalDAVOperation.m", 37, @"We should never finish a task group with an existing task group.  I have %@", self->_outstandingTaskGroups object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)CalDAVOperation;
  [(CoreDAVTaskGroup *)&v5 dealloc];
}

- (void)_tearDownAllTaskGroupsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  if (!self->_isCancellingTaskGroups)
  {
    self->_isCancellingTaskGroups = 1;
    objc_super v5 = (void *)[(NSMutableSet *)self->_outstandingTaskGroups copy];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v4[2](v4, v11);
          objc_msgSend(v11, "setDelegate:", 0, (void)v12);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)cancelTaskGroup
{
  [(CalDAVOperation *)self _tearDownAllTaskGroupsWithBlock:&__block_literal_global_2];
  v3.receiver = self;
  v3.super_class = (Class)CalDAVOperation;
  [(CoreDAVTaskGroup *)&v3 cancelTaskGroup];
}

uint64_t __34__CalDAVOperation_cancelTaskGroup__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelTaskGroup];
}

- (void)bailWithError:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__CalDAVOperation_bailWithError___block_invoke;
  v7[3] = &unk_2641EC088;
  id v8 = v4;
  id v5 = v4;
  [(CalDAVOperation *)self _tearDownAllTaskGroupsWithBlock:v7];
  v6.receiver = self;
  v6.super_class = (Class)CalDAVOperation;
  [(CoreDAVTaskGroup *)&v6 bailWithError:v5];
}

uint64_t __33__CalDAVOperation_bailWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bailWithError:*(void *)(a1 + 32)];
}

- (CalDAVPrincipal)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
}

- (NSMutableSet)outstandingTaskGroups
{
  return self->_outstandingTaskGroups;
}

- (void)setOutstandingTaskGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingTaskGroups, 0);
  objc_storeStrong((id *)&self->_principal, 0);
}

@end