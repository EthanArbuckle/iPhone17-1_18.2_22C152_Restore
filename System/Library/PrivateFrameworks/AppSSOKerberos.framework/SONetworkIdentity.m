@interface SONetworkIdentity
- (BOOL)isPerAppVPN;
- (NSData)auditToken;
- (NSString)bundleIdentifier;
- (NSString)networkFingerprint;
- (NSString)realm;
- (OS_nw_path)lastpath;
- (id)getInterfaceFingerprintForDynamicInterface:(const char *)a3;
- (id)getInterfaceSignature:(id)a3;
- (id)getVPNServerSignature:(id)a3;
- (id)initForRealm:(id)a3 bundleIdentifier:(id)a4 auditToken:(id)a5;
- (void)determineNetworkFingerprint;
- (void)evaluateVPNPath;
- (void)evaluateVPNPath:(id)a3;
- (void)evaluateVPNPathForHost:(id)a3 port:(id)a4;
- (void)setAuditToken:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLastpath:(id)a3;
- (void)setNetworkFingerprint:(id)a3;
- (void)setPerAppVPN:(BOOL)a3;
- (void)setRealm:(id)a3;
@end

@implementation SONetworkIdentity

- (id)initForRealm:(id)a3 bundleIdentifier:(id)a4 auditToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SONetworkIdentity;
  v12 = [(SONetworkIdentity *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_realm, a3);
    objc_storeStrong(p_isa + 4, a4);
    objc_storeStrong(p_isa + 6, a5);
  }

  return p_isa;
}

- (NSString)networkFingerprint
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_networkFingerprint;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isPerAppVPN
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL perAppVPN = v2->_perAppVPN;
  objc_sync_exit(v2);

  return perAppVPN;
}

- (void)setPerAppVPN:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL perAppVPN = a3;
  objc_sync_exit(obj);
}

- (void)evaluateVPNPathForHost:(id)a3 port:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (const char *)[v6 UTF8String];
  id v9 = v7;
  id v10 = (const char *)[v9 UTF8String];

  nw_endpoint_t host = nw_endpoint_create_host(v8, v10);
  [(SONetworkIdentity *)self evaluateVPNPath:host];
}

- (void)evaluateVPNPath
{
  v3 = NSString;
  v4 = [(SONetworkIdentity *)self realm];
  id v5 = [v3 stringWithFormat:@"_kerberos._tcp.%@", v4];
  [v5 UTF8String];
  id srv = (id)nw_endpoint_create_srv();

  [(SONetworkIdentity *)self evaluateVPNPath:srv];
}

- (void)evaluateVPNPath:(id)a3
{
  id v4 = a3;
  id v5 = SO_LOG_SONetworkIdentity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SONetworkIdentity evaluateVPNPath:]();
  }

  nw_parameters_t v6 = nw_parameters_create();
  id v7 = [(SONetworkIdentity *)self bundleIdentifier];

  if (v7)
  {
    id v8 = [(SONetworkIdentity *)self bundleIdentifier];
    [v8 UTF8String];
    nw_parameters_set_source_application_by_bundle_id();

    memset(v18, 0, sizeof(v18));
    uint64_t v9 = [(SONetworkIdentity *)self auditToken];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = (void *)MEMORY[0x263F25290];
      v12 = [(SONetworkIdentity *)self auditToken];
      LODWORD(v11) = [v11 auditTokenFromData:v12 auditToken:v18];

      if (v11)
      {
        v13 = SO_LOG_SONetworkIdentity();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[SONetworkIdentity evaluateVPNPath:]();
        }

        nw_parameters_set_source_application();
      }
    }
  }
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  objc_super v15 = (void *)nw_path_evaluator_copy_path();
  v16 = SO_LOG_SONetworkIdentity();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[SONetworkIdentity evaluateVPNPath:]();
  }

  v17 = self;
  objc_sync_enter(v17);
  [(SONetworkIdentity *)v17 setPerAppVPN:nw_path_is_per_app_vpn()];
  objc_sync_exit(v17);
}

- (void)determineNetworkFingerprint
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "start of determineNetworkFingerprint", v2, v3, v4, v5, v6);
}

- (id)getVPNServerSignature:(id)a3
{
  name = nw_interface_get_name((nw_interface_t)a3);
  uint64_t v4 = nwi_state_copy();
  uint64_t v5 = &stru_26D3372C0;
  if (v4 && name)
  {
    if (nwi_state_get_ifstate() && (uint64_t vpn_server = nwi_ifstate_get_vpn_server()) != 0)
    {
      v7.s_addr = *(_DWORD *)(vpn_server + 4);
      id v8 = inet_ntoa(v7);
      uint64_t v9 = SO_LOG_SONetworkIdentity();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[SONetworkIdentity getVPNServerSignature:]();
      }

      uint64_t v5 = [NSString stringWithUTF8String:v8];
    }
    else
    {
      uint64_t v5 = &stru_26D3372C0;
    }
  }
  return v5;
}

- (id)getInterfaceSignature:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = SO_LOG_SONetworkIdentity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SONetworkIdentity getInterfaceSignature:]();
  }

  name = nw_interface_get_name(v4);
  uint64_t v7 = nwi_state_copy();
  if (name && v7)
  {
    if (nwi_state_get_ifstate() && (nwi_ifstate_get_flags() & 3) != 0)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF990]);
      nwi_ifstate_get_signature();
      nwi_ifstate_get_signature();
    }
    nwi_state_release();
  }
  uint64_t v9 = [(SONetworkIdentity *)self getInterfaceFingerprintForDynamicInterface:name];

  return v9;
}

- (id)getInterfaceFingerprintForDynamicInterface:(const char *)a3
{
  v39[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = SO_LOG_SONetworkIdentity();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SONetworkIdentity getInterfaceFingerprintForDynamicInterface:]();
  }

  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint8_t v6 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"com.apple.KerberosExtension", 0, 0);
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263F1BC10];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263F1BBF0];
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v5, (CFStringRef)*MEMORY[0x263F1BC10], (CFStringRef)*MEMORY[0x263F1BBF0], (CFStringRef)*MEMORY[0x263F1BC50]);
  CFStringRef v10 = SCDynamicStoreKeyCreateNetworkServiceEntity(v5, v7, v8, (CFStringRef)*MEMORY[0x263F1BC58]);
  v39[0] = NetworkServiceEntity;
  v39[1] = v10;
  CFArrayRef v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
  if (NetworkServiceEntity) {
    CFRelease(NetworkServiceEntity);
  }
  if (v10) {
    CFRelease(v10);
  }
  CFDictionaryRef v12 = SCDynamicStoreCopyMultiple(v6, 0, v11);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v36 = 0;
  v37[0] = &v36;
  v37[1] = 0x3032000000;
  v37[2] = __Block_byref_object_copy__1;
  v37[3] = __Block_byref_object_dispose__1;
  id v38 = 0;
  uint64_t v33 = 0;
  v34[0] = &v33;
  v34[1] = 0x3032000000;
  v34[2] = __Block_byref_object_copy__1;
  v34[3] = __Block_byref_object_dispose__1;
  id v35 = 0;
  v13 = [NSString stringWithCString:a3 encoding:4];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __64__SONetworkIdentity_getInterfaceFingerprintForDynamicInterface___block_invoke;
  v29 = &unk_2645A2640;
  id v14 = v13;
  id v30 = v14;
  v31 = &v36;
  v32 = &v33;
  [(__CFDictionary *)v12 enumerateKeysAndObjectsUsingBlock:&v26];
  uint64_t v15 = *(void *)(v37[0] + 40);
  v16 = SO_LOG_SONetworkIdentity();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17) {
      [(SONetworkIdentity *)(uint64_t)v37 getInterfaceFingerprintForDynamicInterface:v16];
    }

    unint64_t v18 = objc_msgSend(*(id *)(v37[0] + 40), "length", v26, v27, v28, v29);
    v19 = *(void **)(v37[0] + 40);
    if (v18 < 0x1D)
    {
      v21 = v19;
    }
    else
    {
      uint64_t v20 = [v19 length];
      v21 = objc_msgSend(*(id *)(v37[0] + 40), "substringWithRange:", 23, v20 - 28);
    }
    v16 = v21;
    if (*(void *)(v34[0] + 40)) {
      v23 = *(__CFString **)(v34[0] + 40);
    }
    else {
      v23 = &stru_26D3372C0;
    }
    v24 = [v21 stringByAppendingString:v23];
    v22 = [v24 dataUsingEncoding:4];
  }
  else
  {
    if (v17) {
      -[SONetworkIdentity getInterfaceFingerprintForDynamicInterface:]();
    }
    v22 = 0;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

void __64__SONetworkIdentity_getInterfaceFingerprintForDynamicInterface___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)a1[4];
  CFStringRef v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F1BCC8]];
  LODWORD(v9) = [v9 isEqualToString:v10];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    CFArrayRef v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F1BD58]];
    CFDictionaryRef v12 = v11;
    if (!v11)
    {
      CFDictionaryRef v12 = [v8 objectForKeyedSubscript:*MEMORY[0x263F1BD90]];
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v12);
    if (!v11) {

    }
    *a4 = 1;
  }
}

- (void)setNetworkFingerprint:(id)a3
{
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (OS_nw_path)lastpath
{
  return self->_lastpath;
}

- (void)setLastpath:(id)a3
{
}

- (NSData)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_lastpath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_networkFingerprint, 0);
}

- (void)evaluateVPNPath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "vpn path: %{public}@", v2, v3, v4, v5, v6);
}

- (void)evaluateVPNPath:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "using audit token", v2, v3, v4, v5, v6);
}

- (void)evaluateVPNPath:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "evaluate vpn path: %{public}@", v2, v3, v4, v5, v6);
}

- (void)getVPNServerSignature:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "VPN IP address: %{private}s\n", v2, v3, v4, v5, v6);
}

- (void)getInterfaceSignature:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "IPv6 signature", v2, v3, v4, v5, v6);
}

- (void)getInterfaceSignature:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "IPv4 signature", v2, v3, v4, v5, v6);
}

- (void)getInterfaceSignature:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "begin getInterfaceSignature", v2, v3, v4, v5, v6);
}

- (void)getInterfaceFingerprintForDynamicInterface:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "no matching entry found for %{public}s", v2, v3, v4, v5, v6);
}

- (void)getInterfaceFingerprintForDynamicInterface:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  uint64_t v4 = *(void *)(*(void *)a2 + 40);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_221304000, log, OS_LOG_TYPE_DEBUG, "Using key: %{public}@, Router: %@", (uint8_t *)&v5, 0x16u);
}

- (void)getInterfaceFingerprintForDynamicInterface:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "Dynamic interface signature", v2, v3, v4, v5, v6);
}

@end