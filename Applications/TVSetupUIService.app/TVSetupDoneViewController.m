@interface TVSetupDoneViewController
- (_TtC16TVSetupUIService25TVSetupDoneViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSetupDoneViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10000CD5C();
}

- (_TtC16TVSetupUIService25TVSetupDoneViewController)initWithContentView:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error] = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TVSetupDoneViewController();
  return [(TVSetupDoneViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_100005140((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate]);
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error];
}

@end