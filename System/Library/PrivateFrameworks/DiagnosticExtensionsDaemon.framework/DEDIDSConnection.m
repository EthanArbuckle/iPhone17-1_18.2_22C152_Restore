@interface DEDIDSConnection
+ (id)archivedClasses;
+ (id)packPayload:(id)a3;
+ (id)unpackProtobuf:(id)a3;
- (BOOL)sendMessage:(int)a3 withData:(id)a4 forDevices:(id)a5 isResponse:(BOOL)a6;
- (BOOL)sendMessage:(int)a3 withData:(id)a4 forIDSDeviceID:(id)a5 isResponse:(BOOL)a6;
- (BOOL)sendMessage:(int)a3 withData:(id)a4 forIDSDeviceIDs:(id)a5 isResponse:(BOOL)a6;
- (BOOL)sendMessage:(int)a3 withData:(id)a4 forIDSDeviceIDs:(id)a5 localIDSDeviceIDs:(id)a6 isResponse:(BOOL)a7;
- (DEDClientProtocol)remoteSideDelegate;
- (DEDIDSConnection)initWithController:(id)a3;
- (IDSService)localService;
- (IDSService)service;
- (IDSServiceDelegate)incomingDelegate;
- (OS_dispatch_queue)discovery_queue;
- (OS_dispatch_queue)run_queue;
- (id)deviceStatusCallback;
- (void)discoverDevicesWithCompletion:(id)a3;
- (void)ids_didStartBugSessionWithInfo:(id)a3 forID:(id)a4;
- (void)ids_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6;
- (void)incomingDeviceReceived:(id)a3;
- (void)setDeviceCallback:(id)a3;
- (void)setDeviceStatusCallback:(id)a3;
- (void)setDiscovery_queue:(id)a3;
- (void)setIncomingDelegate:(id)a3;
- (void)setLocalService:(id)a3;
- (void)setRemoteSideDelegate:(id)a3;
- (void)setRun_queue:(id)a3;
- (void)setService:(id)a3;
@end

@implementation DEDIDSConnection

+ (id)archivedClasses
{
  if (archivedClasses_onceToken_3 != -1) {
    dispatch_once(&archivedClasses_onceToken_3, &__block_literal_global_10);
  }
  v2 = (void *)archivedClasses__classes_1;
  return v2;
}

void __35__DEDIDSConnection_archivedClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = +[DEDDevice archivedClasses];
  [v11 unionSet:v4];

  v5 = +[DEDBugSessionConfiguration archivedClasses];
  [v11 unionSet:v5];

  v6 = +[DEDController archivedClasses];
  [v11 unionSet:v6];

  v7 = +[DEDIDSOutbound archivedClasses];
  [v11 unionSet:v7];

  v8 = +[DEDIDSInbound archivedClasses];
  [v11 unionSet:v8];

  uint64_t v9 = [MEMORY[0x263EFFA08] setWithSet:v11];
  v10 = (void *)archivedClasses__classes_1;
  archivedClasses__classes_1 = v9;
}

+ (id)packPayload:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[DEDIDSConnection packPayload:v6];
    }

    id v7 = [MEMORY[0x263EFF8F8] data];
  }
  else
  {
    id v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (id)unpackProtobuf:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 data], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = (void *)MEMORY[0x263F08928];
    v8 = [a1 archivedClasses];
    uint64_t v9 = [v5 data];
    id v17 = 0;
    id v10 = [v7 unarchivedObjectOfClasses:v8 fromData:v9 error:&v17];
    id v11 = v17;

    if (v11)
    {
      v12 = +[DEDUtils sharedLog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[DEDIDSConnection unpackProtobuf:v12];
      }

      uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
    }
    v15 = (void *)v13;
  }
  else
  {
    v14 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[DEDIDSConnection unpackProtobuf:](v5, v14);
    }

    v15 = [MEMORY[0x263EFF9A0] dictionary];
  }

  return v15;
}

- (DEDIDSConnection)initWithController:(id)a3
{
  v76[30] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)DEDIDSConnection;
  id v5 = [(DEDIDSConnection *)&v74 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.ded"];
    service = v5->_service;
    v5->_service = (IDSService *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.ded.watch"];
    localService = v5->_localService;
    v5->_localService = (IDSService *)v8;

    if (!v5->_service) {
      -[DEDIDSConnection initWithController:]();
    }
    v70 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.diagnosticextensionsd.idsqueue.discovery", v70);
    discovery_queue = v5->_discovery_queue;
    v5->_discovery_queue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.diagnosticextensionsd.idsqueue", 0);
    run_queue = v5->_run_queue;
    v5->_run_queue = (OS_dispatch_queue *)v12;

    id v71 = v4;
    v14 = [[DEDIDSInbound alloc] initWithConnection:v5 controller:v4];
    incomingDelegate = v5->_incomingDelegate;
    v5->_incomingDelegate = (IDSServiceDelegate *)v14;

    v16 = v5->_run_queue;
    id v17 = dispatch_get_global_queue(2, 0);
    dispatch_set_target_queue(v16, v17);

    v18 = [(DEDIDSConnection *)v5 service];
    [v18 setProtobufAction:sel_logMalformedMessage forIncomingRequestsOfType:0];

    v19 = [(DEDIDSConnection *)v5 service];
    [v19 setProtobufAction:sel_logMalformedMessage forIncomingResponsesOfType:0];

    v20 = [(DEDIDSConnection *)v5 localService];
    [v20 setProtobufAction:sel_logMalformedMessage forIncomingRequestsOfType:0];

    v21 = [(DEDIDSConnection *)v5 localService];
    [v21 setProtobufAction:sel_logMalformedMessage forIncomingResponsesOfType:0];

    v75[0] = &unk_26D1AF410;
    v69 = NSStringFromSelector(sel_remote_device_query_request_service_account_fromID_context_);
    v76[0] = v69;
    v75[1] = &unk_26D1AF428;
    v68 = NSStringFromSelector(sel_remote_list_DE_service_account_fromID_context_);
    v76[1] = v68;
    v75[2] = &unk_26D1AF440;
    v67 = NSStringFromSelector(sel_device_supports_diagnostic_extensions_service_account_fromID_context_);
    v76[2] = v67;
    v75[3] = &unk_26D1AF458;
    v66 = NSStringFromSelector(sel_start_diagnostic_with_identifier_service_account_fromID_context_);
    v76[3] = v66;
    v75[4] = &unk_26D1AF470;
    v65 = NSStringFromSelector(sel_finished_diagnostic_with_identifier_service_account_fromID_context_);
    v76[4] = v65;
    v75[5] = &unk_26D1AF488;
    v64 = NSStringFromSelector(sel_start_session_service_account_fromID_context_);
    v76[5] = v64;
    v75[6] = &unk_26D1AF4A0;
    v63 = NSStringFromSelector(sel_did_start_session_service_account_fromID_context_);
    v76[6] = v63;
    v75[7] = &unk_26D1AF4B8;
    v62 = NSStringFromSelector(sel_session_ping_service_account_fromID_context_);
    v76[7] = v62;
    v75[8] = &unk_26D1AF4D0;
    v61 = NSStringFromSelector(sel_session_pong_service_account_fromID_context_);
    v76[8] = v61;
    v75[9] = &unk_26D1AF4E8;
    v60 = NSStringFromSelector(sel_terminate_diagnostic_with_identifier_service_account_fromID_context_);
    v76[9] = v60;
    v75[10] = &unk_26D1AF500;
    v59 = NSStringFromSelector(sel_get_session_status_service_account_fromID_context_);
    v76[10] = v59;
    v75[11] = &unk_26D1AF518;
    v58 = NSStringFromSelector(sel_did_get_session_status_service_account_fromID_context_);
    v76[11] = v58;
    v75[12] = &unk_26D1AF530;
    v57 = NSStringFromSelector(sel_adopt_files_service_account_fromID_context_);
    v76[12] = v57;
    v75[13] = &unk_26D1AF548;
    v56 = NSStringFromSelector(sel_did_adopt_files_service_account_fromID_context_);
    v76[13] = v56;
    v75[14] = &unk_26D1AF560;
    v55 = NSStringFromSelector(sel_upload_progress_service_account_fromID_context_);
    v76[14] = v55;
    v75[15] = &unk_26D1AF578;
    v54 = NSStringFromSelector(sel_commit_session_service_account_fromID_context_);
    v76[15] = v54;
    v75[16] = &unk_26D1AF590;
    v53 = NSStringFromSelector(sel_did_commit_session_service_account_fromID_context_);
    v76[16] = v53;
    v75[17] = &unk_26D1AF5A8;
    v52 = NSStringFromSelector(sel_cancel_session_service_account_fromID_context_);
    v76[17] = v52;
    v75[18] = &unk_26D1AF5C0;
    v51 = NSStringFromSelector(sel_did_cancel_session_service_account_fromID_context_);
    v76[18] = v51;
    v75[19] = &unk_26D1AF5D8;
    v50 = NSStringFromSelector(sel_sync_session_status_service_account_fromID_context_);
    v76[19] = v50;
    v75[20] = &unk_26D1AF5F0;
    v49 = NSStringFromSelector(sel_did_sync_session_status_service_account_fromID_context_);
    v76[20] = v49;
    v75[21] = &unk_26D1AF608;
    v48 = NSStringFromSelector(sel_get_session_state_service_account_fromID_context_);
    v76[21] = v48;
    v75[22] = &unk_26D1AF620;
    v22 = NSStringFromSelector(sel_did_get_session_state_service_account_fromID_context_);
    v76[22] = v22;
    v75[23] = &unk_26D1AF638;
    v23 = NSStringFromSelector(sel_schedule_notification_service_account_fromID_context_);
    v76[23] = v23;
    v75[24] = &unk_26D1AF650;
    v24 = NSStringFromSelector(sel_unschedule_notification_service_account_fromID_context_);
    v76[24] = v24;
    v75[25] = &unk_26D1AF668;
    v25 = NSStringFromSelector(sel_present_notification_on_passthrough_daemon_service_account_fromID_context_);
    v76[25] = v25;
    v75[26] = &unk_26D1AF680;
    v26 = NSStringFromSelector(sel_remove_notification_on_passthrough_daemon_service_account_fromID_context_);
    v76[26] = v26;
    v75[27] = &unk_26D1AF698;
    v27 = NSStringFromSelector(sel_add_session_data_service_account_fromID_context_);
    v76[27] = v27;
    v75[28] = &unk_26D1AF6B0;
    v28 = NSStringFromSelector(sel_load_extension_text_data_service_account_fromID_context_);
    v76[28] = v28;
    v75[29] = &unk_26D1AF6C8;
    v29 = NSStringFromSelector(sel_compression_progress_service_account_fromID_context_);
    v76[29] = v29;
    v30 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:30];

    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __39__DEDIDSConnection_initWithController___block_invoke;
    v72[3] = &unk_26453B3D0;
    v31 = v5;
    v73 = v31;
    [v30 enumerateKeysAndObjectsUsingBlock:v72];
    v32 = [(DEDIDSConnection *)v31 service];
    [v32 setProtobufAction:sel_did_present_notification_on_passthrough_daemon_service_account_fromID_context_ forIncomingResponsesOfType:28];

    v33 = [(DEDIDSConnection *)v31 service];
    [v33 setProtobufAction:sel_did_remove_notification_on_passthrough_daemon_service_account_fromID_context_ forIncomingResponsesOfType:29];

    v34 = [(DEDIDSConnection *)v31 service];
    [v34 setProtobufAction:sel_did_load_extension_text_data_service_account_fromID_context_ forIncomingResponsesOfType:31];

    v35 = [(DEDIDSConnection *)v31 service];
    [v35 setProtobufAction:sel_local_device_query_callback_service_account_fromID_context_ forIncomingResponsesOfType:1];

    v36 = [(DEDIDSConnection *)v31 localService];
    [v36 setProtobufAction:sel_local_device_query_callback_service_account_fromID_context_ forIncomingResponsesOfType:1];

    v37 = [(DEDIDSConnection *)v31 localService];
    [v37 setProtobufAction:sel_did_present_notification_on_passthrough_daemon_service_account_fromID_context_ forIncomingResponsesOfType:28];

    v38 = [(DEDIDSConnection *)v31 localService];
    [v38 setProtobufAction:sel_did_remove_notification_on_passthrough_daemon_service_account_fromID_context_ forIncomingResponsesOfType:29];

    v39 = [(DEDIDSConnection *)v31 localService];
    [v39 setProtobufAction:sel_did_load_extension_text_data_service_account_fromID_context_ forIncomingResponsesOfType:31];

    v40 = [(DEDIDSConnection *)v31 service];
    v41 = [(DEDIDSConnection *)v31 incomingDelegate];
    v42 = [(DEDIDSConnection *)v31 run_queue];
    [v40 addDelegate:v41 queue:v42];

    v43 = [(DEDIDSConnection *)v31 localService];
    v44 = [(DEDIDSConnection *)v31 incomingDelegate];
    v45 = [(DEDIDSConnection *)v31 run_queue];
    [v43 addDelegate:v44 queue:v45];

    v46 = DEDIDSConnectionLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      -[DEDIDSConnection initWithController:](v46);
    }

    id v4 = v71;
  }

  return v5;
}

void __39__DEDIDSConnection_initWithController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 service];
  objc_msgSend(v8, "setProtobufAction:forIncomingRequestsOfType:", NSSelectorFromString(v6), objc_msgSend(v7, "unsignedShortValue"));

  id v11 = [*(id *)(a1 + 32) localService];
  SEL v9 = NSSelectorFromString(v6);

  uint64_t v10 = [v7 unsignedShortValue];
  [v11 setProtobufAction:v9 forIncomingRequestsOfType:v10];
}

- (void)setDeviceCallback:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DEDIDSConnectionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4 == 0;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Setting device status callback. Nil? [%i]", (uint8_t *)v6, 8u);
  }

  [(DEDIDSConnection *)self setDeviceStatusCallback:v4];
}

- (BOOL)sendMessage:(int)a3 withData:(id)a4 forIDSDeviceID:(id)a5 isResponse:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = a4;
  dispatch_queue_t v12 = [v10 setWithObject:a5];
  LOBYTE(v6) = [(DEDIDSConnection *)self sendMessage:v8 withData:v11 forIDSDeviceIDs:v12 isResponse:v6];

  return v6;
}

- (BOOL)sendMessage:(int)a3 withData:(id)a4 forDevices:(id)a5 isResponse:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  dispatch_queue_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = (void *)IDSCopyIDForDevice();
        objc_msgSend(v12, "addObject:", v18, v21);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  BOOL v19 = [(DEDIDSConnection *)self sendMessage:v8 withData:v10 forIDSDeviceIDs:v12 isResponse:v6];
  return v19;
}

- (BOOL)sendMessage:(int)a3 withData:(id)a4 forIDSDeviceIDs:(id)a5 isResponse:(BOOL)a6
{
  BOOL v30 = a6;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v31 = a4;
  id v8 = a5;
  SEL v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v8, "count"));
  id v10 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
  v28 = self;
  id v11 = [(DEDIDSConnection *)self localService];
  v33 = [v11 devices];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    v34 = v10;
    v35 = v9;
    id v32 = v12;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v40 + 1) + 8 * v16);
        if ([v17 hasPrefix:@"device"] && !objc_msgSend(v10, "count"))
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v18 = v33;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v37;
            while (2)
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v37 != v21) {
                  objc_enumerationMutation(v18);
                }
                long long v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                long long v24 = (void *)IDSCopyIDForDevice();
                if ([v17 isEqualToString:v24])
                {
                  if ([v23 isActive] && objc_msgSend(v23, "isConnected"))
                  {
                    [v34 addObject:v24];
                    SEL v9 = v35;
                  }
                  else
                  {
                    SEL v9 = v35;
                    [v35 addObject:v17];
                  }

                  goto LABEL_25;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
              SEL v9 = v35;
              if (v20) {
                continue;
              }
              break;
            }
          }
LABEL_25:

          id v10 = v34;
          id v12 = v32;
        }
        else
        {
          [v9 addObject:v17];
        }
        ++v16;
      }
      while (v16 != v14);
      uint64_t v25 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
      uint64_t v14 = v25;
    }
    while (v25);
  }

  BOOL v26 = [(DEDIDSConnection *)v28 sendMessage:a3 withData:v31 forIDSDeviceIDs:v9 localIDSDeviceIDs:v10 isResponse:v30];
  return v26;
}

- (BOOL)sendMessage:(int)a3 withData:(id)a4 forIDSDeviceIDs:(id)a5 localIDSDeviceIDs:(id)a6 isResponse:(BOOL)a7
{
  BOOL v7 = a7;
  v47[2] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = *MEMORY[0x263F49F80];
  v47[0] = &unk_26D1AF6E0;
  uint64_t v15 = *MEMORY[0x263F49EF8];
  v46[0] = v14;
  v46[1] = v15;
  uint64_t v16 = NSNumber;
  id v17 = a4;
  id v18 = [v16 numberWithBool:a3 == 17];
  v47[1] = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F4A228]) initWithProtobufData:v17 type:(unsigned __int16)a3 isResponse:v7];
  v35 = (void *)v19;
  if ([v12 count])
  {
    uint64_t v21 = [(DEDIDSConnection *)self service];
    id v38 = 0;
    id v39 = 0;
    [v21 sendProtobuf:v20 toDestinations:v12 priority:300 options:v19 identifier:&v39 error:&v38];
    id v22 = v39;
    id v23 = v38;

    long long v24 = DEDIDSConnectionLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = DEDIDSCommandString(a3);
      *(_DWORD *)buf = 136446722;
      long long v41 = v25;
      __int16 v42 = 2114;
      id v43 = v22;
      __int16 v44 = 1024;
      BOOL v45 = v7;
      _os_log_impl(&dword_21FE04000, v24, OS_LOG_TYPE_DEFAULT, "Sending IDS command: [%{public}s] with guid: [%{public}@] is response? [%i]", buf, 0x1Cu);
    }
  }
  else
  {
    id v23 = 0;
    id v22 = 0;
  }
  if ([v13 count])
  {
    BOOL v26 = [(DEDIDSConnection *)self localService];
    id v36 = 0;
    id v37 = 0;
    [v26 sendProtobuf:v20 toDestinations:v13 priority:300 options:v35 identifier:&v37 error:&v36];
    id v27 = v37;
    id v28 = v36;

    v29 = DEDIDSConnectionLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v30 = DEDIDSCommandString(a3);
      *(_DWORD *)buf = 136446722;
      long long v41 = v30;
      __int16 v42 = 2114;
      id v43 = v27;
      __int16 v44 = 1024;
      BOOL v45 = v7;
      _os_log_impl(&dword_21FE04000, v29, OS_LOG_TYPE_DEFAULT, "Sending IDS command: [%{public}s] with guid: [%{public}@] is response? [%i] (local service)", buf, 0x1Cu);
    }
  }
  else
  {
    id v28 = 0;
    id v27 = 0;
  }
  if ([v12 count] && !objc_msgSend(v22, "length"))
  {
    BOOL v31 = 0;
    if (!v23) {
      goto LABEL_22;
    }
  }
  else if ([v13 count])
  {
    BOOL v31 = [v27 length] != 0;
    if (!v23) {
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v31 = 1;
    if (!v23) {
      goto LABEL_22;
    }
  }
  id v32 = DEDIDSConnectionLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    -[DEDIDSConnection sendMessage:withData:forIDSDeviceIDs:localIDSDeviceIDs:isResponse:]((uint64_t)v23, v32);
  }

  BOOL v31 = 0;
LABEL_22:
  if (v28)
  {
    v33 = DEDIDSConnectionLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[DEDIDSConnection sendMessage:withData:forIDSDeviceIDs:localIDSDeviceIDs:isResponse:]((uint64_t)v28, v33);
    }

    BOOL v31 = 0;
  }

  return v31;
}

- (void)ids_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6
{
  v21[4] = *MEMORY[0x263EF8340];
  v20[0] = @"targetDevice";
  v20[1] = @"sessionID";
  v21[0] = a6;
  v21[1] = a3;
  v20[2] = @"config";
  v20[3] = @"callingDevice";
  v21[2] = a4;
  v21[3] = a5;
  id v10 = NSDictionary;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 dictionaryWithObjects:v21 forKeys:v20 count:4];
  uint64_t v16 = +[DEDIDSConnection packPayload:v15];
  id v17 = (void *)MEMORY[0x263EFFA08];
  id v18 = [v11 address];
  uint64_t v19 = [v17 setWithObject:v18];

  [(DEDIDSConnection *)self sendMessage:8 withData:v16 forIDSDeviceIDs:v19 isResponse:0];
}

- (void)ids_didStartBugSessionWithInfo:(id)a3 forID:(id)a4
{
  id v6 = a4;
  id v8 = +[DEDIDSConnection packPayload:a3];
  BOOL v7 = [MEMORY[0x263EFFA08] setWithObject:v6];

  [(DEDIDSConnection *)self sendMessage:9 withData:v8 forIDSDeviceIDs:v7 isResponse:0];
}

- (void)discoverDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDIDSConnection *)self discovery_queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__DEDIDSConnection_discoverDevicesWithCompletion___block_invoke;
  v7[3] = &unk_26453ACE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__DEDIDSConnection_discoverDevicesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v2 = DEDIDSConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Sending device pings", buf, 2u);
  }

  uint64_t v30 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  id v3 = [*(id *)(a1 + 32) service];

  if (v3)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v29 = a1;
    id v4 = [*(id *)(a1 + 32) service];
    id v5 = [v4 devices];

    id v6 = v5;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
    id v8 = (void *)v30;
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v13 = DEDAddressForIDSDevice();
          id v14 = +[DEDDevice idsDeviceWithDevice:v12 address:v13];
          uint64_t v15 = DEDIDSConnectionLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [v12 name];
            id v17 = [v14 idsIdentifier];
            *(_DWORD *)buf = 138478339;
            id v36 = v16;
            __int16 v37 = 2113;
            id v38 = v13;
            __int16 v39 = 2114;
            long long v40 = v17;
            _os_log_impl(&dword_21FE04000, v15, OS_LOG_TYPE_DEFAULT, "Ping sent: device name: %{private}@ targetID: %{private}@ | [%{public}@]", buf, 0x20u);

            id v8 = (void *)v30;
          }

          [v8 addObject:v14];
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v9);
    }

    id v18 = v8;
    uint64_t v19 = *(void **)(v29 + 32);
    uint64_t v20 = [MEMORY[0x263EFF8F8] data];
    uint64_t v21 = (void *)MEMORY[0x263EFFA08];
    id v22 = [*(id *)(v29 + 32) service];
    id v23 = [v22 devices];
    long long v24 = [v21 setWithArray:v23];
    [v19 sendMessage:1 withData:v20 forDevices:v24 isResponse:0];

    uint64_t v25 = *(void *)(v29 + 40);
    BOOL v26 = [MEMORY[0x263EFF8C0] arrayWithArray:v18];
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
  }
  else
  {
    id v27 = DEDIDSConnectionLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __50__DEDIDSConnection_discoverDevicesWithCompletion___block_invoke_cold_1(v27);
    }

    uint64_t v28 = *(void *)(a1 + 40);
    BOOL v26 = objc_opt_new();
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v26);
    id v18 = (void *)v30;
  }
}

- (void)incomingDeviceReceived:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DEDIDSConnectionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 publicLogDescription];
    uint64_t v7 = [v4 identifier];
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "Got device ping for device [%{public}@] identifier: [%{public}@]", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [(DEDIDSConnection *)self deviceStatusCallback];

  if (v8)
  {
    uint64_t v9 = [(DEDIDSConnection *)self deviceStatusCallback];
    (*(void (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, v4, 1);
  }
  else
  {
    uint64_t v9 = DEDIDSConnectionLog();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      -[DEDIDSConnection incomingDeviceReceived:]((os_log_t)v9);
    }
  }
}

- (DEDClientProtocol)remoteSideDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteSideDelegate);
  return (DEDClientProtocol *)WeakRetained;
}

- (void)setRemoteSideDelegate:(id)a3
{
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setService:(id)a3
{
}

- (IDSService)localService
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalService:(id)a3
{
}

- (OS_dispatch_queue)run_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRun_queue:(id)a3
{
}

- (OS_dispatch_queue)discovery_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDiscovery_queue:(id)a3
{
}

- (IDSServiceDelegate)incomingDelegate
{
  return (IDSServiceDelegate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIncomingDelegate:(id)a3
{
}

- (id)deviceStatusCallback
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceStatusCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceStatusCallback, 0);
  objc_storeStrong((id *)&self->_incomingDelegate, 0);
  objc_storeStrong((id *)&self->_discovery_queue, 0);
  objc_storeStrong((id *)&self->_run_queue, 0);
  objc_storeStrong((id *)&self->_localService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_remoteSideDelegate);
}

+ (void)packPayload:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "error archiving payload [%{public}@] with error: [%{public}@]", (uint8_t *)&v3, 0x16u);
}

+ (void)unpackProtobuf:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 type];
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "failed to unpack protobuf [%hu] with error: protobuf or protobuf data is nil ", (uint8_t *)v3, 8u);
}

+ (void)unpackProtobuf:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 67109378;
  v5[1] = [a1 type];
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21FE04000, a3, OS_LOG_TYPE_ERROR, "failed to unpack protobuf data [%hu] with error [%{public}@]", (uint8_t *)v5, 0x12u);
}

- (void)initWithController:.cold.1()
{
}

- (void)initWithController:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "IDSService on DEDIDSConnection initialized.", v1, 2u);
}

- (void)sendMessage:(uint64_t)a1 withData:(NSObject *)a2 forIDSDeviceIDs:localIDSDeviceIDs:isResponse:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Error sending protobuf locally: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

- (void)sendMessage:(uint64_t)a1 withData:(NSObject *)a2 forIDSDeviceIDs:localIDSDeviceIDs:isResponse:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Error sending protobuf: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

void __50__DEDIDSConnection_discoverDevicesWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "No IDS service configured", v1, 2u);
}

- (void)incomingDeviceReceived:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "device discovery callback block is nil, DED will miss device updates", v1, 2u);
}

@end