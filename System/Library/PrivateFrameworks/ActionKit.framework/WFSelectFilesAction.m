@interface WFSelectFilesAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (id)contentDestinationWithError:(id *)a3;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFSelectFilesAction

+ (id)userInterfaceXPCInterface
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___WFSelectFilesAction;
  v2 = objc_msgSendSuper2(&v12, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_retrieveFilesWithConsumingBundleID_options_completionHandler_ argumentIndex:1 ofReply:0];

  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:sel_retrieveFilesWithConsumingBundleID_options_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1E68;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5 = a3;
  v6 = [(WFSelectFilesAction *)self parameterValueForKey:@"WFPickingMode" ofClass:objc_opt_class()];
  v7 = [(WFSelectFilesAction *)self parameterValueForKey:@"SelectMultiple" ofClass:objc_opt_class()];
  int v8 = [v7 BOOLValue];

  if (v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = [v6 isEqualToString:@"Folders"];
  uint64_t v11 = 4;
  if (v10) {
    uint64_t v11 = 8;
  }
  uint64_t v12 = v11 | v9;
  v13 = [MEMORY[0x263F086E0] mainBundle];
  v14 = [v13 bundleIdentifier];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__WFSelectFilesAction_runWithRemoteUserInterface_input___block_invoke;
  v15[3] = &unk_264E5EEE8;
  v15[4] = self;
  [v5 retrieveFilesWithConsumingBundleID:v14 options:v12 completionHandler:v15];
}

void __56__WFSelectFilesAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__28977;
    uint64_t v12 = __Block_byref_object_dispose__28978;
    id v13 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__WFSelectFilesAction_runWithRemoteUserInterface_input___block_invoke_231;
    v7[3] = &unk_264E59C98;
    v7[4] = *(void *)(a1 + 32);
    v7[5] = &v8;
    [v5 enumerateObjectsUsingBlock:v7];
    [*(id *)(a1 + 32) finishRunningWithError:v9[5]];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
}

void __56__WFSelectFilesAction_runWithRemoteUserInterface_input___block_invoke_231(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F33870];
  v7 = [a2 wrappedURL];
  uint64_t v8 = [v7 url];
  uint64_t v9 = [v6 fileWithURL:v8 options:8];

  if (!v9)
  {
    *a4 = 1;
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F870B8];
    uint64_t v18 = *MEMORY[0x263F08338];
    uint64_t v12 = WFLocalizedString(@"Select Files finished with an error.");
    v19[0] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v14 = [v10 errorWithDomain:v11 code:1 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  v17 = [*(id *)(a1 + 32) output];
  [v17 addFileWithOriginAttribution:v9];
}

@end