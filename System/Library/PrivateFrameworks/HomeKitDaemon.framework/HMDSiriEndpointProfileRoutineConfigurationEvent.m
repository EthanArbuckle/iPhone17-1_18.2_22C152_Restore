@interface HMDSiriEndpointProfileRoutineConfigurationEvent
- (HMDSiriEndpointProfileAccessorySettingFields)accessorySettingFields;
- (HMDSiriEndpointProfileFields)profileFields;
- (HMDSiriEndpointProfileRoutineConfigurationEvent)initWithAccessoryCategoryType:(id)a3 profileFields:(id)a4 accessorySettingFields:(id)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)accessoryCategoryType;
- (NSString)coreAnalyticsEventName;
- (id)attributeDescriptions;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDSiriEndpointProfileRoutineConfigurationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySettingFields, 0);
  objc_storeStrong((id *)&self->_profileFields, 0);
  objc_storeStrong((id *)&self->_accessoryCategoryType, 0);
}

- (HMDSiriEndpointProfileAccessorySettingFields)accessorySettingFields
{
  return (HMDSiriEndpointProfileAccessorySettingFields *)objc_getProperty(self, a2, 56, 1);
}

- (HMDSiriEndpointProfileFields)profileFields
{
  return (HMDSiriEndpointProfileFields *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)accessoryCategoryType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDSiriEndpointProfileRoutineConfigurationEvent *)self accessoryCategoryType];
  v5 = (void *)[v3 initWithName:@"accessoryCategoryType" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDSiriEndpointProfileRoutineConfigurationEvent *)self profileFields];
  v8 = (void *)[v6 initWithName:@"profileFields" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDSiriEndpointProfileRoutineConfigurationEvent *)self accessorySettingFields];
  v11 = (void *)[v9 initWithName:@"accessorySettingFields" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.HMDSiriEndpointProfileRoutineConfigurationEvent";
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v12 = @"accessoryCategoryType";
  v4 = [(HMDSiriEndpointProfileRoutineConfigurationEvent *)self accessoryCategoryType];
  v13[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v3 addEntriesFromDictionary:v5];

  id v6 = [(HMDSiriEndpointProfileRoutineConfigurationEvent *)self profileFields];
  v7 = [v6 serializeFields];
  [v3 addEntriesFromDictionary:v7];

  v8 = [(HMDSiriEndpointProfileRoutineConfigurationEvent *)self accessorySettingFields];
  id v9 = [v8 serializeFields];
  [v3 addEntriesFromDictionary:v9];

  v10 = (void *)[v3 copy];
  return (NSDictionary *)v10;
}

- (HMDSiriEndpointProfileRoutineConfigurationEvent)initWithAccessoryCategoryType:(id)a3 profileFields:(id)a4 accessorySettingFields:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v16 = (HMDCameraSignificantEventNotificationRecord *)_HMFPreconditionFailure();
    [(HMDCameraSignificantEventNotificationRecord *)v16 .cxx_destruct];
    return result;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDSiriEndpointProfileRoutineConfigurationEvent;
  v13 = [(HMMLogEvent *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accessoryCategoryType, a3);
    objc_storeStrong((id *)&v14->_profileFields, a4);
    objc_storeStrong((id *)&v14->_accessorySettingFields, a5);
  }

  return v14;
}

@end