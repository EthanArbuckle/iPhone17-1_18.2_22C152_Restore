@interface FullscreenAlertViewController
- (_TtC11Diagnostics29FullscreenAlertViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics29FullscreenAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation FullscreenAlertViewController

- (_TtC11Diagnostics29FullscreenAlertViewController)initWithCoder:(id)a3
{
  id v5 = objc_allocWithZone((Class)_UIContentUnavailableView);
  id v6 = a3;
  v7 = [v5 initWithFrame:0 title:0 style:0.0];
  if (!v7) {
    __break(1u);
  }
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_contentUnavailableView) = v7;

  result = (_TtC11Diagnostics29FullscreenAlertViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics29FullscreenAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11Diagnostics29FullscreenAlertViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000648CC(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert), *(void **)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert], *(void *)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 8], *(void *)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 16], *(void *)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 24], *(void *)&self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 32], self->alert[OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_alert + 40]);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics29FullscreenAlertViewController_contentUnavailableView);
}

@end