@interface HMDCameraSnapshotNotificationTimer
- (HMDCameraSnapshotNotificationTimer)initWithCameraSessionID:(id)a3 changedCharacteristics:(id)a4 timeInterval:(double)a5;
- (NSArray)postedBulletins;
- (NSSet)changedCharacteristics;
- (NSString)sessionID;
- (void)setPostedBulletins:(id)a3;
@end

@implementation HMDCameraSnapshotNotificationTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postedBulletins, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_changedCharacteristics, 0);
}

- (void)setPostedBulletins:(id)a3
{
}

- (NSArray)postedBulletins
{
  return self->_postedBulletins;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSSet)changedCharacteristics
{
  return self->_changedCharacteristics;
}

- (HMDCameraSnapshotNotificationTimer)initWithCameraSessionID:(id)a3 changedCharacteristics:(id)a4 timeInterval:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraSnapshotNotificationTimer;
  v11 = [(HMFTimer *)&v14 initWithTimeInterval:0 options:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_changedCharacteristics, a4);
    objc_storeStrong((id *)&v12->_sessionID, a3);
  }

  return v12;
}

@end