@interface CRCarPlayPreferences
- (BOOL)_isCarPlayAllowed;
- (BOOL)cachedCarPlayAllowed;
- (BOOL)isCarPlayCapable;
- (BOOL)isWirelessCarPlayEnabled;
- (CRCarPlayPreferences)init;
- (CRCarPlayPreferencesDelegate)preferencesDelegate;
- (MCProfileConnection)profileConnection;
- (id)_BOOLValueInCarPlayDomainForKey:(__CFString *)a3;
- (id)isCCCHeadUnitPairingOverrideEnabled;
- (id)isCarPlaySetupEnabled;
- (id)isCarPlayThemeSupportEnabled;
- (id)shouldAlwaysAcceptCCCHeadUnitPairing;
- (void)_updateCarPlayAllowed;
- (void)dealloc;
- (void)setCachedCarPlayAllowed:(BOOL)a3;
- (void)setPreferencesDelegate:(id)a3;
- (void)setProfileConnection:(id)a3;
@end

@implementation CRCarPlayPreferences

- (CRCarPlayPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRCarPlayPreferences;
  v2 = [(CRCarPlayPreferences *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v3;

    [(MCProfileConnection *)v2->_profileConnection registerObserver:v2];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)CRLostModeStateChanged, (CFStringRef)*MEMORY[0x1E4F61A58], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(CRCarPlayPreferences *)v2 setCachedCarPlayAllowed:[(CRCarPlayPreferences *)v2 _isCarPlayAllowed]];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(MCProfileConnection *)self->_profileConnection unregisterObserver:self];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CRCarPlayPreferences;
  [(CRCarPlayPreferences *)&v5 dealloc];
}

- (void)_updateCarPlayAllowed
{
  BOOL v3 = [(CRCarPlayPreferences *)self _isCarPlayAllowed];
  if (v3 != [(CRCarPlayPreferences *)self cachedCarPlayAllowed])
  {
    [(CRCarPlayPreferences *)self setCachedCarPlayAllowed:v3];
    id v4 = [(CRCarPlayPreferences *)self preferencesDelegate];
    if (objc_opt_respondsToSelector()) {
      [v4 handleCarPlayAllowedDidChange];
    }
  }
}

- (id)_BOOLValueInCarPlayDomainForKey:(__CFString *)a3
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(a3, CRPreferencesNotMigratedDomain, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID())
    {
      v6 = [NSNumber numberWithUnsignedChar:CFBooleanGetValue(v4)];
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isCarPlayCapable
{
  int v2 = MGGetBoolAnswer();
  CFBooleanRef v3 = CarGeneralLogging();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      __int16 v9 = 0;
      CFTypeID v5 = "device is CarPlay capable";
      v6 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    __int16 v8 = 0;
    CFTypeID v5 = "device is not CarPlay capable";
    v6 = (uint8_t *)&v8;
    goto LABEL_6;
  }

  return v2;
}

- (BOOL)_isCarPlayAllowed
{
  if ([(CRCarPlayPreferences *)self isCarPlayCapable])
  {
    if ([(MCProfileConnection *)self->_profileConnection isVehicleUIAllowed])
    {
      CFBooleanRef v3 = [MEMORY[0x1E4F61A48] sharedInstance];
      if (([v3 isLostModeActive] & 1) == 0
        && ![v3 isManagedLostModeActive])
      {
        BOOL v5 = 1;
        goto LABEL_12;
      }
      BOOL v4 = CarGeneralLogging();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v7 = 0;
        _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay disabled by lost mode.", v7, 2u);
      }
    }
    else
    {
      CFBooleanRef v3 = CarGeneralLogging();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay disabled by restrictions", buf, 2u);
      }
    }
    BOOL v5 = 0;
LABEL_12:

    return v5;
  }
  return 0;
}

- (BOOL)isWirelessCarPlayEnabled
{
  return 1;
}

- (id)isCCCHeadUnitPairingOverrideEnabled
{
  return [(CRCarPlayPreferences *)self _BOOLValueInCarPlayDomainForKey:@"EnableHeadUnitPairingOverride"];
}

- (id)shouldAlwaysAcceptCCCHeadUnitPairing
{
  return [(CRCarPlayPreferences *)self _BOOLValueInCarPlayDomainForKey:@"AlwaysAcceptHeadUnitPairing"];
}

- (id)isCarPlaySetupEnabled
{
  int v2 = [(CRCarPlayPreferences *)self _BOOLValueInCarPlayDomainForKey:@"EnableCarPlaySetup"];
  CFBooleanRef v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC38];
  }

  return v4;
}

- (id)isCarPlayThemeSupportEnabled
{
  int v2 = [(CRCarPlayPreferences *)self _BOOLValueInCarPlayDomainForKey:@"EnableFerrite"];
  CFBooleanRef v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC28];
  }

  return v4;
}

- (CRCarPlayPreferencesDelegate)preferencesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferencesDelegate);
  return (CRCarPlayPreferencesDelegate *)WeakRetained;
}

- (void)setPreferencesDelegate:(id)a3
{
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void)setProfileConnection:(id)a3
{
}

- (BOOL)cachedCarPlayAllowed
{
  return self->_cachedCarPlayAllowed;
}

- (void)setCachedCarPlayAllowed:(BOOL)a3
{
  self->_cachedCarPlayAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_destroyWeak((id *)&self->_preferencesDelegate);
}

@end