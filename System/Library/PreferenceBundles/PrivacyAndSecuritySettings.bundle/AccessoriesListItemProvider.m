@interface AccessoriesListItemProvider
- (_TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider)init;
- (void)dealloc;
@end

@implementation AccessoriesListItemProvider

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_session);
  v5 = self;
  [v4 invalidate];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AccessoriesListItemProvider *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_78F0((uint64_t)self + OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_invalidator);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_session));

  swift_bridgeObjectRelease();
}

- (_TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider)init
{
  result = (_TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end