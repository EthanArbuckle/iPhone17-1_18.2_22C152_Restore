@interface AirPlayAndHandoffSettingsState
- (_TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState)init;
- (void)profileNotification:(id)a3;
- (void)transferToHomePodEnabledDidChange;
@end

@implementation AirPlayAndHandoffSettingsState

- (_TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState)init
{
  return (_TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState *)AirPlayAndHandoffSettingsState.init()();
}

- (void)transferToHomePodEnabledDidChange
{
  v2 = self;
  sub_2477FBC14();
}

- (void)profileNotification:(id)a3
{
  uint64_t v4 = sub_2478012C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2478012A8();
  v11 = self;
  sub_2477FBEC4((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture));
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  uint64_t v4 = sub_247801578();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end