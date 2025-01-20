@interface MPCAssistantConnection
- (void)connectToEndpoint:(void *)a3 completion:(id)a4;
- (void)connectToEndpointObject:(id)a3 completion:(id)a4;
@end

@implementation MPCAssistantConnection

- (void)connectToEndpoint:(void *)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__MPCAssistantConnection_connectToEndpoint_completion___block_invoke;
  v8[3] = &unk_2643C3908;
  id v9 = v6;
  id v7 = v6;
  [(MPCAssistantConnection *)self connectToEndpointObject:a3 completion:v8];
}

uint64_t __55__MPCAssistantConnection_connectToEndpoint_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)connectToEndpointObject:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = *MEMORY[0x263F54860];
  v14[0] = @"MPCAssistantConnection";
  id v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__MPCAssistantConnection_connectToEndpointObject_completion___block_invoke;
  v10[3] = &unk_2643C6110;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v9 connectToExternalDeviceWithOptions:0 userInfo:v7 completion:v10];
}

void __61__MPCAssistantConnection_connectToEndpointObject_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "Connection failed %{public}@: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEBUG, "Successfully connected to external device.", (uint8_t *)&v12, 2u);
    }

    id v7 = [*(id *)(a1 + 32) origin];
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) externalDevice];
      (*(void (**)(uint64_t, void *, void *, void))(v8 + 16))(v8, v9, v7, 0);
    }
    else
    {
      v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v11;
        _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "No origin for %{public}@", (uint8_t *)&v12, 0xCu);
      }

      id v9 = MPCAssistantCreateSendCommandError(6u);
      (*(void (**)(void, void, void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, v9);
    }
  }
}

@end