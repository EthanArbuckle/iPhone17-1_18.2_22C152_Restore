@interface HMDCharacteristicValueUpdate
- (HMDCharacteristicValueUpdate)initWithError:(id)a3;
- (HMDCharacteristicValueUpdate)initWithValue:(id)a3 updateIdentifier:(id)a4 remoteDevice:(id)a5;
- (HMDDevice)remoteDevice;
- (NSDate)valueUpdatedTime;
- (NSError)error;
- (NSNumber)valueUpdatedStateNumber;
- (NSString)updateIdentifier;
- (NSUUID)attributedUserUUID;
- (id)value;
- (void)setValueUpdatedTime:(id)a3 stateNumber:(id)a4 attributedUserUUID:(id)a5;
@end

@implementation HMDCharacteristicValueUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedUserUUID, 0);
  objc_storeStrong((id *)&self->_valueUpdatedStateNumber, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong(&self->_value, 0);
}

- (NSUUID)attributedUserUUID
{
  return self->_attributedUserUUID;
}

- (NSNumber)valueUpdatedStateNumber
{
  return self->_valueUpdatedStateNumber;
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (HMDDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)updateIdentifier
{
  return self->_updateIdentifier;
}

- (id)value
{
  return self->_value;
}

- (void)setValueUpdatedTime:(id)a3 stateNumber:(id)a4 attributedUserUUID:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v12)
  {
    v10 = (NSDate *)v12;
  }
  else
  {
    v10 = [MEMORY[0x263EFF910] date];
  }
  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v10;

  if (v8) {
    objc_storeStrong((id *)&self->_valueUpdatedStateNumber, a4);
  }
  if (v9) {
    objc_storeStrong((id *)&self->_attributedUserUUID, a5);
  }
}

- (HMDCharacteristicValueUpdate)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicValueUpdate;
  v6 = [(HMDCharacteristicValueUpdate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (HMDCharacteristicValueUpdate)initWithValue:(id)a3 updateIdentifier:(id)a4 remoteDevice:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCharacteristicValueUpdate;
  id v12 = [(HMDCharacteristicValueUpdate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_value, a3);
    objc_storeStrong((id *)&v13->_updateIdentifier, a4);
    objc_storeStrong((id *)&v13->_remoteDevice, a5);
  }

  return v13;
}

@end