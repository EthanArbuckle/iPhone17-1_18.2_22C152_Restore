@interface MAGAngelSystemApertureSceneDelegate
- (_TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation MAGAngelSystemApertureSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10002AE34(v8);
}

- (_TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_window) = 0;
  uint64_t v4 = OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_systemApertureElementProvider;
  type metadata accessor for MAGAngelSystemApertureViewController();
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)[v5 init];

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(MAGAngelSystemApertureSceneDelegate *)&v8 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_window));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_systemApertureElementProvider);
}

@end