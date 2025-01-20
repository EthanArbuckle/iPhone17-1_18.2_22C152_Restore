@interface RPCompanionLinkDevice(AnnounceAdditions)
- (BOOL)isAccessory;
- (uint64_t)supportsAnnounce;
- (unint64_t)isOwnerDevice;
- (unint64_t)isPairedCompanion;
@end

@implementation RPCompanionLinkDevice(AnnounceAdditions)

- (uint64_t)supportsAnnounce
{
  v1 = [a1 serviceTypes];
  uint64_t v2 = [v1 containsObject:*MEMORY[0x1E4F4A4D8]];

  return v2;
}

- (unint64_t)isOwnerDevice
{
  return ((unint64_t)[a1 statusFlags] >> 19) & 1;
}

- (BOOL)isAccessory
{
  v1 = [a1 homeKitIdentifier];
  BOOL v2 = v1 != 0;

  return v2;
}

- (unint64_t)isPairedCompanion
{
  if (([a1 statusFlags] & 0x40) != 0) {
    return ((unint64_t)[a1 statusFlags] >> 19) & 1;
  }
  else {
    return 0;
  }
}

@end