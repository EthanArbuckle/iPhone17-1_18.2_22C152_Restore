@interface HMAccessory(HFSoftwareUpdateAdditions)
+ (void)hf_softwareUpdateComparator;
- (id)hf_fetchAvailableSoftwareUpdateWithOptions:()HFSoftwareUpdateAdditions;
- (id)hf_softwareUpdateDependentClasses;
- (id)hf_softwareUpdateDependentObjects;
- (id)hf_softwareUpdateDisplayableVersion;
- (id)hf_softwareUpdateDocumentation;
- (id)hf_softwareUpdateHash;
- (id)hf_softwareUpdatePortionComplete;
- (id)hf_softwareUpdateReleaseDate;
- (id)hf_softwareUpdateVersion;
- (id)hf_startSoftwareUpdate;
- (uint64_t)hf_hasNewValidSoftwareOrFirmwareUpdate;
- (uint64_t)hf_hasNewValidSoftwareUpdate;
- (uint64_t)hf_hasRequestedSoftwareUpdate;
- (uint64_t)hf_hasSoftwareUpdate;
- (uint64_t)hf_hasValidSoftwareOrFirmwareUpdate;
- (uint64_t)hf_hasValidSoftwareUpdate;
- (uint64_t)hf_isDownloadingSoftwareUpdate;
- (uint64_t)hf_isInstallingSoftwareUpdate;
- (uint64_t)hf_isReadyToInstallSoftwareUpdate;
- (uint64_t)hf_isSoftwareUpdateInProgress;
- (uint64_t)hf_isSoftwareUpdateInstalled;
- (uint64_t)hf_softwareUpdateDownloadSize;
- (uint64_t)hf_softwareUpdatePossessesNecessaryDocumentation;
- (uint64_t)hf_supportsSoftwareUpdate;
@end

@implementation HMAccessory(HFSoftwareUpdateAdditions)

- (id)hf_softwareUpdateDependentObjects
{
  v2 = objc_opt_new();
  if (([a1 supportsSoftwareUpdateV2] & 1) == 0)
  {
    v3 = [a1 softwareUpdateController];
    objc_msgSend(v2, "na_safeAddObject:", v3);

    v4 = [a1 softwareUpdateController];
    v5 = [v4 availableUpdate];
    objc_msgSend(v2, "na_safeAddObject:", v5);
  }
  return v2;
}

- (uint64_t)hf_isSoftwareUpdateInstalled
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 isSoftwareUpdateInstalled:a1];

  return v4;
}

- (uint64_t)hf_isSoftwareUpdateInProgress
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 isSoftwareUpdateInProgress:a1];

  return v4;
}

- (uint64_t)hf_isReadyToInstallSoftwareUpdate
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 isReadyToInstallSoftwareUpdate:a1];

  return v4;
}

+ (void)hf_softwareUpdateComparator
{
  return &__block_literal_global_154;
}

- (uint64_t)hf_supportsSoftwareUpdate
{
  if ([a1 supportsSoftwareUpdateV2]) {
    return 1;
  }
  v3 = [a1 softwareUpdateController];
  BOOL v2 = v3 != 0;

  return v2;
}

- (uint64_t)hf_hasValidSoftwareOrFirmwareUpdate
{
  if ([a1 isFirmwareUpdateAvailable]) {
    return 1;
  }
  return objc_msgSend(a1, "hf_hasValidSoftwareUpdate");
}

- (uint64_t)hf_hasNewValidSoftwareOrFirmwareUpdate
{
  if ([a1 isFirmwareUpdateAvailable]) {
    return 1;
  }
  return objc_msgSend(a1, "hf_hasNewValidSoftwareUpdate");
}

- (uint64_t)hf_hasSoftwareUpdate
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 hasSoftwareUpdate:a1];

  return v4;
}

- (uint64_t)hf_hasValidSoftwareUpdate
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 hasValidSoftwareUpdate:a1];

  return v4;
}

- (uint64_t)hf_hasNewValidSoftwareUpdate
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 hasNewValidSoftwareUpdate:a1];

  return v4;
}

- (uint64_t)hf_hasRequestedSoftwareUpdate
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 hasRequestedSoftwareUpdate:a1];

  return v4;
}

- (uint64_t)hf_isDownloadingSoftwareUpdate
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 isDownloadingSoftwareUpdate:a1];

  return v4;
}

- (uint64_t)hf_isInstallingSoftwareUpdate
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 isInstallingSoftwareUpdate:a1];

  return v4;
}

- (uint64_t)hf_softwareUpdatePossessesNecessaryDocumentation
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 softwareUpdatePossessesNecessaryDocumentation:a1];

  return v4;
}

- (id)hf_softwareUpdateDocumentation
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 softwareUpdateDocumentation:a1];

  return v4;
}

- (id)hf_softwareUpdateVersion
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 softwareUpdateVersion:a1];

  return v4;
}

- (id)hf_softwareUpdateDisplayableVersion
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 softwareUpdateDisplayableVersion:a1];

  return v4;
}

- (id)hf_softwareUpdateReleaseDate
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 softwareUpdateReleaseDate:a1];

  return v4;
}

- (uint64_t)hf_softwareUpdateDownloadSize
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 softwareUpdateDownloadSize:a1];

  return v4;
}

- (id)hf_softwareUpdatePortionComplete
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 softwareUpdatePortionComplete:a1];

  return v4;
}

- (id)hf_fetchAvailableSoftwareUpdateWithOptions:()HFSoftwareUpdateAdditions
{
  v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v6 = [v5 softwareUpdateManager];
  v7 = [v6 fetchAvailableSoftwareUpdate:a1 options:a3];

  return v7;
}

- (id)hf_startSoftwareUpdate
{
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 softwareUpdateManager];
  uint64_t v4 = [v3 startSoftwareUpdate:a1];

  return v4;
}

- (id)hf_softwareUpdateHash
{
  BOOL v2 = NSString;
  v3 = [a1 category];
  uint64_t v4 = [v3 categoryType];
  v5 = [a1 manufacturer];
  v6 = objc_msgSend(a1, "hf_softwareUpdateVersion");
  v7 = [v2 stringWithFormat:@"%@-%@-%@", v4, v5, v6];

  return v7;
}

- (id)hf_softwareUpdateDependentClasses
{
  v5[2] = *MEMORY[0x263EF8340];
  BOOL v2 = objc_opt_new();
  if (([a1 supportsSoftwareUpdateV2] & 1) == 0)
  {
    v5[0] = objc_opt_class();
    v5[1] = objc_opt_class();
    v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
    [v2 addObjectsFromArray:v3];
  }
  return v2;
}

@end