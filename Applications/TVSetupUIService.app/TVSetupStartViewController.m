@interface TVSetupStartViewController
- (_TtC16TVSetupUIService26TVSetupStartViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSetupStartViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100003560();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100003F18(a3);
}

- (_TtC16TVSetupUIService26TVSetupStartViewController)initWithContentView:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  *(_WORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode] = 256;
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted] = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  return [(TVSetupStartViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_100005140((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate]);

  swift_bridgeObjectRelease();
}

@end