@interface _HKEntitlements
+ (id)_allowedEntitlementsSet;
+ (id)_containerAppExtensionEntitlementsForCurrentTask;
+ (id)_entitlementsWithSecTask:(__SecTask *)a3 valueOverrides:(id)a4 error:(id *)a5;
+ (id)entitlementsForCurrentTaskWithError:(id *)a3;
+ (id)entitlementsWithApplicationIdentifier:(id)a3;
+ (id)entitlementsWithConnection:(id)a3 error:(id *)a4;
+ (id)entitlementsWithDictionary:(id)a3;
+ (void)_setEntitlementsForCurrentTask:(id)a3;
- (BOOL)arrayEntitlement:(id)a3 containsString:(id)a4;
- (BOOL)hasAccessEntitlementWithIdentifier:(id)a3;
- (BOOL)hasBackgroundDeliveryAPIAccess;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasPrivateAccessEntitlementWithIdentifier:(id)a3;
- (BOOL)hasPrivateMetadataAccess;
- (NSDictionary)entitlementValues;
- (_HKEntitlements)init;
- (id)_initWithEntitlementValues:(id)a3;
- (id)_typesFromIdentifierArray:(id)a3;
- (id)applicationIdentifier;
- (id)description;
- (id)stringForEntitlement:(id)a3;
- (id)typesForReadAuthorizationBypass;
- (id)typesForReadAuthorizationOverride;
- (id)typesForWriteAuthorizationOverride;
- (id)valueForEntitlement:(id)a3;
@end

@implementation _HKEntitlements

- (id)valueForEntitlement:(id)a3
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() _allowedEntitlementsSet];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_HKEntitlements.m", 238, @"Entitlement key %@ must be in the set of allowlisted entitlement keys", v5 object file lineNumber description];
  }
  v8 = [(NSDictionary *)self->_entitlementValues objectForKeyedSubscript:v5];

  return v8;
}

+ (id)_allowedEntitlementsSet
{
  if (_allowedEntitlementsSet_onceToken != -1) {
    dispatch_once(&_allowedEntitlementsSet_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)_allowedEntitlementsSet_entitlementKeySet;

  return v2;
}

+ (id)entitlementsWithConnection:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"_HKEntitlements.m", 97, @"Invalid parameter not satisfying: %@", @"connection != nil" object file lineNumber description];

    memset(&token, 0, sizeof(token));
  }
  SecTaskRef v9 = SecTaskCreateWithAuditToken(0, &token);
  if (v9)
  {
    SecTaskRef v10 = v9;
    if (objc_msgSend(v8, "hk_isAppExtension"))
    {
      v11 = objc_msgSend(MEMORY[0x1E4F223F0], "hk_appExtensionContainerBundleForConnection:", v8);
      if (v11)
      {
        v12 = [a1 _allowedEntitlementsSet];
        v13 = [v11 entitlementValuesForKeys:v12];
        v14 = [v13 rawValues];
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    v15 = [a1 _entitlementsWithSecTask:v10 valueOverrides:v14 error:a4];
    CFRelease(v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 100, @"Unable to retrieve remote task for entitlement lookup.");
    v15 = 0;
  }

  return v15;
}

+ (id)_entitlementsWithSecTask:(__SecTask *)a3 valueOverrides:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  CFErrorRef error = 0;
  SecTaskRef v9 = [a1 _allowedEntitlementsSet];
  CFArrayRef v10 = [v9 allObjects];

  CFDictionaryRef v11 = SecTaskCopyValuesForEntitlements(a3, v10, &error);
  v12 = (void *)[(__CFDictionary *)v11 mutableCopy];

  CFErrorRef v13 = error;
  if (v12)
  {
    CFErrorRef v25 = error;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    CFArrayRef v14 = v10;
    uint64_t v15 = [(__CFArray *)v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v20 = [v8 objectForKeyedSubscript:v19];
          if (v20) {
            [v12 setObject:v20 forKeyedSubscript:v19];
          }
        }
        uint64_t v16 = [(__CFArray *)v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v16);
    }

    v21 = (void *)[objc_alloc((Class)a1) _initWithEntitlementValues:v12];
    CFErrorRef v13 = v25;
  }
  else
  {
    v22 = error;
    v23 = v22;
    if (v22)
    {
      if (a5) {
        *a5 = v22;
      }
      else {
        _HKLogDroppedError(v22);
      }
    }

    v21 = 0;
  }

  return v21;
}

- (id)_initWithEntitlementValues:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HKEntitlements;
  id v5 = [(_HKEntitlements *)&v14 init];
  if (v5)
  {
    v6 = [(id)objc_opt_class() _allowedEntitlementsSet];
    uint64_t v7 = objc_msgSend(v4, "hk_filteredDictionaryForKeys:", v6);
    entitlementValues = v5->_entitlementValues;
    v5->_entitlementValues = (NSDictionary *)v7;

    SecTaskRef v9 = [v4 objectForKeyedSubscript:@"application-identifier"];
    CFArrayRef v10 = v9;
    if (v9)
    {
      if ([v9 hasPrefix:@"appshack."])
      {
        uint64_t v11 = [v10 substringFromIndex:objc_msgSend(@"appshack.", "length")];
        applicationIdentifier = v5->_applicationIdentifier;
        v5->_applicationIdentifier = (NSString *)v11;
      }
      else
      {
        CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
      }
    }
  }
  return v5;
}

- (id)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (BOOL)hasEntitlement:(id)a3
{
  v3 = [(_HKEntitlements *)self valueForEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)stringForEntitlement:(id)a3
{
  v3 = [(_HKEntitlements *)self valueForEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)entitlementsWithApplicationIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  SecTaskRef v9 = @"application-identifier";
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  uint64_t v7 = [a1 entitlementsWithDictionary:v6];

  return v7;
}

+ (id)entitlementsWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _initWithEntitlementValues:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementValues, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

+ (id)entitlementsForCurrentTaskWithError:(id *)a3
{
  if (_currentTaskEntitlementsOverride)
  {
    id v3 = (id)_currentTaskEntitlementsOverride;
  }
  else
  {
    SecTaskRef v6 = SecTaskCreateFromSelf(0);
    if (v6)
    {
      SecTaskRef v7 = v6;
      id v8 = [a1 _containerAppExtensionEntitlementsForCurrentTask];
      id v3 = [a1 _entitlementsWithSecTask:v7 valueOverrides:v8 error:a3];
      CFRelease(v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 100, @"Unable to retrieve current task for entitlement lookup.");
      id v3 = 0;
    }
  }

  return v3;
}

+ (id)_containerAppExtensionEntitlementsForCurrentTask
{
  if (_HKCurrentTaskIsAppExtension())
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_containerAppExtensionEntitlementsForCurrentTask__lock);
    if (!_containerAppExtensionEntitlementsForCurrentTask_currentTaskEntitlements)
    {
      dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
      id v3 = [HKEntitlementStore alloc];
      id v4 = objc_alloc_init(HKHealthStore);
      id v5 = [(HKEntitlementStore *)v3 initWithHealthStore:v4];

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67___HKEntitlements__containerAppExtensionEntitlementsForCurrentTask__block_invoke;
      v9[3] = &unk_1E58BF290;
      dispatch_semaphore_t v10 = v2;
      SecTaskRef v6 = v2;
      [(HKEntitlementStore *)v5 fetchContainerAppExtensionEntitlementsWithCompletion:v9];
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_containerAppExtensionEntitlementsForCurrentTask__lock);
    id v7 = (id)_containerAppExtensionEntitlementsForCurrentTask_currentTaskEntitlements;
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

+ (void)_setEntitlementsForCurrentTask:(id)a3
{
}

- (_HKEntitlements)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (BOOL)hasPrivateMetadataAccess
{
  if ([(_HKEntitlements *)self hasEntitlement:@"com.apple.private.healthkit"]) {
    return 1;
  }

  return [(_HKEntitlements *)self hasEntitlement:@"com.apple.private.healthkit.metadata.private"];
}

- (BOOL)hasBackgroundDeliveryAPIAccess
{
  return [(_HKEntitlements *)self hasEntitlement:@"com.apple.developer.healthkit.background-delivery"];
}

- (BOOL)arrayEntitlement:(id)a3 containsString:(id)a4
{
  id v6 = a4;
  id v7 = [(_HKEntitlements *)self valueForEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v8 = [v7 containsObject:v6];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)hasAccessEntitlementWithIdentifier:(id)a3
{
  return [(_HKEntitlements *)self arrayEntitlement:@"com.apple.developer.healthkit.access" containsString:a3];
}

- (BOOL)hasPrivateAccessEntitlementWithIdentifier:(id)a3
{
  return [(_HKEntitlements *)self arrayEntitlement:@"com.apple.private.healthkit.access" containsString:a3];
}

- (id)typesForWriteAuthorizationOverride
{
  id v3 = [(_HKEntitlements *)self valueForEntitlement:@"com.apple.private.healthkit.write_authorization_override"];
  uint64_t v4 = [(_HKEntitlements *)self _typesFromIdentifierArray:v3];

  return v4;
}

- (id)typesForReadAuthorizationOverride
{
  id v3 = [(_HKEntitlements *)self valueForEntitlement:@"com.apple.private.healthkit.read_authorization_override"];
  uint64_t v4 = [(_HKEntitlements *)self _typesFromIdentifierArray:v3];

  return v4;
}

- (id)typesForReadAuthorizationBypass
{
  id v3 = [(_HKEntitlements *)self valueForEntitlement:@"com.apple.private.healthkit.read_authorization_bypass"];
  uint64_t v4 = [(_HKEntitlements *)self _typesFromIdentifierArray:v3];

  return v4;
}

- (id)_typesFromIdentifierArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = +[HKObjectType _typeWithIdentifier:](HKObjectType, "_typeWithIdentifier:", v11, (void)v14);
            if (v12) {
              [v5 addObject:v12];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v5;
}

- (id)description
{
  return [(NSDictionary *)self->_entitlementValues description];
}

- (NSDictionary)entitlementValues
{
  return self->_entitlementValues;
}

@end