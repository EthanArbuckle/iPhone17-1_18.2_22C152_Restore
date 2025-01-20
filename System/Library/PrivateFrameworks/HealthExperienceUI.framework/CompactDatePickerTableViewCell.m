@interface CompactDatePickerTableViewCell
- (CGPoint)accessibilityActivationPoint;
- (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)compactDatePickerView:(id)a3 didChangeValue:(id)a4;
@end

@implementation CompactDatePickerTableViewCell

- (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)_sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell *)CompactDatePickerTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___containerView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___compactPicker) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI30CompactDatePickerTableViewCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)compactDatePickerView:(id)a3 didChangeValue:(id)a4
{
  uint64_t v6 = sub_1AD73A600();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A5D0();
  id v10 = a3;
  v11 = self;
  sub_1AD530BCC((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = self;
  id v3 = sub_1AD52FF0C();
  objc_msgSend(v3, sel_accessibilityActivationPoint);
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI30CompactDatePickerTableViewCell____lazy_storage___compactPicker);
}

@end