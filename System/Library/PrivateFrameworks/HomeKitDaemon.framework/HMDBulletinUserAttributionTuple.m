@interface HMDBulletinUserAttributionTuple
- (NSDate)lastKnownValueUpdateTime;
- (NSNumber)targetCharacteristicInstanceID;
- (NSUUID)userUUID;
- (id)value;
- (void)setLastKnownValueUpdateTime:(id)a3;
- (void)setTargetCharacteristicInstanceID:(id)a3;
- (void)setUserUUID:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation HMDBulletinUserAttributionTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_lastKnownValueUpdateTime, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_targetCharacteristicInstanceID, 0);
}

- (void)setUserUUID:(id)a3
{
}

- (NSUUID)userUUID
{
  return self->_userUUID;
}

- (void)setLastKnownValueUpdateTime:(id)a3
{
}

- (NSDate)lastKnownValueUpdateTime
{
  return self->_lastKnownValueUpdateTime;
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setTargetCharacteristicInstanceID:(id)a3
{
}

- (NSNumber)targetCharacteristicInstanceID
{
  return self->_targetCharacteristicInstanceID;
}

@end