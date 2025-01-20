@interface StatisticsViewAllLargeTextThreeLabelTableViewCell
- (_TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation StatisticsViewAllLargeTextThreeLabelTableViewCell

- (_TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell *)sub_24146EC40((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24146EB08);
}

- (_TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24147090C(&OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell_descriptionLabel, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell_valueLabel, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell_captionLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell_valueLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49StatisticsViewAllLargeTextThreeLabelTableViewCell_captionLabel);
}

@end