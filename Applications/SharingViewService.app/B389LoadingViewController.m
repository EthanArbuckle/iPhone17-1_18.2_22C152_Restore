@interface B389LoadingViewController
- (_TtC18SharingViewService25B389LoadingViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService25B389LoadingViewController)initWithMainController:(id)a3;
- (_TtC18SharingViewService25B389LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissPressed:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B389LoadingViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10001BB58(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for B389LoadingViewController();
  [(B389LoadingViewController *)&v4 viewDidDisappear:v3];
}

- (void)dismissPressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001C980();
}

- (_TtC18SharingViewService25B389LoadingViewController)initWithMainController:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_titleLabel) = 0;
  uint64_t v5 = OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_connectingLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&v8->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_spinner) = 0;
  *(Class *)((char *)&v8->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_player) = 0;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for B389LoadingViewController();
  v9 = [(SVSBaseViewController *)&v11 initWithMainController:v7];

  return v9;
}

- (_TtC18SharingViewService25B389LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18SharingViewService25B389LoadingViewController *)sub_10001C4F8(v5, v7, a4);
}

- (_TtC18SharingViewService25B389LoadingViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService25B389LoadingViewController *)sub_10001C650(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_connectingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_spinner));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_player);
}

@end