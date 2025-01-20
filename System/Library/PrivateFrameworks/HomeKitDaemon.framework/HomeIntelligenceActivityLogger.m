@interface HomeIntelligenceActivityLogger
- (HomeIntelligenceActivityLogger)init;
- (HomeIntelligenceActivityLogger)initWithHome:(id)a3;
- (void)configure;
@end

@implementation HomeIntelligenceActivityLogger

- (HomeIntelligenceActivityLogger)initWithHome:(id)a3
{
  id v4 = a3;
  return (HomeIntelligenceActivityLogger *)HomeIntelligence.ActivityLogger.init(home:)(a3);
}

- (void)configure
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = self;
  v8[5] = ObjectType;
  v9 = self;
  sub_22F54F824((uint64_t)v6, (uint64_t)&unk_2686D72D8, (uint64_t)v8);
  swift_release();
}

- (HomeIntelligenceActivityLogger)init
{
  result = (HomeIntelligenceActivityLogger *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  sub_22F54F3D4((uint64_t)self + OBJC_IVAR___HomeIntelligenceActivityLogger_eventStream, &qword_2686D6E88);
  swift_bridgeObjectRelease();
  swift_release();
}

@end