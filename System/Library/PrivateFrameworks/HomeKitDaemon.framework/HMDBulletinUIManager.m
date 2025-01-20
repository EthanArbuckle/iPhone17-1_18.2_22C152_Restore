@interface HMDBulletinUIManager
+ (void)openHomeAppWithURL:(id)a3;
+ (void)presentExecutionErrorDialogForTrigger:(id)a3 partialSuccess:(BOOL)a4;
@end

@implementation HMDBulletinUIManager

+ (void)presentExecutionErrorDialogForTrigger:(id)a3 partialSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
  v7 = [v5 name];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__HMDBulletinUIManager_presentExecutionErrorDialogForTrigger_partialSuccess___block_invoke;
  v9[3] = &unk_264A20108;
  id v10 = v5;
  id v8 = v5;
  [v6 displayExecutionErrorOfTrigger:v7 partialSuccess:v4 context:v8 completionQueue:MEMORY[0x263EF83A0] completionHandler:v9];
}

void __77__HMDBulletinUIManager_presentExecutionErrorDialogForTrigger_partialSuccess___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = (void *)MEMORY[0x263F0E140];
    v3 = [*(id *)(a1 + 32) home];
    BOOL v4 = [v3 contextSPIUniqueIdentifier];
    id v5 = [v4 UUIDString];
    id v9 = [v2 tupleWithQueryType:0 uuidString:v5];

    v6 = [MEMORY[0x263F0E140] tupleWithQueryType:7 uuidString:0];
    v7 = [MEMORY[0x263EFFA08] setWithObject:v9];
    id v8 = generateURLForHomeKitObject();

    +[HMDBulletinUIManager openHomeAppWithURL:v8];
  }
}

+ (void)openHomeAppWithURL:(id)a3
{
  uint64_t v3 = [a3 absoluteString];
  if (!v3)
  {
    uint64_t v3 = [NSString stringWithFormat:@"%@://", *MEMORY[0x263F0C7A8]];
  }
  id v6 = (id)v3;
  BOOL v4 = [NSURL URLWithString:v3];
  id v5 = [MEMORY[0x263F01880] defaultWorkspace];
  [v5 openSensitiveURL:v4 withOptions:0];
}

@end