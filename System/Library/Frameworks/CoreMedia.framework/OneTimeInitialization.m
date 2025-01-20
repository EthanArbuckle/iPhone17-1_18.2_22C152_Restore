@interface OneTimeInitialization
@end

@implementation OneTimeInitialization

uint64_t __remoteDeviceClock_OneTimeInitialization_block_invoke()
{
  long long v4 = 0u;
  long long v5 = 0u;
  long long v3 = 0u;
  v2[0] = 1;
  v2[1] = (unint64_t)remoteDeviceClock_DeadConnectionCallback;
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  if (FigRemote_ShouldConnectToMediaplaybackd()) {
    v0 = "com.apple.coremedia.mediaplaybackd.audiodeviceclock.xpc";
  }
  else {
    v0 = "com.apple.coremedia.audiodeviceclock.xpc";
  }
  uint64_t result = FigXPCRemoteClientCreate((uint64_t)v0, v2, 0, &gAudioDeviceClockRemoteClient);
  remoteDeviceClock_OneTimeInitialization_err = result;
  return result;
}

@end