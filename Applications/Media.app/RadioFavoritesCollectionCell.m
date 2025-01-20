@interface RadioFavoritesCollectionCell
- (_TtC5Media28RadioFavoritesCollectionCell)initWithCoder:(id)a3;
- (_TtC5Media28RadioFavoritesCollectionCell)initWithFrame:(CGRect)a3;
- (void)unfavorite;
@end

@implementation RadioFavoritesCollectionCell

- (_TtC5Media28RadioFavoritesCollectionCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Media28RadioFavoritesCollectionCell *)sub_100037A0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Media28RadioFavoritesCollectionCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10003A29C();
}

- (void)unfavorite
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_config))
  {
    v2 = self;
    swift_retain();
    TerrestrialRadioStation.setFavorite(_:)(0);

    swift_release();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_stationLogoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_backgroundPlatter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_waveformView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_multicastBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell____lazy_storage___deleteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell____lazy_storage___secondaryLabel));

  swift_bridgeObjectRelease();
}

@end