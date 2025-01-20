@interface HKClinicalSharingStatus
- (HKClinicalSharingStatus)clinicalSharingStatusWithFeatureStatus:(int64_t)a3;
@end

@implementation HKClinicalSharingStatus

- (HKClinicalSharingStatus)clinicalSharingStatusWithFeatureStatus:(int64_t)a3
{
  id v5 = objc_alloc((Class)HKClinicalSharingStatus);
  v6 = [(HKClinicalSharingStatus *)self firstSharedDate];
  v7 = [(HKClinicalSharingStatus *)self lastSharedDate];
  id v8 = [(HKClinicalSharingStatus *)self userStatus];
  id v9 = [(HKClinicalSharingStatus *)self multiDeviceStatus];
  v10 = [(HKClinicalSharingStatus *)self primaryDeviceName];
  id v11 = [v5 initWithFirstSharedDate:v6 lastSharedDate:v7 featureStatus:a3 userStatus:v8 multiDeviceStatus:v9 primaryDeviceName:v10];

  return (HKClinicalSharingStatus *)v11;
}

@end