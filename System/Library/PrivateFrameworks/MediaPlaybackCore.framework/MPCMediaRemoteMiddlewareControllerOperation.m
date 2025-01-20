@interface MPCMediaRemoteMiddlewareControllerOperation
- (MPCFuture)controllerFuture;
- (MPCMediaRemoteController)controller;
- (MPCMediaRemoteMiddleware)middleware;
- (MPCMediaRemoteMiddlewareControllerOperation)initWithMiddleware:(id)a3 playerPath:(id)a4;
- (MPCPlayerPath)playerPath;
- (NSArray)inputProtocols;
- (NSArray)invalidationObservers;
- (NSArray)outputProtocols;
- (NSMapTable)inputOperations;
- (id)invalidationHandler;
- (id)timeoutDescription;
- (void)execute;
- (void)setControllerFuture:(id)a3;
- (void)setInputOperations:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMiddleware:(id)a3;
- (void)setPlayerPath:(id)a3;
@end

@implementation MPCMediaRemoteMiddlewareControllerOperation

- (void)setInvalidationHandler:(id)a3
{
}

- (NSArray)inputProtocols
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (MPCMediaRemoteMiddlewareControllerOperation)initWithMiddleware:(id)a3 playerPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCMediaRemoteMiddlewareControllerOperation;
  v9 = [(MPAsyncOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_playerPath, a4);
  }

  return v10;
}

uint64_t __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 middleware];
  [v5 setController:v4];

  v6 = *(void **)(a1 + 32);

  return [v6 finish];
}

- (MPCMediaRemoteController)controller
{
  v2 = [(MPCMediaRemoteMiddlewareControllerOperation *)self middleware];
  v3 = [v2 controller];

  return (MPCMediaRemoteController *)v3;
}

- (MPCMediaRemoteMiddleware)middleware
{
  return self->_middleware;
}

- (void)execute
{
  v20[1] = *MEMORY[0x263EF8340];
  v3 = _Block_copy(self->_invalidationHandler);
  id v4 = [(MPCMediaRemoteMiddlewareControllerOperation *)self playerPath];
  v5 = +[MPCMediaRemoteController controllerForPlayerPath:v4];
  [(MPCMediaRemoteMiddlewareControllerOperation *)self setControllerFuture:v5];

  v6 = [(MPCMediaRemoteMiddlewareControllerOperation *)self controllerFuture];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke;
  v18[3] = &unk_2643C54B8;
  id v19 = v3;
  id v7 = v3;
  id v8 = [v6 onInvalid:v18];

  v20[0] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  invalidationObservers = self->_invalidationObservers;
  self->_invalidationObservers = v9;

  v11 = [(MPCMediaRemoteMiddlewareControllerOperation *)self controllerFuture];
  objc_super v12 = [(MPCMediaRemoteMiddlewareControllerOperation *)self middleware];
  [v12 setControllerFuture:v11];

  v13 = [(MPCMediaRemoteMiddlewareControllerOperation *)self controllerFuture];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke_2;
  v17[3] = &unk_2643C0D80;
  v17[4] = self;
  v14 = [v13 onSuccess:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke_3;
  v16[3] = &unk_2643C30F8;
  v16[4] = self;
  id v15 = (id)[v14 onFailure:v16];
}

- (MPCFuture)controllerFuture
{
  return self->_controllerFuture;
}

- (void)setControllerFuture:(id)a3
{
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerFuture, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_inputOperations, 0);
}

- (NSArray)outputProtocols
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26CC38538;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (void)setPlayerPath:(id)a3
{
}

- (void)setMiddleware:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInputOperations:(id)a3
{
}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (id)timeoutDescription
{
  v2 = NSString;
  v3 = [(MPCMediaRemoteMiddlewareControllerOperation *)self controllerFuture];
  id v4 = [v2 stringWithFormat:@"controllerFuture=%@", v3];

  return v4;
}

uint64_t __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

@end