@interface WFSelectMusicAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)selectMultiple;
- (id)disabledOnPlatforms;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFSelectMusicAction

+ (id)userInterfaceXPCInterface
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WFSelectMusicAction;
  v2 = objc_msgSendSuper2(&v8, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v4 = (void *)getMPMediaItemCollectionClass_softClass_43074;
  uint64_t v13 = getMPMediaItemCollectionClass_softClass_43074;
  if (!getMPMediaItemCollectionClass_softClass_43074)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getMPMediaItemCollectionClass_block_invoke_43075;
    v9[3] = &unk_264E5EC88;
    v9[4] = &v10;
    __getMPMediaItemCollectionClass_block_invoke_43075((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  v6 = [v3 setWithObject:v5];
  [v2 setClasses:v6 forSelector:sel_showWithSelectMultiple_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2680;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFSelectMusicAction;
  v2 = [(WFSelectMusicAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

- (BOOL)selectMultiple
{
  v2 = [(WFSelectMusicAction *)self parameterValueForKey:@"WFExportSongActionSelectMultiple" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(WFSelectMusicAction *)self selectMultiple];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__WFSelectMusicAction_runWithRemoteUserInterface_input___block_invoke;
  v7[3] = &unk_264E5BE20;
  v7[4] = self;
  [v5 showWithSelectMultiple:v6 completionHandler:v7];
}

void __56__WFSelectMusicAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = objc_msgSend(a2, "items", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        uint64_t v12 = [*(id *)(a1 + 32) output];
        [v12 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 32) finishRunningWithError:v5];
}

@end