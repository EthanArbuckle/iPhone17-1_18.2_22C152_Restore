@interface CRKASMTimeoutRosterProvider
- (CRKASMTimeoutRosterProvider)initWithRosterProvider:(id)a3 timeout:(double)a4;
- (NSMapTable)completionsByTimer;
- (double)timeout;
- (id)scheduleTimeoutForCompletion:(id)a3;
- (void)createCourseWithProperties:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)operationDidFinishWithTimer:(id)a3 error:(id)a4;
- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4;
- (void)timeoutDidFire:(id)a3;
- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5;
@end

@implementation CRKASMTimeoutRosterProvider

- (void)dealloc
{
  v4 = [(CRKASMTimeoutRosterProvider *)self completionsByTimer];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CRKASMTimeoutRosterProvider.m" lineNumber:30 description:@"Roster provider deallocated with in-flight crud operations"];
  }
  v7.receiver = self;
  v7.super_class = (Class)CRKASMTimeoutRosterProvider;
  [(CRKASMTimeoutRosterProvider *)&v7 dealloc];
}

- (CRKASMTimeoutRosterProvider)initWithRosterProvider:(id)a3 timeout:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CRKASMTimeoutRosterProvider;
  uint64_t v5 = [(CRKASMRosterProviderDecoratorBase *)&v10 initWithRosterProvider:a3];
  v6 = v5;
  if (v5)
  {
    v5->_timeout = a4;
    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    completionsByTimer = v6->_completionsByTimer;
    v6->_completionsByTimer = (NSMapTable *)v7;
  }
  return v6;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v8 = (void *)MEMORY[0x263F08B88];
  id v9 = a3;
  if (([v8 isMainThread] & 1) == 0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"CRKASMTimeoutRosterProvider.m", 46, @"%@ must be called from the main thread", v14 object file lineNumber description];
  }
  objc_super v10 = [(CRKASMTimeoutRosterProvider *)self scheduleTimeoutForCompletion:v7];
  v11 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__CRKASMTimeoutRosterProvider_createCourseWithProperties_completion___block_invoke;
  v15[3] = &unk_2646F4918;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  [v11 createCourseWithProperties:v9 completion:v15];
}

uint64_t __69__CRKASMTimeoutRosterProvider_createCourseWithProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) operationDidFinishWithTimer:*(void *)(a1 + 40) error:a2];
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v9 = a5;
  objc_super v10 = (void *)MEMORY[0x263F08B88];
  id v11 = a4;
  id v12 = a3;
  if (([v10 isMainThread] & 1) == 0)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    v17 = NSStringFromSelector(a2);
    [v16 handleFailureInMethod:a2, self, @"CRKASMTimeoutRosterProvider.m", 55, @"%@ must be called from the main thread", v17 object file lineNumber description];
  }
  v13 = [(CRKASMTimeoutRosterProvider *)self scheduleTimeoutForCompletion:v9];
  v14 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __80__CRKASMTimeoutRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke;
  v18[3] = &unk_2646F4918;
  v18[4] = self;
  id v19 = v13;
  id v15 = v13;
  [v14 updateCourseWithIdentifier:v12 properties:v11 completion:v18];
}

uint64_t __80__CRKASMTimeoutRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) operationDidFinishWithTimer:*(void *)(a1 + 40) error:a2];
}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v8 = (void *)MEMORY[0x263F08B88];
  id v9 = a3;
  if (([v8 isMainThread] & 1) == 0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"CRKASMTimeoutRosterProvider.m", 64, @"%@ must be called from the main thread", v14 object file lineNumber description];
  }
  objc_super v10 = [(CRKASMTimeoutRosterProvider *)self scheduleTimeoutForCompletion:v7];
  id v11 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__CRKASMTimeoutRosterProvider_removeCourseWithIdentifier_completion___block_invoke;
  v15[3] = &unk_2646F4918;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  [v11 removeCourseWithIdentifier:v9 completion:v15];
}

uint64_t __69__CRKASMTimeoutRosterProvider_removeCourseWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) operationDidFinishWithTimer:*(void *)(a1 + 40) error:a2];
}

- (id)scheduleTimeoutForCompletion:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA20];
  id v5 = a3;
  [(CRKASMTimeoutRosterProvider *)self timeout];
  v6 = objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timeoutDidFire_, 0, 0);
  id v7 = [(CRKASMTimeoutRosterProvider *)self completionsByTimer];
  v8 = (void *)MEMORY[0x22A620AF0](v5);

  [v7 setObject:v8 forKey:v6];

  return v6;
}

- (void)operationDidFinishWithTimer:(id)a3 error:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    id v12 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, @"CRKASMTimeoutRosterProvider.m", 86, @"%@ must be called from the main thread", v12 object file lineNumber description];
  }
  [v13 invalidate];
  v8 = [(CRKASMTimeoutRosterProvider *)self completionsByTimer];
  id v9 = [v8 objectForKey:v13];

  if (v9)
  {
    objc_super v10 = [(CRKASMTimeoutRosterProvider *)self completionsByTimer];
    [v10 removeObjectForKey:v13];

    ((void (**)(void, id))v9)[2](v9, v7);
  }
}

- (void)timeoutDidFire:(id)a3
{
  id v4 = a3;
  CRKErrorWithCodeAndUserInfo(32, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CRKASMTimeoutRosterProvider *)self operationDidFinishWithTimer:v4 error:v5];
}

- (double)timeout
{
  return self->_timeout;
}

- (NSMapTable)completionsByTimer
{
  return self->_completionsByTimer;
}

- (void).cxx_destruct
{
}

@end