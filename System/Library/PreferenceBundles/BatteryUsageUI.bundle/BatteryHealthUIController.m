@interface BatteryHealthUIController
+ (double)getMaxChargeCapacityPercentage:(int)a3;
+ (id)getHealthStateString;
+ (id)unknownString;
- (ACSBatteryServiceBookingCoordinator)batteryServiceBookingCoordinator;
- (BOOL)isAuthSpinner;
- (BOOL)isImprovedServiceHandoffEnabled;
- (BOOL)spinnerCanReloadUI;
- (BOOL)userDisabledPerfManagement;
- (BatteryHealthUIController)init;
- (NSDate)batteryDateOfFirstUse;
- (NSDate)batteryDateOfManufacture;
- (NSNumber)batteryCycleCount;
- (NSNumber)maximumCapacityPercent;
- (OS_dispatch_source)spinnerTimer;
- (OS_os_log)BHUILog;
- (PSSpecifier)chargingOptionsSpecifier;
- (PSSpecifier)spinnerGroup;
- (PowerUISmartChargeClient)smartChargingClient;
- (id)aboutBatteriesGroupSpecifier;
- (id)batteryInfoGroupSpecifier;
- (id)bhuiDateFormatter;
- (id)chargeCapacityGroupSpecifier;
- (id)chargeCapacityRemainingDemo:(id)a3;
- (id)cleanEnergyChargingGroupSpecifier;
- (id)cycleCountGroupSpecifier;
- (id)getChargeCapacityRemaining;
- (id)getChargingMode;
- (id)getCleanChargingSwitchState;
- (id)getCycleCount;
- (id)getDateOfFirstUse;
- (id)getDateOfManufacture;
- (id)getManualChargingSwitchState;
- (id)getSmartChargingSwitchState;
- (id)getStringFromDate:(id)a3;
- (id)headerSpecifiers;
- (id)healthStateGroupSpecifier;
- (id)healthStateString;
- (id)manualChargingGroupSpecifier;
- (id)nonGenuineBatteryGroupSpecifier;
- (id)peakPowerCapacityGroupSpecifier;
- (id)recalibrationHeaderSpecifier;
- (id)serviceHeaderSpecifier;
- (id)setChargingMode:(id)a3 specifier:(id)a4;
- (id)setUpChargingOptionsSpecifiers;
- (id)smartChargingGroupSpecifier;
- (id)specifiers;
- (id)spinnerSpecifierGroup;
- (id)startSpinner;
- (id)unknownHeaderSpeciifer;
- (int)batteryHealthServiceFlag;
- (int)batteryHealthServiceState;
- (int)genuineBatteryStatus;
- (int)perfManagementState;
- (unint64_t)_batteryHealthUILoadEndTime;
- (unint64_t)_batteryHealthUILoadStartTime;
- (unint64_t)cleanChargingState;
- (unint64_t)curChargingMode;
- (unint64_t)smartChargingState;
- (void)clearSpinner;
- (void)didTapABW;
- (void)getBatteryInformation;
- (void)handleNonGenuineBatteryTap:(id)a3;
- (void)handleRecalibrationTap:(id)a3;
- (void)handleServiceBatteryTap:(id)a3;
- (void)handleServiceBatteryTapUsingAppleCareSupport:(id)a3;
- (void)logBatteryStatusAndStates;
- (void)reloadSpecifiersFromSpinner;
- (void)setAboutBatteriesLink;
- (void)setAboutCleanEnergyChargingLink;
- (void)setBHUILog:(id)a3;
- (void)setBatteryCycleCount:(id)a3;
- (void)setBatteryDateOfFirstUse:(id)a3;
- (void)setBatteryDateOfManufacture:(id)a3;
- (void)setBatteryHealthServiceFlag:(int)a3;
- (void)setBatteryHealthServiceState:(int)a3;
- (void)setBatteryServiceBookingCoordinator:(id)a3;
- (void)setBatteryServiceLink;
- (void)setChargingOptionsSpecifier:(id)a3;
- (void)setCleanChargingState:(unint64_t)a3;
- (void)setCleanChargingSwitchState:(id)a3;
- (void)setCurChargingMode:(unint64_t)a3;
- (void)setCycleCountLink;
- (void)setGenuineBatteryStatus:(int)a3;
- (void)setIsAuthSpinner:(BOOL)a3;
- (void)setKMLink;
- (void)setLearnMoreLink;
- (void)setManualChargingSwitchState:(id)a3;
- (void)setMaximumCapacityPercent:(id)a3;
- (void)setPerfManagementState:(int)a3;
- (void)setPerformanceManagementAlert;
- (void)setSmartChargingClient:(id)a3;
- (void)setSmartChargingState:(unint64_t)a3;
- (void)setSmartChargingSwitchState:(id)a3;
- (void)setSpinnerCanReloadUI:(BOOL)a3;
- (void)setSpinnerGroup:(id)a3;
- (void)setSpinnerTimer:(id)a3;
- (void)setUserDisabledPerfManagement:(BOOL)a3;
- (void)set_batteryHealthUILoadEndTime:(unint64_t)a3;
- (void)set_batteryHealthUILoadStartTime:(unint64_t)a3;
- (void)startSpinnerInCell:(id)a3;
- (void)stopSpinnerInCell:(id)a3;
- (void)updateBatteryHealthServiceFlag;
- (void)updateBatteryHealthServiceState;
- (void)updateCleanEnergyChargingState;
- (void)updateData;
- (void)updateGenuineBatteryStatus;
- (void)updateMaximumCapacity;
- (void)updatePerfManagementState;
- (void)updateSmartChargingState;
- (void)userDidDisable;
- (void)userDidLeaveOn;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BatteryHealthUIController

- (BOOL)isImprovedServiceHandoffEnabled
{
  return _os_feature_enabled_impl();
}

- (void)updateMaximumCapacity
{
  id v12 = 0;
  uint64_t v3 = +[BatteryUIResourceClass getBatteryMaximumCapacityPercentWithError:&v12];
  id v4 = v12;
  if (v4)
  {
    maximumCapacityPercent = self->_maximumCapacityPercent;
    self->_maximumCapacityPercent = 0;
  }
  else
  {
    v6 = +[NSNumber numberWithInt:v3];
    maximumCapacityPercent = self->_maximumCapacityPercent;
    self->_maximumCapacityPercent = v6;
  }

  BHUILog = self->_BHUILog;
  if (os_log_type_enabled(BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8BDFC(216, (uint64_t)self, BHUILog);
  }
  v8 = objc_opt_new();
  if (+[BatteryUIResourceClass isBatteryUnverifiedWithStatus:self->_genuineBatteryStatus state:self->_batteryHealthServiceState])
  {
    [v8 setObject:@"batteryNotTrusted" forKeyedSubscript:@"state"];
  }
  else
  {
    int batteryHealthServiceState = self->_batteryHealthServiceState;
    if (batteryHealthServiceState == 6)
    {
      [v8 setObject:@"BCDC" forKeyedSubscript:@"state"];
      if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
        sub_8BDC8();
      }
    }
    else if (batteryHealthServiceState == 5)
    {
      [v8 setObject:@"notDeterminable" forKeyedSubscript:@"state"];
      if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
        sub_8BD94();
      }
    }
  }
  if (self->_maximumCapacityPercent) {
    v10 = self->_maximumCapacityPercent;
  }
  else {
    v10 = (NSNumber *)&off_C9548;
  }
  [v8 setObject:v10 forKeyedSubscript:@"maximumCapacityPercent"];
  id v11 = v8;
  AnalyticsSendEventLazy();
}

- (void)updatePerfManagementState
{
  if (!+[PLBatteryUIBackendModel shouldShowModifiedHealthController])
  {
    if (self->_userDisabledPerfManagement)
    {
      self->_perfManagementState = 3;
      self->_userDisabledPerfManagement = 0;
    }
    else
    {
      self->_perfManagementState = +[BatteryUIResourceClass getManagementState];
    }
    if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
      sub_8BE7C();
    }
  }
}

- (void)updateBatteryHealthServiceState
{
  self->_int batteryHealthServiceState = +[BatteryUIResourceClass getBatteryHealthServiceState];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8BEF0();
  }
}

- (void)updateBatteryHealthServiceFlag
{
  self->_batteryHealthServiceFlag = +[BatteryUIResourceClass getBatteryHealthServiceFlags];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8BF60();
  }
}

- (void)updateGenuineBatteryStatus
{
  self->_genuineBatteryStatus = +[BatteryUIResourceClass genuineBatteryStatus];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8BFD0();
  }
}

- (void)updateSmartChargingState
{
  if (!+[PLBatteryUIBackendModel shouldShowModifiedHealthController])
  {
    uint64_t v3 = [(BatteryHealthUIController *)self smartChargingClient];
    id v8 = 0;
    id v4 = [v3 isSmartChargingCurrentlyEnabled:&v8];
    id v5 = v8;

    v6 = [(BatteryHealthUIController *)self BHUILog];
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_8AD84();
      }

      id v4 = &dword_0 + 1;
      ADClientAddValueForScalarKey();
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v10 = v4;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Got smart charging state: %lu", buf, 0xCu);
      }

      ADClientSetValueForScalarKey();
    }
    AnalyticsSendEventLazy();
    [(BatteryHealthUIController *)self setSmartChargingState:v4];
  }
}

- (void)updateCleanEnergyChargingState
{
  uint64_t v3 = [(BatteryHealthUIController *)self smartChargingClient];
  id v8 = 0;
  id v4 = [v3 isCECCurrentlyEnabled:&v8];
  id v5 = v8;

  v6 = [(BatteryHealthUIController *)self BHUILog];
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_8B6C8();
    }

    [(BatteryHealthUIController *)self setSmartChargingState:1];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v10 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Got clean energy charging state: %lu", buf, 0xCu);
    }

    [(BatteryHealthUIController *)self setCleanChargingState:v4];
  }
}

- (void)updateData
{
  [(BatteryHealthUIController *)self updatePerfManagementState];
  [(BatteryHealthUIController *)self updateBatteryHealthServiceState];
  [(BatteryHealthUIController *)self updateBatteryHealthServiceFlag];
  [(BatteryHealthUIController *)self updateGenuineBatteryStatus];
  [(BatteryHealthUIController *)self updateMaximumCapacity];
  [(BatteryHealthUIController *)self logBatteryStatusAndStates];
  [(BatteryHealthUIController *)self getBatteryInformation];
  [(BatteryHealthUIController *)self updateSmartChargingState];
  uint64_t v3 = [(BatteryHealthUIController *)self smartChargingClient];
  if ([v3 isCECSupported])
  {
    if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
      sub_8C040();
    }
    [(BatteryHealthUIController *)self updateCleanEnergyChargingState];
  }
}

- (BatteryHealthUIController)init
{
  v11.receiver = self;
  v11.super_class = (Class)BatteryHealthUIController;
  v2 = [(BatteryHealthUIController *)&v11 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.batteryui.health", "");
    if (!v3)
    {
      os_log_t v3 = (os_log_t)&_os_log_default;
      id v4 = &_os_log_default;
    }
    BHUILog = v2->_BHUILog;
    v2->_BHUILog = (OS_os_log *)v3;
    v6 = v3;

    v2->_userDisabledPerfManagement = 0;
    v2->_spinnerCanReloadUI = 1;
    v2->_isAuthSpinner = 0;
    id v7 = objc_alloc((Class)PowerUISmartChargeClient);
    id v8 = (PowerUISmartChargeClient *)[v7 initWithClientName:PowerUISmartChargeClientSettings];
    smartChargingClient = v2->_smartChargingClient;
    v2->_smartChargingClient = v8;
  }
  return v2;
}

- (void)logBatteryStatusAndStates
{
  if ((+[BatteryUIResourceClass isBatteryUnverifiedWithStatus:[(BatteryHealthUIController *)self genuineBatteryStatus] state:[(BatteryHealthUIController *)self batteryHealthServiceState]]|| [(BatteryHealthUIController *)self genuineBatteryStatus] == 1)&& ((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  AnalyticsSendEventLazy();
}

- (void)setAboutBatteriesLink
{
  unsigned int v3 = +[BatteryUIResourceClass deviceSupportsCPMS];
  unsigned int v4 = +[BatteryUIResourceClass inDemoMode];
  if (v3)
  {
    if (v4)
    {
      +[BatteryUIResourceClass containerPath];
      id v5 = @"CPMS_ABOUT_BATTERIES_URL";
      goto LABEL_6;
    }
    id v5 = @"CPMS_ABOUT_BATTERIES_URL";
  }
  else
  {
    if (v4)
    {
      +[BatteryUIResourceClass containerPath];
      id v5 = @"ABOUT_BATTERIES_URL";
LABEL_6:
      v6 = (void *)_CFPreferencesCopyValueWithContainer();
      if (v6) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    id v5 = @"ABOUT_BATTERIES_URL";
  }
LABEL_10:
  v6 = BatteryUILocalization(v5);
LABEL_11:
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C074();
  }
  id v7 = +[NSURL URLWithString:v6];
  id v8 = +[UIApplication sharedApplication];
  [v8 openURL:v7 options:&__NSDictionary0__struct completionHandler:&stru_BEB50];
}

- (void)handleNonGenuineBatteryTap:(id)a3
{
  uint64_t v3 = FLFollowUpSingleItemKey;
  id v4 = a3;
  id v7 = [v4 propertyForKey:v3];
  id v5 = [v4 propertyForKey:FLFollowUpSingleActionKey];

  v6 = +[FLFollowUpActionHandler handlerWithItem:v7];
  [v6 handleAction:v5 completion:&stru_BEBB0];
}

- (void)setBatteryServiceLink
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v2 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v2 = BatteryUILocalization(@"SERVICE_RECOMMENDED_URL");
  }
  id v4 = +[NSURL URLWithString:v2];

  uint64_t v3 = +[UIApplication sharedApplication];
  [v3 openURL:v4 options:&__NSDictionary0__struct completionHandler:&stru_BEBF0];
}

- (void)setPerformanceManagementAlert
{
  id v3 = (id)objc_opt_new();
  [v3 showPerfMitigationAlert:self];
  ADClientAddValueForScalarKey();
  AnalyticsSendEventLazy();
}

+ (id)unknownString
{
  unsigned int v2 = +[PLBatteryUIBackendModel shouldShowChargingController];
  unsigned int v3 = +[BatteryUIResourceClass inDemoMode];
  if (v2)
  {
    if (v3)
    {
      +[BatteryUIResourceClass containerPath];
      id v4 = @"UNKNOWN";
      goto LABEL_6;
    }
    id v4 = @"UNKNOWN";
  }
  else
  {
    if (v3)
    {
      +[BatteryUIResourceClass containerPath];
      id v4 = @"EM_DASH";
LABEL_6:
      id v5 = (void *)_CFPreferencesCopyValueWithContainer();
      if (v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    id v4 = @"EM_DASH";
  }
LABEL_10:
  id v5 = BatteryUILocalization(v4);
LABEL_11:

  return v5;
}

- (id)getChargeCapacityRemaining
{
  if (+[BatteryUIResourceClass isQMaxUnknown])
  {
    if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
      sub_8C0DC();
    }
  }
  else
  {
    p_maximumCapacityPercent = (void **)&self->_maximumCapacityPercent;
    maximumCapacityPercent = self->_maximumCapacityPercent;
    if (!maximumCapacityPercent && os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_ERROR)) {
      sub_8C1A0();
    }
    BHUILog = self->_BHUILog;
    if (os_log_type_enabled(BHUILog, OS_LOG_TYPE_DEBUG)) {
      sub_8C110(p_maximumCapacityPercent, BHUILog);
    }
    if (maximumCapacityPercent)
    {
      +[BatteryHealthUIController getMaxChargeCapacityPercentage:](BatteryHealthUIController, "getMaxChargeCapacityPercentage:", [*p_maximumCapacityPercent intValue]);
      v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v7 = +[NSNumberFormatter localizedStringFromNumber:v6 numberStyle:3];
      id v8 = +[NSString stringWithFormat:@"%@", v7];

      goto LABEL_13;
    }
  }
  id v8 = +[BatteryHealthUIController unknownString];
LABEL_13:

  return v8;
}

+ (double)getMaxChargeCapacityPercentage:(int)a3
{
  double result = fmin((double)a3 / 100.0, 1.0);
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (id)chargeCapacityRemainingDemo:(id)a3
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (unsigned int v3 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    unsigned int v3 = BatteryUILocalization(@"CHARGE_CAPACITY");
  }
  unsigned int v4 = [v3 isEqualToString:&stru_C3A18];

  if (v4)
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v5 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v5 = BatteryUILocalization(@"EM_DASH");
    }
  }
  else
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v6 = BatteryUILocalization(@"CHARGE_CAPACITY");
    }
    id v5 = +[NSString stringWithFormat:@"%@%%", v6];
  }

  return v5;
}

- (id)aboutBatteriesGroupSpecifier
{
  unsigned int v3 = +[PSSpecifier groupSpecifierWithName:0];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"ABOUT_BATTERIES_TEXT"), +[BatteryUIResourceClass containerPath], (unsigned int v4 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ABOUT_BATTERIES_TEXT"];
    unsigned int v4 = BatteryUILocalization(v5);
  }
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v6 = BatteryUILocalization(@"ABOUT_BATTERIES_LINK");
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v3 setProperty:v9 forKey:PSFooterCellClassGroupKey];

  [v3 setProperty:v7 forKey:PSFooterHyperlinkViewTitleKey];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v10 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v10 = BatteryUILocalization(@"ABOUT_BATTERIES_LINK");
  }
  v15.location = (NSUInteger)[v7 rangeOfString:v10];
  objc_super v11 = NSStringFromRange(v15);
  [v3 setProperty:v11 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v12 = +[NSValue valueWithNonretainedObject:self];
  [v3 setProperty:v12 forKey:PSFooterHyperlinkViewTargetKey];

  [v3 setProperty:@"setAboutBatteriesLink" forKey:PSFooterHyperlinkViewActionKey];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C1D4();
  }

  return v3;
}

- (id)nonGenuineBatteryGroupSpecifier
{
  id v39 = +[NSMutableArray array];
  unsigned int v3 = +[BatteryUIResourceClass deviceSupportsCPMS];
  unsigned int v4 = +[BatteryUIResourceClass inDemoMode];
  if (v3)
  {
    if (v4)
    {
      +[BatteryUIResourceClass containerPath];
      id v5 = @"CPMS_NONGENUINE_BATTERY_URL";
      goto LABEL_6;
    }
    id v5 = @"CPMS_NONGENUINE_BATTERY_URL";
  }
  else
  {
    if (v4)
    {
      +[BatteryUIResourceClass containerPath];
      id v5 = @"NONGENUINE_BATTERY_URL";
LABEL_6:
      uint64_t v6 = _CFPreferencesCopyValueWithContainer();
      if (v6) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    id v5 = @"NONGENUINE_BATTERY_URL";
  }
LABEL_10:
  uint64_t v6 = BatteryUILocalization(v5);
LABEL_11:
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C23C();
  }
  uint64_t v7 = +[NSURL URLWithString:v6];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v8 = BatteryUILocalization(@"NONGENUINE_BATTERY_LINK");
  }
  v38 = +[FLFollowUpAction actionWithLabel:v8 url:v7];

  id v9 = objc_alloc_init((Class)FLFollowUpItem);
  unsigned int v10 = +[PLBatteryUIBackendModel shouldShowChargingController];
  unsigned int v11 = +[BatteryUIResourceClass inDemoMode];
  if (v10)
  {
    if (v11)
    {
      +[BatteryUIResourceClass containerPath];
      id v12 = @"BATTERY_HEALTH_TITLE";
      goto LABEL_21;
    }
    id v12 = @"BATTERY_HEALTH_TITLE";
LABEL_25:
    v13 = BatteryUILocalization(v12);
    goto LABEL_26;
  }
  if (!v11)
  {
    id v12 = @"NONGENUINE_BATTERY_TITLE";
    goto LABEL_25;
  }
  +[BatteryUIResourceClass containerPath];
  id v12 = @"NONGENUINE_BATTERY_TITLE";
LABEL_21:
  v13 = (void *)_CFPreferencesCopyValueWithContainer();
  if (!v13) {
    goto LABEL_25;
  }
LABEL_26:
  v36 = (void *)v7;
  v37 = (void *)v6;
  [v9 setTitle:v13];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v14 = BatteryUILocalization(@"NONGENUINE_BATTERY_TEXT");
  }
  [v9 setInformativeText:v14];

  NSRange v15 = +[NSArray arrayWithObject:v38];
  [v9 setActions:v15];

  v16 = [v9 uniqueIdentifier];
  v17 = +[PSSpecifier groupSpecifierWithID:v16];

  [v39 addObject:v17];
  v18 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v18 setProperty:objc_opt_class() forKey:PSCellClassKey];
  uint64_t v19 = FLFollowUpSingleItemKey;
  [v18 setProperty:v9 forKey:FLFollowUpSingleItemKey];
  if (+[PLBatteryUIBackendModel shouldShowChargingController])
  {
    v20 = self;
    id v21 = objc_alloc((Class)NSAttributedString);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v22 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v22 = BatteryUILocalization(@"BATTERY_UNVERIFIED");
    }
    id v23 = [v21 initWithString:v22];
    [v18 setObject:v23 forKeyedSubscript:@"PLBatteryUIFollowUpHeaderInformationAttributedStringKey"];

    self = v20;
  }
  [v39 addObject:v18];
  v24 = [v38 label];
  v25 = self;
  v26 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v26 setProperty:v38 forKey:FLFollowUpSingleActionKey];
  [v26 setProperty:v9 forKey:v19];
  [v26 setButtonAction:"handleNonGenuineBatteryTap:"];
  [v26 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v39 addObject:v26];
  if (+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController")|| +[PLBatteryUIBackendModel shouldShowModifiedHealthController])
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v27 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v27 = BatteryUILocalization(@"BATTERY_HEALTH_STATE_FOOTER_UNKNOWN");
    }
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v28 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v28 = BatteryUILocalization(@"ABOUT_BATTERY_LINK");
    }
    v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v28);

    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    [v17 setProperty:v31 forKey:PSFooterCellClassGroupKey];

    [v17 setProperty:v29 forKey:PSFooterHyperlinkViewTitleKey];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v32 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v32 = BatteryUILocalization(@"ABOUT_BATTERY_LINK");
    }
    v41.location = (NSUInteger)[v29 rangeOfString:v32];
    v33 = NSStringFromRange(v41);
    [v17 setProperty:v33 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v34 = +[NSValue valueWithNonretainedObject:v25];
    [v17 setProperty:v34 forKey:PSFooterHyperlinkViewTargetKey];

    [v17 setProperty:@"didTapABW" forKey:PSFooterHyperlinkViewActionKey];
    [v17 setObject:v29 forKeyedSubscript:PSFooterTextGroupKey];
  }
  if (os_log_type_enabled((os_log_t)v25->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C208();
  }

  return v39;
}

- (void)startSpinnerInCell:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v4 startAnimating];
    [v3 setAccessoryView:v4];
  }
}

- (void)stopSpinnerInCell:(id)a3
{
  if (a3) {
    [a3 setAccessoryView:0];
  }
}

- (void)handleServiceBatteryTap:(id)a3
{
  uint64_t v3 = FLFollowUpSingleItemKey;
  id v4 = a3;
  id v7 = [v4 propertyForKey:v3];
  id v5 = [v4 propertyForKey:FLFollowUpSingleActionKey];

  uint64_t v6 = +[FLFollowUpActionHandler handlerWithItem:v7];
  [v6 handleAction:v5 completion:&stru_BEC50];
}

- (void)handleServiceBatteryTapUsingAppleCareSupport:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:PSTableCellKey];
  objc_initWeak(&location, v5);

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_19120;
  block[3] = &unk_BEC98;
  block[4] = self;
  block[5] = v15;
  objc_copyWeak(&v14, &location);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  id v7 = objc_initWeak(&from, self);
  id v8 = [(BatteryHealthUIController *)self batteryServiceBookingCoordinator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_19194;
  v9[3] = &unk_BECE8;
  v9[4] = v15;
  objc_copyWeak(&v10, &from);
  objc_copyWeak(&v11, &location);
  [v8 launchBatteryServiceBookingFlowWithCompletionHandler:v9];

  ADClientAddValueForScalarKey();
  AnalyticsSendEventLazy();
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v14);
  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&location);
}

- (id)serviceHeaderSpecifier
{
  uint64_t v40 = +[NSMutableArray array];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v3 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v3 = BatteryUILocalization(@"SERVICE_RECOMMENDED_URL");
  }
  uint64_t v4 = +[NSURL URLWithString:v3];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v5 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v5 = BatteryUILocalization(@"SERVICE_RECOMMENDED_LINK");
  }
  dispatch_time_t v6 = +[FLFollowUpAction actionWithLabel:v5 url:v4];

  id v7 = objc_alloc_init((Class)FLFollowUpItem);
  if (+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController")|| +[PLBatteryUIBackendModel shouldShowModifiedHealthController])
  {
    id v8 = (void *)v40;
    if (+[BatteryUIResourceClass inDemoMode])
    {
      +[BatteryUIResourceClass containerPath];
      id v9 = @"BATTERY_HEALTH_TITLE";
      goto LABEL_14;
    }
    id v9 = @"BATTERY_HEALTH_TITLE";
LABEL_17:
    id v10 = BatteryUILocalization(v9);
    goto LABEL_18;
  }
  id v8 = (void *)v40;
  if (!+[BatteryUIResourceClass inDemoMode])
  {
    id v9 = @"NONGENUINE_BATTERY_TITLE";
    goto LABEL_17;
  }
  +[BatteryUIResourceClass containerPath];
  id v9 = @"NONGENUINE_BATTERY_TITLE";
LABEL_14:
  id v10 = (void *)_CFPreferencesCopyValueWithContainer();
  if (!v10) {
    goto LABEL_17;
  }
LABEL_18:
  v38 = (void *)v4;
  [v7 setTitle:v10];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"SERVICE_RECOMMENDED"), +[BatteryUIResourceClass containerPath], (id v11 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v12 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SERVICE_RECOMMENDED"];
    id v11 = BatteryUILocalization(v12);
  }
  [v7 setInformativeText:v11];

  v13 = +[NSArray arrayWithObject:v6];
  [v7 setActions:v13];

  id v14 = [v7 uniqueIdentifier];
  NSRange v15 = +[PSSpecifier groupSpecifierWithID:v14];

  [v8 addObject:v15];
  char v16 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v16 setProperty:objc_opt_class() forKey:PSCellClassKey];
  uint64_t v17 = FLFollowUpSingleItemKey;
  [v16 setProperty:v7 forKey:FLFollowUpSingleItemKey];
  if (+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController")|| +[PLBatteryUIBackendModel shouldShowModifiedHealthController])
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v18 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v18 = BatteryUILocalization(@"BATTERY_SERVICE");
    }
    [v16 setObject:v18 forKeyedSubscript:@"PLBatteryUIFollowUpHeaderInformationStringKey"];
  }
  [v8 addObject:v16];
  id v39 = v6;
  uint64_t v19 = [v6 label];
  v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:13 edit:0];

  unsigned int v21 = [(BatteryHealthUIController *)self isImprovedServiceHandoffEnabled];
  v22 = &selRef_handleServiceBatteryTapUsingAppleCareSupport_;
  if (!v21) {
    v22 = &selRef_handleServiceBatteryTap_;
  }
  id v23 = *v22;
  if ([(BatteryHealthUIController *)self isImprovedServiceHandoffEnabled])
  {
    id v24 = objc_alloc((Class)ACSBatteryServiceBookingCoordinator);
    uint64_t v41 = kACSBatteryServiceOptionsServiceStateKey;
    v25 = +[NSNumber numberWithInt:self->_batteryHealthServiceState];
    v42 = v25;
    v26 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v27 = (ACSBatteryServiceBookingCoordinator *)[v24 initWithOptions:v26];
    batteryServiceBookingCoordinator = self->_batteryServiceBookingCoordinator;
    self->_batteryServiceBookingCoordinator = v27;

    id v8 = (void *)v40;
  }
  if (![(BatteryHealthUIController *)self isImprovedServiceHandoffEnabled]) {
    [v20 setProperty:v39 forKey:FLFollowUpSingleActionKey];
  }
  [v20 setProperty:v7 forKey:v17];
  [v20 setButtonAction:v23];
  [v20 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v8 addObject:v20];
  if (+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController")|| +[PLBatteryUIBackendModel shouldShowModifiedHealthController])
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v29 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v29 = BatteryUILocalization(@"BATTERY_HEALTH_STATE_FOOTER_SERVICE");
    }
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v30 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v30 = BatteryUILocalization(@"ABOUT_BATTERY_LINK");
    }
    v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v30);

    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    [v15 setProperty:v33 forKey:PSFooterCellClassGroupKey];

    [v15 setProperty:v31 forKey:PSFooterHyperlinkViewTitleKey];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v34 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v34 = BatteryUILocalization(@"ABOUT_BATTERY_LINK");
    }
    v44.id location = (NSUInteger)[v31 rangeOfString:v34];
    v35 = NSStringFromRange(v44);
    [v15 setProperty:v35 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v36 = +[NSValue valueWithNonretainedObject:self];
    [v15 setProperty:v36 forKey:PSFooterHyperlinkViewTargetKey];

    [v15 setProperty:@"didTapABW" forKey:PSFooterHyperlinkViewActionKey];
    [v15 setObject:v31 forKeyedSubscript:PSFooterTextGroupKey];

    id v8 = (void *)v40;
  }
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C30C();
  }

  return v8;
}

- (void)handleRecalibrationTap:(id)a3
{
  uint64_t v3 = FLFollowUpSingleItemKey;
  id v4 = a3;
  id v7 = [v4 propertyForKey:v3];
  id v5 = [v4 propertyForKey:FLFollowUpSingleActionKey];

  dispatch_time_t v6 = +[FLFollowUpActionHandler handlerWithItem:v7];
  [v6 handleAction:v5 completion:&stru_BED28];
}

- (id)recalibrationHeaderSpecifier
{
  uint64_t v3 = +[NSMutableArray array];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v4 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v4 = BatteryUILocalization(@"RECALIBRATION_URL");
  }
  id v5 = +[NSURL URLWithString:v4];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (dispatch_time_t v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    dispatch_time_t v6 = BatteryUILocalization(@"RECALIBRATION_LINK");
  }
  id v7 = +[FLFollowUpAction actionWithLabel:v6 url:v5];

  id v8 = objc_alloc_init((Class)FLFollowUpItem);
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v9 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v9 = BatteryUILocalization(@"RECALIBRATION_TITLE");
  }
  [v8 setTitle:v9];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v10 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v10 = BatteryUILocalization(@"RECALIBRATION_TEXT");
  }
  [v8 setInformativeText:v10];

  int batteryHealthServiceState = self->_batteryHealthServiceState;
  if (batteryHealthServiceState == 11)
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v13 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v13 = BatteryUILocalization(@"RECALIBRATION_FAILED_TEXT");
    }
    [v8 setInformativeText:v13];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v14 = BatteryUILocalization(@"SERVICE_RECOMMENDED_URL");
    }
    id v12 = +[NSURL URLWithString:v14];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (NSRange v15 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      NSRange v15 = BatteryUILocalization(@"SERVICE_RECOMMENDED_LINK");
    }
    uint64_t v16 = +[FLFollowUpAction actionWithLabel:v15 url:v12];

    id v7 = (void *)v16;
  }
  else
  {
    if (batteryHealthServiceState != 10) {
      goto LABEL_30;
    }
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v12 = BatteryUILocalization(@"RECALIBRATION_SERVICE_RECOMMENDED_TEXT");
    }
    [v8 setInformativeText:v12];
  }

LABEL_30:
  uint64_t v17 = +[NSArray arrayWithObject:v7];
  [v8 setActions:v17];

  v18 = [v8 uniqueIdentifier];
  uint64_t v19 = +[PSSpecifier groupSpecifierWithID:v18];

  [v3 addObject:v19];
  v20 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v20 setProperty:objc_opt_class() forKey:PSCellClassKey];
  uint64_t v21 = FLFollowUpSingleItemKey;
  [v20 setProperty:v8 forKey:FLFollowUpSingleItemKey];
  [v3 addObject:v20];
  v22 = [v7 label];
  id v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v23 setProperty:v7 forKey:FLFollowUpSingleActionKey];
  [v23 setProperty:v8 forKey:v21];
  [v23 setButtonAction:"handleRecalibrationTap:"];
  [v23 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v3 addObject:v23];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C340();
  }

  return v3;
}

- (id)unknownHeaderSpeciifer
{
  if ([(BatteryHealthUIController *)self genuineBatteryStatus])
  {
    uint64_t v3 = [(BatteryHealthUIController *)self nonGenuineBatteryGroupSpecifier];
  }
  else
  {
    uint64_t v3 = +[NSMutableArray array];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v4 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v4 = BatteryUILocalization(@"SERVICE_RECOMMENDED_URL");
    }
    id v5 = +[NSURL URLWithString:v4];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (dispatch_time_t v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      dispatch_time_t v6 = BatteryUILocalization(@"PPC_BATTERY_HEALTH_UNKNOWN_LINK");
    }
    id v7 = +[FLFollowUpAction actionWithLabel:v6 url:v5];

    id v8 = objc_alloc_init((Class)FLFollowUpItem);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v9 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v9 = BatteryUILocalization(@"NONGENUINE_BATTERY_TITLE");
    }
    [v8 setTitle:v9];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v10 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v10 = BatteryUILocalization(@"PPC_BATTERY_HEALTH_UNKNOWN");
    }
    [v8 setInformativeText:v10];

    id v11 = +[NSArray arrayWithObject:v7];
    [v8 setActions:v11];

    id v12 = [v8 uniqueIdentifier];
    v13 = +[PSSpecifier groupSpecifierWithID:v12];

    [v3 addObject:v13];
    id v14 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
    [v14 setProperty:objc_opt_class() forKey:PSCellClassKey];
    uint64_t v15 = FLFollowUpSingleItemKey;
    [v14 setProperty:v8 forKey:FLFollowUpSingleItemKey];
    [v3 addObject:v14];
    uint64_t v16 = [v7 label];
    uint64_t v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v17 setProperty:v7 forKey:FLFollowUpSingleActionKey];
    [v17 setProperty:v8 forKey:v15];
    [v17 setButtonAction:"handleServiceBatteryTap:"];
    [v17 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v3 addObject:v17];
    if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
      sub_8C374();
    }
  }

  return v3;
}

- (id)headerSpecifiers
{
  if (+[BatteryUIResourceClass isBatteryUnverifiedWithStatus:[(BatteryHealthUIController *)self genuineBatteryStatus] state:[(BatteryHealthUIController *)self batteryHealthServiceState]])
  {
    [(BatteryHealthUIController *)self clearSpinner];
    goto LABEL_3;
  }
  unsigned int v6 = [(BatteryHealthUIController *)self genuineBatteryStatus];
  if (v6 != 2)
  {
    if (v6 == 1)
    {
      [(BatteryHealthUIController *)self clearSpinner];
    }
    else if (v6 == -1)
    {
LABEL_11:
      uint64_t v7 = [(BatteryHealthUIController *)self startSpinner];
LABEL_12:
      id v8 = (void *)v7;
      id v4 = +[NSArray arrayWithObject:v7];

      goto LABEL_5;
    }
    switch([(BatteryHealthUIController *)self batteryHealthServiceState])
    {
      case 0xFFFFFFFF:
      case 0u:
      case 7u:
        if (+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController")|| +[PLBatteryUIBackendModel shouldShowModifiedHealthController])
        {
          uint64_t v3 = [(BatteryHealthUIController *)self healthStateGroupSpecifier];
          goto LABEL_4;
        }
        uint64_t v7 = [(BatteryHealthUIController *)self aboutBatteriesGroupSpecifier];
        break;
      case 1u:
      case 2u:
      case 3u:
      case 4u:
      case 6u:
        goto LABEL_15;
      case 5u:
        uint64_t v3 = [(BatteryHealthUIController *)self unknownHeaderSpeciifer];
        goto LABEL_4;
      case 8u:
        BHUILog = self->_BHUILog;
        if (os_log_type_enabled(BHUILog, OS_LOG_TYPE_ERROR)) {
          sub_8C4C0(BHUILog);
        }
LABEL_15:
        id v9 = self->_BHUILog;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_8C438(v9);
        }
        uint64_t v3 = [(BatteryHealthUIController *)self serviceHeaderSpecifier];
        goto LABEL_4;
      case 9u:
      case 0xAu:
      case 0xBu:
        id v10 = self->_BHUILog;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_8C438(v10);
        }
        uint64_t v3 = [(BatteryHealthUIController *)self recalibrationHeaderSpecifier];
        goto LABEL_4;
      case 0xCu:
        goto LABEL_3;
      default:
        id v11 = self->_BHUILog;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          sub_8C3A8(v11);
        }
        goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v3 = [(BatteryHealthUIController *)self nonGenuineBatteryGroupSpecifier];
LABEL_4:
  id v4 = (void *)v3;
LABEL_5:

  return v4;
}

- (id)chargeCapacityGroupSpecifier
{
  uint64_t v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier groupSpecifierWithID:0];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v5 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v5 = BatteryUILocalization(@"MAXIMUM_CAPACITY_NAME");
  }
  if (+[BatteryUIResourceClass isQMaxUnknown])
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (unsigned int v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      unsigned int v6 = BatteryUILocalization(@"KM_MC_FOOTER_TEXT");
    }
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (uint64_t v7 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      uint64_t v7 = BatteryUILocalization(@"KM_LM_TEXT");
    }
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);

    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v4 setProperty:v10 forKey:PSFooterCellClassGroupKey];

    [v4 setProperty:v8 forKey:PSFooterHyperlinkViewTitleKey];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v11 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v11 = BatteryUILocalization(@"KM_LM_TEXT");
    }
    v19.id location = (NSUInteger)[v8 rangeOfString:v11];
    id v12 = NSStringFromRange(v19);
    [v4 setProperty:v12 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v13 = +[NSValue valueWithNonretainedObject:self];
    [v4 setProperty:v13 forKey:PSFooterHyperlinkViewTargetKey];

    [v4 setProperty:@"setKMLink" forKey:PSFooterHyperlinkViewActionKey];
  }
  else if (!+[BatteryUIResourceClass inDemoMode] {
         || (+[BatteryUIResourceClass containerPath],
  }
             (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v8 = BatteryUILocalization(@"MAXIMUM_CAPACITY_FOOTER_TEXT");
  }
  if ((self->_batteryHealthServiceState - 9) > 1)
  {
    id v14 = v5;
  }
  else
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v14 = BatteryUILocalization(@"MAXIMUM_CAPACITY_NAME_RECALIBRATING");
    }

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (uint64_t v15 = _CFPreferencesCopyValueWithContainer()) == 0))
    {
      uint64_t v15 = BatteryUILocalization(@"MAXIMUM_CAPACITY_FOOTER_TEXT_RECALIBRATING");
    }

    id v8 = (void *)v15;
  }
  uint64_t v16 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:"getChargeCapacityRemaining" detail:0 cell:4 edit:0];
  [v4 setProperty:v8 forKey:PSFooterTextGroupKey];
  [v16 setIdentifier:@"MAXIMUM_CAPACITY_IDENTIFIER"];
  [v3 addObject:v4];
  [v3 addObject:v16];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C550();
  }

  return v3;
}

- (void)setKMLink
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v2 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v2 = BatteryUILocalization(@"KM_LM_URL");
  }
  id v5 = (id)v2;
  uint64_t v3 = +[NSURL URLWithString:v2];
  id v4 = +[UIApplication sharedApplication];
  [v4 openURL:v3 options:&__NSDictionary0__struct completionHandler:&stru_BED68];
}

- (id)peakPowerCapacityGroupSpecifier
{
  unsigned __int8 v3 = +[PLBatteryUIBackendModel shouldShowModifiedHealthController];
  id v4 = +[NSMutableArray array];
  if (v3) {
    goto LABEL_29;
  }
  id v5 = +[PSSpecifier groupSpecifierWithID:@"PEAK_POWER_CAPACITY"];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (unsigned int v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    unsigned int v6 = BatteryUILocalization(@"PPC_NAME");
  }
  uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v7 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  if (self->_genuineBatteryStatus == 2)
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v8 = BatteryUILocalization(@"PPC_NOT_DETERMINABLE");
    }
  }
  else
  {
    int batteryHealthServiceState = self->_batteryHealthServiceState;
    if (batteryHealthServiceState == 6)
    {
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        id v8 = BatteryUILocalization(@"PPC_BCDC");
      }
    }
    else if (batteryHealthServiceState == 5)
    {
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        id v8 = BatteryUILocalization(@"PPC_NOT_DETERMINABLE");
      }
    }
    else
    {
      int perfManagementState = self->_perfManagementState;
      if ((batteryHealthServiceState & 0xFFFFFFFE) != 2 || perfManagementState != 2)
      {
        switch(perfManagementState)
        {
          case 1:
            if (!+[BatteryUIResourceClass inDemoMode]
              || (+[BatteryUIResourceClass containerPath],
                  (id v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
            {
              id v14 = BatteryUILocalization(@"PPC_PERFMGMT_ENABLED");
            }
            if (!+[BatteryUIResourceClass inDemoMode]
              || (+[BatteryUIResourceClass containerPath],
                  (uint64_t v15 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
            {
              uint64_t v15 = BatteryUILocalization(@"PPC_PERFMGMT_ENABLED_LINK");
            }
            id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);

            uint64_t v16 = (objc_class *)objc_opt_class();
            uint64_t v17 = NSStringFromClass(v16);
            [v5 setProperty:v17 forKey:PSFooterCellClassGroupKey];

            [v5 setProperty:v12 forKey:PSFooterHyperlinkViewTitleKey];
            if (!+[BatteryUIResourceClass inDemoMode]
              || (+[BatteryUIResourceClass containerPath],
                  (v18 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
            {
              v18 = BatteryUILocalization(@"PPC_PERFMGMT_ENABLED_LINK");
            }
            v23.id location = (NSUInteger)[v12 rangeOfString:v18];
            NSRange v19 = NSStringFromRange(v23);
            [v5 setProperty:v19 forKey:PSFooterHyperlinkViewLinkRangeKey];

            v20 = +[NSValue valueWithNonretainedObject:self];
            [v5 setProperty:v20 forKey:PSFooterHyperlinkViewTargetKey];

            [v5 setProperty:@"setPerformanceManagementAlert" forKey:PSFooterHyperlinkViewActionKey];
            break;
          case 2:
            if (!+[BatteryUIResourceClass inDemoMode]
              || (+[BatteryUIResourceClass containerPath],
                  (id v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
            {
              uint64_t v21 = @"PPC_PERFMGMT_DISABLED";
              goto LABEL_53;
            }
            break;
          case 3:
            if (!+[BatteryUIResourceClass inDemoMode]
              || (+[BatteryUIResourceClass containerPath],
                  (id v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
            {
              uint64_t v21 = @"PPC_PERFMGMT_USER_DISABLED";
              goto LABEL_53;
            }
            break;
          case 4:
            if (!+[BatteryUIResourceClass inDemoMode]
              || (+[BatteryUIResourceClass containerPath],
                  (id v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
            {
              uint64_t v21 = @"PPC_PERFMGMT_DYNAMIC";
LABEL_53:
              id v12 = BatteryUILocalization(v21);
            }
            break;
          default:
            id v12 = 0;
            break;
        }
        ADClientSetValueForScalarKey();
        AnalyticsSendEventLazy();
        uint64_t v11 = PSFooterTextGroupKey;
        goto LABEL_26;
      }
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        id v8 = BatteryUILocalization(@"PPC_BCDC");
      }
    }
  }
  uint64_t v11 = PSFooterTextGroupKey;
  [v5 setProperty:v8 forKey:PSFooterTextGroupKey];

  ADClientSetValueForScalarKey();
  AnalyticsSendEventLazy();
  id v12 = 0;
LABEL_26:
  [v5 setProperty:v12 forKey:v11];
  [v4 addObject:v5];
  [v4 addObject:v7];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C584();
  }

LABEL_29:

  return v4;
}

- (id)healthStateGroupSpecifier
{
  uint64_t v17 = +[NSMutableArray array];
  unsigned __int8 v3 = +[PSSpecifier groupSpecifierWithID:@"BATTERY_HEALTH_TITLE"];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v4 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v4 = BatteryUILocalization(@"BATTERY_HEALTH_TITLE");
  }
  uint64_t v16 = (void *)v4;
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"healthStateString" detail:0 cell:4 edit:0];
  [v5 setIdentifier:@"BATTERY_HEALTH_STATE_IDENTIFIER"];
  [v5 setAccessibilityIdentifier:@"BATTERY_HEALTH_TITLE"];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"BATTERY_HEALTH_STATE_FOOTER_NORMAL"), +[BatteryUIResourceClass containerPath], (unsigned int v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"BATTERY_HEALTH_STATE_FOOTER_NORMAL"];
    unsigned int v6 = BatteryUILocalization(v7);
  }
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v8 = BatteryUILocalization(@"ABOUT_BATTERY_LINK");
  }
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);

  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  [v3 setProperty:v11 forKey:PSFooterCellClassGroupKey];

  [v3 setProperty:v9 forKey:PSFooterHyperlinkViewTitleKey];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v12 = BatteryUILocalization(@"ABOUT_BATTERY_LINK");
  }
  v19.id location = (NSUInteger)[v9 rangeOfString:v12];
  v13 = NSStringFromRange(v19);
  [v3 setProperty:v13 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v14 = +[NSValue valueWithNonretainedObject:self];
  [v3 setProperty:v14 forKey:PSFooterHyperlinkViewTargetKey];

  [v3 setProperty:@"didTapABW" forKey:PSFooterHyperlinkViewActionKey];
  [v3 setObject:v9 forKeyedSubscript:PSFooterTextGroupKey];
  [v17 addObject:v3];
  [v17 addObject:v5];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C5B8();
  }

  return v17;
}

- (void)didTapABW
{
  id v2 = objc_alloc((Class)OBWelcomeController);
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (unsigned __int8 v3 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    unsigned __int8 v3 = BatteryUILocalization(@"BATTERY_WARRANTY_TITLE");
  }
  id v4 = [v2 initWithTitle:v3 detailText:0 symbolName:0 contentLayout:2];

  v122 = v4;
  id v5 = [v4 headerView];
  unsigned int v6 = [v5 subviews];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = [v7 font];
    [v8 pointSize];
    double v10 = v9;

    if (v10 < 45.0)
    {
      [v7 setAdjustsFontSizeToFitWidth:1];
      [v7 setNumberOfLines:1];
    }
  }
  v113 = v7;
  [v122 setAccessibilityIdentifier:@"BATTERY_WARRANTY_TITLE"];
  id v11 = objc_alloc_init((Class)UITextView);
  id v12 = objc_alloc((Class)NSMutableAttributedString);
  id v121 = v11;
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"BATTERY_WARRANTY_P1"), +[BatteryUIResourceClass containerPath], (v13 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v14 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"BATTERY_WARRANTY_P1"];
    v13 = BatteryUILocalization(v14);
  }
  id v15 = [v12 initWithString:v13];

  v112 = v15;
  [v11 setAttributedText:v15];
  [v11 setScrollEnabled:0];
  [v11 setEditable:0];
  uint64_t v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v11 setFont:v16];

  [v11 setTextAlignment:1];
  uint64_t v17 = +[UIColor labelColor];
  [v11 setTextColor:v17];

  id v18 = objc_alloc_init((Class)UITextView);
  id v19 = objc_alloc((Class)NSAttributedString);
  v20 = +[NSNumberFormatter localizedStringFromNumber:&off_CA780 numberStyle:3];
  id v119 = [v19 initWithString:v20];

  id v21 = objc_alloc((Class)NSAttributedString);
  v22 = +[NSNumberFormatter localizedStringFromNumber:&off_C95A8 numberStyle:0];
  id v118 = [v21 initWithString:v22];

  id v23 = objc_alloc((Class)NSAttributedString);
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"BATTERY_WARRANTY_P2"), +[BatteryUIResourceClass containerPath], (id v24 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v25 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"BATTERY_WARRANTY_P2"];
    id v24 = BatteryUILocalization(v25);
  }
  v120 = v18;
  id v117 = [v23 initWithString:v24];

  id v26 = objc_alloc((Class)NSURL);
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"BW_LM_URL_2"), +[BatteryUIResourceClass containerPath], (v27 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v28 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"BW_LM_URL_2"];
    v27 = BatteryUILocalization(v28);
  }
  id v29 = [v26 initWithString:v27];

  id v30 = objc_alloc((Class)NSAttributedString);
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v31 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v31 = BatteryUILocalization(@"LM_TEXT");
  }
  NSAttributedStringKey v129 = NSLinkAttributeName;
  id v130 = v29;
  id v111 = v29;
  v32 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
  id v33 = [v30 initWithString:v31 attributes:v32];

  v110 = v33;
  v34 = +[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v117, v119, v118, v33);
  [v34 setAccessibilityIdentifier:@"BW_LM_URL_2"];
  v109 = v34;
  [v18 setAttributedText:v34];
  [v18 setUserInteractionEnabled:1];
  [v18 setScrollEnabled:0];
  [v18 setEditable:0];
  v35 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v18 setFont:v35];

  v36 = +[UIColor labelColor];
  [v18 setTextColor:v36];

  v37 = [v122 contentView];
  [v37 setUserInteractionEnabled:1];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v37 addSubview:v11];
  [v37 addSubview:v18];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 setAdjustsFontForContentSizeCategory:1];
  [v18 setAdjustsFontForContentSizeCategory:1];
  id v115 = objc_alloc_init((Class)UITextView);
  v116 = v37;
  if (!+[PLBatteryUIBackendModel shouldShowModifiedHealthController])
  {
    id v38 = objc_alloc((Class)NSURL);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v39 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v39 = BatteryUILocalization(@"BW_LM_URL_3");
    }
    id v40 = [v38 initWithString:v39];

    id v41 = objc_alloc((Class)NSAttributedString);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v42 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v42 = BatteryUILocalization(@"BATTERY_WARRANTY_P3");
    }
    id v43 = [v41 initWithString:v42];

    id v44 = objc_alloc((Class)NSAttributedString);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v45 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v45 = BatteryUILocalization(@"LM_TEXT");
    }
    NSAttributedStringKey v127 = NSLinkAttributeName;
    id v128 = v40;
    v46 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
    id v47 = [v44 initWithString:v45 attributes:v46];

    v48 = +[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v43, v47);
    [v48 setAccessibilityIdentifier:@"BW_LM_URL_3"];
    [v115 setAttributedText:v48];
    [v115 setUserInteractionEnabled:1];
    [v115 setScrollEnabled:0];
    [v115 setEditable:0];
    v49 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [v115 setFont:v49];

    v50 = +[UIColor labelColor];
    [v115 setTextColor:v50];

    [v116 addSubview:v115];
    [v115 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v115 setAdjustsFontForContentSizeCategory:1];

    v37 = v116;
    id v11 = v121;
  }
  unsigned int v51 = +[PLBatteryUIBackendModel shouldShowModifiedHealthController];
  v52 = [v11 topAnchor];
  v53 = [v37 topAnchor];
  uint64_t v54 = [v52 constraintEqualToAnchor:v53];
  v55 = (void *)v54;
  if (v51)
  {
    v126[0] = v54;
    v56 = [v11 leftAnchor];
    v108 = [v37 leftAnchor];
    v107 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", 8.0);
    v126[1] = v107;
    v57 = [v11 rightAnchor];
    v105 = [v37 rightAnchor];
    v106 = v57;
    v104 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", -8.0);
    v126[2] = v104;
    v58 = v120;
    v59 = [v120 topAnchor];
    v102 = [v11 bottomAnchor];
    v103 = v59;
    v60 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", 10.0);
    v126[3] = v60;
    v61 = [v120 leftAnchor];
    v100 = [v37 leftAnchor];
    v101 = v61;
    v99 = objc_msgSend(v61, "constraintEqualToAnchor:");
    v126[4] = v99;
    v62 = [v120 rightAnchor];
    v97 = [v37 rightAnchor];
    v98 = v62;
    v96 = objc_msgSend(v62, "constraintEqualToAnchor:");
    v126[5] = v96;
    v63 = [v120 bottomAnchor];
    v94 = [v37 bottomAnchor];
    v95 = v63;
    v93 = objc_msgSend(v63, "constraintEqualToAnchor:");
    v126[6] = v93;
    v92 = +[NSArray arrayWithObjects:v126 count:7];
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:");
    v64 = v111;
    v65 = v115;
  }
  else
  {
    v125[0] = v54;
    v89 = [v11 leftAnchor];
    v108 = [v37 leftAnchor];
    v107 = objc_msgSend(v89, "constraintEqualToAnchor:constant:", 8.0);
    v125[1] = v107;
    v66 = [v11 rightAnchor];
    v105 = [v37 rightAnchor];
    v106 = v66;
    v104 = objc_msgSend(v66, "constraintEqualToAnchor:constant:", -8.0);
    v125[2] = v104;
    v58 = v120;
    v67 = [v120 topAnchor];
    v102 = [v11 bottomAnchor];
    v103 = v67;
    uint64_t v88 = objc_msgSend(v67, "constraintEqualToAnchor:constant:", 10.0);
    v125[3] = v88;
    v68 = [v120 leftAnchor];
    v100 = [v37 leftAnchor];
    v101 = v68;
    v99 = objc_msgSend(v68, "constraintEqualToAnchor:");
    v125[4] = v99;
    v69 = [v120 rightAnchor];
    v97 = [v37 rightAnchor];
    v98 = v69;
    v96 = objc_msgSend(v69, "constraintEqualToAnchor:");
    v125[5] = v96;
    v70 = [v115 topAnchor];
    v94 = [v120 bottomAnchor];
    v95 = v70;
    v93 = objc_msgSend(v70, "constraintEqualToAnchor:constant:", 10.0);
    v125[6] = v93;
    v71 = [v115 leftAnchor];
    v87 = [v120 leftAnchor];
    v92 = v71;
    v86 = [v71 constraintEqualToAnchor:v87];
    v125[7] = v86;
    v85 = [v115 rightAnchor];
    [v120 rightAnchor];
    v72 = v90 = v55;
    v73 = [v85 constraintEqualToAnchor:v72];
    v125[8] = v73;
    [v115 bottomAnchor];
    v74 = v91 = v53;
    v75 = [v37 bottomAnchor];
    [v74 constraintEqualToAnchor:v75];
    v77 = v76 = v52;
    v125[9] = v77;
    v78 = +[NSArray arrayWithObjects:v125 count:10];
    +[NSLayoutConstraint activateConstraints:v78];

    v52 = v76;
    v60 = (void *)v88;

    v65 = v115;
    v56 = v89;

    v53 = v91;
    id v11 = v121;

    v55 = v90;
    v64 = v111;
  }

  id v79 = objc_alloc((Class)UIBarButtonItem);
  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472;
  v123[2] = sub_1CE94;
  v123[3] = &unk_BEE30;
  id v124 = v122;
  id v80 = v122;
  v81 = +[UIAction actionWithHandler:v123];
  id v82 = [v79 initWithBarButtonSystemItem:0 primaryAction:v81];

  v83 = [v80 navigationItem];
  [v83 setRightBarButtonItem:v82];

  id v84 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v80];
  [(BatteryHealthUIController *)self presentModalViewController:v84 withTransition:3];
}

- (id)cycleCountGroupSpecifier
{
  unsigned __int8 v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier groupSpecifierWithID:0];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v5 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v5 = BatteryUILocalization(@"CYCLE_COUNT_TITLE");
  }
  uint64_t v17 = (void *)v5;
  unsigned int v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"getCycleCount" detail:0 cell:4 edit:0];
  [v6 setIdentifier:@"CYCLE_COUNT_IDENTIFIER"];
  [v4 setAccessibilityIdentifier:@"CYCLE_COUNT_TITLE"];
  [v3 addObject:v4];
  [v3 addObject:v6];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"CYCLE_COUNT_FOOTER"), +[BatteryUIResourceClass containerPath], (uint64_t v7 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"CYCLE_COUNT_FOOTER"];
    uint64_t v7 = BatteryUILocalization(v8);
  }
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (double v9 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    double v9 = BatteryUILocalization(@"CYCLE_COUNT_LEARN_MORE");
  }
  double v10 = +[NSString stringWithFormat:@"%@ %@", v7, v9];

  id v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  [v4 setProperty:v12 forKey:PSFooterCellClassGroupKey];

  [v4 setProperty:v10 forKey:PSFooterHyperlinkViewTitleKey];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v13 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v13 = BatteryUILocalization(@"CYCLE_COUNT_LEARN_MORE");
  }
  v19.id location = (NSUInteger)[v10 rangeOfString:v13];
  id v14 = NSStringFromRange(v19);
  [v4 setProperty:v14 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v15 = +[NSValue valueWithNonretainedObject:self];
  [v4 setProperty:v15 forKey:PSFooterHyperlinkViewTargetKey];

  [v4 setProperty:@"setCycleCountLink" forKey:PSFooterHyperlinkViewActionKey];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C5EC();
  }

  return v3;
}

- (void)setCycleCountLink
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (unsigned __int8 v3 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    unsigned __int8 v3 = BatteryUILocalization(@"CYCLE_COUNT_LINK");
  }
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C620();
  }
  id v4 = +[NSURL URLWithString:v3];
  uint64_t v5 = +[UIApplication sharedApplication];
  [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:&stru_BEE50];
}

- (id)getCycleCount
{
  unsigned __int8 v3 = [(BatteryHealthUIController *)self batteryCycleCount];

  if (v3)
  {
    id v4 = [(BatteryHealthUIController *)self batteryCycleCount];
    uint64_t v5 = +[NSNumberFormatter localizedStringFromNumber:v4 numberStyle:0];
  }
  else
  {
    uint64_t v5 = +[BatteryHealthUIController unknownString];
  }

  return v5;
}

- (void)getBatteryInformation
{
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C7C0();
  }
  CFTypeRef blob = IOPSCopyPowerSourcesInfo();
  if (IOPSCopyPowerSourcesByTypePrecise())
  {
    if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_ERROR)) {
      sub_8C78C();
    }
    CFDictionaryRef v3 = 0;
    CFArrayRef v4 = 0;
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    CFArrayRef v8 = IOPSCopyPowerSourcesList(blob);
    CFArrayRef v4 = v8;
    if ((!v8 || ![(__CFArray *)v8 count]) && os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_ERROR)) {
      sub_8C758();
    }
    double v9 = [(__CFArray *)v4 objectAtIndexedSubscript:0];
    CFDictionaryRef v3 = IOPSGetPowerSourceDescription(v4, v9);

    if (!v3 && os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_ERROR)) {
      sub_8C724();
    }
    uint64_t v5 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"Date of manufacture"];
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_ERROR)) {
        sub_8C6F0();
      }
    }
    uint64_t v7 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"Cycle count"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_ERROR)) {
        sub_8C6BC();
      }
    }
    unsigned int v6 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"Date of first use"];
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_ERROR)) {
        sub_8C688();
      }
    }
  }
  BHUILog = self->_BHUILog;
  if (os_log_type_enabled(BHUILog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_debug_impl(&dword_0, BHUILog, OS_LOG_TYPE_DEBUG, "Cycle Count: %@ First Use: %@ Manufacture: %@", buf, 0x20u);
  }
  [(BatteryHealthUIController *)self setBatteryCycleCount:v7];
  [(BatteryHealthUIController *)self setBatteryDateOfFirstUse:v6];
  [(BatteryHealthUIController *)self setBatteryDateOfManufacture:v5];
}

- (id)batteryInfoGroupSpecifier
{
  CFDictionaryRef v3 = +[NSMutableArray array];
  CFArrayRef v4 = +[PSSpecifier groupSpecifierWithID:@"BATTERY_INFO"];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v5 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v5 = BatteryUILocalization(@"MANUFACTURE_DATE_TITLE");
  }
  unsigned int v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"getDateOfManufacture" detail:0 cell:4 edit:0];

  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  [v6 setAccessibilityIdentifier:@"MANUFACTURE_DATE_TITLE"];
  [v6 setIdentifier:@"MANUFACTURE_DATE_IDENTIFIER"];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v7 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v7 = BatteryUILocalization(@"FIRST_USE_TITLE");
  }
  CFArrayRef v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"getDateOfFirstUse" detail:0 cell:4 edit:0];

  [v8 setAccessibilityIdentifier:@"FIRST_USE_TITLE"];
  [v8 setIdentifier:@"FIRST_USE_IDENTIFIER"];
  [v3 addObject:v4];
  [v3 addObject:v6];
  [v3 addObject:v8];
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8C7F4();
  }

  return v3;
}

- (id)bhuiDateFormatter
{
  if (qword_D7390 != -1) {
    dispatch_once(&qword_D7390, &stru_BEE90);
  }
  id v2 = (void *)qword_D7388;

  return v2;
}

- (id)getDateOfManufacture
{
  CFDictionaryRef v3 = [(BatteryHealthUIController *)self batteryDateOfManufacture];
  CFArrayRef v4 = [(BatteryHealthUIController *)self getStringFromDate:v3];

  return v4;
}

- (id)getDateOfFirstUse
{
  CFDictionaryRef v3 = [(BatteryHealthUIController *)self batteryDateOfFirstUse];
  CFArrayRef v4 = [(BatteryHealthUIController *)self getStringFromDate:v3];

  return v4;
}

- (id)getStringFromDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(BatteryHealthUIController *)self bhuiDateFormatter];
    unsigned int v6 = [v5 stringFromDate:v4];
  }
  else
  {
    unsigned int v6 = +[BatteryHealthUIController unknownString];
  }

  return v6;
}

- (id)manualChargingGroupSpecifier
{
  CFDictionaryRef v3 = [(BatteryHealthUIController *)self BHUILog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8C8A8();
  }

  if (!+[PLBatteryUIBackendModel supportsChargingFixedLimit])
  {
    NSRange v19 = [(BatteryHealthUIController *)self BHUILog];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_8C868();
    }
    goto LABEL_22;
  }
  if (!+[PLBatteryUIBackendModel shouldShowModifiedHealthController])
  {
    NSRange v19 = [(BatteryHealthUIController *)self BHUILog];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_8C828();
    }
LABEL_22:

    id v4 = +[NSMutableArray array];
    goto LABEL_23;
  }
  id v4 = +[NSMutableArray array];
  uint64_t v5 = +[PSSpecifier groupSpecifierWithID:0];
  [v4 addObject:v5];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v6 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v6 = BatteryUILocalization(@"CHARGING_FIXED_LIMIT");
  }
  +[PLBatteryUIUtilities localizedStringWithPercentage:80.0];
  v22 = id v21 = (void *)v6;
  uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v22);
  CFArrayRef v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setManualChargingSwitchState:" get:"getManualChargingSwitchState" detail:0 cell:6 edit:0];
  [v8 setAccessibilityIdentifier:v7];
  [v8 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"FIXED_FOOTER"), +[BatteryUIResourceClass containerPath], (double v9 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    double v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"FIXED_FOOTER"];
    double v9 = BatteryUILocalization(v10);
  }
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v22);

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v12 = BatteryUILocalization(@"LEARN_MORE_LINK");
  }
  v13 = +[NSString stringWithFormat:@"%@ %@", v11, v12];

  __int16 v14 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v14);
  [v5 setProperty:v15 forKey:PSFooterCellClassGroupKey];

  [v5 setProperty:v13 forKey:PSFooterHyperlinkViewTitleKey];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (__int16 v16 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    __int16 v16 = BatteryUILocalization(@"LEARN_MORE_LINK");
  }
  v24.id location = (NSUInteger)[v13 rangeOfString:v16];
  uint64_t v17 = NSStringFromRange(v24);
  [v5 setProperty:v17 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v18 = +[NSValue valueWithNonretainedObject:self];
  [v5 setProperty:v18 forKey:PSFooterHyperlinkViewTargetKey];

  [v5 setProperty:@"setLearnMoreLink" forKey:PSFooterHyperlinkViewActionKey];
  [v4 addObject:v8];

LABEL_23:

  return v4;
}

- (id)getManualChargingSwitchState
{
  CFDictionaryRef v3 = [(BatteryHealthUIController *)self BHUILog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8C8DC();
  }

  id v4 = [(BatteryHealthUIController *)self smartChargingClient];
  uint64_t v7 = 0;
  id v5 = [v4 isMCLCurrentlyEnabled:&v7];

  if (v5) {
    return &off_C95C0;
  }
  else {
    return &off_C95D8;
  }
}

- (void)setManualChargingSwitchState:(id)a3
{
  id v4 = a3;
  id v5 = [(BatteryHealthUIController *)self BHUILog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8CAB0();
  }

  unsigned int v6 = [v4 BOOLValue];
  uint64_t v7 = [(BatteryHealthUIController *)self BHUILog];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      sub_8C9AC();
    }

    double v9 = [(BatteryHealthUIController *)self smartChargingClient];
    id v18 = 0;
    unsigned int v10 = [v9 enableMCL:&v18];
    id v11 = v18;

    id v12 = [(BatteryHealthUIController *)self BHUILog];
    v13 = v12;
    if (!v10 || v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_8C944();
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      sub_8C910();
    }
  }
  else
  {
    if (v8) {
      sub_8CA7C();
    }

    __int16 v14 = [(BatteryHealthUIController *)self smartChargingClient];
    id v17 = 0;
    unsigned int v15 = [v14 disableMCL:&v17];
    id v11 = v17;

    __int16 v16 = [(BatteryHealthUIController *)self BHUILog];
    v13 = v16;
    if (!v15 || v11)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_8CA14();
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      sub_8C9E0();
    }
  }

  [(BatteryHealthUIController *)self reloadSpecifiers];
}

- (void)setLearnMoreLink
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"LEARN_MORE_URL"), +[BatteryUIResourceClass containerPath], (id v5 = (id)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v2 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"LEARN_MORE_URL"];
    BatteryUILocalization(v2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  CFDictionaryRef v3 = +[NSURL URLWithString:v5];
  id v4 = +[UIApplication sharedApplication];
  [v4 openURL:v3 options:&__NSDictionary0__struct completionHandler:&stru_BEEB0];
}

- (id)spinnerSpecifierGroup
{
  spinnerGroup = self->_spinnerGroup;
  if (!spinnerGroup)
  {
    unsigned int v4 = [(BatteryHealthUIController *)self isAuthSpinner];
    id v5 = [(BatteryHealthUIController *)self BHUILog];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6) {
        sub_8CAE4();
      }
    }
    else if (v6)
    {
      sub_8CB18();
    }

    uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    BOOL v8 = self->_spinnerGroup;
    self->_spinnerGroup = v7;

    [(PSSpecifier *)self->_spinnerGroup setObject:@"PSHeaderSpinnerCell" forKeyedSubscript:PSHeaderCellClassGroupKey];
    [(PSSpecifier *)self->_spinnerGroup setObject:&__kCFBooleanTrue forKeyedSubscript:@"PSHeaderSpinner_Animate"];
    spinnerGroup = self->_spinnerGroup;
  }

  return spinnerGroup;
}

- (id)startSpinner
{
  if ([(BatteryHealthUIController *)self genuineBatteryStatus] == -1) {
    [(BatteryHealthUIController *)self setIsAuthSpinner:1];
  }
  spinnerTimer = self->_spinnerTimer;
  if (!spinnerTimer)
  {
    unsigned int v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, (dispatch_queue_t)&_dispatch_main_q);
    id v5 = self->_spinnerTimer;
    self->_spinnerTimer = v4;

    dispatch_source_set_timer((dispatch_source_t)self->_spinnerTimer, 0, 0x12A05F200uLL, 0);
    BOOL v6 = self->_spinnerTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1E700;
    handler[3] = &unk_BE810;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    spinnerTimer = self->_spinnerTimer;
  }
  dispatch_activate(spinnerTimer);
  uint64_t v7 = [(BatteryHealthUIController *)self spinnerSpecifierGroup];

  return v7;
}

- (void)clearSpinner
{
  spinnerGroup = self->_spinnerGroup;
  if (spinnerGroup)
  {
    self->_spinnerGroup = 0;

    unsigned int v4 = [(BatteryHealthUIController *)self isAuthSpinner];
    id v5 = [(BatteryHealthUIController *)self BHUILog];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6) {
        sub_8CBB4();
      }
    }
    else if (v6)
    {
      sub_8CBE8();
    }
  }
  spinnerTimer = self->_spinnerTimer;
  if (spinnerTimer)
  {
    dispatch_source_cancel(spinnerTimer);
    BOOL v8 = self->_spinnerTimer;
    self->_spinnerTimer = 0;
  }
}

- (void)reloadSpecifiersFromSpinner
{
  if ([(BatteryHealthUIController *)self spinnerCanReloadUI])
  {
    [(BatteryHealthUIController *)self reloadSpecifiers];
  }
  else
  {
    CFDictionaryRef v3 = [(BatteryHealthUIController *)self BHUILog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_8CC1C();
    }
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BatteryHealthUIController;
  [(BatteryHealthUIController *)&v4 viewDidLoad];
  ADClientAddValueForScalarKey();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  notify_post((const char *)[@"com.apple.powerlogd.logBatteryHealthUIVisit" UTF8String]);
  uint64_t v3 = mach_absolute_time();
  self->__batteryHealthUILoadEndTime = v3;
  +[BatteryUIResourceClass millisecondsFromMachTime:v3];
  +[BatteryUIResourceClass millisecondsFromMachTime:self->__batteryHealthUILoadStartTime];
  ADClientSetValueForScalarKey();
  AnalyticsSendEventLazy();
}

- (id)specifiers
{
  self->__batteryHealthUILoadStartTime = mach_absolute_time();
  uint64_t v3 = [(BatteryHealthUIController *)self BHUILog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8CCB8();
  }

  [(BatteryHealthUIController *)self setSpinnerCanReloadUI:1];
  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  id v5 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v5)
  {
    [(BatteryHealthUIController *)self updateData];
    BOOL v6 = +[NSMutableArray array];
    if (+[BatteryUIResourceClass batteryDataUnavailable])
    {
      uint64_t v7 = [(BatteryHealthUIController *)self startSpinner];
      [v6 addObject:v7];
    }
    else
    {
      [(BatteryHealthUIController *)self clearSpinner];
      if (+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController")|| +[PLBatteryUIBackendModel shouldShowModifiedHealthController])
      {
        BOOL v8 = [(BatteryHealthUIController *)self BHUILog];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          sub_8CC50();
        }

        double v9 = [(BatteryHealthUIController *)self headerSpecifiers];
        [v6 addObjectsFromArray:v9];

        unsigned int v10 = [(BatteryHealthUIController *)self chargeCapacityGroupSpecifier];
        [v6 addObjectsFromArray:v10];

        id v11 = [(BatteryHealthUIController *)self cycleCountGroupSpecifier];
        [v6 addObjectsFromArray:v11];

        id v12 = [(BatteryHealthUIController *)self manualChargingGroupSpecifier];
        [v6 addObjectsFromArray:v12];

        uint64_t v13 = [(BatteryHealthUIController *)self batteryInfoGroupSpecifier];
      }
      else
      {
        __int16 v14 = [(BatteryHealthUIController *)self BHUILog];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_8CC84();
        }

        unsigned int v15 = [(BatteryHealthUIController *)self headerSpecifiers];
        [v6 addObjectsFromArray:v15];

        __int16 v16 = [(BatteryHealthUIController *)self chargeCapacityGroupSpecifier];
        [v6 addObjectsFromArray:v16];

        uint64_t v13 = [(BatteryHealthUIController *)self peakPowerCapacityGroupSpecifier];
      }
      uint64_t v7 = (void *)v13;
      [v6 addObjectsFromArray:v13];
    }

    if (!+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController")&& !+[PLBatteryUIBackendModel shouldShowModifiedHealthController])
    {
      id v17 = [(BatteryHealthUIController *)self setUpChargingOptionsSpecifiers];
      [v6 addObjectsFromArray:v17];
    }
    if (!+[PLBatteryUIBackendModel shouldShowChargingController])
    {
      id v18 = [(BatteryHealthUIController *)self cleanEnergyChargingGroupSpecifier];
      [v6 addObjectsFromArray:v18];
    }
    NSRange v19 = *(void **)&self->PSListController_opaque[v4];
    *(void *)&self->PSListController_opaque[v4] = v6;

    id v5 = *(void **)&self->PSListController_opaque[v4];
  }

  return v5;
}

- (void)userDidDisable
{
  BHUILog = self->_BHUILog;
  if (os_log_type_enabled(BHUILog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, BHUILog, OS_LOG_TYPE_INFO, "User disabled mitigations", buf, 2u);
  }
  if (notify_post("com.apple.thermalmonitor.ageAwareMitigationsDisabled")
    && os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_ERROR))
  {
    sub_8CCEC();
  }
  self->_userDisabledPerfManagement = 1;
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1EED4;
  block[3] = &unk_BE810;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  [(BatteryHealthUIController *)self reloadSpecifiers];
}

- (void)userDidLeaveOn
{
  BHUILog = self->_BHUILog;
  if (os_log_type_enabled(BHUILog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, BHUILog, OS_LOG_TYPE_INFO, "User left mitigations enabled", v3, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)BatteryHealthUIController;
  [(BatteryHealthUIController *)&v12 viewDidAppear:a3];
  dispatch_time_t v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Battery/BATTERY_HEALTH_TITLE"];
  id v5 = @"BATTERY_HEALTH_TITLE";
  if (!+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController")&& !+[PLModelingUtilities isiPad])
  {
    id v5 = @"BATTERY_HEALTH";
  }
  BOOL v6 = v5;
  id v7 = objc_alloc((Class)_NSLocalizedStringResource);
  BOOL v8 = +[NSLocale currentLocale];
  double v9 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v10 = [v9 bundleURL];
  id v11 = [v7 initWithKey:v6 table:@"BatteryUI" locale:v8 bundleURL:v10];

  [(BatteryHealthUIController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.battery" title:v11 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  spinnerTimer = self->_spinnerTimer;
  if (spinnerTimer)
  {
    dispatch_source_cancel(spinnerTimer);
    BOOL v6 = self->_spinnerTimer;
    self->_spinnerTimer = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)BatteryHealthUIController;
  [(BatteryHealthUIController *)&v7 viewDidDisappear:v3];
}

- (id)getChargingMode
{
  BOOL v3 = [(BatteryHealthUIController *)self BHUILog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8CF5C();
  }

  if (+[PLBatteryUIBackendModel supportsChargingFixedLimit])
  {
    dispatch_time_t v4 = [(BatteryHealthUIController *)self smartChargingClient];
    id v16 = 0;
    id v5 = [v4 isMCLCurrentlyEnabled:&v16];
    BOOL v6 = v16;

    objc_super v7 = [(BatteryHealthUIController *)self smartChargingClient];
    uint64_t v15 = 0;
    BOOL v8 = (char *)[v7 isSmartChargingCurrentlyEnabled:&v15];

    double v9 = [(BatteryHealthUIController *)self BHUILog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_8CEA4();
    }

    if (v5)
    {
      unsigned int v10 = [(BatteryHealthUIController *)self BHUILog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_8CE70();
      }
      uint64_t v11 = 1;
    }
    else
    {
      unsigned int v10 = [(BatteryHealthUIController *)self BHUILog];
      BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v8 == (unsigned char *)&dword_0 + 1)
      {
        if (v13) {
          sub_8CE08();
        }
        uint64_t v11 = 0;
      }
      else
      {
        if (v13) {
          sub_8CE3C();
        }
        uint64_t v11 = 2;
      }
    }

    objc_super v12 = +[NSNumber numberWithInt:v11];
  }
  else
  {
    BOOL v6 = [(BatteryHealthUIController *)self BHUILog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_8CF28();
    }
    objc_super v12 = 0;
  }

  return v12;
}

- (id)setChargingMode:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(BatteryHealthUIController *)self BHUILog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_8D008();
  }

  if (+[PLBatteryUIBackendModel supportsChargingFixedLimit])
  {
    if ([v5 intValue])
    {
      if ([v5 intValue] != 1)
      {
LABEL_14:
        BOOL v13 = +[NSNumber numberWithInt:[(BatteryHealthUIController *)self curChargingMode]];
        goto LABEL_15;
      }
      objc_super v7 = [(BatteryHealthUIController *)self smartChargingClient];
      id v19 = 0;
      [v7 disableDEoC:&v19];
      id v8 = v19;

      double v9 = [(BatteryHealthUIController *)self smartChargingClient];
      id v18 = v8;
      [v9 enableMCL:&v18];
      id v10 = v18;

      [(BatteryHealthUIController *)self setCurChargingMode:1];
      uint64_t v11 = [(BatteryHealthUIController *)self BHUILog];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_8CF90(self);
      }
    }
    else
    {
      __int16 v14 = [(BatteryHealthUIController *)self smartChargingClient];
      id v21 = 0;
      [v14 enableSmartCharging:&v21];
      id v15 = v21;

      id v16 = [(BatteryHealthUIController *)self smartChargingClient];
      id v20 = v15;
      [v16 disableMCL:&v20];
      id v10 = v20;

      [(BatteryHealthUIController *)self setCurChargingMode:0];
      uint64_t v11 = [(BatteryHealthUIController *)self BHUILog];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_8CF90(self);
      }
    }

    goto LABEL_14;
  }
  objc_super v12 = [(BatteryHealthUIController *)self BHUILog];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_8CF28();
  }

  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (id)setUpChargingOptionsSpecifiers
{
  unsigned __int8 v3 = +[PLBatteryUIBackendModel supportsChargingFixedLimit];
  dispatch_time_t v4 = [(BatteryHealthUIController *)self BHUILog];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      sub_8D070();
    }

    v27 = +[NSMutableArray array];
    id v26 = +[PSSpecifier groupSpecifierWithID:@"CHARGING_OPTIMIZATION_GROUP_ID"];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (BOOL v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      BOOL v6 = BatteryUILocalization(@"CHARGING_TITLE");
    }
    objc_super v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setChargingMode:specifier:" get:"getChargingMode" detail:objc_opt_class() cell:2 edit:0];

    [(BatteryHealthUIController *)self setChargingOptionsSpecifier:v7];
    [v7 setIdentifier:@"CHARGING_OPTIONS_IDENTIFIER"];
    id v8 = +[NSNumber numberWithInt:0];
    v30[0] = v8;
    double v9 = +[NSNumber numberWithInt:1];
    v30[1] = v9;
    id v10 = +[NSNumber numberWithInt:2];
    v30[2] = v10;
    v25 = +[NSArray arrayWithObjects:v30 count:3];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (uint64_t v11 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      uint64_t v11 = BatteryUILocalization(@"CHARGING_FIXED_LIMIT");
    }
    objc_super v12 = +[PLBatteryUIUtilities localizedStringWithPercentage:80.0];
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (__int16 v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      __int16 v14 = BatteryUILocalization(@"SC_TITLE");
    }
    v29[0] = v14;
    v29[1] = v13;
    NSRange v24 = (void *)v13;
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v15 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v15 = BatteryUILocalization(@"CHARGING_OFF");
    }
    v29[2] = v15;
    id v16 = +[NSArray arrayWithObjects:v29 count:3];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v17 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v17 = BatteryUILocalization(@"SHORT_FIXED");
    }
    id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v12);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v19 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v19 = BatteryUILocalization(@"SHORT_OPTIMIZED");
    }
    v28[0] = v19;
    v28[1] = v18;
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v20 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v20 = BatteryUILocalization(@"CHARGING_OFF");
    }
    v28[2] = v20;
    id v21 = +[NSArray arrayWithObjects:v28 count:3];

    [v7 setIdentifier:@"CHARGING_OPTIMIZATION"];
    [v7 setValues:v25 titles:v16 shortTitles:v21];
    v22 = v27;
    [v27 addObject:v26];
    [v27 addObject:v7];
  }
  else
  {
    if (v5) {
      sub_8CF28();
    }

    v22 = [(BatteryHealthUIController *)self smartChargingGroupSpecifier];
  }

  return v22;
}

+ (id)getHealthStateString
{
  unsigned int v2 = +[BatteryUIResourceClass getBatteryHealthServiceState];
  if (v2 - 1 < 6 || v2 == 11)
  {
    if (+[BatteryUIResourceClass inDemoMode])
    {
      +[BatteryUIResourceClass containerPath];
      dispatch_time_t v4 = @"BATTERY_SERVICE";
      goto LABEL_8;
    }
    dispatch_time_t v4 = @"BATTERY_SERVICE";
  }
  else
  {
    if (+[BatteryUIResourceClass inDemoMode])
    {
      +[BatteryUIResourceClass containerPath];
      dispatch_time_t v4 = @"NORMAL_STATE";
LABEL_8:
      BOOL v5 = (void *)_CFPreferencesCopyValueWithContainer();
      if (v5) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    dispatch_time_t v4 = @"NORMAL_STATE";
  }
LABEL_11:
  BOOL v5 = BatteryUILocalization(v4);
LABEL_12:

  return v5;
}

- (id)healthStateString
{
  return +[BatteryHealthUIController getHealthStateString];
}

- (id)smartChargingGroupSpecifier
{
  unsigned __int8 v3 = +[NSMutableArray array];
  dispatch_time_t v4 = +[PSSpecifier groupSpecifierWithID:0];
  [v3 addObject:v4];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (BOOL v5 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    BOOL v5 = BatteryUILocalization(@"SC_TITLE");
  }
  BOOL v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setSmartChargingSwitchState:" get:"getSmartChargingSwitchState" detail:0 cell:6 edit:0];

  [v6 setIdentifier:@"OBC_TOGGLE_IDENTIFIER"];
  [v6 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (objc_super v7 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    objc_super v7 = BatteryUILocalization(@"SC_FOOTER_TEXT");
  }
  id v8 = +[NSNumberFormatter localizedStringFromNumber:&off_CA780 numberStyle:3];
  double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  if ((char *)[(BatteryHealthUIController *)self smartChargingState] == (char *)&dword_0 + 3)
  {
    v22 = v3;
    id v10 = +[NSCalendar currentCalendar];
    id v11 = objc_alloc_init((Class)NSDateFormatter);
    objc_super v12 = +[NSLocale currentLocale];
    [v11 setLocale:v12];

    if (+[PLBatteryUIUtilities is24HourClock]) {
      CFStringRef v13 = @"H:mm";
    }
    else {
      CFStringRef v13 = @"h:mm a";
    }
    [v11 setLocalizedDateFormatFromTemplate:v13];
    id v14 = objc_alloc_init((Class)NSDateComponents);
    [v14 setHour:6];
    id v21 = v10;
    id v15 = [v10 dateFromComponents:v14];
    id v16 = [v11 stringFromDate:v15];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v17 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v17 = BatteryUILocalization(@"SC_FOOTER_TEXT_TEMP_DISABLE_ADDITION");
    }
    id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v16);

    uint64_t v19 = +[NSString stringWithFormat:@"%@ %@", v9, v18];

    double v9 = (void *)v19;
    unsigned __int8 v3 = v22;
  }
  [v4 setProperty:v9 forKey:PSFooterTextGroupKey];
  [v3 addObject:v6];

  return v3;
}

- (id)getSmartChargingSwitchState
{
  if ((char *)[(BatteryHealthUIController *)self smartChargingState] == (char *)&dword_0 + 1) {
    return &off_C95C0;
  }
  else {
    return &off_C95D8;
  }
}

- (void)setSmartChargingSwitchState:(id)a3
{
  unsigned int v4 = [a3 BOOLValue];
  BOOL v5 = [(BatteryHealthUIController *)self BHUILog];
  BOOL v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "User enabled smart charging", buf, 2u);
    }

    objc_super v7 = [(BatteryHealthUIController *)self smartChargingClient];
    id v36 = 0;
    unsigned int v8 = [v7 enableSmartCharging:&v36];
    id v9 = v36;

    id v10 = [(BatteryHealthUIController *)self BHUILog];
    id v11 = v10;
    if (!v8 || v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_8AE98();
      }

      ADClientAddValueForScalarKey();
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Smart charging enabled", buf, 2u);
      }

      ADClientAddValueForScalarKey();
      ADClientSetValueForScalarKey();
    }
    AnalyticsSendEventLazy();
    [(BatteryHealthUIController *)self reloadSpecifiers];
  }
  else
  {
    objc_super v12 = [(BatteryHealthUIController *)self smartChargingClient];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (CFStringRef v13 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      CFStringRef v13 = BatteryUILocalization(@"SC_ALERT_TITLE");
    }
    id v9 = +[UIAlertController alertControllerWithTitle:v13 message:0 preferredStyle:1];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v14 = BatteryUILocalization(@"SC_ALERT_DISABLE");
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_20658;
    v32[3] = &unk_BEA90;
    id v15 = v6;
    id v33 = v15;
    id v16 = v12;
    id v34 = v16;
    v35 = self;
    id v17 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v32];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v18 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v18 = BatteryUILocalization(@"SC_ALERT_LEAVE_ON");
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_207D4;
    void v29[3] = &unk_BE988;
    uint64_t v19 = v15;
    id v30 = v19;
    v31 = self;
    id v20 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v29];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v21 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v21 = BatteryUILocalization(@"SC_ALERT_TEMP_DISABLE");
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_20870;
    v25[3] = &unk_BEA90;
    id v26 = v19;
    id v27 = v16;
    v28 = self;
    id v22 = v16;
    id v23 = v19;
    NSRange v24 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v25];

    [v9 addAction:v24];
    [v9 addAction:v17];
    [v9 addAction:v20];
    [v9 setPreferredAction:v24];
    [(BatteryHealthUIController *)self setSpinnerCanReloadUI:0];
    [(BatteryHealthUIController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (id)cleanEnergyChargingGroupSpecifier
{
  unsigned __int8 v3 = +[PLBatteryUIBackendModel shouldShowModifiedHealthController];
  unsigned int v4 = +[NSMutableArray array];
  if ((v3 & 1) == 0)
  {
    BOOL v5 = [(BatteryHealthUIController *)self smartChargingClient];
    if ([v5 isCECSupported])
    {
      v32 = +[PSSpecifier groupSpecifierWithID:0];
      objc_msgSend(v4, "addObject:");
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (BOOL v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        BOOL v6 = BatteryUILocalization(@"CLEAN_ENERGY_TITLE");
      }
      objc_super v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setCleanChargingSwitchState:" get:"getCleanChargingSwitchState" detail:0 cell:6 edit:0];

      [v7 setIdentifier:@"CEC_TOGGLE_IDENTIFIER"];
      [v7 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (unsigned int v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        unsigned int v8 = BatteryUILocalization(@"CLEAN_ENERGY_FOOTER");
      }
      id v9 = &objc_loadWeakRetained_ptr;
      if ((char *)[(BatteryHealthUIController *)self cleanChargingState] == (char *)&dword_0 + 3)
      {
        id v30 = v7;
        v31 = v5;
        id v10 = +[NSCalendar currentCalendar];
        id v11 = objc_alloc_init((Class)NSDateFormatter);
        objc_super v12 = +[NSLocale currentLocale];
        [v11 setLocale:v12];

        if (+[PLBatteryUIUtilities is24HourClock]) {
          CFStringRef v13 = @"H:mm";
        }
        else {
          CFStringRef v13 = @"h:mm a";
        }
        [v11 setLocalizedDateFormatFromTemplate:v13];
        id v14 = objc_alloc_init((Class)NSDateComponents);
        [v14 setHour:6];
        id v29 = v10;
        id v15 = [v10 dateFromComponents:v14];
        id v16 = [v11 stringFromDate:v15];
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (id v17 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          id v17 = BatteryUILocalization(@"CEC_FOOTER_TEXT_TEMP_DISABLE_ADDITION");
        }
        id v9 = &objc_loadWeakRetained_ptr;
        id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v16);

        uint64_t v19 = +[NSString stringWithFormat:@"%@ %@", v8, v18];

        unsigned int v8 = (void *)v19;
        objc_super v7 = v30;
        BOOL v5 = v31;
      }
      id v20 = v9[304];
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (id v21 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        id v21 = BatteryUILocalization(@"CEC_LINK");
      }
      id v22 = [v20 stringWithFormat:@"%@ %@", v8, v21];

      id v23 = (objc_class *)objc_opt_class();
      NSRange v24 = NSStringFromClass(v23);
      [v32 setProperty:v24 forKey:PSFooterCellClassGroupKey];

      [v32 setProperty:v22 forKey:PSFooterHyperlinkViewTitleKey];
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (v25 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        v25 = BatteryUILocalization(@"CEC_LINK");
      }
      v34.id location = (NSUInteger)[v22 rangeOfString:v25];
      id v26 = NSStringFromRange(v34);
      [v32 setProperty:v26 forKey:PSFooterHyperlinkViewLinkRangeKey];

      id v27 = +[NSValue valueWithNonretainedObject:self];
      [v32 setProperty:v27 forKey:PSFooterHyperlinkViewTargetKey];

      [v32 setProperty:@"setAboutCleanEnergyChargingLink" forKey:PSFooterHyperlinkViewActionKey];
      [v4 addObject:v7];
    }
    else if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG))
    {
      sub_8D0A4();
    }
  }

  return v4;
}

- (void)setAboutCleanEnergyChargingLink
{
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (unsigned __int8 v3 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    unsigned __int8 v3 = BatteryUILocalization(@"CEC_URL");
  }
  if (os_log_type_enabled((os_log_t)self->_BHUILog, OS_LOG_TYPE_DEBUG)) {
    sub_8D0D8();
  }
  unsigned int v4 = +[NSURL URLWithString:v3];
  BOOL v5 = +[UIApplication sharedApplication];
  [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:&stru_BF030];
}

- (id)getCleanChargingSwitchState
{
  if ((char *)[(BatteryHealthUIController *)self cleanChargingState] == (char *)&dword_0 + 1) {
    return &off_C95C0;
  }
  else {
    return &off_C95D8;
  }
}

- (void)setCleanChargingSwitchState:(id)a3
{
  unsigned int v4 = [a3 BOOLValue];
  BOOL v5 = [(BatteryHealthUIController *)self BHUILog];
  BOOL v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "User enabled clean energy charging", buf, 2u);
    }

    objc_super v7 = [(BatteryHealthUIController *)self smartChargingClient];
    id v36 = 0;
    unsigned int v8 = [v7 enableCEC:&v36];
    id v9 = v36;

    id v10 = [(BatteryHealthUIController *)self BHUILog];
    id v11 = v10;
    if (!v8 || v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_8BB44();
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Clean energy charging enabled", buf, 2u);
    }

    [(BatteryHealthUIController *)self reloadSpecifiers];
  }
  else
  {
    objc_super v12 = [(BatteryHealthUIController *)self smartChargingClient];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (CFStringRef v13 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      CFStringRef v13 = BatteryUILocalization(@"CEC_ALERT_TITLE");
    }
    id v9 = +[UIAlertController alertControllerWithTitle:v13 message:0 preferredStyle:1];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v14 = BatteryUILocalization(@"CEC_ALERT_DISABLE");
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_2161C;
    v32[3] = &unk_BEA90;
    id v15 = v6;
    id v33 = v15;
    id v16 = v12;
    id v34 = v16;
    v35 = self;
    id v17 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v32];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v18 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v18 = BatteryUILocalization(@"CEC_ALERT_LEAVE_ON");
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_21730;
    void v29[3] = &unk_BE988;
    uint64_t v19 = v15;
    id v30 = v19;
    v31 = self;
    id v20 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v29];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v21 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v21 = BatteryUILocalization(@"CEC_ALERT_TEMP_DISABLE");
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_2179C;
    v25[3] = &unk_BEA90;
    id v26 = v19;
    id v27 = v16;
    v28 = self;
    id v22 = v16;
    id v23 = v19;
    NSRange v24 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v25];

    [v9 addAction:v24];
    [v9 addAction:v17];
    [v9 addAction:v20];
    [v9 setPreferredAction:v24];
    [(BatteryHealthUIController *)self setSpinnerCanReloadUI:0];
    [(BatteryHealthUIController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (OS_os_log)BHUILog
{
  return (OS_os_log *)objc_getProperty(self, a2, 208, 1);
}

- (void)setBHUILog:(id)a3
{
}

- (int)perfManagementState
{
  return self->_perfManagementState;
}

- (void)setPerfManagementState:(int)a3
{
  self->_int perfManagementState = a3;
}

- (int)batteryHealthServiceState
{
  return self->_batteryHealthServiceState;
}

- (void)setBatteryHealthServiceState:(int)a3
{
  self->_int batteryHealthServiceState = a3;
}

- (int)batteryHealthServiceFlag
{
  return self->_batteryHealthServiceFlag;
}

- (void)setBatteryHealthServiceFlag:(int)a3
{
  self->_batteryHealthServiceFlag = a3;
}

- (int)genuineBatteryStatus
{
  return self->_genuineBatteryStatus;
}

- (void)setGenuineBatteryStatus:(int)a3
{
  self->_genuineBatteryStatus = a3;
}

- (NSNumber)maximumCapacityPercent
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setMaximumCapacityPercent:(id)a3
{
}

- (NSNumber)batteryCycleCount
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBatteryCycleCount:(id)a3
{
}

- (NSDate)batteryDateOfFirstUse
{
  return (NSDate *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBatteryDateOfFirstUse:(id)a3
{
}

- (NSDate)batteryDateOfManufacture
{
  return (NSDate *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBatteryDateOfManufacture:(id)a3
{
}

- (BOOL)userDisabledPerfManagement
{
  return self->_userDisabledPerfManagement;
}

- (void)setUserDisabledPerfManagement:(BOOL)a3
{
  self->_userDisabledPerfManagement = a3;
}

- (unint64_t)_batteryHealthUILoadEndTime
{
  return self->__batteryHealthUILoadEndTime;
}

- (void)set_batteryHealthUILoadEndTime:(unint64_t)a3
{
  self->__batteryHealthUILoadEndTime = a3;
}

- (unint64_t)_batteryHealthUILoadStartTime
{
  return self->__batteryHealthUILoadStartTime;
}

- (void)set_batteryHealthUILoadStartTime:(unint64_t)a3
{
  self->__batteryHealthUILoadStartTime = a3;
}

- (PSSpecifier)spinnerGroup
{
  return (PSSpecifier *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSpinnerGroup:(id)a3
{
}

- (OS_dispatch_source)spinnerTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSpinnerTimer:(id)a3
{
}

- (BOOL)spinnerCanReloadUI
{
  return self->_spinnerCanReloadUI;
}

- (void)setSpinnerCanReloadUI:(BOOL)a3
{
  self->_spinnerCanReloadUI = a3;
}

- (BOOL)isAuthSpinner
{
  return self->_isAuthSpinner;
}

- (void)setIsAuthSpinner:(BOOL)a3
{
  self->_isAuthSpinner = a3;
}

- (ACSBatteryServiceBookingCoordinator)batteryServiceBookingCoordinator
{
  return (ACSBatteryServiceBookingCoordinator *)objc_getProperty(self, a2, 280, 1);
}

- (void)setBatteryServiceBookingCoordinator:(id)a3
{
}

- (PowerUISmartChargeClient)smartChargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 288, 1);
}

- (void)setSmartChargingClient:(id)a3
{
}

- (unint64_t)smartChargingState
{
  return self->_smartChargingState;
}

- (void)setSmartChargingState:(unint64_t)a3
{
  self->_smartChargingState = a3;
}

- (unint64_t)cleanChargingState
{
  return self->_cleanChargingState;
}

- (void)setCleanChargingState:(unint64_t)a3
{
  self->_cleanChargingState = a3;
}

- (unint64_t)curChargingMode
{
  return self->_curChargingMode;
}

- (void)setCurChargingMode:(unint64_t)a3
{
  self->_curChargingMode = a3;
}

- (PSSpecifier)chargingOptionsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 320, 1);
}

- (void)setChargingOptionsSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingOptionsSpecifier, 0);
  objc_storeStrong((id *)&self->_smartChargingClient, 0);
  objc_storeStrong((id *)&self->_batteryServiceBookingCoordinator, 0);
  objc_storeStrong((id *)&self->_spinnerTimer, 0);
  objc_storeStrong((id *)&self->_spinnerGroup, 0);
  objc_storeStrong((id *)&self->_batteryDateOfManufacture, 0);
  objc_storeStrong((id *)&self->_batteryDateOfFirstUse, 0);
  objc_storeStrong((id *)&self->_batteryCycleCount, 0);
  objc_storeStrong((id *)&self->_maximumCapacityPercent, 0);

  objc_storeStrong((id *)&self->_BHUILog, 0);
}

@end