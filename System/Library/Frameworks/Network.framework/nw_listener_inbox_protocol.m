@interface nw_listener_inbox_protocol
- (BOOL)cancel;
- (id)description;
- (void)initWithProtocol:(void *)a3 delegate:;
@end

@implementation nw_listener_inbox_protocol

- (void)initWithProtocol:(void *)a3 delegate:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a1) {
    goto LABEL_15;
  }
  v19.receiver = a1;
  v19.super_class = (Class)nw_listener_inbox_protocol;
  v6 = objc_msgSendSuper2(&v19, sel_initWithDelegate_, v5);
  a1 = v6;
  if (!v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v8 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v21 = "-[nw_listener_inbox_protocol initWithProtocol:delegate:]";
    v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v17 = 0;
    if (__nwlog_fault(v9, &type, &v17))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v11 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v21 = "-[nw_listener_inbox_protocol initWithProtocol:delegate:]";
          _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s [super initWithDelegate:] failed", buf, 0xCu);
        }
      }
      else if (v17)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v14 = type;
        BOOL v15 = os_log_type_enabled(v10, type);
        if (backtrace_string)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136446466;
            v21 = "-[nw_listener_inbox_protocol initWithProtocol:delegate:]";
            __int16 v22 = 2082;
            v23 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v10, v14, "%{public}s [super initWithDelegate:] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          if (!v9) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
        if (v15)
        {
          *(_DWORD *)buf = 136446210;
          v21 = "-[nw_listener_inbox_protocol initWithProtocol:delegate:]";
          _os_log_impl(&dword_1830D4000, v10, v14, "%{public}s [super initWithDelegate:] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v16 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v21 = "-[nw_listener_inbox_protocol initWithProtocol:delegate:]";
          _os_log_impl(&dword_1830D4000, v10, v16, "%{public}s [super initWithDelegate:] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
    if (!v9)
    {
LABEL_14:
      a1 = 0;
      goto LABEL_15;
    }
LABEL_13:
    free(v9);
    goto LABEL_14;
  }
  v6[8] = nw_listen_protocol_new_flow;
  v6[9] = nw_listen_protocol_disconnected;
  v6[13] = v6;
  v6[10] = v6 + 8;
  if (((*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 232))(a2) & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "-[nw_listener_inbox_protocol initWithProtocol:delegate:]";
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_ERROR, "%{public}s Failed to add input handler to listening protocol", buf, 0xCu);
    }

    goto LABEL_14;
  }
LABEL_15:

  return a1;
}

- (BOOL)cancel
{
  p_listen_protocol = &self->_listen_protocol;
  protocol_handler = self->_listen_protocol.protocol_handler;
  if (protocol_handler) {
    ((void (*)(void))protocol_handler->callbacks->remove_listen_handler)();
  }
  p_listen_protocol->handle = 0;
  return 0;
}

- (id)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__67787;
  v10 = __Block_byref_object_dispose__67788;
  id v11 = 0;
  p_lock = &self->super._lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__nw_listener_inbox_protocol_description__block_invoke;
  v5[3] = &unk_1E524B978;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->super._lock);
  __41__nw_listener_inbox_protocol_description__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

@end