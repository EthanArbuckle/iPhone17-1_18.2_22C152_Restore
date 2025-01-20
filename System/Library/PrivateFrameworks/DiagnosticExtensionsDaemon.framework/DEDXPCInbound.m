@interface DEDXPCInbound
- (DEDXPCInbound)initWithDelegate:(id)a3 senderPid:(id)a4;
- (DEDXPCInboundDelegate)delegate;
- (NSNumber)senderPid;
- (OS_os_log)log;
- (void)setDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)setSenderPid:(id)a3;
- (void)xpc_addData:(id)a3 withFilename:(id)a4 forSession:(id)a5;
- (void)xpc_adoptFiles:(id)a3 forSession:(id)a4;
- (void)xpc_cancelNotifySession:(id)a3;
- (void)xpc_cancelSession:(id)a3;
- (void)xpc_commitSession:(id)a3;
- (void)xpc_compressionProgress:(unint64_t)a3 total:(unint64_t)a4 session:(id)a5;
- (void)xpc_deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4;
- (void)xpc_didAdoptFilesWithError:(id)a3 forSession:(id)a4;
- (void)xpc_didCancelSession:(id)a3;
- (void)xpc_didCommitSession:(id)a3;
- (void)xpc_didDiscoverDevices:(id)a3;
- (void)xpc_didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5;
- (void)xpc_didLoadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5;
- (void)xpc_didStartBugSessionWithInfo:(id)a3;
- (void)xpc_discoverAllAvailableDevices;
- (void)xpc_finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5;
- (void)xpc_forceRemoveNotificationOfType:(int64_t)a3 identifier:(id)a4 hostIdentifier:(id)a5;
- (void)xpc_getSessionStateWithSession:(id)a3;
- (void)xpc_getSessionStatusWithSession:(id)a3;
- (void)xpc_gotDeviceUpdate:(id)a3;
- (void)xpc_hasActiveSession:(id)a3;
- (void)xpc_hasActiveSessionReply:(id)a3 isActive:(BOOL)a4;
- (void)xpc_hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5;
- (void)xpc_hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6;
- (void)xpc_listAvailableExtensionsForSession:(id)a3;
- (void)xpc_listClientXPCConnections;
- (void)xpc_listClientXPCConnectionsReply:(id)a3;
- (void)xpc_loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5;
- (void)xpc_notifySession:(id)a3;
- (void)xpc_ping;
- (void)xpc_pingSession:(id)a3;
- (void)xpc_pong;
- (void)xpc_pongSession:(id)a3;
- (void)xpc_promptPINForDevice:(id)a3;
- (void)xpc_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6;
- (void)xpc_startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6;
- (void)xpc_startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5;
- (void)xpc_startPairSetupForDevice:(id)a3;
- (void)xpc_stopDeviceDiscovery;
- (void)xpc_successPINForDevice:(id)a3;
- (void)xpc_syncSessionStatusWithSession:(id)a3;
- (void)xpc_terminateExtension:(id)a3 info:(id)a4 session:(id)a5;
- (void)xpc_tryPIN:(id)a3 forDevice:(id)a4;
- (void)xpc_uploadProgress:(unint64_t)a3 total:(int64_t)a4 session:(id)a5;
@end

@implementation DEDXPCInbound

- (DEDXPCInbound)initWithDelegate:(id)a3 senderPid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DEDXPCInbound;
  v8 = [(DEDXPCInbound *)&v13 init];
  if (v8)
  {
    v9 = +[DEDConfiguration sharedInstance];
    os_log_t v10 = os_log_create((const char *)[v9 loggingSubsystem], "xpc-inbound");
    log = v8->_log;
    v8->_log = (OS_os_log *)v10;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_senderPid, a4);
  }

  return v8;
}

- (void)xpc_ping
{
  id v3 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v3, "xpcInbound_ping:", self);
}

- (void)xpc_pong
{
  id v2 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v2, "xpcInbound_pong");
}

- (void)xpc_discoverAllAvailableDevices
{
  id v3 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v3, "xpcInbound_discoverAllAvailableDevices:", self);
}

- (void)xpc_stopDeviceDiscovery
{
  id v3 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v3, "xpcInbound_stopDeviceDiscovery:", self);
}

- (void)xpc_didDiscoverDevices:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) setTransport:2];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  v9 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v9, "xpcInbound_didDiscoverDevices:", v4);
}

- (void)xpc_gotDeviceUpdate:(id)a3
{
  id v4 = a3;
  [v4 setTransport:2];
  id v5 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v5, "xpcInbound_gotDeviceUpdate:", v4);
}

- (void)xpc_startPairSetupForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v5, "xpcInbound_startPairSetupForDevice:fromInbound:", v4, self);
}

- (void)xpc_promptPINForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v5, "xpcInbound_promptPINForDevice:", v4);
}

- (void)xpc_tryPIN:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v8, "xpcInbound_tryPIN:forDevice:fromInbound:", v7, v6, self);
}

- (void)xpc_successPINForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v5, "xpcInbound_successPINForDevice:", v4);
}

- (void)xpc_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [v11 setTransport:2];
  [v11 setAddress:@"0"];
  id v14 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v14, "xpcInbound_startBugSessionWithIdentifier:configuration:caller:target:fromInbound:", v13, v12, v11, v10, self);
}

- (void)xpc_didStartBugSessionWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = DEDSessionStartLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "(DEDXPCInbound) didStartBugSessionWithInfo", v9, 2u);
  }

  id v6 = [(DEDXPCInbound *)self delegate];

  if (!v6)
  {
    id v7 = DEDSessionStartLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DEDXPCInbound xpc_didStartBugSessionWithInfo:]();
    }
  }
  id v8 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v8, "xpcInbound_didStartBugSessionWithInfo:", v4);
}

- (void)xpc_hasActiveSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v5, "xpcInbound_hasActiveSession:fromInbound:", v4, self);
}

- (void)xpc_hasActiveSessionReply:(id)a3 isActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v7, "xpcInbound_hasActiveSessionReply:isActive:", v6, v4);
}

- (void)xpc_didCancelSession:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(DEDXPCInbound *)self delegate];

  if (v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    objc_msgSend(v5, "xpcInbound_didAbortSessionWithID:", v6);
  }
}

- (void)xpc_listClientXPCConnections
{
  id v3 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v3, "xpc_listClientXPCConnectionsFromInbound:", self);
}

- (void)xpc_listClientXPCConnectionsReply:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v5, "xpcInbound_listClientXPCConnectionsReply:", v4);
}

- (void)xpc_forceRemoveNotificationOfType:(int64_t)a3 identifier:(id)a4 hostIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(DEDXPCInbound *)self delegate];
  objc_msgSend(v10, "xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:", a3, v9, v8);
}

- (void)xpc_pingSession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);

    [v6 pingWithCallback:0];
  }
}

- (void)xpc_pongSession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v7 && v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    [v6 pong];
  }
}

- (void)xpc_listAvailableExtensionsForSession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v7 && v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    [v6 listDiagnosticExtensionsWithCompletion:0];
  }
}

- (void)xpc_deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDXPCInbound *)self delegate];

  if (v8)
  {
    id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = +[DEDExtension extensionWithDictionary:](DEDExtension, "extensionWithDictionary:", *(void *)(*((void *)&v19 + 1) + 8 * v14), (void)v19);
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    v16 = (void *)[v9 copy];
    v17 = [(DEDXPCInbound *)self delegate];
    v18 = objc_msgSend(v17, "xpcInbound_sessionForIdentifier:", v7);
    [v18 supportsDiagnostics:v16];
  }
}

- (void)xpc_startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(DEDXPCInbound *)self delegate];

  if (v10)
  {
    uint64_t v11 = [[DEDExtensionIdentifier alloc] initWithString:v17];
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = [(DEDExtensionIdentifier *)v11 extensionIdentifier];

      id v17 = (id)v13;
    }
    uint64_t v14 = [(DEDXPCInbound *)self delegate];
    uint64_t v15 = objc_msgSend(v14, "xpcInbound_sessionForIdentifier:", v9);
    id v16 = (id)[v15 startDiagnosticExtensionWithIdentifier:v17 parameters:v8 completion:0];
  }
}

- (void)xpc_startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(DEDXPCInbound *)self delegate];

  if (v13)
  {
    uint64_t v14 = [[DEDExtensionIdentifier alloc] initWithString:v20];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = [(DEDExtensionIdentifier *)v14 extensionIdentifier];

      id v20 = (id)v16;
    }
    id v17 = [(DEDXPCInbound *)self delegate];
    v18 = objc_msgSend(v17, "xpcInbound_sessionForIdentifier:", v12);
    id v19 = (id)[v18 startDiagnosticExtensionWithIdentifier:v20 parameters:v10 deferRunUntil:v11 completion:0];
  }
}

- (void)xpc_finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(DEDXPCInbound *)self delegate];

  if (v10)
  {
    id v11 = [(DEDXPCInbound *)self delegate];
    id v12 = objc_msgSend(v11, "xpcInbound_sessionForIdentifier:", v9);
    uint64_t v13 = +[DEDAttachmentGroup groupWithDictionary:v8];
    [v12 finishedDiagnosticWithIdentifier:v14 result:v13];
  }
}

- (void)xpc_terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DEDXPCInbound *)self delegate];

  if (v11)
  {
    id v12 = [(DEDXPCInbound *)self delegate];
    uint64_t v13 = objc_msgSend(v12, "xpcInbound_sessionForIdentifier:", v10);

    if (v13)
    {
      [v13 terminateExtension:v8 withInfo:v9];
    }
    else
    {
      id v14 = [(DEDXPCInbound *)self log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[DEDXPCInbound xpc_terminateExtension:info:session:]((uint64_t)v8, v14);
      }
    }
  }
  else
  {
    uint64_t v13 = [(DEDXPCInbound *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[DEDXPCInbound xpc_terminateExtension:info:session:]();
    }
  }
}

- (void)xpc_getSessionStateWithSession:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DEDXPCInbound *)self delegate];

  if (v5)
  {
    id v6 = [(DEDXPCInbound *)self delegate];
    id v7 = objc_msgSend(v6, "xpcInbound_sessionForIdentifier:", v4);

    if (v7)
    {
      [v7 getStateWithCompletion:0];
    }
    else
    {
      id v8 = [(DEDXPCInbound *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v4;
        _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "no session found for identifier [%{public}@]. Cannot get state.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    id v7 = [(DEDXPCInbound *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DEDXPCInbound xpc_getSessionStateWithSession:]();
    }
  }
}

- (void)xpc_didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(DEDXPCInbound *)self delegate];

  if (v10)
  {
    uint64_t v11 = [(DEDXPCInbound *)self delegate];
    id v12 = objc_msgSend(v11, "xpcInbound_sessionForIdentifier:", v9);

    if (v12)
    {
      [v12 didGetState:a3 info:v8];
    }
    else
    {
      uint64_t v13 = [(DEDXPCInbound *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_21FE04000, v13, OS_LOG_TYPE_DEFAULT, "no session found for identifier [%{public}@]. Cannot reply with state", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    id v12 = [(DEDXPCInbound *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DEDXPCInbound xpc_didGetState:info:sessionID:]();
    }
  }
}

- (void)xpc_getSessionStatusWithSession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v7 && v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    [v6 getSessionStatusWithCompletion:0];
  }
}

- (void)xpc_syncSessionStatusWithSession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v7 && v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    [v6 synchronizeSessionStatusWithCompletion:0];
  }
}

- (void)xpc_hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(DEDXPCInbound *)self delegate];

  if (v9 && v10)
  {
    uint64_t v11 = objc_msgSend(v8, "ded_mapWithBlock:", &__block_literal_global_34);
    id v12 = objc_msgSend(v15, "ded_mapWithBlock:", &__block_literal_global_20);
    uint64_t v13 = [(DEDXPCInbound *)self delegate];
    int v14 = objc_msgSend(v13, "xpcInbound_sessionForIdentifier:", v9);
    [v14 hasCollected:v12 isCollecting:v11];
  }
}

DEDExtension *__57__DEDXPCInbound_xpc_hasCollected_isCollecting_inSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

DEDAttachmentGroup *__57__DEDXPCInbound_xpc_hasCollected_isCollecting_inSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:a2];
}

- (void)xpc_hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(DEDXPCInbound *)self delegate];

  if (v12 && v13)
  {
    int v14 = objc_msgSend(v10, "ded_mapWithBlock:", &__block_literal_global_22_0);
    id v15 = objc_msgSend(v19, "ded_mapWithBlock:", &__block_literal_global_24);
    uint64_t v16 = objc_msgSend(v11, "ded_mapWithBlock:", &__block_literal_global_26);
    id v17 = [(DEDXPCInbound *)self delegate];
    v18 = objc_msgSend(v17, "xpcInbound_sessionForIdentifier:", v12);
    [v18 hasCollected:v15 isCollecting:v14 identifiers:v16];
  }
}

DEDExtension *__73__DEDXPCInbound_xpc_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

DEDAttachmentGroup *__73__DEDXPCInbound_xpc_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:a2];
}

DEDExtensionIdentifier *__73__DEDXPCInbound_xpc_hasCollected_isCollecting_withIdentifiers_inSession___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[DEDExtensionIdentifier alloc] initWithString:v2];

  return v3;
}

- (void)xpc_adoptFiles:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDXPCInbound *)self delegate];

  if (v8)
  {
    id v9 = [(DEDXPCInbound *)self delegate];
    id v10 = [v9 xpcInbound_sessionForIdentifier:v7];
    [v10 adoptFiles:v6 withCompletion:0];
  }
  else
  {
    id v9 = [(DEDXPCInbound *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DEDXPCInbound xpc_adoptFiles:forSession:]();
    }
  }
}

- (void)xpc_didAdoptFilesWithError:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDXPCInbound *)self delegate];

  if (v8)
  {
    id v9 = [(DEDXPCInbound *)self delegate];
    id v10 = [v9 xpcInbound_sessionForIdentifier:v7];
    [v10 didAdoptFilesWithError:v6];
  }
  else
  {
    id v9 = [(DEDXPCInbound *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DEDXPCInbound xpc_didAdoptFilesWithError:forSession:]();
    }
  }
}

- (void)xpc_uploadProgress:(unint64_t)a3 total:(int64_t)a4 session:(id)a5
{
  id v8 = a5;
  id v10 = [(DEDXPCInbound *)self delegate];
  id v9 = objc_msgSend(v10, "xpcInbound_sessionForIdentifier:", v8);

  [v9 uploadProgress:a3 total:a4];
}

- (void)xpc_compressionProgress:(unint64_t)a3 total:(unint64_t)a4 session:(id)a5
{
  id v8 = a5;
  id v10 = [(DEDXPCInbound *)self delegate];
  id v9 = objc_msgSend(v10, "xpcInbound_sessionForIdentifier:", v8);

  [v9 compressionProgress:a3 total:a4];
}

- (void)xpc_commitSession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v7 && v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    [v6 commit];
  }
}

- (void)xpc_didCommitSession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v7 && v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    [v6 didCommit];
  }
}

- (void)xpc_cancelSession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v7 && v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    [v6 cancel];
  }
}

- (void)xpc_notifySession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    [v6 scheduleNotification];
  }
}

- (void)xpc_cancelNotifySession:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDXPCInbound *)self delegate];

  if (v4)
  {
    id v5 = [(DEDXPCInbound *)self delegate];
    id v6 = objc_msgSend(v5, "xpcInbound_sessionForIdentifier:", v7);
    [v6 clearNotification];
  }
}

- (void)xpc_addData:(id)a3 withFilename:(id)a4 forSession:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DEDXPCInbound *)self delegate];

  if (v11)
  {
    id v12 = [(DEDXPCInbound *)self delegate];
    uint64_t v13 = objc_msgSend(v12, "xpcInbound_sessionForIdentifier:", v10);

    if (v13)
    {
      [v13 addData:v8 withFilename:v9];
    }
    else
    {
      int v14 = [(DEDXPCInbound *)self log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v10;
        _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_DEFAULT, "no session found for identifier [%{public}@]. Cannot send data.", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v13 = [(DEDXPCInbound *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[DEDXPCInbound xpc_addData:withFilename:forSession:]();
    }
  }
}

- (void)xpc_loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  objc_msgSend(a3, "ded_flatMapWithBlock:", &__block_literal_global_29);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [(DEDXPCInbound *)self delegate];
  id v11 = objc_msgSend(v10, "xpcInbound_sessionForIdentifier:", v8);

  [v11 loadTextDataForExtensions:v12 localization:v9 completion:0];
}

DEDExtension *__70__DEDXPCInbound_xpc_loadTextDataForExtensions_localization_sessionID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

- (void)xpc_didLoadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  objc_msgSend(a3, "ded_flatMapWithBlock:", &__block_literal_global_31);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [(DEDXPCInbound *)self delegate];
  id v11 = objc_msgSend(v10, "xpcInbound_sessionForIdentifier:", v8);

  [v11 didLoadTextDataForExtensions:v12 localization:v9];
}

DEDExtension *__73__DEDXPCInbound_xpc_didLoadTextDataForExtensions_localization_sessionID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

- (NSNumber)senderPid
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSenderPid:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
}

- (DEDXPCInboundDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DEDXPCInboundDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_senderPid, 0);
}

- (void)xpc_didStartBugSessionWithInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "(DEDXPCInbound) Delegate is nil, cannot ACK session start", v2, v3, v4, v5, v6);
}

- (void)xpc_terminateExtension:info:session:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "no delegate in XPC Inbound", v2, v3, v4, v5, v6);
}

- (void)xpc_terminateExtension:(uint64_t)a1 info:(NSObject *)a2 session:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "no session found for identifier [%{public}@]", (uint8_t *)&v2, 0xCu);
}

- (void)xpc_getSessionStateWithSession:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "no delegate in XPC Inbound. Cannot get state", v2, v3, v4, v5, v6);
}

- (void)xpc_didGetState:info:sessionID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "no delegate in XPC Inbound. Cannot reply with state", v2, v3, v4, v5, v6);
}

- (void)xpc_adoptFiles:forSession:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "No delegate. Will not adopt files.", v2, v3, v4, v5, v6);
}

- (void)xpc_didAdoptFilesWithError:forSession:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "No delegate. Will not reply to adopt files.", v2, v3, v4, v5, v6);
}

- (void)xpc_addData:withFilename:forSession:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "no delegate in XPC Inbound. Cannot add session data", v2, v3, v4, v5, v6);
}

@end