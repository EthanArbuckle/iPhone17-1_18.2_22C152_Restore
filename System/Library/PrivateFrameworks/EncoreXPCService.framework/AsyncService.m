@interface AsyncService
- (_TtC16EncoreXPCService12AsyncService)init;
@end

@implementation AsyncService

- (_TtC16EncoreXPCService12AsyncService)init
{
  return (_TtC16EncoreXPCService12AsyncService *)sub_24D1A53C0();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_continuation;
  sub_24D1A5B34((uint64_t)v5);
}

@end