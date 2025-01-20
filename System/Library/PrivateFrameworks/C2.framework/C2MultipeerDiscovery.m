@interface C2MultipeerDiscovery
- (C2Multipeer)parent;
- (C2MultipeerDiscovery)initWithParent:(id)a3;
- (NSUUID)myPeerID;
- (OS_dispatch_source)browserTimer;
- (OS_nw_browser)browser;
- (OS_nw_listener)listener;
- (id)_browser;
- (id)_listener;
- (id)_peerToPeerParameters;
- (void)resetTimer;
- (void)setBrowser:(id)a3;
- (void)setBrowserTimer:(id)a3;
- (void)setListener:(id)a3;
- (void)setMyPeerID:(id)a3;
- (void)setParent:(id)a3;
- (void)startTimer;
- (void)touch;
@end

@implementation C2MultipeerDiscovery

- (C2MultipeerDiscovery)initWithParent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)C2MultipeerDiscovery;
  v5 = [(C2MultipeerDiscovery *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_parent, v4);
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    myPeerID = v6->_myPeerID;
    v6->_myPeerID = (NSUUID *)v7;

    uint64_t v9 = [(C2MultipeerDiscovery *)v6 _listener];
    listener = v6->_listener;
    v6->_listener = (OS_nw_listener *)v9;
  }
  if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_4);
  }
  v11 = C2_MULTIPEER_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1DD523000, v11, OS_LOG_TYPE_DEFAULT, "[%@ init]", buf, 0xCu);
  }
  v12 = [(C2MultipeerDiscovery *)v6 parent];
  v13 = [v12 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__C2MultipeerDiscovery_initWithParent___block_invoke_4;
  block[3] = &unk_1E6CCBF00;
  v14 = v6;
  v17 = v14;
  dispatch_async(v13, block);

  return v14;
}

uint64_t __39__C2MultipeerDiscovery_initWithParent___block_invoke()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __39__C2MultipeerDiscovery_initWithParent___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) touch];
}

- (void)touch
{
  __assert_rtn("-[C2MultipeerDiscovery touch]", "C2MultipeerDiscovery.m", 40, "_browserTimer != nil");
}

- (void)startTimer
{
  v3 = [(C2MultipeerDiscovery *)self parent];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  v5 = [(C2MultipeerDiscovery *)self parent];
  v6 = [v5 queue];
  uint64_t v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);
  browserTimer = self->_browserTimer;
  self->_browserTimer = v7;

  uint64_t v9 = [(C2MultipeerDiscovery *)self browser];
  id location = 0;
  objc_initWeak(&location, self);
  v10 = self->_browserTimer;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34__C2MultipeerDiscovery_startTimer__block_invoke;
  v14[3] = &unk_1E6CCC138;
  v14[4] = self;
  objc_copyWeak(&v16, &location);
  id v15 = v9;
  id v11 = v9;
  dispatch_source_set_event_handler(v10, v14);
  v12 = self->_browserTimer;
  dispatch_time_t v13 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_browserTimer);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __34__C2MultipeerDiscovery_startTimer__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) parent];
  v3 = [v2 queue];
  dispatch_assert_queue_V2(v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained browser];
    uint64_t v7 = *(void **)(a1 + 40);

    if (v6 == v7)
    {
      if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_8);
      }
      v8 = C2_MULTIPEER_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1DD523000, v8, OS_LOG_TYPE_INFO, "browser timer triggered, stopping.", v9, 2u);
      }
      nw_browser_cancel(*(nw_browser_t *)(a1 + 40));
      [v5 setBrowser:0];
      [v5 setBrowserTimer:0];
    }
  }
}

uint64_t __34__C2MultipeerDiscovery_startTimer__block_invoke_2()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (void)resetTimer
{
  v3 = [(C2MultipeerDiscovery *)self parent];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  browserTimer = self->_browserTimer;
  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(browserTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (id)_peerToPeerParameters
{
  secure_tcp = nw_parameters_create_secure_tcp(&__block_literal_global_11_0, &__block_literal_global_19_1);
  nw_parameters_set_include_peer_to_peer(secure_tcp, 1);
  return secure_tcp;
}

void __45__C2MultipeerDiscovery__peerToPeerParameters__block_invoke(int a1, id a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  v3 = (const char *)[@"ChunkDiscovery" UTF8String];
  id v4 = (const char *)[@"SuperSecretPasscode" UTF8String];
  long long macOut = 0u;
  long long v11 = 0u;
  size_t v5 = strlen(v4);
  size_t v6 = strlen(v3);
  CCHmac(2u, v4, v5, v3, v6, &macOut);
  alloc = dispatch_data_create_alloc();
  MEMORY[0] = macOut;
  MEMORY[0x10] = v11;
  strlen(v3);
  v8 = dispatch_data_create_alloc();
  size_t v9 = strlen(v3);
  memcpy(0, v3, v9);
  sec_protocol_options_add_pre_shared_key(v2, alloc, v8);
  sec_protocol_options_append_tls_ciphersuite(v2, (tls_ciphersuite_t)0xAEu);
}

void __45__C2MultipeerDiscovery__peerToPeerParameters__block_invoke_2(uint64_t a1, void *a2)
{
  options = a2;
  nw_tcp_options_set_enable_keepalive(options, 1);
  nw_tcp_options_set_keepalive_count(options, 2u);
}

- (id)_browser
{
  if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_21);
  }
  v3 = C2_MULTIPEER_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD523000, v3, OS_LOG_TYPE_INFO, "browser starting.", buf, 2u);
  }
  id v4 = nw_parameters_create();
  nw_parameters_set_include_peer_to_peer(v4, 1);
  bonjour_service = nw_browse_descriptor_create_bonjour_service("_chunkdiscovery._tcp", 0);
  size_t v6 = nw_browser_create(bonjour_service, v4);
  nw_browser_set_state_changed_handler(v6, &__block_literal_global_25);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __32__C2MultipeerDiscovery__browser__block_invoke_2;
  handler[3] = &unk_1E6CCC1A0;
  handler[4] = self;
  nw_browser_set_browse_results_changed_handler(v6, handler);
  uint64_t v7 = [(C2MultipeerDiscovery *)self parent];
  v8 = [v7 queue];
  nw_browser_set_queue(v6, v8);

  nw_browser_start(v6);
  return v6;
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

void __32__C2MultipeerDiscovery__browser__block_invoke_2(uint64_t a1, NSObject *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  size_t v5 = a3;
  nw_browse_result_change_t changes = nw_browse_result_get_changes(a2, v5);
  char v7 = changes;
  if (!changes)
  {
    if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_27);
    }
    v8 = C2_MULTIPEER_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1DD523000, v8, OS_LOG_TYPE_INFO, "nw_browse_result_change_invalid", (uint8_t *)&v37, 2u);
    }
  }
  if (v5)
  {
    size_t v9 = nw_browse_result_copy_endpoint(v5);
    if (v9)
    {
      v10 = v9;
      bonjour_service_name = nw_endpoint_get_bonjour_service_name(v9);
      if (bonjour_service_name)
      {
        uint64_t v12 = bonjour_service_name;
        bonjour_service_type = nw_endpoint_get_bonjour_service_type(v10);
        if (bonjour_service_type)
        {
          if (strcmp("_chunkdiscovery._tcp", bonjour_service_type))
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_39);
            }
            v14 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO)) {
              goto LABEL_70;
            }
            LOWORD(v37) = 0;
            id v15 = "Wrong service type.";
            goto LABEL_27;
          }
          v17 = [NSString stringWithUTF8String:v12];
          if (v7)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_43);
            }
            objc_super v18 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              int v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1DD523000, v18, OS_LOG_TYPE_INFO, "nw_browse_result_change_identical for peer %@", (uint8_t *)&v37, 0xCu);
            }
          }
          if ((v7 & 2) != 0)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_46);
            }
            v19 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              int v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1DD523000, v19, OS_LOG_TYPE_INFO, "nw_browse_result_change_result_added for peer %@", (uint8_t *)&v37, 0xCu);
            }
            v20 = [*(id *)(a1 + 32) parent];
            uint64_t v21 = [v20 clientConnectionByPeer];
            v22 = [v21 objectForKeyedSubscript:v17];

            if (v22)
            {
              if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
                dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_49);
              }
              v23 = C2_MULTIPEER_LOG_INTERNAL_1;
              if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO)) {
                goto LABEL_69;
              }
              int v37 = 138412290;
              v38 = v17;
              v24 = "Connection already exists to peer %@";
LABEL_68:
              _os_log_impl(&dword_1DD523000, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v37, 0xCu);
LABEL_69:

              goto LABEL_70;
            }
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_52);
            }
            v25 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              int v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1DD523000, v25, OS_LOG_TYPE_INFO, "Creating connection to %@", (uint8_t *)&v37, 0xCu);
            }
            v26 = [*(id *)(a1 + 32) _peerToPeerParameters];
            nw_connection_t v27 = nw_connection_create(v10, v26);

            v28 = [C2MultipeerNetworkConnection alloc];
            v29 = [*(id *)(a1 + 32) parent];
            v30 = [*(id *)(a1 + 32) parent];
            v31 = [v30 queue];
            v32 = [(C2MultipeerNetworkConnection *)v28 initWithParent:v29 queue:v31 connection:v27 peerID:v17 isClientConnection:1];

            v33 = [*(id *)(a1 + 32) parent];
            [v33 addClientConnection:v32 peerID:v17];
          }
          if ((v7 & 4) != 0)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_56_0);
            }
            v34 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              int v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1DD523000, v34, OS_LOG_TYPE_INFO, "nw_browse_result_change_result_removed for peer %@", (uint8_t *)&v37, 0xCu);
            }
          }
          if ((v7 & 8) != 0)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_59_0);
            }
            v35 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              int v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1DD523000, v35, OS_LOG_TYPE_INFO, "nw_browse_result_change_interface_added for peer %@", (uint8_t *)&v37, 0xCu);
            }
          }
          if ((v7 & 0x10) != 0)
          {
            if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_62_0);
            }
            v36 = C2_MULTIPEER_LOG_INTERNAL_1;
            if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
            {
              int v37 = 138412290;
              v38 = v17;
              _os_log_impl(&dword_1DD523000, v36, OS_LOG_TYPE_INFO, "nw_browse_result_change_interface_removed for peer %@", (uint8_t *)&v37, 0xCu);
            }
          }
          if ((v7 & 0x20) == 0) {
            goto LABEL_69;
          }
          if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_65_0);
          }
          v23 = C2_MULTIPEER_LOG_INTERNAL_1;
          if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO)) {
            goto LABEL_69;
          }
          int v37 = 138412290;
          v38 = v17;
          v24 = "nw_browse_result_change_txt_record_changed for peer %@";
          goto LABEL_68;
        }
        if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
          dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_36);
        }
        v14 = C2_MULTIPEER_LOG_INTERNAL_1;
        if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO)) {
          goto LABEL_70;
        }
        LOWORD(v37) = 0;
        id v15 = "No service type.";
      }
      else
      {
        if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
          dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_33);
        }
        v14 = C2_MULTIPEER_LOG_INTERNAL_1;
        if (!os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO)) {
          goto LABEL_70;
        }
        LOWORD(v37) = 0;
        id v15 = "No service name.";
      }
LABEL_27:
      _os_log_impl(&dword_1DD523000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v37, 2u);
LABEL_70:

      goto LABEL_71;
    }
  }
  if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_30);
  }
  id v16 = C2_MULTIPEER_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
  {
    LOWORD(v37) = 0;
    _os_log_impl(&dword_1DD523000, v16, OS_LOG_TYPE_INFO, "No endpoint.", (uint8_t *)&v37, 2u);
  }
LABEL_71:
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_3()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_28()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_31()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_34()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_37()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_41()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_44()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_47()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_50()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_54()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_57()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_60()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__C2MultipeerDiscovery__browser__block_invoke_63()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (id)_listener
{
  v3 = [(C2MultipeerDiscovery *)self _peerToPeerParameters];
  id v4 = nw_listener_create(v3);

  id v5 = [(NSUUID *)self->_myPeerID UUIDString];
  bonjour_service = nw_advertise_descriptor_create_bonjour_service((const char *)[v5 UTF8String], "_chunkdiscovery._tcp", 0);
  nw_advertise_descriptor_set_no_auto_rename(bonjour_service, 1);
  nw_listener_set_advertise_descriptor(v4, bonjour_service);
  nw_listener_set_state_changed_handler(v4, &__block_literal_global_68);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __33__C2MultipeerDiscovery__listener__block_invoke_2;
  handler[3] = &unk_1E6CCC1C8;
  handler[4] = self;
  nw_listener_set_new_connection_handler(v4, handler);
  char v7 = [(C2MultipeerDiscovery *)self parent];
  v8 = [v7 queue];
  nw_listener_set_queue(v4, v8);

  nw_listener_start(v4);
  return v4;
}

void __33__C2MultipeerDiscovery__listener__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  nw_endpoint_t v4 = nw_connection_copy_endpoint(v3);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    size_t v6 = [v5 UUIDString];

    char v7 = [*(id *)(a1 + 32) parent];
    v8 = [v7 serverConnectionByPeer];
    size_t v9 = [v8 objectForKeyedSubscript:v6];

    if (v9)
    {
      if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_73_0);
      }
      v10 = C2_MULTIPEER_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1DD523000, v10, OS_LOG_TYPE_INFO, "Ignoring connection, unexpected conflict on UUID, something has gone terribly wrong.", (uint8_t *)&v20, 2u);
      }
      nw_connection_cancel(v3);
    }
    else
    {
      if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_76);
      }
      uint64_t v12 = (void *)C2_MULTIPEER_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
      {
        dispatch_time_t v13 = v12;
        int v20 = 136315394;
        uint64_t description = nw_endpoint_get_description();
        __int16 v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_1DD523000, v13, OS_LOG_TYPE_INFO, "Accepting connection from %s with fake peer ID %@", (uint8_t *)&v20, 0x16u);
      }
      v14 = [C2MultipeerNetworkConnection alloc];
      id v15 = [*(id *)(a1 + 32) parent];
      id v16 = [*(id *)(a1 + 32) parent];
      v17 = [v16 queue];
      objc_super v18 = [(C2MultipeerNetworkConnection *)v14 initWithParent:v15 queue:v17 connection:v3 peerID:v6 isClientConnection:0];

      v19 = [*(id *)(a1 + 32) parent];
      [v19 addServerConnection:v18 peerID:v6];
    }
  }
  else
  {
    if (C2_MULTIPEER_LOG_BLOCK_1 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_1, &__block_literal_global_70);
    }
    long long v11 = C2_MULTIPEER_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1DD523000, v11, OS_LOG_TYPE_INFO, "Ignoring connection, no endpoint.", (uint8_t *)&v20, 2u);
    }
    nw_connection_cancel(v3);
  }
}

uint64_t __33__C2MultipeerDiscovery__listener__block_invoke_3()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __33__C2MultipeerDiscovery__listener__block_invoke_71()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __33__C2MultipeerDiscovery__listener__block_invoke_74()
{
  C2_MULTIPEER_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (C2Multipeer)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (C2Multipeer *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSUUID)myPeerID
{
  return self->_myPeerID;
}

- (void)setMyPeerID:(id)a3
{
}

- (OS_nw_listener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_nw_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (OS_dispatch_source)browserTimer
{
  return self->_browserTimer;
}

- (void)setBrowserTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserTimer, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_myPeerID, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end