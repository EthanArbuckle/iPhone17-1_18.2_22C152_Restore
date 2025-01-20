@interface HMPhotosPersonManagerSettings(HMD)
- (id)createHMIExternalPersonManagerSettings;
- (uint64_t)createHMHomePersonManagerSettings;
- (uint64_t)createHMIHomePersonManagerSettings;
@end

@implementation HMPhotosPersonManagerSettings(HMD)

- (uint64_t)createHMHomePersonManagerSettings
{
  return 0;
}

- (uint64_t)createHMIHomePersonManagerSettings
{
  return 0;
}

- (id)createHMIExternalPersonManagerSettings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F69808]);
  objc_msgSend(v2, "setImportingFromPhotoLibraryEnabled:", objc_msgSend(a1, "isImportingFromPhotoLibraryEnabled"));
  objc_msgSend(v2, "setSharingFaceClassificationsEnabled:", objc_msgSend(a1, "isSharingFaceClassificationsEnabled"));
  v3 = (void *)[v2 copy];

  return v3;
}

@end