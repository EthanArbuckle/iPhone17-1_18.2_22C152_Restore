@interface DDUIRapportPairingTransport
@end

@implementation DDUIRapportPairingTransport

void __66___DDUIRapportPairingTransport_setAvailableDevicesChangedHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = WeakRetained;
    v4 = [WeakRetained availableDevices];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    id WeakRetained = v5;
  }
}

void __66___DDUIRapportPairingTransport_setAvailableDevicesChangedHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = WeakRetained;
    v4 = [WeakRetained availableDevices];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    id WeakRetained = v5;
  }
}

void __70___DDUIRapportPairingTransport_activateForDeviceTypes_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport activated {self: %p, inError: %@}", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74___DDUIRapportPairingTransport__setupListeningForResponseMessagesIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = [v6 objectForKeyedSubscript:@"info"];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"sesID"];
    v11 = [v6 objectForKeyedSubscript:@"msgID"];
    v12 = [WeakRetained[5] objectForKey:v10];
    v13 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134218498;
        v16 = WeakRetained;
        __int16 v17 = 2112;
        v18 = v11;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_1CFC71000, v14, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming ResponderMessage w/ session {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v15, 0x20u);
      }

      (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
      [v12 handleIncomingMessage:v9 withMessageID:v11];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 134218498;
        v16 = WeakRetained;
        __int16 v17 = 2112;
        v18 = v11;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_error_impl(&dword_1CFC71000, v14, OS_LOG_TYPE_ERROR, "_DDUIRapportPairingTransport - incoming ResponderMessage w/o session {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v15, 0x20u);
      }

      (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
    }
  }
}

void __69___DDUIRapportPairingTransport_setupListeningForSessionsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11 = [v7 objectForKeyedSubscript:@"info"];
    v12 = [v7 objectForKeyedSubscript:@"sesID"];
    v13 = [v7 objectForKeyedSubscript:@"msgID"];
    if (v12)
    {
      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
      v14 = [WeakRetained[5] objectForKey:v12];
      int v15 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          uint64_t v17 = *(void *)(a1 + 32);
          int v23 = 134218498;
          uint64_t v24 = v17;
          __int16 v25 = 2112;
          v26 = v13;
          __int16 v27 = 2112;
          id v28 = v7;
          _os_log_impl(&dword_1CFC71000, v15, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming InitiatorMessage w/ session {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v23, 0x20u);
        }

        v18 = [(_DDUIRapportIncomingTransportSession *)v14 messageHandler];

        if (v18)
        {
          __int16 v19 = [(_DDUIRapportIncomingTransportSession *)v14 messageHandler];
          ((void (**)(void, void *))v19)[2](v19, v11);
        }
      }
      else
      {
        if (v16)
        {
          uint64_t v22 = *(void *)(a1 + 32);
          int v23 = 134218498;
          uint64_t v24 = v22;
          __int16 v25 = 2112;
          v26 = v13;
          __int16 v27 = 2112;
          id v28 = v7;
          _os_log_impl(&dword_1CFC71000, v15, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming InitiatorMessage w/o session {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v23, 0x20u);
        }

        v14 = [[_DDUIRapportIncomingTransportSession alloc] initWithOptions:v8];
        [(_DDUIRapportIncomingTransportSession *)v14 setSessionID:v12];
        [(_DDUIRapportIncomingTransportSession *)v14 setClient:WeakRetained[3]];
        [(_DDUIRapportIncomingTransportSession *)v14 setSessionType:0];
        [WeakRetained[5] setObject:v14 forKey:v12];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      id v20 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        int v23 = 134218498;
        uint64_t v24 = v21;
        __int16 v25 = 2112;
        v26 = v13;
        __int16 v27 = 2112;
        id v28 = v7;
        _os_log_impl(&dword_1CFC71000, v20, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming InitiatorMessage missing sessionID, ignoring {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v23, 0x20u);
      }

      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    }
  }
}

void __69___DDUIRapportPairingTransport_setupListeningForSessionsWithHandler___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:@"sesID"];
  id v8 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 134218498;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    v14 = v7;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1CFC71000, v8, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming continuity camera InitiatorMessage w/o session {self: %p, sessionID: %@, inRequest: %@}", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v10 = [[_DDUIRapportIncomingTransportSession alloc] initWithOptions:v6];
  [(_DDUIRapportIncomingTransportSession *)v10 setSessionID:v7];
  [(_DDUIRapportIncomingTransportSession *)v10 setClient:*(void *)(*(void *)(a1 + 32) + 24)];
  [(_DDUIRapportIncomingTransportSession *)v10 setSessionType:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __91___DDUIRapportPairingTransport_shouldReauthenticateDevice_forServiceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91___DDUIRapportPairingTransport_shouldReauthenticateDevice_forServiceIdentifier_completion___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95___DDUIRapportPairingTransport_createListenerMappingForDevice_forServiceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __95___DDUIRapportPairingTransport_createListenerMappingForDevice_forServiceIdentifier_completion___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91___DDUIRapportPairingTransport_shouldReauthenticateDevice_forServiceIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFC71000, a2, OS_LOG_TYPE_ERROR, "Could not query listener mapping with error %@", (uint8_t *)&v2, 0xCu);
}

void __95___DDUIRapportPairingTransport_createListenerMappingForDevice_forServiceIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFC71000, a2, OS_LOG_TYPE_ERROR, "Could not create device listener mapping with error %@", (uint8_t *)&v2, 0xCu);
}

@end