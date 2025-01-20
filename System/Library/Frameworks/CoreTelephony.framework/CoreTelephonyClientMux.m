@interface CoreTelephonyClientMux
- (CoreTelephonyClientMux)init;
- (CoreTelephonyClientMux)initWithEndpoint:(id)a3 sink:(id)a4;
- (CoreTelephonyClientMux)initWithSink:(id)a3;
- (MuxNotificationSink)notificationSink;
- (NSError)reconnectError;
- (NSXPCConnection)connection;
- (NSXPCListenerEndpoint)endpoint;
- (__CTAssertionType)createCTAssertionForConnectionType:(int)a3 allocator:(__CFAllocator *)a4 proxy:(id)a5;
- (id).cxx_construct;
- (id)_sendConnectionInterruptedNotification_sync:(dispatch_queue_s *);
- (id)cachedValueForSelector:(SEL)a3;
- (id)proxyWithErrorHandler_sync:(id)a3;
- (id)proxyWithQueue:(queue)a3 errorHandler:(id)a4;
- (id)removeDelegate:(dispatch_queue_s *);
- (id)removeDelegate:(id *)a1;
- (id)sink:(dispatch_queue_s *) handleNotification:(std::unique_ptr<-[CoreTelephonyClientMux)sink:handleNotification:]::$_2>;
- (id)sink:(id *)a1 handleNotification:;
- (id)synchronousProxyWithErrorHandler:(id)a3;
- (queue)xpcQueue;
- (uint64_t)_getAssertionTypeId;
- (uint64_t)addDelegate:(dispatch_queue_s *) queue:(std::unique_ptr<-[CoreTelephonyClientMux)addDelegate:queue:]::$_0>;
- (uint64_t)addDelegate:(uint64_t *)a1 queue:;
- (unint64_t)_getAssertionTypeId;
- (void)_computeNotificationSetForced_sync;
- (void)_computeNotificationSetForced_sync:(id)a3;
- (void)_computeNotificationSet_sync:(BOOL)a3 completion:(id)a4;
- (void)_computeNotificationSet_sync:(id)a3;
- (void)_connect_sync;
- (void)_ensureConnectionSetup_sync;
- (void)_ensureConnectionSetup_sync:(BOOL)a3;
- (void)_initializeConnection_sync;
- (void)_registerForNotifications_sync:(id)a3 shouldForce:(BOOL)a4 completion:(id)a5;
- (void)_sendConnectionInterruptedNotification_sync:(id)a3;
- (void)_setReconnectError_sync:(id)a3;
- (void)addDelegate:(id)a3 queue:(queue)a4;
- (void)cacheValue:(id)a3 forSelector:(SEL)a4;
- (void)dealloc;
- (void)registerBlockForInvalidationNotification:(__CTAssertionType *)a3 callbackQueue:(queue)a4 callback:(id)a5;
- (void)removeAssertionForInvalidationNotification:(__CTAssertionType *)a3;
- (void)removeDelegate:(dispatch_queue_s *);
- (void)removeDelegate:(id)a3;
- (void)setConnection:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setNotificationSink:(id)a3;
- (void)setReconnectError:(id)a3;
- (void)setXpcQueue:(queue)a3;
- (void)sink:(id)a3 handleNotification:(id)a4;
@end

@implementation CoreTelephonyClientMux

- (CoreTelephonyClientMux)init
{
  v3 = [MuxNotificationSink alloc];
  v4 = [(CoreTelephonyClientMux *)self initWithSink:v3];

  return v4;
}

- (id)proxyWithQueue:(queue)a3 errorHandler:(id)a4
{
  v12 = self;
  id v10 = 0;
  id v11 = a4;
  v9[0] = &v12;
  v9[1] = &v10;
  v9[2] = a3.fObj.fObj;
  v9[3] = &v11;
  v6 = *((void *)self + 10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIZ54__CoreTelephonyClientMux_proxyWithQueue_errorHandler__E3__3EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v9;
  dispatch_sync(v6, block);
  id v7 = v10;

  return v7;
}

- (id)synchronousProxyWithErrorHandler:(id)a3
{
  id v10 = 0;
  v8[0] = self;
  v8[1] = &v10;
  id v9 = _Block_copy(a3);
  v5 = *((void *)self + 10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIZ59__CoreTelephonyClientMux_synchronousProxyWithErrorHandler__E3__4EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v8;
  dispatch_sync(v5, block);

  id v6 = v10;

  return v6;
}

- (void)sink:(id)a3 handleNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [*((id *)self + 8) handleNotification:v7];
  v8 = NSStringFromSelector((SEL)[v7 selector]);
  id v11 = (uint64_t **)*((void *)self + 1);
  id v9 = (uint64_t **)((char *)self + 8);
  id v10 = (uint64_t *)v11;
  if (v11 != v9 + 1)
  {
    do
    {
      id WeakRetained = objc_loadWeakRetained((id *)v10 + 6);
      if (WeakRetained)
      {
        v13 = (uint64_t *)v10[1];
        v14 = v10;
        if (v13)
        {
          do
          {
            v15 = v13;
            v13 = (uint64_t *)*v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            v15 = (uint64_t *)v14[2];
            BOOL v16 = *v15 == (void)v14;
            v14 = v15;
          }
          while (!v16);
        }
        if ([(id)v10[7] containsObject:v8]) {
          v18 = {;
        }
          [v18 retainArguments];
          id v19 = WeakRetained;
          id v20 = v18;
          operator new();
        }
      }
      else
      {
        v21 = CTLogClient();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[CoreTelephonyClientMux sink:handleNotification:](&buf, v23, v21);
        }
      }

      id v10 = v15;
    }
    while (v15 != (uint64_t *)(v9 + 1));
  }
}

- (id)sink:(id *)a1 handleNotification:
{
  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    MEMORY[0x18531F680](v2, 0x80C40803F642BLL);
  }
  return a1;
}

- (id)sink:(dispatch_queue_s *) handleNotification:(std::unique_ptr<-[CoreTelephonyClientMux)sink:handleNotification:]::$_2>
{
  v2 = a1;
  [a1[1] invokeWithTarget:*a1];
  return std::unique_ptr<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>::~unique_ptr[abi:nn180100](&v2);
}

- (uint64_t)addDelegate:(dispatch_queue_s *) queue:(std::unique_ptr<-[CoreTelephonyClientMux)addDelegate:queue:]::$_0>
{
  uint64_t v54 = a1;
  v2 = *(NSObject **)(a1 + 16);
  if (v2) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  id v56 = 0;
  id v57 = 0;
  id v3 = *(id *)(a1 + 8);
  dispatch_object_t object = v2;
  objc_initWeak(&v56, v3);
  v4 = &unk_1ED021AE0;
  id v5 = v3;
  id v6 = objc_opt_new();
  id v7 = &unk_1ED01E580;
  v59 = 0;
  v60 = 0;
  v58 = 0;
  v8 = operator new(8uLL);
  v58 = (id *)v8;
  v60 = v8 + 1;
  id v9 = v7;
  void *v8 = v9;
  v59 = (id *)(v8 + 1);
  id v50 = v4;
  id v10 = (char *)operator new(8uLL);
  v61 = v10;
  *(void *)id v10 = v50;
  v62 = v10 + 8;
  v63 = v10 + 8;
  id v11 = (Protocol *)v50;
  outCount[0] = 0;
  v12 = protocol_copyProtocolList(v11, outCount);
  if (v12 && outCount[0])
  {
    unint64_t v13 = 0;
    do
    {
      v14 = v12[v13];
      *(void *)v64 = v14;
      v15 = v58;
      if (v58 != v59)
      {
        while (*v15 != v14)
        {
          if (++v15 == v59)
          {
            v15 = v59;
            break;
          }
        }
      }
      if (v15 == v59)
      {
        std::vector<Protocol * {__strong}>::push_back[abi:nn180100](&v61, (id *)v64);
        v14 = *(Protocol **)v64;
      }

      ++v13;
    }
    while (v13 < outCount[0]);
    free(v12);
  }
  v51 = v11;
  v52 = v9;

  BOOL v16 = (id *)v61;
  v53 = (id *)v62;
  if (v61 != v62)
  {
    do
    {
      v17 = (Protocol *)*v16;
      do
      {
        v64[0] = 0;
        id v19 = protocol_copyMethodDescriptionList(v17, *v18, v18[1], v64);
        id v20 = v19;
        if (v19) {
          BOOL v21 = v64[0] == 0;
        }
        else {
          BOOL v21 = 1;
        }
        if (!v21)
        {
          unint64_t v22 = 0;
          p_name = &v19->name;
          do
          {
            if (objc_opt_respondsToSelector())
            {
              v24 = NSStringFromSelector(*p_name);
              [v6 addObject:v24];
            }
            ++v22;
            p_name += 2;
          }
          while (v22 < v64[0]);
          free(v20);
        }
        v18 += 2;
      }
      while (v18 != (BOOL *)&kCTLogChannelMaxSendWindowSecondsDefault);

      ++v16;
    }
    while (v16 != v53);
  }
  *(void *)outCount = &v61;
  std::vector<Protocol * {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)outCount);

  v61 = (char *)&v58;
  std::vector<Protocol * {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v61);

  id v57 = v6;
  v25 = *(void ***)a1;
  v27 = (id **)(*(void *)a1 + 16);
  v26 = *v27;
  if (!*v27)
  {
    uint64_t v29 = *(void *)a1 + 16;
    if (v25[1] == v27)
    {
      v34 = 0;
      uint64_t v29 = *(void *)a1 + 16;
      v36 = (void *)v29;
      goto LABEL_60;
    }
    goto LABEL_44;
  }
  unint64_t v28 = *(void *)(a1 + 8);
  uint64_t v29 = *(void *)a1 + 16;
  v30 = *(void **)v29;
  do
  {
    unint64_t v31 = v30[4];
    BOOL v32 = v31 >= v28;
    if (v31 >= v28) {
      v33 = v30;
    }
    else {
      v33 = v30 + 1;
    }
    if (v32) {
      uint64_t v29 = (uint64_t)v30;
    }
    v30 = (void *)*v33;
  }
  while (*v33);
  if ((id **)v29 == v27 || v28 < *(void *)(v29 + 32))
  {
    v34 = *(void **)v29;
    if (v25[1] == (void *)v29)
    {
      v36 = (void *)v29;
      goto LABEL_60;
    }
    if (v34)
    {
      v35 = *(void **)v29;
      do
      {
        v36 = v35;
        v35 = (void *)v35[1];
      }
      while (v35);
      goto LABEL_47;
    }
LABEL_44:
    v36 = (void *)v29;
    do
    {
      v37 = v36;
      v36 = (void *)v36[2];
    }
    while ((void *)*v36 == v37);
    v34 = 0;
    unint64_t v28 = *(void *)(a1 + 8);
LABEL_47:
    if (v36[4] >= v28)
    {
      if (v26)
      {
        do
        {
          while (1)
          {
            v38 = (id **)v26;
            unint64_t v39 = (unint64_t)v26[4];
            if (v28 >= v39) {
              break;
            }
            v26 = *v38;
            if (!*v38)
            {
              v27 = v38;
              goto LABEL_69;
            }
          }
          if (v39 >= v28) {
            goto LABEL_72;
          }
          v26 = v38[1];
        }
        while (v26);
        v27 = v38 + 1;
      }
      else
      {
        v38 = (id **)(*(void *)a1 + 16);
      }
LABEL_69:
      v45 = (id *)operator new(0x40uLL);
      dispatch_object_t v46 = object;
      v45[4] = (id)v28;
      v45[5] = v46;
      dispatch_object_t object = 0;
      objc_moveWeak(v45 + 6, &v56);
      id v47 = v57;
      id v57 = 0;
      v45[7] = v47;
      id *v45 = 0;
      v45[1] = 0;
      v45[2] = v38;
      *v27 = v45;
      v48 = (void *)*v25[1];
      if (v48)
      {
        v25[1] = v48;
        v45 = *v27;
      }
      std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v25[2], (uint64_t *)v45);
      v25[3] = (void *)((char *)v25[3] + 1);
      goto LABEL_72;
    }
LABEL_60:
    if (v34) {
      v27 = (id **)(v36 + 1);
    }
    else {
      v27 = (id **)v29;
    }
    if (*v27) {
      goto LABEL_72;
    }
    if (v34) {
      v38 = (id **)v36;
    }
    else {
      v38 = (id **)v29;
    }
    unint64_t v28 = *(void *)(a1 + 8);
    goto LABEL_69;
  }
  dispatch_object_t v40 = object;
  dispatch_object_t object = 0;
  v41 = *(NSObject **)(v29 + 40);
  *(void *)(v29 + 40) = v40;
  if (v41) {
    dispatch_release(v41);
  }
  id v42 = objc_loadWeakRetained(&v56);
  objc_storeWeak((id *)(v29 + 48), v42);

  id v43 = v57;
  id v57 = 0;
  v44 = *(void **)(v29 + 56);
  *(void *)(v29 + 56) = v43;

LABEL_72:
  objc_msgSend(*(id *)a1, "_computeNotificationSet_sync:", &__block_literal_global_963);

  objc_destroyWeak(&v56);
  if (object) {
    dispatch_release(object);
  }
  return std::unique_ptr<-[CoreTelephonyClientMux addDelegate:queue:]::$_0>::~unique_ptr[abi:nn180100](&v54);
}

- (void)_computeNotificationSet_sync:(id)a3
{
}

- (void)_connect_sync
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  dispatch_queue_get_label(*a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_18444A000, a2, v3, "New connection has been initialized with queue: %s", v4);
}

- (void)_computeNotificationSet_sync:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (*((void *)self + 3))
  {
    BOOL v20 = v4;
    id v7 = objc_opt_new();
    v8 = (CoreTelephonyClientMux *)*((void *)self + 1);
    if (v8 != (CoreTelephonyClientMux *)((char *)self + 16))
    {
      do
      {
        *(void *)&buf[16] = 0;
        id v27 = 0;
        id v9 = *((void *)v8 + 5);
        *(void *)uint8_t buf = *((void *)v8 + 4);
        *(void *)&buf[8] = v9;
        if (v9) {
          dispatch_retain(v9);
        }
        objc_copyWeak((id *)&buf[16], (id *)v8 + 6);
        id v27 = *((id *)v8 + 7);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = v27;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v10);
              }
              [v7 addObject:*(void *)(*((void *)&v21 + 1) + 8 * i)];
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v11);
        }

        objc_destroyWeak((id *)&buf[16]);
        if (*(void *)&buf[8]) {
          dispatch_release(*(dispatch_object_t *)&buf[8]);
        }
        v14 = (CoreTelephonyClientMux *)*((void *)v8 + 1);
        if (v14)
        {
          do
          {
            v15 = v14;
            v14 = *(CoreTelephonyClientMux **)v14;
          }
          while (v14);
        }
        else
        {
          do
          {
            v15 = (CoreTelephonyClientMux *)*((void *)v8 + 2);
            BOOL v16 = *(void *)v15 == (void)v8;
            v8 = v15;
          }
          while (!v16);
        }
        v8 = v15;
      }
      while (v15 != (CoreTelephonyClientMux *)((char *)self + 16));
    }
    if (isFrameworkLoggingSupported())
    {
      v17 = CTLogClient();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v7 count];
        uint64_t v19 = *((void *)self + 3);
        *(_DWORD *)uint8_t buf = 134218240;
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_18444A000, v17, OS_LOG_TYPE_INFO, "Found %lu implemented methods in %zu delegates", buf, 0x16u);
      }
    }
    [(CoreTelephonyClientMux *)self _registerForNotifications_sync:v7 shouldForce:v20 completion:v6];
  }
  else
  {
    [(CoreTelephonyClientMux *)self _registerForNotifications_sync:0 shouldForce:v4 completion:v6];
  }
}

- (void)_registerForNotifications_sync:(id)a3 shouldForce:(BOOL)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (a4 || ![*((id *)self + 4) isEqualToSet:v9])
  {
    uint64_t v12 = [(CoreTelephonyClientMux *)self proxyWithErrorHandler_sync:v10];
    if ([v9 count])
    {
      unint64_t v13 = [v9 allObjects];
    }
    else
    {
      unint64_t v13 = 0;
    }
    if (isFrameworkLoggingSupported())
    {
      v14 = CTLogClient();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        BOOL v16 = v13;
        _os_log_impl(&dword_18444A000, v14, OS_LOG_TYPE_DEFAULT, "Sending selectors to server: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    [v12 registerForNotifications:v13 completion:v10];
    objc_storeStrong((id *)self + 4, a3);
  }
  else if (isFrameworkLoggingSupported())
  {
    uint64_t v11 = CTLogClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CoreTelephonyClientMux _registerForNotifications_sync:shouldForce:completion:]();
    }
  }
}

- (CoreTelephonyClientMux)initWithSink:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CoreTelephonyClientMux;
  id v6 = [(CoreTelephonyClientMux *)&v16 init];
  if (v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.CoreTelephonyClientMux.xpc.%p", v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    v8 = (const char *)[v7 UTF8String];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v11 = dispatch_queue_create(v8, v10);
    uint64_t v12 = *((void *)v6 + 10);
    *((void *)v6 + 10) = v11;
    if (v12) {
      dispatch_release(v12);
    }
    objc_storeStrong((id *)v6 + 12, a3);
    [*((id *)v6 + 12) setDelegate:v6];
    uint64_t v13 = objc_opt_new();
    v14 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v13;

    objc_msgSend(v6, "_initializeConnection_sync");
  }

  return (CoreTelephonyClientMux *)v6;
}

- (id)proxyWithErrorHandler_sync:(id)a3
{
  id v4 = a3;
  [(CoreTelephonyClientMux *)self _setReconnectError_sync:0];
  [(CoreTelephonyClientMux *)self _ensureConnectionSetup_sync];
  id v5 = [*((id *)self + 9) remoteObjectProxyWithErrorHandler:v4];

  return v5;
}

- (void)_ensureConnectionSetup_sync:(BOOL)a3
{
  if (!*((void *)self + 9))
  {
    BOOL v3 = a3;
    [(CoreTelephonyClientMux *)self _connect_sync];
    if (v3)
    {
      [(CoreTelephonyClientMux *)self _computeNotificationSetForced_sync];
    }
  }
}

- (void)_setReconnectError_sync:(id)a3
{
}

- (void)_ensureConnectionSetup_sync
{
}

- (void)_initializeConnection_sync
{
}

- (void)addDelegate:(id)a3 queue:(queue)a4
{
  id v6 = a3;
  self;
  id v7 = v6;
  v8 = *(NSObject **)a4.fObj.fObj;
  if (v8) {
    dispatch_retain(v8);
  }
  operator new();
}

- (uint64_t)addDelegate:(uint64_t *)a1 queue:
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    BOOL v3 = *(NSObject **)(v2 + 16);
    if (v3) {
      dispatch_release(v3);
    }

    MEMORY[0x18531F680](v2, 0xE0C4087BCC992);
  }
  return a1;
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 7) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = (char *)self + 48;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  BOOL v3 = *((void *)self + 10);
  if (v3) {
    dispatch_release(v3);
  }
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  std::__tree<std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>,std::__map_value_compare<__CTAssertionType *,std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>,std::less<__CTAssertionType *>,true>,std::allocator<std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>>>::destroy((uint64_t)self + 40, *((void **)self + 6));
  objc_storeStrong((id *)self + 4, 0);
  id v4 = (void *)*((void *)self + 2);
}

- (id)cachedValueForSelector:(SEL)a3
{
  return (id)[*((id *)self + 8) valueForSelector:a3];
}

- (void)cacheValue:(id)a3 forSelector:(SEL)a4
{
}

- (id)removeDelegate:(dispatch_queue_s *)
{
  uint64_t v12 = (id *)a1;
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = (uint64_t *)(*(void *)a1 + 16);
  id v4 = (void *)*v3;
  if (!*v3) {
    goto LABEL_19;
  }
  id v5 = (uint64_t **)(*(void *)a1 + 8);
  id v6 = v3;
  do
  {
    unint64_t v7 = v4[4];
    BOOL v8 = v7 >= v2;
    if (v7 >= v2) {
      id v9 = v4;
    }
    else {
      id v9 = v4 + 1;
    }
    if (v8) {
      id v6 = v4;
    }
    id v4 = (void *)*v9;
  }
  while (*v9);
  if (v6 != v3 && v2 >= v6[4])
  {
  }
  else
  {
LABEL_19:
    if (v2)
    {
      id v10 = CTLogClient();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        dispatch::async<-[CoreTelephonyClientMux removeDelegate:]::$_1>(dispatch_queue_s *,std::unique_ptr<-[CoreTelephonyClientMux removeDelegate:]::$_1>)::{lambda(void *)#1}::__invoke();
      }
    }
  }
  objc_msgSend(*(id *)a1, "_computeNotificationSet_sync:", &__block_literal_global_967);
  return std::unique_ptr<-[CoreTelephonyClientMux removeDelegate:]::$_1>::~unique_ptr[abi:nn180100](&v12);
}

- (void)removeDelegate:(id)a3
{
  BOOL v3 = self;
  operator new();
}

- (id)removeDelegate:(id *)a1
{
  unint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    MEMORY[0x18531F680](v2, 0xC0C402DE288CCLL);
  }
  return a1;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18444A000, v0, OS_LOG_TYPE_DEBUG, "[XXX] Dealloc CoreTelephonyClientMux", v1, 2u);
}

void __39__CoreTelephonyClientMux__connect_sync__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 8) handleDisconnection];
    objc_msgSend(v2, "_setReconnectError_sync:", 0);
    if (isFrameworkLoggingSupported())
    {
      BOOL v3 = CTLogClient();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_18444A000, v3, OS_LOG_TYPE_DEFAULT, "Connection has been invalidated", v5, 2u);
      }
    }
    id v4 = (void *)v2[9];
    v2[9] = 0;
  }
}

- (CoreTelephonyClientMux)initWithEndpoint:(id)a3 sink:(id)a4
{
  objc_storeStrong((id *)self + 11, a3);
  id v6 = a4;
  unint64_t v7 = [(CoreTelephonyClientMux *)self initWithSink:v6];

  return v7;
}

- (void)_computeNotificationSetForced_sync
{
}

void __60__CoreTelephonyClientMux__computeNotificationSetForced_sync__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (isFrameworkLoggingSupported())
    {
      BOOL v3 = CTLogClient();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __60__CoreTelephonyClientMux__computeNotificationSetForced_sync__block_invoke_cold_1();
      }
    }
  }
}

- (void)_computeNotificationSetForced_sync:(id)a3
{
}

void __39__CoreTelephonyClientMux__connect_sync__block_invoke_413(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 8) handleDisconnection];
    if (v2[13])
    {
      BOOL v3 = CTLogClient();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl(&dword_18444A000, v3, OS_LOG_TYPE_DEFAULT, "Reconnection was already attempted", buf, 2u);
      }
    }
    else
    {
      id v4 = CTLogClient();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl(&dword_18444A000, v4, OS_LOG_TYPE_DEFAULT, "Connection interrupted. Attempting to reestablish connection", buf, 2u);
      }
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __39__CoreTelephonyClientMux__connect_sync__block_invoke_414;
      v5[3] = &unk_1E5264098;
      id v6 = v2;
      objc_msgSend(v6, "_computeNotificationSetForced_sync:", v5);
    }
  }
}

void __39__CoreTelephonyClientMux__connect_sync__block_invoke_414(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setReconnectError_sync:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_sendConnectionInterruptedNotification_sync:", v3);
  if (v3)
  {
    id v4 = CTLogClient();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__CoreTelephonyClientMux__connect_sync__block_invoke_414_cold_1();
    }
  }
  else
  {
    id v5 = CTLogClient();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18444A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully reestablished connection", v6, 2u);
    }
  }
}

- (void)_sendConnectionInterruptedNotification_sync:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CTLogClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *((void *)self + 7);
    *(_DWORD *)uint8_t buf = 134217984;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_18444A000, v5, OS_LOG_TYPE_DEFAULT, "_sendConnectionInterruptedNotification_sync, Map size = %lu", buf, 0xCu);
  }
  unint64_t v7 = (CoreTelephonyClientMux *)*((void *)self + 5);
  if (v7 != (CoreTelephonyClientMux *)((char *)self + 48))
  {
    do
    {
      if (*((void *)v7 + 4))
      {
        BOOL v8 = (const void *)*((void *)v7 + 6);
        if (v8)
        {
          if (*((void *)v7 + 5))
          {
            _Block_copy(v8);
            id v9 = v4;
            operator new();
          }
        }
      }
      id v10 = CTLogClient();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(CoreTelephonyClientMux *)&v14 _sendConnectionInterruptedNotification_sync:v10];
      }
      dispatch_queue_t v11 = (CoreTelephonyClientMux *)*((void *)v7 + 1);
      if (v11)
      {
        do
        {
          uint64_t v12 = v11;
          dispatch_queue_t v11 = *(CoreTelephonyClientMux **)v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v12 = (CoreTelephonyClientMux *)*((void *)v7 + 2);
          BOOL v13 = *(void *)v12 == (void)v7;
          unint64_t v7 = v12;
        }
        while (!v13);
      }
      unint64_t v7 = v12;
    }
    while (v12 != (CoreTelephonyClientMux *)((char *)self + 48));
  }
}

- (void)removeAssertionForInvalidationNotification:(__CTAssertionType *)a3
{
  if (a3)
  {
    v7[0] = self;
    v7[1] = a3;
    id v5 = *((void *)self + 10);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN8dispatch9sync_implIZ69__CoreTelephonyClientMux_removeAssertionForInvalidationNotification__E3__6EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v7;
    dispatch_sync(v5, block);
  }
  else if (isFrameworkLoggingSupported())
  {
    uint64_t v6 = CTLogClient();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CoreTelephonyClientMux removeAssertionForInvalidationNotification:]();
    }
  }
}

- (unint64_t)_getAssertionTypeId
{
  if (-[CoreTelephonyClientMux _getAssertionTypeId]::_predicate != -1) {
    dispatch_once_f(&-[CoreTelephonyClientMux _getAssertionTypeId]::_predicate, 0, (dispatch_function_t)-[CoreTelephonyClientMux _getAssertionTypeId]::$_7::__invoke);
  }
  return -[CoreTelephonyClientMux _getAssertionTypeId]::_CTAssertionConnectionTypeID;
}

- (__CTAssertionType)createCTAssertionForConnectionType:(int)a3 allocator:(__CFAllocator *)a4 proxy:(id)a5
{
  id v8 = a5;
  [(CoreTelephonyClientMux *)self _getAssertionTypeId];
  uint64_t Instance = _CFRuntimeCreateInstance();
  id v10 = (__CTAssertionType *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0;
    *(void *)(Instance + 32) = 0;
    *(void *)(Instance + 24) = 0;
    objc_storeStrong((id *)(Instance + 16), a5);
    v10->var3 = a3;
    objc_storeWeak(&v10->var2, self);
  }
  else if (isFrameworkLoggingSupported())
  {
    dispatch_queue_t v11 = CTLogClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CoreTelephonyClientMux createCTAssertionForConnectionType:allocator:proxy:]();
    }
  }

  return v10;
}

- (void)registerBlockForInvalidationNotification:(__CTAssertionType *)a3 callbackQueue:(queue)a4 callback:(id)a5
{
  if (a3 && a5)
  {
    v12[0] = self;
    v12[1] = a3;
    id v9 = _Block_copy(a5);
    id v10 = *(NSObject **)a4.fObj.fObj;
    id v13 = v9;
    dispatch_object_t object = v10;
    if (v10) {
      dispatch_retain(v10);
    }
    dispatch_queue_t v11 = *((void *)self + 10);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN8dispatch9sync_implIZ90__CoreTelephonyClientMux_registerBlockForInvalidationNotification_callbackQueue_callback__E3__8EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v12;
    dispatch_sync(v11, block);
    if (object) {
      dispatch_release(object);
    }
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)*((void *)self + 9);
}

- (void)setConnection:(id)a3
{
}

- (queue)xpcQueue
{
  id v3 = *((void *)self + 10);
  void *v2 = v3;
  if (v3) {
    dispatch_retain(v3);
  }
  return (queue)v3;
}

- (void)setXpcQueue:(queue)a3
{
  uint64_t v4 = *(void *)a3.fObj.fObj;
  if (*(void *)a3.fObj.fObj) {
    dispatch_retain(*(dispatch_object_t *)a3.fObj.fObj);
  }
  id v5 = *((void *)self + 10);
  *((void *)self + 10) = v4;
  if (v5)
  {
    dispatch_release(v5);
  }
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)*((void *)self + 11);
}

- (void)setEndpoint:(id)a3
{
}

- (MuxNotificationSink)notificationSink
{
  return (MuxNotificationSink *)*((void *)self + 12);
}

- (void)setNotificationSink:(id)a3
{
}

- (NSError)reconnectError
{
  return (NSError *)*((void *)self + 13);
}

- (void)setReconnectError:(id)a3
{
}

- (uint64_t)_getAssertionTypeId
{
  uint64_t result = _CFRuntimeRegisterClass();
  -[CoreTelephonyClientMux _getAssertionTypeId]::_CTAssertionConnectionTypeID = result;
  return result;
}

- (id)_sendConnectionInterruptedNotification_sync:(dispatch_queue_s *)
{
  uint64_t v4 = a1;
  if (*a1)
  {
    id v2 = CTLogClient();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl(&dword_18444A000, v2, OS_LOG_TYPE_DEFAULT, "_sendConnectionInterruptedNotification_sync invoke callback", buf, 2u);
    }
    (*((void (**)(void))*a1 + 2))();
  }
  return std::unique_ptr<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>::~unique_ptr[abi:nn180100](&v4);
}

- (void)sink:(os_log_t)log handleNotification:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_18444A000, log, OS_LOG_TYPE_DEBUG, "Invalid delegate when forwarding notification!", buf, 2u);
}

void __60__CoreTelephonyClientMux__computeNotificationSetForced_sync__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_18444A000, v0, v1, "Updating selectors failed with: %@", v2, v3, v4, v5, v6);
}

- (void)_registerForNotifications_sync:shouldForce:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18444A000, v0, OS_LOG_TYPE_DEBUG, "Selector set remains unchanged", v1, 2u);
}

void __39__CoreTelephonyClientMux__connect_sync__block_invoke_414_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_18444A000, v0, v1, "Failed to ping server after connection was interrupted: %@", v2, v3, v4, v5, v6);
}

- (void)_sendConnectionInterruptedNotification_sync:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "_sendConnectionInterruptedNotification_sync invalid callback", buf, 2u);
}

- (void)removeAssertionForInvalidationNotification:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "invalid assertion in removeAssertionForInvalidationNotification", v2, v3, v4, v5, v6);
}

- (void)createCTAssertionForConnectionType:allocator:proxy:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "CTAssertionTypeRef failed to create", v2, v3, v4, v5, v6);
}

- (void)removeDelegate:(dispatch_queue_s *)
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18444A000, v0, OS_LOG_TYPE_FAULT, "Expected to find delegate to remove", v1, 2u);
}

@end