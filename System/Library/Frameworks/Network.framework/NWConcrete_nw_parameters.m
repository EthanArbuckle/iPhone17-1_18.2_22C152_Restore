@interface NWConcrete_nw_parameters
- (BOOL)initWithParameters:(char)a3 stripConnected:(int)a4 shallowCopy:;
- (NSString)description;
- (id)initWithStack:(id *)a1;
- (void)dealloc;
@end

@implementation NWConcrete_nw_parameters

- (id)initWithStack:(id *)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1) {
    goto LABEL_18;
  }
  v31.receiver = a1;
  v31.super_class = (Class)NWConcrete_nw_parameters;
  a1 = (id *)objc_msgSendSuper2(&v31, sel_init);
  if (!a1)
  {
    v14 = __nwlog_obj();
    LODWORD(buffer[0]) = 136446210;
    *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    char v30 = 0;
    if (__nwlog_fault(v15, buf, &v30))
    {
      if (buf[0] == 17)
      {
        v16 = __nwlog_obj();
        os_log_type_t v17 = buf[0];
        if (os_log_type_enabled(v16, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s [super init] failed", (uint8_t *)buffer, 0xCu);
        }
      }
      else if (v30)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v16 = __nwlog_obj();
        os_log_type_t v23 = buf[0];
        BOOL v24 = os_log_type_enabled(v16, (os_log_type_t)buf[0]);
        if (backtrace_string)
        {
          if (v24)
          {
            LODWORD(buffer[0]) = 136446466;
            *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
            WORD6(buffer[0]) = 2082;
            *(void *)((char *)buffer + 14) = backtrace_string;
            _os_log_impl(&dword_1830D4000, v16, v23, "%{public}s [super init] failed, dumping backtrace:%{public}s", (uint8_t *)buffer, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_48;
        }
        if (v24)
        {
          LODWORD(buffer[0]) = 136446210;
          *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_1830D4000, v16, v23, "%{public}s [super init] failed, no backtrace", (uint8_t *)buffer, 0xCu);
        }
      }
      else
      {
        v16 = __nwlog_obj();
        os_log_type_t v28 = buf[0];
        if (os_log_type_enabled(v16, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_1830D4000, v16, v28, "%{public}s [super init] failed, backtrace limit exceeded", (uint8_t *)buffer, 0xCu);
        }
      }
    }
LABEL_48:
    if (v15) {
      free(v15);
    }
    goto LABEL_56;
  }
  v5 = objc_alloc_init(NWConcrete_nw_path_parameters);
  id v6 = a1[13];
  a1[13] = v5;

  if (!a1[13])
  {
    v18 = __nwlog_obj();
    LODWORD(buffer[0]) = 136446210;
    *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    char v30 = 0;
    if (__nwlog_fault(v19, buf, &v30))
    {
      if (buf[0] == 17)
      {
        v20 = __nwlog_obj();
        os_log_type_t v21 = buf[0];
        if (os_log_type_enabled(v20, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_1830D4000, v20, v21, "%{public}s called with null self->path_parameters", (uint8_t *)buffer, 0xCu);
        }
      }
      else if (v30)
      {
        v25 = (char *)__nw_create_backtrace_string();
        v20 = __nwlog_obj();
        os_log_type_t v26 = buf[0];
        BOOL v27 = os_log_type_enabled(v20, (os_log_type_t)buf[0]);
        if (v25)
        {
          if (v27)
          {
            LODWORD(buffer[0]) = 136446466;
            *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
            WORD6(buffer[0]) = 2082;
            *(void *)((char *)buffer + 14) = v25;
            _os_log_impl(&dword_1830D4000, v20, v26, "%{public}s called with null self->path_parameters, dumping backtrace:%{public}s", (uint8_t *)buffer, 0x16u);
          }

          free(v25);
          goto LABEL_53;
        }
        if (v27)
        {
          LODWORD(buffer[0]) = 136446210;
          *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_1830D4000, v20, v26, "%{public}s called with null self->path_parameters, no backtrace", (uint8_t *)buffer, 0xCu);
        }
      }
      else
      {
        v20 = __nwlog_obj();
        os_log_type_t v29 = buf[0];
        if (os_log_type_enabled(v20, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_1830D4000, v20, v29, "%{public}s called with null self->path_parameters, backtrace limit exceeded", (uint8_t *)buffer, 0xCu);
        }
      }
    }
LABEL_53:
    if (v19) {
      free(v19);
    }

LABEL_56:
    a1 = 0;
    goto LABEL_18;
  }
  *((_DWORD *)a1[13] + 16) = getpid();
  *((_DWORD *)a1[13] + 17) = getuid();
  v7 = a1[13];
  a1[12] = (id)((unint64_t)a1[12] | 0x8000040);
  uint64_t v37 = 0;
  memset(buffer, 0, sizeof(buffer));
  if (proc_pidinfo(v7[16], 17, 1uLL, buffer, 56) == 56)
  {
    long long v8 = buffer[0];
    *(_OWORD *)((char *)a1[13] + 24) = buffer[0];
    *(_OWORD *)((char *)a1[13] + 8) = v8;
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = *((_DWORD *)a1[13] + 16);
      *(_DWORD *)buf = 136446466;
      v33 = "-[NWConcrete_nw_parameters initWithStack:]";
      __int16 v34 = 1024;
      int v35 = v10;
      _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, "%{public}s Failed to convert from local PID (%d) to UUID", buf, 0x12u);
    }
  }
  v11 = (const char *)nw_setting_multipath_service_type;
  networkd_settings_init();
  if (sCachedSettings)
  {
    pthread_mutex_lock(&sSettingsMutex);
    if (sCachedSettings) {
      int int64 = xpc_dictionary_get_int64((xpc_object_t)sCachedSettings, v11);
    }
    else {
      int int64 = 0;
    }
    pthread_mutex_unlock(&sSettingsMutex);
  }
  else
  {
    int int64 = 0;
  }
  *(_DWORD *)((char *)a1[13] + 103) = int64;
  objc_storeStrong(a1 + 19, a2);
  if (nw_context_copy_implicit_context::onceToken != -1) {
    dispatch_once(&nw_context_copy_implicit_context::onceToken, &__block_literal_global_18);
  }
  objc_storeStrong((id *)a1[13] + 17, (id)nw_context_copy_implicit_context::implicit_context);
LABEL_18:

  return a1;
}

- (BOOL)initWithParameters:(char)a3 stripConnected:(int)a4 shallowCopy:
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  v7 = a2;
  if (!a1) {
    goto LABEL_103;
  }
  v151.receiver = a1;
  v151.super_class = (Class)NWConcrete_nw_parameters;
  long long v8 = (char *)objc_msgSendSuper2(&v151, sel_init);
  a1 = (id *)v8;
  if (!v8)
  {
    v95 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
    v96 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v153 = OS_LOG_TYPE_ERROR;
    char v152 = 0;
    if (__nwlog_fault(v96, &v153, &v152))
    {
      if (v153 == OS_LOG_TYPE_FAULT)
      {
        v97 = __nwlog_obj();
        os_log_type_t v98 = v153;
        if (os_log_type_enabled(v97, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_1830D4000, v97, v98, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v152)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v97 = __nwlog_obj();
        os_log_type_t v112 = v153;
        BOOL v113 = os_log_type_enabled(v97, v153);
        if (backtrace_string)
        {
          if (v113)
          {
            *(_DWORD *)buf = 136446466;
            v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
            __int16 v156 = 2082;
            uint64_t v157 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_1830D4000, v97, v112, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_178;
        }
        if (v113)
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_1830D4000, v97, v112, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v97 = __nwlog_obj();
        os_log_type_t v142 = v153;
        if (os_log_type_enabled(v97, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_1830D4000, v97, v142, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_178:
    if (v96) {
      free(v96);
    }
    goto LABEL_192;
  }
  if (!v7)
  {
    v99 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
    v100 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v153 = OS_LOG_TYPE_ERROR;
    char v152 = 0;
    if (__nwlog_fault(v100, &v153, &v152))
    {
      if (v153 == OS_LOG_TYPE_FAULT)
      {
        v101 = __nwlog_obj();
        os_log_type_t v102 = v153;
        if (os_log_type_enabled(v101, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_1830D4000, v101, v102, "%{public}s called with null parameters", buf, 0xCu);
        }
      }
      else if (v152)
      {
        v118 = (char *)__nw_create_backtrace_string();
        v101 = __nwlog_obj();
        os_log_type_t v119 = v153;
        BOOL v120 = os_log_type_enabled(v101, v153);
        if (v118)
        {
          if (v120)
          {
            *(_DWORD *)buf = 136446466;
            v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
            __int16 v156 = 2082;
            uint64_t v157 = (uint64_t)v118;
            _os_log_impl(&dword_1830D4000, v101, v119, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v118);
          goto LABEL_183;
        }
        if (v120)
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_1830D4000, v101, v119, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v101 = __nwlog_obj();
        os_log_type_t v143 = v153;
        if (os_log_type_enabled(v101, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_1830D4000, v101, v143, "%{public}s called with null parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_183:
    if (v100) {
      free(v100);
    }
    goto LABEL_191;
  }
  long long v9 = *(_OWORD *)(v7 + 8);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(v7 + 24);
  *(_OWORD *)(v8 + 8) = v9;
  long long v10 = *(_OWORD *)(v7 + 40);
  long long v11 = *(_OWORD *)(v7 + 56);
  long long v12 = *(_OWORD *)(v7 + 72);
  *(_OWORD *)(v8 + 88) = *(_OWORD *)(v7 + 88);
  *(_OWORD *)(v8 + 72) = v12;
  *(_OWORD *)(v8 + 56) = v11;
  *(_OWORD *)(v8 + 40) = v10;
  v13 = (void *)*((void *)v7 + 13);
  if (a4)
  {
    id v14 = v13;
    id v15 = a1[13];
    a1[13] = v14;
    goto LABEL_30;
  }
  v16 = v13;
  if (!v16)
  {
    v114 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v155 = "nw_path_parameters_copy";
    v115 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v153 = OS_LOG_TYPE_ERROR;
    char v152 = 0;
    if (__nwlog_fault(v115, &v153, &v152))
    {
      if (v153 == OS_LOG_TYPE_FAULT)
      {
        v116 = __nwlog_obj();
        os_log_type_t v117 = v153;
        if (os_log_type_enabled(v116, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "nw_path_parameters_copy";
          _os_log_impl(&dword_1830D4000, v116, v117, "%{public}s called with null original", buf, 0xCu);
        }
      }
      else if (v152)
      {
        v136 = (char *)__nw_create_backtrace_string();
        v116 = __nwlog_obj();
        os_log_type_t v137 = v153;
        BOOL v138 = os_log_type_enabled(v116, v153);
        if (v136)
        {
          if (v138)
          {
            *(_DWORD *)buf = 136446466;
            v155 = "nw_path_parameters_copy";
            __int16 v156 = 2082;
            uint64_t v157 = (uint64_t)v136;
            _os_log_impl(&dword_1830D4000, v116, v137, "%{public}s called with null original, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v136);
          goto LABEL_202;
        }
        if (v138)
        {
          *(_DWORD *)buf = 136446210;
          v155 = "nw_path_parameters_copy";
          _os_log_impl(&dword_1830D4000, v116, v137, "%{public}s called with null original, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v116 = __nwlog_obj();
        os_log_type_t v145 = v153;
        if (os_log_type_enabled(v116, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "nw_path_parameters_copy";
          _os_log_impl(&dword_1830D4000, v116, v145, "%{public}s called with null original, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_202:
    if (v115) {
      free(v115);
    }
    v18 = 0;
    goto LABEL_29;
  }
  os_log_type_t v17 = objc_alloc_init(NWConcrete_nw_path_parameters);
  v18 = v17;
  if (v17)
  {
    long long v19 = *(_OWORD *)(v16 + 8);
    long long v20 = *(_OWORD *)(v16 + 24);
    long long v21 = *(_OWORD *)(v16 + 40);
    *(_OWORD *)&v17->process_path_value.delegated_upid = *(_OWORD *)(v16 + 56);
    *(_OWORD *)v17->process_path_value.persona_id = v21;
    *(_OWORD *)v17->process_path_value.e_proc_uuid = v20;
    *(_OWORD *)v17->process_path_value.proc_uuid = v19;
    long long v22 = *(_OWORD *)(v16 + 72);
    *(_OWORD *)((char *)&v17->path_value.companion_preference + 2) = *(_OWORD *)(v16 + 86);
    *(_OWORD *)&v17->path_value.traffic_class = v22;
    uint64_t v23 = *(void *)(v16 + 102);
    BYTE2(v17->joinable_path_value.multipath_service) = v16[110];
    *(void *)((char *)&v17->path_value + 30) = v23;
    BOOL v24 = (const char *)*((void *)v16 + 14);
    if (v24)
    {
      v25 = strdup(v24);
      if (!v25)
      {
        v128 = __nwlog_obj();
        os_log_type_enabled(v128, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        v155 = "strict_strdup";
        v129 = (void *)_os_log_send_and_compose_impl();

        BOOL result = __nwlog_abort((uint64_t)v129);
        if (result) {
          goto LABEL_210;
        }
        free(v129);
      }
      *(void *)&v18->joinable_path_value.fallback_mode = v25;
    }
    os_log_type_t v26 = (const char *)*((void *)v16 + 15);
    if (v26)
    {
      BOOL v27 = strdup(v26);
      if (!v27)
      {
        v130 = __nwlog_obj();
        os_log_type_enabled(v130, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        v155 = "strict_strdup";
        v131 = (void *)_os_log_send_and_compose_impl();

        BOOL result = __nwlog_abort((uint64_t)v131);
        if (result) {
          goto LABEL_210;
        }
        free(v131);
      }
      v18->account_id = v27;
    }
    os_log_type_t v28 = (const char *)*((void *)v16 + 16);
    if (v28)
    {
      os_log_type_t v29 = strdup(v28);
      if (!v29)
      {
        v132 = __nwlog_obj();
        os_log_type_enabled(v132, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        v155 = "strict_strdup";
        v133 = (void *)_os_log_send_and_compose_impl();

        BOOL result = __nwlog_abort((uint64_t)v133);
        if (result) {
          goto LABEL_210;
        }
        free(v133);
      }
      v18->attribution_context = v29;
    }
    objc_storeStrong((id *)&v18->attributed_bundle, *((id *)v16 + 17));
    char v30 = (void *)*((void *)v16 + 18);
    if (v30)
    {
      objc_super v31 = nw_protocol_options_copy(v30);
      context = v18->context;
      v18->context = (OS_nw_context *)v31;
    }
    v33 = (void *)*((void *)v16 + 19);
    if (v33)
    {
      __int16 v34 = nw_protocol_options_copy(v33);
      transport_options = v18->transport_options;
      v18->transport_options = (OS_nw_protocol_options *)v34;
    }
    objc_storeStrong((id *)&v18->internet_options, *((id *)v16 + 20));
    objc_storeStrong((id *)&v18->local_address, *((id *)v16 + 21));
    if (*((void *)v16 + 22))
    {
      v36 = (id *)malloc_type_calloc(1uLL, 0x90uLL, 0xEAFB8F1AuLL);
      if (!v36)
      {
        v134 = __nwlog_obj();
        os_log_type_enabled(v134, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446722;
        v155 = "strict_calloc";
        __int16 v156 = 2048;
        uint64_t v157 = 1;
        __int16 v158 = 2048;
        uint64_t v159 = 144;
        v135 = (void *)_os_log_send_and_compose_impl();

        BOOL result = __nwlog_abort((uint64_t)v135);
        if (result) {
          goto LABEL_210;
        }
        free(v135);
      }
      v18->required_interface = (OS_nw_interface *)v36;
      objc_storeStrong(v36, **((id **)v16 + 22));
      objc_storeStrong((id *)v18->required_interface + 1, *(id *)(*((void *)v16 + 22) + 8));
      objc_storeStrong((id *)v18->required_interface + 2, *(id *)(*((void *)v16 + 22) + 16));
      objc_storeStrong((id *)v18->required_interface + 3, *(id *)(*((void *)v16 + 22) + 24));
      objc_storeStrong((id *)v18->required_interface + 4, *(id *)(*((void *)v16 + 22) + 32));
      objc_storeStrong((id *)v18->required_interface + 5, *(id *)(*((void *)v16 + 22) + 40));
      objc_storeStrong((id *)v18->required_interface + 6, *(id *)(*((void *)v16 + 22) + 48));
      if ((a3 & 1) == 0)
      {
        objc_storeStrong((id *)v18->required_interface + 7, *(id *)(*((void *)v16 + 22) + 56));
        objc_storeStrong((id *)v18->required_interface + 8, *(id *)(*((void *)v16 + 22) + 64));
        objc_storeStrong((id *)v18->required_interface + 9, *(id *)(*((void *)v16 + 22) + 72));
        objc_storeStrong((id *)v18->required_interface + 10, *(id *)(*((void *)v16 + 22) + 80));
        objc_storeStrong((id *)v18->required_interface + 11, *(id *)(*((void *)v16 + 22) + 88));
        objc_storeStrong((id *)v18->required_interface + 12, *(id *)(*((void *)v16 + 22) + 96));
        objc_storeStrong((id *)v18->required_interface + 13, *(id *)(*((void *)v16 + 22) + 104));
        objc_storeStrong((id *)v18->required_interface + 14, *(id *)(*((void *)v16 + 22) + 112));
        objc_storeStrong((id *)v18->required_interface + 15, *(id *)(*((void *)v16 + 22) + 120));
      }
      uint64_t v37 = *(void **)(*((void *)v16 + 22) + 128);
      if (v37)
      {
        uint64_t v38 = nw_protocol_options_copy(v37);
        required_interface = v18->required_interface;
        v40 = (void *)*((void *)required_interface + 16);
        *((void *)required_interface + 16) = v38;

        objc_storeStrong((id *)v18->required_interface + 17, *(id *)(*((void *)v16 + 22) + 136));
      }
    }
    v41 = v18;
    goto LABEL_28;
  }
  v121 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v155 = "nw_path_parameters_copy";
  v122 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v153 = OS_LOG_TYPE_ERROR;
  char v152 = 0;
  if (__nwlog_fault(v122, &v153, &v152))
  {
    if (v153 == OS_LOG_TYPE_FAULT)
    {
      v123 = __nwlog_obj();
      os_log_type_t v124 = v153;
      if (os_log_type_enabled(v123, v153))
      {
        *(_DWORD *)buf = 136446210;
        v155 = "nw_path_parameters_copy";
        _os_log_impl(&dword_1830D4000, v123, v124, "%{public}s called with null copy", buf, 0xCu);
      }
    }
    else if (v152)
    {
      v139 = (char *)__nw_create_backtrace_string();
      v123 = __nwlog_obj();
      os_log_type_t v140 = v153;
      BOOL v141 = os_log_type_enabled(v123, v153);
      if (v139)
      {
        if (v141)
        {
          *(_DWORD *)buf = 136446466;
          v155 = "nw_path_parameters_copy";
          __int16 v156 = 2082;
          uint64_t v157 = (uint64_t)v139;
          _os_log_impl(&dword_1830D4000, v123, v140, "%{public}s called with null copy, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v139);
        goto LABEL_208;
      }
      if (v141)
      {
        *(_DWORD *)buf = 136446210;
        v155 = "nw_path_parameters_copy";
        _os_log_impl(&dword_1830D4000, v123, v140, "%{public}s called with null copy, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v123 = __nwlog_obj();
      os_log_type_t v146 = v153;
      if (os_log_type_enabled(v123, v153))
      {
        *(_DWORD *)buf = 136446210;
        v155 = "nw_path_parameters_copy";
        _os_log_impl(&dword_1830D4000, v123, v146, "%{public}s called with null copy, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_208:
  if (v122) {
    free(v122);
  }
LABEL_28:

LABEL_29:
  id v15 = a1[13];
  a1[13] = v18;
LABEL_30:

  if (!a1[13])
  {
    v103 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
    v104 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v153 = OS_LOG_TYPE_ERROR;
    char v152 = 0;
    if (__nwlog_fault(v104, &v153, &v152))
    {
      if (v153 == OS_LOG_TYPE_FAULT)
      {
        v105 = __nwlog_obj();
        os_log_type_t v106 = v153;
        if (os_log_type_enabled(v105, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_1830D4000, v105, v106, "%{public}s called with null self->path_parameters", buf, 0xCu);
        }
      }
      else if (v152)
      {
        v125 = (char *)__nw_create_backtrace_string();
        v105 = __nwlog_obj();
        os_log_type_t v126 = v153;
        BOOL v127 = os_log_type_enabled(v105, v153);
        if (v125)
        {
          if (v127)
          {
            *(_DWORD *)buf = 136446466;
            v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
            __int16 v156 = 2082;
            uint64_t v157 = (uint64_t)v125;
            _os_log_impl(&dword_1830D4000, v105, v126, "%{public}s called with null self->path_parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v125);
          goto LABEL_189;
        }
        if (v127)
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_1830D4000, v105, v126, "%{public}s called with null self->path_parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v105 = __nwlog_obj();
        os_log_type_t v144 = v153;
        if (os_log_type_enabled(v105, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_1830D4000, v105, v144, "%{public}s called with null self->path_parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_189:
    if (v104) {
      free(v104);
    }
LABEL_191:

LABEL_192:
    a1 = 0;
LABEL_103:

    return (BOOL)a1;
  }
  v42 = (const char *)*((void *)v7 + 14);
  if (v42)
  {
    v43 = strdup(v42);
    if (!v43)
    {
      v107 = __nwlog_obj();
      os_log_type_enabled(v107, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446210;
      v155 = "strict_strdup";
      v108 = (void *)_os_log_send_and_compose_impl();

      BOOL result = __nwlog_abort((uint64_t)v108);
      if (result) {
        goto LABEL_210;
      }
      free(v108);
    }
    a1[14] = v43;
  }
  v44 = (const char *)*((void *)v7 + 15);
  if (!v44) {
    goto LABEL_37;
  }
  v45 = strdup(v44);
  if (v45)
  {
LABEL_36:
    a1[15] = v45;
LABEL_37:
    objc_storeStrong(a1 + 16, *((id *)v7 + 16));
    if (a3) {
      *((_DWORD *)a1[13] + 21) = 0;
    }
    else {
      objc_storeStrong(a1 + 22, *((id *)v7 + 22));
    }
    if (*((void *)v7 + 20))
    {
      BOOL v46 = nw_array_create();
      id v47 = a1[20];
      a1[20] = (id)v46;

      v48 = (atomic_uchar *)*((void *)v7 + 20);
      v149[0] = MEMORY[0x1E4F143A8];
      v149[1] = 3221225472;
      v149[2] = __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke;
      v149[3] = &unk_1E524AE18;
      v150 = a1;
      nw_array_apply(v48, (uint64_t)v149);
    }
    objc_storeStrong(a1 + 23, *((id *)v7 + 23));
    objc_storeStrong(a1 + 24, *((id *)v7 + 24));
    objc_storeStrong(a1 + 17, *((id *)v7 + 17));
    objc_storeStrong(a1 + 18, *((id *)v7 + 18));
    v49 = (void *)*((void *)v7 + 19);
    if (v49)
    {
      if (a4)
      {
        id v50 = v49;
        v51 = objc_alloc_init(NWConcrete_nw_protocol_stack);
        if (v51)
        {
          uint64_t v52 = *((void *)v50 + 1);
          if (v52)
          {
            uint64_t v53 = nw_array_create();
            if (v53 != v52)
            {
              uint64_t v54 = v53;
              std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>(v53 + 16, *(void ***)(v52 + 16), *(void ***)(v52 + 24), (uint64_t)(*(void *)(v52 + 24) - *(void *)(v52 + 16)) >> 3);
              uint64_t v52 = v54;
            }
            persistent_application_protocols = v51->persistent_application_protocols;
            v51->persistent_application_protocols = (OS_nw_array *)v52;
          }
          uint64_t v56 = *((void *)v50 + 2);
          if (v56)
          {
            uint64_t v57 = nw_array_create();
            if (v57 != v56)
            {
              uint64_t v58 = v57;
              std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>(v57 + 16, *(void ***)(v56 + 16), *(void ***)(v56 + 24), (uint64_t)(*(void *)(v56 + 24) - *(void *)(v56 + 16)) >> 3);
              uint64_t v56 = v58;
            }
            application_protocols = v51->application_protocols;
            v51->application_protocols = (OS_nw_array *)v56;
          }
          objc_storeStrong((id *)&v51->transport_protocol, *((id *)v50 + 3));
          objc_storeStrong((id *)&v51->secondary_transport_protocol, *((id *)v50 + 4));
          objc_storeStrong((id *)&v51->original_proxied_transport_protocol, *((id *)v50 + 5));
          objc_storeStrong((id *)&v51->internet_protocol, *((id *)v50 + 6));
          v60 = v51;
          goto LABEL_80;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v69 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v155 = "nw_protocol_stack_shallow_copy";
        v70 = (void *)_os_log_send_and_compose_impl();

        os_log_type_t v153 = OS_LOG_TYPE_ERROR;
        char v152 = 0;
        if (__nwlog_fault((const char *)v70, &v153, &v152))
        {
          if (v153 == OS_LOG_TYPE_FAULT)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v71 = (id)gLogObj;
            os_log_type_t v72 = v153;
            if (os_log_type_enabled(v71, v153))
            {
              *(_DWORD *)buf = 136446210;
              v155 = "nw_protocol_stack_shallow_copy";
              _os_log_impl(&dword_1830D4000, v71, v72, "%{public}s [[nw_protocol_stack alloc] init] failed", buf, 0xCu);
            }
          }
          else if (v152)
          {
            v74 = __nw_create_backtrace_string();
            if (v74)
            {
              v75 = (char *)v74;
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v76 = (id)gLogObj;
              os_log_type_t v77 = v153;
              if (os_log_type_enabled(v76, v153))
              {
                *(_DWORD *)buf = 136446466;
                v155 = "nw_protocol_stack_shallow_copy";
                __int16 v156 = 2082;
                uint64_t v157 = (uint64_t)v75;
                _os_log_impl(&dword_1830D4000, v76, v77, "%{public}s [[nw_protocol_stack alloc] init] failed, dumping backtrace:%{public}s", buf, 0x16u);
              }

              free(v75);
              if (!v70)
              {
LABEL_80:

                id v80 = a1[19];
                a1[19] = v51;

                v62 = (void ***)*((void *)v7 + 21);
                if (!v62)
                {
                  v73 = (void *)*((void *)v7 + 25);
                  if (!v73) {
                    goto LABEL_95;
                  }
                  goto LABEL_94;
                }
LABEL_81:
                v81 = (void ***)nw_array_create();
                if (v81 != v62)
                {
                  v82 = v81;
                  std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>((uint64_t)(v81 + 2), v62[2], v62[3], v62[3] - v62[2]);
                  v62 = v82;
                }
                v68 = (id *)a1[21];
                a1[21] = v62;
                goto LABEL_84;
              }
LABEL_79:
              free(v70);
              goto LABEL_80;
            }
            v71 = __nwlog_obj();
            os_log_type_t v79 = v153;
            if (os_log_type_enabled(v71, v153))
            {
              *(_DWORD *)buf = 136446210;
              v155 = "nw_protocol_stack_shallow_copy";
              _os_log_impl(&dword_1830D4000, v71, v79, "%{public}s [[nw_protocol_stack alloc] init] failed, no backtrace", buf, 0xCu);
            }
          }
          else
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v71 = (id)gLogObj;
            os_log_type_t v78 = v153;
            if (os_log_type_enabled(v71, v153))
            {
              *(_DWORD *)buf = 136446210;
              v155 = "nw_protocol_stack_shallow_copy";
              _os_log_impl(&dword_1830D4000, v71, v78, "%{public}s [[nw_protocol_stack alloc] init] failed, backtrace limit exceeded", buf, 0xCu);
            }
          }
        }
        if (!v70) {
          goto LABEL_80;
        }
        goto LABEL_79;
      }
      v63 = nw_protocol_stack_copy(v49);
      id v64 = a1[19];
      a1[19] = v63;

      v61 = (atomic_uchar **)(v7 + 168);
      if (!*((void *)v7 + 21))
      {
        v73 = (void *)*((void *)v7 + 25);
        if (!v73)
        {
LABEL_88:
          v86 = (void *)*((void *)v7 + 26);
          if (!v86)
          {
LABEL_98:
            v91 = (void *)*((void *)v7 + 27);
            if (v91)
            {
              if (a4) {
                xpc_object_t v92 = v91;
              }
              else {
                xpc_object_t v92 = xpc_copy(v91);
              }
              id v93 = a1[27];
              a1[27] = v92;
            }
            goto LABEL_103;
          }
          goto LABEL_92;
        }
LABEL_87:
        id v83 = v73;
        v84 = (void *)[v83 copyEndpoint];
        nw_endpoint_copy_properties(v83, v84);

        id v85 = a1[25];
        a1[25] = v84;

        goto LABEL_88;
      }
    }
    else
    {
      v61 = (atomic_uchar **)(v7 + 168);
      v62 = (void ***)*((void *)v7 + 21);
      if (!v62)
      {
LABEL_85:
        v73 = (void *)*((void *)v7 + 25);
        if (!v73)
        {
          v86 = (void *)*((void *)v7 + 26);
          if (!v86) {
            goto LABEL_98;
          }
          if (!a4)
          {
LABEL_92:
            id v87 = v86;
            v88 = (void *)[v87 copyEndpoint];
            nw_endpoint_copy_properties(v87, v88);

            id v89 = a1[26];
            a1[26] = v88;
LABEL_97:

            goto LABEL_98;
          }
LABEL_96:
          id v90 = v86;
          id v89 = a1[26];
          a1[26] = v90;
          goto LABEL_97;
        }
        if ((a4 & 1) == 0) {
          goto LABEL_87;
        }
LABEL_94:
        objc_storeStrong(a1 + 25, v73);
LABEL_95:
        v86 = (void *)*((void *)v7 + 26);
        if (!v86) {
          goto LABEL_98;
        }
        goto LABEL_96;
      }
      if (a4) {
        goto LABEL_81;
      }
    }
    BOOL v65 = nw_array_create();
    id v66 = a1[21];
    a1[21] = (id)v65;

    v67 = *v61;
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke_2;
    v147[3] = &unk_1E524AE18;
    v148 = a1;
    nw_array_apply(v67, (uint64_t)v147);
    v68 = v148;
LABEL_84:

    goto LABEL_85;
  }
  v109 = __nwlog_obj();
  os_log_type_enabled(v109, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v155 = "strict_strdup";
  v110 = (void *)_os_log_send_and_compose_impl();

  BOOL result = __nwlog_abort((uint64_t)v110);
  if (!result)
  {
    free(v110);
    goto LABEL_36;
  }
LABEL_210:
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->main_document_url_endpoint, 0);
  objc_storeStrong((id *)&self->url_endpoint, 0);
  objc_storeStrong((id *)&self->raced_proxy_config, 0);
  objc_storeStrong((id *)&self->effective_proxy_config, 0);
  objc_storeStrong((id *)&self->custom_proxy_configs, 0);
  objc_storeStrong((id *)&self->proxy_options, 0);
  objc_storeStrong((id *)&self->transforms, 0);
  objc_storeStrong((id *)&self->default_stack, 0);
  objc_storeStrong((id *)&self->initial_data_payload, 0);
  objc_storeStrong((id *)&self->extra_parent_ids, 0);
  objc_storeStrong((id *)&self->tls_session_id, 0);

  objc_storeStrong((id *)&self->path_parameters, 0);
}

- (NSString)description
{
  v2 = nw_parameters_copy_description_internal(self, 0);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  }

  return (NSString *)v2;
}

- (void)dealloc
{
  e_bundle_id = self->e_bundle_id;
  if (e_bundle_id)
  {
    free(e_bundle_id);
    self->e_bundle_id = 0;
  }
  proxy_bundle_id = self->proxy_bundle_id;
  if (proxy_bundle_id)
  {
    free(proxy_bundle_id);
    self->proxy_bundle_id = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_parameters;
  [(NWConcrete_nw_parameters *)&v5 dealloc];
}

@end