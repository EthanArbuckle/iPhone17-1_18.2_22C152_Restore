@interface APSubject
+ (APSubject)hiddenMetaSubject;
+ (APSubject)lockedMetaSubject;
+ (id)subjectMonitorRegistry;
- (APSubject)init;
- (APSubject)initWithArena:(id)a3;
- (BOOL)hidden;
- (BOOL)locked;
- (BOOL)shieldable;
- (id)effectiveBundleIdentifier;
@end

@implementation APSubject

+ (APSubject)hiddenMetaSubject
{
  return (APSubject *)sub_247D30EA8((uint64_t)a1, (uint64_t)a2, &qword_2692C97F8, (void **)&qword_2692CF1D0);
}

+ (id)subjectMonitorRegistry
{
  if (qword_26B138EF8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26B1392A8;
  v3 = __swift_project_boxed_opaque_existential_1(qword_26B139290, qword_26B1392A8);
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v3, v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  v7 = (void *)*((void *)v6 + 6);
  v8 = *(void (**)(char *, uint64_t))(v4 + 8);
  swift_unknownObjectRetain();
  v8(v6, v2);
  return v7;
}

- (void).cxx_destruct
{
}

- (APSubject)initWithArena:(id)a3
{
  sub_247D3A424((uint64_t)a3 + OBJC_IVAR____TtC13AppProtectionP33_215D8CF8FF516198782505704A9473C518ClientArenaWrapper_arena, (uint64_t)self + OBJC_IVAR___APSubject_clientArenaStorage);
  v5.receiver = self;
  v5.super_class = (Class)APSubject;
  return [(APSubject *)&v5 init];
}

- (BOOL)hidden
{
  BOOL result = sub_247DD3210();
  __break(1u);
  return result;
}

- (BOOL)locked
{
  BOOL result = sub_247DD3210();
  __break(1u);
  return result;
}

+ (APSubject)lockedMetaSubject
{
  return (APSubject *)sub_247D30EA8((uint64_t)a1, (uint64_t)a2, qword_2692CA290, (void **)&qword_2692CF248);
}

- (APSubject)init
{
  BOOL result = (APSubject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)effectiveBundleIdentifier
{
  id result = (id)sub_247DD3210();
  __break(1u);
  return result;
}

- (BOOL)shieldable
{
  return 1;
}

@end