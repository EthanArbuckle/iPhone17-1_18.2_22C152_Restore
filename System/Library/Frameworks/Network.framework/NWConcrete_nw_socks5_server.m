@interface NWConcrete_nw_socks5_server
- (NSString)description;
- (id)initWithParameters:(void *)a3 clientQueue:;
- (void)dealloc;
@end

@implementation NWConcrete_nw_socks5_server

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ss_assertion_timer, 0);
  objc_storeStrong(&self->outer_connection_handler, 0);
  objc_storeStrong((id *)&self->ss_socks5_udp_associate_connections, 0);
  objc_storeStrong((id *)&self->ss_socks5_connections, 0);
  objc_storeStrong((id *)&self->ss_listener, 0);
  objc_storeStrong(&self->ss_error, 0);
  objc_storeStrong(&self->ss_state_handler, 0);
  objc_storeStrong((id *)&self->ss_client_queue, 0);
  objc_storeStrong((id *)&self->ss_parameters, 0);
  objc_storeStrong((id *)&self->ss_queue, 0);

  objc_storeStrong((id *)&self->ss_internally_retained_object, 0);
}

- (void)dealloc
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "-[NWConcrete_nw_socks5_server dealloc]";
    __int16 v28 = 2114;
    v29 = self;
    _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_INFO, "%{public}s %{public}@", buf, 0x16u);
  }

  IOPMAssertionID ss_assertion = self->ss_assertion;
  if (ss_assertion)
  {
    IOPMAssertionRelease(ss_assertion);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = self->ss_assertion;
      unint64_t ss_assertion_toggle_mach_time = self->ss_assertion_toggle_mach_time;
      uint64_t v8 = mach_continuous_time();
      if (v8 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v8;
      }
      unint64_t v10 = nw_delta_nanos(ss_assertion_toggle_mach_time, v9);
      v27 = "-[NWConcrete_nw_socks5_server dealloc]";
      __int16 v28 = 2112;
      *(_DWORD *)buf = 136446978;
      v29 = self;
      __int16 v30 = 1024;
      unsigned int v31 = v6;
      __int16 v32 = 2048;
      unint64_t v33 = v10 / 0x3B9ACA00;
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %@ released power assertion: %u after %llus", buf, 0x26u);
    }

    self->IOPMAssertionID ss_assertion = 0;
  }
  if (self->ss_internally_retained_object)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v11 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWConcrete_nw_socks5_server dealloc]";
    int v22 = 12;
    v21 = buf;
    v12 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (__nwlog_fault(v12, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (id)gLogObj;
        os_log_type_t v14 = type;
        if (!os_log_type_enabled(v13, type)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        v15 = "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating";
LABEL_25:
        v19 = v13;
        os_log_type_t v20 = v14;
        goto LABEL_26;
      }
      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (id)gLogObj;
        os_log_type_t v14 = type;
        if (!os_log_type_enabled(v13, type)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        v15 = "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating, "
              "backtrace limit exceeded";
        goto LABEL_25;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      os_log_type_t v17 = type;
      BOOL v18 = os_log_type_enabled(v13, type);
      if (!backtrace_string)
      {
        if (!v18)
        {
LABEL_27:

          if (!v12) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        v15 = "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating, no backtrace";
        v19 = v13;
        os_log_type_t v20 = v17;
LABEL_26:
        _os_log_impl(&dword_1830D4000, v19, v20, v15, buf, 0xCu);
        goto LABEL_27;
      }
      if (v18)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        __int16 v28 = 2082;
        v29 = (NWConcrete_nw_socks5_server *)backtrace_string;
        _os_log_impl(&dword_1830D4000, v13, v17, "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (v12) {
LABEL_21:
    }
      free(v12);
  }
LABEL_22:
  v23.receiver = self;
  v23.super_class = (Class)NWConcrete_nw_socks5_server;
  [(NWConcrete_nw_socks5_server *)&v23 dealloc];
}

- (NSString)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
    v4 = __nwlog_obj();
    *(_DWORD *)cStr = 136446210;
    *(void *)&cStr[4] = "nw_socks5_server_copy_description";
    v5 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v12 = 0;
    if (!__nwlog_fault(v5, &type, &v12)) {
      goto LABEL_22;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      unsigned int v6 = __nwlog_obj();
      os_log_type_t v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        *(_DWORD *)cStr = 136446210;
        *(void *)&cStr[4] = "nw_socks5_server_copy_description";
        uint64_t v8 = "%{public}s called with null server";
LABEL_20:
        _os_log_impl(&dword_1830D4000, v6, v7, v8, cStr, 0xCu);
      }
    }
    else
    {
      if (v12)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        unsigned int v6 = __nwlog_obj();
        os_log_type_t v7 = type;
        BOOL v10 = os_log_type_enabled(v6, type);
        if (backtrace_string)
        {
          if (v10)
          {
            *(_DWORD *)cStr = 136446466;
            *(void *)&cStr[4] = "nw_socks5_server_copy_description";
            __int16 v15 = 2082;
            v16 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v6, v7, "%{public}s called with null server, dumping backtrace:%{public}s", cStr, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_22;
        }
        if (!v10) {
          goto LABEL_21;
        }
        *(_DWORD *)cStr = 136446210;
        *(void *)&cStr[4] = "nw_socks5_server_copy_description";
        uint64_t v8 = "%{public}s called with null server, no backtrace";
        goto LABEL_20;
      }
      unsigned int v6 = __nwlog_obj();
      os_log_type_t v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        *(_DWORD *)cStr = 136446210;
        *(void *)&cStr[4] = "nw_socks5_server_copy_description";
        uint64_t v8 = "%{public}s called with null server, backtrace limit exceeded";
        goto LABEL_20;
      }
    }
LABEL_21:

LABEL_22:
    if (v5) {
      free(v5);
    }
    goto LABEL_24;
  }
  *(void *)cStr = 0;
  if (*((unsigned char *)self + 136)) {
    v2 = "SHOES";
  }
  else {
    v2 = "SOCKS";
  }
  asprintf((char **)cStr, "[SP%llu %s]", self->ss_id, v2);
  if (*(void *)cStr)
  {
    v3 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(const char **)cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
    goto LABEL_25;
  }
LABEL_24:
  v3 = 0;
LABEL_25:

  return (NSString *)v3;
}

- (id)initWithParameters:(void *)a3 clientQueue:
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
LABEL_115:
    id v36 = 0;
    goto LABEL_96;
  }
  v74.receiver = a1;
  v74.super_class = (Class)NWConcrete_nw_socks5_server;
  os_log_type_t v7 = objc_msgSendSuper2(&v74, sel_init);
  id v8 = v7;
  if (!v7)
  {
    v64 = __nwlog_obj();
    *(_DWORD *)label = 136446210;
    *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
    v65 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v65, buf, &type))
    {
      if (buf[0] == 17)
      {
        v66 = __nwlog_obj();
        os_log_type_t v67 = buf[0];
        if (os_log_type_enabled(v66, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)label = 136446210;
          *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_1830D4000, v66, v67, "%{public}s [super init] failed", (uint8_t *)label, 0xCu);
        }
      }
      else if (type)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v66 = __nwlog_obj();
        os_log_type_t v69 = buf[0];
        BOOL v70 = os_log_type_enabled(v66, (os_log_type_t)buf[0]);
        if (backtrace_string)
        {
          if (v70)
          {
            *(_DWORD *)label = 136446466;
            *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
            *(_WORD *)&label[12] = 2082;
            *(void *)&label[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v66, v69, "%{public}s [super init] failed, dumping backtrace:%{public}s", (uint8_t *)label, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_113;
        }
        if (v70)
        {
          *(_DWORD *)label = 136446210;
          *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_1830D4000, v66, v69, "%{public}s [super init] failed, no backtrace", (uint8_t *)label, 0xCu);
        }
      }
      else
      {
        v66 = __nwlog_obj();
        os_log_type_t v71 = buf[0];
        if (os_log_type_enabled(v66, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)label = 136446210;
          *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_1830D4000, v66, v71, "%{public}s [super init] failed, backtrace limit exceeded", (uint8_t *)label, 0xCu);
        }
      }
    }
LABEL_113:
    if (v65) {
      free(v65);
    }
    goto LABEL_115;
  }
  v7[1] = atomic_fetch_add(&s_last_server_id, 1uLL);
  *((_DWORD *)v7 + 6) = 0;
  strcpy(label, "com.apple.networking.nw_socks5_server");
  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create(label, v9);
  id v11 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = v10;

  if (*((void *)v8 + 4))
  {
    nw_parameters_t v12 = nw_parameters_create();
    v13 = v12;
    if (!v12)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v41 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
      v42 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v72 = 0;
      if (!__nwlog_fault(v42, &type, &v72)) {
        goto LABEL_91;
      }
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v43 = (id)gLogObj;
        os_log_type_t v44 = type;
        if (os_log_type_enabled(v43, type))
        {
          *(_DWORD *)buf = 136446210;
          v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_1830D4000, v43, v44, "%{public}s nw_parameters_create failed", buf, 0xCu);
        }
        goto LABEL_90;
      }
      if (!v72)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v43 = (id)gLogObj;
        os_log_type_t v60 = type;
        if (os_log_type_enabled(v43, type))
        {
          *(_DWORD *)buf = 136446210;
          v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_1830D4000, v43, v60, "%{public}s nw_parameters_create failed, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_90;
      }
      v48 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v43 = (id)gLogObj;
      os_log_type_t v49 = type;
      BOOL v50 = os_log_type_enabled(v43, type);
      if (!v48)
      {
        if (v50)
        {
          *(_DWORD *)buf = 136446210;
          v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_1830D4000, v43, v49, "%{public}s nw_parameters_create failed, no backtrace", buf, 0xCu);
        }
        goto LABEL_90;
      }
      if (v50)
      {
        *(_DWORD *)buf = 136446466;
        v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        __int16 v77 = 2082;
        v78 = v48;
        _os_log_impl(&dword_1830D4000, v43, v49, "%{public}s nw_parameters_create failed, dumping backtrace:%{public}s", buf, 0x16u);
      }
      goto LABEL_65;
    }
    nw_parameters_set_data_mode(v12, 2u);
    nw_parameters_set_tfo(v13, 1);
    nw_parameters_set_fast_open_force_enable(v13, 1);
    if (v5)
    {
      id v14 = v5;
      BOOL v15 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v14, 0, 0);

      v16 = (void *)*((void *)v8 + 5);
      *((void *)v8 + 5) = v15;

      if (!*((void *)v8 + 5))
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v53 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        v42 = (char *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v72 = 0;
        if (!__nwlog_fault(v42, &type, &v72)) {
          goto LABEL_91;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v43 = (id)gLogObj;
          os_log_type_t v54 = type;
          if (os_log_type_enabled(v43, type))
          {
            *(_DWORD *)buf = 136446210;
            v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
            _os_log_impl(&dword_1830D4000, v43, v54, "%{public}s nw_parameters_copy failed", buf, 0xCu);
          }
          goto LABEL_90;
        }
        if (!v72)
        {
          v43 = __nwlog_obj();
          os_log_type_t v62 = type;
          if (os_log_type_enabled(v43, type))
          {
            *(_DWORD *)buf = 136446210;
            v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
            _os_log_impl(&dword_1830D4000, v43, v62, "%{public}s nw_parameters_copy failed, backtrace limit exceeded", buf, 0xCu);
          }
          goto LABEL_90;
        }
        v48 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v43 = (id)gLogObj;
        os_log_type_t v58 = type;
        BOOL v59 = os_log_type_enabled(v43, type);
        if (!v48)
        {
          if (v59)
          {
            *(_DWORD *)buf = 136446210;
            v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
            _os_log_impl(&dword_1830D4000, v43, v58, "%{public}s nw_parameters_copy failed, no backtrace", buf, 0xCu);
          }
          goto LABEL_90;
        }
        if (v59)
        {
          *(_DWORD *)buf = 136446466;
          v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          __int16 v77 = 2082;
          v78 = v48;
          _os_log_impl(&dword_1830D4000, v43, v58, "%{public}s nw_parameters_copy failed, dumping backtrace:%{public}s", buf, 0x16u);
        }
        goto LABEL_65;
      }
      uint64_t v17 = v14;
      BOOL v18 = *(id *)(v17[13] + 160);

      if (v18) {
        nw_parameters_set_local_endpoint(v13, v18);
      }
      v19 = v17;
      os_log_type_t v20 = *(id *)(v17[13] + 168);

      if (v20) {
        nw_parameters_require_interface(v13, v20);
      }
      v21 = v19;
      int v22 = *(_DWORD *)(v17[13] + 80);

      if (v22)
      {
        objc_super v23 = v13;
        Class isa = v23[13].isa;
        uint64_t v25 = 96;
        if ((*((_WORD *)isa + 50) & 0x100) == 0) {
          uint64_t v25 = 80;
        }
        *(_DWORD *)((char *)isa + v25) = v22;
      }
      v26 = v21;
      BOOL v27 = (v26[12] & 0x8000000) == 0;

      if (!v27)
      {
        __int16 v28 = v13;
        v28[12].Class isa = (Class)((unint64_t)v28[12].isa | 0x8000000);
      }
      v29 = v26;
      BOOL v30 = (*(_WORD *)(v17[13] + 108) & 8) == 0;

      if (!v30)
      {
        unsigned int v31 = v13;
        *((_WORD *)v31[13].isa + 54) |= 8u;
      }
    }
    nw_listener_t v32 = nw_listener_create(v13);
    unint64_t v33 = (void *)*((void *)v8 + 9);
    *((void *)v8 + 9) = v32;

    if (*((void *)v8 + 9))
    {
      objc_storeStrong((id *)v8 + 6, a3);
      BOOL v34 = nw_array_create();
      v35 = (void *)*((void *)v8 + 10);
      *((void *)v8 + 10) = v34;

      id v36 = v8;
LABEL_94:

      goto LABEL_95;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v51 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
    v42 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v72 = 0;
    if (!__nwlog_fault(v42, &type, &v72))
    {
LABEL_91:
      if (!v42)
      {
LABEL_93:
        id v36 = 0;
        goto LABEL_94;
      }
LABEL_92:
      free(v42);
      goto LABEL_93;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v43 = (id)gLogObj;
      os_log_type_t v52 = type;
      if (os_log_type_enabled(v43, type))
      {
        *(_DWORD *)buf = 136446210;
        v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_1830D4000, v43, v52, "%{public}s nw_listener_create failed", buf, 0xCu);
      }
LABEL_90:

      goto LABEL_91;
    }
    if (!v72)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v43 = (id)gLogObj;
      os_log_type_t v61 = type;
      if (os_log_type_enabled(v43, type))
      {
        *(_DWORD *)buf = 136446210;
        v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_1830D4000, v43, v61, "%{public}s nw_listener_create failed, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_90;
    }
    v48 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v43 = (id)gLogObj;
    os_log_type_t v56 = type;
    BOOL v57 = os_log_type_enabled(v43, type);
    if (!v48)
    {
      if (v57)
      {
        *(_DWORD *)buf = 136446210;
        v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_1830D4000, v43, v56, "%{public}s nw_listener_create failed, no backtrace", buf, 0xCu);
      }
      goto LABEL_90;
    }
    if (v57)
    {
      *(_DWORD *)buf = 136446466;
      v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
      __int16 v77 = 2082;
      v78 = v48;
      _os_log_impl(&dword_1830D4000, v43, v56, "%{public}s nw_listener_create failed, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_65:

    free(v48);
    if (!v42) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v37 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
  v38 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v72 = 0;
  if (__nwlog_fault(v38, &type, &v72))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v39 = (id)gLogObj;
      os_log_type_t v40 = type;
      if (os_log_type_enabled(v39, type))
      {
        *(_DWORD *)buf = 136446210;
        v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_1830D4000, v39, v40, "%{public}s dispatch_queue_create failed", buf, 0xCu);
      }
    }
    else if (v72)
    {
      v45 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v39 = (id)gLogObj;
      os_log_type_t v46 = type;
      BOOL v47 = os_log_type_enabled(v39, type);
      if (v45)
      {
        if (v47)
        {
          *(_DWORD *)buf = 136446466;
          v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          __int16 v77 = 2082;
          v78 = v45;
          _os_log_impl(&dword_1830D4000, v39, v46, "%{public}s dispatch_queue_create failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v45);
        if (!v38) {
          goto LABEL_72;
        }
        goto LABEL_71;
      }
      if (v47)
      {
        *(_DWORD *)buf = 136446210;
        v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_1830D4000, v39, v46, "%{public}s dispatch_queue_create failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v39 = (id)gLogObj;
      os_log_type_t v55 = type;
      if (os_log_type_enabled(v39, type))
      {
        *(_DWORD *)buf = 136446210;
        v76 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_1830D4000, v39, v55, "%{public}s dispatch_queue_create failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
  if (v38) {
LABEL_71:
  }
    free(v38);
LABEL_72:
  id v36 = 0;
LABEL_95:

LABEL_96:
  return v36;
}

@end