@interface SNDetectSoundActionsRequest
- (NSArray)commands;
- (SNDetectSoundActionsRequest)init;
- (SNDetectSoundActionsRequest)initWithModel:(id)a3 dictionary:(id)a4 error:(id *)a5;
- (double)sampleRate;
- (int64_t)blocksBetweenTriggers;
- (int64_t)hopSizeSamples;
- (void)setBlocksBetweenTriggers:(int64_t)a3;
- (void)setCommands:(id)a3;
- (void)setHopSizeSamples:(int64_t)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation SNDetectSoundActionsRequest

- (double)sampleRate
{
  return sub_1DCAC7004();
}

- (void)setSampleRate:(double)a3
{
}

- (int64_t)hopSizeSamples
{
  return sub_1DCAC7074();
}

- (void)setHopSizeSamples:(int64_t)a3
{
}

- (int64_t)blocksBetweenTriggers
{
  return sub_1DCAC70E8();
}

- (void)setBlocksBetweenTriggers:(int64_t)a3
{
}

- (NSArray)commands
{
  v2 = self;
  sub_1DCAC719C();

  type metadata accessor for SNSoundActionCommand();
  v3 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)setCommands:(id)a3
{
  type metadata accessor for SNSoundActionCommand();
  unint64_t v4 = sub_1DCB87C38();
  v5 = self;
  sub_1DCAC7340(v4);
}

- (SNDetectSoundActionsRequest)initWithModel:(id)a3 dictionary:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1DCB877B8();
  sub_1DCAC7550(a3, v6);
  return result;
}

- (SNDetectSoundActionsRequest)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end