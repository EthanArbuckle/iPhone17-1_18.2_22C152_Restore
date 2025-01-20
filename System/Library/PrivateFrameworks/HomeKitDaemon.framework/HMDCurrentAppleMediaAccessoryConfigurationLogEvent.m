@interface HMDCurrentAppleMediaAccessoryConfigurationLogEvent
- (HMDCurrentAppleMediaAccessoryConfigurationLogEvent)initWithNumPairedSensors:(id)a3 sensorStatus:(id)a4 numPairedSensorAutomations:(id)a5 numMediaAutomations:(id)a6;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)numMediaAutomations;
- (NSNumber)numPairedSensorAutomations;
- (NSNumber)numPairedSensors;
- (NSNumber)sensorStatus;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCurrentAppleMediaAccessoryConfigurationLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numMediaAutomations, 0);
  objc_storeStrong((id *)&self->_numPairedSensorAutomations, 0);
  objc_storeStrong((id *)&self->_sensorStatus, 0);
  objc_storeStrong((id *)&self->_numPairedSensors, 0);
}

- (NSNumber)numMediaAutomations
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)numPairedSensorAutomations
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)sensorStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)numPairedSensors
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDCurrentAppleMediaAccessoryConfigurationLogEvent *)self numPairedSensors];
  [v3 setObject:v4 forKeyedSubscript:@"numPairedHomePodSensors"];

  v5 = [(HMDCurrentAppleMediaAccessoryConfigurationLogEvent *)self sensorStatus];
  [v3 setObject:v5 forKeyedSubscript:@"homePodSensorStatus"];

  v6 = [(HMDCurrentAppleMediaAccessoryConfigurationLogEvent *)self numPairedSensorAutomations];
  [v3 setObject:v6 forKeyedSubscript:@"numPairedHomePodSensorAutomations"];

  v7 = [(HMDCurrentAppleMediaAccessoryConfigurationLogEvent *)self numMediaAutomations];
  [v3 setObject:v7 forKeyedSubscript:@"numMediaAutomations"];

  v8 = (void *)[v3 copy];
  return (NSDictionary *)v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homekit.accessory.applemedia.configuration";
}

- (HMDCurrentAppleMediaAccessoryConfigurationLogEvent)initWithNumPairedSensors:(id)a3 sensorStatus:(id)a4 numPairedSensorAutomations:(id)a5 numMediaAutomations:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDCurrentAppleMediaAccessoryConfigurationLogEvent;
  v14 = [(HMMLogEvent *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    numPairedSensors = v14->_numPairedSensors;
    v14->_numPairedSensors = (NSNumber *)v15;

    uint64_t v17 = [v11 copy];
    sensorStatus = v14->_sensorStatus;
    v14->_sensorStatus = (NSNumber *)v17;

    uint64_t v19 = [v12 copy];
    numPairedSensorAutomations = v14->_numPairedSensorAutomations;
    v14->_numPairedSensorAutomations = (NSNumber *)v19;

    uint64_t v21 = [v13 copy];
    numMediaAutomations = v14->_numMediaAutomations;
    v14->_numMediaAutomations = (NSNumber *)v21;
  }
  return v14;
}

@end