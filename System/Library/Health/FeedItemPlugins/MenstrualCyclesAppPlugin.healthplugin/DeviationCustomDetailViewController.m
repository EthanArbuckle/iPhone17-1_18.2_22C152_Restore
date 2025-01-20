@interface DeviationCustomDetailViewController
- (_TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)doneButtonTapped;
- (void)nextButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation DeviationCustomDetailViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_241269518();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_241269F04(a3);
}

- (void)doneButtonTapped
{
  v2 = self;
  sub_24126A9F0();
}

- (void)nextButtonTapped
{
  v2 = self;
  sub_24126AC70();
}

- (_TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController____lazy_storage___contentStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController____lazy_storage___dateRangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationCustomDetailViewController____lazy_storage___detailView));

  swift_bridgeObjectRelease();
}

@end