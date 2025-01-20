@interface BaseDoubleColumnSplitViewController
- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)init;
- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)initWithStyle:(int64_t)a3;
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (void)setViewController:(id)a3 forColumn:(int64_t)a4;
- (void)showDetailViewController:(id)a3 sender:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation BaseDoubleColumnSplitViewController

- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)init
{
  return (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController *)sub_1AF6BCCE8();
}

- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6BCDD0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF6BCF90();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF6BD1A4((uint64_t)a3);
}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  id v7 = a3;
  v8 = self;
  sub_1AF6BD258(a3, a4);
}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v7 = self;
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    v9 = self;
  }
  sub_1AF6BD3A4((uint64_t)a3);

  sub_1AF36A4F0((uint64_t)v10);
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  int64_t v8 = sub_1AF6BBFFC((uint64_t)v7, a4);

  return v8;
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1AF6BC148((uint64_t)v7, a4);

  return a4;
}

- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  BaseDoubleColumnSplitViewController.init(nibName:bundle:)();
}

- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)initWithStyle:(int64_t)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController_secondaryContainerViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController_cachedSecondarySource);
  uint64_t v4 = *(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController_cachedSecondarySource);
  unsigned __int8 v5 = *((unsigned char *)&self->super.super.super.__layeringSceneIdentity
       + OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController_cachedSecondarySource);

  sub_1AF6BCB18(v3, v4, v5);
}

@end