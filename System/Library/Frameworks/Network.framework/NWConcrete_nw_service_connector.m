@interface NWConcrete_nw_service_connector
- (NSString)description;
- (NWConcrete_nw_service_connector)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_service_connector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->remotePubKeys, 0);
  objc_storeStrong((id *)&self->activeOutgoingRequests, 0);
  objc_storeStrong((id *)&self->activeConnections, 0);
  objc_storeStrong((id *)&self->pendingIncomingRequests, 0);
  objc_storeStrong((id *)&self->pendingUnverifiedIncomingRequests, 0);
  objc_storeStrong(&self->serviceAvailableBlock, 0);
  objc_storeStrong((id *)&self->serviceConnectorQueue, 0);
  objc_storeStrong((id *)&self->clientParameters, 0);

  objc_storeStrong((id *)&self->listener, 0);
}

- (NSString)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
    v5 = __nwlog_obj();
    *(_DWORD *)cStr = 136446210;
    *(void *)&cStr[4] = "nw_service_connector_copy_description";
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v14 = 0;
    if (__nwlog_fault(v6, &type, &v14))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v7 = __nwlog_obj();
        os_log_type_t v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_service_connector_copy_description";
          _os_log_impl(&dword_1830D4000, v7, v8, "%{public}s called with null serviceConnector", cStr, 0xCu);
        }
      }
      else if (v14)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v7 = __nwlog_obj();
        os_log_type_t v10 = type;
        BOOL v11 = os_log_type_enabled(v7, type);
        if (backtrace_string)
        {
          if (v11)
          {
            *(_DWORD *)cStr = 136446466;
            *(void *)&cStr[4] = "nw_service_connector_copy_description";
            __int16 v17 = 2082;
            v18 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v7, v10, "%{public}s called with null serviceConnector, dumping backtrace:%{public}s", cStr, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_23;
        }
        if (v11)
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_service_connector_copy_description";
          _os_log_impl(&dword_1830D4000, v7, v10, "%{public}s called with null serviceConnector, no backtrace", cStr, 0xCu);
        }
      }
      else
      {
        v7 = __nwlog_obj();
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_service_connector_copy_description";
          _os_log_impl(&dword_1830D4000, v7, v12, "%{public}s called with null serviceConnector, backtrace limit exceeded", cStr, 0xCu);
        }
      }
    }
LABEL_23:
    if (v6) {
      free(v6);
    }
    goto LABEL_25;
  }
  *(void *)cStr = 0;
  uint64_t state = self->state;
  if (state > 4) {
    v3 = "unknown";
  }
  else {
    v3 = off_1E52433D8[state];
  }
  asprintf((char **)cStr, "[SC%llu port %u %s]", self->uniqueID, self->localPortHBO, v3);
  if (*(void *)cStr)
  {
    v4 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(const char **)cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
    goto LABEL_26;
  }
LABEL_25:
  v4 = 0;
LABEL_26:

  return (NSString *)v4;
}

- (void)dealloc
{
  localPrivKey = self->localPrivKey;
  if (localPrivKey)
  {
    CFRelease(localPrivKey);
    self->localPrivKey = 0;
  }
  retryAddrInUseTimer = self->retryAddrInUseTimer;
  if (retryAddrInUseTimer)
  {
    nw_queue_cancel_source((uint64_t)retryAddrInUseTimer);
    self->retryAddrInUseTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_service_connector;
  [(NWConcrete_nw_service_connector *)&v5 dealloc];
}

- (NWConcrete_nw_service_connector)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_service_connector;
  v2 = [(NWConcrete_nw_service_connector *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_service_connector init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      os_log_type_t v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_service_connector init]";
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      os_log_type_t v8 = __nwlog_obj();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_service_connector init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_service_connector init]";
        _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      os_log_type_t v8 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_service_connector init]";
        _os_log_impl(&dword_1830D4000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_20:
  if (v7) {
    free(v7);
  }
LABEL_3:

  return v3;
}

@end