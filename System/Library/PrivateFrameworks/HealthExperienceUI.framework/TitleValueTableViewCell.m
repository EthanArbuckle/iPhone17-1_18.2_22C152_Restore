@interface TitleValueTableViewCell
- (_TtC18HealthExperienceUI23TitleValueTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI23TitleValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)tintColorDidChange;
@end

@implementation TitleValueTableViewCell

- (_TtC18HealthExperienceUI23TitleValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23TitleValueTableViewCell_item;
    *(_OWORD *)v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((void *)v5 + 4) = 0;
    v6 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    v7 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23TitleValueTableViewCell_item;
    *(_OWORD *)v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((void *)v7 + 4) = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  v8 = [(TitleValueTableViewCell *)&v10 initWithStyle:1 reuseIdentifier:v6];

  return v8;
}

- (_TtC18HealthExperienceUI23TitleValueTableViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23TitleValueTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI23TitleValueTableViewCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  id v2 = v6.receiver;
  [(TitleValueTableViewCell *)&v6 tintColorDidChange];
  id v3 = objc_msgSend(v2, sel_detailTextLabel, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(v2, sel_tintColor);
    objc_msgSend(v4, sel_setTextColor_, v5);

    id v2 = v4;
  }
}

- (void).cxx_destruct
{
}

@end