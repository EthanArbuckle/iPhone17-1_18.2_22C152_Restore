@interface NWConcrete_nw_unique_connection
- (NSString)description;
- (NWConcrete_nw_unique_connection)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_unique_connection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connection, 0);

  objc_storeStrong((id *)&self->endpoint, 0);
}

- (NSString)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = self;
  if (!v2)
  {
    v14 = __nwlog_obj();
    *(_DWORD *)uuid_string_t out = 136446210;
    *(void *)&out[4] = "nw_unique_connection_copy_description";
    v15 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (__nwlog_fault(v15, type, &v24))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v16 = __nwlog_obj();
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v16, type[0]))
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_copy_description";
          _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s called with null uniqueConnection", (uint8_t *)out, 0xCu);
        }
      }
      else if (v24)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v16 = __nwlog_obj();
        os_log_type_t v19 = type[0];
        BOOL v20 = os_log_type_enabled(v16, type[0]);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)uuid_string_t out = 136446466;
            *(void *)&out[4] = "nw_unique_connection_copy_description";
            *(_WORD *)&out[12] = 2082;
            *(void *)&out[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v16, v19, "%{public}s called with null uniqueConnection, dumping backtrace:%{public}s", (uint8_t *)out, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }
        if (v20)
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_copy_description";
          _os_log_impl(&dword_1830D4000, v16, v19, "%{public}s called with null uniqueConnection, no backtrace", (uint8_t *)out, 0xCu);
        }
      }
      else
      {
        v16 = __nwlog_obj();
        os_log_type_t v21 = type[0];
        if (os_log_type_enabled(v16, type[0]))
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_copy_description";
          _os_log_impl(&dword_1830D4000, v16, v21, "%{public}s called with null uniqueConnection, backtrace limit exceeded", (uint8_t *)out, 0xCu);
        }
      }
    }
LABEL_30:
    if (v15) {
      free(v15);
    }
    goto LABEL_32;
  }
  v3 = v2;
  memset(out, 0, sizeof(out));
  uuid_unparse(v2->uuid, out);
  connection = v3->connection;
  if (connection) {
    v5 = nw_service_connector_copy_connection_description(connection);
  }
  else {
    v5 = 0;
  }
  *(void *)type = 0;
  unint64_t uniqueID = v3->uniqueID;
  char v7 = *((unsigned char *)v3 + 500);
  description = nw_endpoint_get_description(v3->endpoint);
  v9 = "incoming";
  if ((v7 & 1) == 0) {
    v9 = "outgoing";
  }
  v10 = " ";
  v11 = "";
  if (v5) {
    v11 = v5;
  }
  else {
    v10 = "";
  }
  asprintf((char **)type, "[SCU%llu %s %s \"%s\" %s recv seq %llu [socket%d]%s%s]", uniqueID, v9, description, v3->service, out, v3->receivedSequenceNumber, v3->dupedSocketFD, v10, v11);
  if (v5) {
    free(v5);
  }
  v12 = *(const char **)type;

  if (v12)
  {
    v13 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
    goto LABEL_33;
  }
LABEL_32:
  v13 = 0;
LABEL_33:

  return (NSString *)v13;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((self->dupedSocketFD & 0x80000000) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    os_log_type_t v17 = "-[NWConcrete_nw_unique_connection dealloc]";
    __int16 v18 = 2114;
    os_log_type_t v19 = self;
    int v12 = 22;
    v11 = buf;
    v4 = (char *)_os_log_send_and_compose_impl();

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
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)buf = 136446466;
          os_log_type_t v17 = "-[NWConcrete_nw_unique_connection dealloc]";
          __int16 v18 = 2114;
          os_log_type_t v19 = self;
          _os_log_impl(&dword_1830D4000, v5, v6, "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD", buf, 0x16u);
        }
      }
      else if (v14)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v5 = (id)gLogObj;
        os_log_type_t v8 = type;
        BOOL v9 = os_log_type_enabled(v5, type);
        if (backtrace_string)
        {
          if (v9)
          {
            *(_DWORD *)buf = 136446722;
            os_log_type_t v17 = "-[NWConcrete_nw_unique_connection dealloc]";
            __int16 v18 = 2114;
            os_log_type_t v19 = self;
            __int16 v20 = 2082;
            os_log_type_t v21 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v5, v8, "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
          if (!v4) {
            goto LABEL_9;
          }
          goto LABEL_8;
        }
        if (v9)
        {
          *(_DWORD *)buf = 136446466;
          os_log_type_t v17 = "-[NWConcrete_nw_unique_connection dealloc]";
          __int16 v18 = 2114;
          os_log_type_t v19 = self;
          _os_log_impl(&dword_1830D4000, v5, v8, "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD, no backtrace", buf, 0x16u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v5 = (id)gLogObj;
        os_log_type_t v10 = type;
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)buf = 136446466;
          os_log_type_t v17 = "-[NWConcrete_nw_unique_connection dealloc]";
          __int16 v18 = 2114;
          os_log_type_t v19 = self;
          _os_log_impl(&dword_1830D4000, v5, v10, "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD, backtrace limit exceeded", buf, 0x16u);
        }
      }
    }
    if (!v4)
    {
LABEL_9:
      close(self->dupedSocketFD);
      self->dupedSocketFD = -1;
      goto LABEL_10;
    }
LABEL_8:
    free(v4);
    goto LABEL_9;
  }
LABEL_10:
  v13.receiver = self;
  v13.super_class = (Class)NWConcrete_nw_unique_connection;
  [(NWConcrete_nw_unique_connection *)&v13 dealloc];
}

- (NWConcrete_nw_unique_connection)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_unique_connection;
  v2 = [(NWConcrete_nw_unique_connection *)&v16 init];
  id v3 = v2;
  if (v2)
  {
    v2->unint64_t uniqueID = atomic_fetch_add(&-[NWConcrete_nw_unique_connection init]::sNWSCUCUniqueID, 1uLL);
    v2->dupedSocketFD = -1;
    v4 = v2;
    goto LABEL_3;
  }
  os_log_type_t v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  __int16 v18 = "-[NWConcrete_nw_unique_connection init]";
  char v7 = (char *)_os_log_send_and_compose_impl();

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
        __int16 v18 = "-[NWConcrete_nw_unique_connection init]";
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
          __int16 v18 = "-[NWConcrete_nw_unique_connection init]";
          __int16 v19 = 2082;
          __int16 v20 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        __int16 v18 = "-[NWConcrete_nw_unique_connection init]";
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
        __int16 v18 = "-[NWConcrete_nw_unique_connection init]";
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