@interface B389PairLockedViewController
- (_TtC18SharingViewService28B389PairLockedViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService28B389PairLockedViewController)initWithMainController:(id)a3;
- (_TtC18SharingViewService28B389PairLockedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissPressed;
- (void)learnMorePressed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B389PairLockedViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10005C9A0(a3);
}

- (void)learnMorePressed
{
  v2 = self;
  sub_10005D8AC();
}

- (void)dismissPressed
{
  v2 = self;
  sub_10005DD28();
}

- (_TtC18SharingViewService28B389PairLockedViewController)initWithMainController:(id)a3
{
  id v3 = a3;
  v4 = (_TtC18SharingViewService28B389PairLockedViewController *)sub_100069750((uint64_t)v3);

  return v4;
}

- (_TtC18SharingViewService28B389PairLockedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService28B389PairLockedViewController *)sub_100060958((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10005DF98);
}

- (_TtC18SharingViewService28B389PairLockedViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService28B389PairLockedViewController *)sub_10005E0CC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService28B389PairLockedViewController_btn));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService28B389PairLockedViewController_msgLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService28B389PairLockedViewController_avatarImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18SharingViewService28B389PairLockedViewController_lockImageView);
}

@end