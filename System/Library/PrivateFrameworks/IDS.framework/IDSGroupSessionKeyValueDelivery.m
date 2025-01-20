@interface IDSGroupSessionKeyValueDelivery
+ (BOOL)supportsSecureCoding;
+ (void)createWithSessionID:(id)a3 completionHandler:(id)a4;
- (IDSGroupSessionKeyValueDelivery)initWithCoder:(id)a3;
- (IDSGroupSessionKeyValueDelivery)initWithSessionID:(id)a3;
- (IDSGroupSessionKeyValueDelivery)initWithSessionID:(id)a3 completionHandler:(id)a4;
- (id)_initWithSessionID:(id)a3;
- (void)_setUpXPC;
- (void)addDeliveryHandler:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeDeliveryHandler:(id)a3;
- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4;
- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6;
- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6 completionHandler:(id)a7;
- (void)test_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5;
@end

@implementation IDSGroupSessionKeyValueDelivery

+ (void)createWithSessionID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_191918780;
  v20 = sub_1919185E0;
  id v21 = 0;
  v7 = [IDSGroupSessionKeyValueDelivery alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1919E0CA8;
  v12[3] = &unk_1E572AB40;
  id v13 = v5;
  id v14 = v6;
  v15 = &v16;
  id v8 = v5;
  id v9 = v6;
  uint64_t v10 = [(IDSGroupSessionKeyValueDelivery *)v7 initWithSessionID:v8 completionHandler:v12];
  v11 = (void *)v17[5];
  v17[5] = v10;

  _Block_object_dispose(&v16, 8);
}

- (IDSGroupSessionKeyValueDelivery)initWithSessionID:(id)a3
{
  return [(IDSGroupSessionKeyValueDelivery *)self initWithSessionID:a3 completionHandler:0];
}

- (id)_initWithSessionID:(id)a3
{
  return [(IDSGroupSessionKeyValueDelivery *)self initWithSessionID:a3 completionHandler:0];
}

- (IDSGroupSessionKeyValueDelivery)initWithSessionID:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IDSGroupSessionKeyValueDelivery;
  id v9 = [(IDSGroupSessionKeyValueDelivery *)&v23 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionID, a3);
    if (!v10->_deliveryHandlers)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      deliveryHandlers = v10->_deliveryHandlers;
      v10->_deliveryHandlers = v11;
    }
    id v13 = [MEMORY[0x1E4F6B460] GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)MEMORY[0x192FE03B0](v8);
      *(_DWORD *)buf = 138412546;
      id v25 = v7;
      __int16 v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "IDSGroupSessionKeyValueDelivery init: %@ with completionHandler: %@", buf, 0x16u);
    }
    uint64_t v15 = MEMORY[0x192FE03B0](v8);
    id setupXPCCompletionHandler = v10->_setupXPCCompletionHandler;
    v10->_id setupXPCCompletionHandler = (id)v15;

    ids_monotonic_time();
    v10->_setupTime = v17;
    uint64_t v18 = +[IDSInternalQueueController sharedInstance];
    v19 = [v18 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919E0FE8;
    block[3] = &unk_1E5729000;
    v22 = v10;
    dispatch_sync(v19, block);
  }
  return v10;
}

- (void)dealloc
{
  sessionID = self->_sessionID;
  self->_sessionID = 0;

  xpc = self->_xpc;
  self->_xpc = 0;

  v5.receiver = self;
  v5.super_class = (Class)IDSGroupSessionKeyValueDelivery;
  [(IDSGroupSessionKeyValueDelivery *)&v5 dealloc];
}

- (void)_setUpXPC
{
  v3 = self->_sessionID;
  v4 = [IDSXPCConnectionRemoteObjectPromise alloc];
  objc_super v5 = +[IDSXPCGroupSessionKeyValueDeliveryInterface interface];
  id v6 = +[IDSInternalQueueController sharedInstance];
  id v7 = [v6 queue];
  id v8 = [(IDSXPCConnectionRemoteObjectPromise *)v4 initWithInterface:v5 queue:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1919E1194;
  v13[3] = &unk_1E572CAC8;
  id v14 = v3;
  uint64_t v15 = self;
  uint64_t v16 = v8;
  id v9 = v8;
  uint64_t v10 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:v13];
  v11 = [(IDSXPCConnectionRemoteObjectPromise *)v9 remoteObjectProxy];
  xpc = self->_xpc;
  self->_xpc = v11;
}

- (void)addDeliveryHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  id v6 = [v5 queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919E1748;
  v8[3] = &unk_1E57291B8;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)removeDeliveryHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  id v6 = [v5 queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919E18A4;
  v8[3] = &unk_1E57291B8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4
{
  id v7 = +[IDSInternalQueueController sharedInstance];
  id v8 = [v7 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1919E1B2C;
  block[3] = &unk_1E572CAF0;
  unsigned int v10 = a3;
  void block[4] = self;
  block[5] = a4;
  dispatch_async(v8, block);
}

- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6
{
}

- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = +[IDSInternalQueueController sharedInstance];
  uint64_t v16 = [v15 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1919E1D88;
  block[3] = &unk_1E572C118;
  id v21 = v12;
  id v22 = v13;
  objc_super v23 = self;
  id v24 = v14;
  unsigned int v25 = a4;
  unsigned int v26 = a5;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  dispatch_async(v16, block);
}

- (void)test_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5
{
  id v8 = a3;
  id v9 = +[IDSInternalQueueController sharedInstance];
  unsigned int v10 = [v9 queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1919E2184;
  v12[3] = &unk_1E572CB40;
  void v12[4] = self;
  id v13 = v8;
  unsigned int v15 = a4;
  unint64_t v14 = a5;
  id v11 = v8;
  dispatch_async(v10, v12);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (IDSGroupSessionKeyValueDelivery)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IDSGroupSessionKeyValueDelivery;
  id v3 = a3;
  id v4 = [(IDSGroupSessionKeyValueDelivery *)&v8 init];
  objc_super v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"sessionID", v8.receiver, v8.super_class);

  if (v5)
  {
    id v4 = (IDSGroupSessionKeyValueDelivery *)[(IDSGroupSessionKeyValueDelivery *)v4 _initWithSessionID:v5];
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryHandlers, 0);
  objc_storeStrong((id *)&self->_xpc, 0);
  objc_storeStrong(&self->_setupXPCCompletionHandler, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end