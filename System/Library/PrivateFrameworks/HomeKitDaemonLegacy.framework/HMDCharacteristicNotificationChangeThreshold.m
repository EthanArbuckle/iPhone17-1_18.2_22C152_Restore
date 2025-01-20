@interface HMDCharacteristicNotificationChangeThreshold
- (HMDCharacteristic)characteristic;
- (HMDCharacteristicNotificationChangeThreshold)initWithCharacteristic:(id)a3 threshold:(id)a4;
- (NSNumber)threshold;
- (void)setCharacteristic:(id)a3;
- (void)setThreshold:(id)a3;
@end

@implementation HMDCharacteristicNotificationChangeThreshold

- (HMDCharacteristic)characteristic
{
  return self->_characteristic;
}

- (HMDCharacteristicNotificationChangeThreshold)initWithCharacteristic:(id)a3 threshold:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCharacteristicNotificationChangeThreshold;
  v9 = [(HMDCharacteristicNotificationChangeThreshold *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_characteristic, a3);
    uint64_t v11 = [v8 copy];
    threshold = v10->_threshold;
    v10->_threshold = (NSNumber *)v11;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (NSNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
}

- (void)setCharacteristic:(id)a3
{
}

@end