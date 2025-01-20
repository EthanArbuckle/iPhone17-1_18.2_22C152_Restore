@interface ResettableCalendarDateDisplayCell
- (_TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell)initWithFrame:(CGRect)a3;
- (void)didTapClear;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ResettableCalendarDateDisplayCell

- (_TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell *)sub_1AD302830(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI33ResettableCalendarDateDisplayCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)didTapClear
{
  v2 = self;
  sub_1AD302C5C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD304014(a3);
}

- (void).cxx_destruct
{
  sub_1AD206F70((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_item, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_clearButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI33ResettableCalendarDateDisplayCell_clearButtonWidthConstraint);
}

@end