@interface IDSClientChannelManager
+ (id)sharedInstance;
- (BOOL)addClient:(id)a3;
- (BOOL)addClient:(id)a3 path:(id)a4 endpoint:(id)a5;
- (BOOL)connectProtocolHandlerForClient:(id)a3;
- (BOOL)connectTransportThreadForClient:(id)a3;
- (BOOL)registerClientChannelDestination:(id)a3 connectHandler:(id)a4;
- (BOOL)unregisterClientChannelDestination:(id)a3 clientUUID:(id)a4;
- (IDSClientChannelManager)init;
- (id)_getClientChannelconnectHandlerForDestination:(id)a3;
- (id)_getClientUUIDForDestination:(id)a3;
- (id)_getPendingClientUUIDForDestination:(id)a3;
- (id)initForTesting;
- (void)removeClient:(id)a3;
@end

@implementation IDSClientChannelManager

+ (id)sharedInstance
{
  if (qword_100A4A390 != -1) {
    dispatch_once(&qword_100A4A390, &stru_10097FD58);
  }
  v2 = (void *)qword_100A4A398;

  return v2;
}

- (IDSClientChannelManager)init
{
  v53.receiver = self;
  v53.super_class = (Class)IDSClientChannelManager;
  v2 = [(IDSClientChannelManager *)&v53 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_45;
  }
  v2->_lock._os_unfair_lock_opaque = 0;
  uint64_t v4 = nw_nexus_create();
  nexus = v3->_nexus;
  v3->_nexus = (OS_nw_nexus *)v4;

  if (v3->_nexus)
  {
    uint64_t v6 = +[NSMutableDictionary dictionary];
    clientChannelRegistrations = v3->_clientChannelRegistrations;
    v3->_clientChannelRegistrations = (NSMutableDictionary *)v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    destinationToRegisteredClientUUIDMapping = v3->_destinationToRegisteredClientUUIDMapping;
    v3->_destinationToRegisteredClientUUIDMapping = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    clientChannels = v3->_clientChannels;
    v3->_clientChannels = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    pendingClientUUIDs = v3->_pendingClientUUIDs;
    v3->_pendingClientUUIDs = (NSMutableDictionary *)v12;

    v14 = dispatch_get_global_queue(-32768, 0);
    v3->_vifRef = (NEVirtualInterface_s *)NEVirtualInterfaceCreate();

    if (v3->_vifRef)
    {
      v15 = (const void *)NEVirtualInterfaceCopyName();
      v16 = CFAutorelease(v15);
      uint64_t v17 = os_nexus_controller_create();
      v3->_osNexusController = (nexus_controller *)v17;
      if (!v17)
      {
        v19 = +[IDSFoundationLog ClientChannelManager];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v20 = "os_nexus_controller_create failed";
          goto LABEL_18;
        }
LABEL_19:

        goto LABEL_20;
      }
      if (!os_nexus_attr_create())
      {
        v19 = +[IDSFoundationLog ClientChannelManager];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v20 = "os_nexus_attr_create failed";
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      os_nexus_attr_set();
      os_nexus_attr_set();
      strcpy((char *)v3->_osNexusName, "IDSClientChannelNexusOS");
      int v18 = os_nexus_controller_register_provider();
      os_nexus_attr_destroy();
      if (v18)
      {
        v19 = +[IDSFoundationLog ClientChannelManager];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v20 = "os_nexus_controller_register_provider failed";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      NEVirtualInterfaceSetReadAutomatically();
      int IPPayloadHandler = NEVirtualInterfaceSetReadIPPayloadHandler();
      int v24 = NEVirtualInterfaceSetMTU();
      int v57 = 0;
      uint64_t v56 = 0;
      uint64_t v54 = 7708;
      uint64_t v55 = 33022;
      v25 = v16;
      arc4random_buf(&v56, 8uLL);
      *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&buf[30] = v26;
      *(_OWORD *)buf = v26;
      *(_OWORD *)&buf[16] = v26;
      inet_ntop(30, &v55, buf, 0x2Eu);
      v27 = +[NSString stringWithUTF8String:buf];
      v28 = [v27 stringByAppendingString:@"%"];
      v29 = [v28 stringByAppendingString:v25];

      id v30 = v29;
      int v31 = NEVirtualInterfaceAddAddress();
      int v32 = NEVirtualInterfaceSetRankNever();
      int updated = NEVirtualInterfaceUpdateAdHocService();
      v34 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v35 = @"YES";
        if (IPPayloadHandler) {
          CFStringRef v36 = @"YES";
        }
        else {
          CFStringRef v36 = @"NO";
        }
        *(_DWORD *)buf = 138413570;
        *(void *)&buf[4] = v25;
        if (v24) {
          CFStringRef v37 = @"YES";
        }
        else {
          CFStringRef v37 = @"NO";
        }
        *(void *)&buf[14] = v36;
        *(_WORD *)&buf[12] = 2112;
        if (v31) {
          CFStringRef v38 = @"YES";
        }
        else {
          CFStringRef v38 = @"NO";
        }
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v37;
        if (v32) {
          CFStringRef v39 = @"YES";
        }
        else {
          CFStringRef v39 = @"NO";
        }
        *(_WORD *)&buf[32] = 2112;
        if (!updated) {
          CFStringRef v35 = @"NO";
        }
        *(void *)&buf[34] = v38;
        *(_WORD *)&buf[42] = 2112;
        *(void *)&buf[44] = v39;
        __int16 v59 = 2112;
        CFStringRef v60 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Created interface %@ for IDS Nexus %@ %@ %@ %@ %@", buf, 0x3Eu);
      }

      v40 = objc_alloc_init(IDSNexusAgent);
      agent = v3->_agent;
      v3->_agent = v40;

      v42 = v3->_agent;
      uint64_t v43 = +[NSUUID UUID];
      [(IDSNexusAgent *)v42 setAgentUUID:v43];

      [(IDSNexusAgent *)v3->_agent setActive:1];
      v44 = (NWNetworkAgentRegistration *)[objc_alloc((Class)NWNetworkAgentRegistration) initWithNetworkAgentClass:objc_opt_class()];
      registration = v3->_registration;
      v3->_registration = v44;

      LOBYTE(v43) = [(NWNetworkAgentRegistration *)v3->_registration registerNetworkAgent:v3->_agent];
      v46 = +[IDSFoundationLog ClientChannelManager];
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      if ((v43 & 1) == 0)
      {
        if (v47)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "registerNetworkAgent failed", buf, 2u);
        }

        IDSNetworkingLogDump();
        goto LABEL_20;
      }
      if (v47)
      {
        v48 = v3->_agent;
        v49 = [(IDSNexusAgent *)v48 agentUUID];
        if ([(NWNetworkAgentRegistration *)v3->_registration isRegistered]) {
          CFStringRef v50 = @"YES";
        }
        else {
          CFStringRef v50 = @"NO";
        }
        v51 = [(NWNetworkAgentRegistration *)v3->_registration registeredUUID];
        *(_DWORD *)buf = 134218754;
        *(void *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v49;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v50;
        *(_WORD *)&buf[32] = 2112;
        *(void *)&buf[34] = v51;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Registered IDS Nexus Agent (%p) %@ (isRegistered %@ registrationUUID %@)", buf, 0x2Au);
      }
      if (([(NWNetworkAgentRegistration *)v3->_registration addNetworkAgentToInterfaceNamed:v25] & 1) == 0)
      {
        v19 = +[IDSFoundationLog ClientChannelManager];
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_WORD *)buf = 0;
        v20 = "addNetworkAgentToInterfaceNamed failed";
        goto LABEL_18;
      }

LABEL_45:
      v22 = v3;
      goto LABEL_46;
    }
    v16 = +[IDSFoundationLog ClientChannelManager];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "NEVirtualInterfaceCreate failed";
      goto LABEL_13;
    }
  }
  else
  {
    v16 = +[IDSFoundationLog ClientChannelManager];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "nw_nexus_create failed";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
    }
  }
LABEL_20:

  v22 = 0;
LABEL_46:

  return v22;
}

- (id)initForTesting
{
  v13.receiver = self;
  v13.super_class = (Class)IDSClientChannelManager;
  v2 = [(IDSClientChannelManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    clientChannelRegistrations = v3->_clientChannelRegistrations;
    v3->_clientChannelRegistrations = (NSMutableDictionary *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    destinationToRegisteredClientUUIDMapping = v3->_destinationToRegisteredClientUUIDMapping;
    v3->_destinationToRegisteredClientUUIDMapping = (NSMutableDictionary *)v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    clientChannels = v3->_clientChannels;
    v3->_clientChannels = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    pendingClientUUIDs = v3->_pendingClientUUIDs;
    v3->_pendingClientUUIDs = (NSMutableDictionary *)v10;
  }
  return v3;
}

- (BOOL)connectTransportThreadForClient:(id)a3
{
  uint64_t v4 = (char *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  memset(src, 170, sizeof(src));
  if (!os_nexus_controller_alloc_provider_instance())
  {
    memset(buf, 170, 16);
    uuid_generate(buf);
    getpid();
    if (os_nexus_controller_bind_provider_instance())
    {
      v7 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "os_nexus_controller_bind_provider_instance failed for server", v28, 2u);
      }

      goto LABEL_9;
    }
    uint64_t v10 = [*((id *)v4 + 3) parameters];
    v11 = [v10 processUUID];

    memset(v28, 170, sizeof(v28));
    [v11 getUUIDBytes:v28];
    uint64_t v12 = [*((id *)v4 + 3) parameters];
    [v12 pid];

    if (os_nexus_controller_bind_provider_instance())
    {
      objc_super v13 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "os_nexus_controller_bind_provider_instance failed for client", v27, 2u);
      }

      BOOL v8 = 0;
      v4[9] = 1;
      goto LABEL_36;
    }
    v14 = [*((id *)v4 + 3) parameters];
    v15 = [v14 account];

    if (v15)
    {
      v16 = +[NSScanner scannerWithString:v15];
      [v16 scanUnsignedLongLong:v4 + 144];
    }
    uuid_copy((unsigned __int8 *)v4 + 32, src);
    uint64_t v17 = os_channel_attr_create();
    *((void *)v4 + 12) = v17;
    if (v17)
    {
      os_channel_attr_set_key();
      os_channel_attr_set();
      uint64_t extended = os_channel_create_extended();
      *((void *)v4 + 11) = extended;
      if (extended)
      {
        os_channel_get_fd();
        os_channel_ring_id();
        os_channel_rx_ring();
        os_channel_ring_id();
        *((void *)v4 + 13) = os_channel_tx_ring();
        *(void *)v27 = 0;
        assign_message = (void *)nw_path_create_assign_message();
        if (assign_message)
        {
          registration = self->_registration;
          v21 = +[NSData dataWithBytes:assign_message length:*(void *)v27];
          LOBYTE(registration) = [(NWNetworkAgentRegistration *)registration assignNexusData:v21 toClient:*((void *)v4 + 2)];

          free(assign_message);
          if (registration)
          {
            v25 = v4;
            int v24 = v25;
            IDSTransportThreadAddSocket();

            BOOL v8 = 1;
LABEL_35:

LABEL_36:
            goto LABEL_10;
          }
          v23 = +[IDSFoundationLog ClientChannelManager];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v26 = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "assignNexusData:toClient: failed", v26, 2u);
          }
        }
        else
        {
          v23 = +[IDSFoundationLog ClientChannelManager];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v26 = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "nw_path_create_assign_message failed", v26, 2u);
          }
        }

LABEL_34:
        BOOL v8 = 0;
        v4[9] = 1;
        goto LABEL_35;
      }
      v22 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "os_channel_create_extended failed", v27, 2u);
      }
    }
    else
    {
      v22 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "connectTransportThreadForClient: os_channel_attr_create failed", v27, 2u);
      }
    }

    goto LABEL_34;
  }
  uint64_t v6 = +[IDSFoundationLog ClientChannelManager];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "os_nexus_controller_alloc_provider_instance failed", buf, 2u);
  }

LABEL_9:
  BOOL v8 = 0;
  v4[9] = 1;
LABEL_10:
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (BOOL)connectProtocolHandlerForClient:(id)a3
{
  uint64_t v4 = (char *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040C9AB51B7uLL);
  *((void *)v6 + 2) = &unk_100A4A3A0;
  *((void *)v6 + 3) = &unk_100A4A3C8;
  uuid_copy(v6, (const unsigned __int8 *)v4 + 112);
  *((void *)v6 + 5) = v4;
  channel_to_new_instance = (void *)nw_nexus_create_channel_to_new_instance();
  if (channel_to_new_instance)
  {
    memset(uu, 170, sizeof(uu));
    if ((nw_channel_get_nexus_instance() & 1) == 0)
    {
      v9 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "nw_channel_get_nexus_instance failed", buf, 2u);
      }
      BOOL v14 = 0;
      goto LABEL_29;
    }
    nw_channel_get_key();
    BOOL v8 = [*((id *)v4 + 3) parameters];
    v9 = [v8 processUUID];

    uint64_t v10 = [*((id *)v4 + 3) parameters];
    unsigned int v11 = [v10 pid];

    if (v9)
    {
      memset(buf, 170, 16);
      [v9 getUUIDBytes:buf];
      char v12 = nw_nexus_bind_client_port();
    }
    else
    {
      char v12 = nw_nexus_bind_client_port();
    }
    if ((v12 & 1) == 0)
    {
      v16 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v11;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "nw_nexus_bind_client_port failed for pid %d processUUID %@", buf, 0x12u);
      }
      BOOL v14 = 0;
      goto LABEL_28;
    }
    *(void *)&buf[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v15;
    *(_OWORD *)&buf[16] = v15;
    uuid_unparse(uu, buf);
    v16 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:uu];
    uint64_t protocol_handler = nw_channel_get_protocol_handler();
    (**(void (***)(void))(protocol_handler + 24))();
    assign_message = (void *)nw_path_create_assign_message();
    if (assign_message)
    {
      registration = self->_registration;
      v20 = +[NSData dataWithBytes:assign_message length:0];
      LOBYTE(registration) = [(NWNetworkAgentRegistration *)registration assignNexusData:v20 toClient:*((void *)v4 + 2)];

      free(assign_message);
      if (registration)
      {
        [v16 getUUIDBytes:v4 + 32];
        objc_storeStrong((id *)v4 + 8, channel_to_new_instance);
        *((void *)v4 + 10) = v6;
        v21 = +[IDSFoundationLog ClientChannelManager];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v24 = 134218242;
          v25 = v4;
          __int16 v26 = 2080;
          v27 = buf;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Connected to protocol handler channel object %p for nexus instance [%s]", v24, 0x16u);
        }
        BOOL v14 = 1;
        goto LABEL_27;
      }
      v21 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v24 = 0;
        v22 = "assignNexusData:toClient: failed";
        goto LABEL_25;
      }
    }
    else
    {
      v21 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v24 = 0;
        v22 = "nw_path_create_assign_message failed";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, v24, 2u);
      }
    }
    BOOL v14 = 0;
LABEL_27:

LABEL_28:
LABEL_29:

    goto LABEL_30;
  }
  objc_super v13 = +[IDSFoundationLog ClientChannelManager];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "nw_nexus_create_channel_to_new_instance failed", buf, 2u);
  }

  BOOL v14 = 0;
LABEL_30:

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (BOOL)addClient:(id)a3
{
  id v4 = a3;
  v5 = +[NWPath pathForClientID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [v5 endpoint];
    BOOL v8 = [(IDSClientChannelManager *)self addClient:v4 path:v6 endpoint:v7];
  }
  else
  {
    v9 = +[IDSFoundationLog ClientChannelManager];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to get path for client UUID %@", (uint8_t *)&v11, 0xCu);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)addClient:(id)a3 path:(id)a4 endpoint:(id)a5
{
  v9 = (IDSClientChannel *)a3;
  id v10 = a4;
  int v32 = (IDSClientChannel *)a5;
  os_unfair_lock_lock(&self->_lock);
  int v11 = [v10 parameters];
  LODWORD(a5) = [v11 pid];
  id v30 = [v11 processUUID];
  int v29 = (int)a5;
  int v31 = [(IDSClientChannel *)v32 hostname];
  id v12 = +[IDSFoundationLog ClientChannelManager];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v13 = [v10 endpoint];
    BOOL v14 = [v10 parameters];
    long long v15 = [(IDSClientChannel *)v32 port];
    *(_DWORD *)buf = 138413314;
    v34 = v9;
    __int16 v35 = 2112;
    CFStringRef v36 = v13;
    __int16 v37 = 2112;
    *(void *)CFStringRef v38 = v14;
    *(_WORD *)&v38[8] = 2112;
    *(void *)&v38[10] = v10;
    *(_WORD *)&v38[18] = 1024;
    *(_DWORD *)&v38[20] = [v15 intValue];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client UUID %@ requested nexus\n\t%@\n\t%@\n\t%@, endpoint port: %d", buf, 0x30u);
  }
  v16 = [(NSMutableDictionary *)self->_clientChannels objectForKeyedSubscript:v9];
  if (v16)
  {
    uint64_t v17 = +[IDSFoundationLog ClientChannelManager];
    if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v34 = v16;
      __int16 v35 = 2112;
      CFStringRef v36 = v9;
      __int16 v37 = 2112;
      *(void *)CFStringRef v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, &v17->super, OS_LOG_TYPE_DEFAULT, "We already created the clientChannel %p for the client %@. (IDSClientChannel %@)", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v17 = [[IDSClientChannel alloc] initWithDestination:v31];
    int v18 = +[NSMutableArray array];
    [(IDSClientChannel *)v17 setCachedDataForClient:v18];

    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v17->_path, a4);
    v19 = [(IDSClientChannel *)v32 port];
    v17->_hasMetadata = (int)[v19 intValue] > 0;

    v17->_transportType = [v11 dataMode] == (id)2;
    [(NSUUID *)v17->_uuid getUUIDBytes:v17->_flowID];
    [(NSMutableDictionary *)self->_clientChannels setObject:v17 forKeyedSubscript:v9];
    uint64_t v20 = [(NSMutableDictionary *)self->_clientChannelRegistrations objectForKeyedSubscript:v31];
    v21 = (void *)v20;
    if (v20)
    {
      (*(void (**)(uint64_t, IDSClientChannel *, IDSClientChannel *))(v20 + 16))(v20, v31, v17);
      [(NSMutableDictionary *)self->_destinationToRegisteredClientUUIDMapping setObject:v9 forKeyedSubscript:v31];
      unsigned int v22 = [(NSMutableDictionary *)self->_clientChannels count];
      v23 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219266;
        v34 = v17;
        __int16 v35 = 2112;
        CFStringRef v36 = v31;
        __int16 v37 = 2112;
        *(void *)CFStringRef v38 = v32;
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)&v38[10] = v29;
        *(_WORD *)&v38[14] = 2112;
        *(void *)&v38[16] = v30;
        __int16 v39 = 1024;
        unsigned int v40 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Created channel object %p for destination %@ endpoint [%@] pid %d processUUID %@. Active clients: %u", buf, 0x36u);
      }

      if (v22 >= 0x1E)
      {
        int v24 = +[IMLockdownManager sharedInstance];
        unsigned int v25 = [v24 isInternalInstall];

        if (v25)
        {
          __int16 v26 = +[IDSFoundationLog ClientChannelManager];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v34) = v22;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Too many active clients (%u). Aborting.", buf, 8u);
          }

          if (!isRunningTests()) {
            abort();
          }
          throwsIDSAbortException();
        }
      }
    }
    else
    {
      v27 = +[IDSFoundationLog ClientChannelManager];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v34 = v31;
        __int16 v35 = 2112;
        CFStringRef v36 = v32;
        __int16 v37 = 1024;
        *(_DWORD *)CFStringRef v38 = v29;
        *(_WORD *)&v38[4] = 2112;
        *(void *)&v38[6] = v30;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed finding connectHandler for destination %@ endpoint [%@] pid %d processUUID %@", buf, 0x26u);
      }

      [(NSMutableDictionary *)self->_pendingClientUUIDs setObject:v9 forKeyedSubscript:v31];
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_clientChannels objectForKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_clientChannels setObject:0 forKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    uint64_t v6 = [v5 destination];
    if (!v6)
    {
LABEL_11:

      goto LABEL_12;
    }
    v7 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100053138;
    block[3] = &unk_10097E440;
    id v19 = v6;
    id v8 = v4;
    id v20 = v8;
    dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_sync(v7, v9);

    [v5 invalidate];
    if (v5[11])
    {
      v16 = v5;
      id v17 = v8;
      IDSTransportThreadAddSyncBlock();

      id v10 = (void (**)(void, void, void, void, void, void))v16;
    }
    else
    {
      if (!v5[8])
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v11 = v5[10];
      if (v11) {
        (*(void (**)(void))(*(void *)(*(void *)(v11 + 32) + 24) + 8))();
      }
      nw_channel_close();
      id v12 = (void *)v5[8];
      v5[8] = 0;

      id v10 = [v5 readHandler];
      id v13 = [objc_alloc((Class)NSString) initWithFormat:@"client %@ closed connection", v8];
      id v14 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v13, NSLocalizedDescriptionKey, 0);
      id v15 = [objc_alloc((Class)NSError) initWithDomain:@"ClientChannel" code:9001 userInfo:v14];
      ((void (**)(void, void, void, void, void, id))v10)[2](v10, 0, 0, 0, 0, v15);
    }
    goto LABEL_10;
  }
LABEL_12:
}

- (BOOL)registerClientChannelDestination:(id)a3 connectHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [v7 copy];
  id v9 = objc_retainBlock(v8);
  [(NSMutableDictionary *)self->_clientChannelRegistrations setObject:v9 forKeyedSubscript:v6];

  id v10 = [(NSMutableDictionary *)self->_pendingClientUUIDs objectForKeyedSubscript:v6];
  uint64_t v11 = +[IDSFoundationLog ClientChannelManager];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_retainBlock(v8);
    clientChannelRegistrations = self->_clientChannelRegistrations;
    clientChannels = self->_clientChannels;
    int v17 = 138413058;
    id v18 = v6;
    __int16 v19 = 2048;
    id v20 = v12;
    __int16 v21 = 2112;
    unsigned int v22 = clientChannelRegistrations;
    __int16 v23 = 2112;
    int v24 = clientChannels;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "registerClientChannelDestination %@ handler %p all handlers [%@] channels [%@]", (uint8_t *)&v17, 0x2Au);
  }
  if (v10)
  {
    id v15 = [(NSMutableDictionary *)self->_clientChannels objectForKeyedSubscript:v10];
    [(NSMutableDictionary *)self->_destinationToRegisteredClientUUIDMapping setObject:v10 forKeyedSubscript:v6];
    [(NSMutableDictionary *)self->_pendingClientUUIDs setObject:0 forKeyedSubscript:v6];
    if (v15) {
      (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v15);
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (BOOL)unregisterClientChannelDestination:(id)a3 clientUUID:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(NSMutableDictionary *)self->_destinationToRegisteredClientUUIDMapping objectForKeyedSubscript:v6];
  if (([(id)v7 isEqual:v9] & 1) == 0 && v7 | v9)
  {
    v16 = +[IDSFoundationLog ClientChannelManager];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412802;
      unint64_t v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "skipping unregisterClientChannelDestination; clientUUID %@ does not match storedClientUUID %@ for destination %@",
        (uint8_t *)&v18,
        0x20u);
    }

    BOOL v15 = 0;
  }
  else
  {
    id v10 = +[IDSFoundationLog ClientChannelManager];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(NSMutableDictionary *)self->_clientChannelRegistrations objectForKeyedSubscript:v6];
      id v12 = objc_retainBlock(v11);
      clientChannelRegistrations = self->_clientChannelRegistrations;
      clientChannels = self->_clientChannels;
      int v18 = 138413314;
      unint64_t v19 = (unint64_t)v6;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2048;
      id v23 = v12;
      __int16 v24 = 2112;
      unsigned int v25 = clientChannelRegistrations;
      __int16 v26 = 2112;
      v27 = clientChannels;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "unregisterClientChannelDestination %@ clientUUID %@ handler %p all handlers [%@] channels [%@]", (uint8_t *)&v18, 0x34u);
    }
    [(NSMutableDictionary *)self->_clientChannelRegistrations setObject:0 forKeyedSubscript:v6];
    [(NSMutableDictionary *)self->_pendingClientUUIDs setObject:0 forKeyedSubscript:v6];
    [(NSMutableDictionary *)self->_destinationToRegisteredClientUUIDMapping setObject:0 forKeyedSubscript:v6];
    BOOL v15 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)_getClientUUIDForDestination:(id)a3
{
  return [(NSMutableDictionary *)self->_destinationToRegisteredClientUUIDMapping objectForKeyedSubscript:a3];
}

- (id)_getPendingClientUUIDForDestination:(id)a3
{
  return [(NSMutableDictionary *)self->_pendingClientUUIDs objectForKeyedSubscript:a3];
}

- (id)_getClientChannelconnectHandlerForDestination:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_clientChannelRegistrations objectForKeyedSubscript:a3];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingClientUUIDs, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_clientChannels, 0);
  objc_storeStrong((id *)&self->_destinationToRegisteredClientUUIDMapping, 0);
  objc_storeStrong((id *)&self->_clientChannelRegistrations, 0);

  objc_storeStrong((id *)&self->_nexus, 0);
}

@end