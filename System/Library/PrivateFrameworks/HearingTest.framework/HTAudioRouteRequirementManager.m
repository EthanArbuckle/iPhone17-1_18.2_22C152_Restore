@interface HTAudioRouteRequirementManager
- (_TtC11HearingTest30HTAudioRouteRequirementManager)init;
- (void)audioSessionRouteChangeHander:(id)a3;
- (void)dealloc;
@end

@implementation HTAudioRouteRequirementManager

- (void)dealloc
{
  v2 = self;
  sub_25137B734();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_capturedDevice));

  swift_release();
}

- (void)audioSessionRouteChangeHander:(id)a3
{
  uint64_t v4 = sub_251380450();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251380430();
  v8 = self;
  sub_25137B968();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11HearingTest30HTAudioRouteRequirementManager)init
{
  result = (_TtC11HearingTest30HTAudioRouteRequirementManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end