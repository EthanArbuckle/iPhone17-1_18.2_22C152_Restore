@interface CADDatabaseInitializationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowDelegateSources;
- (BOOL)allowIntegrations;
- (BOOL)enablePropertyModificationLogging;
- (BOOL)isEqualToOptions:(id)a3;
- (BOOL)unitTesting;
- (CADChangeTrackingClientId)changeTrackingClientId;
- (CADDatabaseInitializationOptions)init;
- (CADDatabaseInitializationOptions)initWithCoder:(id)a3;
- (CADMockPermissionValidator)mockPermissions;
- (CalCalendarDataContainerProvider)calendarDataContainerProvider;
- (ClientIdentity)remoteClientIdentity;
- (NSArray)allowedSourceIdentifiers;
- (NSString)managementBundleIdentifier;
- (NSURL)databaseDirectory;
- (OS_tcc_identity)privacyClientIdentity;
- (id)description;
- (id)validOptionsForConnection:(id)a3;
- (int)databaseInitOptions;
- (int)management;
- (void)encodeWithCoder:(id)a3;
- (void)purifyOptions;
- (void)setAllowDelegateSources:(BOOL)a3;
- (void)setAllowIntegrations:(BOOL)a3;
- (void)setAllowedSourceIdentifiers:(id)a3;
- (void)setCalendarDataContainerProvider:(id)a3;
- (void)setChangeTrackingClientId:(id)a3;
- (void)setDatabaseDirectory:(id)a3;
- (void)setDatabaseInitOptions:(int)a3;
- (void)setEnablePropertyModificationLogging:(BOOL)a3;
- (void)setManagement:(int)a3;
- (void)setManagementBundleIdentifier:(id)a3;
- (void)setMockPermissions:(id)a3;
- (void)setPrivacyClientIdentity:(id)a3;
- (void)setRemoteClientIdentity:(id)a3;
- (void)setUnitTesting:(BOOL)a3;
@end

@implementation CADDatabaseInitializationOptions

- (CADMockPermissionValidator)mockPermissions
{
  return self->_mockPermissions;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  [v12 encodeInt:self->_databaseInitOptions forKey:@"opts"];
  v4 = [(CADDatabaseInitializationOptions *)self changeTrackingClientId];
  [v12 encodeObject:v4 forKey:@"changeTrackingClientIdKey"];

  [v12 encodeBool:self->_enablePropertyModificationLogging forKey:@"log"];
  v5 = [(CADDatabaseInitializationOptions *)self databaseDirectory];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28FF8]);
    v7 = [(CADDatabaseInitializationOptions *)self databaseDirectory];
    v5 = (void *)[v6 initWithURL:v7 readonly:0];
  }
  [v12 encodeObject:v5 forKey:@"directory"];
  [v12 encodeObject:self->_calendarDataContainerProvider forKey:@"containerProvider"];
  [v12 encodeBool:self->_unitTesting forKey:@"test"];
  [v12 encodeBool:self->_allowDelegateSources forKey:@"dels"];
  [v12 encodeBool:self->_allowIntegrations forKey:@"allowIntegrations"];
  [v12 encodeInt:self->_management forKey:@"mgmt"];
  [v12 encodeObject:self->_managementBundleIdentifier forKey:@"managementBundleIDKey"];
  [v12 encodeObject:self->_allowedSourceIdentifiers forKey:@"allowedSourceIdentifiers"];
  [v12 encodeObject:self->_mockPermissions forKey:@"mockPermissions"];
  remoteClientIdentity = self->_remoteClientIdentity;
  if (remoteClientIdentity) {
    [v12 encodeObject:remoteClientIdentity forKey:@"remoteClientIdentity"];
  }
  if (self->_privacyClientIdentity)
  {
    v9 = (const void *)tcc_identity_copy_external_representation();
    if (v9)
    {
      v10 = v9;
      CFDataRef Data = CFPropertyListCreateData(0, v9, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      [v12 encodeObject:Data forKey:@"PrivacyClientIdentity"];
      CFRelease(v10);
    }
  }
}

- (NSURL)databaseDirectory
{
  return self->_databaseDirectory;
}

- (CalCalendarDataContainerProvider)calendarDataContainerProvider
{
  return self->_calendarDataContainerProvider;
}

- (void)purifyOptions
{
  if (([(CADDatabaseInitializationOptions *)self databaseInitOptions] & 0x20) != 0)
  {
    v3 = [(CADDatabaseInitializationOptions *)self databaseDirectory];
    v4 = [v3 relativeString];
    int v5 = [v4 isEqual:@":memory:"];

    if (v5)
    {
      [(CADDatabaseInitializationOptions *)self setDatabaseDirectory:0];
    }
  }
}

- (BOOL)isEqualToOptions:(id)a3
{
  v4 = a3;
  int v5 = v4;
  if (v4
    && self->_databaseInitOptions == *((_DWORD *)v4 + 3)
    && self->_enablePropertyModificationLogging == *((unsigned __int8 *)v4 + 8)
    && self->_unitTesting == *((unsigned __int8 *)v4 + 9)
    && self->_allowDelegateSources == *((unsigned __int8 *)v4 + 10)
    && self->_allowIntegrations == *((unsigned __int8 *)v4 + 11)
    && self->_management == *((_DWORD *)v4 + 4)
    && ((managementBundleIdentifier = self->_managementBundleIdentifier,
         !((unint64_t)managementBundleIdentifier | v5[4]))
     || -[NSString isEqual:](managementBundleIdentifier, "isEqual:"))
    && ((changeTrackingClientId = self->_changeTrackingClientId,
         changeTrackingClientId == (CADChangeTrackingClientId *)v5[3])
     || -[CADChangeTrackingClientId isEqualToChangeTrackingClientId:](changeTrackingClientId, "isEqualToChangeTrackingClientId:"))&& ((databaseDirectory = self->_databaseDirectory, databaseDirectory == (NSURL *)v5[5])|| -[NSURL isEqual:](databaseDirectory, "isEqual:"))&& ((calendarDataContainerProvider = self->_calendarDataContainerProvider, !((unint64_t)calendarDataContainerProvider | v5[6]))|| -[CalCalendarDataContainerProvider isEqual:](calendarDataContainerProvider, "isEqual:"))&& ((allowedSourceIdentifiers = self->_allowedSourceIdentifiers, !((unint64_t)allowedSourceIdentifiers | v5[7]))|| -[NSArray isEqual:](allowedSourceIdentifiers, "isEqual:"))&& ((privacyClientIdentity = self->_privacyClientIdentity, !((unint64_t)privacyClientIdentity | v5[8]))|| -[OS_tcc_identity isEqual:](privacyClientIdentity, "isEqual:"))&& ((mockPermissions = self->_mockPermissions, !((unint64_t)mockPermissions | v5[9]))|| -[CADMockPermissionValidator isEqual:](mockPermissions, "isEqual:")))
  {
    remoteClientIdentity = self->_remoteClientIdentity;
    if ((unint64_t)remoteClientIdentity | v5[10]) {
      char v14 = -[ClientIdentity isEqual:](remoteClientIdentity, "isEqual:");
    }
    else {
      char v14 = 1;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (int)databaseInitOptions
{
  return self->_databaseInitOptions;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (CADDatabaseInitializationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CADDatabaseInitializationOptions;
  int v5 = [(CADDatabaseInitializationOptions *)&v27 init];
  if (v5)
  {
    v5->_databaseInitOptions = [v4 decodeIntForKey:@"opts"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changeTrackingClientIdKey"];
    changeTrackingClientId = v5->_changeTrackingClientId;
    v5->_changeTrackingClientId = (CADChangeTrackingClientId *)v6;

    v5->_enablePropertyModificationLogging = [v4 decodeBoolForKey:@"log"];
    v5->_unitTesting = [v4 decodeBoolForKey:@"test"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"directory"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerProvider"];
    calendarDataContainerProvider = v5->_calendarDataContainerProvider;
    v5->_calendarDataContainerProvider = (CalCalendarDataContainerProvider *)v9;

    uint64_t v11 = [v8 url];
    databaseDirectory = v5->_databaseDirectory;
    v5->_databaseDirectory = (NSURL *)v11;

    v5->_allowDelegateSources = [v4 decodeBoolForKey:@"dels"];
    v5->_allowIntegrations = [v4 decodeBoolForKey:@"allowIntegrations"];
    v5->_management = [v4 decodeIntForKey:@"mgmt"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managementBundleIDKey"];
    managementBundleIdentifier = v5->_managementBundleIdentifier;
    v5->_managementBundleIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"allowedSourceIdentifiers"];
    allowedSourceIdentifiers = v5->_allowedSourceIdentifiers;
    v5->_allowedSourceIdentifiers = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mockPermissions"];
    mockPermissions = v5->_mockPermissions;
    v5->_mockPermissions = (CADMockPermissionValidator *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteClientIdentity"];
    remoteClientIdentity = v5->_remoteClientIdentity;
    v5->_remoteClientIdentity = (ClientIdentity *)v19;

    CFDataRef v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyClientIdentity"];
    if (v21)
    {
      CFPropertyListRef v22 = CFPropertyListCreateWithData(0, v21, 0, 0, 0);
      if (v22)
      {
        v23 = v22;
        uint64_t v24 = tcc_identity_create_from_external_representation();
        privacyClientIdentity = v5->_privacyClientIdentity;
        v5->_privacyClientIdentity = (OS_tcc_identity *)v24;

        CFRelease(v23);
      }
    }
  }
  return v5;
}

- (id)validOptionsForConnection:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init(CADDatabaseInitializationOptions);
  uint64_t v6 = [v4 permissionValidator];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [CADDefaultPermissionValidator alloc];
    v8 = [v4 identity];
    uint64_t v9 = [v4 tccPermissionChecker];
    uint64_t v10 = [(CADDefaultPermissionValidator *)v7 initWithClientIdentity:v8 tccPermissionChecker:v9];

    uint64_t v6 = (void *)v10;
  }
  int v11 = [v6 testingAccessLevelGranted];
  if (v11 && self->_mockPermissions)
  {
    id v12 = [[CADCombinedPermissionValidator alloc] initWithPermissionValidator:v6 andValidator:self->_mockPermissions];

    [(CADDatabaseInitializationOptions *)v5 setMockPermissions:self->_mockPermissions];
    uint64_t v6 = v12;
  }
  [(CADDatabaseInitializationOptions *)v5 setAllowDelegateSources:self->_allowDelegateSources];
  [(CADDatabaseInitializationOptions *)v5 setChangeTrackingClientId:self->_changeTrackingClientId];
  if ([v6 allowsIntegrations]) {
    [(CADDatabaseInitializationOptions *)v5 setAllowIntegrations:self->_allowIntegrations];
  }
  if ([v6 eventAccessLevel]
    || (v11 | [v6 hasReminderAccess]) == 1)
  {
    [(CADDatabaseInitializationOptions *)v5 setDatabaseInitOptions:self->_databaseInitOptions];
    [(CADDatabaseInitializationOptions *)v5 setEnablePropertyModificationLogging:self->_enablePropertyModificationLogging];
    [(CADDatabaseInitializationOptions *)v5 setManagement:self->_management];
    p_allowedSourceIdentifiers = &self->_allowedSourceIdentifiers;
LABEL_11:
    [(CADDatabaseInitializationOptions *)v5 setAllowedSourceIdentifiers:*p_allowedSourceIdentifiers];
    goto LABEL_12;
  }
  p_allowedSourceIdentifiers = &self->_allowedSourceIdentifiers;
  if (![(NSArray *)self->_allowedSourceIdentifiers count]) {
    goto LABEL_11;
  }
LABEL_12:
  if (v11)
  {
    [(CADDatabaseInitializationOptions *)v5 setUnitTesting:self->_unitTesting];
    [(CADDatabaseInitializationOptions *)v5 setCalendarDataContainerProvider:self->_calendarDataContainerProvider];
  }
  else if (![v6 allowsCustomDatabasePath])
  {
    goto LABEL_16;
  }
  [(CADDatabaseInitializationOptions *)v5 setDatabaseDirectory:self->_databaseDirectory];
LABEL_16:
  char v14 = [(CADDatabaseInitializationOptions *)self changeTrackingClientId];
  if ([(CADChangeTrackingClientId *)v14 hasCustomClientId])
  {
    char v15 = [v6 hasChangeIdTrackingOverrideEntitlement];

    if (v15) {
      goto LABEL_20;
    }
    char v14 = objc_alloc_init(CADChangeTrackingClientId);
    [(CADDatabaseInitializationOptions *)v5 setChangeTrackingClientId:v14];
  }

LABEL_20:
  if ([v6 isRemoteUIExtension]) {
    [(CADDatabaseInitializationOptions *)v5 setRemoteClientIdentity:self->_remoteClientIdentity];
  }
  if ([v6 hasManagedConfigurationBundleIDOverrideEntitlement]) {
    [(CADDatabaseInitializationOptions *)v5 setManagementBundleIdentifier:self->_managementBundleIdentifier];
  }
  if (_os_feature_enabled_impl() && self->_privacyClientIdentity)
  {
    v16 = [v4 identity];
    uint64_t v17 = v16;
    if (v16) {
      [v16 auditToken];
    }
    v18 = PAAuthenticatedClientIdentity();
    [(CADDatabaseInitializationOptions *)v5 setPrivacyClientIdentity:v18];
  }
  return v5;
}

- (id)description
{
  v16 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)CADDatabaseInitializationOptions;
  char v15 = [(CADDatabaseInitializationOptions *)&v17 description];
  uint64_t databaseInitOptions = self->_databaseInitOptions;
  v3 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_enablePropertyModificationLogging];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_unitTesting];
  changeTrackingClientId = self->_changeTrackingClientId;
  managementBundleIdentifier = self->_managementBundleIdentifier;
  databaseDirectory = self->_databaseDirectory;
  calendarDataContainerProvider = self->_calendarDataContainerProvider;
  uint64_t management = self->_management;
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_allowDelegateSources];
  int v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_allowIntegrations];
  id v12 = [v16 stringWithFormat:@"%@: {databaseInitOptions = %i, enablePropertyModificationLogging = %@, unitTesting = %@, management = %i, managementBundleID = %@, changeTrackingID = %@, databaseDirectory = %@, containerProvider = %@, allowDelegateSources: %@, allowIntegrations: %@, allowedSourceIdentifiers: %@, privacyClientIdentity: %@, mockPermissions: %@, remoteClientIdentity: %@}", v15, databaseInitOptions, v3, v4, management, managementBundleIdentifier, changeTrackingClientId, databaseDirectory, calendarDataContainerProvider, v10, v11, self->_allowedSourceIdentifiers, self->_privacyClientIdentity, self->_mockPermissions, self->_remoteClientIdentity];

  return v12;
}

- (void)setDatabaseInitOptions:(int)a3
{
  self->_uint64_t databaseInitOptions = a3;
}

- (void)setEnablePropertyModificationLogging:(BOOL)a3
{
  self->_enablePropertyModificationLogging = a3;
}

- (void)setChangeTrackingClientId:(id)a3
{
}

- (void)setAllowedSourceIdentifiers:(id)a3
{
}

- (void)setAllowDelegateSources:(BOOL)a3
{
  self->_allowDelegateSources = a3;
}

- (CADDatabaseInitializationOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)CADDatabaseInitializationOptions;
  v2 = [(CADDatabaseInitializationOptions *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_enablePropertyModificationLogging = 1;
    v2->_allowDelegateSources = 1;
    uint64_t v4 = objc_opt_new();
    changeTrackingClientId = v3->_changeTrackingClientId;
    v3->_changeTrackingClientId = (CADChangeTrackingClientId *)v4;
  }
  return v3;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (void)setDatabaseDirectory:(id)a3
{
}

- (void)setCalendarDataContainerProvider:(id)a3
{
}

- (void)setAllowIntegrations:(BOOL)a3
{
  self->_allowIntegrations = a3;
}

- (BOOL)enablePropertyModificationLogging
{
  return self->_enablePropertyModificationLogging;
}

- (CADChangeTrackingClientId)changeTrackingClientId
{
  return self->_changeTrackingClientId;
}

- (void)setManagement:(int)a3
{
  self->_uint64_t management = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)management
{
  return self->_management;
}

- (ClientIdentity)remoteClientIdentity
{
  return self->_remoteClientIdentity;
}

- (NSString)managementBundleIdentifier
{
  return self->_managementBundleIdentifier;
}

- (NSArray)allowedSourceIdentifiers
{
  return self->_allowedSourceIdentifiers;
}

- (BOOL)allowIntegrations
{
  return self->_allowIntegrations;
}

- (BOOL)allowDelegateSources
{
  return self->_allowDelegateSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteClientIdentity, 0);
  objc_storeStrong((id *)&self->_mockPermissions, 0);
  objc_storeStrong((id *)&self->_privacyClientIdentity, 0);
  objc_storeStrong((id *)&self->_allowedSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_calendarDataContainerProvider, 0);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
  objc_storeStrong((id *)&self->_managementBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_changeTrackingClientId, 0);
}

- (void)setManagementBundleIdentifier:(id)a3
{
}

- (OS_tcc_identity)privacyClientIdentity
{
  return self->_privacyClientIdentity;
}

- (void)setPrivacyClientIdentity:(id)a3
{
}

- (void)setMockPermissions:(id)a3
{
}

- (void)setRemoteClientIdentity:(id)a3
{
}

@end