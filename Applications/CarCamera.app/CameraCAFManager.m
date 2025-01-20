@interface CameraCAFManager
- (_TtC9CarCamera16CameraCAFManager)init;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
@end

@implementation CameraCAFManager

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100029FD0(v4);
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002A9E4();
}

- (_TtC9CarCamera16CameraCAFManager)init
{
  result = (_TtC9CarCamera16CameraCAFManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9CarCamera16CameraCAFManager__model;
  uint64_t v4 = sub_100005214(&qword_100040180);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_bridgeObjectRelease();

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carManager);
}

@end