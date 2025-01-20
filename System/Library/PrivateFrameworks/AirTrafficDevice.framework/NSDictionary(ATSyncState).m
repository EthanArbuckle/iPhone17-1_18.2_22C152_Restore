@interface NSDictionary(ATSyncState)
- (uint64_t)deviceGUID;
- (uint64_t)devicePairingId;
- (uint64_t)displayName;
- (uint64_t)enabledDataClasses;
- (uint64_t)grappaInfo;
- (uint64_t)lastClientRevision;
- (uint64_t)lastServerRevision;
- (uint64_t)model;
- (uint64_t)newRevision;
- (uint64_t)osType;
- (uint64_t)osVersion;
- (uint64_t)setDeviceGUID:()ATSyncState;
- (uint64_t)setDevicePairingId:()ATSyncState;
- (uint64_t)setDisplayName:()ATSyncState;
- (uint64_t)setEnabledDataClasses:()ATSyncState;
- (uint64_t)setGrappaInfo:()ATSyncState;
- (uint64_t)setModel:()ATSyncState;
- (uint64_t)setOsType:()ATSyncState;
- (uint64_t)setOsVersion:()ATSyncState;
- (uint64_t)setVersionToken:()ATSyncState;
- (uint64_t)versionToken;
- (void)setLastClientRevision:()ATSyncState;
- (void)setLastServerRevision:()ATSyncState;
- (void)setNewRevision:()ATSyncState;
@end

@implementation NSDictionary(ATSyncState)

- (uint64_t)setDeviceGUID:()ATSyncState
{
  return [a1 setValue:a3 forKey:@"DeviceGUID"];
}

- (uint64_t)deviceGUID
{
  return [a1 valueForKey:@"DeviceGUID"];
}

- (uint64_t)setDevicePairingId:()ATSyncState
{
  return [a1 setValue:a3 forKey:@"DevicePairingId"];
}

- (uint64_t)devicePairingId
{
  return [a1 valueForKey:@"DevicePairingId"];
}

- (uint64_t)setEnabledDataClasses:()ATSyncState
{
  return [a1 setValue:a3 forKey:@"EnabledDataClasses"];
}

- (uint64_t)enabledDataClasses
{
  return [a1 valueForKey:@"EnabledDataClasses"];
}

- (uint64_t)setGrappaInfo:()ATSyncState
{
  return [a1 setValue:a3 forKey:@"Grappa"];
}

- (uint64_t)grappaInfo
{
  return [a1 valueForKey:@"Grappa"];
}

- (uint64_t)setOsVersion:()ATSyncState
{
  return [a1 setValue:a3 forKey:@"OSVersion"];
}

- (uint64_t)osVersion
{
  return [a1 valueForKey:@"OSVersion"];
}

- (uint64_t)setOsType:()ATSyncState
{
  return [a1 setValue:a3 forKey:@"OSType"];
}

- (uint64_t)osType
{
  return [a1 valueForKey:@"OSType"];
}

- (uint64_t)setModel:()ATSyncState
{
  return [a1 setValue:a3 forKey:@"Model"];
}

- (uint64_t)model
{
  return [a1 valueForKey:@"Model"];
}

- (uint64_t)setDisplayName:()ATSyncState
{
  return [a1 setValue:a3 forKey:@"DisplayName"];
}

- (uint64_t)displayName
{
  return [a1 valueForKey:@"DisplayName"];
}

- (uint64_t)setVersionToken:()ATSyncState
{
  return [a1 setValue:a3 forKey:@"VersionToken"];
}

- (uint64_t)versionToken
{
  return [a1 objectForKey:@"VersionToken"];
}

- (uint64_t)newRevision
{
  v1 = [a1 valueForKey:@"NewRevisionKey"];
  uint64_t v2 = [v1 unsignedLongLongValue];

  return v2;
}

- (void)setNewRevision:()ATSyncState
{
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v2 forKey:@"NewRevisionKey"];
}

- (void)setLastClientRevision:()ATSyncState
{
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v2 forKey:@"LastClientRevision"];
}

- (uint64_t)lastClientRevision
{
  v1 = [a1 valueForKey:@"LastClientRevision"];
  uint64_t v2 = [v1 unsignedLongLongValue];

  return v2;
}

- (void)setLastServerRevision:()ATSyncState
{
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v2 forKey:@"LastServerRevision"];
}

- (uint64_t)lastServerRevision
{
  v1 = [a1 valueForKey:@"LastServerRevision"];
  uint64_t v2 = [v1 unsignedLongLongValue];

  return v2;
}

@end