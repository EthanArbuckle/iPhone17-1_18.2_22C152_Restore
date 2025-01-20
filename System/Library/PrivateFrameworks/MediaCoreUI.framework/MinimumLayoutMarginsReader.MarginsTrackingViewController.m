@interface MinimumLayoutMarginsReader.MarginsTrackingViewController
- (_TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController)init;
- (_TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController)initWithCoder:(id)a3;
- (_TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewLayoutMarginsDidChange;
@end

@implementation MinimumLayoutMarginsReader.MarginsTrackingViewController

- (_TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController_minimumLayoutMargins) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MinimumLayoutMarginsReader.MarginsTrackingViewController();
  return [(MinimumLayoutMarginsReader.MarginsTrackingViewController *)&v3 initWithNibName:0 bundle:0];
}

- (_TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController_minimumLayoutMargins) = 0;
  id v4 = a3;

  result = (_TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController *)sub_255C81248();
  __break(1u);
  return result;
}

- (void)viewLayoutMarginsDidChange
{
  v2 = self;
  sub_255C3C428();
}

- (_TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtCV11MediaCoreUI26MinimumLayoutMarginsReader29MarginsTrackingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end