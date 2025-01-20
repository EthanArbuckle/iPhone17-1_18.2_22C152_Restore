@interface GEOApplicationAuditToken
+ (BOOL)supportsSecureCoding;
+ (id)compositeTokenForTokens:(id)a3;
+ (id)currentProcessAuditToken;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProxiedExternalBundleId;
- (GEOApplicationAuditToken)init;
- (GEOApplicationAuditToken)initWithAuditTokenData:(id)a3;
- (GEOApplicationAuditToken)initWithCoder:(id)a3;
- (GEOApplicationAuditToken)initWithNSXPCConnection:(id)a3;
- (GEOApplicationAuditToken)initWithProxiedApplicationBundleId:(id)a3;
- (GEOApplicationAuditToken)initWithProxiedExternalApplicationBundleId:(id)a3;
- (GEOApplicationAuditToken)initWithSecondaryIdentifier:(id)a3;
- (GEOApplicationAuditToken)initWithXPCConnection:(id)a3;
- (GEOApplicationAuditToken)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSString)_secondaryIdentifier;
- (NSString)description;
- (NSString)offlineCohortId;
- (NSString)proxiedBundleId;
- (id)_bundleIdForAuditToken;
- (id)_valueForEntitlement:(id)a3;
- (id)backingTokenData;
- (id)bundleId;
- (id)bundleIdForNetworkAttribution;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initCommon;
- (id)overrideTokenWithOfflineCohortId:(id)a3;
- (id)overrideTokenWithProxiedBundleId:(id)a3;
- (id)publicLogDescription;
- (id)valueForEntitlement:(id)a3;
- (id)valuesForEntitlement:(id)a3;
- (unint64_t)hash;
- (void)encodeToXPCDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOApplicationAuditToken

- (id)bundleId
{
  if ([(NSString *)self->_proxiedBundleId length])
  {
    v3 = self->_proxiedBundleId;
  }
  else
  {
    v5 = self->_isolater;
    _geo_isolate_lock_data();
    v3 = [(GEOApplicationAuditToken *)self _bundleIdForAuditToken];
    _geo_isolate_unlock();
  }

  return v3;
}

- (id)_bundleIdForAuditToken
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  geo_assert_isolated();
  p_resolvedBundleId = (id *)&self->_resolvedBundleId;
  if (!self->_resolvedBundleId && [(NSData *)self->_tokenData length] == 32)
  {
    long long v19 = 0u;
    *(_OWORD *)pid = 0u;
    -[NSData getBytes:range:](self->_tokenData, "getBytes:range:", &v19, 0, 32);
    *(_OWORD *)token.val = v19;
    *(_OWORD *)&token.val[4] = *(_OWORD *)pid;
    SecTaskRef v4 = SecTaskCreateWithAuditToken(0, &token);
    if (v4)
    {
      v5 = v4;
      if (AppSupportLibraryCore())
      {
        *(void *)token.val = 0;
        if (geoCPCopyBundleIdentifierAndTeamFromSecTaskRef((uint64_t)v5, (uint64_t)&token, 0))
        {
          resolvedNetworkAttributionBundleId = self->_resolvedNetworkAttributionBundleId;
          self->_resolvedNetworkAttributionBundleId = *(NSString **)token.val;

          objc_storeStrong((id *)&self->_resolvedBundleId, self->_resolvedNetworkAttributionBundleId);
        }
      }
      if (![(NSString *)self->_resolvedNetworkAttributionBundleId length])
      {
        v7 = (NSString *)SecTaskCopyValueForEntitlement(v5, @"application-identifier", 0);
        v8 = self->_resolvedNetworkAttributionBundleId;
        self->_resolvedNetworkAttributionBundleId = v7;

        objc_storeStrong((id *)&self->_resolvedBundleId, self->_resolvedNetworkAttributionBundleId);
      }
      if (![*p_resolvedBundleId length])
      {
        CFStringRef v9 = SecTaskCopySigningIdentifier(v5, 0);
        id v10 = *p_resolvedBundleId;
        id *p_resolvedBundleId = (id)v9;
      }
      CFRelease(v5);
    }
    if (![*p_resolvedBundleId length])
    {
      uint64_t v11 = pid[1];
      int v12 = proc_pidpath(pid[1], &token, 0x400u);
      if (v12 < 1)
      {
        uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%d)", v11);
        v13 = *p_resolvedBundleId;
        id *p_resolvedBundleId = (id)v16;
      }
      else
      {
        *((unsigned char *)token.val + v12) = 0;
        v13 = [NSString stringWithUTF8String:&token];
        uint64_t v14 = [v13 lastPathComponent];
        id v15 = *p_resolvedBundleId;
        id *p_resolvedBundleId = (id)v14;
      }
    }
  }
  id v17 = *p_resolvedBundleId;

  return v17;
}

- (NSString)proxiedBundleId
{
  return self->_proxiedBundleId;
}

- (id)backingTokenData
{
  return self->_tokenData;
}

- (NSString)_secondaryIdentifier
{
  return self->_secondaryIdentifier;
}

- (unint64_t)hash
{
  tokenData = self->_tokenData;
  if (tokenData || (tokenData = (NSData *)self->_proxiedBundleId) != 0)
  {
    return [(NSData *)tokenData hash];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)GEOApplicationAuditToken;
    return [(GEOApplicationAuditToken *)&v4 hash];
  }
}

- (BOOL)hasEntitlement:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v12 = self->_isolater;
  _geo_isolate_lock();
  v5 = [(GEOApplicationAuditToken *)self _valueForEntitlement:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    int v7 = *(char *)[v6 objCType];
    if (v7 == 66 || v7 == 99)
    {
      char v8 = [v6 BOOLValue];
    }
    else
    {
      CFStringRef v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109634;
        int v14 = 66;
        __int16 v15 = 1024;
        int v16 = 99;
        __int16 v17 = 2080;
        uint64_t v18 = [v6 objCType];
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: entitlement type was not BOOL. expected %c or %c got '%s'", buf, 0x18u);
      }

      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  _geo_isolate_unlock();
  return v8;
}

- (GEOApplicationAuditToken)initWithXPCConnection:(id)a3
{
  if (a3)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    xpc_connection_get_audit_token();
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v7 length:32];
    self = -[GEOApplicationAuditToken initWithAuditTokenData:](self, "initWithAuditTokenData:", v4, v7, v8);

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOApplicationAuditToken)initWithAuditTokenData:(id)a3
{
  id v4 = a3;
  [v4 length];
  v5 = [(GEOApplicationAuditToken *)self initCommon];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tokenData = v5->_tokenData;
    v5->_tokenData = (NSData *)v6;

    long long v8 = v5;
  }

  return v5;
}

- (id)initCommon
{
  v7.receiver = self;
  v7.super_class = (Class)GEOApplicationAuditToken;
  v2 = [(GEOApplicationAuditToken *)&v7 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    v5 = v2;
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)offlineCohortId
{
  overrideOfflineCohortId = self->_overrideOfflineCohortId;
  if (overrideOfflineCohortId)
  {
    uint64_t v3 = overrideOfflineCohortId;
  }
  else
  {
    v5 = [(GEOApplicationAuditToken *)self valueForEntitlement:@"com.apple.geoservices.offline.cohort-id"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 length])
    {
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v6 = [(GEOApplicationAuditToken *)self bundleId];
    }
    uint64_t v3 = v6;
  }

  return v3;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  objc_super v7 = self->_isolater;
  _geo_isolate_lock();
  v5 = [(GEOApplicationAuditToken *)self _valueForEntitlement:v4];
  _geo_isolate_unlock();

  return v5;
}

- (id)_valueForEntitlement:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  if (self->_tokenData)
  {
    geo_assert_isolated();
    memset(&v19, 0, sizeof(v19));
    -[NSData getBytes:range:](self->_tokenData, "getBytes:range:", &v19, 0, 32);
    uint64_t v5 = [(NSMutableDictionary *)self->_entitlementValueCache objectForKey:v4];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v7 = 0;
      }
      else {
        objc_super v7 = v6;
      }
      goto LABEL_19;
    }
    if (!self->_entitlementValueCache)
    {
      long long v8 = [MEMORY[0x1E4F1CA60] dictionary];
      entitlementValueCache = self->_entitlementValueCache;
      self->_entitlementValueCache = v8;
    }
    audit_token_t token = v19;
    id v10 = SecTaskCreateWithAuditToken(0, &token);
    if (v10)
    {
      uint64_t v11 = v10;
      CFErrorRef error = 0;
      objc_super v7 = (void *)SecTaskCopyValueForEntitlement(v10, v4, &error);
      if (error)
      {
        int v12 = GEOGetAuditTokenLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          token.val[0] = 138412290;
          *(void *)&token.val[1] = error;
          _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Unable to get entitlements for peer. Error: %@", (uint8_t *)&token, 0xCu);
        }

        CFRelease(error);
      }
      CFRelease(v11);
      if (v7)
      {
        [(NSMutableDictionary *)self->_entitlementValueCache setObject:v7 forKey:v4];
        uint64_t v6 = v7;
LABEL_19:
        id v16 = v7;

        goto LABEL_20;
      }
    }
    else
    {
      v13 = GEOGetAuditTokenLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(token.val[0]) = 0;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Unable to create security task from audit token", (uint8_t *)&token, 2u);
      }
    }
    int v14 = self->_entitlementValueCache;
    __int16 v15 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableDictionary *)v14 setObject:v15 forKey:v4];

    objc_super v7 = 0;
    uint64_t v6 = 0;
    goto LABEL_19;
  }
  id v16 = 0;
LABEL_20:

  return v16;
}

+ (id)currentProcessAuditToken
{
  if (qword_1EB2A06F0 != -1) {
    dispatch_once(&qword_1EB2A06F0, &__block_literal_global_195);
  }
  v2 = (void *)_MergedGlobals_331;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementValueCache, 0);
  objc_storeStrong((id *)&self->_overrideOfflineCohortId, 0);
  objc_storeStrong((id *)&self->_secondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedNetworkAttributionBundleId, 0);
  objc_storeStrong((id *)&self->_resolvedBundleId, 0);
  objc_storeStrong((id *)&self->_proxiedBundleId, 0);
  objc_storeStrong((id *)&self->_tokenData, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_tokenData forKey:@"tokenData"];
  [v5 encodeObject:self->_proxiedBundleId forKey:@"bundleId"];
  if (self->_proxiedBundleId) {
    [v5 encodeBool:self->_proxiedExternalBundleId forKey:@"externalBundleId"];
  }
  overrideOfflineCohortId = self->_overrideOfflineCohortId;
  if (overrideOfflineCohortId) {
    [v5 encodeObject:overrideOfflineCohortId forKey:@"offlineCohortId"];
  }
}

- (id)publicLogDescription
{
  uint64_t v3 = @" (ext)";
  if (!self->_proxiedExternalBundleId) {
    uint64_t v3 = &stru_1ED51F370;
  }
  id v4 = NSString;
  proxiedBundleId = self->_proxiedBundleId;
  uint64_t v6 = v3;
  objc_super v7 = [(GEOApplicationAuditToken *)self bundleId];
  long long v8 = [v4 stringWithFormat:@"ProxiedBundleId: %@%@, BundleId:%@, TokenData: %@", proxiedBundleId, v6, v7, self->_tokenData];

  return v8;
}

+ (id)compositeTokenForTokens:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    if ((unint64_t)[v3 count] <= 1)
    {
      int v12 = [v3 anyObject];
    }
    else
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleId", (void)v14);
            if ([v10 length]) {
              [v4 addObject:v10];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }

      uint64_t v11 = [v4 componentsJoinedByString:@"|"];
      int v12 = [[GEOApplicationAuditToken alloc] initWithProxiedApplicationBundleId:v11];
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (GEOApplicationAuditToken)initWithProxiedExternalApplicationBundleId:(id)a3
{
  id v4 = a3;
  [v4 length];
  id v5 = [(GEOApplicationAuditToken *)self initCommon];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    proxiedBundleId = v5->_proxiedBundleId;
    v5->_proxiedBundleId = (NSString *)v6;

    v5->_proxiedExternalBundleId = 1;
    uint64_t v8 = v5;
  }

  return v5;
}

void __52__GEOApplicationAuditToken_currentProcessAuditToken__block_invoke()
{
  *(_OWORD *)task_info_out = 0u;
  long long v6 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  if (!task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt))
  {
    v0 = [GEOApplicationAuditToken alloc];
    v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:task_info_out length:32];
    uint64_t v2 = [(GEOApplicationAuditToken *)v0 initWithAuditTokenData:v1];
    id v3 = (void *)_MergedGlobals_331;
    _MergedGlobals_331 = v2;
  }
}

- (GEOApplicationAuditToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOApplicationAuditToken *)self initCommon];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenData"];
    tokenData = v5->_tokenData;
    v5->_tokenData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    proxiedBundleId = v5->_proxiedBundleId;
    v5->_proxiedBundleId = (NSString *)v8;

    if (v5->_proxiedBundleId) {
      v5->_proxiedExternalBundleId = [v4 decodeBoolForKey:@"externalBundleId"];
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offlineCohortId"];
    overrideOfflineCohortId = v5->_overrideOfflineCohortId;
    v5->_overrideOfflineCohortId = (NSString *)v10;

    int v12 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[GEOApplicationAuditToken alloc] initCommon];
  if (v4)
  {
    uint64_t v5 = [(NSData *)self->_tokenData copy];
    uint64_t v6 = (void *)v4[2];
    v4[2] = v5;

    *((unsigned char *)v4 + 24) = self->_proxiedExternalBundleId;
    uint64_t v7 = [(NSString *)self->_proxiedBundleId copy];
    uint64_t v8 = (void *)v4[4];
    v4[4] = v7;

    uint64_t v9 = [(NSString *)self->_secondaryIdentifier copy];
    uint64_t v10 = (void *)v4[7];
    v4[7] = v9;

    uint64_t v11 = [(NSString *)self->_overrideOfflineCohortId copy];
    int v12 = (void *)v4[8];
    v4[8] = v11;

    v13 = v4;
  }

  return v4;
}

- (GEOApplicationAuditToken)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(GEOApplicationAuditToken *)self initCommon];
  if (v6)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v5, "token", &length);
    if (data)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      tokenData = v6->_tokenData;
      v6->_tokenData = (NSData *)v8;
    }
    string = xpc_dictionary_get_string(v5, "bundle_id");
    if (string)
    {
      uint64_t v11 = [NSString stringWithUTF8String:string];
      proxiedBundleId = v6->_proxiedBundleId;
      v6->_proxiedBundleId = (NSString *)v11;

      if (v6->_proxiedBundleId) {
        v6->_proxiedExternalBundleId = xpc_dictionary_get_BOOL(v5, "ext_bundle_id");
      }
    }
    v13 = xpc_dictionary_get_string(v5, "offline_cohort_id");
    if (v13)
    {
      uint64_t v14 = [NSString stringWithUTF8String:v13];
      overrideOfflineCohortId = v6->_overrideOfflineCohortId;
      v6->_overrideOfflineCohortId = (NSString *)v14;
    }
    long long v16 = v6;
  }

  return v6;
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  tokenData = self->_tokenData;
  if (tokenData) {
    xpc_dictionary_set_data(xdict, "token", [(NSData *)tokenData bytes], [(NSData *)self->_tokenData length]);
  }
  proxiedBundleId = self->_proxiedBundleId;
  if (proxiedBundleId)
  {
    xpc_dictionary_set_string(xdict, "bundle_id", [(NSString *)proxiedBundleId UTF8String]);
    xpc_dictionary_set_BOOL(xdict, "ext_bundle_id", self->_proxiedExternalBundleId);
  }
  overrideOfflineCohortId = self->_overrideOfflineCohortId;
  if (overrideOfflineCohortId) {
    xpc_dictionary_set_string(xdict, "offline_cohort_id", [(NSString *)overrideOfflineCohortId UTF8String]);
  }
}

- (GEOApplicationAuditToken)initWithProxiedApplicationBundleId:(id)a3
{
  id v4 = a3;
  [v4 length];
  id v5 = [(GEOApplicationAuditToken *)self initCommon];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    proxiedBundleId = v5->_proxiedBundleId;
    v5->_proxiedBundleId = (NSString *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (id)overrideTokenWithProxiedBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GEOApplicationAuditToken *)self copy];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uint64_t v7 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v6;

    *(unsigned char *)(v5 + 24) = 0;
    id v8 = (id)v5;
  }

  return (id)v5;
}

- (GEOApplicationAuditToken)initWithSecondaryIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length] && (self = -[GEOApplicationAuditToken initCommon](self, "initCommon")) != 0)
  {
    uint64_t v5 = (NSString *)[v4 copy];
    secondaryIdentifier = self->_secondaryIdentifier;
    self->_secondaryIdentifier = v5;

    self = self;
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  if (self->_proxiedExternalBundleId) {
    id v3 = @" (ext)";
  }
  else {
    id v3 = &stru_1ED51F370;
  }
  id v4 = NSString;
  uint64_t v5 = v3;
  uint64_t v6 = objc_opt_class();
  proxiedBundleId = self->_proxiedBundleId;
  id v8 = [(GEOApplicationAuditToken *)self bundleId];
  uint64_t v9 = [v4 stringWithFormat:@"<%@: %p> %@%@, %@, %@", v6, self, proxiedBundleId, v5, v8, self->_tokenData];

  return (NSString *)v9;
}

- (GEOApplicationAuditToken)init
{
  return 0;
}

- (id)bundleIdForNetworkAttribution
{
  if ([(NSString *)self->_proxiedBundleId length])
  {
    id v3 = self->_proxiedBundleId;
  }
  else
  {
    uint64_t v6 = self->_isolater;
    _geo_isolate_lock_data();
    id v4 = [(GEOApplicationAuditToken *)self _bundleIdForAuditToken];
    id v3 = self->_resolvedNetworkAttributionBundleId;

    _geo_isolate_unlock();
  }

  return v3;
}

- (id)overrideTokenWithOfflineCohortId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(GEOApplicationAuditToken *)self copy];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uint64_t v7 = (void *)v5[8];
    v5[8] = v6;

    id v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = (NSString **)v4;
      tokenData = self->_tokenData;
      if (tokenData == (NSData *)v5[2] || -[NSData isEqualToData:](tokenData, "isEqualToData:"))
      {
        proxiedBundleId = self->_proxiedBundleId;
        if (proxiedBundleId == v5[4]) {
          goto LABEL_8;
        }
        if (-[NSString isEqualToString:](proxiedBundleId, "isEqualToString:"))
        {
          proxiedBundleId = self->_proxiedBundleId;
LABEL_8:
          if (proxiedBundleId) {
            BOOL v8 = self->_proxiedExternalBundleId == *((unsigned __int8 *)v5 + 24);
          }
          else {
            BOOL v8 = 1;
          }
          goto LABEL_13;
        }
      }
      BOOL v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  BOOL v8 = 0;
LABEL_14:

  return v8;
}

- (BOOL)isProxiedExternalBundleId
{
  return self->_proxiedExternalBundleId;
}

- (GEOApplicationAuditToken)initWithNSXPCConnection:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "auditToken", 0, 0, 0, 0);
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v7 length:32];
    self = [(GEOApplicationAuditToken *)self initWithAuditTokenData:v4];

    uint64_t v5 = self;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)valuesForEntitlement:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(GEOApplicationAuditToken *)self valueForEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_msgSend(v3, "_geo_filtered:", &__block_literal_global_148);
LABEL_5:
    uint64_t v5 = (void *)v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    goto LABEL_5;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  return v6;
}

uint64_t __63__GEOApplicationAuditToken_Entitlements__valuesForEntitlement___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end