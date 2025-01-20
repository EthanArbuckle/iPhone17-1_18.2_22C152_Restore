@interface HMCharacteristicWriteRequest
+ (id)writeRequestWithCharacteristic:(id)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HMCharacteristicWriteRequest)initWithCharacteristic:(id)a3 value:(id)a4;
- (NSCopying)value;
- (unint64_t)hash;
@end

@implementation HMCharacteristicWriteRequest

- (void).cxx_destruct
{
}

- (NSCopying)value
{
  return self->_value;
}

- (unint64_t)hash
{
  v2 = [(HMCharacteristicRequest *)self characteristic];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMCharacteristicWriteRequest *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMCharacteristicRequest *)self characteristic];
      v8 = [(HMCharacteristicRequest *)v6 characteristic];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (HMCharacteristicWriteRequest)initWithCharacteristic:(id)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMCharacteristicWriteRequest;
  v8 = [(HMCharacteristicRequest *)&v11 initWithCharacteristic:a3];
  char v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

+ (id)writeRequestWithCharacteristic:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMCharacteristicWriteRequest alloc] initWithCharacteristic:v6 value:v5];

  return v7;
}

@end