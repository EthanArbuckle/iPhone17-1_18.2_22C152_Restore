@interface HMCharacteristicReadRequest
+ (id)readRequestWithCharacteristic:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMCharacteristicReadRequest)initWithCharacteristic:(id)a3;
- (unint64_t)hash;
@end

@implementation HMCharacteristicReadRequest

+ (id)readRequestWithCharacteristic:(id)a3
{
  id v3 = a3;
  v4 = [[HMCharacteristicReadRequest alloc] initWithCharacteristic:v3];

  return v4;
}

- (HMCharacteristicReadRequest)initWithCharacteristic:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMCharacteristicReadRequest;
  return [(HMCharacteristicRequest *)&v4 initWithCharacteristic:a3];
}

- (unint64_t)hash
{
  v2 = [(HMCharacteristicRequest *)self characteristic];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (HMCharacteristicReadRequest *)a3;
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

@end