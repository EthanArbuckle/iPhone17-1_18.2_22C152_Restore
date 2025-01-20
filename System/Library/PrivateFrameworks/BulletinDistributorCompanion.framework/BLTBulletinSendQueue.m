@interface BLTBulletinSendQueue
- (BLTBulletinSendQueue)init;
- (BOOL)handleFileURL:(id)a3;
- (SWWakingTimer)timer;
- (void)_queue_performSend;
- (void)_queue_queuePending;
- (void)_queue_sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 isTrafficRestricted:(BOOL)a6 didSend:(id)a7 didQueue:(id)a8;
- (void)_queue_startTimerWithFireDate:(id)a3;
- (void)queuePending;
- (void)sendNow;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5 didQueue:(id)a6;
- (void)sendRequest:(id)a3 withTimeout:(id)a4 didSend:(id)a5;
- (void)sendRequest:(id)a3 withTimeout:(id)a4 isTrafficRestricted:(BOOL)a5 didSend:(id)a6;
- (void)setTimer:(id)a3;
@end

@implementation BLTBulletinSendQueue

- (BLTBulletinSendQueue)init
{
  v19.receiver = self;
  v19.super_class = (Class)BLTBulletinSendQueue;
  v2 = [(BLTBulletinSendQueue *)&v19 init];
  if (v2)
  {
    if ([MEMORY[0x263F57700] activePairedDeviceSupportsAttachmentFiles])
    {
      v3 = objc_alloc_init(BLTBulletinSendQueueAttachmentSender);
      attachmentSender = v2->_attachmentSender;
      v2->_attachmentSender = v3;
    }
    v5 = [[BLTSendQueueSerializer alloc] initWithUsesMessageIdentifiers:0];
    queueSerializer = v2->_queueSerializer;
    v2->_queueSerializer = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("BLTBulletinSendQueueSupported", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    queuedBlockHandlers = v2->_queuedBlockHandlers;
    v2->_queuedBlockHandlers = (NSMutableArray *)v13;

    v15 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__BLTBulletinSendQueue_init__block_invoke;
    block[3] = &unk_264683BD8;
    v18 = v2;
    dispatch_async(v15, block);
  }
  return v2;
}

void __28__BLTBulletinSendQueue_init__block_invoke(uint64_t a1)
{
  v2 = BLTFileURLInPairingPathWait(@"bulletintmpdata");
  if (!v2)
  {
    v3 = blt_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __28__BLTBulletinSendQueue_init__block_invoke_cold_2(v3);
    }

    v2 = BLTFileURLInHomePath(@"bulletintmpdata");
    if (!v2)
    {
      v4 = blt_general_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __28__BLTBulletinSendQueue_init__block_invoke_cold_1(v4);
      }

      v2 = 0;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 88) setSendFileURL:v2];
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5 didQueue:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BLTBulletinSendQueue_sendRequest_type_didSend_didQueue___block_invoke;
  block[3] = &unk_2646848A8;
  void block[4] = self;
  id v18 = v10;
  unsigned __int16 v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

uint64_t __58__BLTBulletinSendQueue_sendRequest_type_didSend_didQueue___block_invoke(uint64_t a1)
{
  v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_INFO, "Queuing new request", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendRequest:type:withTimeout:isTrafficRestricted:didSend:didQueue:", *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 64), 0, 0, *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)sendRequest:(id)a3 withTimeout:(id)a4 didSend:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__BLTBulletinSendQueue_sendRequest_withTimeout_didSend___block_invoke;
  block[3] = &unk_264683E78;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

uint64_t __56__BLTBulletinSendQueue_sendRequest_withTimeout_didSend___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [*(id *)(a1 + 32) redact];
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_INFO, "Queuing new intelligent summary request %@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_queue_sendRequest:type:withTimeout:isTrafficRestricted:didSend:didQueue:", *(void *)(a1 + 32), 27, *(void *)(a1 + 48), 0, 0, 0);
}

- (void)sendRequest:(id)a3 withTimeout:(id)a4 isTrafficRestricted:(BOOL)a5 didSend:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__BLTBulletinSendQueue_sendRequest_withTimeout_isTrafficRestricted_didSend___block_invoke;
  block[3] = &unk_2646848D0;
  id v18 = v10;
  id v19 = self;
  BOOL v22 = a5;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

void __76__BLTBulletinSendQueue_sendRequest_withTimeout_isTrafficRestricted_didSend___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [*(id *)(a1 + 32) redact];
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_INFO, "Queuing new add bulletin request %@", buf, 0xCu);
  }
  v4 = [*(id *)(a1 + 32) bulletin];
  int v5 = *(void **)(*(void *)(a1 + 40) + 80);
  v6 = [v4 attachmentURLURL];
  uint64_t v7 = [v4 attachmentKey:0];
  [v5 addAttachment:v6 key:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v4 additionalAttachments];
  uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = *(void **)(*(void *)(a1 + 40) + 80);
        id v14 = [v12 attachmentURLURL];
        id v15 = [v12 identifier];
        id v16 = [v4 attachmentKey:v15];
        [v13 addAttachment:v14 key:v16];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 40), "_queue_sendRequest:type:withTimeout:isTrafficRestricted:didSend:didQueue:", *(void *)(a1 + 32), 1, *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56), 0);
}

- (void)_queue_sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 isTrafficRestricted:(BOOL)a6 didSend:(id)a7 didQueue:(id)a8
{
  BOOL v10 = a6;
  uint64_t v12 = a4;
  id v40 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v18 = (void *)MEMORY[0x263EFF910];
  double v19 = 0.5;
  if (v10) {
    double v19 = (double)BLTGetTrafficRestrictedBufferTime();
  }
  long long v20 = [v18 dateWithTimeIntervalSinceNow:v19];
  lastItemDate = self->_lastItemDate;
  if (lastItemDate)
  {
    uint64_t v22 = [(NSDate *)lastItemDate earlierDate:v20];

    [(BLTBulletinSendQueue *)self _queue_queuePending];
    [(BLTSendQueueSerializer *)self->_queueSerializer add:v40 type:v12];
    long long v20 = (void *)v22;
    unint64_t v23 = 0x267F97000;
    if (v10)
    {
LABEL_5:
      v24 = [NSNumber numberWithInteger:5];
      timeout = self->_timeout;
      self->_timeout = v24;
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x263EFF910];
    double v27 = 1.0;
    if (v10) {
      double v27 = (double)BLTGetTrafficRestrictedBufferTime();
    }
    v28 = [v26 dateWithTimeIntervalSinceNow:v27];
    v29 = self->_lastItemDate;
    self->_lastItemDate = v28;

    unint64_t v23 = 0x267F97000uLL;
    objc_storeStrong((id *)&self->_firstRequest, a3);
    self->_firstRequestType = v12;
    if (v10) {
      goto LABEL_5;
    }
  }
  if (v15)
  {
    v30 = self->_timeout;
    if (!v30 || [(NSNumber *)v30 compare:v15] == NSOrderedAscending)
    {
      v31 = (NSNumber *)v15;
      timeout = self->_timeout;
      self->_timeout = v31;
      goto LABEL_13;
    }
  }
LABEL_14:
  if (v16)
  {
    completionHandlers = self->_completionHandlers;
    v33 = (void *)[v16 copy];
    [(NSMutableArray *)completionHandlers addObject:v33];
  }
  if (v17)
  {
    queuedBlockHandlers = self->_queuedBlockHandlers;
    v35 = (void *)[v17 copy];
    [(NSMutableArray *)queuedBlockHandlers addObject:v35];
  }
  if (*(Class *)((char *)&self->super.super.isa + *(int *)(v23 + 3052)))
  {
    if (!v10)
    {
      lastQueueSendDate = self->_lastQueueSendDate;
      if (!lastQueueSendDate) {
        goto LABEL_24;
      }
      [(NSDate *)lastQueueSendDate timeIntervalSinceNow];
      if (v37 < -0.5) {
        goto LABEL_24;
      }
    }
  }
  v38 = [MEMORY[0x263EFF910] date];
  v39 = [v20 earlierDate:v38];

  if (v39 == v20) {
LABEL_24:
  }
    [(BLTBulletinSendQueue *)self _queue_performSend];
  else {
    [(BLTBulletinSendQueue *)self _queue_startTimerWithFireDate:v20];
  }
}

- (BOOL)handleFileURL:(id)a3
{
  queueSerializer = self->_queueSerializer;
  id v5 = a3;
  v6 = [(BLTBulletinSendQueuePassthrough *)self delegate];
  LOBYTE(queueSerializer) = [(BLTSendQueueSerializer *)queueSerializer handleFileURL:v5 protobufHandler:v6];

  return (char)queueSerializer;
}

- (void)queuePending
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__BLTBulletinSendQueue_queuePending__block_invoke;
  block[3] = &unk_264683BD8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__BLTBulletinSendQueue_queuePending__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_queuePending");
}

- (void)sendNow
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__BLTBulletinSendQueue_sendNow__block_invoke;
  block[3] = &unk_264683BD8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __31__BLTBulletinSendQueue_sendNow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performSend");
}

- (void)_queue_performSend
{
  lastItemDate = self->_lastItemDate;
  blt_general_log();
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_INFO);
  if (lastItemDate)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222F4C000, &v4->super.super, OS_LOG_TYPE_INFO, "Sending queue now", buf, 2u);
    }

    v6 = self->_lastItemDate;
    self->_lastItemDate = 0;

    uint64_t v7 = [(BLTBulletinSendQueue *)self timer];
    [v7 invalidate];

    [(BLTBulletinSendQueue *)self setTimer:0];
    v4 = self->_timeout;
    timeout = self->_timeout;
    self->_timeout = 0;

    v26 = (void *)[(NSMutableArray *)self->_completionHandlers copy];
    [(NSMutableArray *)self->_completionHandlers removeAllObjects];
    double v27 = (void *)[(NSMutableArray *)self->_queuedBlockHandlers copy];
    [(NSMutableArray *)self->_queuedBlockHandlers removeAllObjects];
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    lastQueueSendDate = self->_lastQueueSendDate;
    self->_lastQueueSendDate = v9;

    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    char v62 = 0;
    *(void *)buf = 0;
    v54 = buf;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__4;
    v57 = __Block_byref_object_dispose__4;
    id v58 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    char v52 = 0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = __Block_byref_object_copy__4;
    v49[4] = __Block_byref_object_dispose__4;
    id v50 = 0;
    dispatch_group_t v11 = dispatch_group_create();
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    char v48 = 0;
    attachmentSender = self->_attachmentSender;
    id v13 = [(BLTBulletinSendQueuePassthrough *)self delegate];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke;
    v42[3] = &unk_264684920;
    v42[4] = self;
    v44 = v47;
    v45 = &v59;
    v46 = buf;
    id v14 = v11;
    v43 = v14;
    LODWORD(attachmentSender) = [(BLTBulletinSendQueueAttachmentSender *)attachmentSender sendAttachmentsWithSender:v13 timeout:v4 completion:v42];

    if (attachmentSender) {
      dispatch_group_enter(v14);
    }
    else {
      *((unsigned char *)v60 + 24) = 1;
    }

    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    char v41 = 0;
    dispatch_group_enter(v14);
    if (self->_firstRequest)
    {
      id v15 = [(BLTBulletinSendQueuePassthrough *)self delegate];
      firstRequest = self->_firstRequest;
      uint64_t firstRequestType = self->_firstRequestType;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_3;
      v38[3] = &unk_264684920;
      v38[4] = self;
      v39[1] = v40;
      v39[2] = v51;
      v39[3] = v49;
      v39[0] = v14;
      uint64_t v18 = [v27 count];
      if (v18)
      {
        double v19 = [v27 objectAtIndexedSubscript:0];
      }
      else
      {
        double v19 = 0;
      }
      [v15 sendRequest:firstRequest type:firstRequestType withTimeout:v4 didSend:v38 didQueue:v19];
      uint64_t v22 = (id *)v39;
      if (v18) {

      }
      unint64_t v23 = self->_firstRequest;
      self->_firstRequest = 0;
    }
    else
    {
      queueSerializer = self->_queueSerializer;
      long long v21 = [(BLTBulletinSendQueuePassthrough *)self delegate];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_5;
      v36[3] = &unk_264684920;
      v36[4] = self;
      v37[1] = v40;
      v37[2] = v51;
      v37[3] = v49;
      v37[0] = v14;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_7;
      v34[3] = &unk_264683BD8;
      v35 = v27;
      [(BLTSendQueueSerializer *)queueSerializer sendWithSender:v21 timeout:v4 responseHandlers:0 didSend:v36 didQueue:v34];
      uint64_t v22 = (id *)v37;

      unint64_t v23 = v35;
    }

    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_8;
    block[3] = &unk_264684948;
    id v29 = v26;
    v30 = &v59;
    v31 = v51;
    v32 = buf;
    v33 = v49;
    id v25 = v26;
    dispatch_group_notify(v14, queue, block);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v47, 8);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v51, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v59, 8);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222F4C000, &v4->super.super, OS_LOG_TYPE_INFO, "Request to send queue now. Nothing to send.", buf, 2u);
  }
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_2;
  block[3] = &unk_2646848F8;
  char v14 = a2;
  long long v13 = *(_OWORD *)(a1 + 56);
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(a1 + 72);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    v3 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v3);
  }
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_4;
  block[3] = &unk_2646848F8;
  char v14 = a2;
  long long v13 = *(_OWORD *)(a1 + 56);
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(a1 + 72);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    v3 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v3);
  }
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__BLTBulletinSendQueue__queue_performSend__block_invoke_6;
  block[3] = &unk_2646848F8;
  char v14 = a2;
  long long v13 = *(_OWORD *)(a1 + 56);
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(a1 + 72);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    v3 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v3);
  }
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_7(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __42__BLTBulletinSendQueue__queue_performSend__block_invoke_8(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          BOOL v7 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0;
        }
        else {
          BOOL v7 = 1;
        }
        uint64_t v8 = !v7;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          uint64_t v9 = *(void *)(a1 + 56);
        }
        else {
          uint64_t v9 = *(void *)(a1 + 64);
        }
        (*(void (**)(void, uint64_t, void))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * i), v8, *(void *)(*(void *)(v9 + 8) + 40));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)_queue_startTimerWithFireDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BLTBulletinSendQueue *)self timer];
  [v5 invalidate];

  long long v6 = (void *)[objc_alloc(MEMORY[0x263F7C4A8]) initWithIdentifier:@"com.apple.bulletindistributor.coalescebulletinrequest"];
  [(BLTBulletinSendQueue *)self setTimer:v6];

  objc_initWeak(&location, self);
  BOOL v7 = [(BLTBulletinSendQueue *)self timer];
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__BLTBulletinSendQueue__queue_startTimerWithFireDate___block_invoke;
  v9[3] = &unk_264684970;
  objc_copyWeak(&v10, &location);
  [v7 scheduleForDate:v4 leewayInterval:queue queue:v9 handler:1.0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __54__BLTBulletinSendQueue__queue_startTimerWithFireDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_performSend");
}

- (void)_queue_queuePending
{
  firstRequest = self->_firstRequest;
  if (firstRequest)
  {
    [(BLTSendQueueSerializer *)self->_queueSerializer add:firstRequest type:self->_firstRequestType];
    id v4 = self->_firstRequest;
    self->_firstRequest = 0;
  }
}

- (SWWakingTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queueSerializer, 0);
  objc_storeStrong((id *)&self->_attachmentSender, 0);
  objc_storeStrong((id *)&self->_lastQueueSendDate, 0);
  objc_storeStrong((id *)&self->_firstRequest, 0);
  objc_storeStrong((id *)&self->_lastItemDate, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_queuedBlockHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __28__BLTBulletinSendQueue_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "ERROR! Unable to create fall back URL!", v1, 2u);
}

void __28__BLTBulletinSendQueue_init__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "ERROR! Bulletin send queue file URL is nil!", v1, 2u);
}

@end