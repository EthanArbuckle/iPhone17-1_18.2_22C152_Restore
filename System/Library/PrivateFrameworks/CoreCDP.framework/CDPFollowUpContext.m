@interface CDPFollowUpContext
+ (BOOL)supportsSecureCoding;
+ (id)_contextWithType:(id)a3 cdpContext:(id)a4;
+ (id)contextForADPStateHealing;
+ (id)contextForADPUpsell;
+ (id)contextForCDPEDPStateRepair;
+ (id)contextForConfirmExistingSecret;
+ (id)contextForEDPStateRepair;
+ (id)contextForOfflinePasscodeChange;
+ (id)contextForRecoveryKeyMismatchHealing;
+ (id)contextForRecoveryKeyRepair;
+ (id)contextForSOSCompatibilityMode;
+ (id)contextForSecureTerms;
+ (id)contextForSettingUpBiometrics;
+ (id)contextForStateRepair;
+ (id)contextForWalrusCreatePasscodeWithCDPContext:(id)a3;
+ (id)contextWithType:(id)a3;
+ (void)contextForADPStateHealing;
+ (void)contextForADPUpsell;
+ (void)contextForCDPEDPStateRepair;
+ (void)contextForEDPStateRepair;
+ (void)contextForRecoveryKeyMismatchHealing;
+ (void)contextForSOSCompatibilityMode;
- (BOOL)force;
- (BOOL)shouldNotify;
- (CDPFollowUpContext)initWithCoder:(id)a3;
- (NSString)altDSID;
- (NSString)followUpType;
- (NSString)telemetryDeviceSessionID;
- (NSString)telemetryFlowID;
- (id)description;
- (unint64_t)repairType;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setFollowUpType:(id)a3;
- (void)setForce:(BOOL)a3;
- (void)setRepairType:(unint64_t)a3;
- (void)setShouldNotify:(BOOL)a3;
- (void)setTelemetryDeviceSessionID:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
@end

@implementation CDPFollowUpContext

+ (id)contextWithType:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setShouldNotify:1];
  [v4 setFollowUpType:v3];

  return v4;
}

+ (id)_contextWithType:(id)a3 cdpContext:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [a1 contextWithType:a3];
  v8 = [v6 altDSID];
  [v7 setAltDSID:v8];

  v9 = [v6 telemetryFlowID];
  [v7 setTelemetryFlowID:v9];

  v10 = [v6 telemetryDeviceSessionID];

  [v7 setTelemetryDeviceSessionID:v10];
  v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v7 altDSID];
    int v14 = 141558274;
    uint64_t v15 = 1752392040;
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "CDPFollowUpContext: set altDSID to %{mask.hash}@", (uint8_t *)&v14, 0x16u);
  }
  return v7;
}

+ (id)contextForOfflinePasscodeChange
{
  return (id)[a1 contextWithType:@"kCDPOfflinePasscodeChange"];
}

+ (id)contextForRecoveryKeyRepair
{
  return (id)[a1 contextWithType:@"kCDPRecoveryKeyRegenerate"];
}

+ (id)contextForSettingUpBiometrics
{
  return (id)[a1 contextWithType:@"kCDPUpgradeSetupBioMetrics"];
}

+ (id)contextForSecureTerms
{
  return (id)[a1 contextWithType:@"kCDPSecureTerms"];
}

+ (id)contextForConfirmExistingSecret
{
  return (id)[a1 contextWithType:@"kCDPConfirmExistingSecret"];
}

+ (id)contextForWalrusCreatePasscodeWithCDPContext:(id)a3
{
  return (id)[a1 _contextWithType:@"kWalrusCreatePasscode" cdpContext:a3];
}

+ (id)contextForSOSCompatibilityMode
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[CDPFollowUpContext contextForSOSCompatibilityMode]();
  }

  id v4 = [a1 contextWithType:@"kSOSCompatibilityMode"];
  [v4 setRepairType:0];
  return v4;
}

+ (id)contextForRecoveryKeyMismatchHealing
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[CDPFollowUpContext contextForRecoveryKeyMismatchHealing]();
  }

  id v4 = [a1 contextWithType:@"kRecoveryKeyMismatchHealing"];
  return v4;
}

+ (id)contextForADPUpsell
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[CDPFollowUpContext contextForADPUpsell]();
  }

  id v4 = [a1 contextWithType:@"kADPUpsell"];
  return v4;
}

+ (id)contextForEDPStateRepair
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[CDPFollowUpContext contextForEDPStateRepair]();
  }

  id v4 = [a1 contextWithType:@"kEDPOnlyStateRepair"];
  return v4;
}

+ (id)contextForCDPEDPStateRepair
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[CDPFollowUpContext contextForCDPEDPStateRepair]();
  }

  id v4 = [a1 contextWithType:@"kCDPEDPStateRepair"];
  [v4 setRepairType:3];
  return v4;
}

+ (id)contextForADPStateHealing
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[CDPFollowUpContext contextForADPStateHealing]();
  }

  id v4 = [a1 contextWithType:@"kADPStateHealing"];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  followUpType = self->_followUpType;
  id v5 = a3;
  [v5 encodeObject:followUpType forKey:@"_followUpType"];
  [v5 encodeBool:self->_shouldNotify forKey:@"_shouldNotify"];
  [v5 encodeBool:self->_force forKey:@"_force"];
  [v5 encodeInteger:self->_repairType forKey:@"_repairType"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_telemetryFlowID forKey:@"_telemetryFlowID"];
  [v5 encodeObject:self->_telemetryDeviceSessionID forKey:@"_telemetryDeviceSessionID"];
}

- (CDPFollowUpContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPFollowUpContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_followUpType"];
    followUpType = v5->_followUpType;
    v5->_followUpType = (NSString *)v6;

    v5->_shouldNotify = [v4 decodeBoolForKey:@"_shouldNotify"];
    v5->_force = [v4 decodeBoolForKey:@"_force"];
    v5->_repairType = [v4 decodeIntegerForKey:@"_repairType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_telemetryFlowID"];
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_telemetryDeviceSessionID"];
    telemetryDeviceSessionID = v5->_telemetryDeviceSessionID;
    v5->_telemetryDeviceSessionID = (NSString *)v12;
  }
  return v5;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() description];
  id v5 = [v3 stringWithFormat:@"<%@: %p - type=%@ shouldNotify=%{BOOL}d force=%{BOOL}d>", v4, self, self->_followUpType, self->_shouldNotify, self->_force];

  return v5;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (void)setShouldNotify:(BOOL)a3
{
  self->_shouldNotify = a3;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)telemetryDeviceSessionID
{
  return self->_telemetryDeviceSessionID;
}

- (void)setTelemetryDeviceSessionID:(id)a3
{
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (NSString)followUpType
{
  return self->_followUpType;
}

- (void)setFollowUpType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpType, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

+ (id)contextForStateRepair
{
  v2 = [a1 contextWithType:@"kCDPStateRepair"];
  [v2 setRepairType:0];
  return v2;
}

- (unint64_t)repairType
{
  return self->_repairType;
}

- (void)setRepairType:(unint64_t)a3
{
  self->_repairType = a3;
}

+ (void)contextForSOSCompatibilityMode
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Creating context for SOS compatibility mode", v2, v3, v4, v5, v6);
}

+ (void)contextForRecoveryKeyMismatchHealing
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Creating context for RK Healing CFU", v2, v3, v4, v5, v6);
}

+ (void)contextForADPUpsell
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Creating context for ADP Upsell CFU", v2, v3, v4, v5, v6);
}

+ (void)contextForEDPStateRepair
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Creating context for EDP Only Repair CFU", v2, v3, v4, v5, v6);
}

+ (void)contextForCDPEDPStateRepair
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Creating context for CDP & EDP Repair CFU", v2, v3, v4, v5, v6);
}

+ (void)contextForADPStateHealing
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Creating context for ADP State healing CFU", v2, v3, v4, v5, v6);
}

@end