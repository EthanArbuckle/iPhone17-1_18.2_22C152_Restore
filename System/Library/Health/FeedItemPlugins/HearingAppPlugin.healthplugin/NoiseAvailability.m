@interface NoiseAvailability
- (_TtC16HearingAppPlugin17NoiseAvailability)init;
- (void)dealloc;
- (void)pairedDevicesDidUpdate;
@end

@implementation NoiseAvailability

- (void)dealloc
{
  v2 = self;
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v3, v2);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for NoiseAvailability();
  [(NoiseAvailability *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16HearingAppPlugin17NoiseAvailability__featureStatus;
  sub_24097FCF8(0, &qword_26AFD4860, (uint64_t (*)(uint64_t))sub_24097FDC0, MEMORY[0x263EFDE58]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16HearingAppPlugin17NoiseAvailability__promotionVisibility;
  sub_2409829A8();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (void)pairedDevicesDidUpdate
{
  sub_24097FDC0(0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v11 - v7;
  v9 = self;
  sub_240978EA8((uint64_t)v8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24097FC94((uint64_t)v8, (uint64_t)v6);
  v10 = v9;
  sub_240A045D8();
  sub_24097FC38((uint64_t)v8);
  sub_240979918();
}

- (_TtC16HearingAppPlugin17NoiseAvailability)init
{
  result = (_TtC16HearingAppPlugin17NoiseAvailability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end