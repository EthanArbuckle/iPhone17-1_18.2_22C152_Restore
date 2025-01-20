@interface NWNetworkAgentRegistration
+ (BOOL)addActiveAssertionToNetworkAgent:(id)a3;
+ (BOOL)removeActiveAssertionFromNetworkAgent:(id)a3;
+ (BOOL)useNetworkAgent:(id)a3 returnUseCount:(unint64_t *)a4;
- (BOOL)addNetworkAgentToInterfaceNamed:(id)a3;
- (BOOL)addToken:(id)a3;
- (BOOL)assignDiscoveredEndpoints:(id)a3 toClient:(id)a4;
- (BOOL)assignNexusData:(id)a3 toClient:(id)a4;
- (BOOL)assignResolvedEndpoints:(id)a3 toClient:(id)a4;
- (BOOL)createReadSourceWithRegistrationSocket:(int)a3;
- (BOOL)flushTokens;
- (BOOL)isRegistered;
- (BOOL)isRegisteredInternal;
- (BOOL)registerNetworkAgent:(id)a3;
- (BOOL)registerNetworkAgent:(id)a3 withFileDescriptor:(int)a4;
- (BOOL)removeNetworkAgentFromInterfaceNamed:(id)a3;
- (BOOL)resetError;
- (BOOL)setLowWaterMark:(unsigned int)a3;
- (BOOL)setRegisteredNetworkAgent:(id)a3 fileDescriptor:(int)a4;
- (BOOL)unregisterNetworkAgent;
- (BOOL)updateNetworkAgent:(id)a3;
- (Class)networkAgentClass;
- (NSUUID)registeredUUID;
- (NWNetworkAgent)networkAgent;
- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3;
- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)readSource;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (int)dupRegistrationFileDescriptor;
- (int)registrationSocket;
- (unint64_t)useCount;
- (unsigned)tokenCount;
- (unsigned)tokenCountWithError:(int *)a3;
- (void)dealloc;
- (void)handleMessageFromAgent;
- (void)setNetworkAgent:(id)a3;
- (void)setNetworkAgentClass:(Class)a3;
- (void)setQueue:(id)a3;
- (void)setReadSource:(id)a3;
- (void)setRegisteredUUID:(id)a3;
- (void)setRegistrationSocket:(int)a3;
- (void)setUseCount:(unint64_t)a3;
@end

@implementation NWNetworkAgentRegistration

void __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v3 = [WeakRetained readSource];
    v4 = *(void **)(a1 + 32);

    id WeakRetained = v5;
    if (v3 == v4)
    {
      [v5 handleMessageFromAgent];
      id WeakRetained = v5;
    }
  }
}

- (OS_dispatch_source)readSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)handleMessageFromAgent
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  char v94 = 0;
  if ([(NWNetworkAgentRegistration *)self isRegisteredInternal])
  {
    v3 = (unsigned __int8 *)nw_network_agent_ctl_copy_received_agent_message([(NWNetworkAgentRegistration *)self registrationSocket], &v94);
    if (v3)
    {
      v4 = v3;
      unsigned int v5 = *v3;
      if (v5 > 0x1A)
      {
LABEL_77:
        free(v4);
        return;
      }
      if (((1 << v5) & 0x400F400) != 0)
      {
        if (*((_DWORD *)v3 + 3) < 0x10u)
        {
          v6 = 0;
        }
        else
        {
          v6 = [MEMORY[0x1E4F1CA60] dictionary];
          if (!uuid_is_null(v4 + 16))
          {
            v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v4 + 16];
            [v6 setObject:v7 forKeyedSubscript:@"ClientUUID"];
          }
          [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FromUser"];
          unsigned int v5 = *v4;
        }
        switch(v5)
        {
          case 0xAu:
            v11 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v12 = objc_opt_respondsToSelector();

            if (v12)
            {
              v13 = [(NWNetworkAgentRegistration *)self networkAgent];
              [v13 requestNexusWithOptions:v6];
            }
            break;
          case 0xCu:
            v16 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v17 = objc_opt_respondsToSelector();

            if (v17)
            {
              v18 = [(NWNetworkAgentRegistration *)self networkAgent];
              [v18 closeNexusWithOptions:v6];
            }
            break;
          case 0xDu:
            v19 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v20 = objc_opt_respondsToSelector();

            if (v20)
            {
              v21 = [(NWNetworkAgentRegistration *)self networkAgent];
              [v21 startAgentWithOptions:v6];
            }
            break;
          case 0xEu:
            v22 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v23 = objc_opt_respondsToSelector();

            if (v23)
            {
              v24 = [(NWNetworkAgentRegistration *)self networkAgent];
              [v24 assertAgentWithOptions:v6];
            }
            break;
          case 0xFu:
            v25 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v26 = objc_opt_respondsToSelector();

            if (v26)
            {
              v27 = [(NWNetworkAgentRegistration *)self networkAgent];
              [v27 unassertAgentWithOptions:v6];
            }
            break;
          case 0x1Au:
            if (*((_DWORD *)v4 + 3) < 0x14u) {
              uint64_t v28 = 0;
            }
            else {
              uint64_t v28 = *((unsigned int *)v4 + 8);
            }
            v74 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v75 = objc_opt_respondsToSelector();

            if (v75)
            {
              v76 = [(NWNetworkAgentRegistration *)self networkAgent];
              [v76 reportError:v28 withOptions:v6];
            }
            break;
          default:
            goto LABEL_76;
        }
        goto LABEL_76;
      }
      if (((1 << v5) & 0x320) == 0)
      {
        if (v5 != 25) {
          goto LABEL_77;
        }
        v14 = [(NWNetworkAgentRegistration *)self networkAgent];
        char v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) == 0) {
          goto LABEL_77;
        }
        v6 = [(NWNetworkAgentRegistration *)self networkAgent];
        [v6 tokenLowWaterMarkReached];
        goto LABEL_76;
      }
      if (*((_DWORD *)v3 + 3) < 0x18u)
      {
        v6 = 0;
        goto LABEL_42;
      }
      v6 = [MEMORY[0x1E4F1CA60] dictionary];
      if (*((_DWORD *)v4 + 5))
      {
        v9 = objc_msgSend(NSNumber, "numberWithInt:");
        [v6 setObject:v9 forKeyedSubscript:@"PID"];
      }
      if (uuid_is_null(v4 + 24))
      {
        int v10 = *((_DWORD *)v4 + 4);
        if ((v10 & 2) == 0) {
          goto LABEL_19;
        }
      }
      else
      {
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v4 + 24];
        [v6 setObject:v29 forKeyedSubscript:@"ProcessUUID"];

        int v10 = *((_DWORD *)v4 + 4);
        if ((v10 & 2) == 0)
        {
LABEL_19:
          if ((v10 & 1) == 0)
          {
LABEL_42:
            int v30 = *v4;
            switch(v30)
            {
              case 5:
                v35 = [(NWNetworkAgentRegistration *)self networkAgent];
                char v36 = objc_opt_respondsToSelector();

                if (v36)
                {
                  v33 = [(NWNetworkAgentRegistration *)self networkAgent];
                  char v34 = [v33 startAgentWithOptions:v6];
LABEL_49:
                  char v37 = v34;

                  if (v37)
                  {
LABEL_76:

                    goto LABEL_77;
                  }
                }
                break;
              case 9:
                v72 = [(NWNetworkAgentRegistration *)self networkAgent];
                char v73 = objc_opt_respondsToSelector();

                if ((v73 & 1) == 0) {
                  goto LABEL_76;
                }
                v39 = [(NWNetworkAgentRegistration *)self networkAgent];
                [v39 unassertAgentWithOptions:v6];
                goto LABEL_75;
              case 8:
                v31 = [(NWNetworkAgentRegistration *)self networkAgent];
                char v32 = objc_opt_respondsToSelector();

                if (v32)
                {
                  v33 = [(NWNetworkAgentRegistration *)self networkAgent];
                  char v34 = [v33 assertAgentWithOptions:v6];
                  goto LABEL_49;
                }
                break;
            }
            v38 = [(NWNetworkAgentRegistration *)self networkAgent];
            v39 = (void *)[v38 copyAgentData];

            long long buf = 0uLL;
            v40 = [(NWNetworkAgentRegistration *)self registeredUUID];
            [v40 getUUIDBytes:&buf];

            v41 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v42 = objc_opt_respondsToSelector();

            if (v42)
            {
              v43 = [(NWNetworkAgentRegistration *)self networkAgent];
              char v92 = [v43 isSpecificUseOnly];
            }
            else
            {
              char v92 = 0;
            }
            v44 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v45 = objc_opt_respondsToSelector();

            if (v45)
            {
              v46 = [(NWNetworkAgentRegistration *)self networkAgent];
              char v91 = [v46 isNetworkProvider];
            }
            else
            {
              char v91 = 0;
            }
            v47 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v48 = objc_opt_respondsToSelector();

            if (v48)
            {
              v49 = [(NWNetworkAgentRegistration *)self networkAgent];
              char v90 = [v49 isNexusProvider];
            }
            else
            {
              char v90 = 0;
            }
            v50 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v51 = objc_opt_respondsToSelector();

            if (v51)
            {
              v52 = [(NWNetworkAgentRegistration *)self networkAgent];
              char v89 = [v52 supportsListenRequests];
            }
            else
            {
              char v89 = 0;
            }
            v53 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v54 = objc_opt_respondsToSelector();

            if (v54)
            {
              v55 = [(NWNetworkAgentRegistration *)self networkAgent];
              char v88 = [v55 supportsBrowseRequests];
            }
            else
            {
              char v88 = 0;
            }
            v56 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v57 = objc_opt_respondsToSelector();

            if (v57)
            {
              v58 = [(NWNetworkAgentRegistration *)self networkAgent];
              char v87 = [v58 supportsResolveRequests];
            }
            else
            {
              char v87 = 0;
            }
            v59 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v60 = objc_opt_respondsToSelector();

            if (v60)
            {
              v61 = [(NWNetworkAgentRegistration *)self networkAgent];
              unsigned __int8 v86 = [v61 requiresAssert];
            }
            else
            {
              unsigned __int8 v86 = 0;
            }
            v62 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v63 = objc_opt_respondsToSelector();

            v93 = v6;
            if (v63)
            {
              v64 = [(NWNetworkAgentRegistration *)self networkAgent];
              char v85 = [v64 updateClientsImmediately];
            }
            else
            {
              char v85 = 0;
            }
            v84 = [(objc_class *)[(NWNetworkAgentRegistration *)self networkAgentClass] agentDomain];
            v83 = [(objc_class *)[(NWNetworkAgentRegistration *)self networkAgentClass] agentType];
            v65 = [(NWNetworkAgentRegistration *)self networkAgent];
            v82 = [v65 agentDescription];

            int v81 = [(NWNetworkAgentRegistration *)self registrationSocket];
            v80 = (unsigned char *)[v84 UTF8String];
            v79 = (unsigned char *)[v83 UTF8String];
            uint64_t v78 = [v82 UTF8String];
            v66 = [(NWNetworkAgentRegistration *)self networkAgent];
            int v77 = [v66 isActive];
            v67 = [(NWNetworkAgentRegistration *)self networkAgent];
            int v68 = [v67 isKernelActivated];
            v69 = [(NWNetworkAgentRegistration *)self networkAgent];
            char v70 = [v69 isUserActivated];
            v71 = [(NWNetworkAgentRegistration *)self networkAgent];
            nw_network_agent_ctl_setsockopt(v81, 3, (unsigned __int8 *)&buf, v80, v79, v78, v77, v68, v70, [v71 isVoluntary], v92, v91, v90, v89, v88, v87, 0, v86, v85,
              (const unsigned __int8 *)[v39 bytes],
              [v39 length]);

            v6 = v93;
LABEL_75:

            goto LABEL_76;
          }
LABEL_41:
          [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FromUser"];
          goto LABEL_42;
        }
      }
      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FromKernel"];
      if ((*((_DWORD *)v4 + 4) & 1) == 0) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
    if (!v94)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136446210;
        *(void *)((char *)&buf + 4) = "-[NWNetworkAgentRegistration handleMessageFromAgent]";
        _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_ERROR, "%{public}s Network Agent Registration failed to read message", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

- (NWNetworkAgent)networkAgent
{
  return (NWNetworkAgent *)objc_getProperty(self, a2, 24, 1);
}

- (int)registrationSocket
{
  return self->_registrationSocket;
}

- (BOOL)isRegisteredInternal
{
  return [(NWNetworkAgentRegistration *)self registrationSocket] != -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_registeredUUID, 0);

  objc_storeStrong((id *)&self->_networkAgent, 0);
}

- (void)setReadSource:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRegistrationSocket:(int)a3
{
  self->_registrationSocket = a3;
}

- (void)setRegisteredUUID:(id)a3
{
}

- (NSUUID)registeredUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNetworkAgent:(id)a3
{
}

- (void)setNetworkAgentClass:(Class)a3
{
  self->_networkAgentClass = a3;
}

- (Class)networkAgentClass
{
  return self->_networkAgentClass;
}

- (unsigned)tokenCount
{
  return [(NWNetworkAgentRegistration *)self tokenCountWithError:0];
}

- (unsigned)tokenCountWithError:(int *)a3
{
  unsigned int result = [(NWNetworkAgentRegistration *)self isRegisteredInternal];
  if (result)
  {
    unsigned int v7 = 0;
    int token_count = nw_network_agent_get_token_count([(NWNetworkAgentRegistration *)self registrationSocket], &v7);
    if (a3) {
      *a3 = token_count;
    }
    return v7;
  }
  return result;
}

- (void)setUseCount:(unint64_t)a3
{
  if ([(NWNetworkAgentRegistration *)self isRegisteredInternal])
  {
    int v5 = [(NWNetworkAgentRegistration *)self registrationSocket];
    nw_network_agent_set_use_count(v5, a3);
  }
}

- (unint64_t)useCount
{
  unint64_t v5 = 0;
  BOOL v3 = [(NWNetworkAgentRegistration *)self isRegisteredInternal];
  unint64_t result = 0;
  if (v3)
  {
    nw_network_agent_get_use_count([(NWNetworkAgentRegistration *)self registrationSocket], &v5);
    return v5;
  }
  return result;
}

- (BOOL)assignResolvedEndpoints:(id)a3 toClient:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v8 = (id)gLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446722;
    *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignResolvedEndpoints:toClient:]";
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_INFO, "%{public}s Assigning resolved endpoints %@ to %@", buf, 0x20u);
  }

  BOOL v9 = nw_array_create();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "internalEndpoint", (void)v20);
        nw_array_append(v9, v14);
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  *(void *)long long buf = 0;
  endpoint_array_unint64_t result = nw_path_create_endpoint_array_result(buf, (void *)v9, 203);
  if (endpoint_array_result)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    char v17 = (void *)[v16 initWithBytesNoCopy:endpoint_array_result length:*(void *)buf freeWhenDone:1];
    BOOL v18 = [(NWNetworkAgentRegistration *)self assignNexusData:v17 toClient:v7];
  }
  else
  {
    BOOL v18 = [(NWNetworkAgentRegistration *)self assignNexusData:0 toClient:v7];
  }

  return v18;
}

- (BOOL)assignDiscoveredEndpoints:(id)a3 toClient:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v8 = (id)gLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446722;
    *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignDiscoveredEndpoints:toClient:]";
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_INFO, "%{public}s Assigning discovered endpoints %@ to %@", buf, 0x20u);
  }

  BOOL v9 = nw_array_create();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "internalEndpoint", (void)v20);
        nw_array_append(v9, v14);
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  *(void *)long long buf = 0;
  endpoint_array_unint64_t result = nw_path_create_endpoint_array_result(buf, (void *)v9, 202);
  if (endpoint_array_result)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    char v17 = (void *)[v16 initWithBytesNoCopy:endpoint_array_result length:*(void *)buf freeWhenDone:1];
    BOOL v18 = [(NWNetworkAgentRegistration *)self assignNexusData:v17 toClient:v7];
  }
  else
  {
    BOOL v18 = [(NWNetworkAgentRegistration *)self assignNexusData:0 toClient:v7];
  }

  return v18;
}

- (BOOL)assignNexusData:(id)a3 toClient:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(NWNetworkAgentRegistration *)self isRegisteredInternal]) {
    goto LABEL_44;
  }
  v8 = [(NWNetworkAgentRegistration *)self registeredUUID];

  if (v8)
  {
    if ((unint64_t)[v6 length] >= 0xFFFFFFF0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v9 = (id)gLogObj;
      *(_DWORD *)long long buf = 136446466;
      *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = [v6 length];
      LODWORD(v34) = 22;
      id v10 = (const char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v35 = 0;
      if (!__nwlog_fault(v10, &type, &v35)) {
        goto LABEL_26;
      }
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v11 = (id)gLogObj;
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v11, type))
        {
          uint64_t v13 = objc_msgSend(v6, "length", buf, v34);
          *(_DWORD *)long long buf = 136446466;
          *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v13;
          v14 = "%{public}s Invalid data length (%lu)";
LABEL_23:
          id v27 = v11;
          os_log_type_t v28 = v12;
LABEL_24:
          _os_log_impl(&dword_1830D4000, v27, v28, v14, buf, 0x16u);
        }
      }
      else if (v35)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v11 = (id)gLogObj;
        os_log_type_t v18 = type;
        BOOL v19 = os_log_type_enabled(v11, type);
        if (backtrace_string)
        {
          if (v19)
          {
            uint64_t v20 = objc_msgSend(v6, "length", buf, v34);
            *(_DWORD *)long long buf = 136446722;
            *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2082;
            *(void *)&buf[24] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v11, v18, "%{public}s Invalid data length (%lu), dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
LABEL_26:
          if (v10)
          {
            id v29 = (char *)v10;
LABEL_43:
            free(v29);
            goto LABEL_44;
          }
          goto LABEL_44;
        }
        if (v19)
        {
          uint64_t v32 = objc_msgSend(v6, "length", buf, v34);
          *(_DWORD *)long long buf = 136446466;
          *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v32;
          v14 = "%{public}s Invalid data length (%lu), no backtrace";
          id v27 = v11;
          os_log_type_t v28 = v18;
          goto LABEL_24;
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v11 = (id)gLogObj;
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v11, type))
        {
          uint64_t v26 = objc_msgSend(v6, "length", buf, v34);
          *(_DWORD *)long long buf = 136446466;
          *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v26;
          v14 = "%{public}s Invalid data length (%lu), backtrace limit exceeded";
          goto LABEL_23;
        }
      }

      goto LABEL_26;
    }
    LODWORD(v8) = [v6 length] + 16;
    char v15 = (unsigned __int8 *)malloc_type_calloc(v8, 1uLL, 0x9BD5DDFEuLL);
    if (v15)
    {
      id v16 = v15;
      *(void *)long long buf = 0;
      *(void *)&buf[8] = 0;
      [v7 getUUIDBytes:buf];
      *(_OWORD *)id v16 = *(_OWORD *)buf;
      if ([v6 length]) {
        memcpy(v16 + 16, (const void *)[v6 bytes], objc_msgSend(v6, "length"));
      }
      LOBYTE(v8) = (int)nw_network_agent_ctl_setsockopt_inner([(NWNetworkAgentRegistration *)self registrationSocket], 11, v16, v8, 0, 0) >= 0;
      free(v16);
      goto LABEL_45;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v21 = (id)gLogObj;
    *(_DWORD *)long long buf = 136446466;
    *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v8;
    long long v22 = (const char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v35 = 0;
    if (__nwlog_fault(v22, &type, &v35))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        long long v23 = (id)gLogObj;
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)long long buf = 136446466;
          *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v8;
          v25 = "%{public}s calloc(%u) failed";
LABEL_39:
          _os_log_impl(&dword_1830D4000, v23, v24, v25, buf, 0x12u);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      if (!v35)
      {
        long long v23 = __nwlog_obj();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)long long buf = 136446466;
          *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v8;
          v25 = "%{public}s calloc(%u) failed, backtrace limit exceeded";
          goto LABEL_39;
        }
LABEL_40:

        goto LABEL_41;
      }
      uint64_t v30 = (char *)__nw_create_backtrace_string();
      long long v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      BOOL v31 = os_log_type_enabled(v23, type);
      if (!v30)
      {
        if (v31)
        {
          *(_DWORD *)long long buf = 136446466;
          *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v8;
          v25 = "%{public}s calloc(%u) failed, no backtrace";
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      if (v31)
      {
        *(_DWORD *)long long buf = 136446722;
        *(void *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v8;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = v30;
        _os_log_impl(&dword_1830D4000, v23, v24, "%{public}s calloc(%u) failed, dumping backtrace:%{public}s", buf, 0x1Cu);
      }

      free(v30);
    }
LABEL_41:
    if (v22)
    {
      id v29 = (char *)v22;
      goto LABEL_43;
    }
LABEL_44:
    LOBYTE(v8) = 0;
  }
LABEL_45:

  return (char)v8;
}

- (BOOL)removeNetworkAgentFromInterfaceNamed:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NWNetworkAgentRegistration *)self isRegisteredInternal]
    && ([(NWNetworkAgentRegistration *)self registeredUUID],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    *(void *)uu = 0;
    uint64_t v10 = 0;
    id v6 = [(NWNetworkAgentRegistration *)self registeredUUID];
    [v6 getUUIDBytes:uu];

    BOOL v7 = nw_network_agent_remove_from_interface([v4 UTF8String], uu) == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)addNetworkAgentToInterfaceNamed:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NWNetworkAgentRegistration *)self isRegisteredInternal]
    && ([(NWNetworkAgentRegistration *)self registeredUUID],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    *(void *)uu = 0;
    uint64_t v10 = 0;
    id v6 = [(NWNetworkAgentRegistration *)self registeredUUID];
    [v6 getUUIDBytes:uu];

    BOOL v7 = nw_network_agent_add_to_interface([v4 UTF8String], uu) == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)setLowWaterMark:(unsigned int)a3
{
  BOOL v5 = [(NWNetworkAgentRegistration *)self isRegisteredInternal];
  if (v5)
  {
    *(_DWORD *)BOOL v7 = a3;
    LOBYTE(v5) = nw_network_agent_ctl_setsockopt_inner([(NWNetworkAgentRegistration *)self registrationSocket], 24, v7, 4u, 0, 0) == 0;
  }
  return v5;
}

- (BOOL)resetError
{
  BOOL v3 = [(NWNetworkAgentRegistration *)self isRegisteredInternal];
  if (v3) {
    LOBYTE(v3) = nw_network_agent_ctl_setsockopt_inner([(NWNetworkAgentRegistration *)self registrationSocket], 27, 0, 0, 0, 0) == 0;
  }
  return v3;
}

- (BOOL)flushTokens
{
  BOOL v3 = [(NWNetworkAgentRegistration *)self isRegisteredInternal];
  if (v3) {
    LOBYTE(v3) = nw_network_agent_ctl_setsockopt_inner([(NWNetworkAgentRegistration *)self registrationSocket], 22, 0, 0, 0, 0) == 0;
  }
  return v3;
}

- (BOOL)addToken:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4)
  {
    BOOL v7 = __nwlog_obj();
    *(_DWORD *)long long buf = 136446210;
    id v21 = "-[NWNetworkAgentRegistration addToken:]";
    v8 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v18 = 0;
    if (!__nwlog_fault(v8, &type, &v18)) {
      goto LABEL_33;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v9 = __nwlog_obj();
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)long long buf = 136446210;
        id v21 = "-[NWNetworkAgentRegistration addToken:]";
        uint64_t v11 = "%{public}s called with null token";
LABEL_31:
        _os_log_impl(&dword_1830D4000, v9, v10, v11, buf, 0xCu);
      }
LABEL_32:

LABEL_33:
      if (v8) {
        free(v8);
      }
      goto LABEL_35;
    }
    if (!v18)
    {
      id v9 = __nwlog_obj();
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)long long buf = 136446210;
        id v21 = "-[NWNetworkAgentRegistration addToken:]";
        uint64_t v11 = "%{public}s called with null token, backtrace limit exceeded";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    id v9 = __nwlog_obj();
    os_log_type_t v10 = type;
    BOOL v14 = os_log_type_enabled(v9, type);
    if (!backtrace_string)
    {
      if (v14)
      {
        *(_DWORD *)long long buf = 136446210;
        id v21 = "-[NWNetworkAgentRegistration addToken:]";
        uint64_t v11 = "%{public}s called with null token, no backtrace";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (v14)
    {
      *(_DWORD *)long long buf = 136446466;
      id v21 = "-[NWNetworkAgentRegistration addToken:]";
      __int16 v22 = 2082;
      long long v23 = backtrace_string;
      char v15 = "%{public}s called with null token, dumping backtrace:%{public}s";
LABEL_21:
      _os_log_impl(&dword_1830D4000, v9, v10, v15, buf, 0x16u);
    }
LABEL_22:

    free(backtrace_string);
    goto LABEL_33;
  }
  if ((unint64_t)[v4 length] > 0x1000)
  {
    os_log_type_t v12 = __nwlog_obj();
    *(_DWORD *)long long buf = 136446210;
    id v21 = "-[NWNetworkAgentRegistration addToken:]";
    v8 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v18 = 0;
    if (!__nwlog_fault(v8, &type, &v18)) {
      goto LABEL_33;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v9 = __nwlog_obj();
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)long long buf = 136446210;
        id v21 = "-[NWNetworkAgentRegistration addToken:]";
        uint64_t v11 = "%{public}s called with null (token.length <= NETAGENT_MAX_DATA_SIZE)";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (!v18)
    {
      id v9 = __nwlog_obj();
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)long long buf = 136446210;
        id v21 = "-[NWNetworkAgentRegistration addToken:]";
        uint64_t v11 = "%{public}s called with null (token.length <= NETAGENT_MAX_DATA_SIZE), backtrace limit exceeded";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    id v9 = __nwlog_obj();
    os_log_type_t v10 = type;
    BOOL v16 = os_log_type_enabled(v9, type);
    if (!backtrace_string)
    {
      if (v16)
      {
        *(_DWORD *)long long buf = 136446210;
        id v21 = "-[NWNetworkAgentRegistration addToken:]";
        uint64_t v11 = "%{public}s called with null (token.length <= NETAGENT_MAX_DATA_SIZE), no backtrace";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (v16)
    {
      *(_DWORD *)long long buf = 136446466;
      id v21 = "-[NWNetworkAgentRegistration addToken:]";
      __int16 v22 = 2082;
      long long v23 = backtrace_string;
      char v15 = "%{public}s called with null (token.length <= NETAGENT_MAX_DATA_SIZE), dumping backtrace:%{public}s";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (![(NWNetworkAgentRegistration *)self isRegisteredInternal])
  {
LABEL_35:
    BOOL v6 = 0;
    goto LABEL_36;
  }
  BOOL v6 = nw_network_agent_ctl_setsockopt_inner(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 21, (const unsigned __int8 *)[v5 bytes], objc_msgSend(v5, "length"), 0, 0) == 0;
LABEL_36:

  return v6;
}

- (BOOL)unregisterNetworkAgent
{
  BOOL v3 = [(NWNetworkAgentRegistration *)self isRegisteredInternal];
  if (v3)
  {
    nw_network_agent_ctl_setsockopt_inner([(NWNetworkAgentRegistration *)self registrationSocket], 2, 0, 0, 0, 0);
    id v4 = [(NWNetworkAgentRegistration *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__NWNetworkAgentRegistration_unregisterNetworkAgent__block_invoke;
    block[3] = &unk_1E524BAA8;
    block[4] = self;
    dispatch_async(v4, block);
  }
  return v3;
}

void __52__NWNetworkAgentRegistration_unregisterNetworkAgent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRegistrationSocket:0xFFFFFFFFLL];
  [*(id *)(a1 + 32) setNetworkAgent:0];
  v2 = [*(id *)(a1 + 32) readSource];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) readSource];
    dispatch_source_cancel(v3);

    id v4 = *(void **)(a1 + 32);
    [v4 setReadSource:0];
  }
}

- (BOOL)updateNetworkAgent:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NWNetworkAgentRegistration *)self isRegisteredInternal]) {
    goto LABEL_6;
  }
  [(NWNetworkAgentRegistration *)self networkAgentClass];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  BOOL v5 = [(NWNetworkAgentRegistration *)self registeredUUID];
  BOOL v6 = [v4 agentUUID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    *(void *)uu = 0;
    uint64_t v26 = 0;
    v8 = [(NWNetworkAgentRegistration *)self registeredUUID];
    [v8 getUUIDBytes:uu];

    uint64_t v24 = (void *)[v4 copyAgentData];
    if (objc_opt_respondsToSelector()) {
      char v23 = [v4 isSpecificUseOnly];
    }
    else {
      char v23 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      char v22 = [v4 isNetworkProvider];
    }
    else {
      char v22 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      char v21 = [v4 isNexusProvider];
    }
    else {
      char v21 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      char v20 = [v4 supportsListenRequests];
    }
    else {
      char v20 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      char v19 = [v4 supportsBrowseRequests];
    }
    else {
      char v19 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      char v18 = [v4 supportsResolveRequests];
    }
    else {
      char v18 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v16 = [v4 requiresAssert];
    }
    else {
      unsigned __int8 v16 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      char v15 = [v4 updateClientsImmediately];
    }
    else {
      char v15 = 0;
    }
    uint64_t v11 = [(objc_class *)[(NWNetworkAgentRegistration *)self networkAgentClass] agentDomain];
    os_log_type_t v12 = [(objc_class *)[(NWNetworkAgentRegistration *)self networkAgentClass] agentType];
    uint64_t v13 = [v4 agentDescription];
    char v17 = v11;
    int v14 = nw_network_agent_ctl_setsockopt(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 3, uu, (unsigned char *)[v11 UTF8String], (unsigned char *)objc_msgSend(v12, "UTF8String"), objc_msgSend(v13, "UTF8String"), objc_msgSend(v4, "isActive"), objc_msgSend(v4, "isKernelActivated"), objc_msgSend(v4, "isUserActivated"), objc_msgSend(v4, "isVoluntary"), v23, v22, v21, v20, v19, v18, 0, v16, v15,
            (const unsigned __int8 *)[v24 bytes],
            [v24 length]);
    BOOL v9 = v14 >= 0;
    if ((v14 & 0x80000000) == 0) {
      [(NWNetworkAgentRegistration *)self setNetworkAgent:v4];
    }
  }
  else
  {
LABEL_6:
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)setRegisteredNetworkAgent:(id)a3 fileDescriptor:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NWNetworkAgentRegistration *)self networkAgentClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    os_log_type_t v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      int v14 = "-[NWNetworkAgentRegistration setRegisteredNetworkAgent:fileDescriptor:]";
      _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_ERROR, "%{public}s Agent is not a valid class", buf, 0xCu);
    }

    goto LABEL_7;
  }
  [(NWNetworkAgentRegistration *)self setNetworkAgent:v6];
  int v7 = [v6 agentUUID];
  [(NWNetworkAgentRegistration *)self setRegisteredUUID:v7];

  if (![(NWNetworkAgentRegistration *)self createReadSourceWithRegistrationSocket:v4])
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  v8 = [(NWNetworkAgentRegistration *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NWNetworkAgentRegistration_setRegisteredNetworkAgent_fileDescriptor___block_invoke;
  block[3] = &unk_1E524BAA8;
  block[4] = self;
  dispatch_async(v8, block);

  BOOL v9 = 1;
LABEL_8:

  return v9;
}

uint64_t __71__NWNetworkAgentRegistration_setRegisteredNetworkAgent_fileDescriptor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMessageFromAgent];
}

- (BOOL)registerNetworkAgent:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(NWNetworkAgentRegistration *)self registerNetworkAgent:v4 withFileDescriptor:+[NWNetworkAgentRegistration newRegistrationFileDescriptor]];

  return (char)self;
}

- (BOOL)registerNetworkAgent:(id)a3 withFileDescriptor:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NWNetworkAgentRegistration *)self networkAgentClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v8 = (id)gLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = "-[NWNetworkAgentRegistration registerNetworkAgent:withFileDescriptor:]";
      _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_ERROR, "%{public}s Agent is not a valid class", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_8;
  }
  if (![(NWNetworkAgentRegistration *)self createReadSourceWithRegistrationSocket:v4])
  {
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_35;
  }
  long long buf = 0uLL;
  int v7 = [v6 agentUUID];
  [v7 getUUIDBytes:&buf];

  v25 = (void *)[v6 copyAgentData];
  if (objc_opt_respondsToSelector()) {
    char v24 = [v6 isSpecificUseOnly];
  }
  else {
    char v24 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    char v23 = [v6 isNetworkProvider];
  }
  else {
    char v23 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    char v22 = [v6 isNexusProvider];
  }
  else {
    char v22 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    char v21 = [v6 supportsListenRequests];
  }
  else {
    char v21 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    char v20 = [v6 supportsBrowseRequests];
  }
  else {
    char v20 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    char v18 = [v6 supportsResolveRequests];
  }
  else {
    char v18 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v16 = [v6 requiresAssert];
  }
  else {
    unsigned __int8 v16 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    char v15 = [v6 updateClientsImmediately];
  }
  else {
    char v15 = 0;
  }
  os_log_type_t v10 = [(objc_class *)[(NWNetworkAgentRegistration *)self networkAgentClass] agentDomain];
  uint64_t v11 = [(objc_class *)[(NWNetworkAgentRegistration *)self networkAgentClass] agentType];
  [v6 agentDescription];
  char v17 = v19 = v10;
  int v12 = nw_network_agent_ctl_setsockopt(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 1, (unsigned __int8 *)&buf, (unsigned char *)[v10 UTF8String], (unsigned char *)objc_msgSend(v11, "UTF8String"), objc_msgSend(v17, "UTF8String"), objc_msgSend(v6, "isActive"), objc_msgSend(v6, "isKernelActivated"), objc_msgSend(v6, "isUserActivated"), objc_msgSend(v6, "isVoluntary"), v24, v23, v22, v21, v20, v18, 0, v16, v15,
          (const unsigned __int8 *)[v25 bytes],
          [v25 length]);
  BOOL v9 = v12 >= 0;
  if (v12 < 0)
  {
    close([(NWNetworkAgentRegistration *)self registrationSocket]);
    [(NWNetworkAgentRegistration *)self setRegistrationSocket:0xFFFFFFFFLL];
  }
  else
  {
    [(NWNetworkAgentRegistration *)self setNetworkAgent:v6];
    uint64_t v13 = [v6 agentUUID];
    [(NWNetworkAgentRegistration *)self setRegisteredUUID:v13];
  }
LABEL_35:

  return v9;
}

- (BOOL)createReadSourceWithRegistrationSocket:(int)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t v3 = *(void *)&a3;
    if ([(NWNetworkAgentRegistration *)self isRegisteredInternal])
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v5 = (id)gLogObj;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446210;
        char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
        _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_ERROR, "%{public}s Agent registration is already active", buf, 0xCu);
      }

      return 0;
    }
    uint64_t v11 = [(NWNetworkAgentRegistration *)self queue];
    int v12 = dispatch_source_create(MEMORY[0x1E4F14478], v3, 0, v11);

    BOOL v10 = v12 != 0;
    if (v12)
    {
      [(NWNetworkAgentRegistration *)self setRegistrationSocket:v3];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke;
      handler[3] = &__block_descriptor_36_e5_v8__0l;
      int v31 = v3;
      dispatch_source_set_cancel_handler(v12, handler);
      objc_initWeak((id *)buf, self);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke_2;
      v27[3] = &unk_1E5249F88;
      objc_copyWeak(&v29, (id *)buf);
      uint64_t v13 = v12;
      os_log_type_t v28 = v13;
      dispatch_source_set_event_handler(v13, v27);
      dispatch_resume(v13);
      [(NWNetworkAgentRegistration *)self setReadSource:v13];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
LABEL_30:

      return v10;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v17 = (id)gLogObj;
    *(_DWORD *)long long buf = 136446210;
    char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
    char v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (__nwlog_fault(v18, &type, &v32))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v19 = (id)gLogObj;
        os_log_type_t v20 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)long long buf = 136446210;
          char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          _os_log_impl(&dword_1830D4000, v19, v20, "%{public}s dispatch_source_create failed", buf, 0xCu);
        }
      }
      else if (v32)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v19 = (id)gLogObj;
        os_log_type_t v24 = type;
        BOOL v25 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v25)
          {
            *(_DWORD *)long long buf = 136446466;
            char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
            __int16 v36 = 2082;
            char v37 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v19, v24, "%{public}s dispatch_source_create failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          if (!v18) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        if (v25)
        {
          *(_DWORD *)long long buf = 136446210;
          char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          _os_log_impl(&dword_1830D4000, v19, v24, "%{public}s dispatch_source_create failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v19 = (id)gLogObj;
        os_log_type_t v26 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)long long buf = 136446210;
          char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          _os_log_impl(&dword_1830D4000, v19, v26, "%{public}s dispatch_source_create failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
    if (!v18)
    {
LABEL_29:
      close(v3);
      goto LABEL_30;
    }
LABEL_28:
    free(v18);
    goto LABEL_29;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v6 = (id)gLogObj;
  *(_DWORD *)long long buf = 136446210;
  char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
  int v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v32 = 0;
  if (__nwlog_fault(v7, &type, &v32))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)long long buf = 136446210;
        char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s called with null registrationSocket", buf, 0xCu);
      }
    }
    else if (v32)
    {
      int v14 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      os_log_type_t v15 = type;
      BOOL v16 = os_log_type_enabled(v8, type);
      if (v14)
      {
        if (v16)
        {
          *(_DWORD *)long long buf = 136446466;
          char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          __int16 v36 = 2082;
          char v37 = v14;
          _os_log_impl(&dword_1830D4000, v8, v15, "%{public}s called with null registrationSocket, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v14);
        if (!v7) {
          return 0;
        }
        goto LABEL_12;
      }
      if (v16)
      {
        *(_DWORD *)long long buf = 136446210;
        char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
        _os_log_impl(&dword_1830D4000, v8, v15, "%{public}s called with null registrationSocket, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)long long buf = 136446210;
        char v35 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
        _os_log_impl(&dword_1830D4000, v8, v22, "%{public}s called with null registrationSocket, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
  if (v7) {
LABEL_12:
  }
    free(v7);
  return 0;
}

uint64_t __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (int)dupRegistrationFileDescriptor
{
  if ([(NWNetworkAgentRegistration *)self registrationSocket] < 0) {
    return -1;
  }
  int v3 = [(NWNetworkAgentRegistration *)self registrationSocket];

  return dup(v3);
}

- (BOOL)isRegistered
{
  if ([(NWNetworkAgentRegistration *)self registrationSocket] == -1) {
    return 0;
  }
  int v4 = 0;
  [(NWNetworkAgentRegistration *)self tokenCountWithError:&v4];
  return v4 == 0;
}

- (id)description
{
  id v2 = [(NWNetworkAgentRegistration *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  int v7 = [(objc_class *)[(NWNetworkAgentRegistration *)self networkAgentClass] agentDomain];
  [v6 appendPrettyObject:v7 withName:@"Domain" indent:v4 showFullContent:1];

  v8 = [(objc_class *)[(NWNetworkAgentRegistration *)self networkAgentClass] agentType];
  [v6 appendPrettyObject:v8 withName:@"Type" indent:v4 showFullContent:1];

  os_log_type_t v9 = [(NWNetworkAgentRegistration *)self registeredUUID];
  [v6 appendPrettyObject:v9 withName:@"UUID" indent:v4 showFullContent:1];

  return v6;
}

- (void)dealloc
{
  int v3 = [(NWNetworkAgentRegistration *)self readSource];

  if (v3)
  {
    uint64_t v4 = [(NWNetworkAgentRegistration *)self readSource];
    dispatch_source_cancel(v4);

    [(NWNetworkAgentRegistration *)self setReadSource:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)NWNetworkAgentRegistration;
  [(NWNetworkAgentRegistration *)&v5 dealloc];
}

- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3 queue:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (!a3)
  {
    int v12 = __nwlog_obj();
    *(_DWORD *)long long buf = 136446210;
    v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v30 = 0;
    if (!__nwlog_fault(v13, &type, &v30)) {
      goto LABEL_46;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      int v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)long long buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        BOOL v16 = "%{public}s called with null agentClass";
LABEL_44:
        _os_log_impl(&dword_1830D4000, v14, v15, v16, buf, 0xCu);
      }
    }
    else if (v30)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      int v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      BOOL v24 = os_log_type_enabled(v14, type);
      if (backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)long long buf = 136446466;
          v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
          __int16 v34 = 2082;
          char v35 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s called with null agentClass, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_46:
        if (!v13)
        {
LABEL_48:

          BOOL v10 = 0;
          goto LABEL_5;
        }
LABEL_47:
        free(v13);
        goto LABEL_48;
      }
      if (v24)
      {
        *(_DWORD *)long long buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        BOOL v16 = "%{public}s called with null agentClass, no backtrace";
        goto LABEL_44;
      }
    }
    else
    {
      int v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)long long buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        BOOL v16 = "%{public}s called with null agentClass, backtrace limit exceeded";
        goto LABEL_44;
      }
    }
LABEL_45:

    goto LABEL_46;
  }
  if (!v7)
  {
    id v17 = __nwlog_obj();
    *(_DWORD *)long long buf = 136446210;
    v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v30 = 0;
    if (!__nwlog_fault(v13, &type, &v30)) {
      goto LABEL_46;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      int v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)long long buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        BOOL v16 = "%{public}s called with null queue";
        goto LABEL_44;
      }
    }
    else
    {
      if (v30)
      {
        BOOL v25 = (char *)__nw_create_backtrace_string();
        int v14 = __nwlog_obj();
        os_log_type_t v15 = type;
        BOOL v26 = os_log_type_enabled(v14, type);
        if (v25)
        {
          if (v26)
          {
            *(_DWORD *)long long buf = 136446466;
            v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
            __int16 v34 = 2082;
            char v35 = v25;
            _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s called with null queue, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v25);
          if (!v13) {
            goto LABEL_48;
          }
          goto LABEL_47;
        }
        if (!v26) {
          goto LABEL_45;
        }
        *(_DWORD *)long long buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        BOOL v16 = "%{public}s called with null queue, no backtrace";
        goto LABEL_44;
      }
      int v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)long long buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        BOOL v16 = "%{public}s called with null queue, backtrace limit exceeded";
        goto LABEL_44;
      }
    }
    goto LABEL_45;
  }
  v29.receiver = self;
  v29.super_class = (Class)NWNetworkAgentRegistration;
  os_log_type_t v9 = [(NWNetworkAgentRegistration *)&v29 init];
  if (v9)
  {
    BOOL v10 = v9;
    v9->_networkAgentClass = a3;
    v9->_registrationSocket = -1;
    objc_storeStrong((id *)&v9->_queue, a4);
    goto LABEL_5;
  }
  char v18 = __nwlog_obj();
  *(_DWORD *)long long buf = 136446210;
  v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
  char v19 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v30 = 0;
  if (__nwlog_fault(v19, &type, &v30))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      os_log_type_t v20 = __nwlog_obj();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)long long buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        os_log_type_t v22 = "%{public}s [super init] failed";
LABEL_51:
        _os_log_impl(&dword_1830D4000, v20, v21, v22, buf, 0xCu);
      }
    }
    else
    {
      if (v30)
      {
        uint64_t v27 = (char *)__nw_create_backtrace_string();
        os_log_type_t v20 = __nwlog_obj();
        os_log_type_t v21 = type;
        BOOL v28 = os_log_type_enabled(v20, type);
        if (v27)
        {
          if (v28)
          {
            *(_DWORD *)long long buf = 136446466;
            v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
            __int16 v34 = 2082;
            char v35 = v27;
            _os_log_impl(&dword_1830D4000, v20, v21, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v27);
          goto LABEL_53;
        }
        if (!v28) {
          goto LABEL_52;
        }
        *(_DWORD *)long long buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        os_log_type_t v22 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_51;
      }
      os_log_type_t v20 = __nwlog_obj();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)long long buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        os_log_type_t v22 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_51;
      }
    }
LABEL_52:
  }
LABEL_53:
  if (v19) {
    free(v19);
  }
  BOOL v10 = 0;
LABEL_5:

  return v10;
}

- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NWNetworkAgentRegistration;
  uint64_t v4 = [(NWNetworkAgentRegistration *)&v20 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_networkAgentClass = a3;
    v4->_registrationSocket = -1;
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("NWNetworkAgentRegistration queue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    os_log_type_t v9 = v5;
    goto LABEL_3;
  }
  uint64_t v11 = __nwlog_obj();
  *(_DWORD *)long long buf = 136446210;
  os_log_type_t v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
  int v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (__nwlog_fault(v12, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)long long buf = 136446210;
        os_log_type_t v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
        os_log_type_t v15 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v13, v14, v15, buf, 0xCu);
      }
    }
    else
    {
      if (v18)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        uint64_t v13 = __nwlog_obj();
        os_log_type_t v14 = type;
        BOOL v17 = os_log_type_enabled(v13, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)long long buf = 136446466;
            os_log_type_t v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
            __int16 v23 = 2082;
            BOOL v24 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v17) {
          goto LABEL_18;
        }
        *(_DWORD *)long long buf = 136446210;
        os_log_type_t v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
        os_log_type_t v15 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      uint64_t v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)long long buf = 136446210;
        os_log_type_t v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
        os_log_type_t v15 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v12) {
    free(v12);
  }
LABEL_3:

  return v5;
}

+ (BOOL)useNetworkAgent:(id)a3 returnUseCount:(unint64_t *)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v13[0] = 0;
  v13[1] = 0;
  objc_super v5 = [a3 agentUUID];
  [v5 getUUIDBytes:v13];

  id v6 = (void *)sharedAssertionEvaluator;
  if (!sharedAssertionEvaluator)
  {
    dispatch_queue_t v7 = [[NWPathEvaluator alloc] initWithEndpoint:0 parameters:0];
    v8 = (void *)sharedAssertionEvaluator;
    sharedAssertionEvaluator = (uint64_t)v7;

    id v6 = (void *)sharedAssertionEvaluator;
    if (!sharedAssertionEvaluator) {
      return 0;
    }
  }
  os_log_type_t v9 = [v6 path];
  BOOL v10 = [v9 internalPath];
  char v11 = nw_path_increment_agent_use_count(v10, (const unsigned __int8 *)v13, a4);

  return v11;
}

+ (BOOL)removeActiveAssertionFromNetworkAgent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(void *)v8 = 0;
  uint64_t v9 = 0;
  int v3 = [a3 agentUUID];
  [v3 getUUIDBytes:v8];

  if (!sharedAssertionEvaluator) {
    return 0;
  }
  uint64_t v4 = [(id)sharedAssertionEvaluator path];
  objc_super v5 = [v4 internalPath];
  BOOL v6 = nw_path_agent_action(v5, v8, 132);

  return v6;
}

+ (BOOL)addActiveAssertionToNetworkAgent:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)char v11 = 0;
  uint64_t v12 = 0;
  int v3 = [a3 agentUUID];
  [v3 getUUIDBytes:v11];

  uint64_t v4 = (void *)sharedAssertionEvaluator;
  if (!sharedAssertionEvaluator)
  {
    objc_super v5 = [[NWPathEvaluator alloc] initWithEndpoint:0 parameters:0];
    BOOL v6 = (void *)sharedAssertionEvaluator;
    sharedAssertionEvaluator = (uint64_t)v5;

    uint64_t v4 = (void *)sharedAssertionEvaluator;
    if (!sharedAssertionEvaluator) {
      return 0;
    }
  }
  dispatch_queue_t v7 = [v4 path];
  v8 = [v7 internalPath];
  BOOL v9 = nw_path_agent_action(v8, v11, 131);

  return v9;
}

@end