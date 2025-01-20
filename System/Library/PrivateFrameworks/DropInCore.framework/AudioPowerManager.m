@interface AudioPowerManager
- (_TtC10DropInCore17AudioPowerManager)init;
- (void)dealloc;
- (void)frequencyController:(id)a3 audioPowerChanged:(float)a4 forParticipantWithStreamToken:(int64_t)a5;
@end

@implementation AudioPowerManager

- (void)dealloc
{
  v2 = self;
  sub_24D0D5120();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_24D0F01C0();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_168();
  v3();
  sub_24D0F0190();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_168();
  v4();
  swift_release();

  sub_24D05C8DC((uint64_t)self + OBJC_IVAR____TtC10DropInCore17AudioPowerManager_delegate);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10DropInCore17AudioPowerManager_audioFrequencyController);
}

- (_TtC10DropInCore17AudioPowerManager)init
{
}

- (void)frequencyController:(id)a3 audioPowerChanged:(float)a4 forParticipantWithStreamToken:(int64_t)a5
{
  id v6 = a3;
  v7 = self;
  sub_24D0D5F4C();
}

@end