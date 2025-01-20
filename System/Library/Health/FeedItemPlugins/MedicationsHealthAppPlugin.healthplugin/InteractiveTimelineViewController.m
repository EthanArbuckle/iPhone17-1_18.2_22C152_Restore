@interface InteractiveTimelineViewController
- (_TtC26MedicationsHealthAppPlugin33InteractiveTimelineViewController)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin33InteractiveTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)scrollToCurrentDay;
- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4;
- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation InteractiveTimelineViewController

- (_TtC26MedicationsHealthAppPlugin33InteractiveTimelineViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_241113AEC();
}

- (void)viewDidLoad
{
  v2 = self;
  InteractiveTimelineViewController.viewDidLoad()();
}

- (void)scrollToCurrentDay
{
  v2 = self;
  sub_241111868();
}

- (_TtC26MedicationsHealthAppPlugin33InteractiveTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC26MedicationsHealthAppPlugin33InteractiveTimelineViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33InteractiveTimelineViewController_focusIndicatorImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33InteractiveTimelineViewController____lazy_storage___timelineViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33InteractiveTimelineViewController_dateIndicator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin33InteractiveTimelineViewController_timelineHeight);
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_241113C3C(a4, "[%{public}s] splitViewController willHide %ld");
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_241113C3C(a4, "[%{public}s] splitViewController willShow %ld");
}

@end