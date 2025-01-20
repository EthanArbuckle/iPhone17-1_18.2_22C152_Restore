@interface NWOutboundMessage
- (NWOutboundMessage)initWithContent:(id)a3;
- (double)relativePriority;
- (unint64_t)expirationMilliseconds;
- (void)addAntecedent:(id)a3;
- (void)setExpirationMilliseconds:(unint64_t)a3;
- (void)setRelativePriority:(double)a3;
@end

@implementation NWOutboundMessage

- (void)addAntecedent:(id)a3
{
  id v4 = a3;
  context = [(NWMessage *)self internalContext];
  v5 = [v4 internalContext];

  nw_content_context_set_antecedent(context, v5);
}

- (void)setRelativePriority:(double)a3
{
  id v4 = [(NWMessage *)self internalContext];
  nw_content_context_set_relative_priority(v4, a3);
}

- (double)relativePriority
{
  v2 = [(NWMessage *)self internalContext];
  double relative_priority = nw_content_context_get_relative_priority(v2);

  return relative_priority;
}

- (void)setExpirationMilliseconds:(unint64_t)a3
{
  id v4 = [(NWMessage *)self internalContext];
  nw_content_context_set_expiration_milliseconds(v4, a3);
}

- (unint64_t)expirationMilliseconds
{
  v2 = [(NWMessage *)self internalContext];
  uint64_t expiration_milliseconds = nw_content_context_get_expiration_milliseconds(v2);

  return expiration_milliseconds;
}

- (NWOutboundMessage)initWithContent:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)NWOutboundMessage;
    v5 = [(NWOutboundMessage *)&v24 init];
    if (v5)
    {
      self = v5;
      v6 = (void *)[v4 _createDispatchData];
      [(NWMessage *)self setInternalContent:v6];

      nw_content_context_t v7 = nw_content_context_create("NWMessage");
      [(NWMessage *)self setInternalContext:v7];

      v8 = [(NWMessage *)self internalContext];

      if (v8)
      {
        self = self;
        v8 = self;
      }
      goto LABEL_5;
    }
    v15 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWOutboundMessage initWithContent:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (!__nwlog_fault(v16, &type, &v25)) {
      goto LABEL_39;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v17 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v19 = "%{public}s [super init] failed";
LABEL_37:
        _os_log_impl(&dword_1830D4000, v17, v18, v19, buf, 0xCu);
      }
    }
    else if (v25)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v17 = __nwlog_obj();
      os_log_type_t v18 = type;
      BOOL v23 = os_log_type_enabled(v17, type);
      if (backtrace_string)
      {
        if (v23)
        {
          *(_DWORD *)buf = 136446466;
          v28 = "-[NWOutboundMessage initWithContent:]";
          __int16 v29 = 2082;
          v30 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v17, v18, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_39;
      }
      if (v23)
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v19 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_37;
      }
    }
    else
    {
      v17 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v19 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_37;
      }
    }

LABEL_39:
    if (v16) {
      free(v16);
    }
    self = 0;
    v8 = 0;
    goto LABEL_5;
  }
  v10 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v28 = "-[NWOutboundMessage initWithContent:]";
  v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v25 = 0;
  if (__nwlog_fault(v11, &type, &v25))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v12 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v14 = "%{public}s called with null content";
LABEL_30:
        _os_log_impl(&dword_1830D4000, v12, v13, v14, buf, 0xCu);
      }
    }
    else
    {
      if (v25)
      {
        v20 = (char *)__nw_create_backtrace_string();
        v12 = __nwlog_obj();
        os_log_type_t v13 = type;
        BOOL v21 = os_log_type_enabled(v12, type);
        if (v20)
        {
          if (v21)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWOutboundMessage initWithContent:]";
            __int16 v29 = 2082;
            v30 = v20;
            _os_log_impl(&dword_1830D4000, v12, v13, "%{public}s called with null content, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v20);
          goto LABEL_32;
        }
        if (!v21) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v14 = "%{public}s called with null content, no backtrace";
        goto LABEL_30;
      }
      v12 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWOutboundMessage initWithContent:]";
        v14 = "%{public}s called with null content, backtrace limit exceeded";
        goto LABEL_30;
      }
    }
LABEL_31:
  }
LABEL_32:
  if (v11) {
    free(v11);
  }
  v8 = 0;
LABEL_5:

  return v8;
}

@end