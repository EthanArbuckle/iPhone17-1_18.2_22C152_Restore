@interface ACRemoteDeviceProxy
- (ACRemoteDeviceProxy)init;
- (BOOL)_isValidCommandForOutgoingMessage:(id)a3;
- (BOOL)_sendMessageData:(id)a3 toDestination:(id)a4 withPriority:(int64_t)a5 bypassDuet:(BOOL)a6 transportID:(id *)a7 error:(id *)a8;
- (int64_t)_priorityForMessageCarryingCommand:(id)a3;
- (void)_dequeueCompletionHandlersForMessageWithInternalID:(id)a3 success:(BOOL)a4 result:(id)a5 error:(id)a6;
- (void)_dequeueCompletionHandlersForMessageWithTransportID:(id)a3 success:(BOOL)a4 result:(id)a5 error:(id)a6;
- (void)_enqueueCompletionHandler:(id)a3 forMessageWithInternalID:(id)a4 transportID:(id)a5;
- (void)_sendReplyForMessage:(id)a3 toDestination:(id)a4 withSuccess:(BOOL)a5 result:(id)a6 error:(id)a7;
- (void)init;
- (void)sendCommand:(id)a3 withAccount:(id)a4 completion:(id)a5;
- (void)sendCommand:(id)a3 withAccount:(id)a4 options:(id)a5 completion:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation ACRemoteDeviceProxy

- (ACRemoteDeviceProxy)init
{
  v21.receiver = self;
  v21.super_class = (Class)ACRemoteDeviceProxy;
  v2 = [(ACRemoteDeviceProxy *)&v21 init];
  if (v2)
  {
    v3 = _ACLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ACRemoteDeviceProxy init](v3);
    }

    v4 = objc_alloc_init(ACRemoteCommandHandler);
    remoteCommandHandler = v2->_remoteCommandHandler;
    v2->_remoteCommandHandler = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    completionHandlersByInternalMessageID = v2->_completionHandlersByInternalMessageID;
    v2->_completionHandlersByInternalMessageID = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    internalMessageIDsByTransportID = v2->_internalMessageIDsByTransportID;
    v2->_internalMessageIDsByTransportID = v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    completionHandlersLock = v2->_completionHandlersLock;
    v2->_completionHandlersLock = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.accounts.IDSQ", v12);
    messageSendingQueue = v2->_messageSendingQueue;
    v2->_messageSendingQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.accounts.IDS.commandProcessing", v15);
    commandProcessingQueue = v2->_commandProcessingQueue;
    v2->_commandProcessingQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.accountssync"];
    messageSendingService = v2->_messageSendingService;
    v2->_messageSendingService = (IDSService *)v18;

    [(IDSService *)v2->_messageSendingService addDelegate:v2 queue:v2->_messageSendingQueue];
  }
  return v2;
}

- (void)sendCommand:(id)a3 withAccount:(id)a4 completion:(id)a5
{
}

- (void)sendCommand:(id)a3 withAccount:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _ACLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACRemoteDeviceProxy sendCommand:withAccount:options:completion:]();
  }

  v15 = _ACDNotificationSignpostSystem();
  os_signpost_id_t v16 = _ACSignpostCreate();
  uint64_t v18 = v17;

  v19 = _ACDNotificationSignpostSystem();
  v20 = v19;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138412546;
    os_signpost_id_t v46 = (os_signpost_id_t)v11;
    __int16 v47 = 2112;
    id v48 = v12;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SendRemoteCommand", "%@: %@", buf, 0x16u);
  }

  objc_super v21 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v46 = v16;
    __int16 v47 = 2112;
    id v48 = v11;
    __int16 v49 = 2112;
    id v50 = v12;
    _os_log_debug_impl(&dword_2183AD000, v21, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SendRemoteCommand %@: %@", buf, 0x20u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke;
  aBlock[3] = &unk_2643217C8;
  os_signpost_id_t v43 = v16;
  uint64_t v44 = v18;
  id v22 = v13;
  id v42 = v22;
  v23 = _Block_copy(aBlock);
  if ([(ACRemoteDeviceProxy *)self _isValidCommandForOutgoingMessage:v10])
  {
    v24 = +[ACRemoteDeviceMessage actionMessageWithCommand:v10 account:v11 options:v12];
    v25 = [v12 objectForKeyedSubscript:*MEMORY[0x263EFB1C0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v26 = [v25 BOOLValue];

      if (v26) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    if (([v10 isEqual:*MEMORY[0x263EFB178]] & 1) == 0
      && ([v10 isEqual:*MEMORY[0x263EFB1A0]] & 1) == 0
      && ([v10 isEqual:*MEMORY[0x263EFB1A8]] & 1) == 0
      && ([v10 isEqual:*MEMORY[0x263EFB1B0]] & 1) == 0
      && ![v10 isEqual:*MEMORY[0x263EFB190]])
    {
      char v28 = 0;
      goto LABEL_22;
    }
LABEL_21:
    char v28 = 1;
    [v24 setNeedsReply:1];
LABEL_22:
    v29 = [v24 data];
    if (v29)
    {
      messageSendingQueue = self->_messageSendingQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke_18;
      block[3] = &unk_2643217F0;
      id v33 = v12;
      v34 = self;
      id v38 = v23;
      id v35 = v10;
      id v36 = v24;
      id v37 = v29;
      char v40 = v28;
      id v39 = v22;
      dispatch_async(messageSendingQueue, block);

      v31 = v33;
    }
    else
    {
      v31 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:19 userInfo:0];
      (*((void (**)(void *, void, void, void *))v23 + 2))(v23, 0, 0, v31);
    }

    goto LABEL_26;
  }
  v27 = _ACLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v46 = (os_signpost_id_t)v10;
    _os_log_impl(&dword_2183AD000, v27, OS_LOG_TYPE_DEFAULT, "\"Command %@ cannot be sent from this platform.\"", buf, 0xCu);
  }

  v24 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:20 userInfo:0];
  (*((void (**)(void *, void, void, void *))v23 + 2))(v23, 0, 0, v24);
LABEL_26:
}

void __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t Nanoseconds = _ACSignpostGetNanoseconds();
  id v10 = _ACDNotificationSignpostSystem();
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    id v13 = @"NO";
    if (a2) {
      id v13 = @"YES";
    }
    int v17 = 138543618;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    double v20 = *(double *)&v8;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SendRemoteCommand", "%{public}@ (%@)", (uint8_t *)&v17, 0x16u);
  }

  v14 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134218754;
    uint64_t v18 = *(__CFString **)(a1 + 40);
    __int16 v19 = 2048;
    double v20 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    if (a2) {
      os_signpost_id_t v16 = @"YES";
    }
    else {
      os_signpost_id_t v16 = @"NO";
    }
    __int16 v21 = 2114;
    id v22 = v16;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_debug_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SendRemoteCommand %{public}@ (%@)", (uint8_t *)&v17, 0x2Au);
  }

  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v15 + 16))(v15, a2, v7, v8);
  }
}

void __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263EFB1D0]];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];
    v4 = [*(id *)(*(void *)(a1 + 40) + 8) devicesForBTUUID:v3];
    if ([v4 count] != 1)
    {
      v14 = _ACLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v57 = v4;
        __int16 v58 = 2112;
        v59 = v3;
        __int16 v60 = 2112;
        uint64_t v61 = v40;
        _os_log_error_impl(&dword_2183AD000, v14, OS_LOG_TYPE_ERROR, "\"BTUUID matched 0 or multiple devices, which shouldn't be the case, matches: %@, BTUUID: %@, options: %@\"", buf, 0x20u);
      }

      uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:20 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

      v6 = v3;
      goto LABEL_51;
    }
    v5 = [v4 anyObject];
    v6 = (void *)IDSCopyIDForDevice();
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke_18_cold_1();
    }

    if (v6) {
      goto LABEL_20;
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 8) linkedDevicesWithRelationship:1];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v51;
LABEL_8:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v51 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v50 + 1) + 8 * v12);
      if ([v13 isActive])
      {
        if ([v13 isLocallyPaired]) {
          break;
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v10) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }
    v6 = (void *)IDSCopyIDForDevice();

    if (!v6) {
      goto LABEL_44;
    }
LABEL_20:
    uint64_t v16 = [*(id *)(a1 + 40) _priorityForMessageCarryingCommand:*(void *)(a1 + 48)];
    int v17 = _ACLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [NSNumber numberWithInteger:v16];
      uint64_t v19 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      v57 = v6;
      __int16 v58 = 2112;
      v59 = v18;
      __int16 v60 = 2112;
      uint64_t v61 = v19;
      _os_log_impl(&dword_2183AD000, v17, OS_LOG_TYPE_DEFAULT, "\"Message is about to be sent to %@ with priority %@: %@\"", buf, 0x20u);
    }
    double v20 = *(void **)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 64);
    id v48 = 0;
    id v49 = 0;
    char v22 = [v20 _sendMessageData:v21 toDestination:v6 withPriority:v16 bypassDuet:1 transportID:&v49 error:&v48];
    id v23 = v49;
    id v24 = v48;
    if (v22)
    {
      if (!v23)
      {
        id v39 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:21 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

        goto LABEL_50;
      }
      if ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263EFB180]])
      {
        id v41 = v24;
        id v42 = v23;
        os_signpost_id_t v43 = v2;
        uint64_t v25 = _ACLogSystem();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2183AD000, v25, OS_LOG_TYPE_DEFAULT, "\"Command message is deletion. Will also send to non-active paired devices.\"", buf, 2u);
        }

        char v26 = [*(id *)(*(void *)(a1 + 40) + 8) devices];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v45 != v29) {
                objc_enumerationMutation(v26);
              }
              v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              if (([v31 isActive] & 1) == 0)
              {
                v32 = (void *)IDSCopyIDForDevice();
                if (v32)
                {
                  [*(id *)(a1 + 40) _sendMessageData:*(void *)(a1 + 64) toDestination:v32 withPriority:v16 bypassDuet:0 transportID:0 error:0];
                }
                else
                {
                  id v33 = _ACLogSystem();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v57 = v31;
                    _os_log_error_impl(&dword_2183AD000, v33, OS_LOG_TYPE_ERROR, "\"IDSCopyIDForDevice failed for inactive paired device: %@\"", buf, 0xCu);
                  }
                }
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v54 count:16];
          }
          while (v28);
        }

        id v23 = v42;
        v2 = v43;
        id v24 = v41;
      }
      if (*(unsigned char *)(a1 + 88))
      {
        v34 = *(void **)(a1 + 40);
        uint64_t v35 = *(void *)(a1 + 80);
        id v36 = [*(id *)(a1 + 56) identifier];
        [v34 _enqueueCompletionHandler:v35 forMessageWithInternalID:v36 transportID:v23];

LABEL_50:
        goto LABEL_51;
      }
      id v38 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    }
    else
    {
      id v38 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    }
    v38();
    goto LABEL_50;
  }
LABEL_15:

LABEL_44:
  id v37 = _ACLogSystem();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v37, OS_LOG_TYPE_DEFAULT, "\"Attempted to send remote proxy message with no paired device to target\"", buf, 2u);
  }

  v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:20 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_51:
}

- (BOOL)_sendMessageData:(id)a3 toDestination:(id)a4 withPriority:(int64_t)a5 bypassDuet:(BOOL)a6 transportID:(id *)a7 error:(id *)a8
{
  BOOL v9 = a6;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = _ACLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
    int v17 = [NSNumber numberWithInteger:a5];
    *(_DWORD *)buf = 138412802;
    id v35 = v16;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2112;
    id v39 = v17;
    _os_log_impl(&dword_2183AD000, v15, OS_LOG_TYPE_DEFAULT, "\"IDSService send request: %@ bytes to destination %@ with priority %@.\"", buf, 0x20u);
  }
  messageSendingService = self->_messageSendingService;
  uint64_t v19 = [MEMORY[0x263EFFA08] setWithObject:v14];
  v32[0] = *MEMORY[0x263F49EC0];
  double v20 = [NSNumber numberWithBool:v9];
  v32[1] = *MEMORY[0x263F49ED8];
  v33[0] = v20;
  v33[1] = MEMORY[0x263EFFA80];
  uint64_t v21 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  id v30 = 0;
  id v31 = 0;
  char v22 = [(IDSService *)messageSendingService sendData:v13 toDestinations:v19 priority:a5 options:v21 identifier:&v31 error:&v30];
  id v23 = v31;
  id v24 = v30;

  uint64_t v25 = _ACLogSystem();
  char v26 = v25;
  if (v22)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v23;
      _os_log_impl(&dword_2183AD000, v26, OS_LOG_TYPE_DEFAULT, "\"IDSService send request succeeded. Transport ID for sent message: %@\"", buf, 0xCu);
    }

    uint64_t v27 = v23;
    a8 = a7;
    if (!a7) {
      goto LABEL_12;
    }
LABEL_11:
    *a8 = v27;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[ACRemoteDeviceProxy _sendMessageData:toDestination:withPriority:bypassDuet:transportID:error:]();
  }

  uint64_t v27 = v24;
  if (a8) {
    goto LABEL_11;
  }
LABEL_12:

  return v22;
}

- (void)_sendReplyForMessage:(id)a3 toDestination:(id)a4 withSuccess:(BOOL)a5 result:(id)a6 error:(id)a7
{
  BOOL v9 = a5;
  v34[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = +[ACRemoteDeviceMessage replyForMessage:v12 withSuccess:v9 result:a6 error:a7];
  uint64_t v15 = [v14 data];
  if (v15)
  {
    messageSendingService = self->_messageSendingService;
    int v17 = [MEMORY[0x263EFFA08] setWithObject:v13];
    uint64_t v18 = *MEMORY[0x263F49ED8];
    v33[0] = *MEMORY[0x263F49EC0];
    v33[1] = v18;
    v34[0] = MEMORY[0x263EFFA88];
    v34[1] = MEMORY[0x263EFFA80];
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v25 = 0;
    id v26 = 0;
    char v20 = [(IDSService *)messageSendingService sendData:v15 toDestinations:v17 priority:200 options:v19 identifier:&v26 error:&v25];
    uint64_t v21 = v26;
    id v22 = v25;

    id v23 = _ACLogSystem();
    id v24 = v23;
    if (v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = v14;
        __int16 v29 = 2112;
        id v30 = v12;
        __int16 v31 = 2112;
        v32 = v21;
        _os_log_impl(&dword_2183AD000, v24, OS_LOG_TYPE_DEFAULT, "\"Reply %@ successfully sent in response to message %@. Transport ID: %@\"", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[ACRemoteDeviceProxy _sendMessageData:toDestination:withPriority:bypassDuet:transportID:error:]();
    }
  }
  else
  {
    uint64_t v21 = _ACLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ACRemoteDeviceProxy _sendReplyForMessage:toDestination:withSuccess:result:error:]();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = _ACLogSystem();
  int v17 = v16;
  if (!v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACRemoteDeviceProxy service:account:identifier:didSendWithSuccess:error:](v17);
    }
    goto LABEL_7;
  }
  if (a6)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v14;
      _os_log_impl(&dword_2183AD000, v17, OS_LOG_TYPE_DEFAULT, "\"Success for message with Transport ID %@!\"", (uint8_t *)&v18, 0xCu);
    }
LABEL_7:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[ACRemoteDeviceProxy service:account:identifier:didSendWithSuccess:error:]();
  }

  [(ACRemoteDeviceProxy *)self _dequeueCompletionHandlersForMessageWithTransportID:v14 success:0 result:0 error:v15];
LABEL_11:
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = _ACLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACRemoteDeviceProxy service:account:incomingData:fromID:context:]();
  }

  if (v9)
  {
    id v12 = [[ACRemoteDeviceMessage alloc] initWithData:v9];
    if ([(ACRemoteDeviceMessage *)v12 isReply])
    {
      id v13 = [(ACRemoteDeviceMessage *)v12 sentMessageIdentifier];
      id v14 = _ACLogSystem();
      p_super = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v12;
          _os_log_impl(&dword_2183AD000, p_super, OS_LOG_TYPE_DEFAULT, "\"Reply message succesfully received. %@\"", buf, 0xCu);
        }

        uint64_t v16 = [(ACRemoteDeviceMessage *)v12 success];
        p_super = [(ACRemoteDeviceMessage *)v12 result];
        int v17 = [(ACRemoteDeviceMessage *)v12 error];
        [(ACRemoteDeviceProxy *)self _dequeueCompletionHandlersForMessageWithInternalID:v13 success:v16 result:p_super error:v17];
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[ACRemoteDeviceProxy service:account:incomingData:fromID:context:]();
      }
    }
    else
    {
      int v18 = _ACLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v12;
        _os_log_impl(&dword_2183AD000, v18, OS_LOG_TYPE_DEFAULT, "\"Action message received. Dispatching to handler. %@\"", buf, 0xCu);
      }

      id v19 = (void *)os_transaction_create();
      commandProcessingQueue = self->_commandProcessingQueue;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __67__ACRemoteDeviceProxy_service_account_incomingData_fromID_context___block_invoke;
      v21[3] = &unk_264321840;
      id v22 = v12;
      id v23 = self;
      id v24 = v10;
      id v25 = v19;
      id v13 = v19;
      dispatch_async(commandProcessingQueue, v21);

      p_super = &v22->super;
    }
  }
  else
  {
    _ACLogSystem();
    id v12 = (ACRemoteDeviceMessage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
      -[ACRemoteDeviceProxy service:account:incomingData:fromID:context:](&v12->super);
    }
  }
}

void __67__ACRemoteDeviceProxy_service_account_incomingData_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v4;
    _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"Processing: %@\"", buf, 0xCu);
  }

  v5 = *(void **)(*(void *)(a1 + 40) + 32);
  v6 = [*(id *)(a1 + 32) command];
  id v7 = [*(id *)(a1 + 32) account];
  id v8 = [*(id *)(a1 + 32) options];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__ACRemoteDeviceProxy_service_account_incomingData_fromID_context___block_invoke_25;
  v13[3] = &unk_264321818;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void **)(a1 + 48);
  id v14 = v9;
  uint64_t v15 = v10;
  id v16 = v11;
  id v17 = *(id *)(a1 + 56);
  dispatch_semaphore_t v18 = v2;
  id v12 = v2;
  [v5 handleCommand:v6 forAccount:v7 options:v8 completion:v13];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

void __67__ACRemoteDeviceProxy_service_account_incomingData_fromID_context___block_invoke_25(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = [*(id *)(a1 + 32) needsReply];
  uint64_t v10 = _ACLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v12;
      _os_log_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEFAULT, "\"Processed message that requires a reply. %@\"", (uint8_t *)&v15, 0xCu);
    }

    [*(id *)(a1 + 40) _sendReplyForMessage:*(void *)(a1 + 32) toDestination:*(void *)(a1 + 48) withSuccess:a2 result:v7 error:v8];
  }
  else
  {
    if (v11)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = [NSNumber numberWithBool:a2];
      int v15 = 138412802;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      dispatch_semaphore_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEFAULT, "\"Processed message that does not need a reply. %@. Success: %@. Error: %@\"", (uint8_t *)&v15, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

- (void)_enqueueCompletionHandler:(id)a3 forMessageWithInternalID:(id)a4 transportID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = _ACLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACRemoteDeviceProxy _enqueueCompletionHandler:forMessageWithInternalID:transportID:]();
  }

  [(NSLock *)self->_completionHandlersLock lock];
  [(NSMutableDictionary *)self->_internalMessageIDsByTransportID setObject:v9 forKeyedSubscript:v10];

  id v12 = [(NSMutableDictionary *)self->_completionHandlersByInternalMessageID objectForKey:v9];
  if (!v12) {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  uint64_t v13 = _Block_copy(v8);
  [v12 addObject:v13];

  [(NSMutableDictionary *)self->_completionHandlersByInternalMessageID setObject:v12 forKey:v9];
  [(NSLock *)self->_completionHandlersLock unlock];
}

- (void)_dequeueCompletionHandlersForMessageWithInternalID:(id)a3 success:(BOOL)a4 result:(id)a5 error:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  [(NSLock *)self->_completionHandlersLock lock];
  id v12 = [(NSMutableDictionary *)self->_completionHandlersByInternalMessageID objectForKey:v9];
  [(NSMutableDictionary *)self->_completionHandlersByInternalMessageID removeObjectForKey:v9];
  [(NSLock *)self->_completionHandlersLock unlock];
  uint64_t v13 = _ACLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    *(_DWORD *)buf = 138412546;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEFAULT, "\"Calling out to %@ pending completions about message with ID %@\"", buf, 0x16u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * v19) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * v19));
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (void)_dequeueCompletionHandlersForMessageWithTransportID:(id)a3 success:(BOOL)a4 result:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [(NSLock *)self->_completionHandlersLock lock];
  uint64_t v13 = [(NSMutableDictionary *)self->_internalMessageIDsByTransportID objectForKeyedSubscript:v10];
  [(NSLock *)self->_completionHandlersLock unlock];
  if (v13)
  {
    [(ACRemoteDeviceProxy *)self _dequeueCompletionHandlersForMessageWithInternalID:v13 success:v8 result:v11 error:v12];
  }
  else
  {
    id v14 = _ACLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACRemoteDeviceProxy _dequeueCompletionHandlersForMessageWithTransportID:success:result:error:]();
    }
  }
}

- (BOOL)_isValidCommandForOutgoingMessage:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = *MEMORY[0x263EFB1A0];
  uint64_t v5 = *MEMORY[0x263EFB190];
  uint64_t v6 = *MEMORY[0x263EFB178];
  uint64_t v7 = *MEMORY[0x263EFB1A8];
  uint64_t v8 = *MEMORY[0x263EFB180];
  uint64_t v9 = *MEMORY[0x263EFB1B0];
  uint64_t v10 = *MEMORY[0x263EFB188];
  uint64_t v11 = *MEMORY[0x263EFB198];
  id v12 = a3;
  uint64_t v13 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, 0);
  LOBYTE(v4) = [v13 containsObject:v12];

  return v4;
}

- (int64_t)_priorityForMessageCarryingCommand:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x263EFB1A0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263EFB178]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263EFB188]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263EFB180]] & 1) != 0)
  {
    int64_t v4 = 200;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFB190]])
  {
    int64_t v4 = 200;
  }
  else
  {
    int64_t v4 = 100;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlersLock, 0);
  objc_storeStrong((id *)&self->_internalMessageIDsByTransportID, 0);
  objc_storeStrong((id *)&self->_completionHandlersByInternalMessageID, 0);
  objc_storeStrong((id *)&self->_remoteCommandHandler, 0);
  objc_storeStrong((id *)&self->_commandProcessingQueue, 0);
  objc_storeStrong((id *)&self->_messageSendingQueue, 0);

  objc_storeStrong((id *)&self->_messageSendingService, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "\"Initializing ACRemoteDeviceProxy...\"", v1, 2u);
}

- (void)sendCommand:withAccount:options:completion:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_2183AD000, v2, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@, %@)", (uint8_t *)v3, 0x26u);
}

void __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke_18_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_2183AD000, v1, OS_LOG_TYPE_DEBUG, "\"Resolved target remote device to: %@ from btUUID: %@\"", v2, 0x16u);
}

- (void)_sendMessageData:toDestination:withPriority:bypassDuet:transportID:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"IDSService send request failed. Error: %@\"", v2, v3, v4, v5, v6);
}

- (void)_sendReplyForMessage:toDestination:withSuccess:result:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"No data for reply to message %@!\"", v2, v3, v4, v5, v6);
}

- (void)service:(os_log_t)log account:identifier:didSendWithSuccess:error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"IDS callback did not provide a message identifier!\"", v1, 2u);
}

- (void)service:account:identifier:didSendWithSuccess:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Message with Transport ID %@ could not be sent!\"", v2, v3, v4, v5, v6);
}

- (void)service:(os_log_t)log account:incomingData:fromID:context:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"IDS is calling us back with no data!\"", v1, 2u);
}

- (void)service:account:incomingData:fromID:context:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Reply received without a sentMessageIdentifier! %@\"", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingData:fromID:context:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136380931;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)((char *)&v1[3] + 2) = 265;
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called", (uint8_t *)v1, 0x12u);
}

- (void)_enqueueCompletionHandler:forMessageWithInternalID:transportID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136381187;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@)", (uint8_t *)v1, 0x1Cu);
}

- (void)_dequeueCompletionHandlersForMessageWithTransportID:success:result:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"No internal identifier was found for message with transport ID: %@\"", v2, v3, v4, v5, v6);
}

@end