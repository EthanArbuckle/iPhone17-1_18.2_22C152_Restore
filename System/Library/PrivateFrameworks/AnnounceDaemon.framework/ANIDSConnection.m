@interface ANIDSConnection
+ (void)purgeTemporaryFiles;
- (ANConnectionDelegate)delegate;
- (ANIDSConnection)init;
- (IDSService)service;
- (NSMutableDictionary)outgoingMessages;
- (OS_dispatch_queue)idsQueue;
- (id)sendMessage:(id)a3 messageUUIDString:(id)a4 destination:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setDelegate:(id)a3;
- (void)setOutgoingMessages:(id)a3;
@end

@implementation ANIDSConnection

- (ANIDSConnection)init
{
  v12.receiver = self;
  v12.super_class = (Class)ANIDSConnection;
  v2 = [(ANIDSConnection *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    outgoingMessages = v2->_outgoingMessages;
    v2->_outgoingMessages = (NSMutableDictionary *)v3;

    id v5 = objc_alloc(MEMORY[0x1E4F6AB90]);
    uint64_t v6 = [v5 initWithService:*MEMORY[0x1E4F4A4D0]];
    service = v2->_service;
    v2->_service = (IDSService *)v6;

    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.announce.IDSMessageQueue", v8);
    idsQueue = v2->_idsQueue;
    v2->_idsQueue = (OS_dispatch_queue *)v9;

    [(IDSService *)v2->_service addDelegate:v2 queue:v2->_idsQueue];
    +[ANIDSConnection purgeTemporaryFiles];
  }
  return v2;
}

- (id)sendMessage:(id)a3 messageUUIDString:(id)a4 destination:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__9;
  v50 = __Block_byref_object_dispose__9;
  id v51 = 0;
  id obj = 0;
  v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&obj];
  objc_storeStrong(&v51, obj);
  objc_super v12 = (void *)v47[5];
  if (v12)
  {
    id v13 = v12;
LABEL_3:
    id v14 = v13;
    goto LABEL_30;
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1026, *MEMORY[0x1E4F4A720]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  int v15 = objc_msgSend(MEMORY[0x1E4F6AB90], "checkMessageSize:priority:", objc_msgSend(v11, "length"), 300);
  v16 = [MEMORY[0x1E4F4A8A8] messageWithoutDataFromMessage:v8];
  if (v15)
  {
    v17 = [MEMORY[0x1E4F4A8A8] messageDataFromMessage:v8];
    v18 = [MEMORY[0x1E4F4A8F8] createTemporaryFileWithData:v17 extension:*MEMORY[0x1E4F4A750] directory:@"46203C20-99A0-4622-A2B2-82E7339B26CA"];
    v19 = ANLogHandleIDSConnection();
    v20 = v19;
    if (v18)
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        goto LABEL_20;
      }
      v20 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v21 = [v11 length];
      *(_DWORD *)buf = 138412802;
      v53 = &stru_1F34A0E10;
      __int16 v54 = 2048;
      uint64_t v55 = v21;
      __int16 v56 = 2112;
      v57 = v18;
      v22 = "%@Data is too big to send as message over IDS: %lu. Sending as file %@ plus metadata.";
      v23 = v20;
      uint32_t v24 = 32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v20, OS_LOG_TYPE_ERROR, "%@Failed to create temporary file for large message.", buf, 0xCu);
      }

      v20 = ANLogHandleIDSConnection();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      v20 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v25 = [v11 length];
      *(_DWORD *)buf = 138412546;
      v53 = &stru_1F34A0E10;
      __int16 v54 = 2048;
      uint64_t v55 = v25;
      v22 = "%@Data is too big to send as message over IDS: %lu but could not get/create file so still trying to send as a message";
      v23 = v20;
      uint32_t v24 = 22;
    }
    _os_log_impl(&dword_1DA5ED000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    goto LABEL_18;
  }
  v18 = 0;
LABEL_20:
  v26 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v27 = [v26 BOOLForDefault:*MEMORY[0x1E4F4A648]];

  if (v27)
  {
    v28 = ANLogHandleIDSConnection();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v28, OS_LOG_TYPE_ERROR, "%@Forcing IDS Delivery Failure", buf, 0xCu);
    }

    uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:description:", 1036, *MEMORY[0x1E4F4A720], @"Force Delivery Failure Enabled in User Defaults");
    v30 = (void *)v47[5];
    v47[5] = v29;

    v31 = [(ANIDSConnection *)self delegate];
    [v31 connection:self failedDeliveryForMessage:v16 withError:v47[5]];
    id v14 = 0;
  }
  else
  {
    v32 = [(ANIDSConnection *)self idsQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__ANIDSConnection_sendMessage_messageUUIDString_destination___block_invoke;
    block[3] = &unk_1E6BCF040;
    id v37 = v9;
    id v38 = v10;
    id v33 = v18;
    id v39 = v33;
    v40 = self;
    id v41 = v16;
    v44 = &v46;
    id v42 = v11;
    id v43 = v8;
    dispatch_sync(v32, block);

    if (v33)
    {
      v34 = ANLogHandleIDSConnection();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v34, OS_LOG_TYPE_DEFAULT, "%@Removing temporary file for large message.", buf, 0xCu);
      }

      [MEMORY[0x1E4F4A8F8] removeItem:v33];
    }
    id v14 = (id)v47[5];

    v31 = v37;
  }

LABEL_30:
  _Block_object_dispose(&v46, 8);

  return v14;
}

void __61__ANIDSConnection_sendMessage_messageUUIDString_destination___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  uint64_t v3 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  v4 = [v3 numberForDefault:*MEMORY[0x1E4F4A668]];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F6AA10]];

  uint64_t v5 = MEMORY[0x1E4F1CC38];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A990]];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F6A960]];
  uint64_t v6 = IDSGetUUIDData();
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F6AA20]];

  v7 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 56) service];
  if (v8)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 64);
    objc_super v12 = (void *)[v2 copy];
    uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
    id obj = *(id *)(v13 + 40);
    id v26 = 0;
    LOBYTE(v11) = [v9 sendResourceAtURL:v10 metadata:v11 toDestinations:v7 priority:300 options:v12 identifier:&v26 error:&obj];
    id v14 = v26;
    objc_storeStrong((id *)(v13 + 40), obj);

    if (v11)
    {
LABEL_3:
      int v15 = ANLogHandleIDSConnection();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = &stru_1F34A0E10;
        __int16 v29 = 2112;
        id v30 = v14;
        _os_log_impl(&dword_1DA5ED000, v15, OS_LOG_TYPE_DEFAULT, "%@IDS Send Successful with identifier: %@", buf, 0x16u);
      }

      v16 = [*(id *)(a1 + 56) outgoingMessages];
      [v16 setObject:*(void *)(a1 + 64) forKey:v14];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 72);
    v18 = (void *)[v2 copy];
    uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8);
    id v23 = *(id *)(v19 + 40);
    id v24 = 0;
    char v20 = [v9 sendData:v17 toDestinations:v7 priority:300 options:v18 identifier:&v24 error:&v23];
    id v14 = v24;
    objc_storeStrong((id *)(v19 + 40), v23);

    if (v20) {
      goto LABEL_3;
    }
  }
  v16 = ANLogHandleIDSConnection();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = *(void *)(a1 + 80);
    v22 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    *(_DWORD *)buf = 138412802;
    v28 = &stru_1F34A0E10;
    __int16 v29 = 2112;
    id v30 = v22;
    __int16 v31 = 2112;
    uint64_t v32 = v21;
    _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_ERROR, "%@IDS Send Failed: Error = %@, Message = %@", buf, 0x20u);
  }
LABEL_9:
}

+ (void)purgeTemporaryFiles
{
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v20 = 0;
  v16 = [MEMORY[0x1E4F28F98] propertyListWithData:a5 options:0 format:0 error:&v20];
  id v17 = v20;
  if (v17)
  {
    v18 = ANLogHandleIDSConnection();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v22 = &stru_1F34A0E10;
      __int16 v23 = 2112;
      id v24 = v17;
      _os_log_impl(&dword_1DA5ED000, v18, OS_LOG_TYPE_ERROR, "%@Failed to convert data into dictionary: %@", buf, 0x16u);
    }

    uint64_t v19 = +[ANAnalytics shared];
    [v19 error:5020];
  }
  else if (v16)
  {
    [(ANIDSConnection *)self service:v12 account:v13 incomingMessage:v16 fromID:v14 context:v15];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  id v15 = ANLogHandleIDSConnection();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v32 = &stru_1F34A0E10;
    __int16 v33 = 2112;
    id v34 = v12;
    _os_log_impl(&dword_1DA5ED000, v15, OS_LOG_TYPE_DEFAULT, "%@Received IDS Message from ID = %@", buf, 0x16u);
  }

  v16 = objc_opt_new();
  id v17 = [v13 senderCorrelationIdentifier];

  [v16 setSenderCorrelationIdentifier:v17];
  v18 = [v14 deviceForFromID:v12];

  [v16 setIsValidDevice:v18 != 0];
  uint64_t v19 = ANLogHandleIDSConnection();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v18 modelIdentifier];
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = &stru_1F34A0E10;
    __int16 v33 = 2112;
    id v34 = v16;
    __int16 v35 = 2112;
    v36 = v20;
    _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "%@Sender Context: (%@) - %@", buf, 0x20u);
  }
  uint64_t v21 = [MEMORY[0x1E4F4A930] senderWithID:v12 type:1];
  objc_initWeak((id *)buf, self);
  v22 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ANIDSConnection_service_account_incomingMessage_fromID_context___block_invoke;
  block[3] = &unk_1E6BCF088;
  objc_copyWeak(&v30, (id *)buf);
  void block[4] = self;
  id v27 = v11;
  id v28 = v21;
  id v29 = v16;
  id v23 = v16;
  id v24 = v21;
  id v25 = v11;
  dispatch_async(v22, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

void __66__ANIDSConnection_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = [WeakRetained delegate];
  [v2 connection:*(void *)(a1 + 32) didReceiveMessage:*(void *)(a1 + 40) fromSender:*(void *)(a1 + 48) senderContext:*(void *)(a1 + 56) handler:&__block_literal_global_31];
}

void __66__ANIDSConnection_service_account_incomingMessage_fromID_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = ANLogHandleIDSConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412546;
      uint64_t v5 = &stru_1F34A0E10;
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_ERROR, "%@IDS Receive Failure: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = ANLogHandleIDSConnection();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = &stru_1F34A0E10;
    __int16 v28 = 2112;
    id v29 = v16;
    __int16 v30 = 2112;
    id v31 = v18;
    _os_log_impl(&dword_1DA5ED000, v20, OS_LOG_TYPE_DEFAULT, "%@Received IDS File %@ from ID = %@", buf, 0x20u);
  }

  id v25 = 0;
  uint64_t v21 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v16 options:0 error:&v25];
  id v22 = v25;
  if (v21)
  {
    id v23 = [MEMORY[0x1E4F4A8A8] messageFromData:v17 data:v21];
    [(ANIDSConnection *)self service:v14 account:v15 incomingMessage:v23 fromID:v18 context:v19];
  }
  else
  {
    id v24 = ANLogHandleIDSConnection();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v27 = &stru_1F34A0E10;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v18;
      __int16 v32 = 2112;
      id v33 = v22;
      _os_log_impl(&dword_1DA5ED000, v24, OS_LOG_TYPE_ERROR, "%@Failed to convert file resource %@ sent from %@ to data: %@", buf, 0x2Au);
    }

    id v23 = +[ANAnalytics shared];
    [v23 error:5021];
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a7;
  id v13 = [(ANIDSConnection *)self outgoingMessages];
  id v14 = [v13 valueForKey:v11];

  id v15 = [(ANIDSConnection *)self outgoingMessages];
  [v15 removeObjectForKey:v11];

  id v16 = ANLogHandleIDSConnection();
  id v17 = v16;
  if (v9)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = &stru_1F34A0E10;
      __int16 v26 = 2112;
      id v27 = v11;
      _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_DEFAULT, "%@IDS Delivery Successful for message with identifier (%@)", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = &stru_1F34A0E10;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_ERROR, "%@IDS Delivery Failed for message with identifier (%@). Error: %@", buf, 0x20u);
    }

    id v18 = +[ANAnalytics shared];
    [v18 error:5022];

    objc_initWeak((id *)buf, self);
    id v19 = dispatch_get_global_queue(33, 0);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__ANIDSConnection_service_account_identifier_didSendWithSuccess_error_context___block_invoke;
    v20[3] = &unk_1E6BCEC48;
    objc_copyWeak(&v23, (id *)buf);
    v20[4] = self;
    id v21 = v14;
    id v22 = v12;
    dispatch_async(v19, v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

void __79__ANIDSConnection_service_account_identifier_didSendWithSuccess_error_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained delegate];
  [v2 connection:*(void *)(a1 + 32) failedDeliveryForMessage:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (ANConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (NSMutableDictionary)outgoingMessages
{
  return self->_outgoingMessages;
}

- (void)setOutgoingMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingMessages, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end