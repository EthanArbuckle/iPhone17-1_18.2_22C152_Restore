@interface ConsentNoticeViewController
- (BOOL)hasSecondaryButton;
- (_TtC11Diagnostics27ConsentNoticeViewController)init;
- (_TtC11Diagnostics27ConsentNoticeViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics27ConsentNoticeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelButtonPressed:(id)a3;
- (void)primaryButtonPressed:(id)a3;
- (void)secondaryButtonPressed:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ConsentNoticeViewController

- (_TtC11Diagnostics27ConsentNoticeViewController)init
{
  return (_TtC11Diagnostics27ConsentNoticeViewController *)sub_100092CFC();
}

- (_TtC11Diagnostics27ConsentNoticeViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics27ConsentNoticeViewController *)sub_100093014(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10009333C(a3);
}

- (BOOL)hasSecondaryButton
{
  return 1;
}

- (void)primaryButtonPressed:(id)a3
{
}

- (void)secondaryButtonPressed:(id)a3
{
}

- (void)cancelButtonPressed:(id)a3
{
}

- (_TtC11Diagnostics27ConsentNoticeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11Diagnostics27ConsentNoticeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_primaryAction));
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_secondaryAction));
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_cancelAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_primaryButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics27ConsentNoticeViewController_secondaryButton);
}

@end