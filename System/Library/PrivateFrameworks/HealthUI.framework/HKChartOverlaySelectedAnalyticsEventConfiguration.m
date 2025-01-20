@interface HKChartOverlaySelectedAnalyticsEventConfiguration
- (HKChartOverlaySelectedAnalyticsEventConfiguration)initWithEventName:(id)a3 previousContextItemPropertyName:(id)a4 currentContextItemPropertyName:(id)a5;
- (NSNumber)minimumAge;
- (NSString)currentContextItemPropertyName;
- (NSString)eventName;
- (NSString)featureIdentifier;
- (NSString)previousContextItemPropertyName;
- (OS_os_log)loggingCategory;
- (void)setFeatureIdentifier:(id)a3;
- (void)setLoggingCategory:(id)a3;
- (void)setMinimumAge:(id)a3;
@end

@implementation HKChartOverlaySelectedAnalyticsEventConfiguration

- (HKChartOverlaySelectedAnalyticsEventConfiguration)initWithEventName:(id)a3 previousContextItemPropertyName:(id)a4 currentContextItemPropertyName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKChartOverlaySelectedAnalyticsEventConfiguration;
  v12 = [(HKChartOverlaySelectedAnalyticsEventConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_eventName, a3);
    objc_storeStrong((id *)&v13->_previousContextItemPropertyName, a4);
    objc_storeStrong((id *)&v13->_currentContextItemPropertyName, a5);
    objc_storeStrong((id *)&v13->_loggingCategory, (id)*MEMORY[0x1E4F29FB0]);
  }

  return v13;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)previousContextItemPropertyName
{
  return self->_previousContextItemPropertyName;
}

- (NSString)currentContextItemPropertyName
{
  return self->_currentContextItemPropertyName;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (void)setLoggingCategory:(id)a3
{
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
}

- (NSNumber)minimumAge
{
  return self->_minimumAge;
}

- (void)setMinimumAge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumAge, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_currentContextItemPropertyName, 0);
  objc_storeStrong((id *)&self->_previousContextItemPropertyName, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end