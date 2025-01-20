@interface MPCMediaRemoteMiddlewareCommandsOperation
- (MPCFuture)lastSectionContentItemFuture;
- (MPCFuture)supportedCommandsFuture;
- (MPCMediaRemoteMiddleware)middleware;
- (MPCMediaRemoteMiddlewareCommandsOperation)initWithMiddleware:(id)a3;
- (NSArray)invalidationObservers;
- (id)invalidationHandler;
- (id)timeoutDescription;
- (void)execute;
- (void)setInvalidationHandler:(id)a3;
- (void)setLastSectionContentItemFuture:(id)a3;
- (void)setMiddleware:(id)a3;
- (void)setSupportedCommandsFuture:(id)a3;
@end

@implementation MPCMediaRemoteMiddlewareCommandsOperation

- (void)setInvalidationHandler:(id)a3
{
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (MPCMediaRemoteMiddlewareCommandsOperation)initWithMiddleware:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaRemoteMiddlewareCommandsOperation;
  v6 = [(MPAsyncOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_middleware, a3);
  }

  return v7;
}

void __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  v30[2] = *MEMORY[0x263EF8340];
  if (a2) {
    v3 = a2;
  }
  else {
    v3 = (void *)MEMORY[0x263EFFA78];
  }
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = [v4 middleware];
  [v6 setSupportedCommands:v3];

  uint64_t v7 = [v5 commandInfoForCommand:125];
  if (v7)
  {
    v8 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
    objc_super v9 = *(void **)(a1 + 32);
    if (v8)
    {
      v10 = [v9 middleware];
      v11 = [v10 controller];
      v12 = [v11 contentItemForIdentifier:v8];
      [*(id *)(a1 + 32) setLastSectionContentItemFuture:v12];

      v13 = [*(id *)(a1 + 32) lastSectionContentItemFuture];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_3;
      v28[3] = &unk_2643C54B8;
      id v29 = *(id *)(a1 + 48);
      v14 = [v13 onInvalid:v28];

      v30[0] = *(void *)(a1 + 40);
      v30[1] = v14;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = *(void **)(v16 + 280);
      *(void *)(v16 + 280) = v15;

      v18 = [*(id *)(a1 + 32) lastSectionContentItemFuture];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_4;
      v27[3] = &unk_2643C1108;
      v27[4] = *(void *)(a1 + 32);
      v19 = [v18 onCompletion:v27];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_5;
      v24[3] = &unk_2643C4B00;
      id v20 = v8;
      uint64_t v21 = *(void *)(a1 + 32);
      id v25 = v20;
      uint64_t v26 = v21;
      id v22 = (id)[v19 onFailure:v24];
    }
    else
    {
      [v9 finish];
    }
  }
  else
  {
    v23 = *(void **)(a1 + 32);
    [v23 finish];
  }
}

- (void)execute
{
  v25[1] = *MEMORY[0x263EF8340];
  v3 = [(MPCMediaRemoteMiddlewareCommandsOperation *)self middleware];
  v4 = [v3 controller];

  if (v4)
  {
    id v5 = _Block_copy(self->_invalidationHandler);
    v6 = [(MPCMediaRemoteMiddlewareCommandsOperation *)self middleware];
    uint64_t v7 = [v6 controller];
    v8 = [v7 supportedCommands];
    [(MPCMediaRemoteMiddlewareCommandsOperation *)self setSupportedCommandsFuture:v8];

    objc_super v9 = [(MPCMediaRemoteMiddlewareCommandsOperation *)self supportedCommandsFuture];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke;
    v23[3] = &unk_2643C54B8;
    id v10 = v5;
    id v24 = v10;
    v11 = [v9 onInvalid:v23];

    v25[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    invalidationObservers = self->_invalidationObservers;
    self->_invalidationObservers = v12;

    v14 = [(MPCMediaRemoteMiddlewareCommandsOperation *)self supportedCommandsFuture];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_2;
    v20[3] = &unk_2643C1130;
    id v21 = v11;
    id v22 = v10;
    v20[4] = self;
    id v15 = v11;
    id v16 = v10;
    v17 = [v14 onSuccess:v20];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_6;
    v19[3] = &unk_2643C30F8;
    v19[4] = self;
    id v18 = (id)[v17 onFailure:v19];
  }
  else
  {
    [(MPAsyncOperation *)self cancel];
    [(MPAsyncOperation *)self finish];
  }
}

- (MPCMediaRemoteMiddleware)middleware
{
  return self->_middleware;
}

- (MPCFuture)supportedCommandsFuture
{
  return self->_supportedCommandsFuture;
}

- (void)setSupportedCommandsFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSectionContentItemFuture, 0);
  objc_storeStrong((id *)&self->_supportedCommandsFuture, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);

  objc_storeStrong(&self->_invalidationHandler, 0);
}

uint64_t __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setLastSectionContentItemFuture:(id)a3
{
}

- (MPCFuture)lastSectionContentItemFuture
{
  return self->_lastSectionContentItemFuture;
}

- (void)setMiddleware:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (id)timeoutDescription
{
  v3 = NSString;
  v4 = [(MPCMediaRemoteMiddlewareCommandsOperation *)self supportedCommandsFuture];
  id v5 = [(MPCMediaRemoteMiddlewareCommandsOperation *)self lastSectionContentItemFuture];
  v6 = [v3 stringWithFormat:@"supportedCommandsFuture=%@ lastSectionContentItemFuture=%@", v4, v5];

  return v6;
}

void __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_6(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 4000, a2, @"Failed to get supported commands");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) finishWithError:v3];
}

uint64_t __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 middleware];
  [v5 setLastSectionContentItem:v4];

  v6 = *(void **)(a1 + 32);

  return [v6 finish];
}

void __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_5(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 4000, a2, @"Failed to get lastSectionContentItem with id: %@", *(void *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) finishWithError:v3];
}

@end