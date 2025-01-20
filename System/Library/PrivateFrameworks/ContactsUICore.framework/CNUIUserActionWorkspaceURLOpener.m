@interface CNUIUserActionWorkspaceURLOpener
+ (id)openConfigurationWithEndpoint:(id)a3 isSensitive:(BOOL)a4;
+ (id)urlCouldNotBeOpenedErrorWithURL:(id)a3;
- (CNUIUserActionWorkspaceURLOpener)init;
- (CNUIUserActionWorkspaceURLOpener)initWithWorkspace:(id)a3;
- (LSApplicationWorkspace)workspace;
- (id)openURL:(id)a3 isSensitive:(BOOL)a4 connectionEndpoint:(id)a5 bundleIdentifier:(id)a6 withScheduler:(id)a7;
- (id)openURL:(id)a3 isSensitive:(BOOL)a4 withScheduler:(id)a5;
- (id)openURL:(id)a3 withScheduler:(id)a4;
@end

@implementation CNUIUserActionWorkspaceURLOpener

- (CNUIUserActionWorkspaceURLOpener)init
{
  v3 = [NSClassFromString(&cfstr_Lsapplicationw.isa) defaultWorkspace];
  v4 = [(CNUIUserActionWorkspaceURLOpener *)self initWithWorkspace:v3];

  return v4;
}

- (CNUIUserActionWorkspaceURLOpener)initWithWorkspace:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIUserActionWorkspaceURLOpener;
  v6 = [(CNUIUserActionWorkspaceURLOpener *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workspace, a3);
    v8 = v7;
  }

  return v7;
}

- (id)openURL:(id)a3 withScheduler:(id)a4
{
  return [(CNUIUserActionWorkspaceURLOpener *)self openURL:a3 isSensitive:0 connectionEndpoint:0 bundleIdentifier:0 withScheduler:a4];
}

- (id)openURL:(id)a3 isSensitive:(BOOL)a4 withScheduler:(id)a5
{
  return [(CNUIUserActionWorkspaceURLOpener *)self openURL:a3 isSensitive:a4 connectionEndpoint:0 bundleIdentifier:0 withScheduler:a5];
}

- (id)openURL:(id)a3 isSensitive:(BOOL)a4 connectionEndpoint:(id)a5 bundleIdentifier:(id)a6 withScheduler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x263F33630]);
  if (v12)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __106__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke;
    v24 = &unk_264018E10;
    id v25 = v14;
    v26 = self;
    id v27 = v12;
    id v17 = v16;
    id v28 = v17;
    id v29 = v13;
    BOOL v30 = a4;
    [v15 performBlock:&v21];
    v18 = objc_msgSend(v17, "future", v21, v22, v23, v24);
  }
  else
  {
    v19 = [(id)objc_opt_class() urlCouldNotBeOpenedErrorWithURL:0];
    [v16 finishWithError:v19];

    v18 = [v16 future];
  }

  return v18;
}

void __106__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E8] + 16))())
  {
    v2 = [*(id *)(a1 + 40) workspace];
    v3 = [v2 operationToOpenResource:*(void *)(a1 + 48) usingApplication:*(void *)(a1 + 32) userInfo:0];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __106__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke_2;
    v9[3] = &unk_264017748;
    v4 = &v10;
    id v10 = *(id *)(a1 + 56);
    [v3 setCompletionBlock:v9];
    [v3 start];
  }
  else
  {
    v3 = [(id)objc_opt_class() openConfigurationWithEndpoint:*(void *)(a1 + 64) isSensitive:*(unsigned __int8 *)(a1 + 72)];
    id v5 = [*(id *)(a1 + 40) workspace];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __106__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke_3;
    v7[3] = &unk_264018DE8;
    v4 = &v8;
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    [v5 openURL:v6 configuration:v3 completionHandler:v7];
  }
}

uint64_t __106__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x263EFFA88]];
}

uint64_t __106__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithResult:MEMORY[0x263EFFA88]];
  }
  else {
    return objc_msgSend(v2, "finishWithError:");
  }
}

+ (id)urlCouldNotBeOpenedErrorWithURL:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v3 = [a3 absoluteString];
  }
  else
  {
    v3 = @"(nil)";
  }
  v4 = (void *)MEMORY[0x263F087E8];
  id v8 = @"url";
  v9[0] = v3;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [v4 errorWithDomain:@"CNContactsUIErrorDomain" code:201 userInfo:v5];

  return v6;
}

+ (id)openConfigurationWithEndpoint:(id)a3 isSensitive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (objc_class *)MEMORY[0x263F018D8];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setTargetConnectionEndpoint:v6];

  [v7 setSensitive:v4];
  return v7;
}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void).cxx_destruct
{
}

@end