@interface CTConnectionPair
- (BOOL)sendData:(id)a3 usingConnection:(int64_t)a4 completion:(id)a5;
- (BOOL)start;
- (CTConnectionPair)initWithQueue:(id)a3 delegate:(id)a4 endpoint1:(id)a5 parameters1:(id)a6 endpoint2:(id)a7 parameter2:(id)a8;
- (void)connectionStateChanged:(int)a3 connectionId:(int64_t)a4;
- (void)dealloc;
- (void)receiveData:(int64_t)a3;
- (void)updatePairState:(int64_t)a3;
@end

@implementation CTConnectionPair

- (CTConnectionPair)initWithQueue:(id)a3 delegate:(id)a4 endpoint1:(id)a5 parameters1:(id)a6 endpoint2:(id)a7 parameter2:(id)a8
{
  id v26 = a3;
  id v15 = a4;
  id v25 = a5;
  id v24 = a6;
  id v16 = a7;
  id v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)CTConnectionPair;
  v18 = [(CTConnectionPair *)&v27 init];
  if (!v18)
  {
LABEL_7:
    v21 = 0;
    goto LABEL_8;
  }
  if (([(id)objc_opt_class() conformsToProtocol:&unk_1ED035840] & 1) == 0)
  {
    v22 = CTLogConnectionPair();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CTConnectionPair initWithQueue:delegate:endpoint1:parameters1:endpoint2:parameter2:](v22);
    }

    goto LABEL_7;
  }
  v18->fStarted = 0;
  objc_storeStrong((id *)&v18->fQueue, a3);
  objc_storeWeak((id *)&v18->fDelegate, v15);
  fConnection1 = v18->fConnection1;
  v18->fConnectionPairState = 0;
  v18->fConnection1 = 0;

  objc_storeStrong((id *)&v18->fEndpoint1, a5);
  objc_storeStrong((id *)&v18->fParameters1, a6);
  v18->fConnectionState1 = 0;
  fConnection2 = v18->fConnection2;
  v18->fConnection2 = 0;

  objc_storeStrong((id *)&v18->fEndpoint2, a7);
  objc_storeStrong((id *)&v18->fParameters2, a8);
  v18->fConnectionState2 = 0;
  v21 = v18;
LABEL_8:

  return v21;
}

- (void)receiveData:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v5 = self->fQueue;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v6 = 72;
  if (!a3) {
    uint64_t v6 = 40;
  }
  v7 = *(NSObject **)((char *)&self->super.isa + v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__CTConnectionPair_receiveData___block_invoke;
  v9[3] = &unk_1E5263FE0;
  v11[1] = (id)a3;
  v8 = v5;
  v10 = v8;
  objc_copyWeak(v11, &location);
  nw_connection_receive_message(v7, v9);
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

void __32__CTConnectionPair_receiveData___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    v11 = CTLogConnectionPair();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __32__CTConnectionPair_receiveData___block_invoke_cold_2();
    }
  }
  else
  {
    if (v8)
    {
      id v12 = v8;
      v13 = *(void **)(a1 + 32);
      objc_copyWeak(to, (id *)(a1 + 40));
      id v14 = v12;
      id v15 = *(void **)(a1 + 48);
      to[1] = v14;
      to[2] = v15;
      id v16 = v13;
      operator new();
    }
    v11 = CTLogConnectionPair();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __32__CTConnectionPair_receiveData___block_invoke_cold_1();
    }
  }
}

- (void)updatePairState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (self->fConnectionPairState != a3)
  {
    self->fConnectionPairState = a3;
    if (a3 == 2)
    {
      nw_connection_cancel((nw_connection_t)self->fConnection1);
      nw_connection_cancel((nw_connection_t)self->fConnection2);
      fConnection1 = self->fConnection1;
      self->fConnection1 = 0;

      fConnection2 = self->fConnection2;
      self->fConnection2 = 0;
    }
    else if (a3 == 1)
    {
      [(CTConnectionPair *)self receiveData:0];
      [(CTConnectionPair *)self receiveData:1];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->fDelegate);
    [WeakRetained connectionPairStateChanged:a3];
  }
}

- (void)connectionStateChanged:(int)a3 connectionId:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (a4 == 1)
  {
    p_int fConnectionState2 = &self->fConnectionState2;
    int fConnectionState2 = self->fConnectionState2;
  }
  else
  {
    if (a4) {
      goto LABEL_7;
    }
    p_int fConnectionState2 = &self->fConnectionState1;
    int fConnectionState2 = self->fConnectionState1;
  }
  if (fConnectionState2 == a3) {
    return;
  }
  int *p_fConnectionState2 = a3;
LABEL_7:
  int fConnectionState1 = self->fConnectionState1;
  if ((fConnectionState1 & 0xFFFFFFFE) == 4 || (self->fConnectionState2 & 0xFFFFFFFE) == 4)
  {
    [(CTConnectionPair *)self updatePairState:2];
    int fConnectionState1 = self->fConnectionState1;
  }
  if (fConnectionState1 == 3 && self->fConnectionState2 == 3)
  {
    [(CTConnectionPair *)self updatePairState:1];
  }
}

- (BOOL)start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (!self->fStarted)
  {
    v4 = (OS_nw_connection *)nw_connection_create((nw_endpoint_t)self->fEndpoint1, (nw_parameters_t)self->fParameters1);
    fConnection1 = self->fConnection1;
    self->fConnection1 = v4;

    if (self->fConnection1)
    {
      uint64_t v6 = (OS_nw_connection *)nw_connection_create((nw_endpoint_t)self->fEndpoint2, (nw_parameters_t)self->fParameters2);
      fConnection2 = self->fConnection2;
      self->fConnection2 = v6;

      id v8 = self->fConnection1;
      if (self->fConnection2)
      {
        nw_connection_set_queue(v8, (dispatch_queue_t)self->fQueue);
        nw_connection_set_queue((nw_connection_t)self->fConnection2, (dispatch_queue_t)self->fQueue);
        id location = 0;
        objc_initWeak(&location, self);
        id v9 = self->fConnection1;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __25__CTConnectionPair_start__block_invoke;
        handler[3] = &unk_1E5264008;
        objc_copyWeak(&v15, &location);
        nw_connection_set_state_changed_handler(v9, handler);
        id v10 = self->fConnection2;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __25__CTConnectionPair_start__block_invoke_54;
        v12[3] = &unk_1E5264008;
        objc_copyWeak(&v13, &location);
        nw_connection_set_state_changed_handler(v10, v12);
        nw_connection_start((nw_connection_t)self->fConnection1);
        nw_connection_start((nw_connection_t)self->fConnection2);
        BOOL v3 = 1;
        self->fStarted = 1;
        objc_destroyWeak(&v13);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
        return v3;
      }
      self->fConnection1 = 0;
    }
    return 0;
  }
  return 1;
}

void __25__CTConnectionPair_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = CTLogConnectionPair();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __25__CTConnectionPair_start__block_invoke_cold_1();
      }
    }
    else
    {
      [WeakRetained connectionStateChanged:a2 connectionId:0];
    }
  }
}

void __25__CTConnectionPair_start__block_invoke_54(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = CTLogConnectionPair();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __25__CTConnectionPair_start__block_invoke_54_cold_1();
      }
    }
    else
    {
      [WeakRetained connectionStateChanged:a2 connectionId:1];
    }
  }
}

- (BOOL)sendData:(id)a3 usingConnection:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (self->fConnection1 && self->fConnection2 && self->fConnectionPairState == 1)
  {
    if (a4) {
      fConnection2 = self->fConnection2;
    }
    else {
      fConnection2 = self->fConnection1;
    }
    id v11 = v8;
    id v12 = dispatch_data_create((const void *)[v11 bytes], objc_msgSend(v11, "length"), 0, 0);
    nw_connection_send(fConnection2, v12, (nw_content_context_t)*MEMORY[0x1E4F38C58], 1, v9);

    BOOL v13 = 1;
  }
  else
  {
    id v14 = CTLogConnectionPair();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CTConnectionPair sendData:usingConnection:completion:]((uint64_t)self, v14);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  fConnection1 = self->fConnection1;
  if (fConnection1) {
    nw_connection_cancel(fConnection1);
  }
  fConnection2 = self->fConnection2;
  if (fConnection2) {
    nw_connection_cancel(fConnection2);
  }
  v5.receiver = self;
  v5.super_class = (Class)CTConnectionPair;
  [(CTConnectionPair *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fParameters2, 0);
  objc_storeStrong((id *)&self->fEndpoint2, 0);
  objc_storeStrong((id *)&self->fConnection2, 0);
  objc_storeStrong((id *)&self->fParameters1, 0);
  objc_storeStrong((id *)&self->fEndpoint1, 0);
  objc_storeStrong((id *)&self->fConnection1, 0);
  objc_destroyWeak((id *)&self->fDelegate);

  objc_storeStrong((id *)&self->fQueue, 0);
}

- (void)initWithQueue:(os_log_t)log delegate:endpoint1:parameters1:endpoint2:parameter2:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "Delegate must conform to CTConnectionPairDelegate protocol", v1, 2u);
}

void __32__CTConnectionPair_receiveData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_18444A000, v0, v1, "Message has no content over %s: %@", v2, v3, v4, v5, v6);
}

void __32__CTConnectionPair_receiveData___block_invoke_cold_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_18444A000, v1, OS_LOG_TYPE_ERROR, "Hit error over Connection %s: %@", v2, 0x16u);
}

void __25__CTConnectionPair_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_18444A000, v0, v1, "Hit error over Connection %s: %@", v2, v3, v4, v5, 2u);
}

void __25__CTConnectionPair_start__block_invoke_54_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_18444A000, v0, v1, "Hit error over Connection %s: %@", v2, v3, v4, v5, 2u);
}

- (void)sendData:(uint64_t)a1 usingConnection:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 > 2) {
    uint64_t v3 = "???";
  }
  else {
    uint64_t v3 = off_1E5264028[v2];
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "Pair is not ready to send, state: %s", (uint8_t *)&v4, 0xCu);
}

@end