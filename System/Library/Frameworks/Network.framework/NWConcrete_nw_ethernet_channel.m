@interface NWConcrete_nw_ethernet_channel
- (id).cxx_construct;
- (uint64_t)createChannel;
- (unsigned)initWithEtherType:(void *)a3 interface:(void *)a4 parameters:;
- (void)close;
- (void)closeChannel:(uint64_t)a1;
- (void)dealloc;
- (void)updateClientState:(void *)a3 error:;
@end

@implementation NWConcrete_nw_ethernet_channel

- (unsigned)initWithEtherType:(void *)a3 interface:(void *)a4 parameters:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  nw_parameters_t v9 = a4;
  if (!a1) {
    goto LABEL_17;
  }
  v56.receiver = a1;
  v56.super_class = (Class)NWConcrete_nw_ethernet_channel;
  v10 = (char *)objc_msgSendSuper2(&v56, sel_init);
  v11 = (unsigned __int16 *)v10;
  if (!v10)
  {
    v38 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
    v39 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v54 = 0;
    if (__nwlog_fault(v39, &type, &v54))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v40 = __nwlog_obj();
        os_log_type_t v41 = type;
        if (os_log_type_enabled(v40, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_1830D4000, v40, v41, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v54)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v40 = __nwlog_obj();
        os_log_type_t v43 = type;
        BOOL v44 = os_log_type_enabled(v40, type);
        if (backtrace_string)
        {
          if (v44)
          {
            *(_DWORD *)buf = 136446466;
            v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
            __int16 v59 = 2082;
            v60 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v40, v43, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_61;
        }
        if (v44)
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_1830D4000, v40, v43, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v40 = __nwlog_obj();
        os_log_type_t v52 = type;
        if (os_log_type_enabled(v40, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_1830D4000, v40, v52, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_61:
    if (v39) {
      free(v39);
    }
    goto LABEL_17;
  }
  *((_WORD *)v10 + 6) = a2;
  v12 = v10 + 12;
  v13 = (nw_interface_t *)(v10 + 16);
  objc_storeStrong((id *)v10 + 2, a3);
  v14 = v8 + 104;
  if (!v8) {
    v14 = 0;
  }
  *((void *)v11 + 3) = v14;
  v15 = (void *)*((void *)v11 + 8);
  *((void *)v11 + 8) = 0;

  v16 = (void *)*((void *)v11 + 5);
  *((void *)v11 + 5) = 0;

  *((unsigned char *)v11 + 113) = 0;
  if (*v12 && *v13)
  {
    if (v9)
    {
      nw_parameters_t v9 = v9;
      id v17 = *((id *)v9[13].isa + 17);

      v18 = (void *)*((void *)v11 + 8);
      *((void *)v11 + 8) = v17;

      id v19 = *((id *)v11 + 8);
      if (v19) {
        goto LABEL_22;
      }
    }
    else
    {
      nw_parameters_t v9 = nw_parameters_create();
    }
    if (nw_context_copy_implicit_context::onceToken != -1) {
      dispatch_once(&nw_context_copy_implicit_context::onceToken, &__block_literal_global_18);
    }
    id v19 = (id)nw_context_copy_implicit_context::implicit_context;
    nw_parameters_set_context(v9, v19);
LABEL_22:
    if (!nw_context_is_inline(v19))
    {
      nw_parameters_require_interface(v9, *v13);
      evaluator_for_custom_ether = nw_path_create_evaluator_for_custom_ether(v9, v11[6]);
      v27 = (void *)*((void *)v11 + 9);
      *((void *)v11 + 9) = evaluator_for_custom_ether;

      if (*((void *)v11 + 9))
      {
        v25 = v11;
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v28 = *((void *)v11 + 19);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v29 = (id)gLogObj;
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
      if (v28)
      {
        if (v30)
        {
          int v31 = *((_DWORD *)v11 + 42);
          int v32 = v11[6];
          uint64_t v34 = *((void *)v11 + 2);
          v33 = (char *)*((void *)v11 + 3);
          *(_DWORD *)buf = 136447746;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          __int16 v59 = 2080;
          v60 = v33;
          __int16 v61 = 1042;
          int v62 = 16;
          __int16 v63 = 2098;
          v64 = (char *)v11 + 115;
          __int16 v65 = 1024;
          int v66 = v31;
          __int16 v67 = 1024;
          int v68 = v32;
          __int16 v69 = 2112;
          uint64_t v70 = v34;
          _os_log_impl(&dword_1830D4000, v29, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] initWithEtherType: failed to create evaluator for ethertype %X interface %@", buf, 0x3Cu);
        }
      }
      else if (v30)
      {
        int v35 = v11[6];
        v36 = (char *)*((void *)v11 + 2);
        *(_DWORD *)buf = 136446978;
        v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
        __int16 v59 = 2114;
        v60 = (char *)v11;
        __int16 v61 = 1024;
        int v62 = v35;
        __int16 v63 = 2112;
        v64 = v36;
        _os_log_impl(&dword_1830D4000, v29, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] initWithEtherType: failed to create evaluator for ethertype %X interface %@", buf, 0x26u);
      }

LABEL_32:
      v25 = 0;
      goto LABEL_33;
    }
    v45 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
    v46 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v54 = 0;
    if (__nwlog_fault(v46, &type, &v54))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v47 = __nwlog_obj();
        os_log_type_t v48 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_1830D4000, v47, v48, "%{public}s Cannot use nw_ethernet_channel on inline contexts", buf, 0xCu);
        }
      }
      else if (v54)
      {
        v49 = (char *)__nw_create_backtrace_string();
        v47 = __nwlog_obj();
        os_log_type_t v50 = type;
        BOOL v51 = os_log_type_enabled(v47, type);
        if (v49)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
            __int16 v59 = 2082;
            v60 = v49;
            _os_log_impl(&dword_1830D4000, v47, v50, "%{public}s Cannot use nw_ethernet_channel on inline contexts, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v49);
          goto LABEL_69;
        }
        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_1830D4000, v47, v50, "%{public}s Cannot use nw_ethernet_channel on inline contexts, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v47 = __nwlog_obj();
        os_log_type_t v53 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_1830D4000, v47, v53, "%{public}s Cannot use nw_ethernet_channel on inline contexts, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_69:
    if (v46) {
      free(v46);
    }
    goto LABEL_32;
  }
  uint64_t v20 = *((void *)v11 + 19);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v21 = (id)gLogObj;
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
  if (v20)
  {
    if (v22)
    {
      v23 = (char *)*((void *)v11 + 3);
      int v24 = *((_DWORD *)v11 + 42);
      *(_DWORD *)buf = 136447234;
      v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
      __int16 v59 = 2080;
      v60 = v23;
      __int16 v61 = 1042;
      int v62 = 16;
      __int16 v63 = 2098;
      v64 = (char *)v11 + 115;
      __int16 v65 = 1024;
      int v66 = v24;
      _os_log_impl(&dword_1830D4000, v21, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] initWithEtherType: must specify ethertype and interface", buf, 0x2Cu);
    }
  }
  else if (v22)
  {
    *(_DWORD *)buf = 136446466;
    v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
    __int16 v59 = 2114;
    v60 = (char *)v11;
    _os_log_impl(&dword_1830D4000, v21, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] initWithEtherType: must specify ethertype and interface", buf, 0x16u);
  }

LABEL_17:
  v25 = 0;
LABEL_34:

  return v25;
}

- (uint64_t)createChannel
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  int v128 = 0;
  if (!*(void *)(a1 + 152))
  {
    v6 = *(void **)(a1 + 88);
    if (!v6)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2114;
        *(void *)v132 = a1;
        _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] createChannel: no flow", buf, 0x16u);
      }

      return 0;
    }
    id v7 = v6;
    *(_DWORD *)(a1 + 132) = *((_DWORD *)v7 + 42);
    if (uuid_is_null((const unsigned __int8 *)v7 + 128))
    {

      uint64_t v8 = *(void *)(a1 + 152);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      nw_parameters_t v9 = (id)gLogObj;
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (v8)
      {
        if (v10)
        {
          uint64_t v11 = *(void *)(a1 + 24);
          int v12 = *(_DWORD *)(a1 + 168);
          *(_DWORD *)buf = 136447234;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2080;
          *(void *)v132 = v11;
          *(_WORD *)&v132[8] = 1042;
          *(_DWORD *)&v132[10] = 16;
          *(_WORD *)&v132[14] = 2098;
          *(void *)&v132[16] = a1 + 115;
          *(_WORD *)&v132[24] = 1024;
          *(_DWORD *)&v132[26] = v12;
          _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: no nexus instance / port", buf, 0x2Cu);
        }
      }
      else if (v10)
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2114;
        *(void *)v132 = a1;
        _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] createChannel: no nexus instance / port", buf, 0x16u);
      }
LABEL_33:

      return 0;
    }
    *(_OWORD *)(a1 + 115) = *((_OWORD *)v7 + 8);

    if ((nw_path_flow_get_id(*(void **)(a1 + 88), (_OWORD *)(a1 + 136)) & 1) == 0)
    {
      uint64_t v26 = *(void *)(a1 + 152);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      nw_parameters_t v9 = (id)gLogObj;
      BOOL v27 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (v26)
      {
        if (v27)
        {
          uint64_t v28 = *(void *)(a1 + 24);
          int v29 = *(_DWORD *)(a1 + 168);
          *(_DWORD *)buf = 136447234;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2080;
          *(void *)v132 = v28;
          *(_WORD *)&v132[8] = 1042;
          *(_DWORD *)&v132[10] = 16;
          *(_WORD *)&v132[14] = 2098;
          *(void *)&v132[16] = a1 + 115;
          *(_WORD *)&v132[24] = 1024;
          *(_DWORD *)&v132[26] = v29;
          _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: no flow id", buf, 0x2Cu);
        }
      }
      else if (v27)
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2114;
        *(void *)v132 = a1;
        _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] createChannel: no flow id", buf, 0x16u);
      }
      goto LABEL_33;
    }
    uint64_t nexus_key = nw_path_flow_get_nexus_key(*(void **)(a1 + 88), &v128);
    int v15 = v128;
    uint64_t v16 = *(void *)(a1 + 152);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v17 = (id)gLogObj;
    v18 = v17;
    if (!nexus_key || !v15)
    {
      BOOL v30 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (v16)
      {
        if (v30)
        {
          uint64_t v31 = *(void *)(a1 + 24);
          int v32 = *(_DWORD *)(a1 + 168);
          *(_DWORD *)buf = 136447234;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2080;
          *(void *)v132 = v31;
          *(_WORD *)&v132[8] = 1042;
          *(_DWORD *)&v132[10] = 16;
          *(_WORD *)&v132[14] = 2098;
          *(void *)&v132[16] = a1 + 115;
          *(_WORD *)&v132[24] = 1024;
          *(_DWORD *)&v132[26] = v32;
          _os_log_impl(&dword_1830D4000, v18, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: no flow key or key length", buf, 0x2Cu);
        }
      }
      else if (v30)
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2114;
        *(void *)v132 = a1;
        _os_log_impl(&dword_1830D4000, v18, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] createChannel: no flow key or key length", buf, 0x16u);
      }

      return 0;
    }
    BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (!v19) {
        goto LABEL_37;
      }
      uint64_t v20 = *(void *)(a1 + 24);
      int v21 = *(_DWORD *)(a1 + 168);
      int v22 = *(_DWORD *)(a1 + 132);
      *(_DWORD *)buf = 136448514;
      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
      __int16 v131 = 2080;
      *(void *)v132 = v20;
      *(_WORD *)&v132[8] = 1042;
      *(_DWORD *)&v132[10] = 16;
      *(_WORD *)&v132[14] = 2098;
      *(void *)&v132[16] = a1 + 115;
      *(_WORD *)&v132[24] = 1024;
      *(_DWORD *)&v132[26] = v21;
      LOWORD(v133) = 1042;
      *(_DWORD *)((char *)&v133 + 2) = 16;
      WORD3(v133) = 2098;
      *((void *)&v133 + 1) = a1 + 136;
      __int16 v134 = 1042;
      *(_DWORD *)v135 = 16;
      *(_WORD *)&v135[4] = 2098;
      *(void *)&v135[6] = a1 + 115;
      __int16 v136 = 1024;
      int v137 = v22;
      v23 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] Establishing channel for flow id %{public, uuid"
            "_t}.16P nexus instance %{public, uuid_t}.16P port %d";
      int v24 = v18;
      uint32_t v25 = 82;
    }
    else
    {
      if (!v19) {
        goto LABEL_37;
      }
      int v33 = *(_DWORD *)(a1 + 132);
      *(_DWORD *)buf = 136447746;
      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
      __int16 v131 = 2114;
      *(void *)v132 = a1;
      *(_WORD *)&v132[8] = 1042;
      *(_DWORD *)&v132[10] = 16;
      *(_WORD *)&v132[14] = 2098;
      *(void *)&v132[16] = a1 + 136;
      *(_WORD *)&v132[24] = 1042;
      *(_DWORD *)&v132[26] = 16;
      LOWORD(v133) = 2098;
      *(void *)((char *)&v133 + 2) = a1 + 115;
      WORD5(v133) = 1024;
      HIDWORD(v133) = v33;
      v23 = "%{public}s [%{public}@] Establishing channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %d";
      int v24 = v18;
      uint32_t v25 = 60;
    }
    _os_log_impl(&dword_1830D4000, v24, OS_LOG_TYPE_DEBUG, v23, buf, v25);
LABEL_37:

    uint64_t v34 = os_channel_attr_create();
    *(void *)(a1 + 160) = v34;
    if (v34)
    {
      int v35 = os_channel_attr_set_key();
      if (v35)
      {
        v36 = __nwlog_obj();
        *(_DWORD *)buf = 136446722;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2112;
        *(void *)v132 = a1;
        *(_WORD *)&v132[8] = 1024;
        *(_DWORD *)&v132[10] = v35;
        v37 = (char *)_os_log_send_and_compose_impl();

        type[0] = OS_LOG_TYPE_ERROR;
        os_log_type_t v127 = OS_LOG_TYPE_DEFAULT;
        if (!__nwlog_fault(v37, type, &v127)) {
          goto LABEL_107;
        }
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          v38 = __nwlog_obj();
          os_log_type_t v39 = type[0];
          if (os_log_type_enabled(v38, type[0]))
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            __int16 v131 = 2112;
            *(void *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v35;
            _os_log_impl(&dword_1830D4000, v38, v39, "%{public}s %@: createChannel failed to set key <err %d> ", buf, 0x1Cu);
          }
LABEL_106:

          goto LABEL_107;
        }
        if (v127 == OS_LOG_TYPE_DEFAULT)
        {
          v38 = __nwlog_obj();
          os_log_type_t v61 = type[0];
          if (os_log_type_enabled(v38, type[0]))
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            __int16 v131 = 2112;
            *(void *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v35;
            _os_log_impl(&dword_1830D4000, v38, v61, "%{public}s %@: createChannel failed to set key <err %d> , backtrace limit exceeded", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        v38 = __nwlog_obj();
        os_log_type_t v46 = type[0];
        BOOL v47 = os_log_type_enabled(v38, type[0]);
        if (!backtrace_string)
        {
          if (v47)
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            __int16 v131 = 2112;
            *(void *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v35;
            _os_log_impl(&dword_1830D4000, v38, v46, "%{public}s %@: createChannel failed to set key <err %d> , no backtrace", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        if (v47)
        {
          *(_DWORD *)buf = 136446978;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2112;
          *(void *)v132 = a1;
          *(_WORD *)&v132[8] = 1024;
          *(_DWORD *)&v132[10] = v35;
          *(_WORD *)&v132[14] = 2082;
          *(void *)&v132[16] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v38, v46, "%{public}s %@: createChannel failed to set key <err %d> , dumping backtrace:%{public}s", buf, 0x26u);
        }
LABEL_81:

        free(backtrace_string);
        goto LABEL_107;
      }
      int v42 = os_channel_attr_set();
      if (v42)
      {
        os_log_type_t v43 = __nwlog_obj();
        *(_DWORD *)buf = 136446722;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2112;
        *(void *)v132 = a1;
        *(_WORD *)&v132[8] = 1024;
        *(_DWORD *)&v132[10] = v42;
        v37 = (char *)_os_log_send_and_compose_impl();

        type[0] = OS_LOG_TYPE_ERROR;
        os_log_type_t v127 = OS_LOG_TYPE_DEFAULT;
        if (!__nwlog_fault(v37, type, &v127)) {
          goto LABEL_107;
        }
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          v38 = __nwlog_obj();
          os_log_type_t v44 = type[0];
          if (os_log_type_enabled(v38, type[0]))
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            __int16 v131 = 2112;
            *(void *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v42;
            _os_log_impl(&dword_1830D4000, v38, v44, "%{public}s %@: createChannel failed to set user-packet-pool attribute <err %d> ", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        if (v127 == OS_LOG_TYPE_DEFAULT)
        {
          v38 = __nwlog_obj();
          os_log_type_t v71 = type[0];
          if (os_log_type_enabled(v38, type[0]))
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            __int16 v131 = 2112;
            *(void *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v42;
            _os_log_impl(&dword_1830D4000, v38, v71, "%{public}s %@: createChannel failed to set user-packet-pool attribute <err %d> , backtrace limit exceeded", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        v38 = __nwlog_obj();
        os_log_type_t v62 = type[0];
        BOOL v63 = os_log_type_enabled(v38, type[0]);
        if (!backtrace_string)
        {
          if (v63)
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            __int16 v131 = 2112;
            *(void *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v42;
            _os_log_impl(&dword_1830D4000, v38, v62, "%{public}s %@: createChannel failed to set user-packet-pool attribute <err %d> , no backtrace", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        if (v63)
        {
          *(_DWORD *)buf = 136446978;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2112;
          *(void *)v132 = a1;
          *(_WORD *)&v132[8] = 1024;
          *(_DWORD *)&v132[10] = v42;
          *(_WORD *)&v132[14] = 2082;
          *(void *)&v132[16] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v38, v62, "%{public}s %@: createChannel failed to set user-packet-pool attribute <err %d> , dumping backtrace:%{public}s", buf, 0x26u);
        }
        goto LABEL_81;
      }
      if (*(_DWORD *)(a1 + 132) < 0x10000u)
      {
        uint64_t extended = os_channel_create_extended();
        *(void *)(a1 + 152) = extended;
        if (extended)
        {
          int fd = os_channel_get_fd();
          *(_DWORD *)(a1 + 168) = fd;
          if ((fd & 0x80000000) == 0)
          {
            uint64_t v53 = *(void *)(a1 + 152);
            char v54 = __nwlog_obj();
            BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG);
            if (v53)
            {
              if (v55)
              {
                uint64_t v56 = *(void *)(a1 + 24);
                int v57 = *(_DWORD *)(a1 + 168);
                *(_DWORD *)buf = 136447234;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                __int16 v131 = 2080;
                *(void *)v132 = v56;
                *(_WORD *)&v132[8] = 1042;
                *(_DWORD *)&v132[10] = 16;
                *(_WORD *)&v132[14] = 2098;
                *(void *)&v132[16] = a1 + 115;
                *(_WORD *)&v132[24] = 1024;
                *(_DWORD *)&v132[26] = v57;
                v58 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: created channel";
                __int16 v59 = v54;
                uint32_t v60 = 44;
LABEL_118:
                _os_log_impl(&dword_1830D4000, v59, OS_LOG_TYPE_DEBUG, v58, buf, v60);
              }
            }
            else if (v55)
            {
              *(_DWORD *)buf = 136446466;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              __int16 v131 = 2114;
              *(void *)v132 = a1;
              v58 = "%{public}s [%{public}@] createChannel: created channel";
              __int16 v59 = v54;
              uint32_t v60 = 22;
              goto LABEL_118;
            }

            *(void *)(a1 + 176) = os_channel_rx_ring();
            uint64_t v81 = os_channel_tx_ring();
            *(void *)(a1 + 184) = v81;
            if (*(void *)(a1 + 176) && v81)
            {
              os_channel_read_attr();
              *(void *)os_log_type_t type = 0;
              os_channel_attr_get();
              *(_WORD *)(a1 + 172) = 0;
              v98 = __nwlog_obj();
              *(_DWORD *)buf = 136446466;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              __int16 v131 = 2112;
              *(void *)v132 = a1;
              v99 = (char *)_os_log_send_and_compose_impl();

              os_log_type_t v127 = OS_LOG_TYPE_ERROR;
              char v125 = 0;
              if (__nwlog_fault(v99, &v127, &v125))
              {
                if (v127 == OS_LOG_TYPE_FAULT)
                {
                  v100 = __nwlog_obj();
                  os_log_type_t v101 = v127;
                  if (os_log_type_enabled(v100, v127))
                  {
                    *(_DWORD *)buf = 136446466;
                    v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                    __int16 v131 = 2112;
                    *(void *)v132 = a1;
                    _os_log_impl(&dword_1830D4000, v100, v101, "%{public}s %@: createChannel: channel slot size 0, clean up channel", buf, 0x16u);
                  }
                }
                else if (v125)
                {
                  v109 = (char *)__nw_create_backtrace_string();
                  v100 = __nwlog_obj();
                  os_log_type_t v110 = v127;
                  BOOL v111 = os_log_type_enabled(v100, v127);
                  if (v109)
                  {
                    if (v111)
                    {
                      *(_DWORD *)buf = 136446722;
                      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                      __int16 v131 = 2112;
                      *(void *)v132 = a1;
                      *(_WORD *)&v132[8] = 2082;
                      *(void *)&v132[10] = v109;
                      _os_log_impl(&dword_1830D4000, v100, v110, "%{public}s %@: createChannel: channel slot size 0, clean up channel, dumping backtrace:%{public}s", buf, 0x20u);
                    }

                    free(v109);
                    goto LABEL_180;
                  }
                  if (v111)
                  {
                    *(_DWORD *)buf = 136446466;
                    v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                    __int16 v131 = 2112;
                    *(void *)v132 = a1;
                    _os_log_impl(&dword_1830D4000, v100, v110, "%{public}s %@: createChannel: channel slot size 0, clean up channel, no backtrace", buf, 0x16u);
                  }
                }
                else
                {
                  v100 = __nwlog_obj();
                  os_log_type_t v114 = v127;
                  if (os_log_type_enabled(v100, v127))
                  {
                    *(_DWORD *)buf = 136446466;
                    v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                    __int16 v131 = 2112;
                    *(void *)v132 = a1;
                    _os_log_impl(&dword_1830D4000, v100, v114, "%{public}s %@: createChannel: channel slot size 0, clean up channel, backtrace limit exceeded", buf, 0x16u);
                  }
                }
              }
LABEL_180:
              if (v99) {
                free(v99);
              }
              -[NWConcrete_nw_ethernet_channel closeChannel:](a1, 0);
              return 0;
            }
            v82 = __nwlog_obj();
            uint64_t v83 = *(void *)(a1 + 176);
            uint64_t v84 = *(void *)(a1 + 184);
            *(_DWORD *)buf = 136446978;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            __int16 v131 = 2112;
            *(void *)v132 = a1;
            *(_WORD *)&v132[8] = 2048;
            *(void *)&v132[10] = v83;
            *(_WORD *)&v132[18] = 2048;
            *(void *)&v132[20] = v84;
            v85 = (char *)_os_log_send_and_compose_impl();

            type[0] = OS_LOG_TYPE_ERROR;
            os_log_type_t v127 = OS_LOG_TYPE_DEFAULT;
            if (!__nwlog_fault(v85, type, &v127)) {
              goto LABEL_171;
            }
            if (type[0] == OS_LOG_TYPE_FAULT)
            {
              v86 = __nwlog_obj();
              os_log_type_t v87 = type[0];
              if (os_log_type_enabled(v86, type[0]))
              {
                uint64_t v88 = *(void *)(a1 + 176);
                uint64_t v89 = *(void *)(a1 + 184);
                *(_DWORD *)buf = 136446978;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                __int16 v131 = 2112;
                *(void *)v132 = a1;
                *(_WORD *)&v132[8] = 2048;
                *(void *)&v132[10] = v88;
                *(_WORD *)&v132[18] = 2048;
                *(void *)&v132[20] = v89;
                _os_log_impl(&dword_1830D4000, v86, v87, "%{public}s %@: createChannel failed to get input / output rings (%lX %lX)", buf, 0x2Au);
              }
            }
            else if (v127)
            {
              v93 = (char *)__nw_create_backtrace_string();
              v86 = __nwlog_obj();
              os_log_type_t v94 = type[0];
              BOOL v95 = os_log_type_enabled(v86, type[0]);
              if (v93)
              {
                if (v95)
                {
                  uint64_t v96 = *(void *)(a1 + 176);
                  uint64_t v97 = *(void *)(a1 + 184);
                  *(_DWORD *)buf = 136447234;
                  v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                  __int16 v131 = 2112;
                  *(void *)v132 = a1;
                  *(_WORD *)&v132[8] = 2048;
                  *(void *)&v132[10] = v96;
                  *(_WORD *)&v132[18] = 2048;
                  *(void *)&v132[20] = v97;
                  *(_WORD *)&v132[28] = 2082;
                  *(void *)&long long v133 = v93;
                  _os_log_impl(&dword_1830D4000, v86, v94, "%{public}s %@: createChannel failed to get input / output rings (%lX %lX), dumping backtrace:%{public}s", buf, 0x34u);
                }

                free(v93);
                goto LABEL_171;
              }
              if (v95)
              {
                uint64_t v112 = *(void *)(a1 + 176);
                uint64_t v113 = *(void *)(a1 + 184);
                *(_DWORD *)buf = 136446978;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                __int16 v131 = 2112;
                *(void *)v132 = a1;
                *(_WORD *)&v132[8] = 2048;
                *(void *)&v132[10] = v112;
                *(_WORD *)&v132[18] = 2048;
                *(void *)&v132[20] = v113;
                _os_log_impl(&dword_1830D4000, v86, v94, "%{public}s %@: createChannel failed to get input / output rings (%lX %lX), no backtrace", buf, 0x2Au);
              }
            }
            else
            {
              v86 = __nwlog_obj();
              os_log_type_t v106 = type[0];
              if (os_log_type_enabled(v86, type[0]))
              {
                uint64_t v107 = *(void *)(a1 + 176);
                uint64_t v108 = *(void *)(a1 + 184);
                *(_DWORD *)buf = 136446978;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                __int16 v131 = 2112;
                *(void *)v132 = a1;
                *(_WORD *)&v132[8] = 2048;
                *(void *)&v132[10] = v107;
                *(_WORD *)&v132[18] = 2048;
                *(void *)&v132[20] = v108;
                _os_log_impl(&dword_1830D4000, v86, v106, "%{public}s %@: createChannel failed to get input / output rings (%lX %lX), backtrace limit exceeded", buf, 0x2Au);
              }
            }

LABEL_171:
            if (v85) {
              free(v85);
            }
LABEL_173:
            -[NWConcrete_nw_ethernet_channel closeChannel:](a1, 0);
            return 0;
          }
          v72 = __nwlog_obj();
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2112;
          *(void *)v132 = a1;
          v73 = (char *)_os_log_send_and_compose_impl();

          type[0] = OS_LOG_TYPE_ERROR;
          os_log_type_t v127 = OS_LOG_TYPE_DEFAULT;
          if (__nwlog_fault(v73, type, &v127))
          {
            if (type[0] == OS_LOG_TYPE_FAULT)
            {
              v74 = __nwlog_obj();
              os_log_type_t v75 = type[0];
              if (os_log_type_enabled(v74, type[0]))
              {
                *(_DWORD *)buf = 136446466;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                __int16 v131 = 2112;
                *(void *)v132 = a1;
                _os_log_impl(&dword_1830D4000, v74, v75, "%{public}s %@: createChannel failed to get channel fd", buf, 0x16u);
              }
            }
            else if (v127)
            {
              v90 = (char *)__nw_create_backtrace_string();
              v74 = __nwlog_obj();
              os_log_type_t v91 = type[0];
              BOOL v92 = os_log_type_enabled(v74, type[0]);
              if (v90)
              {
                if (v92)
                {
                  *(_DWORD *)buf = 136446722;
                  v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                  __int16 v131 = 2112;
                  *(void *)v132 = a1;
                  *(_WORD *)&v132[8] = 2082;
                  *(void *)&v132[10] = v90;
                  _os_log_impl(&dword_1830D4000, v74, v91, "%{public}s %@: createChannel failed to get channel fd, dumping backtrace:%{public}s", buf, 0x20u);
                }

                free(v90);
                goto LABEL_165;
              }
              if (v92)
              {
                *(_DWORD *)buf = 136446466;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                __int16 v131 = 2112;
                *(void *)v132 = a1;
                _os_log_impl(&dword_1830D4000, v74, v91, "%{public}s %@: createChannel failed to get channel fd, no backtrace", buf, 0x16u);
              }
            }
            else
            {
              v74 = __nwlog_obj();
              os_log_type_t v105 = type[0];
              if (os_log_type_enabled(v74, type[0]))
              {
                *(_DWORD *)buf = 136446466;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                __int16 v131 = 2112;
                *(void *)v132 = a1;
                _os_log_impl(&dword_1830D4000, v74, v105, "%{public}s %@: createChannel failed to get channel fd, backtrace limit exceeded", buf, 0x16u);
              }
            }
          }
LABEL_165:
          if (v73) {
            free(v73);
          }
          goto LABEL_173;
        }
        __int16 v65 = __nwlog_obj();
        int v66 = *(_DWORD *)(a1 + 132);
        *(_DWORD *)buf = 136447746;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2112;
        *(void *)v132 = a1;
        *(_WORD *)&v132[8] = 1042;
        *(_DWORD *)&v132[10] = 16;
        *(_WORD *)&v132[14] = 2098;
        *(void *)&v132[16] = a1 + 136;
        *(_WORD *)&v132[24] = 1042;
        *(_DWORD *)&v132[26] = 16;
        LOWORD(v133) = 2098;
        *(void *)((char *)&v133 + 2) = a1 + 115;
        WORD5(v133) = 1024;
        HIDWORD(v133) = v66;
        __int16 v67 = (char *)_os_log_send_and_compose_impl();

        type[0] = OS_LOG_TYPE_ERROR;
        os_log_type_t v127 = OS_LOG_TYPE_DEFAULT;
        if (__nwlog_fault(v67, type, &v127))
        {
          if (type[0] == OS_LOG_TYPE_FAULT)
          {
            int v68 = __nwlog_obj();
            os_log_type_t v69 = type[0];
            if (os_log_type_enabled(v68, type[0]))
            {
              int v70 = *(_DWORD *)(a1 + 132);
              *(_DWORD *)buf = 136447746;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              __int16 v131 = 2112;
              *(void *)v132 = a1;
              *(_WORD *)&v132[8] = 1042;
              *(_DWORD *)&v132[10] = 16;
              *(_WORD *)&v132[14] = 2098;
              *(void *)&v132[16] = a1 + 136;
              *(_WORD *)&v132[24] = 1042;
              *(_DWORD *)&v132[26] = 16;
              LOWORD(v133) = 2098;
              *(void *)((char *)&v133 + 2) = a1 + 115;
              WORD5(v133) = 1024;
              HIDWORD(v133) = v70;
              _os_log_impl(&dword_1830D4000, v68, v69, "%{public}s %@: Failed to create channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %u", buf, 0x3Cu);
            }
          }
          else if (v127)
          {
            v77 = (char *)__nw_create_backtrace_string();
            int v68 = __nwlog_obj();
            os_log_type_t v78 = type[0];
            BOOL v79 = os_log_type_enabled(v68, type[0]);
            if (v77)
            {
              if (v79)
              {
                int v80 = *(_DWORD *)(a1 + 132);
                *(_DWORD *)buf = 136448002;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                __int16 v131 = 2112;
                *(void *)v132 = a1;
                *(_WORD *)&v132[8] = 1042;
                *(_DWORD *)&v132[10] = 16;
                *(_WORD *)&v132[14] = 2098;
                *(void *)&v132[16] = a1 + 136;
                *(_WORD *)&v132[24] = 1042;
                *(_DWORD *)&v132[26] = 16;
                LOWORD(v133) = 2098;
                *(void *)((char *)&v133 + 2) = a1 + 115;
                WORD5(v133) = 1024;
                HIDWORD(v133) = v80;
                __int16 v134 = 2082;
                *(void *)v135 = v77;
                _os_log_impl(&dword_1830D4000, v68, v78, "%{public}s %@: Failed to create channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %u, dumping backtrace:%{public}s", buf, 0x46u);
              }

              free(v77);
              goto LABEL_148;
            }
            if (v79)
            {
              int v104 = *(_DWORD *)(a1 + 132);
              *(_DWORD *)buf = 136447746;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              __int16 v131 = 2112;
              *(void *)v132 = a1;
              *(_WORD *)&v132[8] = 1042;
              *(_DWORD *)&v132[10] = 16;
              *(_WORD *)&v132[14] = 2098;
              *(void *)&v132[16] = a1 + 136;
              *(_WORD *)&v132[24] = 1042;
              *(_DWORD *)&v132[26] = 16;
              LOWORD(v133) = 2098;
              *(void *)((char *)&v133 + 2) = a1 + 115;
              WORD5(v133) = 1024;
              HIDWORD(v133) = v104;
              _os_log_impl(&dword_1830D4000, v68, v78, "%{public}s %@: Failed to create channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %u, no backtrace", buf, 0x3Cu);
            }
          }
          else
          {
            int v68 = __nwlog_obj();
            os_log_type_t v102 = type[0];
            if (os_log_type_enabled(v68, type[0]))
            {
              int v103 = *(_DWORD *)(a1 + 132);
              *(_DWORD *)buf = 136447746;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              __int16 v131 = 2112;
              *(void *)v132 = a1;
              *(_WORD *)&v132[8] = 1042;
              *(_DWORD *)&v132[10] = 16;
              *(_WORD *)&v132[14] = 2098;
              *(void *)&v132[16] = a1 + 136;
              *(_WORD *)&v132[24] = 1042;
              *(_DWORD *)&v132[26] = 16;
              LOWORD(v133) = 2098;
              *(void *)((char *)&v133 + 2) = a1 + 115;
              WORD5(v133) = 1024;
              HIDWORD(v133) = v103;
              _os_log_impl(&dword_1830D4000, v68, v102, "%{public}s %@: Failed to create channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %u, backtrace limit exceeded", buf, 0x3Cu);
            }
          }
        }
LABEL_148:
        if (v67) {
          free(v67);
        }
        goto LABEL_173;
      }
      v115 = __nwlog_obj();
      int v116 = *(_DWORD *)(a1 + 132);
      *(_DWORD *)buf = 136446466;
      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
      __int16 v131 = 1024;
      *(_DWORD *)v132 = v116;
      v37 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      os_log_type_t v127 = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v37, type, &v127))
      {
LABEL_107:
        if (v37) {
          free(v37);
        }
        return 0;
      }
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v38 = __nwlog_obj();
        os_log_type_t v117 = type[0];
        if (os_log_type_enabled(v38, type[0]))
        {
          int v118 = *(_DWORD *)(a1 + 132);
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 1024;
          *(_DWORD *)v132 = v118;
          _os_log_impl(&dword_1830D4000, v38, v117, "%{public}s port %u > NEXUS_PORT_MAX", buf, 0x12u);
        }
        goto LABEL_106;
      }
      if (v127 == OS_LOG_TYPE_DEFAULT)
      {
        v38 = __nwlog_obj();
        os_log_type_t v122 = type[0];
        if (os_log_type_enabled(v38, type[0]))
        {
          int v123 = *(_DWORD *)(a1 + 132);
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 1024;
          *(_DWORD *)v132 = v123;
          _os_log_impl(&dword_1830D4000, v38, v122, "%{public}s port %u > NEXUS_PORT_MAX, backtrace limit exceeded", buf, 0x12u);
        }
        goto LABEL_106;
      }
      os_log_type_t v48 = (char *)__nw_create_backtrace_string();
      v38 = __nwlog_obj();
      os_log_type_t v119 = type[0];
      BOOL v120 = os_log_type_enabled(v38, type[0]);
      if (!v48)
      {
        if (v120)
        {
          int v124 = *(_DWORD *)(a1 + 132);
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 1024;
          *(_DWORD *)v132 = v124;
          _os_log_impl(&dword_1830D4000, v38, v119, "%{public}s port %u > NEXUS_PORT_MAX, no backtrace", buf, 0x12u);
        }
        goto LABEL_106;
      }
      if (v120)
      {
        int v121 = *(_DWORD *)(a1 + 132);
        *(_DWORD *)buf = 136446722;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 1024;
        *(_DWORD *)v132 = v121;
        *(_WORD *)&v132[4] = 2082;
        *(void *)&v132[6] = v48;
        _os_log_impl(&dword_1830D4000, v38, v119, "%{public}s port %u > NEXUS_PORT_MAX, dumping backtrace:%{public}s", buf, 0x1Cu);
      }
    }
    else
    {
      v40 = __nwlog_obj();
      *(_DWORD *)buf = 136446466;
      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
      __int16 v131 = 2112;
      *(void *)v132 = a1;
      v37 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      os_log_type_t v127 = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v37, type, &v127)) {
        goto LABEL_107;
      }
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v38 = __nwlog_obj();
        os_log_type_t v41 = type[0];
        if (os_log_type_enabled(v38, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2112;
          *(void *)v132 = a1;
          _os_log_impl(&dword_1830D4000, v38, v41, "%{public}s %@: createChannel failed to create channel attributes", buf, 0x16u);
        }
        goto LABEL_106;
      }
      if (v127 == OS_LOG_TYPE_DEFAULT)
      {
        v38 = __nwlog_obj();
        os_log_type_t v64 = type[0];
        if (os_log_type_enabled(v38, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2112;
          *(void *)v132 = a1;
          _os_log_impl(&dword_1830D4000, v38, v64, "%{public}s %@: createChannel failed to create channel attributes, backtrace limit exceeded", buf, 0x16u);
        }
        goto LABEL_106;
      }
      os_log_type_t v48 = (char *)__nw_create_backtrace_string();
      v38 = __nwlog_obj();
      os_log_type_t v49 = type[0];
      BOOL v50 = os_log_type_enabled(v38, type[0]);
      if (!v48)
      {
        if (v50)
        {
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          __int16 v131 = 2112;
          *(void *)v132 = a1;
          _os_log_impl(&dword_1830D4000, v38, v49, "%{public}s %@: createChannel failed to create channel attributes, no backtrace", buf, 0x16u);
        }
        goto LABEL_106;
      }
      if (v50)
      {
        *(_DWORD *)buf = 136446722;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        __int16 v131 = 2112;
        *(void *)v132 = a1;
        *(_WORD *)&v132[8] = 2082;
        *(void *)&v132[10] = v48;
        _os_log_impl(&dword_1830D4000, v38, v49, "%{public}s %@: createChannel failed to create channel attributes, dumping backtrace:%{public}s", buf, 0x20u);
      }
    }

    free(v48);
    goto LABEL_107;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 24);
    int v4 = *(_DWORD *)(a1 + 168);
    *(_DWORD *)buf = 136447234;
    v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
    __int16 v131 = 2080;
    *(void *)v132 = v3;
    *(_WORD *)&v132[8] = 1042;
    *(_DWORD *)&v132[10] = 16;
    *(_WORD *)&v132[14] = 2098;
    *(void *)&v132[16] = a1 + 115;
    *(_WORD *)&v132[24] = 1024;
    *(_DWORD *)&v132[26] = v4;
    _os_log_impl(&dword_1830D4000, v2, OS_LOG_TYPE_DEBUG, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: channel already exists", buf, 0x2Cu);
  }

  return 1;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);

  objc_storeStrong((id *)self + 2, 0);
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self && *((void *)self + 19))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = (NWConcrete_nw_ethernet_channel *)*((void *)self + 3);
      int v5 = *((_DWORD *)self + 42);
      *(_DWORD *)buf = 136447234;
      uint64_t v11 = "-[NWConcrete_nw_ethernet_channel dealloc]";
      __int16 v12 = 2080;
      v13 = v4;
      __int16 v14 = 1042;
      int v15 = 16;
      __int16 v16 = 2098;
      id v17 = (char *)self + 115;
      __int16 v18 = 1024;
      int v19 = v5;
      v6 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] dealloc";
      id v7 = v3;
      uint32_t v8 = 44;
LABEL_7:
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_DEBUG, v6, buf, v8);
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v11 = "-[NWConcrete_nw_ethernet_channel dealloc]";
      __int16 v12 = 2114;
      v13 = self;
      v6 = "%{public}s [%{public}@] dealloc";
      id v7 = v3;
      uint32_t v8 = 22;
      goto LABEL_7;
    }
  }

  -[NWConcrete_nw_ethernet_channel close]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_ethernet_channel;
  [(NWConcrete_nw_ethernet_channel *)&v9 dealloc];
}

- (void)close
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 152);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v3 = (id)gLogObj;
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 24);
      int v6 = *(_DWORD *)(a1 + 168);
      int v17 = 136447234;
      __int16 v18 = "-[NWConcrete_nw_ethernet_channel close]";
      __int16 v19 = 2080;
      uint64_t v20 = v5;
      __int16 v21 = 1042;
      int v22 = 16;
      __int16 v23 = 2098;
      uint64_t v24 = a1 + 115;
      __int16 v25 = 1024;
      int v26 = v6;
      id v7 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] close";
      uint32_t v8 = v3;
      uint32_t v9 = 44;
LABEL_7:
      _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v17, v9);
    }
  }
  else if (v4)
  {
    int v17 = 136446466;
    __int16 v18 = "-[NWConcrete_nw_ethernet_channel close]";
    __int16 v19 = 2114;
    uint64_t v20 = a1;
    id v7 = "%{public}s [%{public}@] close";
    uint32_t v8 = v3;
    uint32_t v9 = 22;
    goto LABEL_7;
  }

  BOOL v10 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0;

  uint64_t v11 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = 0;

  __int16 v12 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0;

  -[NWConcrete_nw_ethernet_channel closeChannel:](a1, 0);
  v13 = *(void **)(a1 + 72);
  if (v13)
  {
    nw_path_evaluator_cancel(v13);
    __int16 v14 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;
  }
  int v15 = *(void **)(a1 + 80);
  if (v15)
  {
    nw_path_flow_registration_close(v15);
    __int16 v16 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;
  }
}

- (void)closeChannel:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v4 = *(void *)(a1 + 152);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v5 = (id)gLogObj;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v7 = *(void *)(a1 + 24);
    int v8 = *(_DWORD *)(a1 + 168);
    int v26 = 136447234;
    uint64_t v27 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
    __int16 v28 = 2080;
    uint64_t v29 = v7;
    __int16 v30 = 1042;
    int v31 = 16;
    __int16 v32 = 2098;
    uint64_t v33 = a1 + 115;
    __int16 v34 = 1024;
    int v35 = v8;
    uint32_t v9 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] closeChannel";
    BOOL v10 = v5;
    uint32_t v11 = 44;
  }
  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    int v26 = 136446466;
    uint64_t v27 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
    __int16 v28 = 2114;
    uint64_t v29 = a1;
    uint32_t v9 = "%{public}s [%{public}@] closeChannel";
    BOOL v10 = v5;
    uint32_t v11 = 22;
  }
  _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v26, v11);
LABEL_8:

  if (!*(unsigned char *)(a1 + 113))
  {
    if (a2) {
      posix_error = nw_error_create_posix_error(a2);
    }
    else {
      posix_error = 0;
    }
    -[NWConcrete_nw_ethernet_channel updateClientState:error:](a1, 4, posix_error);
  }
  if (!*(void *)(a1 + 104)) {
    goto LABEL_21;
  }
  uint64_t v13 = *(void *)(a1 + 152);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  __int16 v14 = (id)gLogObj;
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 24);
      int v17 = *(_DWORD *)(a1 + 168);
      int v26 = 136447234;
      uint64_t v27 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
      __int16 v28 = 2080;
      uint64_t v29 = v16;
      __int16 v30 = 1042;
      int v31 = 16;
      __int16 v32 = 2098;
      uint64_t v33 = a1 + 115;
      __int16 v34 = 1024;
      int v35 = v17;
      __int16 v18 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] close: cancel input";
      __int16 v19 = v14;
      uint32_t v20 = 44;
LABEL_19:
      _os_log_impl(&dword_1830D4000, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v26, v20);
    }
  }
  else if (v15)
  {
    int v26 = 136446466;
    uint64_t v27 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
    __int16 v28 = 2114;
    uint64_t v29 = a1;
    __int16 v18 = "%{public}s [%{public}@] close: cancel input";
    __int16 v19 = v14;
    uint32_t v20 = 22;
    goto LABEL_19;
  }

  nw_queue_cancel_source(*(void *)(a1 + 104));
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 0;
LABEL_21:
  if (*(void *)(a1 + 152))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int16 v21 = (id)gLogObj;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *(void *)(a1 + 24);
      int v23 = *(_DWORD *)(a1 + 168);
      int v26 = 136447234;
      uint64_t v27 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
      __int16 v28 = 2080;
      uint64_t v29 = v22;
      __int16 v30 = 1042;
      int v31 = 16;
      __int16 v32 = 2098;
      uint64_t v33 = a1 + 115;
      __int16 v34 = 1024;
      int v35 = v23;
      _os_log_impl(&dword_1830D4000, v21, OS_LOG_TYPE_DEBUG, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] close: cancel channel", (uint8_t *)&v26, 0x2Cu);
    }

    os_channel_destroy();
    *(void *)(a1 + 152) = 0;
  }
  *(_DWORD *)(a1 + 168) = -1;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = 0;
  if (*(void *)(a1 + 160))
  {
    os_channel_attr_destroy();
    *(void *)(a1 + 160) = 0;
  }
  uint64_t v24 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;

  *(_DWORD *)(a1 + 132) = 0;
  uuid_clear((unsigned __int8 *)(a1 + 115));
  uuid_clear((unsigned __int8 *)(a1 + 136));
  __int16 v25 = *(void **)(a1 + 88);
  *(void *)(a1 + 88) = 0;

  *(_WORD *)(a1 + 100) = 0;
  *(_DWORD *)(a1 + 96) = 0;
}

- (void)updateClientState:(void *)a3 error:
{
  id v5 = a3;
  BOOL v6 = *(const void **)(a1 + 48);
  if (v6 && *(void *)(a1 + 40))
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__1931;
    v12[4] = __Block_byref_object_dispose__1932;
    id v13 = _Block_copy(v6);
    uint64_t v7 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__NWConcrete_nw_ethernet_channel_updateClientState_error___block_invoke;
    block[3] = &unk_1E524A1F8;
    BOOL v10 = v12;
    int v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);

    _Block_object_dispose(v12, 8);
  }
}

@end