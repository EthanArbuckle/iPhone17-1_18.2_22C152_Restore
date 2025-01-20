@interface DDRTaskRemovePairedAirplayDevices
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskRemovePairedAirplayDevices

- (void)run
{
  uint64_t v2 = APSClearLegacyAirPlayPairingInfo();
  _MRMediaRemoteClearAllAVRoutePasswords(v2);
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetPairedAirplayDevice";
}

- (double)estimatedTimeOfCompletion
{
  return 0.2;
}

@end