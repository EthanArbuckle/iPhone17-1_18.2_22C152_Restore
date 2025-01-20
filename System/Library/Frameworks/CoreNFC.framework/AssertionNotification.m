@interface AssertionNotification
- (_TtC7CoreNFC21AssertionNotification)init;
- (void)dealloc;
- (void)didExpire;
- (void)didFinishCooldown;
@end

@implementation AssertionNotification

- (void)didExpire
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52CC0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8[15] = 0;
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F527B0);
  sub_2214FEA00();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)didFinishCooldown
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F52CC0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8[15] = 1;
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F527B0);
  sub_2214FEA00();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  sub_2214FEA10();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F527B0);
  sub_2214FEA10();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(AssertionNotification *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC7CoreNFC21AssertionNotification_eventStreamContinuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F527B0);
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (_TtC7CoreNFC21AssertionNotification)init
{
  result = (_TtC7CoreNFC21AssertionNotification *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end