@interface NEIKEv2Transport
+ (NEIKEv2Transport)createTransport:(void *)a3 remote:(void *)a4 local:(unsigned int)a5 localPort:(void *)a6 boundInterface:(void *)a7 queue:(void *)a8 socketGetBlock:(void *)a9 packetDelegate:;
+ (__CFString)stringForTransport:(uint64_t)a1;
- (NEIKEv2Transport)init;
- (NSString)description;
- (uint64_t)sendData:(void *)a3 sendCompletionHandler:;
- (uint64_t)setWildcardDelegate:(char)a3 preventsInvalidation:;
- (void)addClient:(void *)a3 delegate:;
- (void)callConnectedBlocks;
- (void)cancelClient:(int)a3 shouldInvalidate:;
- (void)cancelInvalidationTimer;
- (void)dealloc;
- (void)handleConnectionEventWithState:(void *)a3 error:;
- (void)invalidate;
- (void)port;
- (void)readOnConnection;
- (void)receivePacket:(id *)a1;
- (void)receivePacketData:(id)a3;
- (void)reportConnectionError:(void *)a1;
- (void)setRemoteSPI:(void *)a3 forClient:;
- (void)startInvalidationTimer;
- (void)waitForTransport:(uint64_t)a1;
@end

@implementation NEIKEv2Transport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_destroyWeak((id *)&self->_wildcardDelegate);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_receiveQueue, 0);
  objc_storeStrong((id *)&self->_connectedBlocks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_packetDelegate);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_remote, 0);

  objc_storeStrong((id *)&self->_local, 0);
}

- (void)receivePacketData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    int v16 = 136315138;
    v17 = "-[NEIKEv2Transport receivePacketData:]";
    v14 = "%s called with null data";
    goto LABEL_15;
  }
  if (![v4 length])
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    int v16 = 136315138;
    v17 = "-[NEIKEv2Transport receivePacketData:]";
    v14 = "%s called with null data.length";
    goto LABEL_15;
  }
  if (!self) {
    goto LABEL_16;
  }
  if (self->_cancelled)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    LOWORD(v16) = 0;
    v13 = "Transport cancelled, ignoring";
LABEL_12:
    _os_log_debug_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v16, 2u);
    goto LABEL_17;
  }
  if (!objc_msgSend(objc_getProperty(self, v6, 80, 1), "count"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_wildcardDelegate);

    if (!WeakRetained)
    {
LABEL_16:
      v12 = ne_log_obj();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      LOWORD(v16) = 0;
      v13 = "Transport has no clients, ignoring";
      goto LABEL_12;
    }
  }
  if (!objc_getProperty(self, v7, 72, 1))
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    int v16 = 136315138;
    v17 = "-[NEIKEv2Transport receivePacketData:]";
    v14 = "%s called with null self.receiveQueue";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v16, 0xCu);
    goto LABEL_17;
  }
  Property = objc_getProperty(self, v9, 72, 1);
  dispatch_assert_queue_V2(Property);
  v11 = +[NEIKEv2Packet createPacketFromReceivedData:]((uint64_t)NEIKEv2Packet, v5);
  if (v11)
  {
    v12 = v11;
    -[NEIKEv2Transport receivePacket:]((id *)&self->super.isa, v11);
  }
  else
  {
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v16) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "[NEIKEv2Packet packetFromReceivedData] failed", (uint8_t *)&v16, 2u);
    }

    v12 = 0;
  }
LABEL_17:
}

- (void)receivePacket:(id *)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = (id)objc_msgSend(objc_getProperty(a1, v3, 80, 1), "copy");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      v30 = a1;
      id v31 = v5;
      char v32 = 0;
      uint64_t v9 = *(void *)v34;
      while (1)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(id **)(*((void *)&v33 + 1) + 8 * v10);
          if (v11) {
            id Property = objc_getProperty(*(id *)(*((void *)&v33 + 1) + 8 * v10), v7, 8, 1);
          }
          else {
            id Property = 0;
          }
          id v14 = Property;
          if (v4[11]) {
            ptrdiff_t v15 = 40;
          }
          else {
            ptrdiff_t v15 = 32;
          }
          id v16 = objc_getProperty(v4, v13, v15, 1);
          int v17 = [v14 isEqual:v16];

          if (v17)
          {

            if (!v11) {
              goto LABEL_26;
            }
LABEL_14:
            id WeakRetained = objc_loadWeakRetained(v11 + 3);
            if (!WeakRetained) {
              goto LABEL_26;
            }
            id v16 = WeakRetained;
            [WeakRetained receivePacket:v4];
            char v32 = 1;
LABEL_25:

            goto LABEL_26;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
          if (v11) {
            id v20 = objc_getProperty(v11, v19, 16, 1);
          }
          else {
            id v20 = 0;
          }
          id v22 = v20;
          if (v4[11]) {
            ptrdiff_t v23 = 32;
          }
          else {
            ptrdiff_t v23 = 40;
          }
          id v24 = objc_getProperty(v4, v21, v23, 1);
          int v25 = [v22 isEqual:v24];

          if (v25)
          {
            id v5 = v31;
            if (v11) {
              goto LABEL_14;
            }
          }
          else
          {
            id v5 = v31;
          }
LABEL_26:
          ++v10;
        }
        while (v8 != v10);
        uint64_t v26 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
        uint64_t v8 = v26;
        if (!v26)
        {

          a1 = v30;
          if (v32) {
            goto LABEL_43;
          }
          goto LABEL_35;
        }
      }
    }

LABEL_35:
    id v27 = objc_loadWeakRetained(a1 + 11);
    v28 = ne_log_obj();
    v29 = v28;
    if (v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v4;
        _os_log_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_INFO, "No matching clients, trying wildcard for %@", buf, 0xCu);
      }

      [v27 receivePacket:v4 transport:a1];
    }
    else
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v4;
        _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "No matching clients, dropping %@", buf, 0xCu);
      }
    }
LABEL_43:
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  if (self)
  {
    +[NEIKEv2Transport stringForTransport:]((uint64_t)NEIKEv2Transport, self->_transportType);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_packetDelegate);
    if (WeakRetained) {
      v7 = " PacketDelegate";
    }
    else {
      v7 = "";
    }
    id v8 = objc_getProperty(self, v5, 16, 1);
    id v10 = objc_getProperty(self, v9, 24, 1);
    if (self->_cancelled) {
      v11 = " (Closed)";
    }
    else {
      v11 = "";
    }
  }
  else
  {
    self;
    id v8 = 0;
    id WeakRetained = 0;
    id v10 = 0;
    v7 = "";
    id v4 = @"UDP";
    v11 = "";
  }
  v12 = (void *)[v3 initWithFormat:@"<NEIKEv2Transport> %@%s %@ -> %@%s", v4, v7, v8, v10, v11];

  return (NSString *)v12;
}

+ (__CFString)stringForTransport:(uint64_t)a1
{
  self;
  if (a2 >= 4) {
    id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown (%u)", a2);
  }
  else {
    id v3 = off_1E59910D8[a2];
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = self;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "deallocating %@", buf, 0xCu);
  }

  if (self)
  {
    self->_cancelled = 1;
    objc_storeWeak((id *)&self->_packetDelegate, 0);
    if (objc_getProperty(self, v4, 56, 1))
    {
      id Property = objc_getProperty(self, v5, 56, 1);
      nw_connection_cancel(Property);
      objc_setProperty_atomic(self, v7, 0, 56);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2Transport;
  [(NEIKEv2Transport *)&v8 dealloc];
}

- (NEIKEv2Transport)init
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2Transport;
  v2 = [(NEIKEv2Transport *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    SEL v4 = v2;
  }
  else
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)SEL v7 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }
  return v3;
}

- (void)startInvalidationTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NEIKEv2Transport *)a1 cancelInvalidationTimer];
  id Property = objc_getProperty(a1, v3, 72, 1);
  id v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, Property);
  dispatch_time_t v6 = dispatch_time(0x8000000000000000, 5000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, a1);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__NEIKEv2Transport_startInvalidationTimer__block_invoke;
  handler[3] = &unk_1E5991040;
  objc_copyWeak(&v12, &location);
  SEL v7 = v5;
  uint64_t v11 = v7;
  dispatch_source_set_event_handler(v7, handler);
  objc_setProperty_atomic(a1, v8, v7, 96);
  dispatch_activate(v7);
  SEL v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    ptrdiff_t v15 = a1;
    _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_INFO, "%@ started invalidation timer", buf, 0xCu);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)cancelInvalidationTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (objc_getProperty(a1, a2, 96, 1))
  {
    id Property = objc_getProperty(a1, v3, 96, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(a1, v5, 0, 96);
    dispatch_time_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      SEL v8 = a1;
      _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "%@ cancelled invalidation timer", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __42__NEIKEv2Transport_startInvalidationTimer__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  SEL v4 = WeakRetained;
  if (WeakRetained
    && (WeakRetained[9] & 1) == 0
    && !objc_msgSend(objc_getProperty(WeakRetained, v3, 80, 1), "count")
    && objc_getProperty(v4, v5, 96, 1) == *(id *)(a1 + 32))
  {
    dispatch_time_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEFAULT, "%@ has no clients after 5s, invalidating", (uint8_t *)&v8, 0xCu);
    }

    [(NEIKEv2Transport *)(uint64_t)v4 invalidate];
  }
}

- (void)invalidate
{
  if (objc_getProperty((id)a1, a2, 56, 1))
  {
    id Property = objc_getProperty((id)a1, v3, 56, 1);
    nw_connection_cancel(Property);
    objc_setProperty_atomic((id)a1, v5, 0, 56);
  }
  *(unsigned char *)(a1 + 9) = 1;
  objc_storeWeak((id *)(a1 + 48), 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  [WeakRetained invalidatingTransport:a1];

  objc_storeWeak((id *)(a1 + 88), 0);
  [(NEIKEv2Transport *)(void *)a1 cancelInvalidationTimer];
  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  [(id)g_transports removeObject:a1];

  os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
}

- (void)addClient:(void *)a3 delegate:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  dispatch_time_t v6 = a3;
  if (a1)
  {
    if (v5)
    {
      int v7 = ne_log_obj();
      p_super = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412802;
          v19 = v6;
          __int16 v20 = 2112;
          id v21 = v5;
          __int16 v22 = 2112;
          ptrdiff_t v23 = a1;
          _os_log_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_DEFAULT, "NEIKEv2Transport: Adding client %@ with SPI %@ on %@", (uint8_t *)&v18, 0x20u);
        }

        uint64_t v9 = objc_alloc_init(NEIKEv2TransportClient);
        if (v9)
        {
          p_super = &v9->super;
          objc_setProperty_atomic(v9, v10, v5, 8);
          objc_storeWeak((id *)&p_super[3].isa, v6);
          if (!objc_getProperty(a1, v11, 80, 1))
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            objc_setProperty_atomic(a1, v14, v13, 80);
          }
          objc_msgSend(objc_getProperty(a1, v12, 80, 1), "addObject:", p_super);
          [(NEIKEv2Transport *)a1 cancelInvalidationTimer];
        }
        else
        {
          uint64_t v16 = ne_log_obj();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v18) = 0;
            _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, "[[NEIKEv2TransportClient alloc] init] failed", (uint8_t *)&v18, 2u);
          }

          p_super = 0;
        }
        goto LABEL_13;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v18 = 136315138;
        v19 = "-[NEIKEv2Transport addClient:delegate:]";
        int v17 = "%s called with null delegate";
        goto LABEL_19;
      }
    }
    else
    {
      p_super = ne_log_obj();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        int v18 = 136315138;
        v19 = "-[NEIKEv2Transport addClient:delegate:]";
        int v17 = "%s called with null clientSPI";
LABEL_19:
        _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v18, 0xCu);
      }
    }
LABEL_13:
  }
}

- (uint64_t)setWildcardDelegate:(char)a3 preventsInvalidation:
{
  id v5 = a2;
  dispatch_time_t v6 = v5;
  if (a1)
  {
    uint64_t v9 = v5;
    objc_storeWeak((id *)(a1 + 88), v5);
    *(unsigned char *)(a1 + 10) = a3;
    id v5 = (char *)objc_msgSend(objc_getProperty((id)a1, v7, 80, 1), "count");
    dispatch_time_t v6 = v9;
    if (!v5)
    {
      if (v9)
      {
        if (a3) {
          [(NEIKEv2Transport *)(void *)a1 cancelInvalidationTimer];
        }
        else {
          [(NEIKEv2Transport *)(void *)a1 startInvalidationTimer];
        }
      }
      else
      {
        [(NEIKEv2Transport *)a1 invalidate];
      }
      dispatch_time_t v6 = v9;
    }
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

- (void)setRemoteSPI:(void *)a3 forClient:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = objc_getProperty(a1, v6, 80, 1);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (!v9) {
      goto LABEL_19;
    }
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        SEL v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        if (v14)
        {
          if (!objc_msgSend(objc_getProperty(*(id *)(*((void *)&v17 + 1) + 8 * v13), v10, 8, 1), "isEqual:", v7)|| objc_getProperty(v14, v10, 16, 1))
          {
            goto LABEL_14;
          }
          objc_setProperty_atomic(v14, v10, v5, 16);
        }
        else if (([0 isEqual:v7] & 1) == 0)
        {
          goto LABEL_14;
        }
        ptrdiff_t v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v22 = v14;
          __int16 v23 = 2112;
          uint64_t v24 = a1;
          _os_log_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEFAULT, "Set remote SPI for client %@ on %@", buf, 0x16u);
        }

LABEL_14:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v16 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
      uint64_t v11 = v16;
      if (!v16)
      {
LABEL_19:

        break;
      }
    }
  }
}

- (void)cancelClient:(int)a3 shouldInvalidate:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a1)
  {
    if (a3) {
      [(NEIKEv2Transport *)a1 invalidate];
    }
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "";
      *(_DWORD *)buf = 136315650;
      if (a3) {
        id v8 = " and invalidating";
      }
      uint64_t v33 = (uint64_t)v8;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v6;
      __int16 v36 = 2112;
      uint64_t v37 = a1;
      _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling%s client %@ for %@", buf, 0x20u);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = objc_getProperty((id)a1, v9, 80, 1);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
          if (v16) {
            id Property = objc_getProperty(*(id *)(*((void *)&v27 + 1) + 8 * v15), v12, 8, 1);
          }
          else {
            id Property = 0;
          }
          if (objc_msgSend(Property, "isEqual:", v6, (void)v27))
          {
            long long v20 = ne_log_obj();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v33 = (uint64_t)v16;
              __int16 v34 = 2112;
              uint64_t v35 = a1;
              _os_log_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_INFO, "Removing client %@ for %@", buf, 0x16u);
            }

            id v21 = v16;
            if (v16)
            {
              objc_msgSend(objc_getProperty((id)a1, v19, 80, 1), "removeObject:", v21);
              goto LABEL_26;
            }
            goto LABEL_25;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v18 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        uint64_t v13 = v18;
        if (v18) {
          continue;
        }
        break;
      }
    }

LABEL_25:
    id v21 = 0;
LABEL_26:
    if ((*(unsigned char *)(a1 + 9) & 1) == 0 && !objc_msgSend(objc_getProperty((id)a1, v19, 80, 1), "count"))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));

      if (WeakRetained)
      {
        if ((*(unsigned char *)(a1 + 10) & 1) == 0)
        {
          __int16 v23 = ne_log_obj();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = a1;
            _os_log_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEFAULT, "%@ out of clients, starting invalidation timer", buf, 0xCu);
          }

          [(NEIKEv2Transport *)(void *)a1 startInvalidationTimer];
        }
      }
      else
      {
        int v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = a1;
          _os_log_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEFAULT, "%@ out of clients, invalidating", buf, 0xCu);
        }

        [(NEIKEv2Transport *)a1 invalidate];
      }
    }
  }
}

- (void)port
{
  if (result)
  {
    v2 = result;
    result = objc_msgSend(objc_getProperty(result, a2, 16, 1), "address");
    if (result) {
      return (void *)(bswap32(*(unsigned __int16 *)(objc_msgSend(objc_getProperty(v2, v3, 16, 1), "address") + 2)) >> 16);
    }
  }
  return result;
}

- (void)readOnConnection
{
  if (self)
  {
    if (*((unsigned char *)self + 9))
    {
      id v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      SEL v9 = "Transport cancelled, ignoring";
    }
    else
    {
      if (objc_getProperty(self, a2, 56, 1))
      {
        if (objc_msgSend(objc_getProperty(self, v3, 80, 1), "count")
          || (id WeakRetained = objc_loadWeakRetained(self + 11), WeakRetained, WeakRetained))
        {
          os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
          char v5 = [(id)g_transports containsObject:self];
          os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
          if (v5)
          {
            id Property = objc_getProperty(self, v6, 56, 1);
            completion[0] = MEMORY[0x1E4F143A8];
            completion[1] = 3221225472;
            completion[2] = __36__NEIKEv2Transport_readOnConnection__block_invoke;
            completion[3] = &unk_1E5991068;
            completion[4] = self;
            nw_connection_receive_message(Property, completion);
            return;
          }
          id v8 = ne_log_obj();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_17;
          }
          *(_WORD *)buf = 0;
          SEL v9 = "Transport not found in list, ignoring";
          goto LABEL_16;
        }
        id v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          SEL v9 = "Transport has no clients, ignoring";
          goto LABEL_16;
        }
LABEL_17:

        return;
      }
      id v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      SEL v9 = "Transport connection invalid, ignoring";
    }
LABEL_16:
    _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, v9, buf, 2u);
    goto LABEL_17;
  }
}

void __36__NEIKEv2Transport_readOnConnection__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = a5;
  if (v11)
  {
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "Connection receive error %@ for %@", buf, 0x16u);
    }

    -[NEIKEv2Transport reportConnectionError:](*(void **)(a1 + 32), v11);
    if (nw_error_get_error_code(v11) == 89) {
      goto LABEL_23;
    }
LABEL_22:
    -[NEIKEv2Transport readOnConnection](*(id *)(a1 + 32));
    goto LABEL_23;
  }
  if (!v9 || !a4) {
    goto LABEL_22;
  }
  id v13 = v9;
  if ([v13 length] == 1)
  {
    LOBYTE(v22[0]) = 0;
    [v13 getBytes:v22 length:1];
    if (LOBYTE(v22[0]) == 255)
    {
      uint64_t v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_INFO, "Ignoring keepalive packet", buf, 2u);
      }
      goto LABEL_21;
    }
  }
  memset(buf, 0, sizeof(buf));
  unsigned int v26 = 0;
  if ((unint64_t)[v13 length] <= 0x1B)
  {
    uint64_t v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = [v13 length];
      v22[0] = 67109376;
      v22[1] = v15;
      __int16 v23 = 1024;
      int v24 = 28;
      uint64_t v16 = "Packet shorter than header size (size: %u, minimum expected: %u)";
      long long v17 = v14;
      uint32_t v18 = 14;
LABEL_16:
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)v22, v18);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  [v13 getBytes:buf length:28];
  if (bswap32(v26) >= 0x10000)
  {
    uint64_t v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22[0]) = 0;
      uint64_t v16 = "The length in the IKE header is too big";
      long long v17 = v14;
      uint32_t v18 = 2;
      goto LABEL_16;
    }
LABEL_21:

    goto LABEL_22;
  }
  long long v19 = +[NEIKEv2Packet createPacketFromReceivedData:]((uint64_t)NEIKEv2Packet, v13);
  if (v19)
  {
    uint64_t v14 = v19;
    -[NEIKEv2Transport receivePacket:](*(id **)(a1 + 32), v19);
    goto LABEL_21;
  }
  id v21 = ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_fault_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_FAULT, "[NEIKEv2Packet createPacketFromReceivedData] failed", (uint8_t *)v22, 2u);
  }

LABEL_23:
}

- (void)reportConnectionError:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t error_code = nw_error_get_error_code(error);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_msgSend(objc_getProperty(a1, v4, 80, 1), "copy");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
          if (v10)
          {
            id WeakRetained = objc_loadWeakRetained((id *)(v10 + 24));
            if (WeakRetained)
            {
              uint64_t v12 = WeakRetained;
              objc_msgSend(WeakRetained, "reportError:", error_code, (void)v13);
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)callConnectedBlocks
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 64);
  if (v1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    objc_msgSend(*(id *)(a1 + 64), "removeAllObjects", (void)v9);
    uint64_t v8 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;
  }
}

void __56__NEIKEv2Transport_createTransportWithConnection_queue___block_invoke(uint64_t a1, int a2, void *a3)
{
}

- (void)handleConnectionEventWithState:(void *)a3 error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  if (a1 && objc_getProperty(a1, v5, 56, 1))
  {
    if (a2 == 4)
    {
      a1[8] = 0;
      uint64_t v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412546;
        uint64_t v20 = v6;
        __int16 v21 = 2112;
        __int16 v22 = a1;
        _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "Connection failed with error %@ for %@", (uint8_t *)&v19, 0x16u);
      }

      -[NEIKEv2Transport reportConnectionError:](a1, v6);
      -[NEIKEv2Transport callConnectedBlocks]((uint64_t)a1);
    }
    else if (a2 == 3)
    {
      a1[8] = 1;
      objc_getProperty(a1, v7, 56, 1);
      uint64_t v8 = nw_connection_copy_connected_path();
      long long v9 = v8;
      if (v8)
      {
        nw_endpoint_t v10 = nw_path_copy_effective_local_endpoint(v8);
        if (v10)
        {
          long long v11 = [MEMORY[0x1E4F38BE8] endpointWithCEndpoint:v10];
          objc_setProperty_atomic(a1, v12, v11, 16);
        }
        long long v13 = nw_path_copy_interface();
        if (v13)
        {
          uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F38BF8]) initWithInterfaceIndex:nw_interface_get_index(v13)];
          objc_setProperty_atomic(a1, v15, v14, 32);
        }
      }
      long long v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        uint64_t v20 = a1;
        _os_log_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEFAULT, "Connection ready for %@", (uint8_t *)&v19, 0xCu);
      }

      -[NEIKEv2Transport callConnectedBlocks]((uint64_t)a1);
      [(NEIKEv2Transport *)(id *)a1 readOnConnection];
    }
  }
}

+ (NEIKEv2Transport)createTransport:(void *)a3 remote:(void *)a4 local:(unsigned int)a5 localPort:(void *)a6 boundInterface:(void *)a7 queue:(void *)a8 socketGetBlock:(void *)a9 packetDelegate:
{
  uint64_t v194 = *MEMORY[0x1E4F143B8];
  unint64_t v13 = a3;
  id v14 = a4;
  id v15 = a6;
  long long v16 = a7;
  id v17 = a8;
  unint64_t v18 = a9;
  self;
  int v19 = ne_log_obj();
  uint64_t v20 = (NEIKEv2Transport *)v19;
  if (!(v13 | v18))
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v187 = 136315138;
      *(void *)v188 = "+[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]";
      _os_log_fault_impl(&dword_19DDAF000, &v20->super, OS_LOG_TYPE_FAULT, "%s called with null remote", v187, 0xCu);
    }
    goto LABEL_132;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v69 = +[NEIKEv2Transport stringForTransport:]((uint64_t)NEIKEv2Transport, a2);
    *(_DWORD *)v187 = 138413314;
    *(void *)v188 = v69;
    *(_WORD *)&v188[8] = 2112;
    *(void *)&v188[10] = v14;
    *(_WORD *)&v188[18] = 1024;
    *(_DWORD *)&v188[20] = a5;
    *(_WORD *)&v188[24] = 2112;
    *(void *)&v188[26] = v13;
    __int16 v189 = 2112;
    id v190 = v15;
    _os_log_debug_impl(&dword_19DDAF000, &v20->super, OS_LOG_TYPE_DEBUG, "Creating %@ transport %@(%u) to %@ on \"%@\"", v187, 0x30u);
  }
  id v175 = (id)v13;
  id v21 = v14;
  id v22 = v15;
  id v179 = (id)v18;
  self;
  if (!a5 && !v18)
  {
    id v23 = 0;
    goto LABEL_101;
  }
  v177 = v22;
  id v165 = v17;
  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  memset(v183, 0, sizeof(v183));
  id v24 = (id)g_transports;
  uint64_t v25 = [v24 countByEnumeratingWithState:v183 objects:v187 count:16];
  if (!v25)
  {
    id v23 = 0;
    goto LABEL_100;
  }
  uint64_t v26 = v25;
  v157 = v16;
  id v158 = v14;
  uint64_t v27 = **(void **)&v183[1];
  unint64_t v28 = a2;
  id v162 = v24;
  v167 = v21;
LABEL_9:
  uint64_t v29 = 0;
  while (1)
  {
    if (**(void **)&v183[1] != v27) {
      objc_enumerationMutation(v24);
    }
    uint64_t v30 = *(void *)(*((void *)&v183[0] + 1) + 8 * v29);
    if (v30)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v30 + 48));
      if (v18)
      {
        char v32 = *(unsigned char *)(v30 + 9) & 1;
LABEL_15:
        if ((v32 & 1) == 0 && WeakRetained == v179) {
          goto LABEL_98;
        }
        goto LABEL_79;
      }
      if ((*(unsigned char *)(v30 + 9) & 1) != 0 || WeakRetained) {
        goto LABEL_79;
      }
      uint64_t v33 = *(void *)(v30 + 40);
    }
    else
    {
      if (v18)
      {
        id WeakRetained = 0;
        char v32 = 0;
        unint64_t v28 = a2;
        id v24 = v162;
        goto LABEL_15;
      }
      uint64_t v33 = 0;
      unint64_t v18 = 0;
      unint64_t v28 = a2;
      id v24 = v162;
    }
    if (v33 != v28)
    {
      id WeakRetained = 0;
      goto LABEL_79;
    }
    uint64_t v35 = [v177 length];
    if (v35)
    {
      id v36 = v30 ? objc_getProperty((id)v30, v34, 32, 1) : 0;
      id v170 = v36;
      v168 = [v170 interfaceName];
      if (!objc_msgSend(v177, "isEqualToString:"))
      {
        id v46 = v168;
        v47 = v170;
        goto LABEL_77;
      }
    }
    if (!v13) {
      break;
    }
    unint64_t v37 = v13;
    id v38 = v15;
    if (v30) {
      id Property = objc_getProperty((id)v30, v34, 24, 1);
    }
    else {
      id Property = 0;
    }
    id v40 = Property;
    v163 = v40;
    if ([v175 isEqual:v40])
    {
      unsigned int v42 = [(NEIKEv2Transport *)(void *)v30 port];
      id v44 = v21;
      int v45 = v42 == a5;
      id v15 = v38;
      unint64_t v13 = v37;
      if (v44)
      {
        id v24 = v162;
        if (v42 == a5)
        {
LABEL_37:
          if (v30) {
            id v50 = objc_getProperty((id)v30, v43, 16, 1);
          }
          else {
            id v50 = 0;
          }
          int v45 = [v167 isEqual:v50];
          if (!v13) {
            goto LABEL_40;
          }
        }
      }
      else
      {
        id v24 = v162;
      }

      if (!v35) {
        goto LABEL_71;
      }
LABEL_41:

      if ((v45 & 1) == 0) {
        goto LABEL_72;
      }
      goto LABEL_42;
    }

    if (v35)
    {
      id v46 = v168;
      v47 = v170;
      id v15 = v38;
      unint64_t v13 = v37;
      id v24 = v162;
LABEL_77:

      id WeakRetained = 0;
      goto LABEL_78;
    }
    id WeakRetained = 0;
    unint64_t v28 = a2;
    id v15 = v38;
    unint64_t v13 = v37;
    id v24 = v162;
LABEL_79:

    if (++v29 == v26)
    {
      uint64_t v68 = [v24 countByEnumeratingWithState:v183 objects:v187 count:16];
      uint64_t v26 = v68;
      if (!v68)
      {
        id v23 = 0;
        goto LABEL_99;
      }
      goto LABEL_9;
    }
  }
  unsigned int v48 = [(NEIKEv2Transport *)(void *)v30 port];
  id v49 = v21;
  int v45 = v48 == a5;
  if (v49 && v48 == a5) {
    goto LABEL_37;
  }
LABEL_40:
  if (v35) {
    goto LABEL_41;
  }
LABEL_71:
  if (!v45)
  {
LABEL_72:
    id WeakRetained = 0;
    id v21 = v167;
LABEL_78:
    unint64_t v28 = a2;
    goto LABEL_79;
  }
LABEL_42:
  id v160 = v15;
  if (v30)
  {
    id v156 = objc_getProperty((id)v30, v43, 16, 1);
    if (v156)
    {
      unint64_t v155 = v13;
      id v52 = objc_getProperty((id)v30, v51, 16, 1);
      v54 = objc_msgSend(objc_getProperty((id)v30, v53, 32, 1), "interfaceName");
      id v55 = v52;
      id v46 = v54;
      self;
      v56 = ne_log_obj();
      v57 = v56;
      if (v55)
      {
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v55;
          __int16 v192 = 2112;
          id v193 = v46;
          _os_log_impl(&dword_19DDAF000, v57, OS_LOG_TYPE_INFO, "check address: address %@ interface %@", buf, 0x16u);
        }

        uint64_t v58 = [v55 address];
        if (v58)
        {
          uint64_t v59 = v58;
          *(void *)buf = 0;
          if (getifaddrs((ifaddrs **)buf))
          {
            unint64_t v13 = v155;
          }
          else
          {
            v60 = *(void **)buf;
            if (*(void *)buf)
            {
              while (1)
              {
                if (!v46
                  || (v61 = (const char *)v60[1]) != 0
                  && !strncmp(v61, (const char *)[v46 UTF8String], 0x10uLL))
                {
                  if (v60[3] || (uint64_t v62 = MEMORY[1], [v55 addressFamily] == v62))
                  {
                    if ([v55 addressFamily] == 2)
                    {
                      if (*(_DWORD *)(v60[3] + 4) == *(_DWORD *)(v59 + 4)) {
                        goto LABEL_96;
                      }
                    }
                    else if ([v55 addressFamily] == 30)
                    {
                      uint64_t v63 = v60[3];
                      uint64_t v65 = *(void *)(v63 + 8);
                      uint64_t v64 = *(void *)(v63 + 16);
                      if (v65 == *(void *)(v59 + 8) && v64 == *(void *)(v59 + 16))
                      {
LABEL_96:
                        free(*(void **)buf);

                        unint64_t v13 = v155;
                        id v15 = v160;
                        unint64_t v18 = 0;
                        goto LABEL_97;
                      }
                    }
                  }
                }
                v60 = (void *)*v60;
                if (!v60)
                {
                  v67 = *(void **)buf;
                  unint64_t v13 = v155;
                  id v15 = v160;
                  goto LABEL_74;
                }
              }
            }
            v67 = 0;
            unint64_t v13 = v155;
LABEL_74:
            unint64_t v18 = 0;
            free(v67);
          }
          v47 = v156;
          goto LABEL_76;
        }
        v57 = ne_log_obj();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "+[NEIKEv2Transport checkAddress:interface:]";
          _os_log_fault_impl(&dword_19DDAF000, v57, OS_LOG_TYPE_FAULT, "%s called with null sa_compare", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "+[NEIKEv2Transport checkAddress:interface:]";
        _os_log_fault_impl(&dword_19DDAF000, v57, OS_LOG_TYPE_FAULT, "%s called with null endpoint", buf, 0xCu);
      }
      v47 = v156;

      unint64_t v13 = v155;
LABEL_76:

      id v21 = v167;
      goto LABEL_77;
    }
  }
LABEL_97:
  id v21 = v167;
LABEL_98:
  id v23 = (id)v30;

LABEL_99:
  long long v16 = v157;
  id v14 = v158;
LABEL_100:

  os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
  id v17 = v165;
  id v22 = v177;
LABEL_101:

  if (v23)
  {
    v70 = ne_log_obj();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v187 = 138412290;
      *(void *)v188 = v23;
      _os_log_debug_impl(&dword_19DDAF000, v70, OS_LOG_TYPE_DEBUG, "Found existing transport %@", v187, 0xCu);
    }

    v71 = (NEIKEv2Transport *)v23;
    goto LABEL_169;
  }
  v178 = v22;
  v72 = objc_alloc_init(NEIKEv2Transport);
  uint64_t v20 = v72;
  if (!v72)
  {
LABEL_132:
    v98 = 0;
    goto LABEL_170;
  }
  v72->_transportType = a2;
  objc_setProperty_atomic(v72, v73, v175, 24);
  if (v21)
  {
    objc_setProperty_atomic(v20, v74, v21, 16);
    goto LABEL_113;
  }
  if ([v175 addressFamily] != 2)
  {
    if ([v175 addressFamily] == 30)
    {
      memset(v188, 0, 24);
      __int16 v76 = 7708;
      goto LABEL_112;
    }
    v97 = ne_log_obj();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      int v152 = [v175 addressFamily];
      *(_DWORD *)v187 = 67109120;
      *(_DWORD *)v188 = v152;
      _os_log_error_impl(&dword_19DDAF000, v97, OS_LOG_TYPE_ERROR, "Invalid address family %u", v187, 8u);
    }

    goto LABEL_132;
  }
  *(_DWORD *)&v188[8] = 0;
  *(void *)v188 = 0;
  __int16 v76 = 528;
LABEL_112:
  *(_WORD *)v187 = v76;
  *(_WORD *)&v187[2] = __rev16(a5);
  v77 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v187];
  objc_setProperty_atomic(v20, v78, v77, 16);

LABEL_113:
  if (v178)
  {
    v79 = (void *)[objc_alloc(MEMORY[0x1E4F38BF8]) initWithInterfaceName:v178];
    objc_setProperty_atomic(v20, v80, v79, 32);
  }
  objc_setProperty_atomic(v20, v75, v16, 72);
  if (!v18)
  {
    id v166 = v17;
    if (a2 <= 1)
    {
      nw_parameters_t secure_tcp = (nw_parameters_t)v175;
      v171 = v21;
      v81 = (void (**)(void))v17;
      int IKESocket = -1;
      v84 = objc_msgSend(objc_getProperty(v20, v82, 32, 1), "interfaceName");
      v180 = v81;
      v169 = v84;
      if (v81)
      {
        uint64_t v176 = objc_msgSend(objc_getProperty(v20, v83, 16, 1), "address");
        uint64_t v164 = objc_msgSend(objc_getProperty(v20, v85, 24, 1), "address");
        ((void (*)(void (**)(void), uint64_t, uint64_t, uint64_t, int *))v81[2])(v81, v176, v164, [v84 UTF8String], &IKESocket);
      }
      else
      {
        objc_msgSend(objc_getProperty(v20, v83, 16, 1), "address");
        objc_msgSend(objc_getProperty(v20, v99, 24, 1), "address");
        [v84 UTF8String];
        getpid();
        int IKESocket = NEHelperGetIKESocket();
      }
      uint64_t v100 = [secure_tcp addressFamily];
      int v102 = IKESocket;
      if (v21)
      {
        id v17 = v166;
      }
      else
      {
        id v17 = v166;
        if (v100 == 2 && IKESocket < 0)
        {
          int v185 = objc_msgSend(objc_getProperty(v20, v101, 32, 1), "interfaceIndex");
          *(void *)buf = 0;
          int v103 = nw_nat64_copy_prefixes();
          if (v103 >= 1 && *(void *)buf)
          {
            int v104 = v103;
            id v159 = v14;
            id v161 = v15;
            v105 = ne_log_obj();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
            {
              if (v104 == 1) {
                v153 = "";
              }
              else {
                v153 = "es";
              }
              id v154 = objc_getProperty(v20, v106, 32, 1);
              *(_DWORD *)v187 = 67109634;
              *(_DWORD *)v188 = v104;
              *(_WORD *)&v188[4] = 2080;
              *(void *)&v188[6] = v153;
              *(_WORD *)&v188[14] = 2112;
              *(void *)&v188[16] = v154;
              _os_log_debug_impl(&dword_19DDAF000, v105, OS_LOG_TYPE_DEBUG, "IKEv2 found %u NAT64 prefix%s on interface %@", v187, 0x1Cu);
            }

            memset(v188, 0, 24);
            *(_WORD *)v187 = 7708;
            uint64_t v108 = 0;
            *(_WORD *)&v187[2] = *(_WORD *)(objc_msgSend(objc_getProperty(v20, v107, 24, 1), "address") + 2);
            memset((char *)v183 + 4, 0, 24);
            LOWORD(v183[0]) = 7708;
            WORD1(v183[0]) = __rev16(a5);
            while (1)
            {
              objc_msgSend(objc_getProperty(v20, v109, 24, 1), "address");
              if (nw_nat64_synthesize_v6())
              {
                unint64_t v110 = v13;
                v111 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v187];
                objc_setProperty_atomic(v20, v112, v111, 24);

                v113 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v183];
                objc_setProperty_atomic(v20, v114, v113, 16);

                v116 = objc_msgSend(objc_getProperty(v20, v115, 32, 1), "interfaceName");
                objc_msgSend(objc_getProperty(v20, v117, 16, 1), "address");
                objc_msgSend(objc_getProperty(v20, v118, 24, 1), "address");
                [v116 UTF8String];
                if (v180)
                {
                  v180[2]();
                  int v119 = IKESocket;
                }
                else
                {
                  getpid();
                  int v119 = NEHelperGetIKESocket();
                  int IKESocket = v119;
                }

                unint64_t v13 = v110;
                if ((v119 & 0x80000000) == 0)
                {
LABEL_154:
                  free(*(void **)buf);
                  id v14 = v159;
                  id v15 = v161;
                  id v17 = v166;
                  break;
                }
              }
              else
              {
                v120 = ne_log_obj();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v184 = 0;
                  _os_log_error_impl(&dword_19DDAF000, v120, OS_LOG_TYPE_ERROR, "nw_nat64_synthesize_v6 failed", v184, 2u);
                }
              }
              if ((int)++v108 >= v104) {
                goto LABEL_154;
              }
            }
          }
          int v102 = IKESocket;
        }
      }
      if (v102 < 0)
      {
        v148 = ne_log_obj();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v187 = 0;
          _os_log_error_impl(&dword_19DDAF000, v148, OS_LOG_TYPE_ERROR, "Failed to get IKE socket from NEHelper", v187, 2u);
        }

        v98 = 0;
      }
      else
      {
        id v122 = v15;
        secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
        v124 = nw_parameters_copy_default_protocol_stack(secure_udp);
        if (v20->_transportType == 1)
        {
          v125 = NEIKEv2TransportCopyNATTFramerDefinition();
          id v126 = v14;
          options = nw_framer_create_options(v125);
          nw_protocol_stack_prepend_application_protocol(v124, options);

          id v14 = v126;
        }
        nw_parameters_set_indefinite();
        if (objc_getProperty(v20, v128, 32, 1))
        {
          v130 = objc_msgSend(objc_getProperty(v20, v129, 32, 1), "interfaceName");
          [v130 UTF8String];
          id v131 = v14;
          v132 = nw_interface_create_with_name();
          nw_parameters_require_interface(secure_udp, v132);

          id v14 = v131;
        }
        v133 = (void *)nw_connection_create_with_connected_socket_and_parameters();
        objc_setProperty_atomic(v20, v134, v133, 56);

        if (objc_getProperty(v20, v135, 56, 1))
        {

          id v15 = v122;
          id v17 = v166;
          unint64_t v18 = 0;
          goto LABEL_164;
        }
        id v150 = v14;
        v151 = ne_log_obj();
        id v17 = v166;
        if (os_log_type_enabled(v151, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v187 = 0;
          _os_log_fault_impl(&dword_19DDAF000, v151, OS_LOG_TYPE_FAULT, "nw_connection_create_with_connected_socket failed", v187, 2u);
        }

        v98 = 0;
        id v14 = v150;
        id v15 = v122;
      }
      unint64_t v18 = 0;
      goto LABEL_170;
    }
    if (a2 == 3) {
      v86 = (void *)*MEMORY[0x1E4F38C88];
    }
    else {
      v86 = (void *)*MEMORY[0x1E4F38C90];
    }
    nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp(v86, (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
    v87 = nw_parameters_copy_default_protocol_stack(secure_tcp);
    v88 = NEIKEv2TransportCopyTCPFramerDefinition();
    v89 = nw_framer_create_options(v88);
    nw_protocol_stack_prepend_application_protocol(v87, v89);

    v171 = v87;
    v90 = nw_protocol_stack_copy_internet_protocol(v87);
    v91 = (void (**)(void))v90;
    if (v90) {
      nw_ip_options_set_local_address_preference(v90, nw_ip_local_address_preference_stable);
    }
    v180 = v91;
    nw_parameters_set_indefinite();
    if (v178)
    {
      [v178 UTF8String];
      v92 = nw_interface_create_with_name();
      nw_parameters_require_interface(secure_tcp, v92);
    }
    v93 = [v175 copyCEndpoint];
    nw_connection_t v94 = nw_connection_create(v93, secure_tcp);
    objc_setProperty_atomic(v20, v95, v94, 56);

    if (!objc_getProperty(v20, v96, 56, 1))
    {
      v121 = ne_log_obj();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v187 = 0;
        _os_log_fault_impl(&dword_19DDAF000, v121, OS_LOG_TYPE_FAULT, "nw_connection_create failed", v187, 2u);
      }

      v98 = 0;
      id v17 = v166;
      goto LABEL_170;
    }
    id v17 = v166;
LABEL_164:

    v137 = objc_getProperty(v20, v136, 56, 1);
    nw_connection_set_queue(v137, v16);
    id v139 = objc_getProperty(v20, v138, 56, 1);
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = __110__NEIKEv2Transport_createTransport_remote_local_localPort_boundInterface_queue_socketGetBlock_packetDelegate___block_invoke;
    v181[3] = &unk_1E5991090;
    v140 = v20;
    v182 = v140;
    MEMORY[0x19F3B7D00](v139, v181);
    v142 = objc_getProperty(v140, v141, 56, 1);
    nw_connection_start(v142);

    goto LABEL_165;
  }
  [v179 setPacketReceiver:v20];
  objc_storeWeak((id *)&v20->_packetDelegate, v179);
  v20->_connected = 1;
LABEL_165:
  v143 = ne_log_obj();
  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
  {
    v149 = "";
    *(_DWORD *)v187 = 138412802;
    *(void *)v188 = v20;
    if (!v21) {
      v149 = "out";
    }
    *(_WORD *)&v188[8] = 2112;
    *(void *)&v188[10] = v178;
    *(_WORD *)&v188[18] = 2080;
    *(void *)&v188[20] = v149;
    _os_log_debug_impl(&dword_19DDAF000, v143, OS_LOG_TYPE_DEBUG, "NEIKEv2Transport: Created %@ on interface %@ with%s local address", v187, 0x20u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  v144 = (void *)g_transports;
  if (!g_transports)
  {
    id v145 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v146 = (void *)g_transports;
    g_transports = (uint64_t)v145;

    v144 = (void *)g_transports;
  }
  [v144 addObject:v20];
  os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
  v71 = v20;
LABEL_169:
  uint64_t v20 = v71;
  v98 = v71;
LABEL_170:

  return v98;
}

void __110__NEIKEv2Transport_createTransport_remote_local_localPort_boundInterface_queue_socketGetBlock_packetDelegate___block_invoke(uint64_t a1, int a2, void *a3)
{
}

- (void)waitForTransport:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    aBlock = v3;
    if (*(unsigned char *)(a1 + 8))
    {
      v3[2](v3);
    }
    else
    {
      uint64_t v4 = *(void **)(a1 + 64);
      if (!v4)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v6 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v5;

        uint64_t v4 = *(void **)(a1 + 64);
      }
      id v7 = v4;
      uint64_t v8 = _Block_copy(aBlock);
      [v7 addObject:v8];
    }
    id v3 = (void (**)(void))aBlock;
  }
}

- (uint64_t)sendData:(void *)a3 sendCompletionHandler:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_20;
  }
  if (![v5 length])
  {
    nw_endpoint_t v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v34 = "-[NEIKEv2Transport sendData:sendCompletionHandler:]";
      _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "%s called with null data.length", buf, 0xCu);
    }
    goto LABEL_19;
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);

  if (!WeakRetained)
  {
    if (objc_getProperty(a1, v8, 56, 1))
    {
      uint64_t v12 = 1;
      long long v16 = objc_getProperty(a1, v15, 56, 1);
      id v17 = [v5 _createDispatchData];
      unint64_t v18 = *MEMORY[0x1E4F38C58];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_4;
      v24[3] = &unk_1E59910B8;
      v24[4] = a1;
      uint64_t v25 = v6;
      nw_connection_send(v16, v17, v18, 1, v24);

      nw_endpoint_t v10 = v25;
      goto LABEL_14;
    }
    if (v6)
    {
      id Property = objc_getProperty(a1, v15, 72, 1);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_3;
      v26[3] = &unk_1E5993770;
      uint64_t v27 = v6;
      dispatch_async(Property, v26);
      uint64_t v12 = 0;
      nw_endpoint_t v10 = v27;
      goto LABEL_14;
    }
LABEL_20:
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  long long v9 = objc_loadWeakRetained(a1 + 6);
  nw_endpoint_t v10 = v9;
  if (!v9)
  {
    int v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "Packet delegate is no longer valid, cannot send", buf, 2u);
    }

    if (v6)
    {
      id v21 = objc_getProperty(a1, v20, 72, 1);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke;
      v31[3] = &unk_1E5993770;
      id v14 = &v32;
      id v32 = v6;
      dispatch_async(v21, v31);
      uint64_t v12 = 0;
      goto LABEL_13;
    }
    nw_endpoint_t v10 = 0;
LABEL_19:
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = [v9 sendPacketData:v5];
  if (v6)
  {
    unint64_t v13 = objc_getProperty(a1, v11, 72, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5992D40;
    id v14 = &v29;
    id v29 = v6;
    char v30 = v12;
    dispatch_async(v13, block);
LABEL_13:
  }
LABEL_14:

LABEL_15:
  return v12;
}

uint64_t __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 != 0);
  }
  if (v3)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Connection send error %@ for %@", (uint8_t *)&v7, 0x16u);
    }

    -[NEIKEv2Transport reportConnectionError:](*(void **)(a1 + 32), v3);
  }
}

@end