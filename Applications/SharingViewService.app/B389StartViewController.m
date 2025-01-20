@interface B389StartViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC18SharingViewService23B389StartViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService23B389StartViewController)initWithMainController:(id)a3;
- (_TtC18SharingViewService23B389StartViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)continuePressed;
- (void)dismissPressed;
- (void)handleTapOutside;
- (void)transitionOutOfMulti;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B389StartViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10005461C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100057750(a3);
}

- (void)transitionOutOfMulti
{
  v2 = self;
  sub_100057A3C();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000591C0(a3);
}

- (void)dismissPressed
{
  v2 = self;
  sub_10005939C();
}

- (void)continuePressed
{
  v2 = self;
  sub_1000593EC();
}

- (void)handleTapOutside
{
  v2 = self;
  sub_100059810();
}

- (_TtC18SharingViewService23B389StartViewController)initWithMainController:(id)a3
{
  id v3 = a3;
  v4 = (_TtC18SharingViewService23B389StartViewController *)sub_1000693F8((uint64_t)v3);

  return v4;
}

- (_TtC18SharingViewService23B389StartViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService23B389StartViewController *)sub_100060958((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100059DC4);
}

- (_TtC18SharingViewService23B389StartViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService23B389StartViewController *)sub_100059F50(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_player));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_mainBtn));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_playerYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_topInfoLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B389StartViewController_bottomInfoLbl));
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100069524(v6, v7);

  return v9 & 1;
}

@end