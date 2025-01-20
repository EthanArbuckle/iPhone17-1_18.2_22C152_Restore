@interface CNUIUserActionExtensionURLOpener
- (CNUIUserActionExtensionURLOpener)initWithExtensionContext:(id)a3;
- (NSExtensionContext)extensionContext;
- (id)openURL:(id)a3 isSensitive:(BOOL)a4 connectionEndpoint:(id)a5 bundleIdentifier:(id)a6 withScheduler:(id)a7;
- (id)openURL:(id)a3 isSensitive:(BOOL)a4 withScheduler:(id)a5;
- (id)openURL:(id)a3 withScheduler:(id)a4;
@end

@implementation CNUIUserActionExtensionURLOpener

- (CNUIUserActionExtensionURLOpener)initWithExtensionContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIUserActionExtensionURLOpener;
  v6 = [(CNUIUserActionExtensionURLOpener *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionContext, a3);
    v8 = v7;
  }

  return v7;
}

- (id)openURL:(id)a3 withScheduler:(id)a4
{
  return [(CNUIUserActionExtensionURLOpener *)self openURL:a3 isSensitive:0 withScheduler:a4];
}

- (id)openURL:(id)a3 isSensitive:(BOOL)a4 withScheduler:(id)a5
{
  return [(CNUIUserActionExtensionURLOpener *)self openURL:a3 isSensitive:a4 connectionEndpoint:0 bundleIdentifier:0 withScheduler:a5];
}

- (id)openURL:(id)a3 isSensitive:(BOOL)a4 connectionEndpoint:(id)a5 bundleIdentifier:(id)a6 withScheduler:(id)a7
{
  id v9 = a3;
  objc_super v10 = (objc_class *)MEMORY[0x263F33630];
  id v11 = a7;
  id v12 = objc_alloc_init(v10);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __106__CNUIUserActionExtensionURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke;
  v17[3] = &unk_2640173A8;
  id v18 = v9;
  id v19 = v12;
  v20 = self;
  id v13 = v12;
  id v14 = v9;
  [v11 performBlock:v17];

  v15 = [v13 future];

  return v15;
}

void __106__CNUIUserActionExtensionURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke(id *a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a1[4])
  {
    v2 = [a1[6] extensionContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __106__CNUIUserActionExtensionURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke_2;
    v7[3] = &unk_2640189A8;
    id v3 = a1[4];
    id v8 = a1[5];
    id v9 = a1[4];
    [v2 openURL:v3 completionHandler:v7];

    v4 = v8;
  }
  else
  {
    objc_super v10 = @"url";
    v11[0] = @"(nil)";
    v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v5 = a1[5];
    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"CNContactsUIErrorDomain" code:201 userInfo:v4];
    [v5 finishWithError:v6];
  }
}

void __106__CNUIUserActionExtensionURLOpener_openURL_isSensitive_connectionEndpoint_bundleIdentifier_withScheduler___block_invoke_2(uint64_t a1, int a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = MEMORY[0x263EFFA88];
    [v3 finishWithResult:v4];
  }
  else
  {
    id v9 = @"url";
    id v5 = [*(id *)(a1 + 40) absoluteString];
    v10[0] = v5;
    v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

    v7 = *(void **)(a1 + 32);
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"CNContactsUIErrorDomain" code:201 userInfo:v6];
    [v7 finishWithError:v8];
  }
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void).cxx_destruct
{
}

@end