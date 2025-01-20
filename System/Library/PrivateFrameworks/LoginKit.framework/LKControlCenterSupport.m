@interface LKControlCenterSupport
+ (void)enableControlCenterModule:(id)a3 completionHandler:(id)a4;
@end

@implementation LKControlCenterSupport

+ (void)enableControlCenterModule:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x263F33BE8];
  id v7 = a3;
  v8 = [v6 sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__LKControlCenterSupport_enableControlCenterModule_completionHandler___block_invoke;
  v10[3] = &unk_2645FC3B8;
  id v11 = v5;
  id v9 = v5;
  [v8 requestEnableModuleWithIdentifier:v7 completionHandler:v10];
}

uint64_t __70__LKControlCenterSupport_enableControlCenterModule_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end