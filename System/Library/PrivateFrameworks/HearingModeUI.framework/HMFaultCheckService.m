@interface HMFaultCheckService
- (_TtC13HearingModeUI19HMFaultCheckService)init;
- (int64_t)faultCheckResult;
@end

@implementation HMFaultCheckService

- (int64_t)faultCheckResult
{
  v2 = self;
  int64_t v3 = sub_2512A69AC();

  return v3;
}

- (_TtC13HearingModeUI19HMFaultCheckService)init
{
  uint64_t v3 = OBJC_IVAR____TtC13HearingModeUI19HMFaultCheckService_observer;
  type metadata accessor for HMFaultCheckService.FaultCheckObserver();
  v4 = (objc_class *)swift_allocObject();
  *((void *)v4 + 2) = 0xD000000000000012;
  *((void *)v4 + 3) = 0x80000002512CC230;
  *(Class *)((char *)&self->super.isa + v3) = v4;
  uint64_t v5 = OBJC_IVAR____TtC13HearingModeUI19HMFaultCheckService_manager;
  v6 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_2512C40C8();

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for HMFaultCheckService();
  return [(HMFaultCheckService *)&v8 init];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end