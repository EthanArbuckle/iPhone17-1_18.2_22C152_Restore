@interface HMDAccessoryFirmwareUpdatePolicyCriteria
- (BOOL)anyUserAtHome;
- (BOOL)checkForScheduledAutomation;
- (BOOL)noUserAtHome;
- (HMDAccessoryFirmwareUpdatePolicyCriteria)init;
- (HMDAccessoryFirmwareUpdateTimeWindow)updateTimeWindow;
- (NSArray)characteristicConfigurations;
- (void)setAnyUserAtHome:(BOOL)a3;
- (void)setCharacteristicConfigurations:(id)a3;
- (void)setCheckForScheduledAutomation:(BOOL)a3;
- (void)setNoUserAtHome:(BOOL)a3;
- (void)setUpdateTimeWindow:(id)a3;
@end

@implementation HMDAccessoryFirmwareUpdatePolicyCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimeWindow, 0);
  objc_storeStrong((id *)&self->_characteristicConfigurations, 0);
}

- (void)setUpdateTimeWindow:(id)a3
{
}

- (HMDAccessoryFirmwareUpdateTimeWindow)updateTimeWindow
{
  return (HMDAccessoryFirmwareUpdateTimeWindow *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCharacteristicConfigurations:(id)a3
{
}

- (NSArray)characteristicConfigurations
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCheckForScheduledAutomation:(BOOL)a3
{
  self->_checkForScheduledAutomation = a3;
}

- (BOOL)checkForScheduledAutomation
{
  return self->_checkForScheduledAutomation;
}

- (void)setAnyUserAtHome:(BOOL)a3
{
  self->_anyUserAtHome = a3;
}

- (BOOL)anyUserAtHome
{
  return self->_anyUserAtHome;
}

- (void)setNoUserAtHome:(BOOL)a3
{
  self->_noUserAtHome = a3;
}

- (BOOL)noUserAtHome
{
  return self->_noUserAtHome;
}

- (HMDAccessoryFirmwareUpdatePolicyCriteria)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAccessoryFirmwareUpdatePolicyCriteria;
  v2 = [(HMDAccessoryFirmwareUpdatePolicyCriteria *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF8C0] array];
    characteristicConfigurations = v2->_characteristicConfigurations;
    v2->_characteristicConfigurations = (NSArray *)v3;
  }
  return v2;
}

@end