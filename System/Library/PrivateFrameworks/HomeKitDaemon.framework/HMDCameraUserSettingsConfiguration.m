@interface HMDCameraUserSettingsConfiguration
- (BOOL)isImportingFromPhotoLibraryEnabled;
- (BOOL)isOwner;
- (BOOL)isSharingFaceClassificationsEnabled;
- (HMDCameraUserSettingsConfiguration)initWithUser:(id)a3;
@end

@implementation HMDCameraUserSettingsConfiguration

- (BOOL)isOwner
{
  return self->_owner;
}

- (BOOL)isImportingFromPhotoLibraryEnabled
{
  return self->_importingFromPhotoLibraryEnabled;
}

- (BOOL)isSharingFaceClassificationsEnabled
{
  return self->_sharingFaceClassificationsEnabled;
}

- (HMDCameraUserSettingsConfiguration)initWithUser:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraUserSettingsConfiguration;
  v5 = [(HMDCameraUserSettingsConfiguration *)&v9 init];
  if (v5)
  {
    v6 = [v4 photosPersonManagerSettings];
    v5->_sharingFaceClassificationsEnabled = [v6 isSharingFaceClassificationsEnabled];

    v7 = [v4 photosPersonManagerSettings];
    v5->_importingFromPhotoLibraryEnabled = [v7 isImportingFromPhotoLibraryEnabled];

    v5->_owner = [v4 isOwner];
  }

  return v5;
}

@end