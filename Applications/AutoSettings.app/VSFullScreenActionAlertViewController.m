@interface VSFullScreenActionAlertViewController
- (_TtC12AutoSettings37VSFullScreenActionAlertViewController)initWithCoder:(id)a3;
- (_TtC12AutoSettings37VSFullScreenActionAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelButtonTapped;
- (void)primaryAction;
- (void)viewDidLoad;
@end

@implementation VSFullScreenActionAlertViewController

- (void)cancelButtonTapped
{
}

- (_TtC12AutoSettings37VSFullScreenActionAlertViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000F4B0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000EBE8();
}

- (void)primaryAction
{
  v2 = *(void (**)(void))((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_action);
  if (v2)
  {
    id v3 = self;
    v2();
  }
}

- (_TtC12AutoSettings37VSFullScreenActionAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12AutoSettings37VSFullScreenActionAlertViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000F5C4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_action));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_messageLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton);
}

@end