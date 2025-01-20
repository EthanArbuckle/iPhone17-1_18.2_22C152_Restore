@interface ACCiAP2ShimServerClient
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (ACCiAP2ShimServerClient)initWithCapabilities:(unsigned int)a3 auditToken:(id *)a4 xpcConnection:(id)a5 eaProtocols:(id)a6 andBundleId:(id)a7;
- (BOOL)cameraSupportedByClient;
- (BOOL)canSendConnectionEventForAccessory:(id)a3;
- (BOOL)clientRequiresAccReset;
- (BOOL)entitlementForAllAccessories;
- (BOOL)hasEntitlementForAllAccessories;
- (BOOL)interestedInBLENotifications;
- (BOOL)locationSupportedByClient;
- (BOOL)supportsAccessibility;
- (NSArray)clientEAProtocols;
- (NSString)bundleId;
- (OS_dispatch_queue)processAssertionQ;
- (OS_dispatch_source)processAssertionTimer;
- (OS_xpc_object)xpcConnection;
- (SBSProcessAssertion)processAssertion;
- (id)_applicationInfoForBundleIDSync:(id)a3;
- (id)description;
- (int)iapSessionRefCount;
- (int)processId;
- (int64_t)processAssertionStartTime;
- (unsigned)applicationState;
- (unsigned)capabilities;
- (unsigned)clientID;
- (void)dealloc;
- (void)releaseProcessAssertion;
- (void)setApplicationState:(unsigned int)a3;
- (void)setCameraSupportedByClient:(BOOL)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setClientRequiresAccReset:(BOOL)a3;
- (void)setInterestedInBLENotifications:(BOOL)a3;
- (void)setLocationSupportedByClient:(BOOL)a3;
- (void)takeProcessAssertion:(id)a3;
@end

@implementation ACCiAP2ShimServerClient

- (ACCiAP2ShimServerClient)initWithCapabilities:(unsigned int)a3 auditToken:(id *)a4 xpcConnection:(id)a5 eaProtocols:(id)a6 andBundleId:(id)a7
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v49.receiver = self;
  v49.super_class = (Class)ACCiAP2ShimServerClient;
  v16 = [(ACCiAP2ShimServerClient *)&v49 init];
  v17 = v16;
  if (v16)
  {
    v16->_capabilities = a3;
    v16->_iapSessionRefCount = 0;
    long long v18 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v16->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v16->_auditToken.val[4] = v18;
    objc_storeStrong((id *)&v16->_xpcConnection, a5);
    uint64_t v19 = [v15 copy];
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v19;

    v17->_processId = -1;
    dispatch_queue_t v21 = dispatch_queue_create("IAPEAClient Process Assertion Queue", 0);
    processAssertionQ = v17->_processAssertionQ;
    v17->_processAssertionQ = (OS_dispatch_queue *)v21;

    v17->_clientRequiresAccReset = 0;
    v17->_BOOL entitlementForAllAccessories = 0;
    v17->_processAssertion = 0;
    v17->_processAssertionStartTime = 0;
    uint64_t v23 = [v14 copy];
    clientEAProtocols = v17->_clientEAProtocols;
    v17->_clientEAProtocols = (NSArray *)v23;

    long long v25 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    *(_OWORD *)&buf[16] = v25;
    v17->_BOOL entitlementForAllAccessories = __hasEntitlementForAuditToken(@"com.apple.private.externalaccessory.showallaccessories", buf);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v26 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v26 = &_os_log_internal;
      id v27 = &_os_log_internal;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl(&dword_223B61000, v26, OS_LOG_TYPE_INFO, "[#ServerClient] INIT - capability=0x%x", buf, 8u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v28 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v28 = &_os_log_internal;
      id v29 = &_os_log_internal;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v30 = "YES";
      if ((a3 & 0x10) == 0) {
        v30 = "NO";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v30;
      _os_log_impl(&dword_223B61000, v28, OS_LOG_TYPE_INFO, "[#ServerClient] %@ supports EA while suspended = %s", buf, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v31 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v31 = &_os_log_internal;
      id v32 = &_os_log_internal;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v33 = "YES";
      if ((a3 & 0x20) == 0) {
        v33 = "NO";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v33;
      _os_log_impl(&dword_223B61000, v31, OS_LOG_TYPE_INFO, "[#ServerClient] %@ supports EA while backgrounded = %s", buf, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v34 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v34 = &_os_log_internal;
      id v35 = &_os_log_internal;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v36 = "YES";
      if ((a3 & 0x8000) == 0) {
        v36 = "NO";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v36;
      _os_log_impl(&dword_223B61000, v34, OS_LOG_TYPE_INFO, "[#ServerClient] %@ supports Application state = %s", buf, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v37 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v37 = &_os_log_internal;
      id v38 = &_os_log_internal;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      BOOL entitlementForAllAccessories = v17->_entitlementForAllAccessories;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = entitlementForAllAccessories;
      _os_log_impl(&dword_223B61000, v37, OS_LOG_TYPE_INFO, "[#ServerClient] _BOOL entitlementForAllAccessories = %d", buf, 8u);
    }

    dispatch_source_t v40 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v17->_processAssertionQ);
    processAssertionTimer = v17->_processAssertionTimer;
    v17->_processAssertionTimer = (OS_dispatch_source *)v40;

    v42 = v17->_processAssertionTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __97__ACCiAP2ShimServerClient_initWithCapabilities_auditToken_xpcConnection_eaProtocols_andBundleId___block_invoke;
    handler[3] = &unk_2646D0380;
    v43 = v17;
    v48 = v43;
    dispatch_source_set_event_handler(v42, handler);
    dispatch_source_set_timer((dispatch_source_t)v17->_processAssertionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v17->_processAssertionTimer);
    BOOL v45 = 0;
    if ((v17->_capabilities & 2) != 0)
    {
      long long v44 = *(_OWORD *)&a4->var0[4];
      *(_OWORD *)buf = *(_OWORD *)a4->var0;
      *(_OWORD *)&buf[16] = v44;
      if (__hasEntitlementForAuditToken(@"com.apple.iapd.accessibility", buf)) {
        BOOL v45 = 1;
      }
    }
    v43->_supportsAccessibility = v45;
  }
  return v17;
}

void __97__ACCiAP2ShimServerClient_initWithCapabilities_auditToken_xpcConnection_eaProtocols_andBundleId___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 72))
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 1;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v5 = &_os_log_internal;
      id v4 = &_os_log_internal;
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
      int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 20);
      v8[0] = 67109376;
      v8[1] = v7;
      __int16 v9 = 1024;
      int v10 = v6;
      _os_log_impl(&dword_223B61000, v5, OS_LOG_TYPE_INFO, "[#ServerClient] releasing process assertion - clientID=%d pid=%d", (uint8_t *)v8, 0xEu);
    }

    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 72));
    *(void *)(*(void *)(a1 + 32) + 72) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 88), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  *(void *)(*(void *)(a1 + 32) + 80) = 0;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    v5 = &_os_log_internal;
    id v4 = &_os_log_internal;
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int clientID = self->_clientID;
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = clientID;
    _os_log_impl(&dword_223B61000, v5, OS_LOG_TYPE_INFO, "[#ServerClient] DEALLOC - clientID=%d", buf, 8u);
  }

  processAssertionTimer = self->_processAssertionTimer;
  if (processAssertionTimer)
  {
    dispatch_source_cancel(processAssertionTimer);
    v8 = self->_processAssertionTimer;
    self->_processAssertionTimer = 0;
  }
  processAssertionQ = self->_processAssertionQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ACCiAP2ShimServerClient_dealloc__block_invoke;
  block[3] = &unk_2646D0380;
  block[4] = self;
  dispatch_sync(processAssertionQ, block);
  self->_processAssertionStartTime = 0;
  dispatch_sync((dispatch_queue_t)self->_processAssertionQ, &__block_literal_global_0);
  int v10 = self->_processAssertionQ;
  self->_processAssertionQ = 0;

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  bundleId = self->_bundleId;
  self->_bundleId = 0;

  clientEAProtocols = self->_clientEAProtocols;
  self->_clientEAProtocols = 0;

  v14.receiver = self;
  v14.super_class = (Class)ACCiAP2ShimServerClient;
  [(ACCiAP2ShimServerClient *)&v14 dealloc];
}

void __34__ACCiAP2ShimServerClient_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 72) = 0;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCiAP2ShimServerClient>[clientID=%u bundId=%@ capabilities=%xh supported: location=%d camera=%d accessibility=%d, requiredAccReset=%d]", self->_clientID, self->_bundleId, self->_capabilities, self->_locationSupportedByClient, self->_cameraSupportedByClient, self->_supportsAccessibility, self->_clientRequiresAccReset];
}

- (void)takeProcessAssertion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_processAssertion)
  {
LABEL_7:
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      int v10 = &_os_log_internal;
      id v7 = &_os_log_internal;
    }
    else
    {
      int v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      bundleId = self->_bundleId;
      int processId = self->_processId;
      int v17 = 138412546;
      uint64_t v18 = bundleId;
      __int16 v19 = 1024;
      int v20 = processId;
      _os_log_impl(&dword_223B61000, v10, OS_LOG_TYPE_INFO, "[#ServerClient] creating process assertion - appId=%@ pid=%d", (uint8_t *)&v17, 0x12u);
    }

    self->_processAssertion = (SBSProcessAssertion *)SBSProcessAssertionCreateForPID();
    self->_processAssertionStartTime = time(0);
    goto LABEL_35;
  }
  if (time(0) - self->_processAssertionStartTime >= 3)
  {
    if (self->_processAssertion)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        v5 = &_os_log_internal;
        id v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v15 = self->_bundleId;
        int v16 = self->_processId;
        int v17 = 138412546;
        uint64_t v18 = v15;
        __int16 v19 = 1024;
        int v20 = v16;
        _os_log_impl(&dword_223B61000, v5, OS_LOG_TYPE_INFO, "[#ServerClient] renewing process assertion - appId=%@ pid=%d", (uint8_t *)&v17, 0x12u);
      }

      self->_processAssertionStartTime = 0;
      goto LABEL_35;
    }
    goto LABEL_7;
  }
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v13 = &_os_log_internal;
    id v9 = &_os_log_internal;
  }
  else
  {
    id v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_223B61000, v13, OS_LOG_TYPE_INFO, "[#ServerClient] using ea process hysteresis", (uint8_t *)&v17, 2u);
  }

LABEL_35:
}

- (void)releaseProcessAssertion
{
  p_processAssertion = &self->_processAssertion;
  processAssertion = self->_processAssertion;
  if (processAssertion)
  {
    CFRelease(processAssertion);
    *p_processAssertion = 0;
    p_processAssertion[1] = 0;
  }
}

- (BOOL)canSendConnectionEventForAccessory:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(ACCiAP2ShimServerClient *)self capabilities];
  char v6 = [(ACCiAP2ShimServerClient *)self capabilities];
  __int16 v7 = [(ACCiAP2ShimServerClient *)self capabilities];
  unsigned int v8 = [(ACCiAP2ShimServerClient *)self applicationState];
  unsigned int v27 = [(ACCiAP2ShimServerClient *)self applicationState];
  id v9 = [v4 objectForKey:*MEMORY[0x263F49DD0]];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  if ([(NSArray *)self->_clientEAProtocols count])
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __62__ACCiAP2ShimServerClient_canSendConnectionEventForAccessory___block_invoke;
    v28[3] = &unk_2646D03D0;
    v28[4] = self;
    v28[5] = &v29;
    [v9 enumerateKeysAndObjectsUsingBlock:v28];
    if (!*((unsigned char *)v30 + 24))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        int v10 = &_os_log_internal;
        id v11 = &_os_log_internal;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        bundleId = self->_bundleId;
        *(_DWORD *)buf = 138412290;
        v34 = bundleId;
        _os_log_impl(&dword_223B61000, v10, OS_LOG_TYPE_DEFAULT, "[#ServerClient] No protocols found for client %@", buf, 0xCu);
      }
    }
  }
  if (*((unsigned char *)v30 + 24) || self->_entitlementForAllAccessories)
  {
    unsigned int v13 = v6 & 0x20;
    unsigned int v14 = v7 & 0x8000;
    BOOL v15 = 1;
    unsigned int v16 = v5 & 0x10;
    if ((v5 & 0x10) == 0 && v7 < 0)
    {
      BOOL v17 = v8 == 4;
      if (v27 > 4) {
        BOOL v17 = 1;
      }
      if (!v13) {
        BOOL v17 = 0;
      }
      BOOL v15 = v27 > 4 || v17;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      uint64_t v18 = &_os_log_internal;
      id v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v25 = v4;
      v26 = v9;
      int v20 = self->_bundleId;
      BOOL entitlementForAllAccessories = self->_entitlementForAllAccessories;
      int v22 = *((unsigned __int8 *)v30 + 24);
      unsigned int v23 = [(ACCiAP2ShimServerClient *)self applicationState];
      *(_DWORD *)buf = 138414594;
      v34 = v20;
      __int16 v35 = 1024;
      unsigned int v36 = v16 >> 4;
      __int16 v37 = 1024;
      unsigned int v38 = v13 >> 5;
      __int16 v39 = 1024;
      BOOL v40 = v8 == 4;
      __int16 v41 = 1024;
      BOOL v42 = v27 > 4;
      __int16 v43 = 1024;
      unsigned int v44 = v14 >> 15;
      __int16 v45 = 1024;
      BOOL v46 = entitlementForAllAccessories;
      __int16 v47 = 1024;
      int v48 = v22;
      __int16 v49 = 1024;
      unsigned int v50 = v23;
      __int16 v51 = 1024;
      BOOL v52 = v15;
      _os_log_impl(&dword_223B61000, v18, OS_LOG_TYPE_INFO, "[#ServerClient] bundleID %@ supportsEAWhenSuspended = %d, supportsEAInBackground = %d, clientAppStateInBackground = %d, clientAppStateInForeground = %d, clientLinksUIApplication = %d, _BOOL entitlementForAllAccessories = %d, anyProtocolFound = %d, self.applicationState = 0x%X, canSendConnectionEvent = %d", buf, 0x42u);
      id v4 = v25;
      id v9 = v26;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __62__ACCiAP2ShimServerClient_canSendConnectionEventForAccessory___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  __int16 v7 = *(void **)(*(void *)(a1 + 32) + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__ACCiAP2ShimServerClient_canSendConnectionEventForAccessory___block_invoke_2;
  v10[3] = &unk_2646D03A8;
  id v11 = v6;
  if ([v7 indexOfObjectPassingTest:v10] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      unsigned int v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      unsigned int v8 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_223B61000, v8, OS_LOG_TYPE_INFO, "[#ServerClient] protocol %@ found from accessory", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

BOOL __62__ACCiAP2ShimServerClient_canSendConnectionEventForAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

- (BOOL)hasEntitlementForAllAccessories
{
  return self->_entitlementForAllAccessories;
}

- (id)_applicationInfoForBundleIDSync:(id)a3
{
  id v3 = a3;
  id v4 = _getApplicationStateMonitor();
  char v5 = [v4 applicationInfoForApplication:v3];

  return v5;
}

- (int)processId
{
  int result = self->_processId;
  if (result == -1)
  {
    self->_int processId = 0;
    if (self->_bundleId)
    {
      id v4 = -[ACCiAP2ShimServerClient _applicationInfoForBundleIDSync:](self, "_applicationInfoForBundleIDSync:");
      char v5 = [v4 valueForKey:*MEMORY[0x263F297D0]];
      int v6 = [v5 unsignedIntegerValue];

      self->_int processId = v6;
      return self->_processId;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_unsigned int clientID = a3;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[3].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[3].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (BOOL)locationSupportedByClient
{
  return self->_locationSupportedByClient;
}

- (void)setLocationSupportedByClient:(BOOL)a3
{
  self->_locationSupportedByClient = a3;
}

- (BOOL)cameraSupportedByClient
{
  return self->_cameraSupportedByClient;
}

- (void)setCameraSupportedByClient:(BOOL)a3
{
  self->_cameraSupportedByClient = a3;
}

- (BOOL)supportsAccessibility
{
  return self->_supportsAccessibility;
}

- (BOOL)clientRequiresAccReset
{
  return self->_clientRequiresAccReset;
}

- (void)setClientRequiresAccReset:(BOOL)a3
{
  self->_clientRequiresAccReset = a3;
}

- (BOOL)interestedInBLENotifications
{
  return self->_interestedInBLENotifications;
}

- (void)setInterestedInBLENotifications:(BOOL)a3
{
  self->_interestedInBLENotifications = a3;
}

- (BOOL)entitlementForAllAccessories
{
  return self->_entitlementForAllAccessories;
}

- (NSArray)clientEAProtocols
{
  return self->_clientEAProtocols;
}

- (OS_dispatch_queue)processAssertionQ
{
  return self->_processAssertionQ;
}

- (SBSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (int64_t)processAssertionStartTime
{
  return self->_processAssertionStartTime;
}

- (OS_dispatch_source)processAssertionTimer
{
  return self->_processAssertionTimer;
}

- (int)iapSessionRefCount
{
  return self->_iapSessionRefCount;
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(unsigned int)a3
{
  self->_applicationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertionTimer, 0);
  objc_storeStrong((id *)&self->_processAssertionQ, 0);
  objc_storeStrong((id *)&self->_clientEAProtocols, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end