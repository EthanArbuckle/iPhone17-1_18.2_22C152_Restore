@interface MultiselectTableViewCell
- (_TtC16HealthMobilityUI24MultiselectTableViewCell)initWithCoder:(id)a3;
- (_TtC16HealthMobilityUI24MultiselectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation MultiselectTableViewCell

- (_TtC16HealthMobilityUI24MultiselectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1E0B06798();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  sub_1E0B0487C(v4, v5);
  return result;
}

- (_TtC16HealthMobilityUI24MultiselectTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E0B04B34();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor));
  id v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item;
  sub_1E0AF1014((uint64_t)v3);
}

@end