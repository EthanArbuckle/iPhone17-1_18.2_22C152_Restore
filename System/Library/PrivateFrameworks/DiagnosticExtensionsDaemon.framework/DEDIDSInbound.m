@interface DEDIDSInbound
+ (id)archivedClasses;
- (DEDIDSConnection)connection;
- (DEDIDSInbound)init;
- (DEDIDSInbound)initWithConnection:(id)a3 controller:(id)a4;
- (DEDIDSInboundDelegate)delegate;
- (void)add_session_data:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)adopt_files:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)cancel_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)commit_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)compression_progress:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)device_supports_diagnostic_extensions:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_adopt_files:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_cancel_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_commit_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_get_session_state:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_get_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_load_extension_text_data:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_present_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_remove_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_start_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)did_sync_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)finished_diagnostic_with_identifier:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)get_session_state:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)get_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)init;
- (void)load_extension_text_data:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)local_device_query_callback:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)logMalformedMessage;
- (void)present_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)remote_device_query_request:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)remote_list_DE:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)remove_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)schedule_notification:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 sentBytes:(int64_t)a6 totalBytes:(int64_t)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withOptions:(id)a7;
- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)serviceAllowedTrafficClassifiersDidReset:(id)a3;
- (void)serviceSpaceDidBecomeAvailable:(id)a3;
- (void)session_ping:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)session_pong:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start_diagnostic_with_identifier:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)start_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)sync_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)terminate_diagnostic_with_identifier:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)unschedule_notification:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)upload_progress:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation DEDIDSInbound

- (DEDIDSInbound)init
{
  v5.receiver = self;
  v5.super_class = (Class)DEDIDSInbound;
  v2 = [(DEDIDSInbound *)&v5 init];
  if (v2)
  {
    v3 = Log_2();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[DEDIDSInbound init]();
    }
  }
  return v2;
}

- (DEDIDSInbound)initWithConnection:(id)a3 controller:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(DEDIDSInbound);

  if (v8)
  {
    [(DEDIDSInbound *)v8 setConnection:v6];
    [(DEDIDSInbound *)v8 setDelegate:v7];
  }

  return v8;
}

- (void)logMalformedMessage
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Error in sending previous message", v2, v3, v4, v5, v6);
}

+ (id)archivedClasses
{
  if (archivedClasses_onceToken_4 != -1) {
    dispatch_once(&archivedClasses_onceToken_4, &__block_literal_global_19);
  }
  uint64_t v2 = (void *)archivedClasses__classes_2;
  return v2;
}

void __32__DEDIDSInbound_archivedClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = +[DEDExtensionIdentifier archivedClasses];
  [v5 unionSet:v2];

  uint64_t v3 = [MEMORY[0x263EFFA08] setWithSet:v5];
  uint64_t v4 = (void *)archivedClasses__classes_2;
  archivedClasses__classes_2 = v3;
}

- (void)local_device_query_callback:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  if (isKnownDevice(a4, v12))
  {
    v14 = Log_2();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[DEDIDSInbound local_device_query_callback:service:account:fromID:context:]();
    }

    v15 = +[DEDIDSConnection unpackProtobuf:v11];
    if (v15)
    {
      v16 = +[DEDDevice deviceWithDictionary:v15];
      [v16 setTransport:4];
      [v16 setRemoteTransport:4];
      [v16 setAddress:v12];
      v17 = Log_2();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v16 identifier];
        v19 = [v13 serviceIdentifier];
        int v23 = 138543618;
        v24 = v18;
        __int16 v25 = 2114;
        v26 = v19;
        _os_log_impl(&dword_21FE04000, v17, OS_LOG_TYPE_DEFAULT, "local_device_query_callback: IDS device ready [%{public}@] on service [%{public}@]", (uint8_t *)&v23, 0x16u);
      }
      v20 = [(DEDIDSInbound *)self connection];

      if (!v20)
      {
        v21 = Log_2();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[DEDIDSInbound local_device_query_callback:service:account:fromID:context:]();
        }
      }
      v22 = [(DEDIDSInbound *)self connection];
      [v22 incomingDeviceReceived:v16];
    }
    else
    {
      v16 = Log_2();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DEDIDSInbound local_device_query_callback:service:account:fromID:context:]();
      }
    }
  }
}

- (void)start_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "start_session", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = [v13 objectForKeyedSubscript:@"config"];
    v15 = [v13 objectForKeyedSubscript:@"callingDevice"];
    v16 = [v13 objectForKeyedSubscript:@"targetDevice"];
    v17 = [v13 objectForKeyedSubscript:@"sessionID"];
    [v15 setTransport:4];
    [v15 setAddress:v11];
    v18 = [(DEDIDSInbound *)self delegate];
    objc_msgSend(v18, "idsInbound_startBugSessionWithIdentifier:configuration:caller:target:", v17, v14, v15, v16);
  }
}

- (void)did_start_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  if (isKnownDevice(a4, a6))
  {
    id v11 = Log_2();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "did_start_session", v14, 2u);
    }

    id v12 = +[DEDIDSConnection unpackProtobuf:v10];
    id v13 = [(DEDIDSInbound *)self delegate];
    objc_msgSend(v13, "idsInbound_didStartBugSessionWithInfo:", v12);
  }
}

- (void)session_ping:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "session_ping", v18, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      v16 = [(DEDIDSInbound *)self delegate];
      v17 = objc_msgSend(v16, "idsInbound_sessionForIdentifier:", v15);
      [v17 pingWithCallback:0];
    }
    else
    {
      v15 = [(DEDIDSInbound *)self connection];
      v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)session_pong:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "session_pong", v18, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      v16 = [(DEDIDSInbound *)self delegate];
      v17 = objc_msgSend(v16, "idsInbound_sessionForIdentifier:", v15);
      [v17 pong];
    }
    else
    {
      v15 = [(DEDIDSInbound *)self connection];
      v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)remote_list_DE:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "remote_list_DE", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      v17 = [(DEDIDSInbound *)self delegate];
      v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 listDiagnosticExtensionsWithCompletion:0];
    }
    else
    {
      v15 = [(DEDIDSInbound *)self connection];
      v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)device_supports_diagnostic_extensions:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (isKnownDevice(a4, a6))
  {
    id v11 = Log_2();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "device_supports_diagnostic_extensions", buf, 2u);
    }

    id v12 = +[DEDIDSConnection unpackProtobuf:v10];
    id v13 = v12;
    if (v12)
    {
      v14 = [v12 objectForKeyedSubscript:@"getDEList"];
      v26 = [v13 objectForKeyedSubscript:@"sessionID"];
      v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v14, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = +[DEDExtension extensionWithDictionary:*(void *)(*((void *)&v27 + 1) + 8 * i)];
            [v15 addObject:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v18);
      }

      v22 = (void *)[v15 copy];
      int v23 = [(DEDIDSInbound *)self delegate];

      if (v23)
      {
        v24 = [(DEDIDSInbound *)self delegate];
        __int16 v25 = objc_msgSend(v24, "idsInbound_sessionForIdentifier:", v26);
        [v25 supportsDiagnostics:v22];
      }
    }
  }
}

- (void)start_diagnostic_with_identifier:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "start_diagnostic_with_identifier", buf, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"triggerDE"];
      uint64_t v17 = [v14 objectForKeyedSubscript:@"triggerDEParams"];
      uint64_t v18 = [v14 objectForKeyedSubscript:@"triggerDERunDate"];
      uint64_t v19 = [(DEDIDSInbound *)self delegate];

      if (v19)
      {
        v26 = v17;
        v20 = [[DEDExtensionIdentifier alloc] initWithString:v16];
        v21 = [(DEDIDSInbound *)self delegate];
        v22 = objc_msgSend(v21, "idsInbound_sessionForIdentifier:", v15);
        int v23 = [(DEDExtensionIdentifier *)v20 extensionIdentifier];
        if (v18) {
          id v24 = (id)[v22 startDiagnosticExtensionWithIdentifier:v23 parameters:v26 deferRunUntil:v18 completion:0];
        }
        else {
          id v25 = (id)[v22 startDiagnosticExtensionWithIdentifier:v23 parameters:v26 completion:0];
        }

        uint64_t v17 = v26;
      }
    }
    else
    {
      v15 = [(DEDIDSInbound *)self connection];
      id v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)finished_diagnostic_with_identifier:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "finished_diagnostic_with_identifier", v22, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"triggerDE"];
      uint64_t v17 = [v14 objectForKeyedSubscript:@"finishedDEDGroups"];
      uint64_t v18 = +[DEDAttachmentGroup groupWithDictionary:v17];

      uint64_t v19 = [(DEDIDSInbound *)self delegate];

      if (v19)
      {
        v20 = [(DEDIDSInbound *)self delegate];
        v21 = objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v15);
        [v21 finishedDiagnosticWithIdentifier:v16 result:v18];
      }
    }
    else
    {
      v15 = [(DEDIDSInbound *)self connection];
      id v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)remote_device_query_request:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a6;
  if (isKnownDevice(a4, v9))
  {
    id v10 = Log_2();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "remote_device_query_request from %@", buf, 0xCu);
    }

    id v11 = +[DEDDevice currentDeviceWithDaemonInfo];
    id v12 = (void *)MEMORY[0x263F08910];
    id v13 = [v11 serialize];
    id v17 = 0;
    v14 = [v12 archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v17];
    id v15 = v17;

    if (v15)
    {
      id v16 = Log_2();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DEDIDSInbound remote_device_query_request:service:account:fromID:context:]();
      }
    }
    else
    {
      id v16 = [(DEDIDSInbound *)self connection];
      [v16 sendMessage:1 withData:v14 forIDSDeviceID:v9 isResponse:1];
    }
  }
}

- (void)terminate_diagnostic_with_identifier:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "terminate_diagnostic_with_identifier", v21, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"triggerDE"];
      id v17 = [v14 objectForKeyedSubscript:@"triggerDEParams"];
      uint64_t v18 = [(DEDIDSInbound *)self delegate];

      if (v18)
      {
        id v19 = [(DEDIDSInbound *)self delegate];
        uint64_t v20 = [v19 idsInbound_sessionForIdentifier:v15];
        [v20 terminateExtension:v16 withInfo:v17];
      }
      else
      {
        id v19 = Log_2();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[DEDIDSInbound terminate_diagnostic_with_identifier:service:account:fromID:context:]();
        }
      }
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      id v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)get_session_state:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "get_session_state", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 getStateWithCompletion:0];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      id v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)did_get_session_state:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "did_get_session_state", v22, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"sessionState"];
      uint64_t v17 = [v16 integerValue];

      uint64_t v18 = [v14 objectForKeyedSubscript:@"sessionStateInfo"];
      id v19 = [(DEDIDSInbound *)self delegate];

      if (v19)
      {
        uint64_t v20 = [(DEDIDSInbound *)self delegate];
        v21 = objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v15);
        [v21 didGetState:v17 info:v18];
      }
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v18 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v18 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)add_session_data:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "add_session_data", v21, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"sessionData"];
      uint64_t v17 = [v14 objectForKeyedSubscript:@"sessionDataFilename"];
      uint64_t v18 = [(DEDIDSInbound *)self delegate];

      if (v18)
      {
        id v19 = [(DEDIDSInbound *)self delegate];
        uint64_t v20 = objc_msgSend(v19, "idsInbound_sessionForIdentifier:", v15);
        [v20 addData:v16 withFilename:v17];
      }
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      id v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)get_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "get_session_status", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 getSessionStatusWithCompletion:0];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)sync_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "sync_session_status", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 synchronizeSessionStatusWithCompletion:0];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)did_get_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v23 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "did_get_session_status", v23, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"finishedDEDGroups"];
      uint64_t v17 = objc_msgSend(v16, "ded_mapWithBlock:", &__block_literal_global_67);

      uint64_t v18 = [v14 objectForKeyedSubscript:@"runningDEs"];
      id v19 = objc_msgSend(v18, "ded_mapWithBlock:", &__block_literal_global_72);

      uint64_t v20 = [(DEDIDSInbound *)self delegate];

      if (v20)
      {
        v21 = [(DEDIDSInbound *)self delegate];
        v22 = objc_msgSend(v21, "idsInbound_sessionForIdentifier:", v15);
        [v22 hasCollected:v17 isCollecting:v19];
      }
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

DEDAttachmentGroup *__71__DEDIDSInbound_did_get_session_status_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:a2];
}

DEDExtension *__71__DEDIDSInbound_did_get_session_status_service_account_fromID_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

- (void)did_sync_session_status:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v25 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "did_sync_session_status", v25, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"finishedDEDGroups"];
      uint64_t v17 = objc_msgSend(v16, "ded_mapWithBlock:", &__block_literal_global_74);

      uint64_t v18 = [v14 objectForKeyedSubscript:@"runningDEs"];
      id v19 = objc_msgSend(v18, "ded_mapWithBlock:", &__block_literal_global_76);

      uint64_t v20 = [v14 objectForKeyedSubscript:@"extensionIdentifiers"];
      v21 = objc_msgSend(v20, "ded_mapWithBlock:", &__block_literal_global_81);

      v22 = [(DEDIDSInbound *)self delegate];

      if (v22)
      {
        int v23 = [(DEDIDSInbound *)self delegate];
        id v24 = objc_msgSend(v23, "idsInbound_sessionForIdentifier:", v15);
        [v24 hasCollected:v17 isCollecting:v19 identifiers:v21];
      }
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

DEDAttachmentGroup *__72__DEDIDSInbound_did_sync_session_status_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:a2];
}

DEDExtension *__72__DEDIDSInbound_did_sync_session_status_service_account_fromID_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

DEDExtensionIdentifier *__72__DEDIDSInbound_did_sync_session_status_service_account_fromID_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[DEDExtensionIdentifier alloc] initWithString:v2];

  return v3;
}

- (void)adopt_files:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "adopt_files", v20, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"filesForAdopt"];
      uint64_t v17 = Log_2();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[DEDIDSInbound adopt_files:service:account:fromID:context:]();
      }

      uint64_t v18 = [(DEDIDSInbound *)self delegate];
      id v19 = objc_msgSend(v18, "idsInbound_sessionForIdentifier:", v15);
      [v19 adoptFiles:v16 withCompletion:0];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      id v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)did_adopt_files:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "did_adopt_files", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"error"];
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 didAdoptFilesWithError:v16];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      id v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)upload_progress:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = +[DEDIDSConnection unpackProtobuf:v10];
    id v13 = v12;
    if (v12)
    {
      v14 = [v12 objectForKeyedSubscript:@"sessionID"];
      id v15 = Log_2();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[DEDIDSInbound upload_progress:service:account:fromID:context:]();
      }

      id v16 = [v13 objectForKeyedSubscript:@"uploadedBytes"];
      uint64_t v17 = [v16 longLongValue];

      uint64_t v18 = [v13 objectForKeyedSubscript:@"totalBytes"];
      uint64_t v19 = [v18 longLongValue];

      uint64_t v20 = [(DEDIDSInbound *)self delegate];
      v21 = objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v14);
      [v21 uploadProgress:v17 total:v19];
    }
    else
    {
      v22 = [(DEDIDSInbound *)self connection];
      int v23 = [MEMORY[0x263EFF8F8] data];
      [v22 sendMessage:0 withData:v23 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)compression_progress:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = +[DEDIDSConnection unpackProtobuf:v10];
    id v13 = v12;
    if (v12)
    {
      v14 = [v12 objectForKeyedSubscript:@"sessionID"];
      id v15 = Log_2();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[DEDIDSInbound compression_progress:service:account:fromID:context:]();
      }

      id v16 = [v13 objectForKeyedSubscript:@"compressedBytes"];
      uint64_t v17 = [v16 unsignedLongLongValue];

      uint64_t v18 = [v13 objectForKeyedSubscript:@"totalBytes"];
      uint64_t v19 = [v18 unsignedLongLongValue];

      uint64_t v20 = [(DEDIDSInbound *)self delegate];
      v21 = objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v14);
      [v21 compressionProgress:v17 total:v19];
    }
    else
    {
      v22 = [(DEDIDSInbound *)self connection];
      int v23 = [MEMORY[0x263EFF8F8] data];
      [v22 sendMessage:0 withData:v23 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)commit_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "commit_session", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 commit];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)did_commit_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "did_commit_session", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 didCommit];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)cancel_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "cancel_session", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 cancel];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)did_cancel_session:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "did_cancel_session", v18, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      objc_msgSend(v17, "idsInbound_didAbortSessionWithID:", v15);
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)schedule_notification:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "schedule_notification", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 scheduleNotification];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)unschedule_notification:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "unschedule_notification", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      [v18 clearNotification];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)present_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "present_notification_on_passthrough_daemon", v20, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];
      uint64_t v17 = objc_msgSend(v16, "idsInbound_sessionForIdentifier:", v15);
      objc_msgSend(v17, "idsInbound_presentNotificationOnFilingDevice");

      uint64_t v18 = [(DEDIDSInbound *)self connection];
      uint64_t v19 = +[DEDIDSConnection packPayload:v14];
      [v18 sendMessage:28 withData:v19 forIDSDeviceID:v11 isResponse:1];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v18 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v18 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)did_present_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "did_present_notification_on_passthrough_daemon", v18, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];
      uint64_t v17 = objc_msgSend(v16, "idsInbound_sessionForIdentifier:", v15);
      objc_msgSend(v17, "idsInbound_didPresentNotificationOnFilingDevice");
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      id v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)remove_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "remove_notification_on_passthrough_daemon", v21, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (v16)
      {
        uint64_t v17 = [(DEDIDSInbound *)self delegate];
        uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
        objc_msgSend(v18, "idsInbound_clearNotificationOnFilingDevice");
      }
      uint64_t v19 = [(DEDIDSInbound *)self connection];
      uint64_t v20 = +[DEDIDSConnection packPayload:v14];
      [v19 sendMessage:29 withData:v20 forIDSDeviceID:v11 isResponse:1];
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v19 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v19 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

- (void)did_remove_notification_on_passthrough_daemon:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "did_remove_notification_on_passthrough_daemon", v19, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [(DEDIDSInbound *)self delegate];

      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [(DEDIDSInbound *)self delegate];
      uint64_t v18 = objc_msgSend(v17, "idsInbound_sessionForIdentifier:", v15);
      objc_msgSend(v18, "idsInbound_didClearNotificationOnFilingDevice");
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      uint64_t v17 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v17 forIDSDeviceID:v11 isResponse:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)load_extension_text_data:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "load_extension_text_data", v22, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"localization"];
      uint64_t v17 = [v14 objectForKeyedSubscript:@"extensions"];
      uint64_t v18 = objc_msgSend(v17, "ded_flatMapWithBlock:", &__block_literal_global_105);
      uint64_t v19 = [(DEDIDSInbound *)self delegate];

      if (v19)
      {
        uint64_t v20 = [(DEDIDSInbound *)self delegate];
        v21 = objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v15);
        [v21 loadTextDataForExtensions:v18 localization:v16 completion:0];
      }
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      id v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

DEDExtension *__73__DEDIDSInbound_load_extension_text_data_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

- (void)did_load_extension_text_data:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  if (isKnownDevice(a4, v11))
  {
    id v12 = Log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "did_load_extension_text_data", v22, 2u);
    }

    id v13 = +[DEDIDSConnection unpackProtobuf:v10];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:@"sessionID"];
      id v16 = [v14 objectForKeyedSubscript:@"localization"];
      uint64_t v17 = [v14 objectForKeyedSubscript:@"extensions"];
      uint64_t v18 = objc_msgSend(v17, "ded_flatMapWithBlock:", &__block_literal_global_107);
      uint64_t v19 = [(DEDIDSInbound *)self delegate];

      if (v19)
      {
        uint64_t v20 = [(DEDIDSInbound *)self delegate];
        v21 = objc_msgSend(v20, "idsInbound_sessionForIdentifier:", v15);
        [v21 didLoadTextDataForExtensions:v18 localization:v16];
      }
    }
    else
    {
      id v15 = [(DEDIDSInbound *)self connection];
      id v16 = [MEMORY[0x263EFF8F8] data];
      [v15 sendMessage:0 withData:v16 forIDSDeviceID:v11 isResponse:0];
    }
  }
}

DEDExtension *__77__DEDIDSInbound_did_load_extension_text_data_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7 = a6;
  v8 = IDSDelLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:incomingMessage:fromID:context:]();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7 = a6;
  v8 = IDSDelLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:incomingData:fromID:context:]();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a5;
  id v9 = a6;
  id v10 = IDSDelLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:incomingUnhandledProtobuf:fromID:context:](v8, (uint64_t)v9, v10);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a5;
  id v9 = a6;
  id v10 = IDSDelLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:incomingResourceAtURL:fromID:context:]();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = IDSDelLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_debug_impl(&dword_21FE04000, v13, OS_LOG_TYPE_DEBUG, "incoming resource [%@] metadata [%@] from [%@]", (uint8_t *)&v14, 0x20u);
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4 = a4;
  id v5 = IDSDelLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:activeAccountsChanged:]();
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint8_t v6 = IDSDelLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "Devices changed", (uint8_t *)&v10, 2u);
  }

  id v7 = [(DEDIDSInbound *)self delegate];

  if (v7)
  {
    id v8 = objc_msgSend(v5, "ded_mapWithBlock:", &__block_literal_global_110);
    id v9 = [(DEDIDSInbound *)self delegate];
    objc_msgSend(v9, "idsInbound_devicesChanged:", v8);
  }
  else
  {
    id v8 = IDSDelLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[DEDIDSInbound service:devicesChanged:]";
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "no delegate set for %s", (uint8_t *)&v10, 0xCu);
    }
  }
}

id __40__DEDIDSInbound_service_devicesChanged___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = DEDAddressForIDSDevice();
  id v4 = +[DEDDevice idsDeviceWithDevice:v2 address:v3];

  return v4;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v4 = a4;
  id v5 = IDSDelLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:nearbyDevicesChanged:]();
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v4 = a4;
  id v5 = IDSDelLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:connectedDevicesChanged:]();
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a7;
  id v13 = DEDIDSConnectionLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [v10 serviceDomain];
    int v16 = 138543874;
    id v17 = v11;
    __int16 v18 = 2114;
    id v19 = v14;
    __int16 v20 = 1024;
    BOOL v21 = v8;
    _os_log_impl(&dword_21FE04000, v13, OS_LOG_TYPE_DEFAULT, "Did send IDS command with guid: [%{public}@] on service [%{public}@], success? [%i]", (uint8_t *)&v16, 0x1Cu);
  }
  if (v12)
  {
    id v15 = IDSDelLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[DEDIDSInbound service:account:identifier:didSendWithSuccess:error:]();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  int v14 = DEDIDSConnectionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 serviceName];
    int v17 = 138543874;
    id v18 = v12;
    __int16 v19 = 2114;
    __int16 v20 = v15;
    __int16 v21 = 1024;
    BOOL v22 = v9;
    _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_DEFAULT, "Did send message with guid [%{public}@] on service [%{public}@], success? [%i]", (uint8_t *)&v17, 0x1Cu);
  }
  if (v13)
  {
    int v16 = IDSDelLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[DEDIDSInbound service:account:identifier:didSendWithSuccess:error:]();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 sentBytes:(int64_t)a6 totalBytes:(int64_t)a7
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = IDSDelLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218498;
    int64_t v12 = a6;
    __int16 v13 = 2048;
    int64_t v14 = a7;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_debug_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEBUG, "sent bytes [%li] total [%li] identifier [%@]", (uint8_t *)&v11, 0x20u);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v6 = a5;
  id v7 = IDSDelLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:identifier:hasBeenDeliveredWithContext:]();
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v8 = a5;
  id v9 = a6;
  id v10 = IDSDelLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:identifier:fromID:hasBeenDeliveredWithContext:]();
  }
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6
{
  id v6 = a6;
  id v7 = IDSDelLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:inviteReceivedForSession:fromID:]();
  }
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withOptions:(id)a7
{
  id v8 = a6;
  id v9 = a7;
  id v10 = IDSDelLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:inviteReceivedForSession:fromID:withOptions:]();
  }
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v7 = a6;
  id v8 = IDSDelLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:inviteReceivedForSession:fromID:withContext:]();
  }
}

- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5
{
  id v5 = IDSDelLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:account:receivedGroupSessionParticipantUpdate:]();
  }
}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  id v3 = a3;
  id v4 = IDSDelLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound serviceSpaceDidBecomeAvailable:]();
  }
}

- (void)serviceAllowedTrafficClassifiersDidReset:(id)a3
{
  id v3 = a3;
  id v4 = IDSDelLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound serviceAllowedTrafficClassifiersDidReset:]();
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(void))a5;
  id v8 = IDSDelLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDIDSInbound service:didSwitchActivePairedDevice:acknowledgementBlock:]();
  }

  v7[2](v7);
}

- (DEDIDSConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (DEDIDSConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (DEDIDSInboundDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DEDIDSInboundDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21FE04000, v0, v1, "IDSService on DEDIDSInbound initialized.", v2, v3, v4, v5, v6);
}

- (void)local_device_query_callback:service:account:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "no device payload on discovery reply from [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)local_device_query_callback:service:account:fromID:context:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "DEDIDSConnection is nil", v2, v3, v4, v5, v6);
}

- (void)local_device_query_callback:service:account:fromID:context:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21FE04000, v0, v1, "local_device_query_callback", v2, v3, v4, v5, v6);
}

- (void)remote_device_query_request:service:account:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Error archiving serialized device with error: [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)terminate_diagnostic_with_identifier:service:account:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "no delegate, can't perform _terminate_diagnostic", v2, v3, v4, v5, v6);
}

- (void)adopt_files:service:account:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "adopt_files API not supported via IDS", v2, v3, v4, v5, v6);
}

- (void)upload_progress:service:account:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "upload_progress on session [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)compression_progress:service:account:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "compression_progress on session [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingMessage:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "incoming message from [%@]", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingData:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "incoming data from [%@]", v2, v3, v4, v5, v6);
}

- (void)service:(NSObject *)a3 account:incomingUnhandledProtobuf:fromID:context:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 67109378;
  v5[1] = [a1 type];
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_21FE04000, a3, OS_LOG_TYPE_DEBUG, "Incoming unhandled protobuf of type [%hu] from [%@]", (uint8_t *)v5, 0x12u);
}

- (void)service:account:incomingResourceAtURL:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_2(&dword_21FE04000, v0, v1, "incoming resource [%@] from [%@]");
}

- (void)service:activeAccountsChanged:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "Active Accounts changed %@", v2, v3, v4, v5, v6);
}

- (void)service:nearbyDevicesChanged:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "Nearby Devices changed %@", v2, v3, v4, v5, v6);
}

- (void)service:connectedDevicesChanged:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "Connected Devices changed %@", v2, v3, v4, v5, v6);
}

- (void)service:account:identifier:didSendWithSuccess:error:.cold.1()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_9_0(&dword_21FE04000, v0, v1, "Error sending message: [%{public}@] error: [%{public}@]");
}

- (void)service:account:identifier:hasBeenDeliveredWithContext:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "identifier [%@] has been delivered", v2, v3, v4, v5, v6);
}

- (void)service:account:identifier:fromID:hasBeenDeliveredWithContext:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_2(&dword_21FE04000, v0, v1, "identifier [%@] from id [%@] has been delivered");
}

- (void)service:account:inviteReceivedForSession:fromID:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "invite received from id [%@]", v2, v3, v4, v5, v6);
}

- (void)service:account:inviteReceivedForSession:fromID:withOptions:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_2(&dword_21FE04000, v0, v1, "invite received from id [%@] with options [%@]");
}

- (void)service:account:inviteReceivedForSession:fromID:withContext:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "invite received from id [%{public}@] with context", v2, v3, v4, v5, v6);
}

- (void)service:account:receivedGroupSessionParticipantUpdate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21FE04000, v0, v1, "received groupe participant update", v2, v3, v4, v5, v6);
}

- (void)serviceSpaceDidBecomeAvailable:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "service space became available [%@]", v2, v3, v4, v5, v6);
}

- (void)serviceAllowedTrafficClassifiersDidReset:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "service traffic did reset [%@]", v2, v3, v4, v5, v6);
}

- (void)service:didSwitchActivePairedDevice:acknowledgementBlock:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "did switch active paired device [%@]", v2, v3, v4, v5, v6);
}

@end