@interface HMDManagedObjectContext
- (BOOL)save:(id *)a3;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
@end

@implementation HMDManagedObjectContext

- (BOOL)save:(id *)a3
{
  [(NSManagedObjectContext *)self hmd_logPendingChangesWithReason:@"preparing to save"];
  v6.receiver = self;
  v6.super_class = (Class)HMDManagedObjectContext;
  return [(HMDManagedObjectContext *)&v6 save:a3];
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HMDManagedObjectContext_performBlockAndWait___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)HMDManagedObjectContext;
  id v5 = v4;
  [(HMDManagedObjectContext *)&v6 performBlockAndWait:v7];
}

uint64_t __47__HMDManagedObjectContext_performBlockAndWait___block_invoke(uint64_t a1)
{
  return _HMFThreadLocalAsyncContextPop();
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__HMDManagedObjectContext_performBlock___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)HMDManagedObjectContext;
  id v5 = v4;
  [(HMDManagedObjectContext *)&v6 performBlock:v7];
}

uint64_t __40__HMDManagedObjectContext_performBlock___block_invoke(uint64_t a1)
{
  return _HMFThreadLocalAsyncContextPop();
}

@end