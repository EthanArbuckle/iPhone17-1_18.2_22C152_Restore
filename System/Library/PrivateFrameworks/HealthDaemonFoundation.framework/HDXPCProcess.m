@interface HDXPCProcess
+ (HDXPCProcess)processWithConnection:(id)a3 error:(id *)a4;
+ (id)currentProcess;
- (BOOL)hasArrayEntitlement:(id)a3 containing:(id)a4;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasRequiredArrayEntitlement:(id)a3 containing:(id)a4 error:(id *)a5;
- (BOOL)hasRequiredEntitlement:(id)a3 error:(id *)a4;
- (BOOL)isExtension;
- (BOOL)isWidgetKitExtension;
- (HDXPCProcess)initWithAuditToken:(id)a3 entitlements:(id)a4 isExtension:(BOOL)a5 containerAppBundleIdentifier:(id)a6;
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSString)containerAppBundleIdentifier;
- (NSString)name;
- (_HKEntitlements)entitlements;
- (_HKXPCAuditToken)auditToken;
- (id)_pluginBundleForCurrentProcess;
- (id)description;
- (id)unitTest_copyProcessWithEntitlements:(id)a3;
- (id)valueForEntitlement:(id)a3;
- (int)processIdentifier;
- (void)_pluginBundleForCurrentProcess;
- (void)dropEntitlement:(id)a3;
- (void)isWidgetKitExtension;
- (void)restoreEntitlement:(id)a3;
@end

@implementation HDXPCProcess

- (_HKEntitlements)entitlements
{
  return self->_entitlements;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (NSString)name
{
  name = self->_name;
  if (name) {
    return name;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    return bundleIdentifier;
  }
  else {
    return (NSString *)@"Unknown";
  }
}

- (NSString)applicationIdentifier
{
  return (NSString *)[(_HKEntitlements *)self->_entitlements applicationIdentifier];
}

- (BOOL)hasRequiredArrayEntitlement:(id)a3 containing:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(HDXPCProcess *)self hasArrayEntitlement:v8 containing:v9];
  if (!v10) {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 4, @"Missing %@[%@] entitlement.", v8, v9);
  }

  return v10;
}

- (BOOL)hasArrayEntitlement:(id)a3 containing:(id)a4
{
  id v6 = a4;
  v7 = [(HDXPCProcess *)self valueForEntitlement:a3];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v8 = [v7 containsObject:v6];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)hasRequiredEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(HDXPCProcess *)self hasEntitlement:v6];
  if (!v7) {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 4, @"Missing %@ entitlement.", v6);
  }

  return v7;
}

- (BOOL)hasEntitlement:(id)a3
{
  v3 = [(HDXPCProcess *)self valueForEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_droppedEntitlements containsObject:v4])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(_HKEntitlements *)self->_entitlements valueForEntitlement:v4];
  }

  return v5;
}

+ (HDXPCProcess)processWithConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [MEMORY[0x263F0A9C0] entitlementsWithConnection:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "hk_isAppExtension");
    if (v8)
    {
      id v9 = objc_msgSend(MEMORY[0x263F01888], "hk_appExtensionContainerBundleForConnection:", v6);
      BOOL v10 = [v9 bundleIdentifier];
    }
    else
    {
      BOOL v10 = 0;
    }
    id v12 = objc_alloc(MEMORY[0x263F0AA38]);
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    v13 = (void *)[v12 initWithAuditToken:v15];
    v11 = (void *)[objc_alloc((Class)a1) initWithAuditToken:v13 entitlements:v7 isExtension:v8 containerAppBundleIdentifier:v10];
  }
  else
  {
    v11 = 0;
  }

  return (HDXPCProcess *)v11;
}

- (HDXPCProcess)initWithAuditToken:(id)a3 entitlements:(id)a4 isExtension:(BOOL)a5 containerAppBundleIdentifier:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)HDXPCProcess;
  v13 = [(HDXPCProcess *)&v32 init];
  if (!v13) {
    goto LABEL_19;
  }
  uint64_t v14 = [v10 copy];
  v15 = v13->_auditToken;
  v13->_auditToken = (_HKXPCAuditToken *)v14;

  objc_storeStrong((id *)&v13->_entitlements, a4);
  id v16 = v10;
  if (HDXPCProcessNameFromAuditToken_onceToken != -1) {
    dispatch_once(&HDXPCProcessNameFromAuditToken_onceToken, &__block_literal_global_3);
  }
  if (!HDXPCProcessNameFromAuditToken_pidInfoAllowed) {
    goto LABEL_11;
  }
  int v17 = proc_name([v16 processIdentifier], buffer, 0x400u);
  if (v17 < 1)
  {
    memset(&audittoken, 0, sizeof(audittoken));
    if (v16) {
      [v16 auditToken];
    }
    int v19 = proc_pidpath_audittoken(&audittoken, buffer, 0x400u);
    if (v19 >= 1)
    {
      v20 = (void *)[[NSString alloc] initWithBytes:buffer length:v19 encoding:4];
      uint64_t v18 = [v20 lastPathComponent];

      goto LABEL_12;
    }
LABEL_11:
    uint64_t v18 = 0;
    goto LABEL_12;
  }
  uint64_t v18 = [[NSString alloc] initWithBytes:buffer length:v17 encoding:4];
LABEL_12:

  name = v13->_name;
  v13->_name = (NSString *)v18;

  v22 = (void *)MEMORY[0x263F0AA38];
  if (v16) {
    [v16 auditToken];
  }
  else {
    memset(v31, 0, sizeof(v31));
  }
  v23 = [v22 signingIdentifierFromAuditToken:v31];
  v24 = (void *)[v23 copy];
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    v26 = [v11 applicationIdentifier];
  }
  bundleIdentifier = v13->_bundleIdentifier;
  v13->_bundleIdentifier = v26;

  v13->_isExtension = a5;
  uint64_t v28 = [v12 copy];
  containerAppBundleIdentifier = v13->_containerAppBundleIdentifier;
  v13->_containerAppBundleIdentifier = (NSString *)v28;

LABEL_19:
  return v13;
}

- (int)processIdentifier
{
  return [(_HKXPCAuditToken *)self->_auditToken processIdentifier];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_containerAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_droppedEntitlements, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)isWidgetKitExtension
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!self->_isExtension) {
    return 0;
  }
  v3 = [(HDXPCProcess *)self _pluginBundleForCurrentProcess];
  id v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hk_extensionPointIdentifier");
    id v6 = v5;
    if (v5)
    {
      char v7 = [v5 isEqualToString:@"com.apple.widgetkit-extension"];
    }
    else
    {
      _HKInitializeLogging();
      id v9 = *MEMORY[0x263F098F8];
      char v7 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = self;
        _os_log_impl(&dword_21BFB4000, v9, OS_LOG_TYPE_DEFAULT, "Bundle extension point not found for process: %{public}@", (uint8_t *)&v11, 0xCu);
        char v7 = 0;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEBUG)) {
      [(HDXPCProcess *)(uint64_t)self isWidgetKitExtension];
    }
    char v7 = 0;
  }

  return v7;
}

- (id)_pluginBundleForCurrentProcess
{
  v3 = [MEMORY[0x263F5E718] defaultManager];
  id v4 = objc_msgSend(v3, "informationForPlugInWithPid:", -[HDXPCProcess processIdentifier](self, "processIdentifier"));

  _HKInitializeLogging();
  v5 = *MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEBUG)) {
    [(HDXPCProcess *)(uint64_t)self _pluginBundleForCurrentProcess];
  }
  id v6 = [v4 objectForKey:*MEMORY[0x263F5E738]];
  if (v6)
  {
    char v7 = [NSURL fileURLWithPath:v6 isDirectory:1];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleWithURL:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)currentProcess
{
  uint64_t v8 = 0;
  v3 = [MEMORY[0x263F0A9C0] entitlementsForCurrentTaskWithError:&v8];
  if (!v3)
  {
    v3 = [MEMORY[0x263F0A9C0] entitlementsWithDictionary:MEMORY[0x263EFFA78]];
  }
  id v4 = objc_alloc((Class)a1);
  v5 = [MEMORY[0x263F0AA38] auditTokenForCurrentTask];
  id v6 = (void *)[v4 initWithAuditToken:v5 entitlements:v3 isExtension:0 containerAppBundleIdentifier:0];

  return v6;
}

- (void)dropEntitlement:(id)a3
{
  id v4 = a3;
  droppedEntitlements = self->_droppedEntitlements;
  id v8 = v4;
  if (!droppedEntitlements)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    char v7 = self->_droppedEntitlements;
    self->_droppedEntitlements = v6;

    id v4 = v8;
    droppedEntitlements = self->_droppedEntitlements;
  }
  [(NSMutableSet *)droppedEntitlements addObject:v4];
}

- (id)unitTest_copyProcessWithEntitlements:(id)a3
{
  id v4 = a3;
  v5 = [[HDXPCProcess alloc] initWithAuditToken:self->_auditToken entitlements:v4 isExtension:self->_isExtension containerAppBundleIdentifier:self->_containerAppBundleIdentifier];

  return v5;
}

- (void)restoreEntitlement:(id)a3
{
}

- (id)description
{
  if (self->_name) {
    v3 = (__CFString *)[[NSString alloc] initWithFormat:@": \"%@\"", self->_name];
  }
  else {
    v3 = &stru_26CC1AE10;
  }
  id v4 = [NSString stringWithFormat:@"<%@ %@(%d)%@>", objc_opt_class(), self->_bundleIdentifier, -[HDXPCProcess processIdentifier](self, "processIdentifier"), v3, 0];

  return v4;
}

- (_HKXPCAuditToken)auditToken
{
  return self->_auditToken;
}

- (NSString)containerAppBundleIdentifier
{
  return self->_containerAppBundleIdentifier;
}

- (void)isWidgetKitExtension
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_DEBUG, "Plugin bundle not found for process: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_pluginBundleForCurrentProcess
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_21BFB4000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Retrieved plugin bundle info (%{public}@)", (uint8_t *)&v3, 0x16u);
}

@end