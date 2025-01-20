@interface NWRemoteConnectionWriteRequest
- (NSData)data;
- (NSUUID)clientID;
- (NWRemoteConnectionWriteRequest)initWithData:(id)a3 clientID:(id)a4;
- (void)setClientID:(id)a3;
- (void)setData:(id)a3;
@end

@implementation NWRemoteConnectionWriteRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setClientID:(id)a3
{
}

- (NSUUID)clientID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NWRemoteConnectionWriteRequest)initWithData:(id)a3 clientID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NWRemoteConnectionWriteRequest;
  v9 = [(NWRemoteConnectionWriteRequest *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_clientID, a4);
    v11 = v10;
    goto LABEL_3;
  }
  v13 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v24 = "-[NWRemoteConnectionWriteRequest initWithData:clientID:]";
  v14 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v14, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v15 = __nwlog_obj();
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWRemoteConnectionWriteRequest initWithData:clientID:]";
        v17 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v15, v16, v17, buf, 0xCu);
      }
    }
    else
    {
      if (v20)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v15 = __nwlog_obj();
        os_log_type_t v16 = type;
        BOOL v19 = os_log_type_enabled(v15, type);
        if (backtrace_string)
        {
          if (v19)
          {
            *(_DWORD *)buf = 136446466;
            v24 = "-[NWRemoteConnectionWriteRequest initWithData:clientID:]";
            __int16 v25 = 2082;
            v26 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v15, v16, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v19) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWRemoteConnectionWriteRequest initWithData:clientID:]";
        v17 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      v15 = __nwlog_obj();
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWRemoteConnectionWriteRequest initWithData:clientID:]";
        v17 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v14) {
    free(v14);
  }
LABEL_3:

  return v10;
}

@end