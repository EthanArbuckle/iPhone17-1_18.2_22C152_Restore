@interface RPCompanionLinkDevice(HMUAdditions)
- (BOOL)hmu_isAccessory;
- (unint64_t)hmu_isOwnerDevice;
- (unint64_t)hmu_isPairedCompanion;
@end

@implementation RPCompanionLinkDevice(HMUAdditions)

- (unint64_t)hmu_isOwnerDevice
{
  return ((unint64_t)[a1 statusFlags] >> 19) & 1;
}

- (BOOL)hmu_isAccessory
{
  v1 = [a1 homeKitIdentifier];
  BOOL v2 = v1 != 0;

  return v2;
}

- (unint64_t)hmu_isPairedCompanion
{
  if (([a1 statusFlags] & 0x40) != 0) {
    return ((unint64_t)[a1 statusFlags] >> 19) & 1;
  }
  else {
    return 0;
  }
}

@end