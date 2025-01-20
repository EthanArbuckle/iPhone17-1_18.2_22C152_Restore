@interface BobbleVideoLoopPlayer
- (_TtC16HeadphoneConfigs21BobbleVideoLoopPlayer)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs21BobbleVideoLoopPlayer)initWithFrame:(CGRect)a3;
- (_TtC16HeadphoneConfigs21BobbleVideoLoopPlayer)initWithFrame:(CGRect)a3 urlForResource:(id)a4;
- (void)load;
@end

@implementation BobbleVideoLoopPlayer

- (void)load
{
  v2 = self;
  sub_1E4CA6C80();
}

- (_TtC16HeadphoneConfigs21BobbleVideoLoopPlayer)initWithCoder:(id)a3
{
  result = (_TtC16HeadphoneConfigs21BobbleVideoLoopPlayer *)sub_1E4CBF640();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs21BobbleVideoLoopPlayer)initWithFrame:(CGRect)a3 urlForResource:(id)a4
{
  uint64_t v4 = sub_1E4CBE910();
  MEMORY[0x1F4188790](v4 - 8);
  sub_1E4CBE8F0();
  result = (_TtC16HeadphoneConfigs21BobbleVideoLoopPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs21BobbleVideoLoopPlayer)initWithFrame:(CGRect)a3
{
  result = (_TtC16HeadphoneConfigs21BobbleVideoLoopPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end