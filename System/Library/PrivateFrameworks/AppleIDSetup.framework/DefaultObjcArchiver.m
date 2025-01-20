@interface DefaultObjcArchiver
- (_TtC12AppleIDSetup19DefaultObjcArchiver)init;
- (id)initForWritingWithMutableData:(id)a3;
- (id)initRequiringSecureCoding:(BOOL)a3;
- (void)encodeObject:(id)a3 forKey:(id)a4;
@end

@implementation DefaultObjcArchiver

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_248175760();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    v9 = self;
  }
  sub_248175160();

  sub_248173304((uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_247FB33D4((uint64_t)v10, (uint64_t *)&unk_26B13BED0);
}

- (id)initRequiringSecureCoding:(BOOL)a3
{
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12AppleIDSetup19DefaultObjcArchiver)init
{
  id result = (_TtC12AppleIDSetup19DefaultObjcArchiver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initForWritingWithMutableData:(id)a3
{
  id v3 = a3;
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end