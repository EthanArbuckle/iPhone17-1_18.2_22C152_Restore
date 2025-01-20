@interface HMAnalyticManager
- (_TtC13HearingModeUI17HMAnalyticManager)init;
- (_TtC13HearingModeUI17HMAnalyticManager)initWithHpDevice:(id)a3;
- (void)addCustomEventWithEventName:(int64_t)a3 key:(int64_t)a4 value:(id)a5;
- (void)sendCustomEvent;
- (void)sendHASettingsEvent;
- (void)sendHPSettingsEvent;
@end

@implementation HMAnalyticManager

- (_TtC13HearingModeUI17HMAnalyticManager)initWithHpDevice:(id)a3
{
  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_eventPayload) = (Class)MEMORY[0x263F8EE80];
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HMAnalyticManager();
  v8 = [(HMAnalyticManager *)&v10 init];

  return v8;
}

- (_TtC13HearingModeUI17HMAnalyticManager)init
{
  v3 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_headphoneDevice) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HearingModeUI17HMAnalyticManager_eventPayload) = (Class)MEMORY[0x263F8EE80];
  swift_beginAccess();
  v4 = *v3;
  *v3 = 0;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HMAnalyticManager();
  return [(HMAnalyticManager *)&v6 init];
}

- (void)sendHASettingsEvent
{
  v2 = self;
  sub_2512932DC();
}

- (void)sendHPSettingsEvent
{
  v2 = self;
  sub_251293504();
}

- (void)addCustomEventWithEventName:(int64_t)a3 key:(int64_t)a4 value:(id)a5
{
  id v8 = a5;
  v9 = self;
  sub_2512938E8(a3, a4, v8);
}

- (void)sendCustomEvent
{
  v2 = self;
  sub_251294004();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end