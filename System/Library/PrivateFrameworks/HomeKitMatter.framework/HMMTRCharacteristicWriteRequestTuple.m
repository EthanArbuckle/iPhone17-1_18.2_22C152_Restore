@interface HMMTRCharacteristicWriteRequestTuple
- (HAPCharacteristicWriteRequestTuple)primary;
- (HAPCharacteristicWriteRequestTuple)secondary;
- (HMMTRCharacteristicWriteRequestTuple)initWithRequestTuple:(id)a3;
- (unint64_t)characteristicHandlingType;
- (void)setCharacteristicHandlingType:(unint64_t)a3;
- (void)setPrimary:(id)a3;
- (void)setSecondary:(id)a3;
@end

@implementation HMMTRCharacteristicWriteRequestTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_primary, 0);
}

- (void)setSecondary:(id)a3
{
}

- (HAPCharacteristicWriteRequestTuple)secondary
{
  return self->_secondary;
}

- (void)setPrimary:(id)a3
{
}

- (HAPCharacteristicWriteRequestTuple)primary
{
  return self->_primary;
}

- (void)setCharacteristicHandlingType:(unint64_t)a3
{
  self->_characteristicHandlingType = a3;
}

- (unint64_t)characteristicHandlingType
{
  return self->_characteristicHandlingType;
}

- (HMMTRCharacteristicWriteRequestTuple)initWithRequestTuple:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTRCharacteristicWriteRequestTuple;
  v6 = [(HMMTRCharacteristicWriteRequestTuple *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_characteristicHandlingType = 0;
    objc_storeStrong((id *)&v6->_primary, a3);
    secondary = v7->_secondary;
    v7->_secondary = 0;
  }
  return v7;
}

@end