@interface MPCMediaRemoteMiddlewareParticipantsOperation
- (MPCFuture)participantsFuture;
- (MPCMediaRemoteMiddleware)middleware;
- (MPCMediaRemoteMiddlewareParticipantsOperation)initWithMiddleware:(id)a3;
- (NSArray)invalidationObservers;
- (id)invalidationHandler;
- (id)timeoutDescription;
- (void)execute;
- (void)setInvalidationHandler:(id)a3;
- (void)setMiddleware:(id)a3;
- (void)setParticipantsFuture:(id)a3;
@end

@implementation MPCMediaRemoteMiddlewareParticipantsOperation

- (void)setInvalidationHandler:(id)a3
{
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (MPCMediaRemoteMiddlewareParticipantsOperation)initWithMiddleware:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaRemoteMiddlewareParticipantsOperation;
  v6 = [(MPAsyncOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_middleware, a3);
  }

  return v7;
}

void __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v11 = objc_alloc(MEMORY[0x263F12148]);
          v12 = [v10 identifier];
          v13 = [v10 identity];
          v14 = (void *)[v11 initWithIdentifier:v12 mediaRemoteUserIdentity:v13];
          v15 = [v10 identifier];
          [v4 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    v16 = (void *)[v4 copy];
    v17 = [*(id *)(a1 + 32) middleware];
    [v17 setQueueParticipants:v16];

    id v3 = v18;
  }
  objc_msgSend(*(id *)(a1 + 32), "finish", v18);
}

- (void)execute
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = [(MPCMediaRemoteMiddlewareParticipantsOperation *)self middleware];
  v4 = [v3 controller];

  if (v4)
  {
    id v5 = _Block_copy(self->_invalidationHandler);
    uint64_t v6 = [(MPCMediaRemoteMiddlewareParticipantsOperation *)self middleware];
    uint64_t v7 = [v6 controller];
    uint64_t v8 = [v7 playbackQueueParticipants];
    [(MPCMediaRemoteMiddlewareParticipantsOperation *)self setParticipantsFuture:v8];

    objc_super v9 = [(MPCMediaRemoteMiddlewareParticipantsOperation *)self participantsFuture];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke;
    v19[3] = &unk_2643C54B8;
    id v20 = v5;
    id v10 = v5;
    id v11 = [v9 onInvalid:v19];

    v21[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    invalidationObservers = self->_invalidationObservers;
    self->_invalidationObservers = v12;

    v14 = [(MPCMediaRemoteMiddlewareParticipantsOperation *)self participantsFuture];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke_2;
    v18[3] = &unk_2643C45A8;
    v18[4] = self;
    v15 = [v14 onSuccess:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke_3;
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

- (MPCFuture)participantsFuture
{
  return self->_participantsFuture;
}

- (void)setParticipantsFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsFuture, 0);
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
  id v3 = [(MPCMediaRemoteMiddlewareParticipantsOperation *)self participantsFuture];
  v4 = [v2 stringWithFormat:@"participantsFuture=%@", v3];

  return v4;
}

uint64_t __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 7000, a2, @"Failed to load participants");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) finishWithError:v3];
}

@end