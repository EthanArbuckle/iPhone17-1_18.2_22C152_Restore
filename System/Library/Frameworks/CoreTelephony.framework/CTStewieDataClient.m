@interface CTStewieDataClient
- (BOOL)sendMessage:(id)a3 completion:(id)a4;
- (BOOL)start;
- (CTStewieDataClient)initWithServices:(int64_t)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (id).cxx_construct;
- (id)dispatchOnDelegateQueue:(NSObject  *){objcproto17OS_dispatch_queue};
- (id)dispatchOnDelegateQueue:(id *)a1;
- (id)getState;
- (id)sendMessage:(NSObject  *){objcproto17OS_dispatch_queue} completion:(std::unique_ptr<-[CTStewieDataClient)sendMessage:completion:]::$_2>;
- (id)sendMessage:(id *)a1 completion:;
- (void)connectionPairStateChanged:(int64_t)a3;
- (void)createConnectionPairIfRequired;
- (void)discardConnectionPairIfRequired;
- (void)dispatchOnDelegateQueue:(id)a3;
- (void)failAllPendingMessages;
- (void)invokeSendCompletionForMsgId:(id)a3 ack:(id)a4 metadata:(id)a5;
- (void)reEvaluate;
- (void)receivedData:(id)a3 fromConnectionId:(int64_t)a4;
- (void)sendMessageInternal:(id)a3 usingConnection:(int64_t)a4 completion:(id)a5;
- (void)stateChanged:(id)a3;
- (void)updateConnectedServices:(int64_t)a3;
@end

@implementation CTStewieDataClient

- (CTStewieDataClient)initWithServices:(int64_t)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a4;
  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CTStewieDataClient;
  id v10 = [(CTStewieDataClient *)&v29 init];
  if (!v10) {
    goto LABEL_19;
  }
  if (([(id)objc_opt_class() conformsToProtocol:&unk_1ED03FA50] & 1) == 0)
  {
    v11 = CTLogStewieDataClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:].cold.5();
    }
    goto LABEL_18;
  }
  if (!v9)
  {
    v11 = CTLogStewieDataClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:]();
    }
    goto LABEL_18;
  }
  if (!a3)
  {
    v11 = CTLogStewieDataClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:]();
    }
    goto LABEL_18;
  }
  if (*((void *)v10 + 3) >= 0x10000uLL)
  {
    v11 = CTLogStewieDataClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:]((uint64_t)v10 + 24, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_18:

LABEL_19:
    v27 = 0;
    goto LABEL_20;
  }
  *((unsigned char *)v10 + 8) = 0;
  dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v9, 0);
  v19 = dispatch_queue_attr_make_with_qos_class(0, qos_class, 0);
  dispatch_queue_t v20 = dispatch_queue_create("CTStewieDataClient", v19);
  v21 = (void *)*((void *)v10 + 2);
  *((void *)v10 + 2) = v20;

  *((void *)v10 + 3) = a3;
  *((void *)v10 + 4) = 0;
  objc_storeWeak((id *)v10 + 5, v8);
  objc_storeStrong((id *)v10 + 6, a5);
  v22 = (void *)*((void *)v10 + 7);
  *((void *)v10 + 7) = 0;

  *((void *)v10 + 8) = 0;
  v23 = objc_alloc_init(CTStewieState);
  v24 = (void *)*((void *)v10 + 9);
  *((void *)v10 + 9) = v23;

  v25 = [[CTStewieStateMonitor alloc] initWithDelegate:v10 queue:*((void *)v10 + 2)];
  v26 = (void *)*((void *)v10 + 10);
  *((void *)v10 + 10) = v25;

  if (!*((void *)v10 + 10))
  {
    v11 = CTLogStewieDataClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:].cold.4();
    }
    goto LABEL_18;
  }
  v27 = (CTStewieDataClient *)v10;
LABEL_20:

  return v27;
}

- (BOOL)start
{
  v6 = self;
  BOOL v5 = 0;
  v2 = *((void *)self + 2);
  v4[0] = &v6;
  v4[1] = &v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIZ27__CTStewieDataClient_start_E3__0EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v4;
  dispatch_sync(v2, block);
  return v5;
}

- (id)getState
{
  return (id)[*((id *)self + 10) getState];
}

- (void)dispatchOnDelegateQueue:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v5 = (void *)*((void *)self + 6);
  objc_copyWeak(to, &location);
  to[1] = _Block_copy(v4);
  id v6 = v5;
  operator new();
}

- (void)sendMessageInternal:(id)a3 usingConnection:(int64_t)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (*((void *)self + 4) && *((void *)self + 7) && *((void *)self + 8) == 1)
  {
    id v10 = objc_alloc_init(CTStewieTransportMessage);
    [(CTStewieTransportMessage *)v10 setData:v8];
    id v33 = 0;
    v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v33];
    id v12 = v33;
    if (v12 || !v11)
    {
      v18 = CTLogStewieDataClient();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CTStewieDataClient sendMessageInternal:usingConnection:completion:]((uint64_t)v12, v18, v19, v20, v21, v22, v23, v24);
      }

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke_62;
      v31[3] = &unk_1E5264D50;
      id v32 = v9;
      [(CTStewieDataClient *)self dispatchOnDelegateQueue:v31];
      id v14 = v32;
    }
    else if ((unint64_t)[v11 length] <= 0x1000)
    {
      v25 = [(CTStewieTransportMessage *)v10 msgId];
      v26 = _Block_copy(v9);
      id v14 = v25;
      std::string::basic_string[abi:nn180100]<0>(buf, (char *)[v14 UTF8String]);
      v36 = buf;
      v27 = std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)self + 11, (void **)buf, (uint64_t)&std::piecewise_construct, (_OWORD **)&v36);
      v28 = (void *)*((void *)v27 + 7);
      *((void *)v27 + 7) = v26;
      if (v38 < 0) {
        operator delete(*(void **)buf);
      }

      [*((id *)self + 7) sendData:v11 usingConnection:a4 completion:*MEMORY[0x1E4F38C50]];
    }
    else
    {
      uint64_t v13 = CTLogStewieDataClient();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CTStewieDataClient sendMessageInternal:usingConnection:completion:](buf, [v11 length], v13);
      }

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke_63;
      v29[3] = &unk_1E5264D50;
      id v30 = v9;
      [(CTStewieDataClient *)self dispatchOnDelegateQueue:v29];
      id v14 = v30;
    }
  }
  else
  {
    uint64_t v15 = CTLogStewieDataClient();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *((void *)self + 4);
      uint64_t v17 = CTConnectionPairStateAsString(*((void *)self + 8));
      -[CTStewieDataClient sendMessageInternal:usingConnection:completion:]((uint64_t)v17, (uint64_t)buf, v16);
    }

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke;
    v34[3] = &unk_1E5264D50;
    v35 = (CTStewieTransportMessage *)v9;
    [(CTStewieDataClient *)self dispatchOnDelegateQueue:v34];
    id v10 = v35;
  }
}

void __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = objc_alloc_init(CTStewieMessageAck);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke_62(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = objc_alloc_init(CTStewieMessageAck);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke_63(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = objc_alloc_init(CTStewieMessageAck);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (BOOL)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(id)objc_opt_class() conformsToProtocol:&unk_1ED02BDE0] & 1) == 0)
  {
    id v9 = CTLogStewieDataClient();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CTStewieDataClient sendMessage:completion:]();
    }
    goto LABEL_19;
  }
  if (!v7)
  {
    id v9 = CTLogStewieDataClient();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CTStewieDataClient sendMessage:completion:]();
    }
LABEL_19:
    BOOL v11 = 0;
    goto LABEL_23;
  }
  id v25 = 0;
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v25];
  id v9 = v25;
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  BOOL v11 = !v10;
  if (!v10)
  {
    BOOL v12 = ([v6 isMemberOfClass:objc_opt_class()] & 1) != 0
       || ([v6 isMemberOfClass:objc_opt_class()] & 1) != 0
       || [v6 isMemberOfClass:objc_opt_class()];
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v13 = (void *)*((void *)self + 2);
    objc_copyWeak(v23, &location);
    v23[1] = v8;
    v23[2] = (id)v12;
    v23[3] = _Block_copy(v7);
    id v14 = v13;
    operator new();
  }
  uint64_t v15 = CTLogStewieDataClient();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[CTStewieDataClient sendMessage:completion:]((uint64_t)v9, v15, v16, v17, v18, v19, v20, v21);
  }

LABEL_23:
  return v11;
}

- (void)invokeSendCompletionForMsgId:(id)a3 ack:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (v8)
  {
    id v11 = v8;
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v11 UTF8String]);
    BOOL v12 = std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>>>::find<std::string>((uint64_t)self + 88, __p);
    if (v26 < 0) {
      operator delete(__p[0]);
    }
    if ((void **)((char *)self + 96) == v12)
    {
      uint64_t v13 = CTLogStewieDataClient();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CTStewieDataClient invokeSendCompletionForMsgId:ack:metadata:]((uint64_t)v11, v13, v15, v16, v17, v18, v19, v20);
      }
    }
    else
    {
      uint64_t v13 = _Block_copy(v12[7]);
      std::__tree<std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>,std::__map_value_compare<__CTAssertionType *,std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>,std::less<__CTAssertionType *>,true>,std::allocator<std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>>>::__remove_node_pointer((uint64_t **)self + 11, (uint64_t *)v12);
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,0>((uint64_t)(v12 + 4));
      operator delete(v12);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3321888768;
      v21[2] = __64__CTStewieDataClient_invokeSendCompletionForMsgId_ack_metadata___block_invoke;
      v21[3] = &unk_1ECFD3D70;
      id v24 = _Block_copy(v13);
      id v22 = v9;
      id v23 = v10;
      [(CTStewieDataClient *)self dispatchOnDelegateQueue:v21];

      id v14 = v24;
      id v24 = 0;
    }
  }
}

uint64_t __64__CTStewieDataClient_invokeSendCompletionForMsgId_ack_metadata___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)failAllPendingMessages
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  v3 = (long long *)*((void *)self + 11);
  id v4 = (char *)self + 96;
  if (v3 != (long long *)((char *)self + 96))
  {
    do
    {
      *(_OWORD *)__p = 0u;
      *(_OWORD *)aBlock = 0u;
      std::pair<std::string const,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>::pair[abi:nn180100]((std::string *)__p, v3 + 2);
      BOOL v5 = _Block_copy(aBlock[1]);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3321888768;
      v11[2] = __44__CTStewieDataClient_failAllPendingMessages__block_invoke;
      v11[3] = &__block_descriptor_40_ea8_32c88_ZTSN8dispatch5blockIU8__strongU13block_pointerFvP18CTStewieMessageAckP12NSDictionaryEEE_e38_v16__0___CTStewieDataClientDelegate__8l;
      id v12 = _Block_copy(v5);
      [(CTStewieDataClient *)self dispatchOnDelegateQueue:v11];
      id v6 = v12;
      id v12 = 0;

      id v7 = aBlock[1];
      aBlock[1] = 0;

      if (SHIBYTE(aBlock[0]) < 0) {
        operator delete(__p[0]);
      }
      id v8 = (long long *)*((void *)v3 + 1);
      if (v8)
      {
        do
        {
          id v9 = v8;
          id v8 = *(long long **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          id v9 = (long long *)*((void *)v3 + 2);
          BOOL v10 = *(void *)v9 == (void)v3;
          v3 = v9;
        }
        while (!v10);
      }
      v3 = v9;
    }
    while (v9 != (long long *)v4);
  }
  std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>>>::destroy((uint64_t)self + 88, *((void **)self + 12));
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 11) = v4;
}

void __44__CTStewieDataClient_failAllPendingMessages__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(CTStewieMessageAck);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateConnectedServices:(int64_t)a3
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (*((void *)self + 4) != a3)
  {
    *((void *)self + 4) = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__CTStewieDataClient_updateConnectedServices___block_invoke;
    v5[3] = &__block_descriptor_40_e38_v16__0___CTStewieDataClientDelegate__8l;
    v5[4] = a3;
    [(CTStewieDataClient *)self dispatchOnDelegateQueue:v5];
    if (!*((void *)self + 4)) {
      [(CTStewieDataClient *)self failAllPendingMessages];
    }
  }
}

void __46__CTStewieDataClient_updateConnectedServices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 connectedServicesChanged:*(void *)(a1 + 32)];
}

- (void)createConnectionPairIfRequired
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Unable to create connection pair", v2, v3, v4, v5, v6);
}

uint64_t __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  input_handler[0] = MEMORY[0x1E4F143A8];
  input_handler[1] = 3221225472;
  input_handler[2] = __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_2;
  input_handler[3] = &unk_1E5264DE0;
  uint64_t v3 = v2;
  uint8_t v6 = v3;
  nw_framer_set_input_handler(v3, input_handler);
  nw_framer_set_output_handler(v3, &__block_literal_global_91);

  return 2;
}

uint64_t __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_2(uint64_t a1, NSObject *a2)
{
  parse[0] = MEMORY[0x1E4F143A8];
  parse[1] = 3221225472;
  parse[2] = __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3;
  parse[3] = &unk_1E5264DB8;
  id v6 = *(id *)(a1 + 32);
  if (nw_framer_parse_input(a2, 3uLL, 3uLL, 0, parse)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 3;
  }

  return v3;
}

uint64_t __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t result = 0;
  if (a2 && a3 >= 3)
  {
    int v5 = memcmp(&kCTStewieMagicPacket, a2, a3);
    id v6 = CTLogConnectionPair();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3_cold_2();
      }

      nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 50);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3_cold_1();
      }

      nw_framer_pass_through_input(*(nw_framer_t *)(a1 + 32));
      nw_framer_pass_through_output(*(nw_framer_t *)(a1 + 32));
      nw_framer_mark_ready(*(nw_framer_t *)(a1 + 32));
    }
    return 3;
  }
  return result;
}

- (void)discardConnectionPairIfRequired
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  int v5 = (void *)*((void *)self + 7);
  uint64_t v4 = (void *)((char *)self + 56);
  uint64_t v3 = v5;
  if (v5)
  {
    *uint64_t v4 = 0;
    v4[1] = 0;
  }
}

- (void)reEvaluate
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  uint64_t v3 = *((void *)self + 3);
  uint64_t v4 = [*((id *)self + 9) dataPathAssertedServices] & v3;
  if (!v4 || *((void *)self + 8) == 2)
  {
    [(CTStewieDataClient *)self discardConnectionPairIfRequired];
    int v5 = self;
    uint64_t v6 = 0;
LABEL_4:
    [(CTStewieDataClient *)v5 updateConnectedServices:v6];
    return;
  }
  uint64_t v7 = [*((id *)self + 9) activeServices];
  if (*((void *)self + 7) && *((void *)self + 8) == 1)
  {
    uint64_t v6 = v7 & v4;
    int v5 = self;
    goto LABEL_4;
  }

  [(CTStewieDataClient *)self createConnectionPairIfRequired];
}

- (void)stateChanged:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (([*((id *)self + 9) isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)self + 9, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__CTStewieDataClient_stateChanged___block_invoke;
    v6[3] = &unk_1E5264E28;
    id v7 = v5;
    [(CTStewieDataClient *)self dispatchOnDelegateQueue:v6];
    [(CTStewieDataClient *)self reEvaluate];
  }
}

void __35__CTStewieDataClient_stateChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 stateChanged:*(void *)(a1 + 32)];
}

- (void)connectionPairStateChanged:(int64_t)a3
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (*((void *)self + 7) && *((void *)self + 8) != a3)
  {
    *((void *)self + 8) = a3;
    [(CTStewieDataClient *)self reEvaluate];
  }
}

- (void)receivedData:(id)a3 fromConnectionId:(int64_t)a4
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (v6 && *((void *)self + 7))
  {
    id v71 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v71];
    id v8 = v71;
    id v9 = v8;
    if (!v7 || v8)
    {
      uint64_t v16 = CTLogStewieDataClient();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = [v6 length];
        id v22 = CTConnectionPairConnectionIDAsString(a4);
        -[CTStewieDataClient receivedData:fromConnectionId:]((uint64_t)v22, (uint64_t)location, v21);
      }
    }
    else
    {
      BOOL v10 = [v7 data];
      if (!v10
        || ([v7 data],
            id v11 = objc_claimAutoreleasedReturnValue(),
            BOOL v12 = [v11 length] == 0,
            v11,
            v10,
            v12))
      {
        id v23 = CTLogStewieDataClient();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = [v7 msgId];
          id v25 = CTConnectionPairConnectionIDAsString(a4);
          [(CTStewieDataClient *)v24 receivedData:(uint64_t)location fromConnectionId:v23];
        }

        uint64_t v16 = [v7 msgId];
        char v26 = [CTStewieMessageAck alloc];
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v81 = *MEMORY[0x1E4F28568];
        v82[0] = @"Transport error: raise a bug";
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:&v81 count:1];
        objc_super v29 = [v27 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v28];
        id v30 = [(CTStewieMessageAck *)v26 initWithError:v29];
        [(CTStewieDataClient *)self invokeSendCompletionForMsgId:v16 ack:v30 metadata:0];

        id v9 = 0;
      }
      else
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F28DC0];
        id v14 = +[CTStewieTransportMessage allowedSetOfClasses];
        uint64_t v15 = [v7 data];
        id v70 = 0;
        uint64_t v16 = [v13 unarchivedObjectOfClasses:v14 fromData:v15 error:&v70];
        id v9 = v70;

        if (!v16 || v9)
        {
          id v32 = CTLogStewieDataClient();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v55 = [v7 msgId];
            v56 = [v7 data];
            uint64_t v57 = [v56 length];
            v58 = CTConnectionPairConnectionIDAsString(a4);
            *(_DWORD *)id location = 138412802;
            *(void *)&location[4] = v55;
            __int16 v77 = 2048;
            uint64_t v78 = v57;
            __int16 v79 = 2080;
            v80 = v58;
            _os_log_error_impl(&dword_18444A000, v32, OS_LOG_TYPE_ERROR, "Message: %@ has garbage data of length: %lu, connection: %s", location, 0x20u);
          }
          id v33 = [v7 msgId];
          v34 = [CTStewieMessageAck alloc];
          v35 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v74 = *MEMORY[0x1E4F28568];
          v75 = @"Transport error: raise a bug";
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          v37 = [v35 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v36];
          char v38 = [(CTStewieMessageAck *)v34 initWithError:v37];
          [(CTStewieDataClient *)self invokeSendCompletionForMsgId:v33 ack:v38 metadata:0];
        }
        else if ([v16 isMemberOfClass:objc_opt_class()])
        {
          uint64_t v17 = [v7 msgId];
          uint64_t v18 = [v7 metadata];
          uint64_t v19 = [v18 valueForKey:@"clientMetadata"];
          [(CTStewieDataClient *)self invokeSendCompletionForMsgId:v17 ack:v16 metadata:v19];
        }
        else if ([v16 conformsToProtocol:&unk_1ED02C008])
        {
          *(void *)id location = 0;
          objc_initWeak((id *)location, self);
          v62 = [v7 msgId];
          uint64_t v39 = [v7 metadata];
          v61 = [v39 valueForKey:@"clientMetadata"];

          v40 = [v7 metadata];
          v60 = (void *)[v40 mutableCopy];

          [v60 removeObjectForKey:@"clientMetadata"];
          id v41 = *((id *)self + 2);
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __52__CTStewieDataClient_receivedData_fromConnectionId___block_invoke;
          v63[3] = &unk_1E5264E78;
          v42 = v16;
          v64 = v42;
          id v43 = v61;
          id v65 = v43;
          id v59 = v41;
          id v66 = v59;
          id v44 = v60;
          id v67 = v44;
          objc_copyWeak(&v69, (id *)location);
          id v45 = v62;
          id v68 = v45;
          [(CTStewieDataClient *)self dispatchOnDelegateQueue:v63];

          objc_destroyWeak(&v69);
          objc_destroyWeak((id *)location);
          uint64_t v16 = v42;
        }
        else
        {
          v46 = CTLogStewieDataClient();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v47 = [v7 msgId];
            v48 = objc_opt_class();
            [(CTStewieDataClient *)v47 receivedData:(uint64_t)location fromConnectionId:v46];
          }

          v49 = [v7 msgId];
          v50 = [CTStewieMessageAck alloc];
          v51 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v72 = *MEMORY[0x1E4F28568];
          v73 = @"Transport error: raise a bug";
          v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
          v53 = [v51 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v52];
          v54 = [(CTStewieMessageAck *)v50 initWithError:v53];
          [(CTStewieDataClient *)self invokeSendCompletionForMsgId:v49 ack:v54 metadata:0];
        }
      }
    }
  }
  else
  {
    id v9 = CTLogStewieDataClient();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (v6) {
        uint64_t v20 = [v6 length];
      }
      else {
        uint64_t v20 = 0;
      }
      v31 = CTConnectionPairConnectionIDAsString(a4);
      -[CTStewieDataClient receivedData:fromConnectionId:].cold.4((uint64_t)v31, (uint64_t)location, v20);
    }
  }
}

void __52__CTStewieDataClient_receivedData_fromConnectionId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CTStewieDataClient_receivedData_fromConnectionId___block_invoke_2;
  v7[3] = &unk_1E5264E50;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v6 = a2;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  id v10 = *(id *)(a1 + 64);
  [v6 messageReceived:v4 withMetadata:v5 completionBlock:v7];

  objc_destroyWeak(&v11);
}

void __52__CTStewieDataClient_receivedData_fromConnectionId___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  objc_copyWeak(to, (id *)(a1 + 56));
  to[1] = *(id *)(a1 + 48);
  id to[2] = *(id *)(a1 + 40);
  id v3 = v2;
  operator new();
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>>>::destroy((uint64_t)self + 88, *((void **)self + 12));
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_destroyWeak((id *)self + 5);

  objc_storeStrong((id *)self + 2, 0);
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 11) = (char *)self + 96;
  return self;
}

- (id)dispatchOnDelegateQueue:(id *)a1
{
  id v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    objc_destroyWeak(v2);
    MEMORY[0x18531F680](v2, 0xC0C402DE288CCLL);
  }
  return a1;
}

- (id)dispatchOnDelegateQueue:(NSObject  *){objcproto17OS_dispatch_queue}
{
  id v7 = (id *)a1;
  WeakRetained = (id *)objc_loadWeakRetained((id *)a1);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    id v5 = objc_loadWeakRetained(WeakRetained + 5);
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
  return std::unique_ptr<-[CTStewieDataClient dispatchOnDelegateQueue:]::$_1>::~unique_ptr[abi:nn180100](&v7);
}

- (id)sendMessage:(id *)a1 completion:
{
  id v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    objc_destroyWeak(v2);
    MEMORY[0x18531F680](v2, 0x10C0C4019CFF88ELL);
  }
  return a1;
}

- (id)sendMessage:(NSObject  *){objcproto17OS_dispatch_queue} completion:(std::unique_ptr<-[CTStewieDataClient)sendMessage:completion:]::$_2>
{
  id v5 = (id *)a1;
  id WeakRetained = objc_loadWeakRetained((id *)a1);
  id v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained sendMessageInternal:*(void *)(a1 + 8) usingConnection:*(void *)(a1 + 16) completion:*(void *)(a1 + 24)];
  }

  return std::unique_ptr<-[CTStewieDataClient sendMessage:completion:]::$_2>::~unique_ptr[abi:nn180100](&v5);
}

- (void)initWithServices:delegate:delegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Must provide queue for initializing CTStewieDataClient", v2, v3, v4, v5, v6);
}

- (void)initWithServices:delegate:delegateQueue:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Client didn't request any service", v2, v3, v4, v5, v6);
}

- (void)initWithServices:(uint64_t)a3 delegate:(uint64_t)a4 delegateQueue:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithServices:delegate:delegateQueue:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Unable to create monitor", v2, v3, v4, v5, v6);
}

- (void)initWithServices:delegate:delegateQueue:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Delegate must conform to CTStewieDataClientDelegate protocol", v2, v3, v4, v5, v6);
}

- (void)sendMessageInternal:(uint64_t)a1 usingConnection:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_3(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_3_1(&dword_18444A000, "Failing send, service: %ld, pair state: %s", v3, v4);
}

- (void)sendMessageInternal:(uint8_t *)buf usingConnection:(uint64_t)a2 completion:(os_log_t)log .cold.2(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "Data size exceeds configured channel limit: %lu", buf, 0xCu);
}

- (void)sendMessageInternal:(uint64_t)a3 usingConnection:(uint64_t)a4 completion:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendMessage:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "CTStewieSendMessageCompletion block missing", v2, v3, v4, v5, v6);
}

- (void)sendMessage:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendMessage:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Message must conform to CTStewieMessageOutgoing protocol", v2, v3, v4, v5, v6);
}

- (void)invokeSendCompletionForMsgId:(uint64_t)a3 ack:(uint64_t)a4 metadata:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18444A000, v0, OS_LOG_TYPE_DEBUG, "Magic packet matches, making it passthrough!", v1, 2u);
}

void __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Magic packet does not match!", v2, v3, v4, v5, v6);
}

- (void)receivedData:(uint64_t)a3 fromConnectionId:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_3(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_3_1(&dword_18444A000, "Failed to decode incoming data of length: %lu, on connection: %s", v3, v4);
}

- (void)receivedData:(uint64_t)a3 fromConnectionId:(NSObject *)a4 .cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3_1(&dword_18444A000, "Message: %@ has no data, connection: %s", (uint8_t *)a3, a4);
}

- (void)receivedData:(uint64_t)a3 fromConnectionId:(NSObject *)a4 .cold.3(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  id v7 = a2;
  _os_log_error_impl(&dword_18444A000, a4, OS_LOG_TYPE_ERROR, "Message: %@ has unknown type: %@", (uint8_t *)a3, 0x16u);
}

- (void)receivedData:(uint64_t)a3 fromConnectionId:.cold.4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_3(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_3_1(&dword_18444A000, "Dropping incoming data of length: %lu, on connection: %s", v3, v4);
}

@end