@interface HMDBulletinCharacteristicTuple
+ (id)tupleWithServiceContextID:(id)a3 currentType:(id)a4 targetValue:(id)a5 targetStateNumber:(id)a6 changedByThisDevice:(BOOL)a7;
- (BOOL)changedByThisDevice;
- (HMDBulletinCharacteristicTuple)initWithServiceContextID:(id)a3 currentType:(id)a4 targetValue:(id)a5 targetStateNumber:(id)a6 changedByThisDevice:(BOOL)a7;
- (NSDate)lastPostingTime;
- (NSNumber)targetStateNumber;
- (NSString)currentType;
- (NSString)serviceContextID;
- (id)targetValue;
- (void)setLastPostingTime:(id)a3;
- (void)updatePostingTime;
@end

@implementation HMDBulletinCharacteristicTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetStateNumber, 0);
  objc_storeStrong((id *)&self->_lastPostingTime, 0);
  objc_storeStrong(&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_currentType, 0);
  objc_storeStrong((id *)&self->_serviceContextID, 0);
}

- (BOOL)changedByThisDevice
{
  return self->_changedByThisDevice;
}

- (NSNumber)targetStateNumber
{
  return self->_targetStateNumber;
}

- (void)setLastPostingTime:(id)a3
{
}

- (NSDate)lastPostingTime
{
  return self->_lastPostingTime;
}

- (id)targetValue
{
  return self->_targetValue;
}

- (NSString)currentType
{
  return self->_currentType;
}

- (NSString)serviceContextID
{
  return self->_serviceContextID;
}

- (void)updatePostingTime
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(HMDBulletinCharacteristicTuple *)self setLastPostingTime:v3];
}

- (HMDBulletinCharacteristicTuple)initWithServiceContextID:(id)a3 currentType:(id)a4 targetValue:(id)a5 targetStateNumber:(id)a6 changedByThisDevice:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDBulletinCharacteristicTuple;
  v17 = [(HMDBulletinCharacteristicTuple *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_serviceContextID, a3);
    objc_storeStrong((id *)&v18->_currentType, a4);
    objc_storeStrong(&v18->_targetValue, a5);
    uint64_t v19 = [MEMORY[0x263EFF910] distantPast];
    lastPostingTime = v18->_lastPostingTime;
    v18->_lastPostingTime = (NSDate *)v19;

    objc_storeStrong((id *)&v18->_targetStateNumber, a6);
    v18->_changedByThisDevice = a7;
  }

  return v18;
}

+ (id)tupleWithServiceContextID:(id)a3 currentType:(id)a4 targetValue:(id)a5 targetStateNumber:(id)a6 changedByThisDevice:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[HMDBulletinCharacteristicTuple alloc] initWithServiceContextID:v14 currentType:v13 targetValue:v12 targetStateNumber:v11 changedByThisDevice:v7];

  return v15;
}

@end