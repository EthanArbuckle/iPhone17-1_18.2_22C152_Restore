@interface PhoneSettingsTelephony
- (BOOL)allowCallerIDChange:(BOOL)a3;
- (BOOL)allowNetworkSelection;
- (BOOL)allowPINChange;
- (BOOL)allowSIMLock;
- (BOOL)hasSubscriberIdentity;
- (BOOL)simIsPresent;
- (PhoneSettingsTelephony)init;
- (__CTServerConnection)serverConnection;
- (id)_callForwardingSettingsForForwardingReason:(id)a3;
- (id)callForwardingNumber:(BOOL)a3;
- (id)callForwardingNumber:(BOOL)a3 forReason:(id)a4;
- (id)currentNetwork;
- (id)descriptionDictionary;
- (id)lastUsedForwardingNumberForReason:(id)a3;
- (id)manuallySelectedNetworkDictionary;
- (id)myNumber;
- (id)pendingRequestForUniqueSettingType:(id)a3;
- (id)pendingSaveForUniqueSettingType:(id)a3;
- (id)unlockAttemptsRemainingString;
- (int)currentNetworkSelectionState;
- (int)networkSelectionMode;
- (int)showCallForwarding;
- (int)showCallWaiting;
- (int)showCallerID;
- (int)showReplyWithMessage;
- (int)showSIMPIN;
- (unsigned)callForwardingEnabled:(BOOL)a3;
- (unsigned)callForwardingEnabled:(BOOL)a3 forReason:(id)a4;
- (unsigned)callWaitingEnabled:(BOOL)a3;
- (unsigned)callerIDMode:(BOOL)a3;
- (unsigned)callerIDModifiable:(BOOL)a3;
- (unsigned)simLocked:(BOOL)a3;
- (void)_handleCallForwardingSettings:(id)a3 didAttemptToSet:(BOOL)a4 forwardingReason:(id)a5;
- (void)_handleCallWaitingSettings:(id)a3;
- (void)_handleCallerIDChanged;
- (void)_handleCallerIDSettings:(id)a3;
- (void)_handleNetworkList:(id)a3;
- (void)_handlePINSettings:(id)a3;
- (void)_handleSIMLockSettings:(id)a3;
- (void)_invalidateSIMLockedSetting;
- (void)_networkSettingsDisabled;
- (void)_phoneBookSelected;
- (void)_phoneNumberChanged;
- (void)_phoneNumberSaveFinishedWithSuccess:(BOOL)a3;
- (void)_phoneNumberWritten;
- (void)_requestCallForwardingSettingsForReason:(id)a3;
- (void)_requestSettings:(id)a3;
- (void)_reset;
- (void)_resetCallerIDSettings;
- (void)_saveCallForwardingEnabled:(BOOL)a3 number:(id)a4 forwardingReason:(id)a5;
- (void)_saveSettings:(id)a3;
- (void)_simPUKLocked;
- (void)_simRemoved;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)destroyServerConnection;
- (void)enableAutomaticNetworkSelection;
- (void)hasSubscriberIdentity;
- (void)postCallForwardingChangedNotificationForForwardingReason:(id)a3;
- (void)receivedRequestResponseForUniqueSettingType:(id)a3;
- (void)receivedSaveResponseForUniqueSettingType:(id)a3;
- (void)requestNetworkList;
- (void)resetCallForwardingSettings;
- (void)resetLastUsedForwardingNumberForReason:(id)a3;
- (void)selectManualNetwork:(id)a3;
- (void)setCallForwardingEnabled:(BOOL)a3;
- (void)setCallForwardingEnabled:(BOOL)a3 forReason:(id)a4;
- (void)setCallForwardingNumber:(id)a3;
- (void)setCallForwardingNumber:(id)a3 forReason:(id)a4;
- (void)setCallWaitingEnabled:(BOOL)a3;
- (void)setCallerIDEnabled:(unsigned int)a3;
- (void)setMyNumber:(id)a3;
- (void)setPIN:(id)a3 password:(id)a4;
- (void)setSIMLocked:(BOOL)a3 password:(id)a4;
- (void)startWatching;
- (void)stopWatching;
@end

@implementation PhoneSettingsTelephony

- (PhoneSettingsTelephony)init
{
  v26.receiver = self;
  v26.super_class = (Class)PhoneSettingsTelephony;
  v2 = [(PhoneSettingsTelephony *)&v26 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];

    v5 = objc_alloc_init(PHForwardingSettings);
    callForwardingSettingsUnconditional = v2->_callForwardingSettingsUnconditional;
    v2->_callForwardingSettingsUnconditional = v5;

    [(PHForwardingSettings *)v2->_callForwardingSettingsUnconditional setDefaultCallForwardingNumberPreferencesKey:@"call-forwarding-number"];
    v7 = (void *)CFPreferencesCopyAppValue(@"call-forwarding-number", @"com.apple.mobilephone.settings");
    [(PHForwardingSettings *)v2->_callForwardingSettingsUnconditional setDefaultCallForwardingNumber:v7];

    v8 = [(PHForwardingSettings *)v2->_callForwardingSettingsUnconditional defaultCallForwardingNumber];

    if (!v8)
    {
      id v9 = objc_alloc_init(NSString);
      [(PHForwardingSettings *)v2->_callForwardingSettingsUnconditional setDefaultCallForwardingNumber:v9];
    }
    v10 = objc_alloc_init(PHForwardingSettings);
    callForwardingSettingsMobileBusy = v2->_callForwardingSettingsMobileBusy;
    v2->_callForwardingSettingsMobileBusy = v10;

    [(PHForwardingSettings *)v2->_callForwardingSettingsMobileBusy setDefaultCallForwardingNumberPreferencesKey:@"call-forwarding-number-mobilebusy"];
    v12 = (void *)CFPreferencesCopyAppValue(@"call-forwarding-number-mobilebusy", @"com.apple.mobilephone.settings");
    [(PHForwardingSettings *)v2->_callForwardingSettingsMobileBusy setDefaultCallForwardingNumber:v12];

    v13 = [(PHForwardingSettings *)v2->_callForwardingSettingsMobileBusy defaultCallForwardingNumber];

    if (!v13)
    {
      id v14 = objc_alloc_init(NSString);
      [(PHForwardingSettings *)v2->_callForwardingSettingsMobileBusy setDefaultCallForwardingNumber:v14];
    }
    v15 = objc_alloc_init(PHForwardingSettings);
    callForwardingSettingsNoReply = v2->_callForwardingSettingsNoReply;
    v2->_callForwardingSettingsNoReply = v15;

    [(PHForwardingSettings *)v2->_callForwardingSettingsNoReply setDefaultCallForwardingNumberPreferencesKey:@"call-forwarding-number-noreply"];
    v17 = (void *)CFPreferencesCopyAppValue(@"call-forwarding-number-noreply", @"com.apple.mobilephone.settings");
    [(PHForwardingSettings *)v2->_callForwardingSettingsNoReply setDefaultCallForwardingNumber:v17];

    v18 = [(PHForwardingSettings *)v2->_callForwardingSettingsNoReply defaultCallForwardingNumber];

    if (!v18)
    {
      id v19 = objc_alloc_init(NSString);
      [(PHForwardingSettings *)v2->_callForwardingSettingsNoReply setDefaultCallForwardingNumber:v19];
    }
    v20 = objc_alloc_init(PHForwardingSettings);
    callForwardingSettingsNotReachable = v2->_callForwardingSettingsNotReachable;
    v2->_callForwardingSettingsNotReachable = v20;

    [(PHForwardingSettings *)v2->_callForwardingSettingsNotReachable setDefaultCallForwardingNumberPreferencesKey:@"call-forwarding-number-notreachable"];
    v22 = (void *)CFPreferencesCopyAppValue(@"call-forwarding-number-notreachable", @"com.apple.mobilephone.settings");
    [(PHForwardingSettings *)v2->_callForwardingSettingsNotReachable setDefaultCallForwardingNumber:v22];

    v23 = [(PHForwardingSettings *)v2->_callForwardingSettingsNotReachable defaultCallForwardingNumber];

    if (!v23)
    {
      id v24 = objc_alloc_init(NSString);
      [(PHForwardingSettings *)v2->_callForwardingSettingsNotReachable setDefaultCallForwardingNumber:v24];
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(PhoneSettingsTelephony *)self stopWatching];
  [(PhoneSettingsTelephony *)self destroyServerConnection];
  v4.receiver = self;
  v4.super_class = (Class)PhoneSettingsTelephony;
  [(PhoneSettingsTelephony *)&v4 dealloc];
}

- (void)destroyServerConnection
{
  if (self->_serverConnection)
  {
    _CTServerConnectionUnregisterForAllNotifications();
    CFRelease(self->_serverConnection);
    self->_serverConnection = 0;
  }
}

- (void)_reset
{
  [(PhoneSettingsTelephony *)self resetCallForwardingSettings];
  [(PhoneSettingsTelephony *)self _resetCallerIDSettings];
  self->_callWaitingEnabled = 0;
  self->_simLocked = 0;
  cachedPassword = self->_cachedPassword;
  self->_cachedPassword = 0;

  myNumber = self->_myNumber;
  self->_myNumber = 0;

  [(NSMutableDictionary *)self->_pendingSaves removeAllObjects];
  pendingRequests = self->_pendingRequests;

  [(NSMutableDictionary *)pendingRequests removeAllObjects];
}

- (void)resetCallForwardingSettings
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "Resetting call forwarding settings", v4, 2u);
  }

  [(PHForwardingSettings *)self->_callForwardingSettingsUnconditional setCallForwardingState:0];
  [(PHForwardingSettings *)self->_callForwardingSettingsUnconditional setCallForwardingNumber:0];
  [(PHForwardingSettings *)self->_callForwardingSettingsMobileBusy setCallForwardingState:0];
  [(PHForwardingSettings *)self->_callForwardingSettingsMobileBusy setCallForwardingNumber:0];
  [(PHForwardingSettings *)self->_callForwardingSettingsNoReply setCallForwardingState:0];
  [(PHForwardingSettings *)self->_callForwardingSettingsNoReply setCallForwardingNumber:0];
  [(PHForwardingSettings *)self->_callForwardingSettingsNotReachable setCallForwardingState:0];
  [(PHForwardingSettings *)self->_callForwardingSettingsNotReachable setCallForwardingNumber:0];
}

- (void)_resetCallerIDSettings
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "Resetting Caller ID settings", v4, 2u);
  }

  self->_callerIDIsModifiable = 0;
  self->_callerIDMode = 0;
}

- (void)_invalidateSIMLockedSetting
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating SIM locked setting", v4, 2u);
  }

  self->_simLocked = 0;
}

- (void)startWatching
{
  v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22C120000, v2, OS_LOG_TYPE_DEFAULT, "", v3, 2u);
  }

  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
}

- (void)stopWatching
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }

  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  [(PhoneSettingsTelephony *)self _reset];
}

- (void)applicationDidEnterBackground:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  [(PhoneSettingsTelephony *)self stopWatching];
  [(PhoneSettingsTelephony *)self destroyServerConnection];
}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  [(PhoneSettingsTelephony *)self startWatching];
}

- (__CTServerConnection)serverConnection
{
  result = self->_serverConnection;
  if (!result)
  {
    id v4 = NSString;
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v6 = [v5 bundleIdentifier];
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    id v9 = [v4 stringWithFormat:@"%@.%@", v6, v8];

    CFRunLoopGetMain();
    self->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnRunLoop();

    return self->_serverConnection;
  }
  return result;
}

- (int)currentNetworkSelectionState
{
  v2 = CTRegistrationGetNetworkSelectionState();
  if (v2 == (void *)*MEMORY[0x263F02FB0])
  {
    int v4 = 0;
  }
  else if (v2 == (void *)*MEMORY[0x263F02F88])
  {
    int v4 = 1;
  }
  else if (v2 == (void *)*MEMORY[0x263F02FA8])
  {
    int v4 = 2;
  }
  else if (v2 == (void *)*MEMORY[0x263F02FA0])
  {
    int v4 = 3;
  }
  else if (v2 == (void *)*MEMORY[0x263F02F80] || v2 == (void *)*MEMORY[0x263F02F98])
  {
    int v4 = 5;
  }
  else if (v2 == (void *)*MEMORY[0x263F02F90])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)myNumber
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!self->_myNumber)
  {
    self->_myNumber = (NSString *)&stru_26DF94838;

    v3 = (const void *)CTSettingCopyMyPhoneNumber();
    int v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_22C120000, v4, OS_LOG_TYPE_DEFAULT, "CTSettingCopyMyPhoneNumber returned %@", (uint8_t *)&v12, 0xCu);
    }

    if (v3)
    {
      active = (const void *)PNCopyBestGuessCountryCodeForNumber();
      if (active || (active = (const void *)CPPhoneNumberCopyActiveCountryCode()) != 0)
      {
        int v6 = PHDefaultLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412546;
          v13 = v3;
          __int16 v14 = 2112;
          v15 = active;
          _os_log_impl(&dword_22C120000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to format digits %@ using ISO country code %@", (uint8_t *)&v12, 0x16u);
        }

        id v7 = (NSString *)PNCreateFormattedStringWithCountry();
        myNumber = self->_myNumber;
        self->_myNumber = v7;

        CFRelease(active);
      }
      else
      {
        v11 = PHDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412290;
          v13 = v3;
          _os_log_impl(&dword_22C120000, v11, OS_LOG_TYPE_DEFAULT, "Could not determine the country code for the digits %@.", (uint8_t *)&v12, 0xCu);
        }
      }
      CFRelease(v3);
    }
  }
  id v9 = self->_myNumber;

  return v9;
}

- (void)setMyNumber:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  UIUnformattedPhoneNumberFromString();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((unsigned char *)self + 112) & 1;
    int v12 = 138412802;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = v5;
    __int16 v16 = 1024;
    int v17 = v7;
    _os_log_impl(&dword_22C120000, v6, OS_LOG_TYPE_DEFAULT, "Set my number called with: %@ normalized to: %@, was already saving phone number = %d", (uint8_t *)&v12, 0x1Cu);
  }

  *((unsigned char *)self + 112) = *((unsigned char *)self + 112) & 0xF8 | 1;
  newNumber = self->_newNumber;
  self->_newNumber = v5;
  id v9 = v5;

  myNumber = self->_myNumber;
  self->_myNumber = 0;

  [(PhoneSettingsTelephony *)self serverConnection];
  if ((unint64_t)_CTServerConnectionSelectPhonebook() >> 32)
  {
    v11 = PHDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PhoneSettingsTelephony setMyNumber:]();
    }
  }
}

- (BOOL)simIsPresent
{
  return CTSIMSupportGetSIMStatus() != *MEMORY[0x263F03078];
}

- (BOOL)hasSubscriberIdentity
{
  [(PhoneSettingsTelephony *)self serverConnection];
  if ((unint64_t)_CTServerConnectionCopyMobileEquipmentInfo() >> 32)
  {
    v2 = PHDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[PhoneSettingsTelephony hasSubscriberIdentity]();
    }
    goto LABEL_7;
  }
  v2 = [0 allKeys];
  uint64_t v3 = *MEMORY[0x263F02E48];
  if (![v2 containsObject:*MEMORY[0x263F02E48]])
  {
LABEL_7:
    LOBYTE(v6) = 0;
    goto LABEL_8;
  }
  id v4 = [0 objectForKey:v3];
  if (v4)
  {
    v5 = [0 objectForKey:v3];
    int v6 = [v5 isEqual:&stru_26DF94838] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

LABEL_8:
  return v6;
}

- (BOOL)allowNetworkSelection
{
  uint64_t SIMStatus = CTSIMSupportGetSIMStatus();
  id v3 = objc_alloc_init(MEMORY[0x263F255D8]);
  char v4 = [v3 airplaneMode];

  if (v4)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    int v5 = CTRegistrationNetworkSelectionMenuAvailable();
    if (v5) {
      LOBYTE(v5) = SIMStatus == *MEMORY[0x263F030B8];
    }
  }
  return v5;
}

- (id)currentNetwork
{
  v2 = (void *)CTRegistrationCopyLocalizedOperatorName();

  return v2;
}

- (void)enableAutomaticNetworkSelection
{
  v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22C120000, v2, OS_LOG_TYPE_DEFAULT, "", v3, 2u);
  }

  CTRegistrationAutomaticallySelectNetwork();
}

- (void)selectManualNetwork:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22C120000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v5, 0xCu);
  }

  CTRegistrationManuallySelectNetwork();
}

- (unsigned)callForwardingEnabled:(BOOL)a3
{
  return [(PhoneSettingsTelephony *)self callForwardingEnabled:a3 forReason:*MEMORY[0x263F03360]];
}

- (unsigned)callForwardingEnabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(PhoneSettingsTelephony *)self _callForwardingSettingsForForwardingReason:v6];
  uint64_t v8 = v7;
  if (v4
    && (![v7 callForwardingState]
     || [v8 callForwardingState] == 1))
  {
    [v8 setCallForwardingState:1];
    [(PhoneSettingsTelephony *)self _requestCallForwardingSettingsForReason:v6];
  }
  unsigned int v9 = [v8 callForwardingState] & 0xFFFFFFF7;

  return v9;
}

- (void)setCallForwardingEnabled:(BOOL)a3
{
}

- (void)setCallForwardingEnabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(PhoneSettingsTelephony *)self _callForwardingSettingsForForwardingReason:v6];
  uint64_t v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      unsigned int v9 = @"ENABLE";
    }
    else {
      unsigned int v9 = @"DISABLE";
    }
    int v11 = 138412802;
    int v12 = v9;
    __int16 v13 = 1024;
    int v14 = [v7 callForwardingState];
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_22C120000, v8, OS_LOG_TYPE_DEFAULT, "Request to %@ call forwarding from current state %d for reason %@", (uint8_t *)&v11, 0x1Cu);
  }

  v10 = [v7 callForwardingNumber];
  [(PhoneSettingsTelephony *)self _saveCallForwardingEnabled:v4 number:v10 forwardingReason:v6];
}

- (id)callForwardingNumber:(BOOL)a3
{
  return [(PhoneSettingsTelephony *)self callForwardingNumber:a3 forReason:*MEMORY[0x263F03360]];
}

- (id)callForwardingNumber:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(PhoneSettingsTelephony *)self _callForwardingSettingsForForwardingReason:v6];
  uint64_t v8 = v7;
  if (v4 && ![v7 callForwardingState])
  {
    [v8 setCallForwardingState:1];
    [(PhoneSettingsTelephony *)self _requestCallForwardingSettingsForReason:v6];
  }
  unsigned int v9 = [v8 callForwardingNumber];

  return v9;
}

- (void)setCallForwardingNumber:(id)a3
{
}

- (void)setCallForwardingNumber:(id)a3 forReason:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_22C120000, v8, OS_LOG_TYPE_DEFAULT, "Requested to set call forwarding number to %@ for reason %@", (uint8_t *)&v9, 0x16u);
  }

  -[PhoneSettingsTelephony _saveCallForwardingEnabled:number:forwardingReason:](self, "_saveCallForwardingEnabled:number:forwardingReason:", [v6 length] != 0, v6, v7);
}

- (unsigned)callWaitingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    unsigned int callWaitingEnabled = self->_callWaitingEnabled;
    if (v3) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = callWaitingEnabled;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "[PhoneSettingsTelephony callWaitingEnabled:]: Request:%@, _callWaitingEnabledState is %d", buf, 0x12u);
  }

  if (v3 && !self->_callWaitingEnabled)
  {
    uint64_t v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C120000, v8, OS_LOG_TYPE_DEFAULT, "[PhoneSettingsTelephony callWaitingEnabled:]: Setting _callWaitingEnabledState to SettingsPending", buf, 2u);
    }

    self->_unsigned int callWaitingEnabled = 1;
    int v9 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"STSettingTypeUniqueIdentifier", *MEMORY[0x263F03400], *MEMORY[0x263F033F0], *MEMORY[0x263F03328], *MEMORY[0x263F03320], 0);
    [(PhoneSettingsTelephony *)self _requestSettings:v9];
  }
  return self->_callWaitingEnabled & 0xFFFFFFF7;
}

- (void)setCallWaitingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int callWaitingEnabled = self->_callWaitingEnabled;
    v11[0] = 67109376;
    v11[1] = callWaitingEnabled;
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "Requested to set call waiting enabled from %d to %d", (uint8_t *)v11, 0xEu);
  }

  unsigned int v7 = self->_callWaitingEnabled;
  if (v3)
  {
    if (v7 != 4) {
      return;
    }
  }
  else if (v7 != 2)
  {
    return;
  }
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = *MEMORY[0x263F03400];
  [v8 setObject:*MEMORY[0x263F03400] forKey:@"STSettingTypeUniqueIdentifier"];
  [v8 setObject:v9 forKey:*MEMORY[0x263F033F0]];
  [v8 setObject:*MEMORY[0x263F03328] forKey:*MEMORY[0x263F03320]];
  id v10 = (void *)MEMORY[0x263EFFB40];
  if (!v3) {
    id v10 = (void *)MEMORY[0x263EFFB38];
  }
  [v8 setObject:*v10 forKey:*MEMORY[0x263F033A8]];
  self->_callWaitingEnabled |= 1u;
  [(PhoneSettingsTelephony *)self _saveSettings:v8];
}

- (BOOL)allowCallerIDChange:(BOOL)a3
{
  return ([(PhoneSettingsTelephony *)self callerIDModifiable:a3] & 5) == 0;
}

- (unsigned)callerIDModifiable:(BOOL)a3
{
  if (a3 && !self->_callerIDMode) {
    [(PhoneSettingsTelephony *)self callerIDMode:1];
  }
  return self->_callerIDIsModifiable & 0xFFFFFFF7;
}

- (unsigned)callerIDMode:(BOOL)a3
{
  if (a3 && !self->_callerIDMode)
  {
    self->_callerIDMode = 1;
    BOOL v4 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"STSettingTypeUniqueIdentifier", *MEMORY[0x263F03408], *MEMORY[0x263F033F0], 0);
    [(PhoneSettingsTelephony *)self _requestSettings:v4];
  }
  return self->_callerIDMode & 0xFFFFFFEF;
}

- (void)setCallerIDEnabled:(unsigned int)a3
{
  if (self->_callerIDMode == a3)
  {
    [(PhoneSettingsTelephony *)self _handleCallerIDSettings:0];
    return;
  }
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = (id)*MEMORY[0x263F03398];
  switch(a3)
  {
    case 2u:
      id v6 = (id *)MEMORY[0x263F03370];
      goto LABEL_11;
    case 8u:
      id v6 = (id *)MEMORY[0x263F03390];
      goto LABEL_11;
    case 4u:
      id v6 = (id *)MEMORY[0x263F03378];
LABEL_11:
      id v7 = *v6;

      id v5 = v7;
      break;
  }
  uint64_t v8 = *MEMORY[0x263F03408];
  [v9 setObject:*MEMORY[0x263F03408] forKey:@"STSettingTypeUniqueIdentifier"];
  [v9 setObject:v8 forKey:*MEMORY[0x263F033F0]];
  [v9 setObject:v5 forKey:*MEMORY[0x263F03368]];
  self->_callerIDMode = 1;
  [(PhoneSettingsTelephony *)self _saveSettings:v9];
}

- (void)requestNetworkList
{
  v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_22C120000, v2, OS_LOG_TYPE_DEFAULT, "Requesting network list", v3, 2u);
  }

  CTRegistrationRequestNetworkList();
}

- (int)networkSelectionMode
{
  uint64_t NetworkSelectionMode = CTRegistrationGetNetworkSelectionMode();
  if (NetworkSelectionMode == *MEMORY[0x263F02F78]) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (NetworkSelectionMode == *MEMORY[0x263F02F70]) {
    return 0;
  }
  else {
    return v3;
  }
}

- (id)manuallySelectedNetworkDictionary
{
  v2 = (void *)CTRegistrationCopyManualNetworkSelection();

  return v2;
}

- (BOOL)allowSIMLock
{
  return CTSIMSupportGetSIMStatus() == *MEMORY[0x263F030B8];
}

- (unsigned)simLocked:(BOOL)a3
{
  if (a3 && !self->_simLocked)
  {
    if (CTSIMSupportGetSIMStatus() == *MEMORY[0x263F030A0])
    {
      self->_simLocked = 2;
    }
    else
    {
      self->_simLocked = 1;
      BOOL v4 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"STSettingTypeUniqueIdentifier", *MEMORY[0x263F03418], *MEMORY[0x263F033F0], 0);
      [(PhoneSettingsTelephony *)self _requestSettings:v4];
    }
  }
  return self->_simLocked & 0xFFFFFFF7;
}

- (void)setSIMLocked:(BOOL)a3 password:(id)a4
{
  BOOL v4 = a3;
  id v6 = (__CFString *)a4;
  unsigned int simLocked = self->_simLocked;
  BOOL v13 = v6;
  if (!v4)
  {
    if (simLocked == 2)
    {
      unsigned int v8 = 3;
      goto LABEL_6;
    }
LABEL_12:
    [(PhoneSettingsTelephony *)self _handleSIMLockSettings:0];
    goto LABEL_13;
  }
  if (simLocked != 4) {
    goto LABEL_12;
  }
  unsigned int v8 = 5;
LABEL_6:
  self->_unsigned int simLocked = v8;
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = *MEMORY[0x263F03418];
  [v9 setObject:*MEMORY[0x263F03418] forKey:@"STSettingTypeUniqueIdentifier"];
  [v9 setObject:v10 forKey:*MEMORY[0x263F033F0]];
  __int16 v11 = (void *)MEMORY[0x263EFFB40];
  if (!v4) {
    __int16 v11 = (void *)MEMORY[0x263EFFB38];
  }
  [v9 setObject:*v11 forKey:*MEMORY[0x263F033A8]];
  if (v13) {
    __int16 v12 = v13;
  }
  else {
    __int16 v12 = &stru_26DF94838;
  }
  [v9 setObject:v12 forKey:*MEMORY[0x263F033C0]];
  [(PhoneSettingsTelephony *)self _saveSettings:v9];

LABEL_13:
}

- (id)unlockAttemptsRemainingString
{
  uint64_t RemainingPINAttempts = CTSIMSupportGetRemainingPINAttempts();
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  BOOL v4 = [NSNumber numberWithUnsignedInteger:RemainingPINAttempts];
  id v5 = [v3 stringFromNumber:v4];

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (RemainingPINAttempts == 1) {
    unsigned int v8 = @"%@_SIM_ATTEMPT_REMAINING";
  }
  else {
    unsigned int v8 = @"%@_SIM_ATTEMPTS_REMAINING";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_26DF94838 table:@"Phone"];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v5);

  return v10;
}

- (BOOL)allowPINChange
{
  BOOL v3 = [(PhoneSettingsTelephony *)self allowSIMLock];
  if (v3) {
    LOBYTE(v3) = [(PhoneSettingsTelephony *)self simLocked:0] == 2;
  }
  return v3;
}

- (void)setPIN:(id)a3 password:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 dictionary];
  uint64_t v9 = *MEMORY[0x263F03410];
  [v10 setObject:*MEMORY[0x263F03410] forKey:*MEMORY[0x263F033F0]];
  [v10 setObject:v9 forKey:@"STSettingTypeUniqueIdentifier"];
  [v10 setObject:v8 forKey:*MEMORY[0x263F033B8]];

  [v10 setObject:v7 forKey:*MEMORY[0x263F033C0]];
  [(PhoneSettingsTelephony *)self _saveSettings:v10];
}

- (int)showCallForwarding
{
  int result = MGGetBoolAnswer();
  if (result)
  {
    int result = [(PhoneSettingsTelephony *)self hasSubscriberIdentity];
    if (result) {
      return [MEMORY[0x263F1C408] isRunningInStoreDemoMode] ^ 1;
    }
  }
  return result;
}

- (int)showCallWaiting
{
  int result = MGGetBoolAnswer();
  if (result) {
    return [(PhoneSettingsTelephony *)self hasSubscriberIdentity];
  }
  return result;
}

- (int)showCallerID
{
  int result = MGGetBoolAnswer();
  if (result) {
    return [(PhoneSettingsTelephony *)self hasSubscriberIdentity];
  }
  return result;
}

- (int)showSIMPIN
{
  int result = MGGetBoolAnswer();
  if (result) {
    return ([MEMORY[0x263F1C408] isRunningInStoreDemoMode] & 1) == 0
  }
        && [(PhoneSettingsTelephony *)self simIsPresent];
  return result;
}

- (int)showReplyWithMessage
{
  return 1;
}

- (id)pendingRequestForUniqueSettingType:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x263EFF9D0] null];
  }
  id v6 = [(NSMutableDictionary *)self->_pendingRequests objectForKey:v5];

  return v6;
}

- (id)pendingSaveForUniqueSettingType:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x263EFF9D0] null];
  }
  id v6 = [(NSMutableDictionary *)self->_pendingSaves objectForKey:v5];

  return v6;
}

- (void)receivedRequestResponseForUniqueSettingType:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  [(NSMutableDictionary *)self->_pendingRequests removeObjectForKey:v4];
}

- (void)receivedSaveResponseForUniqueSettingType:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  [(NSMutableDictionary *)self->_pendingSaves removeObjectForKey:v4];
}

- (id)_callForwardingSettingsForForwardingReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x263F03360]] & 1) == 0)
  {
    if ([v4 isEqualToString:*MEMORY[0x263F03348]])
    {
      uint64_t v5 = 40;
      goto LABEL_9;
    }
    if ([v4 isEqualToString:*MEMORY[0x263F03350]])
    {
      uint64_t v5 = 48;
      goto LABEL_9;
    }
    if ([v4 isEqualToString:*MEMORY[0x263F03358]])
    {
      uint64_t v5 = 56;
      goto LABEL_9;
    }
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_22C120000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Was asked for call-forwarding settings for an unsupported reason (%@), returning unconditional", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v5 = 32;
LABEL_9:
  id v6 = *(id *)((char *)&self->super.isa + v5);

  return v6;
}

- (void)postCallForwardingChangedNotificationForForwardingReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F03360]])
  {
    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    id v6 = v5;
    id v7 = @"SettingsTelephonyCallForwardingChanged";
LABEL_9:
    [v5 postNotificationName:v7 object:self];

    goto LABEL_10;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F03348]])
  {
    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    id v6 = v5;
    id v7 = @"SettingsTelephonyCallForwardingChangedForMobileBusy";
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F03350]])
  {
    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    id v6 = v5;
    id v7 = @"SettingsTelephonyCallForwardingChangedForNoReply";
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F03358]])
  {
    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    id v6 = v5;
    id v7 = @"SettingsTelephonyCallForwardingChangedForNotReachable";
    goto LABEL_9;
  }
  id v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_22C120000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Was asked to post a notification for an unsupported reason (%@), doing nothing", (uint8_t *)&v9, 0xCu);
  }

LABEL_10:
}

- (id)lastUsedForwardingNumberForReason:(id)a3
{
  BOOL v3 = [(PhoneSettingsTelephony *)self _callForwardingSettingsForForwardingReason:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 defaultCallForwardingNumber];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)resetLastUsedForwardingNumberForReason:(id)a3
{
  BOOL v3 = [(PhoneSettingsTelephony *)self _callForwardingSettingsForForwardingReason:a3];
  if (v3)
  {
    id v5 = v3;
    [v3 setDefaultCallForwardingNumber:0];
    id v4 = [v5 defaultCallForwardingNumberPreferencesKey];
    CFPreferencesSetAppValue(v4, 0, @"com.apple.mobilephone.settings");

    CFPreferencesAppSynchronize(@"com.apple.mobilephone.settings");
    BOOL v3 = v5;
  }
}

- (void)_handleCallForwardingSettings:(id)a3 didAttemptToSet:(BOOL)a4 forwardingReason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    *(void *)v25 = v8;
    *(_WORD *)&v25[8] = 1024;
    *(_DWORD *)&v25[10] = v6;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_22C120000, v10, OS_LOG_TYPE_DEFAULT, "Handle call forwarding settings userInfo: %@ didSet: %d forwardingReason: %@", (uint8_t *)&v24, 0x1Cu);
  }

  if ([v9 isEqualToString:*MEMORY[0x263F03340]])
  {
    [(PhoneSettingsTelephony *)self _handleCallForwardingSettings:v8 didAttemptToSet:v6 forwardingReason:*MEMORY[0x263F03360]];
    [(PhoneSettingsTelephony *)self _handleCallForwardingSettings:v8 didAttemptToSet:v6 forwardingReason:*MEMORY[0x263F03348]];
    [(PhoneSettingsTelephony *)self _handleCallForwardingSettings:v8 didAttemptToSet:v6 forwardingReason:*MEMORY[0x263F03350]];
    [(PhoneSettingsTelephony *)self _handleCallForwardingSettings:v8 didAttemptToSet:v6 forwardingReason:*MEMORY[0x263F03358]];
  }
  else
  {
    uint64_t v11 = [(PhoneSettingsTelephony *)self _callForwardingSettingsForForwardingReason:v9];
    __int16 v12 = v11;
    if (v8)
    {
      BOOL v13 = [v8 objectForKey:*MEMORY[0x263F033A8]];
      if ([v13 BOOLValue]) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 4;
      }
      [v12 setCallForwardingState:v14];

      uint64_t v15 = [v8 objectForKey:*MEMORY[0x263F03330]];
      id v16 = v15;
      if (v15 && [v15 length])
      {
        id active = (id)CPPhoneNumberCopyActiveCountryCode();
        uint64_t v18 = UIFormattedPhoneNumberFromStringWithCountry();
        [v12 setCallForwardingNumber:v18];
      }
      else
      {
        id active = objc_alloc_init(NSString);
        [v12 setCallForwardingNumber:active];
      }

      if (v6)
      {
        id v19 = [v12 callForwardingNumber];
        [v12 setDefaultCallForwardingNumber:v19];

        v20 = [v12 defaultCallForwardingNumberPreferencesKey];
        v21 = [v12 defaultCallForwardingNumber];
        CFPreferencesSetAppValue(v20, v21, @"com.apple.mobilephone.settings");

        CFPreferencesAppSynchronize(@"com.apple.mobilephone.settings");
      }
    }
    else
    {
      objc_msgSend(v11, "setCallForwardingState:", objc_msgSend(v11, "callForwardingState") & 0xFFFFFFFELL);
      objc_msgSend(v12, "setCallForwardingState:", objc_msgSend(v12, "callForwardingState") | 8);
    }
    v22 = PHDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v12 callForwardingState];
      int v24 = 67109378;
      *(_DWORD *)v25 = v23;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v9;
      _os_log_impl(&dword_22C120000, v22, OS_LOG_TYPE_DEFAULT, "Set call forwarding state to %d for forwarding reason %@", (uint8_t *)&v24, 0x12u);
    }

    [(PhoneSettingsTelephony *)self postCallForwardingChangedNotificationForForwardingReason:v9];
    objc_msgSend(v12, "setCallForwardingState:", objc_msgSend(v12, "callForwardingState") & 0xFFFFFFF7);
  }
}

- (void)_handleCallWaitingSettings:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "[PhoneSettingsTelephony _handleCallWaitingSettings]: Received a response for call-waiting request, userInfo is %@", (uint8_t *)&v13, 0xCu);
  }

  if (v4)
  {
    BOOL v6 = [v4 objectForKey:*MEMORY[0x263F033A8]];
    if ([v6 BOOLValue]) {
      unsigned int v7 = 2;
    }
    else {
      unsigned int v7 = 4;
    }
    self->_unsigned int callWaitingEnabled = v7;

    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int callWaitingEnabled = self->_callWaitingEnabled;
      int v13 = 67109120;
      LODWORD(v14) = callWaitingEnabled;
      id v10 = "[PhoneSettingsTelephony _handleCallWaitingSettings]: _callWaitingEnabled was set to %d";
LABEL_11:
      _os_log_impl(&dword_22C120000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 8u);
    }
  }
  else
  {
    self->_unsigned int callWaitingEnabled = self->_callWaitingEnabled & 0xFFFFFFF6 | 8;
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = self->_callWaitingEnabled;
      int v13 = 67109120;
      LODWORD(v14) = v11;
      id v10 = "[WARN] [PhoneSettingsTelephony _handleCallWaitingSettings]: call-waiting error, no userInfo was supplied, _c"
            "allWaitingEnabled was set to %d";
      goto LABEL_11;
    }
  }

  __int16 v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"SettingsTelephonyCallWaitingChanged" object:self];

  self->_callWaitingEnabled &= ~8u;
}

- (void)_handleNetworkList:(id)a3
{
  if (a3)
  {
    id v5 = [NSDictionary dictionaryWithObject:a3 forKey:@"SettingsTelephonyNetworkListParameter"];
  }
  else
  {
    id v5 = 0;
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"SettingsTelephonyNetworksChanged" object:self userInfo:v5];
}

- (void)_handleCallerIDSettings:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v12, 0xCu);
  }

  if (v4)
  {
    BOOL v6 = [v4 objectForKey:*MEMORY[0x263F03388]];
    unsigned int v7 = [v4 objectForKey:*MEMORY[0x263F03368]];
    if (v6)
    {
      if ([v6 isEqualToString:*MEMORY[0x263F03380]]) {
        unsigned int v8 = 2;
      }
      else {
        unsigned int v8 = 4;
      }
      self->_callerIDIsModifiable = v8;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F03378]])
    {
      unsigned int v9 = 4;
    }
    else if ([v7 isEqualToString:*MEMORY[0x263F03370]])
    {
      unsigned int v9 = 2;
    }
    else
    {
      unsigned int v9 = 8;
    }
    self->_callerIDMode = v9;
  }
  else
  {
    uint64_t v10 = *(void *)&self->_callerIDIsModifiable;
    LODWORD(v10) = v10 & 0xFFFFFFF6 | 8;
    HIDWORD(v10) = HIDWORD(v10) & 0xFFFFFFF6 | 8;
    *(void *)&self->_callerIDIsModifiable = v10;
  }
  unsigned int v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"SettingsTelephonyCallerIDChanged" object:self];

  *(void *)&self->_callerIDIsModifiable &= 0xFFFFFFF7FFFFFFF7;
}

- (void)_handleCallerIDChanged
{
  [(PhoneSettingsTelephony *)self _resetCallerIDSettings];

  [(PhoneSettingsTelephony *)self _handleCallerIDSettings:0];
}

- (void)_handleSIMLockSettings:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "Handling SIM lock settings changed with user info: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
  {
    BOOL v6 = [v4 objectForKey:*MEMORY[0x263F033A8]];
    if ([v6 BOOLValue]) {
      unsigned int v7 = 2;
    }
    else {
      unsigned int v7 = 4;
    }
    self->_unsigned int simLocked = v7;
  }
  else
  {
    self->_unsigned int simLocked = self->_simLocked & 0xFFFFFFF6 | 8;
  }
  unsigned int v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:@"SettingsTelephonySIMLockChanged" object:self];

  self->_simLocked &= ~8u;
}

- (void)_handlePINSettings:(id)a3
{
  id v4 = NSDictionary;
  id v5 = [NSNumber numberWithBool:a3 != 0];
  id v7 = [v4 dictionaryWithObject:v5 forKey:@"success"];

  BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"SettingsTelephonyPINChangedNotification" object:self userInfo:v7];
}

- (void)_requestCallForwardingSettingsForReason:(id)a3
{
  id v4 = NSDictionary;
  uint64_t v5 = *MEMORY[0x263F033F8];
  uint64_t v6 = *MEMORY[0x263F033F0];
  uint64_t v7 = *MEMORY[0x263F03328];
  uint64_t v8 = *MEMORY[0x263F03320];
  uint64_t v9 = *MEMORY[0x263F03338];
  id v10 = a3;
  objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v10, @"STSettingTypeUniqueIdentifier", v5, v6, v7, v8, v10, v9, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [(PhoneSettingsTelephony *)self _callForwardingSettingsForForwardingReason:v10];

  [v11 setCallForwardingState:1];
  [(PhoneSettingsTelephony *)self _requestSettings:v12];
}

- (void)_saveCallForwardingEnabled:(BOOL)a3 number:(id)a4 forwardingReason:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v13 = [(PhoneSettingsTelephony *)self _callForwardingSettingsForForwardingReason:v8];
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  [v10 setObject:v8 forKey:@"STSettingTypeUniqueIdentifier"];
  [v10 setObject:*MEMORY[0x263F033F8] forKey:*MEMORY[0x263F033F0]];
  [v10 setObject:*MEMORY[0x263F03328] forKey:*MEMORY[0x263F03320]];
  [v10 setObject:v8 forKey:*MEMORY[0x263F03338]];

  uint64_t v11 = (void *)MEMORY[0x263EFFB40];
  if (!v6) {
    uint64_t v11 = (void *)MEMORY[0x263EFFB38];
  }
  [v10 setObject:*v11 forKey:*MEMORY[0x263F033A8]];
  id v12 = UIUnformattedPhoneNumberFromString();

  if (v12) {
    [v10 setObject:v12 forKey:*MEMORY[0x263F03330]];
  }
  objc_msgSend(v13, "setCallForwardingState:", objc_msgSend(v13, "callForwardingState") | 1);
  [(PhoneSettingsTelephony *)self _saveSettings:v10];
}

- (void)_requestSettings:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "[PhoneSettingsTelephony _requestSettings:]: Settings dictionary requested is %@", (uint8_t *)&v10, 0xCu);
  }

  pendingRequests = self->_pendingRequests;
  if (!pendingRequests)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = self->_pendingRequests;
    self->_pendingRequests = v7;

    pendingRequests = self->_pendingRequests;
  }
  id v9 = [v4 objectForKey:@"STSettingTypeUniqueIdentifier"];
  [(NSMutableDictionary *)pendingRequests setObject:v4 forKey:v9];

  CTSettingRequest();
}

- (void)_saveSettings:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  pendingSaves = self->_pendingSaves;
  if (!pendingSaves)
  {
    BOOL v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = self->_pendingSaves;
    self->_pendingSaves = v6;

    pendingSaves = self->_pendingSaves;
  }
  id v8 = [v4 objectForKey:@"STSettingTypeUniqueIdentifier"];
  [(NSMutableDictionary *)pendingSaves setObject:v4 forKey:v8];

  id v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_22C120000, v9, OS_LOG_TYPE_DEFAULT, "SAVE SETTINGS: %@", (uint8_t *)&v10, 0xCu);
  }

  CTSettingSave();
}

- (void)_simRemoved
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    BOOL v6 = @"SettingsTelephonySIMRemoved";
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"SettingsTelephonySIMRemoved" object:self];

  [(PhoneSettingsTelephony *)self _reset];
}

- (void)_simPUKLocked
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    BOOL v6 = @"SettingsTelephonySIMPUKLocked";
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"SettingsTelephonySIMPUKLocked" object:self];
}

- (void)_networkSettingsDisabled
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    BOOL v6 = @"SettingsTelephonyNetworkSettingsDisabledNotification";
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"SettingsTelephonyNetworkSettingsDisabledNotification" object:self];
}

- (void)_phoneBookSelected
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *((unsigned char *)self + 112) & 1;
    newNumber = self->_newNumber;
    v6[0] = 67109378;
    v6[1] = v4;
    __int16 v7 = 2112;
    id v8 = newNumber;
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "Phone book selected, _savingPhoneNumber=%d, _newNumber=%@", (uint8_t *)v6, 0x12u);
  }

  if (*((unsigned char *)self + 112))
  {
    *((unsigned char *)self + 112) |= 2u;
    [(PhoneSettingsTelephony *)self serverConnection];
    _CTServerConnectionSavePhonebookEntry();
  }
}

- (void)_phoneNumberSaveFinishedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109120;
    LODWORD(v17) = v3;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "Phone number save finished with success=%d", (uint8_t *)&v16, 8u);
  }

  *((unsigned char *)self + 112) &= ~1u;
  newNumber = self->_newNumber;
  if (v3)
  {
    if (newNumber)
    {
      id active = (const void *)CPPhoneNumberCopyActiveCountryCode();
      id v8 = PHDefaultLog();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (active)
      {
        if (v9)
        {
          int v16 = 138412546;
          uint64_t v17 = newNumber;
          __int16 v18 = 2112;
          id v19 = active;
          _os_log_impl(&dword_22C120000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to format digits %@ using ISO country code %@", (uint8_t *)&v16, 0x16u);
        }

        int v10 = (NSString *)PNCreateFormattedStringWithCountry();
        myNumber = self->_myNumber;
        self->_myNumber = v10;

        CFRelease(active);
      }
      else
      {
        if (v9)
        {
          int v16 = 138412290;
          uint64_t v17 = newNumber;
          _os_log_impl(&dword_22C120000, v8, OS_LOG_TYPE_DEFAULT, "Could not determine the country code for the digits %@.", (uint8_t *)&v16, 0xCu);
        }
      }
    }
    id v13 = PHDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = self->_myNumber;
      int v16 = 138412290;
      uint64_t v17 = v14;
      _os_log_impl(&dword_22C120000, v13, OS_LOG_TYPE_DEFAULT, "Phone settings just got success for setting this number: %@", (uint8_t *)&v16, 0xCu);
    }

    newNumber = self->_newNumber;
    uint64_t v12 = @"SettingsTelephonySetMyNumberSuccessNotification";
  }
  else
  {
    uint64_t v12 = @"SettingsTelephonySetMyNumberFailureNotification";
  }
  self->_newNumber = 0;

  uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 postNotificationName:v12 object:self];
}

- (void)_phoneNumberWritten
{
  int v2 = *((unsigned __int8 *)self + 112);
  *((unsigned char *)self + 112) = v2 | 4;
  if ((~v2 & 3) == 0) {
    [(PhoneSettingsTelephony *)self _phoneNumberSaveFinishedWithSuccess:1];
  }
}

- (void)_phoneNumberChanged
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "Received phone number changed notification", (uint8_t *)v7, 2u);
  }

  myNumber = self->_myNumber;
  self->_myNumber = 0;

  if ((~*((unsigned __int8 *)self + 112) & 7) == 0)
  {
    int v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = *((unsigned __int8 *)self + 112);
      v7[0] = 67109632;
      v7[1] = v6 & 1;
      __int16 v8 = 1024;
      int v9 = (v6 >> 1) & 1;
      __int16 v10 = 1024;
      int v11 = (v6 >> 2) & 1;
      _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "Promoting to a save finished with success notification: _savingPhoneNumber=%d, _phoneBookSelected=%d, _phoneNumberWritten=%d", (uint8_t *)v7, 0x14u);
    }

    [(PhoneSettingsTelephony *)self _phoneNumberSaveFinishedWithSuccess:1];
  }
}

- (id)descriptionDictionary
{
  BOOL v3 = [(PhoneSettingsTelephony *)self manuallySelectedNetworkDictionary];
  int v4 = NSDictionary;
  int v5 = v3;
  if (!v3)
  {
    int v5 = [NSString stringWithFormat:@"No Manual Network Dictionary"];
  }
  unsigned int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[PhoneSettingsTelephony networkSelectionMode](self, "networkSelectionMode"));
  __int16 v7 = (void *)CTRegistrationCopyLocalizedOperatorName();
  __int16 v8 = objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, @"ManuallySelectedNetworkDictionary", v6, @"NetworkSelectionMode", v7, @"CTRegistrationCopyLocalizedOperatorName", CTRegistrationGetStatus(), @"CTRegistrationGetStatus", 0);
  int v9 = [v4 dictionaryWithObject:v8 forKey:@"PhoneSettingsNetworkState"];

  if (!v3) {

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newNumber, 0);
  objc_storeStrong((id *)&self->_cachedPassword, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callForwardingSettingsNotReachable, 0);
  objc_storeStrong((id *)&self->_callForwardingSettingsNoReply, 0);
  objc_storeStrong((id *)&self->_callForwardingSettingsMobileBusy, 0);
  objc_storeStrong((id *)&self->_callForwardingSettingsUnconditional, 0);
  objc_storeStrong((id *)&self->_myNumber, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);

  objc_storeStrong((id *)&self->_pendingSaves, 0);
}

- (void)setMyNumber:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22C120000, v0, v1, "*** _CTServerConnectionSelectPhonebook returned error=%d domain=%d", v2, v3);
}

- (void)hasSubscriberIdentity
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22C120000, v0, v1, "Error calling _CTServerConnectionCopyMobileEquipmentInfo(): error=%d, domain=%d", v2, v3);
}

@end