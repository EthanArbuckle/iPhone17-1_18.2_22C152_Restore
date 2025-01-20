@interface PersonalHotspotStateProvider
- (_TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider)init;
- (void)dealloc;
@end

@implementation PersonalHotspotStateProvider

- (void)dealloc
{
  v2 = self;
  sub_100005018();
}

- (_TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider)init
{
  v2 = (char *)self
     + OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___misClient;
  *(void *)v2 = 0;
  v2[8] = 1;
  v3 = (char *)self
     + OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___wifiClient;
  *(void *)v3 = 0;
  v3[8] = 1;
  v4 = (char *)self
     + OBJC_IVAR____TtC31PersonalHotspotControlExtension28PersonalHotspotStateProvider____lazy_storage___cellularClient;
  *(void *)v4 = 0;
  v4[8] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PersonalHotspotStateProvider();
  return [(PersonalHotspotStateProvider *)&v6 init];
}

@end