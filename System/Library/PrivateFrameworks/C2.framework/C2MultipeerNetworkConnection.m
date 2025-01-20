@interface C2MultipeerNetworkConnection
- (C2MultipeerNetworkConnection)initWithParent:(id)a3 queue:(id)a4 connection:(id)a5 peerID:(id)a6 isClientConnection:(BOOL)a7;
- (NSMutableData)receiveLengthBuffer;
- (NSMutableData)receiveMessageBuffer;
- (OS_nw_connection)connection;
- (int)connectionState;
- (void)receiveNextMessage;
- (void)sendMessageWithData:(id)a3 completionHandler:(id)a4;
- (void)setConnection:(id)a3;
- (void)setConnectionState:(int)a3;
- (void)setReceiveLengthBuffer:(id)a3;
- (void)setReceiveMessageBuffer:(id)a3;
- (void)startConnection;
- (void)stopConnection;
@end

@implementation C2MultipeerNetworkConnection

- (C2MultipeerNetworkConnection)initWithParent:(id)a3 queue:(id)a4 connection:(id)a5 peerID:(id)a6 isClientConnection:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)C2MultipeerNetworkConnection;
  v14 = [(C2MultipeerConnection *)&v21 initWithParent:a3 queue:a4 peerID:a6 isClientConnection:v7];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_connection, a5);
    v15->_connectionState = 0;
    v16 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    receiveLengthBuffer = v15->_receiveLengthBuffer;
    v15->_receiveLengthBuffer = v16;

    v18 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    receiveMessageBuffer = v15->_receiveMessageBuffer;
    v15->_receiveMessageBuffer = v18;
  }
  return v15;
}

- (void)startConnection
{
  v7.receiver = self;
  v7.super_class = (Class)C2MultipeerNetworkConnection;
  [(C2MultipeerConnection *)&v7 startConnection];
  connection = self->_connection;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__C2MultipeerNetworkConnection_startConnection__block_invoke;
  v6[3] = &unk_1E6CCC070;
  v6[4] = self;
  MEMORY[0x1E01B88E0](connection, v6);
  v4 = self->_connection;
  v5 = [(C2MultipeerConnection *)self queue];
  nw_connection_set_queue(v4, v5);

  nw_connection_start((nw_connection_t)self->_connection);
}

void __47__C2MultipeerNetworkConnection_startConnection__block_invoke(uint64_t a1, int a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v4);

  *(_DWORD *)(*(void *)(a1 + 32) + 56) = a2;
  switch(a2)
  {
    case 0:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_130);
      }
      v5 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v6 = *(void **)(a1 + 32);
        objc_super v7 = v5;
        v8 = [v6 peerID];
        int v26 = 138412290;
        v27 = v8;
        v9 = "nw_connection_state_invalid for peer %@";
        goto LABEL_14;
      }
      break;
    case 1:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_133);
      }
      v10 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v11 = *(void **)(a1 + 32);
        objc_super v7 = v10;
        v8 = [v11 peerID];
        int v26 = 138412290;
        v27 = v8;
        v9 = "nw_connection_state_waiting for peer %@";
        goto LABEL_14;
      }
      break;
    case 2:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_136);
      }
      v12 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        id v13 = *(void **)(a1 + 32);
        objc_super v7 = v12;
        v8 = [v13 peerID];
        int v26 = 138412290;
        v27 = v8;
        v9 = "nw_connection_state_preparing for peer %@";
LABEL_14:
        _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v26, 0xCu);
      }
      break;
    case 3:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_139);
      }
      v14 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v15 = *(void **)(a1 + 32);
        v16 = v14;
        v17 = [v15 peerID];
        int v26 = 138412290;
        v27 = v17;
        _os_log_impl(&dword_1DD523000, v16, OS_LOG_TYPE_INFO, "nw_connection_state_ready for peer %@", (uint8_t *)&v26, 0xCu);
      }
      [*(id *)(a1 + 32) receiveNextMessage];
      break;
    case 4:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_142);
      }
      v18 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v19 = *(void **)(a1 + 32);
        v20 = v18;
        objc_super v21 = [v19 peerID];
        int v26 = 138412290;
        v27 = v21;
        _os_log_impl(&dword_1DD523000, v20, OS_LOG_TYPE_INFO, "nw_connection_state_failed for peer %@", (uint8_t *)&v26, 0xCu);
      }
      nw_connection_cancel(*(nw_connection_t *)(*(void *)(a1 + 32) + 64));
      break;
    case 5:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_145);
      }
      v22 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v23 = *(void **)(a1 + 32);
        v24 = v22;
        v25 = [v23 peerID];
        int v26 = 138412290;
        v27 = v25;
        _os_log_impl(&dword_1DD523000, v24, OS_LOG_TYPE_INFO, "nw_connection_state_cancelled for peer %@", (uint8_t *)&v26, 0xCu);
      }
      [*(id *)(a1 + 32) stopConnection];
      break;
    default:
      return;
  }
}

uint64_t __47__C2MultipeerNetworkConnection_startConnection__block_invoke_2()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __47__C2MultipeerNetworkConnection_startConnection__block_invoke_131()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __47__C2MultipeerNetworkConnection_startConnection__block_invoke_134()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __47__C2MultipeerNetworkConnection_startConnection__block_invoke_137()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __47__C2MultipeerNetworkConnection_startConnection__block_invoke_140()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __47__C2MultipeerNetworkConnection_startConnection__block_invoke_143()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (void)stopConnection
{
  v3.receiver = self;
  v3.super_class = (Class)C2MultipeerNetworkConnection;
  [(C2MultipeerConnection *)&v3 stopConnection];
  nw_connection_cancel((nw_connection_t)self->_connection);
}

- (void)receiveNextMessage
{
  objc_super v3 = [(C2MultipeerConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  id location = 0;
  objc_initWeak(&location, self);
  connection = self->_connection;
  completion[0] = MEMORY[0x1E4F143A8];
  completion[1] = 3221225472;
  completion[2] = __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke;
  completion[3] = &unk_1E6CCC0C0;
  completion[4] = self;
  objc_copyWeak(&v6, &location);
  nw_connection_receive(connection, 1u, 0x2000000u, completion);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v12);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11) {
    CFErrorRef v14 = nw_error_copy_cf_error(v11);
  }
  else {
    CFErrorRef v14 = 0;
  }
  v15 = v14;
  if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_149);
  }
  v16 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      identifier = nw_content_context_get_identifier(v10);
    }
    else {
      identifier = "(null)";
    }
    v18 = @"no";
    *(_DWORD *)buf = 136315650;
    int v26 = identifier;
    __int16 v27 = 2112;
    if (a4) {
      v18 = @"yes";
    }
    uint64_t v28 = v18;
    __int16 v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1DD523000, v16, OS_LOG_TYPE_DEFAULT, "received message %s, is complete: %@, with error %@", buf, 0x20u);
  }

  if (!v11)
  {
    if (v9)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      objc_super v21 = __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_157;
      v22 = &unk_1E6CCC098;
      uint64_t v23 = *(void *)(a1 + 32);
      id v24 = WeakRetained;
      dispatch_data_apply(v9, &v19);
    }
    objc_msgSend(WeakRetained, "receiveNextMessage", v19, v20, v21, v22, v23);
  }
}

uint64_t __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_2()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_157(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_160);
  }
  v8 = C2_MULTIPEER_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v9;
    __int16 v35 = 2048;
    unint64_t v36 = a5;
    _os_log_impl(&dword_1DD523000, v8, OS_LOG_TYPE_INFO, "[%@ receiveNextMessage] - consuming %llu bytes", buf, 0x16u);
  }
  for (; a5; a5 -= v21)
  {
    v10 = [*(id *)(a1 + 40) receiveLengthBuffer];
    unint64_t v11 = [v10 length];

    if (v11 <= 7)
    {
      v12 = [*(id *)(a1 + 40) receiveLengthBuffer];
      unint64_t v13 = 8 - [v12 length];

      if (v13 >= a5) {
        unint64_t v14 = a5;
      }
      else {
        unint64_t v14 = v13;
      }
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_163);
      }
      v15 = C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v34 = v16;
        __int16 v35 = 2048;
        unint64_t v36 = v14;
        __int16 v37 = 2048;
        unint64_t v38 = a5;
        _os_log_impl(&dword_1DD523000, v15, OS_LOG_TYPE_INFO, "[%@ receiveNextMessage] - consuming %llu bytes of %llu bytes for receive length buffer.", buf, 0x20u);
      }
      v17 = [*(id *)(a1 + 40) receiveLengthBuffer];
      [v17 appendBytes:a4 length:v14];

      a5 -= v14;
      if (!a5) {
        break;
      }
      a4 += v14;
    }
    id v18 = [*(id *)(a1 + 40) receiveLengthBuffer];
    uint64_t v19 = *(void *)[v18 bytes];

    uint64_t v20 = [*(id *)(a1 + 40) receiveMessageBuffer];
    unint64_t v21 = v19 - [v20 length];

    if (v21 >= a5) {
      unint64_t v21 = a5;
    }
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_166);
    }
    v22 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v23;
      __int16 v35 = 2048;
      unint64_t v36 = v21;
      __int16 v37 = 2048;
      unint64_t v38 = a5;
      _os_log_impl(&dword_1DD523000, v22, OS_LOG_TYPE_INFO, "[%@ receiveNextMessage] - consuming %llu bytes of %llu bytes for receive message buffer.", buf, 0x20u);
    }
    id v24 = [*(id *)(a1 + 40) receiveMessageBuffer];
    [v24 appendBytes:a4 length:a5];

    v25 = [*(id *)(a1 + 40) receiveMessageBuffer];
    uint64_t v26 = [v25 length];

    if (v26 == v19)
    {
      __int16 v27 = *(void **)(a1 + 40);
      uint64_t v28 = [v27 receiveMessageBuffer];
      [v27 handleData:v28];

      __int16 v29 = objc_opt_new();
      [*(id *)(a1 + 40) setReceiveLengthBuffer:v29];

      v30 = objc_opt_new();
      [*(id *)(a1 + 40) setReceiveMessageBuffer:v30];
    }
    a4 += v21;
  }

  return 1;
}

uint64_t __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_2_158()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_161()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_164()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (void)sendMessageWithData:(id)a3 completionHandler:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(C2MultipeerConnection *)self queue];
  dispatch_assert_queue_V2(v8);

  if (self->_connectionState == 3)
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];
    unint64_t v11 = nw_content_context_create((const char *)[v10 UTF8String]);

    if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_177);
    }
    v12 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v11) {
        identifier = nw_content_context_get_identifier(v11);
      }
      else {
        identifier = "(null)";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      __int16 v29 = 2080;
      v30 = identifier;
      __int16 v31 = 2048;
      uint64_t v32 = [v6 length];
      _os_log_impl(&dword_1DD523000, v12, OS_LOG_TYPE_DEFAULT, "[%@ sendMessageWithData] - sending message %s with length %llu", buf, 0x20u);
    }

    *(void *)buf = 0;
    [v6 length];
    alloc = dispatch_data_create_alloc();
    uint64_t v19 = [v6 length];
    **(void **)buf = v19;
    *(void *)buf += 8;
    uint64_t v20 = *(void **)buf;
    id v21 = v6;
    memcpy(v20, (const void *)[v21 bytes], objc_msgSend(v21, "length"));
    connection = self->_connection;
    uint64_t v23 = *MEMORY[0x1E4F38C58];
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke_178;
    completion[3] = &unk_1E6CCC0E8;
    completion[4] = self;
    uint64_t v26 = v11;
    id v27 = v7;
    id v24 = v11;
    nw_connection_send(connection, alloc, v23, 1, completion);
  }
  else
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_170);
    }
    unint64_t v14 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1DD523000, v14, OS_LOG_TYPE_DEFAULT, "[%@ sendMessageWithData] - failed due to incorrect state", buf, 0xCu);
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34[0] = @"peer connection not ready";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v17 = [v15 errorWithDomain:@"C2MultipeerErrorDomain" code:300 userInfo:v16];
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
  }
}

uint64_t __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke_175()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

void __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke_178(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  v4 = v3;
  if (v3) {
    objc_super v3 = nw_error_copy_cf_error(v3);
  }
  v5 = v3;
  if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_180);
  }
  id v6 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    id v7 = a1[5];
    if (v7) {
      identifier = nw_content_context_get_identifier(v7);
    }
    else {
      identifier = "(null)";
    }
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2080;
    unint64_t v13 = identifier;
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1DD523000, v6, OS_LOG_TYPE_DEFAULT, "[%@ sendMessageWithData] - sending message %s completed with error %@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke_2()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (int)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int)a3
{
  self->_connectionState = a3;
}

- (NSMutableData)receiveLengthBuffer
{
  return self->_receiveLengthBuffer;
}

- (void)setReceiveLengthBuffer:(id)a3
{
}

- (NSMutableData)receiveMessageBuffer
{
  return self->_receiveMessageBuffer;
}

- (void)setReceiveMessageBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiveMessageBuffer, 0);
  objc_storeStrong((id *)&self->_receiveLengthBuffer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end