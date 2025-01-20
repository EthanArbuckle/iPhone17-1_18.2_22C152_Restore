@interface NWConcrete_nw_connection_group
- (NSString)description;
- (char)initWithDescriptor:(void *)a3 connection:(void *)a4 parameters:;
- (id).cxx_construct;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_connection_group

- (id).cxx_construct
{
  *((_DWORD *)self + 43) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 18, 0);
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);

  objc_storeStrong((id *)self + 1, 0);
}

- (id)redactedDescription
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  description = (const char *)nw_connection_group_get_description(self);
  v4 = (__CFString *)CFStringCreateWithCString(v2, description, 0x8000100u);

  return v4;
}

- (NSString)description
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  description = (const char *)nw_connection_group_get_description(self);
  v4 = (__CFString *)CFStringCreateWithCString(v2, description, 0x8000100u);

  return (NSString *)v4;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!*((void *)self + 3))
  {
    v3 = (void *)*((void *)self + 19);
    if (v3)
    {
      free(v3);
      *((void *)self + 19) = 0;
    }
    v4 = (void *)*((void *)self + 20);
    if (v4)
    {
      free(v4);
      *((void *)self + 20) = 0;
    }
    v5 = (void *)*((void *)self + 10);
    *((void *)self + 10) = 0;

    goto LABEL_7;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v20 = "-[NWConcrete_nw_connection_group dealloc]";
  int v15 = 12;
  v14 = buf;
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if (__nwlog_fault(v7, &type, &v17))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_connection_group dealloc]";
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating", buf, 0xCu);
      }
    }
    else if (v17)
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
          v20 = "-[NWConcrete_nw_connection_group dealloc]";
          __int16 v21 = 2082;
          v22 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_24;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_connection_group dealloc]";
        _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v8 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_connection_group dealloc]";
        _os_log_impl(&dword_1830D4000, v8, v13, "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_24:
  if (v7) {
    free(v7);
  }
LABEL_7:
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_connection_group;
  [(NWConcrete_nw_connection_group *)&v16 dealloc];
}

- (char)initWithDescriptor:(void *)a3 connection:(void *)a4 parameters:
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_102;
  }
  if (v7)
  {
    v162.receiver = a1;
    v162.super_class = (Class)NWConcrete_nw_connection_group;
    a1 = (char *)objc_msgSendSuper2(&v162, sel_init);
    if (a1)
    {
      *((_DWORD *)a1 + 42) = nw_connection_group_get_next_log_id();
      os_unfair_lock_lock((os_unfair_lock_t)&nw_uuid_generate_insecure(unsigned char *)::uuid_lock);
      if (uuid_is_null((const unsigned __int8 *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid)) {
        goto LABEL_9;
      }
      if ((void)nw_uuid_generate_insecure(unsigned char *)::last_used_uuid != -1)
      {
        *(void *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid = nw_uuid_generate_insecure(unsigned char *)::last_used_uuid
                                                                               + 1;
        goto LABEL_10;
      }
      if (*((void *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid + 1) == -1)
      {
LABEL_9:
        uuid_generate_random((unsigned __int8 *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid);
        BYTE9(nw_uuid_generate_insecure(unsigned char *)::last_used_uuid) = -1;
      }
      else
      {
        ++*((void *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid + 1);
      }
LABEL_10:
      *(_OWORD *)(a1 + 120) = nw_uuid_generate_insecure(unsigned char *)::last_used_uuid;
      os_unfair_lock_unlock((os_unfair_lock_t)&nw_uuid_generate_insecure(unsigned char *)::uuid_lock);
      if (v9)
      {
        v10 = v9;
        id v11 = *(id *)(v10[13] + 136);

        LOBYTE(v10) = nw_context_is_inline(v11);
        if (v10)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          id v12 = (id)gLogObj;
          *(_DWORD *)buf = 136446210;
          v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          os_log_type_t v13 = (char *)_os_log_send_and_compose_impl();

          type[0] = OS_LOG_TYPE_ERROR;
          LOBYTE(v154) = 0;
          if (!__nwlog_fault(v13, type, &v154)) {
            goto LABEL_100;
          }
          if (type[0] == OS_LOG_TYPE_FAULT)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v14 = (id)gLogObj;
            os_log_type_t v15 = type[0];
            if (os_log_type_enabled(v14, type[0]))
            {
              *(_DWORD *)buf = 136446210;
              v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s Cannot use nw_connection_group on inline contexts", buf, 0xCu);
            }
LABEL_99:

            goto LABEL_100;
          }
          if (!(_BYTE)v154)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v14 = (id)gLogObj;
            os_log_type_t v77 = type[0];
            if (os_log_type_enabled(v14, type[0]))
            {
              *(_DWORD *)buf = 136446210;
              v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              _os_log_impl(&dword_1830D4000, v14, v77, "%{public}s Cannot use nw_connection_group on inline contexts, backtrace limit exceeded", buf, 0xCu);
            }
            goto LABEL_99;
          }
          backtrace_string = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v14 = (id)gLogObj;
          os_log_type_t v29 = type[0];
          BOOL v30 = os_log_type_enabled(v14, type[0]);
          if (!backtrace_string)
          {
            if (v30)
            {
              *(_DWORD *)buf = 136446210;
              v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              _os_log_impl(&dword_1830D4000, v14, v29, "%{public}s Cannot use nw_connection_group on inline contexts, no backtrace", buf, 0xCu);
            }
            goto LABEL_99;
          }
          if (v30)
          {
            *(_DWORD *)buf = 136446466;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            __int16 v165 = 2082;
            *(void *)v166 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v14, v29, "%{public}s Cannot use nw_connection_group on inline contexts, dumping backtrace:%{public}s", buf, 0x16u);
          }
LABEL_25:

          free(backtrace_string);
          if (!v13) {
            goto LABEL_102;
          }
          goto LABEL_101;
        }
      }
      BOOL v16 = nw_array_create();
      char v17 = (void *)*((void *)a1 + 13);
      *((void *)a1 + 13) = v16;

      v18 = (void *)*((void *)a1 + 17);
      *((void *)a1 + 17) = 0;

      v19 = (void *)*((void *)a1 + 18);
      *((void *)a1 + 18) = 0;

      *((_DWORD *)a1 + 46) = -1;
      *((void *)a1 + 22) = 0x40000000000;
      a1[190] &= 0x25u;
      *((_DWORD *)a1 + 10) = 0;
      v20 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = 0;

      if (v8)
      {
        __int16 v21 = (id *)v8;
        id v22 = v21[2];

        id v23 = v22;
        BOOL v24 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v23, 0, 0);

        v25 = (void *)*((void *)a1 + 7);
        *((void *)a1 + 7) = v24;

        a1[190] |= 4u;
      }
      else if (v9)
      {
        id v26 = v9;
        BOOL v27 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v26, 0, 0);

        id v23 = (id)*((void *)a1 + 7);
        *((void *)a1 + 7) = v27;
      }
      else
      {
        nw_parameters_t v31 = nw_parameters_create();
        id v23 = (id)*((void *)a1 + 7);
        *((void *)a1 + 7) = v31;
      }

      nw_parameters_set_reuse_local_address(*((nw_parameters_t *)a1 + 7), 1);
      v32 = nw_group_descriptor_copy(v7);
      v33 = (void *)*((void *)a1 + 8);
      *((void *)a1 + 8) = v32;

      v34 = (void *)*((void *)a1 + 8);
      if (v34)
      {
        v35 = v34;
        int v36 = v35[2];

        if (v36 == 1 && nw_parameters_get_data_mode(*((void **)a1 + 7)) == 2)
        {
          if (nw_parameters_get_logging_disabled(*((void *)a1 + 7))) {
            goto LABEL_102;
          }
          if (__nwlog_connection_group_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
          }
          v37 = (id)gconnection_groupLogObj;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            int v38 = *((_DWORD *)a1 + 42);
            *(_DWORD *)buf = 136446466;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            __int16 v165 = 1024;
            *(_DWORD *)v166 = v38;
            _os_log_impl(&dword_1830D4000, v37, OS_LOG_TYPE_ERROR, "%{public}s [G%u] cannot create multicast connection group with stream mode parameters", buf, 0x12u);
          }
LABEL_36:

          goto LABEL_102;
        }
        v39 = (void *)*((void *)a1 + 8);
        if (v39)
        {
          v40 = v39;
          int v41 = v40[2];

          if (v41 == 2 && !nw_parameters_has_multiplexed_protocol_in_stack(*((void **)a1 + 7)))
          {
            if (nw_parameters_get_logging_disabled(*((void *)a1 + 7))) {
              goto LABEL_102;
            }
            if (__nwlog_connection_group_log::onceToken != -1) {
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
            }
            v37 = (id)gconnection_groupLogObj;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              int v86 = *((_DWORD *)a1 + 42);
              *(_DWORD *)buf = 136446466;
              v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              __int16 v165 = 1024;
              *(_DWORD *)v166 = v86;
              _os_log_impl(&dword_1830D4000, v37, OS_LOG_TYPE_ERROR, "%{public}s [G%u] cannot create multiplex connection group with non-multiplex parameters", buf, 0x12u);
            }
            goto LABEL_36;
          }
        }
      }
      nw_endpoint_t v42 = nw_parameters_copy_local_endpoint(*((nw_parameters_t *)a1 + 7));
      v43 = v42;
      if (v42)
      {
        v44 = v42;
        unsigned int v45 = [v44 port];

        *((_WORD *)a1 + 94) = __rev16(v45);
      }
      v46 = (void *)*((void *)a1 + 8);
      if (!v46) {
        goto LABEL_109;
      }
      v47 = v46;
      int v48 = v47[2];

      if (v48 == 1)
      {
        *(void *)os_log_type_t type = 0;
        v159 = type;
        uint64_t v160 = 0x2020000000;
        __int16 v161 = 0;
        uint64_t v154 = 0;
        v155 = &v154;
        uint64_t v156 = 0x2020000000;
        uint64_t v157 = 0;
        v49 = *((void *)a1 + 8);
        enumerate_block[0] = MEMORY[0x1E4F143A8];
        enumerate_block[1] = 3221225472;
        enumerate_block[2] = __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke;
        enumerate_block[3] = &unk_1E523B990;
        enumerate_block[4] = type;
        enumerate_block[5] = &v154;
        nw_group_descriptor_enumerate_endpoints(v49, enumerate_block);
        if (!nw_parameters_get_logging_disabled(*((void *)a1 + 7)) && gLogDatapath)
        {
          if (__nwlog_connection_group_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
          }
          v141 = (id)gconnection_groupLogObj;
          if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
          {
            int v142 = *((_DWORD *)a1 + 42);
            v143 = (const char *)v155[3];
            if (!v143) {
              v143 = "<ephemeral>";
            }
            *(_DWORD *)buf = 136446722;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            __int16 v165 = 1024;
            *(_DWORD *)v166 = v142;
            *(_WORD *)&v166[4] = 2080;
            *(void *)&v166[6] = v143;
            _os_log_impl(&dword_1830D4000, v141, OS_LOG_TYPE_DEBUG, "%{public}s [G%u] using port %s for connection group listener", buf, 0x1Cu);
          }
        }
        id v50 = *((id *)a1 + 7);
        BOOL v51 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v50, 0, 0);

        if (*((_WORD *)v159 + 12)) {
          nw_parameters_set_local_endpoint((nw_parameters_t)v51, 0);
        }
        else {
          *((_WORD *)v159 + 12) = *((_WORD *)a1 + 94);
        }
        multicast = nw_listener_create_multicast(*((void **)a1 + 8), (void *)v51, (const char *)v155[3]);
        v61 = (void *)*((void *)a1 + 11);
        *((void *)a1 + 11) = multicast;

        v62 = (void *)v155[3];
        if (v62)
        {
          free(v62);
          v155[3] = 0;
        }
        uint64_t v63 = *((void *)a1 + 11);
        if (v63)
        {
          if (*((unsigned __int16 *)a1 + 94) == *((unsigned __int16 *)v159 + 12)) {
            goto LABEL_75;
          }
          nw_parameters_set_allow_socket_access((void *)v51, 1);
          nw_parameters_set_reuse_local_address((nw_parameters_t)v51, 1);
          if (v43) {
            nw_parameters_set_local_endpoint((nw_parameters_t)v51, v43);
          }
          nw_listener_t v64 = nw_listener_create((nw_parameters_t)v51);
          v65 = (void *)*((void *)a1 + 12);
          *((void *)a1 + 12) = v64;

          if (nw_parameters_get_logging_disabled(*((void *)a1 + 7)))
          {
LABEL_75:

            _Block_object_dispose(&v154, 8);
            _Block_object_dispose(type, 8);
            if (!v63)
            {
LABEL_76:
              v76 = 0;
LABEL_142:

              goto LABEL_143;
            }
            goto LABEL_128;
          }
          if (__nwlog_connection_group_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
          }
          v66 = (id)gconnection_groupLogObj;
          if (!os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
LABEL_74:

            goto LABEL_75;
          }
          int v67 = *((_DWORD *)a1 + 42);
          uint64_t v68 = *((void *)a1 + 12);
          *(_DWORD *)buf = 136446722;
          v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          __int16 v165 = 1024;
          *(_DWORD *)v166 = v67;
          *(_WORD *)&v166[4] = 2114;
          *(void *)&v166[6] = v68;
          v69 = "%{public}s [G%u] creating unicast listener: %{public}@";
          v70 = v66;
          os_log_type_t v71 = OS_LOG_TYPE_INFO;
          uint32_t v72 = 28;
        }
        else
        {
          if (nw_parameters_get_logging_disabled(*((void *)a1 + 7))) {
            goto LABEL_75;
          }
          if (__nwlog_connection_group_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
          }
          v66 = (id)gconnection_groupLogObj;
          if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            goto LABEL_74;
          }
          int v73 = *((_DWORD *)a1 + 42);
          uint64_t v75 = *((void *)a1 + 7);
          uint64_t v74 = *((void *)a1 + 8);
          *(_DWORD *)buf = 136446978;
          v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          __int16 v165 = 1024;
          *(_DWORD *)v166 = v73;
          *(_WORD *)&v166[4] = 2112;
          *(void *)&v166[6] = v74;
          *(_WORD *)&v166[14] = 2112;
          *(void *)&v166[16] = v75;
          v69 = "%{public}s [G%u] failed to create listener with descriptor %@, and parameters %@";
          v70 = v66;
          os_log_type_t v71 = OS_LOG_TYPE_ERROR;
          uint32_t v72 = 38;
        }
        _os_log_impl(&dword_1830D4000, v70, v71, v69, buf, v72);
        goto LABEL_74;
      }
      v52 = (void *)*((void *)a1 + 8);
      if (!v52) {
        goto LABEL_109;
      }
      v53 = v52;
      int v54 = v53[2];

      v55 = (void *)*((void *)a1 + 8);
      if (v54 == 2)
      {
        v56 = nw_group_descriptor_copy_member(v55);
        BOOL logging_disabled = nw_parameters_get_logging_disabled(*((void *)a1 + 7));
        if (gLogDatapath) {
          char v58 = logging_disabled;
        }
        else {
          char v58 = 1;
        }
        if (v8)
        {
          if ((v58 & 1) == 0)
          {
            if (__nwlog_connection_group_log::onceToken != -1) {
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
            }
            v144 = (id)gconnection_groupLogObj;
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
            {
              int v145 = *((_DWORD *)a1 + 42);
              v146 = (const char *)*((void *)a1 + 7);
              *(_DWORD *)buf = 136447234;
              v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              __int16 v165 = 1024;
              *(_DWORD *)v166 = v145;
              *(_WORD *)&v166[4] = 2112;
              *(void *)&v166[6] = v8;
              *(_WORD *)&v166[14] = 2112;
              *(void *)&v166[16] = v56;
              __int16 v167 = 2112;
              v168 = v146;
              _os_log_impl(&dword_1830D4000, v144, OS_LOG_TYPE_DEBUG, "%{public}s [G%u] using provided connection (%@) for multiplex endpoint (%@) and parameters (%@)", buf, 0x30u);
            }
          }
          nw_connection_t v59 = (nw_connection_t)v8;
        }
        else
        {
          if ((v58 & 1) == 0)
          {
            if (__nwlog_connection_group_log::onceToken != -1) {
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
            }
            v147 = (id)gconnection_groupLogObj;
            if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
            {
              int v148 = *((_DWORD *)a1 + 42);
              uint64_t v149 = *((void *)a1 + 7);
              *(_DWORD *)buf = 136446978;
              v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              __int16 v165 = 1024;
              *(_DWORD *)v166 = v148;
              *(_WORD *)&v166[4] = 2112;
              *(void *)&v166[6] = v56;
              *(_WORD *)&v166[14] = 2112;
              *(void *)&v166[16] = v149;
              _os_log_impl(&dword_1830D4000, v147, OS_LOG_TYPE_DEBUG, "%{public}s [G%u] creating connection for multiplex endpoint (%@) and parameters (%@)", buf, 0x26u);
            }
          }
          nw_connection_t v59 = nw_connection_create(v56, *((nw_parameters_t *)a1 + 7));
        }
        nw_connection_t v87 = v59;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke_12;
        aBlock[3] = &unk_1E524B9A0;
        v151 = a1;
        nw_connection_t v152 = v87;
        v88 = v87;
        v89 = (void (**)(void))_Block_copy(aBlock);
        os_unfair_lock_lock((os_unfair_lock_t)a1 + 43);
        v89[2](v89);
        os_unfair_lock_unlock((os_unfair_lock_t)a1 + 43);

        goto LABEL_128;
      }
      if (!v55) {
        goto LABEL_109;
      }
      v78 = v55;
      int v79 = v78[2];

      if (v79 == 3) {
        goto LABEL_128;
      }
      v80 = (void *)*((void *)a1 + 8);
      if (!v80) {
        goto LABEL_109;
      }
      if (nw_group_descriptor_get_type(v80) == 4)
      {
        nw_listener_t v81 = nw_listener_create(*((nw_parameters_t *)a1 + 7));
        v82 = (void *)*((void *)a1 + 11);
        *((void *)a1 + 11) = v81;

        if (!*((void *)a1 + 11))
        {
          if (!nw_parameters_get_logging_disabled(*((void *)a1 + 7)))
          {
            if (__nwlog_connection_group_log::onceToken != -1) {
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
            }
            v83 = (id)gconnection_groupLogObj;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              int v84 = *((_DWORD *)a1 + 42);
              uint64_t v85 = *((void *)a1 + 7);
              *(_DWORD *)buf = 136446722;
              v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              __int16 v165 = 1024;
              *(_DWORD *)v166 = v84;
              *(_WORD *)&v166[4] = 2112;
              *(void *)&v166[6] = v85;
              _os_log_impl(&dword_1830D4000, v83, OS_LOG_TYPE_ERROR, "%{public}s [G%u] failed to create listener with parameters %@", buf, 0x1Cu);
            }
          }
          goto LABEL_76;
        }
LABEL_128:
        uint64_t v101 = *((void *)a1 + 11);
        BOOL v102 = nw_parameters_get_logging_disabled(*((void *)a1 + 7));
        if (v101)
        {
          if (!v102)
          {
            if (__nwlog_connection_group_log::onceToken != -1) {
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
            }
            v103 = (id)gconnection_groupLogObj;
            if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_140;
            }
            int v104 = *((_DWORD *)a1 + 42);
            uint64_t v106 = *((void *)a1 + 7);
            uint64_t v105 = *((void *)a1 + 8);
            id_string = nw_listener_get_id_string(*((void **)a1 + 11));
            *(_DWORD *)buf = 136447234;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            __int16 v165 = 1024;
            *(_DWORD *)v166 = v104;
            *(_WORD *)&v166[4] = 2112;
            *(void *)&v166[6] = v105;
            *(_WORD *)&v166[14] = 2112;
            *(void *)&v166[16] = v106;
            __int16 v167 = 2080;
            v168 = id_string;
            v108 = "%{public}s [G%u] create with descriptor: %@, parameters: %@, listener: [%s]";
            v109 = v103;
            uint32_t v110 = 48;
LABEL_139:
            _os_log_impl(&dword_1830D4000, v109, OS_LOG_TYPE_DEFAULT, v108, buf, v110);
LABEL_140:
          }
        }
        else if (!v102)
        {
          if (__nwlog_connection_group_log::onceToken != -1) {
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_32);
          }
          v103 = (id)gconnection_groupLogObj;
          if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_140;
          }
          int v111 = *((_DWORD *)a1 + 42);
          uint64_t v113 = *((void *)a1 + 7);
          uint64_t v112 = *((void *)a1 + 8);
          *(_DWORD *)buf = 136446978;
          v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          __int16 v165 = 1024;
          *(_DWORD *)v166 = v111;
          *(_WORD *)&v166[4] = 2112;
          *(void *)&v166[6] = v112;
          *(_WORD *)&v166[14] = 2112;
          *(void *)&v166[16] = v113;
          v108 = "%{public}s [G%u] create with descriptor: %@, parameters: %@";
          v109 = v103;
          uint32_t v110 = 38;
          goto LABEL_139;
        }
        v76 = a1;
        goto LABEL_142;
      }
      if (!*((void *)a1 + 8))
      {
LABEL_109:
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v93 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
        v94 = (char *)_os_log_send_and_compose_impl();

        type[0] = OS_LOG_TYPE_ERROR;
        LOBYTE(v154) = 0;
        if (!__nwlog_fault(v94, type, &v154)) {
          goto LABEL_126;
        }
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v95 = (id)gLogObj;
          os_log_type_t v96 = type[0];
          if (os_log_type_enabled(v95, type[0]))
          {
            *(_DWORD *)buf = 136446210;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            _os_log_impl(&dword_1830D4000, v95, v96, "%{public}s Group descriptor is not set", buf, 0xCu);
          }
        }
        else if ((_BYTE)v154)
        {
          v97 = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v95 = (id)gLogObj;
          os_log_type_t v98 = type[0];
          BOOL v99 = os_log_type_enabled(v95, type[0]);
          if (v97)
          {
            if (v99)
            {
              *(_DWORD *)buf = 136446466;
              v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              __int16 v165 = 2082;
              *(void *)v166 = v97;
              _os_log_impl(&dword_1830D4000, v95, v98, "%{public}s Group descriptor is not set, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v97);
            if (!v94) {
              goto LABEL_128;
            }
LABEL_127:
            free(v94);
            goto LABEL_128;
          }
          if (v99)
          {
            *(_DWORD *)buf = 136446210;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            _os_log_impl(&dword_1830D4000, v95, v98, "%{public}s Group descriptor is not set, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v95 = (id)gLogObj;
          os_log_type_t v100 = type[0];
          if (os_log_type_enabled(v95, type[0]))
          {
            *(_DWORD *)buf = 136446210;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            _os_log_impl(&dword_1830D4000, v95, v100, "%{public}s Group descriptor is not set, backtrace limit exceeded", buf, 0xCu);
          }
        }
        goto LABEL_125;
      }
      v90 = __nwlog_obj();
      unsigned int v91 = nw_group_descriptor_get_type(*((void **)a1 + 8));
      if (v91 > 4) {
        v92 = "unknown";
      }
      else {
        v92 = off_1E523BC90[v91];
      }
      *(_DWORD *)buf = 136446466;
      v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
      __int16 v165 = 2080;
      *(void *)v166 = v92;
      v94 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v154) = 0;
      if (__nwlog_fault(v94, type, &v154))
      {
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          v95 = __nwlog_obj();
          os_log_type_t v115 = type[0];
          if (os_log_type_enabled(v95, type[0]))
          {
            unsigned int v116 = nw_group_descriptor_get_type(*((void **)a1 + 8));
            if (v116 > 4) {
              v117 = "unknown";
            }
            else {
              v117 = off_1E523BC90[v116];
            }
            *(_DWORD *)buf = 136446466;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            __int16 v165 = 2080;
            *(void *)v166 = v117;
            _os_log_impl(&dword_1830D4000, v95, v115, "%{public}s Unsupported group descriptor type: %s", buf, 0x16u);
          }
LABEL_125:

          goto LABEL_126;
        }
        if (!(_BYTE)v154)
        {
          v95 = __nwlog_obj();
          os_log_type_t v123 = type[0];
          if (os_log_type_enabled(v95, type[0]))
          {
            unsigned int v124 = nw_group_descriptor_get_type(*((void **)a1 + 8));
            if (v124 > 4) {
              v125 = "unknown";
            }
            else {
              v125 = off_1E523BC90[v124];
            }
            *(_DWORD *)buf = 136446466;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            __int16 v165 = 2080;
            *(void *)v166 = v125;
            _os_log_impl(&dword_1830D4000, v95, v123, "%{public}s Unsupported group descriptor type: %s, backtrace limit exceeded", buf, 0x16u);
          }
          goto LABEL_125;
        }
        v118 = (char *)__nw_create_backtrace_string();
        v95 = __nwlog_obj();
        os_log_type_t v119 = type[0];
        BOOL v120 = os_log_type_enabled(v95, type[0]);
        if (!v118)
        {
          if (v120)
          {
            unsigned int v132 = nw_group_descriptor_get_type(*((void **)a1 + 8));
            if (v132 > 4) {
              v133 = "unknown";
            }
            else {
              v133 = off_1E523BC90[v132];
            }
            *(_DWORD *)buf = 136446466;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            __int16 v165 = 2080;
            *(void *)v166 = v133;
            _os_log_impl(&dword_1830D4000, v95, v119, "%{public}s Unsupported group descriptor type: %s, no backtrace", buf, 0x16u);
          }
          goto LABEL_125;
        }
        if (v120)
        {
          unsigned int v121 = nw_group_descriptor_get_type(*((void **)a1 + 8));
          if (v121 > 4) {
            v122 = "unknown";
          }
          else {
            v122 = off_1E523BC90[v121];
          }
          *(_DWORD *)buf = 136446722;
          v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          __int16 v165 = 2080;
          *(void *)v166 = v122;
          *(_WORD *)&v166[8] = 2082;
          *(void *)&v166[10] = v118;
          _os_log_impl(&dword_1830D4000, v95, v119, "%{public}s Unsupported group descriptor type: %s, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(v118);
      }
LABEL_126:
      if (!v94) {
        goto LABEL_128;
      }
      goto LABEL_127;
    }
    v128 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
    v129 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v154) = 0;
    if (__nwlog_fault(v129, type, &v154))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        v130 = __nwlog_obj();
        os_log_type_t v131 = type[0];
        if (os_log_type_enabled(v130, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          _os_log_impl(&dword_1830D4000, v130, v131, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if ((_BYTE)v154)
      {
        v136 = (char *)__nw_create_backtrace_string();
        v130 = __nwlog_obj();
        os_log_type_t v137 = type[0];
        BOOL v138 = os_log_type_enabled(v130, type[0]);
        if (v136)
        {
          if (v138)
          {
            *(_DWORD *)buf = 136446466;
            v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            __int16 v165 = 2082;
            *(void *)v166 = v136;
            _os_log_impl(&dword_1830D4000, v130, v137, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v136);
          goto LABEL_213;
        }
        if (v138)
        {
          *(_DWORD *)buf = 136446210;
          v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          _os_log_impl(&dword_1830D4000, v130, v137, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v130 = __nwlog_obj();
        os_log_type_t v140 = type[0];
        if (os_log_type_enabled(v130, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          _os_log_impl(&dword_1830D4000, v130, v140, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_213:
    if (v129) {
      free(v129);
    }
    a1 = 0;
    goto LABEL_102;
  }
  v126 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
  os_log_type_t v13 = (char *)_os_log_send_and_compose_impl();

  type[0] = OS_LOG_TYPE_ERROR;
  LOBYTE(v154) = 0;
  if (__nwlog_fault(v13, type, &v154))
  {
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      v14 = __nwlog_obj();
      os_log_type_t v127 = type[0];
      if (os_log_type_enabled(v14, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
        _os_log_impl(&dword_1830D4000, v14, v127, "%{public}s called with null _descriptor", buf, 0xCu);
      }
      goto LABEL_99;
    }
    if (!(_BYTE)v154)
    {
      v14 = __nwlog_obj();
      os_log_type_t v139 = type[0];
      if (os_log_type_enabled(v14, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
        _os_log_impl(&dword_1830D4000, v14, v139, "%{public}s called with null _descriptor, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_99;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    v14 = __nwlog_obj();
    os_log_type_t v134 = type[0];
    BOOL v135 = os_log_type_enabled(v14, type[0]);
    if (!backtrace_string)
    {
      if (v135)
      {
        *(_DWORD *)buf = 136446210;
        v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
        _os_log_impl(&dword_1830D4000, v14, v134, "%{public}s called with null _descriptor, no backtrace", buf, 0xCu);
      }
      goto LABEL_99;
    }
    if (v135)
    {
      *(_DWORD *)buf = 136446466;
      v164 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
      __int16 v165 = 2082;
      *(void *)v166 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v14, v134, "%{public}s called with null _descriptor, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_25;
  }
LABEL_100:
  if (v13) {
LABEL_101:
  }
    free(v13);
LABEL_102:
  v76 = 0;
LABEL_143:

  return v76;
}

@end