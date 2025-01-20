@interface HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent
+ (id)eventWithAutoThirdPartyUpdateEnable:(BOOL)a3 numHAPAccessories:(unint64_t)a4 numCameraAccessories:(unint64_t)a5 numCameraAccessoriesRecordingEnabled:(unint64_t)a6 numSecurityClassAccessories:(unint64_t)a7 numCriticalSensorAccessories:(unint64_t)a8;
+ (id)eventWithHome:(id)a3;
- (BOOL)autoThirdPartySoftwareUpdateEnable;
- (HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent)initWithAutoThirdPartyUpdateEnable:(BOOL)a3 numHAPAccessories:(unint64_t)a4 numCameraAccessories:(unint64_t)a5 numCameraAccessoriesRecordingEnabled:(unint64_t)a6 numSecurityClassAccessories:(unint64_t)a7 numCriticalSensorAccessories:(unint64_t)a8;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)numCameraAccessories;
- (unint64_t)numCameraAccessoriesRecordingEnabled;
- (unint64_t)numCriticalSensorAccessories;
- (unint64_t)numHAPAccessories;
- (unint64_t)numSecurityClassAccessories;
@end

@implementation HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent

- (unint64_t)numCriticalSensorAccessories
{
  return self->_numCriticalSensorAccessories;
}

- (unint64_t)numSecurityClassAccessories
{
  return self->_numSecurityClassAccessories;
}

- (unint64_t)numCameraAccessoriesRecordingEnabled
{
  return self->_numCameraAccessoriesRecordingEnabled;
}

- (unint64_t)numCameraAccessories
{
  return self->_numCameraAccessories;
}

- (unint64_t)numHAPAccessories
{
  return self->_numHAPAccessories;
}

- (BOOL)autoThirdPartySoftwareUpdateEnable
{
  return self->_autoThirdPartySoftwareUpdateEnable;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"autoThirdPartySoftwareUpdateEnable";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent autoThirdPartySoftwareUpdateEnable](self, "autoThirdPartySoftwareUpdateEnable"));
  v12[0] = v3;
  v11[1] = @"numHAPAccessories";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numHAPAccessories](self, "numHAPAccessories"));
  v12[1] = v4;
  v11[2] = @"numCameraAccessories";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numCameraAccessories](self, "numCameraAccessories"));
  v12[2] = v5;
  v11[3] = @"numCameraAccessoriesRecordingEnabled";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numCameraAccessoriesRecordingEnabled](self, "numCameraAccessoriesRecordingEnabled"));
  v12[3] = v6;
  v11[4] = @"numSecurityClassAccessories";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numSecurityClassAccessories](self, "numSecurityClassAccessories"));
  v12[4] = v7;
  v11[5] = @"numCriticalSensorAccessories";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numCriticalSensorAccessories](self, "numCriticalSensorAccessories"));
  v12[5] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];

  return (NSDictionary *)v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.accessory.softwareupdate.auto.thirdparty.toggled";
}

- (HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent)initWithAutoThirdPartyUpdateEnable:(BOOL)a3 numHAPAccessories:(unint64_t)a4 numCameraAccessories:(unint64_t)a5 numCameraAccessoriesRecordingEnabled:(unint64_t)a6 numSecurityClassAccessories:(unint64_t)a7 numCriticalSensorAccessories:(unint64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent;
  result = [(HMMLogEvent *)&v15 init];
  if (result)
  {
    result->_autoThirdPartySoftwareUpdateEnable = a3;
    result->_numHAPAccessories = a4;
    result->_numCameraAccessories = a5;
    result->_numCameraAccessoriesRecordingEnabled = a6;
    result->_numSecurityClassAccessories = a7;
    result->_numCriticalSensorAccessories = a8;
  }
  return result;
}

+ (id)eventWithHome:(id)a3
{
  id v3 = a3;
  v4 = [v3 accessoryCount];
  uint64_t v5 = [v3 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];

  v6 = +[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent eventWithAutoThirdPartyUpdateEnable:numHAPAccessories:numCameraAccessories:numCameraAccessoriesRecordingEnabled:numSecurityClassAccessories:numCriticalSensorAccessories:](HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent, "eventWithAutoThirdPartyUpdateEnable:numHAPAccessories:numCameraAccessories:numCameraAccessoriesRecordingEnabled:numSecurityClassAccessories:numCriticalSensorAccessories:", v5, [v4 numHAPAccessories], objc_msgSend(v4, "numCameraAccessories"), objc_msgSend(v4, "numCameraAccessoriesRecordingEnabled"), objc_msgSend(v4, "numSecurityClassAccessories"), objc_msgSend(v4, "numCriticalSensorAccessories"));

  return v6;
}

+ (id)eventWithAutoThirdPartyUpdateEnable:(BOOL)a3 numHAPAccessories:(unint64_t)a4 numCameraAccessories:(unint64_t)a5 numCameraAccessoriesRecordingEnabled:(unint64_t)a6 numSecurityClassAccessories:(unint64_t)a7 numCriticalSensorAccessories:(unint64_t)a8
{
  v8 = [[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent alloc] initWithAutoThirdPartyUpdateEnable:a3 numHAPAccessories:a4 numCameraAccessories:a5 numCameraAccessoriesRecordingEnabled:a6 numSecurityClassAccessories:a7 numCriticalSensorAccessories:a8];
  return v8;
}

@end