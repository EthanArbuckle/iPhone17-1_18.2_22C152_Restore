@interface HAP2CoAPIOThread
+ (void)initialize;
- (BOOL)_processQueueEntry:(id)a3 context:(coap_context_t *)a4;
- (BOOL)_processQueueWithContext:(coap_context_t *)a3;
- (BOOL)_processSessionBlock:(id)a3 consumer:(id)a4 context:(coap_context_t *)a5;
- (HAP2CoAPIOThread)init;
- (HAP2CoAPIOThread)initWithQualityOfService:(int64_t)a3 delegate:(id)a4;
- (coap_context_t)_createContext;
- (id)completedQueue;
- (id)consumerInfo;
- (id)delegate;
- (id)queue;
- (void)_cleanupWithContext:(coap_context_t *)a3;
- (void)_enqueue:(id)a3;
- (void)_registerConsumer:(id)a3 context:(coap_context_t *)a4;
- (void)_unregisterConsumer:(id)a3;
- (void)_wakeUpThread;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)queueSessionBlockForConsumer:(id)a3 sessionBlock:(id)a4 withTimeout:(double)a5 requiresCompletion:(BOOL)a6;
- (void)queueSessionCompletionForConsumer:(id)a3;
- (void)registerConsumer:(id)a3;
- (void)unregisterConsumer:(id)a3;
@end

@implementation HAP2CoAPIOThread

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zombieSessions, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_consumerInfo, 0);
  objc_storeStrong((id *)&self->_completedQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)_processSessionBlock:(id)a3 consumer:(id)a4 context:(coap_context_t *)a5
{
  v8 = (void (**)(id, coap_context_t *, void))a3;
  id v9 = a4;
  [(HAP2CoAPIOThread *)self _assertIsCurrentThread];
  v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = [v10 stringWithFormat:@"%@ Session Block (IO Thread)", v12];

  id v24 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v13];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v14 = -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__HAP2CoAPIOThread__processSessionBlock_consumer_context___block_invoke;
  v17[3] = &unk_1E69F3558;
  id v15 = v9;
  id v18 = v15;
  v19 = &v20;
  [v14 enumerateObjectsUsingBlock:v17];

  v8[2](v8, a5, v21[3]);
  [v24 invalidate];
  LOBYTE(a5) = v21[3] != 0;

  _Block_object_dispose(&v20, 8);
  __HMFActivityScopeLeave();

  return (char)a5;
}

- (id)consumerInfo
{
  if (a1)
  {
    v2 = a1;
    [a1 _assertIsCurrentThread];
    a1 = (id *)v2[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __58__HAP2CoAPIOThread__processSessionBlock_consumer_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  v6 = [v8 consumer];
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 session];
    *a4 = 1;
  }
}

- (void)_unregisterConsumer:(id)a3
{
  id v4 = a3;
  [(HAP2CoAPIOThread *)self _assertIsCurrentThread];
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  id v8 = [v5 stringWithFormat:@"%@ Unregister (IO Thread)", v7];

  id v22 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v8];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__19821;
  uint64_t v20 = __Block_byref_object_dispose__19822;
  id v21 = 0;
  id v9 = -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__HAP2CoAPIOThread__unregisterConsumer___block_invoke;
  v12[3] = &unk_1E69F3530;
  id v10 = v4;
  v14 = self;
  id v15 = &v16;
  id v13 = v10;
  [v9 enumerateObjectsUsingBlock:v12];

  if (v17[5])
  {
    v11 = -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
    [v11 removeObjectsAtIndexes:v17[5]];
  }
  [v22 invalidate];

  _Block_object_dispose(&v16, 8);
  __HMFActivityScopeLeave();
}

void __40__HAP2CoAPIOThread__unregisterConsumer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  v5 = [v17 consumer];
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if ([v17 session])
    {
      uint64_t v10 = [v17 session];
      if (!v10) {
        __assert_rtn("coap_session_set_app_data", "coap_session.c", 86, "session");
      }
      *(void *)(v10 + 344) = 0;
      v11 = [HAP2CoAPIOThreadSessionQueueEntry alloc];
      uint64_t v12 = [v17 session];
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      v14 = [(HAP2CoAPIOThreadSessionQueueEntry *)v11 initWithSession:v12 startTime:v13];

      uint64_t v15 = *(void *)(a1 + 40);
      if (v15) {
        uint64_t v16 = *(void **)(v15 + 128);
      }
      else {
        uint64_t v16 = 0;
      }
      [v16 addObject:v14];
      [v17 setSession:0];
      [*(id *)(a1 + 32) didCloseSession];
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) didUnregister];
    }
  }
}

- (void)_registerConsumer:(id)a3 context:(coap_context_t *)a4
{
  id v6 = a3;
  [(HAP2CoAPIOThread *)self _assertIsCurrentThread];
  uint64_t v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 stringWithFormat:@"%@ Register (IO Thread)", v9];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v10];
  v11 = [[HAP2CoAPIOConsumerInfo alloc] initWithConsumer:v6];
  uint64_t v12 = -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  [v12 addObject:v11];

  if (objc_opt_respondsToSelector()) {
    [v6 didRegister];
  }
  if (a4)
  {
    -[HAP2CoAPIOConsumerInfo setSession:](v11, "setSession:", [v6 shouldOpenSessionWithContext:a4]);
    if ([(HAP2CoAPIOConsumerInfo *)v11 session])
    {
      uint64_t v13 = [(HAP2CoAPIOConsumerInfo *)v11 session];
      if (!v13) {
        __assert_rtn("coap_session_set_app_data", "coap_session.c", 86, "session");
      }
      *(void *)(v13 + 344) = v6;
    }
  }
  [v14 invalidate];

  __HMFActivityScopeLeave();
}

- (BOOL)_processQueueEntry:(id)a3 context:(coap_context_t *)a4
{
  id v6 = (id *)a3;
  [(HAP2CoAPIOThread *)self _assertIsCurrentThread];
  if (!v6)
  {
    id v7 = 0;
    id v11 = 0;
    goto LABEL_12;
  }
  id v7 = v6[1];
  id v8 = v6[2];
  if (v8 == (id)8)
  {
    if (self) {
      lock = self->_lock;
    }
    else {
      lock = 0;
    }
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __47__HAP2CoAPIOThread__processQueueEntry_context___block_invoke;
    uint64_t v16 = &unk_1E69F46E0;
    id v17 = self;
    uint64_t v18 = v6;
    [(HAP2Lock *)lock performBlock:&v13];

LABEL_11:
    id v11 = v6[3];
LABEL_12:
    BOOL v9 = -[HAP2CoAPIOThread _processSessionBlock:consumer:context:](self, "_processSessionBlock:consumer:context:", v11, v7, a4, v13, v14, v15, v16, v17);
    goto LABEL_13;
  }
  if (v8 == (id)2)
  {
    [(HAP2CoAPIOThread *)self _unregisterConsumer:v7];
    goto LABEL_7;
  }
  if (v8 != (id)1) {
    goto LABEL_11;
  }
  [(HAP2CoAPIOThread *)self _registerConsumer:v7 context:a4];
LABEL_7:
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

uint64_t __47__HAP2CoAPIOThread__processQueueEntry_context___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[15];
  }
  return [v1 addObject:*(void *)(a1 + 40)];
}

- (void)_cleanupWithContext:(coap_context_t *)a3
{
  [(HAP2CoAPIOThread *)self _assertIsCurrentThread];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__19821;
  uint64_t v23 = __Block_byref_object_dispose__19822;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__19821;
  id v17 = __Block_byref_object_dispose__19822;
  id v18 = 0;
  if (self) {
    lock = self->_lock;
  }
  else {
    lock = 0;
  }
  id v6 = lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke;
  v12[3] = &unk_1E69F44F0;
  void v12[4] = self;
  v12[5] = &v19;
  [(HAP2Lock *)v6 performBlock:v12];

  [(id)v20[5] enumerateObjectsUsingBlock:&__block_literal_global_19844];
  id v7 = -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_68];

  id v8 = -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  [v8 removeAllObjects];

  if (self) {
    BOOL v9 = self->_lock;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_4;
  v11[3] = &unk_1E69F44F0;
  v11[4] = self;
  v11[5] = &v13;
  [(HAP2Lock *)v10 performBlock:v11];

  [(id)v14[5] enumerateObjectsUsingBlock:&__block_literal_global_70];
  coap_free_context((uint64_t)a3);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

void __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke(uint64_t a1)
{
  v2 = -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 removeAllObjects];
  }
}

uint64_t __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 128);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t result = [v3 count];
  if (result)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5) {
      uint64_t v5 = (void *)v5[16];
    }
    uint64_t v6 = v5;
    uint64_t v7 = [v6 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = *(void **)(v10 + 128);
    }
    else {
      id v11 = 0;
    }
    return [v11 removeAllObjects];
  }
  return result;
}

void __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 distantFuture];
  [v3 reapSession:v4];
}

void __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v2 = [v4 consumer];
  if ([v4 session])
  {
    uint64_t v3 = [v4 session];
    if (!v3) {
      __assert_rtn("coap_session_set_app_data", "coap_session.c", 86, "session");
    }
    *(void *)(v3 + 344) = 0;
    coap_session_release([v4 session]);
    [v4 setSession:0];
  }
  if (v2) {
    [v2 didCloseSession];
  }
}

uint64_t __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v2 = (void *)v2[3];
    if (v2)
    {
      uint64_t v5 = v3;
      uint64_t v2 = (void *)((uint64_t (*)(void *, void, void))v2[2])(v2, 0, 0);
      uint64_t v3 = v5;
    }
  }

  return MEMORY[0x1F41817F8](v2, v3);
}

- (id)queue
{
  if (a1)
  {
    uint64_t v2 = a1;
    [a1[13] assertOwner];
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)_processQueueWithContext:(coap_context_t *)a3
{
  uint64_t v3 = (void *)MEMORY[0x1F4188790](self, a2, a3);
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v370 = *MEMORY[0x1E4F143B8];
  [v3 _assertIsCurrentThread];
  uint64_t v326 = 0;
  v327 = &v326;
  uint64_t v328 = 0x3032000000;
  v329 = __Block_byref_object_copy__19821;
  v330 = __Block_byref_object_dispose__19822;
  id v331 = 0;
  if (v6) {
    uint64_t v7 = (void *)*((void *)v6 + 13);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  v325[0] = MEMORY[0x1E4F143A8];
  v325[1] = 3221225472;
  v325[2] = __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke;
  v325[3] = &unk_1E69F44F0;
  v325[4] = v6;
  v325[5] = &v326;
  [v8 performBlock:v325];

  v323[0] = 0;
  v323[1] = v323;
  v323[2] = 0x3032000000;
  v323[3] = __Block_byref_object_copy__19821;
  v323[4] = __Block_byref_object_dispose__19822;
  id v324 = 0;
  BOOL v9 = (void *)v327[5];
  v322[0] = MEMORY[0x1E4F143A8];
  v322[1] = 3221225472;
  v322[2] = __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_62;
  v322[3] = &unk_1E69F34A8;
  v322[4] = v6;
  v322[5] = v323;
  v322[6] = v5;
  [v9 enumerateObjectsUsingBlock:v322];
  if (v5)
  {
    uint64_t v10 = NSString;
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    v314 = [v10 stringWithFormat:@"%@ CoAP Run", v12];

    v321 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v314];
    if (v6) {
      unsigned int v316 = *((_DWORD *)v6 + 15);
    }
    else {
      unsigned int v316 = 0;
    }
    memset(&v336, 0, sizeof(v336));
    memset(v338, 0, 512);
    unint64_t v332 = 0;
    uint64_t v333 = 0;
    memset(__errnum, 0, sizeof(__errnum));
    gettimeofday((timeval *)__errnum, 0);
    int v312 = __errnum[2];
    uint64_t v317 = *(void *)__errnum;
    uint64_t v320 = v5;
    uint64_t v315 = coap_clock_offset;
    uint64_t v13 = *(char **)(v5 + 16);
    if (v13)
    {
      while (1)
      {
        uint64_t v14 = v13;
        uint64_t v13 = (char *)*((void *)v13 + 10);
        char v15 = *v14;
        if ((*v14 & 4) != 0 && (*v14 & 3) != 0)
        {
          v15 &= ~2u;
          char *v14 = v15;
          uint64_t v16 = (void (*)(uint64_t, char *))*((void *)v14 + 1);
          if (!v16) {
            __assert_rtn("coap_notify_observers", "resource.c", 751, "h");
          }
          id v17 = (uint64_t *)*((void *)v14 + 16);
          if (v17) {
            break;
          }
        }
LABEL_39:
        char *v14 = v15 & 0xFE;
        if (!v13) {
          goto LABEL_40;
        }
      }
      memset(__errnum, 0, sizeof(__errnum));
      while (1)
      {
        if ((*v14 & 1) != 0 || (v17[2] & 0x40) != 0)
        {
          id v18 = (unsigned __int8 *)v17[1];
          if (!v18[226])
          {
            char v19 = *((unsigned char *)v17 + 16);
LABEL_19:
            *((unsigned char *)v17 + 16) = v19 & 0xBF;
            unint64_t v20 = coap_session_max_pdu_size(v18);
            uint64_t v21 = coap_pdu_init(0, 0, 0, v20);
            if (v21)
            {
              uint64_t v22 = (uint64_t)v21;
              if (coap_add_token((uint64_t)v21, v17[4], v17 + 5))
              {
                *(void *)__errnum = v17[4];
                *(void *)&__errnum[2] = v17 + 5;
                uint64_t v23 = v17[1];
                __int16 v24 = *(_WORD *)(v23 + 224) + 1;
                *(_WORD *)(v23 + 224) = v24;
                *(_WORD *)(v22 + 6) = v24;
                *((_WORD *)v17 + 9) = v24;
                BOOL v25 = (v14[144] & 2) == 0 && ((_BYTE)v17[2] & 0xFu) < 5;
                uint64_t v5 = v320;
                *(unsigned char *)uint64_t v22 = v25;
                v16(v320, v14);
                char v26 = *((unsigned char *)v17 + 16);
                char v27 = v26 + 1;
                char v28 = v26 & 0xF0;
                if (*(unsigned char *)v22) {
                  char v29 = v28 & 0xF0 | v27 & 0xF;
                }
                else {
                  char v29 = v28;
                }
                *((unsigned char *)v17 + 16) = v29;
                if (coap_send((unsigned __int8 *)v17[1], v22) == -1)
                {
                  if (maxlog >= 7) {
                    coap_log_impl(7, "coap_check_notify: sending failed, resource stays partially dirty\n");
                  }
                  *((unsigned char *)v17 + 16) |= 0x40u;
                  *v14 |= 2u;
                }
              }
              else
              {
                *((unsigned char *)v17 + 16) |= 0x40u;
                *v14 |= 2u;
                uint64_t v5 = v320;
                if (maxlog >= 7) {
                  coap_log_impl(7, "coap_check_notify: cannot add token, resource stays partially dirty\n");
                }
                coap_delete_pdu((void *)v22);
              }
            }
            else
            {
              *((unsigned char *)v17 + 16) |= 0x40u;
              *v14 |= 2u;
              if (maxlog >= 7) {
                coap_log_impl(7, "coap_check_notify: pdu init failed, resource stays partially dirty\n");
              }
            }
            goto LABEL_37;
          }
          if ((v14[144] & 2) == 0)
          {
            char v19 = *((unsigned char *)v17 + 16);
            if ((v19 & 0xFu) <= 4) {
              goto LABEL_19;
            }
          }
        }
LABEL_37:
        id v17 = (uint64_t *)*v17;
        if (!v17)
        {
          char v15 = *v14;
          goto LABEL_39;
        }
      }
    }
LABEL_40:
    unint64_t v30 = 1000 * (v317 - v315) + ((unint64_t)((double)v312 * 1.024 + 512.0) >> 10);
    unsigned int v31 = *(_DWORD *)(v5 + 192);
    if (v31) {
      uint64_t v32 = 1000 * v31;
    }
    else {
      uint64_t v32 = 300000;
    }
    v33 = *(uint64_t **)(v5 + 56);
    if (!v33)
    {
      unint64_t v34 = 0;
      unint64_t v35 = 0;
      goto LABEL_67;
    }
    unint64_t v34 = 0;
    unint64_t v35 = 0;
    do
    {
      if ((*((_WORD *)v33 + 14) & 0x70) != 0 && v34 <= 0x1FF) {
        *((void *)v338 + v34++) = v33 + 3;
      }
      uint64_t v36 = v33[10];
      while (v36)
      {
        uint64_t v37 = v36;
        uint64_t v36 = *(void *)(v36 + 64);
        if (*(unsigned char *)(v37 + 1) != 2 || *(_DWORD *)(v37 + 4) || *(void *)(v37 + 232)) {
          goto LABEL_53;
        }
        unint64_t v38 = *(void *)(v37 + 272) + v32;
        BOOL v66 = v38 > v30;
        unint64_t v39 = v38 - v30;
        if (v66 && *(unsigned char *)(v37 + 2))
        {
          if (v35 - 1 >= v39) {
            unint64_t v35 = v39;
          }
LABEL_53:
          if ((*(_WORD *)(v37 + 180) & 0x30) != 0 && v34 <= 0x1FF) {
            *((void *)v338 + v34++) = v37 + 176;
          }
        }
        else
        {
          coap_session_free((_DWORD *)v37);
        }
      }
      v33 = (uint64_t *)*v33;
    }
    while (v33);
LABEL_67:
    v41 = *(unsigned __int8 **)(v5 + 64);
    uint64_t v318 = v35;
    if (v41)
    {
      p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___HAP2AccessoryServer + 24);
      while (1)
      {
        while (1)
        {
          v43 = v41;
          v41 = (unsigned __int8 *)*((void *)v41 + 8);
          if (v43[1] != 1) {
            goto LABEL_98;
          }
          if (v43[2] == 4)
          {
            unsigned int v44 = *(_DWORD *)(v5 + 204);
            if (v44) {
              break;
            }
          }
LABEL_77:
          if (*v43 - 3 <= 1 && v43[2] == 3)
          {
            unsigned int v48 = *(_DWORD *)(v5 + 208);
            if (v48)
            {
              uint64_t v49 = *((void *)v43 + 38);
              if (v49)
              {
                unint64_t v50 = v49 + 1000 * v48;
                if (v50 <= v30) {
                  goto LABEL_104;
                }
              }
              else
              {
                *((void *)v43 + 38) = v30;
                unint64_t v50 = v30 + 1000 * v48;
              }
              unint64_t v59 = v50 - v30;
              unint64_t v60 = v318;
              if (v318 - 1 >= v59) {
                unint64_t v60 = v59;
              }
              uint64_t v318 = v60;
            }
          }
LABEL_98:
          if ((*((_WORD *)v43 + 90) & 0xB0) != 0 && v34 <= 0x1FF) {
            *((void *)v338 + v34++) = v43 + 176;
          }
          if (!v41) {
            goto LABEL_107;
          }
        }
        unint64_t v45 = *((void *)v43 + 34) + 1000 * v44;
        BOOL v66 = v45 > v30;
        unint64_t v46 = v45 - v30;
        if (v66)
        {
          unint64_t v47 = v318;
          if (v318 - 1 >= v46) {
            unint64_t v47 = v46;
          }
          uint64_t v318 = v47;
          goto LABEL_77;
        }
        unint64_t v51 = *((void *)v43 + 36);
        if (v51 && *((void *)v43 + 37) < v51) {
          goto LABEL_104;
        }
        if (*v43 - 1 > 1)
        {
          unsigned __int8 v54 = -30;
          __int16 v53 = 0;
          unint64_t v55 = 1;
        }
        else
        {
          __int16 v52 = *((_WORD *)v43 + 112) + 1;
          *((_WORD *)v43 + 112) = v52;
          __int16 v53 = v52;
          unsigned __int8 v54 = 0;
          unint64_t v55 = 0;
        }
        v56 = coap_pdu_init(0, v54, v53, v55);
        if (v56)
        {
          int v57 = coap_send(v43, (uint64_t)v56);
          *((_DWORD *)v43 + 57) = v57;
          if (v57 != -1)
          {
            *((void *)v43 + 34) = v30;
            *((void *)v43 + 36) = v30;
            uint64_t v58 = v318;
            if (v318 - 1 >= 1000 * (unint64_t)*(unsigned int *)(v5 + 204)) {
              uint64_t v58 = 1000 * *(unsigned int *)(v5 + 204);
            }
            uint64_t v318 = v58;
            if (v43[1] != 1) {
              goto LABEL_98;
            }
            goto LABEL_77;
          }
        }
        else
        {
          *((_DWORD *)v43 + 57) = -1;
        }
LABEL_104:
        ++*((_DWORD *)v43 + 1);
        coap_session_disconnected(v43, 1);
        coap_session_release((uint64_t)v43);
        if (!v41) {
          goto LABEL_107;
        }
      }
    }
    p_inst_meths = &OBJC_PROTOCOL___HAP2AccessoryServer.inst_meths;
LABEL_107:
    v61 = (uint64_t *)(v5 + 48);
    uint64_t v62 = *(void *)(v5 + 48);
    unint64_t v313 = v30;
    unint64_t v63 = v318;
    if (v62)
    {
      v311 = (uint64_t *)(v5 + 48);
      while (1)
      {
        unint64_t v64 = *(void *)(v5 + 40);
        unint64_t v65 = *(void *)(v62 + 8);
        BOOL v66 = v30 < v64 || v65 > v30 - v64;
        if (v66) {
          break;
        }
        v67 = *(void **)v62;
        uint64_t *v61 = *(void *)v62;
        if (v67) {
          v67[1] += v65;
        }
        *(void *)uint64_t v62 = 0;
        unsigned int v68 = *(unsigned __int8 *)(v62 + 16);
        uint64_t v69 = *(void *)(v62 + 24);
        if (*(_DWORD *)(v69 + 352) <= v68)
        {
          if (*((__int16 *)p_inst_meths + 180) >= 7)
          {
            coap_session_str(*(void *)(v62 + 24));
            coap_log_impl(7, "** %s: tid=%d: give up after %d attempts\n", (const char *)&coap_session_str_szSession, *(_DWORD *)(v62 + 32), *(unsigned __int8 *)(v62 + 16));
            uint64_t v69 = *(void *)(v62 + 24);
          }
          uint64_t v72 = *(void *)(v62 + 40);
          if (*(unsigned __int8 *)(v72 + 1) >= 0x40u)
          {
            uint64_t v73 = *(void *)(v5 + 16);
            if (v73)
            {
              size_t v74 = *(unsigned __int8 *)(v72 + 4);
              v75 = *(const void **)(v72 + 40);
              do
              {
                uint64_t v76 = v73;
                uint64_t v73 = *(void *)(v73 + 80);
                v77 = *(void **)(v76 + 128);
                if (v77)
                {
                  v78 = *(void **)(v76 + 128);
                  while (1)
                  {
                    v79 = v78;
                    v78 = (void *)*v78;
                    if (v79[1] == v69 && v79[4] == v74 && !memcmp(v75, v79 + 5, v74)) {
                      break;
                    }
                    if (!v78) {
                      goto LABEL_129;
                    }
                  }
                  int v80 = *((unsigned __int8 *)v79 + 16);
                  if ((~v80 & 0x30) != 0)
                  {
                    *((unsigned char *)v79 + 16) = (v80 + 16) & 0x30 | v80 & 0xCF;
                  }
                  else
                  {
                    if (v77 == v79)
                    {
                      *(void *)(v76 + 128) = *v77;
                      v83 = &OBJC_PROTOCOL___HAP2AccessoryServer.inst_meths;
                    }
                    else
                    {
                      do
                      {
                        v81 = v77;
                        v77 = (void *)*v77;
                        if (v77) {
                          BOOL v82 = v77 == v79;
                        }
                        else {
                          BOOL v82 = 1;
                        }
                      }
                      while (!v82);
                      v83 = (__objc2_meth_list **)(&OBJC_PROTOCOL___HAP2AccessoryServer + 24);
                      if (v77) {
                        void *v81 = v78;
                      }
                    }
                    *((unsigned char *)v79 + 16) &= 0xCFu;
                    size_t v84 = v74;
                    uint64_t v85 = v69;
                    if (*((__int16 *)v83 + 180) >= 7)
                    {
                      if (coap_print_addr(v69 + 104, (char *)__errnum, 0x36uLL) && maxlog >= 7) {
                        coap_log_impl(7, "** removed observer %s\n", (const char *)__errnum);
                      }
                      uint64_t v85 = v79[1];
                      size_t v84 = v79[4];
                    }
                    coap_cancel_all_messages(v320, v85, v79 + 5, v84);
                    coap_session_release(v79[1]);
                    v86 = (void *)v79[6];
                    if (v86) {
                      free(v86);
                    }
                    free(v79);
                  }
                }
LABEL_129:
                ;
              }
              while (v73);
              uint64_t v69 = *(void *)(v62 + 24);
              unint64_t v63 = v318;
              uint64_t v5 = v320;
              p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___HAP2AccessoryServer + 24);
              unint64_t v30 = v313;
              v61 = v311;
            }
          }
          if (*(unsigned char *)(v69 + 226))
          {
            --*(unsigned char *)(v69 + 226);
            if (*(unsigned char *)(v69 + 2) == 4) {
              coap_session_connected((unsigned __int8 *)v69);
            }
          }
          if (!**(unsigned char **)(v62 + 40))
          {
            v88 = *(void (**)(uint64_t, void))(v5 + 80);
            if (v88) {
              v88(v5, *(void *)(v62 + 24));
            }
          }
          coap_delete_node((void **)v62);
        }
        else
        {
          *(unsigned char *)(v62 + 16) = v68 + 1;
          memset(__errnum, 0, sizeof(__errnum));
          gettimeofday((timeval *)__errnum, 0);
          unint64_t v70 = 1000 * (*(void *)__errnum - coap_clock_offset)
              + ((unint64_t)((double)__errnum[2] * 1.024 + 512.0) >> 10);
          if (*v61)
          {
            unint64_t v71 = v70 - *(void *)(v5 + 40) + (*(_DWORD *)(v62 + 20) << *(unsigned char *)(v62 + 16));
          }
          else
          {
            unint64_t v71 = (*(_DWORD *)(v62 + 20) << *(unsigned char *)(v62 + 16));
            *(void *)(v5 + 40) = v70;
          }
          *(void *)(v62 + 8) = v71;
          coap_insert_node(v61, (void *)v62);
          if (*((__int16 *)p_inst_meths + 180) >= 7)
          {
            coap_session_str(*(void *)(v62 + 24));
            coap_log_impl(7, "** %s: tid=%d: retransmission #%d\n", (const char *)&coap_session_str_szSession, *(_DWORD *)(v62 + 32), *(unsigned __int8 *)(v62 + 16));
          }
          v87 = *(unsigned __int8 **)(v62 + 24);
          if (v87[226]) {
            --v87[226];
          }
          coap_send_pdu(v87, *(unsigned char **)(v62 + 40), v62);
        }
        uint64_t v62 = *v61;
        if (!*v61) {
          goto LABEL_167;
        }
      }
      unint64_t v89 = v64 - v30 + v65;
      if (v63 - 1 >= v89) {
        unint64_t v63 = v89;
      }
    }
LABEL_167:
    unint64_t v90 = (1000 * v63 + 999) / 0x3E8;
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v91 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
    {
      __errnum[0] = 67109376;
      __errnum[1] = v90;
      LOWORD(__errnum[2]) = 1024;
      *(int *)((char *)&__errnum[2] + 2) = 0;
      _os_log_debug_impl(&dword_1D4758000, v91, OS_LOG_TYPE_DEBUG, "Coap_write timeout %u, requested time %u", (uint8_t *)__errnum, 0xEu);
    }
    unsigned int v319 = v90;
    memset(&v336, 0, sizeof(v336));
    memset(&v335, 0, sizeof(v335));
    memset(&v334, 0, sizeof(v334));
    int v92 = 0;
    if (v34)
    {
      v93 = (int **)v338;
      unint64_t v94 = v34;
      do
      {
        v95 = *v93;
        unint64_t v96 = **v93;
        if ((int)v96 >= v92) {
          int v92 = v96 + 1;
        }
        if ((v95[1] & 0x10) != 0 && __darwin_check_fd_set_overflow(**v93, &v336, 0)) {
          *(__int32_t *)((char *)v336.fds_bits + ((v96 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v96;
        }
        if ((v95[1] & 0x20) != 0)
        {
          int v97 = *v95;
          if (__darwin_check_fd_set_overflow(*v95, &v335, 0)) {
            *(__int32_t *)((char *)v335.fds_bits + (((unint64_t)v97 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v97;
          }
        }
        if ((v95[1] & 0x40) != 0)
        {
          int v98 = *v95;
          if (__darwin_check_fd_set_overflow(*v95, &v336, 0)) {
            *(__int32_t *)((char *)v336.fds_bits + (((unint64_t)v98 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v98;
          }
        }
        if ((v95[1] & 0x80) != 0)
        {
          int v99 = *v95;
          if (__darwin_check_fd_set_overflow(*v95, &v335, 0)) {
            *(__int32_t *)((char *)v335.fds_bits + (((unint64_t)v99 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v99;
          }
          int v100 = *v95;
          if (__darwin_check_fd_set_overflow(*v95, &v334, 0)) {
            *(__int32_t *)((char *)v334.fds_bits + (((unint64_t)v100 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v100;
          }
        }
        ++v93;
        --v94;
      }
      while (v94);
    }
    if (v319)
    {
      LODWORD(v333) = 1000 * (v319 % 0x3E8);
      unint64_t v332 = v319 / 0x3E8uLL;
    }
    v101 = &OBJC_PROTOCOL___HAP2AccessoryServer.inst_meths;
    if ((v316 & 0x80000000) == 0)
    {
      if (__darwin_check_fd_set_overflow(v316, &v336, 0)) {
        v336.fds_bits[v316 >> 5] |= 1 << v316;
      }
      if (v92 <= (int)v316) {
        int v92 = v316 + 1;
      }
    }
    if (v319) {
      v102 = (timeval *)&v332;
    }
    else {
      v102 = 0;
    }
    while (1)
    {
      int v103 = select(v92, &v336, &v335, &v334, v102);
      if (v103 != -1) {
        break;
      }
      if (*__error() != 4)
      {
LABEL_202:
        if ((int)coap_get_log_level() >= 3)
        {
          v104 = __error();
          strerror(*v104);
          coap_log_impl(3, "%s");
        }
        goto LABEL_446;
      }
    }
    if (v103 >= 1 && v34)
    {
      v105 = v338;
      while (1)
      {
        uint64_t v106 = *(void *)v105;
        __int16 v107 = *(_WORD *)(*(void *)v105 + 4);
        if ((v107 & 0x10) == 0) {
          goto LABEL_211;
        }
        int v108 = *(_DWORD *)v106;
        if (__darwin_check_fd_set_overflow(*(_DWORD *)v106, &v336, 0)) {
          break;
        }
        __int16 v107 = *(_WORD *)(v106 + 4);
        if ((v107 & 0x40) == 0) {
          goto LABEL_212;
        }
LABEL_220:
        int v111 = *(_DWORD *)v106;
        if (__darwin_check_fd_set_overflow(*(_DWORD *)v106, &v336, 0))
        {
          __int16 v107 = *(_WORD *)(v106 + 4);
          if (((*(unsigned int *)((char *)v336.fds_bits + (((unint64_t)v111 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v111) & 1) == 0)
          {
LABEL_212:
            if ((v107 & 0x20) == 0) {
              goto LABEL_213;
            }
            goto LABEL_225;
          }
          v107 |= 0x400u;
          *(_WORD *)(v106 + 4) = v107;
          if ((v107 & 0x20) == 0) {
            goto LABEL_213;
          }
        }
        else
        {
          __int16 v107 = *(_WORD *)(v106 + 4);
          if ((v107 & 0x20) == 0) {
            goto LABEL_213;
          }
        }
LABEL_225:
        int v112 = *(_DWORD *)v106;
        if (__darwin_check_fd_set_overflow(*(_DWORD *)v106, &v335, 0))
        {
          __int16 v107 = *(_WORD *)(v106 + 4);
          if (((*(unsigned int *)((char *)v335.fds_bits + (((unint64_t)v112 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v112) & 1) == 0)
          {
LABEL_213:
            if ((v107 & 0x80) != 0) {
              goto LABEL_214;
            }
            goto LABEL_230;
          }
          __int16 v113 = v107 | 0x200;
          *(_WORD *)(v106 + 4) = v113;
          if ((v113 & 0x80) != 0) {
            goto LABEL_214;
          }
        }
        else if ((*(_WORD *)(v106 + 4) & 0x80) != 0)
        {
LABEL_214:
          int v109 = *(_DWORD *)v106;
          if (__darwin_check_fd_set_overflow(*(_DWORD *)v106, &v335, 0)
            && ((*(unsigned int *)((char *)v335.fds_bits + (((unint64_t)v109 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v109) & 1) != 0
            || (int v110 = *(_DWORD *)v106, __darwin_check_fd_set_overflow(*(_DWORD *)v106, &v334, 0))
            && ((*(unsigned int *)((char *)v334.fds_bits + (((unint64_t)v110 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v110) & 1) != 0)
          {
            *(_WORD *)(v106 + 4) |= 0x800u;
          }
        }
LABEL_230:
        v105 = (_OWORD *)((char *)v105 + 8);
        if (!--v34) {
          goto LABEL_231;
        }
      }
      __int16 v107 = *(_WORD *)(v106 + 4);
      if ((*(unsigned int *)((char *)v336.fds_bits + (((unint64_t)v108 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v108))
      {
        v107 |= 0x100u;
        *(_WORD *)(v106 + 4) = v107;
      }
LABEL_211:
      if ((v107 & 0x40) == 0) {
        goto LABEL_212;
      }
      goto LABEL_220;
    }
LABEL_231:
    uint64_t v114 = v320;
    if ((v316 & 0x80000000) == 0
      && __darwin_check_fd_set_overflow(v316, &v336, 0)
      && ((v336.fds_bits[v316 >> 5] >> v316) & 1) != 0)
    {
      do
      {
        while (1)
        {
          ssize_t v115 = read(v316, __errnum, 0x20uLL);
          if (v115 != -1) {
            break;
          }
          if (*__error() == 35 || *__error() == 35) {
            goto LABEL_241;
          }
          if (*__error() != 4) {
            goto LABEL_202;
          }
        }
      }
      while (v115);
      int log_level = coap_get_log_level();
      if (log_level >= 3) {
        coap_log_impl(3, "Pipe closed unexpectedly");
      }
LABEL_446:
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v305 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__errnum[0]) = 0;
        _os_log_error_impl(&dword_1D4758000, v305, OS_LOG_TYPE_ERROR, "Failed to run coap_run_once", (uint8_t *)__errnum, 2u);
      }
      BOOL v40 = 0;
      goto LABEL_452;
    }
LABEL_241:
    memset(__errnum, 0, sizeof(__errnum));
    gettimeofday((timeval *)__errnum, 0);
    unint64_t v116 = 1000 * (*(void *)__errnum - coap_clock_offset)
         + ((unint64_t)((double)__errnum[2] * 1.024 + 512.0) >> 10);
    v117 = *(void **)(v320 + 56);
    if (v117)
    {
      long long v118 = 0uLL;
      while (1)
      {
        uint64_t v119 = (uint64_t)v117;
        v117 = (void *)*v117;
        __int16 v120 = *(_WORD *)(v119 + 28);
        if ((v120 & 0x100) != 0) {
          break;
        }
LABEL_354:
        if ((v120 & 0x400) != 0)
        {
          session = coap_make_session(*(unsigned __int8 *)(v119 + 16), 2, (unsigned int *)(v119 + 48), 0, 0, 0, v114, v119);
          long long v118 = 0uLL;
          if (session)
          {
            v222 = session;
            v223 = session + 104;
            __errnum[0] = 1;
            *(_WORD *)(v119 + 28) &= ~0x400u;
            int v224 = accept(*(_DWORD *)(v119 + 24), (sockaddr *)(session + 108), (socklen_t *)session + 26);
            *((_DWORD *)v222 + 44) = v224;
            if (v224 == -1)
            {
              if (*((__int16 *)v101 + 180) >= 4)
              {
                v255 = __error();
                v256 = strerror(*v255);
                coap_log_impl(4, "coap_socket_accept_tcp: accept: %s\n", v256);
              }
              coap_session_free(v222);
            }
            else
            {
              if (getsockname(v224, (sockaddr *)(v222 + 140), (socklen_t *)v222 + 34) < 0
                && *((__int16 *)v101 + 180) >= 4)
              {
                v225 = __error();
                v226 = strerror(*v225);
                coap_log_impl(4, "coap_socket_accept_tcp: getsockname: %s\n", v226);
              }
              if (ioctl(*((_DWORD *)v222 + 44), 0x8004667EuLL, __errnum) == -1 && *((__int16 *)v101 + 180) >= 4)
              {
                v228 = __error();
                v229 = strerror(*v228);
                coap_log_impl(4, "coap_socket_accept_tcp: ioctl FIONBIO: %s\n", v229);
              }
              unsigned int v230 = 64;
              *((_WORD *)v222 + 90) |= 0x15u;
              *((void *)v222 + 23) = v222;
              uint64_t v231 = 104;
              unsigned int v232 = -1640531527;
              int v233 = -1640531527;
              int v234 = -17973521;
              do
              {
                unsigned int v235 = *(_DWORD *)&v222[v231 + 4] + v232;
                unsigned int v236 = *(_DWORD *)&v222[v231 + 8] + v234;
                int v237 = (*(_DWORD *)&v222[v231] + v233 - (v235 + v236)) ^ (v236 >> 13);
                unsigned int v238 = (v235 - v236 - v237) ^ (v237 << 8);
                unsigned int v239 = (v236 - v237 - v238) ^ (v238 >> 13);
                int v240 = (v237 - v238 - v239) ^ (v239 >> 12);
                unsigned int v241 = (v238 - v239 - v240) ^ (v240 << 16);
                unsigned int v242 = (v239 - v240 - v241) ^ (v241 >> 5);
                int v233 = (v240 - v241 - v242) ^ (v242 >> 3);
                unsigned int v232 = (v241 - v242 - v233) ^ (v233 << 10);
                int v234 = (v242 - v233 - v232) ^ (v232 >> 15);
                v230 -= 12;
                v231 += 12;
              }
              while (v230 > 0xB);
              unsigned int v243 = (v233
                    + (v222[167] << 24)
                    + (v222[166] << 16)
                    + (v222[165] << 8)
                    + v222[164]
                    + -64
                    - v234
                    - v232) ^ ((v234 + 64) >> 13);
              unsigned int v244 = (v232 + -64 - v234 - v243) ^ (v243 << 8);
              unsigned int v245 = (v234 + 64 - v243 - v244) ^ (v244 >> 13);
              int v246 = (v243 - v244 - v245) ^ (v245 >> 12);
              unsigned int v247 = (v244 - v245 - v246) ^ (v246 << 16);
              unsigned int v248 = (v245 - v246 - v247) ^ (v247 >> 5);
              int v249 = (v246 - v247 - v248) ^ (v248 >> 3);
              unsigned int v250 = (v248 - v249 - ((v247 - v248 - v249) ^ (v249 << 10))) ^ (((v247 - v248 - v249) ^ (v249 << 10)) >> 15);
              v251 = (int32x2_t **)(v222 + 48);
              *((void *)v222 + 11) = v223;
              *((_DWORD *)v222 + 24) = 64;
              *((_DWORD *)v222 + 25) = v250;
              uint64_t v252 = *(void *)(v119 + 80);
              long long v118 = 0uLL;
              if (v252)
              {
                *((void *)v222 + 6) = *(void *)(v252 + 48);
                *((void *)v222 + 8) = 0;
                v253 = *(uint64_t **)(v252 + 48);
                uint64_t v254 = v253[3];
                *((void *)v222 + 7) = v254 - v253[4];
                *(void *)(v254 + 16) = v222;
                v253[3] = (uint64_t)v251;
              }
              else
              {
                *((void *)v222 + 7) = 0;
                *((void *)v222 + 8) = 0;
                *(void *)(v119 + 80) = v222;
                v257 = malloc_type_malloc(0x40uLL, 0x10200405F856B24uLL);
                *(void *)(*(void *)(v119 + 80) + 48) = v257;
                if (!v257) {
                  goto LABEL_459;
                }
                v257[2] = 0u;
                v257[3] = 0u;
                _OWORD *v257 = 0u;
                v257[1] = 0u;
                uint64_t v258 = *(void *)(v119 + 80);
                v259 = *(void **)(v258 + 48);
                v259[1] = 0x500000020;
                v259[3] = v258 + 48;
                v259[4] = 48;
                v260 = malloc_type_malloc(0x200uLL, 0x1020040EDED9539uLL);
                **(void **)(*(void *)(v119 + 80) + 48) = v260;
                if (!v260) {
                  goto LABEL_459;
                }
                long long v118 = 0uLL;
                v260[30] = 0u;
                v260[31] = 0u;
                v260[28] = 0u;
                v260[29] = 0u;
                v260[26] = 0u;
                v260[27] = 0u;
                v260[24] = 0u;
                v260[25] = 0u;
                v260[22] = 0u;
                v260[23] = 0u;
                v260[20] = 0u;
                v260[21] = 0u;
                v260[18] = 0u;
                v260[19] = 0u;
                v260[16] = 0u;
                v260[17] = 0u;
                v260[14] = 0u;
                v260[15] = 0u;
                v260[12] = 0u;
                v260[13] = 0u;
                v260[10] = 0u;
                v260[11] = 0u;
                v260[8] = 0u;
                v260[9] = 0u;
                v260[6] = 0u;
                v260[7] = 0u;
                v260[4] = 0u;
                v260[5] = 0u;
                v260[2] = 0u;
                v260[3] = 0u;
                _OWORD *v260 = 0u;
                v260[1] = 0u;
                v253 = *(uint64_t **)(*(void *)(v119 + 80) + 48);
                *((_DWORD *)v253 + 14) = -1609490463;
              }
              ++*((_DWORD *)v253 + 4);
              uint64_t v261 = (*((_DWORD *)v253 + 2) - 1) & v250;
              uint64_t v262 = *v253;
              uint64_t v263 = *v253 + 16 * v261;
              unsigned int v264 = *(_DWORD *)(v263 + 8) + 1;
              *(_DWORD *)(v263 + 8) = v264;
              uint64_t v265 = *(void *)v263;
              *((void *)v222 + 9) = 0;
              *((void *)v222 + 10) = v265;
              if (v265) {
                *(void *)(v265 + 24) = v251;
              }
              *(void *)uint64_t v263 = v251;
              if (v264 >= 10 * *(_DWORD *)(v262 + 16 * v261 + 12) + 10 && !(*v251)[6].i32[1])
              {
                v266 = malloc_type_malloc(32 * (*v251)[1].u32[0], 0x1020040EDED9539uLL);
                if (!v266) {
                  goto LABEL_459;
                }
                v267 = v266;
                bzero(v266, 32 * (*v251)[1].u32[0]);
                v268 = *v251;
                unsigned __int32 v269 = (*v251)[2].u32[0];
                uint64_t v270 = (*v251)[1].u32[0];
                unsigned int v271 = 2 * v270 - 1;
                if ((v271 & v269) != 0) {
                  unsigned int v272 = (v269 >> ((*v251)[1].i32[1] + 1)) + 1;
                }
                else {
                  unsigned int v272 = v269 >> ((*v251)[1].i32[1] + 1);
                }
                v268[5].i32[0] = v272;
                v268[5].i32[1] = 0;
                v273 = (void *)*v268;
                if (v270)
                {
                  int v274 = 0;
                  for (uint64_t i = 0; i != v270; ++i)
                  {
                    uint64_t v276 = v273[2 * i];
                    if (v276)
                    {
                      do
                      {
                        uint64_t v277 = *(void *)(v276 + 32);
                        uint64_t v278 = *(_DWORD *)(v276 + 52) & v271;
                        v279 = (char *)&v267[4 * v278];
                        unsigned int v280 = *((_DWORD *)v279 + 2) + 1;
                        *((_DWORD *)v279 + 2) = v280;
                        if (v280 > v272)
                        {
                          v268[5].i32[1] = ++v274;
                          v267[4 * v278 + 3] = v280 / v272;
                        }
                        *(void *)(v276 + 24) = 0;
                        uint64_t v281 = *(void *)v279;
                        *(void *)(v276 + 32) = *(void *)v279;
                        if (v281) {
                          *(void *)(v281 + 24) = v276;
                        }
                        *(void *)v279 = v276;
                        uint64_t v276 = v277;
                      }
                      while (v277);
                    }
                  }
                }
                free(v273);
                v282 = *v251;
                int32x2_t v283 = (*v251)[1];
                v284.i32[0] = vadd_s32(v283, v283).u32[0];
                v284.i32[1] = vadd_s32(v283, (int32x2_t)0x100000001).i32[1];
                v282[1] = v284;
                int32x2_t *v282 = (int32x2_t)v267;
                if (v282[5].i32[1] <= (unsigned __int32)v282[2].i32[0] >> 1)
                {
                  v282[6].i32[0] = 0;
                  long long v118 = 0uLL;
                }
                else
                {
                  unsigned int v285 = v282[6].i32[0] + 1;
                  v282[6].i32[0] = v285;
                  long long v118 = 0uLL;
                  if (v285 >= 2) {
                    v282[6].i32[1] = 1;
                  }
                }
              }
              if (*((__int16 *)v101 + 180) >= 7)
              {
                coap_session_str((uint64_t)v222);
                coap_log_impl(7, "***%s: new incoming session\n", (const char *)&coap_session_str_szSession);
                long long v118 = 0uLL;
              }
              int v286 = *v222;
              uint64_t v114 = v320;
              if ((v286 - 3) <= 1)
              {
                coap_handle_event(*((void *)v222 + 26), 4097, (uint64_t)v222);
                long long v118 = 0uLL;
                int v286 = *v222;
              }
              if (v286 != 4)
              {
                if (v286 == 3)
                {
                  coap_session_send_csm((unsigned __int8 *)v222);
                  long long v118 = 0uLL;
                }
                *((void *)v222 + 34) = v116;
                goto LABEL_406;
              }
              *((void *)v222 + 27) = 0;
              ++*((_DWORD *)v222 + 1);
              coap_session_release((uint64_t)v222);
            }
            long long v118 = 0uLL;
          }
        }
LABEL_406:
        uint64_t v287 = *(void *)(v119 + 80);
        if (v287)
        {
          do
          {
            uint64_t v288 = *(void *)(v287 + 64);
            __int16 v289 = *(_WORD *)(v287 + 180);
            if ((v289 & 0x100) != 0)
            {
              ++*(_DWORD *)(v287 + 4);
              coap_read_session();
              coap_session_release(v287);
              long long v118 = 0uLL;
              __int16 v289 = *(_WORD *)(v287 + 180);
            }
            if ((v289 & 0x200) != 0)
            {
              ++*(_DWORD *)(v287 + 4);
              coap_write_session(v287, v116);
              coap_session_release(v287);
              long long v118 = 0uLL;
            }
            uint64_t v287 = v288;
          }
          while (v288);
        }
        v101 = &OBJC_PROTOCOL___HAP2AccessoryServer.inst_meths;
        if (!v117) {
          goto LABEL_413;
        }
      }
      if (*(unsigned __int8 *)(v119 + 16) - 3 <= 0xFFFFFFFD) {
        __assert_rtn("coap_read_endpoint", "net.c", 1348, "COAP_PROTO_NOT_RELIABLE(endpoint->proto)");
      }
      if ((v120 & 2) == 0) {
        __assert_rtn("coap_read_endpoint", "net.c", 1349, "endpoint->sock.flags & COAP_SOCKET_BOUND");
      }
      long long v369 = v118;
      long long v368 = v118;
      long long v367 = v118;
      long long v366 = v118;
      long long v365 = v118;
      long long v364 = v118;
      long long v363 = v118;
      long long v362 = v118;
      long long v361 = v118;
      long long v360 = v118;
      long long v359 = v118;
      long long v358 = v118;
      long long v357 = v118;
      long long v356 = v118;
      long long v355 = v118;
      long long v354 = v118;
      long long v353 = v118;
      long long v352 = v118;
      long long v351 = v118;
      long long v350 = v118;
      long long v349 = v118;
      long long v348 = v118;
      long long v347 = v118;
      long long v346 = v118;
      long long v345 = v118;
      long long v344 = v118;
      long long v343 = v118;
      long long v342 = v118;
      long long v340 = v118;
      *(_OWORD *)__errnum = v118;
      *(_OWORD *)v341 = v118;
      *(_OWORD *)&v341[16] = v118;
      int v121 = *(_DWORD *)(v119 + 48);
      __errnum[0] = 28;
      *(_DWORD *)v341 = v121;
      int v122 = *(unsigned __int8 *)(v119 + 53);
      if (v122 == 2)
      {
        *(_OWORD *)&v341[4] = *(_OWORD *)(v119 + 52);
      }
      else if (v122 == 30)
      {
        v341[5] = 30;
        *(_OWORD *)&v341[12] = *(_OWORD *)(v119 + 60);
        *(_WORD *)&v341[6] = *(_WORD *)(v119 + 54);
        *(_DWORD *)&v341[28] = *(_DWORD *)(v119 + 76);
      }
      else
      {
        __memcpy_chk();
      }
      uint64_t v123 = (*(uint64_t (**)(uint64_t, int *))(v114 + 120))(v119 + 24, __errnum);
      if (v123 < 0)
      {
        long long v118 = 0uLL;
        if (maxlog >= 4)
        {
          if (coap_print_addr(v119 + 48, (char *)&coap_endpoint_str_szEndpoint, 0x80uLL)) {
            v159 = (int *)((char *)&coap_endpoint_str_szEndpoint + strlen((const char *)&coap_endpoint_str_szEndpoint));
          }
          else {
            v159 = &coap_endpoint_str_szEndpoint;
          }
          if ((char *)v159 + 6 < (char *)&log_handler)
          {
            int v163 = *(unsigned __int8 *)(v119 + 16);
            if (v163 == 2)
            {
              *((_WORD *)v159 + 2) = 83;
              int v164 = 1280590880;
            }
            else if (v163 == 1)
            {
              *((unsigned char *)v159 + 4) = 0;
              int v164 = 1346655520;
            }
            else
            {
              *((_WORD *)v159 + 2) = 69;
              int v164 = 1313820192;
            }
            int *v159 = v164;
          }
          coap_log_impl(4, "*  %s: read failed\n", v158);
          goto LABEL_352;
        }
        goto LABEL_353;
      }
      uint64_t v124 = v123;
      long long v118 = 0uLL;
      if (!v123) {
        goto LABEL_353;
      }
      unsigned int v125 = 64;
      v126 = __errnum;
      unsigned int v127 = -1640531527;
      int v128 = -1640531527;
      int v129 = -17973521;
      do
      {
        unsigned int v130 = v126[1] + v127;
        unsigned int v131 = v126[2] + v129;
        int v132 = (*v126 + v128 - (v130 + v131)) ^ (v131 >> 13);
        unsigned int v133 = (v130 - v131 - v132) ^ (v132 << 8);
        unsigned int v134 = (v131 - v132 - v133) ^ (v133 >> 13);
        int v135 = (v132 - v133 - v134) ^ (v134 >> 12);
        unsigned int v136 = (v133 - v134 - v135) ^ (v135 << 16);
        unsigned int v137 = (v134 - v135 - v136) ^ (v136 >> 5);
        int v128 = (v135 - v136 - v137) ^ (v137 >> 3);
        unsigned int v127 = (v136 - v137 - v128) ^ (v128 << 10);
        int v129 = (v137 - v128 - v127) ^ (v127 >> 15);
        v126 += 3;
        v125 -= 12;
      }
      while (v125 > 0xB);
      uint64_t v138 = *(void *)(v119 + 80);
      if (!v138)
      {
        uint64_t v160 = *(void *)(v119 + 8);
        goto LABEL_293;
      }
      unsigned int v139 = (v128 + (v341[31] << 24) + (v341[30] << 16) + (v341[29] << 8) + v341[28] + -64 - v129 - v127) ^ ((v129 + 64) >> 13);
      unsigned int v140 = (v127 + -64 - v129 - v139) ^ (v139 << 8);
      unsigned int v141 = (v129 + 64 - v139 - v140) ^ (v140 >> 13);
      int v142 = (v139 - v140 - v141) ^ (v141 >> 12);
      unsigned int v143 = (v140 - v141 - v142) ^ (v142 << 16);
      unsigned int v144 = (v141 - v142 - v143) ^ (v143 >> 5);
      int v145 = (v142 - v143 - v144) ^ (v144 >> 3);
      unsigned int v146 = (v144 - v145 - ((v143 - v144 - v145) ^ (v145 << 10))) ^ (((v143 - v144 - v145) ^ (v145 << 10)) >> 15);
      uint64_t v147 = *(void *)(v138 + 48);
      uint64_t v148 = *(void *)(*(void *)v147 + 16 * ((*(_DWORD *)(v147 + 8) - 1) & v146));
      if (v148)
      {
        uint64_t v149 = -*(void *)(v147 + 32);
        while (1)
        {
          uint64_t v150 = v148 + v149;
          if (*(_DWORD *)(v148 + v149 + 100) == v146 && *(_DWORD *)(v150 + 96) == 64)
          {
            int v151 = memcmp(*(const void **)(v150 + 88), __errnum, 0x40uLL);
            long long v118 = 0uLL;
            if (!v151) {
              break;
            }
          }
          uint64_t v148 = *(void *)(v150 + 80);
          if (!v148) {
            goto LABEL_262;
          }
        }
        *(void *)(v150 + 272) = v116;
        uint64_t v114 = v320;
        v101 = (__objc2_meth_list **)(&OBJC_PROTOCOL___HAP2AccessoryServer + 24);
        goto LABEL_348;
      }
LABEL_262:
      uint64_t v152 = 0;
      uint64_t v153 = 0;
      unsigned int v154 = 0;
      unsigned int v155 = 0;
      v101 = &OBJC_PROTOCOL___HAP2AccessoryServer.inst_meths;
      do
      {
        if (!*(_DWORD *)(v138 + 4) && !*(void *)(v138 + 232))
        {
          int v156 = *(unsigned __int8 *)(v138 + 1);
          if (v156 == 3) {
            goto LABEL_273;
          }
          if (v156 == 2)
          {
            if (!v153 || *(void *)(v138 + 272) < *(void *)(v153 + 272)) {
              uint64_t v153 = v138;
            }
            ++v155;
            if (*(unsigned char *)(v138 + 2) == 2)
            {
LABEL_273:
              ++v154;
              unint64_t v157 = *(void *)(v138 + 272);
              if (v157 + 30000 < v116 && (!v152 || v157 < *(void *)(v152 + 272))) {
                uint64_t v152 = v138;
              }
            }
          }
        }
        uint64_t v138 = *(void *)(v138 + 64);
      }
      while (v138);
      if (*(_DWORD *)(*(void *)(v119 + 8) + 196) - 1 >= v155)
      {
        if (!v152) {
          goto LABEL_286;
        }
        if (maxlog >= 4)
        {
          coap_session_str(v152);
          coap_log_impl(4, "***%s: Incomplete session timed out\n", (const char *)&coap_session_str_szSession);
        }
        uint64_t v153 = v152;
      }
      coap_session_free((_DWORD *)v153);
      long long v118 = 0uLL;
LABEL_286:
      uint64_t v160 = *(void *)(v119 + 8);
      unsigned int v161 = *(_DWORD *)(v160 + 200);
      if (!v161) {
        unsigned int v161 = 100;
      }
      BOOL v66 = v154 > v161;
      uint64_t v114 = v320;
      if (v66)
      {
        if (maxlog >= 7)
        {
          coap_log_impl(7, "Oustanding sessions in COAP_SESSION_STATE_HANDSHAKE too large.  New request ignored\n", 0.0, v308, v309, v310);
LABEL_352:
          long long v118 = 0uLL;
        }
LABEL_353:
        __int16 v120 = *(_WORD *)(v119 + 28);
        goto LABEL_354;
      }
LABEL_293:
      int v162 = *(unsigned __int8 *)(v119 + 16);
      if (v162 == 2)
      {
        if (*((void *)&v342 + 1) <= 0xDuLL)
        {
          if (maxlog >= 7)
          {
            coap_log_impl(7, "coap_dtls_hello: ContentType %d Short Packet (%zu < %d) dropped\n", 0.0);
            goto LABEL_352;
          }
          goto LABEL_353;
        }
        if (v343 == 21) {
          goto LABEL_353;
        }
        if (v343 != 22 || BYTE13(v343) != 1)
        {
          if (maxlog >= 7)
          {
            coap_log_impl(7, "coap_dtls_hello: ContentType %d Handshake %d dropped\n", 0.0);
            goto LABEL_352;
          }
          goto LABEL_353;
        }
        int v162 = 2;
      }
      v165 = coap_make_session(v162, 2, 0, (unsigned int *)v341, (unsigned int *)__errnum, v342, v160, v119);
      long long v118 = 0uLL;
      if (v165)
      {
        uint64_t v150 = (uint64_t)v165;
        *((void *)v165 + 34) = v116;
        int v166 = *(unsigned __int8 *)(v119 + 16);
        if (v166 == 2)
        {
          v165[1] = 3;
        }
        else if (v166 == 1)
        {
          v165[2] = 4;
        }
        unsigned int v167 = 64;
        uint64_t v168 = 104;
        unsigned int v169 = -1640531527;
        int v170 = -1640531527;
        int v171 = -17973521;
        do
        {
          unsigned int v172 = *(_DWORD *)&v165[v168 + 4] + v169;
          unsigned int v173 = *(_DWORD *)&v165[v168 + 8] + v171;
          int v174 = (*(_DWORD *)&v165[v168] + v170 - (v172 + v173)) ^ (v173 >> 13);
          unsigned int v175 = (v172 - v173 - v174) ^ (v174 << 8);
          unsigned int v176 = (v173 - v174 - v175) ^ (v175 >> 13);
          int v177 = (v174 - v175 - v176) ^ (v176 >> 12);
          unsigned int v178 = (v175 - v176 - v177) ^ (v177 << 16);
          unsigned int v179 = (v176 - v177 - v178) ^ (v178 >> 5);
          int v170 = (v177 - v178 - v179) ^ (v179 >> 3);
          unsigned int v169 = (v178 - v179 - v170) ^ (v170 << 10);
          int v171 = (v179 - v170 - v169) ^ (v169 >> 15);
          v167 -= 12;
          v168 += 12;
        }
        while (v167 > 0xB);
        unsigned int v180 = (v170
              + (v165[167] << 24)
              + (v165[166] << 16)
              + (v165[165] << 8)
              + v165[164]
              + -64
              - v171
              - v169) ^ ((v171 + 64) >> 13);
        unsigned int v181 = (v169 + -64 - v171 - v180) ^ (v180 << 8);
        unsigned int v182 = (v171 + 64 - v180 - v181) ^ (v181 >> 13);
        int v183 = (v180 - v181 - v182) ^ (v182 >> 12);
        unsigned int v184 = (v181 - v182 - v183) ^ (v183 << 16);
        unsigned int v185 = (v182 - v183 - v184) ^ (v184 >> 5);
        int v186 = (v183 - v184 - v185) ^ (v185 >> 3);
        unsigned int v187 = (v185 - v186 - ((v184 - v185 - v186) ^ (v186 << 10))) ^ (((v184 - v185 - v186) ^ (v186 << 10)) >> 15);
        v188 = (int32x2_t **)(v165 + 48);
        *((void *)v165 + 11) = v165 + 104;
        *((_DWORD *)v165 + 24) = 64;
        *((_DWORD *)v165 + 25) = v187;
        uint64_t v189 = *(void *)(v119 + 80);
        if (v189)
        {
          *((void *)v165 + 6) = *(void *)(v189 + 48);
          *((void *)v165 + 8) = 0;
          v190 = *(uint64_t **)(v189 + 48);
          uint64_t v191 = v190[3];
          *((void *)v165 + 7) = v191 - v190[4];
          *(void *)(v191 + 16) = v165;
          v190[3] = (uint64_t)v188;
        }
        else
        {
          *((void *)v165 + 7) = 0;
          *((void *)v165 + 8) = 0;
          *(void *)(v119 + 80) = v165;
          v192 = malloc_type_malloc(0x40uLL, 0x10200405F856B24uLL);
          *(void *)(*(void *)(v119 + 80) + 48) = v192;
          if (!v192) {
            goto LABEL_459;
          }
          v192[2] = 0u;
          v192[3] = 0u;
          _OWORD *v192 = 0u;
          v192[1] = 0u;
          uint64_t v193 = *(void *)(v119 + 80);
          v194 = *(void **)(v193 + 48);
          v194[1] = 0x500000020;
          v194[3] = v193 + 48;
          v194[4] = 48;
          v195 = malloc_type_malloc(0x200uLL, 0x1020040EDED9539uLL);
          **(void **)(*(void *)(v119 + 80) + 48) = v195;
          if (!v195) {
LABEL_459:
          }
            exit(-1);
          v195[30] = 0u;
          v195[31] = 0u;
          v195[28] = 0u;
          v195[29] = 0u;
          v195[26] = 0u;
          v195[27] = 0u;
          v195[24] = 0u;
          v195[25] = 0u;
          v195[22] = 0u;
          v195[23] = 0u;
          v195[20] = 0u;
          v195[21] = 0u;
          v195[18] = 0u;
          v195[19] = 0u;
          v195[16] = 0u;
          v195[17] = 0u;
          v195[14] = 0u;
          v195[15] = 0u;
          v195[12] = 0u;
          v195[13] = 0u;
          v195[10] = 0u;
          v195[11] = 0u;
          v195[8] = 0u;
          v195[9] = 0u;
          v195[6] = 0u;
          v195[7] = 0u;
          v195[4] = 0u;
          v195[5] = 0u;
          v195[2] = 0u;
          v195[3] = 0u;
          _OWORD *v195 = 0u;
          v195[1] = 0u;
          v190 = *(uint64_t **)(*(void *)(v119 + 80) + 48);
          *((_DWORD *)v190 + 14) = -1609490463;
        }
        ++*((_DWORD *)v190 + 4);
        uint64_t v196 = (*((_DWORD *)v190 + 2) - 1) & v187;
        uint64_t v197 = *v190;
        uint64_t v198 = *v190 + 16 * v196;
        unsigned int v199 = *(_DWORD *)(v198 + 8) + 1;
        *(_DWORD *)(v198 + 8) = v199;
        uint64_t v200 = *(void *)v198;
        *(void *)(v150 + 72) = 0;
        *(void *)(v150 + 80) = v200;
        if (v200) {
          *(void *)(v200 + 24) = v188;
        }
        *(void *)uint64_t v198 = v188;
        if (v199 >= 10 * *(_DWORD *)(v197 + 16 * v196 + 12) + 10 && !(*v188)[6].i32[1])
        {
          v201 = malloc_type_malloc(32 * (*v188)[1].u32[0], 0x1020040EDED9539uLL);
          if (!v201) {
            goto LABEL_459;
          }
          v202 = v201;
          bzero(v201, 32 * (*v188)[1].u32[0]);
          v203 = *v188;
          unsigned __int32 v204 = (*v188)[2].u32[0];
          uint64_t v205 = (*v188)[1].u32[0];
          unsigned int v206 = 2 * v205 - 1;
          if ((v206 & v204) != 0) {
            unsigned int v207 = (v204 >> ((*v188)[1].i32[1] + 1)) + 1;
          }
          else {
            unsigned int v207 = v204 >> ((*v188)[1].i32[1] + 1);
          }
          v203[5].i32[0] = v207;
          v203[5].i32[1] = 0;
          v208 = (void *)*v203;
          if (v205)
          {
            int v209 = 0;
            for (uint64_t j = 0; j != v205; ++j)
            {
              uint64_t v211 = v208[2 * j];
              if (v211)
              {
                do
                {
                  uint64_t v212 = *(void *)(v211 + 32);
                  uint64_t v213 = *(_DWORD *)(v211 + 52) & v206;
                  v214 = (char *)&v202[4 * v213];
                  unsigned int v215 = *((_DWORD *)v214 + 2) + 1;
                  *((_DWORD *)v214 + 2) = v215;
                  if (v215 > v207)
                  {
                    v203[5].i32[1] = ++v209;
                    v202[4 * v213 + 3] = v215 / v207;
                  }
                  *(void *)(v211 + 24) = 0;
                  uint64_t v216 = *(void *)v214;
                  *(void *)(v211 + 32) = *(void *)v214;
                  if (v216) {
                    *(void *)(v216 + 24) = v211;
                  }
                  *(void *)v214 = v211;
                  uint64_t v211 = v212;
                }
                while (v212);
              }
            }
          }
          free(v208);
          v217 = *v188;
          int32x2_t v218 = (*v188)[1];
          v219.i32[0] = vadd_s32(v218, v218).u32[0];
          v219.i32[1] = vadd_s32(v218, (int32x2_t)0x100000001).i32[1];
          v217[1] = v219;
          int32x2_t *v217 = (int32x2_t)v202;
          if (v217[5].i32[1] <= (unsigned __int32)v217[2].i32[0] >> 1)
          {
            v217[6].i32[0] = 0;
          }
          else
          {
            unsigned int v220 = v217[6].i32[0] + 1;
            v217[6].i32[0] = v220;
            if (v220 >= 2) {
              v217[6].i32[1] = 1;
            }
          }
        }
        if (maxlog < 7)
        {
          uint64_t v114 = v320;
LABEL_351:
          coap_handle_dgram_for_proto(v114, (unsigned __int8 *)v150, (uint64_t)__errnum);
          goto LABEL_352;
        }
        coap_session_str(v150);
        coap_log_impl(7, "***%s: new incoming session\n", (const char *)&coap_session_str_szSession);
        uint64_t v114 = v320;
LABEL_348:
        if (*((__int16 *)v101 + 180) >= 7)
        {
          coap_session_str(v150);
          coap_log_impl(7, "*  %s: received %zd bytes\n", (const char *)&coap_session_str_szSession, v124);
        }
        goto LABEL_351;
      }
      goto LABEL_353;
    }
LABEL_413:
    v290 = *(unsigned __int8 **)(v114 + 64);
    if (!v290)
    {
LABEL_445:
      if (((unint64_t)((((125 * (v116 - v313)) & 0x1FFFFFFFFFFFFFFFLL)
                                            * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4) == -1)
        goto LABEL_446;
      BOOL v40 = 1;
LABEL_452:
      __HMFActivityScopeLeave();

      goto LABEL_453;
    }
    while (1)
    {
      v291 = (unsigned __int8 *)*((void *)v290 + 8);
      __int16 v292 = *((_WORD *)v290 + 90);
      if ((v292 & 0x800) == 0)
      {
        if ((*((_WORD *)v290 + 90) & 0x100) != 0) {
          goto LABEL_433;
        }
        goto LABEL_416;
      }
      ++*((_DWORD *)v290 + 1);
      __errnum[0] = 0;
      socklen_t v337 = 4;
      *((_WORD *)v290 + 90) = v292 & 0xF77F;
      if (getsockopt(*((_DWORD *)v290 + 44), 0xFFFF, 4103, __errnum, &v337) == -1 && maxlog >= 4)
      {
        v294 = __error();
        v295 = strerror(*v294);
        coap_log_impl(4, "coap_socket_finish_connect_tcp: getsockopt: %s\n", v295);
      }
      if (__errnum[0]) {
        break;
      }
      if (getsockname(*((_DWORD *)v290 + 44), (sockaddr *)(v290 + 140), (socklen_t *)v290 + 34) == -1 && maxlog >= 4)
      {
        v300 = __error();
        v301 = strerror(*v300);
        coap_log_impl(4, "coap_socket_connect_tcp: getsockname: %s\n", v301);
      }
      if (getpeername(*((_DWORD *)v290 + 44), (sockaddr *)(v290 + 108), (socklen_t *)v290 + 26) == -1 && maxlog >= 4)
      {
        v302 = __error();
        v303 = strerror(*v302);
        coap_log_impl(4, "coap_socket_connect_tcp: getpeername: %s\n", v303);
      }
      *((void *)v290 + 34) = v116;
      coap_handle_event(*((void *)v290 + 26), 4097, (uint64_t)v290);
      int v304 = *v290;
      if (v304 == 4)
      {
        v290[2] = 2;
        *((void *)v290 + 27) = 0;
        coap_handle_event(*((void *)v290 + 26), 512, (uint64_t)v290);
        v298 = v290;
        int v299 = 3;
LABEL_431:
        coap_session_disconnected(v298, v299);
        goto LABEL_432;
      }
      if (v304 == 3) {
        coap_session_send_csm(v290);
      }
LABEL_432:
      coap_session_release((uint64_t)v290);
      __int16 v292 = *((_WORD *)v290 + 90);
      if ((v292 & 0x100) != 0)
      {
LABEL_433:
        ++*((_DWORD *)v290 + 1);
        coap_read_session();
        coap_session_release((uint64_t)v290);
        if ((*((_WORD *)v290 + 90) & 0x200) == 0) {
          goto LABEL_418;
        }
LABEL_417:
        ++*((_DWORD *)v290 + 1);
        coap_write_session((uint64_t)v290, v116);
        coap_session_release((uint64_t)v290);
        goto LABEL_418;
      }
LABEL_416:
      if ((v292 & 0x200) != 0) {
        goto LABEL_417;
      }
LABEL_418:
      v290 = v291;
      if (!v291) {
        goto LABEL_445;
      }
    }
    if (maxlog >= 4)
    {
      v296 = strerror(__errnum[0]);
      coap_log_impl(4, "coap_socket_finish_connect_tcp: connect failed: %s\n", v296);
    }
    int v297 = *((_DWORD *)v290 + 44);
    if (v297 != -1)
    {
      *((void *)v290 + 23) = 0;
      *((void *)v290 + 24) = 0;
      close(v297);
      *((_DWORD *)v290 + 44) = -1;
    }
    *((_WORD *)v290 + 90) = 0;
    coap_handle_event(*((void *)v290 + 26), 4099, (uint64_t)v290);
    v298 = v290;
    int v299 = 1;
    goto LABEL_431;
  }
  BOOL v40 = 0;
LABEL_453:
  _Block_object_dispose(v323, 8);
  __HMFActivityScopeLeave();

  _Block_object_dispose(&v326, 8);
  return v40;
}

void __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id **)(a1 + 32);
  uint64_t v3 = -[HAP2CoAPIOThread completedQueue](*(id **)(a1 + 32));
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_2;
  v53[3] = &unk_1E69F3458;
  v53[4] = *v2;
  [v3 enumerateObjectsUsingBlock:v53];

  uint64_t v4 = -[HAP2CoAPIOThread completedQueue](*v2);
  [v4 removeAllObjects];

  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v47 = 0;
  unsigned int v48 = &v47;
  uint64_t v49 = 0x3032000000;
  unint64_t v50 = __Block_byref_object_copy__19821;
  unint64_t v51 = __Block_byref_object_dispose__19822;
  id v52 = 0;
  uint64_t v6 = *v2;
  if (*v2) {
    uint64_t v6 = (id *)v6[16];
  }
  uint64_t v7 = v6;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_3;
  v44[3] = &unk_1E69F3480;
  id v8 = v5;
  id v45 = v8;
  unint64_t v46 = &v47;
  [v7 enumerateObjectsUsingBlock:v44];

  BOOL v9 = v48;
  if (v48[5])
  {
    uint64_t v10 = *(void **)(a1 + 32);
    if (v10) {
      uint64_t v10 = (void *)v10[16];
    }
    id v11 = v10;
    [v11 removeObjectsAtIndexes:v9[5]];
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v13 = -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
  uint64_t v14 = [v12 arrayWithArray:v13];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  id v17 = -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
  [v17 removeAllObjects];

  id v18 = *(void **)(a1 + 32);
  if (v18) {
    id v18 = (void *)v18[10];
  }
  char v19 = v18;
  if (![v19 count]) {
    goto LABEL_25;
  }
  unint64_t v20 = *(void **)(a1 + 32);
  if (v20) {
    unint64_t v20 = (void *)v20[15];
  }
  uint64_t v21 = v20;
  unint64_t v22 = [v21 count];
  uint64_t v23 = *(void *)(a1 + 32);
  if (!v23)
  {

LABEL_25:
    goto LABEL_26;
  }
  BOOL v24 = v22 < *(void *)(v23 + 136);

  if (v24)
  {
    BOOL v25 = *(void **)(a1 + 32);
    if (v25) {
      BOOL v25 = (void *)v25[10];
    }
    char v26 = v25;
    char v27 = [v26 sortedArrayUsingSelector:sel_compare_];

    char v28 = *(void **)(a1 + 32);
    if (v28)
    {
      uint64_t v29 = v28[17];
      char v28 = (void *)v28[15];
    }
    else
    {
      uint64_t v29 = 0;
    }
    unint64_t v30 = v28;
    uint64_t v31 = [v30 count];

    unint64_t v32 = [v27 count];
    if (v29 - v31 >= v32) {
      unint64_t v33 = v32;
    }
    else {
      unint64_t v33 = v29 - v31;
    }
    unint64_t v34 = objc_msgSend(v27, "subarrayWithRange:", 0, v33);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v34];
    unint64_t v35 = *(void **)(a1 + 32);
    if (v35) {
      unint64_t v35 = (void *)v35[10];
    }
    uint64_t v36 = v35;
    [v36 removeObjectsInArray:v34];

    goto LABEL_34;
  }
LABEL_26:
  uint64_t v37 = *(void **)(a1 + 32);
  if (v37) {
    uint64_t v37 = (void *)v37[15];
  }
  unint64_t v38 = v37;
  uint64_t v39 = [v38 count];
  uint64_t v40 = *(void *)(a1 + 32);
  if (v40) {
    uint64_t v40 = *(void *)(v40 + 136);
  }
  BOOL v41 = v39 == v40;

  if (v41)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v42 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v43 = *(void *)(a1 + 32);
      if (v43) {
        uint64_t v43 = *(void *)(v43 + 136);
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v55 = v43;
      _os_log_debug_impl(&dword_1D4758000, v42, OS_LOG_TYPE_DEBUG, "Coap IO all %lu sliding window slots in use", buf, 0xCu);
    }
  }
LABEL_34:

  _Block_object_dispose(&v47, 8);
}

void __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) end];
  if (v6) {
    uint64_t v3 = (void *)v6[5];
  }
  else {
    uint64_t v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) begin];
  if (([*(id *)(a1 + 32) _processQueueEntry:v6 context:*(void *)(a1 + 48)] & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) end];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

- (id)completedQueue
{
  if (a1)
  {
    uint64_t v2 = a1;
    [a1[13] assertOwner];
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(consumer = %@)", v3];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void **)(v5 + 120);
  }
  else {
    uint64_t v6 = 0;
  }
  id v10 = (id)v4;
  uint64_t v7 = [v6 filteredSetUsingPredicate:v4];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    BOOL v9 = *(void **)(v8 + 120);
  }
  else {
    BOOL v9 = 0;
  }
  [v9 minusSet:v7];
}

uint64_t __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 reapSession:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v8)
    {
      return [v8 addIndex:a3];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = *(void *)(v10 + 40);
      *(void *)(v10 + 40) = v9;
      return MEMORY[0x1F41817F8](v9, v11);
    }
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (coap_context_t)_createContext
{
  [(HAP2CoAPIOThread *)self _assertIsCurrentThread];
  coap_startup();
  uint64_t v3 = (coap_context_t *)malloc_type_malloc(0xE0uLL, 0x9D9A23A2uLL);
  if (!v3)
  {
    if ((maxlog & 0x80000000) == 0) {
      coap_log_impl(0, "coap_init: malloc: failed\n");
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v21 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "Coap IO thread failed to create context", buf, 2u);
    }
    return 0;
  }
  uint64_t v4 = v3;
  *(_OWORD *)&v3->var15 = 0u;
  *(_OWORD *)&v3->var17 = 0u;
  *(_OWORD *)&v3->var23 = 0u;
  *(_OWORD *)&v3->var27 = 0u;
  *(_OWORD *)&v3->var19 = 0u;
  *(_OWORD *)&v3->var21 = 0u;
  *(_OWORD *)&v3->var11 = 0u;
  *(_OWORD *)&v3->var13 = 0u;
  *(_OWORD *)&v3->var7 = 0u;
  *(_OWORD *)&v3->var9 = 0u;
  *(_OWORD *)&v3->var3 = 0u;
  *(_OWORD *)&v3->var5 = 0u;
  *(_OWORD *)v3->var0 = 0u;
  *(_OWORD *)&v3->var1 = 0u;
  v3->var27 = 30;
  v3->var13 = coap_network_send;
  v3->var14 = coap_network_read;
  v3->var15 = coap_get_session_client_psk;
  v3->var16 = coap_get_context_server_psk;
  v3->var17 = coap_get_context_server_hint;
  if (coap_make_str_const_ofs == 1) {
    int v5 = 0;
  }
  else {
    int v5 = coap_make_str_const_ofs + 1;
  }
  coap_make_str_const_ofs = v5;
  uint64_t v6 = (size_t *)((char *)&coap_make_str_const_var + 16 * v5);
  size_t *v6 = 0;
  v6[1] = (size_t)"";
  uint64_t v7 = malloc_type_malloc(0xA0uLL, 0x9D9A23A2uLL);
  if (!v7)
  {
    if (maxlog >= 7) {
      coap_log_impl(7, "coap_resource_init: no memory left\n");
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    unint64_t v22 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v83 = 0;
      _os_log_error_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "Coap IO thread failed to create request resource", v83, 2u);
    }
    coap_free_context((uint64_t)v4);
    return 0;
  }
  uint64_t v8 = v7;
  v7[8] = 0u;
  v7[9] = 0u;
  v7[6] = 0u;
  v7[7] = 0u;
  v7[4] = 0u;
  v7[5] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  _OWORD *v7 = 0u;
  v7[1] = 0u;
  uint64_t v9 = (const void *)v6[1];
  size_t v10 = *v6;
  uint64_t v11 = coap_new_string(v10);
  if (v11)
  {
    uint64_t v12 = v11;
    memcpy((void *)v11[1], v9, v10);
    size_t *v12 = v10;
    *((void *)v8 + 17) = v12;
  }
  *((_DWORD *)v8 + 36) = 0;
  v4->var28 = self;
  v4->var14 = coapNetworkRead;
  v4->var8 = coapResponseHandler;
  v4->var12 = coapEventHandler;
  v4->var9 = coapNackHandler;
  v4->var11 = coapPongHandler;
  *((void *)v8 + 3) = coapRequestHandler;
  if ((*(unsigned char *)v8 & 0x10) != 0)
  {
    uint64_t var2 = (uint64_t)v4->var2;
    if (var2) {
      coap_free_resource(var2);
    }
    v4->uint64_t var2 = (coap_resource_t *)v8;
    return v4;
  }
  uint64_t v13 = (size_t *)*((void *)v8 + 17);
  size_t v14 = *v13;
  uint64_t v15 = (unsigned __int8 *)v13[1];
  uint64_t resource_from_uri_path = coap_get_resource_from_uri_path((uint64_t)v4, *v13, v15);
  if (resource_from_uri_path)
  {
    uint64_t v17 = resource_from_uri_path;
    if (maxlog >= 4) {
      coap_log_impl(4, "coap_add_resource: Duplicate uri_path '%*.*s', old resource deleted\n", v14, v14, (const char *)v15);
    }
    if ((*(unsigned char *)v17 & 0x10) != 0 && v4->var2 == (coap_resource_t *)v17)
    {
      coap_free_resource(v17);
      v4->uint64_t var2 = 0;
      goto LABEL_48;
    }
    id v18 = *(char **)(v17 + 72);
    if (!v18 && !*(void *)(v17 + 80))
    {
      free(*(void **)v4->var1->var6.var0);
      free(v4->var1->var6.var0);
      v4->var1 = 0;
LABEL_47:
      coap_free_resource(v17);
LABEL_48:
      uint64_t v13 = (size_t *)*((void *)v8 + 17);
      size_t v14 = *v13;
      goto LABEL_49;
    }
    var0 = v4->var1->var6.var0;
    if (v17 + 64 == *((void *)var0 + 3)) {
      *((void *)var0 + 3) = &v18[*((void *)var0 + 4)];
    }
    unint64_t v20 = *(coap_resource_t **)(v17 + 80);
    if (v18)
    {
      *(void *)&v18[*((void *)var0 + 4) + 16] = v20;
      unint64_t v20 = *(coap_resource_t **)(v17 + 80);
      if (!v20) {
        goto LABEL_40;
      }
    }
    else
    {
      v4->var1 = v20;
      var0 = v20->var6.var0;
    }
    *(void **)((char *)v20->var5 + *((void *)var0 + 4)) = v18;
LABEL_40:
    uint64_t v24 = *(void *)var0 + 16 * ((*((_DWORD *)var0 + 2) - 1) & *(_DWORD *)(v17 + 116));
    --*(_DWORD *)(v24 + 8);
    if (*(void *)v24 == v17 + 64) {
      *(void *)uint64_t v24 = *(void *)(v17 + 96);
    }
    uint64_t v25 = *(void *)(v17 + 88);
    if (v25) {
      *(void *)(v25 + 32) = *(void *)(v17 + 96);
    }
    uint64_t v26 = *(void *)(v17 + 96);
    if (v26) {
      *(void *)(v26 + 24) = v25;
    }
    --*((_DWORD *)var0 + 4);
    goto LABEL_47;
  }
LABEL_49:
  int v27 = -17973521;
  unsigned int v28 = -1640531527;
  if (v14 < 0xC)
  {
    int v31 = -1640531527;
    unsigned int v30 = v14;
    uint64_t v29 = (unsigned __int8 *)v13[1];
  }
  else
  {
    uint64_t v29 = (unsigned __int8 *)v13[1];
    unsigned int v30 = v14;
    int v31 = -1640531527;
    do
    {
      unsigned int v32 = *((_DWORD *)v29 + 1) + v28;
      unsigned int v33 = *((_DWORD *)v29 + 2) + v27;
      int v34 = (*(_DWORD *)v29 + v31 - (v32 + v33)) ^ (v33 >> 13);
      unsigned int v35 = (v32 - v33 - v34) ^ (v34 << 8);
      unsigned int v36 = (v33 - v34 - v35) ^ (v35 >> 13);
      int v37 = (v34 - v35 - v36) ^ (v36 >> 12);
      unsigned int v38 = (v35 - v36 - v37) ^ (v37 << 16);
      unsigned int v39 = (v36 - v37 - v38) ^ (v38 >> 5);
      int v31 = (v37 - v38 - v39) ^ (v39 >> 3);
      unsigned int v28 = (v38 - v39 - v31) ^ (v31 << 10);
      int v27 = (v39 - v31 - v28) ^ (v28 >> 15);
      v29 += 12;
      v30 -= 12;
    }
    while (v30 > 0xB);
  }
  unsigned int v40 = v27 + v14;
  switch(v30)
  {
    case 1u:
      goto LABEL_65;
    case 2u:
      goto LABEL_64;
    case 3u:
      goto LABEL_63;
    case 4u:
      goto LABEL_62;
    case 5u:
      goto LABEL_61;
    case 6u:
      goto LABEL_60;
    case 7u:
      goto LABEL_59;
    case 8u:
      goto LABEL_58;
    case 9u:
      goto LABEL_57;
    case 0xAu:
      goto LABEL_56;
    case 0xBu:
      v40 += v29[10] << 24;
LABEL_56:
      v40 += v29[9] << 16;
LABEL_57:
      v40 += v29[8] << 8;
LABEL_58:
      v28 += v29[7] << 24;
LABEL_59:
      v28 += v29[6] << 16;
LABEL_60:
      v28 += v29[5] << 8;
LABEL_61:
      v28 += v29[4];
LABEL_62:
      v31 += v29[3] << 24;
LABEL_63:
      v31 += v29[2] << 16;
LABEL_64:
      v31 += v29[1] << 8;
LABEL_65:
      v31 += *v29;
      break;
    default:
      break;
  }
  int v41 = (v31 - v40 - v28) ^ (v40 >> 13);
  unsigned int v42 = (v28 - v40 - v41) ^ (v41 << 8);
  unsigned int v43 = (v40 - v41 - v42) ^ (v42 >> 13);
  int v44 = (v41 - v42 - v43) ^ (v43 >> 12);
  unsigned int v45 = (v42 - v43 - v44) ^ (v44 << 16);
  unsigned int v46 = (v43 - v44 - v45) ^ (v45 >> 5);
  int v47 = (v44 - v45 - v46) ^ (v46 >> 3);
  unsigned int v48 = (v46 - v47 - ((v45 - v46 - v47) ^ (v47 << 10))) ^ (((v45 - v46 - v47) ^ (v47 << 10)) >> 15);
  uint64_t v49 = (int32x2_t **)(v8 + 4);
  *((void *)v8 + 13) = v13[1];
  *((_DWORD *)v8 + 28) = v14;
  *((_DWORD *)v8 + 29) = v48;
  var1 = v4->var1;
  if (var1)
  {
    *((void *)v8 + 8) = var1->var6.var0;
    unint64_t v51 = var1->var6.var0;
    uint64_t v52 = *((void *)v51 + 3);
    *((void *)v8 + 9) = v52 - *((void *)v51 + 4);
    *((void *)v8 + 10) = 0;
    *(void *)(v52 + 16) = v8;
    *((void *)v51 + 3) = v49;
  }
  else
  {
    *((void *)v8 + 9) = 0;
    *((void *)v8 + 10) = 0;
    v4->var1 = (coap_resource_t *)v8;
    __int16 v53 = (UT_hash_table *)malloc_type_malloc(0x40uLL, 0x10200405F856B24uLL);
    v4->var1->var6.var0 = v53;
    if (!v53) {
      goto LABEL_95;
    }
    *((_OWORD *)v53 + 2) = 0u;
    *((_OWORD *)v53 + 3) = 0u;
    *(_OWORD *)__int16 v53 = 0u;
    *((_OWORD *)v53 + 1) = 0u;
    unsigned __int8 v54 = v4->var1;
    uint64_t v55 = v54->var6.var0;
    *((void *)v55 + 1) = 0x500000020;
    *((void *)v55 + 3) = &v54->var6;
    *((void *)v55 + 4) = 64;
    uint64_t v56 = malloc_type_malloc(0x200uLL, 0x1020040EDED9539uLL);
    *(void *)v4->var1->var6.var0 = v56;
    if (!v56) {
      goto LABEL_95;
    }
    v56[30] = 0u;
    v56[31] = 0u;
    v56[28] = 0u;
    v56[29] = 0u;
    v56[26] = 0u;
    v56[27] = 0u;
    v56[24] = 0u;
    v56[25] = 0u;
    v56[22] = 0u;
    v56[23] = 0u;
    v56[20] = 0u;
    v56[21] = 0u;
    v56[18] = 0u;
    v56[19] = 0u;
    v56[16] = 0u;
    v56[17] = 0u;
    v56[14] = 0u;
    v56[15] = 0u;
    v56[12] = 0u;
    v56[13] = 0u;
    v56[10] = 0u;
    v56[11] = 0u;
    v56[8] = 0u;
    v56[9] = 0u;
    v56[6] = 0u;
    v56[7] = 0u;
    v56[4] = 0u;
    v56[5] = 0u;
    v56[2] = 0u;
    v56[3] = 0u;
    _OWORD *v56 = 0u;
    v56[1] = 0u;
    unint64_t v51 = v4->var1->var6.var0;
    *((_DWORD *)v51 + 14) = -1609490463;
  }
  ++*((_DWORD *)v51 + 4);
  uint64_t v57 = (*((_DWORD *)v51 + 2) - 1) & v48;
  uint64_t v58 = *(void *)v51;
  unint64_t v59 = (int32x2_t ***)(v58 + 16 * v57);
  unsigned int v60 = *((_DWORD *)v59 + 2) + 1;
  *((_DWORD *)v59 + 2) = v60;
  v61 = *v59;
  *((void *)v8 + 11) = 0;
  *((void *)v8 + 12) = v61;
  if (v61) {
    v61[3] = (int32x2_t *)v49;
  }
  *unint64_t v59 = v49;
  if (v60 >= 10 * *(_DWORD *)(v58 + 16 * v57 + 12) + 10 && !(*v49)[6].i32[1])
  {
    uint64_t v62 = malloc_type_malloc(32 * (*v49)[1].u32[0], 0x1020040EDED9539uLL);
    if (v62)
    {
      unint64_t v63 = v62;
      bzero(v62, 32 * (*v49)[1].u32[0]);
      unint64_t v64 = *v49;
      unsigned __int32 v65 = (*v49)[2].u32[0];
      uint64_t v66 = (*v49)[1].u32[0];
      unsigned int v67 = 2 * v66 - 1;
      if ((v67 & v65) != 0) {
        unsigned int v68 = (v65 >> ((*v49)[1].i32[1] + 1)) + 1;
      }
      else {
        unsigned int v68 = v65 >> ((*v49)[1].i32[1] + 1);
      }
      v64[5].i32[0] = v68;
      v64[5].i32[1] = 0;
      uint64_t v69 = (void *)*v64;
      if (v66)
      {
        int v70 = 0;
        for (uint64_t i = 0; i != v66; ++i)
        {
          uint64_t v72 = v69[2 * i];
          if (v72)
          {
            do
            {
              uint64_t v73 = *(void *)(v72 + 32);
              uint64_t v74 = *(_DWORD *)(v72 + 52) & v67;
              v75 = (char *)&v63[4 * v74];
              unsigned int v76 = *((_DWORD *)v75 + 2) + 1;
              *((_DWORD *)v75 + 2) = v76;
              if (v76 > v68)
              {
                v64[5].i32[1] = ++v70;
                v63[4 * v74 + 3] = v76 / v68;
              }
              uint64_t v77 = *(void *)v75;
              *(void *)(v72 + 24) = 0;
              *(void *)(v72 + 32) = v77;
              if (v77) {
                *(void *)(v77 + 24) = v72;
              }
              *(void *)v75 = v72;
              uint64_t v72 = v73;
            }
            while (v73);
          }
        }
      }
      free(v69);
      v78 = *v49;
      int32x2_t v79 = (*v49)[1];
      v80.i32[0] = vadd_s32(v79, v79).u32[0];
      v80.i32[1] = vadd_s32(v79, (int32x2_t)0x100000001).i32[1];
      v78[1] = v80;
      int32x2_t *v78 = (int32x2_t)v63;
      if (v78[5].i32[1] <= (unsigned __int32)v78[2].i32[0] >> 1)
      {
        v78[6].i32[0] = 0;
      }
      else
      {
        unsigned int v81 = v78[6].i32[0] + 1;
        v78[6].i32[0] = v81;
        if (v81 >= 2) {
          v78[6].i32[1] = 1;
        }
      }
      return v4;
    }
LABEL_95:
    exit(-1);
  }
  return v4;
}

- (void)_enqueue:(id)a3
{
  id v4 = a3;
  if (self) {
    lock = self->_lock;
  }
  else {
    lock = 0;
  }
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __29__HAP2CoAPIOThread__enqueue___block_invoke;
  size_t v10 = &unk_1E69F46E0;
  id v11 = v4;
  uint64_t v12 = self;
  id v6 = v4;
  [(HAP2Lock *)lock performBlock:&v7];
  [(HAP2CoAPIOThread *)self _wakeUpThread];
}

void __29__HAP2CoAPIOThread__enqueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_5;
  }
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3 != 8)
  {
    if (v3 == 16)
    {
      id v4 = -[HAP2CoAPIOThread completedQueue](*(id **)(a1 + 40));
LABEL_6:
      id v7 = v4;
      [v4 addObject:*(void *)(a1 + 32)];

      return;
    }
LABEL_5:
    id v4 = -[HAP2CoAPIOThread queue](*(id **)(a1 + 40));
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    id v6 = *(void **)(v5 + 80);
  }
  else {
    id v6 = 0;
  }

  objc_msgSend(v6, "addObject:");
}

- (void)_wakeUpThread
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  while (1)
  {
    int v3 = self ? self->_wakeupPipeRead : 0;
    if (write(v3, "a", 1uLL) != -1) {
      break;
    }
    if (*__error() != 4)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v4 = (void *)hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = v4;
        int v6 = *__error();
        v7[0] = 67109120;
        v7[1] = v6;
        _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "Error attempting to wake up thread %d", (uint8_t *)v7, 8u);
      }
      return;
    }
  }
}

- (void)queueSessionCompletionForConsumer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSString;
  int v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"%@ Session Block Complete", v7];

  size_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v8];
  uint64_t v9 = -[HAP2CoAPIOThreadQueueEntry initWithConsumer:operationType:sessionBlock:timeout:activity:]((id *)[HAP2CoAPIOThreadQueueEntry alloc], v4, (void *)0x10, 0, v10, 0.0);
  [(HAP2CoAPIOThread *)self _enqueue:v9];

  __HMFActivityScopeLeave();
}

- (void)queueSessionBlockForConsumer:(id)a3 sessionBlock:(id)a4 withTimeout:(double)a5 requiresCompletion:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = NSString;
  uint64_t v13 = (objc_class *)objc_opt_class();
  size_t v14 = NSStringFromClass(v13);
  uint64_t v15 = [v12 stringWithFormat:@"%@ Session Block", v14];

  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v15];
  uint64_t v16 = [HAP2CoAPIOThreadQueueEntry alloc];
  if (v6) {
    uint64_t v17 = 8;
  }
  else {
    uint64_t v17 = 4;
  }
  id v18 = -[HAP2CoAPIOThreadQueueEntry initWithConsumer:operationType:sessionBlock:timeout:activity:]((id *)&v16->super.isa, v10, (void *)v17, v11, v19, a5);
  [(HAP2CoAPIOThread *)self _enqueue:v18];

  __HMFActivityScopeLeave();
}

- (void)unregisterConsumer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSString;
  BOOL v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"%@ Unregister", v7];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v8];
  uint64_t v9 = -[HAP2CoAPIOThreadQueueEntry initWithConsumer:operationType:sessionBlock:timeout:activity:]((id *)[HAP2CoAPIOThreadQueueEntry alloc], v4, (void *)2, 0, v10, 0.0);
  [(HAP2CoAPIOThread *)self _enqueue:v9];

  __HMFActivityScopeLeave();
}

- (void)registerConsumer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSString;
  BOOL v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"%@ Register", v7];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v8];
  uint64_t v9 = -[HAP2CoAPIOThreadQueueEntry initWithConsumer:operationType:sessionBlock:timeout:activity:]((id *)[HAP2CoAPIOThreadQueueEntry alloc], v4, (void *)1, 0, v10, 0.0);
  [(HAP2CoAPIOThread *)self _enqueue:v9];

  __HMFActivityScopeLeave();
}

- (void)main
{
  int v3 = (void *)MEMORY[0x1D944E080]([(HAP2CoAPIOThread *)self _assertIsCurrentThread]);
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "Coap IO thread started", buf, 2u);
  }
  uint64_t v5 = -[HAP2CoAPIOThread delegate]((id *)&self->super.super.isa);
  [v5 didStart];

  log_handler = (uint64_t)coapLogHandler;
  coap_set_log_level(7);
  coap_startup();
  BOOL v6 = [(HAP2CoAPIOThread *)self _createContext];
  do
  {
    if ([(HAP2CoAPIOThread *)self isCancelled]) {
      break;
    }
    id v7 = (void *)MEMORY[0x1D944E080]();
    BOOL v8 = [(HAP2CoAPIOThread *)self _processQueueWithContext:v6];
  }
  while (v8);
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v9 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_debug_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "Coap IO thread exited main run loop", v13, 2u);
  }
  [(HAP2CoAPIOThread *)self _processQueueWithContext:0];
  if (v6) {
    [(HAP2CoAPIOThread *)self _cleanupWithContext:v6];
  }
  id v10 = -[HAP2CoAPIOThread delegate]((id *)&self->super.super.isa);
  [v10 didStop];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v11 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "Coap IO thread stopped", v12, 2u);
  }
}

- (id)delegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 14);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)HAP2CoAPIOThread;
  [(HAP2CoAPIOThread *)&v3 cancel];
  [(HAP2CoAPIOThread *)self _wakeUpThread];
}

- (void)dealloc
{
  int v3 = *(_DWORD *)&self->super._bytes[44];
  if (v3 != -1) {
    close(v3);
  }
  int wakeupPipeRead = self->_wakeupPipeRead;
  if (wakeupPipeRead != -1) {
    close(wakeupPipeRead);
  }
  v5.receiver = self;
  v5.super_class = (Class)HAP2CoAPIOThread;
  [(HAP2CoAPIOThread *)&v5 dealloc];
}

- (HAP2CoAPIOThread)init
{
  return [(HAP2CoAPIOThread *)self initWithQualityOfService:17 delegate:0];
}

- (HAP2CoAPIOThread)initWithQualityOfService:(int64_t)a3 delegate:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v43.receiver = self;
  v43.super_class = (Class)HAP2CoAPIOThread;
  id v7 = [(HAP2CoAPIOThread *)&v43 init];
  BOOL v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v9 = +[HAP2Lock lockWithName:@"HAP2CoAPIOThread.lock"];
    lock = v8->_lock;
    v8->_lock = (HAP2Lock *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    consumerInfo = v8->_consumerInfo;
    v8->_consumerInfo = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    queue = v8->_queue;
    v8->_queue = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    messageQueue = v8->_messageQueue;
    v8->_messageQueue = (NSMutableArray *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    completedQueue = v8->_completedQueue;
    v8->_completedQueue = (NSMutableArray *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    zombieSessions = v8->_zombieSessions;
    v8->_zombieSessions = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x1E4F65530] sharedPreferences];
    unint64_t v22 = [v21 preferenceForKey:@"COAPDefaultFlowControlMessageCount"];

    uint64_t v23 = [v22 numberValue];
    v8->_unint64_t pendingMessagesThreshold = [v23 unsignedIntegerValue];

    uint64_t v24 = [MEMORY[0x1E4F1CA80] setWithCapacity:v8->_pendingMessagesThreshold];
    pendingMessages = v8->_pendingMessages;
    v8->_pendingMessages = (NSMutableSet *)v24;

    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v26 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
    {
      unint64_t pendingMessagesThreshold = v8->_pendingMessagesThreshold;
      *(_DWORD *)buf = 134217984;
      unint64_t v47 = pendingMessagesThreshold;
      _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_INFO, "Using a sliding window count of %lu", buf, 0xCu);
    }
    int v28 = pipe((int *)buf);
    *(_DWORD *)&v8->super._bytes[44] = *(_DWORD *)buf;
    v8->_int wakeupPipeRead = v47;
    if (v28)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v29 = (void *)hap2Log_coap;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      unsigned int v30 = v29;
      int v31 = *__error();
      *(_DWORD *)int v44 = 67109120;
      int v45 = v31;
      unsigned int v32 = "Error opening pipe with code %d";
LABEL_23:
      _os_log_error_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, v32, v44, 8u);

LABEL_24:
      *(_DWORD *)&v8->super._bytes[44] = -1;
      v8->_int wakeupPipeRead = -1;

      int v37 = 0;
      goto LABEL_25;
    }
    if (!fd_set_flag(*(_DWORD *)&v8->super._bytes[44]))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      unsigned int v38 = (void *)hap2Log_coap;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      unsigned int v30 = v38;
      int v39 = *__error();
      *(_DWORD *)int v44 = 67109120;
      int v45 = v39;
      unsigned int v32 = "Error setting O_NONBLOCK | O_CLOEXEC flag on read pipe  %d";
      goto LABEL_23;
    }
    if (!fd_set_flag(v8->_wakeupPipeRead))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      unsigned int v40 = (void *)hap2Log_coap;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      unsigned int v30 = v40;
      int v41 = *__error();
      *(_DWORD *)int v44 = 67109120;
      int v45 = v41;
      unsigned int v32 = "Error setting O_NONBLOCK | O_CLOEXEC flag on write pipe  %d";
      goto LABEL_23;
    }
    unsigned int v33 = NSString;
    int v34 = (objc_class *)objc_opt_class();
    unsigned int v35 = NSStringFromClass(v34);
    unsigned int v36 = [v33 stringWithFormat:@"com.apple.CoreHAP.%@", v35];
    [(HAP2CoAPIOThread *)v8 setName:v36];

    [(HAP2CoAPIOThread *)v8 setQualityOfService:a3];
  }
  int v37 = v8;
LABEL_25:

  return v37;
}

+ (void)initialize
{
}

@end