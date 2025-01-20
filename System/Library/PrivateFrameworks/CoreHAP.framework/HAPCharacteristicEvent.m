@interface HAPCharacteristicEvent
+ (id)eventWithCharacteristic:(id)a3;
- (HAPCharacteristicEvent)init;
- (HAPCharacteristicEvent)initWithCharacteristic:(id)a3;
- (NSDate)updateTime;
- (NSNumber)accessoryInstanceID;
- (NSNumber)characteristicInstanceID;
- (NSNumber)serviceInstanceID;
- (NSNumber)stateNumber;
- (NSString)serverIdentifier;
- (id)value;
@end

@implementation HAPCharacteristicEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_updateTime, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceID, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_accessoryInstanceID, 0);

  objc_storeStrong((id *)&self->_serverIdentifier, 0);
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (NSDate)updateTime
{
  return self->_updateTime;
}

- (id)value
{
  return self->_value;
}

- (NSNumber)characteristicInstanceID
{
  return self->_characteristicInstanceID;
}

- (NSNumber)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (NSNumber)accessoryInstanceID
{
  return self->_accessoryInstanceID;
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (HAPCharacteristicEvent)init
{
  return 0;
}

- (HAPCharacteristicEvent)initWithCharacteristic:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HAPCharacteristicEvent;
  v5 = [(HAPCharacteristicEvent *)&v23 init];
  if (v5)
  {
    v6 = [v4 service];
    v7 = [v6 accessory];
    uint64_t v8 = [v7 serverIdentifier];
    serverIdentifier = v5->_serverIdentifier;
    v5->_serverIdentifier = (NSString *)v8;

    uint64_t v10 = [v7 instanceID];
    accessoryInstanceID = v5->_accessoryInstanceID;
    v5->_accessoryInstanceID = (NSNumber *)v10;

    uint64_t v12 = [v6 instanceID];
    serviceInstanceID = v5->_serviceInstanceID;
    v5->_serviceInstanceID = (NSNumber *)v12;

    uint64_t v14 = [v4 instanceID];
    characteristicInstanceID = v5->_characteristicInstanceID;
    v5->_characteristicInstanceID = (NSNumber *)v14;

    uint64_t v16 = [v4 value];
    id value = v5->_value;
    v5->_id value = (id)v16;

    uint64_t v18 = [v4 stateNumber];
    stateNumber = v5->_stateNumber;
    v5->_stateNumber = (NSNumber *)v18;

    uint64_t v20 = [v4 valueUpdatedTime];
    updateTime = v5->_updateTime;
    v5->_updateTime = (NSDate *)v20;
  }
  return v5;
}

+ (id)eventWithCharacteristic:(id)a3
{
  id v3 = a3;
  id v4 = [[HAPCharacteristicEvent alloc] initWithCharacteristic:v3];

  return v4;
}

@end