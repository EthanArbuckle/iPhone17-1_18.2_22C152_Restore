@interface QueryController
- (NSString)description;
- (_TtC19ExtensionFoundation15QueryController)init;
- (void)dealloc;
- (void)resultDidUpdate:(id)a3;
@end

@implementation QueryController

- (void)dealloc
{
  v2 = self;
  sub_191F86B48();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for QueryController();
  [(QueryController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC19ExtensionFoundation15QueryController_id;
  uint64_t v4 = sub_191FB9C68();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_191F396B4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19ExtensionFoundation15QueryController_callbacks), *(void *)&self->_anon_0[OBJC_IVAR____TtC19ExtensionFoundation15QueryController_callbacks], *(void *)&self->callbacks[OBJC_IVAR____TtC19ExtensionFoundation15QueryController_callbacks]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ExtensionFoundation15QueryController_notificationQueue);
}

- (void)resultDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191F3A588(v4);
}

- (NSString)description
{
  v2 = self;
  sub_191F872AC();

  objc_super v3 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC19ExtensionFoundation15QueryController)init
{
  result = (_TtC19ExtensionFoundation15QueryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end