@interface DKReporterController
- (BOOL)isPresent;
- (DKComponentIdentity)componentIdentity;
- (DKReporterContext)context;
- (void)setComponentIdentity:(id)a3;
- (void)setContext:(id)a3;
- (void)start;
@end

@implementation DKReporterController

- (void)start
{
  v3 = (void *)MEMORY[0x23ECF6A10](self, a2);
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = [MEMORY[0x263EFF980] array];
  if ([(DKReporterController *)self isPresent])
  {
    [(DKReporterController *)self populateAttributes:v4];
    v6 = [(DKReporterController *)self componentIdentity];
    v7 = +[DKComponent componentWithIdentity:v6 attributes:v4];

    [v5 addObject:v7];
  }
  if (objc_opt_respondsToSelector()) {
    [(DKReporterController *)self teardown];
  }
  v8 = +[DKReport reportWithComponents:v5];
  v9 = [(DKReporterController *)self context];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __29__DKReporterController_start__block_invoke;
  v10[3] = &unk_264E86710;
  v10[4] = self;
  [v9 completeWithReport:v8 completion:v10];
}

void __29__DKReporterController_start__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) context];
  [v1 completeRequestReturningItems:MEMORY[0x263EFFA68] completionHandler:0];
}

- (BOOL)isPresent
{
  return 0;
}

- (DKComponentIdentity)componentIdentity
{
  return self->_componentIdentity;
}

- (void)setComponentIdentity:(id)a3
{
}

- (DKReporterContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_componentIdentity, 0);
}

@end