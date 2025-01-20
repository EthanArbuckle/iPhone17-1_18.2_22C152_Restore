@interface B389AppleIDViewController
- (_TtC18SharingViewService25B389AppleIDViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService25B389AppleIDViewController)initWithMainController:(id)a3;
- (_TtC18SharingViewService25B389AppleIDViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissPressed;
- (void)openSettingsPressed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B389AppleIDViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10005A3B8(a3);
}

- (void)openSettingsPressed
{
  v2 = self;
  sub_10005AD60();
}

- (void)dismissPressed
{
  v2 = self;
  sub_10005AF8C();
}

- (_TtC18SharingViewService25B389AppleIDViewController)initWithMainController:(id)a3
{
  id v3 = a3;
  v4 = (_TtC18SharingViewService25B389AppleIDViewController *)sub_1000695EC((uint64_t)v3);

  return v4;
}

- (_TtC18SharingViewService25B389AppleIDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService25B389AppleIDViewController *)sub_100060958((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10005B014);
}

- (_TtC18SharingViewService25B389AppleIDViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService25B389AppleIDViewController *)sub_10005B1D8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000118F8((uint64_t)self + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_onDoneURL, &qword_1001C7620);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_btn));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_titleLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_msgLbl));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_lockImageView);
}

@end