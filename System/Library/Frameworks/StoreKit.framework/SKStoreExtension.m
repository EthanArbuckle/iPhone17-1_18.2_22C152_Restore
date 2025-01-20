@interface SKStoreExtension
+ (id)clientInterface;
+ (id)serviceInterface;
- (BOOL)shouldOpenURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)openURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5;
- (void)presentRequestedViewControllerWithIdentifier:(id)a3;
@end

@implementation SKStoreExtension

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(SKStoreExtension *)self _remoteViewControllerProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SKStoreExtension_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_1E5FA9988;
  id v10 = v6;
  id v8 = v6;
  [v7 dismissViewControllerAnimated:v4 completion:v9];
}

uint64_t __61__SKStoreExtension_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)shouldOpenURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5
{
  return 0;
}

- (void)openURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5
{
  if ([(SKStoreExtension *)self shouldOpenURL:a3 sourceApplication:a4 annotation:a5])
  {
    id v6 = [(SKStoreExtension *)self _remoteViewControllerProxy];
    if (v6)
    {
      id v7 = v6;
      [v6 setNeedsTabSelection];
      id v6 = v7;
    }
  }
}

- (void)presentRequestedViewControllerWithIdentifier:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SKStoreExtension *)self _remoteViewControllerProxy];
  v5 = v4;
  if (v4) {
    [v4 presentRequestedViewControllerWithIdentifier:v6];
  }
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08E3C30];
}

+ (id)serviceInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08C82A0];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_setTabIdentifier_ argumentIndex:0 ofReply:0];

  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_openURL_sourceApplication_annotation_ argumentIndex:0 ofReply:0];

  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_openURL_sourceApplication_annotation_ argumentIndex:1 ofReply:0];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_openURL_sourceApplication_annotation_ argumentIndex:2 ofReply:0];

  return v2;
}

@end