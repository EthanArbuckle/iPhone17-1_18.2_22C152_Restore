@interface CADMockPermissionValidator
+ (BOOL)supportsSecureCoding;
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
- (CADMockPermissionValidator)init;
- (CADMockPermissionValidator)initWithCoder:(id)a3;
- (int)eventAccessLevel;
- (int64_t)eventAuthorization;
- (int64_t)remindersAuthorization;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsCustomDatabasePath:(BOOL)a3;
- (void)setAllowsIntegrations:(BOOL)a3;
- (void)setCanAccessDatabaseBookmarks:(BOOL)a3;
- (void)setCanMakeSpotlightChanges:(BOOL)a3;
- (void)setCanModifyBirthdayCalendar:(BOOL)a3;
- (void)setCanModifyCalendarDatabase:(BOOL)a3;
- (void)setCanModifySuggestedEventCalendar:(BOOL)a3;
- (void)setCanRequestDiagnostics:(BOOL)a3;
- (void)setEventAccessLevel:(int)a3;
- (void)setEventAuthorization:(int64_t)a3;
- (void)setHasCalendarTCCBypassEntitlement:(BOOL)a3;
- (void)setHasCalendarToolEntitlement:(BOOL)a3;
- (void)setHasChangeIdTrackingOverrideEntitlement:(BOOL)a3;
- (void)setHasManagedConfigurationBundleIDOverrideEntitlement:(BOOL)a3;
- (void)setHasNotificationCountEntitlement:(BOOL)a3;
- (void)setHasReminderAccess:(BOOL)a3;
- (void)setHasSyncClientEntitlement:(BOOL)a3;
- (void)setInternalAccessLevelGranted:(BOOL)a3;
- (void)setIsCalendarDaemon:(BOOL)a3;
- (void)setIsCalendarWidgetExtension:(BOOL)a3;
- (void)setIsFirstPartyCalendarApp:(BOOL)a3;
- (void)setIsRemoteUIExtension:(BOOL)a3;
- (void)setRemindersAuthorization:(int64_t)a3;
- (void)setShouldTrustClientEnforcedManagedConfigurationAccess:(BOOL)a3;
- (void)setStorageManagementAccessGranted:(BOOL)a3;
- (void)setTestingAccessLevelGranted:(BOOL)a3;
@end

@implementation CADMockPermissionValidator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADMockPermissionValidator)init
{
  v3.receiver = self;
  v3.super_class = (Class)CADMockPermissionValidator;
  result = [(CADMockPermissionValidator *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_eventAuthorization = vdupq_n_s64(3uLL);
    result->_canModifyCalendarDatabase = 1;
  }
  return result;
}

- (int)eventAccessLevel
{
  return CADEventAccessTypeFromAuthStatus(self->_eventAuthorization);
}

- (void)setEventAccessLevel:(int)a3
{
  if (a3 > 2) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = qword_1BBD04F80[a3];
  }
  self->_eventAuthorization = v3;
}

- (BOOL)hasReminderAccess
{
  return self->_remindersAuthorization == 3;
}

- (void)setHasReminderAccess:(BOOL)a3
{
  int64_t v3 = 2;
  if (a3) {
    int64_t v3 = 3;
  }
  self->_remindersAuthorization = v3;
}

- (CADMockPermissionValidator)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CADMockPermissionValidator;
  v5 = [(CADMockPermissionValidator *)&v7 init];
  if (v5)
  {
    v5->_eventAuthorization = (int)[v4 decodeIntForKey:@"eventAuthorization"];
    v5->_remindersAuthorization = (int)[v4 decodeIntForKey:@"remindersAuthorization"];
    v5->_isFirstPartyCalendarApp = [v4 decodeBoolForKey:@"isFirstPartyCalendarApp"];
    v5->_isCalendarDaemon = [v4 decodeBoolForKey:@"isCalendarDaemon"];
    v5->_isCalendarWidgetExtension = [v4 decodeBoolForKey:@"isCalendarWidgetExtension"];
    v5->_isRemoteUIExtension = [v4 decodeBoolForKey:@"isRemoteUIExtension"];
    v5->_canAccessDatabaseBookmarks = [v4 decodeBoolForKey:@"canAccessDatabaseBookmarks"];
    v5->_canModifySuggestedEventCalendar = [v4 decodeBoolForKey:@"canModifySuggestedEventCalendar"];
    v5->_canMakeSpotlightChanges = [v4 decodeBoolForKey:@"canMakeSpotlightChanges"];
    v5->_canModifyBirthdayCalendar = [v4 decodeBoolForKey:@"canModifyBirthdayCalendar"];
    v5->_canRequestDiagnostics = [v4 decodeBoolForKey:@"canRequestDiagnostics"];
    v5->_canModifyCalendarDatabase = [v4 decodeBoolForKey:@"canModifyCalendarDatabase"];
    v5->_testingAccessLevelGranted = [v4 decodeBoolForKey:@"testingAccessLevelGranted"];
    v5->_internalAccessLevelGranted = [v4 decodeBoolForKey:@"internalAccessLevelGranted"];
    v5->_storageManagementAccessGranted = [v4 decodeBoolForKey:@"storageManagementAccessGranted"];
    v5->_hasSyncClientEntitlement = [v4 decodeBoolForKey:@"hasSyncClientEntitlement"];
    v5->_hasCalendarToolEntitlement = [v4 decodeBoolForKey:@"hasCalendarToolEntitlement"];
    v5->_hasChangeIdTrackingOverrideEntitlement = [v4 decodeBoolForKey:@"hasChangeIdTrackingOverrideEntitlement"];
    v5->_hasNotificationCountEntitlement = [v4 decodeBoolForKey:@"hasNotificationCountEntitlement"];
    v5->_hasManagedConfigurationBundleIDOverrideEntitlement = [v4 decodeBoolForKey:@"hasManagedConfigurationBundleIDOverrideEntitlement"];
    v5->_shouldTrustClientEnforcedManagedConfigurationAccess = [v4 decodeBoolForKey:@"shouldTrustClientEnforcedManagedConfigurationAccess"];
    v5->_allowsCustomDatabasePath = [v4 decodeBoolForKey:@"allowsCustomDatabasePath"];
    v5->_allowsIntegrations = [v4 decodeBoolForKey:@"allowsIntegrations"];
    v5->_hasCalendarTCCBypassEntitlement = [v4 decodeBoolForKey:@"hasCalendarTCCBypassEntitlement"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t eventAuthorization_low = LODWORD(self->_eventAuthorization);
  id v5 = a3;
  [v5 encodeInt:eventAuthorization_low forKey:@"eventAuthorization"];
  [v5 encodeInt:LODWORD(self->_remindersAuthorization) forKey:@"remindersAuthorization"];
  [v5 encodeBool:self->_isFirstPartyCalendarApp forKey:@"isFirstPartyCalendarApp"];
  [v5 encodeBool:self->_isCalendarDaemon forKey:@"isCalendarDaemon"];
  [v5 encodeBool:self->_isCalendarWidgetExtension forKey:@"isCalendarWidgetExtension"];
  [v5 encodeBool:self->_isRemoteUIExtension forKey:@"isRemoteUIExtension"];
  [v5 encodeBool:self->_canAccessDatabaseBookmarks forKey:@"canAccessDatabaseBookmarks"];
  [v5 encodeBool:self->_canModifySuggestedEventCalendar forKey:@"canModifySuggestedEventCalendar"];
  [v5 encodeBool:self->_canMakeSpotlightChanges forKey:@"canMakeSpotlightChanges"];
  [v5 encodeBool:self->_canModifyBirthdayCalendar forKey:@"canModifyBirthdayCalendar"];
  [v5 encodeBool:self->_canRequestDiagnostics forKey:@"canRequestDiagnostics"];
  [v5 encodeBool:self->_canModifyCalendarDatabase forKey:@"canModifyCalendarDatabase"];
  [v5 encodeBool:self->_testingAccessLevelGranted forKey:@"testingAccessLevelGranted"];
  [v5 encodeBool:self->_internalAccessLevelGranted forKey:@"internalAccessLevelGranted"];
  [v5 encodeBool:self->_storageManagementAccessGranted forKey:@"storageManagementAccessGranted"];
  [v5 encodeBool:self->_hasSyncClientEntitlement forKey:@"hasSyncClientEntitlement"];
  [v5 encodeBool:self->_hasCalendarToolEntitlement forKey:@"hasCalendarToolEntitlement"];
  [v5 encodeBool:self->_hasChangeIdTrackingOverrideEntitlement forKey:@"hasChangeIdTrackingOverrideEntitlement"];
  [v5 encodeBool:self->_hasNotificationCountEntitlement forKey:@"hasNotificationCountEntitlement"];
  [v5 encodeBool:self->_hasManagedConfigurationBundleIDOverrideEntitlement forKey:@"hasManagedConfigurationBundleIDOverrideEntitlement"];
  [v5 encodeBool:self->_shouldTrustClientEnforcedManagedConfigurationAccess forKey:@"shouldTrustClientEnforcedManagedConfigurationAccess"];
  [v5 encodeBool:self->_allowsCustomDatabasePath forKey:@"allowsCustomDatabasePath"];
  [v5 encodeBool:self->_allowsIntegrations forKey:@"allowsIntegrations"];
  [v5 encodeBool:self->_hasCalendarTCCBypassEntitlement forKey:@"hasCalendarTCCBypassEntitlement"];
}

- (int64_t)eventAuthorization
{
  return self->_eventAuthorization;
}

- (void)setEventAuthorization:(int64_t)a3
{
  self->_eventAuthorization = a3;
}

- (int64_t)remindersAuthorization
{
  return self->_remindersAuthorization;
}

- (void)setRemindersAuthorization:(int64_t)a3
{
  self->_remindersAuthorization = a3;
}

- (BOOL)isFirstPartyCalendarApp
{
  return self->_isFirstPartyCalendarApp;
}

- (void)setIsFirstPartyCalendarApp:(BOOL)a3
{
  self->_isFirstPartyCalendarApp = a3;
}

- (BOOL)isCalendarDaemon
{
  return self->_isCalendarDaemon;
}

- (void)setIsCalendarDaemon:(BOOL)a3
{
  self->_isCalendarDaemon = a3;
}

- (BOOL)isRemoteUIExtension
{
  return self->_isRemoteUIExtension;
}

- (void)setIsRemoteUIExtension:(BOOL)a3
{
  self->_isRemoteUIExtension = a3;
}

- (BOOL)isCalendarWidgetExtension
{
  return self->_isCalendarWidgetExtension;
}

- (void)setIsCalendarWidgetExtension:(BOOL)a3
{
  self->_isCalendarWidgetExtension = a3;
}

- (BOOL)canAccessDatabaseBookmarks
{
  return self->_canAccessDatabaseBookmarks;
}

- (void)setCanAccessDatabaseBookmarks:(BOOL)a3
{
  self->_canAccessDatabaseBookmarks = a3;
}

- (BOOL)canModifySuggestedEventCalendar
{
  return self->_canModifySuggestedEventCalendar;
}

- (void)setCanModifySuggestedEventCalendar:(BOOL)a3
{
  self->_canModifySuggestedEventCalendar = a3;
}

- (BOOL)canMakeSpotlightChanges
{
  return self->_canMakeSpotlightChanges;
}

- (void)setCanMakeSpotlightChanges:(BOOL)a3
{
  self->_canMakeSpotlightChanges = a3;
}

- (BOOL)canModifyBirthdayCalendar
{
  return self->_canModifyBirthdayCalendar;
}

- (void)setCanModifyBirthdayCalendar:(BOOL)a3
{
  self->_canModifyBirthdayCalendar = a3;
}

- (BOOL)canRequestDiagnostics
{
  return self->_canRequestDiagnostics;
}

- (void)setCanRequestDiagnostics:(BOOL)a3
{
  self->_canRequestDiagnostics = a3;
}

- (BOOL)canModifyCalendarDatabase
{
  return self->_canModifyCalendarDatabase;
}

- (void)setCanModifyCalendarDatabase:(BOOL)a3
{
  self->_canModifyCalendarDatabase = a3;
}

- (BOOL)testingAccessLevelGranted
{
  return self->_testingAccessLevelGranted;
}

- (void)setTestingAccessLevelGranted:(BOOL)a3
{
  self->_testingAccessLevelGranted = a3;
}

- (BOOL)internalAccessLevelGranted
{
  return self->_internalAccessLevelGranted;
}

- (void)setInternalAccessLevelGranted:(BOOL)a3
{
  self->_internalAccessLevelGranted = a3;
}

- (BOOL)storageManagementAccessGranted
{
  return self->_storageManagementAccessGranted;
}

- (void)setStorageManagementAccessGranted:(BOOL)a3
{
  self->_storageManagementAccessGranted = a3;
}

- (BOOL)hasSyncClientEntitlement
{
  return self->_hasSyncClientEntitlement;
}

- (void)setHasSyncClientEntitlement:(BOOL)a3
{
  self->_hasSyncClientEntitlement = a3;
}

- (BOOL)hasCalendarToolEntitlement
{
  return self->_hasCalendarToolEntitlement;
}

- (void)setHasCalendarToolEntitlement:(BOOL)a3
{
  self->_hasCalendarToolEntitlement = a3;
}

- (BOOL)hasChangeIdTrackingOverrideEntitlement
{
  return self->_hasChangeIdTrackingOverrideEntitlement;
}

- (void)setHasChangeIdTrackingOverrideEntitlement:(BOOL)a3
{
  self->_hasChangeIdTrackingOverrideEntitlement = a3;
}

- (BOOL)hasNotificationCountEntitlement
{
  return self->_hasNotificationCountEntitlement;
}

- (void)setHasNotificationCountEntitlement:(BOOL)a3
{
  self->_hasNotificationCountEntitlement = a3;
}

- (BOOL)hasManagedConfigurationBundleIDOverrideEntitlement
{
  return self->_hasManagedConfigurationBundleIDOverrideEntitlement;
}

- (void)setHasManagedConfigurationBundleIDOverrideEntitlement:(BOOL)a3
{
  self->_hasManagedConfigurationBundleIDOverrideEntitlement = a3;
}

- (BOOL)shouldTrustClientEnforcedManagedConfigurationAccess
{
  return self->_shouldTrustClientEnforcedManagedConfigurationAccess;
}

- (void)setShouldTrustClientEnforcedManagedConfigurationAccess:(BOOL)a3
{
  self->_shouldTrustClientEnforcedManagedConfigurationAccess = a3;
}

- (BOOL)allowsCustomDatabasePath
{
  return self->_allowsCustomDatabasePath;
}

- (void)setAllowsCustomDatabasePath:(BOOL)a3
{
  self->_allowsCustomDatabasePath = a3;
}

- (BOOL)allowsIntegrations
{
  return self->_allowsIntegrations;
}

- (void)setAllowsIntegrations:(BOOL)a3
{
  self->_allowsIntegrations = a3;
}

- (BOOL)hasCalendarTCCBypassEntitlement
{
  return self->_hasCalendarTCCBypassEntitlement;
}

- (void)setHasCalendarTCCBypassEntitlement:(BOOL)a3
{
  self->_hasCalendarTCCBypassEntitlement = a3;
}

@end