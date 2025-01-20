@interface NWPHHandler
- (NSArray)allowedEntitlementGroup;
- (NWPHHandler)initWithHandlerFunction:(void *)a3 allowedEntitlementGroup:(id)a4;
- (void)handlerFunction;
- (void)setAllowedEntitlementGroup:(id)a3;
- (void)setHandlerFunction:(void *)a3;
@end

@implementation NWPHHandler

- (void).cxx_destruct
{
}

- (void)setHandlerFunction:(void *)a3
{
  self->_handlerFunction = a3;
}

- (void)handlerFunction
{
  return self->_handlerFunction;
}

- (void)setAllowedEntitlementGroup:(id)a3
{
}

- (NSArray)allowedEntitlementGroup
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NWPHHandler)initWithHandlerFunction:(void *)a3 allowedEntitlementGroup:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NWPHHandler;
  v7 = [(NWPHHandler *)&v20 init];
  v8 = v7;
  if (v7)
  {
    [(NWPHHandler *)v7 setHandlerFunction:a3];
    [(NWPHHandler *)v8 setAllowedEntitlementGroup:v6];
    v9 = v8;
    goto LABEL_3;
  }
  v11 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
  v12 = (char *)_os_log_send_and_compose_impl();

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
        v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
        v15 = "%{public}s [super init] failed";
LABEL_17:
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
            v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
            __int16 v23 = 2082;
            v24 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v17) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
        v15 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]";
        v15 = "%{public}s [super init] failed, backtrace limit exceeded";
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

  return v8;
}

@end