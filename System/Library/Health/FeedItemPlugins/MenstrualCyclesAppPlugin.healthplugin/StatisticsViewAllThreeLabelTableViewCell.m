@interface StatisticsViewAllThreeLabelTableViewCell
- (_TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation StatisticsViewAllThreeLabelTableViewCell

- (_TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell *)sub_24146EC40((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24146CF10);
}

- (_TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24147090C(&OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell_descriptionLabel, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell_valueLabel, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell_captionLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell_valueLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40StatisticsViewAllThreeLabelTableViewCell_captionLabel);
}

@end