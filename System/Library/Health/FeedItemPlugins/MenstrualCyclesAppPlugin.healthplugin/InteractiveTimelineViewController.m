@interface InteractiveTimelineViewController
- (_TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)respondToHorizontalSizeChanges;
- (void)scrollToCurrentDay;
- (void)updateConstraintConstants;
- (void)viewDidLoad;
@end

@implementation InteractiveTimelineViewController

- (_TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2415775BC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_241574D10();
}

- (void)scrollToCurrentDay
{
  v2 = self;
  sub_24157648C();
}

- (_TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController____lazy_storage___dateIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController____lazy_storage___downArrow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController____lazy_storage___timeline));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController____lazy_storage___legend));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController_timelineHeight));
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)respondToHorizontalSizeChanges
{
  v2 = self;
  sub_241576A30();
}

- (void)updateConstraintConstants
{
  v2 = self;
  sub_241576E38();
}

@end