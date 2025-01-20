@interface NEIKEv2CompanionDatapath
- (id)description;
- (os_unfair_lock_s)connected;
- (uint64_t)getStopReasonFromConnectionError:(uint64_t)a1;
- (void)cancelLocked;
- (void)dealloc;
- (void)resetConnectionLocked;
- (void)setupConnectionLocked;
- (void)signalCompletionSemaphoreLocked;
@end

@implementation NEIKEv2CompanionDatapath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnectionError, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localEndpointForDatapath, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_resolvedEndpoints, 0);
  objc_storeStrong((id *)&self->_connectedEndpointString, 0);

  objc_storeStrong((id *)&self->_datapathConnection, 0);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self && self->_state == 3)
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEFAULT, "%@: dealloc", buf, 0xCu);
    }
  }
  else
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, "%@: dealloc without cancellation", buf, 0xCu);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)NEIKEv2CompanionDatapath;
  [(NEIKEv2CompanionDatapath *)&v4 dealloc];
}

- (id)description
{
  id v4 = [NSString alloc];
  v5 = v4;
  if (self)
  {
    unint64_t identifier = self->_identifier;
    uint64_t v7 = self->_remoteEndpoint;
    v8 = self->_connectedEndpointString;
    v9 = "";
    if (v8) {
      v10 = " vpn-server ";
    }
    else {
      v10 = "";
    }
    v11 = self->_connectedEndpointString;
    if (v11)
    {
      v2 = self->_connectedEndpointString;
      v9 = [(NSString *)v2 UTF8String];
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    unint64_t state = self->_state;
    if (state >= 4) {
      v14 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%u)", self->_state);
    }
    else {
      v14 = off_1E5990C80[state];
    }
    v15 = (void *)[v5 initWithFormat:@"Cmpn[%llu %@%s%s %@]", identifier, v7, v10, v9, v14];

    if (!v11) {
      goto LABEL_13;
    }
  }
  else
  {
    v15 = (void *)[v4 initWithFormat:@"Cmpn[%llu %@%s%s %@]", 0, 0, ", ", 0];
    v2 = 0;
    v12 = 0;
    uint64_t v7 = 0;
    v8 = 0;
  }

LABEL_13:

  return v15;
}

- (void)cancelLocked
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  *(unsigned char *)(a1 + 9) = 3;
  -[NEIKEv2CompanionDatapath resetConnectionLocked](a1);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    int v3 = -[NEIKEv2CompanionDatapath getStopReasonFromConnectionError:](a1, *(void **)(a1 + 96));
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__NEIKEv2CompanionDatapath_cancelLocked__block_invoke;
    v4[3] = &unk_1E5990A58;
    id v5 = WeakRetained;
    int v6 = v3;
    [v5 stopTunnelWithReason:14 completionHandler:v4];
    -[NEIKEv2CompanionDatapath signalCompletionSemaphoreLocked](a1);
  }
}

- (void)resetConnectionLocked
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = a1;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "%@: reset-connection", (uint8_t *)&v5, 0xCu);
  }

  int v3 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    nw_connection_cancel(v3);
    id v4 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

- (uint64_t)getStopReasonFromConnectionError:(uint64_t)a1
{
  int v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3) {
      goto LABEL_9;
    }
    if (nw_error_get_error_domain(v3) == nw_error_domain_dns)
    {
      a1 = 17;
      goto LABEL_10;
    }
    if (nw_error_get_error_domain(v4) != nw_error_domain_posix)
    {
LABEL_9:
      a1 = 7;
      goto LABEL_10;
    }
    a1 = 7;
    uint64_t v5 = (nw_error_get_error_code(v4) - 32);
    if (v5 <= 0x21)
    {
      if (((1 << v5) & 0x2026C0001) != 0)
      {
        a1 = 4;
      }
      else if (v5 == 28)
      {
        a1 = 12;
      }
    }
  }
LABEL_10:

  return a1;
}

void __40__NEIKEv2CompanionDatapath_cancelLocked__block_invoke(uint64_t a1)
{
}

- (void)signalCompletionSemaphoreLocked
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  v2 = *(NSObject **)(a1 + 80);
  if (v2)
  {
    dispatch_semaphore_signal(v2);
    int v3 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;
  }
}

- (os_unfair_lock_s)connected
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    v1 = (os_unfair_lock_s *)(BYTE1(v1[2]._os_unfair_lock_opaque) == 2);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)setupConnectionLocked
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = a1;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "%@: starting", buf, 0xCu);
  }

  legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
  id v4 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
  options = nw_udp_create_options();
  nw_protocol_stack_set_transport_protocol(v4, options);

  nw_parameters_set_required_interface_subtype();
  nw_parameters_set_effective_bundle_id();
  uint64_t v6 = [*(id *)(a1 + 64) copyCEndpoint];
  nw_parameters_set_local_endpoint(legacy_tcp_socket, v6);

  nw_parameters_set_reuse_local_address(legacy_tcp_socket, 1);
  uint64_t v7 = [*(id *)(a1 + 56) copyCEndpoint];
  v8 = nw_connection_create(v7, legacy_tcp_socket);

  nw_connection_set_queue(v8, *(dispatch_queue_t *)(a1 + 72));
  objc_initWeak((id *)buf, (id)a1);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke;
  v15[3] = &unk_1E5990AA8;
  objc_copyWeak(&v17, (id *)buf);
  v9 = v8;
  v16 = v9;
  MEMORY[0x19F3B7D00](v9, v15, v10, v11);
  nw_connection_start(v9);
  v12 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v9;
  v13 = v9;

  ++*(unsigned char *)(a1 + 10);
  v14 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = 0;

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 3);
    if (*(unsigned char *)(v8 + 9) == 3 || *(void *)(v8 + 32) != *(void *)(a1 + 32)) {
      goto LABEL_4;
    }
    if (v6 || (a2 & 0xFFFFFFFE) == 4)
    {
      objc_storeStrong((id *)(v8 + 96), a3);
      id v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2080;
        uint64_t v34 = nw_connection_state_to_string();
        _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_DEFAULT, "%@: connection error %@ state %s", buf, 0x20u);
      }

      if (nw_error_get_error_code(v6) == 48)
      {
        -[NEIKEv2CompanionDatapath resetConnectionLocked](v8);
        if (*(unsigned __int8 *)(v8 + 10) <= 5u)
        {
          objc_initWeak((id *)buf, (id)v8);
          dispatch_time_t v18 = dispatch_time(0x8000000000000000, 1000000000 * *(unsigned __int8 *)(v8 + 10));
          uint64_t v19 = *(void **)(v8 + 72);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke_26;
          block[3] = &unk_1E5991040;
          uint64_t v20 = v19;
          objc_copyWeak(&v28, (id *)buf);
          id v27 = *(id *)(a1 + 32);
          dispatch_after(v18, v20, block);

          os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 12));
          objc_destroyWeak(&v28);
          objc_destroyWeak((id *)buf);
          goto LABEL_5;
        }
      }
      else if (a2 == 4)
      {
        if (*(unsigned char *)(v8 + 8))
        {
          id v21 = objc_loadWeakRetained((id *)(v8 + 88));
          v22 = v21;
          if (v21)
          {
            -[NEIKEv2PacketTunnelProvider handleCompanionProxyDatapathFailure:](v21, *(const char **)(v8 + 16));
            os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 12));

            goto LABEL_5;
          }
        }
      }
      -[NEIKEv2CompanionDatapath cancelLocked](v8);
      goto LABEL_4;
    }
    if (a2 != 3)
    {
LABEL_4:
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 12));
      goto LABEL_5;
    }
    objc_storeStrong((id *)(v8 + 96), 0);
    *(_WORD *)(v8 + 8) = 513;
    v9 = *(NSObject **)(a1 + 32);
    uint64_t v10 = nw_proxy_copy_shoes_definition();
    nw_protocol_metadata_t v11 = nw_connection_copy_protocol_metadata(v9, v10);

    if (!v11)
    {
      v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_fault_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_FAULT, "%@: no connection metadata found", buf, 0xCu);
      }

      -[NEIKEv2CompanionDatapath cancelLocked](v8);
      goto LABEL_33;
    }
    v12 = nw_shoes_metadata_copy_remote_endpoint();
    v13 = [NSString stringWithUTF8String:nw_endpoint_get_hostname(v12)];
    objc_storeStrong((id *)(v8 + 40), v13);

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v34 = (uint64_t)__Block_byref_object_copy__12137;
    v35 = __Block_byref_object_dispose__12138;
    id v36 = 0;
    v14 = (id *)(id)v8;
    nw_shoes_metadata_enumerate_resolved_endpoints();
    objc_storeStrong(v14 + 6, *(id *)(*(void *)&buf[8] + 40));
    v15 = nw_connection_copy_current_path(*(nw_connection_t *)(a1 + 32));
    if (nw_path_uses_interface_type(v15, nw_interface_type_wifi))
    {
      uint64_t v16 = 1;
    }
    else
    {
      if (!nw_path_uses_interface_type(v15, nw_interface_type_cellular))
      {
LABEL_28:
        if (nw_path_uses_interface_type(v15, nw_interface_type_wired)) {
          v14[3] = (id)3;
        }
        v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = v14[6];
          *(_DWORD *)v29 = 138412546;
          v30 = v14;
          __int16 v31 = 2112;
          id v32 = v25;
          _os_log_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_DEFAULT, "%@: connected w/resolved endpoints %@", v29, 0x16u);
        }

        _Block_object_dispose(buf, 8);
LABEL_33:
        -[NEIKEv2CompanionDatapath signalCompletionSemaphoreLocked](v8);

        goto LABEL_4;
      }
      uint64_t v16 = 2;
    }
    v14[3] = (id)v16;
    goto LABEL_28;
  }
LABEL_5:
}

uint64_t __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke_26(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained + 3;
    v9 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 3);
    if (BYTE1(v9[2]._os_unfair_lock_opaque) != 3)
    {
      id v5 = *(id *)&v9[8]._os_unfair_lock_opaque;
      if (!v5 || (v6 = *(void *)&v9[8]._os_unfair_lock_opaque, uint64_t v7 = *(void *)(a1 + 32), v5, v6 == v7)) {
        -[NEIKEv2CompanionDatapath setupConnectionLocked](v9);
      }
    }
    os_unfair_lock_unlock(v4);
    int v3 = v9;
  }

  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

uint64_t __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke_27(uint64_t a1, void *a2)
{
  int v3 = a2;
  if (nw_endpoint_get_type(v3) == nw_endpoint_type_address)
  {
    id v4 = [NSString stringWithUTF8String:nw_endpoint_get_hostname(v3)];
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      uint64_t v7 = *(void *)(v6 + 40);
    }
    else {
      uint64_t v7 = 0;
    }
    if (([v4 isEqualToString:v7] & 1) == 0)
    {
      uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        nw_protocol_metadata_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      [v8 addObject:v5];
    }
  }
  return 1;
}

@end