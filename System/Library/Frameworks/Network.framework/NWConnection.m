@interface NWConnection
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)connectionWithConnectedSocket:(int)a3;
+ (id)connectionWithEndpoint:(id)a3 parameters:(id)a4;
+ (id)connectionWithInternalConnection:(id)a3;
- (BOOL)hasBetterPath;
- (BOOL)internalHasBetterPath;
- (BOOL)internalIsViable;
- (BOOL)isViable;
- (NSError)error;
- (NSError)internalError;
- (NWConcrete_nw_connection)internalConnection;
- (NWConnection)initWithConnectedSocket:(int)a3;
- (NWConnection)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWConnection)initWithInternalConnection:(id)a3;
- (NWEndpoint)connectedLocalEndpoint;
- (NWEndpoint)connectedRemoteEndpoint;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (NWPath)currentPath;
- (NWPath)internalPath;
- (id)copyCurrentPath;
- (id)copyError;
- (id)description;
- (int)getConnectedSocket;
- (int64_t)connectionState;
- (int64_t)internalConnectionState;
- (unsigned)tlsConnectionTime;
- (void)cancel;
- (void)cancelCurrentEndpoint;
- (void)forceCancel;
- (void)setInternalConnection:(id)a3;
- (void)setInternalConnectionState:(int64_t)a3;
- (void)setInternalError:(id)a3;
- (void)setInternalHasBetterPath:(BOOL)a3;
- (void)setInternalIsViable:(BOOL)a3;
- (void)setInternalPath:(id)a3;
- (void)start;
@end

@implementation NWConnection

+ (id)connectionWithInternalConnection:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  nw_parameters_t v4 = nw_connection_copy_parameters(v3);
  int data_mode = nw_parameters_get_data_mode(v4);
  if (data_mode == 1)
  {
    v6 = NWDatagramConnection;
    goto LABEL_5;
  }
  if (data_mode == 2)
  {
    v6 = NWStreamConnection;
LABEL_5:
    v7 = (void *)[[v6 alloc] initWithInternalConnection:v3];
    goto LABEL_18;
  }
  int v8 = data_mode;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v9 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v23 = "+[NWConnection connectionWithInternalConnection:]";
  __int16 v24 = 1024;
  int v25 = v8;
  v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v10, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (!os_log_type_enabled(v11, type)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 136446466;
      v23 = "+[NWConnection connectionWithInternalConnection:]";
      __int16 v24 = 1024;
      int v25 = v8;
      v13 = "%{public}s Parameters must specify a valid data mode for new connections (received %u)";
LABEL_23:
      v18 = v11;
      os_log_type_t v19 = v12;
      goto LABEL_24;
    }
    if (!v20)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (!os_log_type_enabled(v11, type)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 136446466;
      v23 = "+[NWConnection connectionWithInternalConnection:]";
      __int16 v24 = 1024;
      int v25 = v8;
      v13 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), backtrace limit exceeded";
      goto LABEL_23;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    os_log_type_t v15 = type;
    BOOL v16 = os_log_type_enabled(v11, type);
    if (!backtrace_string)
    {
      if (!v16)
      {
LABEL_25:

        if (!v10) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136446466;
      v23 = "+[NWConnection connectionWithInternalConnection:]";
      __int16 v24 = 1024;
      int v25 = v8;
      v13 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), no backtrace";
      v18 = v11;
      os_log_type_t v19 = v15;
LABEL_24:
      _os_log_impl(&dword_1830D4000, v18, v19, v13, buf, 0x12u);
      goto LABEL_25;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446722;
      v23 = "+[NWConnection connectionWithInternalConnection:]";
      __int16 v24 = 1024;
      int v25 = v8;
      __int16 v26 = 2082;
      v27 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v11, v15, "%{public}s Parameters must specify a valid data mode for new connections (received %u), dumping backtrace:%{public}s", buf, 0x1Cu);
    }

    free(backtrace_string);
  }
  if (v10) {
LABEL_16:
  }
    free(v10);
LABEL_17:
  v7 = 0;
LABEL_18:

  return v7;
}

+ (id)connectionWithConnectedSocket:(int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v3 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v17 = "+[NWConnection connectionWithConnectedSocket:]";
  nw_parameters_t v4 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v4, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      os_log_type_t v6 = type;
      if (!os_log_type_enabled(v5, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      v17 = "+[NWConnection connectionWithConnectedSocket:]";
      v7 = "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection";
LABEL_15:
      os_log_type_t v12 = v5;
      os_log_type_t v13 = v6;
      goto LABEL_16;
    }
    if (!v14)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      os_log_type_t v6 = type;
      if (!os_log_type_enabled(v5, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      v17 = "+[NWConnection connectionWithConnectedSocket:]";
      v7 = "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection, backtrace limit exceeded";
      goto LABEL_15;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    os_log_type_t v9 = type;
    BOOL v10 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (!v10)
      {
LABEL_17:

        if (!v4) {
          return 0;
        }
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136446210;
      v17 = "+[NWConnection connectionWithConnectedSocket:]";
      v7 = "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection, no backtrace";
      os_log_type_t v12 = v5;
      os_log_type_t v13 = v9;
LABEL_16:
      _os_log_impl(&dword_1830D4000, v12, v13, v7, buf, 0xCu);
      goto LABEL_17;
    }
    if (v10)
    {
      *(_DWORD *)buf = 136446466;
      v17 = "+[NWConnection connectionWithConnectedSocket:]";
      __int16 v18 = 2082;
      os_log_type_t v19 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v5, v9, "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v4) {
LABEL_11:
  }
    free(v4);
  return 0;
}

+ (id)connectionWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 dataMode] == 2)
  {
    v7 = NWStreamConnection;
LABEL_7:
    int v8 = (void *)[[v7 alloc] initWithEndpoint:v5 parameters:v6];
    goto LABEL_8;
  }
  if ([v6 dataMode] == 1)
  {
    v7 = NWDatagramConnection;
    goto LABEL_7;
  }
  if ([v6 dataMode] == 3)
  {
    v7 = NWMessageConnection;
    goto LABEL_7;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v10 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  uint64_t v28 = "+[NWConnection connectionWithEndpoint:parameters:]";
  __int16 v29 = 1024;
  int v30 = [v6 dataMode];
  LODWORD(v24) = 18;
  v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v25 = 0;
  if (__nwlog_fault(v11, &type, &v25))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v12 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        int v14 = objc_msgSend(v6, "dataMode", buf, v24);
        *(_DWORD *)buf = 136446466;
        uint64_t v28 = "+[NWConnection connectionWithEndpoint:parameters:]";
        __int16 v29 = 1024;
        int v30 = v14;
        os_log_type_t v15 = "%{public}s Parameters must specify a valid data mode for new connections (received %u)";
LABEL_22:
        v21 = v12;
        os_log_type_t v22 = v13;
LABEL_23:
        _os_log_impl(&dword_1830D4000, v21, v22, v15, buf, 0x12u);
      }
    }
    else
    {
      if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v12 = (id)gLogObj;
        os_log_type_t v17 = type;
        BOOL v18 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v18)
          {
            int v19 = objc_msgSend(v6, "dataMode", buf, v24);
            *(_DWORD *)buf = 136446722;
            uint64_t v28 = "+[NWConnection connectionWithEndpoint:parameters:]";
            __int16 v29 = 1024;
            int v30 = v19;
            __int16 v31 = 2082;
            v32 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v12, v17, "%{public}s Parameters must specify a valid data mode for new connections (received %u), dumping backtrace:%{public}s", buf, 0x1Cu);
          }

          free(backtrace_string);
          goto LABEL_25;
        }
        if (!v18) {
          goto LABEL_24;
        }
        int v23 = objc_msgSend(v6, "dataMode", buf, v24);
        *(_DWORD *)buf = 136446466;
        uint64_t v28 = "+[NWConnection connectionWithEndpoint:parameters:]";
        __int16 v29 = 1024;
        int v30 = v23;
        os_log_type_t v15 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), no backtrace";
        v21 = v12;
        os_log_type_t v22 = v17;
        goto LABEL_23;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v12 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        int v20 = objc_msgSend(v6, "dataMode", buf, v24);
        *(_DWORD *)buf = 136446466;
        uint64_t v28 = "+[NWConnection connectionWithEndpoint:parameters:]";
        __int16 v29 = 1024;
        int v30 = v20;
        os_log_type_t v15 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), backtrace limit exceeded";
        goto LABEL_22;
      }
    }
LABEL_24:
  }
LABEL_25:
  if (v11) {
    free(v11);
  }
  int v8 = 0;
LABEL_8:

  return v8;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"connectionState"] & 1) != 0
    || ([v4 isEqualToString:@"viable"] & 1) != 0
    || ([v4 isEqualToString:@"hasBetterPath"] & 1) != 0
    || ([v4 isEqualToString:@"error"] & 1) != 0
    || ([v4 isEqualToString:@"currentPath"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWConnection;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalConnection, 0);
  objc_storeStrong((id *)&self->_internalPath, 0);

  objc_storeStrong((id *)&self->_internalError, 0);
}

- (void)setInternalConnection:(id)a3
{
}

- (NWConcrete_nw_connection)internalConnection
{
  return self->_internalConnection;
}

- (void)setInternalPath:(id)a3
{
}

- (NWPath)internalPath
{
  return (NWPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalError:(id)a3
{
}

- (NSError)internalError
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInternalHasBetterPath:(BOOL)a3
{
  self->_internalHasBetterPath = a3;
}

- (BOOL)internalHasBetterPath
{
  return self->_internalHasBetterPath;
}

- (void)setInternalIsViable:(BOOL)a3
{
  self->_internalIsViable = a3;
}

- (BOOL)internalIsViable
{
  return self->_internalIsViable;
}

- (void)setInternalConnectionState:(int64_t)a3
{
  self->_internalConnectionState = a3;
}

- (int64_t)internalConnectionState
{
  return self->_internalConnectionState;
}

- (NWParameters)parameters
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(NWConnection *)self internalConnection];
  nw_parameters_t v3 = nw_connection_copy_parameters(v2);

  if (v3)
  {
    id v4 = +[NWParameters parametersWithCParameters:v3];
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  int v19 = "-[NWConnection parameters]";
  id v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v6, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      objc_super v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      int v19 = "-[NWConnection parameters]";
      os_log_type_t v9 = "%{public}s nw_connection_copy_parameters failed";
LABEL_20:
      int v14 = v7;
      os_log_type_t v15 = v8;
      goto LABEL_21;
    }
    if (!v16)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      objc_super v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      int v19 = "-[NWConnection parameters]";
      os_log_type_t v9 = "%{public}s nw_connection_copy_parameters failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    objc_super v7 = (id)gLogObj;
    os_log_type_t v11 = type;
    BOOL v12 = os_log_type_enabled(v7, type);
    if (!backtrace_string)
    {
      if (!v12)
      {
LABEL_22:

        if (!v6) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136446210;
      int v19 = "-[NWConnection parameters]";
      os_log_type_t v9 = "%{public}s nw_connection_copy_parameters failed, no backtrace";
      int v14 = v7;
      os_log_type_t v15 = v11;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (v12)
    {
      *(_DWORD *)buf = 136446466;
      int v19 = "-[NWConnection parameters]";
      __int16 v20 = 2082;
      v21 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s nw_connection_copy_parameters failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v6) {
LABEL_13:
  }
    free(v6);
LABEL_14:
  id v4 = 0;
LABEL_15:

  return (NWParameters *)v4;
}

- (NWEndpoint)endpoint
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(NWConnection *)self internalConnection];
  nw_endpoint_t v3 = nw_connection_copy_endpoint(v2);

  if (v3)
  {
    id v4 = +[NWEndpoint endpointWithInternalEndpoint:v3];
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  int v19 = "-[NWConnection endpoint]";
  id v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v6, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      objc_super v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      int v19 = "-[NWConnection endpoint]";
      os_log_type_t v9 = "%{public}s nw_connection_copy_endpoint failed";
LABEL_20:
      int v14 = v7;
      os_log_type_t v15 = v8;
      goto LABEL_21;
    }
    if (!v16)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      objc_super v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      int v19 = "-[NWConnection endpoint]";
      os_log_type_t v9 = "%{public}s nw_connection_copy_endpoint failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    objc_super v7 = (id)gLogObj;
    os_log_type_t v11 = type;
    BOOL v12 = os_log_type_enabled(v7, type);
    if (!backtrace_string)
    {
      if (!v12)
      {
LABEL_22:

        if (!v6) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136446210;
      int v19 = "-[NWConnection endpoint]";
      os_log_type_t v9 = "%{public}s nw_connection_copy_endpoint failed, no backtrace";
      int v14 = v7;
      os_log_type_t v15 = v11;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (v12)
    {
      *(_DWORD *)buf = 136446466;
      int v19 = "-[NWConnection endpoint]";
      __int16 v20 = 2082;
      v21 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s nw_connection_copy_endpoint failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v6) {
LABEL_13:
  }
    free(v6);
LABEL_14:
  id v4 = 0;
LABEL_15:

  return (NWEndpoint *)v4;
}

- (NWPath)currentPath
{
  id v2 = [(NWConnection *)self copyCurrentPath];

  return (NWPath *)v2;
}

- (id)copyCurrentPath
{
  id v2 = self;
  objc_sync_enter(v2);
  nw_endpoint_t v3 = [(NWConnection *)v2 internalPath];
  objc_sync_exit(v2);

  return v3;
}

- (NSError)error
{
  id v2 = [(NWConnection *)self copyError];

  return (NSError *)v2;
}

- (id)copyError
{
  id v2 = self;
  objc_sync_enter(v2);
  nw_endpoint_t v3 = [(NWConnection *)v2 internalError];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasBetterPath
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NWConnection *)v2 internalHasBetterPath];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isViable
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NWConnection *)v2 internalIsViable];
  objc_sync_exit(v2);

  return v3;
}

- (NWEndpoint)connectedRemoteEndpoint
{
  id v2 = [(NWConnection *)self internalConnection];
  id v3 = nw_connection_copy_connected_remote_endpoint(v2);

  if (v3)
  {
    id v4 = +[NWEndpoint endpointWithInternalEndpoint:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)connectedLocalEndpoint
{
  id v2 = [(NWConnection *)self internalConnection];
  id v3 = nw_connection_copy_connected_local_endpoint(v2);

  if (v3)
  {
    id v4 = +[NWEndpoint endpointWithInternalEndpoint:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (int64_t)connectionState
{
  id v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = [(NWConnection *)v2 internalConnectionState];
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)tlsConnectionTime
{
  v5[0] = 0;
  v5[1] = 0;
  uint64_t v6 = 0;
  id v2 = [(NWConnection *)self internalConnection];
  BOOL v3 = nw_connection_fillout_tcp_statistics(v2, (uint64_t)v5);

  if (v3) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)cancelCurrentEndpoint
{
  id v2 = [(NWConnection *)self internalConnection];
  nw_connection_cancel_current_endpoint(v2);
}

- (void)forceCancel
{
  id v2 = [(NWConnection *)self internalConnection];
  nw_connection_force_cancel(v2);
}

- (void)cancel
{
  id v2 = [(NWConnection *)self internalConnection];
  nw_connection_cancel(v2);
}

- (int)getConnectedSocket
{
  id v2 = [(NWConnection *)self internalConnection];
  int connected_socket = nw_connection_get_connected_socket(v2);

  return connected_socket;
}

- (id)description
{
  id v2 = [(NWConnection *)self internalConnection];
  BOOL v3 = [v2 description];

  return v3;
}

- (NWConnection)initWithInternalConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NWConnection;
  id v5 = [(NWConnection *)&v18 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(NWConnection *)v5 setInternalConnection:v4];
    [(NWConnection *)v6 setInternalConnectionState:2];
    [(NWConnection *)v6 start];
    objc_super v7 = v6;
    goto LABEL_3;
  }
  os_log_type_t v9 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  __int16 v20 = "-[NWConnection initWithInternalConnection:]";
  id v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v10, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      os_log_type_t v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v20 = "-[NWConnection initWithInternalConnection:]";
        os_log_type_t v13 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v16)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        os_log_type_t v11 = __nwlog_obj();
        os_log_type_t v12 = type;
        BOOL v15 = os_log_type_enabled(v11, type);
        if (backtrace_string)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136446466;
            __int16 v20 = "-[NWConnection initWithInternalConnection:]";
            __int16 v21 = 2082;
            uint64_t v22 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v15) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        __int16 v20 = "-[NWConnection initWithInternalConnection:]";
        os_log_type_t v13 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      os_log_type_t v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v20 = "-[NWConnection initWithInternalConnection:]";
        os_log_type_t v13 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v10) {
    free(v10);
  }
LABEL_3:

  return v6;
}

- (NWConnection)initWithConnectedSocket:(int)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)NWConnection;
  id v4 = [(NWConnection *)&v29 init];
  if (!v4)
  {
    __int16 v21 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
    id v10 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (!__nwlog_fault(v10, &type, &v27)) {
      goto LABEL_19;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      uint64_t v22 = __nwlog_obj();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
        uint64_t v24 = "%{public}s [super init] failed";
LABEL_44:
        _os_log_impl(&dword_1830D4000, v22, v23, v24, buf, 0xCu);
      }
    }
    else
    {
      if (v27)
      {
        backtrace_string = __nw_create_backtrace_string();
        uint64_t v22 = __nwlog_obj();
        os_log_type_t v23 = type;
        BOOL v26 = os_log_type_enabled(v22, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
            __int16 v32 = 2082;
            uint64_t v33 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          os_log_type_t v17 = (char *)backtrace_string;
LABEL_18:
          free(v17);
          goto LABEL_19;
        }
        if (!v26) {
          goto LABEL_45;
        }
        *(_DWORD *)buf = 136446210;
        __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
        uint64_t v24 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_44;
      }
      uint64_t v22 = __nwlog_obj();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
        uint64_t v24 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_44;
      }
    }
LABEL_45:

LABEL_19:
    if (!v10)
    {
LABEL_21:
      os_log_type_t v8 = 0;
      goto LABEL_22;
    }
LABEL_20:
    free(v10);
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v5 = 2;
    }
    else {
      unsigned int v5 = 0;
    }
  }
  uint64_t v6 = nw_connection_create_with_connected_socket(a3, v5);
  [(NWConnection *)v4 setInternalConnection:v6];

  objc_super v7 = [(NWConnection *)v4 internalConnection];

  if (!v7)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
    id v10 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (!__nwlog_fault(v10, &type, &v27)) {
      goto LABEL_19;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (!os_log_type_enabled(v11, type)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 136446210;
      __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
      os_log_type_t v13 = "%{public}s nw_connection_create_with_connected_socket failed";
LABEL_25:
      int v19 = v11;
      os_log_type_t v20 = v12;
      goto LABEL_26;
    }
    if (!v27)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (!os_log_type_enabled(v11, type)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 136446210;
      __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
      os_log_type_t v13 = "%{public}s nw_connection_create_with_connected_socket failed, backtrace limit exceeded";
      goto LABEL_25;
    }
    int v14 = __nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    os_log_type_t v11 = (id)gLogObj;
    os_log_type_t v15 = type;
    BOOL v16 = os_log_type_enabled(v11, type);
    if (!v14)
    {
      if (!v16)
      {
LABEL_27:

        if (!v10) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446210;
      __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
      os_log_type_t v13 = "%{public}s nw_connection_create_with_connected_socket failed, no backtrace";
      int v19 = v11;
      os_log_type_t v20 = v15;
LABEL_26:
      _os_log_impl(&dword_1830D4000, v19, v20, v13, buf, 0xCu);
      goto LABEL_27;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446466;
      __int16 v31 = "-[NWConnection initWithConnectedSocket:]";
      __int16 v32 = 2082;
      uint64_t v33 = v14;
      _os_log_impl(&dword_1830D4000, v11, v15, "%{public}s nw_connection_create_with_connected_socket failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    os_log_type_t v17 = (char *)v14;
    goto LABEL_18;
  }
  [(NWConnection *)v4 setInternalConnectionState:2];
  [(NWConnection *)v4 start];
  os_log_type_t v8 = v4;
LABEL_22:

  return v8;
}

- (NWConnection)initWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NWConnection;
  os_log_type_t v8 = [(NWConnection *)&v25 init];
  if (v8)
  {
    id v9 = [v7 internalParameters];
    char indefinite_set = nw_parameters_get_indefinite_set(v9);

    if ((indefinite_set & 1) == 0) {
      [v7 setIndefinite:0];
    }
    os_log_type_t v11 = [v6 internalEndpoint];
    os_log_type_t v12 = [v7 internalParameters];
    nw_connection_t v13 = nw_connection_create(v11, v12);
    [(NWConnection *)v8 setInternalConnection:v13];

    int v14 = [(NWConnection *)v8 internalConnection];

    if (v14)
    {
      [(NWConnection *)v8 setInternalConnectionState:2];
      [(NWConnection *)v8 start];
      int v14 = v8;
    }
    goto LABEL_6;
  }
  BOOL v16 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  char v27 = "-[NWConnection initWithEndpoint:parameters:]";
  os_log_type_t v17 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v23 = 0;
  if (__nwlog_fault(v17, &type, &v23))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      objc_super v18 = __nwlog_obj();
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        char v27 = "-[NWConnection initWithEndpoint:parameters:]";
        os_log_type_t v20 = "%{public}s [super init] failed";
LABEL_20:
        _os_log_impl(&dword_1830D4000, v18, v19, v20, buf, 0xCu);
      }
    }
    else
    {
      if (v23)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        objc_super v18 = __nwlog_obj();
        os_log_type_t v19 = type;
        BOOL v22 = os_log_type_enabled(v18, type);
        if (backtrace_string)
        {
          if (v22)
          {
            *(_DWORD *)buf = 136446466;
            char v27 = "-[NWConnection initWithEndpoint:parameters:]";
            __int16 v28 = 2082;
            objc_super v29 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v18, v19, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_22;
        }
        if (!v22) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446210;
        char v27 = "-[NWConnection initWithEndpoint:parameters:]";
        os_log_type_t v20 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_20;
      }
      objc_super v18 = __nwlog_obj();
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        char v27 = "-[NWConnection initWithEndpoint:parameters:]";
        os_log_type_t v20 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_20;
      }
    }
LABEL_21:
  }
LABEL_22:
  if (v17) {
    free(v17);
  }
  int v14 = 0;
LABEL_6:

  return v14;
}

- (void)start
{
  objc_initWeak(&location, self);
  BOOL v3 = [(NWConnection *)self internalConnection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __21__NWConnection_start__block_invoke;
  handler[3] = &unk_1E524B440;
  objc_copyWeak(&v17, &location);
  nw_connection_set_state_changed_handler(v3, handler);

  id v4 = [(NWConnection *)self internalConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __21__NWConnection_start__block_invoke_15;
  v14[3] = &unk_1E523C600;
  objc_copyWeak(&v15, &location);
  nw_connection_set_viability_changed_handler(v4, v14);

  unsigned int v5 = [(NWConnection *)self internalConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __21__NWConnection_start__block_invoke_19;
  v12[3] = &unk_1E523C600;
  objc_copyWeak(&v13, &location);
  nw_connection_set_better_path_available_handler(v5, v12);

  id v6 = [(NWConnection *)self internalConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __21__NWConnection_start__block_invoke_20;
  v10[3] = &unk_1E524B478;
  objc_copyWeak(&v11, &location);
  nw_connection_set_path_changed_handler(v6, v10);

  id v7 = [(NWConnection *)self internalConnection];
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
  }
  os_log_type_t v8 = (id)NWCopyInternalQueue_nwQueue;
  nw_connection_set_queue(v7, v8);

  id v9 = [(NWConnection *)self internalConnection];
  nw_connection_start(v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __21__NWConnection_start__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v6 = (id)gLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136446722;
    id v13 = "-[NWConnection start]_block_invoke";
    __int16 v14 = 1024;
    unsigned int v15 = a2;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_DEBUG, "%{public}s Connection got event: state %d %{public}@", (uint8_t *)&v12, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_type_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    uint64_t v10 = [v9 internalConnectionState];
    if (v10 != a2)
    {
      [v9 willChangeValueForKey:@"connectionState"];
      [v9 setInternalConnectionState:a2];
    }
    if (v5)
    {
      [v9 willChangeValueForKey:@"error"];
      CFErrorRef v11 = nw_error_copy_cf_error(v5);
      [v9 setInternalError:v11];
    }
    objc_sync_exit(v9);

    if (v10 != a2) {
      [v9 didChangeValueForKey:@"connectionState"];
    }
    if (v5) {
      [v9 didChangeValueForKey:@"error"];
    }
  }
}

void __21__NWConnection_start__block_invoke_15(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v5 = " not";
    if (a2) {
      unsigned int v5 = "";
    }
    int v9 = 136446466;
    uint64_t v10 = "-[NWConnection start]_block_invoke";
    __int16 v11 = 2082;
    int v12 = v5;
    _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_DEBUG, "%{public}s Connection got viability event: is%{public}s viable", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    if ([v8 internalIsViable] == a2)
    {
      objc_sync_exit(v8);
    }
    else
    {
      [v8 willChangeValueForKey:@"viable"];
      [v8 setInternalIsViable:a2];
      objc_sync_exit(v8);

      [v8 didChangeValueForKey:@"viable"];
    }
  }
}

void __21__NWConnection_start__block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v5 = " not";
    if (a2) {
      unsigned int v5 = "";
    }
    int v9 = 136446466;
    uint64_t v10 = "-[NWConnection start]_block_invoke";
    __int16 v11 = 2082;
    int v12 = v5;
    _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_DEBUG, "%{public}s Connection got better path event: better path%{public}s available", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    if ([v8 internalHasBetterPath] == a2)
    {
      objc_sync_exit(v8);
    }
    else
    {
      [v8 willChangeValueForKey:@"hasBetterPath"];
      [v8 setInternalHasBetterPath:a2];
      objc_sync_exit(v8);

      [v8 didChangeValueForKey:@"hasBetterPath"];
    }
  }
}

void __21__NWConnection_start__block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136446210;
    __int16 v11 = "-[NWConnection start]_block_invoke";
    _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_DEBUG, "%{public}s Connection got updated path event", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = [[NWPath alloc] initWithPath:v3];
    id v7 = WeakRetained;
    objc_sync_enter(v7);
    id v8 = [v7 internalPath];
    BOOL v9 = v8 == v6;

    if (v9)
    {
      objc_sync_exit(v7);
    }
    else
    {
      [v7 willChangeValueForKey:@"currentPath"];
      [v7 setInternalPath:v6];
      objc_sync_exit(v7);

      [v7 didChangeValueForKey:@"currentPath"];
    }
  }
}

@end