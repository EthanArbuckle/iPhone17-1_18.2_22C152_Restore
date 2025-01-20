@interface CSDefaultAudioRouteChangeMonitorMac
+ (id)sharedInstance;
- (BOOL)isDefaultInputBuiltInMic;
- (BOOL)isDefaultOutputBultInSpeaker;
- (unsigned)defaultOutputAudioDeviceID;
@end

@implementation CSDefaultAudioRouteChangeMonitorMac

+ (id)sharedInstance
{
  return 0;
}

- (unsigned)defaultOutputAudioDeviceID
{
  return 0;
}

- (BOOL)isDefaultOutputBultInSpeaker
{
  return 1;
}

- (BOOL)isDefaultInputBuiltInMic
{
  return 1;
}

@end