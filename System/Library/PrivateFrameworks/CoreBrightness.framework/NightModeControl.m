@interface NightModeControl
- (BOOL)parseStatusDictionary:(id)a3 intoStruct:(id *)a4 shouldUpdatePrefs:(BOOL *)a5;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)updateTransitionTimesFromSchedule:(double)a3;
- (BOOL)updateTransitionTimesFromSunriseSunset:(double)a3;
- (NightModeControl)initWithSupportObject:(id)a3 queue:(id)a4 callback:(id)a5;
- (id)copyDictionaryFromStatus:(id *)a3;
- (id)copyLowPowerModeState;
- (id)copyPreferenceForKey:(id)a3 user:(id)a4;
- (id)copyStatusDictionaryFromPrefs;
- (id)copyTimeStringWithHour:(int)a3 minute:(int)a4 second:(int)a5;
- (id)getPropertyForKey:(id)a3;
- (void)addSupportObject:(id)a3;
- (void)cancelSchedule;
- (void)cancelTransition;
- (void)clockChanged;
- (void)dealloc;
- (void)displayAlertInteractive:(BOOL)a3;
- (void)enableBlueLightReduction:(BOOL)a3 withOption:(int)a4;
- (void)initiateFullMaxTransition;
- (void)initiateFullMinTransition;
- (void)initiateRestrictedMaxTransition;
- (void)initiateTransitionTo:(float)a3 andRampLength:(float)a4;
- (void)reevaluateCurrentState;
- (void)reevaluateCurrentStateWithFactorFadeOption:(float)a3;
- (void)removeSupportObject:(id)a3;
- (void)retrieveSunriseSunsetTimesFromBackup:(double)a3;
- (void)saveStatusToPrefs:(id)a3;
- (void)scheduleNextTransition:(double)a3 withType:(int)a4;
- (void)setAlgoState:(int)a3;
- (void)setMode:(int)a3;
- (void)setNightModeFactor:(float)a3;
- (void)setNightModeFactor:(float)a3 withFadePeriod:(float)a4;
- (void)setNightShiftFactorDictionary:(id)a3;
- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5;
- (void)setSchedule:(id)a3;
- (void)setSunPermitted:(BOOL)a3;
- (void)tearDownAllTimers;
- (void)timeZoneChanged;
- (void)transitionTimerHandler;
- (void)updateLowPowerModeState:(id)a3;
- (void)updateOptionTimestamp:(double)a3;
- (void)updateStatusDictionaryWithValue:(id)a3 forKey:(id)a4;
- (void)updateSunriseSunsetBackup;
- (void)updateSunriseSunsetInfo:(id)a3;
- (void)updateTransitionTimes:(double)a3;
@end

@implementation NightModeControl

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  objc_sync_enter(self);
  if (([a4 isEqualToString:@"DisplayBrightnessFactor"] & 1) != 0
    || ([a4 isEqualToString:@"DisplayBrightnessFactorWithFade"] & 1) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = (id)[a3 objectForKey:@"DisplayBrightnessFactor"];
    }
    else {
      id v30 = a3;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v30 floatValue];
      double v5 = v4;
      if (v5 <= 0.0)
      {
        if (self->_notificationInProgress && self->_enableNotification) {
          CFUserNotificationCancel(self->_enableNotification);
        }
        if (self->_algoState == 2 || self->_algoState == 1)
        {
          self->_displayOffTimestamp = CFAbsoluteTimeGetCurrent();
          [(NightModeControl *)self updateOptionTimestamp:self->_displayOffTimestamp];
          self->_checkInactivity = 1;
          if (self->_logLevel >= 7) {
            NSLog(&cfstr_DisplayOffWith.isa, self->_algoState, *(void *)&self->_displayOffTimestamp);
          }
        }
        [(NightModeControl *)self tearDownAllTimers];
        [(CBAnalyticsNightShiftTracker *)self->_modeTracker stop:self->_status.mode isEnabled:self->_status.enabled];
        self->_displayOff = 1;
      }
      else if (self->_displayOff)
      {
        self->_displayOff = 0;
        -[CBAnalyticsNightShiftTracker start:](self->_modeTracker, "start:", self->_status.enabled, v5);
        id v29 = [(SunriseSunsetProvider *)self->_sunriseSunsetProvider copySunriseSunsetInfo:self->_sunriseSunsetInfoQueryTimeout];
        if (v29)
        {
          [(NightModeControl *)self updateSunriseSunsetInfo:v29];
        }
        [(NightModeControl *)self reevaluateCurrentStateWithFactorFadeOption:0.0];
      }
    }
    goto LABEL_98;
  }
  if ([a4 isEqual:@"CBSystemDidWakeFromSleep"])
  {
    if (self->_logLevel >= 7) {
      NSLog(&cfstr_SForceNightShi.isa, "-[NightModeControl setProperty:forKey:]");
    }
    [(NightModeControl *)self reevaluateCurrentStateWithFactorFadeOption:0.0];
    goto LABEL_98;
  }
  if (([a4 isEqualToString:@"AutoBlueReductionEnabled"] & 1) != 0
    || ([a4 isEqualToString:@"BlueReductionAvailable"] & 1) != 0
    || ([a4 isEqualToString:@"CBDisplayPresetDisableNightShift"] & 1) != 0)
  {
    double v28 = -1.0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a4 isEqualToString:@"AutoBlueReductionEnabled"])
      {
        self->_status.active = [a3 intValue] != 0;
        [(NightModeControl *)self updateStatusDictionaryWithValue:a3 forKey:a4];
      }
      else if ([a4 isEqualToString:@"CBDisplayPresetDisableNightShift"])
      {
        BOOL available = self->_status.available;
        if (available != ([a3 intValue] == 0))
        {
          [(NSMutableDictionary *)self->_properties setObject:a3 forKey:a4];
          self->_status.BOOL available = [a3 intValue] == 0;
          double v28 = 0.0;
          v27 = (void *)[objc_alloc(NSNumber) initWithBool:self->_status.available];
          [(NightModeControl *)self updateStatusDictionaryWithValue:v27 forKey:@"BlueReductionAvailable"];
        }
      }
      else if ([a4 isEqualToString:@"BlueReductionAvailable"])
      {
        self->_status.BOOL available = [a3 intValue] != 0;
        [(NightModeControl *)self updateStatusDictionaryWithValue:a3 forKey:a4];
      }
      if (self->_status.active && self->_status.available)
      {
        if ([(NSMutableArray *)self->_supportObjs count])
        {
          v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
          if (v23)
          {
            id v15 = objc_alloc(NSNumber);
            *(float *)&double v7 = self->_factorState.factor;
            v22 = (void *)[v15 initWithFloat:v7];
            if (v22)
            {
              [(NSMutableDictionary *)self->_properties setObject:v22 forKey:@"BlueLightReductionFactor"];
              [v23 setObject:v22 forKey:@"BlueLightReductionFactorValue"];
            }
            id v14 = objc_alloc(NSNumber);
            HIDWORD(v8) = HIDWORD(v28);
            *(float *)&double v8 = v28;
            v21 = (void *)[v14 initWithFloat:v8];
            if (v21)
            {
              [v23 setObject:v21 forKey:@"BlueLightReductionFactorFadePeriod"];
            }
            [(NightModeControl *)self setNightShiftFactorDictionary:v23];
          }
        }
        [(NightModeControl *)self reevaluateCurrentState];
      }
      else if ([(NSMutableArray *)self->_supportObjs count])
      {
        v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
        if (v26)
        {
          v25 = (void *)[objc_alloc(NSNumber) initWithFloat:0.0];
          if (v25)
          {
            [(NSMutableDictionary *)self->_properties setObject:v25 forKey:@"BlueLightReductionFactor"];
            [v26 setObject:v25 forKey:@"BlueLightReductionFactorValue"];
          }
          id v16 = objc_alloc(NSNumber);
          HIDWORD(v6) = HIDWORD(v28);
          *(float *)&double v6 = v28;
          v24 = (void *)[v16 initWithFloat:v6];
          if (v24)
          {
            [v26 setObject:v24 forKey:@"BlueLightReductionFactorFadePeriod"];
          }
          [(NightModeControl *)self setNightShiftFactorDictionary:v26];
        }
      }
    }
    goto LABEL_98;
  }
  if ([a4 isEqualToString:@"BlueLightReductionSchedule"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NightModeControl *)self setSchedule:a3];
      [(NightModeControl *)self updateStatusDictionaryWithValue:a3 forKey:a4];
      [(NightModeControl *)self reevaluateCurrentState];
    }
    goto LABEL_98;
  }
  if ([a4 isEqualToString:@"BlueReductionEnabled"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = (void *)[a3 objectForKey:@"BlueReductionEnabledValue"];
      if (v20)
      {
        v19 = (void *)[a3 objectForKey:@"BlueReductionEnabledOption"];
        if (v19) {
          -[NightModeControl enableBlueLightReduction:withOption:](self, "enableBlueLightReduction:withOption:", [v20 intValue] != 0, objc_msgSend(v19, "intValue"));
        }
        else {
          -[NightModeControl enableBlueLightReduction:withOption:](self, "enableBlueLightReduction:withOption:", [v20 intValue] != 0, 0);
        }
        [(NightModeControl *)self updateLowPowerModeState:0];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        NSLog(&cfstr_SInternalSetti.isa, "-[NightModeControl setProperty:forKey:]");
        [(NightModeControl *)self setMode:0];
        *(float *)&double v9 = (float)(int)[a3 intValue];
        [(NightModeControl *)self setNightModeFactor:v9];
      }
    }
    goto LABEL_98;
  }
  if ([a4 isEqualToString:@"BlueReductionMode"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NSMutableDictionary *)self->_properties setObject:a3 forKey:a4];
      -[NightModeControl setMode:](self, "setMode:", [a3 intValue]);
      [(NightModeControl *)self updateLowPowerModeState:0];
    }
    goto LABEL_98;
  }
  if (([a4 isEqualToString:@"LogLevel"] & 1) != 0
    || ([a4 isEqualToString:@"BlueLightReductionLogging"] & 1) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_logLevel = [a3 intValue];
      [(SunriseSunsetProvider *)self->_sunriseSunsetProvider setLogLevel:self->_logLevel];
    }
    goto LABEL_98;
  }
  if ([a4 isEqualToString:@"BlueLightReductionTransitionLength"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NSMutableDictionary *)self->_properties setObject:a3 forKey:a4];
      [a3 floatValue];
      self->_transitionLength = v10;
    }
LABEL_84:
    [(NightModeControl *)self reevaluateCurrentState];
    goto LABEL_98;
  }
  if ([a4 isEqualToString:@"BlueLightReductionTransitionRate"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NSMutableDictionary *)self->_properties setObject:a3 forKey:a4];
      [a3 floatValue];
      self->_transitionRate = v11;
    }
    goto LABEL_84;
  }
  if ([a4 isEqualToString:@"BlueLightReductionInactivityTimeout"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NSMutableDictionary *)self->_properties setObject:a3 forKey:a4];
      [a3 floatValue];
      self->_inactivityTimeout = v12;
    }
  }
  else if ([a4 isEqualToString:@"BlueLightReductionSunInfoQueryTimeout"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NSMutableDictionary *)self->_properties setObject:a3 forKey:@"BlueLightReductionSunInfoQueryTimeout"];
      self->_sunriseSunsetInfoQueryTimeout = [a3 intValue];
    }
  }
  else
  {
    [a4 isEqualToString:@"EcoMode"];
  }
LABEL_98:
  objc_sync_exit(self);
  return 1;
}

- (BOOL)parseStatusDictionary:(id)a3 intoStruct:(id *)a4 shouldUpdatePrefs:(BOOL *)a5
{
  char v19 = 0;
  if (a5) {
    *a5 = 0;
  }
  [a3 objectForKey:@"Version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"Version"), "intValue") != 1) {
    return 0;
  }
  a4->var0 = 1;
  [a3 objectForKey:@"BlueReductionEnabled"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  a4->var1 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueReductionEnabled"), "intValue") != 0;
  [a3 objectForKey:@"BlueReductionMode"];
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();
  if ((v6 & 1) == 0) {
    return 0;
  }
  a4->var3 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueReductionMode"), "intValue");
  if (a4->var3) {
    char v19 = 1;
  }
  [a3 objectForKey:@"BlueReductionSunScheduleAllowed"];
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();
  if ((v7 & 1) == 0) {
    return 0;
  }
  a4->var2 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueReductionSunScheduleAllowed"), "intValue") != 0;
  v18 = (void *)[a3 objectForKey:@"BlueLightReductionSchedule"];
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();
  if ((v8 & 1) == 0) {
    return 0;
  }
  [v18 objectForKey:@"NightStartHour"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  a4->var4.var0.var0 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"NightStartHour"), "intValue");
  [v18 objectForKey:@"NightStartMinute"];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();
  if ((v9 & 1) == 0) {
    return 0;
  }
  a4->var4.var0.var1 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"NightStartMinute"), "intValue");
  [v18 objectForKey:@"DayStartHour"];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();
  if ((v10 & 1) == 0) {
    return 0;
  }
  a4->var4.var1.var0 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"DayStartHour"), "intValue");
  [v18 objectForKey:@"DayStartMinute"];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();
  if ((v11 & 1) == 0) {
    return 0;
  }
  a4->var4.var1.var1 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"DayStartMinute"), "intValue");
  [a3 objectForKey:@"BlueLightReductionDisableScheduleAlertCounter"];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();
  if (v12) {
    self->_notifyUserAboutScheduleCounter = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueLightReductionDisableScheduleAlertCounter"), "intValue");
  }
  if (self->_notifyUserAboutScheduleCounter < 3 && (v19 & 1) != 0)
  {
    self->_notifyUserAboutScheduleCounter = 3;
    if (a5) {
      *a5 = 1;
    }
  }
  [a3 objectForKey:@"BlueLightReductionRevertToSunriseSunset"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_revertToSunriseSunset = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueLightReductionRevertToSunriseSunset"), "intValue") != 0;
  }
  [a3 objectForKey:@"BlueLightReductionAlgoOverride"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_algoState = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueLightReductionAlgoOverride"), "intValue");
    if (self->_algoState == 2 || self->_algoState == 1)
    {
      v17 = (void *)[a3 objectForKey:@"BlueLightReductionAlgoOverrideTimestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_checkInactivity = 1;
        [v17 timeIntervalSinceReferenceDate];
        self->_displayOffTimestamp = v13;
      }
    }
    else if (self->_algoState == 4 || self->_algoState == 3)
    {
      id v16 = (void *)[a3 objectForKey:@"BlueLightReductionAlgoOverrideTimestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v16 timeIntervalSinceReferenceDate];
        self->_untilNexTransitionTimestamp = v14;
      }
    }
  }
  return 1;
}

- (id)copyDictionaryFromStatus:(id *)a3
{
  id v15 = 0;
  if (a3)
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
    id v5 = (id)[objc_alloc(NSNumber) initWithInt:1];
    if (v5)
    {
      [v15 setObject:v5 forKey:@"AutoBlueReductionEnabled"];
    }
    id v6 = (id)[objc_alloc(NSNumber) initWithInt:a3->var1];
    if (v6)
    {
      [v15 setObject:v6 forKey:@"BlueReductionEnabled"];
    }
    id v7 = (id)[objc_alloc(NSNumber) initWithInt:a3->var3];
    if (v7)
    {
      [v15 setObject:v7 forKey:@"BlueReductionMode"];
    }
    id v8 = (id)[objc_alloc(NSNumber) initWithInt:a3->var2];
    if (v8)
    {
      [v15 setObject:v8 forKey:@"BlueReductionSunScheduleAllowed"];
    }
    id v9 = (id)[objc_alloc(NSNumber) initWithInt:a3->var6];
    if (v9)
    {
      [v15 setObject:v9 forKey:@"BlueReductionAvailable"];
    }
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    if (v4)
    {
      id v10 = (id)[objc_alloc(NSNumber) initWithInt:a3->var4.var0.var0];
      if (v10)
      {
        [v4 setObject:v10 forKey:@"NightStartHour"];
      }
      id v11 = (id)[objc_alloc(NSNumber) initWithInt:a3->var4.var0.var1];
      if (v11)
      {
        [v4 setObject:v11 forKey:@"NightStartMinute"];
      }
      id v12 = (id)[objc_alloc(NSNumber) initWithInt:a3->var4.var1.var0];
      if (v12)
      {
        [v4 setObject:v12 forKey:@"DayStartHour"];
      }
      id v13 = (id)[objc_alloc(NSNumber) initWithInt:a3->var4.var1.var1];
      if (v13)
      {
        [v4 setObject:v13 forKey:@"DayStartMinute"];
      }
      [v15 setObject:v4 forKey:@"BlueLightReductionSchedule"];

      id v14 = (id)[objc_alloc(NSNumber) initWithInt:1];
      if (v14)
      {
        [v15 setObject:v14 forKey:@"Version"];
      }
    }
  }
  return v15;
}

- (void)saveStatusToPrefs:(id)a3
{
  if (a3)
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBrightness"];
    if (v3)
    {
      if ([v3 objectForKey:@"CBBlueReductionStatus"] || !self->_statusUpdated)
      {
        [v3 setObject:a3 forKey:@"CBBlueReductionStatus"];
        [v3 synchronize];
        self->_statusUpdated = 1;
      }
    }
  }
}

- (id)copyStatusDictionaryFromPrefs
{
  id v4 = 0;
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBrightness"];
  if (v3)
  {
    [v3 synchronize];
    id v4 = (void *)[v3 objectForKey:@"CBBlueReductionStatus"];
    if (v4) {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
    }
  }
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_S_0.isa, "-[NightModeControl copyStatusDictionaryFromPrefs]", v4);
  }
  return v4;
}

- (void)updateStatusDictionaryWithValue:(id)a3 forKey:(id)a4
{
  if (self->_properties)
  {
    id v6 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:@"CBBlueReductionStatus"];
    if (v6)
    {
      char v5 = 1;
      if (a3)
      {
        [v6 setObject:a3 forKey:a4];
      }
      else if ([v6 objectForKey:a4])
      {
        [v6 removeObjectForKey:a4];
      }
      else
      {
        char v5 = 0;
      }
      if (v5)
      {
        [(NightModeControl *)self saveStatusToPrefs:v6];
        if (self->_callbackBlock
          && (([a4 isEqualToString:@"AutoBlueReductionEnabled"] & 1) != 0
           || ([a4 isEqualToString:@"BlueReductionEnabled"] & 1) != 0
           || ([a4 isEqualToString:@"BlueReductionMode"] & 1) != 0
           || ([a4 isEqualToString:@"BlueReductionSunScheduleAllowed"] & 1) != 0
           || ([a4 isEqualToString:@"BlueLightReductionDisableFlags"] & 1) != 0
           || ([a4 isEqualToString:@"BlueReductionAvailable"] & 1) != 0
           || ([a4 isEqualToString:@"BlueLightReductionSchedule"] & 1) != 0))
        {
          (*((void (**)(void))self->_callbackBlock + 2))();
        }
        if ([a4 isEqualToString:@"BlueReductionEnabled"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v4 = (id)[objc_alloc(MEMORY[0x1E4F4FDC0]) initWithStarting:a3 reason:0];
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)BiomeLibrary(), "Device"), "Display"), "NightShift"), "source"), "sendEvent:", v4);
          }
        }
      }
    }
    if (self->_logLevel >= 7) {
      NSLog(&cfstr_S_1.isa, "-[NightModeControl updateStatusDictionaryWithValue:forKey:]", a4, a3, v6);
    }
  }
}

- (void)updateLowPowerModeState:(id)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBrightness"];
  if (v3)
  {
    if (a3)
    {
      [v3 setObject:a3 forKey:@"BLRLowPowerSavedMode"];
      [v3 synchronize];
    }
    else if ([v3 objectForKey:@"BLRLowPowerSavedMode"])
    {
      [v3 removeObjectForKey:@"BLRLowPowerSavedMode"];
      [v3 synchronize];
    }
  }
}

- (id)copyLowPowerModeState
{
  char v5 = 0;
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBrightness"];
  if (v4)
  {
    [v4 synchronize];
    id v6 = (void *)[v4 objectForKey:@"BLRLowPowerSavedMode"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unsigned int v3 = [v6 intValue];
      char v5 = (void *)[objc_alloc(NSNumber) initWithInt:v3];
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (NightModeControl)initWithSupportObject:(id)a3 queue:(id)a4 callback:(id)a5
{
  v47 = (char *)self;
  SEL v46 = a2;
  id v45 = a3;
  id v44 = a4;
  id v43 = a5;
  NSLog(&cfstr_NightModeInit.isa);
  v42.receiver = v47;
  v42.super_class = (Class)NightModeControl;
  v47 = [(NightModeControl *)&v42 init];
  if (v47)
  {
    if (v44 && v43)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
      *((void *)v47 + 1) = v5;
      v36[0] = 0;
      v36[1] = v36;
      int v37 = 1375731712;
      int v38 = 48;
      v39 = __Block_byref_object_copy__2;
      v40 = __Block_byref_object_dispose__2;
      v41 = v47;
      v20 = [SunriseSunsetProvider alloc];
      uint64_t v30 = MEMORY[0x1E4F143A8];
      int v31 = -1073741824;
      int v32 = 0;
      v33 = __57__NightModeControl_initWithSupportObject_queue_callback___block_invoke;
      v34 = &unk_1E6219378;
      v35 = v36;
      uint64_t v19 = -[SunriseSunsetProvider initWithCallback:](v20, "initWithCallback:");
      *((void *)v47 + 2) = v19;
      *((_DWORD *)v47 + 6) = 20;
      if (!*((void *)v47 + 2)) {
        NSLog(&cfstr_SErrorSunriseS.isa, "-[NightModeControl initWithSupportObject:queue:callback:]");
      }
      *((void *)v47 + 38) = @"sunrise";
      *((void *)v47 + 39) = @"sunset";
      *((void *)v47 + 40) = @"previousSunrise";
      *((void *)v47 + 41) = @"previousSunset";
      *((void *)v47 + 42) = @"nextSunrise";
      *((void *)v47 + 43) = @"nextSunset";
      *((void *)v47 + 44) = @"isDaylight";
      *((void *)v47 + 4) = 0;
      v47[192] = 0;
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *((void *)v47 + 5) = v18;
      if (v45) {
        [*((id *)v47 + 5) addObject:v45];
      }
      *((void *)v47 + 6) = v44;
      dispatch_retain(*((dispatch_object_t *)v47 + 6));
      *((_DWORD *)v47 + 20) = 0;
      *((_DWORD *)v47 + 31) = 0;
      *((_DWORD *)v47 + 32) = 0;
      *((_DWORD *)v47 + 30) = 0;
      *((_DWORD *)v47 + 25) = 0;
      *((float *)v47 + 26) = 1.0;
      v47[221] = 1;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *((CFAbsoluteTime *)v47 + 26) = Current;
      *((CFAbsoluteTime *)v47 + 25) = Current;
      v47[220] = 0;
      *((_DWORD *)v47 + 54) = 1155596288;
      *((void *)v47 + 7) = 0;
      *((void *)v47 + 8) = 0;
      id v16 = objc_alloc_init(CBAnalyticsNightShiftTracker);
      *((void *)v47 + 9) = v16;
      *((_DWORD *)v47 + 49) = 0;
      *((_DWORD *)v47 + 90) = 0;
      v47[377] = 0;
      *((_DWORD *)v47 + 70) = 22;
      *((_DWORD *)v47 + 71) = 0;
      *((_DWORD *)v47 + 72) = 7;
      *((_DWORD *)v47 + 73) = 0;
      v47[296] = 0;
      *((void *)v47 + 33) = 0;
      *((void *)v47 + 17) = CFTimeZoneCopySystem();
      id v15 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 addObserver:v47 selector:sel_timeZoneChanged name:*MEMORY[0x1E4F1C4F8] object:0];
      id v14 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:v47 selector:sel_clockChanged name:*MEMORY[0x1E4F1C4F0] object:0];
      char v29 = 0;
      double v28 = (void *)[v47 copyStatusDictionaryFromPrefs];
      if (v28)
      {
        v27 = (void *)[v47 copyLowPowerModeState];
        if (v27)
        {
          [v28 setObject:v27 forKey:@"BlueReductionMode"];
          [v47 updateLowPowerModeState:0];
        }
        [v28 removeObjectForKey:@"BlueLightReductionDisableFlags"];
        v47[296] = 1;
        if ([v47 parseStatusDictionary:v28 intoStruct:v47 + 240 shouldUpdatePrefs:&v29])
        {
          NSLog(&cfstr_SDefaultsFound_0.isa, "-[NightModeControl initWithSupportObject:queue:callback:]");
          v26 = (void *)[objc_alloc(NSNumber) initWithInt:1];
          if (v26)
          {
            [v28 setValue:v26 forKey:@"AutoBlueReductionEnabled"];
            [v28 setValue:v26 forKey:@"BlueReductionAvailable"];
          }
        }
        else
        {

          double v28 = 0;
          NSLog(&cfstr_SDefaultsFound.isa, "-[NightModeControl initWithSupportObject:queue:callback:]");
        }
      }
      v47[272] = 1;
      if (!v28)
      {
        NSLog(&cfstr_SCreatingDefau.isa, "-[NightModeControl initWithSupportObject:queue:callback:]");
        v47[240] = 1;
        v47[241] = 0;
        *((_DWORD *)v47 + 61) = 0;
        *((_DWORD *)v47 + 62) = 22;
        *((_DWORD *)v47 + 63) = 0;
        *((_DWORD *)v47 + 64) = 7;
        *((_DWORD *)v47 + 65) = 0;
        v47[242] = 0;
        double v28 = (void *)[v47 copyDictionaryFromStatus:v47 + 240];
      }
      if (v28)
      {
        if (*((void *)v47 + 1)) {
          [*((id *)v47 + 1) setObject:v28 forKey:@"CBBlueReductionStatus"];
        }
      }
      if (v29)
      {
        id v13 = objc_alloc(NSNumber);
        v25 = (void *)[v13 initWithInt:*((unsigned int *)v47 + 90)];
        if (v25)
        {
          [v47 updateStatusDictionaryWithValue:v25 forKey:@"BlueLightReductionDisableScheduleAlertCounter"];
        }
      }
      if (v43)
      {
        uint64_t v12 = [v43 copy];
        *((void *)v47 + 29) = v12;
      }
      if (*((_DWORD *)v47 + 61) == 1) {
        *((_DWORD *)v47 + 21) = 1155596288;
      }
      else {
        *((_DWORD *)v47 + 21) = 1123024896;
      }
      *((_DWORD *)v47 + 22) = *((_DWORD *)v47 + 21);
      *((float *)v47 + 24) = 2.0;
      *((float *)v47 + 23) = 1.0;
      if (*((void *)v47 + 1))
      {
        id v11 = objc_alloc(NSNumber);
        id v21 = (id)[v11 initWithInt:(int)*((float *)v47 + 21)];
        if (v21)
        {
          [*((id *)v47 + 1) setObject:v21 forKey:@"BlueLightReductionTransitionLength"];
        }
        id v10 = objc_alloc(NSNumber);
        id v22 = (id)[v10 initWithInt:(int)*((float *)v47 + 24)];
        if (v22)
        {
          [*((id *)v47 + 1) setObject:v22 forKey:@"BlueLightReductionTransitionRate"];
        }
        id v9 = objc_alloc(NSNumber);
        id v23 = (id)[v9 initWithInt:(int)*((float *)v47 + 54)];
        if (v23)
        {
          [*((id *)v47 + 1) setObject:v23 forKey:@"BlueLightReductionInactivityTimeout"];
        }
        id v8 = objc_alloc(NSNumber);
        LODWORD(v6) = *((_DWORD *)v47 + 30);
        id v24 = (id)[v8 initWithFloat:v6];
        if (v24)
        {
          [*((id *)v47 + 1) setObject:v24 forKey:@"BlueLightReductionFactor"];
        }
      }
      _Block_object_dispose(v36, 8);
    }
    else
    {

      return 0;
    }
  }
  return (NightModeControl *)v47;
}

void __57__NightModeControl_initWithSupportObject_queue_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = a1;
  id v13 = a2;
  uint64_t v12 = a1;
  uint64_t v11 = [a2 copy];
  global_queue = dispatch_get_global_queue(2, 0);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __57__NightModeControl_initWithSupportObject_queue_callback___block_invoke_2;
  id v8 = &unk_1E6219350;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = v11;
  dispatch_async(global_queue, &block);
}

uint64_t __57__NightModeControl_initWithSupportObject_queue_callback___block_invoke_2(uint64_t a1)
{
  id obj = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_sync_enter(obj);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) updateSunriseSunsetInfo:*(void *)(a1 + 32)];
  if (*(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 244) == 1) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) reevaluateCurrentState];
  }

  return objc_sync_exit(obj);
}

- (void)addSupportObject:(id)a3
{
  id v8 = self;
  SEL v7 = a2;
  id v6 = a3;
  if (a3)
  {
    [(NSMutableArray *)v8->_supportObjs addObject:v6];
    uint64_t v5 = [(NightModeControl *)v8 getPropertyForKey:@"BlueLightReductionFactor"];
    if (v5)
    {
      id v4 = 0;
      id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v4 = (id)objc_msgSend(v3, "initWithObjectsAndKeys:", &unk_1F1417BE8, @"BlueLightReductionFactorFadePeriod", v5, @"BlueLightReductionFactorValue", MEMORY[0x1E4F1CC38], @"ForceUpdate", 0);
      [v6 setNightShiftFactorDictionary:v4];
    }
  }
}

- (void)removeSupportObject:(id)a3
{
  if (a3) {
    [(NSMutableArray *)self->_supportObjs removeObject:a3];
  }
}

- (void)dealloc
{
  SEL v7 = self;
  SEL v6 = a2;
  NSLog(&cfstr_S.isa, "-[NightModeControl dealloc]");
  id obj = v7;
  objc_sync_enter(v7);
  id v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:v7 name:*MEMORY[0x1E4F1C4F8] object:0];
  v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:v7 name:*MEMORY[0x1E4F1C4F0] object:0];
  if (v7->_sunriseSunsetProvider)
  {
    [(SunriseSunsetProvider *)v7->_sunriseSunsetProvider cancel];

    v7->_sunriseSunsetProvider = 0;
  }
  if (v7->_callbackBlock)
  {

    v7->_callbackBlock = 0;
  }
  if (v7->_sunriseSunsetInfo)
  {

    v7->_sunriseSunsetInfo = 0;
  }
  if (v7->_properties)
  {

    v7->_properties = 0;
  }
  [(NightModeControl *)v7 tearDownAllTimers];
  if ([(CBAnalyticsNightShiftTracker *)v7->_modeTracker isStarted]) {
    [(CBAnalyticsNightShiftTracker *)v7->_modeTracker stop:v7->_status.mode isEnabled:v7->_status.enabled];
  }

  if (v7->_queue)
  {
    dispatch_release((dispatch_object_t)v7->_queue);
    v7->_queue = 0;
  }

  v7->_supportObjs = 0;
  if (v7->_currentTimeZone)
  {
    CFRelease(v7->_currentTimeZone);
    v7->_currentTimeZone = 0;
  }
  objc_sync_exit(obj);
  v5.receiver = v7;
  v5.super_class = (Class)NightModeControl;
  [(NightModeControl *)&v5 dealloc];
}

- (id)getPropertyForKey:(id)a3
{
  objc_sync_enter(self);
  objc_super v5 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:a3];
  objc_sync_exit(self);
  return v5;
}

- (void)setMode:(int)a3
{
  if (self->_status.mode != a3)
  {
    if (a3 != 1 || self->_status.sunSchedulePermitted)
    {
      if (self->_logLevel >= 7) {
        NSLog(&cfstr_SModeD.isa, "-[NightModeControl setMode:]", a3);
      }
      [(CBAnalyticsNightShiftTracker *)self->_modeTracker update:self->_status.mode isEnabled:self->_status.enabled];
      [(NightModeControl *)self setAlgoState:0];
      self->_status.mode = a3;
      objc_super v5 = (void *)[objc_alloc(NSNumber) initWithInt:self->_status.mode];
      if (v5)
      {
        [(NightModeControl *)self updateStatusDictionaryWithValue:v5 forKey:@"BlueReductionMode"];
      }
      if (self->_status.mode == 1) {
        self->_transitionLength = 1800.0;
      }
      else {
        self->_transitionLength = 120.0;
      }
      self->_transitionLengthActual = self->_transitionLength;
      self->_transitionsTimesCoeff = 1.0;
      if (self->_revertToSunriseSunset)
      {
        if (self->_logLevel >= 7) {
          NSLog(&cfstr_SUserChangedMo.isa, "-[NightModeControl setMode:]");
        }
        self->_revertToSunriseSunset = 0;
        id v4 = (id)[objc_alloc(NSNumber) initWithInt:0];
        [(NightModeControl *)self updateStatusDictionaryWithValue:v4 forKey:@"BlueLightReductionRevertToSunriseSunset"];
      }
      if (self->_notifyUserAboutScheduleCounter < 3)
      {
        if (a3)
        {
          self->_notifyUserAboutScheduleCounter = 3;
          id v3 = (id)[objc_alloc(NSNumber) initWithInt:self->_notifyUserAboutScheduleCounter];
          if (v3)
          {
            [(NightModeControl *)self updateStatusDictionaryWithValue:v3 forKey:@"BlueLightReductionDisableScheduleAlertCounter"];
          }
        }
      }
      [(NightModeControl *)self reevaluateCurrentState];
    }
    else if (self->_logLevel >= 7)
    {
      NSLog(&cfstr_SChangeToSunMo.isa, "-[NightModeControl setMode:]");
    }
  }
}

- (void)setSchedule:(id)a3
{
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_S_2.isa, "-[NightModeControl setSchedule:]", a3);
  }
  [(NSMutableDictionary *)self->_properties setObject:a3 forKey:@"BlueLightReductionSchedule"];
  if ([a3 count] == 4)
  {
    SEL v6 = (void *)[a3 objectForKey:@"DayStartHour"];
    if (v6) {
      self->_status.schedule.toTime.hour = [v6 intValue];
    }
    objc_super v5 = (void *)[a3 objectForKey:@"DayStartMinute"];
    if (v6) {
      self->_status.schedule.toTime.minute = [v5 intValue];
    }
    id v4 = (void *)[a3 objectForKey:@"NightStartHour"];
    if (v4) {
      self->_status.schedule.fromTime.hour = [v4 intValue];
    }
    id v3 = (void *)[a3 objectForKey:@"NightStartMinute"];
    if (v3) {
      self->_status.schedule.fromTime.minute = [v3 intValue];
    }
  }
  else
  {
    NSLog(&cfstr_SInsufficientN.isa, "-[NightModeControl setSchedule:]");
  }
}

- (void)enableBlueLightReduction:(BOOL)a3 withOption:(int)a4
{
  BOOL v7 = a3;
  unsigned int v6 = a4;
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SModeDEnableDO.isa, "-[NightModeControl enableBlueLightReduction:withOption:]", self->_status.mode, a3, a4);
  }
  if (self->_status.mode)
  {
    if (v6 == 3) {
      unsigned int v6 = 2;
    }
    if (v6 == 1)
    {
      id v4 = self;
      if (v7) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 1;
      }
    }
    else
    {
      id v4 = self;
      if (v7) {
        uint64_t v5 = 4;
      }
      else {
        uint64_t v5 = 3;
      }
    }
    [(NightModeControl *)v4 setAlgoState:v5];
  }
  else if (v7)
  {
    if (v6 == 3)
    {
      [(NightModeControl *)self displayAlertInteractive:1];
      return;
    }
    if (v6 == 1) {
      [(NightModeControl *)self setAlgoState:2];
    }
    else {
      [(NightModeControl *)self setAlgoState:4];
    }
  }
  else
  {
    [(NightModeControl *)self setAlgoState:0];
  }
  +[CBAnalytics nightShiftEnabled:v7 withOption:v6];
  [(NightModeControl *)self reevaluateCurrentState];
}

- (void)initiateTransitionTo:(float)a3 andRampLength:(float)a4
{
  v17 = self;
  SEL v16 = a2;
  float v15 = a3;
  float v14 = a4;
  [(NightModeControl *)self cancelTransition];
  if (v17->_queue && v15 != v17->_factorState.factor)
  {
    v17->_factorState.start = v17->_factorState.factor;
    v17->_factorState.target = v15;
    v17->_factorState.rampStartTime = CFAbsoluteTimeGetCurrent();
    v17->_factorState.rampLength = v14;
    if (v17->_logLevel >= 7) {
      NSLog(&cfstr_SFStartTransit.isa, "-[NightModeControl initiateTransitionTo:andRampLength:]", *(void *)&v17->_factorState.rampStartTime, v17->_factorState.start, v17->_factorState.target, v17->_factorState.rampLength);
    }
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v17->_queue);
    v17->_transitionTimer = (OS_dispatch_source *)v4;
    source = v17->_transitionTimer;
    dispatch_time_t v5 = dispatch_time(0, 0);
    dispatch_source_set_timer(source, v5, (unint64_t)(float)(v17->_transitionRate * 1000000000.0), 0x3B9ACA00uLL);
    transitionTimer = v17->_transitionTimer;
    uint64_t handler = MEMORY[0x1E4F143A8];
    int v9 = -1073741824;
    int v10 = 0;
    uint64_t v11 = __55__NightModeControl_initiateTransitionTo_andRampLength___block_invoke;
    uint64_t v12 = &unk_1E6218FE0;
    id v13 = v17;
    dispatch_source_set_event_handler(transitionTimer, &handler);
    dispatch_resume((dispatch_object_t)v17->_transitionTimer);
  }
}

uint64_t __55__NightModeControl_initiateTransitionTo_andRampLength___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) transitionTimerHandler];
  return objc_sync_exit(obj);
}

- (void)scheduleNextTransition:(double)a3 withType:(int)a4
{
  id v18 = self;
  SEL v17 = a2;
  double v16 = a3;
  int v15 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  if (v18->_logLevel >= 7) {
    NSLog(&cfstr_SNextTransitio.isa, "-[NightModeControl scheduleNextTransition:withType:]", *(void *)&v16, v16 - Current);
  }
  if (v18->_nextTransitionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v18->_nextTransitionTimer);
    dispatch_release((dispatch_object_t)v18->_nextTransitionTimer);
    v18->_nextTransitionTimer = 0;
  }
  double v13 = (v16 - Current) * 1000000000.0 + 1000000000.0;
  dispatch_time_t v12 = 0;
  if (v13 < 3.1536e16)
  {
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)v13);
  }
  else
  {
    if (v18->_logLevel >= 7) {
      NSLog(&cfstr_SDispatchTimeO.isa, "-[NightModeControl scheduleNextTransition:withType:]");
    }
    dispatch_time_t v12 = -1;
  }
  if (v18->_queue)
  {
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v18->_queue);
    v18->_nextTransitionTimer = (OS_dispatch_source *)v4;
    dispatch_source_set_timer((dispatch_source_t)v18->_nextTransitionTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    nextTransitionTimer = v18->_nextTransitionTimer;
    uint64_t handler = MEMORY[0x1E4F143A8];
    int v7 = -1073741824;
    int v8 = 0;
    int v9 = __52__NightModeControl_scheduleNextTransition_withType___block_invoke;
    int v10 = &unk_1E6218FE0;
    uint64_t v11 = v18;
    dispatch_source_set_event_handler(nextTransitionTimer, &handler);
    v18->_currentScheduledTransitionType = v15;
    dispatch_resume((dispatch_object_t)v18->_nextTransitionTimer);
  }
}

uint64_t __52__NightModeControl_scheduleNextTransition_withType___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 56));
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 56));
    *(void *)(*(void *)(a1 + 32) + 56) = 0;
  }
  [*(id *)(a1 + 32) reevaluateCurrentState];
  return objc_sync_exit(obj);
}

- (void)setNightModeFactor:(float)a3
{
  LODWORD(v3) = -1.0;
  [(NightModeControl *)self setNightModeFactor:*(double *)&a3 withFadePeriod:v3];
}

- (void)setNightModeFactor:(float)a3 withFadePeriod:(float)a4
{
  if (a3 <= self->_maxFactor) {
    float maxFactor = a3;
  }
  else {
    float maxFactor = self->_maxFactor;
  }
  if (maxFactor >= self->_minFactor) {
    float minFactor = maxFactor;
  }
  else {
    float minFactor = self->_minFactor;
  }
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SFactorFPeriod.isa, "-[NightModeControl setNightModeFactor:withFadePeriod:]", minFactor, a4);
  }
  self->_factorState.factor = minFactor;
  a3 = minFactor;
  BOOL v14 = minFactor > self->_minFactor;
  if (self->_status.enabled != v14)
  {
    self->_status.enabled = minFactor > self->_minFactor;
    -[CBAnalyticsNightShiftTracker update:isEnabled:](self->_modeTracker, "update:isEnabled:", self->_status.mode, v14, *(double *)&a3);
    double v13 = (void *)[objc_alloc(NSNumber) initWithInt:self->_status.enabled];
    if (v13)
    {
      [(NightModeControl *)self updateStatusDictionaryWithValue:v13 forKey:@"BlueReductionEnabled"];
    }
  }
  if ([(NSMutableArray *)self->_supportObjs count])
  {
    if (self->_status.active && self->_status.available)
    {
      dispatch_time_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      if (v12)
      {
        id v4 = objc_alloc(NSNumber);
        *(float *)&double v5 = minFactor;
        id v11 = (id)[v4 initWithFloat:v5];
        if (v11)
        {
          [(NSMutableDictionary *)self->_properties setObject:v11 forKey:@"BlueLightReductionFactor"];
          [v12 setObject:v11 forKey:@"BlueLightReductionFactorValue"];
        }
        id v6 = objc_alloc(NSNumber);
        *(float *)&double v7 = a4;
        id v10 = (id)[v6 initWithFloat:v7];
        if (v10)
        {
          [v12 setObject:v10 forKey:@"BlueLightReductionFactorFadePeriod"];
        }
        [(NightModeControl *)self setNightShiftFactorDictionary:v12];
      }
    }
  }
}

- (void)transitionTimerHandler
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SNowF.isa, "-[NightModeControl transitionTimerHandler]", *(void *)&Current);
  }
  *(void *)&double v2 = LODWORD(self->_factorState.factor);
  float factor = self->_factorState.factor;
  if (self->_factorState.start >= self->_factorState.target)
  {
    if (self->_factorState.start > self->_factorState.target)
    {
      double v2 = self->_factorState.start
         - (float)(self->_factorState.start - self->_factorState.target)
         * ((Current - self->_factorState.rampStartTime)
          / self->_factorState.rampLength);
      *(float *)&double v2 = v2;
      float factor = *(float *)&v2;
    }
  }
  else
  {
    double v2 = self->_factorState.start
       + (float)(self->_factorState.target - self->_factorState.start)
       * ((Current - self->_factorState.rampStartTime)
        / self->_factorState.rampLength);
    *(float *)&double v2 = v2;
    float factor = *(float *)&v2;
  }
  if (self->_factorState.start <= self->_factorState.target && factor >= self->_factorState.target
    || self->_factorState.start >= self->_factorState.target && factor <= self->_factorState.target)
  {
    float factor = self->_factorState.target;
    if (self->_logLevel >= 7) {
      NSLog(&cfstr_SBlueLightRedu.isa, "-[NightModeControl transitionTimerHandler]", self->_factorState.start, factor);
    }
    if (self->_transitionTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_transitionTimer);
      dispatch_release((dispatch_object_t)self->_transitionTimer);
      self->_transitionTimer = 0;
    }
    [(NightModeControl *)self setAlgoState:0];
  }
  *(float *)&double v2 = factor;
  [(NightModeControl *)self setNightModeFactor:v2];
}

- (BOOL)updateTransitionTimesFromSchedule:(double)a3
{
  uint64_t v19 = self;
  SEL v18 = a2;
  double v17 = a3;
  char v16 = 0;
  int v15 = 0;
  int v15 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFCalendarIdentifier)*MEMORY[0x1E4F1D198]);
  if (v15)
  {
    CFCalendarSetTimeZone(v15, v19->_currentTimeZone);
    unsigned int v14 = 0;
    unsigned int v13 = 0;
    unsigned int v12 = 0;
    unsigned int hour = 0;
    unsigned int minute = 0;
    if (CFCalendarDecomposeAbsoluteTime(v15, v17, "yMdHm", &v14, &v13, &v12, &hour, &minute))
    {
      if (v19->_status.mode)
      {
        unsigned int hour = v19->_status.schedule.fromTime.hour;
        unsigned int minute = v19->_status.schedule.fromTime.minute;
      }
      else
      {
        unsigned int hour = 22;
        unsigned int minute = 0;
      }
      if (CFCalendarComposeAbsoluteTime(v15, &v19->_sunsetAbsolute, "yMdHm", v14, v13, v12, hour, minute))
      {
        v19->_sunsetPreviousAbsolute = v19->_sunsetAbsolute;
        if (v19->_sunsetAbsolute >= v17) {
          CFCalendarAddComponents(v15, &v19->_sunsetPreviousAbsolute, 0, "d", -1);
        }
        else {
          CFCalendarAddComponents(v15, &v19->_sunsetAbsolute, 0, "d", 1);
        }
        if (v19->_status.mode)
        {
          unsigned int hour = v19->_status.schedule.toTime.hour;
          unsigned int minute = v19->_status.schedule.toTime.minute;
        }
        else
        {
          unsigned int hour = 7;
          unsigned int minute = 0;
        }
        if (CFCalendarComposeAbsoluteTime(v15, &v19->_sunriseAbsolute, "yMdHm", v14, v13, v12, hour, minute))
        {
          v19->_offTransitionTimeAbsoluteUnrestricted = v19->_sunriseAbsolute - v19->_transitionLength;
          if (v19->_sunriseAbsolute < v19->_sunsetAbsolute
            || v19->_sunriseAbsolute - v19->_sunsetAbsolute >= (float)(v19->_transitionLength * 2.0))
          {
            if (v19->_sunriseAbsolute < v19->_sunsetPreviousAbsolute
              || v19->_sunriseAbsolute - v19->_sunsetPreviousAbsolute >= (float)(v19->_transitionLength * 2.0))
            {
              v19->_transitionsTimesCoeff = 1.0;
              v19->_sunriseAbsolute = v19->_sunriseAbsolute - v19->_transitionLength;
              v19->_transitionLengthActual = v19->_transitionLength;
            }
            else
            {
              double v8 = v19->_sunriseAbsolute - v19->_sunsetPreviousAbsolute;
              float v5 = v8 / (float)(v19->_transitionLength * 2.0);
              v19->_transitionsTimesCoeff = v5;
              v19->_sunriseAbsolute = v19->_sunriseAbsolute - v8 / 2.0;
              float v6 = v8 / 2.0;
              v19->_transitionLengthActual = v6;
              if (v19->_logLevel >= 7) {
                NSLog(&cfstr_STransitionsOv.isa, "-[NightModeControl updateTransitionTimesFromSchedule:]", v19->_transitionsTimesCoeff, v19->_transitionLengthActual);
              }
            }
          }
          else
          {
            double v9 = v19->_sunriseAbsolute - v19->_sunsetAbsolute;
            float v3 = v9 / (float)(v19->_transitionLength * 2.0);
            v19->_transitionsTimesCoeff = v3;
            v19->_sunriseAbsolute = v19->_sunriseAbsolute - v9 / 2.0;
            float v4 = v9 / 2.0;
            v19->_transitionLengthActual = v4;
            if (v19->_logLevel >= 7) {
              NSLog(&cfstr_STransitionsOv.isa, "-[NightModeControl updateTransitionTimesFromSchedule:]", v19->_transitionsTimesCoeff, v19->_transitionLengthActual);
            }
          }
          v19->_sunrisePreviousAbsolute = v19->_sunriseAbsolute;
          if (v19->_sunriseAbsolute >= v17) {
            CFCalendarAddComponents(v15, &v19->_sunrisePreviousAbsolute, 0, "d", -1);
          }
          else {
            CFCalendarAddComponents(v15, &v19->_sunriseAbsolute, 0, "d", 1);
          }
          v19->_offTransitionTimeAbsoluteUnrestrictedPrev = v19->_offTransitionTimeAbsoluteUnrestricted;
          if (v19->_offTransitionTimeAbsoluteUnrestricted >= v17) {
            CFCalendarAddComponents(v15, &v19->_offTransitionTimeAbsoluteUnrestrictedPrev, 0, "d", -1);
          }
          else {
            CFCalendarAddComponents(v15, &v19->_offTransitionTimeAbsoluteUnrestricted, 0, "d", 1);
          }
          char v16 = 1;
        }
        else
        {
          NSLog(&cfstr_FatalErrorSUna_0.isa, "-[NightModeControl updateTransitionTimesFromSchedule:]");
        }
      }
      else
      {
        NSLog(&cfstr_FatalErrorSUna.isa, "-[NightModeControl updateTransitionTimesFromSchedule:]");
      }
    }
    CFRelease(v15);
  }
  return v16 & 1;
}

- (void)updateTransitionTimes:(double)a3
{
  float v5 = self;
  SEL v4 = a2;
  double v3 = a3;
  if (self->_status.mode == 1) {
    v5->_transitionTimesValid = [(NightModeControl *)v5 updateTransitionTimesFromSunriseSunset:v3];
  }
  else {
    v5->_transitionTimesValid = [(NightModeControl *)v5 updateTransitionTimesFromSchedule:v3];
  }
  if (v5->_logLevel >= 7) {
    NSLog(&cfstr_SPrevSunriseFP.isa, "-[NightModeControl updateTransitionTimes:]", *(void *)&v5->_sunrisePreviousAbsolute, *(void *)&v5->_sunsetPreviousAbsolute, *(void *)&v5->_sunriseAbsolute, *(void *)&v5->_sunsetAbsolute, v5->_minFactor, v5->_maxFactor);
  }
}

- (void)initiateRestrictedMaxTransition
{
  *(float *)&double v2 = self->_maxFactor * self->_transitionsTimesCoeff;
  *(float *)&double v3 = fabsf(-(float)(self->_factorState.factor - *(float *)&v2)) * self->_transitionLength;
  -[NightModeControl initiateTransitionTo:andRampLength:](self, "initiateTransitionTo:andRampLength:", v2, v3, a2, self);
}

- (void)initiateFullMaxTransition
{
  *(float *)&double v2 = self->_maxFactor;
  *(float *)&double v3 = (float)(*(float *)&v2 - self->_factorState.factor) * self->_transitionLength;
  -[NightModeControl initiateTransitionTo:andRampLength:](self, "initiateTransitionTo:andRampLength:", v2, v3, a2, self);
}

- (void)initiateFullMinTransition
{
  *(float *)&double v2 = self->_minFactor;
  *(float *)&double v3 = self->_factorState.factor * self->_transitionLength;
  -[NightModeControl initiateTransitionTo:andRampLength:](self, "initiateTransitionTo:andRampLength:", v2, v3, a2, self);
}

- (void)reevaluateCurrentState
{
  LODWORD(v2) = -1.0;
  -[NightModeControl reevaluateCurrentStateWithFactorFadeOption:](self, "reevaluateCurrentStateWithFactorFadeOption:", v2, a2, self);
}

- (void)reevaluateCurrentStateWithFactorFadeOption:(float)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  char v23 = 0;
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SNowFEnabledDM.isa, "-[NightModeControl reevaluateCurrentStateWithFactorFadeOption:]", *(void *)&Current, self->_status.enabled, self->_status.mode, self->_algoState);
  }
  [(NightModeControl *)self cancelSchedule];
  [(NightModeControl *)self cancelTransition];
  if (self->_checkInactivity)
  {
    if (self->_logLevel >= 7) {
      NSLog(&cfstr_SCheckIncativi.isa, "-[NightModeControl reevaluateCurrentStateWithFactorFadeOption:]");
    }
    self->_checkInactivity = 0;
    if (Current - self->_displayOffTimestamp > self->_inactivityTimeout)
    {
      if (self->_logLevel >= 7) {
        NSLog(&cfstr_SInactivityChe.isa, "-[NightModeControl reevaluateCurrentStateWithFactorFadeOption:]");
      }
      [(NightModeControl *)self setAlgoState:0];
    }
    [(NightModeControl *)self updateStatusDictionaryWithValue:0 forKey:@"BlueLightReductionAlgoOverrideTimestamp"];
  }
  if (self->_algoState == 4)
  {
    [(NightModeControl *)self updateTransitionTimes:Current];
    char v23 = 1;
    if (self->_transitionTimesValid)
    {
      double untilNexTransitionTimestamp = self->_untilNexTransitionTimestamp;
      double offTransitionTimeAbsoluteUnrestrictedPrev = self->_offTransitionTimeAbsoluteUnrestrictedPrev;
      if (untilNexTransitionTimestamp < offTransitionTimeAbsoluteUnrestrictedPrev)
      {
        HIDWORD(untilNexTransitionTimestamp) = HIDWORD(Current);
        double offTransitionTimeAbsoluteUnrestrictedPrev = self->_offTransitionTimeAbsoluteUnrestrictedPrev
                                                  + self->_transitionLength;
        if (Current >= offTransitionTimeAbsoluteUnrestrictedPrev) {
          -[NightModeControl setAlgoState:](self, "setAlgoState:", 0, Current);
        }
      }
    }
  }
  else if (self->_algoState == 3)
  {
    [(NightModeControl *)self updateTransitionTimes:Current];
    char v23 = 1;
    if (self->_transitionTimesValid)
    {
      double untilNexTransitionTimestamp = self->_untilNexTransitionTimestamp;
      double offTransitionTimeAbsoluteUnrestrictedPrev = self->_sunsetPreviousAbsolute;
      if (untilNexTransitionTimestamp < offTransitionTimeAbsoluteUnrestrictedPrev) {
        [(NightModeControl *)self setAlgoState:0];
      }
    }
  }
  switch(self->_algoState)
  {
    case 3:
      if ((v23 & 1) == 0) {
        [(NightModeControl *)self updateTransitionTimes:Current];
      }
      double v5 = self->_untilNexTransitionTimestamp;
      double sunsetPreviousAbsolute = self->_sunsetPreviousAbsolute;
      if (v5 < sunsetPreviousAbsolute)
      {
        if (Current >= self->_sunsetPreviousAbsolute + self->_transitionLengthActual)
        {
          -[NightModeControl setAlgoState:](self, "setAlgoState:", 0, Current);
          *(float *)&double v9 = self->_maxFactor * self->_transitionsTimesCoeff;
          *(float *)&double v10 = a3;
          [(NightModeControl *)self setNightModeFactor:v9 withFadePeriod:v10];
          if (self->_status.mode) {
            [(NightModeControl *)self scheduleNextTransition:2 withType:self->_sunriseAbsolute];
          }
        }
        else
        {
          double transitionLengthActual = self->_transitionLengthActual;
          double v8 = vabdd_f64(Current, self->_sunsetPreviousAbsolute) / transitionLengthActual;
          *(float *)&double v8 = v8;
          *(float *)&double transitionLengthActual = a3;
          [(NightModeControl *)self setNightModeFactor:v8 withFadePeriod:transitionLengthActual];
          [(NightModeControl *)self initiateRestrictedMaxTransition];
          if (self->_status.mode) {
            [(NightModeControl *)self scheduleNextTransition:2 withType:self->_sunriseAbsolute];
          }
        }
        break;
      }
LABEL_32:
      *(float *)&double v5 = self->_minFactor;
      *(float *)&double sunsetPreviousAbsolute = a3;
      [(NightModeControl *)self setNightModeFactor:v5 withFadePeriod:sunsetPreviousAbsolute];
      [(NightModeControl *)self scheduleNextTransition:1 withType:self->_sunsetAbsolute];
      break;
    case 4:
      if ((v23 & 1) == 0) {
        [(NightModeControl *)self updateTransitionTimes:Current];
      }
      double v11 = self->_untilNexTransitionTimestamp;
      double v12 = self->_offTransitionTimeAbsoluteUnrestrictedPrev + self->_transitionLength;
      if (v11 >= v12)
      {
        *(float *)&double v11 = self->_maxFactor;
        *(float *)&double v12 = a3;
        [(NightModeControl *)self setNightModeFactor:v11 withFadePeriod:v12];
        [(NightModeControl *)self scheduleNextTransition:2 withType:self->_offTransitionTimeAbsoluteUnrestricted];
      }
      else if (Current >= self->_offTransitionTimeAbsoluteUnrestrictedPrev + self->_transitionLength)
      {
        -[NightModeControl setAlgoState:](self, "setAlgoState:", 0, Current);
        *(float *)&double v15 = self->_minFactor;
        *(float *)&double v16 = a3;
        [(NightModeControl *)self setNightModeFactor:v15 withFadePeriod:v16];
        if (self->_status.mode) {
          [(NightModeControl *)self scheduleNextTransition:1 withType:self->_sunsetAbsolute];
        }
      }
      else
      {
        double v13 = vabdd_f64(Current, self->_offTransitionTimeAbsoluteUnrestrictedPrev) / self->_transitionLength;
        double v14 = self->_maxFactor - v13;
        *(float *)&double v14 = v14;
        *(float *)&double v13 = a3;
        [(NightModeControl *)self setNightModeFactor:v14 withFadePeriod:v13];
        [(NightModeControl *)self initiateFullMinTransition];
        if (self->_status.mode) {
          [(NightModeControl *)self scheduleNextTransition:1 withType:self->_sunsetAbsolute];
        }
      }
      break;
    case 2:
      *(float *)&double untilNexTransitionTimestamp = self->_maxFactor;
      *(float *)&double offTransitionTimeAbsoluteUnrestrictedPrev = a3;
      [(NightModeControl *)self setNightModeFactor:untilNexTransitionTimestamp withFadePeriod:offTransitionTimeAbsoluteUnrestrictedPrev];
      break;
    default:
      if (self->_algoState == 1 || !self->_status.mode)
      {
        *(float *)&double untilNexTransitionTimestamp = self->_minFactor;
        *(float *)&double offTransitionTimeAbsoluteUnrestrictedPrev = a3;
        [(NightModeControl *)self setNightModeFactor:untilNexTransitionTimestamp withFadePeriod:offTransitionTimeAbsoluteUnrestrictedPrev];
        break;
      }
      if ((v23 & 1) == 0) {
        [(NightModeControl *)self updateTransitionTimes:Current];
      }
      if (self->_transitionTimesValid)
      {
        if (self->_sunriseAbsolute < self->_sunsetAbsolute)
        {
          HIDWORD(v19) = HIDWORD(Current);
          double v20 = self->_sunsetPreviousAbsolute + self->_transitionLengthActual;
          if (Current >= v20)
          {
            *(float *)&double v19 = self->_maxFactor * self->_transitionsTimesCoeff;
            *(float *)&double v20 = a3;
            [(NightModeControl *)self setNightModeFactor:v19 withFadePeriod:v20];
            [(NightModeControl *)self scheduleNextTransition:2 withType:self->_sunriseAbsolute];
          }
          else
          {
            [(NightModeControl *)self scheduleNextTransition:2 withType:self->_sunriseAbsolute];
            double transitionsTimesCoeff = self->_transitionsTimesCoeff;
            double v22 = vabdd_f64(Current, self->_sunsetPreviousAbsolute)
                / self->_transitionLengthActual
                * transitionsTimesCoeff;
            *(float *)&double v22 = v22;
            *(float *)&double transitionsTimesCoeff = a3;
            [(NightModeControl *)self setNightModeFactor:v22 withFadePeriod:transitionsTimesCoeff];
            [(NightModeControl *)self initiateRestrictedMaxTransition];
          }
          break;
        }
        HIDWORD(v5) = HIDWORD(Current);
        double sunsetPreviousAbsolute = self->_sunrisePreviousAbsolute + self->_transitionLengthActual;
        if (Current < sunsetPreviousAbsolute)
        {
          [(NightModeControl *)self scheduleNextTransition:1 withType:self->_sunsetAbsolute];
          double v17 = self->_transitionsTimesCoeff;
          double v18 = (self->_maxFactor - vabdd_f64(Current, self->_sunrisePreviousAbsolute) / self->_transitionLengthActual)
              * v17;
          *(float *)&double v18 = v18;
          *(float *)&double v17 = a3;
          [(NightModeControl *)self setNightModeFactor:v18 withFadePeriod:v17];
          [(NightModeControl *)self initiateFullMinTransition];
          break;
        }
        goto LABEL_32;
      }
      break;
  }
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SFactorF.isa, "-[NightModeControl reevaluateCurrentStateWithFactorFadeOption:]", self->_factorState.factor);
  }
}

- (void)setSunPermitted:(BOOL)a3
{
  if (self->_status.sunSchedulePermitted != a3)
  {
    self->_status.sunSchedulePermitted = a3;
    id v5 = (id)[objc_alloc(NSNumber) initWithBool:self->_status.sunSchedulePermitted];
    [(NightModeControl *)self updateStatusDictionaryWithValue:v5 forKey:@"BlueReductionSunScheduleAllowed"];
    +[CBAnalytics nightShiftSunSchedulePermitted:self->_status.sunSchedulePermitted];

    if (self->_status.sunSchedulePermitted)
    {
      if (self->_revertToSunriseSunset)
      {
        if (self->_logLevel >= 7) {
          NSLog(&cfstr_SRevertingBack.isa, "-[NightModeControl setSunPermitted:]");
        }
        self->_revertToSunriseSunset = 0;
        id v3 = (id)[objc_alloc(NSNumber) initWithInt:0];
        [(NightModeControl *)self updateStatusDictionaryWithValue:v3 forKey:@"BlueLightReductionRevertToSunriseSunset"];

        [(NightModeControl *)self setMode:1];
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_properties removeObjectForKey:@"BlueLightSunSchedule"];

      self->_sunriseSunsetInfo = 0;
      if (self->_status.mode == 1)
      {
        if (self->_logLevel >= 7) {
          NSLog(&cfstr_STakingAMarkTo.isa, "-[NightModeControl setSunPermitted:]");
        }
        [(NightModeControl *)self setMode:0];
        self->_revertToSunriseSunset = 1;
        id v4 = (id)[objc_alloc(NSNumber) initWithInt:1];
        [(NightModeControl *)self updateStatusDictionaryWithValue:v4 forKey:@"BlueLightReductionRevertToSunriseSunset"];
      }
    }
  }
}

- (void)updateSunriseSunsetBackup
{
  double v10 = self;
  SEL v9 = a2;
  if (self->_status.sunSchedulePermitted)
  {
    int v8 = 7;
    int v7 = 0;
    int v6 = 22;
    int v5 = 0;
    if (v10->_sunriseSunsetInfo)
    {
      calendar = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFCalendarIdentifier)*MEMORY[0x1E4F1D198]);
      if (calendar)
      {
        CFCalendarSetTimeZone(calendar, v10->_currentTimeZone);
        objc_msgSend(-[NSDictionary objectForKey:](v10->_sunriseSunsetInfo, "objectForKey:", v10->_nextSunriseKey), "timeIntervalSinceReferenceDate");
        if (!CFCalendarDecomposeAbsoluteTime(calendar, v2, "Hm", &v8, &v7))
        {
          int v8 = 7;
          int v7 = 0;
        }
        objc_msgSend(-[NSDictionary objectForKey:](v10->_sunriseSunsetInfo, "objectForKey:", v10->_nextSunsetKey), "timeIntervalSinceReferenceDate");
        if (!CFCalendarDecomposeAbsoluteTime(calendar, v3, "Hm", &v6, &v5))
        {
          int v6 = 22;
          int v5 = 0;
        }
        CFRelease(calendar);
      }
    }
    if (v6 != v10->_backupSchedule.fromTime.hour
      || v5 != v10->_backupSchedule.fromTime.minute
      || v8 != v10->_backupSchedule.toTime.hour
      || v5 != v10->_backupSchedule.toTime.minute)
    {
      v10->_backupSchedule.fromTime.unsigned int hour = v6;
      v10->_backupSchedule.fromTime.unsigned int minute = v5;
      v10->_backupSchedule.toTime.unsigned int hour = v8;
      v10->_backupSchedule.toTime.unsigned int minute = v7;
    }
  }
}

- (void)updateSunriseSunsetInfo:(id)a3
{
  if (a3)
  {
    int v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"status"), "intValue");
    if (v4)
    {
      if (v4 == 1)
      {

        self->_sunriseSunsetInfo = (NSDictionary *)[a3 objectForKey:@"sunSchedule"];
        CFAbsoluteTime v3 = self->_sunriseSunsetInfo;
        if (self->_sunriseSunsetInfo) {
          [(NSMutableDictionary *)self->_properties setObject:self->_sunriseSunsetInfo forKey:@"BlueLightSunSchedule"];
        }
        else {
          [(NSMutableDictionary *)self->_properties removeObjectForKey:@"BlueLightSunSchedule"];
        }
        [(NightModeControl *)self setSunPermitted:1];
        if (self->_logLevel >= 7)
        {
          if (self->_sunriseSunsetInfo) {
            NSLog(&cfstr_SSunriseSunset_0.isa, "-[NightModeControl updateSunriseSunsetInfo:]", self->_sunriseSunsetInfo);
          }
          else {
            NSLog(&cfstr_SSunriseSunset_0.isa, "-[NightModeControl updateSunriseSunsetInfo:]", @"unavailable");
          }
        }
      }
      else if (v4 == 2)
      {
        if (self->_logLevel >= 7) {
          NSLog(&cfstr_SSunriseSunset_1.isa, "-[NightModeControl updateSunriseSunsetInfo:]");
        }
        [(NightModeControl *)self setSunPermitted:1];
      }
      else
      {
        NSLog(&cfstr_SErrorUnexpect.isa, "-[NightModeControl updateSunriseSunsetInfo:]");
      }
    }
    else
    {
      if (self->_logLevel >= 7) {
        NSLog(&cfstr_SSunriseSunset.isa, "-[NightModeControl updateSunriseSunsetInfo:]");
      }
      [(NightModeControl *)self setSunPermitted:0];
    }
  }
  else if (self->_logLevel >= 7)
  {
    NSLog(&cfstr_SWarningSunris.isa, "-[NightModeControl updateSunriseSunsetInfo:]");
  }
  [(NightModeControl *)self updateSunriseSunsetBackup];
}

- (void)retrieveSunriseSunsetTimesFromBackup:(double)a3
{
  double v11 = self;
  SEL v10 = a2;
  double v9 = a3;
  int v8 = 0;
  int v8 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFCalendarIdentifier)*MEMORY[0x1E4F1D198]);
  if (v8)
  {
    CFCalendarSetTimeZone(v8, v11->_currentTimeZone);
    unsigned int v7 = 0;
    unsigned int v6 = 0;
    unsigned int v5 = 0;
    unsigned int hour = 0;
    unsigned int minute = 0;
    if (CFCalendarDecomposeAbsoluteTime(v8, v9, "yMdHm", &v7, &v6, &v5, &hour, &minute))
    {
      unsigned int hour = v11->_backupSchedule.fromTime.hour;
      unsigned int minute = v11->_backupSchedule.fromTime.minute;
      if (CFCalendarComposeAbsoluteTime(v8, &v11->_sunsetAbsolute, "yMdHm", v7, v6, v5, hour, minute))
      {
        v11->_double sunsetPreviousAbsolute = v11->_sunsetAbsolute;
        if (v11->_sunsetAbsolute >= v9) {
          CFCalendarAddComponents(v8, &v11->_sunsetPreviousAbsolute, 0, "d", -1);
        }
        else {
          CFCalendarAddComponents(v8, &v11->_sunsetAbsolute, 0, "d", 1);
        }
      }
      else
      {
        NSLog(&cfstr_FatalErrorSUna_1.isa, "-[NightModeControl retrieveSunriseSunsetTimesFromBackup:]");
      }
      unsigned int hour = v11->_backupSchedule.toTime.hour;
      unsigned int minute = v11->_backupSchedule.toTime.minute;
      if (CFCalendarComposeAbsoluteTime(v8, &v11->_sunriseAbsolute, "yMdHm", v7, v6, v5, hour, minute))
      {
        v11->_sunriseAbsolute = v11->_sunriseAbsolute - v11->_transitionLength;
        v11->_sunrisePreviousAbsolute = v11->_sunriseAbsolute;
        if (v11->_sunriseAbsolute >= v9) {
          CFCalendarAddComponents(v8, &v11->_sunrisePreviousAbsolute, 0, "d", -1);
        }
        else {
          CFCalendarAddComponents(v8, &v11->_sunriseAbsolute, 0, "d", 1);
        }
      }
      else
      {
        NSLog(&cfstr_FatalErrorSUna_2.isa, "-[NightModeControl retrieveSunriseSunsetTimesFromBackup:]");
      }
    }
    CFRelease(v8);
  }
}

- (BOOL)updateTransitionTimesFromSunriseSunset:(double)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v28 = self;
  SEL v27 = a2;
  double v26 = a3;
  char v25 = 0;
  if (self->_sunriseSunsetInfo)
  {
    unsigned int v18 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "distantFuture"), "timeIntervalSinceReferenceDate");
    double v17 = v3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "distantPast"), "timeIntervalSinceReferenceDate");
    double v16 = v4;
    char v25 = 1;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_previousSunriseKey), "timeIntervalSinceReferenceDate");
    double v29 = v5;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_previousSunsetKey), "timeIntervalSinceReferenceDate");
    double v30 = v6;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_currentSunriseKey), "timeIntervalSinceReferenceDate");
    double v31 = v7;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_currentSunsetKey), "timeIntervalSinceReferenceDate");
    double v32 = v8;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_nextSunriseKey), "timeIntervalSinceReferenceDate");
    double v33 = v9;
    objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_nextSunsetKey), "timeIntervalSinceReferenceDate");
    double v34 = v10;
    for (int i = 0; i < 6; ++i)
    {
      if (*(&v29 + i) == v16 || *(&v29 + i) == v17)
      {
        ++v18;
        *(&v19 + i) = 0;
      }
      else
      {
        *(&v19 + i) = 1;
      }
    }
    double v29 = v29 - v28->_transitionLength;
    double v31 = v31 - v28->_transitionLength;
    double v33 = v33 - v28->_transitionLength;
    [(NSDictionary *)v28->_sunriseSunsetInfo objectForKey:v28->_isDaylightKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v11 = objc_msgSend(-[NSDictionary objectForKey:](v28->_sunriseSunsetInfo, "objectForKey:", v28->_isDaylightKey), "BOOLValue");
      v28->_isDaylight = v11 & 1;
    }
    if (v28->_logLevel >= 7) {
      NSLog(&cfstr_SFlagDIsdaylig.isa, "-[NightModeControl updateTransitionTimesFromSunriseSunset:]", v18, v28->_isDaylight);
    }
    if (v18 == 6)
    {
      if (!v28->_isDaylight)
      {
LABEL_15:
        v28->_sunsetAbsolute = v17;
        v28->_sunriseAbsolute = v17 - 86400.0;
        v28->_double sunsetPreviousAbsolute = v16 + 86400.0;
        v28->_sunrisePreviousAbsolute = v16;
        goto LABEL_107;
      }
      goto LABEL_83;
    }
    if (v18 == 5)
    {
      for (int j = 0; j < 6; ++j)
      {
        if (*(&v19 + j))
        {
          if (j % 2 == 1 && v26 < *(&v29 + j))
          {
            v28->_sunsetAbsolute = *(&v29 + j);
            v28->_sunriseAbsolute = v17;
            v28->_double sunsetPreviousAbsolute = v16;
            v28->_sunrisePreviousAbsolute = v16;
          }
          else if (j % 2 == 1 && v26 >= *(&v29 + j))
          {
            v28->_sunsetAbsolute = v17;
            v28->_sunriseAbsolute = v17 - 86400.0;
            v28->_double sunsetPreviousAbsolute = *(&v29 + j);
            v28->_sunrisePreviousAbsolute = v16;
          }
          else if (j % 2 || v26 >= *(&v29 + j))
          {
            v28->_sunsetAbsolute = v17 - 86400.0;
            v28->_sunriseAbsolute = v17;
            v28->_sunrisePreviousAbsolute = *(&v29 + j);
            v28->_double sunsetPreviousAbsolute = v16;
          }
          else
          {
            v28->_sunsetAbsolute = v17;
            v28->_sunriseAbsolute = *(&v29 + j);
            v28->_double sunsetPreviousAbsolute = v16 + 86400.0;
            v28->_sunrisePreviousAbsolute = v16;
          }
        }
      }
    }
    else if (v18)
    {
      if (v22 & 1) != 0 && (v21)
      {
        if (v31 > v32)
        {
          if (v26 >= v32)
          {
            if (v26 >= v31)
            {
              if (v23) {
                v28->_sunriseAbsolute = v33;
              }
              else {
                v28->_sunriseAbsolute = v17;
              }
              if (v24) {
                v28->_sunsetAbsolute = v34;
              }
              else {
                v28->_sunsetAbsolute = v17 - 86400.0;
              }
              v28->_sunrisePreviousAbsolute = v31;
              v28->_double sunsetPreviousAbsolute = v32;
            }
            else
            {
              v28->_sunriseAbsolute = v31;
              if (v24) {
                v28->_sunsetAbsolute = v34;
              }
              else {
                v28->_sunsetAbsolute = v17;
              }
              if (v19) {
                v28->_sunrisePreviousAbsolute = v29;
              }
              else {
                v28->_sunrisePreviousAbsolute = v16;
              }
              v28->_double sunsetPreviousAbsolute = v32;
            }
          }
          else
          {
            v28->_sunriseAbsolute = v31;
            v28->_sunsetAbsolute = v32;
            if (v19) {
              v28->_sunrisePreviousAbsolute = v29;
            }
            else {
              v28->_sunrisePreviousAbsolute = v16;
            }
            if (v20) {
              v28->_double sunsetPreviousAbsolute = v30;
            }
            else {
              v28->_double sunsetPreviousAbsolute = v16;
            }
          }
        }
        else if (v26 >= v31)
        {
          if (v26 >= v32)
          {
            if (v23) {
              v28->_sunriseAbsolute = v33;
            }
            else {
              v28->_sunriseAbsolute = v17 - 86400.0;
            }
            if (v24) {
              v28->_sunsetAbsolute = v34;
            }
            else {
              v28->_sunsetAbsolute = v17;
            }
            v28->_sunrisePreviousAbsolute = v31;
            v28->_double sunsetPreviousAbsolute = v32;
          }
          else
          {
            if (v23) {
              v28->_sunriseAbsolute = v33;
            }
            else {
              v28->_sunriseAbsolute = v17;
            }
            v28->_sunsetAbsolute = v32;
            v28->_sunrisePreviousAbsolute = v31;
            if (v20) {
              v28->_double sunsetPreviousAbsolute = v30;
            }
            else {
              v28->_double sunsetPreviousAbsolute = v16;
            }
          }
        }
        else
        {
          v28->_sunriseAbsolute = v31;
          v28->_sunsetAbsolute = v32;
          if (v19) {
            v28->_sunrisePreviousAbsolute = v29;
          }
          else {
            v28->_sunrisePreviousAbsolute = v16;
          }
          if (v20) {
            v28->_double sunsetPreviousAbsolute = v30;
          }
          else {
            v28->_double sunsetPreviousAbsolute = v16;
          }
        }
      }
      else
      {
        if ((v22 & 1) == 0 && (v21 & 1) == 0)
        {
          if (!v28->_isDaylight) {
            goto LABEL_15;
          }
LABEL_83:
          v28->_sunriseAbsolute = v17;
          v28->_sunsetAbsolute = v17 - 86400.0;
          v28->_sunrisePreviousAbsolute = v16 + 86400.0;
          v28->_double sunsetPreviousAbsolute = v16;
          goto LABEL_107;
        }
        if (v24)
        {
          if (v26 < v32)
          {
            v28->_sunriseAbsolute = v17;
            v28->_sunsetAbsolute = v32;
            v28->_sunrisePreviousAbsolute = v29;
            v28->_double sunsetPreviousAbsolute = v30;
          }
          else
          {
            v28->_sunriseAbsolute = v17 - 86400.0;
            v28->_sunsetAbsolute = v17;
            v28->_sunrisePreviousAbsolute = v29;
            v28->_double sunsetPreviousAbsolute = v32;
          }
        }
        else
        {
          if (v26 < v31)
          {
            v28->_sunriseAbsolute = v31;
            v28->_sunsetAbsolute = v17;
            v28->_sunrisePreviousAbsolute = v29;
          }
          else
          {
            v28->_sunriseAbsolute = v17;
            v28->_sunsetAbsolute = v17 - 86400.0;
            v28->_sunrisePreviousAbsolute = v31;
          }
          v28->_double sunsetPreviousAbsolute = v30;
        }
      }
    }
    else if (v31 > v32)
    {
      if (v26 >= v32)
      {
        if (v26 >= v31)
        {
          if (v26 >= v34)
          {
            char v25 = 0;
          }
          else
          {
            v28->_sunriseAbsolute = v33;
            v28->_sunsetAbsolute = v34;
            v28->_sunrisePreviousAbsolute = v31;
            v28->_double sunsetPreviousAbsolute = v32;
          }
        }
        else
        {
          v28->_sunriseAbsolute = v31;
          v28->_sunsetAbsolute = v34;
          v28->_sunrisePreviousAbsolute = v29;
          v28->_double sunsetPreviousAbsolute = v32;
        }
      }
      else
      {
        v28->_sunriseAbsolute = v31;
        v28->_sunsetAbsolute = v32;
        v28->_sunrisePreviousAbsolute = v29;
        v28->_double sunsetPreviousAbsolute = v30;
      }
    }
    else if (v26 >= v31)
    {
      if (v26 >= v32)
      {
        if (v26 >= v33)
        {
          char v25 = 0;
        }
        else
        {
          v28->_sunriseAbsolute = v33;
          v28->_sunsetAbsolute = v34;
          v28->_sunrisePreviousAbsolute = v31;
          v28->_double sunsetPreviousAbsolute = v32;
        }
      }
      else
      {
        v28->_sunriseAbsolute = v33;
        v28->_sunsetAbsolute = v32;
        v28->_sunrisePreviousAbsolute = v31;
        v28->_double sunsetPreviousAbsolute = v30;
      }
    }
    else
    {
      v28->_sunriseAbsolute = v31;
      v28->_sunsetAbsolute = v32;
      v28->_sunrisePreviousAbsolute = v29;
      v28->_double sunsetPreviousAbsolute = v30;
    }
  }
LABEL_107:
  if ((v25 & 1) == 0)
  {
    if (v28->_logLevel >= 7) {
      NSLog(&cfstr_SWarningInvali.isa, "-[NightModeControl updateTransitionTimesFromSunriseSunset:]");
    }
    [(NightModeControl *)v28 retrieveSunriseSunsetTimesFromBackup:v26];
    char v25 = 1;
  }
  double v13 = v28->_sunriseAbsolute + v28->_transitionLength;
  if ((v13 < v28->_sunsetAbsolute || v13 - v28->_sunsetAbsolute >= (float)(v28->_transitionLength * 2.0))
    && (v13 < v28->_sunsetPreviousAbsolute || v13 - v28->_sunsetPreviousAbsolute >= (float)(v28->_transitionLength * 2.0)))
  {
    v28->_double transitionsTimesCoeff = 1.0;
    v28->_double transitionLengthActual = v28->_transitionLength;
    v28->_double offTransitionTimeAbsoluteUnrestrictedPrev = v28->_sunrisePreviousAbsolute;
    v28->_offTransitionTimeAbsoluteUnrestricted = v28->_sunriseAbsolute;
  }
  else
  {
    v28->_double transitionsTimesCoeff = 0.0;
    v28->_double transitionLengthActual = 0.0;
    v28->_sunriseAbsolute = v28->_sunsetAbsolute;
    v28->_sunrisePreviousAbsolute = v28->_sunsetPreviousAbsolute;
    v28->_offTransitionTimeAbsoluteUnrestricted = v28->_sunriseAbsolute - v28->_transitionLength;
    v28->_double offTransitionTimeAbsoluteUnrestrictedPrev = v28->_sunrisePreviousAbsolute - v28->_transitionLength;
    if (v28->_logLevel >= 7) {
      NSLog(&cfstr_SSunriseSunset_2.isa, "-[NightModeControl updateTransitionTimesFromSunriseSunset:]", v28->_transitionsTimesCoeff, v28->_transitionLengthActual);
    }
  }
  return v25 & 1;
}

- (void)updateOptionTimestamp:(double)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a3];
  if (v3)
  {
    [(NightModeControl *)self updateStatusDictionaryWithValue:v3 forKey:@"BlueLightReductionAlgoOverrideTimestamp"];
  }
}

- (void)setAlgoState:(int)a3
{
  if (self->_algoState != a3)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    self->_algoState = a3;
    id v3 = (id)[objc_alloc(NSNumber) initWithInt:self->_algoState];
    if (v3)
    {
      [(NightModeControl *)self updateStatusDictionaryWithValue:v3 forKey:@"BlueLightReductionAlgoOverride"];
    }
    if (self->_algoState == 4 || self->_algoState == 3)
    {
      [(NightModeControl *)self updateOptionTimestamp:Current];
      self->_double untilNexTransitionTimestamp = Current;
    }
    else
    {
      [(NightModeControl *)self updateStatusDictionaryWithValue:0 forKey:@"BlueLightReductionAlgoOverrideTimestamp"];
    }
  }
}

- (void)timeZoneChanged
{
  double v10 = self;
  SEL v9 = a2;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  double v6 = __35__NightModeControl_timeZoneChanged__block_invoke;
  double v7 = &unk_1E6218FE0;
  double v8 = v10;
  dispatch_async(queue, &block);
}

uint64_t __35__NightModeControl_timeZoneChanged__block_invoke(uint64_t a1)
{
  if (*(int *)(*(void *)(a1 + 32) + 224) >= 7) {
    NSLog(&cfstr_S.isa, "-[NightModeControl timeZoneChanged]_block_invoke");
  }
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(void *)(*(void *)(a1 + 32) + 136))
  {
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 136));
    *(void *)(*(void *)(a1 + 32) + 136) = CFTimeZoneCopySystem();
  }
  [*(id *)(a1 + 32) reevaluateCurrentState];
  return objc_sync_exit(obj);
}

- (void)clockChanged
{
  double v10 = self;
  SEL v9 = a2;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  double v6 = __32__NightModeControl_clockChanged__block_invoke;
  double v7 = &unk_1E6218FE0;
  double v8 = v10;
  dispatch_async(queue, &block);
}

uint64_t __32__NightModeControl_clockChanged__block_invoke(uint64_t a1)
{
  if (*(int *)(*(void *)(a1 + 32) + 224) >= 7) {
    NSLog(&cfstr_S.isa, "-[NightModeControl clockChanged]_block_invoke");
  }
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) reevaluateCurrentState];
  return objc_sync_exit(obj);
}

- (void)tearDownAllTimers
{
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SDisableAllTim.isa, "-[NightModeControl tearDownAllTimers]");
  }
  [(NightModeControl *)self cancelTransition];
  [(NightModeControl *)self cancelSchedule];
}

- (void)cancelSchedule
{
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SCancelNextTra.isa, "-[NightModeControl cancelSchedule]");
  }
  if (self->_nextTransitionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_nextTransitionTimer);
    dispatch_release((dispatch_object_t)self->_nextTransitionTimer);
    self->_nextTransitionTimer = 0;
    self->_currentScheduledTransitionType = 0;
  }
}

- (void)cancelTransition
{
  if (self->_logLevel >= 7) {
    NSLog(&cfstr_SCancelCurrent.isa, "-[NightModeControl cancelTransition]");
  }
  if (self->_transitionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_transitionTimer);
    dispatch_release((dispatch_object_t)self->_transitionTimer);
    self->_transitionTimer = 0;
  }
  float factor = self->_factorState.factor;
  self->_factorState.target = factor;
  self->_factorState.start = factor;
}

- (id)copyTimeStringWithHour:(int)a3 minute:(int)a4 second:(int)a5
{
  double v13 = 0;
  id v12 = 0;
  id v5 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v11 = (id)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    if (v12)
    {
      [v12 setLocalizedDateFormatFromTemplate:@"j"];
      double v10 = (void *)[v12 dateFormat];
      if (v10
        && ([v10 containsString:@"a"] & 1) == 0
        && ([v10 containsString:@"b"] & 1) == 0
        && ([v10 containsString:@"B"] & 1) == 0)
      {
        [v12 setLocalizedDateFormatFromTemplate:@"jjmm"];
      }
      id v9 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:0.0];
      if (v9)
      {
        double v8 = (void *)[v11 components:32 fromDate:v9];
        if (v8)
        {
          [v8 setHour:a3];
          [v8 setMinute:a4];
          [v8 setSecond:a5];
          uint64_t v7 = [v11 dateFromComponents:v8];
          if (v7) {
            double v13 = objc_msgSend([NSString alloc], "initWithString:", objc_msgSend(v12, "stringFromDate:", v7));
          }
        }
      }
    }
  }
  if (v12) {

  }
  if (v11) {
  return v13;
  }
}

- (void)displayAlertInteractive:(BOOL)a3
{
  __b[9] = *(const void **)MEMORY[0x1E4F143B8];
  double v30 = self;
  SEL v29 = a2;
  BOOL v28 = a3;
  if (!self->_notificationInProgress)
  {
    if (v30->_notifyUserAboutScheduleCounter < 3)
    {
      ++v30->_notifyUserAboutScheduleCounter;
      id v27 = 0;
      id v27 = (id)[objc_alloc(NSNumber) initWithInt:v30->_notifyUserAboutScheduleCounter];
      if (v27)
      {
        [(NightModeControl *)v30 updateStatusDictionaryWithValue:v27 forKey:@"BlueLightReductionDisableScheduleAlertCounter"];
      }
      if (!v28) {
        [(NightModeControl *)v30 enableBlueLightReduction:1 withOption:2];
      }
      id v26 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v7 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v6 = [v26 localizations];
      id v25 = (id)objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v6, objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages"));
      if ([v25 count])
      {
        uint64_t v24 = [v25 objectAtIndexedSubscript:0];
        char v23 = (const void *)objc_msgSend(v26, "localizedStringForKey:value:table:localization:", @"BLR_ALERT_TITLE", 0);
        char v22 = (const void *)[v26 localizedStringForKey:@"BLR_ALERT_TEXT_2" value:0 table:@"Localizable" localization:v24];
        char v21 = (const void *)[v26 localizedStringForKey:@"BLR_ALERT_OK_2" value:0 table:@"Localizable" localization:v24];
        uint64_t v20 = [v26 localizedStringForKey:@"BLR_ALERT_CANCEL_3" value:0 table:@"Localizable" localization:v24];
        if (v23)
        {
          if (v22 && v21 && v20)
          {
            id v19 = 0;
            id v18 = -[NightModeControl copyTimeStringWithHour:minute:second:](v30, "copyTimeStringWithHour:minute:second:", 7, 0);
            if (v18)
            {
              context = (void *)MEMORY[0x1BA9ECAE0]();
              id v17 = (id)[NSString stringWithValidatedFormat:v20, @"%@", 0, v18 validFormatSpecifiers error];
              id v19 = (id)[v17 copy];
            }
            if (v19)
            {
              SInt32 v16 = 0;
              memset(__b, 0, 0x48uLL);
              __b[0] = *(const void **)MEMORY[0x1E4F1D9B8];
              __b[1] = *(const void **)MEMORY[0x1E4F1D990];
              __b[2] = *(const void **)MEMORY[0x1E4F1D9A8];
              __b[3] = *(const void **)MEMORY[0x1E4F1D9E0];
              __b[4] = *(const void **)MEMORY[0x1E4F1D9D0];
              __b[5] = *(const void **)MEMORY[0x1E4FA7338];
              __b[6] = *(const void **)MEMORY[0x1E4FA7358];
              __b[7] = *(const void **)MEMORY[0x1E4FA7330];
              __b[8] = *(const void **)MEMORY[0x1E4FA7318];
              memset(v31, 0, sizeof(v31));
              v31[0] = *(const void **)MEMORY[0x1E4F1CFD0];
              v31[1] = v23;
              v31[2] = v22;
              v31[3] = v21;
              v31[4] = v19;
              v31[5] = *(const void **)MEMORY[0x1E4F1CFD0];
              v31[6] = *(const void **)MEMORY[0x1E4F1CFD0];
              v31[7] = *(const void **)MEMORY[0x1E4F1CFD0];
              v31[8] = @"prefs:root=DISPLAY&path=BLUE_LIGHT_REDUCTION";
              CFDictionaryRef dictionary = CFDictionaryCreate(0, __b, v31, 9, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);

              v30->_notificationInProgress = 1;
              CFUserNotificationRef v3 = CFUserNotificationCreate(0, 0.0, 3uLL, &v16, dictionary);
              v30->_enableNotification = v3;
              CFRelease(dictionary);
              global_queue = dispatch_get_global_queue(0, 0);
              uint64_t block = MEMORY[0x1E4F143A8];
              int v9 = -1073741824;
              int v10 = 0;
              id v11 = __44__NightModeControl_displayAlertInteractive___block_invoke;
              id v12 = &unk_1E62193A0;
              double v13 = v30;
              BOOL v14 = v28;
              dispatch_async(global_queue, &block);
            }
          }
        }
      }
    }
    else
    {
      [(NightModeControl *)v30 enableBlueLightReduction:1 withOption:2];
    }
  }
}

uint64_t __44__NightModeControl_displayAlertInteractive___block_invoke(CFOptionFlags a1)
{
  CFOptionFlags v6 = a1;
  responseFlags[2] = a1;
  responseFlags[1] = a1;
  responseFlags[0] = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(a1 + 32) + 368), 0.0, responseFlags);
  if (responseFlags[0] == 1 && (*(unsigned char *)(v6 + 40) & 1) != 0)
  {
    unint64_t v5 = 0x1E4F28000uLL;
    id v9 = (id)[objc_alloc(NSNumber) initWithInt:1];
    id v8 = (id)[objc_alloc(NSNumber) initWithInt:2];
    if (v9)
    {
      if (v8)
      {
        id v7 = 0;
        id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"BlueReductionEnabledValue", v8, @"BlueReductionEnabledOption", 0);
        if (v7)
        {
          [*(id *)(v6 + 32) setProperty:v7 forKey:@"BlueReductionEnabled"];
        }
      }
    }
  }
  id obj = *(id *)(v6 + 32);
  objc_sync_enter(obj);
  CFOptionFlags v1 = v6;
  *(unsigned char *)(*(void *)(v6 + 32) + 376) = 0;
  CFRelease(*(CFTypeRef *)(*(void *)(v1 + 32) + 368));
  id v2 = obj;
  *(void *)(*(void *)(v6 + 32) + 368) = 0;
  return objc_sync_exit(v2);
}

- (void)setNightShiftFactorDictionary:(id)a3
{
}

uint64_t __50__NightModeControl_setNightShiftFactorDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F1420540];
  if (result) {
    return [a2 setNightShiftFactorDictionary:*(void *)(a1 + 32)];
  }
  return result;
}

- (id)copyPreferenceForKey:(id)a3 user:(id)a4
{
  id v25 = self;
  SEL v24 = a2;
  id v23 = a3;
  id v22 = a4;
  uint64_t v15 = 0;
  SInt32 v16 = &v15;
  int v17 = 1375731712;
  int v18 = 48;
  id v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  uint64_t v21 = 0;
  supportObjs = self->_supportObjs;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  int v10 = __46__NightModeControl_copyPreferenceForKey_user___block_invoke;
  id v11 = &unk_1E62193C8;
  BOOL v14 = &v15;
  id v12 = a3;
  id v13 = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](supportObjs, "enumerateObjectsUsingBlock:");
  CFOptionFlags v6 = (void *)v16[5];
  _Block_object_dispose(&v15, 8);
  return v6;
}

uint64_t __46__NightModeControl_copyPreferenceForKey_user___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F1420540];
  if (result)
  {
    uint64_t result = [a2 copyPreferenceForKey:a1[4] user:a1[5]];
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5
{
}

uint64_t __46__NightModeControl_setPreference_forKey_user___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F1420540];
  if (result) {
    return [a2 setPreference:a1[4] forKey:a1[5] user:a1[6]];
  }
  return result;
}

@end