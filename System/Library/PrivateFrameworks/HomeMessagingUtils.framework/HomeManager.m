@interface HomeManager
- (_TtC18HomeMessagingUtils11HomeManager)init;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation HomeManager

- (_TtC18HomeMessagingUtils11HomeManager)init
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for HomeManager());
  v3 = HomeManager.init(homeDelegate:options:cachePolicy:)(0, 0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC18HomeMessagingUtils11HomeManager *)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_accessorySettingsDataSource));

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = self;
  HomeManager.homeManagerDidUpdateHomes(_:)((HMHomeManager)v4);
}

@end