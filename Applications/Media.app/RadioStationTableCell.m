@interface RadioStationTableCell
- (_TtC5Media21RadioStationTableCell)initWithCoder:(id)a3;
- (_TtC5Media21RadioStationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)toggleFavorite;
@end

@implementation RadioStationTableCell

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)toggleFavorite
{
  v2 = self;
  sub_100036428();
}

- (_TtC5Media21RadioStationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC5Media21RadioStationTableCell *)sub_10003651C(a3, (uint64_t)a4, v6);
}

- (_TtC5Media21RadioStationTableCell)initWithCoder:(id)a3
{
  return (_TtC5Media21RadioStationTableCell *)sub_100036660(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell____lazy_storage___favoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell_imageViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell_imageViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell_waveformView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell____lazy_storage___stationImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media21RadioStationTableCell____lazy_storage___stackView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Media21RadioStationTableCell____lazy_storage___titleStackView);
}

@end