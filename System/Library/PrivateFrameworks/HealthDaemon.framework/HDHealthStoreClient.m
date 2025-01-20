@interface HDHealthStoreClient
- (BOOL)_isAuthorizedToAccessProfile:(id)a3;
- (BOOL)hasArrayEntitlement:(id)a3 containing:(id)a4;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasPrivateMetadataAccess;
- (BOOL)hasRequiredArrayEntitlement:(id)a3 containing:(id)a4 error:(id *)a5;
- (BOOL)hasRequiredEntitlement:(id)a3 error:(id *)a4;
- (BOOL)shouldBypassAuthorization;
- (BOOL)verifyHealthRecordsPermissionGrantedWithError:(id *)a3;
- (HDClientAuthorizationOracle)authorizationOracle;
- (HDHealthStoreClient)initWithXPCClient:(id)a3 configuration:(id)a4 profile:(id)a5 databaseAccessibilityAssertions:(id)a6;
- (HDProfile)profile;
- (HDXPCClient)XPCClient;
- (HDXPCProcess)process;
- (HKHealthStoreConfiguration)configuration;
- (NSString)defaultSourceBundleIdentifier;
- (NSString)sourceBundleIdentifier;
- (NSString)sourceVersion;
- (NSXPCConnection)connection;
- (_HKEntitlements)entitlements;
- (_TtC12HealthDaemon29HDHealthStoreClientAssertions)databaseAccessibilityAssertions;
- (id)accessibilityAssertions;
- (id)assertionForHKDatabaseAccessibilityAssertion:(id)a3;
- (id)baseDataEntityEncodingOptions;
- (id)filterWithQueryFilter:(id)a3 objectType:(id)a4;
- (id)firstAssertion;
- (id)valueForEntitlement:(id)a3;
- (void)addAssertionMapping:(id)a3;
- (void)invalidateAssertions;
- (void)removeAssertionMappingForAssertion:(id)a3;
@end

@implementation HDHealthStoreClient

- (HDHealthStoreClient)initWithXPCClient:(id)a3 configuration:(id)a4 profile:(id)a5 databaseAccessibilityAssertions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v38.receiver = self;
  v38.super_class = (Class)HDHealthStoreClient;
  v15 = [(HDHealthStoreClient *)&v38 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_XPCClient, a3);
    objc_storeStrong((id *)&v16->_profile, a5);
    uint64_t v17 = [v12 copy];
    configuration = v16->_configuration;
    v16->_configuration = (HKHealthStoreConfiguration *)v17;

    objc_storeStrong((id *)&v16->_databaseAccessibilityAssertions, a6);
    authorizationOracle = v16->_authorizationOracle;
    v16->_authorizationOracle = 0;

    v16->_propertyLock._os_unfair_lock_opaque = 0;
    v20 = [v11 process];
    v21 = (void *)MEMORY[0x1E4F2B560];
    v22 = [v20 entitlements];
    v23 = [v20 bundleIdentifier];
    uint64_t v24 = objc_msgSend(v21, "_sourceBundleIdentifierWithEntitlements:processBundleIdentifier:isExtension:", v22, v23, objc_msgSend(v20, "isExtension"));
    defaultSourceBundleIdentifier = v16->_defaultSourceBundleIdentifier;
    v16->_defaultSourceBundleIdentifier = (NSString *)v24;

    v26 = [v12 sourceBundleIdentifier];

    if (v26)
    {
      v27 = [v12 sourceBundleIdentifier];
      uint64_t v28 = [v27 copy];
      sourceBundleIdentifier = v16->_sourceBundleIdentifier;
      v16->_sourceBundleIdentifier = (NSString *)v28;
    }
    else
    {
      v30 = v16->_defaultSourceBundleIdentifier;
      v27 = v16->_sourceBundleIdentifier;
      v16->_sourceBundleIdentifier = v30;
    }

    if ([v20 hasEntitlement:*MEMORY[0x1E4F296D8]])
    {
      v31 = [v13 daemon];
      v32 = [v31 behavior];
      v33 = [v32 currentOSVersion];
    }
    else
    {
      v31 = [v12 sourceVersion];
      uint64_t v34 = [v31 copy];
      v32 = (void *)v34;
      v35 = &stru_1F1728D60;
      if (v34) {
        v35 = (__CFString *)v34;
      }
      v33 = v35;
    }
    sourceVersion = v16->_sourceVersion;
    v16->_sourceVersion = &v33->isa;
  }
  return v16;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)[(HDXPCClient *)self->_XPCClient connection];
}

- (HDXPCProcess)process
{
  return (HDXPCProcess *)[(HDXPCClient *)self->_XPCClient process];
}

- (_HKEntitlements)entitlements
{
  v2 = [(HDHealthStoreClient *)self process];
  v3 = [v2 entitlements];

  return (_HKEntitlements *)v3;
}

- (BOOL)hasRequiredEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDHealthStoreClient *)self process];
  LOBYTE(a4) = [v7 hasRequiredEntitlement:v6 error:a4];

  return (char)a4;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(HDHealthStoreClient *)self process];
  char v6 = [v5 hasEntitlement:v4];

  return v6;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(HDHealthStoreClient *)self process];
  char v6 = [v5 valueForEntitlement:v4];

  return v6;
}

- (BOOL)hasRequiredArrayEntitlement:(id)a3 containing:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(HDHealthStoreClient *)self process];
  LOBYTE(a5) = [v10 hasRequiredArrayEntitlement:v9 containing:v8 error:a5];

  return (char)a5;
}

- (BOOL)hasArrayEntitlement:(id)a3 containing:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HDHealthStoreClient *)self process];
  char v9 = [v8 hasArrayEntitlement:v7 containing:v6];

  return v9;
}

- (BOOL)shouldBypassAuthorization
{
  v2 = [(HDHealthStoreClient *)self process];
  char v3 = [v2 hasEntitlement:*MEMORY[0x1E4F29728]];

  return v3;
}

- (BOOL)hasPrivateMetadataAccess
{
  char v3 = [(HDHealthStoreClient *)self process];
  if ([v3 hasEntitlement:*MEMORY[0x1E4F2A550]])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(HDHealthStoreClient *)self process];
    char v4 = [v5 hasEntitlement:*MEMORY[0x1E4F2A548]];
  }
  return v4;
}

- (BOOL)verifyHealthRecordsPermissionGrantedWithError:(id *)a3
{
  if ([(HDHealthStoreClient *)self hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:a3])
  {
    return 1;
  }
  v5 = [(HDHealthStoreClient *)self entitlements];
  uint64_t v6 = *MEMORY[0x1E4F29E28];
  char v7 = [v5 hasAccessEntitlementWithIdentifier:*MEMORY[0x1E4F29E28]];

  if (v7) {
    return 1;
  }
  id v8 = [(HDHealthStoreClient *)self entitlements];
  char v9 = [v8 hasPrivateAccessEntitlementWithIdentifier:*MEMORY[0x1E4F2A530]];

  if (v9) {
    return 1;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 4, @"Missing %@ entitlement.", v6);
  return 0;
}

- (HDClientAuthorizationOracle)authorizationOracle
{
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock(&self->_propertyLock);
  if (!self->_authorizationOracle)
  {
    char v4 = [HDClientAuthorizationOracle alloc];
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    uint64_t v6 = [(HDHealthStoreClient *)self process];
    char v7 = [v6 entitlements];
    id v8 = [(HDHealthStoreClient *)self profile];
    char v9 = [(HDClientAuthorizationOracle *)v4 initWithSourceBundleIdentifier:sourceBundleIdentifier entitlements:v7 profile:v8];
    authorizationOracle = self->_authorizationOracle;
    self->_authorizationOracle = v9;
  }
  os_unfair_lock_unlock(p_propertyLock);
  id v11 = self->_authorizationOracle;

  return v11;
}

- (_TtC12HealthDaemon29HDHealthStoreClientAssertions)databaseAccessibilityAssertions
{
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock(&self->_propertyLock);
  if (!self->_databaseAccessibilityAssertions)
  {
    char v4 = objc_alloc_init(_TtC12HealthDaemon29HDHealthStoreClientAssertions);
    databaseAccessibilityAssertions = self->_databaseAccessibilityAssertions;
    self->_databaseAccessibilityAssertions = v4;
  }
  os_unfair_lock_unlock(p_propertyLock);
  uint64_t v6 = self->_databaseAccessibilityAssertions;

  return v6;
}

- (void)addAssertionMapping:(id)a3
{
  id v4 = a3;
  id v5 = [(HDHealthStoreClient *)self databaseAccessibilityAssertions];
  [v5 addAssertionMappingWithAssertion:v4];
}

- (void)removeAssertionMappingForAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [(HDHealthStoreClient *)self databaseAccessibilityAssertions];
  [v5 removeAssertionMappingWithAssertion:v4];

  uint64_t v6 = [(HDHealthStoreClient *)self accessibilityAssertions];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    databaseAccessibilityAssertions = self->_databaseAccessibilityAssertions;
    self->_databaseAccessibilityAssertions = 0;
  }
}

- (id)firstAssertion
{
  v2 = [(HDHealthStoreClient *)self databaseAccessibilityAssertions];
  char v3 = [v2 firstAssertion];

  return v3;
}

- (id)accessibilityAssertions
{
  v2 = [(HDHealthStoreClient *)self databaseAccessibilityAssertions];
  char v3 = [v2 accessibilityAssertions];

  return v3;
}

- (id)assertionForHKDatabaseAccessibilityAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [(HDHealthStoreClient *)self databaseAccessibilityAssertions];
  uint64_t v6 = [v5 assertionForHKDatabaseAccessibilityAssertionWithHkDatabaseAccessibilityAssertion:v4];

  return v6;
}

- (void)invalidateAssertions
{
  id v2 = [(HDHealthStoreClient *)self databaseAccessibilityAssertions];
  [v2 invalidateAssertions];
}

- (HDXPCClient)XPCClient
{
  return (HDXPCClient *)objc_getProperty(self, a2, 32, 1);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_getProperty(self, a2, 40, 1);
}

- (HKHealthStoreConfiguration)configuration
{
  return (HKHealthStoreConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)sourceBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)sourceVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)defaultSourceBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_XPCClient, 0);
  objc_storeStrong((id *)&self->_databaseAccessibilityAssertions, 0);

  objc_storeStrong((id *)&self->_authorizationOracle, 0);
}

- (id)filterWithQueryFilter:(id)a3 objectType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(HDHealthStoreClient *)self hasEntitlement:*MEMORY[0x1E4F2A548]])
  {
    if (v6) {
      [v8 addObject:v6];
    }
  }
  else
  {
    if (v6)
    {
      if (![(HDHealthStoreClient *)self hasPrivateMetadataAccess])
      {
        uint64_t v9 = [v6 filterIgnoringPrivateMetadata];

        id v6 = (id)v9;
      }
      [v8 addObject:v6];
    }
    v10 = [(HDHealthStoreClient *)self profile];
    id v11 = [v10 daemon];
    id v12 = [v11 behavior];
    int v13 = [v12 supportsSampleExpiration];

    if (v13)
    {
      if (self)
      {
        id v14 = (void *)MEMORY[0x1E4F1C9A8];
        id v15 = v7;
        v16 = [v14 currentCalendar];
        uint64_t v17 = *MEMORY[0x1E4F2AB00];
        v18 = [MEMORY[0x1E4F1C9C8] date];
        v19 = objc_msgSend(v16, "hk_startOfDateBySubtractingDays:fromDate:", v17, v18);

        v20 = (void *)MEMORY[0x1E4F2B960];
        v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];

        self = [v20 endDateFilterWithOperatorType:3 date:v19 dataTypes:v21];
      }
      [v8 addObject:self];
    }
  }
  if ((unint64_t)[v8 count] < 2) {
    [v8 firstObject];
  }
  else {
  v22 = [MEMORY[0x1E4F2B878] andFilterWithSubfilters:v8];
  }

  return v22;
}

- (id)baseDataEntityEncodingOptions
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(HDHealthStoreClient *)self hasPrivateMetadataAccess])
  {
    id v2 = 0;
  }
  else
  {
    id v4 = @"ExcludePrivateMetadata";
    v5[0] = MEMORY[0x1E4F1CC38];
    id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }

  return v2;
}

- (BOOL)_isAuthorizedToAccessProfile:(id)a3
{
  id v4 = a3;
  if ([(HDHealthStoreClient *)self hasEntitlement:*MEMORY[0x1E4F2A548]]
    || [v4 profileType] == 1)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v7 = [v4 profileIdentifier];
    uint64_t v8 = [v7 type];

    BOOL v5 = v8 == 100 && _HDIsUnitTesting != 0;
  }

  return v5;
}

@end