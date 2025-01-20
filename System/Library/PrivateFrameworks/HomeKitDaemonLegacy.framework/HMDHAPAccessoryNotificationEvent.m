@interface HMDHAPAccessoryNotificationEvent
- (BOOL)isThreadAccessory:(id)a3;
- (HMDCharacteristic)characteristic;
- (HMDHAPAccessory)accessory;
- (HMDHAPAccessoryNotificationEvent)initWithAccessory:(id)a3 characteristic:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)accessoryIdentifier;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDHAPAccessoryNotificationEvent

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_characteristic);
  objc_destroyWeak((id *)&self->_accessory);
}

- (HMDCharacteristic)characteristic
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_characteristic);
  return (HMDCharacteristic *)WeakRetained;
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (NSString)accessoryIdentifier
{
  v2 = [(HMDHAPAccessoryNotificationEvent *)self accessory];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(HMDHAPAccessoryNotificationEvent *)self accessory];
  v5 = [(HMDHAPAccessoryNotificationEvent *)self characteristic];
  BOOL v6 = [(HMDHAPAccessoryNotificationEvent *)self isThreadAccessory:v4];
  if ([v4 hasIPLink])
  {
    v7 = @"IP";
  }
  else if ([v4 hasBTLELink])
  {
    v7 = @"BLE";
  }
  else
  {
    v7 = @"unknown link type";
  }
  v8 = [v5 type];
  [v3 setObject:v8 forKeyedSubscript:@"characteristicType"];

  v9 = [v5 service];
  v10 = [v9 type];
  [v3 setObject:v10 forKeyedSubscript:@"serviceType"];

  [v3 setObject:v7 forKey:@"linkType"];
  v11 = [NSNumber numberWithBool:v6];
  [v3 setObject:v11 forKey:@"isThread"];

  v12 = (void *)[v3 copy];
  return (NSDictionary *)v12;
}

- (BOOL)isThreadAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 transportInformationInstances];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "hapAccessory", (void)v16);
        v10 = [v9 server];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v11 = v10;
        }
        else {
          v11 = 0;
        }
        id v12 = v11;

        if (v12)
        {

LABEL_16:
          BOOL v14 = 1;
          goto LABEL_17;
        }
        v13 = [v3 findServiceWithServiceType:@"00000701-0000-1000-8000-0026BB765291"];

        if (v13) {
          goto LABEL_16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v14 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_17:

  return v14;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.accessoryNotification";
}

- (HMDHAPAccessoryNotificationEvent)initWithAccessory:(id)a3 characteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDHAPAccessoryNotificationEvent;
  v8 = [(HMMLogEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeWeak((id *)&v9->_characteristic, v7);
  }

  return v9;
}

@end