@interface TickMarksModel
- (BOOL)endTickMarksProminent;
- (BOOL)isMainTickMarkAtIndex:(int64_t)a3;
- (BOOL)logarithmic;
- (BOOL)useTickMarkLegibilityShadows;
- (UIColor)mainTickMarkColor;
- (UIColor)secondaryTickMarkColor;
- (_TtC13CameraEditKit14TickMarksModel)init;
- (_TtP13CameraEditKit17TickMarksDelegate_)delegate;
- (_TtP13CameraEditKit19TickMarksDataSource_)dataSource;
- (double)absoluteValueForNormalizedValue:(double)a3 inAbsoluteRangeSize:(double)a4;
- (double)requiredWidth;
- (double)tickMarkSpacing;
- (double)tickMarkWidth;
- (double)xOffsetForNormalizedValue:(double)a3;
- (double)xOffsetForTickMarkIndex:(unint64_t)a3;
- (int64_t)mainTickMarkInterval;
- (int64_t)mainTickMarkOffset;
- (unint64_t)floorTickMarkIndexForXOffset:(double)a3;
- (unint64_t)tickMarksCount;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndTickMarksProminent:(BOOL)a3;
- (void)setLogarithmic:(BOOL)a3;
- (void)setMainTickMarkColor:(id)a3;
- (void)setMainTickMarkInterval:(int64_t)a3;
- (void)setMainTickMarkOffset:(int64_t)a3;
- (void)setSecondaryTickMarkColor:(id)a3;
- (void)setTickMarkSpacing:(double)a3;
- (void)setTickMarkWidth:(double)a3;
- (void)setTickMarksCount:(unint64_t)a3;
- (void)setUseTickMarkLegibilityShadows:(BOOL)a3;
@end

@implementation TickMarksModel

- (_TtP13CameraEditKit19TickMarksDataSource_)dataSource
{
  v2 = (void *)MEMORY[0x1C189E660]((char *)self + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource, a2);
  return (_TtP13CameraEditKit19TickMarksDataSource_ *)v2;
}

- (void)setDataSource:(id)a3
{
}

- (_TtP13CameraEditKit17TickMarksDelegate_)delegate
{
  v2 = (void *)MEMORY[0x1C189E660]((char *)self + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate, a2);
  return (_TtP13CameraEditKit17TickMarksDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)tickMarksCount
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
}

- (void)setTickMarksCount:(unint64_t)a3
{
  v4 = self;
  sub_1BEE66650((void *)a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
}

- (double)tickMarkSpacing
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
}

- (void)setTickMarkSpacing:(double)a3
{
  v4 = self;
  sub_1BEE66500(&OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing, a3);
}

- (double)tickMarkWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
}

- (void)setTickMarkWidth:(double)a3
{
  v4 = self;
  sub_1BEE66500(&OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth, a3);
}

- (int64_t)mainTickMarkInterval
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval);
}

- (void)setMainTickMarkInterval:(int64_t)a3
{
  v4 = self;
  sub_1BEE66650((void *)a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval);
}

- (int64_t)mainTickMarkOffset
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset);
}

- (void)setMainTickMarkOffset:(int64_t)a3
{
  v4 = self;
  sub_1BEE66650((void *)a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset);
}

- (BOOL)logarithmic
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic);
}

- (void)setLogarithmic:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_1BEE66824(v3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic, (SEL *)&selRef_tickMarksModelDidChangeWidthForTickMarkCountWithModel_);
}

- (BOOL)endTickMarksProminent
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent);
}

- (void)setEndTickMarksProminent:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_1BEE66824(v3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent, (SEL *)&selRef_tickMarksModelDidChangeAppearanceWithModel_);
}

- (BOOL)useTickMarkLegibilityShadows
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows);
}

- (void)setUseTickMarkLegibilityShadows:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_1BEE66824(v3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows, (SEL *)&selRef_tickMarksModelDidChangeAppearanceWithModel_);
}

- (UIColor)mainTickMarkColor
{
  v2 = self;
  id v3 = sub_1BEE668F0();

  return (UIColor *)v3;
}

- (void)setMainTickMarkColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1BEE66C5C(a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__primaryTickMarkColor);
}

- (UIColor)secondaryTickMarkColor
{
  v2 = self;
  id v3 = sub_1BEE66AB4();

  return (UIColor *)v3;
}

- (void)setSecondaryTickMarkColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1BEE66C5C(a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__secondaryTickMarkColor);
}

- (double)requiredWidth
{
  return sub_1BEE66DC4();
}

- (double)xOffsetForTickMarkIndex:(unint64_t)a3
{
  v4 = self;
  sub_1BEE66EA0(a3);
  double v6 = v5;

  return v6;
}

- (double)xOffsetForNormalizedValue:(double)a3
{
  v4 = self;
  double v5 = sub_1BEE66FE0(a3);

  return v5;
}

- (double)absoluteValueForNormalizedValue:(double)a3 inAbsoluteRangeSize:(double)a4
{
  double v6 = self;
  double v7 = sub_1BEE67120(a3, a4);

  return v7;
}

- (unint64_t)floorTickMarkIndexForXOffset:(double)a3
{
  v4 = self;
  sub_1BEE671CC(a3);
  unint64_t v6 = v5;

  return v6;
}

- (BOOL)isMainTickMarkAtIndex:(int64_t)a3
{
  return sub_1BEE6739C(a3);
}

- (_TtC13CameraEditKit14TickMarksModel)init
{
  return (_TtC13CameraEditKit14TickMarksModel *)sub_1BEE67460();
}

- (void).cxx_destruct
{
  sub_1BEE676BC((uint64_t)self + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
  sub_1BEE676BC((uint64_t)self + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__secondaryTickMarkColor);
}

@end