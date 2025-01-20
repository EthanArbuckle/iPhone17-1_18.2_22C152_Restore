@interface IDSCrossDeviceTransport
+ (BOOL)isIDSEndpointEnabled;
- (IDSCrossDeviceTransport)init;
- (IDSCrossDeviceTransport)initWithServiceName:(id)a3;
- (id)idsService;
- (unint64_t)deliverMessage:(id)a3 toEndpoint:(id)a4;
- (void)addDelegate:(id)a3 endpoint:(id)a4;
- (void)dealloc;
- (void)registerIDSService;
- (void)removeDelegate:(id)a3 endpoint:(id)a4;
- (void)sendMessage:(id)a3 toIDSDevices:(id)a4 toEndpoint:(id)a5 reply:(id)a6;
- (void)sendMessage:(id)a3 toIDSDevices:(id)a4 toEndpoint:(id)a5 validFor:(double)a6 reply:(id)a7;
- (void)sendMessage:(id)a3 toIDSDevicesMatching:(id)a4 toEndpoint:(id)a5 reply:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)unregisterIDSService;
@end

@implementation IDSCrossDeviceTransport

+ (BOOL)isIDSEndpointEnabled
{
  v2 = +[SystemProperties sharedInstance];
  if ([v2 internalBuild]) {
    int v3 = [v2 factoryBuild] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (IDSCrossDeviceTransport)init
{
  return [(IDSCrossDeviceTransport *)self initWithServiceName:@"com.apple.private.alloy.autobugcapture"];
}

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)IDSCrossDeviceTransport;
  [(IDSCrossDeviceTransport *)&v3 dealloc];
}

- (IDSCrossDeviceTransport)initWithServiceName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSCrossDeviceTransport;
  v6 = [(IDSCrossDeviceTransport *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.symptoms.idsservice.queue", v7);
    idsServiceQueue = v6->_idsServiceQueue;
    v6->_idsServiceQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_serviceName, a3);
  }

  return v6;
}

- (id)idsService
{
  return self->_idsService;
}

- (void)registerIDSService
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (+[IDSCrossDeviceTransport isIDSEndpointEnabled]
    && !self->_idsService)
  {
    v4 = (IDSService *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:self->_serviceName];
    idsService = self->_idsService;
    self->_idsService = v4;

    v6 = self->_idsService;
    v7 = crossdeviceLogHandle();
    dispatch_queue_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        serviceName = self->_serviceName;
        int v14 = 138412290;
        v15 = serviceName;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "Registering for IDSService %@", (uint8_t *)&v14, 0xCu);
      }

      v10 = [MEMORY[0x263EFF9A0] dictionary];
      endpointsRegistry = self->_endpointsRegistry;
      self->_endpointsRegistry = v10;

      v12 = [MEMORY[0x263EFF9C0] set];
      delegateRegistry = self->_delegateRegistry;
      self->_delegateRegistry = v12;

      [(IDSService *)self->_idsService addDelegate:self queue:self->_idsServiceQueue];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "Failed to allocate IDSService object", (uint8_t *)&v14, 2u);
      }
    }
  }
  else
  {
    objc_super v3 = crossdeviceLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEBUG, "IDSService is already registered.", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)unregisterIDSService
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  idsService = self->_idsService;
  v4 = crossdeviceLogHandle();
  id v5 = v4;
  if (idsService)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      serviceName = self->_serviceName;
      int v7 = 138412290;
      dispatch_queue_t v8 = serviceName;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "Unregistering from IDSService %@", (uint8_t *)&v7, 0xCu);
    }

    [(IDSService *)self->_idsService removeDelegate:self];
    id v5 = self->_idsService;
    self->_idsService = 0;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "IDSService is not registered.", (uint8_t *)&v7, 2u);
  }
}

- (void)sendMessage:(id)a3 toIDSDevicesMatching:(id)a4 toEndpoint:(id)a5 reply:(id)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [MEMORY[0x263EFF9C0] set];
  v15 = [(IDSService *)self->_idsService devices];
  uint64_t v16 = v15;
  if (v11)
  {
    v17 = [v15 filteredArrayUsingPredicate:v11];

    v18 = crossdeviceLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v54 = [v17 count];
      __int16 v55 = 2112;
      id v56 = v11;
      __int16 v57 = 2112;
      v58 = v17;
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_INFO, "%ld IDSDevices matched with %@: %@", buf, 0x20u);
    }
  }
  else
  {
    v18 = crossdeviceLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = (uint64_t)v16;
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_INFO, "No predicate given, sending to all IDSDevices: %@", buf, 0xCu);
    }
    v17 = v16;
  }

  if ([v17 count])
  {
    v35 = self;
    v36 = v17;
    v37 = v13;
    id v38 = v12;
    id v39 = v11;
    id v40 = v10;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          v25 = (void *)IDSCopyIDForDevice();
          if ([v25 length])
          {
            [v14 addObject:v25];
          }
          else
          {
            v26 = crossdeviceLogHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v54 = v24;
              _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_ERROR, "Failed to copy ID for IDS device %@", buf, 0xCu);
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v21);
    }

    if ([v14 count])
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __77__IDSCrossDeviceTransport_sendMessage_toIDSDevicesMatching_toEndpoint_reply___block_invoke;
      v41[3] = &unk_263FC4E70;
      id v42 = v14;
      id v13 = v37;
      id v43 = v37;
      id v10 = v40;
      id v12 = v38;
      [(IDSCrossDeviceTransport *)self sendMessage:v40 toIDSDevices:v42 toEndpoint:v38 reply:v41];

      v27 = v42;
      id v11 = v39;
      v17 = v36;
LABEL_31:

      goto LABEL_32;
    }
    v33 = crossdeviceLogHandle();
    id v11 = v39;
    id v10 = v40;
    id v13 = v37;
    id v12 = v38;
    v17 = v36;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [v19 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v54 = v34;
      _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEFAULT, "No IDS destinations identifiers copied from %lu devices", buf, 0xCu);
    }

    if (v37)
    {
      v48 = @"count";
      v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
      v49 = v29;
      v30 = NSDictionary;
      v31 = &v49;
      v32 = &v48;
      goto LABEL_30;
    }
  }
  else
  {
    v28 = crossdeviceLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = (uint64_t)v11;
      _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_DEFAULT, "Did not find IDS devices that match %@", buf, 0xCu);
    }

    if (v13)
    {
      v51 = @"count";
      v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      v52 = v29;
      v30 = NSDictionary;
      v31 = &v52;
      v32 = &v51;
LABEL_30:
      v27 = objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1, v35);

      (*((void (**)(id, void, void *, void))v13 + 2))(v13, 0, v27, 0);
      goto LABEL_31;
    }
  }
LABEL_32:
}

void __77__IDSCrossDeviceTransport_sendMessage_toIDSDevicesMatching_toEndpoint_reply___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  dispatch_queue_t v8 = a4;
  uint64_t v9 = crossdeviceLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"failed";
    uint64_t v11 = *(void *)(a1 + 32);
    if (a2) {
      id v10 = @"successful";
    }
    int v15 = 138412546;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "IDS message sending %@, destinations: %@", (uint8_t *)&v15, 0x16u);
  }

  if (v8)
  {
    id v12 = crossdeviceLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = v8;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, "   Error: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v7];
    int v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    [v13 setObject:v14 forKeyedSubscript:@"count"];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)sendMessage:(id)a3 toIDSDevices:(id)a4 toEndpoint:(id)a5 reply:(id)a6
{
}

- (void)sendMessage:(id)a3 toIDSDevices:(id)a4 toEndpoint:(id)a5 validFor:(double)a6 reply:(id)a7
{
  v43[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  double v13 = COERCE_DOUBLE(a4);
  id v14 = a5;
  int v15 = (void (**)(id, uint64_t, void *, void))a7;
  if ([*(id *)&v13 count])
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", v14, @"endpoint", v12, @"message", 0);
    __int16 v17 = 0;
    if (a6 > 0.0)
    {
      uint64_t v18 = [MEMORY[0x263EFF910] date];
      [v18 timeIntervalSince1970];
      double v20 = v19 + a6;

      uint64_t v21 = [NSNumber numberWithDouble:v20];
      [v16 setObject:v21 forKey:@"ttl"];

      uint64_t v22 = crossdeviceLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        double v37 = a6;
        __int16 v38 = 2048;
        uint64_t v39 = (uint64_t)v20;
        _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_DEBUG, "IDS message will expire in %.0lf seconds at %{time_t}ld", buf, 0x16u);
      }

      __int16 v17 = [MEMORY[0x263EFF9A0] dictionary];
      v23 = [NSNumber numberWithDouble:a6 + 30.0];
      [v17 setObject:v23 forKeyedSubscript:*MEMORY[0x263F49F80]];

      [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49F90]];
    }
    uint64_t v24 = crossdeviceLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      double v37 = v13;
      _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_DEBUG, "Ready to send to IDS destinations with identifiers: %@", buf, 0xCu);
    }

    double v34 = 0.0;
    uint64_t v35 = 0;
    int v25 = [(IDSService *)self->_idsService sendMessage:v16 toDestinations:*(void *)&v13 priority:300 options:v17 identifier:&v34 error:&v35];
    v26 = crossdeviceLogHandle();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        double v28 = v34;
        uint64_t v29 = [*(id *)&v13 count];
        *(_DWORD *)buf = 138412546;
        double v37 = v28;
        __int16 v38 = 2048;
        uint64_t v39 = v29;
        _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEFAULT, "Request to send IDS message %@ to %ld destinations was successful.", buf, 0x16u);
      }

      if (v15)
      {
        id v42 = @"IDSMessageIdentifier";
        *(double *)id v43 = v34;
        v30 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
        v15[2](v15, 1, v30, 0);
      }
    }
    else
    {
      if (v27)
      {
        double v32 = v34;
        uint64_t v33 = [*(id *)&v13 count];
        *(_DWORD *)buf = 138412802;
        double v37 = v32;
        __int16 v38 = 2048;
        uint64_t v39 = v33;
        __int16 v40 = 2112;
        uint64_t v41 = v35;
        _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEFAULT, "Request to send IDS message %@ to %ld destinations failed. %@", buf, 0x20u);
      }

      if (v15) {
        v15[2](v15, 0, 0, v35);
      }
    }
  }
  else
  {
    v31 = crossdeviceLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v37 = v13;
      _os_log_impl(&dword_209DBA000, v31, OS_LOG_TYPE_DEFAULT, "Invalid IDS destinations: %@", buf, 0xCu);
    }

    if (v15) {
      v15[2](v15, 0, 0, 0);
    }
  }
}

- (void)addDelegate:(id)a3 endpoint:(id)a4
{
  id v10 = a4;
  endpointsRegistry = self->_endpointsRegistry;
  id v7 = a3;
  dispatch_queue_t v8 = [(NSMutableDictionary *)endpointsRegistry objectForKeyedSubscript:v10];
  if (v8)
  {
    uint64_t v9 = v8;
    [v8 addObject:v7];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFF980] arrayWithObject:v7];
    [(NSMutableDictionary *)self->_endpointsRegistry setObject:v9 forKeyedSubscript:v10];
  }
  [(NSMutableSet *)self->_delegateRegistry addObject:v7];
}

- (void)removeDelegate:(id)a3 endpoint:(id)a4
{
  id v8 = a3;
  v6 = [(NSMutableDictionary *)self->_endpointsRegistry objectForKeyedSubscript:a4];
  id v7 = v6;
  if (v6) {
    [v6 removeObject:v8];
  }
  [(NSMutableSet *)self->_delegateRegistry removeObject:v8];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a5;
  uint64_t v11 = (__CFString *)a7;
  id v12 = crossdeviceLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = @"failed";
    if (v8) {
      double v13 = @"succeeded";
    }
    *(_DWORD *)buf = 138412802;
    BOOL v27 = v13;
    __int16 v28 = 2112;
    id v29 = v10;
    if (v11) {
      id v14 = v11;
    }
    else {
      id v14 = &stru_26BDE2C70;
    }
    __int16 v30 = 2112;
    v31 = v14;
    _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, "Send message via IDS %@. (%@) %@", buf, 0x20u);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v15 = [(NSMutableSet *)self->_delegateRegistry allObjects];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = *(void **)(*((void *)&v21 + 1) + 8 * v19);
        if (objc_opt_respondsToSelector()) {
          [v20 messageWithIdentifier:v10 didSendWithSuccess:v8 error:v11];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v20 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    id v12 = [NSString stringWithFormat:@" (context: %@)", v11];
  }
  else
  {
    id v12 = &stru_26BDE2C70;
  }
  double v13 = crossdeviceLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2112;
    __int16 v30 = v12;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "Delivered message via IDS with identifier: %@%@", buf, 0x16u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = [(NSMutableSet *)self->_delegateRegistry allObjects];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v19 messageWithIdentifierHasBeenDelivered:v10];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    uint64_t v17 = [NSString stringWithFormat:@" (context: %@)", v16];
  }
  else
  {
    uint64_t v17 = &stru_26BDE2C70;
  }
  uint64_t v18 = crossdeviceLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v36 = (uint64_t)v15;
    __int16 v37 = 2112;
    id v38 = v14;
    __int16 v39 = 2112;
    __int16 v40 = v17;
    _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "Received incoming message via IDS from %@, message %@%@", buf, 0x20u);
  }

  uint64_t v19 = [v12 deviceForFromID:v15];

  if (v19)
  {
    double v34 = self;
    id v20 = [v14 objectForKeyedSubscript:@"endpoint"];
    id v21 = [v14 objectForKeyedSubscript:@"ttl"];
    long long v22 = [v14 objectForKeyedSubscript:@"message"];
    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = v13;
        uint64_t v23 = [v21 longValue];
        long long v24 = crossdeviceLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v36 = v23;
          _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_INFO, "Message is valid until %{time_t}ld", buf, 0xCu);
        }

        uint64_t v31 = v23;
        long long v25 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v23];
        [v25 timeIntervalSinceNow];
        if (v26 < 0.0)
        {
          __int16 v30 = crossdeviceLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v36 = v31;
            _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_DEFAULT, "Received message expired at %{time_t}ld. Will NOT deliver to endpoint.", buf, 0xCu);
          }

          id v13 = v32;
          goto LABEL_25;
        }

        id v13 = v32;
      }
    }
    if (v20 && v22)
    {
      id v33 = v12;
      BOOL v27 = v17;
      id v28 = v13;
      uint64_t v29 = [(IDSCrossDeviceTransport *)v34 deliverMessage:v22 toEndpoint:v20];
      long long v25 = crossdeviceLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v36 = v29;
        _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_INFO, "Delivered message to %ld receivers", buf, 0xCu);
      }
      id v13 = v28;
      uint64_t v17 = v27;
      id v12 = v33;
    }
    else
    {
      long long v25 = crossdeviceLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = (uint64_t)v20;
        __int16 v37 = 2112;
        id v38 = v14;
        _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_ERROR, "Invalid endpoint (%@) or failed to unwrap correctly. Dropping message %@", buf, 0x16u);
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  id v20 = crossdeviceLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_ERROR, "Incoming message is not from a local account - dropping", buf, 2u);
  }
LABEL_26:
}

- (unint64_t)deliverMessage:(id)a3 toEndpoint:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  BOOL v8 = [(NSMutableDictionary *)self->_endpointsRegistry objectForKeyedSubscript:v7];
  if (v8)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__IDSCrossDeviceTransport_deliverMessage_toEndpoint___block_invoke;
    v12[3] = &unk_263FC4E98;
    id v13 = v6;
    id v14 = &v15;
    [v8 enumerateObjectsUsingBlock:v12];
    uint64_t v9 = v13;
  }
  else
  {
    uint64_t v9 = crossdeviceLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Unknown endpoint received: %@", buf, 0xCu);
    }
  }

  unint64_t v10 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __53__IDSCrossDeviceTransport_deliverMessage_toEndpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = crossdeviceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEBUG, "Delivery to %@ with message %@", (uint8_t *)&v7, 0x16u);
  }

  if (objc_opt_respondsToSelector())
  {
    [v3 messageReceivedFromIDS:*(void *)(a1 + 32)];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    id v6 = crossdeviceLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "Delegatee does not respond to messageReceived:, skipping.", (uint8_t *)&v7, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_delegateRegistry, 0);
  objc_storeStrong((id *)&self->_endpointsRegistry, 0);

  objc_storeStrong((id *)&self->_idsServiceQueue, 0);
}

@end