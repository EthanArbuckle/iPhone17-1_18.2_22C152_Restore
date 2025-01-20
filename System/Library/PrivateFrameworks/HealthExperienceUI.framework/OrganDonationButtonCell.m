@interface OrganDonationButtonCell
- (_TtC18HealthExperienceUI23OrganDonationButtonCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI23OrganDonationButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation OrganDonationButtonCell

- (_TtC18HealthExperienceUI23OrganDonationButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23OrganDonationButtonCell_item;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((void *)v6 + 4) = 0;
    v7 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23OrganDonationButtonCell_item;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((void *)v8 + 4) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for OrganDonationButtonCell();
  v9 = [(OrganDonationButtonCell *)&v11 initWithStyle:a3 reuseIdentifier:v7];

  return v9;
}

- (_TtC18HealthExperienceUI23OrganDonationButtonCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23OrganDonationButtonCell_item;
  v6 = (objc_class *)type metadata accessor for OrganDonationButtonCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(OrganDonationButtonCell *)&v8 initWithCoder:a3];
}

- (void)awakeFromNib
{
  v2 = self;
  sub_1AD632DCC();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void).cxx_destruct
{
}

@end