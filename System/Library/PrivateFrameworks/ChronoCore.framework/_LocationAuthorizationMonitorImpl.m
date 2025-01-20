@interface _LocationAuthorizationMonitorImpl
- (_TtC10ChronoCore33_LocationAuthorizationMonitorImpl)init;
- (void)dealloc;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation _LocationAuthorizationMonitorImpl

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_manager))
  {
    __break(1u);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)swift_getObjectType();
    id v2 = v3.receiver;
    [(_LocationAuthorizationMonitorImpl *)&v3 dealloc];
  }
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_containerIdentifier;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE4BF60);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1DA9F5534(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl__didChangeHandler));
  swift_unknownObjectRelease();

  swift_release();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DAD20064();
}

- (_TtC10ChronoCore33_LocationAuthorizationMonitorImpl)init
{
  result = (_TtC10ChronoCore33_LocationAuthorizationMonitorImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end