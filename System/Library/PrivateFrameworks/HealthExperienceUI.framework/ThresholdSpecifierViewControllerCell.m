@interface ThresholdSpecifierViewControllerCell
- (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ThresholdSpecifierViewControllerCell

- (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v5 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ThresholdSpecifierViewControllerCell();
  v6 = [(ThresholdSpecifierViewControllerCell *)&v8 initWithStyle:3 reuseIdentifier:v5];

  return v6;
}

- (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  sub_1AD33CFEC(a3, v7, v9, a5);
  return result;
}

- (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD33D254(a3);
}

@end