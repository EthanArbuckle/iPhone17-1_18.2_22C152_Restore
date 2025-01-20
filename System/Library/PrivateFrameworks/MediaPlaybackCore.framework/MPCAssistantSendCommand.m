@interface MPCAssistantSendCommand
- (BOOL)_isAnyDeviceControllable:(id)a3;
- (MPCAssistantSendCommand)init;
- (void)_checkForAccount:(id)a3 destination:(id)a4 origin:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)_findEndpointFromEndpoints:(id)a3 byGroupLeader:(id)a4;
- (void)_formGroupAndSendCommand:(unsigned int)a3 withOptions:(id)a4 toExternalDestination:(id)a5 completion:(id)a6;
- (void)_sendCommand:(unsigned int)a3 path:(id)a4 options:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toEndpoint:(void *)a5 toDestination:(id)a6 completion:(id)a7;
- (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEndpoint:(id)a5 toDestination:(id)a6 completion:(id)a7;
- (void)sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 toEndpointDestination:(id)a5 completion:(id)a6;
- (void)sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 toLocalDestination:(id)a5 completion:(id)a6;
@end

@implementation MPCAssistantSendCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_findEndpointFromEndpoints:(id)a3 byGroupLeader:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      if (MRAVEndpointGetDesignatedGroupLeader())
      {
        v13 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
        char v14 = objc_msgSend(v6, "isEqualToString:", v13, (void)v16);

        if (v14) {
          break;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isAnyDeviceControllable:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if MRAVOutputDeviceIsRemoteControllable() && (MRAVOutputDeviceCanAccessAppleMusic())
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_sendCommand:(unsigned int)a3 path:(id)a4 options:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v8 = a7;
  id v7 = v8;
  MRMediaRemoteSendCommandToPlayerWithResult();
}

uint64_t __70__MPCAssistantSendCommand__sendCommand_path_options_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toEndpoint:(void *)a5 toDestination:(id)a6 completion:(id)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v16 = dispatch_queue_create("com.apple.mediaplayer.assistant.callback", v15);

  long long v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = (void *)MRMediaRemoteCopyCommandDescription();
    *(_DWORD *)buf = 138543618;
    v32 = v18;
    __int16 v33 = 2114;
    v34 = a5;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "Sending command: %{public}@ endpoint %{public}@...", buf, 0x16u);
  }
  connection = self->_connection;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__MPCAssistantSendCommand__sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke;
  v24[3] = &unk_2643C2938;
  dispatch_queue_t v28 = v16;
  id v29 = v14;
  id v25 = v13;
  v26 = self;
  unsigned int v30 = a3;
  id v27 = v12;
  v20 = v16;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  [(MPCAssistantConnection *)connection connectToEndpoint:a5 completion:v24];
}

void __88__MPCAssistantSendCommand__sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v5();
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = a3;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEBUG, "Sending command to remote origin %@...", buf, 0xCu);
    }

    id v8 = (void *)[*(id *)(a1 + 32) createPlayerPath];
    id v9 = objc_alloc(MEMORY[0x263F54928]);
    long long v10 = [v8 client];
    long long v11 = [v8 player];
    id v12 = (void *)[v9 initWithOrigin:a3 client:v10 player:v11];

    uint64_t v13 = *(unsigned int *)(a1 + 72);
    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __88__MPCAssistantSendCommand__sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke_41;
    v17[3] = &unk_2643C27D0;
    uint64_t v16 = *(void *)(a1 + 56);
    id v18 = *(id *)(a1 + 64);
    [v14 _sendCommand:v13 path:v12 options:v15 queue:v16 completion:v17];
  }
}

uint64_t __88__MPCAssistantSendCommand__sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_formGroupAndSendCommand:(unsigned int)a3 withOptions:(id)a4 toExternalDestination:(id)a5 completion:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v11 outputDeviceUIDs];
  id v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.mediaplayer.assistant.grouping", v14);

  if (a3 - 121 > 0xB || (int v16 = 1, ((1 << (a3 - 121)) & 0x803) == 0)) {
    int v16 = 0;
  }
  long long v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v13;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEBUG, "Searching for output devices matching UIDs: %{public}@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke;
  aBlock[3] = &unk_2643C2848;
  id v18 = v10;
  id v36 = v18;
  int v41 = v16;
  id v19 = v11;
  id v37 = v19;
  unsigned int v42 = a3;
  uint64_t v20 = v15;
  v38 = v20;
  v39 = self;
  id v21 = v12;
  id v40 = v21;
  id v22 = _Block_copy(aBlock);
  discovery = self->_discovery;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_27;
  v29[3] = &unk_2643C2910;
  v29[4] = self;
  unsigned int v30 = v20;
  id v31 = v18;
  id v32 = v19;
  id v33 = v21;
  id v34 = v22;
  id v24 = v22;
  id v25 = v19;
  id v26 = v18;
  id v27 = v20;
  id v28 = v21;
  [(MPCAssistantDiscovery *)discovery discoverRemoteControlEndpointsMatchingUIDs:v13 completion:v29];
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:*(void *)(a1 + 32)];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F54D78]];

  id v6 = (void *)[*(id *)(a1 + 40) createPlayerPath];
  id v8 = v3;
  id v9 = *(id *)(a1 + 64);
  id v7 = v3;
  MRAVEndpointGroupDevicesAndSendCommandWithResult();
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_27(id *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (![v6 count])
  {
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "Send to external destination: No devices found.", buf, 2u);
    }

    uint64_t v8 = 1;
    goto LABEL_12;
  }
  if (([a1[4] _isAnyDeviceControllable:v6] & 1) == 0)
  {
    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "Send to external destination: Not remote controllable.", buf, 2u);
    }

    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v6;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEBUG, "No remote controllable device found among devices: %{public}@", buf, 0xCu);
    }

    uint64_t v8 = 2;
LABEL_12:
    id v11 = MPCAssistantCreateError(v8);
    [*((id *)a1[4] + 2) stopDiscovery];
    (*((void (**)(void))a1[8] + 2))();

    goto LABEL_13;
  }
  id v12 = v5;
  id v13 = a1[6];
  id v14 = a1[7];
  id v15 = a1[5];
  id v16 = v6;
  id v17 = a1[9];
  id v18 = a1[8];
  MRAVEndpointPredictGroupLeader();

LABEL_13:
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) _findEndpointFromEndpoints:*(void *)(a1 + 40) byGroupLeader:v4];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_2_29;
    v9[3] = &unk_2643C28C0;
    v9[4] = v7;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 72);
    id v14 = v4;
    uint64_t v17 = v6;
    id v15 = *(id *)(a1 + 80);
    id v16 = *(id *)(a1 + 88);
    [v8 connectToEndpoint:v6 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_2_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_3;
    v12[3] = &unk_2643C2898;
    id v13 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 72);
    id v15 = v4;
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 96);
    id v16 = v9;
    uint64_t v20 = v10;
    id v11 = *(id *)(a1 + 80);
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = v11;
    id v19 = *(id *)(a1 + 88);
    [v5 _checkForAccount:v6 destination:v7 origin:v15 queue:v8 completion:v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if ([*(id *)(a1 + 32) containsObject:*(void *)(a1 + 40)])
    {
      id v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = v4;
        _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEBUG, "Sending pause to future group leader at: %{public}@", buf, 0xCu);
      }

      id v9 = *(id *)(a1 + 72);
      id v8 = *(id *)(a1 + 32);
      MRMediaRemoteSendCommandForOriginWithReply();
    }
    else
    {
      uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
      v7();
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "Send to external destination: No matching account.", buf, 2u);
    }

    uint64_t v6 = MPCAssistantCreateError(2);
    [*(id *)(*(void *)(a1 + 64) + 16) stopDiscovery];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MRMediaRemoteCopyCommandDescription();
  if ([v3 containsObject:&unk_26CC19008])
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v4;
      __int16 v21 = 2114;
      uint64_t v22 = v6;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEBUG, "Sent %{public}@ to %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F089D8] string];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "unsignedShortValue", (void)v15);
          uint64_t v12 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();
          [v5 appendString:v12];

          [v5 appendString:@" "];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
      }
      while (v9);
    }

    id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v4;
      __int16 v21 = 2114;
      uint64_t v22 = v14;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "Sent %{public}@ to %{public}@: %{public}@", buf, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MRMediaRemoteCopyCommandDescription();
  uint64_t v11 = [v7 error];

  if (v11)
  {
    uint64_t v12 = [v7 error];
    int IsInformational = MRMediaRemoteErrorIsInformational();

    uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    long long v15 = v14;
    if (IsInformational)
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      long long v16 = [v7 error];
      *(_DWORD *)unsigned int v30 = 138543874;
      *(void *)&v30[4] = v10;
      *(_WORD *)&v30[12] = 2114;
      *(void *)&v30[14] = v9;
      *(_WORD *)&v30[22] = 2114;
      id v31 = v16;
      long long v17 = "Sent %{public}@ to %{public}@ informational: %{public}@";
      long long v18 = v15;
      os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      long long v16 = [v7 error];
      *(_DWORD *)unsigned int v30 = 138543874;
      *(void *)&v30[4] = v10;
      *(_WORD *)&v30[12] = 2114;
      *(void *)&v30[14] = v9;
      *(_WORD *)&v30[22] = 2114;
      id v31 = v16;
      long long v17 = "Sent %{public}@ to %{public}@ error: %{public}@";
      long long v18 = v15;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_21BB87000, v18, v19, v17, v30, 0x20u);
  }
  else
  {
    long long v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)unsigned int v30 = 138543618;
      *(void *)&v30[4] = v10;
      *(_WORD *)&v30[12] = 2114;
      *(void *)&v30[14] = v9;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEBUG, "Sent %{public}@ to %{public}@", v30, 0x16u);
    }
  }
LABEL_10:

  if (!v8)
  {
    id v25 = [MEMORY[0x263F54948] currentSettings];
    char v26 = [v25 isMultiplayerHost];

    id v24 = 0;
    if ([*(id *)(a1 + 32) count] != 1 || (v26 & 1) != 0) {
      goto LABEL_27;
    }
    uint64_t v27 = 6;
LABEL_23:
    id v24 = MPCAssistantCreateError(v27);
    goto LABEL_27;
  }
  uint64_t v20 = [v8 domain];
  int v21 = [v20 isEqualToString:*MEMORY[0x263F54AE0]];

  if (!v21)
  {
LABEL_18:
    id v24 = 0;
    goto LABEL_27;
  }
  uint64_t v22 = [v8 code];
  switch(v22)
  {
    case 200:
      uint64_t v27 = 7;
      goto LABEL_23;
    case 202:
      goto LABEL_18;
    case 201:
      __int16 v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v30 = 0;
        _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_ERROR, "The remote group leader went silent. Logs on the external device should be checked.", v30, 2u);
      }

      goto LABEL_18;
  }
  id v24 = MPCAssistantCreateError(3);
  id v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v29 = [v7 error];
    *(_DWORD *)unsigned int v30 = 138543362;
    *(void *)&v30[4] = v29;
    _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_ERROR, "Got error when grouping devices: %{public}@", v30, 0xCu);
  }
LABEL_27:
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "stopDiscovery", *(_OWORD *)v30, *(void *)&v30[16], v31);
  (*(void (**)(void, id, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v24, [*(id *)(a1 + 32) count]);
}

- (void)_checkForAccount:(id)a3 destination:(id)a4 origin:(id)a5 queue:(id)a6 completion:(id)a7
{
  v178[0] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v15 = (void (**)(id, uint64_t))a7;
  if ([v13 isLocallyHosted])
  {
    uint64_t v16 = [MEMORY[0x263F54900] localOrigin];

    id v13 = (id)v16;
  }
  long long v17 = [v12 appBundleID];
  char IsSystemApplication = MRMediaRemoteApplicationIsSystemApplication();

  if (IsSystemApplication) {
    goto LABEL_8;
  }
  os_log_type_t v19 = [v12 appBundleID];
  char v20 = [v19 isEqualToString:*MEMORY[0x263F54E28]];

  if ((v20 & 1) != 0
    || ([v12 appBundleID],
        int v21 = objc_claimAutoreleasedReturnValue(),
        char v22 = [v21 isEqualToString:*MEMORY[0x263F54E30]],
        v21,
        (v22 & 1) != 0))
  {
LABEL_8:
    char v26 = [v11 valueForKey:*MEMORY[0x263F54DB8]];
    if (!v26)
    {
      v15[2](v15, 1);
LABEL_166:

      goto LABEL_167;
    }
    id v171 = 0;
    uint64_t v27 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v26 error:&v171];
    id v28 = v171;
    if (v28)
    {
      id v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_ERROR, "Cannot decode active identity", buf, 2u);
      }

      goto LABEL_13;
    }
    if (!v27)
    {
LABEL_13:
      v15[2](v15, 1);
LABEL_165:

      goto LABEL_166;
    }
    v168 = v27;
    id v30 = [v27 accountDSID];
    memset(&v173, 0, sizeof(v173));
    *(void *)buf = 4001;
    CC_SHA1_Init((CC_SHA1_CTX *)&v173);
    id v31 = v30;
    uint64_t v32 = (unsigned char *)[v31 UTF8String];
    unint64_t v33 = [v31 length];
    int v34 = v33;
    if (*(uint64_t *)buf > 3999)
    {
      if (*(uint64_t *)buf > 4255)
      {
        if (*(void *)buf == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)&v173, v32, v33);
        }
        else if (*(void *)buf == 4512)
        {
          CC_SHA512_Update(&v173, v32, v33);
        }
      }
      else if (*(void *)buf == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)&v173, v32, v33);
      }
      else if (*(void *)buf == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)&v173, v32, v33);
      }
    }
    else
    {
      if (*(uint64_t *)buf <= 2999)
      {
        if (*(void *)buf)
        {
          if (*(void *)buf == 2000)
          {
            int v35 = (((v33 + BYTE3(v173.count[1])) & 3) - BYTE3(v173.count[1]));
            id v36 = (char *)&v173.hash[-1] + BYTE3(v173.count[1]);
            switch(v35)
            {
              case 0:
                break;
              case 1:
                *id v36 = *v32;
                break;
              case 2:
                __int16 v56 = *(_WORD *)v32;
                goto LABEL_69;
              case 3:
                __int16 v56 = *(_WORD *)v32;
                *((unsigned char *)&v173.count[1] + BYTE3(v173.count[1]) + 2) = v32[2];
LABEL_69:
                *(_WORD *)id v36 = v56;
                break;
              default:
                memcpy(v36, v32, (((v34 + BYTE3(v173.count[1])) & 3) - BYTE3(v173.count[1])));
                break;
            }
            HIDWORD(v173.count[0]) += v34;
          }
        }
        else
        {
          v38 = [MEMORY[0x263F08690] currentHandler];
          v39 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          [v38 handleFailureInFunction:v39 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
        }
        goto LABEL_71;
      }
      if (*(void *)buf == 3000)
      {
        if (!v32) {
          goto LABEL_71;
        }
        BOOL v41 = v33 > 0xF || (LODWORD(v173.count[0]) + v33) > 0xF;
        LODWORD(v173.count[0]) += v33;
        HIDWORD(v173.count[0]) |= v41;
        if (v33 + LODWORD(v173.hash[3]) > 0xF)
        {
          v48 = &v32[v33];
          if (LODWORD(v173.hash[3]))
          {
            v167 = &v32[v33];
            memcpy((char *)&v173.wbuf[-7] + LODWORD(v173.hash[3]), v32, (16 - LODWORD(v173.hash[3])));
            v48 = v167;
            HIDWORD(v49) = LODWORD(v173.count[1]) - 2048144777 * LODWORD(v173.hash[1]);
            LODWORD(v49) = HIDWORD(v49);
            int v50 = -1640531535 * (v49 >> 19);
            HIDWORD(v49) = HIDWORD(v173.count[1]) - 2048144777 * HIDWORD(v173.hash[1]);
            LODWORD(v49) = HIDWORD(v49);
            LODWORD(v173.count[1]) = v50;
            HIDWORD(v173.count[1]) = -1640531535 * (v49 >> 19);
            HIDWORD(v49) = LODWORD(v173.hash[0]) - 2048144777 * LODWORD(v173.hash[2]);
            LODWORD(v49) = HIDWORD(v49);
            LODWORD(v173.hash[0]) = -1640531535 * (v49 >> 19);
            HIDWORD(v49) = HIDWORD(v173.hash[0]) - 2048144777 * HIDWORD(v173.hash[2]);
            LODWORD(v49) = HIDWORD(v49);
            v32 += (16 - LODWORD(v173.hash[3]));
            HIDWORD(v173.hash[0]) = -1640531535 * (v49 >> 19);
            LODWORD(v173.hash[3]) = 0;
          }
          if (v32 <= v48 - 16)
          {
            unsigned int v51 = v173.count[1];
            unsigned int v52 = HIDWORD(v173.count[1]);
            unsigned int v53 = v173.hash[0];
            unsigned int v54 = HIDWORD(v173.hash[0]);
            do
            {
              HIDWORD(v55) = v51 - 2048144777 * *(_DWORD *)v32;
              LODWORD(v55) = HIDWORD(v55);
              unsigned int v51 = -1640531535 * (v55 >> 19);
              HIDWORD(v55) = v52 - 2048144777 * *((_DWORD *)v32 + 1);
              LODWORD(v55) = HIDWORD(v55);
              unsigned int v52 = -1640531535 * (v55 >> 19);
              HIDWORD(v55) = v53 - 2048144777 * *((_DWORD *)v32 + 2);
              LODWORD(v55) = HIDWORD(v55);
              unsigned int v53 = -1640531535 * (v55 >> 19);
              HIDWORD(v55) = v54 - 2048144777 * *((_DWORD *)v32 + 3);
              LODWORD(v55) = HIDWORD(v55);
              unsigned int v54 = -1640531535 * (v55 >> 19);
              v32 += 16;
            }
            while (v32 <= v48 - 16);
            v173.count[1] = __PAIR64__(v52, v51);
            v173.hash[0] = __PAIR64__(v54, v53);
          }
          if (v32 >= v48) {
            goto LABEL_71;
          }
          int v42 = v48 - v32;
          __memcpy_chk();
        }
        else
        {
          memcpy((char *)&v173.wbuf[-7] + LODWORD(v173.hash[3]), v32, v33);
          int v42 = LODWORD(v173.hash[3]) + v34;
        }
        LODWORD(v173.hash[3]) = v42;
        goto LABEL_71;
      }
      if (*(void *)buf != 3001 || !v32) {
        goto LABEL_71;
      }
      v173.count[0] += v33;
      if (v33 + LODWORD(v173.hash[7]) <= 0x1F)
      {
        memcpy((char *)&v173.wbuf[-5] + LODWORD(v173.hash[7]), v32, v33);
        int v37 = LODWORD(v173.hash[7]) + v34;
LABEL_56:
        LODWORD(v173.hash[7]) = v37;
        goto LABEL_71;
      }
      unint64_t v43 = (unint64_t)&v32[v33];
      if (LODWORD(v173.hash[7]))
      {
        v166 = &v32[v33];
        memcpy((char *)&v173.wbuf[-5] + LODWORD(v173.hash[7]), v32, (32 - LODWORD(v173.hash[7])));
        unint64_t v43 = (unint64_t)v166;
        v173.count[1] = 0x9E3779B185EBCA87 * __ROR8__(v173.count[1] - 0x3D4D51C2D82B14B1 * v173.hash[3], 33);
        v173.hash[0] = 0x9E3779B185EBCA87 * __ROR8__(v173.hash[0] - 0x3D4D51C2D82B14B1 * v173.hash[4], 33);
        v173.hash[1] = 0x9E3779B185EBCA87 * __ROR8__(v173.hash[1] - 0x3D4D51C2D82B14B1 * v173.hash[5], 33);
        v173.hash[2] = 0x9E3779B185EBCA87 * __ROR8__(v173.hash[2] - 0x3D4D51C2D82B14B1 * v173.hash[6], 33);
        v32 += (32 - LODWORD(v173.hash[7]));
        LODWORD(v173.hash[7]) = 0;
      }
      if ((unint64_t)(v32 + 32) <= v43)
      {
        unint64_t v44 = v173.count[1];
        unint64_t v46 = v173.hash[1];
        unint64_t v47 = v173.hash[0];
        unint64_t v45 = v173.hash[2];
        do
        {
          unint64_t v44 = 0x9E3779B185EBCA87 * __ROR8__(v44 - 0x3D4D51C2D82B14B1 * *(void *)v32, 33);
          unint64_t v47 = 0x9E3779B185EBCA87 * __ROR8__(v47 - 0x3D4D51C2D82B14B1 * *((void *)v32 + 1), 33);
          unint64_t v46 = 0x9E3779B185EBCA87 * __ROR8__(v46 - 0x3D4D51C2D82B14B1 * *((void *)v32 + 2), 33);
          unint64_t v45 = 0x9E3779B185EBCA87 * __ROR8__(v45 - 0x3D4D51C2D82B14B1 * *((void *)v32 + 3), 33);
          v32 += 32;
        }
        while ((unint64_t)v32 <= v43 - 32);
        v173.count[1] = v44;
        v173.hash[0] = v47;
        v173.hash[1] = v46;
        v173.hash[2] = v45;
      }
      if ((unint64_t)v32 < v43)
      {
        int v37 = v43 - v32;
        __memcpy_chk();
        goto LABEL_56;
      }
    }
LABEL_71:

    memset(&v174[8], 0, 64);
    *(void *)v174 = *(void *)buf;
    if (*(uint64_t *)buf > 3000)
    {
      if (*(uint64_t *)buf > 4000)
      {
        switch(*(void *)buf)
        {
          case 0xFA1:
            CC_SHA1_Final(&v174[8], (CC_SHA1_CTX *)&v173);
            break;
          case 0x10A0:
            CC_SHA256_Final(&v174[8], (CC_SHA256_CTX *)&v173);
            break;
          case 0x11A0:
            CC_SHA512_Final(&v174[8], &v173);
            break;
        }
        goto LABEL_118;
      }
      if (*(void *)buf != 3001)
      {
        if (*(void *)buf == 4000) {
          CC_MD5_Final(&v174[8], (CC_MD5_CTX *)&v173);
        }
LABEL_118:
        v175[0] = *(_OWORD *)v174;
        v175[1] = *(_OWORD *)&v174[16];
        v175[2] = *(_OWORD *)&v174[32];
        v175[3] = *(_OWORD *)&v174[48];
        uint64_t v176 = *(void *)&v174[64];
        if (*(uint64_t *)v174 <= 3999)
        {
          if (*(uint64_t *)v174 > 2999)
          {
            if (*(void *)v174 == 3000)
            {
              LODWORD(v177[0]) = bswap32(DWORD2(v175[0]));
              v152 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
              uint64_t v153 = 0;
              v154 = v152 + 1;
              do
              {
                unint64_t v155 = *((unsigned __int8 *)v177 + v153);
                *(v154 - 1) = MSVFastHexStringFromBytes_hexCharacters_28179[v155 >> 4];
                unsigned char *v154 = MSVFastHexStringFromBytes_hexCharacters_28179[v155 & 0xF];
                v154 += 2;
                ++v153;
              }
              while (v153 != 4);
              id v130 = [NSString alloc];
              v131 = v152;
              uint64_t v132 = 8;
            }
            else
            {
              if (*(void *)v174 != 3001) {
                goto LABEL_168;
              }
              v177[0] = bswap64(*((unint64_t *)&v175[0] + 1));
              v126 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
              uint64_t v127 = 0;
              v128 = v126 + 1;
              do
              {
                unint64_t v129 = *((unsigned __int8 *)v177 + v127);
                *(v128 - 1) = MSVFastHexStringFromBytes_hexCharacters_28179[v129 >> 4];
                unsigned char *v128 = MSVFastHexStringFromBytes_hexCharacters_28179[v129 & 0xF];
                v128 += 2;
                ++v127;
              }
              while (v127 != 8);
              id v130 = [NSString alloc];
              v131 = v126;
              uint64_t v132 = 16;
            }
            v145 = (__CFString *)[v130 initWithBytesNoCopy:v131 length:v132 encoding:4 freeWhenDone:1];
LABEL_164:

            v162 = [(__CFString *)v145 substringToIndex:7];

            v169 = v162;
            v170 = v15;
            id v163 = v162;
            MRMediaRemoteGetSupportedCommandsForApp();

            uint64_t v27 = v168;
            goto LABEL_165;
          }
          if (*(void *)v174 == 1000)
          {
            uint64_t v139 = *((void *)&v175[0] + 1);
            v140 = (char *)v178 + 1;
            uint64_t quot = *((void *)&v175[0] + 1);
            do
            {
              lldiv_t v142 = lldiv(quot, 10);
              uint64_t quot = v142.quot;
              if (v142.rem >= 0) {
                LOBYTE(v143) = v142.rem;
              }
              else {
                uint64_t v143 = -v142.rem;
              }
              *(v140 - 2) = v143 + 48;
              v144 = (const UInt8 *)(v140 - 2);
              --v140;
            }
            while (v142.quot);
            if (v139 < 0)
            {
              *(v140 - 2) = 45;
              v144 = (const UInt8 *)(v140 - 2);
            }
            v145 = (__CFString *)CFStringCreateWithBytes(0, v144, (char *)v178 - (char *)v144, 0x8000100u, 0);
            goto LABEL_164;
          }
          if (*(void *)v174 == 2000)
          {
            id v111 = v31;
            uint64_t v112 = DWORD2(v175[0]);
            v113 = (const UInt8 *)v178;
            do
            {
              ldiv_t v114 = ldiv(v112, 10);
              uint64_t v112 = v114.quot;
              if (v114.rem >= 0) {
                LOBYTE(v115) = v114.rem;
              }
              else {
                uint64_t v115 = -v114.rem;
              }
              *--v113 = v115 + 48;
            }
            while (v114.quot);
            CFStringRef v116 = CFStringCreateWithBytes(0, v113, (char *)v178 - (char *)v113, 0x8000100u, 0);
            goto LABEL_163;
          }
LABEL_168:
          v164 = [MEMORY[0x263F08690] currentHandler];
          v165 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
          [v164 handleFailureInFunction:v165 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

          v145 = &stru_26CBCA930;
          goto LABEL_164;
        }
        if (*(uint64_t *)v174 > 4255)
        {
          if (*(void *)v174 == 4256)
          {
            id v111 = v31;
            v156 = (unsigned __int8 *)v175 + 8;
            v157 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
            v158 = v157;
            for (uint64_t i = 0; i != 64; i += 2)
            {
              unsigned int v160 = *v156++;
              v161 = &v157[i];
              char *v161 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v160 >> 4];
              v161[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v160 & 0xF];
            }
            id v123 = [NSString alloc];
            v124 = v158;
            uint64_t v125 = 64;
          }
          else
          {
            if (*(void *)v174 != 4512) {
              goto LABEL_168;
            }
            id v111 = v31;
            v133 = (unsigned __int8 *)v175 + 8;
            v134 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
            v135 = v134;
            for (uint64_t j = 0; j != 128; j += 2)
            {
              unsigned int v137 = *v133++;
              v138 = &v134[j];
              char *v138 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v137 >> 4];
              v138[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v137 & 0xF];
            }
            id v123 = [NSString alloc];
            v124 = v135;
            uint64_t v125 = 128;
          }
        }
        else if (*(void *)v174 == 4000)
        {
          id v111 = v31;
          v146 = (unsigned __int8 *)v175 + 8;
          v147 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
          v148 = v147;
          for (uint64_t k = 0; k != 32; k += 2)
          {
            unsigned int v150 = *v146++;
            v151 = &v147[k];
            char *v151 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v150 >> 4];
            v151[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v150 & 0xF];
          }
          id v123 = [NSString alloc];
          v124 = v148;
          uint64_t v125 = 32;
        }
        else
        {
          if (*(void *)v174 != 4001) {
            goto LABEL_168;
          }
          id v111 = v31;
          v117 = (unsigned __int8 *)v175 + 8;
          v118 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
          v119 = v118;
          for (uint64_t m = 0; m != 40; m += 2)
          {
            unsigned int v121 = *v117++;
            v122 = &v118[m];
            char *v122 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v121 >> 4];
            v122[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v121 & 0xF];
          }
          id v123 = [NSString alloc];
          v124 = v119;
          uint64_t v125 = 40;
        }
        CFStringRef v116 = (CFStringRef)[v123 initWithBytesNoCopy:v124 length:v125 encoding:4 freeWhenDone:1];
LABEL_163:
        v145 = (__CFString *)v116;
        id v31 = v111;
        goto LABEL_164;
      }
      if (v173.count[0] < 0x20) {
        CC_LONG64 v92 = v173.hash[1] + 0x27D4EB2F165667C5;
      }
      else {
        CC_LONG64 v92 = 0x9E3779B185EBCA87
      }
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((0x9E3779B185EBCA87
                  * ((__ROR8__(v173.hash[0], 57)
                    + __ROR8__(v173.count[1], 63)
                    + __ROR8__(v173.hash[1], 52)
                    + __ROR8__(v173.hash[2], 46)) ^ (0x9E3779B185EBCA87
                                                   * __ROR8__(0xC2B2AE3D27D4EB4FLL * v173.count[1], 33)))
                  - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v173.hash[0], 33)))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v173.hash[1], 33)))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v173.hash[2], 33)))
            - 0x7A1435883D4D519DLL;
      unint64_t v93 = v92 + v173.count[0];
      v94 = &v173.hash[3];
      unint64_t v95 = v173.count[0] & 0x1F;
      if (v95 >= 8)
      {
        do
        {
          uint64_t v96 = *v94++;
          unint64_t v93 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v96, 33)) ^ v93, 37);
          v95 -= 8;
        }
        while (v95 > 7);
      }
      if (v95 >= 4)
      {
        unsigned int v97 = *(_DWORD *)v94;
        v94 = (CC_LONG64 *)((char *)v94 + 4);
        unint64_t v93 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v97) ^ v93, 41);
        v95 -= 4;
      }
      for (; v95; --v95)
      {
        unsigned int v98 = *(unsigned __int8 *)v94;
        v94 = (CC_LONG64 *)((char *)v94 + 1);
        unint64_t v93 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v98) ^ v93, 53);
      }
      unint64_t v99 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v93 ^ (v93 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v93 ^ (v93 >> 33))) >> 29));
      CC_LONG64 v87 = v99 ^ HIDWORD(v99);
LABEL_105:
      *(void *)&v174[8] = v87;
      goto LABEL_118;
    }
    if (*(uint64_t *)buf <= 1999)
    {
      if (!*(void *)buf)
      {
        v89 = [MEMORY[0x263F08690] currentHandler];
        v90 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v89 handleFailureInFunction:v90 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

        goto LABEL_118;
      }
      if (*(void *)buf != 1000) {
        goto LABEL_118;
      }
      CC_LONG64 v57 = (v173.count[0] + v173.count[1]) ^ __ROR8__(v173.count[1], 51);
      CC_LONG64 v58 = v173.hash[0] + (v173.hash[1] ^ v173.hash[2]);
      uint64_t v59 = __ROR8__(v173.hash[1] ^ v173.hash[2], 48);
      CC_LONG64 v60 = (v58 ^ v59) + __ROR8__(v173.count[0] + v173.count[1], 32);
      CC_LONG64 v61 = v60 ^ __ROR8__(v58 ^ v59, 43);
      CC_LONG64 v62 = v58 + v57;
      CC_LONG64 v63 = v62 ^ __ROR8__(v57, 47);
      CC_LONG64 v64 = (v60 ^ v173.hash[2]) + v63;
      CC_LONG64 v65 = v64 ^ __ROR8__(v63, 51);
      CC_LONG64 v66 = (__ROR8__(v62, 32) ^ 0xFFLL) + v61;
      uint64_t v67 = __ROR8__(v61, 48);
      uint64_t v68 = __ROR8__(v64, 32) + (v66 ^ v67);
      uint64_t v69 = v68 ^ __ROR8__(v66 ^ v67, 43);
      CC_LONG64 v70 = v65 + v66;
      CC_LONG64 v71 = v70 ^ __ROR8__(v65, 47);
      CC_LONG64 v72 = v71 + v68;
      uint64_t v73 = v72 ^ __ROR8__(v71, 51);
      uint64_t v74 = __ROR8__(v70, 32) + v69;
      uint64_t v75 = __ROR8__(v69, 48);
      uint64_t v76 = __ROR8__(v72, 32) + (v74 ^ v75);
      uint64_t v77 = v76 ^ __ROR8__(v74 ^ v75, 43);
      uint64_t v78 = v73 + v74;
      uint64_t v79 = v78 ^ __ROR8__(v73, 47);
      uint64_t v80 = v79 + v76;
      uint64_t v81 = v80 ^ __ROR8__(v79, 51);
      uint64_t v82 = __ROR8__(v78, 32) + v77;
      uint64_t v83 = __ROR8__(v77, 48);
      CC_LONG64 v84 = __ROR8__(v80, 32) + (v82 ^ v83);
      CC_LONG64 v85 = v84 ^ __ROR8__(v82 ^ v83, 43);
      uint64_t v86 = v81 + v82;
      v173.count[0] = v84;
      v173.count[1] = v86 ^ __ROR8__(v81, 47);
      v173.hash[0] = __ROR8__(v86, 32);
      v173.hash[1] = v85;
      CC_LONG64 v87 = v173.count[1] ^ v84 ^ v173.hash[0] ^ v85;
      goto LABEL_105;
    }
    if (*(void *)buf != 2000)
    {
      if (*(void *)buf != 3000) {
        goto LABEL_118;
      }
      if (HIDWORD(v173.count[0])) {
        int v88 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v173.count[1], (uint32x4_t)xmmword_21BEF1640), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v173.count[1], (uint32x4_t)xmmword_21BEF1630)));
      }
      else {
        int v88 = LODWORD(v173.hash[0]) + 374761393;
      }
      unsigned int v100 = LODWORD(v173.count[0]) + v88;
      v101 = &v173.hash[1];
      unint64_t v102 = v173.hash[3] & 0xF;
      if (v102 >= 4)
      {
        do
        {
          int v103 = *(_DWORD *)v101;
          v101 = (CC_LONG64 *)((char *)v101 + 4);
          HIDWORD(v104) = v100 - 1028477379 * v103;
          LODWORD(v104) = HIDWORD(v104);
          unsigned int v100 = 668265263 * (v104 >> 15);
          v102 -= 4;
        }
        while (v102 > 3);
      }
      for (; v102; --v102)
      {
        int v105 = *(unsigned __int8 *)v101;
        v101 = (CC_LONG64 *)((char *)v101 + 1);
        HIDWORD(v106) = v100 + 374761393 * v105;
        LODWORD(v106) = HIDWORD(v106);
        unsigned int v100 = -1640531535 * (v106 >> 21);
      }
      unsigned int v107 = -1028477379 * ((-2048144777 * (v100 ^ (v100 >> 15))) ^ ((-2048144777 * (v100 ^ (v100 >> 15))) >> 13));
      unsigned int v108 = v107 ^ HIWORD(v107);
      goto LABEL_117;
    }
    switch(BYTE3(v173.count[1]))
    {
      case 1u:
        int v91 = LOBYTE(v173.count[1]);
        break;
      case 2u:
        int v91 = LOWORD(v173.count[1]);
        break;
      case 3u:
        int v91 = LOWORD(v173.count[1]) | (BYTE2(v173.count[1]) << 16);
        break;
      default:
        unsigned int v109 = v173.count[0];
        goto LABEL_116;
    }
    unsigned int v109 = (461845907 * ((380141568 * v91) | ((-862048943 * v91) >> 17))) ^ LODWORD(v173.count[0]);
LABEL_116:
    unsigned int v110 = -2048144789 * (HIDWORD(v173.count[0]) ^ v109 ^ ((HIDWORD(v173.count[0]) ^ v109) >> 16));
    unsigned int v108 = (-1028477387 * (v110 ^ (v110 >> 13))) ^ ((-1028477387 * (v110 ^ (v110 >> 13))) >> 16);
    LODWORD(v173.count[0]) = v108;
LABEL_117:
    *(_DWORD *)&v174[8] = v108;
    goto LABEL_118;
  }
  __int16 v23 = [MEMORY[0x263F12178] standardUserDefaults];
  if ([v23 sonicHijack])
  {
    id v24 = [v12 appBundleID];
    int v25 = [v24 isEqualToString:@"com.apple.Sonic"];

    if (v25) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v15[2](v15, 1);
LABEL_167:
}

void __80__MPCAssistantSendCommand__checkForAccount_destination_origin_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      uint64_t v8 = *MEMORY[0x263F54A80];
      uint64_t v17 = *MEMORY[0x263F54A80];
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          if (MEMORY[0x21D49D090](*(void *)(*((void *)&v23 + 1) + 8 * v9)) == 133)
          {
            uint64_t v10 = (void *)MRMediaRemoteCommandInfoCopyOptions();
            id v11 = [v10 objectForKeyedSubscript:v8];
            long long v19 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            id v12 = v11;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v20;
              while (2)
              {
                uint64_t v16 = 0;
                do
                {
                  if (*(void *)v20 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "hasSuffix:", *(void *)(a1 + 32), v17, v18))
                  {
                    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

                    goto LABEL_22;
                  }
                  ++v16;
                }
                while (v14 != v16);
                uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }

            uint64_t v8 = v17;
            uint64_t v7 = v18;
          }
          ++v9;
        }
        while (v9 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_22:
}

- (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEndpoint:(id)a5 toDestination:(id)a6 completion:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__MPCAssistantSendCommand_sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke;
  v14[3] = &unk_2643C27D0;
  id v15 = v12;
  id v13 = v12;
  [(MPCAssistantSendCommand *)self _sendCommand:v10 withOptions:a4 toEndpoint:a5 toDestination:a6 completion:v14];
}

void __87__MPCAssistantSendCommand_sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[MPCAssistantSendCommandResult alloc] initWithCommandResult:v6 error:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 toEndpointDestination:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MRMediaRemoteCopyCommandDescription();
  uint64_t v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.assistant.SendCommand", v14);

  uint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "Command %{public}@ to destination: %{public}@", buf, 0x16u);
  }

  uint64_t v32 = [v11 outputDeviceUIDs];
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v56 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke;
  aBlock[3] = &unk_2643C26E0;
  unsigned int v52 = buf;
  id v31 = v12;
  id v51 = v31;
  uint64_t v17 = _Block_copy(aBlock);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2;
  v41[3] = &unk_2643C2758;
  id v18 = v13;
  id v42 = v18;
  long long v19 = v15;
  v48 = buf;
  unint64_t v43 = v19;
  unint64_t v44 = self;
  int v49 = v8;
  id v20 = v10;
  id v45 = v20;
  id v21 = v11;
  id v46 = v21;
  id v22 = v17;
  id v47 = v22;
  long long v23 = _Block_copy(v41);
  if ([v32 count])
  {
    if ([v21 singleGroup])
    {
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_3;
      v38[3] = &unk_2643C2780;
      id v40 = buf;
      id v39 = v22;
      [(MPCAssistantSendCommand *)self _formGroupAndSendCommand:v8 withOptions:v20 toExternalDestination:v21 completion:v38];
      long long v24 = v39;
    }
    else
    {
      discovery = self->_discovery;
      id v28 = [v21 outputDeviceUIDs];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_4;
      v33[3] = &unk_2643C27A8;
      id v34 = v21;
      int v35 = self;
      id v36 = v22;
      id v37 = v23;
      [(MPCAssistantDiscovery *)discovery discoverRemoteControlEndpointsMatchingUIDs:v28 completion:v33];

      long long v24 = v34;
    }
  }
  else
  {
    long long v25 = [v21 outputGroups];
    BOOL v26 = [v25 count] == 0;

    if (v26)
    {
      if ([v21 origin])
      {
        long long v24 = (void *)[v21 createPlayerPath];
        [(MPCAssistantSendCommand *)self _sendCommand:v8 path:v24 options:v20 queue:v19 completion:v22];
      }
      else
      {
        uint64_t v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)unsigned int v53 = 138543362;
          id v54 = v21;
          _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_ERROR, "Cannot send command: no output devices specified in destination: %{public}@", v53, 0xCu);
        }

        long long v24 = MPCAssistantCreateError(8);
        id v30 = [[MPCAssistantSendCommandResult alloc] initWithReturnStatuses:0 error:v24];
        (*((void (**)(id, MPCAssistantSendCommandResult *))v31 + 2))(v31, v30);
      }
    }
    else
    {
      long long v24 = [v21 outputGroups];
      (*((void (**)(void *, void *))v23 + 2))(v23, v24);
    }
  }

  _Block_object_dispose(buf, 8);
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v8 = [[MPCAssistantSendCommandResult alloc] initWithCommandResult:v6 error:v5];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [(MPCAssistantSendCommandResult *)v8 setDevicesControlled:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v20 = a2;
  id v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Default_Oversize");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v20 count];
    *(_WORD *)&buf[22] = 2114;
    id v51 = (uint64_t (*)(uint64_t, uint64_t))v20;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "Command %{public}@ all %lu endpoints: %{public}@", buf, 0x20u);
  }

  id v5 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v51 = __Block_byref_object_copy__18861;
  unsigned int v52 = __Block_byref_object_dispose__18862;
  id v53 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  unint64_t v44 = __Block_byref_object_copy__18861;
  id v45 = __Block_byref_object_dispose__18862;
  id v46 = 0;
  if ([v20 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v6 = v20;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v7)
    {
      uint64_t v22 = *(void *)v38;
      obuint64_t j = v6;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          dispatch_group_enter(v5);
          id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v47 = 138543362;
            uint64_t v48 = v9;
            _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "To endpoint: %{public}@", v47, 0xCu);
          }

          id v11 = (void *)MRAVEndpointCopyOutputDevices();
          id v12 = *(NSObject **)(a1 + 40);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_7;
          block[3] = &unk_2643C67A0;
          uint64_t v36 = *(void *)(a1 + 80);
          id v13 = v11;
          id v35 = v13;
          dispatch_sync(v12, block);
          uint64_t v14 = *(unsigned int *)(a1 + 88);
          uint64_t v16 = *(void **)(a1 + 48);
          uint64_t v15 = *(void *)(a1 + 56);
          uint64_t v17 = *(void *)(a1 + 64);
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2_9;
          v27[3] = &unk_2643C2708;
          id v31 = &v41;
          id v28 = *(id *)(a1 + 32);
          uint64_t v33 = v9;
          id v29 = *(id *)(a1 + 40);
          uint64_t v32 = buf;
          id v30 = v5;
          [v16 _sendCommand:v14 withOptions:v15 toEndpoint:v9 toDestination:v17 completion:v27];
        }
        id v6 = obj;
        uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v18 = MPCAssistantCreateError(1);
    id v6 = (id)v42[5];
    v42[5] = v18;
  }

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2_11;
  v23[3] = &unk_2643C2730;
  long long v19 = *(NSObject **)(a1 + 40);
  v23[4] = *(void *)(a1 + 48);
  id v24 = *(id *)(a1 + 72);
  long long v25 = buf;
  BOOL v26 = &v41;
  dispatch_group_notify(v5, v19, v23);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);
}

uint64_t __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (![*(id *)(a1 + 32) originatingDeviceControl]
    || [v5 count]
    || ([*(id *)(a1 + 40) _isAnyDeviceControllable:v6] & 1) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v7 = [v6 count];
    uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "Send to originating device: Not remote controllable.", (uint8_t *)&v12, 2u);
      }

      uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      uint64_t v10 = 2;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138543362;
        id v13 = v6;
        uint64_t v10 = 2;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEBUG, "No remote controllable device found among devices: %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "Send to originating device: Unable to discover", (uint8_t *)&v12, 2u);
      }
      uint64_t v10 = 1;
    }

    id v11 = MPCAssistantCreateError(v10);
    [*(id *)(*(void *)(a1 + 40) + 16) stopDiscovery];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    int IsInformational = MRMediaRemoteErrorIsInformational();
    uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    BOOL v9 = v8;
    if (IsInformational)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v10;
        __int16 v28 = 2114;
        uint64_t v29 = v11;
        __int16 v30 = 2114;
        id v31 = v6;
        int v12 = "Sent %{public}@ to %{public}@ informational: %{public}@";
        id v13 = v9;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
        uint32_t v17 = 32;
        goto LABEL_10;
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v18;
      __int16 v28 = 2114;
      uint64_t v29 = v19;
      __int16 v30 = 2114;
      id v31 = v6;
      int v12 = "Sent %{public}@ to %{public}@ error: %{public}@";
      id v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v15;
      __int16 v28 = 2114;
      uint64_t v29 = v16;
      int v12 = "Sent %{public}@ to %{public}@";
      id v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 22;
LABEL_10:
      _os_log_impl(&dword_21BB87000, v13, v14, v12, buf, v17);
    }
  }

  id v20 = *(NSObject **)(a1 + 40);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_10;
  v23[3] = &unk_2643C67A0;
  uint64_t v21 = *(void *)(a1 + 64);
  id v24 = v5;
  uint64_t v25 = v21;
  id v22 = v5;
  dispatch_sync(v20, v23);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2_11(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) stopDiscovery];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v2 + 40))
  {
    id v3 = [*(id *)(a1 + 32) error];

    if (!v3) {
      return;
    }
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  uint64_t v4 = *(void **)(a1 + 32);

  objc_storeStrong((id *)(v2 + 40), v4);
}

- (void)sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 toLocalDestination:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a6;
  id v10 = a4;
  uint64_t v11 = (void *)MRMediaRemoteCopyCommandDescription();
  int v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "Dispatching %{public}@ command to destination: %{public}@", buf, 0x16u);
  }

  id v13 = (void *)[v8 createPlayerPath];
  os_log_type_t v14 = dispatch_get_global_queue(25, 0);
  uint64_t v18 = v11;
  uint64_t v19 = v13;
  id v20 = v9;
  id v15 = v9;
  id v16 = v13;
  id v17 = v11;
  MRMediaRemoteSendCommandToPlayerWithResult();
}

void __92__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toLocalDestination_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [[MPCAssistantSendCommandResult alloc] initWithCommandResult:v3 error:0];
  id v5 = [v3 error];

  if (v5)
  {
    id v6 = [v3 error];
    int IsInformational = MRMediaRemoteErrorIsInformational();

    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    id v9 = v8;
    if (IsInformational)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = a1[4];
        uint64_t v11 = a1[5];
        int v12 = [v3 error];
        int v20 = 138543874;
        uint64_t v21 = v10;
        __int16 v22 = 2114;
        uint64_t v23 = v11;
        __int16 v24 = 2114;
        uint64_t v25 = v12;
        id v13 = "Sent %{public}@ to %{public}@ informational: %{public}@";
        os_log_type_t v14 = v9;
        os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
LABEL_9:
        _os_log_impl(&dword_21BB87000, v14, v15, v13, (uint8_t *)&v20, 0x20u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = a1[4];
      uint64_t v19 = a1[5];
      int v12 = [v3 error];
      int v20 = 138543874;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      uint64_t v23 = v19;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      id v13 = "Sent %{public}@ to %{public}@ error: %{public}@";
      os_log_type_t v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = a1[4];
      uint64_t v17 = a1[5];
      int v20 = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEBUG, "Sent %{public}@ to %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (MPCAssistantSendCommand)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPCAssistantSendCommand;
  uint64_t v2 = [(MPCAssistantSendCommand *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MPCAssistantConnection);
    connection = v2->_connection;
    v2->_connection = v3;

    id v5 = objc_alloc_init(MPCAssistantDiscovery);
    discovery = v2->_discovery;
    v2->_discovery = v5;
  }
  return v2;
}

@end