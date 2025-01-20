@interface MOSecureWindow
- (_TtC16MomentsUIService14MOSecureWindow)initWithCoder:(id)a3;
- (_TtC16MomentsUIService14MOSecureWindow)initWithContentRect:(CGRect)a3;
- (_TtC16MomentsUIService14MOSecureWindow)initWithFrame:(CGRect)a3;
- (_TtC16MomentsUIService14MOSecureWindow)initWithWindowScene:(id)a3;
@end

@implementation MOSecureWindow

- (_TtC16MomentsUIService14MOSecureWindow)initWithCoder:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<MOAngelControllerWrapper>);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)self + OBJC_IVAR____TtC16MomentsUIService14MOSecureWindow__controller;
  id v10 = objc_allocWithZone((Class)type metadata accessor for MOAngelControllerWrapper());
  id v11 = a3;
  v13[1] = [v10 init];
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v8, v5);

  result = (_TtC16MomentsUIService14MOSecureWindow *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService14MOSecureWindow)initWithWindowScene:(id)a3
{
  id v3 = a3;
  result = (_TtC16MomentsUIService14MOSecureWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService14MOSecureWindow)initWithFrame:(CGRect)a3
{
}

- (_TtC16MomentsUIService14MOSecureWindow)initWithContentRect:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService14MOSecureWindow__controller;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<MOAngelControllerWrapper>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC16MomentsUIService14MOSecureWindow_clientConnectionId;

  outlined destroy of UUID?((uint64_t)v5);
}

@end