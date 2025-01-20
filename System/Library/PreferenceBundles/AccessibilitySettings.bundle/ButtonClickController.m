@interface ButtonClickController
- (BOOL)_hasSideButtonOnly;
- (BOOL)applePayEnabled;
- (BOOL)hasPasscodeAndBiometric;
- (BOOL)hasPasscodeOrBiometric;
- (BOOL)isPasscodeSet;
- (BOOL)passcodeForPurchasesEnabled;
- (BOOL)usesTopButtonForMesa;
- (NSIndexPath)selectedIndexPath;
- (NSString)pinCode;
- (NSTimer)flashTimer;
- (NSTimer)vibrationTimer;
- (PSSpecifier)currentPinSpecifier;
- (__CFDictionary)_vibrationPattern;
- (float)_buttonClickSpeedFromSpecifierKey:(id)a3;
- (id)_footerTextForHomeButtonAssistantOption:(int)a3;
- (id)passcodeForPurchases:(id)a3;
- (id)restingUnlock:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)voiceControlLanguage:(id)a3;
- (id)voiceControlLanguageSpecifiers;
- (int64_t)flashCount;
- (int64_t)storeState;
- (void)_flashSelectedRow;
- (void)_handleAXSettingChanged;
- (void)_resetPinSpecifier;
- (void)_vibrateSelectedRow;
- (void)dealloc;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)jumpToAssistiveTouchSettings:(id)a3;
- (void)jumpToSwitchControlSettings:(id)a3;
- (void)setApplePayEnabled:(BOOL)a3;
- (void)setCurrentPinSpecifier:(id)a3;
- (void)setFlashCount:(int64_t)a3;
- (void)setFlashTimer:(id)a3;
- (void)setPasscodeForPurchases:(id)a3 specifier:(id)a4;
- (void)setPasscodeForPurchasesEnabled:(BOOL)a3;
- (void)setPinCode:(id)a3;
- (void)setRestingUnlock:(id)a3 specifier:(id)a4;
- (void)setSelectedIndexPath:(id)a3;
- (void)setStoreState:(int64_t)a3;
- (void)setVibrationTimer:(id)a3;
- (void)showPINSheet:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateStoreState;
- (void)updateVoiceControlLanguageSpecifiers;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ButtonClickController

- (void)dealloc
{
  v3 = [(ButtonClickController *)self flashTimer];
  [v3 invalidate];

  v4 = [(ButtonClickController *)self vibrationTimer];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)ButtonClickController;
  [(ButtonClickController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)ButtonClickController;
  [(ButtonClickController *)&v6 viewDidLoad];
  if (AXDeviceHasTopTouchIDButton())
  {
    v3 = settingsLocStringTopTouchIDButton(@"LockButtonTitle_IPAD_TOUCHID");
    v4 = [(ButtonClickController *)self navigationItem];
    [v4 setTitle:v3];
  }
  else
  {
    if (![(ButtonClickController *)self _hasSideButtonOnly]) {
      return;
    }
    v3 = AXLocStringKeyForExclusiveModel();
    v4 = settingsLocString(v3, @"Accessibility");
    objc_super v5 = [(ButtonClickController *)self navigationItem];
    [v5 setTitle:v4];
  }
  [(ButtonClickController *)self updateStoreState];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ButtonClickController;
  [(ButtonClickController *)&v5 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleAXSettingChanged" name:UIAccessibilitySwitchControlStatusDidChangeNotification object:0];
  [v4 addObserver:self selector:"_handleAXSettingChanged" name:kAXSAssistiveTouchEnabledNotification object:0];
}

- (void)updateVoiceControlLanguageSpecifiers
{
  if (_AXSHomeButtonAssistant() == 1)
  {
    v3 = [(ButtonClickController *)self specifierForKey:@"VCLanguageGroup"];

    if (v3) {
      return;
    }
    id v7 = [(ButtonClickController *)self voiceControlLanguageSpecifiers];
    objc_super v6 = [(ButtonClickController *)self specifierForKey:@"assistantChoiceOff"];
    [(ButtonClickController *)self insertContiguousSpecifiers:v7 afterSpecifier:v6 animated:1];
  }
  else
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    v4 = [(ButtonClickController *)self specifierForKey:@"VCLanguageGroup"];
    [v7 axSafelyAddObject:v4];

    objc_super v5 = [(ButtonClickController *)self specifierForKey:@"VCLanguageSetting"];
    [v7 axSafelyAddObject:v5];

    [(ButtonClickController *)self removeContiguousSpecifiers:v7 animated:1];
  }
}

- (id)voiceControlLanguageSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (_AXSHomeButtonAssistant() == 1)
  {
    v4 = +[NSMutableArray array];
    objc_super v5 = settingsLocString(@"HomeButtonAssistantVCLanguageGroup", @"HomeClickSettings");
    objc_super v6 = +[PSSpecifier groupSpecifierWithName:v5];

    uint64_t v7 = PSKeyNameKey;
    [v6 setProperty:@"VCLanguageGroup" forKey:PSKeyNameKey];
    [v4 addObject:v6];
    v8 = settingsLocString(@"HomeButtonAssistantVCLanguageTitle", @"HomeClickSettings");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"voiceControlLanguage:" detail:objc_opt_class() cell:2 edit:0];

    [v9 setProperty:@"VCLanguageSetting" forKey:v7];
    [v4 addObject:v9];
    [v3 addObject:v6];
    [v3 addObject:v9];
  }

  return v3;
}

- (BOOL)_hasSideButtonOnly
{
  return AXDeviceHasHomeButton() ^ 1;
}

- (id)_footerTextForHomeButtonAssistantOption:(int)a3
{
  id v3 = AXLocStringKeyForHomeButtonAndExclusiveModel();
  if (AXDeviceHasTopTouchIDButton())
  {
    v4 = +[NSString stringWithFormat:@"%@%@", v3, @"_TOUCHID"];
    objc_super v5 = settingsLocStringTopTouchIDButton(v4);
  }
  else
  {
    objc_super v5 = settingsLocString(v3, @"HomeClickSettings");
  }

  return v5;
}

- (BOOL)usesTopButtonForMesa
{
  if (!AXSettingsRestFingerToOpenIsAvailable()) {
    return 0;
  }
  v2 = +[BSPlatform sharedInstance];
  BOOL v3 = [v2 homeButtonType] == (char *)&dword_0 + 2;

  return v3;
}

- (id)specifiers
{
  unsigned int v3 = [(ButtonClickController *)self _hasSideButtonOnly];
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v55 = OBJC_IVAR___PSListController__specifiers;
    objc_super v5 = [(ButtonClickController *)self loadSpecifiersFromPlistName:@"HomeClickSettings" target:self];
    unsigned int v57 = v3;
    v56 = self;
    if ((AXSettingsRestFingerToOpenIsAvailable() & 1) == 0)
    {
      uint64_t v10 = PSFooterTextGroupKey;
LABEL_13:
      v58 = +[NSMutableArray array];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = v5;
      id v15 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
      if (!v15) {
        goto LABEL_60;
      }
      id v16 = v15;
      uint64_t v17 = *(void *)v63;
      uint64_t v60 = PSKeyNameKey;
      uint64_t v61 = v10;
      while (1)
      {
        v18 = 0;
        do
        {
          if (*(void *)v63 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v18);
          v20 = [v19 propertyForKey:v60];
          unsigned int v21 = [v20 isEqualToString:@"HOME_SPEED_HEADER"];

          if (v21)
          {
            v22 = @"HOME_CLICK_INSTRUCTIONS";
            if (v3)
            {
              AXLocStringKeyForHomeButtonAndExclusiveModel();
              v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v23 = settingsLocString(v22, @"Accessibility");
              [v19 setProperty:v23 forKey:v61];

              if (AXDeviceHasTopTouchIDButton())
              {
                v24 = settingsLocStringTopTouchIDButton(@"HOME_CLICK_INSTRUCTIONS_IPAD_TOUCHID");
                [v19 setProperty:v24 forKey:v61];
              }
            }

            goto LABEL_23;
          }
          v25 = [v19 propertyForKey:v60];
          unsigned int v26 = [v25 isEqualToString:@"assistantChoiceSiri"];

          if (v26)
          {
            char v27 = AFAssistantCapable();
            goto LABEL_28;
          }
          v28 = [v19 propertyForKey:v60];
          unsigned int v29 = [v28 isEqualToString:@"assistantChoiceVoiceControl"];

          if (v29)
          {
            char v27 = MGGetBoolAnswer();
LABEL_28:
            uint64_t v10 = v61;
            if (v27) {
              goto LABEL_30;
            }
LABEL_29:
            [v58 addObject:v19];
            goto LABEL_30;
          }
          v30 = [v19 propertyForKey:v60];
          unsigned int v31 = [v30 isEqualToString:@"applePayGroup"];

          if (v31)
          {
            if (!AXDeviceHasPearl()
              || ![(ButtonClickController *)v56 hasPasscodeOrBiometric])
            {
              [v58 addObject:v19];
LABEL_23:
              uint64_t v10 = v61;
              goto LABEL_30;
            }
            if (AXDeviceHasTopTouchIDButton())
            {
              v32 = settingsLocStringTopTouchIDButton(@"APPLE_PAY_IPAD_TOUCHID");
              [v19 setName:v32];
            }
            else
            {
              if (AXDeviceIsPad()) {
                v39 = @"APPLE_PAY_HEADING_IPAD";
              }
              else {
                v39 = @"APPLE_PAY_HEADING";
              }
              v32 = settingsLocString(v39, @"HomeClickSettings");
              [v19 setProperty:v32 forKey:v60];
            }

            v40 = +[BiometricKit manager];
            v41 = [v40 identities:0];
            id v42 = [v41 count];

            int IsPad = AXDeviceIsPad();
            if (v42)
            {
              v44 = @"APPLE_PAY_FOOTER_IPAD";
              if (!IsPad)
              {
LABEL_57:
                unsigned int v3 = v57;
                uint64_t v10 = v61;
                if (AXDeviceHasTopTouchIDButton())
                {
                  v47 = settingsLocStringTopTouchIDButton(@"APPLE_PAY_FOOTER_PASSCODE_IPAD_TOUCHID");
                  [v19 setProperty:v47 forKey:v61];
                }
                goto LABEL_30;
              }
            }
            else
            {
              v45 = @"APPLE_PAY_FOOTER_PASSCODE";
              if (IsPad) {
                v45 = @"APPLE_PAY_FOOTER_PASSCODE_IPAD";
              }
              v44 = v45;
            }
            v46 = settingsLocString(v44, @"HomeClickSettings");
            [v19 setProperty:v46 forKey:v61];

            goto LABEL_57;
          }
          v33 = [v19 propertyForKey:v60];
          unsigned int v34 = [v33 isEqualToString:@"applePayChoiceSC"];

          uint64_t v10 = v61;
          if (!v34)
          {
            v35 = [v19 propertyForKey:v60];
            unsigned int v36 = [v35 isEqualToString:@"applePayChoiceAST"];

            if (!v36)
            {
              v37 = [v19 propertyForKey:v60];
              if (([v37 isEqualToString:@"assistantChoiceOff"] & 1) == 0)
              {
                v38 = [v19 propertyForKey:v60];
                [v38 isEqualToString:@"assistantChoiceGroup"];
              }
              unsigned int v3 = v57;
              goto LABEL_23;
            }
          }
          unsigned int v3 = v57;
          if (!AXDeviceHasPearl()
            || ![(ButtonClickController *)v56 hasPasscodeOrBiometric])
          {
            goto LABEL_29;
          }
LABEL_30:
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v48 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
        id v16 = v48;
        if (!v48)
        {
LABEL_60:

          [obj removeObjectsInArray:v58];
          v49 = [(ButtonClickController *)v56 voiceControlLanguageSpecifiers];
          [obj addObjectsFromArray:v49];

          v50 = *(void **)&v56->AXUISettingsBaseListController_opaque[v55];
          *(void *)&v56->AXUISettingsBaseListController_opaque[v55] = obj;
          id v51 = obj;

          v52 = [(ButtonClickController *)v56 _footerTextForHomeButtonAssistantOption:_AXSHomeButtonAssistant()];
          v53 = [(ButtonClickController *)v56 specifierForKey:@"assistantChoiceGroup"];
          [v53 setProperty:v52 forKey:v10];

          v4 = *(void **)&v56->AXUISettingsBaseListController_opaque[v55];
          goto LABEL_61;
        }
      }
    }
    objc_super v6 = +[PSSpecifier groupSpecifierWithName:0];
    if (AXDeviceIsPad())
    {
      if (AXDeviceHasTopTouchIDButton())
      {
        uint64_t v7 = +[NSString stringWithFormat:@"RestingUnlockFooterText_IPAD_NHB_%@", @"TOUCHID"];
        v8 = settingsLocStringTopTouchIDButton(v7);

        unsigned int v3 = v57;
        if (v8) {
          goto LABEL_12;
        }
      }
      if ([(ButtonClickController *)self usesTopButtonForMesa])
      {
        v8 = settingsLocString(@"RestingUnlockFooterText_IPAD_NHB", @"HomeClickSettings");
        if (v8) {
          goto LABEL_12;
        }
      }
      v9 = @"RestingUnlockFooterText_IPAD";
    }
    else
    {
      v9 = @"RestingUnlockFooterText_IPHONE";
    }
    v8 = settingsLocString(v9, @"HomeClickSettings");
LABEL_12:
    uint64_t v11 = PSFooterTextGroupKey;
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];
    [v5 addObject:v6];
    v12 = settingsLocString(@"RestingUnlockSetting", @"HomeClickSettings");
    v13 = self;
    uint64_t v10 = v11;
    v14 = +[PSSpecifier preferenceSpecifierNamed:v12 target:v13 set:"setRestingUnlock:specifier:" get:"restingUnlock:" detail:0 cell:6 edit:0];

    [v5 addObject:v14];
    goto LABEL_13;
  }
LABEL_61:

  return v4;
}

- (void)setRestingUnlock:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  _AXSHomeButtonSetRestingUnlock();
}

- (id)restingUnlock:(id)a3
{
  uint64_t v3 = _AXSHomeButtonRestingUnlock();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)voiceControlLanguage:(id)a3
{
  uint64_t v3 = (const void *)VSPreferencesCopySpokenLanguageIdentifier();
  v4 = +[NSLocale currentLocale];
  objc_super v5 = [v4 localizedStringForLocaleIdentifier:v3];

  if (v3) {
    CFRelease(v3);
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v32.receiver = self;
  v32.super_class = (Class)ButtonClickController;
  objc_super v5 = [(ButtonClickController *)&v32 tableView:a3 cellForRowAtIndexPath:a4];
  objc_super v6 = [v5 specifier];
  uint64_t v7 = [v6 propertyForKey:@"type"];

  unsigned int v8 = [(ButtonClickController *)self _hasSideButtonOnly];
  if ([v7 isEqualToString:@"HOME_CLICK_SPEED"])
  {
    v9 = [v5 specifier];
    uint64_t v10 = [v9 propertyForKey:PSKeyNameKey];
    [(ButtonClickController *)self _buttonClickSpeedFromSpecifierKey:v10];
    float v12 = v11;

    if (v8 && (_AXSSideButtonClickSpeed(), v12 == v13) || (_AXSHomeClickSpeed(), v12 == v14))
    {
      id v15 = v5;
      uint64_t v16 = 1;
    }
    else
    {
      id v15 = v5;
      uint64_t v16 = 0;
    }
    [v15 setChecked:v16];
  }
  else if ([v7 isEqualToString:@"HomeButtonAssistant"])
  {
    int v17 = _AXSHomeButtonAssistant();
    CFStringRef v18 = @"assistantChoiceSiri";
    if (v17 == 2) {
      CFStringRef v18 = @"assistantChoiceOff";
    }
    if (v17 == 1) {
      CFStringRef v19 = @"assistantChoiceVoiceControl";
    }
    else {
      CFStringRef v19 = v18;
    }
    v20 = [v5 specifier];
    unsigned int v21 = [v20 propertyForKey:PSKeyNameKey];
    objc_msgSend(v5, "setChecked:", objc_msgSend(v21, "isEqualToString:", v19));
  }
  else
  {
    v22 = [v5 specifier];
    uint64_t v23 = PSKeyNameKey;
    v24 = [v22 propertyForKey:PSKeyNameKey];
    unsigned int v25 = [v24 isEqualToString:@"applePayChoiceSC"];

    if (v25)
    {
      BOOL v26 = _AXSAssistiveTouchEnabled() == 0;
    }
    else
    {
      char v27 = [v5 specifier];
      v28 = [v27 propertyForKey:v23];
      unsigned int v29 = [v28 isEqualToString:@"applePayChoiceAST"];

      if (!v29) {
        goto LABEL_20;
      }
      BOOL v26 = !UIAccessibilityIsSwitchControlRunning();
    }
    [v5 setCellEnabled:v26];
    v30 = [v5 titleLabel];
    [v30 setNumberOfLines:0];
  }
LABEL_20:

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v76.receiver = self;
  v76.super_class = (Class)ButtonClickController;
  [(ButtonClickController *)&v76 tableView:v6 didSelectRowAtIndexPath:v7];
  v75.receiver = self;
  v75.super_class = (Class)ButtonClickController;
  unsigned int v8 = [(ButtonClickController *)&v75 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = [v8 specifier];
  uint64_t v10 = [v9 propertyForKey:@"type"];

  if ([v10 isEqualToString:@"HOME_CLICK_SPEED"])
  {
    unsigned int v11 = [(ButtonClickController *)self _hasSideButtonOnly];
    float v12 = [v8 specifier];
    float v13 = [v12 propertyForKey:PSKeyNameKey];
    [(ButtonClickController *)self _buttonClickSpeedFromSpecifierKey:v13];
    float v15 = v14;

    if (v11)
    {
      _AXSSideButtonClickSpeed();
      if (v15 != v16 || (_AXSHomeClickSpeed(), v15 != v17))
      {
        unsigned int v57 = v10;
        v58 = v8;
        uint64_t v60 = self;
        id v62 = v7;
        _AXSSetSideButtonClickSpeed();
LABEL_14:
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        BOOL v26 = [v6 visibleCells];
        id v27 = [v26 countByEnumeratingWithState:&v71 objects:v78 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v72;
          do
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(void *)v72 != v29) {
                objc_enumerationMutation(v26);
              }
              unsigned int v31 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              objc_super v32 = [v31 specifier];
              v33 = [v32 propertyForKey:@"type"];
              unsigned int v34 = [v33 isEqualToString:@"HOME_CLICK_SPEED"];

              if (v34) {
                [v31 setChecked:0];
              }
            }
            id v28 = [v26 countByEnumeratingWithState:&v71 objects:v78 count:16];
          }
          while (v28);
        }

        unsigned int v8 = v58;
        [v58 setChecked:1];
        self = v60;
        id v7 = v62;
        [(ButtonClickController *)v60 setSelectedIndexPath:v62];
        uint64_t v10 = v57;
      }
    }
    else
    {
      _AXSHomeClickSpeed();
      if (v15 != v25)
      {
        unsigned int v57 = v10;
        v58 = v8;
        uint64_t v60 = self;
        id v62 = v7;
        _AXSHomeClickSetSpeed();
        goto LABEL_14;
      }
    }
    AudioServicesStopSystemSound();
    v35 = [(ButtonClickController *)self vibrationTimer];
    [v35 invalidate];

    unsigned int v36 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_vibrateSelectedRow" selector:0 userInfo:0 repeats:0.649999976];
    [(ButtonClickController *)self setVibrationTimer:v36];

    [(ButtonClickController *)self setFlashCount:0];
    v37 = [(ButtonClickController *)self flashTimer];
    [v37 invalidate];

    v38 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_flashSelectedRow" selector:0 userInfo:0 repeats:0.699999988];
    [(ButtonClickController *)self setFlashTimer:v38];
LABEL_43:

    goto LABEL_44;
  }
  if ([v10 isEqualToString:@"HomeButtonAssistant"])
  {
    CFStringRef v18 = [v8 specifier];
    uint64_t v65 = PSKeyNameKey;
    CFStringRef v19 = objc_msgSend(v18, "propertyForKey:");

    id v63 = v7;
    v59 = v8;
    v66 = v19;
    if ([v19 isEqualToString:@"assistantChoiceSiri"])
    {
      _AXSSetHomeButtonAssistant();
      v20 = [(ButtonClickController *)self _footerTextForHomeButtonAssistantOption:0];
      if (!AFAssistantCapable()) {
        goto LABEL_33;
      }
      unsigned int v21 = +[AFPreferences sharedPreferences];
      unsigned __int8 v22 = [v21 assistantIsEnabled];

      if (v22) {
        goto LABEL_33;
      }
      uint64_t v23 = +[AFPreferences sharedPreferences];
      [v23 setAssistantIsEnabled:1];
    }
    else
    {
      if ([v19 isEqualToString:@"assistantChoiceVoiceControl"])
      {
        _AXSSetHomeButtonAssistant();
        v20 = [(ButtonClickController *)self _footerTextForHomeButtonAssistantOption:1];
        v39 = +[AFPreferences sharedPreferences];
        [v39 setAssistantIsEnabled:0];

        v40 = +[AFPreferences sharedPreferences];
        [v40 synchronize];

        v24 = +[VTPreferences sharedPreferences];
        [v24 setVoiceTriggerEnabled:0];
        goto LABEL_27;
      }
      if (![v19 isEqualToString:@"assistantChoiceOff"])
      {
        v20 = 0;
        goto LABEL_33;
      }
      int v41 = _AXSHomeButtonAssistant();
      _AXSSetHomeButtonAssistant();
      v20 = [(ButtonClickController *)self _footerTextForHomeButtonAssistantOption:2];
      if (v41) {
        goto LABEL_33;
      }
      id v42 = +[VTPreferences sharedPreferences];
      unsigned __int8 v43 = [v42 voiceTriggerEnabled];

      if (v43) {
        goto LABEL_33;
      }
      v44 = +[AFPreferences sharedPreferences];
      [v44 setAssistantIsEnabled:0];
    }
    v24 = +[AFPreferences sharedPreferences];
    [v24 synchronize];
LABEL_27:

LABEL_33:
    v45 = [(ButtonClickController *)self specifierForKey:@"assistantChoiceGroup"];
    [v45 setProperty:v20 forKey:PSFooterTextGroupKey];
    uint64_t v61 = self;
    v56 = v45;
    [(ButtonClickController *)self reloadSpecifier:v45];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v64 = v6;
    v46 = [v6 visibleCells];
    id v47 = [v46 countByEnumeratingWithState:&v67 objects:v77 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v68;
      do
      {
        for (j = 0; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v68 != v49) {
            objc_enumerationMutation(v46);
          }
          id v51 = *(void **)(*((void *)&v67 + 1) + 8 * (void)j);
          v52 = [v51 specifier];
          v53 = [v52 propertyForKey:@"type"];
          unsigned int v54 = [v53 isEqualToString:@"HomeButtonAssistant"];

          if (v54)
          {
            uint64_t v55 = [v52 propertyForKey:v65];
            objc_msgSend(v51, "setChecked:", objc_msgSend(v55, "isEqualToString:", v66));
          }
        }
        id v48 = [v46 countByEnumeratingWithState:&v67 objects:v77 count:16];
      }
      while (v48);
    }

    [(ButtonClickController *)v61 updateVoiceControlLanguageSpecifiers];
    id v7 = v63;
    id v6 = v64;
    unsigned int v8 = v59;
    v38 = v66;
    goto LABEL_43;
  }
LABEL_44:
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ButtonClickController;
  [(ButtonClickController *)&v6 viewWillDisappear:a3];
  v4 = [(ButtonClickController *)self flashTimer];
  [v4 invalidate];

  objc_super v5 = [(ButtonClickController *)self vibrationTimer];
  [v5 invalidate];

  AudioServicesStopSystemSound();
}

- (void)_flashSelectedRow
{
  id v9 = [(ButtonClickController *)self table];
  uint64_t v3 = [(ButtonClickController *)self selectedIndexPath];
  [v9 selectRowAtIndexPath:v3 animated:0 scrollPosition:0];
  [v9 deselectRowAtIndexPath:v3 animated:0];
  [(ButtonClickController *)self setFlashCount:(char *)[(ButtonClickController *)self flashCount] + 1];
  v4 = [(ButtonClickController *)self flashTimer];
  [v4 invalidate];

  if ([(ButtonClickController *)self flashCount] > 2)
  {
    [(ButtonClickController *)self setFlashTimer:0];
  }
  else
  {
    _AXSHomeClickSpeed();
    float v6 = v5;
    if ([(ButtonClickController *)self _hasSideButtonOnly])
    {
      _AXSSideButtonClickSpeed();
      float v6 = v7;
    }
    unsigned int v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_flashSelectedRow" selector:0 userInfo:0 repeats:v6];
    [(ButtonClickController *)self setFlashTimer:v8];
  }
}

- (void)_vibrateSelectedRow
{
  uint64_t v2 = kAudioServicesPlaySystemSoundOptionVibrationPatternKey;
  uint64_t v3 = [(ButtonClickController *)self _vibrationPattern];
  +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
  AudioServicesPlaySystemSoundWithOptions();
}

- (float)_buttonClickSpeedFromSpecifierKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ButtonClickController *)self _hasSideButtonOnly];
  if ([v4 isEqualToString:@"homeClickSpeedSlowest"])
  {
    BOOL v6 = v5 == 0;
    float v7 = *(float *)"333?fff?";
    float v8 = 1.2;
LABEL_10:
    if (v6) {
      float v9 = v7;
    }
    else {
      float v9 = v8;
    }
    goto LABEL_13;
  }
  if (![v4 isEqualToString:@"homeClickSpeedSlow"])
  {
    if (![v4 isEqualToString:@"homeClickSpeedDefault"]) {
      _AXAssert();
    }
    BOOL v6 = v5 == 0;
    float v7 = 0.35;
    float v8 = 0.4;
    goto LABEL_10;
  }
  if (v5) {
    float v9 = *(float *)"333?fff?";
  }
  else {
    float v9 = 0.5;
  }
LABEL_13:

  return v9;
}

- (__CFDictionary)_vibrationPattern
{
  _AXSHomeClickSpeed();
  *(float *)&double v4 = (float)(v3 + -0.175) * 1000.0;
  unsigned int v5 = +[NSNumber numberWithFloat:v4];
  LODWORD(v6) = 1127153664;
  float v7 = +[NSNumber numberWithFloat:v6];
  if ([(ButtonClickController *)self _hasSideButtonOnly])
  {
    _AXSSideButtonClickSpeed();
    *(float *)&double v9 = (float)(v8 + -0.2) * 1000.0;
    uint64_t v10 = +[NSNumber numberWithFloat:v9];

    float v7 = &off_22C520;
    unsigned int v5 = (void *)v10;
  }
  v15[0] = @"Intensity";
  v15[1] = @"VibePattern";
  v16[0] = &off_229E10;
  v14[0] = &__kCFBooleanTrue;
  v14[1] = v7;
  v14[2] = &__kCFBooleanFalse;
  v14[3] = v5;
  v14[4] = &__kCFBooleanTrue;
  v14[5] = v7;
  v14[6] = &__kCFBooleanFalse;
  v14[7] = v5;
  v14[8] = &__kCFBooleanTrue;
  v14[9] = v7;
  unsigned int v11 = +[NSArray arrayWithObjects:v14 count:10];
  v16[1] = v11;
  float v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  return (__CFDictionary *)v12;
}

- (void)showPINSheet:(id)a3
{
  id v4 = a3;
  [(ButtonClickController *)self setPinCode:0];
  [(ButtonClickController *)self setCurrentPinSpecifier:v4];
  [v4 setEditPaneClass:objc_opt_class()];
  unsigned int v5 = +[NSNumber numberWithInt:3];
  [v4 setProperty:v5 forKey:@"mode"];

  [v4 setProperty:@"DevicePINController" forKey:PSSetupCustomClassKey];
  v6.receiver = self;
  v6.super_class = (Class)ButtonClickController;
  [(ButtonClickController *)&v6 showPINSheet:v4];
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4 = a3;
  [(ButtonClickController *)self setPinCode:v4];
  unsigned int v5 = [(ButtonClickController *)self currentPinSpecifier];
  objc_super v6 = [v5 identifier];

  if ([v6 isEqualToString:@"PASSCODE_PURCHASES"])
  {
    objc_initWeak(&location, self);
    BOOL passcodeForPurchasesEnabled = self->_passcodeForPurchasesEnabled;
    BOOL v8 = !self->_passcodeForPurchasesEnabled;
    id v9 = objc_alloc_init((Class)SSBiometrics);
    LOBYTE(from) = 0;
    objc_opt_class();
    uint64_t v10 = [(ButtonClickController *)self currentPinSpecifier];
    unsigned int v11 = [(ButtonClickController *)self cellForSpecifier:v10];
    float v12 = __UIAccessibilityCastAsClass();

    id v13 = objc_initWeak(&from, v12);
    [v12 setLoading:1];

    float v14 = [(ButtonClickController *)self pinCode];
    float v15 = PSAuthorizationTokenForPasscode();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = __45__ButtonClickController_didAcceptEnteredPIN___block_invoke;
    v16[3] = &unk_20B2B0;
    v16[4] = self;
    objc_copyWeak(&v17, &location);
    v18[1] = (id)v8;
    objc_copyWeak(v18, &from);
    [v9 setEnabled:!passcodeForPurchasesEnabled withAuthToken:v15 completionBlock:v16];

    objc_destroyWeak(v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }
}

void __45__ButtonClickController_didAcceptEnteredPIN___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__ButtonClickController_didAcceptEnteredPIN___block_invoke_2;
  block[3] = &unk_20B288;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v11[1] = *(id *)(a1 + 56);
  objc_copyWeak(v11, (id *)(a1 + 48));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v11);
  objc_destroyWeak(&v10);
}

void __45__ButtonClickController_didAcceptEnteredPIN___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    _AXSSetUserEnabledPasscodeForPurchases();
    uint64_t v2 = +[MCProfileConnection sharedConnection];
    float v3 = *(unsigned char **)(a1 + 40);
    BOOL v4 = v3[193] == 0;
    uint64_t v5 = MCFeatureFingerprintForContactlessPaymentAllowed;
    id v6 = [v3 pinCode];
    [v2 setBoolValue:v4 forSetting:v5 passcode:v6];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setStoreState:*(void *)(a1 + 64)];

    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    [v8 updateStoreState];
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 56));
  [v9 setLoading:0];

  id v10 = objc_loadWeakRetained((id *)(a1 + 48));
  [v10 setCurrentPinSpecifier:0];
}

- (void)_resetPinSpecifier
{
  float v3 = [(ButtonClickController *)self currentPinSpecifier];
  id v4 = [v3 identifier];

  if ([v4 isEqualToString:@"PASSCODE_PURCHASES"]) {
    [(ButtonClickController *)self reloadSpecifierID:@"PASSCODE_PURCHASES" animated:1];
  }
  [(ButtonClickController *)self setCurrentPinSpecifier:0];
}

- (void)updateStoreState
{
  id v3 = objc_alloc_init((Class)SSBiometrics);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __41__ButtonClickController_updateStoreState__block_invoke;
  v4[3] = &unk_20B2D8;
  v4[4] = self;
  [v3 getStateWithCompletionBlock:v4];
}

void __41__ButtonClickController_updateStoreState__block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __41__ButtonClickController_updateStoreState__block_invoke_2;
  v2[3] = &unk_208ED8;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id __41__ButtonClickController_updateStoreState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStoreState:*(void *)(a1 + 40)];
}

- (void)setStoreState:(int64_t)a3
{
  if (self->_storeState != a3) {
    self->_storeState = a3;
  }
  [(ButtonClickController *)self reloadSpecifierID:@"PASSCODE_PURCHASES" animated:1];
}

- (BOOL)isPasscodeSet
{
  uint64_t v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isPasscodeSet];

  return v3;
}

- (BOOL)hasPasscodeAndBiometric
{
  if (![(ButtonClickController *)self isPasscodeSet]) {
    return 0;
  }
  uint64_t v2 = +[BiometricKit manager];
  unsigned __int8 v3 = [v2 identities:0];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)hasPasscodeOrBiometric
{
  if ([(ButtonClickController *)self isPasscodeSet]) {
    return 1;
  }
  unsigned __int8 v3 = +[BiometricKit manager];
  BOOL v4 = [v3 identities:0];
  BOOL v2 = [v4 count] != 0;

  return v2;
}

- (void)setPasscodeForPurchases:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  self->_BOOL passcodeForPurchasesEnabled = [a3 BOOLValue];
  [(ButtonClickController *)self showPINSheet:v6];
}

- (id)passcodeForPurchases:(id)a3
{
  BOOL v4 = +[MCProfileConnection sharedConnection];
  unsigned int v5 = [v4 effectiveBoolValueForSetting:MCFeatureFingerprintForContactlessPaymentAllowed];

  BOOL v7 = (char *)[(ButtonClickController *)self storeState] != (char *)&dword_0 + 1 && v5 != 1;

  return +[NSNumber numberWithInt:v7];
}

- (void)jumpToSwitchControlSettings:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=ACCESSIBILITY&path=ScannerSwitchTitle#APPLE_PAY"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)jumpToAssistiveTouchSettings:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=ACCESSIBILITY&path=TOUCH_REACHABILITY_TITLE/AIR_TOUCH_TITLE#APPLE_PAY"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)_handleAXSettingChanged
{
  id v3 = [(ButtonClickController *)self specifierForKey:@"applePayGroup"];
  [(ButtonClickController *)self reloadSpecifier:v3];
}

- (int64_t)storeState
{
  return self->_storeState;
}

- (int64_t)flashCount
{
  return self->_flashCount;
}

- (void)setFlashCount:(int64_t)a3
{
  self->_flashCount = a3;
}

- (NSTimer)flashTimer
{
  return self->_flashTimer;
}

- (void)setFlashTimer:(id)a3
{
}

- (NSTimer)vibrationTimer
{
  return self->_vibrationTimer;
}

- (void)setVibrationTimer:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (BOOL)applePayEnabled
{
  return self->_applePayEnabled;
}

- (void)setApplePayEnabled:(BOOL)a3
{
  self->_applePayEnabled = a3;
}

- (BOOL)passcodeForPurchasesEnabled
{
  return self->_passcodeForPurchasesEnabled;
}

- (void)setPasscodeForPurchasesEnabled:(BOOL)a3
{
  self->_BOOL passcodeForPurchasesEnabled = a3;
}

- (NSString)pinCode
{
  return self->_pinCode;
}

- (void)setPinCode:(id)a3
{
}

- (PSSpecifier)currentPinSpecifier
{
  return self->_currentPinSpecifier;
}

- (void)setCurrentPinSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPinSpecifier, 0);
  objc_storeStrong((id *)&self->_pinCode, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_vibrationTimer, 0);
  objc_storeStrong((id *)&self->_flashTimer, 0);

  objc_storeStrong((id *)&self->_purchasesSpecs, 0);
}

@end