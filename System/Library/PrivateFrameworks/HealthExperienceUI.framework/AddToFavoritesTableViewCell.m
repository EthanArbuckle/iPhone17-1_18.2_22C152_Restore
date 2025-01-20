@interface AddToFavoritesTableViewCell
- (_TtC18HealthExperienceUI27AddToFavoritesTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27AddToFavoritesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation AddToFavoritesTableViewCell

- (_TtC18HealthExperienceUI27AddToFavoritesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___pinImage) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___unpinImage) = (Class)1;
  if (v6)
  {
    v8 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AddToFavoritesTableViewCell();
  v9 = [(AddToFavoritesTableViewCell *)&v11 initWithStyle:1 reuseIdentifier:v8];

  return v9;
}

- (_TtC18HealthExperienceUI27AddToFavoritesTableViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___pinImage) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___unpinImage) = (Class)1;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI27AddToFavoritesTableViewCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  sub_1AD1ACD5C(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___pinImage));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___unpinImage);
  sub_1AD1ACD5C(v3);
}

@end