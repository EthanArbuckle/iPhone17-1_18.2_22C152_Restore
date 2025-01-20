@interface HAPCharacteristicWriteRequestTuple
+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8;
+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8 contextData:(id)a9;
- (BOOL)includeResponseValue;
- (BOOL)timedWrite;
- (HAPCharacteristic)characteristic;
- (NSData)authorizationData;
- (NSData)contextData;
- (NSNumber)enableEvents;
- (NSString)description;
- (NSUUID)hmdAccessoryUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initialValue;
- (id)value;
- (unint64_t)writeType;
- (void)setAuthorizationData:(id)a3;
- (void)setCharacteristic:(id)a3;
- (void)setContextData:(id)a3;
- (void)setEnableEvents:(id)a3;
- (void)setHmdAccessoryUUID:(id)a3;
- (void)setIncludeResponseValue:(BOOL)a3;
- (void)setInitialValue:(id)a3;
- (void)setTimedWrite:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setWriteType:(unint64_t)a3;
@end

@implementation HAPCharacteristicWriteRequestTuple

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(HAPCharacteristicWriteRequestTuple *)self value];
  if (([v5 conformsToProtocol:&unk_1F2C83AA8] & 1) == 0)
  {

    goto LABEL_5;
  }
  v6 = [(HAPCharacteristicWriteRequestTuple *)self value];

  if (!v6)
  {
LABEL_5:
    v6 = [(HAPCharacteristicWriteRequestTuple *)self value];
    uint64_t v7 = [v6 copy];
    goto LABEL_6;
  }
  uint64_t v7 = [v6 copyWithZone:a3];
LABEL_6:
  v23 = (void *)v7;

  v8 = objc_opt_class();
  v22 = [(HAPCharacteristicWriteRequestTuple *)self characteristic];
  v9 = (void *)[v22 copyWithZone:a3];
  v10 = [(HAPCharacteristicWriteRequestTuple *)self authorizationData];
  v11 = (void *)[v10 copyWithZone:a3];
  BOOL v12 = [(HAPCharacteristicWriteRequestTuple *)self timedWrite];
  BOOL v13 = [(HAPCharacteristicWriteRequestTuple *)self includeResponseValue];
  unint64_t v14 = [(HAPCharacteristicWriteRequestTuple *)self writeType];
  v15 = [(HAPCharacteristicWriteRequestTuple *)self contextData];
  v21 = a3;
  v16 = (void *)[v15 copyWithZone:a3];
  v17 = [v8 writeRequestTupleForCharacteristic:v9 value:v23 authorizationData:v11 timedWrite:v12 responseValue:v13 type:v14 contextData:v16];

  v18 = [(HAPCharacteristicWriteRequestTuple *)self enableEvents];
  v19 = (void *)[v18 copyWithZone:v21];
  [v17 setEnableEvents:v19];

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_hmdAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_enableEvents, 0);
  objc_storeStrong((id *)&self->_authorizationData, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (void)setInitialValue:(id)a3
{
}

- (id)initialValue
{
  return self->_initialValue;
}

- (void)setHmdAccessoryUUID:(id)a3
{
}

- (NSUUID)hmdAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContextData:(id)a3
{
}

- (NSData)contextData
{
  return self->_contextData;
}

- (void)setEnableEvents:(id)a3
{
}

- (NSNumber)enableEvents
{
  return self->_enableEvents;
}

- (void)setIncludeResponseValue:(BOOL)a3
{
  self->_includeResponseValue = a3;
}

- (BOOL)includeResponseValue
{
  return self->_includeResponseValue;
}

- (void)setWriteType:(unint64_t)a3
{
  self->_writeType = a3;
}

- (unint64_t)writeType
{
  return self->_writeType;
}

- (void)setTimedWrite:(BOOL)a3
{
  self->_timedWrite = a3;
}

- (BOOL)timedWrite
{
  return self->_timedWrite;
}

- (void)setAuthorizationData:(id)a3
{
}

- (NSData)authorizationData
{
  return self->_authorizationData;
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setCharacteristic:(id)a3
{
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (NSString)description
{
  v3 = [(HAPCharacteristicWriteRequestTuple *)self characteristic];
  v4 = [v3 service];
  v5 = [v4 accessory];
  v19 = [v5 uniqueIdentifier];

  v6 = NSString;
  uint64_t v17 = objc_opt_class();
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAPCharacteristicWriteRequestTuple writeType](self, "writeType"));
  v20 = [(HAPCharacteristicWriteRequestTuple *)self characteristic];
  v18 = [v20 type];
  v8 = HAPShortUUIDType(v18);
  v9 = [(HAPCharacteristicWriteRequestTuple *)self characteristic];
  v10 = [v9 instanceID];
  v11 = [(HAPCharacteristicWriteRequestTuple *)self characteristic];
  BOOL v12 = [v11 stateNumber];
  BOOL v13 = [(HAPCharacteristicWriteRequestTuple *)self initialValue];
  unint64_t v14 = [(HAPCharacteristicWriteRequestTuple *)self value];
  v15 = [v6 stringWithFormat:@"%@(%@): %@/%@/%@/%@ %@->%@", v17, v7, v19, v8, v10, v12, v13, v14];

  return (NSString *)v15;
}

+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8 contextData:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  v18 = objc_alloc_init(HAPCharacteristicWriteRequestTuple);
  v19 = v18;
  if (v18)
  {
    [(HAPCharacteristicWriteRequestTuple *)v18 setCharacteristic:v14];
    v20 = [v14 value];
    [(HAPCharacteristicWriteRequestTuple *)v19 setInitialValue:v20];

    [(HAPCharacteristicWriteRequestTuple *)v19 setValue:v15];
    [(HAPCharacteristicWriteRequestTuple *)v19 setAuthorizationData:v16];
    [(HAPCharacteristicWriteRequestTuple *)v19 setTimedWrite:v11];
    [(HAPCharacteristicWriteRequestTuple *)v19 setIncludeResponseValue:v10];
    [(HAPCharacteristicWriteRequestTuple *)v19 setWriteType:a8];
    [(HAPCharacteristicWriteRequestTuple *)v19 setContextData:v17];
  }

  return v19;
}

+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8
{
  return (id)[a1 writeRequestTupleForCharacteristic:a3 value:a4 authorizationData:a5 timedWrite:a6 responseValue:a7 type:a8 contextData:0];
}

@end