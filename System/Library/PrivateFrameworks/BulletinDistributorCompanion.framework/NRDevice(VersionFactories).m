@interface NRDevice(VersionFactories)
+ (BOOL)activePairedDeviceSupportIsGreaterEqualVersion:()VersionFactories;
+ (id)versionForString:()VersionFactories;
+ (uint64_t)activePairedDeviceSupportsAddBulletinReplyToken;
+ (uint64_t)activePairedDeviceSupportsAttachmentFiles;
+ (uint64_t)activePairedDeviceSupportsAuthorizationExpirationDate;
+ (uint64_t)activePairedDeviceSupportsAuthorizationStatusLockScreenAndNCSettings;
+ (uint64_t)activePairedDeviceSupportsCriticalAndGroupingSettings;
+ (uint64_t)activePairedDeviceSupportsDisplayingSubtitle;
+ (uint64_t)activePairedDeviceSupportsEmergencyAlerts;
+ (uint64_t)activePairedDeviceSupportsFileBulletinAdd;
+ (uint64_t)activePairedDeviceSupportsFileSettingSync;
+ (uint64_t)activePairedDeviceSupportsIconsPerNotification;
+ (uint64_t)activePairedDeviceSupportsMultipleAttachments;
+ (uint64_t)activePairedDeviceSupportsNSNullPListExtenion;
+ (uint64_t)activePairedDeviceSupportsNoLocalRemoteNotificationInBulletinContext;
+ (uint64_t)activePairedDeviceSupportsNotSendingTemporarySequenceNumbers;
+ (uint64_t)activePairedDeviceSupportsSendingOnlyCategoryID;
+ (uint64_t)activePairedDeviceSupportsSiriActionAppList;
+ (uint64_t)activePairedDeviceSupportsSpokenNotificationSettings;
+ (uint64_t)activePairedDeviceSupportsUserNotificationListDestination;
- (uint64_t)bltVersion;
- (uint64_t)watchOSVersion;
@end

@implementation NRDevice(VersionFactories)

- (uint64_t)watchOSVersion
{
  v1 = [a1 valueForProperty:*MEMORY[0x263F57668]];
  v2 = [MEMORY[0x263F57700] versionForString:v1];
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0xFFFFFFFFLL;
  }

  return v4;
}

- (uint64_t)bltVersion
{
  unint64_t v1 = [a1 watchOSVersion];
  if (v1 > 0x6FFFF) {
    return 8;
  }
  if (v1 > 0x5FFFF) {
    return 7;
  }
  if (v1 >> 18) {
    return 6;
  }
  uint64_t v3 = 4;
  uint64_t v4 = 3;
  uint64_t v5 = 2;
  if (!(v1 >> 17)) {
    uint64_t v5 = (v1 & 0xFFFFFFFFFFFF0000) != 0;
  }
  if (v1 >> 9 <= 0x100) {
    uint64_t v4 = v5;
  }
  if (v1 <= 0x2FFFF) {
    uint64_t v3 = v4;
  }
  if (v1 <= 0x301FF) {
    return v3;
  }
  else {
    return 5;
  }
}

+ (BOOL)activePairedDeviceSupportIsGreaterEqualVersion:()VersionFactories
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
  unint64_t v5 = [v4 watchOSVersion];

  return v5 >= a3;
}

+ (uint64_t)activePairedDeviceSupportsFileSettingSync
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:196608];
}

+ (uint64_t)activePairedDeviceSupportsFileBulletinAdd
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:131584];
}

+ (uint64_t)activePairedDeviceSupportsAttachmentFiles
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:196608];
}

+ (uint64_t)activePairedDeviceSupportsNSNullPListExtenion
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:0x40000];
}

+ (uint64_t)activePairedDeviceSupportsMultipleAttachments
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:0x40000];
}

+ (uint64_t)activePairedDeviceSupportsAddBulletinReplyToken
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:0x40000];
}

+ (uint64_t)activePairedDeviceSupportsSendingOnlyCategoryID
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:327680];
}

+ (uint64_t)activePairedDeviceSupportsCriticalAndGroupingSettings
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:327680];
}

+ (uint64_t)activePairedDeviceSupportsSiriActionAppList
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:327680];
}

+ (uint64_t)activePairedDeviceSupportsDisplayingSubtitle
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:327680];
}

+ (uint64_t)activePairedDeviceSupportsAuthorizationStatusLockScreenAndNCSettings
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:327680];
}

+ (uint64_t)activePairedDeviceSupportsUserNotificationListDestination
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:327680];
}

+ (uint64_t)activePairedDeviceSupportsSpokenNotificationSettings
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:393216];
}

+ (uint64_t)activePairedDeviceSupportsEmergencyAlerts
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:393216];
}

+ (uint64_t)activePairedDeviceSupportsNoLocalRemoteNotificationInBulletinContext
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:393216];
}

+ (uint64_t)activePairedDeviceSupportsNotSendingTemporarySequenceNumbers
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:393216];
}

+ (uint64_t)activePairedDeviceSupportsIconsPerNotification
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:393216];
}

+ (uint64_t)activePairedDeviceSupportsAuthorizationExpirationDate
{
  return [a1 activePairedDeviceSupportIsGreaterEqualVersion:458752];
}

+ (id)versionForString:()VersionFactories
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v3];
  uint64_t v5 = 0;
  do
  {
    if (!objc_msgSend(v4, "scanInteger:", (char *)&v9 + v5, v9)
      || (*(unint64_t *)((char *)&v9 + v5) & 0x8000000000000000) != 0)
    {
      int v6 = 0;
    }
    else if ([v4 isAtEnd])
    {
      int v6 = 1;
    }
    else
    {
      int v6 = [v4 scanString:@"." intoString:0];
    }
    if (v5 == 16) {
      break;
    }
    if ([v4 isAtEnd]) {
      break;
    }
    v5 += 8;
  }
  while (v6 == 1);
  if (v6 && [v4 isAtEnd])
  {
    if (v9 >> 16) {
      objc_msgSend(NSNumber, "numberWithInteger:");
    }
    else {
    v7 = [NSNumber numberWithUnsignedInteger:(v9 << 16) | ((unint64_t)v10 << 8) | v11];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end