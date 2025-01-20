@interface DateTableViewCell
- (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell)init;
- (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DateTableViewCell

- (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell)init
{
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void))(ObjectType + 80))();
  v4 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();
  v5 = [(DateTableViewCell *)self initWithStyle:1 reuseIdentifier:v4];

  return v5;
}

- (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for DateTableViewCell();
  v7 = [(DateTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  [(DateTableViewCell *)v7 setSelectionStyle:0];
  return v7;
}

- (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin17DateTableViewCell *)sub_241633038();
  __break(1u);
  return result;
}

@end