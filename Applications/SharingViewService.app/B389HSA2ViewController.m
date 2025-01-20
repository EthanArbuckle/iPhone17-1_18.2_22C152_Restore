@interface B389HSA2ViewController
- (_TtC18SharingViewService22B389HSA2ViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService22B389HSA2ViewController)initWithMainController:(id)a3;
- (_TtC18SharingViewService22B389HSA2ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissPressed;
- (void)updateSettingsPressed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B389HSA2ViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10005B5CC(a3);
}

- (void)updateSettingsPressed
{
  v2 = self;
  sub_10005C0CC();
}

- (void)dismissPressed
{
  v2 = self;
  sub_10005C494();
}

- (_TtC18SharingViewService22B389HSA2ViewController)initWithMainController:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_btn) = 0;
  uint64_t v5 = OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_msgLbl;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v9 = OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_lockImageView;
  *(Class *)((char *)&v8->super.super.super.super.isa + v9) = (Class)[objc_allocWithZone((Class)UIImageView) init];

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for B389HSA2ViewController();
  v10 = [(SVSBaseViewController *)&v12 initWithMainController:v7];

  return v10;
}

- (_TtC18SharingViewService22B389HSA2ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService22B389HSA2ViewController *)sub_100060958((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10005C704);
}

- (_TtC18SharingViewService22B389HSA2ViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService22B389HSA2ViewController *)sub_10005C81C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_btn));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_msgLbl));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18SharingViewService22B389HSA2ViewController_lockImageView);
}

@end