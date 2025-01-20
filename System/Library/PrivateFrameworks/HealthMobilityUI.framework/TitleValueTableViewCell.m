@interface TitleValueTableViewCell
- (_TtC16HealthMobilityUI23TitleValueTableViewCell)initWithCoder:(id)a3;
- (_TtC16HealthMobilityUI23TitleValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)tintColorDidChange;
@end

@implementation TitleValueTableViewCell

- (_TtC16HealthMobilityUI23TitleValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1E0B06798();
    v5 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
    *(_OWORD *)v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((void *)v5 + 4) = 0;
    v6 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    v7 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
    *(_OWORD *)v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((void *)v7 + 4) = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  v8 = [(TitleValueTableViewCell *)&v10 initWithStyle:1 reuseIdentifier:v6];

  return v8;
}

- (_TtC16HealthMobilityUI23TitleValueTableViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC16HealthMobilityUI23TitleValueTableViewCell *)sub_1E0B06B38();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  id v2 = v3.receiver;
  [(TitleValueTableViewCell *)&v3 tintColorDidChange];
  sub_1E0AEA59C();
}

- (void).cxx_destruct
{
}

@end