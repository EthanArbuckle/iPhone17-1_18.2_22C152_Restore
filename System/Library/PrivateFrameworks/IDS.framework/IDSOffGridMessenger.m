@interface IDSOffGridMessenger
- (IDSOffGridMessenger)initWithService:(id)a3 queue:(id)a4 daemonController:(id)a5 error:(id *)a6;
- (IDSOffGridMessenger)initWithService:(id)a3 queue:(id)a4 error:(id *)a5;
- (IDSOffGridMessengerDelegate)delegate;
- (IDSServiceProperties)serviceProperties;
- (IDSXPCDaemonController)daemonController;
- (NSSet)handles;
- (NSString)serviceName;
- (NSString)uuid;
- (OS_dispatch_queue)queue;
- (_IDSService)service;
- (void)_handleIncomingDeliveryReceiptMessage:(id)a3 fromID:(id)a4 context:(id)a5;
- (void)_handleIncomingServiceUpdateMessage:(id)a3 fromID:(id)a4 context:(id)a5;
- (void)_handleIncomingTextMessage:(id)a3 fromID:(id)a4 context:(id)a5;
- (void)_setupInterruptionHandler;
- (void)_setupXPC;
- (void)decryptOffGridMessage:(id)a3 completion:(id)a4;
- (void)donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 options:(id)a5 completion:(id)a6;
- (void)encryptAndSendOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5;
- (void)encryptOffGridMessage:(id)a3 completion:(id)a4;
- (void)incomingOffGridMessage:(id)a3 completion:(id)a4;
- (void)incomingOffGridSummaryMessage:(id)a3 completion:(id)a4;
- (void)resultsForDestinationURIs:(id)a3 senderURI:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5;
- (void)sendFetchRequestForHandles:(id)a3 completions:(id)a4;
- (void)sendServiceUpdateMessage:(id)a3 options:(id)a4 completion:(id)a5;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDaemonController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation IDSOffGridMessenger

- (IDSOffGridMessenger)initWithService:(id)a3 queue:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[IDSXPCDaemonController weakSharedInstance];
  v11 = [(IDSOffGridMessenger *)self initWithService:v9 queue:v8 daemonController:v10 error:a5];

  return v11;
}

- (IDSOffGridMessenger)initWithService:(id)a3 queue:(id)a4 daemonController:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v17 = objc_msgSend(v16, "initWithObjectsAndKeys:", @"The queue specified is nil.", *MEMORY[0x1E4F28568], 0);
    *a6 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"IDSOffGridDeliveryErrorDomain" code:3 userInfo:v17];

    goto LABEL_9;
  }
  v31.receiver = self;
  v31.super_class = (Class)IDSOffGridMessenger;
  v13 = [(IDSOffGridMessenger *)&v31 init];
  if (v13)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = -86;
    v14 = +[IDSInternalQueueController sharedInstance];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_19192CBE4;
    v21[3] = &unk_1E5729810;
    self = v13;
    v22 = self;
    id v23 = v10;
    id v24 = v11;
    id v25 = v12;
    v26 = &v27;
    [v14 performBlock:v21 waitUntilDone:1];

    if (self->_service && *((unsigned char *)v28 + 24))
    {
      [(IDSOffGridMessenger *)self _setupInterruptionHandler];
      [(IDSOffGridMessenger *)self _setupXPC];

      _Block_object_dispose(&v27, 8);
      goto LABEL_6;
    }
    id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v19 = objc_msgSend(v18, "initWithObjectsAndKeys:", @"Invalid service name provided", *MEMORY[0x1E4F28568], 0);
    *a6 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"IDSOffGridDeliveryErrorDomain" code:1 userInfo:v19];

    _Block_object_dispose(&v27, 8);
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
LABEL_6:
  self = v13;
  v15 = self;
LABEL_10:

  return v15;
}

- (void)_setupInterruptionHandler
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  daemonController = self->_daemonController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19192CE08;
  v4[3] = &unk_1E57295B8;
  objc_copyWeak(&v5, &location);
  [(IDSXPCDaemonController *)daemonController addInterruptionHandler:v4 forTarget:self];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setupXPC
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(IDSOffGridMessenger *)self uuid];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Setting up xpc for client %@", buf, 0xCu);
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  daemonController = self->_daemonController;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19192D058;
  v6[3] = &unk_1E5729858;
  objc_copyWeak(&v7, (id *)buf);
  [(IDSXPCDaemonController *)daemonController performTask:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (NSSet)handles
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = +[IDSDaemonController sharedInstance];
  [v4 blockUntilConnected];

  id v5 = +[IDSInternalQueueController sharedInstance];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = sub_19192D268;
  id v12 = &unk_1E57291B8;
  v13 = self;
  id v14 = v3;
  id v6 = v3;
  [v5 performBlock:&v9 waitUntilDone:1];

  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return (NSSet *)v7;
}

- (void)donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  daemonController = self->_daemonController;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_19192D53C;
  v19[3] = &unk_1E5729920;
  id v22 = v12;
  id v23 = v13;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  [(IDSXPCDaemonController *)daemonController performTask:v19];
}

- (void)resultsForDestinationURIs:(id)a3 senderURI:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  daemonController = self->_daemonController;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_19192D95C;
  v19[3] = &unk_1E5729920;
  id v22 = v12;
  id v23 = v13;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  [(IDSXPCDaemonController *)daemonController performTask:v19];
}

- (void)encryptOffGridMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setService:self->_serviceName];
  id v8 = [v6 senderURI];

  if (!v8)
  {
    uint64_t v9 = [(IDSOffGridMessenger *)self handles];
    id v10 = [v9 anyObject];
    [v6 setSenderURI:v10];
  }
  daemonController = self->_daemonController;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19192DE04;
  v14[3] = &unk_1E57299E8;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  id v12 = v6;
  id v13 = v7;
  [(IDSXPCDaemonController *)daemonController performTask:v14];
}

- (void)decryptOffGridMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  daemonController = self->_daemonController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19192E200;
  v11[3] = &unk_1E57299E8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(IDSXPCDaemonController *)daemonController performTask:v11];
}

- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 setService:self->_serviceName];
  if ([v9 transportType])
  {
    objc_msgSend(v9, "setDefaultOptionsForTransportType:", objc_msgSend(v9, "transportType"));
    [v9 setEncryptPayload:0];
    id v11 = [v8 identifier];
    [v9 setIdentifier:v11];

    id v12 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v8 identifier];
      id v14 = [v8 dictionaryRepresentation];
      *(_DWORD *)buf = 138412802;
      v39 = v13;
      __int16 v40 = 2112;
      v41 = v14;
      __int16 v42 = 2048;
      uint64_t v43 = [v9 transportType];
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Sending outgoing encrypted OffGrid message - %@, Message %@, transportType %ld", buf, 0x20u);
    }
    uint64_t v15 = [v9 transportType];
    if (v15 == 1)
    {
      id v24 = +[IDSDaemonController sharedInstance];
      [v24 blockUntilConnected];

      id v25 = +[IDSInternalQueueController sharedInstance];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_19192ECC0;
      v26[3] = &unk_1E5729A88;
      v26[4] = self;
      id v27 = v8;
      id v28 = v9;
      id v29 = v10;
      [v25 performBlock:v26 waitUntilDone:0];

      id v17 = v27;
      goto LABEL_11;
    }
    if (v15 == 2)
    {
      daemonController = self->_daemonController;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_19192E978;
      v30[3] = &unk_1E5729A60;
      id v33 = v10;
      v30[4] = self;
      id v31 = v8;
      id v32 = v9;
      [(IDSXPCDaemonController *)daemonController performTask:v30];

      id v17 = v33;
LABEL_11:
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Fatal Error - Transport not set", buf, 2u);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v20 = objc_msgSend(v19, "initWithObjectsAndKeys:", @"Invalid OffGrid delivery options. transport type not set", *MEMORY[0x1E4F28568], 0);
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"IDSOffGridDeliveryErrorDomain" code:2 userInfo:v20];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19192E95C;
    block[3] = &unk_1E5729948;
    id v37 = v10;
    id v35 = v8;
    id v36 = v21;
    id v23 = v21;
    dispatch_async(queue, block);
  }
}

- (void)encryptAndSendOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSInternalQueueController sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_19192EF80;
  v15[3] = &unk_1E5729A88;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBlock:v15];
}

- (void)sendFetchRequestForHandles:(id)a3 completions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSOffGridMessenger *)self handles];
  id v9 = [v8 anyObject];

  if (!v9)
  {
    id v25 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_191A2C318(v25, v26, v27, v28, v29, v30, v31, v32);
    }

    id v33 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v11 = objc_msgSend(v33, "initWithObjectsAndKeys:", @"No active sender handle found.", *MEMORY[0x1E4F28568], 0);
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"IDSOffGridDeliveryErrorDomain" code:7 userInfo:v11];
    queue = self->_queue;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = sub_19192F4A0;
    v44[3] = &unk_1E5729948;
    id v47 = v7;
    id v45 = v6;
    id v46 = v34;
    id v23 = v34;
    dispatch_async(queue, v44);

    id v24 = v47;
    goto LABEL_11;
  }
  if (!v6 || ![v6 count])
  {
    id v12 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A2C350(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v11 = objc_msgSend(v20, "initWithObjectsAndKeys:", @"No handles specified.", *MEMORY[0x1E4F28568], 0);
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"IDSOffGridDeliveryErrorDomain" code:11 userInfo:v11];
    id v22 = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19192F4B8;
    block[3] = &unk_1E5729948;
    id v43 = v7;
    id v41 = v6;
    id v42 = v21;
    id v23 = v21;
    dispatch_async(v22, block);

    id v24 = v43;
LABEL_11:

    goto LABEL_12;
  }
  daemonController = self->_daemonController;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_19192F4D0;
  v36[3] = &unk_1E5729A60;
  id v39 = v7;
  v36[4] = self;
  id v37 = v6;
  id v38 = v9;
  [(IDSXPCDaemonController *)daemonController performTask:v36];

  id v11 = v39;
LABEL_12:
}

- (void)sendServiceUpdateMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 preferredServiceType] == 1)
  {
    id v11 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A2C388(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v20 = (id)objc_msgSend(v19, "initWithObjectsAndKeys:", @"Service Update to SMS is not supported onGrid.", *MEMORY[0x1E4F28568], 0);
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"IDSOffGridDeliveryErrorDomain" code:11 userInfo:v20];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19192FA40;
    block[3] = &unk_1E5729948;
    id v34 = v21;
    id v35 = v10;
    id v33 = v8;
    id v23 = v10;
    id v24 = v8;
    id v25 = v21;
    dispatch_async(queue, block);
  }
  else
  {
    uint64_t v26 = +[IDSDaemonController sharedInstance];
    [v26 blockUntilConnected];

    uint64_t v27 = +[IDSInternalQueueController sharedInstance];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_19192FA5C;
    v28[3] = &unk_1E5729A88;
    v28[4] = self;
    id v29 = v8;
    id v30 = v9;
    id v31 = v10;
    id v25 = v10;
    id v20 = v8;
    [v27 performBlock:v28 waitUntilDone:0];
  }
}

- (void)_handleIncomingTextMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[IDSOffGridEncryptedMessage alloc] initWithDictionaryMessage:v8];
  uint64_t v12 = (void *)MEMORY[0x1E4F6B5C8];
  uint64_t v13 = [v10 fromID];
  uint64_t v14 = [v12 URIWithPrefixedURI:v13];
  uint64_t v15 = [v14 tokenFreeURI];
  [(IDSOffGridEncryptedMessage *)v11 setSenderURI:v15];

  uint64_t v16 = (void *)MEMORY[0x1E4F6B5C8];
  uint64_t v17 = [v10 toID];
  uint64_t v18 = [v16 URIWithPrefixedURI:v17];
  id v19 = [v18 tokenFreeURI];
  [(IDSOffGridEncryptedMessage *)v11 setRecipientURI:v19];

  id v20 = [[IDSOffGridMessageContext alloc] initWithIDSMessageContext:v10];
  [(IDSOffGridMessageContext *)v20 setTransportType:1];
  queue = self->_queue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_19192FE18;
  v27[3] = &unk_1E57296A8;
  v27[4] = self;
  uint64_t v28 = v11;
  id v29 = v20;
  id v30 = v10;
  id v31 = v8;
  id v32 = v9;
  id v22 = v9;
  id v23 = v8;
  id v24 = v10;
  id v25 = v20;
  uint64_t v26 = v11;
  dispatch_async(queue, v27);
}

- (void)_handleIncomingDeliveryReceiptMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 originalGUID];
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Incoming delivery receipt - %@, Message %@, fromID %@", buf, 0x20u);
  }
  uint64_t v13 = [[IDSOffGridMessageContext alloc] initWithIDSMessageContext:v10];
  uint64_t v14 = (void *)MEMORY[0x1E4F6B5C8];
  uint64_t v15 = [v10 serviceIdentifier];
  uint64_t v16 = [v14 URIWithPrefixedURI:v9 withServiceLoggingHint:v15];

  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1919303E0;
  v21[3] = &unk_1E5729680;
  void v21[4] = self;
  id v22 = v10;
  id v23 = v16;
  id v24 = v13;
  uint64_t v18 = v13;
  id v19 = v16;
  id v20 = v10;
  dispatch_async(queue, v21);
}

- (void)_handleIncomingServiceUpdateMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 originalGUID];
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Incoming service update message - %@, Message %@, fromID %@", buf, 0x20u);
  }
  uint64_t v13 = [[IDSOffGridServiceUpdateMessage alloc] initWithDictionaryMessage:v8];
  uint64_t v14 = [[IDSOffGridMessageContext alloc] initWithIDSMessageContext:v10];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191930688;
  block[3] = &unk_1E57296D0;
  void block[4] = self;
  id v21 = v13;
  id v22 = v14;
  id v23 = v10;
  id v24 = v9;
  id v16 = v9;
  id v17 = v10;
  uint64_t v18 = v14;
  id v19 = v13;
  dispatch_async(queue, block);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  v4 = +[IDSDaemonController sharedInstance];
  [v4 blockUntilConnected];

  id v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191930A2C;
  v6[3] = &unk_1E5729000;
  void v6[4] = self;
  [v5 performBlock:v6 waitUntilDone:1];
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v12 originalGUID];
    int v22 = 138412802;
    id v23 = v14;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Incoming message - %@, Message %@, fromID %@", (uint8_t *)&v22, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v16 = [v12 originalCommand];
    uint64_t v17 = [v16 integerValue];

    if (v17 == 100)
    {
      [(IDSOffGridMessenger *)self _handleIncomingTextMessage:v10 fromID:v11 context:v12];
    }
    else
    {
      uint64_t v18 = [v12 originalCommand];
      uint64_t v19 = [v18 integerValue];

      if (v19 == 101)
      {
        [(IDSOffGridMessenger *)self _handleIncomingDeliveryReceiptMessage:v10 fromID:v11 context:v12];
      }
      else
      {
        id v20 = [v12 originalCommand];
        uint64_t v21 = [v20 integerValue];

        if (v21 == 128) {
          [(IDSOffGridMessenger *)self _handleIncomingServiceUpdateMessage:v10 fromID:v11 context:v12];
        }
      }
    }
  }
}

- (void)incomingOffGridMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v9 = objc_alloc_init(IDSOffGridMessageContext);
    [(IDSOffGridMessageContext *)v9 setTransportType:2];
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_191930D18;
    v12[3] = &unk_1E5729A88;
    v12[4] = self;
    id v13 = v6;
    uint64_t v14 = v9;
    id v15 = v7;
    id v11 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)incomingOffGridSummaryMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_alloc_init(IDSOffGridMessageContext);
      [(IDSOffGridMessageContext *)v12 setTransportType:2];
      queue = self->_queue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_191931070;
      v15[3] = &unk_1E5729A88;
      v15[4] = self;
      id v16 = v6;
      uint64_t v17 = v12;
      id v18 = v7;
      uint64_t v14 = v12;
      dispatch_async(queue, v15);
    }
  }
}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (IDSServiceProperties)serviceProperties
{
  return self->_serviceProperties;
}

- (_IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSOffGridMessengerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSOffGridMessengerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_daemonController, 0);
}

@end