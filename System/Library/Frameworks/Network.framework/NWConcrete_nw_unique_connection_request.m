@interface NWConcrete_nw_unique_connection_request
- (NSString)description;
- (NWConcrete_nw_unique_connection_request)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_unique_connection_request

- (NWConcrete_nw_unique_connection_request)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_unique_connection_request;
  v2 = [(NWConcrete_nw_unique_connection_request *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->uniqueID = atomic_fetch_add(&-[NWConcrete_nw_unique_connection_request init]::sNWSCUCRUniqueID, 1uLL);
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_unique_connection_request init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_unique_connection_request init]";
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v8 = __nwlog_obj();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_unique_connection_request init]";
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
        v18 = "-[NWConcrete_nw_unique_connection_request init]";
        _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v8 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_unique_connection_request init]";
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->requestCompletionBlock, 0);
  objc_storeStrong((id *)&self->pathEvaluator, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong((id *)&self->userParameters, 0);

  objc_storeStrong((id *)&self->endpoint, 0);
}

- (NSString)description
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = self;
  if (!v2)
  {
    v20 = __nwlog_obj();
    *(_DWORD *)uuid_string_t out = 136446210;
    *(void *)&out[4] = "nw_unique_connection_request_copy_description";
    uint64_t v21 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(v29) = 16;
    char v30 = 0;
    if (__nwlog_fault(v21, &v29, &v30))
    {
      if (v29 == 17)
      {
        v22 = __nwlog_obj();
        os_log_type_t v23 = v29;
        if (os_log_type_enabled(v22, (os_log_type_t)v29))
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_request_copy_description";
          _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s called with null request", (uint8_t *)out, 0xCu);
        }
      }
      else if (v30)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v22 = __nwlog_obj();
        os_log_type_t v25 = v29;
        BOOL v26 = os_log_type_enabled(v22, (os_log_type_t)v29);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)uuid_string_t out = 136446466;
            *(void *)&out[4] = "nw_unique_connection_request_copy_description";
            *(_WORD *)&out[12] = 2082;
            *(void *)&out[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v22, v25, "%{public}s called with null request, dumping backtrace:%{public}s", (uint8_t *)out, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_43;
        }
        if (v26)
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_request_copy_description";
          _os_log_impl(&dword_1830D4000, v22, v25, "%{public}s called with null request, no backtrace", (uint8_t *)out, 0xCu);
        }
      }
      else
      {
        v22 = __nwlog_obj();
        os_log_type_t v27 = v29;
        if (os_log_type_enabled(v22, (os_log_type_t)v29))
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_request_copy_description";
          _os_log_impl(&dword_1830D4000, v22, v27, "%{public}s called with null request, backtrace limit exceeded", (uint8_t *)out, 0xCu);
        }
      }
    }
LABEL_43:
    if (v21) {
      free(v21);
    }
    goto LABEL_45;
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
  v29 = 0;
  unint64_t uniqueID = v3->uniqueID;
  char v7 = *((unsigned char *)v3 + 616);
  description = nw_endpoint_get_description(v3->endpoint);
  os_log_type_t v9 = " processed";
  v10 = "";
  if ((v7 & 0x40) == 0) {
    os_log_type_t v9 = "";
  }
  os_log_type_t v11 = " waitingActiveConnection";
  if ((v7 & 0x10) == 0) {
    os_log_type_t v11 = "";
  }
  BOOL v12 = " waitingListener";
  if ((v7 & 8) == 0) {
    BOOL v12 = "";
  }
  if (v7 >= 0) {
    os_log_type_t v13 = "";
  }
  else {
    os_log_type_t v13 = " waitingPath";
  }
  char v14 = " accepted";
  if ((v7 & 4) == 0) {
    char v14 = "";
  }
  v15 = " pending";
  objc_super v16 = "incoming";
  if ((v7 & 2) == 0) {
    v15 = "";
  }
  if ((v7 & 1) == 0) {
    objc_super v16 = "outgoing";
  }
  v17 = " ";
  if (v5) {
    v10 = v5;
  }
  else {
    v17 = "";
  }
  asprintf(&v29, "[SCR%llu %s%s%s%s%s%s%s %s \"%s\" %s seq %llu%s%s]", uniqueID, v16, v15, v14, v13, v12, v11, v9, description, v3->service, out, v3->sequenceNumber, v17, v10);
  if (v5) {
    free(v5);
  }
  v18 = v29;

  if (v18)
  {
    __int16 v19 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v18, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
    goto LABEL_46;
  }
LABEL_45:
  __int16 v19 = 0;
LABEL_46:

  return (NSString *)v19;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  rejectTimer = self->rejectTimer;
  if (rejectTimer)
  {
    nw_queue_cancel_source((uint64_t)rejectTimer);
    self->rejectTimer = 0;
  }
  preexistingConnectionTimer = self->preexistingConnectionTimer;
  if (preexistingConnectionTimer)
  {
    nw_queue_cancel_source((uint64_t)preexistingConnectionTimer);
    self->preexistingConnectionTimer = 0;
  }
  incomingReqBytesToVerify = self->incomingReqBytesToVerify;
  if (incomingReqBytesToVerify)
  {
    free(incomingReqBytesToVerify);
    self->incomingReqBytesToVerify = 0;
  }
  self->incomingReqBytesToVerifyLen = 0;
  if (!self->requestCompletionBlock) {
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v6 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
  __int16 v21 = 2114;
  v22 = self;
  int v15 = 22;
  char v14 = buf;
  char v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if (__nwlog_fault(v7, &type, &v17))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
        __int16 v21 = 2114;
        v22 = self;
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s Dealloc of %{public}@ with requestCompletionBlock present", buf, 0x16u);
      }
    }
    else if (v17)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
          __int16 v21 = 2114;
          v22 = self;
          __int16 v23 = 2082;
          v24 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s Dealloc of %{public}@ with requestCompletionBlock present, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(backtrace_string);
        if (v7) {
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
        __int16 v21 = 2114;
        v22 = self;
        _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s Dealloc of %{public}@ with requestCompletionBlock present, no backtrace", buf, 0x16u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
        __int16 v21 = 2114;
        v22 = self;
        _os_log_impl(&dword_1830D4000, v8, v13, "%{public}s Dealloc of %{public}@ with requestCompletionBlock present, backtrace limit exceeded", buf, 0x16u);
      }
    }
  }
  if (v7) {
LABEL_14:
  }
    free(v7);
LABEL_15:
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_unique_connection_request;
  [(NWConcrete_nw_unique_connection_request *)&v16 dealloc];
}

@end