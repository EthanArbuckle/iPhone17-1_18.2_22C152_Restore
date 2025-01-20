@interface DBCameraViewController
- (BOOL)isPersistent;
- (NSString)sceneIdentifier;
- (_TtC9DashBoard22DBCameraViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5;
- (_TtC9DashBoard22DBCameraViewController)initWithEnvironment:(id)a3;
- (void)loadView;
- (void)sendSceneUpdateWithIsForeground:(BOOL)a3;
@end

@implementation DBCameraViewController

- (_TtC9DashBoard22DBCameraViewController)initWithEnvironment:(id)a3
{
  return (_TtC9DashBoard22DBCameraViewController *)DBCameraViewController.init(environment:)(a3);
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for DBCameraView());
  v4 = self;
  id v5 = objc_msgSend(v3, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  [(DBCameraViewController *)v4 setView:v5];
}

- (void)sendSceneUpdateWithIsForeground:(BOOL)a3
{
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = a3;
  v8[4] = sub_22D7FCB38;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_22D7FC400;
  v8[3] = &block_descriptor_14;
  v6 = _Block_copy(v8);
  v7 = self;
  swift_release();
  [(DBSceneHostViewController *)v7 performSceneUpdateWithBlock:v6 completion:0];
  _Block_release(v6);
}

- (_TtC9DashBoard22DBCameraViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  swift_unknownObjectRetain();
  result = (_TtC9DashBoard22DBCameraViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)sceneIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22D85E4B8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isPersistent
{
  return 1;
}

@end