@interface HAPCharacteristicTuple
- (HAPCharacteristic)hapCharacteristic;
- (HAPCharacteristicTuple)initWithHAPCharacteristic:(id)a3 serverIdentifier:(id)a4 linkType:(int64_t)a5;
- (NSString)serverIdentifier;
- (int64_t)linkType;
- (void)setHapCharacteristic:(id)a3;
- (void)setLinkType:(int64_t)a3;
- (void)setServerIdentifier:(id)a3;
@end

@implementation HAPCharacteristicTuple

- (HAPCharacteristic)hapCharacteristic
{
  return self->_hapCharacteristic;
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (HAPCharacteristicTuple)initWithHAPCharacteristic:(id)a3 serverIdentifier:(id)a4 linkType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HAPCharacteristicTuple;
  v11 = [(HAPCharacteristicTuple *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_hapCharacteristic, a3);
    objc_storeStrong((id *)&v12->_serverIdentifier, a4);
    v12->_linkType = a5;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_hapCharacteristic, 0);
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (void)setServerIdentifier:(id)a3
{
}

- (void)setHapCharacteristic:(id)a3
{
}

@end