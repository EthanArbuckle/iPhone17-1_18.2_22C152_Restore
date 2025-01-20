@interface AXRemoteDevice
- (AXRemoteDevice)initWithDevice:(id)a3;
- (AXRemoteDeviceConnectionDelegate)connectionDelegate;
- (BOOL)connected;
- (NSArray)deviceRemoteActions;
- (NSMutableDictionary)deviceGestureCustomizations;
- (NSString)displayName;
- (NSString)identifier;
- (RPCompanionLinkClient)deviceLinkClient;
- (RPCompanionLinkDevice)device;
- (id)_deviceName;
- (id)customizedRemoteActionForHandGestureEventUsage:(int64_t)a3;
- (id)remoteActionsForPreferredContextType:(int64_t)a3;
- (int64_t)contextType;
- (int64_t)deviceType;
- (void)_setRemoteAction:(id)a3 forHandGestureEventUsage:(int64_t)a4;
- (void)connectIfNecessary:(id)a3;
- (void)disconnect;
- (void)sendPayload:(id)a3 withEventID:(id)a4;
- (void)sendPayload:(id)a3 withEventID:(id)a4 withTimeout:(double)a5 completion:(id)a6;
- (void)setConnected:(BOOL)a3;
- (void)setConnectionDelegate:(id)a3;
- (void)setContextType:(int64_t)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceGestureCustomizations:(id)a3;
- (void)setDeviceLinkClient:(id)a3;
- (void)setDeviceRemoteActions:(id)a3;
- (void)setDeviceType:(int64_t)a3;
@end

@implementation AXRemoteDevice

- (AXRemoteDevice)initWithDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXRemoteDevice;
  v5 = [(AXRemoteDevice *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(AXRemoteDevice *)v5 setDevice:v4];
    v7 = objc_opt_new();
    [(AXRemoteDevice *)v6 setDeviceGestureCustomizations:v7];
  }
  return v6;
}

- (NSString)displayName
{
  v2 = [(AXRemoteDevice *)self device];
  v3 = [v2 name];
  id v4 = v3;
  if (!v3) {
    v3 = @"<unknown>";
  }
  v5 = v3;

  return v5;
}

- (NSString)identifier
{
  v2 = [(AXRemoteDevice *)self device];
  v3 = [v2 effectiveIdentifier];

  return (NSString *)v3;
}

- (id)remoteActionsForPreferredContextType:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(AXRemoteDevice *)self deviceRemoteActions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    id v8 = (id)MEMORY[0x263EFFA68];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 preferredContextType] == a3)
        {
          v12 = [v10 remoteActions];

          goto LABEL_15;
        }
        if (![v10 preferredContextType])
        {
          uint64_t v11 = [v10 remoteActions];

          id v8 = (id)v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x263EFFA68];
  }

  id v8 = v8;
  v12 = v8;
LABEL_15:

  return v12;
}

- (id)customizedRemoteActionForHandGestureEventUsage:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2) {
    v3 = @"clench";
  }
  else {
    v3 = off_2646E8648[a3 - 2];
  }
  id v4 = [(AXRemoteDevice *)self deviceGestureCustomizations];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  uint64_t v6 = @"None";
  if (v5) {
    uint64_t v6 = v5;
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)_setRemoteAction:(id)a3 forHandGestureEventUsage:(int64_t)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((unint64_t)(a4 - 2) > 2) {
    uint64_t v7 = @"clench";
  }
  else {
    uint64_t v7 = off_2646E8648[a4 - 2];
  }
  id v8 = [(AXRemoteDevice *)self deviceGestureCustomizations];
  objc_super v9 = [v8 objectForKeyedSubscript:v7];
  char v10 = [v9 isEqualToString:v6];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(AXRemoteDevice *)self deviceGestureCustomizations];
    [v11 setObject:v6 forKeyedSubscript:v7];

    long long v14 = @"HandGestureCustomizedActions";
    v12 = [(AXRemoteDevice *)self deviceGestureCustomizations];
    v15[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [(AXRemoteDevice *)self sendPayload:v13 withEventID:@"com.apple.AXRemoteServices.DefaultEventID"];
  }
}

- (void)connectIfNecessary:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if ([(AXRemoteDevice *)self connected])
  {
    v4[2](v4, 1);
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263F62B70]);
    [v5 setServiceType:@"com.apple.accessibility.axremoted.rapportWake"];
    id v6 = [(AXRemoteDevice *)self device];
    [v5 setDestinationDevice:v6];

    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __37__AXRemoteDevice_connectIfNecessary___block_invoke;
    v14[3] = &unk_2646E8368;
    objc_copyWeak(&v15, &location);
    [v5 setDeviceLostHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __37__AXRemoteDevice_connectIfNecessary___block_invoke_2;
    v12[3] = &unk_2646E8540;
    objc_copyWeak(&v13, &location);
    [v5 setDisconnectHandler:v12];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__AXRemoteDevice_connectIfNecessary___block_invoke_3;
    v8[3] = &unk_2646E8590;
    objc_copyWeak(&v11, &location);
    char v10 = v4;
    v8[4] = self;
    id v7 = v5;
    id v9 = v7;
    [v7 activateWithCompletion:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __37__AXRemoteDevice_connectIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained connected])
    {
      id v5 = [v10 effectiveIdentifier];
      id v6 = [v4 device];
      id v7 = [v6 effectiveIdentifier];
      int v8 = [v5 isEqualToString:v7];

      if (v8)
      {
        id v9 = [v4 connectionDelegate];
        [v9 remoteDeviceDidUnexpectedlyDisconnect:v4];
      }
    }
  }
}

uint64_t __37__AXRemoteDevice_connectIfNecessary___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if ([WeakRetained connected])
    {
      v2 = [v4 connectionDelegate];
      [v2 remoteDeviceDidUnexpectedlyDisconnect:v4];
    }
  }

  return MEMORY[0x270F9A758]();
}

void __37__AXRemoteDevice_connectIfNecessary___block_invoke_3(id *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ax_remote_connection_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    id v6 = [WeakRetained device];
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_2249E0000, v4, OS_LOG_TYPE_INFO, "Connected to device: %@ with error: %@", buf, 0x16u);
  }
  if (v3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    uint64_t v19 = @"requestsVoiceOverEnabled";
    id v7 = [NSNumber numberWithUnsignedChar:_AXSVoiceOverTouchEnabled()];
    v20 = v7;
    int v8 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

    v18[0] = MEMORY[0x263EFFA88];
    v17[0] = @"isConnecting";
    v17[1] = @"connectingDeviceName";
    id v9 = [a1[4] _deviceName];
    v18[1] = v9;
    v17[2] = @"connectingDeviceOptions";
    v18[2] = v8;
    id v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    id v11 = a1[5];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __37__AXRemoteDevice_connectIfNecessary___block_invoke_6;
    v12[3] = &unk_2646E8568;
    objc_copyWeak(&v16, a1 + 7);
    id v13 = 0;
    id v15 = a1[6];
    id v14 = a1[5];
    [v11 sendRequestID:@"com.apple.AXRemoteServices.ConnectionSetup" request:v10 options:0 responseHandler:v12];

    objc_destroyWeak(&v16);
  }
}

void __37__AXRemoteDevice_connectIfNecessary___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = ax_remote_connection_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v9 = [WeakRetained device];
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v49 = v9;
    __int16 v50 = 2112;
    id v51 = v6;
    __int16 v52 = 2112;
    uint64_t v53 = v10;
    _os_log_impl(&dword_2249E0000, v7, OS_LOG_TYPE_INFO, "Requested actions from device: %@, response: %@, error: %@", buf, 0x20u);
  }
  id v11 = [v6 objectForKeyedSubscript:@"remoteActions"];
  v12 = [v6 objectForKeyedSubscript:@"deviceType"];
  id v13 = [v6 objectForKeyedSubscript:@"contextType"];
  id v14 = [v6 objectForKeyedSubscript:@"HandGestureCustomizedActions"];
  if (!a4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v36 = v14;
    v37 = v13;
    v38 = v12;
    uint64_t v40 = a1;
    id v41 = v6;
    v42 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v39 = v11;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "objectForKeyedSubscript:", @"preferredContextType", v36);
          v22 = [v20 objectForKeyedSubscript:@"actionsList"];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            unint64_t v23 = [v21 integerValue];
            id v24 = AXRLocalizedSectionTitleForPreferredContextType(v23);
            uint64_t v25 = [[AXRDeviceRemoteActionSectionContainer alloc] initWithLocalizedTitle:v24 preferredContextType:v23 remoteActions:v22];
            [v42 addObject:v25];
          }
          else
          {
            id v24 = ax_remote_connection_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v20;
              _os_log_fault_impl(&dword_2249E0000, v24, OS_LOG_TYPE_FAULT, "unexpected payload data types: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v17);
    }

    v12 = v38;
    uint64_t v26 = [v38 integerValue];
    id v27 = objc_loadWeakRetained((id *)(v40 + 56));
    [v27 setDeviceType:v26];

    id v13 = v37;
    uint64_t v28 = [v37 integerValue];
    id v29 = objc_loadWeakRetained((id *)(v40 + 56));
    [v29 setContextType:v28];

    id v30 = objc_loadWeakRetained((id *)(v40 + 56));
    [v30 setDeviceRemoteActions:v42];

    id v31 = objc_loadWeakRetained((id *)(v40 + 56));
    v32 = [v31 deviceGestureCustomizations];
    id v14 = v36;
    [v32 addEntriesFromDictionary:v36];

    id v33 = objc_loadWeakRetained((id *)(v40 + 56));
    [v33 setConnected:1];

    uint64_t v34 = *(void *)(v40 + 40);
    id v35 = objc_loadWeakRetained((id *)(v40 + 56));
    [v35 setDeviceLinkClient:v34];

    (*(void (**)(void))(*(void *)(v40 + 48) + 16))();
    id v6 = v41;
    id v11 = v39;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)_deviceName
{
  v2 = (void *)MGGetStringAnswer();
  if (!v2) {
    v2 = (void *)MGGetStringAnswer();
  }

  return v2;
}

- (void)disconnect
{
  v10[2] = *MEMORY[0x263EF8340];
  v10[0] = MEMORY[0x263EFFA80];
  v9[0] = @"isConnecting";
  v9[1] = @"connectingDeviceName";
  id v3 = [(AXRemoteDevice *)self _deviceName];
  v10[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  objc_initWeak(&location, self);
  id v5 = [(AXRemoteDevice *)self deviceLinkClient];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__AXRemoteDevice_disconnect__block_invoke;
  v6[3] = &unk_2646E85B8;
  objc_copyWeak(&v7, &location);
  [v5 sendRequestID:@"com.apple.AXRemoteServices.ConnectionSetup" request:v4 options:0 responseHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __28__AXRemoteDevice_disconnect__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained deviceLinkClient];
  [v3 invalidate];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setDeviceLinkClient:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setConnected:0];

  id v6 = objc_loadWeakRetained(v1);
  [v6 setContextType:0];
}

- (void)sendPayload:(id)a3 withEventID:(id)a4
{
}

- (void)sendPayload:(id)a3 withEventID:(id)a4 withTimeout:(double)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = ax_remote_connection_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2048;
    double v27 = a5;
    _os_log_impl(&dword_2249E0000, v13, OS_LOG_TYPE_INFO, "sending payload: %@, eventID: %@, timeout %.2fs", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke;
  void v17[3] = &unk_2646E8628;
  id v14 = v12;
  id v20 = v14;
  v21[1] = *(id *)&a5;
  objc_copyWeak(v21, (id *)buf);
  id v15 = v11;
  id v18 = v15;
  id v16 = v10;
  id v19 = v16;
  [(AXRemoteDevice *)self connectIfNecessary:v17];

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
}

void __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke(uint64_t a1, char a2)
{
  v18[5] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = MEMORY[0x263EFFA88];
    uint64_t v4 = *MEMORY[0x263F62C48];
    v17[0] = *MEMORY[0x263F62C40];
    v17[1] = v4;
    v18[0] = MEMORY[0x263EFFA88];
    v18[1] = MEMORY[0x263EFFA88];
    v17[2] = *MEMORY[0x263F62CA0];
    id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    uint64_t v6 = *MEMORY[0x263F62C20];
    v18[2] = v5;
    void v18[3] = v3;
    uint64_t v7 = *MEMORY[0x263F62C28];
    void v17[3] = v6;
    void v17[4] = v7;
    v18[4] = &unk_26D7C5F58;
    int v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v10 = [WeakRetained deviceLinkClient];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *MEMORY[0x263F62C08];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke_20;
    v15[3] = &unk_2646E8600;
    id v16 = *(id *)(a1 + 48);
    [v10 sendEventID:v11 event:v12 destinationID:v13 options:v8 completion:v15];
  }
  else
  {
    id v14 = ax_remote_connection_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke_cold_1(v14);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = ax_remote_connection_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_2249E0000, v4, OS_LOG_TYPE_INFO, "event sent with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3 == 0);
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int64_t)a3
{
  self->_contextType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (NSArray)deviceRemoteActions
{
  return self->_deviceRemoteActions;
}

- (void)setDeviceRemoteActions:(id)a3
{
}

- (AXRemoteDeviceConnectionDelegate)connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);

  return (AXRemoteDeviceConnectionDelegate *)WeakRetained;
}

- (void)setConnectionDelegate:(id)a3
{
}

- (NSMutableDictionary)deviceGestureCustomizations
{
  return self->_deviceGestureCustomizations;
}

- (void)setDeviceGestureCustomizations:(id)a3
{
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (RPCompanionLinkClient)deviceLinkClient
{
  return self->_deviceLinkClient;
}

- (void)setDeviceLinkClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLinkClient, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceGestureCustomizations, 0);
  objc_destroyWeak((id *)&self->_connectionDelegate);

  objc_storeStrong((id *)&self->_deviceRemoteActions, 0);
}

void __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2249E0000, log, OS_LOG_TYPE_ERROR, "failed to send payload (not connected)", v1, 2u);
}

@end