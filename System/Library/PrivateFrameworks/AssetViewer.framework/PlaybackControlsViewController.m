@interface PlaybackControlsViewController
- (_TtC11AssetViewer30PlaybackControlsViewController)init;
- (_TtC11AssetViewer30PlaybackControlsViewController)initWithCoder:(id)a3;
- (_TtC11AssetViewer30PlaybackControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation PlaybackControlsViewController

- (_TtC11AssetViewer30PlaybackControlsViewController)init
{
  return (_TtC11AssetViewer30PlaybackControlsViewController *)sub_1E28AF6D8();
}

- (_TtC11AssetViewer30PlaybackControlsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E28B4C50();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1E28AF8B4();
}

- (_TtC11AssetViewer30PlaybackControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11AssetViewer30PlaybackControlsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer30PlaybackControlsViewController_scrubberView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer30PlaybackControlsViewController_backgroundView);
}

@end