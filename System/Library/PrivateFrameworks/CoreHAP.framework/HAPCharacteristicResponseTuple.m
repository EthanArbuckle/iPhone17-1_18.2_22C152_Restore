@interface HAPCharacteristicResponseTuple
+ (id)responseTupleForCharacteristic:(id)a3 error:(id)a4;
- (HAPCharacteristic)characteristic;
- (NSData)notificationContext;
- (NSDate)valueUpdatedTime;
- (NSError)error;
- (NSNumber)stateNumber;
- (id)description;
- (id)value;
- (void)setCharacteristic:(id)a3;
- (void)setError:(id)a3;
- (void)setNotificationContext:(id)a3;
- (void)setStateNumber:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueUpdatedTime:(id)a3;
@end

@implementation HAPCharacteristicResponseTuple

- (NSError)error
{
  return self->_error;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

+ (id)responseTupleForCharacteristic:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(HAPCharacteristicResponseTuple);
  v8 = v7;
  if (v7)
  {
    [(HAPCharacteristicResponseTuple *)v7 setCharacteristic:v5];
    v9 = [v5 value];
    [(HAPCharacteristicResponseTuple *)v8 setValue:v9];

    v10 = [v5 valueUpdatedTime];
    [(HAPCharacteristicResponseTuple *)v8 setValueUpdatedTime:v10];

    v11 = [v5 stateNumber];
    [(HAPCharacteristicResponseTuple *)v8 setStateNumber:v11];

    v12 = [v5 notificationContext];
    [(HAPCharacteristicResponseTuple *)v8 setNotificationContext:v12];

    [(HAPCharacteristicResponseTuple *)v8 setError:v6];
  }

  return v8;
}

- (void)setValueUpdatedTime:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (void)setStateNumber:(id)a3
{
}

- (void)setNotificationContext:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (void)setCharacteristic:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (NSData)notificationContext
{
  return self->_notificationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (id)description
{
  v3 = [(HAPCharacteristicResponseTuple *)self characteristic];
  v4 = [v3 service];
  id v5 = [v4 accessory];
  v18 = [v5 uniqueIdentifier];

  v17 = NSString;
  uint64_t v6 = objc_opt_class();
  v19 = [(HAPCharacteristicResponseTuple *)self characteristic];
  v7 = [v19 type];
  v8 = HAPShortUUIDType(v7);
  v9 = [(HAPCharacteristicResponseTuple *)self characteristic];
  v10 = [v9 instanceID];
  v11 = [(HAPCharacteristicResponseTuple *)self stateNumber];
  v12 = [(HAPCharacteristicResponseTuple *)self value];
  v13 = [(HAPCharacteristicResponseTuple *)self valueUpdatedTime];
  v14 = [(HAPCharacteristicResponseTuple *)self error];
  v15 = [v17 stringWithFormat:@"%@: %@/%@/%@/%@ %@/%@/%@", v6, v18, v8, v10, v11, v12, v13, v14];

  return v15;
}

@end