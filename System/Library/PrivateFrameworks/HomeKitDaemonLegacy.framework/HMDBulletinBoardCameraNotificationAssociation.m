@interface HMDBulletinBoardCameraNotificationAssociation
- (HMDBulletinBoardCameraNotificationAssociation)initWithCameraProfile:(id)a3;
- (HMDCameraProfile)cameraProfile;
- (NSMutableSet)notificationGeneratingServicesWithCamera;
- (id)description;
@end

@implementation HMDBulletinBoardCameraNotificationAssociation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationGeneratingServicesWithCamera, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

- (NSMutableSet)notificationGeneratingServicesWithCamera
{
  return self->_notificationGeneratingServicesWithCamera;
}

- (HMDCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDBulletinBoardCameraNotificationAssociation *)self cameraProfile];
  v5 = [(HMDBulletinBoardCameraNotificationAssociation *)self notificationGeneratingServicesWithCamera];
  v6 = [v3 stringWithFormat:@"Camera %@, Notification Services with Camera %@", v4, v5];

  return v6;
}

- (HMDBulletinBoardCameraNotificationAssociation)initWithCameraProfile:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDBulletinBoardCameraNotificationAssociation;
  v6 = [(HMDBulletinBoardCameraNotificationAssociation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cameraProfile, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    notificationGeneratingServicesWithCamera = v7->_notificationGeneratingServicesWithCamera;
    v7->_notificationGeneratingServicesWithCamera = (NSMutableSet *)v8;
  }
  return v7;
}

@end