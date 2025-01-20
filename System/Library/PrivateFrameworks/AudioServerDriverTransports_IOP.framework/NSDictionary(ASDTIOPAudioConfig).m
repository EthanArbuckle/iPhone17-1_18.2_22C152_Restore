@interface NSDictionary(ASDTIOPAudioConfig)
- (uint64_t)asdtIOPAudioCMEnablePropertyDirection;
- (uint64_t)asdtIOPAudioCMPowerStatePropertyDirection;
- (uint64_t)asdtIOPAudioCMPowerStatePropertyDisabled;
- (uint64_t)asdtIOPAudioCMPowerStatePropertyEnabled;
@end

@implementation NSDictionary(ASDTIOPAudioConfig)

- (uint64_t)asdtIOPAudioCMEnablePropertyDirection
{
  return [a1 asdtFourCCForKey:@"Direction" withDefault:0];
}

- (uint64_t)asdtIOPAudioCMPowerStatePropertyEnabled
{
  return [a1 asdtFourCCForKey:@"PowerStateEnabled" withDefault:1886876260];
}

- (uint64_t)asdtIOPAudioCMPowerStatePropertyDisabled
{
  return [a1 asdtFourCCForKey:@"PowerStateDisabled" withDefault:1768189029];
}

- (uint64_t)asdtIOPAudioCMPowerStatePropertyDirection
{
  return [a1 asdtFourCCForKey:@"PowerStateDirection" withDefault:0];
}

@end