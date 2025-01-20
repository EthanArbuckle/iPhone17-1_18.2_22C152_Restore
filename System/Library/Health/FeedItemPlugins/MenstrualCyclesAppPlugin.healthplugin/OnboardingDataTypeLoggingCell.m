@interface OnboardingDataTypeLoggingCell
- (_TtC24MenstrualCyclesAppPlugin29OnboardingDataTypeLoggingCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin29OnboardingDataTypeLoggingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation OnboardingDataTypeLoggingCell

- (_TtC24MenstrualCyclesAppPlugin29OnboardingDataTypeLoggingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    v6 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for OnboardingDataTypeLoggingCell();
  v7 = [(DataTypeLoggingCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC24MenstrualCyclesAppPlugin29OnboardingDataTypeLoggingCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OnboardingDataTypeLoggingCell();
  return [(DataTypeLoggingCell *)&v5 initWithCoder:a3];
}

@end