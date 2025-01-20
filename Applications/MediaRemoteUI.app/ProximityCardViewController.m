@interface ProximityCardViewController
- (BOOL)_canShowWhileLocked;
- (_TtC13MediaRemoteUI27ProximityCardViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation ProximityCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000105AC();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC13MediaRemoteUI27ProximityCardViewController)initWithContentView:(id)a3
{
  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_image] = 0;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url];
  uint64_t v7 = type metadata accessor for URL();
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ProximityCardViewController();
  return [(ProximityCardViewController *)&v9 initWithContentView:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url];

  sub_1000116B0((uint64_t)v3);
}

@end