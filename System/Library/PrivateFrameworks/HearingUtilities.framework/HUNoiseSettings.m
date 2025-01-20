@interface HUNoiseSettings
+ (id)sharedInstance;
- (BOOL)hearingProtectionDeviceAvailable;
- (BOOL)internalLoggingEnabled;
- (BOOL)migratedThreshold;
- (BOOL)noiseEnabled;
- (BOOL)notificationsEnabled;
- (BOOL)onboardingCompleted;
- (BOOL)preferenceIsSetForRetrieveSelector:(SEL)a3;
- (HUNoiseSettings)init;
- (NPSDomainAccessor)domainAccessor;
- (NSArray)noiseThresholdOptions;
- (NSAttributedString)noiseThresholdFooterDescriptionWithLink;
- (NSDate)leqTimestamp;
- (NSDate)notificationMuteDate;
- (NSMutableDictionary)updateBlocks;
- (NSMutableSet)registeredNotifications;
- (NSMutableSet)synchronizePreferences;
- (NSNumber)notificationsEnabledOverride;
- (NSNumber)notificationsThreshholdOverride;
- (NSString)environmentalMeasurementsFooterDescription;
- (NSString)environmentalMeasurementsTitleDescription;
- (NSString)launchNoiseOnboardingTitle;
- (NSString)noiseThresholdFooterDescription;
- (NSString)noiseThresholdFooterLinkTitle;
- (NSString)noiseThresholdSectionTitle;
- (NSString)noiseThresholdTitleDescription;
- (NSString)noiseThresholdValueFooterDescription;
- (NSURL)noiseThresholdFooterLinkURL;
- (double)currentLeq;
- (double)leqDuration;
- (id)_preferenceKeyForSelector:(SEL)a3;
- (id)_valueForPreferenceKey:(id)a3;
- (id)localizedNoiseThresholdDetailValue:(int64_t)a3;
- (id)localizedNoiseThresholdValue:(int64_t)a3;
- (id)notificationForNoiseEnabled;
- (id)notificationForPreferenceKey:(id)a3;
- (int64_t)noiseThresholdCurrentValue;
- (int64_t)noiseThresholdMinutesThreshold;
- (unint64_t)notificationThreshold;
- (unint64_t)thresholdVersion;
- (void)_handlePreferenceChanged:(id)a3;
- (void)_registerForNotification:(id)a3;
- (void)_setValue:(id)a3 forPreferenceKey:(id)a4;
- (void)_synchronizeIfNecessary:(id)a3;
- (void)dealloc;
- (void)pairedWatchDidChange:(id)a3;
- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5;
- (void)setCurrentLeq:(double)a3;
- (void)setDomainAccessor:(id)a3;
- (void)setHearingProtectionDeviceAvailable:(BOOL)a3;
- (void)setInternalLoggingEnabled:(BOOL)a3;
- (void)setLeqDuration:(double)a3;
- (void)setLeqTimestamp:(id)a3;
- (void)setMigratedThreshold:(BOOL)a3;
- (void)setNoiseEnabled:(BOOL)a3;
- (void)setNotificationMuteDate:(id)a3;
- (void)setNotificationThreshold:(unint64_t)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setNotificationsEnabledOverride:(id)a3;
- (void)setNotificationsThreshholdOverride:(id)a3;
- (void)setOnboardingCompleted:(BOOL)a3;
- (void)setRegisteredNotifications:(id)a3;
- (void)setSynchronizePreferences:(id)a3;
- (void)setThresholdVersion:(unint64_t)a3;
- (void)setUpdateBlocks:(id)a3;
@end

@implementation HUNoiseSettings

- (id)_valueForPreferenceKey:(id)a3
{
  id v4 = a3;
  v5 = [(HUNoiseSettings *)self domainAccessor];
  id v6 = (id)[v5 synchronize];

  v7 = [(HUNoiseSettings *)self domainAccessor];
  v8 = [v7 objectForKey:v4];

  return v8;
}

- (NPSDomainAccessor)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    id v4 = objc_alloc(MEMORY[0x263F57520]);
    v5 = (NPSDomainAccessor *)[v4 initWithDomain:kAXSNoisePreferenceDomain];
    id v6 = self->_domainAccessor;
    self->_domainAccessor = v5;

    domainAccessor = self->_domainAccessor;
  }

  return domainAccessor;
}

- (BOOL)onboardingCompleted
{
  return AXSettingsReturnBoolValue(@"OnboardingCompleted");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance_Settings_3;

  return v2;
}

uint64_t __33__HUNoiseSettings_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HUNoiseSettings);
  uint64_t v1 = sharedInstance_Settings_3;
  sharedInstance_Settings_3 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (HUNoiseSettings)init
{
  v15.receiver = self;
  v15.super_class = (Class)HUNoiseSettings;
  v2 = [(HUNoiseSettings *)&v15 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    synchronizeDomainsLock = v2->_synchronizeDomainsLock;
    v2->_synchronizeDomainsLock = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    registeredNotifications = v2->_registeredNotifications;
    v2->_registeredNotifications = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    synchronizePreferences = v2->_synchronizePreferences;
    v2->_synchronizePreferences = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    updateBlocks = v2->_updateBlocks;
    v2->_updateBlocks = v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)AccessibilitySettingsChangedOnCompanion, @"NanoNoiseSettingsChanged", 0, (CFNotificationSuspensionBehavior)0);
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v2 selector:sel_pairedWatchDidChange_ name:*MEMORY[0x263F576B8] object:0];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v2 selector:sel_pairedWatchDidChange_ name:*MEMORY[0x263F57688] object:0];
  }
  return v2;
}

- (void)pairedWatchDidChange:(id)a3
{
  self->_domainAccessor = 0;
  MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUNoiseSettings;
  [(HUNoiseSettings *)&v4 dealloc];
}

- (void)_handlePreferenceChanged:(id)a3
{
  id v8 = [a3 stringByReplacingOccurrencesOfString:@"_AXNotification_" withString:&stru_26C1D5720];
  [(NSLock *)self->_synchronizeDomainsLock lock];
  objc_super v4 = [(HUNoiseSettings *)self synchronizePreferences];
  [v4 addObject:v8];

  v5 = [(HUNoiseSettings *)self updateBlocks];
  id v6 = [v5 objectForKey:v8];
  v7 = (void *)[v6 copy];

  [(NSLock *)self->_synchronizeDomainsLock unlock];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_72];
}

void __44__HUNoiseSettings__handlePreferenceChanged___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectAtIndexedSubscript:1];
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (id)notificationForPreferenceKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"_AXNotification_", a3];
}

- (id)notificationForNoiseEnabled
{
  return [(HUNoiseSettings *)self notificationForPreferenceKey:@"NoiseEnabled"];
}

- (id)_preferenceKeyForSelector:(SEL)a3
{
  if (_preferenceKeyForSelector__onceToken != -1) {
    dispatch_once(&_preferenceKeyForSelector__onceToken, &__block_literal_global_78);
  }
  objc_super v4 = (void *)_preferenceKeyForSelector__SelectorMap;
  v5 = NSStringFromSelector(a3);
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = @"UnknownKey";
  }
  id v8 = v7;

  return v8;
}

void __45__HUNoiseSettings__preferenceKeyForSelector___block_invoke()
{
  id v12 = objc_alloc(NSDictionary);
  v13 = NSStringFromSelector(sel_noiseEnabled);
  v0 = NSStringFromSelector(sel_onboardingCompleted);
  uint64_t v1 = NSStringFromSelector(sel_notificationsEnabled);
  v2 = NSStringFromSelector(sel_notificationThreshold);
  v3 = NSStringFromSelector(sel_notificationMuteDate);
  objc_super v4 = NSStringFromSelector(sel_currentLeq);
  v5 = NSStringFromSelector(sel_leqTimestamp);
  id v6 = NSStringFromSelector(sel_leqDuration);
  v7 = NSStringFromSelector(sel_migratedThreshold);
  id v8 = NSStringFromSelector(sel_thresholdVersion);
  v9 = NSStringFromSelector(sel_internalLoggingEnabled);
  uint64_t v10 = objc_msgSend(v12, "initWithObjectsAndKeys:", @"NoiseEnabled", v13, @"OnboardingCompleted", v0, @"NotificationsEnabled", v1, @"NotificationsThreshold", v2, @"NotificationsMuteDate", v3, @"CurrentLeq", v4, @"LeqTimestamp", v5, @"LeqDuration", v6, @"ThresholdMigration",
          v7,
          @"ThresholdVersion",
          v8,
          @"NoiseInternalLogging",
          v9,
          0);
  v11 = (void *)_preferenceKeyForSelector__SelectorMap;
  _preferenceKeyForSelector__SelectorMap = v10;
}

- (void)_registerForNotification:(id)a3
{
  id v4 = a3;
  if (_registerForNotification__onceToken != -1) {
    dispatch_once(&_registerForNotification__onceToken, &__block_literal_global_106);
  }
  v5 = (void *)_registerForNotification__RegistrationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HUNoiseSettings__registerForNotification___block_invoke_2;
  v7[3] = &unk_2640FC938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performSynchronousWritingBlock:v7];
}

uint64_t __44__HUNoiseSettings__registerForNotification___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F21380]);
  uint64_t v1 = _registerForNotification__RegistrationQueue;
  _registerForNotification__RegistrationQueue = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void __44__HUNoiseSettings__registerForNotification___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) registeredNotifications];
  if (([v4 containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [v4 addObject:*(void *)(a1 + 40)];
    v2 = [*(id *)(a1 + 32) notificationForPreferenceKey:*(void *)(a1 + 40)];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5
{
  v25[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v9];
  [(NSLock *)self->_synchronizeDomainsLock lock];
  v11 = [(HUNoiseSettings *)self updateBlocks];
  id v12 = (void *)[v11 copy];

  [(NSLock *)self->_synchronizeDomainsLock unlock];
  v13 = [(HUNoiseSettings *)self _preferenceKeyForSelector:a4];
  v14 = [v12 objectForKey:v13];
  if (v8)
  {
    v25[0] = v10;
    objc_super v15 = (void *)MEMORY[0x2105575F0](v8);
    v25[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];

    if (!v14)
    {
      v14 = [MEMORY[0x263EFF980] array];
    }
    [v14 addObject:v16];
    objc_getAssociatedObject(v9, &AXHASettingsDestructionHelperKey);
    v17 = (HUNoiseSettingsListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = [[HUNoiseSettingsListenerHelper alloc] initWithListenerAddress:v9];
      objc_setAssociatedObject(v9, &AXHASettingsDestructionHelperKey, v17, (void *)1);
    }
    [(HUNoiseSettingsListenerHelper *)v17 addSelectorKey:a4];
    [(HUNoiseSettings *)self _registerForNotification:v13];
  }
  else
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __72__HUNoiseSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke;
    v23 = &unk_2640FD098;
    id v24 = v10;
    v18 = [v14 indexesOfObjectsPassingTest:&v20];
    if (objc_msgSend(v18, "count", v20, v21, v22, v23)) {
      [v14 removeObjectsAtIndexes:v18];
    }

    v16 = v24;
  }

  [(NSLock *)self->_synchronizeDomainsLock lock];
  v19 = [(HUNoiseSettings *)self updateBlocks];
  [v19 setObject:v14 forKey:v13];

  [(NSLock *)self->_synchronizeDomainsLock unlock];
}

uint64_t __72__HUNoiseSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)preferenceIsSetForRetrieveSelector:(SEL)a3
{
  id v3 = self;
  id v4 = [(HUNoiseSettings *)self _preferenceKeyForSelector:a3];
  uint64_t v5 = [(HUNoiseSettings *)v3 _valueForPreferenceKey:v4];
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

- (void)_setValue:(id)a3 forPreferenceKey:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUNoiseSettings *)self domainAccessor];
  [v8 setObject:v7 forKey:v6];

  id v9 = [(HUNoiseSettings *)self domainAccessor];
  id v10 = (id)[v9 synchronize];

  v11 = objc_opt_new();
  uint64_t v12 = kAXSNoisePreferenceDomain;
  v13 = (void *)MEMORY[0x263EFFA08];
  v18[0] = v6;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  objc_super v15 = [v13 setWithArray:v14];
  [v11 synchronizeNanoDomain:v12 keys:v15];

  v16 = [(HUNoiseSettings *)self notificationForPreferenceKey:v6];

  if (v16)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v16, 0, 0, 1u);
  }
}

- (void)_synchronizeIfNecessary:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_synchronizeDomainsLock lock];
  id v4 = [(HUNoiseSettings *)self synchronizePreferences];
  if ([v4 containsObject:v5])
  {
    CFPreferencesAppSynchronize((CFStringRef)kAXSNoisePreferenceDomain);
    [v4 removeObject:v5];
  }
  [(NSLock *)self->_synchronizeDomainsLock unlock];
}

- (BOOL)noiseEnabled
{
  return AXSettingsReturnBoolValue(@"NoiseEnabled");
}

- (void)setNoiseEnabled:(BOOL)a3
{
  id v4 = objc_msgSend(NSNumber, "numberWithBool:");
  [(HUNoiseSettings *)self _setValue:v4 forPreferenceKey:@"NoiseEnabled"];

  id v5 = [MEMORY[0x263F53C50] sharedConnection];
  LODWORD(v4) = [v5 isHealthDataSubmissionAllowed];

  if (v4) {
    AnalyticsSendEventLazy();
  }
}

id __35__HUNoiseSettings_setNoiseEnabled___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"enabled";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)setOnboardingCompleted:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HUNoiseSettings *)self _setValue:v4 forPreferenceKey:@"OnboardingCompleted"];
}

- (BOOL)notificationsEnabled
{
  id v3 = [(HUNoiseSettings *)self notificationsEnabledOverride];

  if (v3)
  {
    id v4 = [(HUNoiseSettings *)self notificationsEnabledOverride];
    char v5 = [v4 BOOLValue];

    return v5;
  }
  else
  {
    return AXSettingsReturnBoolValue(@"NotificationsEnabled");
  }
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HUNoiseSettings *)self _setValue:v4 forPreferenceKey:@"NotificationsEnabled"];
}

- (unint64_t)notificationThreshold
{
  id v3 = [(HUNoiseSettings *)self notificationsThreshholdOverride];

  if (v3)
  {
    id v4 = [(HUNoiseSettings *)self notificationsThreshholdOverride];
    unint64_t v5 = [v4 unsignedIntegerValue];

    return v5;
  }
  else
  {
    return AXSettingsReturnUnsignedIntegerValue(@"NotificationsThreshold", 90);
  }
}

- (void)setNotificationThreshold:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(HUNoiseSettings *)self _setValue:v4 forPreferenceKey:@"NotificationsThreshold"];
}

- (NSDate)notificationMuteDate
{
  double v2 = AXSettingsReturnDoubleValue(@"NotificationsMuteDate");
  id v3 = (void *)MEMORY[0x263EFF910];

  return (NSDate *)[v3 dateWithTimeIntervalSinceReferenceDate:v2];
}

- (void)setNotificationMuteDate:(id)a3
{
  id v4 = NSNumber;
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "numberWithDouble:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HUNoiseSettings *)self _setValue:v5 forPreferenceKey:@"NotificationsMuteDate"];
}

- (double)currentLeq
{
  return AXSettingsReturnDoubleValue(@"CurrentLeq");
}

- (void)setCurrentLeq:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(HUNoiseSettings *)self _setValue:v4 forPreferenceKey:@"CurrentLeq"];
}

- (NSDate)leqTimestamp
{
  double v2 = AXSettingsReturnDoubleValue(@"LeqTimestamp");
  id v3 = (void *)MEMORY[0x263EFF910];

  return (NSDate *)[v3 dateWithTimeIntervalSinceReferenceDate:v2];
}

- (void)setLeqTimestamp:(id)a3
{
  id v4 = NSNumber;
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "numberWithDouble:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HUNoiseSettings *)self _setValue:v5 forPreferenceKey:@"LeqTimestamp"];
}

- (double)leqDuration
{
  return AXSettingsReturnDoubleValue(@"LeqDuration");
}

- (void)setLeqDuration:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(HUNoiseSettings *)self _setValue:v4 forPreferenceKey:@"LeqDuration"];
}

- (BOOL)migratedThreshold
{
  return AXSettingsReturnBoolValue(@"ThresholdMigration");
}

- (void)setMigratedThreshold:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HUNoiseSettings *)self _setValue:v4 forPreferenceKey:@"ThresholdMigration"];
}

- (unint64_t)thresholdVersion
{
  return AXSettingsReturnUnsignedIntegerValue(@"ThresholdVersion", 0);
}

- (void)setThresholdVersion:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(HUNoiseSettings *)self _setValue:v4 forPreferenceKey:@"ThresholdVersion"];
}

- (BOOL)internalLoggingEnabled
{
  return AXSettingsReturnBoolValue(@"NoiseInternalLogging");
}

- (void)setInternalLoggingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HUNoiseSettings *)self _setValue:v4 forPreferenceKey:@"NoiseInternalLogging"];
}

- (NSString)launchNoiseOnboardingTitle
{
  return (NSString *)HUNoiseLocString(@"ENABLE_NOISE");
}

- (NSString)environmentalMeasurementsTitleDescription
{
  return (NSString *)HUNoiseLocString(@"ENVIRONMENTAL_TITLE");
}

- (NSString)environmentalMeasurementsFooterDescription
{
  return (NSString *)HUNoiseLocString(@"ENVIRONMENTAL_MEASUREMENT_FOOTER");
}

- (NSString)noiseThresholdSectionTitle
{
  return (NSString *)HUNoiseLocString(@"NOISE_NOTIFICATIONS");
}

- (NSString)noiseThresholdTitleDescription
{
  return (NSString *)HUNoiseLocString(@"NOISE_THRESHOLD");
}

- (NSAttributedString)noiseThresholdFooterDescriptionWithLink
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = [(HUNoiseSettings *)self noiseThresholdFooterDescription];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];
  v11 = @"NSLink";
  id v5 = [(HUNoiseSettings *)self noiseThresholdFooterLinkURL];
  v12[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v7 = [(HUNoiseSettings *)self noiseThresholdFooterLinkTitle];
  uint64_t v8 = [v3 rangeOfString:v7];
  objc_msgSend(v4, "setAttributes:range:", v6, v8, v9);

  return (NSAttributedString *)v4;
}

- (NSString)noiseThresholdFooterDescription
{
  id v3 = HUNoiseLocString(@"NOISE_THRESHOLD_FOOTER");
  id v6 = [(HUNoiseSettings *)self noiseThresholdFooterLinkTitle];
  id v4 = AXCFormattedString();

  return (NSString *)v4;
}

- (NSString)noiseThresholdFooterLinkTitle
{
  return (NSString *)HUNoiseLocString(@"NOISE_THRESHOLD_FOOTER_LINK");
}

- (NSURL)noiseThresholdFooterLinkURL
{
  return (NSURL *)[NSURL URLWithString:@"https://support.apple.com/HT209593"];
}

- (int64_t)noiseThresholdMinutesThreshold
{
  return 3;
}

- (int64_t)noiseThresholdCurrentValue
{
  if (![(HUNoiseSettings *)self notificationsEnabled]) {
    return 0;
  }

  return [(HUNoiseSettings *)self notificationThreshold];
}

- (NSArray)noiseThresholdOptions
{
  return (NSArray *)&unk_26C1E5D78;
}

- (id)localizedNoiseThresholdValue:(int64_t)a3
{
  if (a3)
  {
    id v3 = HUNoiseLocString(@"DECIBELS");
    id v4 = AXCFormattedString();
  }
  else
  {
    id v4 = HUNoiseLocString(@"OFF");
  }

  return v4;
}

- (id)localizedNoiseThresholdDetailValue:(int64_t)a3
{
  if (a3 > 89)
  {
    switch(a3)
    {
      case 'Z':
        id v3 = @"LIMIT_90DB";
        goto LABEL_14;
      case '_':
        id v3 = @"LIMIT_95DB";
        goto LABEL_14;
      case 'd':
        id v3 = @"LIMIT_100DB";
        goto LABEL_14;
    }
LABEL_19:
    id v4 = HUNoiseLocString(@"NO_NOTIFICATIONS");
    id v5 = &stru_26C1D5720;
    goto LABEL_15;
  }
  if (!a3)
  {
    id v4 = HUNoiseLocString(@"NO_NOTIFICATIONS");
    goto LABEL_16;
  }
  if (a3 == 80)
  {
    id v3 = @"LIMIT_80DB";
    goto LABEL_14;
  }
  if (a3 != 85) {
    goto LABEL_19;
  }
  id v3 = @"LIMIT_85DB";
LABEL_14:
  HUNoiseLocString(v3);
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v6 = HUNoiseLocString(@"LIMIT_PER_DAY");
  id v4 = AXCFormattedString();

LABEL_15:
LABEL_16:

  return v4;
}

- (NSString)noiseThresholdValueFooterDescription
{
  if ([(HUNoiseSettings *)self noiseThresholdCurrentValue] < 1) {
    HUNoiseLocString(@"THRESHOLD_DESCRIPTION_FOOTER_NO_DECIBELS");
  }
  else {
  id v3 = HUNoiseLocString(@"THRESHOLD_DESCRIPTION_FOOTER");
  }
  [(HUNoiseSettings *)self noiseThresholdMinutesThreshold];
  id v4 = AXCFormattedString();

  return (NSString *)v4;
}

- (void)setNotificationsEnabledOverride:(id)a3
{
}

- (void)setNotificationsThreshholdOverride:(id)a3
{
}

- (BOOL)hearingProtectionDeviceAvailable
{
  return AXSettingsReturnBoolValue(@"HearingProtectionDeviceAvailablePreference");
}

- (void)setHearingProtectionDeviceAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  HCHPInitializeLogging();
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Set hearingProtectionDeviceAvailable %d", v3);
  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseSettings setHearingProtectionDeviceAvailable:]", 644, v5];
  id v7 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v10 = [NSNumber numberWithBool:v3];
  [(HUNoiseSettings *)self _setValue:v10 forPreferenceKey:@"HearingProtectionDeviceAvailablePreference"];
}

- (NSNumber)notificationsEnabledOverride
{
  return self->_notificationsEnabledOverride;
}

- (NSNumber)notificationsThreshholdOverride
{
  return self->_notificationsThreshholdOverride;
}

- (NSMutableSet)registeredNotifications
{
  return self->_registeredNotifications;
}

- (void)setRegisteredNotifications:(id)a3
{
}

- (NSMutableSet)synchronizePreferences
{
  return self->_synchronizePreferences;
}

- (void)setSynchronizePreferences:(id)a3
{
}

- (NSMutableDictionary)updateBlocks
{
  return self->_updateBlocks;
}

- (void)setUpdateBlocks:(id)a3
{
}

- (void)setDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_synchronizePreferences, 0);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
  objc_storeStrong((id *)&self->_notificationsThreshholdOverride, 0);
  objc_storeStrong((id *)&self->_notificationsEnabledOverride, 0);

  objc_storeStrong((id *)&self->_synchronizeDomainsLock, 0);
}

@end