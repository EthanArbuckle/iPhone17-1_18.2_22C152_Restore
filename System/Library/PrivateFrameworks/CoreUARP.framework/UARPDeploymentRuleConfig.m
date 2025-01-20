@interface UARPDeploymentRuleConfig
- (NSArray)countryList;
- (NSDate)goLiveDate;
- (NSNumber)deploymentLimit;
- (NSNumber)rampPeriod;
- (void)setCountryList:(id)a3;
- (void)setDeploymentLimit:(id)a3;
- (void)setGoLiveDate:(id)a3;
- (void)setRampPeriod:(id)a3;
@end

@implementation UARPDeploymentRuleConfig

- (NSDate)goLiveDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGoLiveDate:(id)a3
{
}

- (NSArray)countryList
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCountryList:(id)a3
{
}

- (NSNumber)rampPeriod
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRampPeriod:(id)a3
{
}

- (NSNumber)deploymentLimit
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeploymentLimit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentLimit, 0);
  objc_storeStrong((id *)&self->_rampPeriod, 0);
  objc_storeStrong((id *)&self->_countryList, 0);
  objc_storeStrong((id *)&self->_goLiveDate, 0);
}

@end