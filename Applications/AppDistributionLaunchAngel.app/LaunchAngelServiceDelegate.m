@interface LaunchAngelServiceDelegate
- (_TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation LaunchAngelServiceDelegate

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_10003F594(v8);

  swift_unknownObjectRelease();
}

- (_TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate)init
{
  result = (_TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate_service));
}

@end