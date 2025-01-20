@interface NWRemotePacketProxy
- (BOOL)receiveRemotePacket:(id)a3;
- (NSMutableArray)writeRequests;
- (NWRemotePacketProxy)initWithDelegate:(id)a3;
- (NWRemotePacketProxyDelegate)delegate;
- (nw_hash_table)packetHashTable;
- (nw_protocol)defaultOutputHandler;
- (nw_protocol)outputHandlerForPacket:(id)a3 inbound:(BOOL)a4;
- (nw_protocol)packetProtocol;
- (unsigned)receiveWindowPacketCount;
- (void)dealloc;
- (void)setDefaultOutputHandler:(nw_protocol *)a3;
- (void)setDelegate:(id)a3;
- (void)setOutputProtocolHandler:(nw_protocol *)a3 local:(id)a4 remote:(id)a5 ipProtocol:(unsigned __int8)a6;
- (void)setPacketHashTable:(nw_hash_table *)a3;
- (void)setPacketProtocol:(nw_protocol *)a3;
- (void)setReceiveWindowPacketCount:(unsigned int)a3;
- (void)setWriteRequests:(id)a3;
@end

@implementation NWRemotePacketProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeRequests, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPacketHashTable:(nw_hash_table *)a3
{
  self->_packetHashTable = a3;
}

- (nw_hash_table)packetHashTable
{
  return self->_packetHashTable;
}

- (void)setDefaultOutputHandler:(nw_protocol *)a3
{
  self->_defaultOutputHandler = a3;
}

- (nw_protocol)defaultOutputHandler
{
  return self->_defaultOutputHandler;
}

- (void)setPacketProtocol:(nw_protocol *)a3
{
  self->_packetProtocol = a3;
}

- (nw_protocol)packetProtocol
{
  return self->_packetProtocol;
}

- (void)setWriteRequests:(id)a3
{
}

- (NSMutableArray)writeRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NWRemotePacketProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NWRemotePacketProxyDelegate *)WeakRetained;
}

- (unsigned)receiveWindowPacketCount
{
  return self->_receiveWindowPacketCount;
}

- (BOOL)receiveRemotePacket:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v15 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v23 = 0;
    if (__nwlog_fault(v16, &type, &v23))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v17 = __nwlog_obj();
        os_log_type_t v18 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)buf = 136446210;
          v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
          _os_log_impl(&dword_1830D4000, v17, v18, "%{public}s called with null packet", buf, 0xCu);
        }
      }
      else if (v23)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v17 = __nwlog_obj();
        os_log_type_t v20 = type;
        BOOL v21 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v21)
          {
            *(_DWORD *)buf = 136446466;
            v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
            __int16 v27 = 2082;
            v28 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v17, v20, "%{public}s called with null packet, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_28;
        }
        if (v21)
        {
          *(_DWORD *)buf = 136446210;
          v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
          _os_log_impl(&dword_1830D4000, v17, v20, "%{public}s called with null packet, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v17 = __nwlog_obj();
        os_log_type_t v22 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)buf = 136446210;
          v26 = "-[NWRemotePacketProxy receiveRemotePacket:]";
          _os_log_impl(&dword_1830D4000, v17, v22, "%{public}s called with null packet, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_28:
    if (v16) {
      free(v16);
    }
    goto LABEL_11;
  }
  v5 = [(NWRemotePacketProxy *)self outputHandlerForPacket:v4 inbound:1];
  v6 = [(NWRemotePacketProxy *)self writeRequests];
  objc_sync_enter(v6);
  while (1)
  {
    v7 = [(NWRemotePacketProxy *)self writeRequests];
    uint64_t v8 = [v7 count];

    if (!v8) {
      break;
    }
    v9 = [(NWRemotePacketProxy *)self writeRequests];
    v10 = [v9 firstObject];

    if (!nw_remote_director_write_request((uint64_t)[(NWRemotePacketProxy *)self packetProtocol], (uint64_t)v5, v10))
    {

      break;
    }
    v11 = [(NWRemotePacketProxy *)self writeRequests];
    [v11 removeObjectAtIndex:0];
  }
  v12 = [[NWRemoteConnectionWriteRequest alloc] initWithData:v4 clientID:0];
  if (v8
    || !nw_remote_director_write_request((uint64_t)[(NWRemotePacketProxy *)self packetProtocol], (uint64_t)v5, v12))
  {
    v13 = [(NWRemotePacketProxy *)self writeRequests];
    [v13 addObject:v12];
  }
  objc_sync_exit(v6);

LABEL_11:
  return v4 != 0;
}

- (void)setOutputProtocolHandler:(nw_protocol *)a3 local:(id)a4 remote:(id)a5 ipProtocol:(unsigned __int8)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v12 = malloc_type_calloc(1uLL, 0x3CuLL, 0x1000040C2DCA394uLL);
  if (v12)
  {
    v13 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 address]) {
      __memcpy_chk();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 address]) {
      __memcpy_chk();
    }
    v13[56] = a6;
    v14 = [(NWRemotePacketProxy *)self packetHashTable];
    BOOL node = nw_hash_table_get_node((uint64_t)v14, (uint64_t)v13, 60);
    uint64_t v16 = node;
    if (!a3)
    {
      if (node) {
        nw_hash_table_remove_node((uint64_t)v14, node);
      }
      goto LABEL_30;
    }
    if (node || (uint64_t v16 = nw_hash_table_add_object((uint64_t)v14, (uint64_t)v13, 0)) != 0)
    {
      *(void *)(v16 + 32) = a3;
LABEL_30:
      free(v13);
      goto LABEL_31;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v26 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
    __int16 v27 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (!__nwlog_fault((const char *)v27, &type, &v33))
    {
LABEL_49:
      if (v27) {
        free(v27);
      }
      goto LABEL_30;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v28 = (id)gLogObj;
      os_log_type_t v29 = type;
      if (os_log_type_enabled(v28, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
        v30 = "%{public}s nw_hash_table_add_object failed";
LABEL_47:
        _os_log_impl(&dword_1830D4000, v28, v29, v30, buf, 0xCu);
      }
    }
    else
    {
      if (v33)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v28 = __nwlog_obj();
        os_log_type_t v29 = type;
        BOOL v32 = os_log_type_enabled(v28, type);
        if (backtrace_string)
        {
          if (v32)
          {
            *(_DWORD *)buf = 136446466;
            v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
            __int16 v37 = 2082;
            uint64_t v38 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_1830D4000, v28, v29, "%{public}s nw_hash_table_add_object failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_49;
        }
        if (!v32) {
          goto LABEL_48;
        }
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
        v30 = "%{public}s nw_hash_table_add_object failed, no backtrace";
        goto LABEL_47;
      }
      v28 = __nwlog_obj();
      os_log_type_t v29 = type;
      if (os_log_type_enabled(v28, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
        v30 = "%{public}s nw_hash_table_add_object failed, backtrace limit exceeded";
        goto LABEL_47;
      }
    }
LABEL_48:

    goto LABEL_49;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v17 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
  __int16 v37 = 2048;
  uint64_t v38 = 60;
  v13 = (unsigned char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v33 = 0;
  if (!__nwlog_fault(v13, &type, &v33)) {
    goto LABEL_29;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    os_log_type_t v18 = (id)gLogObj;
    os_log_type_t v19 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446466;
      v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
      __int16 v37 = 2048;
      uint64_t v38 = 60;
      os_log_type_t v20 = "%{public}s calloc(%zu) failed";
LABEL_26:
      v24 = v18;
      os_log_type_t v25 = v19;
LABEL_27:
      _os_log_impl(&dword_1830D4000, v24, v25, v20, buf, 0x16u);
    }
  }
  else
  {
    if (v33)
    {
      BOOL v21 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v18 = (id)gLogObj;
      os_log_type_t v22 = type;
      BOOL v23 = os_log_type_enabled(v18, type);
      if (v21)
      {
        if (v23)
        {
          *(_DWORD *)buf = 136446722;
          v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
          __int16 v37 = 2048;
          uint64_t v38 = 60;
          __int16 v39 = 2082;
          v40 = v21;
          _os_log_impl(&dword_1830D4000, v18, v22, "%{public}s calloc(%zu) failed, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(v21);
        if (v13) {
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      if (!v23) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136446466;
      v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
      __int16 v37 = 2048;
      uint64_t v38 = 60;
      os_log_type_t v20 = "%{public}s calloc(%zu) failed, no backtrace";
      v24 = v18;
      os_log_type_t v25 = v22;
      goto LABEL_27;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    os_log_type_t v18 = (id)gLogObj;
    os_log_type_t v19 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446466;
      v36 = "-[NWRemotePacketProxy setOutputProtocolHandler:local:remote:ipProtocol:]";
      __int16 v37 = 2048;
      uint64_t v38 = 60;
      os_log_type_t v20 = "%{public}s calloc(%zu) failed, backtrace limit exceeded";
      goto LABEL_26;
    }
  }
LABEL_28:

LABEL_29:
  if (v13) {
    goto LABEL_30;
  }
LABEL_31:
}

- (nw_protocol)outputHandlerForPacket:(id)a3 inbound:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!nw_hash_table_count((uint64_t)[(NWRemotePacketProxy *)self packetHashTable])) {
    goto LABEL_35;
  }
  *(_OWORD *)&v22[8] = 0u;
  unint64_t v7 = objc_msgSend(v6, "length", 0, 0, 0, 0, 0, 0, 0, *(void *)&v22[20]);
  uint64_t v8 = [v6 bytes];
  if (!v8 || !v7) {
    goto LABEL_35;
  }
  int v9 = *(unsigned char *)v8 & 0xF0;
  if (v9 == 96)
  {
    __int16 v19 = 7708;
    *(_WORD *)os_log_type_t v18 = 7708;
    if (v7 <= 0x27) {
      goto LABEL_35;
    }
    if (v4)
    {
      *(_OWORD *)&v18[8] = *(_OWORD *)(v8 + 24);
      v14 = (_OWORD *)(v8 + 8);
    }
    else
    {
      *(_OWORD *)&v18[8] = *(_OWORD *)(v8 + 8);
      v14 = (_OWORD *)(v8 + 24);
    }
    *(_OWORD *)os_log_type_t v22 = *v14;
    v22[20] = *(unsigned char *)(v8 + 6);
    if (v22[20] == 17)
    {
      if (v7 <= 0x2F) {
        goto LABEL_35;
      }
      if (v4) {
        goto LABEL_25;
      }
    }
    else
    {
      if (v22[20] != 6) {
        goto LABEL_33;
      }
      if (v7 <= 0x3B) {
        goto LABEL_35;
      }
      if (v4)
      {
LABEL_25:
        *(_WORD *)&v18[2] = *(_WORD *)(v8 + 42);
        __int16 v13 = *(_WORD *)(v8 + 40);
        goto LABEL_32;
      }
    }
    *(_WORD *)&v18[2] = *(_WORD *)(v8 + 40);
    __int16 v13 = *(_WORD *)(v8 + 42);
    goto LABEL_32;
  }
  if (v9 != 64) {
    goto LABEL_35;
  }
  __int16 v19 = 528;
  *(_WORD *)os_log_type_t v18 = 528;
  if (v7 <= 0x13) {
    goto LABEL_35;
  }
  uint64_t v10 = 12;
  if (v4) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = 12;
  }
  if (!v4) {
    uint64_t v10 = 16;
  }
  int v12 = *(_DWORD *)(v8 + v10);
  *(_DWORD *)&v18[4] = *(_DWORD *)(v8 + v11);
  int v21 = v12;
  v22[20] = *(unsigned char *)(v8 + 9);
  if (v22[20] == 17)
  {
    if (v7 > 0x1B)
    {
      if (v4) {
        goto LABEL_16;
      }
LABEL_28:
      *(_WORD *)&v18[2] = *(_WORD *)(v8 + 20);
      __int16 v13 = *(_WORD *)(v8 + 22);
      goto LABEL_32;
    }
LABEL_35:
    uint64_t v16 = [(NWRemotePacketProxy *)self defaultOutputHandler];
    goto LABEL_36;
  }
  if (v22[20] != 6) {
    goto LABEL_33;
  }
  if (v7 <= 0x27) {
    goto LABEL_35;
  }
  if (!v4) {
    goto LABEL_28;
  }
LABEL_16:
  *(_WORD *)&v18[2] = *(_WORD *)(v8 + 22);
  __int16 v13 = *(_WORD *)(v8 + 20);
LABEL_32:
  __int16 v20 = v13;
LABEL_33:
  uint64_t node = nw_hash_table_get_node((uint64_t)[(NWRemotePacketProxy *)self packetHashTable], (uint64_t)v18, 60);
  if (!node) {
    goto LABEL_35;
  }
  uint64_t v16 = *(nw_protocol **)(node + 32);
LABEL_36:

  return v16;
}

- (void)setReceiveWindowPacketCount:(unsigned int)a3
{
  BOOL v4 = self;
  objc_sync_enter(v4);
  unsigned int receiveWindowPacketCount = v4->_receiveWindowPacketCount;
  v4->_unsigned int receiveWindowPacketCount = a3;
  objc_sync_exit(v4);

  if (a3)
  {
    if (!receiveWindowPacketCount)
    {
      nw_remote_packet_input_available((uint64_t)[(NWRemotePacketProxy *)v4 packetProtocol], (uint64_t)[(NWRemotePacketProxy *)v4 defaultOutputHandler]);
      id v6 = [(NWRemotePacketProxy *)v4 packetHashTable];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __51__NWRemotePacketProxy_setReceiveWindowPacketCount___block_invoke;
      v7[3] = &unk_1E524AF58;
      v7[4] = v4;
      nw_hash_table_apply(v6, (uint64_t)v7);
    }
  }
}

uint64_t __51__NWRemotePacketProxy_setReceiveWindowPacketCount___block_invoke(uint64_t a1, uint64_t a2)
{
  extra = (uint64_t *)nw_hash_node_get_extra(a2);
  nw_remote_packet_input_available([*(id *)(a1 + 32) packetProtocol], *extra);
  return 1;
}

- (void)dealloc
{
  if ([(NWRemotePacketProxy *)self packetProtocol])
  {
    free([(NWRemotePacketProxy *)self packetProtocol]);
    [(NWRemotePacketProxy *)self setPacketProtocol:0];
  }
  if ([(NWRemotePacketProxy *)self packetHashTable]
    && [(NWRemotePacketProxy *)self packetHashTable])
  {
    _nw_hash_table_release((os_unfair_lock_s *)[(NWRemotePacketProxy *)self packetHashTable]);
    [(NWRemotePacketProxy *)self setPacketHashTable:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)NWRemotePacketProxy;
  [(NWRemotePacketProxy *)&v3 dealloc];
}

- (NWRemotePacketProxy)initWithDelegate:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    __int16 v27 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (__nwlog_fault(v11, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        int v12 = __nwlog_obj();
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v14 = "%{public}s called with null delegate";
      }
      else if (v38)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        int v12 = __nwlog_obj();
        os_log_type_t v16 = type;
        BOOL v34 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
            __int16 v42 = 2082;
            uint64_t v43 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_1830D4000, v12, v16, "%{public}s called with null delegate, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          if (!v11) {
            goto LABEL_41;
          }
          goto LABEL_40;
        }
        if (!v34) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v14 = "%{public}s called with null delegate, no backtrace";
      }
      else
      {
        int v12 = __nwlog_obj();
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v14 = "%{public}s called with null delegate, backtrace limit exceeded";
      }
      goto LABEL_35;
    }
    goto LABEL_39;
  }
  v37.receiver = self;
  v37.super_class = (Class)NWRemotePacketProxy;
  v5 = [(NWRemotePacketProxy *)&v37 init];
  if (!v5)
  {
    v28 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
    os_log_type_t v29 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (!__nwlog_fault(v29, &type, &v38)) {
      goto LABEL_75;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v30 = __nwlog_obj();
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        BOOL v32 = "%{public}s [super init] failed";
LABEL_73:
        _os_log_impl(&dword_1830D4000, v30, v31, v32, buf, 0xCu);
      }
    }
    else
    {
      if (v38)
      {
        v35 = (char *)__nw_create_backtrace_string();
        v30 = __nwlog_obj();
        os_log_type_t v31 = type;
        BOOL v36 = os_log_type_enabled(v30, type);
        if (v35)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
            __int16 v42 = 2082;
            uint64_t v43 = (uint64_t)v35;
            _os_log_impl(&dword_1830D4000, v30, v31, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v35);
          goto LABEL_75;
        }
        if (!v36) {
          goto LABEL_74;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        BOOL v32 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_73;
      }
      v30 = __nwlog_obj();
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        BOOL v32 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_73;
      }
    }
LABEL_74:

LABEL_75:
    if (v29) {
      free(v29);
    }
    goto LABEL_42;
  }
  self = v5;
  v5->_unsigned int receiveWindowPacketCount = 16;
  objc_storeWeak((id *)&v5->_delegate, v4);
  id v6 = [MEMORY[0x1E4F1CA48] array];
  writeRequests = self->_writeRequests;
  self->_writeRequests = v6;

  uint64_t v8 = (nw_protocol *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040C9AB51B7uLL);
  self->_packetProtocol = v8;
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
    __int16 v42 = 2048;
    uint64_t v43 = 64;
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (!__nwlog_fault(v11, &type, &v38)) {
      goto LABEL_39;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v12 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (!os_log_type_enabled(v12, type)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
      __int16 v42 = 2048;
      uint64_t v43 = 64;
      v14 = "%{public}s calloc(%zu) failed";
    }
    else
    {
      if (v38)
      {
        id v17 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (id)gLogObj;
        os_log_type_t v18 = type;
        BOOL v19 = os_log_type_enabled(v12, type);
        if (v17)
        {
          if (v19)
          {
            *(_DWORD *)buf = 136446722;
            uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
            __int16 v42 = 2048;
            uint64_t v43 = 64;
            __int16 v44 = 2082;
            v45 = v17;
            _os_log_impl(&dword_1830D4000, v12, v18, "%{public}s calloc(%zu) failed, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(v17);
          if (!v11) {
            goto LABEL_41;
          }
          goto LABEL_40;
        }
        if (!v19) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446466;
        uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        __int16 v42 = 2048;
        uint64_t v43 = 64;
        v14 = "%{public}s calloc(%zu) failed, no backtrace";
        BOOL v23 = v12;
        os_log_type_t v24 = v18;
        goto LABEL_30;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v12 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (!os_log_type_enabled(v12, type)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
      __int16 v42 = 2048;
      uint64_t v43 = 64;
      v14 = "%{public}s calloc(%zu) failed, backtrace limit exceeded";
    }
    BOOL v23 = v12;
    os_log_type_t v24 = v13;
LABEL_30:
    uint32_t v25 = 22;
LABEL_37:
    _os_log_impl(&dword_1830D4000, v23, v24, v14, buf, v25);
    goto LABEL_38;
  }
  if (initWithDelegate__packetProtocolOnceToken[0] != -1) {
    dispatch_once(initWithDelegate__packetProtocolOnceToken, &__block_literal_global_17913);
  }
  self->_packetProtocol->identifier = (nw_protocol_identifier *)&initWithDelegate__NWRemotePacketProtocolIdentifier;
  self->_packetProtocol->callbacks = (nw_protocol_callbacks *)&initWithDelegate__NWRemotePacketProtocolCallbacks;
  self->_packetProtocol->handle = self;
  uint64_t internal = nw_hash_table_create_internal(0x11u, 60, (const void *(*)(const void *, unsigned int *))nw_packet_get_key, (unsigned int (*)(const void *, unsigned int))nw_packet_key_hash, (BOOL (*)(const void *, const void *, unsigned int))nw_packet_matches_key, nw_packet_release);
  if (!internal)
  {
    self->_packetHashTable = 0;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (!__nwlog_fault(v11, &type, &v38)) {
      goto LABEL_39;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v12 = (id)gLogObj;
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v14 = "%{public}s nw_protocol_hash_table_create failed";
LABEL_35:
        BOOL v23 = v12;
        os_log_type_t v24 = v16;
LABEL_36:
        uint32_t v25 = 12;
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    if (!v38)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v12 = (id)gLogObj;
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
        v14 = "%{public}s nw_protocol_hash_table_create failed, backtrace limit exceeded";
        goto LABEL_35;
      }
LABEL_38:

      goto LABEL_39;
    }
    __int16 v20 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    int v12 = (id)gLogObj;
    os_log_type_t v21 = type;
    BOOL v22 = os_log_type_enabled(v12, type);
    if (!v20)
    {
      if (!v22) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
      v14 = "%{public}s nw_protocol_hash_table_create failed, no backtrace";
      BOOL v23 = v12;
      os_log_type_t v24 = v21;
      goto LABEL_36;
    }
    if (v22)
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v41 = "-[NWRemotePacketProxy initWithDelegate:]";
      __int16 v42 = 2082;
      uint64_t v43 = (uint64_t)v20;
      _os_log_impl(&dword_1830D4000, v12, v21, "%{public}s nw_protocol_hash_table_create failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(v20);
LABEL_39:
    if (!v11)
    {
LABEL_41:

LABEL_42:
      self = 0;
      goto LABEL_43;
    }
LABEL_40:
    free(v11);
    goto LABEL_41;
  }
  *(_DWORD *)(internal + 48) &= ~2u;
  self->_packetHashTable = (nw_hash_table *)internal;
LABEL_43:

  return self;
}

double __40__NWRemotePacketProxy_initWithDelegate___block_invoke()
{
  initWithDelegate__NWRemotePacketProtocolIdentifier = 0u;
  *(_OWORD *)algn_1E8F79390 = 0u;
  *(void *)&double result = 0x100000004;
  qword_1E8F793A0 = 0x100000004;
  initWithDelegate__NWRemotePacketProtocolCallbacks = (uint64_t)nw_protocol_default_add_input_handler;
  qword_1E8F793B8 = (uint64_t)nw_protocol_default_replace_input_handler;
  qword_1E8F793B0 = (uint64_t)nw_protocol_default_remove_input_handler;
  qword_1E8F79460 = (uint64_t)nw_protocol_default_input_finished;
  qword_1E8F79468 = (uint64_t)nw_protocol_default_output_finished;
  qword_1E8F794B0 = (uint64_t)nw_protocol_default_input_flush;
  qword_1E8F793F8 = (uint64_t)nw_protocol_default_get_input_frames;
  qword_1E8F79400 = (uint64_t)nw_protocol_default_get_output_frames;
  qword_1E8F79408 = (uint64_t)nw_protocol_default_finalize_output_frames;
  qword_1E8F794A0 = (uint64_t)nw_protocol_default_get_message_properties;
  qword_1E8F79410 = (uint64_t)nw_protocol_default_link_state;
  qword_1E8F79418 = (uint64_t)nw_protocol_default_get_parameters;
  qword_1E8F79428 = (uint64_t)nw_protocol_default_get_local;
  qword_1E8F79430 = (uint64_t)nw_protocol_default_get_remote;
  qword_1E8F79420 = (uint64_t)nw_protocol_default_get_path;
  qword_1E8F79450 = (uint64_t)nw_protocol_default_updated_path;
  qword_1E8F79470 = (uint64_t)nw_protocol_default_get_output_local;
  qword_1E8F79478 = (uint64_t)nw_protocol_default_get_output_interface;
  qword_1E8F793C0 = (uint64_t)nw_protocol_default_connect;
  qword_1E8F793C8 = (uint64_t)nw_protocol_default_disconnect;
  qword_1E8F793D0 = (uint64_t)nw_protocol_default_connected;
  qword_1E8F793D8 = (uint64_t)nw_protocol_default_disconnected;
  qword_1E8F793E0 = (uint64_t)nw_protocol_default_error;
  qword_1E8F794A8 = (uint64_t)nw_protocol_default_reset;
  qword_1E8F79458 = (uint64_t)nw_protocol_default_supports_external_data;
  qword_1E8F79480 = (uint64_t)nw_protocol_default_waiting_for_output;
  qword_1E8F79488 = (uint64_t)nw_protocol_default_copy_info;
  qword_1E8F79438 = (uint64_t)nw_protocol_default_register_notification;
  qword_1E8F79440 = (uint64_t)nw_protocol_default_unregister_notification;
  qword_1E8F79448 = (uint64_t)nw_protocol_default_notify;
  qword_1E8F79490 = (uint64_t)nw_protocol_default_add_listen_handler;
  qword_1E8F79498 = (uint64_t)nw_protocol_default_remove_listen_handler;
  qword_1E8F793E8 = (uint64_t)nw_remote_packet_input_available;
  qword_1E8F793F0 = (uint64_t)nw_remote_packet_output_available;
  return result;
}

@end