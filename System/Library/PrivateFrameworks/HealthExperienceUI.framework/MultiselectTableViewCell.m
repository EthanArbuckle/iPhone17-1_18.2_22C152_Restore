@interface MultiselectTableViewCell
- (_TtC18HealthExperienceUI24MultiselectTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI24MultiselectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MultiselectTableViewCell

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD483838(a3);
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1AD483A18();
}

- (_TtC18HealthExperienceUI24MultiselectTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  sub_1AD483E30(v4, v5);
  return result;
}

- (_TtC18HealthExperienceUI24MultiselectTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD484180();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24MultiselectTableViewCell_accessoryImage));
  id v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI24MultiselectTableViewCell_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

@end