@interface AirTagErrorViewController
- (_TtC18SharingViewService25AirTagErrorViewController)initWithContentView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AirTagErrorViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000FB3A8(a3);
}

- (_TtC18SharingViewService25AirTagErrorViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC18SharingViewService25AirTagErrorViewController *)sub_1000FBFDC((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_100017C38(*(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_onDoneAction]);
  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end