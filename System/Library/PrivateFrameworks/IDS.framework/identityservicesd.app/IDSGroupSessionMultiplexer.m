@interface IDSGroupSessionMultiplexer
+ (id)sharedInstance;
- (BOOL)addNewConnectionToMultiplexerTransport:(id)a3;
- (BOOL)connectionCancel:(id)a3;
- (BOOL)connectionRequest:(id)a3;
- (BOOL)listenCancel:(id)a3;
- (BOOL)listenRequest:(id)a3;
- (BOOL)registerMultiplexerTransport:(id)a3;
- (BOOL)setupTransportForConnection:(id)a3;
- (BOOL)unregisterMultiplexerTransport:(id)a3;
- (IDSGroupSessionMultiplexer)init;
- (id)initAndSetupNexus;
- (unsigned)_getRandomPortForQUIC;
- (void)_releaseQUICPort:(unsigned __int16)a3;
- (void)resetConnection:(id)a3;
- (void)resetConnection:(id)a3 errorCode:(int)a4;
@end

@implementation IDSGroupSessionMultiplexer

+ (id)sharedInstance
{
  if (qword_100A4A678 != -1) {
    dispatch_once(&qword_100A4A678, &stru_100982838);
  }
  v2 = (void *)qword_100A4A680;

  return v2;
}

- (id)initAndSetupNexus
{
  v2 = [(IDSGroupSessionMultiplexer *)self init];
  if (!v2) {
    goto LABEL_17;
  }
  uint64_t v3 = nw_nexus_create();
  nexus = v2->_nexus;
  v2->_nexus = (OS_nw_nexus *)v3;

  if (v2->_nexus)
  {
    uint64_t v5 = os_nexus_controller_create();
    v2->_osNexusController = (nexus_controller *)v5;
    if (!v5)
    {
      v7 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        v8 = "os_nexus_controller_create failed";
        v9 = (uint8_t *)&v16;
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    if (!os_nexus_attr_create())
    {
      v7 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "os_nexus_attr_create failed";
        v9 = buf;
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    os_nexus_attr_set();
    strcpy((char *)v2->_osNexusName, "IDSMultiplexNexusOS");
    int v6 = os_nexus_controller_register_provider();
    os_nexus_attr_destroy();
    if (v6)
    {
      v7 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        v8 = "os_nexus_controller_register_provider failed";
        v9 = (uint8_t *)&v14;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    uint64_t v11 = +[IDSTransportLevelAgent sharedInstance];
    agent = v2->_agent;
    v2->_agent = (IDSTransportLevelAgent *)v11;

    [(IDSTransportLevelAgent *)v2->_agent registerMultiplexer:v2 forIdentifier:@"groupsession"];
LABEL_17:
    v10 = v2;
    goto LABEL_18;
  }
  v7 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = 0;
    v8 = "nw_nexus_create failed";
    v9 = (uint8_t *)&v17;
    goto LABEL_14;
  }
LABEL_15:

  v10 = 0;
LABEL_18:

  return v10;
}

- (IDSGroupSessionMultiplexer)init
{
  v15.receiver = self;
  v15.super_class = (Class)IDSGroupSessionMultiplexer;
  v2 = [(IDSGroupSessionMultiplexer *)&v15 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    clientUUIDs = v3->_clientUUIDs;
    v3->_clientUUIDs = (NSMutableDictionary *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    connections = v3->_connections;
    v3->_connections = (NSMutableDictionary *)v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    transports = v3->_transports;
    v3->_transports = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    transportsInstances = v3->_transportsInstances;
    v3->_transportsInstances = (NSMutableDictionary *)v10;

    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    occupiedPorts = v3->_occupiedPorts;
    v3->_occupiedPorts = v12;

    v3->_portHead = arc4random_uniform(0xFBFFu) + 1024;
  }
  return v3;
}

- (BOOL)registerMultiplexerTransport:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  transports = self->_transports;
  v7 = [v4 identifier];
  uint64_t v8 = [(NSMutableDictionary *)transports objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v4 identifier];
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Transport %@ already registered! Cannot register duplicate.", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = self->_transports;
    v12 = [v4 identifier];
    [(NSMutableDictionary *)v11 setObject:v4 forKeyedSubscript:v12];

    v9 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_transports;
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GroupSession Multiplexer added transport %@ to list of transports %@", (uint8_t *)&v15, 0x16u);
    }
  }

  os_unfair_lock_unlock(p_lock);
  return v8 == 0;
}

- (BOOL)unregisterMultiplexerTransport:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  transports = self->_transports;
  v7 = [v4 identifier];
  uint64_t v8 = [(NSMutableDictionary *)transports objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = self->_transports;
    uint64_t v10 = [v4 identifier];
    [(NSMutableDictionary *)v9 setObject:0 forKeyedSubscript:v10];

    [v4 invalidate];
  }
  else
  {
    uint64_t v11 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v4 identifier];
      int v14 = 138412290;
      int v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Transport %@ not registered! Cannot unregister.", (uint8_t *)&v14, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v8 != 0;
}

- (BOOL)setupTransportForConnection:(id)a3
{
  id v4 = a3;
  memset(src, 170, sizeof(src));
  if (!os_nexus_controller_alloc_provider_instance())
  {
    memset(out, 170, sizeof(out));
    uuid_generate(out);
    getpid();
    if (os_nexus_controller_bind_provider_instance())
    {
      v7 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "os_nexus_controller_bind_provider_instance failed for server", buf, 2u);
      }
      goto LABEL_13;
    }
    v7 = [v4 processUUID];
    v32[0] = 0xAAAAAAAAAAAAAAAALL;
    v32[1] = 0xAAAAAAAAAAAAAAAALL;
    [v7 getUUIDBytes:v32];
    [v4 pid];
    if (os_nexus_controller_bind_provider_instance())
    {
      uint64_t v8 = +[IDSFoundationLog Multiplexer];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

LABEL_13:
        BOOL v6 = 0;
LABEL_14:

        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      v9 = "os_nexus_controller_bind_provider_instance failed for client";
    }
    else
    {
      uuid_copy(self->_nexusInstanceUUID, src);
      if (os_channel_attr_create())
      {
        os_channel_attr_set_key();
        os_channel_attr_set();
        os_channel_attr_set();
        uint64_t extended = os_channel_create_extended();
        os_channel_attr_destroy();
        v12 = +[IDSFoundationLog Multiplexer];
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (!extended)
        {
          if (v13)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "os_channel_create_extended failed", buf, 2u);
          }

          goto LABEL_13;
        }
        if (v13)
        {
          int v14 = [v4 localEndpoint];
          int v15 = [v4 remoteEndpoint];
          id v16 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:src];
          *(_DWORD *)buf = 138412802;
          v27 = v14;
          __int16 v28 = 2112;
          v29 = v15;
          __int16 v30 = 2112;
          id v31 = v16;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "nw_path_create_assign_message call with localEndpoint %@ remoteEndpoint %@ nexusInstanceUUID %@", buf, 0x20u);
        }
        __int16 v17 = [v4 localEndpoint];
        v18 = [v4 remoteEndpoint];
        assign_message = (void *)nw_path_create_assign_message();

        v20 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = sub_1002237D8((uint64_t)assign_message, 0);
          *(_DWORD *)buf = 134218242;
          v27 = 0;
          __int16 v28 = 2080;
          v29 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "nw_path_create_assign_message returned size: %zu, data:\n%s", buf, 0x16u);
        }

        if (assign_message)
        {
          v22 = [(IDSTransportLevelAgent *)self->_agent registration];
          v23 = +[NSData dataWithBytes:assign_message length:0];
          v24 = [v4 clientUUID];
          unsigned __int8 v25 = [v22 assignNexusData:v23 toClient:v24];

          free(assign_message);
          if (v25)
          {
            [v4 setOsChannel:extended];
            BOOL v6 = 1;
            goto LABEL_14;
          }
          uint64_t v8 = +[IDSFoundationLog Multiplexer];
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_WORD *)buf = 0;
          v9 = "assignNexusData:toClient: failed";
        }
        else
        {
          uint64_t v8 = +[IDSFoundationLog Multiplexer];
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_WORD *)buf = 0;
          v9 = "nw_path_create_assign_message failed";
        }
      }
      else
      {
        uint64_t v8 = +[IDSFoundationLog Multiplexer];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v9 = "connectTransportThreadForClient: os_channel_attr_create failed";
      }
    }
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    goto LABEL_12;
  }
  uint64_t v5 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "os_nexus_controller_alloc_provider_instance failed", buf, 2u);
  }

  BOOL v6 = 0;
LABEL_15:

  return v6;
}

- (unsigned)_getRandomPortForQUIC
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = 0xFFFF;
  while (1)
  {
    uint64_t portHead = self->_portHead;
    unsigned __int16 v6 = (unsigned __int16)(portHead + 1) <= 0x400u ? 1024 : portHead + 1;
    self->_uint64_t portHead = v6;
    occupiedPorts = self->_occupiedPorts;
    uint64_t v8 = +[NSNumber numberWithUnsignedShort:portHead];
    LOBYTE(occupiedPorts) = [(NSMutableSet *)occupiedPorts containsObject:v8];

    if ((occupiedPorts & 1) == 0) {
      break;
    }
    if (!--v4)
    {
      LOWORD(portHead) = 0;
      goto LABEL_9;
    }
  }
  v9 = self->_occupiedPorts;
  uint64_t v10 = +[NSNumber numberWithUnsignedShort:portHead];
  [(NSMutableSet *)v9 addObject:v10];

LABEL_9:
  os_unfair_lock_unlock(p_lock);
  return portHead;
}

- (void)_releaseQUICPort:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  occupiedPorts = self->_occupiedPorts;
  unsigned __int16 v6 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:");
  LODWORD(occupiedPorts) = [(NSMutableSet *)occupiedPorts containsObject:v6];

  if (occupiedPorts)
  {
    v7 = self->_occupiedPorts;
    id v8 = +[NSNumber numberWithUnsignedShort:v3];
    [(NSMutableSet *)v7 removeObject:v8];
  }
}

- (BOOL)connectionRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 path];
  if (v5)
  {
    unsigned __int16 v6 = nw_path_copy_endpoint();
    if (!v6)
    {
      v7 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [v4 clientUUID];
        *(_DWORD *)buf = 138412290;
        v73 = v31;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "client does not have endpoint %@", buf, 0xCu);
      }
      LOBYTE(self) = 0;
      goto LABEL_49;
    }
    v7 = nw_path_copy_parameters();
    id v8 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 clientUUID];
      *(_DWORD *)buf = 138412546;
      v73 = v9;
      LOWORD(v74) = 2112;
      *(void *)((char *)&v74 + 2) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connectionRequest: clientUUID: %@ and params: %@", buf, 0x16u);
    }
    uint64_t v10 = nw_path_copy_effective_local_endpoint(v5);
    uint64_t v11 = nw_path_copy_effective_remote_endpoint(v5);
    uint64_t pid = nw_parameters_get_pid();
    if (!pid)
    {
      v32 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v4 clientUUID];
        *(_DWORD *)buf = 138412290;
        v73 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Client UUID %@ having pid 0 (root) is not supported", buf, 0xCu);
      }
      LOBYTE(self) = 0;
      goto LABEL_48;
    }
    uint64_t v13 = pid;
    v71[0] = 0xAAAAAAAAAAAAAAAALL;
    v71[1] = 0xAAAAAAAAAAAAAAAALL;
    nw_parameters_get_proc_uuid();
    int v14 = [v4 assign];

    if (v14)
    {
      int v15 = objc_alloc_init(IDSMultiplexerGroupConnection);
      id v16 = [v4 clientUUID];
      [(IDSMultiplexerConnection *)v15 setClientUUID:v16];

      __int16 v17 = [v4 path];
      [(IDSMultiplexerConnection *)v15 setPath:v17];

      v18 = [v4 multiplexerParams];
      [(IDSMultiplexerConnection *)v15 setMultiplexerParams:v18];

      v19 = [v4 localEndpoint];
      [(IDSMultiplexerConnection *)v15 setLocalEndpoint:v19];

      v20 = [v4 endpoint];
      [(IDSMultiplexerConnection *)v15 setRemoteEndpoint:v20];

      v21 = [v4 localEndpoint];
      [(IDSMultiplexerConnection *)v15 setLocalPort:nw_endpoint_get_port(v21)];

      v22 = [v4 endpoint];
      [(IDSMultiplexerConnection *)v15 setRemotePort:nw_endpoint_get_port(v22)];

      [(IDSMultiplexerConnection *)v15 setPortsSignature:[(IDSMultiplexerConnection *)v15 localPort] | ([(IDSMultiplexerConnection *)v15 remotePort] << 16)];
      v23 = [v4 multiplexerParams];
      -[IDSMultiplexerConnection setContext:](v15, "setContext:", [v23 participantID]);

      LODWORD(self) = [(IDSGroupSessionMultiplexer *)self addNewConnectionToMultiplexerTransport:v15];
      if (self)
      {
        v66 = v7;
        v68 = v11;
        v65 = v10;
        v24 = [(IDSMultiplexerGroupConnection *)v15 getProtocolDefinition];
        unsigned __int8 v25 = [v4 assign];
        v26 = [v4 localEndpoint];
        v27 = [v4 endpoint];
        nw_protocol_options_t options = nw_framer_create_options(v24);
        ((void (**)(void, void *, void *, nw_protocol_options_t))v25)[2](v25, v26, v27, options);

        v29 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v73 = v15;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "called nw_agent_flow_assign_t for %@", buf, 0xCu);
        }

        uint64_t v10 = v65;
        v7 = v66;
        uint64_t v11 = v68;
      }
      else
      {
        v24 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v73 = v15;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Could not add connection %@:", buf, 0xCu);
        }
      }
    }
    else
    {
      v34 = [v4 simConnection];

      if (v34)
      {
        v69 = v11;
        v35 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = [v4 clientUUID];
          *(_DWORD *)buf = 138412290;
          v73 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Creating Simulator connection and copying params for client %@", buf, 0xCu);
        }
        v37 = [IDSMultiplexerSimulatorConnection alloc];
        v38 = [v4 simConnection];
        int v15 = [(IDSMultiplexerSimulatorConnection *)v37 initWithConnection:v38];

        v39 = [v4 clientUUID];
        [(IDSMultiplexerConnection *)v15 setClientUUID:v39];

        v40 = [v4 path];
        [(IDSMultiplexerConnection *)v15 setPath:v40];

        v41 = [v4 multiplexerParams];
        [(IDSMultiplexerConnection *)v15 setMultiplexerParams:v41];

        [(IDSMultiplexerConnection *)v15 setLocalPort:[(IDSGroupSessionMultiplexer *)self _getRandomPortForQUIC]];
        if ([(IDSMultiplexerConnection *)v15 localPort])
        {
          unsigned int v42 = [(IDSMultiplexerConnection *)v15 localPort];
          long long v74 = 0uLL;
          v73 = 0;
          *(_WORD *)&uint8_t buf[2] = __rev16(v42);
          *(_WORD *)buf = 7708;
          nw_endpoint_t address = nw_endpoint_create_address((const sockaddr *)buf);
          [(IDSMultiplexerConnection *)v15 setLocalEndpoint:address];

          v44 = +[IDSFoundationLog Multiplexer];
          uint64_t v11 = v69;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v45 = [(IDSMultiplexerConnection *)v15 localPort];
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = v45;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Assigning local port %d to new QUIC connection", buf, 8u);
          }

          v46 = [v4 endpoint];
          [(IDSMultiplexerConnection *)v15 setRemoteEndpoint:v46];

          v47 = [v4 endpoint];
          [(IDSMultiplexerConnection *)v15 setRemotePort:nw_endpoint_get_port(v47)];

          v48 = [v4 endpoint];
          [(IDSMultiplexerConnection *)v15 setRemoteEndpoint:v48];

          [(IDSMultiplexerConnection *)v15 setPortsSignature:[(IDSMultiplexerConnection *)v15 remotePort] | ([(IDSMultiplexerConnection *)v15 localPort] << 16)];
          v49 = [v4 multiplexerParams];
          -[IDSMultiplexerConnection setContext:](v15, "setContext:", [v49 participantID]);

          v50 = [v4 simConnection];
          [(IDSMultiplexerConnection *)v15 setConnection:v50];

          LOBYTE(self) = [(IDSGroupSessionMultiplexer *)self addNewConnectionToMultiplexerTransport:v15];
        }
        else
        {
          self = +[IDSFoundationLog Multiplexer];
          uint64_t v11 = v69;
          if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEFAULT))
          {
            v57 = [v4 clientUUID];
            *(_DWORD *)buf = 138412290;
            v73 = v57;
            _os_log_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_DEFAULT, "Could not allocate local port for client %@", buf, 0xCu);
          }
          LOBYTE(self) = 0;
        }
        goto LABEL_47;
      }
      int v15 = objc_alloc_init(IDSMultiplexerConnection);
      v51 = [v4 clientUUID];
      [(IDSMultiplexerConnection *)v15 setClientUUID:v51];

      [(IDSMultiplexerConnection *)v15 setPath:v5];
      v52 = [v4 multiplexerParams];
      [(IDSMultiplexerConnection *)v15 setMultiplexerParams:v52];

      [(IDSMultiplexerConnection *)v15 setParameters:v7];
      [(IDSMultiplexerConnection *)v15 setPid:v13];
      id v53 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v71];
      [(IDSMultiplexerConnection *)v15 setProcessUUID:v53];

      if ((nw_parameters_get_data_mode() & 0xFFFFFFFE) == 2) {
        [(IDSMultiplexerConnection *)v15 setIsTCP:1];
      }
      v24 = nw_protocol_copy_quic_stream_definition();
      nw_protocol_definition_get_identifier();
      if (nw_parameters_has_protocol_in_stack()) {
        [(IDSMultiplexerConnection *)v15 setIsQUIC:1];
      }
      [(IDSMultiplexerConnection *)v15 setLocalPort:nw_endpoint_get_port(v10)];
      [(IDSMultiplexerConnection *)v15 setRemotePort:nw_endpoint_get_port(v11)];
      if ([(IDSMultiplexerConnection *)v15 isQUIC])
      {
        [(IDSMultiplexerConnection *)v15 setLocalPort:[(IDSGroupSessionMultiplexer *)self _getRandomPortForQUIC]];
        if (![(IDSMultiplexerConnection *)v15 localPort])
        {
          self = +[IDSFoundationLog Multiplexer];
          if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEFAULT))
          {
            v64 = [v4 clientUUID];
            *(_DWORD *)buf = 138412290;
            v73 = v64;
            _os_log_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_DEFAULT, "Could not allocate local port for client %@", buf, 0xCu);
          }
          LOBYTE(self) = 0;
          goto LABEL_46;
        }
        v67 = v7;
        v54 = sub_100108A94([(IDSMultiplexerConnection *)v15 localPort]);
        [(IDSMultiplexerConnection *)v15 setLocalEndpoint:v54];

        [(IDSMultiplexerConnection *)v15 setRemoteEndpoint:v11];
        v55 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v56 = [(IDSMultiplexerConnection *)v15 localPort];
          *(_DWORD *)buf = 67109120;
          LODWORD(v73) = v56;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Assigning local port %d to new QUIC connection", buf, 8u);
        }

        v7 = v67;
      }
      else
      {
        v70 = v24;
        v58 = v11;
        v59 = [v4 endpoint];
        nw_endpoint_type_t type = nw_endpoint_get_type(v59);

        if (type == nw_endpoint_type_host)
        {
          v61 = sub_100108A94([(IDSMultiplexerConnection *)v15 localPort]);
          [(IDSMultiplexerConnection *)v15 setLocalEndpoint:v61];

          v62 = sub_100108A94([(IDSMultiplexerConnection *)v15 remotePort]);
          [(IDSMultiplexerConnection *)v15 setRemoteEndpoint:v62];

          uint64_t v11 = v58;
        }
        else
        {
          [(IDSMultiplexerConnection *)v15 setLocalEndpoint:v10];
          uint64_t v11 = v58;
          [(IDSMultiplexerConnection *)v15 setRemoteEndpoint:v58];
        }
        v24 = v70;
      }
      [(IDSMultiplexerConnection *)v15 setPortsSignature:[(IDSMultiplexerConnection *)v15 remotePort] | ([(IDSMultiplexerConnection *)v15 localPort] << 16)];
      LOBYTE(self) = [(IDSGroupSessionMultiplexer *)self addNewConnectionToMultiplexerTransport:v15];
    }
LABEL_46:

LABEL_47:
LABEL_48:

LABEL_49:
    goto LABEL_50;
  }
  unsigned __int16 v6 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v30 = [v4 clientUUID];
    *(_DWORD *)buf = 138412290;
    v73 = v30;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "no nw_path for client %@", buf, 0xCu);
  }
  LOBYTE(self) = 0;
LABEL_50:

  return (char)self;
}

- (BOOL)addNewConnectionToMultiplexerTransport:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v42 = self;
  connections = self->_connections;
  unsigned __int16 v6 = [v4 clientUUID];
  [(NSMutableDictionary *)connections setObject:v4 forKeyedSubscript:v6];

  v7 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 multiplexerParams];
    *(_DWORD *)buf = 138412546;
    id v51 = v4;
    __int16 v52 = 2112;
    id v53 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Created connection %@ with params %@", buf, 0x16u);
  }
  v9 = [v4 multiplexerParams];
  uint64_t v10 = [v9 salt];

  if (v10)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v11 = self->_transports;
    id v44 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v46 objects:v56 count:16];
    v12 = 0;
    if (v44)
    {
      uint64_t v43 = *(void *)v47;
      obj = v11;
      do
      {
        for (i = 0; i != v44; i = (char *)i + 1)
        {
          if (*(void *)v47 != v43) {
            objc_enumerationMutation(obj);
          }
          int v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          int v15 = [v4 multiplexerParams];
          id v16 = [v15 sessionID];
          __int16 v17 = v4;
          v18 = [v4 multiplexerParams];
          v19 = [v18 salt];
          v20 = IDSIDAliasHashUUIDString();
          unsigned int v21 = [v16 isEqualToString:v20];

          if (v21)
          {
            uint64_t v22 = [(NSMutableDictionary *)v42->_transports objectForKeyedSubscript:v14];

            v23 = +[IDSFoundationLog Multiplexer];
            id v4 = v17;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = [v17 multiplexerParams];
              unsigned __int8 v25 = [v24 sessionID];
              transports = v42->_transports;
              *(_DWORD *)buf = 138412802;
              id v51 = v14;
              __int16 v52 = 2112;
              id v53 = v25;
              __int16 v54 = 2112;
              v55 = transports;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found transport sessionID %@ for %@ in transports %@", buf, 0x20u);
            }
            v12 = (void *)v22;
          }
          else
          {
            id v4 = v17;
          }
        }
        uint64_t v11 = obj;
        id v44 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v44);
    }
  }
  else
  {
    v27 = self->_transports;
    uint64_t v11 = [v4 multiplexerParams];
    __int16 v28 = [(NSMutableDictionary *)v11 sessionID];
    v12 = [(NSMutableDictionary *)v27 objectForKeyedSubscript:v28];
  }
  if (v12)
  {
    [v4 setTransport:v12];
    os_unfair_lock_unlock(lock);
    v29 = +[NSSet setWithObject:v4];
    id v30 = [v12 routeClientConnections:v29];

    id v31 = +[IMLockdownManager sharedInstance];
    unsigned int v32 = [v31 isInternalInstall];

    if (v32 && [v4 isQUIC] && IMGetCachedDomainIntForKeyWithDefaultValue() >= 1)
    {
      id v45 = v4;
      IDSTransportThreadAddBlockAfter();
    }
    if (![v4 invalidated])
    {
      BOOL v38 = 1;
      goto LABEL_32;
    }
    v33 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "INVALID", buf, 2u);
    }
  }
  else
  {
    v34 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = [v4 multiplexerParams];
      v36 = [v35 sessionID];
      v37 = v42->_transports;
      *(_DWORD *)buf = 138412546;
      id v51 = v36;
      __int16 v52 = 2112;
      id v53 = v37;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Can't find transport for %@ in transports %@", buf, 0x16u);
    }
    os_unfair_lock_unlock(lock);
  }
  BOOL v38 = 0;
LABEL_32:

  return v38;
}

- (BOOL)connectionCancel:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  connections = self->_connections;
  unsigned __int16 v6 = [v4 clientUUID];
  v7 = [(NSMutableDictionary *)connections objectForKeyedSubscript:v6];

  id v8 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_connections;
    v15[0] = 138412546;
    *(void *)&v15[1] = v7;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connectionCancel: found connection %@ in _connections %@", (uint8_t *)v15, 0x16u);
  }

  if (v7)
  {
    uint64_t v10 = [v7 transport];
    [v10 cancelClientConnection:v7];

    [v7 invalidate];
    uint64_t v11 = self->_connections;
    v12 = [v4 clientUUID];
    [(NSMutableDictionary *)v11 setObject:0 forKeyedSubscript:v12];

    if ([v7 isQUIC]) {
      -[IDSGroupSessionMultiplexer _releaseQUICPort:](self, "_releaseQUICPort:", [v7 localPort]);
    }
  }
  uint64_t v13 = objc_msgSend(v7, "nexusInstanceUUID", 0, 0);
  [v13 getUUIDBytes:v15];

  if (!uuid_is_null((const unsigned __int8 *)v15)) {
    os_nexus_controller_free_provider_instance();
  }
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (void)resetConnection:(id)a3
{
}

- (void)resetConnection:(id)a3 errorCode:(int)a4
{
  id v5 = a3;
  memset(uu, 170, sizeof(uu));
  uuid_clear(uu);
  assign_message = (void *)nw_path_create_assign_message();
  v7 = +[IDSFoundationLog Multiplexer];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!assign_message)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      int v14 = "resetConnection: nw_path_create_assign_message failed";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v8)
  {
    v9 = [v5 clientUUID];
    *(_DWORD *)buf = 138412290;
    __int16 v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Assigning empty nexus data message for client UUID %@", buf, 0xCu);
  }
  uint64_t v10 = [(IDSTransportLevelAgent *)self->_agent registration];
  uint64_t v11 = +[NSData dataWithBytes:assign_message length:0];
  v12 = [v5 clientUUID];
  unsigned __int8 v13 = [v10 assignNexusData:v11 toClient:v12];

  free(assign_message);
  if ((v13 & 1) == 0)
  {
    v7 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v14 = "resetConnection: assignNexusData:toClient: failed";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)listenRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 path];
  if (v5)
  {
    unsigned __int16 v6 = nw_path_copy_endpoint();
    v7 = +[IDSFoundationLog Multiplexer];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)&buf[0].sa_len = 138412290;
        *(void *)&buf[0].sa_data[2] = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "client endpoint %@", &buf[0].sa_len, 0xCu);
      }

      if (nw_endpoint_get_type(v6) != nw_endpoint_type_host)
      {
        int v14 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v4 clientUUID];
          *(_DWORD *)&buf[0].sa_len = 138412290;
          *(void *)&buf[0].sa_data[2] = v20;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "client endpoint type not 'host' for client %@", &buf[0].sa_len, 0xCu);
        }
        goto LABEL_34;
      }
      int port = nw_endpoint_get_port(v6);
      uint64_t v10 = nw_endpoint_copy_port_string(v6);
      uint64_t v11 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)&buf[0].sa_len = 67109378;
        *(_DWORD *)&buf[0].sa_data[2] = port;
        *(_WORD *)&buf[0].sa_data[6] = 2080;
        *(void *)&buf[0].sa_data[8] = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "port %u portString %s", &buf[0].sa_len, 0x12u);
      }

      free(v10);
    }
    else
    {
      if (v8)
      {
        unsigned __int8 v13 = [v4 clientUUID];
        *(_DWORD *)&buf[0].sa_len = 138412290;
        *(void *)&buf[0].sa_data[2] = v13;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "client does not have endpoint %@", &buf[0].sa_len, 0xCu);
      }
    }
    int v14 = nw_path_copy_parameters();
    int v15 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [v4 clientUUID];
      *(_DWORD *)&buf[0].sa_len = 138412546;
      *(void *)&buf[0].sa_data[2] = v16;
      *(_WORD *)&buf[0].sa_data[10] = 2112;
      *(void *)&buf[0].sa_data[12] = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "listenRequest: clientUUID: %@ and params: %@", &buf[0].sa_len, 0x16u);
    }
    endpoint = nw_path_copy_effective_local_endpoint(v5);
    v79 = nw_path_copy_effective_remote_endpoint(v5);
    uint64_t pid = nw_parameters_get_pid();
    if (!pid)
    {
      v19 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v21 = [v4 clientUUID];
        *(_DWORD *)&buf[0].sa_len = 138412290;
        *(void *)&buf[0].sa_data[2] = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Client UUID %@ having pid 0 (root) is not supported", &buf[0].sa_len, 0xCu);
      }
      goto LABEL_32;
    }
    uint64_t v18 = pid;
    v72 = v6;
    v94[0] = 0xAAAAAAAAAAAAAAAALL;
    v94[1] = 0xAAAAAAAAAAAAAAAALL;
    nw_parameters_get_proc_uuid();
    v93[0] = 0xAAAAAAAAAAAAAAAALL;
    v93[1] = 0xAAAAAAAAAAAAAAAALL;
    if (os_nexus_controller_alloc_provider_instance())
    {
      v19 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)&buf[0].sa_len = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "os_nexus_controller_alloc_provider_instance failed", &buf[0].sa_len, 2u);
      }
      goto LABEL_32;
    }
    memset(out, 170, sizeof(out));
    uuid_generate(out);
    getpid();
    if (os_nexus_controller_bind_provider_instance())
    {
      v19 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)&buf[0].sa_len = 0;
        uint64_t v22 = "os_nexus_controller_bind_provider_instance failed for server";
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v22, &buf[0].sa_len, 2u);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if (os_nexus_controller_bind_provider_instance())
    {
      v19 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)&buf[0].sa_len = 0;
        uint64_t v22 = "os_nexus_controller_bind_provider_instance failed for client";
        goto LABEL_31;
      }
LABEL_32:

LABEL_33:
LABEL_34:

      goto LABEL_35;
    }
    if (!os_channel_attr_create())
    {
      v19 = +[IDSFoundationLog Multiplexer];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_WORD *)&buf[0].sa_len = 0;
      uint64_t v22 = "connectTransportThreadForClient: os_channel_attr_create failed";
      goto LABEL_31;
    }
    os_channel_attr_set_key();
    os_channel_attr_set();
    os_channel_attr_set();
    uint64_t extended = os_channel_create_extended();
    os_channel_attr_destroy();
    if (!extended)
    {
      v19 = +[IDSFoundationLog Multiplexer];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_WORD *)&buf[0].sa_len = 0;
      uint64_t v22 = "os_channel_create_extended failed";
      goto LABEL_31;
    }
    uint64_t v69 = extended;
    v70 = v5;
    *(void *)&buf[0].sa_len = 7680;
    memset(&buf[0].sa_data[6], 0, 20);
    *(_WORD *)buf[0].sa_data = __rev16(nw_endpoint_get_port(endpoint));
    buf[0].sa_len = 28;
    nw_endpoint_t address = nw_endpoint_create_address(buf);
    memset(&buf[0].sa_data[2], 0, 24);
    *(_DWORD *)&buf[0].sa_len = 7708;
    nw_endpoint_t v26 = nw_endpoint_create_address(buf);
    v27 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v87 = 138412546;
      v88 = (IDSMultiplexerConnection *)address;
      __int16 v89 = 2112;
      v90 = (NSMutableDictionary *)v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "registration nexusdata localEndpoint %@ remoteEndpoint %@", v87, 0x16u);
    }

    uint64_t v85 = 0;
    uint64_t assign_message = nw_path_create_assign_message();
    nw_endpoint_t v71 = v26;
    if (!assign_message)
    {
      p_super = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v87 = 0;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "nw_path_create_assign_message failed", v87, 2u);
      }
      id v5 = v70;
      goto LABEL_76;
    }
    v29 = (void *)assign_message;
    id v30 = [(IDSTransportLevelAgent *)self->_agent registration];
    id v31 = +[NSData dataWithBytes:v29 length:v85];
    unsigned int v32 = [v4 clientUUID];
    unsigned __int8 v77 = [v30 assignNexusData:v31 toClient:v32];

    free(v29);
    if ((v77 & 1) == 0)
    {
      p_super = +[IDSFoundationLog Multiplexer];
      id v5 = v70;
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v87 = 0;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "assignNexusData:toClient: failed", v87, 2u);
      }
      goto LABEL_76;
    }
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v33 = objc_alloc_init(IDSMultiplexerConnection);
    v34 = [v4 clientUUID];
    [(IDSMultiplexerConnection *)v33 setClientUUID:v34];

    id v5 = v70;
    [(IDSMultiplexerConnection *)v33 setPath:v70];
    v35 = [v4 multiplexerParams];
    [(IDSMultiplexerConnection *)v33 setMultiplexerParams:v35];

    [(IDSMultiplexerConnection *)v33 setParameters:v14];
    [(IDSMultiplexerConnection *)v33 setPid:v18];
    id v36 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v94];
    [(IDSMultiplexerConnection *)v33 setProcessUUID:v36];

    v67 = address;
    [(IDSMultiplexerConnection *)v33 setLocalEndpoint:address];
    [(IDSMultiplexerConnection *)v33 setRemoteEndpoint:v71];
    [(IDSMultiplexerConnection *)v33 setLocalPort:nw_endpoint_get_port(endpoint)];
    [(IDSMultiplexerConnection *)v33 setRemotePort:0];
    id v37 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v93];
    [(IDSMultiplexerConnection *)v33 setNexusInstanceUUID:v37];

    LODWORD(v37) = nw_endpoint_get_port(endpoint);
    [(IDSMultiplexerConnection *)v33 setPortsSignature:nw_endpoint_get_port(v79) | (v37 << 16)];
    if ((nw_parameters_get_data_mode() & 0xFFFFFFFE) == 2) {
      -[IDSMultiplexerConnection setIsTCP:](v33, "setIsTCP:", 1, lock);
    }
    connections = self->_connections;
    v39 = objc_msgSend(v4, "clientUUID", lock);
    v68 = v33;
    [(NSMutableDictionary *)connections setObject:v33 forKeyedSubscript:v39];

    v40 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v87 = 138412290;
      v88 = v33;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Created listener %@", v87, 0xCu);
    }

    v41 = [v4 multiplexerParams];
    unsigned int v42 = [v41 salt];

    v76 = v14;
    if (v42)
    {
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v43 = self->_transports;
      id v78 = [(NSMutableDictionary *)v43 countByEnumeratingWithState:&v81 objects:v86 count:16];
      if (v78)
      {
        long long v74 = 0;
        v75 = v4;
        uint64_t v73 = *(void *)v82;
        do
        {
          for (i = 0; i != v78; i = (char *)i + 1)
          {
            id v45 = self;
            if (*(void *)v82 != v73) {
              objc_enumerationMutation(v43);
            }
            long long v46 = v43;
            uint64_t v47 = *(void *)(*((void *)&v81 + 1) + 8 * i);
            long long v48 = [v75 multiplexerParams];
            long long v49 = [v48 sessionID];
            v50 = [v75 multiplexerParams];
            id v51 = [v50 salt];
            __int16 v52 = IDSIDAliasHashUUIDString();
            unsigned int v53 = [v49 isEqualToString:v52];

            if (v53)
            {
              self = v45;
              uint64_t v54 = [(NSMutableDictionary *)v45->_transports objectForKeyedSubscript:v47];

              long long v74 = (void *)v54;
              int v14 = v76;
            }
            else
            {
              int v14 = v76;
              self = v45;
            }
            v55 = &IDSRegistrationPropertySupportsAVLess_ptr;
            uint64_t v43 = v46;
          }
          id v78 = [(NSMutableDictionary *)v46 countByEnumeratingWithState:&v81 objects:v86 count:16];
        }
        while (v78);
        unsigned int v56 = v74;
        id v4 = v75;
        id v5 = v70;
        unsigned __int16 v6 = v72;
        goto LABEL_70;
      }
      unsigned int v56 = 0;
      id v5 = v70;
    }
    else
    {
      transports = self->_transports;
      uint64_t v43 = [v4 multiplexerParams];
      v59 = [(NSMutableDictionary *)v43 sessionID];
      v60 = transports;
      int v14 = v76;
      unsigned int v56 = [(NSMutableDictionary *)v60 objectForKeyedSubscript:v59];
    }
    v55 = &IDSRegistrationPropertySupportsAVLess_ptr;
LABEL_70:

    if (v56)
    {
      p_super = &v68->super;
      [(IDSMultiplexerConnection *)v68 setTransport:v56];
      [(IDSMultiplexerConnection *)v68 setOsChannel:v69];
      os_unfair_lock_unlock(locka);
      [v56 addListenerConnection:v68];
    }
    else
    {
      v61 = [v55[288] Multiplexer];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = [v4 multiplexerParams];
        v63 = [v62 sessionID];
        v64 = self->_transports;
        *(_DWORD *)v87 = 138412546;
        v88 = v63;
        __int16 v89 = 2112;
        v90 = v64;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Can't find transport for %@ in transports %@", v87, 0x16u);

        int v14 = v76;
      }

      os_unfair_lock_unlock(locka);
      p_super = &v68->super;
      unsigned int v56 = 0;
    }

    nw_endpoint_t address = v67;
LABEL_76:

    goto LABEL_33;
  }
  unsigned __int16 v6 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v4 clientUUID];
    *(_DWORD *)&buf[0].sa_len = 138412290;
    *(void *)&buf[0].sa_data[2] = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "no nw_path for client %@", &buf[0].sa_len, 0xCu);
  }
LABEL_35:

  return 0;
}

- (BOOL)listenCancel:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportsInstances, 0);
  objc_storeStrong((id *)&self->_occupiedPorts, 0);
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_clientUUIDs, 0);
  objc_storeStrong((id *)&self->_agent, 0);

  objc_storeStrong((id *)&self->_nexus, 0);
}

@end