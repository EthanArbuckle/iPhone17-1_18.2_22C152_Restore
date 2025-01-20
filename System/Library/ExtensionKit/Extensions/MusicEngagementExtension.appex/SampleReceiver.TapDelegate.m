@interface SampleReceiver.TapDelegate
- (_TtCC9MusicCore14SampleReceiver11TapDelegate)init;
- (void)processAudioTapDidReceiveAudioSamples:(void *)a3 numberOfSamples:(unsigned int)a4;
@end

@implementation SampleReceiver.TapDelegate

- (void)processAudioTapDidReceiveAudioSamples:(void *)a3 numberOfSamples:(unsigned int)a4
{
  v6 = self;
  SampleReceiver.TapDelegate.processAudioTapDidReceiveAudioSamples(_:numberOfSamples:)((uint64_t)a3, a4);
}

- (_TtCC9MusicCore14SampleReceiver11TapDelegate)init
{
  result = (_TtCC9MusicCore14SampleReceiver11TapDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end