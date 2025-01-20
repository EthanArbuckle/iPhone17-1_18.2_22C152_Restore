@interface EAPBoringSSLSession
- ($866BB3734758C83BFC474B4A3B7B1691)memIO;
- (BOOL)configureSecProtocol:(EAPBoringSSLSessionParameters_s *)a3;
- (BOOL)getSessionResumed;
- (BOOL)setClientIdentity:(__SecIdentity *)a3 certificates:(id)a4;
- (BOOL)setup:(EAPBoringSSLSessionParameters_s *)a3 clientContext:(void *)a4;
- (EAPBoringSSLSession)init;
- (NSConditionLock)statusUpdateLock;
- (NSData)msk;
- (OS_dispatch_queue)queue;
- (OS_nw_connection)connection;
- (OS_nw_framer)customFramer;
- (OS_nw_protocol_options)customProtocol;
- (OS_nw_protocol_options)tlsProtocol;
- (OS_sec_protocol_metadata)secProtocolMetadata;
- (__SecTrust)serverSecTrust;
- (id)copyPeerCertificateChain;
- (id)customProtocolDefinition;
- (id)getEAPKeyMaterial;
- (id)secTrustCompletionHandler;
- (int)deliverInput;
- (int)handshake;
- (int)handshakeStatus;
- (int)state;
- (unsigned)eapType;
- (unsigned)getEAPMethodInUse;
- (unsigned)getNegotiatedTLSVersion;
- (void)clientContext;
- (void)dealloc;
- (void)read;
- (void)readApplicationData;
- (void)setClientContext:(void *)a3;
- (void)setConnection:(id)a3;
- (void)setCustomFramer:(id)a3;
- (void)setCustomProtocol:(id)a3;
- (void)setEapType:(unsigned int)a3;
- (void)setHandshakeStatus:(int)a3;
- (void)setMemIO:(id *)a3;
- (void)setMsk:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRead:(void *)a3;
- (void)setSecProtocolMetadata;
- (void)setSecProtocolMetadata:(id)a3;
- (void)setSecTrustCompletionHandler:(id)a3;
- (void)setServerSecTrust:(__SecTrust *)a3;
- (void)setState:(int)a3;
- (void)setStatusUpdateLock:(id)a3;
- (void)setTlsProtocol:(id)a3;
- (void)setWrite:(void *)a3;
- (void)start;
- (void)stop;
- (void)updateHandshakeStatus:(int)a3;
- (void)write;
@end

@implementation EAPBoringSSLSession

- (EAPBoringSSLSession)init
{
  v9.receiver = self;
  v9.super_class = (Class)EAPBoringSSLSession;
  v2 = [(EAPBoringSSLSession *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08748]) initWithCondition:1];
    statusUpdateLock = v2->_statusUpdateLock;
    v2->_statusUpdateLock = (NSConditionLock *)v3;

    v5 = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2106D5000, v5, v6, "EAPBoringSSLSession initialized", v8, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  serverSecTrust = self->_serverSecTrust;
  if (serverSecTrust) {
    CFRelease(serverSecTrust);
  }
  v4 = EAPLogGetLogHandle();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v4, v5, "EAPBoringSSLSession deallocated", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)EAPBoringSSLSession;
  [(EAPBoringSSLSession *)&v6 dealloc];
}

- (id)customProtocolDefinition
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke;
  v4[3] = &unk_264133C78;
  objc_copyWeak(&v5, &location);
  nw_protocol_definition_t definition = nw_framer_create_definition("EAPBoringSSLSessionInterceptor", 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return definition;
}

uint64_t __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  v4 = EAPLogGetLogHandle();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v4, v5, "start handler for custom protocol called", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setCustomFramer:v3];
    nw_protocol_options_t v8 = nw_framer_copy_options(v3);
    [v7 setCustomProtocol:v8];

    nw_framer_set_input_handler(v3, &__block_literal_global);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_2;
    v16 = &unk_264133C50;
    v17 = v3;
    v18 = v7;
    nw_framer_set_output_handler(v17, &v13);
    objc_msgSend(v7, "setState:", 1, v13, v14, v15, v16);
    objc_super v9 = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v9, v10, "custom protocol reported ready status", buf, 2u);
    }

    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 2;
  }

  return v11;
}

uint64_t __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_3()
{
  return 0;
}

void __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_2(uint64_t a1, void *a2, void *a3, size_t a4, int a5)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v20 = a2;
  id v21 = a3;
  objc_super v9 = EAPLogGetLogHandle();
  os_log_type_t v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = "false";
    if (a5) {
      uint64_t v11 = "true";
    }
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = a4;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_2106D5000, v9, v10, "output handler received message_length: [%zu], is_complete:[%s]", buf, 0x16u);
  }

  if (a4)
  {
    int v12 = objc_msgSend(*(id *)(a1 + 40), "state", v20, v21);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    int v31 = -9803;
    while (*(void *)(*(void *)&buf[8] + 24) < a4)
    {
      parse[0] = MEMORY[0x263EF8330];
      parse[1] = 3221225472;
      parse[2] = __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_7;
      parse[3] = &unk_264133C28;
      BOOL v27 = v12 == 1;
      v25 = &v28;
      int8x16_t v22 = *(int8x16_t *)(a1 + 32);
      uint64_t v13 = (id)v22.i64[0];
      int8x16_t v24 = vextq_s8(v22, v22, 8uLL);
      v26 = buf;
      nw_framer_parse_output(v13, a4, a4, 0, parse);

      if (v12 != 1) {
        goto LABEL_18;
      }
    }
    if (v12 == 1)
    {
      if (*((_DWORD *)v29 + 6)) {
        int v14 = *((_DWORD *)v29 + 6);
      }
      else {
        int v14 = -9803;
      }
      *((_DWORD *)v29 + 6) = v14;
      objc_msgSend(*(id *)(a1 + 40), "updateHandshakeStatus:");
      v15 = EAPLogGetLogHandle();
      os_log_type_t v16 = _SC_syslog_os_log_mapping();
      v17 = v15;
      if (os_log_type_enabled(v17, v16))
      {
        v18 = EAPSecurityErrorString(*((_DWORD *)v29 + 6));
        int v19 = *((_DWORD *)v29 + 6);
        *(_DWORD *)v32 = 136315394;
        v33 = v18;
        __int16 v34 = 1024;
        int v35 = v19;
        _os_log_impl(&dword_2106D5000, v17, v16, "[output_handler]: updated handshake status to [%s]:[%d]", v32, 0x12u);
      }
    }
LABEL_18:
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 5);
  }
}

uint64_t __47__EAPBoringSSLSession_customProtocolDefinition__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v13 = a3;
  if (!*(unsigned char *)(a1 + 64)) {
    return a3;
  }
  uint64_t result = 0;
  if (a2 && a3)
  {
    v7 = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = a3;
      _os_log_impl(&dword_2106D5000, v7, v8, "writing %zu bytes to MemIO Write Buffer", buf, 0xCu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *))[*(id *)(a1 + 32) write])(objc_msgSend(*(id *)(a1 + 32), "memIO"), a2, &v13);
    int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    os_log_type_t v10 = EAPLogGetLogHandle();
    if (v9)
    {
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v10, v11, "failed to write to MemIO write buffer, reporting EPROTO", buf, 2u);
      }

      nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 40), 100);
      return 0;
    }
    else
    {
      int v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, (os_log_type_t)v12))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v13;
        _os_log_impl(&dword_2106D5000, v10, (os_log_type_t)v12, "completed writing %zu bytes to MemIO Buffer", buf, 0xCu);
      }

      uint64_t result = v13;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v13;
    }
  }
  return result;
}

- (BOOL)setClientIdentity:(__SecIdentity *)a3 certificates:(id)a4
{
  CFArrayRef v6 = (const __CFArray *)a4;
  v7 = [(EAPBoringSSLSession *)self tlsProtocol];
  os_log_type_t v8 = v7;

  if (!v8)
  {
    os_log_type_t v10 = EAPLogGetLogHandle();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      __int16 v18 = 0;
      int v12 = "nw_tls_copy_sec_protocol_options() returned nil";
      uint64_t v13 = (uint8_t *)&v18;
LABEL_14:
      _os_log_impl(&dword_2106D5000, v10, v11, v12, v13, 2u);
    }
LABEL_15:

    BOOL v15 = 0;
    goto LABEL_16;
  }
  if (a3)
  {
    if (v6 && [(__CFArray *)v6 count]) {
      int v9 = sec_identity_create_with_certificates(a3, v6);
    }
    else {
      int v9 = sec_identity_create(a3);
    }
    int v14 = v9;
    if (v9)
    {
      sec_protocol_options_set_local_identity(v8, v9);

      goto LABEL_11;
    }
    os_log_type_t v10 = EAPLogGetLogHandle();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      __int16 v17 = 0;
      int v12 = "sec_identity_create()/sec_identity_create_with_certificates() returned nil";
      uint64_t v13 = (uint8_t *)&v17;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_11:
  BOOL v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)configureSecProtocol:(EAPBoringSSLSessionParameters_s *)a3
{
  if (a3)
  {
    os_log_type_t v5 = [(EAPBoringSSLSession *)self tlsProtocol];
    CFArrayRef v6 = v5;

    if (v6)
    {
      sec_protocol_options_set_tls_early_data_enabled();
      sec_protocol_options_set_min_tls_protocol_version(v6, (tls_protocol_version_t)a3->var2);
      sec_protocol_options_set_max_tls_protocol_version(v6, (tls_protocol_version_t)a3->var3);
      BOOL v7 = 0;
      if ([(EAPBoringSSLSession *)self eapType] != 13)
      {
LABEL_17:

        return v7;
      }
      sec_protocol_options_set_eap_method();
      var0 = a3->var0;
      if (!a3->var0)
      {
LABEL_16:
        objc_initWeak(buf, self);
        verify_block[0] = MEMORY[0x263EF8330];
        verify_block[1] = 3221225472;
        verify_block[2] = __44__EAPBoringSSLSession_configureSecProtocol___block_invoke;
        verify_block[3] = &unk_264133CA0;
        objc_copyWeak(&v18, buf);
        BOOL v15 = [(EAPBoringSSLSession *)self queue];
        sec_protocol_options_set_verify_block(v6, verify_block, v15);

        objc_destroyWeak(&v18);
        objc_destroyWeak(buf);
        BOOL v7 = 1;
        goto LABEL_17;
      }
      if (a3->var1 && (CFIndex Count = CFArrayGetCount(a3->var1), var0 = a3->var0, Count >= 1)) {
        os_log_type_t v10 = sec_identity_create_with_certificates(var0, a3->var1);
      }
      else {
        os_log_type_t v10 = sec_identity_create(var0);
      }
      int v14 = v10;
      if (v10)
      {
        sec_protocol_options_set_local_identity(v6, v10);

        goto LABEL_16;
      }
      os_log_type_t v11 = EAPLogGetLogHandle();
      uint64_t v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, (os_log_type_t)v12))
      {
        LOWORD(buf[0]) = 0;
        uint64_t v13 = "sec_identity_create()/sec_identity_create_with_certificates() returned nil";
        goto LABEL_11;
      }
    }
    else
    {
      os_log_type_t v11 = EAPLogGetLogHandle();
      LOBYTE(v12) = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, (os_log_type_t)v12))
      {
        LOWORD(buf[0]) = 0;
        uint64_t v13 = "nw_tls_copy_sec_protocol_options() returned nil";
LABEL_11:
        _os_log_impl(&dword_2106D5000, v11, (os_log_type_t)v12, v13, (uint8_t *)buf, 2u);
      }
    }

    BOOL v7 = 0;
    goto LABEL_17;
  }
  return 0;
}

void __44__EAPBoringSSLSession_configureSecProtocol___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFArrayRef v6 = a3;
  BOOL v7 = a4;
  os_log_type_t v8 = EAPLogGetLogHandle();
  os_log_type_t v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_2106D5000, v8, v9, "verify_block called", (uint8_t *)&v15, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained setServerSecTrust:sec_trust_copy_ref(v6)];
    [WeakRetained setSecTrustCompletionHandler:v7];
    [WeakRetained updateHandshakeStatus:4294957455];
    os_log_type_t v11 = EAPLogGetLogHandle();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    uint64_t v13 = v11;
    if (os_log_type_enabled(v13, v12))
    {
      int v14 = EAPSecurityErrorString(-9841);
      int v15 = 136315394;
      uint64_t v16 = v14;
      __int16 v17 = 1024;
      int v18 = -9841;
      _os_log_impl(&dword_2106D5000, v13, v12, "[verify_block]: updated handshake status to [%s]:[%d]", (uint8_t *)&v15, 0x12u);
    }
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (BOOL)setup:(EAPBoringSSLSessionParameters_s *)a3 clientContext:(void *)a4
{
  if (a3)
  {
    BOOL v7 = nw_parameters_create();
    os_log_type_t v8 = v7;
    if (!v7)
    {
      os_log_type_t v9 = EAPLogGetLogHandle();
      os_log_type_t v21 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v9, v21))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v9, v21, "nw_parameters_create() returned nil", buf, 2u);
      }
      BOOL v20 = 0;
      goto LABEL_23;
    }
    os_log_type_t v9 = nw_parameters_copy_default_protocol_stack(v7);
    if (v9)
    {
      nw_parameters_set_custom_protocols_only();
      nw_protocol_options_t options = nw_tls_create_options();
      [(EAPBoringSSLSession *)self setTlsProtocol:options];

      os_log_type_t v11 = [(EAPBoringSSLSession *)self tlsProtocol];

      if (v11)
      {
        [(EAPBoringSSLSession *)self setEapType:a3->var6];
        [(EAPBoringSSLSession *)self setRead:a3->var4];
        [(EAPBoringSSLSession *)self setWrite:a3->var5];
        dispatch_queue_t v12 = dispatch_queue_create("EAPBoringSSLSession", 0);
        [(EAPBoringSSLSession *)self setQueue:v12];

        [(EAPBoringSSLSession *)self setClientContext:a4];
        [(EAPBoringSSLSession *)self setMemIO:a3->var7];
        if ([(EAPBoringSSLSession *)self configureSecProtocol:a3])
        {
          uint64_t v13 = [(EAPBoringSSLSession *)self customProtocolDefinition];
          int v14 = nw_framer_create_options(v13);

          if (!v14)
          {
            __int16 v17 = EAPLogGetLogHandle();
            os_log_type_t v26 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v17, v26))
            {
              *(_WORD *)v33 = 0;
              _os_log_impl(&dword_2106D5000, v17, v26, "nw_framer_create_options() returned nil", v33, 2u);
            }
            goto LABEL_33;
          }
          int v15 = [(EAPBoringSSLSession *)self tlsProtocol];
          nw_protocol_stack_append_application_protocol();

          nw_protocol_stack_append_application_protocol();
          host = nw_endpoint_create_host("0.0.0.0", "0");
          __int16 v17 = host;
          if (host)
          {
            nw_connection_t v18 = nw_connection_create(host, v8);
            [(EAPBoringSSLSession *)self setConnection:v18];

            uint64_t v19 = [(EAPBoringSSLSession *)self connection];

            if (v19)
            {
              BOOL v20 = 1;
LABEL_34:

              goto LABEL_22;
            }
            BOOL v27 = EAPLogGetLogHandle();
            os_log_type_t v28 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v27, v28)) {
              goto LABEL_32;
            }
            __int16 v31 = 0;
            v29 = "nw_connection_create() returned nil";
            uint64_t v30 = (uint8_t *)&v31;
          }
          else
          {
            BOOL v27 = EAPLogGetLogHandle();
            os_log_type_t v28 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v27, v28))
            {
LABEL_32:

LABEL_33:
              BOOL v20 = 0;
              goto LABEL_34;
            }
            __int16 v32 = 0;
            v29 = "nw_endpoint_create_host() returned nil";
            uint64_t v30 = (uint8_t *)&v32;
          }
          _os_log_impl(&dword_2106D5000, v27, v28, v29, v30, 2u);
          goto LABEL_32;
        }
        int v14 = EAPLogGetLogHandle();
        os_log_type_t v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v22))
        {
          *(_WORD *)__int16 v34 = 0;
          v23 = "failed to set the security protocol options";
          int8x16_t v24 = v34;
          goto LABEL_20;
        }
LABEL_21:
        BOOL v20 = 0;
LABEL_22:

LABEL_23:
        return v20;
      }
      int v14 = EAPLogGetLogHandle();
      os_log_type_t v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v22)) {
        goto LABEL_21;
      }
      __int16 v35 = 0;
      v23 = "nw_tls_create_options() returned nil";
      int8x16_t v24 = (uint8_t *)&v35;
    }
    else
    {
      int v14 = EAPLogGetLogHandle();
      os_log_type_t v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v22)) {
        goto LABEL_21;
      }
      __int16 v36 = 0;
      v23 = "nw_parameters_copy_default_protocol_stack() returned nil";
      int8x16_t v24 = (uint8_t *)&v36;
    }
LABEL_20:
    _os_log_impl(&dword_2106D5000, v14, v22, v23, v24, 2u);
    goto LABEL_21;
  }
  return 0;
}

- (int)handshake
{
  if ([(EAPBoringSSLSession *)self handshakeStatus] == -9841
    && ([(EAPBoringSSLSession *)self secTrustCompletionHandler],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = [(EAPBoringSSLSession *)self secTrustCompletionHandler];
    v4[2](v4, 1);

    os_log_type_t v5 = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)os_log_type_t v10 = 0;
      _os_log_impl(&dword_2106D5000, v5, v6, "delivered trust evaluation result=success to TLS protocol", v10, 2u);
    }
  }
  else
  {
    [(EAPBoringSSLSession *)self deliverInput];
  }
  BOOL v7 = [(EAPBoringSSLSession *)self statusUpdateLock];
  [v7 lockWhenCondition:0];

  LODWORD(v7) = [(EAPBoringSSLSession *)self handshakeStatus];
  os_log_type_t v8 = [(EAPBoringSSLSession *)self statusUpdateLock];
  [v8 unlockWithCondition:1];

  return (int)v7;
}

- (int)deliverInput
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  if ([(EAPBoringSSLSession *)self state] != 1) {
    return 0;
  }
  uint64_t v3 = [(EAPBoringSSLSession *)self customProtocol];
  nw_protocol_definition_t v4 = nw_protocol_options_copy_definition(v3);

  nw_protocol_definition_t v26 = v4;
  if (v4 && (uint64_t singleton = nw_protocol_metadata_create_singleton()) != 0)
  {
    os_log_type_t v6 = (void *)singleton;
    BOOL v7 = malloc_type_calloc(1uLL, 0x4800uLL, 0x86B4A2C9uLL);
    if (v7)
    {
      os_log_type_t v8 = v7;
      unint64_t v9 = 0;
      uint64_t v34 = 18432;
      BOOL v27 = v29;
      while (1)
      {
        int v10 = ((uint64_t (*)($866BB3734758C83BFC474B4A3B7B1691 *, void *, uint64_t *))[(EAPBoringSSLSession *)self read])([(EAPBoringSSLSession *)self memIO], v8, &v34);
        if (v10) {
          break;
        }
        uint64_t v11 = v34;
        if (!(v34 | v9))
        {
          int v10 = 0;
          goto LABEL_26;
        }
        BOOL v12 = v34 == 0;
        if (v34)
        {
          uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v34];
        }
        else
        {
          uint64_t v13 = 0;
        }
        objc_initWeak(location, self);
        int v14 = [(EAPBoringSSLSession *)self customFramer];
        async_block[0] = MEMORY[0x263EF8330];
        async_block[1] = 3221225472;
        v29[0] = __35__EAPBoringSSLSession_deliverInput__block_invoke;
        v29[1] = &unk_264133CC8;
        objc_copyWeak(v32, location);
        BOOL v33 = v12;
        id v30 = v6;
        id v15 = v13;
        id v31 = v15;
        v32[1] = (id)v34;
        nw_framer_async(v14, async_block);
        BOOL v16 = v11 == 0;

        uint64_t v17 = v34;
        uint64_t v34 = 18432;

        objc_destroyWeak(v32);
        objc_destroyWeak(location);

        v9 += v17;
        if (v16) {
          goto LABEL_21;
        }
      }
      BOOL v20 = EAPLogGetLogHandle();
      os_log_type_t v21 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v20, v21))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_2106D5000, v20, v21, "failed to read from the MemIO read buffer", (uint8_t *)location, 2u);
      }

      os_log_type_t v22 = [(EAPBoringSSLSession *)self customFramer];
      nw_framer_mark_failed_with_error(v22, 100);

LABEL_21:
      if (v9)
      {
        v23 = EAPLogGetLogHandle();
        os_log_type_t v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
        {
          LODWORD(location[0]) = 134217984;
          *(id *)((char *)location + 4) = (id)v9;
          _os_log_impl(&dword_2106D5000, v23, v24, "delivered total %zu bytes to TLS protocol", (uint8_t *)location, 0xCu);
        }
      }
LABEL_26:
      free(v8);
    }
    else
    {
      int v10 = -108;
    }
  }
  else
  {
    nw_connection_t v18 = EAPLogGetLogHandle();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v18, v19))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_2106D5000, v18, v19, "nw_protocol_metadata_create_singleton() returned nil metadata", (uint8_t *)location, 2u);
    }

    os_log_type_t v6 = 0;
    int v10 = -50;
  }

  return v10;
}

void __35__EAPBoringSSLSession_deliverInput__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = *(unsigned __int8 *)(a1 + 64);
    os_log_type_t v5 = [WeakRetained customFramer];
    os_log_type_t v6 = v5;
    if (v4)
    {
      nw_framer_deliver_input_no_copy(v5, 0, *(nw_framer_message_t *)(a1 + 32), 1);

      BOOL v7 = EAPLogGetLogHandle();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, v8))
      {
        LOWORD(v15) = 0;
        unint64_t v9 = "nw_framer_deliver_input_no_copy() delivered EOD";
        int v10 = v7;
        os_log_type_t v11 = v8;
        uint32_t v12 = 2;
LABEL_7:
        _os_log_impl(&dword_2106D5000, v10, v11, v9, (uint8_t *)&v15, v12);
      }
    }
    else
    {
      nw_framer_deliver_input(v5, (const uint8_t *)[*(id *)(a1 + 40) bytes], objc_msgSend(*(id *)(a1 + 40), "length"), *(nw_framer_message_t *)(a1 + 32), 0);

      BOOL v7 = EAPLogGetLogHandle();
      int v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, (os_log_type_t)v13))
      {
        uint64_t v14 = *(void *)(a1 + 56);
        int v15 = 134217984;
        uint64_t v16 = v14;
        unint64_t v9 = "nw_framer_deliver_input() delivered %zu bytes";
        int v10 = v7;
        os_log_type_t v11 = v13;
        uint32_t v12 = 12;
        goto LABEL_7;
      }
    }
  }
}

- (unsigned)getEAPMethodInUse
{
  v2 = [(EAPBoringSSLSession *)self tlsProtocol];
  id v3 = v2;

  if (v3)
  {
    unsigned __int8 eap_method = sec_protocol_options_get_eap_method();
  }
  else
  {
    os_log_type_t v5 = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)os_log_type_t v8 = 0;
      _os_log_impl(&dword_2106D5000, v5, v6, "nw_tls_copy_sec_protocol_options() returned nil", v8, 2u);
    }

    unsigned __int8 eap_method = 0;
  }

  return eap_method;
}

- (void)setSecProtocolMetadata
{
  id v3 = [(EAPBoringSSLSession *)self secProtocolMetadata];

  if (!v3)
  {
    int v4 = [(EAPBoringSSLSession *)self tlsProtocol];
    nw_protocol_definition_t definition = nw_protocol_options_copy_definition(v4);

    if (definition)
    {
      os_log_type_t v5 = [(EAPBoringSSLSession *)self connection];
      nw_protocol_metadata_t v6 = nw_connection_copy_protocol_metadata(v5, definition);
      [(EAPBoringSSLSession *)self setSecProtocolMetadata:v6];
    }
  }
}

- (id)getEAPKeyMaterial
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(EAPBoringSSLSession *)self getEAPMethodInUse] != 1) {
    goto LABEL_5;
  }
  [(EAPBoringSSLSession *)self setSecProtocolMetadata];
  id v3 = [(EAPBoringSSLSession *)self secProtocolMetadata];

  if (!v3) {
    goto LABEL_5;
  }
  int v4 = [(EAPBoringSSLSession *)self secProtocolMetadata];
  int eap_key_material = sec_protocol_metadata_get_eap_key_material();

  if (eap_key_material)
  {
    nw_protocol_metadata_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:128];
  }
  else
  {
LABEL_5:
    nw_protocol_metadata_t v6 = 0;
  }
  return v6;
}

- (unsigned)getNegotiatedTLSVersion
{
  [(EAPBoringSSLSession *)self setSecProtocolMetadata];
  id v3 = [(EAPBoringSSLSession *)self secProtocolMetadata];

  if (!v3) {
    return 0;
  }
  int v4 = [(EAPBoringSSLSession *)self secProtocolMetadata];
  tls_protocol_version_t negotiated_tls_protocol_version = sec_protocol_metadata_get_negotiated_tls_protocol_version(v4);

  return negotiated_tls_protocol_version;
}

- (BOOL)getSessionResumed
{
  [(EAPBoringSSLSession *)self setSecProtocolMetadata];
  id v3 = [(EAPBoringSSLSession *)self secProtocolMetadata];

  if (!v3) {
    return 0;
  }
  int v4 = [(EAPBoringSSLSession *)self secProtocolMetadata];
  char session_resumed = sec_protocol_metadata_get_session_resumed();

  return session_resumed;
}

- (id)copyPeerCertificateChain
{
  [(EAPBoringSSLSession *)self setSecProtocolMetadata];
  id v3 = [(EAPBoringSSLSession *)self secProtocolMetadata];

  if (!v3) {
    return 0;
  }
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint32_t v12 = __Block_byref_object_copy_;
  int v13 = __Block_byref_object_dispose_;
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v4 = [(EAPBoringSSLSession *)self secProtocolMetadata];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __47__EAPBoringSSLSession_copyPeerCertificateChain__block_invoke;
  handler[3] = &unk_264133CF0;
  handler[4] = &v9;
  BOOL v5 = sec_protocol_metadata_access_peer_certificate_chain(v4, handler);

  if (v5 && [(id)v10[5] count]) {
    id v6 = (id)v10[5];
  }
  else {
    id v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __47__EAPBoringSSLSession_copyPeerCertificateChain__block_invoke(uint64_t a1, sec_certificate_t certificate)
{
  SecCertificateRef v3 = sec_certificate_copy_ref(certificate);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
}

- (int)state
{
  v2 = self;
  objc_sync_enter(v2);
  int state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (void)setState:(int)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int state = a3;
  objc_sync_exit(obj);
}

- (int)handshakeStatus
{
  v2 = self;
  objc_sync_enter(v2);
  int handshakeStatus = v2->_handshakeStatus;
  objc_sync_exit(v2);

  return handshakeStatus;
}

- (void)setHandshakeStatus:(int)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int handshakeStatus = a3;
  objc_sync_exit(obj);
}

- (void)readApplicationData
{
  objc_initWeak(&location, self);
  SecCertificateRef v3 = [(EAPBoringSSLSession *)self connection];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__EAPBoringSSLSession_readApplicationData__block_invoke;
  v4[3] = &unk_264133D18;
  objc_copyWeak(&v5, &location);
  nw_connection_receive(v3, 0, 1u, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__EAPBoringSSLSession_readApplicationData__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  os_log_type_t v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v8)
  {
    CFErrorRef v10 = nw_error_copy_cf_error(v8);
    uint64_t v11 = EAPLogGetLogHandle();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      int v21 = 138412290;
      os_log_type_t v22 = v10;
      _os_log_impl(&dword_2106D5000, v11, v12, "application data receive completion handler gor error : %@", (uint8_t *)&v21, 0xCu);
    }

    uint64_t v13 = 4294899625;
LABEL_9:

    goto LABEL_10;
  }
  if (v7)
  {
    CFErrorRef v10 = (CFErrorRef)v7;
    id v14 = (unsigned char *)[(__CFError *)v10 bytes];
    if ([(__CFError *)v10 length] == 1 && !*v14)
    {
      os_log_type_t v19 = EAPLogGetLogHandle();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_2106D5000, v19, v20, "Received expected application data from the EAP-TLS 1.3 server", (uint8_t *)&v21, 2u);
      }

      [WeakRetained setState:2];
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = 4294957496;
    }
    goto LABEL_9;
  }
  uint64_t v13 = 0;
LABEL_10:
  [WeakRetained updateHandshakeStatus:v13];
  int v15 = EAPLogGetLogHandle();
  os_log_type_t v16 = _SC_syslog_os_log_mapping();
  uint64_t v17 = v15;
  if (os_log_type_enabled(v17, v16))
  {
    nw_connection_t v18 = EAPSecurityErrorString(v13);
    int v21 = 136315394;
    os_log_type_t v22 = (void *)v18;
    __int16 v23 = 1024;
    int v24 = v13;
    _os_log_impl(&dword_2106D5000, v17, v16, "[Application Data Reader]: updated handshake status to [%s]:[%d]", (uint8_t *)&v21, 0x12u);
  }
}

- (void)start
{
  objc_initWeak(&location, self);
  SecCertificateRef v3 = [(EAPBoringSSLSession *)self connection];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __28__EAPBoringSSLSession_start__block_invoke;
  CFErrorRef v10 = &unk_264133D40;
  objc_copyWeak(&v11, &location);
  nw_connection_set_state_changed_handler(v3, &v7);

  int v4 = [(EAPBoringSSLSession *)self connection];
  id v5 = [(EAPBoringSSLSession *)self queue];
  nw_connection_set_queue(v4, v5);

  [(EAPBoringSSLSession *)self setState:0];
  id v6 = [(EAPBoringSSLSession *)self connection];
  nw_connection_start(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __28__EAPBoringSSLSession_start__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = EAPLogGetLogHandle();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    if (a2 > 5) {
      id v6 = "unknown";
    }
    else {
      id v6 = off_264133D60[a2];
    }
    int v17 = 136315138;
    nw_connection_t v18 = v6;
    _os_log_impl(&dword_2106D5000, v4, v5, "connection state changed to %s", (uint8_t *)&v17, 0xCu);
  }

  unsigned int v7 = a2 - 1;
  uint64_t v8 = 4294957490;
  uint64_t v9 = 3;
  switch(v7)
  {
    case 0u:
      if (objc_msgSend(WeakRetained, "state", 3) == 1)
      {
        uint64_t v8 = 4294899625;
        goto LABEL_14;
      }
      break;
    case 2u:
      int v10 = objc_msgSend(WeakRetained, "getEAPMethodInUse", 3);
      int v11 = [WeakRetained getNegotiatedTLSVersion];
      char v12 = [WeakRetained getSessionResumed];
      uint64_t v8 = 0;
      uint64_t v9 = 2;
      if (v10 != 1 || v11 != 772 || (v12 & 1) != 0) {
        goto LABEL_13;
      }
      objc_msgSend(WeakRetained, "readApplicationData", 2);
      break;
    case 3u:
LABEL_13:
      [WeakRetained setState:v9];
LABEL_14:
      [WeakRetained updateHandshakeStatus:v8];
      uint64_t v13 = EAPLogGetLogHandle();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      int v15 = v13;
      if (os_log_type_enabled(v15, v14))
      {
        os_log_type_t v16 = EAPSecurityErrorString(v8);
        int v17 = 136315394;
        nw_connection_t v18 = v16;
        __int16 v19 = 1024;
        int v20 = v8;
        _os_log_impl(&dword_2106D5000, v15, v14, "[State Change Handler]: updated handshake status to [%s]:[%d]", (uint8_t *)&v17, 0x12u);
      }

      break;
    case 4u:
      [WeakRetained setState:3];
      break;
    default:
      break;
  }
}

- (void)stop
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ([(EAPBoringSSLSession *)self handshakeStatus] == -9841
    && ([(EAPBoringSSLSession *)self secTrustCompletionHandler],
        SecCertificateRef v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    int v4 = [(EAPBoringSSLSession *)self secTrustCompletionHandler];
    v4[2](v4, 0);

    os_log_type_t v5 = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_2106D5000, v5, v6, "delivered trust evaluation result=failure to TLS protocol", (uint8_t *)&v24, 2u);
    }

    unsigned int v7 = [(EAPBoringSSLSession *)self connection];
    nw_connection_set_state_changed_handler(v7, 0);

    uint64_t v8 = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_2106D5000, v8, v9, "removed network connection state change handler", (uint8_t *)&v24, 2u);
    }

    int v10 = [(EAPBoringSSLSession *)self statusUpdateLock];
    [v10 lockWhenCondition:0];

    int v11 = [(EAPBoringSSLSession *)self handshakeStatus];
    char v12 = [(EAPBoringSSLSession *)self statusUpdateLock];
    [v12 unlockWithCondition:1];

    uint64_t v13 = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    int v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      os_log_type_t v16 = EAPSecurityErrorString(v11);
      int v24 = 136315394;
      uint64_t v25 = v16;
      __int16 v26 = 1024;
      int v27 = v11;
      _os_log_impl(&dword_2106D5000, v15, v14, "[session stopper]: handshake status updated to [%s]:[%d]", (uint8_t *)&v24, 0x12u);
    }
  }
  else
  {
    int v17 = [(EAPBoringSSLSession *)self connection];

    if (v17)
    {
      [(EAPBoringSSLSession *)self setState:3];
      nw_connection_t v18 = [(EAPBoringSSLSession *)self connection];
      nw_connection_set_state_changed_handler(v18, 0);

      __int16 v19 = EAPLogGetLogHandle();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_2106D5000, v19, v20, "removed network connection state change handler", (uint8_t *)&v24, 2u);
      }

      uint64_t v21 = [(EAPBoringSSLSession *)self connection];
      nw_connection_cancel(v21);

      os_log_type_t v22 = EAPLogGetLogHandle();
      os_log_type_t v23 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v22, v23))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_2106D5000, v22, v23, "cancelled network connection", (uint8_t *)&v24, 2u);
      }

      [(EAPBoringSSLSession *)self setConnection:0];
    }
  }
}

- (void)updateHandshakeStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_log_type_t v5 = [(EAPBoringSSLSession *)self statusUpdateLock];
  [v5 lockWhenCondition:1];

  [(EAPBoringSSLSession *)self setHandshakeStatus:v3];
  id v6 = [(EAPBoringSSLSession *)self statusUpdateLock];
  [v6 unlockWithCondition:0];
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_nw_protocol_options)tlsProtocol
{
  return self->_tlsProtocol;
}

- (void)setTlsProtocol:(id)a3
{
}

- (OS_nw_protocol_options)customProtocol
{
  return self->_customProtocol;
}

- (void)setCustomProtocol:(id)a3
{
}

- (OS_sec_protocol_metadata)secProtocolMetadata
{
  return self->_secProtocolMetadata;
}

- (void)setSecProtocolMetadata:(id)a3
{
  self->_secProtocolMetadata = (OS_sec_protocol_metadata *)a3;
}

- (OS_nw_framer)customFramer
{
  return self->_customFramer;
}

- (void)setCustomFramer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSData)msk
{
  return self->_msk;
}

- (void)setMsk:(id)a3
{
}

- (void)read
{
  return self->_read;
}

- (void)setRead:(void *)a3
{
  self->_read = a3;
}

- (void)write
{
  return self->_write;
}

- (void)setWrite:(void *)a3
{
  self->_write = a3;
}

- (void)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(void *)a3
{
  self->_clientContext = a3;
}

- (__SecTrust)serverSecTrust
{
  return self->_serverSecTrust;
}

- (void)setServerSecTrust:(__SecTrust *)a3
{
  self->_serverSecTrust = a3;
}

- (id)secTrustCompletionHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setSecTrustCompletionHandler:(id)a3
{
}

- (NSConditionLock)statusUpdateLock
{
  return self->_statusUpdateLock;
}

- (void)setStatusUpdateLock:(id)a3
{
}

- (unsigned)eapType
{
  return self->_eapType;
}

- (void)setEapType:(unsigned int)a3
{
  self->_eapType = a3;
}

- ($866BB3734758C83BFC474B4A3B7B1691)memIO
{
  return self->_memIO;
}

- (void)setMemIO:(id *)a3
{
  self->_memIO = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUpdateLock, 0);
  objc_storeStrong(&self->_secTrustCompletionHandler, 0);
  objc_storeStrong((id *)&self->_msk, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_customFramer, 0);
  objc_storeStrong((id *)&self->_customProtocol, 0);
  objc_storeStrong((id *)&self->_tlsProtocol, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end