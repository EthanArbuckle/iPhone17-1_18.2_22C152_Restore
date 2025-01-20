@interface NWConcrete_nw_protocol_instance
- (NWConcrete_nw_protocol_instance)init;
- (nw_protocol)getProtocolStructure;
- (void)destroy;
@end

@implementation NWConcrete_nw_protocol_instance

- (nw_protocol)getProtocolStructure
{
  if (self) {
    return (nw_protocol *)&self[-1].paths_log_id_num;
  }
  else {
    return 0;
  }
}

- (NWConcrete_nw_protocol_instance)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_protocol_instance;
  v2 = [(NWConcrete_nw_protocol_instance *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->empty_frame_pool.tqh_first = 0;
    v2->empty_frame_pool.tqh_last = &v2->empty_frame_pool.tqh_first;
    v2->pending_inbound_frames.tqh_last = 0;
    *(void *)&v2->pending_inbound_frame_count = &v2->pending_inbound_frames.tqh_last;
    v2->handle = 0;
    v2->context = (OS_nw_context *)&v2->handle;
    v2->inbound_frames.tqh_first = 0;
    v2->inbound_frames.tqh_last = &v2->inbound_frames.tqh_first;
    v2->outbound_frames.tqh_last = 0;
    *(void *)&v2->empty_frame_pool_count = &v2->outbound_frames.tqh_last;
    LODWORD(v2->outbound_frames.tqh_first) = 0;
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_protocol_instance init]";
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
        v18 = "-[NWConcrete_nw_protocol_instance init]";
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
          v18 = "-[NWConcrete_nw_protocol_instance init]";
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
        v18 = "-[NWConcrete_nw_protocol_instance init]";
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
        v18 = "-[NWConcrete_nw_protocol_instance init]";
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

- (void)destroy
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  tqh_last = self->outbound_frames.tqh_last;
  do
  {
    if (!tqh_last) {
      break;
    }
    v4 = (nw_frame **)tqh_last[2];
    char v5 = __42__NWConcrete_nw_protocol_instance_destroy__block_invoke((uint64_t)&__block_literal_global_11378, tqh_last);
    tqh_last = v4;
  }
  while ((v5 & 1) != 0);
  v6 = (os_unfair_lock_s *)self->pending_outbound_frames.tqh_last;
  if (v6)
  {
    uint32_t os_unfair_lock_opaque = v6[10]._os_unfair_lock_opaque;
    if (!os_unfair_lock_opaque)
    {
LABEL_14:
      _nw_hash_table_release(v6);
      self->pending_outbound_frames.tqh_last = 0;
      goto LABEL_15;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v8 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v84 = "-[NWConcrete_nw_protocol_instance destroy]";
    __int16 v85 = 1024;
    *(_DWORD *)v86 = os_unfair_lock_opaque;
    *(_WORD *)&v86[4] = 2048;
    *(void *)&v86[6] = self;
    os_log_type_t v9 = (void *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_paths_log_id_num) = 0;
    if (__nwlog_fault((const char *)v9, type, &p_paths_log_id_num))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v11 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)buf = 136446722;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          __int16 v85 = 1024;
          *(_DWORD *)v86 = os_unfair_lock_opaque;
          *(_WORD *)&v86[4] = 2048;
          *(void *)&v86[6] = self;
          _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated", buf, 0x1Cu);
        }
      }
      else if ((_BYTE)p_paths_log_id_num)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v39 = type[0];
        BOOL v40 = os_log_type_enabled(v10, type[0]);
        if (backtrace_string)
        {
          if (v40)
          {
            *(_DWORD *)buf = 136446978;
            v84 = "-[NWConcrete_nw_protocol_instance destroy]";
            __int16 v85 = 1024;
            *(_DWORD *)v86 = os_unfair_lock_opaque;
            *(_WORD *)&v86[4] = 2048;
            *(void *)&v86[6] = self;
            *(_WORD *)&v86[14] = 2082;
            *(void *)&v86[16] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v10, v39, "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated, dumping backtrace:%{public}s", buf, 0x26u);
          }

          free(backtrace_string);
          if (!v9)
          {
LABEL_13:
            v6 = (os_unfair_lock_s *)self->pending_outbound_frames.tqh_last;
            if (!v6) {
              goto LABEL_15;
            }
            goto LABEL_14;
          }
LABEL_12:
          free(v9);
          goto LABEL_13;
        }
        if (v40)
        {
          *(_DWORD *)buf = 136446722;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          __int16 v85 = 1024;
          *(_DWORD *)v86 = os_unfair_lock_opaque;
          *(_WORD *)&v86[4] = 2048;
          *(void *)&v86[6] = self;
          _os_log_impl(&dword_1830D4000, v10, v39, "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated, no backtrace", buf, 0x1Cu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v44 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)buf = 136446722;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          __int16 v85 = 1024;
          *(_DWORD *)v86 = os_unfair_lock_opaque;
          *(_WORD *)&v86[4] = 2048;
          *(void *)&v86[6] = self;
          _os_log_impl(&dword_1830D4000, v10, v44, "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated, backtrace limit exceeded", buf, 0x1Cu);
        }
      }
    }
    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_15:
  outbound_data_requests = self->outbound_data_requests;
  if (outbound_data_requests)
  {
    _nw_hash_table_release((os_unfair_lock_s *)outbound_data_requests);
    self->outbound_data_requests = 0;
  }
  flow_registration = (char *)self->flow_registration;
  if (flow_registration)
  {
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __42__NWConcrete_nw_protocol_instance_destroy__block_invoke_57;
    v76[3] = &unk_1E524AF58;
    v76[4] = self;
    nw_hash_table_apply(flow_registration, (uint64_t)v76);
    char v14 = (os_unfair_lock_s *)self->flow_registration;
    if (v14)
    {
      _nw_hash_table_release(v14);
      self->flow_registration = 0;
    }
  }
  v15 = *(void **)&self[-1].log_str[25];
  if (v15)
  {
    if (SBYTE5(self->flow_in_connected) < 0) {
      goto LABEL_36;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    uint64_t v17 = *(void *)&self[-1].log_str[25];
    v18 = "invalid";
    if (v17 && *(void *)(v17 + 16)) {
      v18 = *(const char **)(v17 + 16);
    }
    *(_DWORD *)buf = 136447490;
    v84 = "-[NWConcrete_nw_protocol_instance destroy]";
    __int16 v85 = 2082;
    *(void *)v86 = (char *)&self->flow_in_connected + 7;
    *(_WORD *)&v86[8] = 2080;
    *(void *)&v86[10] = " ";
    *(_WORD *)&v86[18] = 2080;
    *(void *)&v86[20] = v18;
    __int16 v87 = 2048;
    uint64_t v88 = v17;
    __int16 v89 = 2048;
    v90 = self;
    __int16 v19 = (void *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_paths_log_id_num) = 0;
    if (__nwlog_fault((const char *)v19, type, &p_paths_log_id_num))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        os_log_type_t v21 = type[0];
        if (os_log_type_enabled(v20, type[0]))
        {
          uint64_t v22 = *(void *)&self[-1].log_str[25];
          v23 = "invalid";
          if (v22 && *(void *)(v22 + 16)) {
            v23 = *(const char **)(v22 + 16);
          }
          *(_DWORD *)buf = 136447490;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          __int16 v85 = 2082;
          *(void *)v86 = (char *)&self->flow_in_connected + 7;
          *(_WORD *)&v86[8] = 2080;
          *(void *)&v86[10] = " ";
          *(_WORD *)&v86[18] = 2080;
          *(void *)&v86[20] = v23;
          __int16 v87 = 2048;
          uint64_t v88 = v22;
          __int16 v89 = 2048;
          v90 = self;
          _os_log_impl(&dword_1830D4000, v20, v21, "%{public}s %{public}s%sOutput handler %s:%p is not null when protocol instance %p is deallocated", buf, 0x3Eu);
        }
      }
      else if ((_BYTE)p_paths_log_id_num)
      {
        v26 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        os_log_type_t v27 = type[0];
        BOOL v28 = os_log_type_enabled(v20, type[0]);
        if (v26)
        {
          if (v28)
          {
            uint64_t v29 = *(void *)&self[-1].log_str[25];
            v30 = "invalid";
            if (v29 && *(void *)(v29 + 16)) {
              v30 = *(const char **)(v29 + 16);
            }
            *(_DWORD *)buf = 136447746;
            v84 = "-[NWConcrete_nw_protocol_instance destroy]";
            __int16 v85 = 2082;
            *(void *)v86 = (char *)&self->flow_in_connected + 7;
            *(_WORD *)&v86[8] = 2080;
            *(void *)&v86[10] = " ";
            *(_WORD *)&v86[18] = 2080;
            *(void *)&v86[20] = v30;
            __int16 v87 = 2048;
            uint64_t v88 = v29;
            __int16 v89 = 2048;
            v90 = self;
            __int16 v91 = 2082;
            v92 = v26;
            _os_log_impl(&dword_1830D4000, v20, v27, "%{public}s %{public}s%sOutput handler %s:%p is not null when protocol instance %p is deallocated, dumping backtrace:%{public}s", buf, 0x48u);
          }

          free(v26);
          if (!v19)
          {
LABEL_35:
            v15 = *(void **)&self[-1].log_str[25];
            if (v15)
            {
LABEL_36:
              v24 = (void *)v15[5];
              if (v24 == &nw_protocol_ref_counted_handle)
              {
                uint64_t v31 = v15[11];
                if (v31) {
                  v15[11] = v31 + 1;
                }
                char v25 = -1;
              }
              else
              {
                char v25 = 0;
              }
              *(void *)os_log_type_t type = v15;
              char v82 = v25;
              v32 = *(void **)&self[-1].log_str[33];
              if (v32 == &nw_protocol_ref_counted_handle)
              {
                uint64_t v34 = *(void *)&self[-1].log_str[81];
                if (v34) {
                  *(void *)&self[-1].log_str[81] = v34 + 1;
                }
                char v33 = -1;
              }
              else
              {
                char v33 = 0;
              }
              p_paths_log_id_num = &self[-1].paths_log_id_num;
              char v80 = v33;
              uint64_t v35 = v15[3];
              if (v35)
              {
                v36 = *(uint64_t (**)(void *, unsigned __int16 *, uint64_t))(v35 + 8);
                if (v36)
                {
                  char v37 = v36(v15, &self[-1].paths_log_id_num, 1);
                  if (v32 != &nw_protocol_ref_counted_handle) {
                    goto LABEL_58;
                  }
                  goto LABEL_125;
                }
              }
              v47 = __nwlog_obj();
              v48 = (const char *)v15[2];
              if (!v48) {
                v48 = "invalid";
              }
              *(_DWORD *)buf = 136446722;
              v84 = "__nw_protocol_remove_input_handler";
              __int16 v85 = 2082;
              *(void *)v86 = v48;
              *(_WORD *)&v86[8] = 2048;
              *(void *)&v86[10] = v15;
              v49 = (const char *)_os_log_send_and_compose_impl();

              os_log_type_t v78 = OS_LOG_TYPE_ERROR;
              char v77 = 0;
              v50 = (char *)v49;
              if (!__nwlog_fault(v49, &v78, &v77))
              {
LABEL_122:
                if (v50) {
                  free(v50);
                }
                char v37 = 0;
                if (v32 != &nw_protocol_ref_counted_handle)
                {
LABEL_58:
                  if (v24 != &nw_protocol_ref_counted_handle) {
                    goto LABEL_59;
                  }
                  goto LABEL_126;
                }
LABEL_125:
                nw::release_if_needed<nw_protocol *>((uint64_t *)&p_paths_log_id_num);
                if (v24 != &nw_protocol_ref_counted_handle)
                {
LABEL_59:
                  if (v37)
                  {
LABEL_131:
                    uint64_t v68 = *(void *)&self[-1].log_str[25];
                    if (v68)
                    {
                      if (*(_UNKNOWN **)(v68 + 40) == &nw_protocol_ref_counted_handle)
                      {
                        uint64_t v70 = *(void *)(v68 + 88);
                        if (v70)
                        {
                          uint64_t v71 = v70 - 1;
                          *(void *)(v68 + 88) = v71;
                          if (!v71)
                          {
                            v72 = *(void (***)(void))(v68 + 64);
                            if (v72)
                            {
                              *(void *)(v68 + 64) = 0;
                              v72[2](v72);
                              _Block_release(v72);
                            }
                            if (*(unsigned char *)(v68 + 72))
                            {
                              v73 = *(const void **)(v68 + 64);
                              if (v73) {
                                _Block_release(v73);
                              }
                            }
                            free((void *)v68);
                          }
                        }
                      }
                      *(void *)&self[-1].log_str[25] = 0;
                    }
                    goto LABEL_134;
                  }
LABEL_127:
                  if ((SBYTE5(self->flow_in_connected) & 0x80000000) == 0)
                  {
                    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                    networkd_settings_init();
                    v67 = (id)gLogObj;
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136446722;
                      v84 = "-[NWConcrete_nw_protocol_instance destroy]";
                      __int16 v85 = 2082;
                      *(void *)v86 = (char *)&self->flow_in_connected + 7;
                      *(_WORD *)&v86[8] = 2080;
                      *(void *)&v86[10] = " ";
                      _os_log_impl(&dword_1830D4000, v67, OS_LOG_TYPE_ERROR, "%{public}s %{public}s%sUnable to remove output handler", buf, 0x20u);
                    }
                  }
                  goto LABEL_131;
                }
LABEL_126:
                nw::release_if_needed<nw_protocol *>((uint64_t *)type);
                if (v37) {
                  goto LABEL_131;
                }
                goto LABEL_127;
              }
              if (v78 == OS_LOG_TYPE_FAULT)
              {
                v51 = __nwlog_obj();
                os_log_type_t v52 = v78;
                if (os_log_type_enabled(v51, v78))
                {
                  v53 = (const char *)v15[2];
                  if (!v53) {
                    v53 = "invalid";
                  }
                  *(_DWORD *)buf = 136446722;
                  v84 = "__nw_protocol_remove_input_handler";
                  __int16 v85 = 2082;
                  *(void *)v86 = v53;
                  *(_WORD *)&v86[8] = 2048;
                  *(void *)&v86[10] = v15;
                  _os_log_impl(&dword_1830D4000, v51, v52, "%{public}s protocol %{public}s (%p) has invalid remove_input_handler callback", buf, 0x20u);
                }
              }
              else if (v77)
              {
                v58 = (char *)__nw_create_backtrace_string();
                v51 = __nwlog_obj();
                os_log_type_t v75 = v78;
                BOOL v59 = os_log_type_enabled(v51, v78);
                if (v58)
                {
                  if (v59)
                  {
                    v60 = (const char *)v15[2];
                    if (!v60) {
                      v60 = "invalid";
                    }
                    *(_DWORD *)buf = 136446978;
                    v84 = "__nw_protocol_remove_input_handler";
                    __int16 v85 = 2082;
                    *(void *)v86 = v60;
                    *(_WORD *)&v86[8] = 2048;
                    *(void *)&v86[10] = v15;
                    *(_WORD *)&v86[18] = 2082;
                    *(void *)&v86[20] = v58;
                    _os_log_impl(&dword_1830D4000, v51, v75, "%{public}s protocol %{public}s (%p) has invalid remove_input_handler callback, dumping backtrace:%{public}s", buf, 0x2Au);
                  }

                  free(v58);
                  goto LABEL_121;
                }
                if (v59)
                {
                  v66 = (const char *)v15[2];
                  if (!v66) {
                    v66 = "invalid";
                  }
                  *(_DWORD *)buf = 136446722;
                  v84 = "__nw_protocol_remove_input_handler";
                  __int16 v85 = 2082;
                  *(void *)v86 = v66;
                  *(_WORD *)&v86[8] = 2048;
                  *(void *)&v86[10] = v15;
                  _os_log_impl(&dword_1830D4000, v51, v75, "%{public}s protocol %{public}s (%p) has invalid remove_input_handler callback, no backtrace", buf, 0x20u);
                }
              }
              else
              {
                v51 = __nwlog_obj();
                os_log_type_t v64 = v78;
                if (os_log_type_enabled(v51, v78))
                {
                  v65 = (const char *)v15[2];
                  if (!v65) {
                    v65 = "invalid";
                  }
                  *(_DWORD *)buf = 136446722;
                  v84 = "__nw_protocol_remove_input_handler";
                  __int16 v85 = 2082;
                  *(void *)v86 = v65;
                  *(_WORD *)&v86[8] = 2048;
                  *(void *)&v86[10] = v15;
                  _os_log_impl(&dword_1830D4000, v51, v64, "%{public}s protocol %{public}s (%p) has invalid remove_input_handler callback, backtrace limit exceeded", buf, 0x20u);
                }
              }

LABEL_121:
              v50 = (char *)v49;
              goto LABEL_122;
            }
            v54 = __nwlog_obj();
            *(_DWORD *)buf = 136446210;
            v84 = "__nw_protocol_remove_input_handler";
            v55 = (char *)_os_log_send_and_compose_impl();

            type[0] = OS_LOG_TYPE_ERROR;
            LOBYTE(p_paths_log_id_num) = 0;
            if (__nwlog_fault(v55, type, &p_paths_log_id_num))
            {
              if (type[0] == OS_LOG_TYPE_FAULT)
              {
                v56 = __nwlog_obj();
                os_log_type_t v57 = type[0];
                if (os_log_type_enabled(v56, type[0]))
                {
                  *(_DWORD *)buf = 136446210;
                  v84 = "__nw_protocol_remove_input_handler";
                  _os_log_impl(&dword_1830D4000, v56, v57, "%{public}s called with null protocol", buf, 0xCu);
                }
              }
              else if ((_BYTE)p_paths_log_id_num)
              {
                v61 = (char *)__nw_create_backtrace_string();
                v56 = __nwlog_obj();
                os_log_type_t v62 = type[0];
                BOOL v63 = os_log_type_enabled(v56, type[0]);
                if (v61)
                {
                  if (v63)
                  {
                    *(_DWORD *)buf = 136446466;
                    v84 = "__nw_protocol_remove_input_handler";
                    __int16 v85 = 2082;
                    *(void *)v86 = v61;
                    _os_log_impl(&dword_1830D4000, v56, v62, "%{public}s called with null protocol, dumping backtrace:%{public}s", buf, 0x16u);
                  }

                  free(v61);
                  goto LABEL_151;
                }
                if (v63)
                {
                  *(_DWORD *)buf = 136446210;
                  v84 = "__nw_protocol_remove_input_handler";
                  _os_log_impl(&dword_1830D4000, v56, v62, "%{public}s called with null protocol, no backtrace", buf, 0xCu);
                }
              }
              else
              {
                v56 = __nwlog_obj();
                os_log_type_t v74 = type[0];
                if (os_log_type_enabled(v56, type[0]))
                {
                  *(_DWORD *)buf = 136446210;
                  v84 = "__nw_protocol_remove_input_handler";
                  _os_log_impl(&dword_1830D4000, v56, v74, "%{public}s called with null protocol, backtrace limit exceeded", buf, 0xCu);
                }
              }
            }
LABEL_151:
            if (v55) {
              free(v55);
            }
            goto LABEL_127;
          }
LABEL_34:
          free(v19);
          goto LABEL_35;
        }
        if (v28)
        {
          uint64_t v45 = *(void *)&self[-1].log_str[25];
          v46 = "invalid";
          if (v45 && *(void *)(v45 + 16)) {
            v46 = *(const char **)(v45 + 16);
          }
          *(_DWORD *)buf = 136447490;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          __int16 v85 = 2082;
          *(void *)v86 = (char *)&self->flow_in_connected + 7;
          *(_WORD *)&v86[8] = 2080;
          *(void *)&v86[10] = " ";
          *(_WORD *)&v86[18] = 2080;
          *(void *)&v86[20] = v46;
          __int16 v87 = 2048;
          uint64_t v88 = v45;
          __int16 v89 = 2048;
          v90 = self;
          _os_log_impl(&dword_1830D4000, v20, v27, "%{public}s %{public}s%sOutput handler %s:%p is not null when protocol instance %p is deallocated, no backtrace", buf, 0x3Eu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        os_log_type_t v41 = type[0];
        if (os_log_type_enabled(v20, type[0]))
        {
          uint64_t v42 = *(void *)&self[-1].log_str[25];
          v43 = "invalid";
          if (v42 && *(void *)(v42 + 16)) {
            v43 = *(const char **)(v42 + 16);
          }
          *(_DWORD *)buf = 136447490;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          __int16 v85 = 2082;
          *(void *)v86 = (char *)&self->flow_in_connected + 7;
          *(_WORD *)&v86[8] = 2080;
          *(void *)&v86[10] = " ";
          *(_WORD *)&v86[18] = 2080;
          *(void *)&v86[20] = v43;
          __int16 v87 = 2048;
          uint64_t v88 = v42;
          __int16 v89 = 2048;
          v90 = self;
          _os_log_impl(&dword_1830D4000, v20, v41, "%{public}s %{public}s%sOutput handler %s:%p is not null when protocol instance %p is deallocated, backtrace limit exceeded", buf, 0x3Eu);
        }
      }
    }
    if (!v19) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_134:
  parameters = self->parameters;
  if (parameters) {
    nw_association_unregister(parameters, self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->level, 0);
  objc_storeStrong((id *)&self->derived_ipv4_endpoint, 0);
  objc_storeStrong((id *)&self->current_setup_path_parameters, 0);
  objc_storeStrong((id *)&self->current_setup_path_local_endpoint, 0);
  objc_storeStrong((id *)&self->current_setup_path_endpoint, 0);
  objc_storeStrong((id *)&self->current_setup_path, 0);
  objc_storeStrong((id *)&self->primary_path, 0);
  objc_storeStrong(&self->wakeup_block, 0);
  objc_storeStrong(&self->wakeup, 0);
  objc_storeStrong((id *)&self->new_flow_metadata, 0);
  objc_storeStrong((id *)&self->last_accepted_flow, 0);
  objc_storeStrong((id *)&self->custom_flow_mapping_table, 0);
  objc_storeStrong((id *)&self->pending_outbound_frames.tqh_first, 0);
  objc_storeStrong((id *)&self->protocol_outbound_data_limit, 0);
  objc_storeStrong((id *)&self->options, 0);
  objc_storeStrong((id *)&self->parameters, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
  objc_storeStrong(&self->destroy_timer, 0);
  objc_storeStrong((id *)&self->listen_handler, 0);

  objc_storeStrong((id *)&self->parent_definition, 0);
}

@end