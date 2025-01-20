@interface HMFSoftwareVersion(HFAdditions)
- (BOOL)hf_canProvideWifiStrength;
- (BOOL)hf_softwareUpdateWouldSupportHomePodPairing;
- (uint64_t)hf_canSupportCoordination;
@end

@implementation HMFSoftwareVersion(HFAdditions)

- (BOOL)hf_softwareUpdateWouldSupportHomePodPairing
{
  return (unint64_t)[a1 majorVersion] >= 0xB
      && ([a1 majorVersion] != 11 || (unint64_t)objc_msgSend(a1, "minorVersion") >= 3);
}

- (uint64_t)hf_canSupportCoordination
{
  if ((unint64_t)[a1 majorVersion] < 0xE
    || [a1 majorVersion] == 14 && (unint64_t)objc_msgSend(a1, "minorVersion") < 7)
  {
    return 0;
  }
  return _os_feature_enabled_impl();
}

- (BOOL)hf_canProvideWifiStrength
{
  return (unint64_t)[a1 majorVersion] >= 0xF
      && ([a1 majorVersion] != 15 || (unint64_t)objc_msgSend(a1, "minorVersion") >= 4);
}

@end