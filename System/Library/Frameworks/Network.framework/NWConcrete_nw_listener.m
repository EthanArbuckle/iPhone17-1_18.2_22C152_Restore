@interface NWConcrete_nw_listener
- (BOOL)canHandleNewConnection:(id)a3;
- (NSString)description;
- (char)getPeerDeviceID;
- (char)initWithParameters:(void *)a3 multicastDescriptor:;
- (id).cxx_construct;
- (id)getIDSInformation;
- (void)dealloc;
- (void)handleInbound:(id)a3 addProtocolInbox:(BOOL)a4;
- (void)handleInboundPacket:(const char *)a3 length:(unsigned __int16)a4 from:(id)a5 to:(id)a6 interface:(id)a7 socket:(id)a8;
- (void)handleInboxCancelComplete:(id)a3;
- (void)handleInboxFailed:(id)a3 error:(id)a4;
- (void)updateParametersForNewConnection:(id)a3;
@end

@implementation NWConcrete_nw_listener

- (char)initWithParameters:(void *)a3 multicastDescriptor:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (!a1)
  {
LABEL_94:
    v29 = 0;
    goto LABEL_44;
  }
  v59.receiver = a1;
  v59.super_class = (Class)NWConcrete_nw_listener;
  v8 = (char *)objc_msgSendSuper2(&v59, sel_init);
  if (!v8)
  {
    v41 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
    v42 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v57 = 0;
    if (__nwlog_fault(v42, &type, &v57))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v43 = __nwlog_obj();
        os_log_type_t v44 = type;
        if (os_log_type_enabled(v43, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_1830D4000, v43, v44, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v57)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v43 = __nwlog_obj();
        os_log_type_t v50 = type;
        BOOL v51 = os_log_type_enabled(v43, type);
        if (backtrace_string)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
            __int16 v62 = 2082;
            v63 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v43, v50, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_86;
        }
        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_1830D4000, v43, v50, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v43 = __nwlog_obj();
        os_log_type_t v55 = type;
        if (os_log_type_enabled(v43, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_1830D4000, v43, v55, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_86:
    if (v42) {
      free(v42);
    }
    goto LABEL_94;
  }
  if (!v6)
  {
    v45 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
    v46 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v57 = 0;
    if (__nwlog_fault(v46, &type, &v57))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v47 = __nwlog_obj();
        os_log_type_t v48 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_1830D4000, v47, v48, "%{public}s called with null _parameters", buf, 0xCu);
        }
      }
      else if (v57)
      {
        v52 = (char *)__nw_create_backtrace_string();
        v47 = __nwlog_obj();
        os_log_type_t v53 = type;
        BOOL v54 = os_log_type_enabled(v47, type);
        if (v52)
        {
          if (v54)
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
            __int16 v62 = 2082;
            v63 = v52;
            _os_log_impl(&dword_1830D4000, v47, v53, "%{public}s called with null _parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v52);
          goto LABEL_91;
        }
        if (v54)
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_1830D4000, v47, v53, "%{public}s called with null _parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v47 = __nwlog_obj();
        os_log_type_t v56 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_1830D4000, v47, v56, "%{public}s called with null _parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_91:
    if (v46) {
      free(v46);
    }

    goto LABEL_94;
  }
  v9 = v6;
  id v10 = *((id *)v9[13].isa + 20);

  if (v10)
  {
LABEL_5:
    objc_storeStrong((id *)v8 + 2, a2);
    v11 = v9;
    id v12 = *((id *)v9[13].isa + 17);

    v13 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v12;

    v14 = (uint64_t *)(v8 + 32);
    objc_storeStrong((id *)v8 + 4, a3);
    nw_parameters_set_server_mode(*((void **)v8 + 2), 1);
    unsigned int add = atomic_fetch_add(nw_listener_get_next_id(void)::s_last_listener_id, 1u);
    unsigned int v16 = add + 1;
    int v17 = (unsigned __int16)(add + 1);
    if (add + 1 >= 0x10000 && (_WORD)add == 0xFFFF)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v61 = "nw_listener_get_next_id";
        __int16 v62 = 1024;
        LODWORD(v63) = v16;
        _os_log_impl(&dword_1830D4000, v18, OS_LOG_TYPE_ERROR, "%{public}s reached %u listeners, wrapping", buf, 0x12u);
      }
    }
    *((_WORD *)v8 + 20) = v16;
    snprintf(v8 + 42, 6uLL, "L%u", v17);
    v19 = nw_parameters_copy_description_internal(*((NWConcrete_nw_parameters **)v8 + 2), 0);
    uint64_t v20 = *((void *)v8 + 2);
    if (*v14)
    {
      if (!v20 || nw_path_parameters_get_logging_disabled(*(void *)(v20 + 104))) {
        goto LABEL_32;
      }
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
      }
      v21 = (id)glistenerLogObj;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
LABEL_31:

LABEL_32:
        if (v19) {
          free(v19);
        }
        *((_DWORD *)v8 + 26) = -1;
        v29 = v8;
        goto LABEL_43;
      }
      v22 = "<NULL>";
      uint64_t v23 = *v14;
      if (v19) {
        v22 = v19;
      }
      *(_DWORD *)buf = 136446978;
      v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
      __int16 v62 = 2082;
      v63 = v8 + 42;
      __int16 v64 = 2082;
      v65 = v22;
      __int16 v66 = 2114;
      uint64_t v67 = v23;
      v24 = "%{public}s [%{public}s] created: <%{public}s, %{public}@>";
      v25 = v21;
      uint32_t v26 = 42;
    }
    else
    {
      if (!v20 || nw_path_parameters_get_logging_disabled(*(void *)(v20 + 104))) {
        goto LABEL_32;
      }
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
      }
      v21 = (id)glistenerLogObj;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_31;
      }
      v28 = "<NULL>";
      *(_DWORD *)buf = 136446722;
      v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
      __int16 v62 = 2082;
      if (v19) {
        v28 = v19;
      }
      v63 = v8 + 42;
      __int16 v64 = 2082;
      v65 = v28;
      v24 = "%{public}s [%{public}s] created: <%{public}s>";
      v25 = v21;
      uint32_t v26 = 32;
    }
    _os_log_impl(&dword_1830D4000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
    goto LABEL_31;
  }
  *(_WORD *)buf = 0;
  if (nw_utilities_port_for_string("0", buf))
  {
    BOOL host_with_numeric_port = nw_endpoint_create_host_with_numeric_port("::", bswap32(*(unsigned __int16 *)buf) >> 16);
    if (host_with_numeric_port)
    {
      nw_parameters_set_local_endpoint(v9, (nw_endpoint_t)host_with_numeric_port);

      goto LABEL_5;
    }
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v30 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
  v31 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v57 = 0;
  if (__nwlog_fault(v31, &type, &v57))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v32 = (id)gLogObj;
      os_log_type_t v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
        _os_log_impl(&dword_1830D4000, v32, v33, "%{public}s nw_endpoint_create_host failed", buf, 0xCu);
      }
    }
    else if (v57)
    {
      v35 = __nw_create_backtrace_string();
      if (v35)
      {
        v36 = (char *)v35;
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v37 = (id)gLogObj;
        os_log_type_t v38 = type;
        if (os_log_type_enabled(v37, type))
        {
          *(_DWORD *)buf = 136446466;
          v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          __int16 v62 = 2082;
          v63 = v36;
          _os_log_impl(&dword_1830D4000, v37, v38, "%{public}s nw_endpoint_create_host failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v36);
        if (!v31) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
      v32 = __nwlog_obj();
      os_log_type_t v40 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
        _os_log_impl(&dword_1830D4000, v32, v40, "%{public}s nw_endpoint_create_host failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v32 = (id)gLogObj;
      os_log_type_t v39 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v61 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
        _os_log_impl(&dword_1830D4000, v32, v39, "%{public}s nw_endpoint_create_host failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
  if (v31) {
LABEL_41:
  }
    free(v31);
LABEL_42:
  v29 = 0;
LABEL_43:

LABEL_44:
  return v29;
}

- (char)getPeerDeviceID
{
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v3 = (os_unfair_lock_s *)((char *)self + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__NWConcrete_nw_listener_getPeerDeviceID__block_invoke;
  v7[3] = &unk_1E524B978;
  v7[4] = self;
  v7[5] = &v8;
  v4 = (void (**)(void))_Block_copy(v7);
  os_unfair_lock_lock(v3);
  v4[2](v4);
  os_unfair_lock_unlock(v3);

  v5 = (char *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)canHandleNewConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__NWConcrete_nw_listener_canHandleNewConnection___block_invoke;
  v12[3] = &unk_1E524B978;
  v12[4] = self;
  v12[5] = &v13;
  v5 = (void (**)(void))_Block_copy(v12);
  os_unfair_lock_lock((os_unfair_lock_t)self + 2);
  v5[2](v5);
  os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

  int v6 = *((unsigned __int8 *)v14 + 24);
  if (*((unsigned char *)v14 + 24))
  {
    id v7 = self;
    id v8 = v4;
    [v8 suspend];
    uint64_t v9 = *((void *)v7 + 2);
    if (v9 && !nw_path_parameters_get_logging_disabled(*(void *)(v9 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
      }
      uint64_t v10 = (id)glistenerLogObj;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "nw_listener_suspend_inbox";
        __int16 v19 = 2082;
        uint64_t v20 = (char *)v7 + 42;
        __int16 v21 = 2114;
        id v22 = v8;
        _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s [%{public}s] Suspended for %{public}@", buf, 0x20u);
      }
    }
  }
  _Block_object_dispose(&v13, 8);

  return v6 == 0;
}

- (void)updateParametersForNewConnection:(id)a3
{
  id v4 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__18063;
  uint64_t v13 = __Block_byref_object_dispose__18064;
  id v14 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke;
  aBlock[3] = &unk_1E524B978;
  aBlock[4] = self;
  aBlock[5] = &v9;
  v5 = (void (**)(void))_Block_copy(aBlock);
  os_unfair_lock_lock((os_unfair_lock_t)self + 2);
  v5[2](v5);
  os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

  if (v10[5])
  {
    int v6 = nw_parameters_copy_default_protocol_stack(v4);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke_2;
    v7[3] = &unk_1E5240E00;
    v7[4] = self;
    v7[5] = &v9;
    nw_protocol_stack_iterate_application_protocols(v6, v7);
  }
  _Block_object_dispose(&v9, 8);
}

- (void)handleInbound:(id)a3 addProtocolInbox:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  int v6 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v7 = *((void *)self + 2);
  if (v7 && !nw_path_parameters_get_logging_disabled(*(void *)(v7 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
    }
    id v8 = (id)glistenerLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = self;
      uint64_t v10 = (char *)v9 + 42;

      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v81) = v4;
      WORD2(v81) = 2112;
      *(void *)((char *)&v81 + 6) = v6;
      _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s [%{public}s] Handling inbound connection (add inbox %u) %@", buf, 0x26u);
    }
  }
  if (*((_DWORD *)self + 32) == 2 && (*((unsigned char *)self + 302) & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke;
    aBlock[3] = &unk_1E524BAA8;
    aBlock[4] = self;
    uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
    os_unfair_lock_lock((os_unfair_lock_t)self + 2);
    v11[2](v11);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

    id v12 = self;
    if (nw_parameters_get_include_peer_to_peer(*((nw_parameters_t *)self + 2))
      && nw_parameters_get_multipath_service(*((nw_parameters_t *)self + 2))
      && (uint64_t v13 = (void *)*((void *)v12 + 33)) != 0)
    {
      id v14 = v13;
      int v15 = v14[2];

      if (v15 == 2)
      {
        uint64_t v16 = *((void *)self + 2);
        if (v16 && !nw_path_parameters_get_logging_disabled(*(void *)(v16 + 104)))
        {
          if (__nwlog_listener_log::onceToken != -1) {
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
          }
          int v17 = (id)glistenerLogObj;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id_string = nw_listener_get_id_string(v12);
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = id_string;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&long long v81 = v6;
            _os_log_impl(&dword_1830D4000, v17, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Monitoring connection %@ for AWDL usage", buf, 0x20u);
          }
        }
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_41;
        v73[3] = &unk_1E523CEE0;
        v73[4] = v12;
        v74 = v6;
        nw_connection_set_interface_use_callback(v74, v73);
      }
    }
    else
    {
    }
    if (v4)
    {
      uint64_t listener_protocol_on_nw_queue = nw_connection_get_listener_protocol_on_nw_queue(v6, *((void **)self + 2), 0);
      if (listener_protocol_on_nw_queue)
      {
        uint64_t v20 = *((void *)self + 2);
        if (v20 && !nw_path_parameters_get_logging_disabled(*(void *)(v20 + 104)))
        {
          if (__nwlog_listener_log::onceToken != -1) {
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
          }
          __int16 v21 = (id)glistenerLogObj;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            id v22 = v12;

            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = (char *)v22 + 42;
            _os_log_impl(&dword_1830D4000, v21, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Listener found protocol in new connection to create an inbox from", buf, 0x16u);
          }
        }
        uint64_t v23 = -[nw_listener_inbox_protocol initWithProtocol:delegate:]([nw_listener_inbox_protocol alloc], listener_protocol_on_nw_queue, v12);
        if (v23)
        {
          nw_array_append(*((void *)v12 + 18), v23);
        }
        else
        {
          uint64_t v24 = *((void *)self + 2);
          if (v24 && !nw_path_parameters_get_logging_disabled(*(void *)(v24 + 104)))
          {
            if (__nwlog_listener_log::onceToken != -1) {
              dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
            }
            v25 = (id)glistenerLogObj;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              uint32_t v26 = nw_listener_get_id_string(v12);
              uint64_t v27 = *(void *)(listener_protocol_on_nw_queue + 16);
              *(_DWORD *)buf = 136446722;
              *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = v26;
              *(_WORD *)&buf[22] = 2082;
              *(void *)&long long v81 = v27;
              _os_log_impl(&dword_1830D4000, v25, OS_LOG_TYPE_ERROR, "%{public}s [%{public}s] Failed to create inbox for %{public}s", buf, 0x20u);
            }
          }
        }
      }
    }
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    char v72 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&long long v81 = __Block_byref_object_copy__18063;
    *((void *)&v81 + 1) = __Block_byref_object_dispose__18064;
    id v82 = 0;
    uint64_t v63 = 0;
    __int16 v64 = &v63;
    uint64_t v65 = 0x3032000000;
    __int16 v66 = __Block_byref_object_copy__5;
    uint64_t v67 = __Block_byref_object_dispose__6;
    id v68 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__5;
    v61 = __Block_byref_object_dispose__6;
    id v62 = 0;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    BOOL v54 = __Block_byref_object_copy__18063;
    os_log_type_t v55 = __Block_byref_object_dispose__18064;
    id v56 = 0;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_43;
    v50[3] = &unk_1E523DE50;
    v50[4] = v12;
    v50[5] = &v69;
    v50[6] = buf;
    v50[7] = &v63;
    v50[8] = &v57;
    v50[9] = &v51;
    v28 = (void (**)(void))_Block_copy(v50);
    os_unfair_lock_lock((os_unfair_lock_t)self + 2);
    v28[2](v28);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

    if (v58[5])
    {
      v29 = nw_connection_copy_endpoint(v6);
      nw_group_descriptor_t multiplex = nw_group_descriptor_create_multiplex(v29);
      v31 = nw_connection_group_create_with_connection(multiplex, v6);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_2;
      v47[3] = &unk_1E524B978;
      os_log_type_t v48 = v31;
      v49 = &v57;
      v32 = v31;
      os_log_type_t v33 = _Block_copy(v47);
    }
    else
    {
      if (!v64[5])
      {
        uint64_t v39 = *((void *)self + 2);
        if (!v39 || nw_path_parameters_get_logging_disabled(*(void *)(v39 + 104)))
        {
          os_log_type_t v33 = 0;
          goto LABEL_58;
        }
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
        }
        os_log_type_t v38 = (id)glistenerLogObj;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          os_log_type_t v40 = nw_listener_get_id_string(v12);
          *(_DWORD *)v76 = 136446466;
          v77 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
          __int16 v78 = 2082;
          v79 = v40;
          _os_log_impl(&dword_1830D4000, v38, OS_LOG_TYPE_ERROR, "%{public}s [%{public}s] Neither connection handler nor connection group handler is set", v76, 0x16u);
        }
        os_log_type_t v33 = 0;
        goto LABEL_57;
      }
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_3;
      v44[3] = &unk_1E524B978;
      v46 = &v63;
      v45 = v6;
      os_log_type_t v33 = _Block_copy(v44);
      v29 = v45;
    }

    if (*((unsigned char *)v70 + 24))
    {
LABEL_47:
      nw_utilities_execute_block_as_persona_from_parameters((void *)v52[5], v33);
LABEL_58:

      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v57, 8);

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v69, 8);
      goto LABEL_59;
    }
    v34 = *(void **)(*(void *)&buf[8] + 40);
    if (!v34)
    {
      if (nw_context_is_inline(*((void **)self + 3))) {
        goto LABEL_47;
      }
      v34 = *(void **)(*(void *)&buf[8] + 40);
      if (!v34) {
        goto LABEL_58;
      }
    }
    dispatch_qos_class_t v35 = *((_DWORD *)v12 + 18);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_44;
    block[3] = &unk_1E5242B38;
    v43 = &v51;
    os_log_type_t v33 = v33;
    v42 = v33;
    v36 = v34;
    dispatch_block_t v37 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v35, 0, block);
    dispatch_async(v36, v37);

    os_log_type_t v38 = v42;
LABEL_57:

    goto LABEL_58;
  }
LABEL_59:
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 36, 0);
  objc_storeStrong((id *)self + 35, 0);
  objc_storeStrong((id *)self + 34, 0);
  objc_storeStrong((id *)self + 33, 0);
  objc_storeStrong((id *)self + 32, 0);
  objc_storeStrong((id *)self + 28, 0);
  objc_storeStrong((id *)self + 27, 0);
  objc_storeStrong((id *)self + 26, 0);
  objc_storeStrong((id *)self + 25, 0);
  objc_storeStrong((id *)self + 24, 0);
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 21, 0);
  objc_storeStrong((id *)self + 20, 0);
  objc_storeStrong((id *)self + 19, 0);
  objc_storeStrong((id *)self + 18, 0);
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);

  objc_storeStrong((id *)self + 2, 0);
}

- (NSString)description
{
  v2 = self;
  v3 = (os_unfair_lock_s *)v2;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if (v2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __nw_listener_copy_description_block_invoke;
    v8[3] = &unk_1E524B978;
    uint64_t v9 = v2;
    uint64_t v10 = &v11;
    BOOL v4 = (void (**)(void))_Block_copy(v8);
    os_unfair_lock_lock(v3 + 2);
    v4[2](v4);
    os_unfair_lock_unlock(v3 + 2);

    v5 = (const char *)v12[3];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v11, 8);

  if (v5) {
    int v6 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  }
  else {
    int v6 = 0;
  }

  return (NSString *)v6;
}

- (void)dealloc
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*((void *)self + 32))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
    int v22 = 12;
    __int16 v21 = buf;
    BOOL v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (!__nwlog_fault(v4, &type, &v24)) {
      goto LABEL_7;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      os_log_type_t v6 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
        _os_log_impl(&dword_1830D4000, v5, v6, "%{public}s over-release of nw_listener_t! Object should not be internally retained and deallocating", buf, 0xCu);
      }
LABEL_6:

LABEL_7:
      if (!v4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
        _os_log_impl(&dword_1830D4000, v5, v19, "%{public}s over-release of nw_listener_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_6;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    os_log_type_t v14 = type;
    BOOL v15 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
        _os_log_impl(&dword_1830D4000, v5, v14, "%{public}s over-release of nw_listener_t! Object should not be internally retained and deallocating, no backtrace", buf, 0xCu);
      }
      goto LABEL_6;
    }
    if (v15)
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
      __int16 v28 = 2082;
      v29 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v5, v14, "%{public}s over-release of nw_listener_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
    if (v4) {
LABEL_8:
    }
      free(v4);
  }
LABEL_9:
  if (!*((void *)self + 34)) {
    goto LABEL_17;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
  int v22 = 12;
  __int16 v21 = buf;
  id v8 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (!__nwlog_fault(v8, &type, &v24))
  {
LABEL_15:
    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v9 = (id)gLogObj;
    os_log_type_t v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
      _os_log_impl(&dword_1830D4000, v9, v10, "%{public}s listener advertisers were not cleaned up prior to dealloc", buf, 0xCu);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v24)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v9 = (id)gLogObj;
    os_log_type_t v20 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
      _os_log_impl(&dword_1830D4000, v9, v20, "%{public}s listener advertisers were not cleaned up prior to dealloc, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_14;
  }
  uint64_t v16 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v9 = (id)gLogObj;
  os_log_type_t v17 = type;
  BOOL v18 = os_log_type_enabled(v9, type);
  if (!v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
      _os_log_impl(&dword_1830D4000, v9, v17, "%{public}s listener advertisers were not cleaned up prior to dealloc, no backtrace", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (v18)
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v27 = "-[NWConcrete_nw_listener dealloc]";
    __int16 v28 = 2082;
    v29 = v16;
    _os_log_impl(&dword_1830D4000, v9, v17, "%{public}s listener advertisers were not cleaned up prior to dealloc, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v16);
  if (v8) {
LABEL_16:
  }
    free(v8);
LABEL_17:
  uint64_t v11 = (void *)*((void *)self + 29);
  if (v11)
  {
    free(v11);
    *((void *)self + 29) = 0;
  }
  id v12 = (void *)*((void *)self + 7);
  if (v12)
  {
    free(v12);
    *((void *)self + 7) = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)NWConcrete_nw_listener;
  [(NWConcrete_nw_listener *)&v23 dealloc];
}

- (id)getIDSInformation
{
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__18063;
  id v12 = __Block_byref_object_dispose__18064;
  id v13 = 0;
  id v3 = (os_unfair_lock_s *)((char *)self + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__NWConcrete_nw_listener_getIDSInformation__block_invoke;
  v7[3] = &unk_1E524B978;
  v7[4] = self;
  v7[5] = &v8;
  BOOL v4 = (void (**)(void))_Block_copy(v7);
  os_unfair_lock_lock(v3);
  v4[2](v4);
  os_unfair_lock_unlock(v3);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)handleInboxCancelComplete:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  int v5 = *((_DWORD *)self + 74);
  if (v5)
  {
    int v6 = v5 - 1;
    *((_DWORD *)self + 74) = v6;
    uint64_t v7 = *((void *)self + 2);
    if (v7)
    {
      if (!nw_path_parameters_get_logging_disabled(*(void *)(v7 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
        }
        uint64_t v8 = (id)glistenerLogObj;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = self;
          uint64_t v10 = (char *)v9 + 42;

          int v11 = *((_DWORD *)self + 74);
          *(_DWORD *)buf = 136446978;
          uint64_t v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
          __int16 v28 = 2082;
          v29 = v10;
          __int16 v30 = 2114;
          id v31 = v4;
          __int16 v32 = 1024;
          LODWORD(v33) = v11;
          _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Removing deferral for %{public}@ -> %d", buf, 0x26u);
        }
      }
      int v6 = *((_DWORD *)self + 74);
    }
    if (!v6)
    {
      if (*((unsigned char *)self + 302))
      {
        nw_listener_cancel_complete_on_queue(self);
      }
      else if (*((int *)self + 32) <= 2)
      {
        nw_listener_reconcile_inboxes_on_queue(self);
      }
    }
    goto LABEL_36;
  }
  uint64_t v12 = *((void *)self + 2);
  if (!v12 || nw_path_parameters_get_logging_disabled(*(void *)(v12 + 104))) {
    goto LABEL_36;
  }
  if (__nwlog_listener_log::onceToken != -1) {
    dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
  }
  id v13 = (id)glistenerLogObj;
  os_log_type_t v14 = self;

  *(_DWORD *)buf = 136446722;
  uint64_t v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
  __int16 v28 = 2082;
  v29 = (char *)v14 + 42;
  __int16 v30 = 2114;
  id v31 = v4;
  BOOL v15 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (!__nwlog_fault(v15, &type, &v24)) {
    goto LABEL_25;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
    }
    uint64_t v16 = (id)glistenerLogObj;
    os_log_type_t v17 = type;
    if (os_log_type_enabled(v16, type))
    {

      *(_DWORD *)buf = 136446722;
      uint64_t v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
      __int16 v28 = 2082;
      v29 = (char *)v14 + 42;
      __int16 v30 = 2114;
      id v31 = v4;
      _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s [%{public}s] Removing deferral for %{public}@ results in invalid defer count", buf, 0x20u);
    }
LABEL_24:

LABEL_25:
    if (!v15) {
      goto LABEL_36;
    }
LABEL_26:
    free(v15);
    goto LABEL_36;
  }
  if (!v24)
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
    }
    uint64_t v16 = (id)glistenerLogObj;
    os_log_type_t v22 = type;
    if (os_log_type_enabled(v16, type))
    {

      *(_DWORD *)buf = 136446722;
      uint64_t v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
      __int16 v28 = 2082;
      v29 = (char *)v14 + 42;
      __int16 v30 = 2114;
      id v31 = v4;
      _os_log_impl(&dword_1830D4000, v16, v22, "%{public}s [%{public}s] Removing deferral for %{public}@ results in invalid defer count, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_24;
  }
  backtrace_string = __nw_create_backtrace_string();
  if (!backtrace_string)
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
    }
    uint64_t v16 = (id)glistenerLogObj;
    os_log_type_t v23 = type;
    if (os_log_type_enabled(v16, type))
    {

      *(_DWORD *)buf = 136446722;
      uint64_t v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
      __int16 v28 = 2082;
      v29 = (char *)v14 + 42;
      __int16 v30 = 2114;
      id v31 = v4;
      _os_log_impl(&dword_1830D4000, v16, v23, "%{public}s [%{public}s] Removing deferral for %{public}@ results in invalid defer count, no backtrace", buf, 0x20u);
    }
    goto LABEL_24;
  }
  os_log_type_t v19 = (char *)backtrace_string;
  if (__nwlog_listener_log::onceToken != -1) {
    dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
  }
  os_log_type_t v20 = (id)glistenerLogObj;
  os_log_type_t v21 = type;
  if (os_log_type_enabled(v20, type))
  {

    *(_DWORD *)buf = 136446978;
    uint64_t v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
    __int16 v28 = 2082;
    v29 = (char *)v14 + 42;
    __int16 v30 = 2114;
    id v31 = v4;
    __int16 v32 = 2082;
    os_log_type_t v33 = v19;
    _os_log_impl(&dword_1830D4000, v20, v21, "%{public}s [%{public}s] Removing deferral for %{public}@ results in invalid defer count, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v19);
  if (v15) {
    goto LABEL_26;
  }
LABEL_36:
}

- (void)handleInboxFailed:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v6 = (nw_listener_inbox *)a3;
  id v7 = a4;
  nw_context_assert_queue(*((void **)self + 3));
  uint64_t v8 = *((void *)self + 2);
  if (v8 && !nw_path_parameters_get_logging_disabled(*(void *)(v8 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
    }
    uint64_t v9 = (id)glistenerLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = self;
      int v11 = (char *)v10 + 42;

      int v19 = 136446722;
      os_log_type_t v20 = "-[NWConcrete_nw_listener handleInboxFailed:error:]";
      __int16 v21 = 2082;
      os_log_type_t v22 = v11;
      __int16 v23 = 2114;
      char v24 = v6;
      _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s [%{public}s] inbox failed: %{public}@", (uint8_t *)&v19, 0x20u);
    }
  }
  uint64_t v12 = *((void *)self + 18);
  if (!v12 || !v6) {
    goto LABEL_18;
  }
  os_log_type_t v14 = *(nw_listener_inbox ***)(v12 + 16);
  id v13 = *(nw_listener_inbox ***)(v12 + 24);
  if (v14 != v13)
  {
    while (*v14 != v6)
    {
      if (++v14 == v13)
      {
        os_log_type_t v14 = *(nw_listener_inbox ***)(v12 + 24);
        break;
      }
    }
  }
  if (v14 != v13)
  {
    nw_array_remove_object(v12, (uint64_t)v6);
    nw_listener_cancel_inbox_on_queue(self, v6);
    uint64_t v15 = *((void *)self + 18);
    if (!v15 || *(void *)(v15 + 24) == *(void *)(v15 + 16)) {
      nw_listener_set_state_on_queue(self, 1, v7);
    }
  }
  else
  {
LABEL_18:
    uint64_t v16 = *((void *)self + 2);
    if (v16 && !nw_path_parameters_get_logging_disabled(*(void *)(v16 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
      }
      os_log_type_t v17 = (id)glistenerLogObj;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        BOOL v18 = self;

        int v19 = 136446466;
        os_log_type_t v20 = "-[NWConcrete_nw_listener handleInboxFailed:error:]";
        __int16 v21 = 2082;
        os_log_type_t v22 = (char *)v18 + 42;
        _os_log_impl(&dword_1830D4000, v17, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] inbox already removed, not cancelling redundantly", (uint8_t *)&v19, 0x16u);
      }
    }
  }
}

- (void)handleInboundPacket:(const char *)a3 length:(unsigned __int16)a4 from:(id)a5 to:(id)a6 interface:(id)a7 socket:(id)a8
{
  unsigned int v11 = a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  nw_context_assert_queue(*((void **)self + 3));
  if (!a3)
  {
    uint64_t v34 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    dispatch_qos_class_t v35 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v82[0] = 0;
    if (!__nwlog_fault(v35, type, v82)) {
      goto LABEL_128;
    }
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      v36 = __nwlog_obj();
      os_log_type_t v37 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v37, "%{public}s called with null buffer", buf, 0xCu);
      }
    }
    else if (v82[0])
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v36 = __nwlog_obj();
      os_log_type_t v49 = type[0];
      BOOL v50 = os_log_type_enabled(v36, type[0]);
      if (backtrace_string)
      {
        if (v50)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v36, v49, "%{public}s called with null buffer, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_128:
        if (!v35) {
          goto LABEL_30;
        }
LABEL_129:
        free(v35);
        goto LABEL_30;
      }
      if (v50)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v49, "%{public}s called with null buffer, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v36 = __nwlog_obj();
      os_log_type_t v62 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v62, "%{public}s called with null buffer, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_127:

    goto LABEL_128;
  }
  if (!v11)
  {
    os_log_type_t v38 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    dispatch_qos_class_t v35 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v82[0] = 0;
    if (!__nwlog_fault(v35, type, v82)) {
      goto LABEL_128;
    }
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      v36 = __nwlog_obj();
      os_log_type_t v39 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v39, "%{public}s called with null length", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v82[0])
    {
      v36 = __nwlog_obj();
      os_log_type_t v63 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v63, "%{public}s called with null length, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    uint64_t v51 = (char *)__nw_create_backtrace_string();
    v36 = __nwlog_obj();
    os_log_type_t v52 = type[0];
    BOOL v53 = os_log_type_enabled(v36, type[0]);
    if (!v51)
    {
      if (v53)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v52, "%{public}s called with null length, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v53)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v51;
      _os_log_impl(&dword_1830D4000, v36, v52, "%{public}s called with null length, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_90;
  }
  if (!v14)
  {
    os_log_type_t v40 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    dispatch_qos_class_t v35 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v82[0] = 0;
    if (!__nwlog_fault(v35, type, v82)) {
      goto LABEL_128;
    }
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      v36 = __nwlog_obj();
      os_log_type_t v41 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v41, "%{public}s called with null source", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v82[0])
    {
      v36 = __nwlog_obj();
      os_log_type_t v64 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v64, "%{public}s called with null source, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    uint64_t v51 = (char *)__nw_create_backtrace_string();
    v36 = __nwlog_obj();
    os_log_type_t v54 = type[0];
    BOOL v55 = os_log_type_enabled(v36, type[0]);
    if (!v51)
    {
      if (v55)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v54, "%{public}s called with null source, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v55)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v51;
      _os_log_impl(&dword_1830D4000, v36, v54, "%{public}s called with null source, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_90;
  }
  if (!v15)
  {
    v42 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    dispatch_qos_class_t v35 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v82[0] = 0;
    if (!__nwlog_fault(v35, type, v82)) {
      goto LABEL_128;
    }
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      v36 = __nwlog_obj();
      os_log_type_t v43 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v43, "%{public}s called with null destination", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v82[0])
    {
      v36 = __nwlog_obj();
      os_log_type_t v65 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v65, "%{public}s called with null destination, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    uint64_t v51 = (char *)__nw_create_backtrace_string();
    v36 = __nwlog_obj();
    os_log_type_t v56 = type[0];
    BOOL v57 = os_log_type_enabled(v36, type[0]);
    if (!v51)
    {
      if (v57)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v56, "%{public}s called with null destination, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v57)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v51;
      _os_log_impl(&dword_1830D4000, v36, v56, "%{public}s called with null destination, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_90;
  }
  if (!v16)
  {
    os_log_type_t v44 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    dispatch_qos_class_t v35 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v82[0] = 0;
    if (!__nwlog_fault(v35, type, v82)) {
      goto LABEL_128;
    }
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      v36 = __nwlog_obj();
      os_log_type_t v45 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v45, "%{public}s called with null interface", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v82[0])
    {
      v36 = __nwlog_obj();
      os_log_type_t v66 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v66, "%{public}s called with null interface, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    uint64_t v51 = (char *)__nw_create_backtrace_string();
    v36 = __nwlog_obj();
    os_log_type_t v58 = type[0];
    BOOL v59 = os_log_type_enabled(v36, type[0]);
    if (!v51)
    {
      if (v59)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v58, "%{public}s called with null interface, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v59)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v51;
      _os_log_impl(&dword_1830D4000, v36, v58, "%{public}s called with null interface, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_90;
  }
  if (!v17)
  {
    v46 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    dispatch_qos_class_t v35 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v82[0] = 0;
    if (!__nwlog_fault(v35, type, v82)) {
      goto LABEL_128;
    }
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      v36 = __nwlog_obj();
      os_log_type_t v47 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v47, "%{public}s called with null socket", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v82[0])
    {
      v36 = __nwlog_obj();
      os_log_type_t v67 = type[0];
      if (os_log_type_enabled(v36, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v67, "%{public}s called with null socket, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    uint64_t v51 = (char *)__nw_create_backtrace_string();
    v36 = __nwlog_obj();
    os_log_type_t v60 = type[0];
    BOOL v61 = os_log_type_enabled(v36, type[0]);
    if (!v51)
    {
      if (v61)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_1830D4000, v36, v60, "%{public}s called with null socket, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v61)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v51;
      _os_log_impl(&dword_1830D4000, v36, v60, "%{public}s called with null socket, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_90:

    free(v51);
    if (!v35) {
      goto LABEL_30;
    }
    goto LABEL_129;
  }
  if (*((_DWORD *)self + 32) == 2 && (*((unsigned char *)self + 302) & 1) == 0)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v87 = __Block_byref_object_copy__5;
    v88 = __Block_byref_object_dispose__6;
    id v89 = 0;
    *(void *)os_log_type_t type = 0;
    v77 = type;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__18063;
    v80 = __Block_byref_object_dispose__18064;
    id v81 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke;
    aBlock[3] = &unk_1E5244950;
    aBlock[4] = self;
    void aBlock[5] = buf;
    void aBlock[6] = type;
    BOOL v18 = (void (**)(void))_Block_copy(aBlock);
    os_unfair_lock_lock((os_unfair_lock_t)self + 2);
    v18[2](v18);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      dispatch_data_t v19 = dispatch_data_create(a3, v11, 0, 0);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke_45;
      v68[3] = &unk_1E523CF08;
      v74 = buf;
      id v69 = v14;
      id v70 = v15;
      id v71 = v16;
      id v72 = v17;
      os_log_type_t v20 = v19;
      v73 = v20;
      __int16 v21 = (void (**)(void))_Block_copy(v68);
      os_log_type_t v22 = v21;
      __int16 v23 = (void *)*((void *)v77 + 5);
      if (v23)
      {
        dispatch_qos_class_t v24 = *((_DWORD *)self + 18);
        uint64_t v25 = v21;
        uint32_t v26 = v23;
        dispatch_block_t v27 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v24, 0, v25);
        dispatch_async(v26, v27);
      }
      else if (nw_context_is_inline(*((void **)self + 3)))
      {
        v22[2](v22);
      }
    }
    else
    {
      uint64_t v32 = *((void *)self + 2);
      if (!v32 || nw_path_parameters_get_logging_disabled(*(void *)(v32 + 104))) {
        goto LABEL_29;
      }
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
      }
      os_log_type_t v20 = (id)glistenerLogObj;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        os_log_type_t v33 = self;

        *(_DWORD *)id v82 = 136446466;
        uint64_t v83 = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        __int16 v84 = 2082;
        v85 = (char *)v33 + 42;
        _os_log_impl(&dword_1830D4000, v20, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] ignoring inbound packet: no new packet handler", v82, 0x16u);
      }
    }

LABEL_29:
    _Block_object_dispose(type, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
  uint64_t v28 = *((void *)self + 2);
  if (v28 && !nw_path_parameters_get_logging_disabled(*(void *)(v28 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
    }
    v29 = (id)glistenerLogObj;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      __int16 v30 = self;
      id v31 = (char *)v30 + 42;

      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_1830D4000, v29, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] ignoring inbound packet: not ready or no client queue", buf, 0x16u);
    }
  }
LABEL_30:
}

@end