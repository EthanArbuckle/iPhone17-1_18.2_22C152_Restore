@interface NWRemoteConnectionDirector
- (BOOL)receiveRemoteReply:(id)a3;
- (NSMutableArray)writeRequests;
- (NWRemoteConnectionDirector)initWithDelegate:(id)a3;
- (NWRemoteConnectionDirectorDelegate)delegate;
- (id)createCloseConnectionMessageForClientID:(id)a3;
- (id)createOpenConnectionMessageForClientID:(id)a3 endpoint:(id)a4 parameters:(id)a5;
- (id)createSendDataMessageForClientID:(id)a3 data:(id)a4 receiveWindow:(unsigned int)a5;
- (id)createStartBrowseMessageForClientID:(id)a3 descriptor:(id)a4 parameters:(id)a5;
- (id)createStopBrowseMessageForClientID:(id)a3;
- (nw_hash_table)protocolHashTable;
- (nw_protocol)defaultOutputHandler;
- (nw_protocol)directorProtocol;
- (nw_protocol)outputHandlerForFlowID:(id)a3;
- (unint64_t)dataModeForFlowID:(id)a3;
- (unint64_t)maximumDataChunkSize;
- (void)dealloc;
- (void)receiveData:(id)a3 forClient:(id)a4;
- (void)setDefaultOutputHandler:(nw_protocol *)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectorProtocol:(nw_protocol *)a3;
- (void)setMaximumDataChunkSize:(unint64_t)a3;
- (void)setOutputProtocolHandler:(nw_protocol *)a3 forFlowID:(id)a4 dataMode:(unint64_t)a5;
- (void)setProtocolHashTable:(nw_hash_table *)a3;
- (void)setWriteRequests:(id)a3;
@end

@implementation NWRemoteConnectionDirector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeRequests, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setWriteRequests:(id)a3
{
}

- (NSMutableArray)writeRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProtocolHashTable:(nw_hash_table *)a3
{
  self->_protocolHashTable = a3;
}

- (nw_hash_table)protocolHashTable
{
  return self->_protocolHashTable;
}

- (void)setDefaultOutputHandler:(nw_protocol *)a3
{
  self->_defaultOutputHandler = a3;
}

- (nw_protocol)defaultOutputHandler
{
  return self->_defaultOutputHandler;
}

- (void)setDirectorProtocol:(nw_protocol *)a3
{
  self->_directorProtocol = a3;
}

- (nw_protocol)directorProtocol
{
  return self->_directorProtocol;
}

- (void)setDelegate:(id)a3
{
}

- (NWRemoteConnectionDirectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NWRemoteConnectionDirectorDelegate *)WeakRetained;
}

- (void)setMaximumDataChunkSize:(unint64_t)a3
{
  self->_maximumDataChunkSize = a3;
}

- (unint64_t)maximumDataChunkSize
{
  return self->_maximumDataChunkSize;
}

- (void)receiveData:(id)a3 forClient:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NWRemoteConnectionDirector *)self outputHandlerForFlowID:v7];
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    v10 = self;
    objc_sync_enter(v10);
    while (1)
    {
      v11 = [(NWRemoteConnectionDirector *)v10 writeRequests];
      uint64_t v12 = [v11 count];

      if (!v12) {
        break;
      }
      v13 = [(NWRemoteConnectionDirector *)v10 writeRequests];
      v14 = [v13 firstObject];

      if (!nw_remote_director_write_request((uint64_t)[(NWRemoteConnectionDirector *)v10 directorProtocol], v9, v14))
      {

        break;
      }
      v15 = [(NWRemoteConnectionDirector *)v10 writeRequests];
      [v15 removeObjectAtIndex:0];
    }
    v17 = [[NWRemoteConnectionWriteRequest alloc] initWithData:v6 clientID:v7];
    if (v12
      || !nw_remote_director_write_request((uint64_t)[(NWRemoteConnectionDirector *)v10 directorProtocol], v9, v17))
    {
      v18 = [(NWRemoteConnectionDirector *)v10 writeRequests];
      [v18 addObject:v17];
    }
    objc_sync_exit(v10);
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446466;
      v20 = "-[NWRemoteConnectionDirector receiveData:forClient:]";
      __int16 v21 = 2114;
      uint64_t v22 = 0;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_ERROR, "%{public}s No client protocol found for %{public}@, dropping data", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)setOutputProtocolHandler:(nw_protocol *)a3 forFlowID:(id)a4 dataMode:(unint64_t)a5
{
  int v5 = a5;
  v12[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [(NWRemoteConnectionDirector *)self protocolHashTable];
  v12[0] = 0;
  v12[1] = 0;
  [v8 getUUIDBytes:v12];

  BOOL node = nw_hash_table_get_node((uint64_t)v9, (uint64_t)v12, 16);
  if (node) {
    nw_hash_table_remove_node((uint64_t)v9, node);
  }
  if (a3)
  {
    uint64_t v11 = nw_hash_table_add_object((uint64_t)v9, (uint64_t)a3, 0);
    if (v11) {
      *(_DWORD *)(v11 + 32) = v5;
    }
  }
}

- (nw_protocol)outputHandlerForFlowID:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (nw_hash_table_count((uint64_t)-[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable"))&& (v8[0] = 0, v8[1] = 0, [v4 getUUIDBytes:v8], (uint64_t node = nw_hash_table_get_node((uint64_t)-[NWRemoteConnectionDirector protocolHashTable](self, "protocolHashTable"), (uint64_t)v8, 16)) != 0))
  {
    id v6 = *(nw_protocol **)(node + 16);
  }
  else
  {
    id v6 = [(NWRemoteConnectionDirector *)self defaultOutputHandler];
  }

  return v6;
}

- (unint64_t)dataModeForFlowID:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (nw_hash_table_count((uint64_t)[(NWRemoteConnectionDirector *)self protocolHashTable]))
  {
    v8[0] = 0;
    v8[1] = 0;
    [v4 getUUIDBytes:v8];
    uint64_t node = nw_hash_table_get_node((uint64_t)[(NWRemoteConnectionDirector *)self protocolHashTable], (uint64_t)v8, 16);
    if (node) {
      unint64_t v6 = *(unsigned int *)(node + 32);
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (BOOL)receiveRemoteReply:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if (v4)
  {
    int v5 = [[NWPBCommandMessage alloc] initWithData:v4];
    unint64_t v6 = v5;
    if (!v5)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        __int16 v74 = 2114;
        v75 = v4;
        id v8 = "%{public}s Could not parse reply: %{public}@";
        uint64_t v9 = v7;
        uint32_t v10 = 22;
LABEL_19:
        _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if ((*(unsigned char *)&v5->_has & 1) == 0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        id v8 = "%{public}s Reply missing command value";
LABEL_18:
        uint64_t v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (!v5->_messageData)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (id)gLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        id v8 = "%{public}s Reply missing message data";
        goto LABEL_18;
      }
LABEL_20:
      BOOL v15 = 0;
      goto LABEL_21;
    }
    id v7 = [(NWRemoteConnectionDirector *)self delegate];
    if ((*(unsigned char *)&v6->_has & 1) == 0)
    {
LABEL_10:
      uint64_t v11 = __nwlog_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        uint64_t v12 = "%{public}s Invalid command sent to connection receiver";
LABEL_12:
        v13 = v11;
        uint32_t v14 = 12;
LABEL_13:
        _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      }
LABEL_14:
      BOOL v15 = 0;
      goto LABEL_15;
    }
    switch(v6->_command)
    {
      case 0:
        goto LABEL_10;
      case 1:
        uint64_t v11 = __nwlog_obj();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        uint64_t v12 = "%{public}s Open connection command is not valid to send to connection director";
        goto LABEL_12;
      case 2:
        v18 = [NWPBUpdatePath alloc];
        int v19 = v6->_messageData;
        uint64_t v11 = [(NWPBUpdatePath *)v18 initWithData:v19];

        if (v11)
        {
          v20 = v11[1].isa;

          if (v20)
          {
            __int16 v21 = v11;
            uint64_t v22 = v7;
            uint64_t v23 = v21;
            v24 = v21[1].isa;
            v25 = [(objc_class *)v24 data];
            v26 = +[NWPath pathWithProtocolBufferData:v25];

            BOOL v15 = v26 != 0;
            if (v26)
            {
              id v7 = v22;
              if ([v26 status] == 1)
              {
                v27 = __nwlog_obj();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  v28 = [v26 clientID];
                  *(_DWORD *)buf = 136446466;
                  v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
                  __int16 v74 = 2114;
                  v75 = v28;
                  _os_log_impl(&dword_1830D4000, v27, OS_LOG_TYPE_DEBUG, "%{public}s Updated path is satisfied, opening %{public}@", buf, 0x16u);

                  id v7 = v22;
                }

                v29 = [v26 clientID];
                [v7 openClient:v29];
              }
              else
              {
                if ([v26 status] != 2)
                {
                  BOOL v15 = 1;
                  uint64_t v11 = v23;

LABEL_15:
LABEL_21:

                  goto LABEL_22;
                }
                v53 = __nwlog_obj();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  v54 = [v26 clientID];
                  *(_DWORD *)buf = 136446466;
                  v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
                  __int16 v74 = 2114;
                  v75 = v54;
                  _os_log_impl(&dword_1830D4000, v53, OS_LOG_TYPE_DEBUG, "%{public}s Updated path is unsatisfied, closing %{public}@", buf, 0x16u);

                  id v7 = v22;
                }

                v29 = [v26 clientID];
                [v7 closeClient:v29];
              }
            }
            else
            {
              v29 = __nwlog_obj();
              id v7 = v22;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446210;
                v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
                _os_log_impl(&dword_1830D4000, v29, OS_LOG_TYPE_ERROR, "%{public}s Update path could not parse path", buf, 0xCu);
              }
            }
            uint64_t v11 = v23;

            goto LABEL_15;
          }
          v49 = __nwlog_obj();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            goto LABEL_70;
          }
          *(_DWORD *)buf = 136446210;
          v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
          v50 = "%{public}s Update path message missing path";
        }
        else
        {
          v49 = __nwlog_obj();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            goto LABEL_70;
          }
          *(_DWORD *)buf = 136446210;
          v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
          v50 = "%{public}s Update path message could not be parsed";
        }
LABEL_66:
        _os_log_impl(&dword_1830D4000, v49, OS_LOG_TYPE_ERROR, v50, buf, 0xCu);
LABEL_70:
        BOOL v15 = 0;

        goto LABEL_15;
      case 3:
        uint64_t v11 = __nwlog_obj();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        uint64_t v12 = "%{public}s Close connection command is not valid to send to connection director";
        goto LABEL_12;
      case 4:
        v30 = [NWPBSendData alloc];
        v31 = v6->_messageData;
        uint64_t v11 = [(NWPBSendData *)v30 initWithData:v31];

        if (v11)
        {
          id v32 = objc_alloc(MEMORY[0x1E4F29128]);
          v33 = v11[1].isa;
          v34 = (void *)[v32 initWithUUIDString:v33];

          if (v34)
          {
            v35 = v11[2].isa;
            [(NWRemoteConnectionDirector *)self receiveData:v35 forClient:v34];

            BOOL v15 = 1;
            goto LABEL_15;
          }
          v52 = __nwlog_obj();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
            _os_log_impl(&dword_1830D4000, v52, OS_LOG_TYPE_ERROR, "%{public}s Send data missing client ID", buf, 0xCu);
          }

          v49 = 0;
          goto LABEL_70;
        }
        v49 = __nwlog_obj();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          goto LABEL_70;
        }
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v50 = "%{public}s Send data message could not be parsed";
        goto LABEL_66;
      case 5:
        uint64_t v11 = __nwlog_obj();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        uint64_t v12 = "%{public}s Open connection command is not valid to send to connection director";
        goto LABEL_12;
      case 6:
        v36 = [NWPBUpdateBrowse alloc];
        v37 = v6->_messageData;
        uint64_t v11 = [(NWPBUpdateBrowse *)v36 initWithData:v37];

        if (v11)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F29128]);
          v39 = v11[1].isa;
          v40 = (void *)[v38 initWithUUIDString:v39];

          BOOL v15 = v40 != 0;
          if (v40)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              BOOL v15 = 1;

              goto LABEL_15;
            }
            v62 = v40;
            v63 = v7;
            v64 = v4;
            v41 = [MEMORY[0x1E4F1CA48] array];
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            v42 = v11[2].isa;
            uint64_t v43 = [(objc_class *)v42 countByEnumeratingWithState:&v65 objects:v71 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v66;
              do
              {
                for (uint64_t i = 0; i != v44; ++i)
                {
                  if (*(void *)v66 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  v47 = [*(id *)(*((void *)&v65 + 1) + 8 * i) data];
                  v48 = +[NWEndpoint endpointWithProtocolBufferData:v47];

                  [v41 addObject:v48];
                }
                uint64_t v44 = [(objc_class *)v42 countByEnumeratingWithState:&v65 objects:v71 count:16];
              }
              while (v44);
            }

            id v7 = v63;
            v40 = v62;
            [v63 setDiscoveredEndpoints:v41 forClient:v62];
            id v4 = v64;
          }
          else
          {
            v41 = __nwlog_obj();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
              _os_log_impl(&dword_1830D4000, v41, OS_LOG_TYPE_ERROR, "%{public}s Update browse message missing client ID", buf, 0xCu);
            }
          }
        }
        else
        {
          v51 = __nwlog_obj();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
            _os_log_impl(&dword_1830D4000, v51, OS_LOG_TYPE_ERROR, "%{public}s Update browse message could not be parsed", buf, 0xCu);
          }
          BOOL v15 = 0;
        }
        goto LABEL_15;
      case 7:
        uint64_t v11 = __nwlog_obj();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        uint64_t v12 = "%{public}s Close connection command is not valid to send to connection director";
        goto LABEL_12;
      default:
        uint64_t v11 = __nwlog_obj();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        if (*(unsigned char *)&v6->_has) {
          int command = v6->_command;
        }
        else {
          int command = 0;
        }
        *(_DWORD *)buf = 136446466;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        __int16 v74 = 1024;
        LODWORD(v75) = command;
        uint64_t v12 = "%{public}s Unknown command %u sent to connection receiver";
        v13 = v11;
        uint32_t v14 = 18;
        goto LABEL_13;
    }
  }
  v55 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
  v56 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v69 = 0;
  if (__nwlog_fault(v56, &type, &v69))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v57 = __nwlog_obj();
      os_log_type_t v58 = type;
      if (os_log_type_enabled(v57, type))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v59 = "%{public}s called with null replyData";
LABEL_97:
        _os_log_impl(&dword_1830D4000, v57, v58, v59, buf, 0xCu);
      }
    }
    else
    {
      if (v69)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v57 = __nwlog_obj();
        os_log_type_t v58 = type;
        BOOL v61 = os_log_type_enabled(v57, type);
        if (backtrace_string)
        {
          if (v61)
          {
            *(_DWORD *)buf = 136446466;
            v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
            __int16 v74 = 2082;
            v75 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v57, v58, "%{public}s called with null replyData, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_99;
        }
        if (!v61) {
          goto LABEL_98;
        }
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v59 = "%{public}s called with null replyData, no backtrace";
        goto LABEL_97;
      }
      v57 = __nwlog_obj();
      os_log_type_t v58 = type;
      if (os_log_type_enabled(v57, type))
      {
        *(_DWORD *)buf = 136446210;
        v73 = "-[NWRemoteConnectionDirector receiveRemoteReply:]";
        v59 = "%{public}s called with null replyData, backtrace limit exceeded";
        goto LABEL_97;
      }
    }
LABEL_98:
  }
LABEL_99:
  if (v56) {
    free(v56);
  }
  BOOL v15 = 0;
LABEL_22:

  return v15;
}

- (id)createSendDataMessageForClientID:(id)a3 data:(id)a4 receiveWindow:(unsigned int)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8)
    {
      uint32_t v10 = objc_alloc_init(NWPBSendData);
      uint64_t v11 = [v7 UUIDString];
      uint64_t v12 = v11;
      if (v10)
      {
        objc_storeStrong((id *)&v10->_clientUUID, v11);

        objc_storeStrong((id *)&v10->_messageData, a4);
        *(unsigned char *)&v10->_has |= 1u;
        v10->_receiveWindow = a5;
      }
      else
      {
      }
      v13 = objc_alloc_init(NWPBCommandMessage);
      p_isa = (id *)&v13->super.super.isa;
      if (v13)
      {
        *(unsigned char *)&v13->_has |= 1u;
        v13->_int command = 4;
        BOOL v15 = [(NWPBSendData *)v10 data];
        objc_storeStrong(p_isa + 2, v15);
      }
      else
      {
        BOOL v15 = [(NWPBSendData *)v10 data];
      }

      v16 = [p_isa data];

      goto LABEL_8;
    }
    uint64_t v23 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
    int v19 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v28 = 0;
    if (__nwlog_fault(v19, &type, &v28))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v20 = __nwlog_obj();
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          uint64_t v22 = "%{public}s called with null data";
          goto LABEL_37;
        }
        goto LABEL_38;
      }
      if (!v28)
      {
        v20 = __nwlog_obj();
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          uint64_t v22 = "%{public}s called with null data, backtrace limit exceeded";
          goto LABEL_37;
        }
        goto LABEL_38;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v20 = __nwlog_obj();
      os_log_type_t v21 = type;
      BOOL v27 = os_log_type_enabled(v20, type);
      if (!backtrace_string)
      {
        if (v27)
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          uint64_t v22 = "%{public}s called with null data, no backtrace";
          goto LABEL_37;
        }
        goto LABEL_38;
      }
      if (!v27) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136446466;
      v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
      __int16 v32 = 2082;
      v33 = backtrace_string;
      v26 = "%{public}s called with null data, dumping backtrace:%{public}s";
LABEL_27:
      _os_log_impl(&dword_1830D4000, v20, v21, v26, buf, 0x16u);
LABEL_28:

      free(backtrace_string);
    }
  }
  else
  {
    v18 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
    int v19 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v28 = 0;
    if (__nwlog_fault(v19, &type, &v28))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v20 = __nwlog_obj();
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          uint64_t v22 = "%{public}s called with null clientID";
LABEL_37:
          _os_log_impl(&dword_1830D4000, v20, v21, v22, buf, 0xCu);
        }
LABEL_38:

        goto LABEL_39;
      }
      if (!v28)
      {
        v20 = __nwlog_obj();
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          uint64_t v22 = "%{public}s called with null clientID, backtrace limit exceeded";
          goto LABEL_37;
        }
        goto LABEL_38;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v20 = __nwlog_obj();
      os_log_type_t v21 = type;
      BOOL v25 = os_log_type_enabled(v20, type);
      if (!backtrace_string)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136446210;
          v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
          uint64_t v22 = "%{public}s called with null clientID, no backtrace";
          goto LABEL_37;
        }
        goto LABEL_38;
      }
      if (!v25) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136446466;
      v31 = "-[NWRemoteConnectionDirector createSendDataMessageForClientID:data:receiveWindow:]";
      __int16 v32 = 2082;
      v33 = backtrace_string;
      v26 = "%{public}s called with null clientID, dumping backtrace:%{public}s";
      goto LABEL_27;
    }
  }
LABEL_39:
  if (v19) {
    free(v19);
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (id)createStopBrowseMessageForClientID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(NWPBStopBrowse);
    int v5 = [v3 UUIDString];
    if (v4) {
      objc_storeStrong((id *)&v4->_clientUUID, v5);
    }

    unint64_t v6 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v6->super.super.isa;
    if (v6)
    {
      *(unsigned char *)&v6->_has |= 1u;
      v6->_int command = 7;
      id v8 = [(NWPBStopBrowse *)v4 data];
      objc_storeStrong(p_isa + 2, v8);
    }
    else
    {
      id v8 = [(NWPBStopBrowse *)v4 data];
    }

    uint64_t v9 = [p_isa data];

    goto LABEL_7;
  }
  uint64_t v11 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
  uint64_t v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (__nwlog_fault(v12, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
        BOOL v15 = "%{public}s called with null clientID";
LABEL_23:
        _os_log_impl(&dword_1830D4000, v13, v14, v15, buf, 0xCu);
      }
    }
    else
    {
      if (v18)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v13 = __nwlog_obj();
        os_log_type_t v14 = type;
        BOOL v17 = os_log_type_enabled(v13, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)buf = 136446466;
            os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
            __int16 v22 = 2082;
            uint64_t v23 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s called with null clientID, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_25;
        }
        if (!v17) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
        BOOL v15 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_23;
      }
      v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createStopBrowseMessageForClientID:]";
        BOOL v15 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_23;
      }
    }
LABEL_24:
  }
LABEL_25:
  if (v12) {
    free(v12);
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

- (id)createStartBrowseMessageForClientID:(id)a3 descriptor:(id)a4 parameters:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint32_t v10 = v9;
  if (!v7)
  {
    os_log_type_t v21 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    __int16 v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (!__nwlog_fault(v22, &type, &v33)) {
      goto LABEL_52;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (!os_log_type_enabled(v23, type)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
      BOOL v25 = "%{public}s called with null clientID";
LABEL_50:
      _os_log_impl(&dword_1830D4000, v23, v24, v25, buf, 0xCu);
      goto LABEL_51;
    }
    if (!v33)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        BOOL v25 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v23 = __nwlog_obj();
    os_log_type_t v24 = type;
    BOOL v29 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        BOOL v25 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (!v29) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    __int16 v37 = 2082;
    id v38 = backtrace_string;
    v30 = "%{public}s called with null clientID, dumping backtrace:%{public}s";
LABEL_36:
    _os_log_impl(&dword_1830D4000, v23, v24, v30, buf, 0x16u);
LABEL_37:

    free(backtrace_string);
    goto LABEL_52;
  }
  if (!v8)
  {
    v26 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    __int16 v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (!__nwlog_fault(v22, &type, &v33)) {
      goto LABEL_52;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (!os_log_type_enabled(v23, type)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
      BOOL v25 = "%{public}s called with null descriptor";
      goto LABEL_50;
    }
    if (!v33)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        BOOL v25 = "%{public}s called with null descriptor, backtrace limit exceeded";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v23 = __nwlog_obj();
    os_log_type_t v24 = type;
    BOOL v31 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        BOOL v25 = "%{public}s called with null descriptor, no backtrace";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (!v31) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    __int16 v37 = 2082;
    id v38 = backtrace_string;
    v30 = "%{public}s called with null descriptor, dumping backtrace:%{public}s";
    goto LABEL_36;
  }
  if (v9)
  {
    uint64_t v11 = objc_alloc_init(NWPBStartBrowse);
    uint64_t v12 = [v7 UUIDString];
    v13 = v12;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_clientUUID, v12);

      os_log_type_t v14 = (void *)[v8 createProtocolBufferObject];
      objc_storeStrong((id *)&v11->_descriptor, v14);

      BOOL v15 = (void *)[v10 createProtocolBufferObject];
      objc_storeStrong((id *)&v11->_parameters, v15);
    }
    else
    {

      BOOL v15 = (void *)[v10 createProtocolBufferObject];
    }

    v16 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v16->super.super.isa;
    if (v16)
    {
      *(unsigned char *)&v16->_has |= 1u;
      v16->_int command = 5;
      char v18 = [(NWPBStartBrowse *)v11 data];
      objc_storeStrong(p_isa + 2, v18);
    }
    else
    {
      char v18 = [(NWPBStartBrowse *)v11 data];
    }

    int v19 = [p_isa data];

    goto LABEL_9;
  }
  BOOL v27 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
  __int16 v22 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v33 = 0;
  if (__nwlog_fault(v22, &type, &v33))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        BOOL v25 = "%{public}s called with null parameters";
        goto LABEL_50;
      }
LABEL_51:

      goto LABEL_52;
    }
    if (!v33)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        BOOL v25 = "%{public}s called with null parameters, backtrace limit exceeded";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v23 = __nwlog_obj();
    os_log_type_t v24 = type;
    BOOL v32 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
        BOOL v25 = "%{public}s called with null parameters, no backtrace";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (!v32) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createStartBrowseMessageForClientID:descriptor:parameters:]";
    __int16 v37 = 2082;
    id v38 = backtrace_string;
    v30 = "%{public}s called with null parameters, dumping backtrace:%{public}s";
    goto LABEL_36;
  }
LABEL_52:
  if (v22) {
    free(v22);
  }
  int v19 = 0;
LABEL_9:

  return v19;
}

- (id)createCloseConnectionMessageForClientID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(NWPBCloseConnection);
    int v5 = [v3 UUIDString];
    if (v4) {
      objc_storeStrong((id *)&v4->_clientUUID, v5);
    }

    unint64_t v6 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v6->super.super.isa;
    if (v6)
    {
      *(unsigned char *)&v6->_has |= 1u;
      v6->_int command = 3;
      id v8 = [(NWPBCloseConnection *)v4 data];
      objc_storeStrong(p_isa + 2, v8);
    }
    else
    {
      id v8 = [(NWPBCloseConnection *)v4 data];
    }

    id v9 = [p_isa data];

    goto LABEL_7;
  }
  uint64_t v11 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
  uint64_t v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (__nwlog_fault(v12, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
        BOOL v15 = "%{public}s called with null clientID";
LABEL_23:
        _os_log_impl(&dword_1830D4000, v13, v14, v15, buf, 0xCu);
      }
    }
    else
    {
      if (v18)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v13 = __nwlog_obj();
        os_log_type_t v14 = type;
        BOOL v17 = os_log_type_enabled(v13, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)buf = 136446466;
            os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
            __int16 v22 = 2082;
            uint64_t v23 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s called with null clientID, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_25;
        }
        if (!v17) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
        BOOL v15 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_23;
      }
      v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v21 = "-[NWRemoteConnectionDirector createCloseConnectionMessageForClientID:]";
        BOOL v15 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_23;
      }
    }
LABEL_24:
  }
LABEL_25:
  if (v12) {
    free(v12);
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

- (id)createOpenConnectionMessageForClientID:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint32_t v10 = v9;
  if (!v7)
  {
    os_log_type_t v21 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    __int16 v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (!__nwlog_fault(v22, &type, &v33)) {
      goto LABEL_52;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (!os_log_type_enabled(v23, type)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
      BOOL v25 = "%{public}s called with null clientID";
LABEL_50:
      _os_log_impl(&dword_1830D4000, v23, v24, v25, buf, 0xCu);
      goto LABEL_51;
    }
    if (!v33)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        BOOL v25 = "%{public}s called with null clientID, backtrace limit exceeded";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v23 = __nwlog_obj();
    os_log_type_t v24 = type;
    BOOL v29 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        BOOL v25 = "%{public}s called with null clientID, no backtrace";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (!v29) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    __int16 v37 = 2082;
    id v38 = backtrace_string;
    v30 = "%{public}s called with null clientID, dumping backtrace:%{public}s";
LABEL_36:
    _os_log_impl(&dword_1830D4000, v23, v24, v30, buf, 0x16u);
LABEL_37:

    free(backtrace_string);
    goto LABEL_52;
  }
  if (!v8)
  {
    v26 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    __int16 v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (!__nwlog_fault(v22, &type, &v33)) {
      goto LABEL_52;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (!os_log_type_enabled(v23, type)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136446210;
      v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
      BOOL v25 = "%{public}s called with null endpoint";
      goto LABEL_50;
    }
    if (!v33)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        BOOL v25 = "%{public}s called with null endpoint, backtrace limit exceeded";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v23 = __nwlog_obj();
    os_log_type_t v24 = type;
    BOOL v31 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        BOOL v25 = "%{public}s called with null endpoint, no backtrace";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (!v31) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    __int16 v37 = 2082;
    id v38 = backtrace_string;
    v30 = "%{public}s called with null endpoint, dumping backtrace:%{public}s";
    goto LABEL_36;
  }
  if (v9)
  {
    uint64_t v11 = objc_alloc_init(NWPBOpenConnection);
    uint64_t v12 = [v7 UUIDString];
    v13 = v12;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_clientUUID, v12);

      os_log_type_t v14 = (void *)[v8 createProtocolBufferObject];
      objc_storeStrong((id *)&v11->_endpoint, v14);

      BOOL v15 = (void *)[v10 createProtocolBufferObject];
      objc_storeStrong((id *)&v11->_parameters, v15);
    }
    else
    {

      BOOL v15 = (void *)[v10 createProtocolBufferObject];
    }

    v16 = objc_alloc_init(NWPBCommandMessage);
    p_isa = (id *)&v16->super.super.isa;
    if (v16)
    {
      *(unsigned char *)&v16->_has |= 1u;
      v16->_int command = 1;
      char v18 = [(NWPBOpenConnection *)v11 data];
      objc_storeStrong(p_isa + 2, v18);
    }
    else
    {
      char v18 = [(NWPBOpenConnection *)v11 data];
    }

    int v19 = [p_isa data];

    goto LABEL_9;
  }
  BOOL v27 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
  __int16 v22 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v33 = 0;
  if (__nwlog_fault(v22, &type, &v33))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        BOOL v25 = "%{public}s called with null parameters";
        goto LABEL_50;
      }
LABEL_51:

      goto LABEL_52;
    }
    if (!v33)
    {
      uint64_t v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        BOOL v25 = "%{public}s called with null parameters, backtrace limit exceeded";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v23 = __nwlog_obj();
    os_log_type_t v24 = type;
    BOOL v32 = os_log_type_enabled(v23, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
        BOOL v25 = "%{public}s called with null parameters, no backtrace";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (!v32) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v36 = "-[NWRemoteConnectionDirector createOpenConnectionMessageForClientID:endpoint:parameters:]";
    __int16 v37 = 2082;
    id v38 = backtrace_string;
    v30 = "%{public}s called with null parameters, dumping backtrace:%{public}s";
    goto LABEL_36;
  }
LABEL_52:
  if (v22) {
    free(v22);
  }
  int v19 = 0;
LABEL_9:

  return v19;
}

- (void)dealloc
{
  if ([(NWRemoteConnectionDirector *)self directorProtocol])
  {
    free([(NWRemoteConnectionDirector *)self directorProtocol]);
    [(NWRemoteConnectionDirector *)self setDirectorProtocol:0];
  }
  if ([(NWRemoteConnectionDirector *)self protocolHashTable]
    && [(NWRemoteConnectionDirector *)self protocolHashTable])
  {
    _nw_hash_table_release((os_unfair_lock_s *)[(NWRemoteConnectionDirector *)self protocolHashTable]);
    [(NWRemoteConnectionDirector *)self setProtocolHashTable:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)NWRemoteConnectionDirector;
  [(NWRemoteConnectionDirector *)&v3 dealloc];
}

- (NWRemoteConnectionDirector)initWithDelegate:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v27 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (__nwlog_fault(v11, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        uint64_t v12 = __nwlog_obj();
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        os_log_type_t v14 = "%{public}s called with null delegate";
      }
      else if (v38)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        uint64_t v12 = __nwlog_obj();
        os_log_type_t v16 = type;
        BOOL v34 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        os_log_type_t v14 = "%{public}s called with null delegate, no backtrace";
      }
      else
      {
        uint64_t v12 = __nwlog_obj();
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v12, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        os_log_type_t v14 = "%{public}s called with null delegate, backtrace limit exceeded";
      }
      goto LABEL_35;
    }
    goto LABEL_39;
  }
  v37.receiver = self;
  v37.super_class = (Class)NWRemoteConnectionDirector;
  int v5 = [(NWRemoteConnectionDirector *)&v37 init];
  if (!v5)
  {
    char v28 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
    BOOL v29 = (char *)_os_log_send_and_compose_impl();

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
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
            v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        BOOL v32 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_73;
      }
      v30 = __nwlog_obj();
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
  objc_storeWeak((id *)&v5->_delegate, v4);
  self->_maximumDataChunkSize = 10240;
  unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  writeRequests = self->_writeRequests;
  self->_writeRequests = v6;

  id v8 = (nw_protocol *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040C9AB51B7uLL);
  self->_directorProtocol = v8;
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
      uint64_t v12 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (!os_log_type_enabled(v12, type)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136446466;
      v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
      __int16 v42 = 2048;
      uint64_t v43 = 64;
      os_log_type_t v14 = "%{public}s calloc(%zu) failed";
    }
    else
    {
      if (v38)
      {
        BOOL v17 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v12 = (id)gLogObj;
        os_log_type_t v18 = type;
        BOOL v19 = os_log_type_enabled(v12, type);
        if (v17)
        {
          if (v19)
          {
            *(_DWORD *)buf = 136446722;
            v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
            __int16 v42 = 2048;
            uint64_t v43 = 64;
            __int16 v44 = 2082;
            uint64_t v45 = v17;
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
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        __int16 v42 = 2048;
        uint64_t v43 = 64;
        os_log_type_t v14 = "%{public}s calloc(%zu) failed, no backtrace";
        uint64_t v23 = v12;
        os_log_type_t v24 = v18;
        goto LABEL_30;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v12 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (!os_log_type_enabled(v12, type)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136446466;
      v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
      __int16 v42 = 2048;
      uint64_t v43 = 64;
      os_log_type_t v14 = "%{public}s calloc(%zu) failed, backtrace limit exceeded";
    }
    uint64_t v23 = v12;
    os_log_type_t v24 = v13;
LABEL_30:
    uint32_t v25 = 22;
LABEL_37:
    _os_log_impl(&dword_1830D4000, v23, v24, v14, buf, v25);
    goto LABEL_38;
  }
  if (initWithDelegate__directorProtocolOnceToken != -1) {
    dispatch_once(&initWithDelegate__directorProtocolOnceToken, &__block_literal_global_43840);
  }
  self->_directorProtocol->identifier = (nw_protocol_identifier *)&NWRemoteConnectionDirectorProtocolIdentifier;
  self->_directorProtocol->callbacks = (nw_protocol_callbacks *)&NWRemoteConnectionDirectorProtocolCallbacks;
  self->_directorProtocol->handle = self;
  uint64_t internal = nw_hash_table_create_internal(0x11u, 4, (const void *(*)(const void *, unsigned int *))nw_protocol_get_key, (unsigned int (*)(const void *, unsigned int))nw_protocol_key_hash, (BOOL (*)(const void *, const void *, unsigned int))nw_protocol_matches_key, 0);
  if (!internal)
  {
    self->_protocolHashTable = 0;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
      uint64_t v12 = (id)gLogObj;
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        os_log_type_t v14 = "%{public}s nw_protocol_hash_table_create failed";
LABEL_35:
        uint64_t v23 = v12;
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
      uint64_t v12 = (id)gLogObj;
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
        os_log_type_t v14 = "%{public}s nw_protocol_hash_table_create failed, backtrace limit exceeded";
        goto LABEL_35;
      }
LABEL_38:

      goto LABEL_39;
    }
    v20 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v12 = (id)gLogObj;
    os_log_type_t v21 = type;
    BOOL v22 = os_log_type_enabled(v12, type);
    if (!v20)
    {
      if (!v22) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136446210;
      v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
      os_log_type_t v14 = "%{public}s nw_protocol_hash_table_create failed, no backtrace";
      uint64_t v23 = v12;
      os_log_type_t v24 = v21;
      goto LABEL_36;
    }
    if (v22)
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[NWRemoteConnectionDirector initWithDelegate:]";
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
  self->_protocolHashTable = (nw_hash_table *)internal;
LABEL_43:

  return self;
}

double __47__NWRemoteConnectionDirector_initWithDelegate___block_invoke()
{
  NWRemoteConnectionDirectorProtocolIdentifier = 0u;
  unk_1E8F79DB8 = 0u;
  *(void *)&double result = 0x100000004;
  qword_1E8F79DC8 = 0x100000004;
  NWRemoteConnectionDirectorProtocolCallbacks = (uint64_t)nw_protocol_default_add_input_handler;
  qword_1E8F79DE0 = (uint64_t)nw_protocol_default_replace_input_handler;
  qword_1E8F79DD8 = (uint64_t)nw_protocol_default_remove_input_handler;
  qword_1E8F79E88 = (uint64_t)nw_protocol_default_input_finished;
  qword_1E8F79E90 = (uint64_t)nw_protocol_default_output_finished;
  qword_1E8F79ED8 = (uint64_t)nw_protocol_default_input_flush;
  qword_1E8F79E20 = (uint64_t)nw_protocol_default_get_input_frames;
  qword_1E8F79E28 = (uint64_t)nw_protocol_default_get_output_frames;
  qword_1E8F79E30 = (uint64_t)nw_protocol_default_finalize_output_frames;
  qword_1E8F79EC8 = (uint64_t)nw_protocol_default_get_message_properties;
  qword_1E8F79E38 = (uint64_t)nw_protocol_default_link_state;
  qword_1E8F79E40 = (uint64_t)nw_protocol_default_get_parameters;
  qword_1E8F79E50 = (uint64_t)nw_protocol_default_get_local;
  qword_1E8F79E58 = (uint64_t)nw_protocol_default_get_remote;
  qword_1E8F79E48 = (uint64_t)nw_protocol_default_get_path;
  qword_1E8F79E78 = (uint64_t)nw_protocol_default_updated_path;
  qword_1E8F79E98 = (uint64_t)nw_protocol_default_get_output_local;
  qword_1E8F79EA0 = (uint64_t)nw_protocol_default_get_output_interface;
  qword_1E8F79DE8 = (uint64_t)nw_protocol_default_connect;
  qword_1E8F79DF0 = (uint64_t)nw_protocol_default_disconnect;
  qword_1E8F79DF8 = (uint64_t)nw_protocol_default_connected;
  qword_1E8F79E00 = (uint64_t)nw_protocol_default_disconnected;
  qword_1E8F79E08 = (uint64_t)nw_protocol_default_error;
  qword_1E8F79ED0 = (uint64_t)nw_protocol_default_reset;
  qword_1E8F79E80 = (uint64_t)nw_protocol_default_supports_external_data;
  qword_1E8F79EA8 = (uint64_t)nw_protocol_default_waiting_for_output;
  qword_1E8F79EB0 = (uint64_t)nw_protocol_default_copy_info;
  qword_1E8F79E60 = (uint64_t)nw_protocol_default_register_notification;
  qword_1E8F79E68 = (uint64_t)nw_protocol_default_unregister_notification;
  qword_1E8F79E70 = (uint64_t)nw_protocol_default_notify;
  qword_1E8F79EB8 = (uint64_t)nw_protocol_default_add_listen_handler;
  qword_1E8F79EC0 = (uint64_t)nw_protocol_default_remove_listen_handler;
  qword_1E8F79E10 = (uint64_t)nw_remote_director_input_available;
  qword_1E8F79E18 = (uint64_t)nw_remote_director_output_available;
  return result;
}

@end