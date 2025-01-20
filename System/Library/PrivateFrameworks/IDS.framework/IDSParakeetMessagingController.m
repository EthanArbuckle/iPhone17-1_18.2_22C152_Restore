@interface IDSParakeetMessagingController
- (IDSParakeetMessagingController)init;
- (IDSParakeetMessagingController)initWithIPServerMessagingController:(id)a3 offGridServerMessagingController:(id)a4 queue:(id)a5;
- (IDSParakeetMessagingControllerDelegate)delegate;
- (IDSServerMessagingController)IPServerMessagingController;
- (IDSServerMessagingController)offGridServerMessagingController;
- (NSMutableDictionary)stopStateMachineByIdentifier;
- (NSMutableSet)incomingMessagesWithoutAcks;
- (OS_dispatch_queue)queue;
- (unint64_t)emptyStorageState;
- (void)_noteAckTimerFiredForIdentifier:(id)a3;
- (void)_noteAckedMessageWithMessageIdentifier:(id)a3;
- (void)_noteCanceledFetchForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_noteReceivedStopResponseForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_noteSentFetchForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_noteSentStopForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)cancelParakeetSessionStopWithUUID:(id)a3 completion:(id)a4;
- (void)controller:(id)a3 receivedIncomingMessageData:(id)a4 context:(id)a5;
- (void)sendCertifiedDeliveryReceipt:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmptyStorageState:(unint64_t)a3;
- (void)setIncomingMessagesWithoutAcks:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStopStateMachineByIdentifier:(id)a3;
- (void)stopParakeetSessionWithUUID:(id)a3 completion:(id)a4;
@end

@implementation IDSParakeetMessagingController

- (IDSParakeetMessagingController)init
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EE28B5F8, 0);
  v4 = [[IDSServerMessagingController alloc] initWithTopic:@"com.apple.private.rupert.parakeet.ip" commands:v3];
  v5 = [[IDSServerMessagingController alloc] initWithTopic:@"com.apple.private.rupert.parakeet"];
  v6 = +[IDSInternalQueueController sharedInstance];
  v7 = [v6 queue];
  v8 = [(IDSParakeetMessagingController *)self initWithIPServerMessagingController:v4 offGridServerMessagingController:v5 queue:v7];

  return v8;
}

- (IDSParakeetMessagingController)initWithIPServerMessagingController:(id)a3 offGridServerMessagingController:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IDSParakeetMessagingController;
  v12 = [(IDSParakeetMessagingController *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_IPServerMessagingController, a3);
    [(IDSServerMessagingController *)v13->_IPServerMessagingController addDelegate:v13];
    objc_storeStrong((id *)&v13->_offGridServerMessagingController, a4);
    [(IDSServerMessagingController *)v13->_offGridServerMessagingController addDelegate:v13];
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stopStateMachineByIdentifier = v13->_stopStateMachineByIdentifier;
    v13->_stopStateMachineByIdentifier = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    incomingMessagesWithoutAcks = v13->_incomingMessagesWithoutAcks;
    v13->_incomingMessagesWithoutAcks = v16;

    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)_noteSentStopForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
  id v11 = [v10 objectForKeyedSubscript:v8];

  if (!v11)
  {
    v12 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A41CB8();
    }
    goto LABEL_12;
  }
  if ([v11 state])
  {
    v12 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A41D20();
    }
LABEL_12:

    goto LABEL_13;
  }
  if (!a4)
  {
    [v11 setState:5];
    v13 = [v11 messageHandler];

    if (v13)
    {
      v14 = [v11 messageHandler];
      ((void (**)(void, void, id))v14)[2](v14, 0, v9);
    }
    v12 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
    [v12 removeObjectForKey:v8];
    goto LABEL_12;
  }
  [v11 setState:1];
LABEL_13:
}

- (void)_noteAckTimerFiredForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [v6 state];
    id v8 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7 == 4)
    {
      if (v9) {
        sub_191A41E2C();
      }

      [v6 setState:1];
      [(IDSParakeetMessagingController *)self _noteReceivedStopResponseForIdentifier:v4 success:1 error:0];
    }
    else
    {
      if (v9) {
        sub_191A41EBC();
      }
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A41DC4();
    }
  }
}

- (void)_noteReceivedStopResponseForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
  id v11 = [v10 objectForKeyedSubscript:v8];

  if (!v11)
  {
    v20 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_191A41F60();
    }
    goto LABEL_13;
  }
  if ([v11 state] && objc_msgSend(v11, "state") != 1)
  {
    v20 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_191A41FC8((uint64_t)v8, v11);
    }
    goto LABEL_13;
  }
  if (!a4)
  {
    [v11 setState:5];
    v21 = [v11 messageHandler];

    if (v21)
    {
      v22 = [v11 messageHandler];
      ((void (**)(void, void, id))v22)[2](v22, 0, v9);
    }
    v20 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
    [v20 removeObjectForKey:v8];
LABEL_13:

    goto LABEL_14;
  }
  [v11 setState:2];
  v12 = dispatch_group_create();
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 1;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_1919187A0;
  v44[4] = sub_1919185F0;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 1;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_1919187A0;
  v40[4] = sub_1919185F0;
  id v41 = 0;
  dispatch_group_enter(v12);
  v13 = [(IDSParakeetMessagingController *)self IPServerMessagingController];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_191A0E188;
  v35[3] = &unk_1E572D330;
  id v14 = v8;
  id v36 = v14;
  v38 = v40;
  v39 = v42;
  v15 = v12;
  v37 = v15;
  [v13 sendServerStorageFetchWithCompletion:v35];

  dispatch_group_enter(v15);
  v16 = [(IDSParakeetMessagingController *)self offGridServerMessagingController];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_191A0E2AC;
  v30[3] = &unk_1E572D330;
  id v17 = v14;
  id v31 = v17;
  v33 = v44;
  v34 = v46;
  v18 = v15;
  v32 = v18;
  [v16 sendServerStorageFetchWithCompletion:v30];

  objc_super v19 = [(IDSParakeetMessagingController *)self queue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_191A0E3D0;
  v23[3] = &unk_1E572D358;
  objc_copyWeak(&v29, location);
  v25 = v46;
  v26 = v42;
  v27 = v44;
  v28 = v40;
  id v24 = v17;
  dispatch_group_notify(v18, v19, v23);

  objc_destroyWeak(&v29);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(v46, 8);
  objc_destroyWeak(location);

LABEL_14:
}

- (void)_noteSentFetchForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
  id v11 = [v10 objectForKeyedSubscript:v8];

  if (!v11)
  {
    v20 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_191A42074();
    }
    goto LABEL_9;
  }
  if ([v11 state] != 2)
  {
    v20 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_191A420DC((uint64_t)v8, v11);
    }
LABEL_9:

    goto LABEL_20;
  }
  v12 = [(IDSParakeetMessagingController *)self incomingMessagesWithoutAcks];
  BOOL v13 = [v12 count] == 0;

  id v14 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v21 = @"NO";
      *(_DWORD *)buf = 138412802;
      if (v6) {
        v21 = @"YES";
      }
      *(void *)&buf[4] = v21;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Calling stop completion {success: %@, error: %@, identifier: %@}", buf, 0x20u);
    }

    [v11 setState:5];
    v22 = [v11 messageHandler];

    if (v22)
    {
      v23 = [v11 messageHandler];
      ((void (**)(void, BOOL, id))v23)[2](v23, v6, v9);
    }
    id v24 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
    [v24 removeObjectForKey:v8];
  }
  else
  {
    if (v15)
    {
      v16 = [(IDSParakeetMessagingController *)self incomingMessagesWithoutAcks];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v8;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "_noteSentFetch - messages have been delivered, waiting for acks {identifier: %@, incomingMessagesWithoutAcks: %@}", buf, 0x16u);
    }
    [v11 setState:4];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id v17 = objc_alloc(MEMORY[0x1E4F6C328]);
    v18 = [(IDSParakeetMessagingController *)self queue];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = sub_191A0E8F0;
    v28 = &unk_1E572D380;
    objc_copyWeak(&v30, (id *)buf);
    id v29 = v8;
    objc_super v19 = (void *)[v17 initWithQueue:v18 interval:300 repeats:0 handlerBlock:&v25];
    objc_msgSend(v11, "setFinalAckTimer:", v19, v25, v26, v27, v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
LABEL_20:
}

- (void)_noteCanceledFetchForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
  id v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    if ([v11 state] == 3)
    {
      [v11 setState:5];
      v12 = [v11 messageHandler];

      if (v12)
      {
        BOOL v13 = [v11 messageHandler];
        ((void (**)(void, BOOL, id))v13)[2](v13, v6, v9);
      }
      id v14 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
      [v14 removeObjectForKey:v8];
    }
    else
    {
      id v14 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_191A421F0();
      }
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A42188();
    }
  }
}

- (void)_noteAckedMessageWithMessageIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(IDSParakeetMessagingController *)self incomingMessagesWithoutAcks];
    [v5 removeObject:v4];

    BOOL v6 = [(IDSParakeetMessagingController *)self incomingMessagesWithoutAcks];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_191A422D8(self, v8);
      }
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
      id v8 = [v9 copy];

      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        id v23 = v4;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v8);
            }
            uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            BOOL v15 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
            v16 = [v15 objectForKeyedSubscript:v14];

            uint64_t v17 = [v16 state];
            v18 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
            BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
            if (v17 == 4)
            {
              if (v19)
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v29 = v14;
                _os_log_error_impl(&dword_19190B000, v18, OS_LOG_TYPE_ERROR, "_noteAckedMessage - all messages have been acked, completing {identifier: %@}", buf, 0xCu);
              }

              [v16 setState:5];
              v20 = [v16 messageHandler];

              if (v20)
              {
                v21 = [v16 messageHandler];
                v21[2](v21, 1, 0);
              }
              v18 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
              [v18 removeObjectForKey:v14];
            }
            else if (v19)
            {
              v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "state"));
              *(_DWORD *)buf = 138412546;
              uint64_t v29 = v14;
              __int16 v30 = 2112;
              id v31 = v22;
              _os_log_error_impl(&dword_19190B000, v18, OS_LOG_TYPE_ERROR, "_noteSentCancel - state machine not in expected state {identifier: %@, stateMachine.state: %@}", buf, 0x16u);
            }
          }
          uint64_t v11 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v11);
        id v4 = v23;
      }
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A42294(v8);
    }
  }
}

- (void)stopParakeetSessionWithUUID:(id)a3 completion:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 UUIDString];
  id v9 = objc_alloc_init(IDSServerMessagingOptions);
  [(IDSServerMessagingOptions *)v9 setTimeout:&unk_1EE28B650];
  [(IDSServerMessagingOptions *)v9 setCommand:&unk_1EE28B5F8];
  [(IDSServerMessagingOptions *)v9 setCancelOnClientCrash:MEMORY[0x1E4F1CC38]];
  long long v26 = @"pmt";
  v27[0] = &unk_1EE28B610;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  [(IDSServerMessagingOptions *)v9 setAdditionalTopLevelFields:v10];

  uint64_t v11 = objc_alloc_init(IDSParakeetMessagingStopStateMachine);
  [(IDSParakeetMessagingStopStateMachine *)v11 setState:0];
  [(IDSParakeetMessagingStopStateMachine *)v11 setMessageHandler:v7];
  [(IDSParakeetMessagingStopStateMachine *)v11 setIdentifier:v8];
  uint64_t v12 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
  [v12 setObject:v11 forKey:v8];

  BOOL v13 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    long long v25 = v9;
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Client triggered stop parakeet session { self: %@, guid: %@, options: %@}", buf, 0x20u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  uint64_t v14 = [(IDSParakeetMessagingController *)self IPServerMessagingController];
  id v20 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_191A0F0D8;
  v17[3] = &unk_1E572D3A8;
  objc_copyWeak(&v19, (id *)buf);
  id v15 = v8;
  id v18 = v15;
  [v14 sendMessageData:0 withOptions:v9 identifier:&v20 completion:v17];
  id v16 = v20;

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)cancelParakeetSessionStopWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 UUIDString];
  id v9 = objc_alloc_init(IDSParakeetMessagingStopStateMachine);
  [(IDSParakeetMessagingStopStateMachine *)v9 setState:3];
  [(IDSParakeetMessagingStopStateMachine *)v9 setMessageHandler:v7];
  [(IDSParakeetMessagingStopStateMachine *)v9 setIdentifier:v8];
  uint64_t v10 = [(IDSParakeetMessagingController *)self stopStateMachineByIdentifier];
  [v10 setObject:v9 forKey:v8];

  uint64_t v11 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Client triggered cancel of stopped parakeet session { self: %@, guid: %@ }", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  uint64_t v12 = [(IDSParakeetMessagingController *)self IPServerMessagingController];
  BOOL v13 = [v6 UUIDString];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191A0F448;
  v15[3] = &unk_1E572D3D0;
  objc_copyWeak(&v17, (id *)buf);
  id v14 = v6;
  id v16 = v14;
  [v12 cancelMessageWithIdentifier:v13 completion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)sendCertifiedDeliveryReceipt:(id)a3
{
  id v4 = a3;
  v5 = [v4 service];
  if ([v5 isEqualToString:@"com.apple.private.rupert.parakeet.ip"])
  {
    id v6 = [(IDSParakeetMessagingController *)self IPServerMessagingController];
LABEL_5:
    id v7 = v6;
    [v6 sendCertifiedDeliveryReceipt:v4];
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"com.apple.private.rupert.parakeet"])
  {
    id v6 = [(IDSParakeetMessagingController *)self offGridServerMessagingController];
    goto LABEL_5;
  }
  id v7 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_191A4236C();
  }
LABEL_8:

  id v8 = [(IDSParakeetMessagingController *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191A0F6C8;
  v10[3] = &unk_1E57291B8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)controller:(id)a3 receivedIncomingMessageData:(id)a4 context:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (IDSParakeetMessagingController *)a5;
  id v9 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134218242;
    id v23 = self;
    __int16 v24 = 2112;
    long long v25 = v8;
    _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Parakeet client received incoming data { self: %p, context: %@ }", (uint8_t *)&v22, 0x16u);
  }

  uint64_t v10 = [(IDSParakeetMessagingController *)v8 command];
  uint64_t v11 = [v10 integerValue];

  if (v11 == 176)
  {
    uint64_t v12 = [(IDSParakeetMessagingController *)self IPServerMessagingController];
    BOOL v13 = [(IDSParakeetMessagingController *)v8 certifiedDeliveryContext];
    [v12 sendCertifiedDeliveryReceipt:v13];

    id v14 = [(IDSParakeetMessagingController *)v8 identifier];
    [(IDSParakeetMessagingController *)self _noteReceivedStopResponseForIdentifier:v14 success:1 error:0];
  }
  else
  {
    uint64_t v15 = [(IDSParakeetMessagingController *)v8 identifier];
    if (v15)
    {
      id v16 = (void *)v15;
      id v17 = [(IDSParakeetMessagingController *)v8 certifiedDeliveryContext];

      if (v17)
      {
        id v18 = [(IDSParakeetMessagingController *)self incomingMessagesWithoutAcks];
        __int16 v19 = [(IDSParakeetMessagingController *)v8 identifier];
        [v18 addObject:v19];
      }
    }
    id v14 = [(IDSParakeetMessagingController *)self delegate];
    id v20 = [MEMORY[0x1E4F6B460] IDSServerMessaging];
    uint64_t v21 = v20;
    if (v14)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        id v23 = v8;
        __int16 v24 = 2048;
        long long v25 = v14;
        _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "Forwarding server message to delegate { context: %@, delegate: %p }", (uint8_t *)&v22, 0x16u);
      }

      [(IDSParakeetMessagingController *)v14 controller:self receivedIncomingMessageData:v7 context:v8];
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_191A423F0();
      }
    }
  }
}

- (IDSParakeetMessagingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSParakeetMessagingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSServerMessagingController)IPServerMessagingController
{
  return self->_IPServerMessagingController;
}

- (IDSServerMessagingController)offGridServerMessagingController
{
  return self->_offGridServerMessagingController;
}

- (NSMutableDictionary)stopStateMachineByIdentifier
{
  return self->_stopStateMachineByIdentifier;
}

- (void)setStopStateMachineByIdentifier:(id)a3
{
}

- (unint64_t)emptyStorageState
{
  return self->_emptyStorageState;
}

- (void)setEmptyStorageState:(unint64_t)a3
{
  self->_emptyStorageState = a3;
}

- (NSMutableSet)incomingMessagesWithoutAcks
{
  return self->_incomingMessagesWithoutAcks;
}

- (void)setIncomingMessagesWithoutAcks:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_incomingMessagesWithoutAcks, 0);
  objc_storeStrong((id *)&self->_stopStateMachineByIdentifier, 0);
  objc_storeStrong((id *)&self->_offGridServerMessagingController, 0);
  objc_storeStrong((id *)&self->_IPServerMessagingController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end