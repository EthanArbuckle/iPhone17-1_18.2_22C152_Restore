@interface WeakCADisplayLinkTarget
- (_TtC8SOSBuddy23WeakCADisplayLinkTarget)init;
- (void)updateFrom:(id)a3;
@end

@implementation WeakCADisplayLinkTarget

- (void)updateFrom:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8SOSBuddy23WeakCADisplayLinkTarget__target;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 8);
    id v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (_TtC8SOSBuddy23WeakCADisplayLinkTarget)init
{
  result = (_TtC8SOSBuddy23WeakCADisplayLinkTarget *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end