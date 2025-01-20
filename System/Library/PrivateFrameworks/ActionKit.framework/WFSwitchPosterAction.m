@interface WFSwitchPosterAction
- (id)disabledOnPlatforms;
- (id)missingPosterError;
- (id)noInputError;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)switchToPosterAndFinish:(id)a3;
@end

@implementation WFSwitchPosterAction

- (id)disabledOnPlatforms
{
  return &unk_26F076950;
}

- (id)noInputError
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  v4 = WFLocalizedString(@"Unable to Switch Between Wallpapers");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  v5 = WFLocalizedString(@"Please select a wallpaper.");
  v10[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:6 userInfo:v6];

  return v7;
}

- (id)missingPosterError
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  v4 = WFLocalizedString(@"Unable to Switch Between Wallpapers");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  v5 = WFLocalizedString(@"Shortcuts was unable to find the specified wallpaper.");
  v10[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:6 userInfo:v6];

  return v7;
}

- (void)switchToPosterAndFinish:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v5 = (void *)getPRSServiceClass_softClass_42744;
  uint64_t v18 = getPRSServiceClass_softClass_42744;
  if (!getPRSServiceClass_softClass_42744)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getPRSServiceClass_block_invoke_42745;
    v14[3] = &unk_264E5EC88;
    v14[4] = &v15;
    __getPRSServiceClass_block_invoke_42745((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v6 = v5;
  _Block_object_dispose(&v15, 8);
  id v7 = objc_alloc_init(v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke;
  void v10[3] = &unk_264E5EBA0;
  id v11 = v4;
  v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v4;
  [v8 fetchPosterConfigurations:v10];
}

void __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke_2;
  v9[3] = &unk_264E5E5F8;
  id v10 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(a2, "if_firstObjectPassingTest:", v9);
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke_3;
    v8[3] = &unk_264E5EBC8;
    v5 = *(void **)(a1 + 48);
    v8[4] = *(void *)(a1 + 40);
    [v5 updateToSelectedConfiguration:v4 completion:v8];
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    id v7 = [v6 missingPosterError];
    [v6 finishRunningWithError:v7];
  }
}

uint64_t __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serverUUID];
  id v4 = [*(id *)(a1 + 32) UUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 localizedName];
  id v4 = WFSanitizedPostersError();

  [v2 finishRunningWithError:v4];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5BBB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 getObjectRepresentation:v6 forClass:objc_opt_class()];
}

void __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 switchToPosterAndFinish:a2];
  }
  else
  {
    id v4 = [v3 parameterForKey:@"WFPoster"];
    id v5 = *(void **)(a1 + 32);
    v6 = [MEMORY[0x263EFF9D8] orderedSetWithObject:v4];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) workQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke_2;
    v9[3] = &unk_264E5BB88;
    void v9[4] = *(void *)(a1 + 32);
    [v5 askForValuesOfParameters:v6 withDefaultStates:MEMORY[0x263EFFA78] prompts:MEMORY[0x263EFFA78] input:v7 workQueue:v8 completionHandler:v9];
  }
}

void __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke_3;
    v7[3] = &unk_264E5BB60;
    v7[4] = *(void *)(a1 + 32);
    [v6 getObjectRepresentation:v7 forClass:objc_opt_class()];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
}

void __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 switchToPosterAndFinish:a2];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) noInputError];
    [v2 finishRunningWithError:v4];
  }
}

@end