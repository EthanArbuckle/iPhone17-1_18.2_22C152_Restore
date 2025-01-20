@interface TextTableViewItemCell
- (_TtC18HealthExperienceUI21TextTableViewItemCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI21TextTableViewItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation TextTableViewItemCell

- (_TtC18HealthExperienceUI21TextTableViewItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = ObjectType;
  if (a4)
  {
    uint64_t ObjectType = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    a4 = v8;
  }
  v9 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI21TextTableViewItemCell_item;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(v7 + 88))(ObjectType);
  if (a4)
  {
    v11 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for TextTableViewItemCell();
  v12 = [(TextTableViewItemCell *)&v15 initWithStyle:v10 reuseIdentifier:v11];

  v13 = v12;
  sub_1AD4D05C4();

  return v13;
}

- (_TtC18HealthExperienceUI21TextTableViewItemCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI21TextTableViewItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TextTableViewItemCell();
  id v5 = a3;
  v6 = [(TextTableViewItemCell *)&v10 initWithCoder:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = v6;
    sub_1AD4D05C4();
  }
  return v7;
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextTableViewItemCell();
  id v2 = v7.receiver;
  [(TextTableViewItemCell *)&v7 prepareForReuse];
  id v3 = objc_msgSend(v2, sel_textLabel, v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setText_, 0);
  }
  id v5 = objc_msgSend(v2, sel_detailTextLabel);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_setText_, 0);

    id v2 = v6;
  }
}

- (void).cxx_destruct
{
}

@end