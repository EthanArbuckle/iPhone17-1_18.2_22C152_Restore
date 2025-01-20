@interface AXPearlSettingsController
- (id)_pearlDevice;
- (id)attentionAware:(id)a3;
- (id)authenticationHaptics:(id)a3;
- (id)pearlUnlock:(id)a3;
- (id)specifiers;
- (void)devicePINControllerDidDismissPINPane:(id)a3;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)setAttentionAware:(id)a3 specifier:(id)a4;
- (void)setAuthenticationHaptics:(id)a3 specifier:(id)a4;
- (void)setPearlUnlock:(id)a3 specifier:(id)a4;
- (void)showPINSheet:(id)a3;
- (void)updateAttentionSpec;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXPearlSettingsController

- (void)updateAttentionSpec
{
  v3 = [(AXPearlSettingsController *)self specifierForID:@"AttentionAware"];
  v4 = objc_opt_new();
  id v11 = 0;
  id v5 = [v4 isDistanceSamplingEnabledWithError:&v11];
  id v6 = v11;
  v7 = AXLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = +[NSNumber numberWithBool:v5];
    *(_DWORD *)buf = 138412546;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Handling screen distance (enabled: %@) error: %@", buf, 0x16u);
  }
  if (v5) {
    BOOL v9 = _AXSAttentionAwarenessFeaturesEnabled() == 0;
  }
  else {
    BOOL v9 = 1;
  }
  v10 = +[NSNumber numberWithBool:v9];
  [v3 setProperty:v10 forKey:PSEnabledKey];

  [(AXPearlSettingsController *)self reloadSpecifier:v3];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    if (AXDeviceHasPearl())
    {
      id v6 = settingsLocString(@"Pearl_Unlock_Attention_Title", @"Accessibility");
      v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setPearlUnlock:specifier:" get:"pearlUnlock:" detail:0 cell:6 edit:0];

      uint64_t v8 = PSKeyNameKey;
      [v7 setProperty:@"PearlUnlockAttention" forKey:PSKeyNameKey];
      uint64_t v9 = PSIDKey;
      [v7 setProperty:@"PearlUnlockAttention" forKey:PSIDKey];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = PSCellClassKey;
      [v7 setProperty:v10 forKey:PSCellClassKey];
      v12 = settingsLocString(@"Pearl_Attention_Title", @"Accessibility");
      v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"setAttentionAware:specifier:" get:"attentionAware:" detail:0 cell:6 edit:0];

      [v13 setProperty:@"AttentionAware" forKey:v8];
      uint64_t v31 = v9;
      [v13 setProperty:@"AttentionAware" forKey:v9];
      uint64_t v30 = v11;
      [v13 setProperty:objc_opt_class() forKey:v11];
      __int16 v14 = +[PSSpecifier groupSpecifierWithName:0];
      [v5 addObject:v14];
      id v15 = +[MCProfileConnection sharedConnection];
      LOBYTE(v8) = [v15 isPasscodeSet];

      if (v8)
      {
        v16 = AXLocStringKeyForModel();
        v17 = settingsLocString(v16, @"Accessibility");
        uint64_t v18 = PSFooterTextGroupKey;
        [v14 setProperty:v17 forKey:PSFooterTextGroupKey];

        [v5 addObject:v7];
        uint64_t v19 = +[PSSpecifier groupSpecifierWithName:0];

        [v5 addObject:v19];
        __int16 v14 = (void *)v19;
      }
      else
      {
        uint64_t v18 = PSFooterTextGroupKey;
      }
      v20 = AXLocStringKeyForModel();
      v21 = settingsLocString(v20, @"Accessibility");
      [v14 setProperty:v21 forKey:v18];

      [v5 addObject:v13];
      if (MGGetBoolAnswer())
      {
        v22 = settingsLocString(@"Pearl_Success_Haptic_Group", @"Accessibility");
        v23 = +[PSSpecifier groupSpecifierWithName:v22];

        v24 = AXLocStringKeyForModel();
        v25 = settingsLocString(v24, @"Accessibility");
        [v23 setProperty:v25 forKey:v18];

        [v23 setProperty:@"PearlSuccessHapticGroup" forKey:v31];
        [v5 addObject:v23];
        v26 = settingsLocString(@"Pearl_Success_Haptic", @"Accessibility");
        v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:"setAuthenticationHaptics:specifier:" get:"authenticationHaptics:" detail:0 cell:6 edit:0];

        [v27 setProperty:@"PearlSuccessHaptic" forKey:v31];
        [v27 setProperty:objc_opt_class() forKey:v30];
        [v5 addObject:v27];

        __int16 v14 = v23;
      }
    }
    v28 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)setAuthenticationHaptics:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSSetPearlAuthenticationHapticsEnabled(v4);
}

- (id)authenticationHaptics:(id)a3
{
  uint64_t v3 = _AXSPearlAuthenticationHapticsEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setAttentionAware:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (+[DevicePINController settingEnabled])
  {
    objc_storeStrong((id *)&self->_currentPinSpecifier, a4);
    [(AXPearlSettingsController *)self showPINSheet:self->_currentPinSpecifier];
  }
  else
  {
    [v7 BOOLValue];
    _AXSSetAttentionAwarenessFeaturesEnabled();
    [(AXPearlSettingsController *)self updateAttentionSpec];
  }
}

- (id)attentionAware:(id)a3
{
  uint64_t v3 = _AXSAttentionAwarenessFeaturesEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setPearlUnlock:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __54__AXPearlSettingsController_setPearlUnlock_specifier___block_invoke;
  v25[3] = &unk_209510;
  v25[4] = self;
  id v8 = v6;
  id v26 = v8;
  id v9 = v7;
  id v27 = v9;
  uint64_t v10 = objc_retainBlock(v25);
  if ([v8 BOOLValue])
  {
    ((void (*)(void *))v10[2])(v10);
  }
  else
  {
    uint64_t v11 = settingsLocString(@"PEARL_UNLOCK_ALERT_TITLE", @"Accessibility");
    v12 = AXLocStringKeyForModel();
    v13 = settingsLocString(v12, @"Accessibility");
    __int16 v14 = +[UIAlertController alertControllerWithTitle:v11 message:v13 preferredStyle:1];

    id v15 = settingsLocString(@"CANCEL", @"Accessibility");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __54__AXPearlSettingsController_setPearlUnlock_specifier___block_invoke_339;
    v24[3] = &unk_208B68;
    v24[4] = self;
    v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v24];

    [v14 addAction:v16];
    v17 = settingsLocString(@"OK", @"Accessibility");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __54__AXPearlSettingsController_setPearlUnlock_specifier___block_invoke_2;
    v22[3] = &unk_2088D0;
    v23 = v10;
    uint64_t v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v22];

    [v14 addAction:v18];
    uint64_t v19 = [(AXPearlSettingsController *)self view];
    v20 = [v19 window];
    v21 = [v20 rootViewController];
    [v21 presentViewController:v14 animated:1 completion:0];
  }
}

void __54__AXPearlSettingsController_setPearlUnlock_specifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _pearlDevice];
  id v16 = 0;
  uint64_t v3 = [v2 protectedConfigurationForUser:getuid() error:&v16];
  id v4 = v16;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v3;

  if (v4)
  {
    id v7 = +[AXSubsystemAXSettings sharedInstance];
    unsigned __int8 v8 = [v7 ignoreLogging];

    if ((v8 & 1) == 0)
    {
      id v9 = +[AXSubsystemAXSettings identifier];
      uint64_t v10 = AXLoggerForFacility();

      os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = AXColorizeFormatLog();
        v13 = _AXStringForArgs();
        if (os_log_type_enabled(v10, v11))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v13;
          _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 200);
  *(void *)(v14 + 200) = 0;

  [*(id *)(*(void *)(a1 + 32) + 208) setAttentionDetectionEnabled:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(a1 + 48));
  [*(id *)(a1 + 32) showPINSheet:*(void *)(a1 + 48)];
}

void __54__AXPearlSettingsController_setPearlUnlock_specifier___block_invoke_339(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 specifierForID:@"PearlUnlockAttention"];
  [v1 reloadSpecifier:v2 animated:1];
}

uint64_t __54__AXPearlSettingsController_setPearlUnlock_specifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXPearlSettingsController;
  [(AXPearlSettingsController *)&v4 viewWillAppear:a3];
  if (AXDeviceHasPearl()) {
    [(AXPearlSettingsController *)self updateAttentionSpec];
  }
}

- (id)pearlUnlock:(id)a3
{
  uint64_t v3 = [(AXPearlSettingsController *)self _pearlDevice];
  id v25 = 0;
  objc_super v4 = [v3 protectedConfigurationForUser:getuid() error:&v25];
  id v5 = v25;

  if (v5)
  {
    id v6 = +[AXSubsystemAXSettings sharedInstance];
    unsigned __int8 v7 = [v6 ignoreLogging];

    if ((v7 & 1) == 0)
    {
      unsigned __int8 v8 = +[AXSubsystemAXSettings identifier];
      id v9 = AXLoggerForFacility();

      os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        os_log_type_t v11 = AXColorizeFormatLog();
        id v22 = v5;
        v12 = _AXStringForArgs();
        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138543362;
          id v27 = v12;
          _os_log_impl(&dword_0, v9, v10, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  v13 = +[AXSubsystemAXSettings sharedInstance];
  unsigned __int8 v14 = [v13 ignoreLogging];

  if ((v14 & 1) == 0)
  {
    id v15 = +[AXSubsystemAXSettings identifier];
    id v16 = AXLoggerForFacility();

    os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = AXColorizeFormatLog();
      [v4 attentionDetectionEnabled];
      v24 = v23 = v4;
      uint64_t v19 = _AXStringForArgs();

      if (os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v19;
        _os_log_impl(&dword_0, v16, v17, "%{public}@", buf, 0xCu);
      }
    }
  }
  v20 = objc_msgSend(v4, "attentionDetectionEnabled", v23, v24);

  return v20;
}

- (void)showPINSheet:(id)a3
{
  objc_storeStrong((id *)&self->_currentPinSpecifier, a3);
  id v5 = a3;
  [v5 setEditPaneClass:objc_opt_class()];
  id v6 = +[NSNumber numberWithInt:3];
  [v5 setProperty:v6 forKey:@"mode"];

  [v5 setProperty:@"DevicePINController" forKey:PSSetupCustomClassKey];
  v7.receiver = self;
  v7.super_class = (Class)AXPearlSettingsController;
  [(AXPearlSettingsController *)&v7 showPINSheet:v5];
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_pinCode, a3);
  uint64_t v6 = PSKeyNameKey;
  objc_super v7 = [(PSSpecifier *)self->_currentPinSpecifier propertyForKey:PSKeyNameKey];
  unsigned int v8 = [v7 isEqualToString:@"PearlUnlockAttention"];

  if (v8)
  {
    id v9 = self->_pinCode;
    if (!v9)
    {
      id v13 = 0;
LABEL_19:

      id v22 = [(AXPearlSettingsController *)self _pearlDevice];
      updatedConfig = self->_updatedConfig;
      id v41 = 0;
      [v22 setProtectedConfiguration:updatedConfig forUser:getuid() credentialSet:v13 error:&v41];
      v24 = (BKUserProtectedConfiguration *)v41;

      id v25 = +[AXSubsystemAXSettings sharedInstance];
      unsigned __int8 v26 = [v25 ignoreLogging];

      if ((v26 & 1) == 0)
      {
        id v27 = +[AXSubsystemAXSettings identifier];
        v28 = AXLoggerForFacility();

        os_log_type_t v29 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = AXColorizeFormatLog();
          v40 = self->_updatedConfig;
          uint64_t v31 = _AXStringForArgs();
          if (os_log_type_enabled(v28, v29))
          {
            LODWORD(v48) = 138543362;
            *(void *)((char *)&v48 + 4) = v31;
            _os_log_impl(&dword_0, v28, v29, "%{public}@", (uint8_t *)&v48, 0xCu);
          }
        }
      }
      if (v24)
      {
        v32 = +[AXSubsystemAXSettings sharedInstance];
        unsigned __int8 v33 = [v32 ignoreLogging];

        if ((v33 & 1) == 0)
        {
          v34 = +[AXSubsystemAXSettings identifier];
          v35 = AXLoggerForFacility();

          os_log_type_t v36 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v35, v36))
          {
            v37 = AXColorizeFormatLog();
            v40 = v24;
            v38 = _AXStringForArgs();
            if (os_log_type_enabled(v35, v36))
            {
              LODWORD(v48) = 138543362;
              *(void *)((char *)&v48 + 4) = v38;
              _os_log_impl(&dword_0, v35, v36, "%{public}@", (uint8_t *)&v48, 0xCu);
            }
          }
        }
      }

      goto LABEL_33;
    }
    *(void *)&long long v48 = 0;
    *((void *)&v48 + 1) = &v48;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__5;
    v51 = __Block_byref_object_dispose__5;
    id v52 = 0;
    v42 = 0;
    uint64_t v10 = ACMContextCreate((uint64_t *)&v42);
    if (v10)
    {
      os_log_type_t v11 = +[AXSubsystemAXSettings sharedInstance];
      unsigned __int8 v12 = [v11 ignoreLogging];

      if (v12)
      {
        id v13 = 0;
LABEL_18:
        _Block_object_dispose(&v48, 8);

        goto LABEL_19;
      }
      uint64_t v18 = +[AXSubsystemAXSettings identifier];
      os_log_type_t v17 = AXLoggerForFacility();

      os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v17, v19))
      {
        v20 = AXColorizeFormatLog();
        v40 = (BKUserProtectedConfiguration *)v10;
        v21 = _AXStringForArgs();
        if (os_log_type_enabled(v17, v19))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v21;
          _os_log_impl(&dword_0, v17, v19, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      id v13 = 0;
    }
    else
    {
      id v16 = v42;
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v44 = __credentialSetWithPasscodeCredential_block_invoke;
      v45 = &unk_20C550;
      v47 = &v48;
      v46 = v9;
      ACMContextGetExternalForm(v16, (uint64_t)&buf);
      if (v42) {
        ACMContextDelete(v42, 0);
      }
      id v13 = *(id *)(*((void *)&v48 + 1) + 40);
      os_log_type_t v17 = v46;
    }

    goto LABEL_18;
  }
  unsigned __int8 v14 = [(PSSpecifier *)self->_currentPinSpecifier propertyForKey:v6];
  unsigned int v15 = [v14 isEqualToString:@"AttentionAware"];

  if (v15)
  {
    _AXSAttentionAwarenessFeaturesEnabled();
    _AXSSetAttentionAwarenessFeaturesEnabled();
  }
LABEL_33:
  -[AXPearlSettingsController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_currentPinSpecifier, 1, v40);
  currentPinSpecifier = self->_currentPinSpecifier;
  self->_currentPinSpecifier = 0;
}

- (void)didCancelEnteringPIN
{
  [(AXPearlSettingsController *)self reloadSpecifier:self->_currentPinSpecifier animated:1];
  currentPinSpecifier = self->_currentPinSpecifier;
  self->_currentPinSpecifier = 0;
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  [(AXPearlSettingsController *)self reloadSpecifier:self->_currentPinSpecifier animated:1];
  currentPinSpecifier = self->_currentPinSpecifier;
  self->_currentPinSpecifier = 0;
}

- (id)_pearlDevice
{
  pearlDevice = self->_pearlDevice;
  if (pearlDevice)
  {
    uint64_t v3 = pearlDevice;
  }
  else
  {
    location = (id *)&self->_pearlDevice;
    +[BKDeviceManager availableDevices];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    id v5 = &swift_allocBox_ptr;
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = *(void *)v45;
      unsigned int v8 = &swift_allocBox_ptr;
      while (2)
      {
        id v9 = 0;
        id v41 = v6;
        do
        {
          if (*(void *)v45 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v9);
          os_log_type_t v11 = v8[500];
          id v43 = 0;
          unsigned __int8 v12 = [v11 deviceWithDescriptor:v10 error:&v43];
          id v13 = v43;
          if (v13)
          {
            unsigned __int8 v14 = [v5[466] sharedInstance];
            unsigned __int8 v15 = [v14 ignoreLogging];

            if ((v15 & 1) == 0)
            {
              uint64_t v16 = v7;
              os_log_type_t v17 = v8;
              uint64_t v18 = v5;
              os_log_type_t v19 = [v5[466] identifier];
              v20 = AXLoggerForFacility();

              os_log_type_t v21 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v20, v21))
              {
                id v22 = AXColorizeFormatLog();
                id v39 = v13;
                v23 = _AXStringForArgs();
                if (os_log_type_enabled(v20, v21))
                {
                  *(_DWORD *)long long buf = 138543362;
                  uint64_t v49 = v23;
                  _os_log_impl(&dword_0, v20, v21, "%{public}@", buf, 0xCu);
                }
              }
              id v5 = v18;
              unsigned int v8 = v17;
              uint64_t v7 = v16;
              id v6 = v41;
            }
          }
          v24 = objc_msgSend(v12, "descriptor", v39);
          if ([v24 type] == (char *)&dword_0 + 2)
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              objc_storeStrong(location, v12);
              v28 = [v5[466] sharedInstance];
              unsigned __int8 v29 = [v28 ignoreLogging];

              if ((v29 & 1) == 0)
              {
                uint64_t v30 = [v5[466] identifier];
                uint64_t v31 = AXLoggerForFacility();

                os_log_type_t v32 = AXOSLogLevelFromAXLogLevel();
                if (os_log_type_enabled(v31, v32))
                {
                  unsigned __int8 v33 = AXColorizeFormatLog();
                  v34 = _AXStringForArgs();
                  if (os_log_type_enabled(v31, v32))
                  {
                    *(_DWORD *)long long buf = 138543362;
                    uint64_t v49 = v34;
                    _os_log_impl(&dword_0, v31, v32, "%{public}@", buf, 0xCu);
                  }
                }
              }
              uint64_t v3 = (BKDevicePearl *)*location;
              v35 = obj;
              goto LABEL_30;
            }
          }
          else
          {
          }
          id v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        id v6 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    unsigned __int8 v26 = [v5[466] sharedInstance];
    unsigned __int8 v27 = [v26 ignoreLogging];

    if (v27)
    {
      uint64_t v3 = 0;
    }
    else
    {
      v37 = [v5[466] identifier];
      v35 = AXLoggerForFacility();

      os_log_type_t v38 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v35, v38))
      {
        AXColorizeFormatLog();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        unsigned __int8 v12 = _AXStringForArgs();
        if (os_log_type_enabled(v35, v38))
        {
          *(_DWORD *)long long buf = 138543362;
          uint64_t v49 = v12;
          _os_log_impl(&dword_0, v35, v38, "%{public}@", buf, 0xCu);
        }
        uint64_t v3 = 0;
LABEL_30:
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedConfig, 0);
  objc_storeStrong((id *)&self->_pinCode, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);

  objc_storeStrong((id *)&self->_currentPinSpecifier, 0);
}

@end