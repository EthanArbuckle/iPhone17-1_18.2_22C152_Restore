@interface AXCVoiceSelection
- (AXCVoiceSelection)init;
- (AXCVoiceSelection)initWithVoiceId:(id)a3 rate:(id)a4 pitch:(id)a5 volume:(id)a6 voiceSettings:(id)a7 effects:(id)a8;
- (NSArray)effects;
- (NSDictionary)voiceSettings;
- (NSNumber)pitch;
- (NSNumber)rate;
- (NSNumber)volume;
- (NSString)voiceId;
- (void)setEffects:(id)a3;
- (void)setPitch:(id)a3;
- (void)setRate:(id)a3;
- (void)setVoiceId:(id)a3;
- (void)setVoiceSettings:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation AXCVoiceSelection

- (NSString)voiceId
{
  v2 = (char *)self + OBJC_IVAR___AXCVoiceSelection_voiceId;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_18FD02120();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setVoiceId:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18FD02150();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AXCVoiceSelection_voiceId);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSNumber)rate
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_rate);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setRate:(id)a3
{
}

- (NSNumber)pitch
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_pitch);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setPitch:(id)a3
{
}

- (NSNumber)volume
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_volume);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setVolume:(id)a3
{
}

- (NSDictionary)voiceSettings
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_voiceSettings);
  swift_beginAccess();
  if (*v2)
  {
    sub_18FCA2634(0, &qword_1E926C2A0);
    swift_bridgeObjectRetain();
    v3 = (void *)sub_18FD02080();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)setVoiceSettings:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_18FCA2634(0, &qword_1E926C2A0);
    uint64_t v3 = sub_18FD02090();
  }
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___AXCVoiceSelection_voiceSettings);
  swift_beginAccess();
  *uint64_t v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSArray)effects
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_effects);
  swift_beginAccess();
  if (*v2)
  {
    type metadata accessor for AXAudioEffectConfiguration(0);
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_18FD02310();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setEffects:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for AXAudioEffectConfiguration(0);
    uint64_t v3 = sub_18FD02320();
  }
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___AXCVoiceSelection_effects);
  swift_beginAccess();
  *uint64_t v5 = v3;
  swift_bridgeObjectRelease();
}

- (AXCVoiceSelection)initWithVoiceId:(id)a3 rate:(id)a4 pitch:(id)a5 volume:(id)a6 voiceSettings:(id)a7 effects:(id)a8
{
  uint64_t v9 = (uint64_t)a7;
  if (a3)
  {
    uint64_t v13 = sub_18FD02150();
    uint64_t v15 = v14;
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
  if (a7)
  {
LABEL_3:
    sub_18FCA2634(0, &qword_1E926C2A0);
    uint64_t v9 = sub_18FD02090();
  }
LABEL_4:
  if (a8)
  {
    type metadata accessor for AXAudioEffectConfiguration(0);
    a8 = (id)sub_18FD02320();
  }
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v19 = (AXCVoiceSelection *)sub_18FCB12C4(v13, v15, a4, a5, a6, v9, (uint64_t)a8);

  return v19;
}

- (AXCVoiceSelection)init
{
  result = (AXCVoiceSelection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end