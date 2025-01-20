@interface STWebRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
+ (void)instantiateWebViewControllerWithConnectionHandler:(id)a3;
- (BOOL)URLIsBlocked;
- (void)setURLIsBlocked:(BOOL)a3;
- (void)setURLIsBlocked:(BOOL)a3 replyHandler:(id)a4;
@end

@implementation STWebRemoteViewController

+ (void)instantiateWebViewControllerWithConnectionHandler:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v11 = *MEMORY[0x263F07FE0];
  v12[0] = 0x26D7C1A18;
  v4 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = 0;
  v5 = [MEMORY[0x263F08800] extensionsWithMatchingAttributes:v4 error:&v10];
  id v6 = v10;
  v7 = [v5 firstObject];

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __79__STWebRemoteViewController_instantiateWebViewControllerWithConnectionHandler___block_invoke;
    v8[3] = &unk_2646E7458;
    id v9 = v3;
    [v7 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] connectionHandler:v8];
  }
  else
  {
    (*((void (**)(id, void, id))v3 + 2))(v3, 0, v6);
  }
}

uint64_t __79__STWebRemoteViewController_instantiateWebViewControllerWithConnectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)serviceViewControllerInterface
{
  id v2 = +[STWebService newServiceInterface];

  return v2;
}

+ (id)exportedInterface
{
  id v2 = +[STWebService newDelegateInterface];

  return v2;
}

- (void)setURLIsBlocked:(BOOL)a3 replyHandler:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x263F08A48] mainQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__STWebRemoteViewController_setURLIsBlocked_replyHandler___block_invoke;
  v9[3] = &unk_2646E7480;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 addOperationWithBlock:v9];
}

uint64_t __58__STWebRemoteViewController_setURLIsBlocked_replyHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setURLIsBlocked:*(unsigned __int8 *)(a1 + 48)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)URLIsBlocked
{
  return self->_URLIsBlocked;
}

- (void)setURLIsBlocked:(BOOL)a3
{
  self->_URLIsBlocked = a3;
}

@end