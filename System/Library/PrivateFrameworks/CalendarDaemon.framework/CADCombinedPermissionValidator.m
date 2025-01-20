@interface CADCombinedPermissionValidator
- (BOOL)allowsCustomDatabasePath;
- (BOOL)allowsIntegrations;
- (BOOL)canAccessDatabaseBookmarks;
- (BOOL)canMakeSpotlightChanges;
- (BOOL)canModifyBirthdayCalendar;
- (BOOL)canModifyCalendarDatabase;
- (BOOL)canModifySuggestedEventCalendar;
- (BOOL)canRequestDiagnostics;
- (BOOL)hasCalendarTCCBypassEntitlement;
- (BOOL)hasCalendarToolEntitlement;
- (BOOL)hasChangeIdTrackingOverrideEntitlement;
- (BOOL)hasManagedConfigurationBundleIDOverrideEntitlement;
- (BOOL)hasNotificationCountEntitlement;
- (BOOL)hasReminderAccess;
- (BOOL)hasSyncClientEntitlement;
- (BOOL)internalAccessLevelGranted;
- (BOOL)isCalendarDaemon;
- (BOOL)isCalendarWidgetExtension;
- (BOOL)isFirstPartyCalendarApp;
- (BOOL)isRemoteUIExtension;
- (BOOL)shouldTrustClientEnforcedManagedConfigurationAccess;
- (BOOL)storageManagementAccessGranted;
- (BOOL)testingAccessLevelGranted;
- (CADCombinedPermissionValidator)initWithPermissionValidator:(id)a3 andValidator:(id)a4;
- (int)eventAccessLevel;
- (int64_t)eventAuthorization;
- (int64_t)remindersAuthorization;
@end

@implementation CADCombinedPermissionValidator

- (CADCombinedPermissionValidator)initWithPermissionValidator:(id)a3 andValidator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CADCombinedPermissionValidator;
  v9 = [(CADCombinedPermissionValidator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_validator1, a3);
    objc_storeStrong((id *)&v10->_validator2, a4);
  }

  return v10;
}

- (int64_t)eventAuthorization
{
  uint64_t v3 = [(CADPermissionValidator *)self->_validator1 eventAuthorization];
  uint64_t v4 = [(CADPermissionValidator *)self->_validator2 eventAuthorization];
  return _minimumAuthStatus(v3, v4);
}

- (int64_t)remindersAuthorization
{
  uint64_t v3 = [(CADPermissionValidator *)self->_validator1 remindersAuthorization];
  uint64_t v4 = [(CADPermissionValidator *)self->_validator2 remindersAuthorization];
  return _minimumAuthStatus(v3, v4);
}

- (int)eventAccessLevel
{
  uint64_t v2 = [(CADCombinedPermissionValidator *)self eventAuthorization];
  return CADEventAccessTypeFromAuthStatus(v2);
}

- (BOOL)hasReminderAccess
{
  return [(CADCombinedPermissionValidator *)self remindersAuthorization] == 3;
}

- (BOOL)isFirstPartyCalendarApp
{
  int v3 = [(CADPermissionValidator *)self->_validator1 isFirstPartyCalendarApp];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 isFirstPartyCalendarApp];
  }
  return v3;
}

- (BOOL)isCalendarDaemon
{
  int v3 = [(CADPermissionValidator *)self->_validator1 isCalendarDaemon];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 isCalendarDaemon];
  }
  return v3;
}

- (BOOL)isRemoteUIExtension
{
  int v3 = [(CADPermissionValidator *)self->_validator1 isRemoteUIExtension];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 isRemoteUIExtension];
  }
  return v3;
}

- (BOOL)isCalendarWidgetExtension
{
  int v3 = [(CADPermissionValidator *)self->_validator1 isCalendarWidgetExtension];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 isCalendarWidgetExtension];
  }
  return v3;
}

- (BOOL)canAccessDatabaseBookmarks
{
  int v3 = [(CADPermissionValidator *)self->_validator1 canAccessDatabaseBookmarks];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 canAccessDatabaseBookmarks];
  }
  return v3;
}

- (BOOL)canModifySuggestedEventCalendar
{
  int v3 = [(CADPermissionValidator *)self->_validator1 canModifySuggestedEventCalendar];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 canModifySuggestedEventCalendar];
  }
  return v3;
}

- (BOOL)canMakeSpotlightChanges
{
  int v3 = [(CADPermissionValidator *)self->_validator1 canMakeSpotlightChanges];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 canMakeSpotlightChanges];
  }
  return v3;
}

- (BOOL)canModifyBirthdayCalendar
{
  int v3 = [(CADPermissionValidator *)self->_validator1 canModifyBirthdayCalendar];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 canModifyBirthdayCalendar];
  }
  return v3;
}

- (BOOL)canRequestDiagnostics
{
  int v3 = [(CADPermissionValidator *)self->_validator1 canRequestDiagnostics];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 canRequestDiagnostics];
  }
  return v3;
}

- (BOOL)canModifyCalendarDatabase
{
  int v3 = [(CADPermissionValidator *)self->_validator1 canModifyCalendarDatabase];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 canModifyCalendarDatabase];
  }
  return v3;
}

- (BOOL)testingAccessLevelGranted
{
  int v3 = [(CADPermissionValidator *)self->_validator1 testingAccessLevelGranted];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 testingAccessLevelGranted];
  }
  return v3;
}

- (BOOL)internalAccessLevelGranted
{
  int v3 = [(CADPermissionValidator *)self->_validator1 internalAccessLevelGranted];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 internalAccessLevelGranted];
  }
  return v3;
}

- (BOOL)storageManagementAccessGranted
{
  int v3 = [(CADPermissionValidator *)self->_validator1 storageManagementAccessGranted];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 storageManagementAccessGranted];
  }
  return v3;
}

- (BOOL)hasSyncClientEntitlement
{
  int v3 = [(CADPermissionValidator *)self->_validator1 hasSyncClientEntitlement];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 hasSyncClientEntitlement];
  }
  return v3;
}

- (BOOL)hasCalendarToolEntitlement
{
  int v3 = [(CADPermissionValidator *)self->_validator1 hasCalendarToolEntitlement];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 hasCalendarToolEntitlement];
  }
  return v3;
}

- (BOOL)hasChangeIdTrackingOverrideEntitlement
{
  int v3 = [(CADPermissionValidator *)self->_validator1 hasChangeIdTrackingOverrideEntitlement];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 hasChangeIdTrackingOverrideEntitlement];
  }
  return v3;
}

- (BOOL)hasNotificationCountEntitlement
{
  int v3 = [(CADPermissionValidator *)self->_validator1 hasNotificationCountEntitlement];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 hasNotificationCountEntitlement];
  }
  return v3;
}

- (BOOL)hasManagedConfigurationBundleIDOverrideEntitlement
{
  int v3 = [(CADPermissionValidator *)self->_validator1 hasManagedConfigurationBundleIDOverrideEntitlement];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 hasManagedConfigurationBundleIDOverrideEntitlement];
  }
  return v3;
}

- (BOOL)shouldTrustClientEnforcedManagedConfigurationAccess
{
  int v3 = [(CADPermissionValidator *)self->_validator1 shouldTrustClientEnforcedManagedConfigurationAccess];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 shouldTrustClientEnforcedManagedConfigurationAccess];
  }
  return v3;
}

- (BOOL)allowsCustomDatabasePath
{
  int v3 = [(CADPermissionValidator *)self->_validator1 allowsCustomDatabasePath];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 allowsCustomDatabasePath];
  }
  return v3;
}

- (BOOL)allowsIntegrations
{
  int v3 = [(CADPermissionValidator *)self->_validator1 allowsIntegrations];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 allowsIntegrations];
  }
  return v3;
}

- (BOOL)hasCalendarTCCBypassEntitlement
{
  int v3 = [(CADPermissionValidator *)self->_validator1 hasCalendarTCCBypassEntitlement];
  if (v3)
  {
    validator2 = self->_validator2;
    LOBYTE(v3) = [(CADPermissionValidator *)validator2 hasCalendarTCCBypassEntitlement];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator2, 0);
  objc_storeStrong((id *)&self->_validator1, 0);
}

@end