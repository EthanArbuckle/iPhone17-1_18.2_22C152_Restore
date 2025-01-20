@interface NWRemoteConnectionActor
- (BOOL)receiveRemoteCommand:(id)a3;
- (NSMutableDictionary)browsers;
- (NSMutableDictionary)connections;
- (NWRemoteConnectionActor)initWithDelegate:(id)a3;
- (NWRemoteConnectionActorDelegate)delegate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scheduleReadsOnConnection:(id)a3;
- (void)sendData:(id)a3 forConnection:(id)a4;
- (void)setBrowsers:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateEndpointsForBrowser:(id)a3;
- (void)updatePathForConnection:(id)a3;
@end

@implementation NWRemoteConnectionActor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browsers, 0);
  objc_storeStrong((id *)&self->_connections, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBrowsers:(id)a3
{
}

- (NSMutableDictionary)browsers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnections:(id)a3
{
}

- (NSMutableDictionary)connections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NWRemoteConnectionActorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NWRemoteConnectionActorDelegate *)WeakRetained;
}

- (BOOL)receiveRemoteCommand:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  if (v4)
  {
    v5 = [[NWPBCommandMessage alloc] initWithData:v4];
    v6 = v5;
    if (!v5)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        __int16 v84 = 2114;
        v85 = v4;
        v8 = "%{public}s Could not parse command: %{public}@";
        v9 = v7;
        uint32_t v10 = 22;
LABEL_15:
        _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    if ((*(unsigned char *)&v5->_has & 1) == 0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Command missing command value";
LABEL_14:
        v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if (!v5->_messageData)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Command missing message data";
        goto LABEL_14;
      }
LABEL_16:
      BOOL v11 = 0;
LABEL_17:

      goto LABEL_18;
    }
    switch(v5->_command)
    {
      case 0:
        v7 = __nwlog_obj();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Invalid command sent to connection receiver";
        goto LABEL_14;
      case 1:
        v14 = [NWPBOpenConnection alloc];
        v15 = v6->_messageData;
        v7 = [(NWPBOpenConnection *)v14 initWithData:v15];

        if (!v7)
        {
          v63 = __nwlog_obj();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            goto LABEL_76;
          }
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Open connection message could not be parsed";
          goto LABEL_60;
        }
        id v16 = objc_alloc(MEMORY[0x1E4F29128]);
        v17 = v7[1].isa;
        v18 = (void *)[v16 initWithUUIDString:v17];

        if (v18)
        {
          v19 = v7[2].isa;
          v20 = [(objc_class *)v19 data];
          v21 = +[NWEndpoint endpointWithProtocolBufferData:v20];

          v22 = v7[3].isa;
          v23 = [(objc_class *)v22 data];
          v24 = +[NWParameters parametersWithProtocolBufferData:v23];

          v25 = +[NWConnection connectionWithEndpoint:v21 parameters:v24];
          v26 = objc_alloc_init(NWRemoteConnectionWrapper);
          [(NWRemoteConnectionWrapper *)v26 setClientID:v18];
          [(NWRemoteConnectionWrapper *)v26 setConnection:v25];
          v27 = [(NWRemoteConnectionActor *)self connections];
          [v27 setObject:v26 forKeyedSubscript:v18];

          [v25 addObserver:self forKeyPath:@"connectionState" options:5 context:v26];
          [v25 addObserver:self forKeyPath:@"currentPath" options:5 context:v26];

          goto LABEL_32;
        }
        v65 = __nwlog_obj();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v66 = "%{public}s Open connection missing client ID";
          goto LABEL_74;
        }
        goto LABEL_75;
      case 2:
        v7 = __nwlog_obj();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Update Path command is not valid to send to connection receiver";
        goto LABEL_14;
      case 3:
        v28 = [NWPBCloseConnection alloc];
        v29 = v6->_messageData;
        v7 = [(NWPBCloseConnection *)v28 initWithData:v29];

        if (!v7)
        {
          v63 = __nwlog_obj();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            goto LABEL_76;
          }
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Close connection message could not be parsed";
          goto LABEL_60;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F29128]);
        v31 = v7[1].isa;
        v18 = (void *)[v30 initWithUUIDString:v31];

        if (v18)
        {
          v32 = [(NWRemoteConnectionActor *)self connections];
          v33 = [v32 objectForKeyedSubscript:v18];
          v21 = [v33 connection];

          [v21 removeObserver:self forKeyPath:@"connectionState"];
          [v21 removeObserver:self forKeyPath:@"currentPath"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v21 writeCloseWithCompletionHandler:&__block_literal_global_48332];
          }
          [v21 cancel];
          v34 = [(NWRemoteConnectionActor *)self connections];
          [v34 setObject:0 forKeyedSubscript:v18];

LABEL_32:
          goto LABEL_49;
        }
        v65 = __nwlog_obj();
        if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          goto LABEL_75;
        }
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v66 = "%{public}s Close connection missing client ID";
        goto LABEL_74;
      case 4:
        v35 = [NWPBSendData alloc];
        v36 = v6->_messageData;
        v7 = [(NWPBSendData *)v35 initWithData:v36];

        if (!v7)
        {
          v63 = __nwlog_obj();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            goto LABEL_76;
          }
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Send data message could not be parsed";
          goto LABEL_60;
        }
        id v37 = objc_alloc(MEMORY[0x1E4F29128]);
        v38 = v7[1].isa;
        v39 = (char *)[v37 initWithUUIDString:v38];

        if (v39)
        {
          v40 = [(NWRemoteConnectionActor *)self connections];
          v41 = [v40 objectForKeyedSubscript:v39];
          v42 = [v41 connection];

          BOOL v11 = v42 != 0;
          if (v42)
          {
            v43 = v7[2].isa;
            if (v43)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v42 writeData:v43 completionHandler:&__block_literal_global_55_48337];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v81 = v43;
                  v69 = (void *)MEMORY[0x1E4F1C978];
                  v70 = v42;
                  v71 = [v69 arrayWithObjects:&v81 count:1];
                  [v70 writeDatagrams:v71 completionHandler:&__block_literal_global_58];
                }
              }
            }
          }
          else
          {
            v43 = __nwlog_obj();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
              __int16 v84 = 2114;
              v85 = v39;
              _os_log_impl(&dword_1830D4000, v43, OS_LOG_TYPE_ERROR, "%{public}s Send data could not find connection for %{public}@", buf, 0x16u);
            }
          }
          goto LABEL_86;
        }
        v42 = __nwlog_obj();
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_77;
        }
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v67 = "%{public}s Send data missing client ID";
        goto LABEL_71;
      case 5:
        v44 = [NWPBStartBrowse alloc];
        v45 = v6->_messageData;
        v7 = [(NWPBStartBrowse *)v44 initWithData:v45];

        if (!v7)
        {
          v63 = __nwlog_obj();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            goto LABEL_76;
          }
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Start browse message could not be parsed";
LABEL_60:
          _os_log_impl(&dword_1830D4000, v63, OS_LOG_TYPE_ERROR, v64, buf, 0xCu);
LABEL_76:
          BOOL v11 = 0;

          goto LABEL_17;
        }
        id v46 = objc_alloc(MEMORY[0x1E4F29128]);
        v47 = v7[1].isa;
        v39 = (char *)[v46 initWithUUIDString:v47];

        if (!v39)
        {
          v42 = __nwlog_obj();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
            v67 = "%{public}s Start browse missing client ID";
LABEL_71:
            _os_log_impl(&dword_1830D4000, v42, OS_LOG_TYPE_ERROR, v67, buf, 0xCu);
            BOOL v11 = 0;
          }
          else
          {
LABEL_77:
            BOOL v11 = 0;
          }
          goto LABEL_87;
        }
        v48 = v7[2].isa;
        v49 = [(objc_class *)v48 data];
        v42 = +[NWBrowseDescriptor descriptorWithProtocolBufferData:v49];

        if (v42)
        {
          v50 = v7[3].isa;
          v51 = [(objc_class *)v50 data];
          v43 = +[NWParameters parametersWithProtocolBufferData:v51];

          if (v43)
          {
            v52 = [[NWBrowser alloc] initWithDescriptor:v42 parameters:v43];
            v53 = objc_alloc_init(NWRemoteBrowserWrapper);
            [(NWRemoteBrowserWrapper *)v53 setClientID:v39];
            [(NWRemoteBrowserWrapper *)v53 setBrowser:v52];
            v54 = [(NWRemoteConnectionActor *)self browsers];
            [v54 setObject:v53 forKeyedSubscript:v39];

            [(NWBrowser *)v52 addObserver:self forKeyPath:@"discoveredEndpoints" options:5 context:v53];
            BOOL v11 = 1;
LABEL_86:

LABEL_87:
            goto LABEL_17;
          }
          v68 = __nwlog_obj();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
            _os_log_impl(&dword_1830D4000, v68, OS_LOG_TYPE_ERROR, "%{public}s Start browse missing parameters", buf, 0xCu);
          }

          v43 = 0;
        }
        else
        {
          v43 = __nwlog_obj();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
            _os_log_impl(&dword_1830D4000, v43, OS_LOG_TYPE_ERROR, "%{public}s Start browse missing descriptor", buf, 0xCu);
          }
        }
        BOOL v11 = 0;
        goto LABEL_86;
      case 6:
        v7 = __nwlog_obj();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Update Browse command is not valid to send to connection receiver";
        goto LABEL_14;
      case 7:
        v55 = [NWPBStopBrowse alloc];
        v56 = v6->_messageData;
        v7 = [(NWPBStopBrowse *)v55 initWithData:v56];

        if (!v7)
        {
          v63 = __nwlog_obj();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            goto LABEL_76;
          }
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v64 = "%{public}s Stop browse message could not be parsed";
          goto LABEL_60;
        }
        id v57 = objc_alloc(MEMORY[0x1E4F29128]);
        v58 = v7[1].isa;
        v18 = (void *)[v57 initWithUUIDString:v58];

        if (v18)
        {
          v59 = [(NWRemoteConnectionActor *)self browsers];
          v60 = [v59 objectForKeyedSubscript:v18];
          v61 = [v60 browser];

          [v61 removeObserver:self forKeyPath:@"discoveredEndpoints"];
          [v61 cancel];
          v62 = [(NWRemoteConnectionActor *)self browsers];
          [v62 setObject:0 forKeyedSubscript:v18];

LABEL_49:
          BOOL v11 = 1;

          goto LABEL_17;
        }
        v65 = __nwlog_obj();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
          v66 = "%{public}s Stop browse missing client ID";
LABEL_74:
          _os_log_impl(&dword_1830D4000, v65, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);
        }
LABEL_75:

        v63 = 0;
        goto LABEL_76;
      default:
        v7 = __nwlog_obj();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        if (*(unsigned char *)&v6->_has) {
          int command = v6->_command;
        }
        else {
          int command = 0;
        }
        *(_DWORD *)buf = 136446466;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        __int16 v84 = 1024;
        LODWORD(v85) = command;
        v8 = "%{public}s Unknown command %u sent to connection receiver";
        v9 = v7;
        uint32_t v10 = 18;
        goto LABEL_15;
    }
  }
  v72 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
  v73 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v79 = 0;
  if (__nwlog_fault(v73, &type, &v79))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v74 = __nwlog_obj();
      os_log_type_t v75 = type;
      if (os_log_type_enabled(v74, type))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v76 = "%{public}s called with null commandData";
LABEL_103:
        _os_log_impl(&dword_1830D4000, v74, v75, v76, buf, 0xCu);
      }
    }
    else
    {
      if (v79)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v74 = __nwlog_obj();
        os_log_type_t v75 = type;
        BOOL v78 = os_log_type_enabled(v74, type);
        if (backtrace_string)
        {
          if (v78)
          {
            *(_DWORD *)buf = 136446466;
            v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
            __int16 v84 = 2082;
            v85 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v74, v75, "%{public}s called with null commandData, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_105;
        }
        if (!v78) {
          goto LABEL_104;
        }
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v76 = "%{public}s called with null commandData, no backtrace";
        goto LABEL_103;
      }
      v74 = __nwlog_obj();
      os_log_type_t v75 = type;
      if (os_log_type_enabled(v74, type))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v76 = "%{public}s called with null commandData, backtrace limit exceeded";
        goto LABEL_103;
      }
    }
LABEL_104:
  }
LABEL_105:
  if (v73) {
    free(v73);
  }
  BOOL v11 = 0;
LABEL_18:

  return v11;
}

void __48__NWRemoteConnectionActor_receiveRemoteCommand___block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446466;
      v5 = "-[NWRemoteConnectionActor receiveRemoteCommand:]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_ERROR, "%{public}s Write had error %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void __48__NWRemoteConnectionActor_receiveRemoteCommand___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446466;
      v5 = "-[NWRemoteConnectionActor receiveRemoteCommand:]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_ERROR, "%{public}s Write had error %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void __48__NWRemoteConnectionActor_receiveRemoteCommand___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446466;
      v5 = "-[NWRemoteConnectionActor receiveRemoteCommand:]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_ERROR, "%{public}s Write close had error %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 isEqualToString:@"connectionState"])
  {
    id v11 = v10;
    v12 = a6;
    id v13 = [v12 connection];

    if (v13 != v11)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        v15 = [v12 connection];
        int v21 = 136446722;
        v22 = "-[NWRemoteConnectionActor observeValueForKeyPath:ofObject:change:context:]";
        __int16 v23 = 2048;
        v24 = v15;
        __int16 v25 = 2048;
        id v26 = v11;
        id v16 = "%{public}s Connection wrapper invalid: %p != %p";
LABEL_13:
        _os_log_impl(&dword_1830D4000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, 0x20u);
      }
LABEL_14:

LABEL_18:
      goto LABEL_19;
    }
    if ([v11 connectionState] == 3) {
      [(NWRemoteConnectionActor *)self scheduleReadsOnConnection:v12];
    }
    goto LABEL_17;
  }
  if ([v9 isEqualToString:@"currentPath"])
  {
    id v11 = v10;
    v12 = a6;
    id v17 = [v12 connection];

    if (v17 != v11)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
LABEL_17:
    [(NWRemoteConnectionActor *)self updatePathForConnection:v12];
    goto LABEL_18;
  }
  if ([v9 isEqualToString:@"discoveredEndpoints"])
  {
    id v18 = v10;
    v19 = a6;
    id v20 = [v19 browser];

    if (v20 == v18)
    {
      [(NWRemoteConnectionActor *)self updateEndpointsForBrowser:v19];
      goto LABEL_18;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v15 = [v19 browser];
    int v21 = 136446722;
    v22 = "-[NWRemoteConnectionActor observeValueForKeyPath:ofObject:change:context:]";
    __int16 v23 = 2048;
    v24 = v15;
    __int16 v25 = 2048;
    id v26 = v18;
    id v16 = "%{public}s Browser wrapper invalid: %p != %p";
    goto LABEL_13;
  }
LABEL_19:
}

- (void)scheduleReadsOnConnection:(id)a3
{
  id v4 = a3;
  v5 = [v4 connection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [v4 connection];
  if (isKindOfClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke;
    v12[3] = &unk_1E5242988;
    v12[4] = self;
    uint64_t v8 = &v13;
    id v13 = v4;
    [v7 readDataWithMinimumLength:1 maximumLength:0x100000 completionHandler:v12];
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    id v7 = [v4 connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke_36;
    v10[3] = &unk_1E52429B0;
    v10[4] = self;
    uint64_t v8 = &v11;
    id v11 = v4;
    [v7 readDatagramsWithMinimumCount:1 maximumCount:1 completionHandler:v10];
    goto LABEL_5;
  }
LABEL_6:
}

void __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    [*(id *)(a1 + 32) sendData:v5 forConnection:*(void *)(a1 + 40)];
  }
  if (v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136446466;
      id v10 = "-[NWRemoteConnectionActor scheduleReadsOnConnection:]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_DEBUG, "%{public}s Read length had error %{public}@", (uint8_t *)&v9, 0x16u);
    }

    uint64_t v8 = [*(id *)(a1 + 40) connection];
    [v8 cancel];
  }
  else
  {
    [*(id *)(a1 + 32) scheduleReadsOnConnection:*(void *)(a1 + 40)];
  }
}

void __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) sendData:*(void *)(*((void *)&v13 + 1) + 8 * v10++) forConnection:*(void *)(a1 + 40)];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v8);
  }
  if (v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int16 v11 = (id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v18 = "-[NWRemoteConnectionActor scheduleReadsOnConnection:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_1830D4000, v11, OS_LOG_TYPE_DEBUG, "%{public}s Read had error %{public}@", buf, 0x16u);
    }

    id v12 = [*(id *)(a1 + 40) connection];
    [v12 cancel];
  }
  else
  {
    [*(id *)(a1 + 32) scheduleReadsOnConnection:*(void *)(a1 + 40)];
  }
}

- (void)updateEndpointsForBrowser:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 browser];
    uint64_t v7 = [v6 discoveredEndpoints];

    uint64_t v8 = objc_alloc_init(NWPBUpdateBrowse);
    uint64_t v9 = [v5 clientID];
    uint64_t v10 = [v9 UUIDString];
    if (v8) {
      objc_storeStrong((id *)&v8->_clientUUID, v10);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (id)[*(id *)(*((void *)&v37 + 1) + 8 * i) createProtocolBufferObject];
          if (v8)
          {
            discoveredEndpoints = v8->_discoveredEndpoints;
            if (!discoveredEndpoints)
            {
              id v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              __int16 v19 = v8->_discoveredEndpoints;
              v8->_discoveredEndpoints = v18;

              discoveredEndpoints = v8->_discoveredEndpoints;
            }
            [(NSMutableArray *)discoveredEndpoints addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v48 count:16];
      }
      while (v13);
    }

    id v20 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v20->super.super.isa;
    if (v20)
    {
      *(unsigned char *)&v20->_has |= 1u;
      v20->_int command = 6;
      uint64_t v22 = [(NWPBUpdateBrowse *)v8 data];
      objc_storeStrong(p_isa + 2, v22);
    }
    else
    {
      uint64_t v22 = [(NWPBUpdateBrowse *)v8 data];
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int16 v23 = (id)gLogObj;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      int v24 = [v11 count];
      __int16 v25 = [v5 clientID];
      id v26 = [v25 UUIDString];
      *(_DWORD *)buf = 136446722;
      v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
      __int16 v46 = 1024;
      LODWORD(v47[0]) = v24;
      WORD2(v47[0]) = 2114;
      *(void *)((char *)v47 + 6) = v26;
      _os_log_impl(&dword_1830D4000, v23, OS_LOG_TYPE_DEBUG, "%{public}s Updating browse results (%u) for %{public}@", buf, 0x1Cu);
    }
    uint64_t v27 = [(NWRemoteConnectionActor *)self delegate];
    v28 = [p_isa data];
    v43 = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    [v27 sendRemoteReplies:v29];

    goto LABEL_20;
  }
  id v30 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
  v31 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v41 = 0;
  if (__nwlog_fault(v31, &type, &v41))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v32 = __nwlog_obj();
      os_log_type_t v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
        v34 = "%{public}s called with null wrapper";
LABEL_34:
        _os_log_impl(&dword_1830D4000, v32, v33, v34, buf, 0xCu);
      }
    }
    else
    {
      if (v41)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v32 = __nwlog_obj();
        os_log_type_t v33 = type;
        BOOL v36 = os_log_type_enabled(v32, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
            __int16 v46 = 2082;
            v47[0] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v32, v33, "%{public}s called with null wrapper, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_36;
        }
        if (!v36) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
        v34 = "%{public}s called with null wrapper, no backtrace";
        goto LABEL_34;
      }
      v32 = __nwlog_obj();
      os_log_type_t v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
        v34 = "%{public}s called with null wrapper, backtrace limit exceeded";
        goto LABEL_34;
      }
    }
LABEL_35:
  }
LABEL_36:
  if (v31) {
    free(v31);
  }
LABEL_20:
}

- (void)sendData:(id)a3 forConnection:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    id v20 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
    int v21 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v30 = 0;
    if (!__nwlog_fault(v21, &type, &v30)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v22 = __nwlog_obj();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
        int v24 = "%{public}s called with null data";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v22, v23, v24, buf, 0xCu);
      }
    }
    else if (v30)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      uint64_t v22 = __nwlog_obj();
      os_log_type_t v23 = type;
      BOOL v27 = os_log_type_enabled(v22, type);
      if (backtrace_string)
      {
        if (v27)
        {
          *(_DWORD *)buf = 136446466;
          v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
          __int16 v35 = 2082;
          BOOL v36 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s called with null data, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_38:
        if (!v21) {
          goto LABEL_8;
        }
LABEL_39:
        free(v21);
        goto LABEL_8;
      }
      if (v27)
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
        int v24 = "%{public}s called with null data, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v22 = __nwlog_obj();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
        int v24 = "%{public}s called with null data, backtrace limit exceeded";
        goto LABEL_36;
      }
    }
LABEL_37:

    goto LABEL_38;
  }
  if (v7)
  {
    uint64_t v9 = objc_alloc_init(NWPBSendData);
    messageData = [v8 clientID];
    id v11 = [messageData UUIDString];
    uint64_t v12 = v11;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_clientUUID, v11);

      uint64_t v13 = (NSData *)v6;
      messageData = v9->_messageData;
      v9->_messageData = v13;
    }
    else
    {
    }
    uint64_t v14 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v14->super.super.isa;
    if (v14)
    {
      *(unsigned char *)&v14->_has |= 1u;
      v14->_int command = 4;
      id v16 = [(NWPBSendData *)v9 data];
      objc_storeStrong(p_isa + 2, v16);
    }
    else
    {
      id v16 = [(NWPBSendData *)v9 data];
    }

    id v17 = [(NWRemoteConnectionActor *)self delegate];
    id v18 = [p_isa data];
    v32 = v18;
    __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v17 sendRemoteReplies:v19];

    goto LABEL_8;
  }
  __int16 v25 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
  int v21 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v30 = 0;
  if (!__nwlog_fault(v21, &type, &v30)) {
    goto LABEL_38;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    uint64_t v22 = __nwlog_obj();
    os_log_type_t v23 = type;
    if (os_log_type_enabled(v22, type))
    {
      *(_DWORD *)buf = 136446210;
      v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
      int v24 = "%{public}s called with null wrapper";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  if (!v30)
  {
    uint64_t v22 = __nwlog_obj();
    os_log_type_t v23 = type;
    if (os_log_type_enabled(v22, type))
    {
      *(_DWORD *)buf = 136446210;
      v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
      int v24 = "%{public}s called with null wrapper, backtrace limit exceeded";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  v28 = (char *)__nw_create_backtrace_string();
  uint64_t v22 = __nwlog_obj();
  os_log_type_t v23 = type;
  BOOL v29 = os_log_type_enabled(v22, type);
  if (!v28)
  {
    if (v29)
    {
      *(_DWORD *)buf = 136446210;
      v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
      int v24 = "%{public}s called with null wrapper, no backtrace";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  if (v29)
  {
    *(_DWORD *)buf = 136446466;
    v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
    __int16 v35 = 2082;
    BOOL v36 = v28;
    _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s called with null wrapper, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v28);
  if (v21) {
    goto LABEL_39;
  }
LABEL_8:
}

- (void)updatePathForConnection:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 connection];
    uint64_t v7 = [v6 connectionState];

    if (v7 == 2)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v8 = (id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        long long v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEBUG, "%{public}s Skipping update path for connection in preparing state", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = [v5 connection];
      uint64_t v8 = [v9 currentPath];

      if (v8)
      {
        uint64_t v10 = [v8 createProtocolBufferObject];
        id v11 = [v5 clientID];
        uint64_t v12 = [v11 UUIDString];
        if (v10) {
          objc_storeStrong((id *)&v10[2].isa, v12);
        }

        uint64_t v13 = [v5 connection];
        uint64_t v14 = [v13 connectionState];

        if (v14 != 3 && v10)
        {
          LOBYTE(v10[8].isa) |= 1u;
          LODWORD(v10[7].isa) = 2;
        }
        long long v15 = objc_alloc_init(NWPBUpdatePath);
        id v16 = v15;
        if (v15) {
          objc_storeStrong((id *)&v15->_responsePath, v10);
        }
        id v17 = objc_alloc_init(NWPBCommandMessage);
        p_Class isa = (id *)&v17->super.super.isa;
        if (v17)
        {
          *(unsigned char *)&v17->_has |= 1u;
          v17->_int command = 2;
          __int16 v19 = [(NWPBUpdatePath *)v16 data];
          objc_storeStrong(p_isa + 2, v19);
        }
        else
        {
          __int16 v19 = [(NWPBUpdatePath *)v16 data];
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v20 = (id)gLogObj;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          if (v10)
          {
            if ((uint64_t)v10[8].isa) {
              uint64_t isa_low = SLODWORD(v10[7].isa);
            }
            else {
              uint64_t isa_low = 0;
            }
            os_log_type_t v23 = +[NWPath createStringFromStatus:isa_low];
            Class isa = v10[2].isa;
          }
          else
          {
            os_log_type_t v23 = +[NWPath createStringFromStatus:0];
            Class isa = 0;
          }
          __int16 v25 = isa;
          *(_DWORD *)buf = 136446722;
          long long v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
          __int16 v41 = 2114;
          v42 = v23;
          __int16 v43 = 2114;
          v44 = v25;
          _os_log_impl(&dword_1830D4000, v20, OS_LOG_TYPE_DEBUG, "%{public}s Updating path (%{public}@) for %{public}@", buf, 0x20u);
        }
        id v26 = [(NWRemoteConnectionActor *)self delegate];
        BOOL v27 = [p_isa data];
        long long v38 = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        [v26 sendRemoteReplies:v28];
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v10 = (id)gLogObj;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v22 = [v5 connection];
          *(_DWORD *)buf = 136446466;
          long long v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
          __int16 v41 = 2114;
          v42 = v22;
          _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_DEBUG, "%{public}s No path for %{public}@", buf, 0x16u);
        }
      }
    }
    goto LABEL_27;
  }
  BOOL v29 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  long long v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
  char v30 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v36 = 0;
  if (__nwlog_fault(v30, &type, &v36))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v31 = __nwlog_obj();
      os_log_type_t v32 = type;
      if (os_log_type_enabled(v31, type))
      {
        *(_DWORD *)buf = 136446210;
        long long v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        os_log_type_t v33 = "%{public}s called with null wrapper";
LABEL_41:
        _os_log_impl(&dword_1830D4000, v31, v32, v33, buf, 0xCu);
      }
    }
    else
    {
      if (v36)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v31 = __nwlog_obj();
        os_log_type_t v32 = type;
        BOOL v35 = os_log_type_enabled(v31, type);
        if (backtrace_string)
        {
          if (v35)
          {
            *(_DWORD *)buf = 136446466;
            long long v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
            __int16 v41 = 2082;
            v42 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v31, v32, "%{public}s called with null wrapper, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_43;
        }
        if (!v35) {
          goto LABEL_42;
        }
        *(_DWORD *)buf = 136446210;
        long long v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        os_log_type_t v33 = "%{public}s called with null wrapper, no backtrace";
        goto LABEL_41;
      }
      v31 = __nwlog_obj();
      os_log_type_t v32 = type;
      if (os_log_type_enabled(v31, type))
      {
        *(_DWORD *)buf = 136446210;
        long long v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        os_log_type_t v33 = "%{public}s called with null wrapper, backtrace limit exceeded";
        goto LABEL_41;
      }
    }
LABEL_42:
  }
LABEL_43:
  if (v30) {
    free(v30);
  }
LABEL_27:
}

- (NWRemoteConnectionActor)initWithDelegate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v26.receiver = self;
    v26.super_class = (Class)NWRemoteConnectionActor;
    id v5 = [(NWRemoteConnectionActor *)&v26 init];
    if (v5)
    {
      id v6 = v5;
      objc_storeWeak((id *)&v5->_delegate, v4);
      uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      connections = v6->_connections;
      v6->_connections = v7;

      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      browsers = v6->_browsers;
      v6->_browsers = v9;

      goto LABEL_4;
    }
    id v17 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
    id v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (!__nwlog_fault(v18, &type, &v27)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      __int16 v19 = __nwlog_obj();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        int v21 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v19, v20, v21, buf, 0xCu);
      }
    }
    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __int16 v19 = __nwlog_obj();
      os_log_type_t v20 = type;
      BOOL v25 = os_log_type_enabled(v19, type);
      if (backtrace_string)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136446466;
          char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
          __int16 v31 = 2082;
          os_log_type_t v32 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v19, v20, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v25)
      {
        *(_DWORD *)buf = 136446210;
        char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        int v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      __int16 v19 = __nwlog_obj();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        int v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v18) {
      free(v18);
    }
    id v6 = 0;
    goto LABEL_4;
  }
  uint64_t v12 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
  uint64_t v13 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v27 = 0;
  if (__nwlog_fault(v13, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        id v16 = "%{public}s called with null delegate";
LABEL_29:
        _os_log_impl(&dword_1830D4000, v14, v15, v16, buf, 0xCu);
      }
    }
    else
    {
      if (v27)
      {
        uint64_t v22 = (char *)__nw_create_backtrace_string();
        uint64_t v14 = __nwlog_obj();
        os_log_type_t v15 = type;
        BOOL v23 = os_log_type_enabled(v14, type);
        if (v22)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
            __int16 v31 = 2082;
            os_log_type_t v32 = v22;
            _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s called with null delegate, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v22);
          goto LABEL_31;
        }
        if (!v23) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        id v16 = "%{public}s called with null delegate, no backtrace";
        goto LABEL_29;
      }
      uint64_t v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        char v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        id v16 = "%{public}s called with null delegate, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:
  }
LABEL_31:
  if (v13) {
    free(v13);
  }

  id v6 = 0;
LABEL_4:

  return v6;
}

@end