@interface HMNoiseCheckService
- (_TtC13HearingModeUI19HMNoiseCheckService)init;
- (void)runNoiseCheckNudgingWithTopView:(id)a3 passAction:(id)a4;
- (void)runNoiseCheckWithCompletionHandler:(id)a3;
- (void)stopNoiseCheck;
@end

@implementation HMNoiseCheckService

- (void)stopNoiseCheck
{
  v2 = self;
  sub_2512ABFA8();
}

- (void)runNoiseCheckWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE80);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2512C4928();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269B2DE90;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269B2DEA0;
  v12[5] = v11;
  v13 = self;
  sub_2512AD378((uint64_t)v7, (uint64_t)&unk_269B2DEB0, (uint64_t)v12);
  swift_release();
}

- (void)runNoiseCheckNudgingWithTopView:(id)a3 passAction:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_2512ACB5C((uint64_t)v8, (uint64_t)sub_2512ADBF8, v7);

  swift_release();
}

- (_TtC13HearingModeUI19HMNoiseCheckService)init
{
  uint64_t v3 = OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_manager;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_2512C40C8();
  uint64_t v5 = OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_observer;
  type metadata accessor for HMNoiseCheckService.NoiseCheckObserver();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0xD000000000000012;
  *(void *)(v6 + 24) = 0x80000002512CC9F0;
  *(Class *)((char *)&v4->super.isa + v5) = (Class)v6;
  *((unsigned char *)&v4->super.isa + OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_noiseCheckOngoing) = 0;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC13HearingModeUI19HMNoiseCheckService_listeners) = (Class)MEMORY[0x263F8EE88];

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for HMNoiseCheckService();
  return [(HMNoiseCheckService *)&v8 init];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end