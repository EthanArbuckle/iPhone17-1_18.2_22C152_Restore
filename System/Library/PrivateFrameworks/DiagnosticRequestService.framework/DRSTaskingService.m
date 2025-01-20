@interface DRSTaskingService
+ (BOOL)serviceIsEnabled;
+ (id)databaseDirectory;
+ (id)sharedInstance;
- (BOOL)activateService;
- (DRSTaskingEventPublisher)eventPublisher;
- (DRSTaskingManager)taskingManager;
- (DRSTaskingService)init;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_semaphore)serviceDeactivatedSem;
- (OS_xpc_object)serviceConnection;
- (unsigned)state;
- (void)_applyCloudChannelConfig:(id)a3 dueToMessage:(id)a4 state:(id)a5 messageType:(unint64_t)a6;
- (void)_checkForDefaultSubscriptionUpdate;
- (void)_configureInvalidationXPCActivity;
- (void)_handleBroadcastRequestMessaage:(id)a3 state:(id)a4;
- (void)_handleClearTaskingStateMessage:(id)a3 state:(id)a4;
- (void)_handleCloudChannelConfigGet:(id)a3 state:(id)a4;
- (void)_handleCloudChannelConfigReset:(id)a3 state:(id)a4;
- (void)_handleCloudChannelConfigSet:(id)a3 state:(id)a4;
- (void)_handleConfigCompletionMessage:(id)a3 state:(id)a4;
- (void)_handleConfigStateMessage:(id)a3 state:(id)a4;
- (void)_handleInvalidMessage:(id)a3 state:(id)a4;
- (void)_handleJSONTaskingSystemMessage:(id)a3 state:(id)a4 transaction:(id)a5;
- (void)_sendClearStateReplyForMessage:(id)a3 rejectionReason:(const char *)a4;
- (void)_sendConfigStateReplyForMessage:(id)a3 rejectionReason:(const char *)a4 state:(unsigned __int8)a5 completionType:(unint64_t)a6;
- (void)_sendReplyForMessage:(id)a3 replyType:(unint64_t)a4 rejectionReason:(const char *)a5;
- (void)_waitForDeviceUnlockAndInitializeServiceState;
- (void)deactivateService;
- (void)dealloc;
- (void)handleRequest:(id)a3 state:(id)a4;
@end

@implementation DRSTaskingService

+ (id)databaseDirectory
{
  return @"/private/var/mobile/Library/DiagnosticPipeline";
}

+ (BOOL)serviceIsEnabled
{
  if (serviceIsEnabled_onceToken != -1) {
    dispatch_once(&serviceIsEnabled_onceToken, &__block_literal_global_2);
  }
  return serviceIsEnabled_isEnabled;
}

void __37__DRSTaskingService_serviceIsEnabled__block_invoke()
{
  v0 = +[DRSSystemProfile sharedInstance];
  int v1 = [v0 isTaskingEnabled];

  if (v1)
  {
    serviceIsEnabled_isEnabled = 0;
    v2 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v3 = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingServiceDisabled", "Tasking Service is disabled due to being Carrier", v3, 2u);
    }
  }
  else
  {
    serviceIsEnabled_isEnabled = 1;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_55);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __35__DRSTaskingService_sharedInstance__block_invoke()
{
  DRSRegisterForDeviceUnlockNotification();
  v0 = objc_alloc_init(DRSTaskingService);
  int v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (void)dealloc
{
  [(DRSTaskingService *)self deactivateService];
  v3.receiver = self;
  v3.super_class = (Class)DRSTaskingService;
  [(DRSTaskingService *)&v3 dealloc];
}

- (void)deactivateService
{
  if ([(DRSTaskingService *)self state] == 2)
  {
    objc_super v3 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v3))
    {
      __int16 v9 = 0;
      v4 = "RedundantTaskingServiceDeactivation";
      v5 = "Tried to deactivate already deactivated service";
      v6 = (uint8_t *)&v9;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v4, v5, v6, 2u);
    }
  }
  else
  {
    self->_state = 2;
    v7 = [(DRSTaskingService *)self serviceConnection];
    xpc_connection_cancel(v7);

    objc_super v3 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v3))
    {
      __int16 v8 = 0;
      v4 = "TaskingServiceDeactivated";
      v5 = (const char *)&unk_209EEADD1;
      v6 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }
}

- (void)_configureInvalidationXPCActivity
{
  objc_super v3 = DPLogHandle_ServiceTasking();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfiguringTaskingInvalidationXPCActivity", (const char *)&unk_209EEADD1, buf, 2u);
  }

  v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __54__DRSTaskingService__configureInvalidationXPCActivity__block_invoke;
  handler[3] = &unk_263FC9968;
  handler[4] = self;
  xpc_activity_register("com.apple.diagnosticpipeline.tasking_invalidation_activity", v4, handler);
}

void __54__DRSTaskingService__configureInvalidationXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  v4 = (void *)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    v12 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TaskingInvalidationActivity", (const char *)&unk_209EEADD1, buf, 2u);
    }

    if (!DRSDeviceIsUnlocked())
    {
      v16 = DPLogHandle_ServiceTasking();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TaskingInvalidationActivityBailing to avoid waiting for device unlock", (const char *)&unk_209EEADD1, buf, 2u);
      }

      v14 = v3;
      xpc_activity_state_t v15 = 5;
      goto LABEL_19;
    }
    [*(id *)(a1 + 32) _waitForDeviceUnlockAndInitializeServiceState];
    if (xpc_activity_should_defer(v3))
    {
      v13 = DPLogHandle_ServiceTasking();
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TaskingInvalidationActivityImmediate deferral", (const char *)&unk_209EEADD1, buf, 2u);
      }

      v14 = v3;
      xpc_activity_state_t v15 = 3;
LABEL_19:
      xpc_activity_set_state(v14, v15);
      goto LABEL_20;
    }
    v17 = [*(id *)(a1 + 32) taskingManager];
    id v24 = 0;
    char v18 = [v17 checkConfigsForInvalidation:&v24];
    v7 = v24;

    v19 = DPLogHandle_ServiceTasking();
    BOOL v20 = os_signpost_enabled(v19);
    if (v18)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        v21 = "Success!";
        v22 = v19;
        uint32_t v23 = 2;
LABEL_26:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TaskingInvalidationActivity", v21, buf, v23);
      }
    }
    else if (v20)
    {
      *(_DWORD *)buf = 138543362;
      v26 = v7;
      v21 = "Invalidation check failed due to error: %{public}@";
      v22 = v19;
      uint32_t v23 = 12;
      goto LABEL_26;
    }

    xpc_activity_set_state(v3, 5);
    goto LABEL_15;
  }
  xpc_activity_state_t v6 = state;
  if (state)
  {
    v7 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134217984;
      v26 = v6;
      __int16 v8 = "TaskingInvalidationXPCActivityUnknownState";
      __int16 v9 = "Unknown XPC activity state %ld";
      v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_14;
    }
  }
  else
  {
    v7 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      __int16 v8 = "TaskingInvalidationXPCActivityCheckIn";
      __int16 v9 = (const char *)&unk_209EEADD1;
      v10 = v7;
      uint32_t v11 = 2;
LABEL_14:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, buf, v11);
    }
  }
LABEL_15:

LABEL_20:
}

- (BOOL)activateService
{
  [(DRSTaskingService *)self _configureXPCActivities];
  objc_super v3 = [(DRSTaskingService *)self messageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__DRSTaskingService_activateService__block_invoke;
  block[3] = &unk_263FC9990;
  block[4] = self;
  dispatch_sync(v3, block);

  return 1;
}

void __36__DRSTaskingService_activateService__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) state])
  {
    v2 = DPLogHandle_ServiceTaskingError();
    if (os_signpost_enabled(v2))
    {
      objc_super v3 = DRSStringForServiceState([*(id *)(a1 + 32) state]);
      int v5 = 138543362;
      xpc_activity_state_t v6 = v3;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RedundantServiceActivation", "Tried to activate while in state: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    v4 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v5) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingServiceActivation", (const char *)&unk_209EEADD1, (uint8_t *)&v5, 2u);
    }

    v2 = [*(id *)(a1 + 32) serviceConnection];
    xpc_connection_activate((xpc_connection_t)v2);
  }
}

- (void)_sendReplyForMessage:(id)a3 replyType:(unint64_t)a4 rejectionReason:(const char *)a5
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", a4);
  if (a5) {
    xpc_dictionary_set_string(reply, "TaskingAdminRequest_RejectionReason", a5);
  }
  xpc_dictionary_get_remote_connection(xdict);
  __int16 v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v8, reply);
}

- (void)_handleJSONTaskingSystemMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 hasAdminEntitlement])
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v8, "JSONData", &length);
    BOOL v12 = xpc_dictionary_get_BOOL(v8, "emitCATelemetry");
    if (data) {
      BOOL v13 = length == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      BOOL v17 = v12;
      id v18 = objc_alloc(MEMORY[0x263EFF8F8]);
      v19 = [v18 initWithBytes:data length:length];
      BOOL v20 = [(DRSTaskingService *)self taskingManager];
      char v21 = [v20 processTaskingSystemMessageJSONData:v19 transaction:v10 shouldEmitCATelemetry:v17];

      if (v21)
      {
        [(DRSTaskingService *)self _sendReplyForMessage:v8 replyType:1 rejectionReason:0];
        v14 = DPLogHandle_ServiceTaskingXPC();
        if (os_signpost_enabled(v14))
        {
          v22 = [v9 stateDescription];
          *(_DWORD *)buf = 138543362;
          uint64_t v27 = v22;
          uint32_t v23 = "TaskingSystemMessage_AcceptedJSON";
          id v24 = "Accepted tasking system JSON message from %{public}@";
LABEL_17:
          _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v23, v24, buf, 0xCu);
        }
      }
      else
      {
        [(DRSTaskingService *)self _sendReplyForMessage:v8 replyType:1 rejectionReason:"Invalid JSON in message"];
        v14 = DPLogHandle_ServiceTaskingXPCError();
        if (os_signpost_enabled(v14))
        {
          v22 = [v9 stateDescription];
          *(_DWORD *)buf = 138543362;
          uint64_t v27 = v22;
          uint32_t v23 = "TaskingSystemMessage_BadJSON";
          id v24 = "Rejecting tasking system message from %{public}@ due to incorrect JSON format";
          goto LABEL_17;
        }
      }
LABEL_18:

      goto LABEL_19;
    }
    [(DRSTaskingService *)self _sendReplyForMessage:v8 replyType:1 rejectionReason:"Invalid data buffer in message"];
    v19 = DPLogHandle_ServiceTaskingXPCError();
    if (os_signpost_enabled(v19))
    {
      v14 = [v9 stateDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v14;
      xpc_activity_state_t v15 = "TaskingSystemMessage_BadData";
      v16 = "Rejecting tasking system message from %{public}@ due to bad or missing JSON data field";
LABEL_11:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v15, v16, buf, 0xCu);
      goto LABEL_18;
    }
  }
  else
  {
    [(DRSTaskingService *)self _sendReplyForMessage:v8 replyType:1 rejectionReason:"Missing required entitlement"];
    v19 = DPLogHandle_ServiceTaskingXPCError();
    if (os_signpost_enabled(v19))
    {
      v14 = [v9 stateDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v14;
      xpc_activity_state_t v15 = "TaskingSystemMessage_Rejected";
      v16 = "Rejecting tasking system message from %{public}@ due to missing entitlement";
      goto LABEL_11;
    }
  }
LABEL_19:
}

- (void)_sendConfigStateReplyForMessage:(id)a3 rejectionReason:(const char *)a4 state:(unsigned __int8)a5 completionType:(unint64_t)a6
{
  unsigned int v7 = a5;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = DPLogHandle_ServiceTaskingXPCError();
  if (os_signpost_enabled(v10))
  {
    uint64_t v11 = DRConfigStringForState();
    BOOL v12 = (void *)v11;
    BOOL v13 = "Accepted";
    if (a4) {
      BOOL v13 = a4;
    }
    int v16 = 138543618;
    uint64_t v17 = v11;
    __int16 v18 = 2082;
    v19 = v13;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigStateReply", "Replying with %{public}@ %{public}s", (uint8_t *)&v16, 0x16u);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v9);
  xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", 2uLL);
  if (a4)
  {
    xpc_dictionary_set_string(reply, "TaskingAdminRequest_RejectionReason", a4);
  }
  else
  {
    xpc_dictionary_set_uint64(reply, "configState", v7);
    xpc_dictionary_set_uint64(reply, "completionType", a6);
  }
  xpc_dictionary_get_remote_connection(v9);
  xpc_activity_state_t v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v15, reply);
}

- (void)_handleConfigStateMessage:(id)a3 state:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  string = xpc_dictionary_get_string(v6, "teamID");
  if (string)
  {
    id v9 = [NSString stringWithUTF8String:string];
    if (([v7 hasAdminEntitlement] & 1) != 0
      || (xpc_dictionary_get_remote_connection(v6),
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v7 hasTeamIDEntitlement:v9 connection:v10],
          v10,
          (v11 & 1) != 0))
    {
      BOOL v12 = xpc_dictionary_get_string(v6, "configUUID");
      if (v12)
      {
        BOOL v13 = v12;
        v14 = [NSString stringWithUTF8String:v12];
        xpc_activity_state_t v15 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v14];
        if (v15)
        {
          int v16 = [(DRSTaskingService *)self taskingManager];
          id v40 = 0;
          uint64_t v17 = [v16 metadataForConfigUUID:v15 teamID:v9 errorOut:&v40];
          id v18 = v40;

          if (v18)
          {
            v39 = v17;
            v19 = DPLogHandle_ServiceTaskingXPCError();
            if (os_signpost_enabled(v19))
            {
              uint64_t v20 = [v18 localizedDescription];
              *(_DWORD *)buf = 138543362;
              v42 = v20;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Lookup error %{public}@", buf, 0xCu);
            }
            char v21 = NSString;
            v22 = [v18 localizedDescription];
            uint32_t v23 = [v21 stringWithFormat:@"DB lookup error: %@", v22];

            id v24 = v23;
            -[DRSTaskingService _sendConfigStateReplyForMessage:rejectionReason:state:completionType:](self, "_sendConfigStateReplyForMessage:rejectionReason:state:completionType:", v6, [v24 UTF8String], 0, 0);

            uint64_t v17 = v39;
          }
          else
          {
            v30 = DPLogHandle_ServiceTaskingXPC();
            BOOL v31 = os_signpost_enabled(v30);
            if (v17)
            {
              if (v31)
              {
                [v17 state];
                DRConfigStringForState();
                v32 = v17;
                v33 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v42 = v33;
                __int16 v43 = 2114;
                v44 = v9;
                __int16 v45 = 2114;
                v46 = v15;
                _os_signpost_emit_with_name_impl(&dword_209E70000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateMessageSuccess", "Got state '%{public}@' for team ID %{public}@, config UUID %{public}@", buf, 0x20u);

                uint64_t v17 = v32;
              }

              uint64_t v34 = [v17 state];
              uint64_t v35 = [v17 completionType];
              v36 = self;
              id v37 = v6;
              uint64_t v38 = v34;
            }
            else
            {
              if (v31)
              {
                *(_DWORD *)buf = 138543618;
                v42 = (const char *)v9;
                __int16 v43 = 2114;
                v44 = v15;
                _os_signpost_emit_with_name_impl(&dword_209E70000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateMessageSuccess", "Unknown state for team ID %{public}@, config UUID %{public}@", buf, 0x16u);
              }

              v36 = self;
              id v37 = v6;
              uint64_t v38 = 0;
              uint64_t v35 = 0;
            }
            [(DRSTaskingService *)v36 _sendConfigStateReplyForMessage:v37 rejectionReason:0 state:v38 completionType:v35];
          }
        }
        else
        {
          v29 = DPLogHandle_ServiceTaskingXPCError();
          if (os_signpost_enabled(v29))
          {
            *(_DWORD *)buf = 136446210;
            v42 = v13;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Invalid UUID string %{public}s", buf, 0xCu);
          }

          [(DRSTaskingService *)self _sendConfigStateReplyForMessage:v6 rejectionReason:"Invalid config UUID string" state:0 completionType:0];
        }

        goto LABEL_33;
      }
      v26 = DPLogHandle_ServiceTaskingXPCError();
      if (os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Missing UUID field", buf, 2u);
      }

      uint64_t v27 = "No Config UUID";
    }
    else
    {
      uint64_t v28 = DPLogHandle_ServiceTaskingXPCError();
      if (os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Not properly entitled", buf, 2u);
      }

      uint64_t v27 = "Not properly entitled";
    }
    [(DRSTaskingService *)self _sendConfigStateReplyForMessage:v6 rejectionReason:v27 state:0 completionType:0];
LABEL_33:

    goto LABEL_34;
  }
  v25 = DPLogHandle_ServiceTaskingXPCError();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetConfigStateError", "Missing teamID field", buf, 2u);
  }

  [(DRSTaskingService *)self _sendConfigStateReplyForMessage:v6 rejectionReason:"No teamID" state:0 completionType:0];
LABEL_34:
}

- (void)_sendClearStateReplyForMessage:(id)a3 rejectionReason:(const char *)a4
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", 3uLL);
  if (a4) {
    xpc_dictionary_set_string(reply, "TaskingAdminRequest_RejectionReason", a4);
  }
  xpc_dictionary_get_remote_connection(xdict);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v6, reply);
}

- (void)_handleClearTaskingStateMessage:(id)a3 state:(id)a4
{
  id v6 = a3;
  if (([a4 hasAdminEntitlement] & 1) == 0)
  {
    char v11 = "Missing required entitlement";
LABEL_6:
    id v9 = self;
    id v10 = v6;
    goto LABEL_7;
  }
  id v7 = [(DRSTaskingService *)self taskingManager];
  uint64_t v12 = 0;
  char v8 = [v7 clearTaskingHistoryWithErrorOut:&v12];

  if ((v8 & 1) == 0)
  {
    char v11 = "Clear failed";
    goto LABEL_6;
  }
  id v9 = self;
  id v10 = v6;
  char v11 = 0;
LABEL_7:
  [(DRSTaskingService *)v9 _sendClearStateReplyForMessage:v10 rejectionReason:v11];
}

- (void)_handleConfigCompletionMessage:(id)a3 state:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  string = xpc_dictionary_get_string(v6, "teamID");
  if (string)
  {
    id v9 = string;
    id v10 = xpc_dictionary_get_remote_connection(v6);
    char v11 = [NSString stringWithUTF8String:v9];
    if (([v7 hasAdminEntitlement] & 1) != 0
      || ([v7 hasTeamIDEntitlement:v11 connection:v10] & 1) != 0)
    {
      uint64_t v12 = xpc_dictionary_get_string(v6, "configUUID");
      if (v12)
      {
        BOOL v13 = [NSString stringWithUTF8String:v12];
        v14 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];

        if (v14)
        {
          BOOL v15 = xpc_dictionary_get_BOOL(v6, "isRejected");
          int v16 = [(DRSTaskingService *)self taskingManager];
          uint64_t v17 = v16;
          if (v15) {
            [v16 clientRejectsConfigUUID:v14 teamID:v11];
          }
          else {
            [v16 clientCompletedConfigUUID:v14 teamID:v11];
          }

          [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:4 rejectionReason:0];
          goto LABEL_17;
        }
      }
      [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:4 rejectionReason:"Invalid UUID"];
      v14 = DPLogHandle_ServiceTaskingXPCError();
      if (os_signpost_enabled(v14))
      {
        id v18 = [v7 stateDescription];
        int v20 = 138543362;
        char v21 = v18;
        v19 = "Invalid UUID from client %{public}@";
LABEL_14:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigCompletionMessageMissingEntitlement", v19, (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:4 rejectionReason:"Not entitled"];
      v14 = DPLogHandle_ServiceTaskingXPCError();
      if (os_signpost_enabled(v14))
      {
        id v18 = [v7 stateDescription];
        int v20 = 138543362;
        char v21 = v18;
        v19 = "Insufficient entitlements for client %{public}@";
        goto LABEL_14;
      }
    }
LABEL_17:

    goto LABEL_18;
  }
  [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:4 rejectionReason:"No teamID provided"];
  id v10 = DPLogHandle_ServiceTaskingXPCError();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigCompletionMessageMissingTeamID", "No team ID provided in message", (uint8_t *)&v20, 2u);
  }
LABEL_18:
}

- (void)_handleBroadcastRequestMessaage:(id)a3 state:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  string = xpc_dictionary_get_string(v6, "teamID");
  if (string)
  {
    id v9 = string;
    id v10 = xpc_dictionary_get_remote_connection(v6);
    char v11 = [NSString stringWithUTF8String:v9];
    if (([v7 hasAdminEntitlement] & 1) != 0
      || ([v7 hasTeamIDEntitlement:v11 connection:v10] & 1) != 0)
    {
      uint64_t v12 = [(DRSTaskingService *)self eventPublisher];
      [v12 publishCurrentConfigForTeamID:v11];

      [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:5 rejectionReason:0];
      BOOL v13 = DPLogHandle_ServiceTaskingXPC();
      if (os_signpost_enabled(v13))
      {
        LOWORD(v15) = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestMessageSuccess", (const char *)&unk_209EEADD1, (uint8_t *)&v15, 2u);
      }
    }
    else
    {
      [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:5 rejectionReason:"Not entitled"];
      BOOL v13 = DPLogHandle_ServiceTaskingXPCError();
      if (os_signpost_enabled(v13))
      {
        v14 = [v7 stateDescription];
        int v15 = 138543362;
        int v16 = v14;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestMessageMissingEntitlement", "Insufficient entitlements for client %{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:5 rejectionReason:"No teamID provided"];
    id v10 = DPLogHandle_ServiceTaskingXPCError();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestMessageMissingTeamID", "No team ID provided in message", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)_handleCloudChannelConfigGet:(id)a3 state:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasAdminEntitlement])
  {
    char v8 = [(DRSTaskingService *)self taskingManager];
    id v9 = [v8 persistedCloudChannelConfig];

    if (v9)
    {
      id v10 = [v9 debugDescription];
    }
    else
    {
      id v10 = @"Not subscribed";
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", 6uLL);
    BOOL v13 = v10;
    xpc_dictionary_set_string(reply, "description", (const char *)[(__CFString *)v13 UTF8String]);
    if (v9)
    {
      xpc_dictionary_set_uint64(reply, "platform", [v9 platform]);
      xpc_dictionary_set_uint64(reply, "type", [v9 type]);
      xpc_dictionary_set_uint64(reply, "environment", [v9 environment]);
      xpc_dictionary_set_BOOL(reply, "overridesDeviceDefault", [v9 overridesDeviceDefault]);
      xpc_dictionary_set_BOOL(reply, "hasConfig", 1);
      v14 = [(DRSTaskingService *)self taskingManager];
      xpc_dictionary_set_BOOL(reply, "dropsMessages", [v14 isTaskingEnabled] != 1);

      int v15 = [v9 populationSliceNumber];

      if (v15)
      {
        int v16 = [v9 populationSliceNumber];
        xpc_dictionary_set_uint64(reply, "populationSliceNumber", [v16 unsignedLongLongValue]);
      }
    }
    xpc_dictionary_get_remote_connection(v6);
    uint64_t v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v17, reply);
  }
  else
  {
    [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:6 rejectionReason:"Not entitled"];
    id v9 = DPLogHandle_ServiceTaskingXPCError();
    if (os_signpost_enabled(v9))
    {
      char v11 = [v7 stateDescription];
      int v18 = 138543362;
      v19 = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigGetMissingEntitlement", "Insufficient entitlements for client %{public}@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)_applyCloudChannelConfig:(id)a3 dueToMessage:(id)a4 state:(id)a5 messageType:(unint64_t)a6
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [(DRSTaskingService *)self taskingManager];
  v14 = [v13 taskingMessageChannel];
  int v15 = v14;
  v84 = v10;
  if (v10)
  {
    unint64_t v16 = a6;
    uint64_t v17 = [v14 config];
    if (v17)
    {
      int v18 = (void *)v17;
      [(DRSTaskingService *)self taskingManager];
      v82 = self;
      uint64_t v20 = v19 = v12;
      [v20 taskingMessageChannel];
      v22 = id v21 = v11;
      uint32_t v23 = [v22 config];
      int v24 = [v23 isEqual:v84];

      id v11 = v21;
      id v12 = v19;
      self = v82;

      a6 = v16;
      if (v24)
      {
        v25 = DPLogHandle_ServiceTaskingXPC();
        if (os_signpost_enabled(v25))
        {
          v26 = [v12 stateDescription];
          uint64_t v27 = [v84 debugDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v89 = (uint64_t)v26;
          __int16 v90 = 2114;
          v91 = v27;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AlreadySubscribed", "Client %{public}@ requested subscription to %{public}@, but we are already subscribed to that channel", buf, 0x16u);
        }
LABEL_9:

        [(DRSTaskingService *)self _sendReplyForMessage:v11 replyType:a6 rejectionReason:0];
        goto LABEL_47;
      }
    }
    else
    {
    }
  }
  else
  {

    if (!v15)
    {
      v25 = DPLogHandle_ServiceTaskingXPC();
      if (os_signpost_enabled(v25))
      {
        uint64_t v28 = [v12 stateDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v89 = (uint64_t)v28;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AlreadyNotSubscribed", "Client %{public}@ requested unsubscription, but we are already not subscribed to any channel", buf, 0xCu);
      }
      goto LABEL_9;
    }
  }
  v29 = [(DRSTaskingService *)self taskingManager];
  id v87 = 0;
  char v30 = [v29 unsubscribeFromSubscribedChannelWithErrorOut:&v87];
  BOOL v31 = (__CFString *)v87;

  if (v30)
  {

    v32 = [(DRSTaskingService *)self taskingManager];
    id v86 = 0;
    char v33 = [v32 updatePersistedChannelConfig:v84 errorOut:&v86];
    uint64_t v34 = (__CFString *)v86;

    if (v33)
    {

      uint64_t v35 = [(DRSTaskingService *)self taskingManager];
      id v85 = 0;
      char v36 = [v35 subscribeToChannelWithConfig:v84 errorOut:&v85];
      uint64_t v34 = (__CFString *)v85;

      if (v36)
      {
        id v37 = DPLogHandle_ServiceTaskingXPC();
        if (os_signpost_enabled(v37))
        {
          uint64_t v38 = [(DRSTaskingService *)self taskingManager];
          v39 = [v38 taskingMessageChannel];
          [v39 debugDescription];
          v41 = unint64_t v40 = a6;
          *(_DWORD *)buf = 138543362;
          uint64_t v89 = (uint64_t)v41;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelSubscriptionUpdateSucceeded", "Subscribe to cloud channel: %{public}@", buf, 0xCu);

          a6 = v40;
        }

        [(DRSTaskingService *)self _sendReplyForMessage:v11 replyType:a6 rejectionReason:0];
        goto LABEL_46;
      }
      v74 = NSString;
      uint64_t v75 = [(__CFString *)v34 localizedDescription];
      v76 = (void *)v75;
      if (v75) {
        v77 = (__CFString *)v75;
      }
      else {
        v77 = @"Unknown";
      }
      v78 = [v74 stringWithFormat:@"Subscription failed due to error %@", v77];

      id v66 = v78;
      -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v11, a6, [v66 UTF8String]);
      v67 = DPLogHandle_ServiceTaskingXPCError();
      if (!os_signpost_enabled(v67))
      {
LABEL_45:

LABEL_46:
        goto LABEL_47;
      }
      uint64_t v79 = [v84 debugDescription];
      v69 = (void *)v79;
      v80 = @"(Default)";
      if (v79) {
        v80 = (__CFString *)v79;
      }
      if (v34) {
        v81 = v34;
      }
      else {
        v81 = @"Unknown";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v89 = (uint64_t)v80;
      __int16 v90 = 2114;
      v91 = v81;
      v72 = "CloudChannelSubscriptionFailed";
      v73 = "Failed to subscribe to cloud channel configuration: %{public}@ due to error %{public}@";
    }
    else
    {
      v61 = NSString;
      uint64_t v62 = [(__CFString *)v34 localizedDescription];
      v63 = (void *)v62;
      if (v62) {
        v64 = (__CFString *)v62;
      }
      else {
        v64 = @"Unknown";
      }
      v65 = [v61 stringWithFormat:@"Failed to update persisted cloud channel config due to error %@", v64];

      id v66 = v65;
      -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v11, a6, [v66 UTF8String]);
      v67 = DPLogHandle_ServiceTaskingXPCError();
      if (!os_signpost_enabled(v67)) {
        goto LABEL_45;
      }
      uint64_t v68 = [v84 debugDescription];
      v69 = (void *)v68;
      v70 = @"(None)";
      if (v68) {
        v70 = (__CFString *)v68;
      }
      if (v34) {
        v71 = v34;
      }
      else {
        v71 = @"Unknown";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v89 = (uint64_t)v70;
      __int16 v90 = 2114;
      v91 = v71;
      v72 = "PersistCloudChannelConfigurationFailed";
      v73 = "Failed to persist cloud channel configuration: %{public}@ due to error %{public}@";
    }
    _os_signpost_emit_with_name_impl(&dword_209E70000, v67, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v72, v73, buf, 0x16u);

    goto LABEL_45;
  }
  id v83 = v12;
  v42 = NSString;
  __int16 v43 = [(DRSTaskingService *)self taskingManager];
  v44 = [v43 taskingMessageChannel];
  [v44 config];
  v46 = unint64_t v45 = a6;
  uint64_t v47 = [v46 debugDescription];
  uint64_t v48 = [(__CFString *)v31 localizedDescription];
  id v49 = v11;
  v50 = (void *)v48;
  v51 = @"Unknown";
  if (v48) {
    v51 = (__CFString *)v48;
  }
  v52 = [v42 stringWithFormat:@"Failed to unsubscribe from cloud channel %@ due to error %@", v47, v51];

  id v11 = v49;
  id v53 = v52;
  -[DRSTaskingService _sendReplyForMessage:replyType:rejectionReason:](self, "_sendReplyForMessage:replyType:rejectionReason:", v49, v45, [v53 UTF8String]);
  v54 = DPLogHandle_ServiceTaskingXPCError();
  if (os_signpost_enabled(v54))
  {
    v55 = [(DRSTaskingService *)self taskingManager];
    v56 = [v55 taskingMessageChannel];
    v57 = [v56 config];
    uint64_t v58 = [v57 debugDescription];
    v59 = (void *)v58;
    v60 = @"Unknown";
    if (v31) {
      v60 = v31;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v89 = v58;
    __int16 v90 = 2114;
    v91 = v60;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v54, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnsubscribeFailed", "Failed to unsubscribe from configuration: %{public}@ due to error %{public}@", buf, 0x16u);
  }
  id v12 = v83;
LABEL_47:
}

- (void)_handleCloudChannelConfigSet:(id)a3 state:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasAdminEntitlement])
  {
    if (xpc_dictionary_get_BOOL(v6, "noSubscription"))
    {
      p_super = [[DRSCloudChannelConfig alloc] initNoSubscriptionConfig:1];
LABEL_15:
      [(DRSTaskingService *)self _applyCloudChannelConfig:p_super dueToMessage:v6 state:v7 messageType:7];
      goto LABEL_16;
    }
    unsigned __int8 uint64 = xpc_dictionary_get_uint64(v6, "platform");
    unsigned __int8 v11 = xpc_dictionary_get_uint64(v6, "type");
    unsigned __int8 v12 = xpc_dictionary_get_uint64(v6, "environment");
    BOOL v13 = xpc_dictionary_get_value(v6, "populationSliceNumber");

    if (v13)
    {
      p_super = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v6, "populationSliceNumber"));
    }
    else
    {
      v14 = +[DRSCloudChannelConfig sliceCountForPlatform:uint64 channelType:v11];
      int v15 = v14;
      if (v14)
      {
        p_super = objc_msgSend(NSNumber, "numberWithUnsignedShort:", +[DRSCloudChannelConfig populationSliceForDevice:](DRSCloudChannelConfig, "populationSliceForDevice:", objc_msgSend(v14, "unsignedShortValue")));
      }
      else
      {
        p_super = 0;
      }
    }
    unint64_t v16 = [[DRSCloudChannelConfig alloc] initWithValidPlatform:uint64 channelType:v11 environment:v12 populationSliceNumber:p_super overridesDeviceDefault:1];
    if (v16)
    {
      uint64_t v17 = v16;

      p_super = &v17->super;
      goto LABEL_15;
    }
    [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:7 rejectionReason:"Invalid or unsupported channel configuration"];
    id v9 = DPLogHandle_ServiceTaskingXPCError();
    if (os_signpost_enabled(v9))
    {
      int v18 = DRSSystemProfilePlatformStringForPlatform(uint64);
      id v19 = +[DRSCloudChannelConfig stringForEnvironment:v12];
      uint64_t v20 = +[DRSCloudChannelConfig stringForChannelType:v11];
      id v21 = (void *)v20;
      int v23 = 138544130;
      uint64_t v22 = @"None";
      int v24 = v18;
      if (p_super) {
        uint64_t v22 = (__CFString *)p_super;
      }
      __int16 v25 = 2114;
      v26 = v19;
      __int16 v27 = 2114;
      uint64_t v28 = v20;
      __int16 v29 = 2114;
      char v30 = v22;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetCloudChannelConfigurationInvalid", "Invalid cloud channel configuration: %{public}@ %{public}@ %{public}@ %{public}@", (uint8_t *)&v23, 0x2Au);
    }
    goto LABEL_6;
  }
  [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:7 rejectionReason:"Not entitled"];
  p_super = DPLogHandle_ServiceTaskingXPCError();
  if (os_signpost_enabled(p_super))
  {
    id v9 = [v7 stateDescription];
    int v23 = 138543362;
    int v24 = v9;
    _os_signpost_emit_with_name_impl(&dword_209E70000, p_super, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigSetMissingEntitlement", "Insufficient entitlements for client %{public}@", (uint8_t *)&v23, 0xCu);
LABEL_6:
  }
LABEL_16:
}

- (void)_handleCloudChannelConfigReset:(id)a3 state:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasAdminEntitlement])
  {
    char v8 = +[DRSCloudChannelConfig staticSnapshotDeviceDefaultCloudChannelConfig];
    [(DRSTaskingService *)self _applyCloudChannelConfig:v8 dueToMessage:v6 state:v7 messageType:8];
  }
  else
  {
    [(DRSTaskingService *)self _sendReplyForMessage:v6 replyType:8 rejectionReason:"Not entitled"];
    id v9 = DPLogHandle_ServiceTaskingXPCError();
    if (os_signpost_enabled(v9))
    {
      id v10 = [v7 stateDescription];
      int v11 = 138543362;
      unsigned __int8 v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigResetMissingEntitlement", "Insufficient entitlements for client %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_handleInvalidMessage:(id)a3 state:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = DPLogHandle_ServiceTaskingXPCError();
  if (os_signpost_enabled(v7))
  {
    char v8 = [v5 stateDescription];
    int v11 = 138543362;
    unsigned __int8 v12 = v8;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRequest", "Received invalid message from client %{public}@", (uint8_t *)&v11, 0xCu);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  xpc_dictionary_set_uint64(reply, "TaskingServiceReplyType", 0);
  xpc_dictionary_set_string(reply, "TaskingAdminRequest_RejectionReason", "Unknown, missing, or invalid client message type");
  xpc_dictionary_get_remote_connection(v6);
  id v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v10, reply);
}

- (void)handleRequest:(id)a3 state:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x21050DCE0]();
  char v8 = (void *)os_transaction_create();
  switch(xpc_dictionary_get_uint64(xdict, "TaskingClientMessageType"))
  {
    case 0uLL:
      [(DRSTaskingService *)self _handleInvalidMessage:xdict state:v6];
      break;
    case 1uLL:
      [(DRSTaskingService *)self _handleJSONTaskingSystemMessage:xdict state:v6 transaction:v8];
      break;
    case 2uLL:
      [(DRSTaskingService *)self _handleConfigStateMessage:xdict state:v6];
      break;
    case 3uLL:
      [(DRSTaskingService *)self _handleClearTaskingStateMessage:xdict state:v6];
      break;
    case 4uLL:
      [(DRSTaskingService *)self _handleConfigCompletionMessage:xdict state:v6];
      break;
    case 5uLL:
      [(DRSTaskingService *)self _handleBroadcastRequestMessaage:xdict state:v6];
      break;
    case 6uLL:
      [(DRSTaskingService *)self _handleCloudChannelConfigGet:xdict state:v6];
      break;
    case 7uLL:
      [(DRSTaskingService *)self _handleCloudChannelConfigSet:xdict state:v6];
      break;
    case 8uLL:
      [(DRSTaskingService *)self _handleCloudChannelConfigReset:xdict state:v6];
      break;
    default:
      break;
  }
}

- (void)_checkForDefaultSubscriptionUpdate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_209E70000, v0, v1, "ERROR: Failed to unsubscribe to channel due to error %{public}@", v2, v3, v4, v5, v6);
}

- (void)_waitForDeviceUnlockAndInitializeServiceState
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke;
  block[3] = &unk_263FC9990;
  block[4] = self;
  if (_waitForDeviceUnlockAndInitializeServiceState_onceToken != -1) {
    dispatch_once(&_waitForDeviceUnlockAndInitializeServiceState_onceToken, block);
  }
}

void __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  DRSWaitForDeviceUnlock();
  uint64_t v2 = [(id)objc_opt_class() databaseDirectory];
  uint64_t v3 = DPLogHandle_ServiceTasking();
  uint64_t v4 = DPLogHandle_ServiceTaskingError();
  DRSConfirmDirectoryIsInitialized(v2, v3, v4);

  uint64_t v5 = +[DRSSystemProfile sharedInstance];
  LODWORD(v3) = [v5 isInternal];

  if (v3)
  {
    uint8_t v6 = +[DRSTaskingCloudKitHelper prodContainerHelper];
  }
  else
  {
    uint8_t v6 = 0;
  }
  id v7 = [DRSTaskingDecisionMaker alloc];
  char v8 = [(id)objc_opt_class() databaseDirectory];
  id v45 = 0;
  LODWORD(v40) = 16842753;
  id v9 = -[DRSTaskingDecisionMaker initWithTimezone:limitingParameters:dbWorkingDirectoryPath:cloudKitHelper:enforceDate:enforceBuild:enforceSampling:enforceTeamHysteresis:enforceGlobalHysteresisAndCap:allowRefereshLimitingParameters:errorOut:](v7, "initWithTimezone:limitingParameters:dbWorkingDirectoryPath:cloudKitHelper:enforceDate:enforceBuild:enforceSampling:enforceTeamHysteresis:enforceGlobalHysteresisAndCap:allowRefereshLimitingParameters:errorOut:", 0, 0, v8, v6, 1, 1, v40, &v45);
  id v10 = v45;

  if (!v9)
  {
    char v33 = DPLogHandle_ServiceTaskingError();
    if (os_signpost_enabled(v33))
    {
      uint64_t v34 = [v10 localizedDescription];
      uint64_t v35 = (void *)v34;
      char v36 = @"Unknown";
      if (v34) {
        char v36 = (__CFString *)v34;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v36;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingDecisionMakerCreationFailure", "FATAL ERROR: Failed to create tasking decision maker due to error: %{public}@", buf, 0xCu);
    }
    id v37 = DPLogHandle_ServiceTaskingError();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_1(v10, v37);
    }

    exit(1);
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_107;
  aBlock[3] = &unk_263FC99B8;
  objc_copyWeak(&v43, &location);
  int v11 = _Block_copy(aBlock);
  unsigned __int8 v12 = [[DRSTaskingManager alloc] initWithDecisionMaker:v9 cloudKitHelper:v6 configStateChangeBlock:v11];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 32);
  *(void *)(v13 + 32) = v12;

  int v15 = [DRSTaskingEventPublisher alloc];
  unint64_t v16 = [(DRSTaskingDecisionMaker *)v9 configStore];
  uint64_t v17 = [(DRSTaskingEventPublisher *)v15 initWithConfigStore:v16];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 48);
  *(void *)(v18 + 48) = v17;

  uint64_t v20 = [*(id *)(a1 + 32) eventPublisher];
  LODWORD(v16) = v20 == 0;

  if (v16)
  {
    uint64_t v38 = DPLogHandle_ServiceTaskingError();
    if (os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventPublisherInitFailure", "FATAL ERROR: Failed to create event publisher", buf, 2u);
    }

    v39 = DPLogHandle_ServiceTaskingError();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
      __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_2(v39);
    }

    exit(1);
  }
  id v21 = [*(id *)(a1 + 32) taskingManager];
  uint64_t v22 = [v21 persistedCloudChannelConfig];

  int v23 = DPLogHandle_ServiceTasking();
  if (os_signpost_enabled(v23))
  {
    uint64_t v24 = [v22 debugDescription];
    __int16 v25 = (void *)v24;
    v26 = @"MISSING";
    if (v24) {
      v26 = (__CFString *)v24;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = v26;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistedCloudChannelConfig", "Existing persisted cloud channel config %{public}@", buf, 0xCu);
  }
  __int16 v27 = [*(id *)(a1 + 32) taskingManager];
  id v41 = 0;
  char v28 = [v27 subscribeToChannelWithConfig:v22 errorOut:&v41];
  __int16 v29 = (__CFString *)v41;

  if (v28)
  {

    [*(id *)(a1 + 32) _checkForDefaultSubscriptionUpdate];
  }
  else
  {
    char v30 = DPLogHandle_ServiceTaskingError();
    if (os_signpost_enabled(v30))
    {
      uint64_t v31 = @"Unknown";
      if (v29) {
        uint64_t v31 = v29;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v31;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelSubscriptionError", "ERROR: Failed to subscribe to channel due to error %{public}@", buf, 0xCu);
    }

    v32 = DPLogHandle_ServiceTaskingError();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[DRSTaskingService _checkForDefaultSubscriptionUpdate]();
    }
  }
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_107(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, unint64_t a6, int a7)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v17 = DPLogHandle_ServiceTasking();
  if (os_signpost_enabled(v17))
  {
    uint64_t v18 = DRConfigStringForState();
    uint64_t v19 = DRSTaskingStringForTaskingStateChangeReason(a6);
    uint64_t v20 = (void *)v19;
    int v23 = 138544386;
    id v21 = &stru_26BDF7DE8;
    id v24 = v13;
    if (a7) {
      id v21 = @" (Notified clients)";
    }
    __int16 v25 = 2114;
    id v26 = v14;
    __int16 v27 = 2114;
    char v28 = v18;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    __int16 v31 = 2112;
    v32 = v21;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigStateChange", "%{public}@: Config %{public}@ moved to %{public}@ for reason %{public}@%@", (uint8_t *)&v23, 0x34u);
  }
  if (a7)
  {
    uint64_t v22 = [WeakRetained eventPublisher];
    [v22 publishConfigUpdateForTeamID:v13 state:a5 config:v15];
  }
}

- (DRSTaskingService)init
{
  v22.receiver = self;
  v22.super_class = (Class)DRSTaskingService;
  uint64_t v2 = [(DRSTaskingService *)&v22 init];
  if (!v2) {
    goto LABEL_4;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.diagnosticpipeline tasking service message queue", 0);
  messageQueue = v2->_messageQueue;
  v2->_messageQueue = (OS_dispatch_queue *)v3;

  uint64_t v5 = [(DRSTaskingService *)v2 messageQueue];
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.diagnosticpipeline.tasking.service", v5, 1uLL);
  serviceConnection = v2->_serviceConnection;
  v2->_serviceConnection = mach_service;

  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  serviceDeactivatedSem = v2->_serviceDeactivatedSem;
  v2->_serviceDeactivatedSem = (OS_dispatch_semaphore *)v8;

  id v10 = [(DRSTaskingService *)v2 serviceConnection];

  if (v10)
  {
    int v11 = dispatch_queue_create("DRSTaskingService Initializing Queue", 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__DRSTaskingService_init__block_invoke;
    block[3] = &unk_263FC9990;
    unsigned __int8 v12 = v2;
    id v21 = v12;
    dispatch_async(v11, block);
    objc_initWeak(&location, v12);
    id v13 = [(DRSTaskingService *)v12 serviceConnection];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __25__DRSTaskingService_init__block_invoke_2;
    handler[3] = &unk_263FC99E0;
    objc_copyWeak(&v18, &location);
    xpc_connection_set_event_handler(v13, handler);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

LABEL_4:
    id v14 = v2;
    goto LABEL_8;
  }
  id v15 = DPLogHandle_ServiceTaskingError();
  if (os_signpost_enabled(v15))
  {
    LOWORD(location) = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedTaskingServiceLaunch", "Could not create connection for mach service", (uint8_t *)&location, 2u);
  }

  id v14 = 0;
LABEL_8:

  return v14;
}

uint64_t __25__DRSTaskingService_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _waitForDeviceUnlockAndInitializeServiceState];
}

void __25__DRSTaskingService_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (MEMORY[0x21050E4F0](v3) == MEMORY[0x263EF86F0])
  {
    dispatch_semaphore_t v8 = [[DRSTaskingClientConnectionState alloc] initWithConnection:v3 service:WeakRetained];
    id v9 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v9))
    {
      id v10 = [(DRSTaskingClientConnectionState *)v8 stateDescription];
      int v13 = 138543362;
      id v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewTaskingClientConnection", "New connection from client %{public}@", (uint8_t *)&v13, 0xCu);
    }
    [WeakRetained _waitForDeviceUnlockAndInitializeServiceState];
    goto LABEL_17;
  }
  if (v3 == (id)MEMORY[0x263EF86A8])
  {
    int v11 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingServiceConnectionInvalidated", (const char *)&unk_209EEADD1, (uint8_t *)&v13, 2u);
    }

    dispatch_semaphore_t v8 = (DRSTaskingClientConnectionState *)objc_loadWeakRetained(v4);
    v8->_hasAdminEntitlement = 2;
    unsigned __int8 v12 = [(DRSTaskingClientConnectionState *)v8 serviceDeactivatedSem];
    dispatch_semaphore_signal(v12);

    goto LABEL_17;
  }
  if (v3 == (id)MEMORY[0x263EF86A0])
  {
    DPLogHandle_ServiceTasking();
    dispatch_semaphore_t v8 = (DRSTaskingClientConnectionState *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(&v8->super))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, &v8->super, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingServiceConnectionInterrupted", (const char *)&unk_209EEADD1, (uint8_t *)&v13, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (MEMORY[0x21050E4F0](v3) != MEMORY[0x263EF8708])
  {
    uint8_t v6 = (void *)MEMORY[0x21050E380](v3);
    id v7 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v7))
    {
      int v13 = 136446210;
      id v14 = v6;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMessageType", "Invalid message type unexpected: %{public}s", (uint8_t *)&v13, 0xCu);
    }

    if (v6) {
      free(v6);
    }
  }
LABEL_18:
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (OS_xpc_object)serviceConnection
{
  return self->_serviceConnection;
}

- (unsigned)state
{
  return self->_state;
}

- (DRSTaskingManager)taskingManager
{
  return self->_taskingManager;
}

- (OS_dispatch_semaphore)serviceDeactivatedSem
{
  return self->_serviceDeactivatedSem;
}

- (DRSTaskingEventPublisher)eventPublisher
{
  return self->_eventPublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPublisher, 0);
  objc_storeStrong((id *)&self->_serviceDeactivatedSem, 0);
  objc_storeStrong((id *)&self->_taskingManager, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);

  objc_storeStrong((id *)&self->_messageQueue, 0);
}

void __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_209E70000, a2, OS_LOG_TYPE_FAULT, "FATAL ERROR: Could not instantiate the tasking decision maker for the service due to error %{public}@", v4, 0xCu);
}

void __66__DRSTaskingService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_209E70000, log, OS_LOG_TYPE_FAULT, "FATAL ERROR: Could not instantiate the tasking event publisher for the service", v1, 2u);
}

@end