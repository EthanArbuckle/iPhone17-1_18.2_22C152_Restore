@interface HMCharacteristicRequest
- (HMCharacteristic)characteristic;
- (HMCharacteristicRequest)initWithCharacteristic:(id)a3;
@end

@implementation HMCharacteristicRequest

- (void).cxx_destruct
{
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (HMCharacteristicRequest)initWithCharacteristic:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMCharacteristicRequest;
    v6 = [(HMRequestBase *)&v10 _init];
    v7 = v6;
    if (v6) {
      objc_storeStrong(v6 + 1, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end