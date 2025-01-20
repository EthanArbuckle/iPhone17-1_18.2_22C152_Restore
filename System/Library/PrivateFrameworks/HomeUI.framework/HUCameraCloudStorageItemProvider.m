@interface HUCameraCloudStorageItemProvider
- (HMCameraProfile)cameraProfile;
- (HUCameraCloudStorageItemProvider)init;
- (HUCameraCloudStorageItemProvider)initWithCameraProfile:(id)a3;
@end

@implementation HUCameraCloudStorageItemProvider

- (HUCameraCloudStorageItemProvider)initWithCameraProfile:(id)a3
{
  id v5 = a3;
  v6 = [[HUCameraEraseRecordingsItem alloc] initWithCameraProfile:v5];
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v6, 0);
  v11.receiver = self;
  v11.super_class = (Class)HUCameraCloudStorageItemProvider;
  v8 = [(HFStaticItemProvider *)&v11 initWithItems:v7];

  if (v8)
  {
    v9 = [(HFStaticItemProvider *)v8 reloadItems];
    [v9 finishWithNoResult];

    objc_storeStrong((id *)&v8->_cameraProfile, a3);
  }

  return v8;
}

- (HUCameraCloudStorageItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithCameraProfile_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraCloudStorageItemProvider.m", 94, @"%s is unavailable; use %@ instead",
    "-[HUCameraCloudStorageItemProvider init]",
    v5);

  return 0;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void).cxx_destruct
{
}

@end