@interface _DBAnalyticsChargeInfo
- (BOOL)didChargeDuringSession;
- (BOOL)isWireless;
- (NSMutableString)sessionChargingStates;
- (NSNumber)startingBatteryPercentage;
- (NSString)PMUConfiguration;
- (NSString)adapterDescription;
- (NSString)adapterFamily;
- (NSString)current;
- (NSString)voltage;
- (NSString)wattage;
- (_DBAnalyticsChargeInfo)init;
- (void)setAdapterDescription:(id)a3;
- (void)setAdapterFamily:(id)a3;
- (void)setCurrent:(id)a3;
- (void)setDidChargeDuringSession:(BOOL)a3;
- (void)setPMUConfiguration:(id)a3;
- (void)setSessionChargingStates:(id)a3;
- (void)setStartingBatteryPercentage:(id)a3;
- (void)setVoltage:(id)a3;
- (void)setWattage:(id)a3;
- (void)setWireless:(BOOL)a3;
@end

@implementation _DBAnalyticsChargeInfo

- (_DBAnalyticsChargeInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DBAnalyticsChargeInfo;
  v2 = [(_DBAnalyticsTimeAccumulator *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    sessionChargingStates = v2->_sessionChargingStates;
    v2->_sessionChargingStates = v3;
  }
  return v2;
}

- (BOOL)isWireless
{
  return self->_wireless;
}

- (void)setWireless:(BOOL)a3
{
  self->_wireless = a3;
}

- (BOOL)didChargeDuringSession
{
  return self->_didChargeDuringSession;
}

- (void)setDidChargeDuringSession:(BOOL)a3
{
  self->_didChargeDuringSession = a3;
}

- (NSMutableString)sessionChargingStates
{
  return self->_sessionChargingStates;
}

- (void)setSessionChargingStates:(id)a3
{
}

- (NSString)current
{
  return self->_current;
}

- (void)setCurrent:(id)a3
{
}

- (NSString)adapterDescription
{
  return self->_adapterDescription;
}

- (void)setAdapterDescription:(id)a3
{
}

- (NSString)PMUConfiguration
{
  return self->_PMUConfiguration;
}

- (void)setPMUConfiguration:(id)a3
{
}

- (NSString)voltage
{
  return self->_voltage;
}

- (void)setVoltage:(id)a3
{
}

- (NSString)wattage
{
  return self->_wattage;
}

- (void)setWattage:(id)a3
{
}

- (NSString)adapterFamily
{
  return self->_adapterFamily;
}

- (void)setAdapterFamily:(id)a3
{
}

- (NSNumber)startingBatteryPercentage
{
  return self->_startingBatteryPercentage;
}

- (void)setStartingBatteryPercentage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingBatteryPercentage, 0);
  objc_storeStrong((id *)&self->_adapterFamily, 0);
  objc_storeStrong((id *)&self->_wattage, 0);
  objc_storeStrong((id *)&self->_voltage, 0);
  objc_storeStrong((id *)&self->_PMUConfiguration, 0);
  objc_storeStrong((id *)&self->_adapterDescription, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_sessionChargingStates, 0);
}

@end