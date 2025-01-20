@interface MAGAngelSceneDelegate
- (_TtC14MagnifierAngel21MAGAngelSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation MAGAngelSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10002AAFC(v8);
}

- (_TtC14MagnifierAngel21MAGAngelSceneDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MagnifierAngel21MAGAngelSceneDelegate_window) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(MAGAngelSceneDelegate *)&v5 init];
}

- (void).cxx_destruct
{
}

@end