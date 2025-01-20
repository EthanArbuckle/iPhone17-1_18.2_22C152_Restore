@interface FMLostDeviceCardViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC21FindMyRemoteUIService30FMLostDeviceCardViewController)initWithContentView:(id)a3;
@end

@implementation FMLostDeviceCardViewController

- (_TtC21FindMyRemoteUIService30FMLostDeviceCardViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC21FindMyRemoteUIService30FMLostDeviceCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_imageView];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end