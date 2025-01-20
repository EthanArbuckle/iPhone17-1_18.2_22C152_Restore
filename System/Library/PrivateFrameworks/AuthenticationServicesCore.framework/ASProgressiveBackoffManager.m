@interface ASProgressiveBackoffManager
- (_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager)init;
- (_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager)initWithNumberOfOperationsBeforeTriggeringBackoff:(int64_t)a3 minimumCooldownDurationSeconds:(double)a4;
- (void)performAfterBackoffForContext:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation ASProgressiveBackoffManager

- (_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager)initWithNumberOfOperationsBeforeTriggeringBackoff:(int64_t)a3 minimumCooldownDurationSeconds:(double)a4
{
  v6 = (objc_class *)type metadata accessor for ASProgressiveBackoffManager();
  uint64_t v7 = swift_allocObject();
  swift_defaultActor_initialize();
  swift_retain();
  *(void *)(v7 + 128) = sub_219391BD4(MEMORY[0x263F8EE78]);
  *(void *)(v7 + 112) = a3;
  *(double *)(v7 + 120) = a4;
  swift_release();
  v10.receiver = (id)v7;
  v10.super_class = v6;
  v8 = [(ASProgressiveBackoffManager *)&v10 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (void)performAfterBackoffForContext:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27638);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2193E2A60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267C1A378;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267C19E00;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2193D88D4((uint64_t)v9, (uint64_t)&unk_267C19480, (uint64_t)v14);
  swift_release();
}

- (_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager)init
{
  swift_defaultActor_initialize();
  result = (_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end