@interface HMUser(HFAdditions)
- (uint64_t)hf_getPhotosLibrarySettingsStatus;
- (uint64_t)hf_isImportingPhotosLibraryEnabledForFaceRecognition;
- (uint64_t)hf_isSharingPhotosLibraryEnabledForFaceRecognition;
@end

@implementation HMUser(HFAdditions)

- (uint64_t)hf_isImportingPhotosLibraryEnabledForFaceRecognition
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [a1 photosPersonManagerSettings];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 isImportingFromPhotoLibraryEnabled];
  }
  else
  {
    v5 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = [a1 name];
      int v8 = 138412802;
      v9 = a1;
      __int16 v10 = 2080;
      v11 = "-[HMUser(HFAdditions) hf_isImportingPhotosLibraryEnabledForFaceRecognition]";
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "%@ (%s): externalPersonManagerSettings is nil for user %@", (uint8_t *)&v8, 0x20u);
    }
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_isSharingPhotosLibraryEnabledForFaceRecognition
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [a1 photosPersonManagerSettings];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 isSharingFaceClassificationsEnabled];
  }
  else
  {
    v5 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = [a1 name];
      int v8 = 138412802;
      v9 = a1;
      __int16 v10 = 2080;
      v11 = "-[HMUser(HFAdditions) hf_isSharingPhotosLibraryEnabledForFaceRecognition]";
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "%@ (%s): externalPersonManagerSettings is nil for user %@", (uint8_t *)&v8, 0x20u);
    }
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_getPhotosLibrarySettingsStatus
{
  v2 = [a1 personManagerSettings];
  int v3 = [v2 isImportingFromPhotoLibraryEnabled];

  uint64_t v4 = [a1 personManagerSettings];
  LODWORD(v2) = [v4 isSharingFaceClassificationsEnabled];

  uint64_t v5 = 2;
  if (v2) {
    uint64_t v5 = 3;
  }
  if (v3) {
    return v5;
  }
  else {
    return 1;
  }
}

@end