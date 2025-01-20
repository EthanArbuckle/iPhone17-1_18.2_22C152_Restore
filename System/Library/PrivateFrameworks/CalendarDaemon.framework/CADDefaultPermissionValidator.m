@interface CADDefaultPermissionValidator
- (BOOL)_valueForBooleanEntitlement:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_valueForStringEntitlement:(id)a3 matchesString:(id)a4;
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
- (CADDefaultPermissionValidator)initWithClientIdentity:(id)a3;
- (CADDefaultPermissionValidator)initWithClientIdentity:(id)a3 tccPermissionChecker:(id)a4;
- (ClientIdentity)identity;
- (id)_valueForEntitlement:(id)a3 loadBlock:(id)a4;
- (int)eventAccessLevel;
- (int64_t)eventAuthorization;
- (int64_t)remindersAuthorization;
- (void)_loadAccessPermissionsIfNeeded;
- (void)dealloc;
@end

@implementation CADDefaultPermissionValidator

- (int)eventAccessLevel
{
  [(CADDefaultPermissionValidator *)self _loadAccessPermissionsIfNeeded];
  int64_t eventAuthorization = self->_eventAuthorization;
  return CADEventAccessTypeFromAuthStatus(eventAuthorization);
}

- (void)_loadAccessPermissionsIfNeeded
{
  if (!self->_allowedEntityTypesValid)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F57430]);
    int v4 = [v3 dataIsAccessible];

    if (v4)
    {
      if ([(CADDefaultPermissionValidator *)self hasSyncClientEntitlement])
      {
        *(int64x2_t *)&self->_int64_t eventAuthorization = vdupq_n_s64(3uLL);
      }
      else
      {
        uint64_t v5 = [(CADTCCPermissionChecker *)self->_tccPermissionChecker eventAuthorization];
        self->_int64_t eventAuthorization = CalAuthorizationStatusFromTCCAuthRight(*MEMORY[0x1E4FA9A30], v5);
        uint64_t v6 = [(CADTCCPermissionChecker *)self->_tccPermissionChecker remindersAuthorization];
        self->_remindersAuthorization = CalAuthorizationStatusFromTCCAuthRight(*MEMORY[0x1E4FA9AF0], v6);
      }
    }
    else
    {
      self->_int64_t eventAuthorization = 0;
      self->_remindersAuthorization = 0;
    }
    self->_allowedEntityTypesValid = 1;
  }
}

- (CADDefaultPermissionValidator)initWithClientIdentity:(id)a3 tccPermissionChecker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CADDefaultPermissionValidator;
  v8 = [(CADDefaultPermissionValidator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_identity, v6);
    objc_storeStrong((id *)&v9->_tccPermissionChecker, a4);
  }

  return v9;
}

- (void)dealloc
{
  task = self->_task;
  if (task)
  {
    CFRelease(task);
    self->_task = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CADDefaultPermissionValidator;
  [(CADDefaultPermissionValidator *)&v4 dealloc];
}

- (BOOL)testingAccessLevelGranted
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.daemon.access-level.testing" defaultValue:0];
}

- (BOOL)hasCalendarTCCBypassEntitlement
{
  id v3 = [(CADDefaultPermissionValidator *)self _valueForEntitlement:@"com.apple.private.tcc.allow" loadBlock:&__block_literal_global_29];
  if ([v3 BOOLValue])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(CADDefaultPermissionValidator *)self _valueForEntitlement:@"com.apple.private.tcc.allow.overridable" loadBlock:&__block_literal_global_59];
    char v4 = [v5 BOOLValue];
  }
  return v4;
}

- (BOOL)_valueForBooleanEntitlement:(id)a3 defaultValue:(BOOL)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__CADDefaultPermissionValidator__valueForBooleanEntitlement_defaultValue___block_invoke;
  v7[3] = &__block_descriptor_33_e9__16__0_v8l;
  BOOL v8 = a4;
  char v4 = [(CADDefaultPermissionValidator *)self _valueForEntitlement:a3 loadBlock:v7];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)_valueForEntitlement:(id)a3 loadBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = (void (**)(id, CFTypeRef))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  task = self->_task;
  if (!task)
  {
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identity);
    v12 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    self->_task = SecTaskCreateWithAuditToken(v10, &token);

    task = self->_task;
  }
  CFTypeRef v13 = 0;
  CFErrorRef error = 0;
  if (v6 && task) {
    CFTypeRef v13 = SecTaskCopyValueForEntitlement(task, v6, &error);
  }
  os_unfair_lock_unlock(p_lock);
  if (!v13)
  {
    if (error)
    {
      v14 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v20 = v6;
        __int16 v21 = 2112;
        CFErrorRef v22 = error;
        _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_ERROR, "CADPermissionValidator: An error occurred while checking for entitlement %{public}@. Error: %@", buf, 0x16u);
      }
    }
  }
  v15 = v7[2](v7, v13);
  if (v13) {
    CFRelease(v13);
  }

  return v15;
}

uint64_t __74__CADDefaultPermissionValidator__valueForBooleanEntitlement_defaultValue___block_invoke(uint64_t a1, CFTypeRef cf)
{
  BOOL v2 = *(unsigned char *)(a1 + 32) != 0;
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    BOOL v2 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)cf) != 0;
  }
  char v5 = (void *)MEMORY[0x1E4F28ED0];
  return [v5 numberWithBool:v2];
}

- (BOOL)allowsIntegrations
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.allow-integrations" defaultValue:0];
}

- (BOOL)isRemoteUIExtension
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.eventkitui-remoteui-extension" defaultValue:0];
}

- (BOOL)hasManagedConfigurationBundleIDOverrideEntitlement
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.managedConfigurationBundleIDOverride" defaultValue:0];
}

id __64__CADDefaultPermissionValidator_hasCalendarTCCBypassEntitlement__block_invoke(int a1, void *cf)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (cf && (CFTypeID v3 = CFGetTypeID(cf), v3 == CFArrayGetTypeID())) {
    CFTypeID v4 = cf;
  }
  else {
    CFTypeID v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v17;
    CFAllocatorRef v10 = (CFStringRef *)MEMORY[0x1E4FA9A30];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v12 = *(const __CFString **)(*((void *)&v16 + 1) + 8 * i);
        CFTypeID v13 = CFGetTypeID(v12);
        if (v13 == CFStringGetTypeID()) {
          v8 |= CFEqual(v12, *v10);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v8 & 1, (void)v16);

  return v14;
}

- (BOOL)isFirstPartyCalendarApp
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar" defaultValue:0];
}

- (BOOL)isCalendarWidgetExtension
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.calendar-widget-extension" defaultValue:0];
}

- (BOOL)allowsCustomDatabasePath
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.custom-database-path" defaultValue:0];
}

id __64__CADDefaultPermissionValidator_hasCalendarTCCBypassEntitlement__block_invoke_2(int a1, void *cf)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (cf && (CFTypeID v3 = CFGetTypeID(cf), v3 == CFArrayGetTypeID())) {
    CFTypeID v4 = cf;
  }
  else {
    CFTypeID v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v17;
    CFAllocatorRef v10 = (CFStringRef *)MEMORY[0x1E4FA9A30];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v12 = *(const __CFString **)(*((void *)&v16 + 1) + 8 * i);
        CFTypeID v13 = CFGetTypeID(v12);
        if (v13 == CFStringGetTypeID()) {
          v8 |= CFEqual(v12, *v10);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v8 & 1, (void)v16);

  return v14;
}

- (BOOL)canModifySuggestedEventCalendar
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.allow-suggestions" defaultValue:0];
}

- (BOOL)hasSyncClientEntitlement
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.syncclient" defaultValue:0];
}

- (BOOL)shouldTrustClientEnforcedManagedConfigurationAccess
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_identity);
  CFTypeID v3 = [WeakRetained applicationIdentifier];

  if (shouldTrustClientEnforcedManagedConfigurationAccess_onceToken != -1) {
    dispatch_once(&shouldTrustClientEnforcedManagedConfigurationAccess_onceToken, &__block_literal_global_74);
  }
  char v4 = [(id)shouldTrustClientEnforcedManagedConfigurationAccess_whitelistedBundleIDs containsObject:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_identity);
  objc_storeStrong((id *)&self->_tccPermissionChecker, 0);
}

- (BOOL)hasReminderAccess
{
  return self->_remindersAuthorization == 3;
}

- (CADDefaultPermissionValidator)initWithClientIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [CADAuditTokenTCCPermissionChecker alloc];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  uint64_t v6 = [(CADAuditTokenTCCPermissionChecker *)v5 initWithAuditToken:v9];
  uint64_t v7 = [(CADDefaultPermissionValidator *)self initWithClientIdentity:v4 tccPermissionChecker:v6];

  return v7;
}

- (int64_t)eventAuthorization
{
  return self->_eventAuthorization;
}

- (int64_t)remindersAuthorization
{
  return self->_remindersAuthorization;
}

- (BOOL)isCalendarDaemon
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.calaccessd" defaultValue:0];
}

- (BOOL)canAccessDatabaseBookmarks
{
  BOOL v3 = [(CADDefaultPermissionValidator *)self _valueForStringEntitlement:@"com.apple.application-identifier" matchesString:@"com.apple.Automator"];
  BOOL v4 = [(CADDefaultPermissionValidator *)self _valueForStringEntitlement:@"com.apple.application-identifier" matchesString:@"com.apple.shortcuts"];
  if (v3
    || v4
    || [(CADDefaultPermissionValidator *)self isFirstPartyCalendarApp]
    || [(CADDefaultPermissionValidator *)self isCalendarDaemon]
    || [(CADDefaultPermissionValidator *)self testingAccessLevelGranted])
  {
    return 1;
  }
  return [(CADDefaultPermissionValidator *)self hasSyncClientEntitlement];
}

- (BOOL)canMakeSpotlightChanges
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calaccessd.spotlight" defaultValue:0];
}

- (BOOL)canModifyBirthdayCalendar
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.allow-birthday-modification" defaultValue:0];
}

- (BOOL)canRequestDiagnostics
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.allow-diagnostics-collection" defaultValue:0];
}

- (BOOL)canModifyCalendarDatabase
{
  return 1;
}

- (BOOL)internalAccessLevelGranted
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    LOBYTE(has_internal_content) = [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.daemon.access-level.internal" defaultValue:0];
  }
  return has_internal_content;
}

- (BOOL)storageManagementAccessGranted
{
  BOOL v3 = [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.storagemanagement" defaultValue:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_identity);
  id v5 = [WeakRetained applicationIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.Preferences"];

  return v3 | v6;
}

- (BOOL)hasCalendarToolEntitlement
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    LOBYTE(has_internal_content) = [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.iamcalendar_tool" defaultValue:0];
  }
  return has_internal_content;
}

- (BOOL)hasChangeIdTrackingOverrideEntitlement
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.changeIdTrackingOverride" defaultValue:0];
}

- (BOOL)hasNotificationCountEntitlement
{
  return [(CADDefaultPermissionValidator *)self _valueForBooleanEntitlement:@"com.apple.private.calendar.notificationCount" defaultValue:0];
}

uint64_t __84__CADDefaultPermissionValidator_shouldTrustClientEnforcedManagedConfigurationAccess__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.datadetectors.DDActionsService", @"com.apple.mobilemail", @"com.apple.mobilesafari", @"com.apple.Bridge", @"com.apple.calendar.EventKitUIRemoteUIExtension", 0);
  shouldTrustClientEnforcedManagedConfigurationAccess_whitelistedBundleIDs = v0;
  return MEMORY[0x1F41817F8](v0);
}

- (BOOL)_valueForStringEntitlement:(id)a3 matchesString:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CADDefaultPermissionValidator *)self _valueForEntitlement:a3 loadBlock:&__block_literal_global_99];
  LOBYTE(self) = [v6 isEqual:v7];

  return (char)self;
}

id __74__CADDefaultPermissionValidator__valueForStringEntitlement_matchesString___block_invoke(int a1, void *cf)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFStringGetTypeID()) {
      id v5 = cf;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (ClientIdentity)identity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_identity);
  return (ClientIdentity *)WeakRetained;
}

@end