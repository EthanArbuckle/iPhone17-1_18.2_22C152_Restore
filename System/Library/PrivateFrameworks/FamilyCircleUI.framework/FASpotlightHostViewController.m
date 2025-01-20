@interface FASpotlightHostViewController
+ (id)requestViewControllerWithContactID:(id)a3 completion:(id)a4;
+ (id)serviceViewControllerInterface;
@end

@implementation FASpotlightHostViewController

+ (id)requestViewControllerWithContactID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F3BE20];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__FASpotlightHostViewController_requestViewControllerWithContactID_completion___block_invoke;
  v13[3] = &unk_264349DB0;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = [a1 requestViewController:@"FASpotlightServiceViewController" fromServiceWithBundleIdentifier:v8 connectionHandler:v13];

  return v11;
}

void __79__FASpotlightHostViewController_requestViewControllerWithContactID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [v7 serviceViewControllerProxy];
  [v6 updateWithContactIdentifier:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA9A4C0];
}

@end