@interface IDSLocalMultiplexer
+ (id)sharedInstance;
- (BOOL)connectionCancel:(id)a3;
- (BOOL)connectionRequest:(id)a3;
- (BOOL)listenCancel:(id)a3;
- (BOOL)listenRequest:(id)a3;
- (BOOL)registerMultiplexerTransport:(id)a3;
- (BOOL)setupTransportForConnection:(id)a3;
- (BOOL)unregisterMultiplexerTransport:(id)a3;
- (IDSLocalMultiplexer)init;
- (id)_localTransportForSession:(id)a3;
@end

@implementation IDSLocalMultiplexer

+ (id)sharedInstance
{
  if (qword_100A4A850 != -1) {
    dispatch_once(&qword_100A4A850, &stru_1009840A0);
  }
  v2 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = qword_100A4A858;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "IDSLocalMultiplexer sharedInstance returns %@", (uint8_t *)&v5, 0xCu);
  }

  v3 = (void *)qword_100A4A858;

  return v3;
}

- (IDSLocalMultiplexer)init
{
  v24.receiver = self;
  v24.super_class = (Class)IDSLocalMultiplexer;
  v2 = [(IDSLocalMultiplexer *)&v24 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_14;
  }
  v2->_lock._os_unfair_lock_opaque = 0;
  uint64_t v4 = nw_nexus_create();
  nexus = v3->_nexus;
  v3->_nexus = (OS_nw_nexus *)v4;

  if (v3->_nexus)
  {
    uint64_t v6 = +[NSMutableDictionary dictionary];
    clientUUIDs = v3->_clientUUIDs;
    v3->_clientUUIDs = (NSMutableDictionary *)v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    connections = v3->_connections;
    v3->_connections = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableSet set];
    pendingConnections = v3->_pendingConnections;
    v3->_pendingConnections = (NSMutableSet *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    transports = v3->_transports;
    v3->_transports = (NSMutableDictionary *)v12;

    uint64_t v14 = +[NSMutableDictionary dictionary];
    transportsInstances = v3->_transportsInstances;
    v3->_transportsInstances = (NSMutableDictionary *)v14;

    strcpy((char *)v3->_osNexusName, "IDSMultiplexNexusOS");
    uint64_t v16 = os_nexus_controller_create();
    v3->_osNexusController = (nexus_controller *)v16;
    if (!v16)
    {
      v17 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v23[0] = 0;
        v18 = "os_nexus_controller_create failed";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    if (os_nexus_controller_register_provider())
    {
      v17 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v23[0] = 0;
        v18 = "os_nexus_controller_register_provider failed";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)v23, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    uint64_t v20 = +[IDSTransportLevelAgent sharedInstance];
    agent = v3->_agent;
    v3->_agent = (IDSTransportLevelAgent *)v20;

    [(IDSTransportLevelAgent *)v3->_agent registerMultiplexer:v3 forIdentifier:@"local"];
LABEL_14:
    v19 = v3;
    goto LABEL_15;
  }
  v17 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v23[0] = 0;
    v18 = "nw_nexus_create failed";
    goto LABEL_11;
  }
LABEL_12:

  v19 = 0;
LABEL_15:

  return v19;
}

- (BOOL)registerMultiplexerTransport:(id)a3
{
  id v4 = a3;
  transports = self->_transports;
  uint64_t v6 = [v4 identifier];
  v7 = [(NSMutableDictionary *)transports objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 identifier];
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Transport %@ already registered! Cannot register duplicate.", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = self->_transports;
    v11 = [v4 identifier];
    [(NSMutableDictionary *)v10 setObject:v4 forKeyedSubscript:v11];

    uint64_t v12 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_transports;
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Multiplexer added transport %@ to list of transports %@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v8 = [v4 routeClientConnections:self->_pendingConnections];
    [(NSMutableSet *)self->_pendingConnections minusSet:v8];
  }

  return v7 == 0;
}

- (BOOL)unregisterMultiplexerTransport:(id)a3
{
  id v4 = a3;
  transports = self->_transports;
  uint64_t v6 = [v4 identifier];
  v7 = [(NSMutableDictionary *)transports objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = self->_transports;
    v9 = [v4 identifier];
    [(NSMutableDictionary *)v8 setObject:0 forKeyedSubscript:v9];
  }
  else
  {
    uint64_t v10 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v4 identifier];
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Transport %@ not registered! Cannot unregister.", (uint8_t *)&v13, 0xCu);
    }
  }

  return v7 != 0;
}

- (BOOL)setupTransportForConnection:(id)a3
{
  id v4 = a3;
  memset(src, 170, sizeof(src));
  if (os_nexus_controller_alloc_provider_instance())
  {
    int v5 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "os_nexus_controller_alloc_provider_instance failed";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  memset(out, 170, sizeof(out));
  uuid_generate(out);
  getpid();
  if (!os_nexus_controller_bind_provider_instance())
  {
    v9 = [v4 processUUID];
    v29[0] = 0xAAAAAAAAAAAAAAAALL;
    v29[1] = 0xAAAAAAAAAAAAAAAALL;
    [v9 getUUIDBytes:v29];
    [v4 pid];
    if (os_nexus_controller_bind_provider_instance())
    {
      uint64_t v10 = +[IDSFoundationLog Multiplexer];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

LABEL_16:
        objc_msgSend(v4, "invalidate", v25);
        BOOL v7 = 0;
LABEL_17:

        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      v11 = "os_nexus_controller_bind_provider_instance failed for client";
    }
    else
    {
      uuid_copy(self->_nexusInstanceUUID, src);
      if (os_channel_attr_create())
      {
        os_channel_attr_set_key();
        os_channel_attr_set();
        uint64_t extended = os_channel_create_extended();
        uint64_t v14 = +[IDSFoundationLog Multiplexer];
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (!extended)
        {
          if (v15)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "os_channel_create_extended failed", buf, 2u);
          }

          goto LABEL_16;
        }
        if (v15)
        {
          id v16 = [v4 localEndpoint];
          __int16 v17 = [v4 remoteEndpoint];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v16;
          __int16 v27 = 2112;
          v28 = v17;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "registration nexusdata localEndpoint %@ remoteEndpoint %@", buf, 0x16u);
        }
        *(void *)buf = 0;
        v18 = [v4 localEndpoint];
        v19 = [v4 remoteEndpoint];
        assign_message = (void *)nw_path_create_assign_message();

        if (assign_message)
        {
          v21 = [(IDSTransportLevelAgent *)self->_agent registration];
          v22 = +[NSData dataWithBytes:assign_message length:*(void *)buf];
          v23 = [v4 clientUUID];
          unsigned __int8 v24 = [v21 assignNexusData:v22 toClient:v23];

          free(assign_message);
          if (v24)
          {
            [v4 setOsChannel:extended];
            BOOL v7 = 1;
            goto LABEL_17;
          }
          uint64_t v10 = +[IDSFoundationLog Multiplexer];
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          LOWORD(v25) = 0;
          v11 = "assignNexusData:toClient: failed";
        }
        else
        {
          uint64_t v10 = +[IDSFoundationLog Multiplexer];
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          LOWORD(v25) = 0;
          v11 = "nw_path_create_assign_message failed";
        }
        uint64_t v12 = (uint8_t *)&v25;
        goto LABEL_14;
      }
      uint64_t v10 = +[IDSFoundationLog Multiplexer];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      v11 = "connectTransportThreadForClient: os_channel_attr_create failed";
    }
    uint64_t v12 = buf;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    goto LABEL_15;
  }
  int v5 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v6 = "os_nexus_controller_bind_provider_instance failed for server";
    goto LABEL_7;
  }
LABEL_8:

  [v4 invalidate];
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (id)_localTransportForSession:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableDictionary *)self->_transportsInstances objectForKeyedSubscript:v4];
  if (!v5)
  {
    int v5 = [[IDSMultiplexerLocalTransport alloc] initWithIdentifier:v4];
    [(NSMutableDictionary *)self->_transportsInstances setObject:v5 forKeyedSubscript:v4];
    BOOL v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_1001684C0;
    uint64_t v10 = &unk_100981728;
    v11 = self;
    id v12 = v4;
    [(IDSMultiplexerLocalTransport *)v5 setPacketBufferReadHandler:&v7];
    -[IDSLocalMultiplexer registerMultiplexerTransport:](self, "registerMultiplexerTransport:", v5, v7, v8, v9, v10, v11);
  }

  return v5;
}

- (BOOL)connectionRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 path];
  if (v4)
  {
    int v5 = nw_path_copy_endpoint();
    uint64_t v6 = +[IDSFoundationLog Multiplexer];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "client endpoint %@", buf, 0xCu);
      }

      if (nw_endpoint_get_type(v5) != nw_endpoint_type_host)
      {
        uint64_t v8 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = [v3 clientUUID];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "client endpoint type not 'host' for client %@", buf, 0xCu);
        }
      }
      int port = nw_endpoint_get_port(v5);
      v11 = nw_endpoint_copy_port_string(v5);
      id v12 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = port;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "port %u portString %s", buf, 0x12u);
      }

      free(v11);
      uint64_t v6 = nw_path_copy_parameters();
      int v13 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Client params: %@", buf, 0xCu);
      }

      endpoint = nw_path_copy_effective_local_endpoint(v4);
      if (endpoint)
      {
        uint64_t v14 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = endpoint;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "client local endpoint %@", buf, 0xCu);
        }
      }
      v45 = nw_path_copy_effective_remote_endpoint(v4);
      if (v45)
      {
        BOOL v15 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v45;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "client remote endpoint %@", buf, 0xCu);
        }
      }
      id v16 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = [v3 multiplexerParams];
        v18 = [v3 clientUUID];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v17;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "client request [%@] for client %@", buf, 0x16u);
      }
      uint64_t pid = nw_parameters_get_pid();
      BOOL v20 = pid != 0;
      if (pid)
      {
        uint64_t v21 = pid;
        BOOL v42 = pid != 0;
        memset(buf, 170, 16);
        nw_parameters_get_proc_uuid();
        os_unfair_lock_t lock = &self->_lock;
        os_unfair_lock_lock(&self->_lock);
        v22 = [v3 multiplexerParams];
        v23 = [v22 sessionID];
        v43 = [(IDSLocalMultiplexer *)self _localTransportForSession:v23];

        unsigned __int8 v24 = objc_alloc_init(IDSMultiplexerConnection);
        uint64_t v25 = [v3 clientUUID];
        [(IDSMultiplexerConnection *)v24 setClientUUID:v25];

        [(IDSMultiplexerConnection *)v24 setPath:v4];
        v26 = [v3 multiplexerParams];
        [(IDSMultiplexerConnection *)v24 setMultiplexerParams:v26];

        [(IDSMultiplexerConnection *)v24 setParameters:v6];
        [(IDSMultiplexerConnection *)v24 setPid:v21];
        id v27 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buf];
        [(IDSMultiplexerConnection *)v24 setProcessUUID:v27];

        [(IDSMultiplexerConnection *)v24 setLocalPort:nw_endpoint_get_port(endpoint)];
        [(IDSMultiplexerConnection *)v24 setRemotePort:nw_endpoint_get_port(v45)];
        [(IDSMultiplexerConnection *)v24 setPortsSignature:[(IDSMultiplexerConnection *)v24 remotePort] | ([(IDSMultiplexerConnection *)v24 localPort] << 16)];
        if ((nw_parameters_get_data_mode() & 0xFFFFFFFE) == 2) {
          [(IDSMultiplexerConnection *)v24 setIsTCP:1];
        }
        v28 = [v3 endpoint];
        nw_endpoint_type_t type = nw_endpoint_get_type(v28);

        if (type == nw_endpoint_type_host)
        {
          *(void *)&address.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
          address.sa_family = 2;
          *(_DWORD *)&address.sa_data[2] = 0;
          *(_WORD *)address.sa_data = __rev16([(IDSMultiplexerConnection *)v24 localPort]);
          address.sa_len = 16;
          nw_endpoint_t v30 = nw_endpoint_create_address(&address);
          [(IDSMultiplexerConnection *)v24 setLocalEndpoint:v30];

          address.sa_family = 2;
          *(_DWORD *)&address.sa_data[2] = 0;
          *(_WORD *)address.sa_data = __rev16([(IDSMultiplexerConnection *)v24 remotePort]);
          address.sa_len = 16;
          nw_endpoint_t v31 = nw_endpoint_create_address(&address);
          [(IDSMultiplexerConnection *)v24 setRemoteEndpoint:v31];
        }
        else
        {
          [(IDSMultiplexerConnection *)v24 setLocalEndpoint:endpoint];
          [(IDSMultiplexerConnection *)v24 setRemoteEndpoint:v45];
        }
        connections = self->_connections;
        v37 = [v3 clientUUID];
        [(NSMutableDictionary *)connections setObject:v24 forKeyedSubscript:v37];

        v38 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)&address.sa_len = 138412290;
          *(void *)&address.sa_data[2] = v24;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Created connection %@", &address.sa_len, 0xCu);
        }

        usleep(0x64u);
        [(NSMutableSet *)self->_pendingConnections addObject:v24];
        id v39 = [(NSMutableSet *)self->_pendingConnections copy];
        [(IDSMultiplexerConnection *)v24 setTransport:v43];
        os_unfair_lock_unlock(lock);
        v40 = [v43 routeClientConnections:v39];
        os_unfair_lock_lock(lock);
        [(NSMutableSet *)self->_pendingConnections minusSet:v40];
        os_unfair_lock_unlock(lock);

        BOOL v20 = v42;
      }
      else
      {
        v34 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [v3 clientUUID];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Client UUID %@ having pid 0 (root) is not supported", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v7)
      {
        v33 = [v3 clientUUID];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "client does not have endpoint %@", buf, 0xCu);
      }
      BOOL v20 = 0;
    }
  }
  else
  {
    int v5 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [v3 clientUUID];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v32;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "no nw_path for client %@", buf, 0xCu);
    }
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)connectionCancel:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  connections = self->_connections;
  uint64_t v6 = [v4 clientUUID];
  BOOL v7 = [(NSMutableDictionary *)connections objectForKeyedSubscript:v6];

  uint64_t v8 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_connections;
    pendingConnections = self->_pendingConnections;
    int v15 = 138412802;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    BOOL v20 = pendingConnections;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connectionCancel: found connection %@ in _connections %@, _pendingConnections %@", (uint8_t *)&v15, 0x20u);
  }

  if (v7)
  {
    v11 = [v7 transport];
    [v11 cancelClientConnection:v7];

    [v7 invalidate];
    id v12 = self->_connections;
    int v13 = [v4 clientUUID];
    [(NSMutableDictionary *)v12 setObject:0 forKeyedSubscript:v13];

    [(NSMutableSet *)self->_pendingConnections removeObject:v7];
  }
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (BOOL)listenRequest:(id)a3
{
  id v4 = a3;
  int v5 = [v4 path];
  if (v5)
  {
    uint64_t v6 = nw_path_copy_endpoint();
    BOOL v7 = +[IDSFoundationLog Multiplexer];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v8)
      {
        int v13 = [v4 clientUUID];
        *(_DWORD *)buf = 138412290;
        *(void *)v64 = v13;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "client does not have endpoint %@", buf, 0xCu);
      }
LABEL_14:
      id v12 = nw_path_copy_parameters();
      uint64_t v14 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v64 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client params: %@", buf, 0xCu);
      }

      int v15 = nw_path_copy_effective_local_endpoint(v5);
      if (v15)
      {
        id v16 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v64 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "client local endpoint %@", buf, 0xCu);
        }
      }
      __int16 v17 = nw_path_copy_effective_remote_endpoint(v5);
      if (v17)
      {
        v18 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v64 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "client remote endpoint %@", buf, 0xCu);
        }
      }
      __int16 v19 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v20 = [v4 multiplexerParams];
        [v4 clientUUID];
        uint64_t v21 = v12;
        v22 = v17;
        v23 = v15;
        v25 = unsigned __int8 v24 = self;
        *(_DWORD *)buf = 138412546;
        *(void *)v64 = v20;
        *(_WORD *)&v64[8] = 2112;
        *(void *)&v64[10] = v25;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "client request [%@] for client %@", buf, 0x16u);

        self = v24;
        int v15 = v23;
        __int16 v17 = v22;
        id v12 = v21;
      }
      uint64_t pid = nw_parameters_get_pid();
      if (!pid)
      {
        v28 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          nw_endpoint_t v30 = [v4 clientUUID];
          *(_DWORD *)buf = 138412290;
          *(void *)v64 = v30;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Client UUID %@ having pid 0 (root) is not supported", buf, 0xCu);
        }
        goto LABEL_41;
      }
      uint64_t v27 = pid;
      v62[0] = 0xAAAAAAAAAAAAAAAALL;
      v62[1] = 0xAAAAAAAAAAAAAAAALL;
      nw_parameters_get_proc_uuid();
      memset(src, 170, sizeof(src));
      if (os_nexus_controller_alloc_provider_instance())
      {
        v28 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v29 = "os_nexus_controller_alloc_provider_instance failed";
LABEL_40:
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
        }
      }
      else
      {
        memset(out, 170, sizeof(out));
        uuid_generate(out);
        getpid();
        if (os_nexus_controller_bind_provider_instance())
        {
          v28 = +[IDSFoundationLog Multiplexer];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v29 = "os_nexus_controller_bind_provider_instance failed for server";
            goto LABEL_40;
          }
        }
        else if (os_nexus_controller_bind_provider_instance())
        {
          v28 = +[IDSFoundationLog Multiplexer];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v29 = "os_nexus_controller_bind_provider_instance failed for client";
            goto LABEL_40;
          }
        }
        else
        {
          v58 = self;
          uuid_copy(self->_nexusInstanceUUID, src);
          if (!os_channel_attr_create())
          {
            v28 = +[IDSFoundationLog Multiplexer];
            if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_41;
            }
            *(_WORD *)buf = 0;
            v29 = "connectTransportThreadForClient: os_channel_attr_create failed";
            goto LABEL_40;
          }
          os_channel_attr_set_key();
          os_channel_attr_set();
          uint64_t extended = os_channel_create_extended();
          if (extended)
          {
            uint64_t v54 = extended;
            *(void *)&address.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
            address.sa_family = 2;
            *(_DWORD *)&address.sa_data[2] = 0;
            endpoint = v15;
            *(_WORD *)address.sa_data = __rev16(nw_endpoint_get_port(v15));
            address.sa_len = 16;
            nw_endpoint_t v33 = nw_endpoint_create_address(&address);
            *(void *)&address.sa_len = 528;
            nw_endpoint_t v34 = nw_endpoint_create_address(&address);
            v35 = +[IDSFoundationLog Multiplexer];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v64 = v33;
              *(_WORD *)&v64[8] = 2112;
              *(void *)&v64[10] = v34;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "registration nexusdata localEndpoint %@ remoteEndpoint %@", buf, 0x16u);
            }
            nw_endpoint_t v57 = v34;

            uint64_t assign_message = nw_path_create_assign_message();
            if (assign_message)
            {
              v37 = (void *)assign_message;
              v55 = v33;
              v50 = [(IDSTransportLevelAgent *)v58->_agent registration];
              +[NSData dataWithBytes:v37 length:0];
              v38 = v52 = v37;
              id v39 = [v4 clientUUID];
              unsigned __int8 lock = [v50 assignNexusData:v38 toClient:v39];

              free(v52);
              if (lock)
              {
                os_unfair_lock_lock(&v58->_lock);
                v40 = [v4 multiplexerParams];
                v41 = [v40 sessionID];
                v53 = [(IDSLocalMultiplexer *)v58 _localTransportForSession:v41];

                BOOL v42 = objc_alloc_init(IDSMultiplexerConnection);
                v43 = [v4 clientUUID];
                [(IDSMultiplexerConnection *)v42 setClientUUID:v43];

                [(IDSMultiplexerConnection *)v42 setPath:v5];
                v44 = [v4 multiplexerParams];
                [(IDSMultiplexerConnection *)v42 setMultiplexerParams:v44];

                [(IDSMultiplexerConnection *)v42 setParameters:v12];
                [(IDSMultiplexerConnection *)v42 setPid:v27];
                id v45 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v62];
                [(IDSMultiplexerConnection *)v42 setProcessUUID:v45];

                [(IDSMultiplexerConnection *)v42 setLocalEndpoint:v55];
                [(IDSMultiplexerConnection *)v42 setRemoteEndpoint:v34];
                int v15 = endpoint;
                [(IDSMultiplexerConnection *)v42 setLocalPort:nw_endpoint_get_port(endpoint)];
                [(IDSMultiplexerConnection *)v42 setRemotePort:0];
                LODWORD(v45) = nw_endpoint_get_port(endpoint);
                [(IDSMultiplexerConnection *)v42 setPortsSignature:nw_endpoint_get_port(v17) | (v45 << 16)];
                connections = v58->_connections;
                v47 = [v4 clientUUID];
                [(NSMutableDictionary *)connections setObject:v42 forKeyedSubscript:v47];

                v48 = +[IDSFoundationLog Multiplexer];
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v64 = v42;
                  _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Created listener %@", buf, 0xCu);
                }

                usleep(0x64u);
                v49 = v53;
                [(IDSMultiplexerConnection *)v42 setTransport:v53];
                [(IDSMultiplexerConnection *)v42 setOsChannel:v54];
                os_unfair_lock_unlock(&v58->_lock);
                [v53 addListenerConnection:v42];
              }
              else
              {
                v49 = +[IDSFoundationLog Multiplexer];
                int v15 = endpoint;
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "assignNexusData:toClient: failed", buf, 2u);
                }
              }
              nw_endpoint_t v33 = v55;
            }
            else
            {
              v49 = +[IDSFoundationLog Multiplexer];
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "nw_path_create_assign_message failed", buf, 2u);
              }
              int v15 = endpoint;
            }

            goto LABEL_42;
          }
          v28 = +[IDSFoundationLog Multiplexer];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v29 = "os_channel_create_extended failed";
            goto LABEL_40;
          }
        }
      }
LABEL_41:

LABEL_42:
      goto LABEL_43;
    }
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v64 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "client endpoint %@", buf, 0xCu);
    }

    if (nw_endpoint_get_type(v6) == nw_endpoint_type_host)
    {
      int port = nw_endpoint_get_port(v6);
      uint64_t v10 = nw_endpoint_copy_port_string(v6);
      v11 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v64 = port;
        *(_WORD *)&v64[4] = 2080;
        *(void *)&v64[6] = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "port %u portString %s", buf, 0x12u);
      }

      free(v10);
      goto LABEL_14;
    }
    id v12 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v4 clientUUID];
      *(_DWORD *)buf = 138412290;
      *(void *)v64 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "client endpoint type not 'host' for client %@", buf, 0xCu);
LABEL_43:
    }
LABEL_44:

    goto LABEL_45;
  }
  uint64_t v6 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v4 clientUUID];
    *(_DWORD *)buf = 138412290;
    *(void *)v64 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "no nw_path for client %@", buf, 0xCu);
    goto LABEL_44;
  }
LABEL_45:

  return 0;
}

- (BOOL)listenCancel:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportsInstances, 0);
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_pendingConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_clientUUIDs, 0);
  objc_storeStrong((id *)&self->_agent, 0);

  objc_storeStrong((id *)&self->_nexus, 0);
}

@end