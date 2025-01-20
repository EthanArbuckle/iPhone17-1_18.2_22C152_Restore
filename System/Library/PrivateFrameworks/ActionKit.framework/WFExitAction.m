@interface WFExitAction
- (BOOL)legacyBehaviorIgnoresOutputFromAction:(id)a3 inWorkflow:(id)a4;
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFExitAction

- (BOOL)legacyBehaviorIgnoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  return a3 == 0;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F870B8];
  uint64_t v9 = *MEMORY[0x263F08338];
  v7 = WFLocalizedString(@"User requested shortcut exit.");
  v10[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  *a4 = [v5 errorWithDomain:v6 code:4 userInfo:v8];
}

@end