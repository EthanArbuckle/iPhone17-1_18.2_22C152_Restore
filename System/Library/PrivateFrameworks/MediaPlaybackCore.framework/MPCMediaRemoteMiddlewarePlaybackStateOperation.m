@interface MPCMediaRemoteMiddlewarePlaybackStateOperation
- (MPCFuture)playbackStateFuture;
- (MPCMediaRemoteMiddleware)middleware;
- (MPCMediaRemoteMiddlewarePlaybackStateOperation)initWithMiddleware:(id)a3;
- (NSArray)invalidationObservers;
- (id)invalidationHandler;
- (id)timeoutDescription;
- (void)execute;
- (void)setInvalidationHandler:(id)a3;
- (void)setMiddleware:(id)a3;
- (void)setPlaybackStateFuture:(id)a3;
@end

@implementation MPCMediaRemoteMiddlewarePlaybackStateOperation

- (void)setInvalidationHandler:(id)a3
{
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (MPCMediaRemoteMiddlewarePlaybackStateOperation)initWithMiddleware:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaRemoteMiddlewarePlaybackStateOperation;
  v6 = [(MPAsyncOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_middleware, a3);
  }

  return v7;
}

uint64_t __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2) - 1;
    if (v3 > 4) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = qword_21BEF1878[v3];
    }
    id v5 = [*(id *)(a1 + 32) middleware];
    [v5 setPlayerState:v4];
  }
  v6 = *(void **)(a1 + 32);

  return [v6 finish];
}

- (void)execute
{
  v21[1] = *MEMORY[0x263EF8340];
  unsigned int v3 = [(MPCMediaRemoteMiddlewarePlaybackStateOperation *)self middleware];
  uint64_t v4 = [v3 controller];

  if (v4)
  {
    id v5 = _Block_copy(self->_invalidationHandler);
    v6 = [(MPCMediaRemoteMiddlewarePlaybackStateOperation *)self middleware];
    v7 = [v6 controller];
    v8 = [v7 playbackState];
    [(MPCMediaRemoteMiddlewarePlaybackStateOperation *)self setPlaybackStateFuture:v8];

    objc_super v9 = [(MPCMediaRemoteMiddlewarePlaybackStateOperation *)self playbackStateFuture];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke;
    v19[3] = &unk_2643C54B8;
    id v20 = v5;
    id v10 = v5;
    v11 = [v9 onInvalid:v19];

    v21[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    invalidationObservers = self->_invalidationObservers;
    self->_invalidationObservers = v12;

    v14 = [(MPCMediaRemoteMiddlewarePlaybackStateOperation *)self playbackStateFuture];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke_2;
    v18[3] = &unk_2643C0520;
    v18[4] = self;
    v15 = [v14 onSuccess:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke_3;
    v17[3] = &unk_2643C30F8;
    v17[4] = self;
    id v16 = (id)[v15 onFailure:v17];
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

- (MPCFuture)playbackStateFuture
{
  return self->_playbackStateFuture;
}

- (void)setPlaybackStateFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackStateFuture, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);

  objc_storeStrong(&self->_invalidationHandler, 0);
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
  v2 = NSString;
  unsigned int v3 = [(MPCMediaRemoteMiddlewarePlaybackStateOperation *)self playbackStateFuture];
  uint64_t v4 = [v2 stringWithFormat:@"playbackStateFuture=%@", v3];

  return v4;
}

uint64_t __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 6000, a2, @"Failed to get playback state");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) finishWithError:v3];
}

@end