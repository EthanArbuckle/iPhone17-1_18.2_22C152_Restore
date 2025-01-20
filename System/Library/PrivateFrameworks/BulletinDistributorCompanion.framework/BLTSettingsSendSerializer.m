@interface BLTSettingsSendSerializer
- (BLTSettingsSendSerializer)init;
- (void)handleFileURL:(id)a3;
- (void)sendNowWithSent:(id)a3 withAcknowledgement:(id)a4 withTimeout:(id)a5;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 onlyOneFor:(id)a7 didSend:(id)a8 andResponse:(id)a9 spoolToFile:(BOOL)a10;
@end

@implementation BLTSettingsSendSerializer

- (BLTSettingsSendSerializer)init
{
  v17.receiver = self;
  v17.super_class = (Class)BLTSettingsSendSerializer;
  v2 = [(BLTSettingsSendSerializer *)&v17 init];
  if (v2)
  {
    v3 = [[BLTSendQueueSerializer alloc] initWithUsesMessageIdentifiers:1];
    queueSerializer = v2->_queueSerializer;
    v2->_queueSerializer = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("BLTSettingsSendSerializer", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    ackHandlers = v2->_ackHandlers;
    v2->_ackHandlers = (NSMutableDictionary *)v11;

    v13 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__BLTSettingsSendSerializer_init__block_invoke;
    block[3] = &unk_264683BD8;
    v16 = v2;
    dispatch_async(v13, block);
  }
  return v2;
}

void __33__BLTSettingsSendSerializer_init__block_invoke(uint64_t a1)
{
  v2 = BLTFileURLInPairingPathWait(@"settingsynctmpdata");
  if (!v2)
  {
    v3 = blt_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __33__BLTSettingsSendSerializer_init__block_invoke_cold_2(v3);
    }

    v2 = BLTFileURLInHomePath(@"settingsynctmpdata");
    if (!v2)
    {
      v4 = blt_general_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __28__BLTBulletinSendQueue_init__block_invoke_cold_1(v4);
      }

      v2 = 0;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setSendFileURL:v2];
}

- (void)handleFileURL:(id)a3
{
  queueSerializer = self->_queueSerializer;
  id v5 = a3;
  id v6 = [(BLTSettingsSendSerializerPassthrough *)self delegate];
  [(BLTSendQueueSerializer *)queueSerializer handleFileURL:v5 protobufHandler:v6];
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 onlyOneFor:(id)a7 didSend:(id)a8 andResponse:(id)a9 spoolToFile:(BOOL)a10
{
  uint64_t v14 = a4;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (a10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __117__BLTSettingsSendSerializer_sendRequest_type_withTimeout_withDescription_onlyOneFor_didSend_andResponse_spoolToFile___block_invoke;
    block[3] = &unk_264684AD0;
    void block[4] = self;
    id v25 = v16;
    __int16 v29 = v14;
    id v26 = v18;
    id v27 = v21;
    id v28 = v20;
    dispatch_async(queue, block);
  }
  else
  {
    v23 = [(BLTSettingsSendSerializerPassthrough *)self delegate];
    [v23 sendRequest:v16 type:v14 withTimeout:v17 withDescription:v18 onlyOneFor:v19 didSend:v20 andResponse:v21];
  }
}

void __117__BLTSettingsSendSerializer_sendRequest_type_withTimeout_withDescription_onlyOneFor_didSend_andResponse_spoolToFile___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v7 = *(unsigned __int16 *)(a1 + 72);
  id v23 = 0;
  [v6 add:v5 type:v7 messageIdentifier:&v23];
  id v8 = v23;
  uint64_t v9 = blt_ids_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(id **)(a1 + 48);
    v3 = v10;
    if (!v10)
    {
      uint64_t v11 = NSString;
      v12 = (objc_class *)objc_opt_class();
      v1 = NSStringFromClass(v12);
      v2 = [*(id *)(a1 + 40) redact];
      v3 = [v11 stringWithFormat:@"%@: %@", v1, v2];
    }
    uint64_t v13 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    if (v13) {
      uint64_t v14 = "YES";
    }
    else {
      uint64_t v14 = "NO";
    }
    id v25 = v3;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2080;
    __int16 v29 = v14;
    _os_log_impl(&dword_222F4C000, v9, OS_LOG_TYPE_DEFAULT, "Setting send stored protobuf %@ got message identifier: %@ with response completion: %s", buf, 0x20u);
    if (!v10)
    {
    }
  }

  if (*(void *)(a1 + 56) && v8)
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __117__BLTSettingsSendSerializer_sendRequest_type_withTimeout_withDescription_onlyOneFor_didSend_andResponse_spoolToFile___block_invoke_26;
      v20[3] = &unk_264684AA8;
      uint64_t v9 = &v22;
      objc_copyWeak(&v22, (id *)buf);
      id v21 = *(id *)(a1 + 56);
      id v16 = (void *)[v20 copy];
      v3 = &v21;
    }
    else
    {
      id v16 = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v16 forKeyedSubscript:v8];
    if (v15)
    {

      objc_destroyWeak((id *)&v9->isa);
    }
    objc_destroyWeak((id *)buf);
  }
  id v17 = *(void **)(a1 + 64);
  if (v17)
  {
    id v18 = *(void **)(*(void *)(a1 + 32) + 32);
    id v19 = (void *)[v17 copy];
    [v18 addObject:v19];
  }
}

void __117__BLTSettingsSendSerializer_sendRequest_type_withTimeout_withDescription_onlyOneFor_didSend_andResponse_spoolToFile___block_invoke_26(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  id v6 = WeakRetained;
  if (WeakRetained && WeakRetained[6])
  {
    unint64_t v7 = WeakRetained[8] + 1;
    WeakRetained[8] = v7;
    unint64_t v8 = WeakRetained[7];
    if (v8)
    {
      if (v7 >= v8) {
        unint64_t v7 = WeakRetained[7];
      }
      v5.n128_f64[0] = (double)v7 / (double)v8;
    }
    else
    {
      v5.n128_u64[0] = 1.0;
    }
    (*(void (**)(__n128))(WeakRetained[6] + 16))(v5);
    id v6 = WeakRetained;
  }
}

- (void)sendNowWithSent:(id)a3 withAcknowledgement:(id)a4 withTimeout:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__BLTSettingsSendSerializer_sendNowWithSent_withAcknowledgement_withTimeout___block_invoke;
  v15[3] = &unk_264684B20;
  id v17 = v8;
  id v18 = v9;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, v15);
}

void __77__BLTSettingsSendSerializer_sendNowWithSent_withAcknowledgement_withTimeout___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  *(void *)(*(void *)(a1 + 32) + 56) = [v3 count];
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __77__BLTSettingsSendSerializer_sendNowWithSent_withAcknowledgement_withTimeout___block_invoke_2;
  id v17 = &unk_264684AF8;
  id v4 = v2;
  id v18 = v4;
  id v19 = *(id *)(a1 + 48);
  uint64_t v5 = MEMORY[0x223CAC810](&v14);
  id v6 = (void *)v5;
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 56), "copy", v14, v15, v16, v17, v18);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = v7;

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = (void *)v10[3];
    id v12 = [v10 delegate];
    [v11 sendWithSender:v12 timeout:*(void *)(a1 + 40) responseHandlers:v3 didSend:v6 didQueue:0];
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 1, 0);
    uint64_t v13 = *(void *)(a1 + 56);
    if (v13) {
      (*(void (**)(double))(v13 + 16))(1.0);
    }
  }
}

void __77__BLTSettingsSendSerializer_sendNowWithSent_withAcknowledgement_withTimeout___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acknowledgementBlock, 0);
  objc_storeStrong((id *)&self->_ackHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_queueSerializer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __33__BLTSettingsSendSerializer_init__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "ERROR! Setting send queue file URL is nil!", v1, 2u);
}

@end