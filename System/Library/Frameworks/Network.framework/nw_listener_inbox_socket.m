@interface nw_listener_inbox_socket
- (BOOL)cancel;
- (BOOL)resume;
- (BOOL)suspend;
- (id)description;
- (id)start;
- (nw_listener_inbox_socket)initWithParameters:(id)a3 delegate:(id)a4;
- (void)initWithParameters:(void *)a3 delegate:(_OWORD *)a4 necpUUID:;
@end

@implementation nw_listener_inbox_socket

- (id)start
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  int sockfd_from_client = self->_sockfd_from_client;
  int v3 = sockfd_from_client;
  self->_int sockfd_from_client = -1;
  if (v3 < 0)
  {
    posix_error = nw_listener_socket_inbox_create_socket(self->super._parameters, self->_listenUUID, &sockfd_from_client);
    int v5 = sockfd_from_client;
    if (posix_error) {
      goto LABEL_161;
    }
  }
  else
  {
    posix_error = 0;
    int v5 = v3;
  }
  if ((v5 & 0x80000000) == 0)
  {
    v6 = nw_fd_wrapper_create(v5);
    int v90 = 1;
    if (ioctl(sockfd_from_client, 0x8004667EuLL, &v90) < 0)
    {
      posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                        + 8));
      int error_code = nw_error_get_error_code(posix_error);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v16 = (id)gLogObj;
      *(_DWORD *)&buf[0].sa_len = 136446466;
      *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
      *(_WORD *)&buf[0].sa_data[10] = 1024;
      *(_DWORD *)&buf[0].sa_data[12] = error_code;
      v9 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v89) = 0;
      if (!__nwlog_fault(v9, type, &v89)) {
        goto LABEL_158;
      }
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = error_code;
          _os_log_impl(&dword_1830D4000, v10, v17, "%{public}s FIONBIO failed %{darwin.errno}d", &buf[0].sa_len, 0x12u);
        }
      }
      else if ((_BYTE)v89)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v20 = type[0];
        BOOL v21 = os_log_type_enabled(v10, type[0]);
        if (backtrace_string)
        {
          if (v21)
          {
            *(_DWORD *)&buf[0].sa_len = 136446722;
            *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
            *(_WORD *)&buf[0].sa_data[10] = 1024;
            *(_DWORD *)&buf[0].sa_data[12] = error_code;
            *(_WORD *)buf[1].sa_data = 2082;
            *(void *)&buf[1].sa_data[2] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v10, v20, "%{public}s FIONBIO failed %{darwin.errno}d, dumping backtrace:%{public}s", &buf[0].sa_len, 0x1Cu);
          }

          free(backtrace_string);
          if (!v9) {
            goto LABEL_160;
          }
          goto LABEL_159;
        }
        if (v21)
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = error_code;
          _os_log_impl(&dword_1830D4000, v10, v20, "%{public}s FIONBIO failed %{darwin.errno}d, no backtrace", &buf[0].sa_len, 0x12u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v29 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = error_code;
          _os_log_impl(&dword_1830D4000, v10, v29, "%{public}s FIONBIO failed %{darwin.errno}d, backtrace limit exceeded", &buf[0].sa_len, 0x12u);
        }
      }
      goto LABEL_58;
    }
    if (nw_parameters_get_tfo(self->super._parameters) && setsockopt(sockfd_from_client, 6, 261, &v90, 4u))
    {
      posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                        + 8));
      int v7 = nw_error_get_error_code(posix_error);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v8 = (id)gLogObj;
      *(_DWORD *)&buf[0].sa_len = 136446722;
      *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
      *(_WORD *)&buf[0].sa_data[10] = 1024;
      *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
      *(_WORD *)buf[1].sa_data = 1024;
      *(_DWORD *)&buf[1].sa_data[2] = v7;
      v9 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v89) = 0;
      if (!__nwlog_fault(v9, type, &v89)) {
        goto LABEL_158;
      }
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v11 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446722;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          *(_WORD *)buf[1].sa_data = 1024;
          *(_DWORD *)&buf[1].sa_data[2] = v7;
          _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s setsockopt(%d, TCP_FASTOPEN, 1) failed %{darwin.errno}d", &buf[0].sa_len, 0x18u);
        }
LABEL_58:

        goto LABEL_158;
      }
      if (!(_BYTE)v89)
      {
        v10 = __nwlog_obj();
        os_log_type_t v33 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446722;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          *(_WORD *)buf[1].sa_data = 1024;
          *(_DWORD *)&buf[1].sa_data[2] = v7;
          _os_log_impl(&dword_1830D4000, v10, v33, "%{public}s setsockopt(%d, TCP_FASTOPEN, 1) failed %{darwin.errno}d, backtrace limit exceeded", &buf[0].sa_len, 0x18u);
        }
        goto LABEL_58;
      }
      v26 = (char *)__nw_create_backtrace_string();
      v10 = __nwlog_obj();
      os_log_type_t v27 = type[0];
      BOOL v28 = os_log_type_enabled(v10, type[0]);
      if (!v26)
      {
        if (v28)
        {
          *(_DWORD *)&buf[0].sa_len = 136446722;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          *(_WORD *)buf[1].sa_data = 1024;
          *(_DWORD *)&buf[1].sa_data[2] = v7;
          _os_log_impl(&dword_1830D4000, v10, v27, "%{public}s setsockopt(%d, TCP_FASTOPEN, 1) failed %{darwin.errno}d, no backtrace", &buf[0].sa_len, 0x18u);
        }
        goto LABEL_58;
      }
      if (v28)
      {
        *(_DWORD *)&buf[0].sa_len = 136446978;
        *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
        *(_WORD *)&buf[0].sa_data[10] = 1024;
        *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
        *(_WORD *)buf[1].sa_data = 1024;
        *(_DWORD *)&buf[1].sa_data[2] = v7;
        *(_WORD *)&buf[1].sa_data[6] = 2082;
        *(void *)&buf[1].sa_data[8] = v26;
        _os_log_impl(&dword_1830D4000, v10, v27, "%{public}s setsockopt(%d, TCP_FASTOPEN, 1) failed %{darwin.errno}d, dumping backtrace:%{public}s", &buf[0].sa_len, 0x22u);
      }

LABEL_119:
      free(v26);
      if (!v9) {
        goto LABEL_160;
      }
      goto LABEL_159;
    }
    self->_sockfd_for_logging_only_do_not_close_or_use = sockfd_from_client;
    if ([(nw_listener_inbox *)self multicast])
    {
      int v12 = dup(sockfd_from_client);
      v13 = (OS_nw_fd_wrapper *)nw_fd_wrapper_create(v12);
      sockfd_wrapper_for_connection_group_only = self->_sockfd_wrapper_for_connection_group_only;
      self->_sockfd_wrapper_for_connection_group_only = v13;
    }
    else
    {
      sockfd_wrapper_for_connection_group_only = self->_sockfd_wrapper_for_connection_group_only;
      self->_sockfd_wrapper_for_connection_group_only = 0;
    }

    if (v3 >= 0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)&buf[0].sa_len = 136446466;
        *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
        *(_WORD *)&buf[0].sa_data[10] = 1024;
        *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
        _os_log_impl(&dword_1830D4000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s Not guarding fd %d", &buf[0].sa_len, 0x12u);
      }

      goto LABEL_67;
    }
    if (nw_fd_wrapper_guard(v6)) {
      goto LABEL_67;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v22 = (id)gLogObj;
    *(_DWORD *)&buf[0].sa_len = 136446466;
    *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
    *(_WORD *)&buf[0].sa_data[10] = 1024;
    *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
    v23 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v89) = 0;
    if (__nwlog_fault(v23, type, &v89))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v24 = (id)gLogObj;
        os_log_type_t v25 = type[0];
        if (os_log_type_enabled(v24, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          _os_log_impl(&dword_1830D4000, v24, v25, "%{public}s Failed to protect fd %d", &buf[0].sa_len, 0x12u);
        }
      }
      else if ((_BYTE)v89)
      {
        v30 = (char *)__nw_create_backtrace_string();
        v24 = __nwlog_obj();
        os_log_type_t v31 = type[0];
        BOOL v32 = os_log_type_enabled(v24, type[0]);
        if (v30)
        {
          if (v32)
          {
            *(_DWORD *)&buf[0].sa_len = 136446722;
            *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
            *(_WORD *)&buf[0].sa_data[10] = 1024;
            *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
            *(_WORD *)buf[1].sa_data = 2082;
            *(void *)&buf[1].sa_data[2] = v30;
            _os_log_impl(&dword_1830D4000, v24, v31, "%{public}s Failed to protect fd %d, dumping backtrace:%{public}s", &buf[0].sa_len, 0x1Cu);
          }

          free(v30);
          goto LABEL_65;
        }
        if (v32)
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          _os_log_impl(&dword_1830D4000, v24, v31, "%{public}s Failed to protect fd %d, no backtrace", &buf[0].sa_len, 0x12u);
        }
      }
      else
      {
        v24 = __nwlog_obj();
        os_log_type_t v34 = type[0];
        if (os_log_type_enabled(v24, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(void *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          _os_log_impl(&dword_1830D4000, v24, v34, "%{public}s Failed to protect fd %d, backtrace limit exceeded", &buf[0].sa_len, 0x12u);
        }
      }
    }
LABEL_65:
    if (v23) {
      free(v23);
    }
LABEL_67:
    memset(buf, 0, sizeof(buf));
    socklen_t v89 = 128;
    if (!getsockname(sockfd_from_client, buf, &v89))
    {
      address = (OS_nw_endpoint *)nw_endpoint_create_address(buf);
      local_endpoint = self->super._local_endpoint;
      self->super._local_endpoint = address;
    }
    v37 = (OS_nw_interface *)nw_parameters_copy_required_interface((nw_parameters_t)self->super._parameters);
    interface = self->super._interface;
    self->super._interface = v37;

    v39 = self->super._interface;
    if (v39)
    {
      v40 = self->super._local_endpoint;
      if (v40)
      {
LABEL_71:
        if (!v39 || (nw_endpoint_set_interface(v40, v39), (v39 = self->super._interface) == 0))
        {
LABEL_101:
          id v59 = nw_parameters_copy_context(self->super._parameters);
          int v60 = sockfd_from_client;
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = __33__nw_listener_inbox_socket_start__block_invoke;
          v84[3] = &unk_1E524A070;
          v84[4] = self;
          int v85 = sockfd_from_client;
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __33__nw_listener_inbox_socket_start__block_invoke_2;
          v81[3] = &unk_1E524B9A0;
          v82 = v6;
          v83 = self;
          self->_source = (void *)nw_queue_context_create_source(v59, v60, 1, 0, v84, v81);

          source = self->_source;
          if (source)
          {
            nw_queue_activate_source((uint64_t)source);
            posix_error = 0;
LABEL_129:

            goto LABEL_160;
          }
          posix_error = -[NWConcrete_nw_error initWithDomain:code:]([NWConcrete_nw_error alloc], 1, 12);
          int v62 = nw_error_get_error_code(posix_error);
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          id v63 = (id)gLogObj;
          *(_DWORD *)type = 136446466;
          v93 = "-[nw_listener_inbox_socket start]";
          __int16 v94 = 1024;
          int v95 = v62;
          v64 = (char *)_os_log_send_and_compose_impl();

          v88[0] = OS_LOG_TYPE_ERROR;
          os_log_type_t v87 = OS_LOG_TYPE_DEFAULT;
          if (__nwlog_fault(v64, v88, &v87))
          {
            if (v88[0] == OS_LOG_TYPE_FAULT)
            {
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v65 = (id)gLogObj;
              os_log_type_t v66 = v88[0];
              if (os_log_type_enabled(v65, v88[0]))
              {
                *(_DWORD *)type = 136446466;
                v93 = "-[nw_listener_inbox_socket start]";
                __int16 v94 = 1024;
                int v95 = v62;
                _os_log_impl(&dword_1830D4000, v65, v66, "%{public}s nw_queue_context_create_source failed %{darwin.errno}d", (uint8_t *)type, 0x12u);
              }
            }
            else if (v87)
            {
              v67 = (char *)__nw_create_backtrace_string();
              v65 = __nwlog_obj();
              os_log_type_t v68 = v88[0];
              BOOL v69 = os_log_type_enabled(v65, v88[0]);
              if (v67)
              {
                if (v69)
                {
                  *(_DWORD *)type = 136446722;
                  v93 = "-[nw_listener_inbox_socket start]";
                  __int16 v94 = 1024;
                  int v95 = v62;
                  __int16 v96 = 2082;
                  *(void *)v97 = v67;
                  _os_log_impl(&dword_1830D4000, v65, v68, "%{public}s nw_queue_context_create_source failed %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)type, 0x1Cu);
                }

                free(v67);
                if (!v64) {
                  goto LABEL_129;
                }
                goto LABEL_128;
              }
              if (v69)
              {
                *(_DWORD *)type = 136446466;
                v93 = "-[nw_listener_inbox_socket start]";
                __int16 v94 = 1024;
                int v95 = v62;
                _os_log_impl(&dword_1830D4000, v65, v68, "%{public}s nw_queue_context_create_source failed %{darwin.errno}d, no backtrace", (uint8_t *)type, 0x12u);
              }
            }
            else
            {
              v65 = __nwlog_obj();
              os_log_type_t v72 = v88[0];
              if (os_log_type_enabled(v65, v88[0]))
              {
                *(_DWORD *)type = 136446466;
                v93 = "-[nw_listener_inbox_socket start]";
                __int16 v94 = 1024;
                int v95 = v62;
                _os_log_impl(&dword_1830D4000, v65, v72, "%{public}s nw_queue_context_create_source failed %{darwin.errno}d, backtrace limit exceeded", (uint8_t *)type, 0x12u);
              }
            }
          }
          if (!v64) {
            goto LABEL_129;
          }
LABEL_128:
          free(v64);
          goto LABEL_129;
        }
        goto LABEL_94;
      }
LABEL_93:
      if (!v39) {
        goto LABEL_101;
      }
LABEL_94:
      v53 = v39;
      int v54 = *((_DWORD *)v53 + 25);

      if (v54 != 4001 || !setsockopt(sockfd_from_client, 0xFFFF, 4376, &v90, 4u)) {
        goto LABEL_101;
      }
      posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                        + 8));
      int v55 = nw_error_get_error_code(posix_error);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v56 = (id)gLogObj;
      *(_DWORD *)type = 136446722;
      v93 = "-[nw_listener_inbox_socket start]";
      __int16 v94 = 1024;
      int v95 = sockfd_from_client;
      __int16 v96 = 1024;
      *(_DWORD *)v97 = v55;
      v9 = (char *)_os_log_send_and_compose_impl();

      v88[0] = OS_LOG_TYPE_ERROR;
      os_log_type_t v87 = OS_LOG_TYPE_DEFAULT;
      if (__nwlog_fault(v9, v88, &v87))
      {
        if (v88[0] == OS_LOG_TYPE_FAULT)
        {
          v57 = __nwlog_obj();
          os_log_type_t v58 = v88[0];
          if (os_log_type_enabled(v57, v88[0]))
          {
            *(_DWORD *)type = 136446722;
            v93 = "-[nw_listener_inbox_socket start]";
            __int16 v94 = 1024;
            int v95 = sockfd_from_client;
            __int16 v96 = 1024;
            *(_DWORD *)v97 = v55;
            _os_log_impl(&dword_1830D4000, v57, v58, "%{public}s setsockopt(%d, SO_INTCOPROC_ALLOW, 1) failed %{darwin.errno}d", (uint8_t *)type, 0x18u);
          }
        }
        else if (v87)
        {
          v26 = (char *)__nw_create_backtrace_string();
          v57 = __nwlog_obj();
          os_log_type_t v70 = v88[0];
          BOOL v71 = os_log_type_enabled(v57, v88[0]);
          if (v26)
          {
            if (v71)
            {
              *(_DWORD *)type = 136446978;
              v93 = "-[nw_listener_inbox_socket start]";
              __int16 v94 = 1024;
              int v95 = sockfd_from_client;
              __int16 v96 = 1024;
              *(_DWORD *)v97 = v55;
              *(_WORD *)&v97[4] = 2082;
              *(void *)&v97[6] = v26;
              _os_log_impl(&dword_1830D4000, v57, v70, "%{public}s setsockopt(%d, SO_INTCOPROC_ALLOW, 1) failed %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)type, 0x22u);
            }

            goto LABEL_119;
          }
          if (v71)
          {
            *(_DWORD *)type = 136446722;
            v93 = "-[nw_listener_inbox_socket start]";
            __int16 v94 = 1024;
            int v95 = sockfd_from_client;
            __int16 v96 = 1024;
            *(_DWORD *)v97 = v55;
            _os_log_impl(&dword_1830D4000, v57, v70, "%{public}s setsockopt(%d, SO_INTCOPROC_ALLOW, 1) failed %{darwin.errno}d, no backtrace", (uint8_t *)type, 0x18u);
          }
        }
        else
        {
          v57 = __nwlog_obj();
          os_log_type_t v73 = v88[0];
          if (os_log_type_enabled(v57, v88[0]))
          {
            *(_DWORD *)type = 136446722;
            v93 = "-[nw_listener_inbox_socket start]";
            __int16 v94 = 1024;
            int v95 = sockfd_from_client;
            __int16 v96 = 1024;
            *(_DWORD *)v97 = v55;
            _os_log_impl(&dword_1830D4000, v57, v73, "%{public}s setsockopt(%d, SO_INTCOPROC_ALLOW, 1) failed %{darwin.errno}d, backtrace limit exceeded", (uint8_t *)type, 0x18u);
          }
        }
      }
LABEL_158:
      if (v9) {
LABEL_159:
      }
        free(v9);
LABEL_160:

      goto LABEL_161;
    }
    v41 = self->super._local_endpoint;
    if (v41)
    {
      v42 = nw_endpoint_get_address(v41);
      if (v42)
      {
        *(_DWORD *)v88 = 0;
        socklen_t v89 = 4;
        int sa_family = v42->sa_family;
        if (sa_family == 30)
        {
          if (getsockopt(sockfd_from_client, 41, 125, v88, &v89))
          {
            posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                              + 8));
            int v48 = nw_error_get_error_code(posix_error);
            v49 = __nwlog_obj();
            *(_DWORD *)type = 136446722;
            v93 = "-[nw_listener_inbox_socket start]";
            __int16 v94 = 1024;
            int v95 = sockfd_from_client;
            __int16 v96 = 1024;
            *(_DWORD *)v97 = v48;
            v9 = (char *)_os_log_send_and_compose_impl();

            os_log_type_t v87 = OS_LOG_TYPE_ERROR;
            char v86 = 0;
            if (!__nwlog_fault(v9, &v87, &v86)) {
              goto LABEL_158;
            }
            if (v87 == OS_LOG_TYPE_FAULT)
            {
              v46 = __nwlog_obj();
              os_log_type_t v50 = v87;
              if (os_log_type_enabled(v46, v87))
              {
                *(_DWORD *)type = 136446722;
                v93 = "-[nw_listener_inbox_socket start]";
                __int16 v94 = 1024;
                int v95 = sockfd_from_client;
                __int16 v96 = 1024;
                *(_DWORD *)v97 = v48;
                _os_log_impl(&dword_1830D4000, v46, v50, "%{public}s getsockopt(%d, IPV6_BOUND_IF) failed %{darwin.errno}d", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            if (!v86)
            {
              v46 = __nwlog_obj();
              os_log_type_t v79 = v87;
              if (os_log_type_enabled(v46, v87))
              {
                *(_DWORD *)type = 136446722;
                v93 = "-[nw_listener_inbox_socket start]";
                __int16 v94 = 1024;
                int v95 = sockfd_from_client;
                __int16 v96 = 1024;
                *(_DWORD *)v97 = v48;
                _os_log_impl(&dword_1830D4000, v46, v79, "%{public}s getsockopt(%d, IPV6_BOUND_IF) failed %{darwin.errno}d, backtrace limit exceeded", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            v26 = (char *)__nw_create_backtrace_string();
            v46 = __nwlog_obj();
            os_log_type_t v76 = v87;
            BOOL v77 = os_log_type_enabled(v46, v87);
            if (!v26)
            {
              if (v77)
              {
                *(_DWORD *)type = 136446722;
                v93 = "-[nw_listener_inbox_socket start]";
                __int16 v94 = 1024;
                int v95 = sockfd_from_client;
                __int16 v96 = 1024;
                *(_DWORD *)v97 = v48;
                _os_log_impl(&dword_1830D4000, v46, v76, "%{public}s getsockopt(%d, IPV6_BOUND_IF) failed %{darwin.errno}d, no backtrace", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            if (v77)
            {
              *(_DWORD *)type = 136446978;
              v93 = "-[nw_listener_inbox_socket start]";
              __int16 v94 = 1024;
              int v95 = sockfd_from_client;
              __int16 v96 = 1024;
              *(_DWORD *)v97 = v48;
              *(_WORD *)&v97[4] = 2082;
              *(void *)&v97[6] = v26;
              _os_log_impl(&dword_1830D4000, v46, v76, "%{public}s getsockopt(%d, IPV6_BOUND_IF) failed %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)type, 0x22u);
            }
            goto LABEL_140;
          }
        }
        else
        {
          if (sa_family != 2) {
            goto LABEL_92;
          }
          if (getsockopt(sockfd_from_client, 0, 25, v88, &v89))
          {
            posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                              + 8));
            int v44 = nw_error_get_error_code(posix_error);
            v45 = __nwlog_obj();
            *(_DWORD *)type = 136446722;
            v93 = "-[nw_listener_inbox_socket start]";
            __int16 v94 = 1024;
            int v95 = sockfd_from_client;
            __int16 v96 = 1024;
            *(_DWORD *)v97 = v44;
            v9 = (char *)_os_log_send_and_compose_impl();

            os_log_type_t v87 = OS_LOG_TYPE_ERROR;
            char v86 = 0;
            if (!__nwlog_fault(v9, &v87, &v86)) {
              goto LABEL_158;
            }
            if (v87 == OS_LOG_TYPE_FAULT)
            {
              v46 = __nwlog_obj();
              os_log_type_t v47 = v87;
              if (os_log_type_enabled(v46, v87))
              {
                *(_DWORD *)type = 136446722;
                v93 = "-[nw_listener_inbox_socket start]";
                __int16 v94 = 1024;
                int v95 = sockfd_from_client;
                __int16 v96 = 1024;
                *(_DWORD *)v97 = v44;
                _os_log_impl(&dword_1830D4000, v46, v47, "%{public}s getsockopt(%d, IP_BOUND_IF) failed %{darwin.errno}d", (uint8_t *)type, 0x18u);
              }
LABEL_157:

              goto LABEL_158;
            }
            if (!v86)
            {
              v46 = __nwlog_obj();
              os_log_type_t v78 = v87;
              if (os_log_type_enabled(v46, v87))
              {
                *(_DWORD *)type = 136446722;
                v93 = "-[nw_listener_inbox_socket start]";
                __int16 v94 = 1024;
                int v95 = sockfd_from_client;
                __int16 v96 = 1024;
                *(_DWORD *)v97 = v44;
                _os_log_impl(&dword_1830D4000, v46, v78, "%{public}s getsockopt(%d, IP_BOUND_IF) failed %{darwin.errno}d, backtrace limit exceeded", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            v26 = (char *)__nw_create_backtrace_string();
            v46 = __nwlog_obj();
            os_log_type_t v74 = v87;
            BOOL v75 = os_log_type_enabled(v46, v87);
            if (!v26)
            {
              if (v75)
              {
                *(_DWORD *)type = 136446722;
                v93 = "-[nw_listener_inbox_socket start]";
                __int16 v94 = 1024;
                int v95 = sockfd_from_client;
                __int16 v96 = 1024;
                *(_DWORD *)v97 = v44;
                _os_log_impl(&dword_1830D4000, v46, v74, "%{public}s getsockopt(%d, IP_BOUND_IF) failed %{darwin.errno}d, no backtrace", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            if (v75)
            {
              *(_DWORD *)type = 136446978;
              v93 = "-[nw_listener_inbox_socket start]";
              __int16 v94 = 1024;
              int v95 = sockfd_from_client;
              __int16 v96 = 1024;
              *(_DWORD *)v97 = v44;
              *(_WORD *)&v97[4] = 2082;
              *(void *)&v97[6] = v26;
              _os_log_impl(&dword_1830D4000, v46, v74, "%{public}s getsockopt(%d, IP_BOUND_IF) failed %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)type, 0x22u);
            }
LABEL_140:

            goto LABEL_119;
          }
        }
        if (*(_DWORD *)v88)
        {
          v51 = (OS_nw_interface *)nw_interface_create_with_index(*(unsigned int *)v88);
          v52 = self->super._interface;
          self->super._interface = v51;
        }
      }
    }
LABEL_92:
    v39 = self->super._interface;
    v40 = self->super._local_endpoint;
    if (v40) {
      goto LABEL_71;
    }
    goto LABEL_93;
  }
LABEL_161:

  return posix_error;
}

- (void)initWithParameters:(void *)a3 delegate:(_OWORD *)a4 necpUUID:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = [a1 initWithParameters:v7 delegate:v8];
    a1 = (void *)v9;
    if (v9) {
      *(_OWORD *)(v9 + 89) = *a4;
    }
  }

  return a1;
}

- (nw_listener_inbox_socket)initWithParameters:(id)a3 delegate:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)nw_listener_inbox_socket;
  uint64_t v9 = [(nw_listener_inbox *)&v24 initWithDelegate:v8];
  int ip_protocol = nw_parameters_get_ip_protocol(v7);
  int v11 = ip_protocol;
  if (ip_protocol != 6 && ip_protocol != 17)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
    __int16 v27 = 1024;
    int v28 = v11;
    v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (__nwlog_fault(v14, &type, &v22))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        os_log_type_t v16 = type;
        if (os_log_type_enabled(v15, type))
        {
          *(_DWORD *)buf = 136446466;
          v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
          __int16 v27 = 1024;
          int v28 = v11;
          _os_log_impl(&dword_1830D4000, v15, v16, "%{public}s Cannot create listener with IP Protocol %u", buf, 0x12u);
        }
      }
      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        os_log_type_t v19 = type;
        BOOL v20 = os_log_type_enabled(v15, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446722;
            v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
            __int16 v27 = 1024;
            int v28 = v11;
            __int16 v29 = 2082;
            v30 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v15, v19, "%{public}s Cannot create listener with IP Protocol %u, dumping backtrace:%{public}s", buf, 0x1Cu);
          }

          free(backtrace_string);
          if (!v14) {
            goto LABEL_11;
          }
          goto LABEL_10;
        }
        if (v20)
        {
          *(_DWORD *)buf = 136446466;
          v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
          __int16 v27 = 1024;
          int v28 = v11;
          _os_log_impl(&dword_1830D4000, v15, v19, "%{public}s Cannot create listener with IP Protocol %u, no backtrace", buf, 0x12u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v15, type))
        {
          *(_DWORD *)buf = 136446466;
          v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
          __int16 v27 = 1024;
          int v28 = v11;
          _os_log_impl(&dword_1830D4000, v15, v21, "%{public}s Cannot create listener with IP Protocol %u, backtrace limit exceeded", buf, 0x12u);
        }
      }
    }
    if (!v14)
    {
LABEL_11:
      int v12 = 0;
      goto LABEL_12;
    }
LABEL_10:
    free(v14);
    goto LABEL_11;
  }
  v9->_ipProtocol = ip_protocol;
  objc_storeStrong((id *)&v9->super._parameters, a3);
  objc_storeStrong((id *)&v9->super._delegate, a4);
  v9->_int sockfd_from_client = -1;
  int v12 = v9;
LABEL_12:

  return v12;
}

- (id)description
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__67787;
  v10 = __Block_byref_object_dispose__67788;
  id v11 = 0;
  p_lock = &self->super._lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__nw_listener_inbox_socket_description__block_invoke;
  v5[3] = &unk_1E524B978;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->super._lock);
  __39__nw_listener_inbox_socket_description__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
}

- (BOOL)cancel
{
  source = self->_source;
  if (source)
  {
    nw_queue_cancel_source((uint64_t)self->_source);
    self->_source = 0;
  }
  sockfd_wrapper_for_connection_group_only = self->_sockfd_wrapper_for_connection_group_only;
  if (sockfd_wrapper_for_connection_group_only)
  {
    self->_sockfd_wrapper_for_connection_group_only = 0;
  }
  return source != 0;
}

- (BOOL)resume
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)nw_listener_inbox_socket;
  BOOL v3 = [(nw_listener_inbox *)&v6 resume];
  if (v3 && self->_source)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v8 = "-[nw_listener_inbox_socket resume]";
      __int16 v9 = 2114;
      v10 = self;
      _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_INFO, "%{public}s Resumed inbox %{public}@", buf, 0x16u);
    }

    nw_queue_resume_source((uint64_t)self->_source);
  }
  return v3;
}

- (BOOL)suspend
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)nw_listener_inbox_socket;
  BOOL v3 = [(nw_listener_inbox *)&v6 suspend];
  if (v3 && self->_source)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v8 = "-[nw_listener_inbox_socket suspend]";
      __int16 v9 = 2114;
      v10 = self;
      _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_INFO, "%{public}s Suspended inbox %{public}@", buf, 0x16u);
    }

    nw_queue_suspend_source((uint64_t)self->_source);
  }
  return v3;
}

@end