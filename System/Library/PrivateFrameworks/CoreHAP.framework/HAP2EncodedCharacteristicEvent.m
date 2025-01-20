@interface HAP2EncodedCharacteristicEvent
+ (id)new;
- (HAP2AccessoryCharacteristicEncodedData)encodedValueData;
- (HAP2EncodedCharacteristicEvent)init;
- (HAP2EncodedCharacteristicEvent)initWithInstanceID:(id)a3 encodedValueData:(id)a4 encodedContextData:(id)a5;
- (NSData)encodedContextData;
- (NSNumber)instanceID;
@end

@implementation HAP2EncodedCharacteristicEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedContextData, 0);
  objc_storeStrong((id *)&self->_encodedValueData, 0);

  objc_storeStrong((id *)&self->_instanceID, 0);
}

- (NSData)encodedContextData
{
  return self->_encodedContextData;
}

- (HAP2AccessoryCharacteristicEncodedData)encodedValueData
{
  return self->_encodedValueData;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (HAP2EncodedCharacteristicEvent)initWithInstanceID:(id)a3 encodedValueData:(id)a4 encodedContextData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAP2EncodedCharacteristicEvent;
  v12 = [(HAP2EncodedCharacteristicEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_instanceID, a3);
    objc_storeStrong((id *)&v13->_encodedValueData, a4);
    objc_storeStrong((id *)&v13->_encodedContextData, a5);
  }

  return v13;
}

- (HAP2EncodedCharacteristicEvent)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end