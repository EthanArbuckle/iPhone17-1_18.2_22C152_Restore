@interface TitledWeekdayHeaderPaletteView
- (_TtC8HealthUI30TitledWeekdayHeaderPaletteView)initWithCoder:(id)a3;
- (_TtC8HealthUI30TitledWeekdayHeaderPaletteView)initWithFrame:(CGRect)a3;
@end

@implementation TitledWeekdayHeaderPaletteView

- (_TtC8HealthUI30TitledWeekdayHeaderPaletteView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI30TitledWeekdayHeaderPaletteView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI30TitledWeekdayHeaderPaletteView____lazy_storage___weekdayPalette) = 0;
  id v4 = a3;

  result = (_TtC8HealthUI30TitledWeekdayHeaderPaletteView *)sub_1E0ECD8F0();
  __break(1u);
  return result;
}

- (_TtC8HealthUI30TitledWeekdayHeaderPaletteView)initWithFrame:(CGRect)a3
{
  result = (_TtC8HealthUI30TitledWeekdayHeaderPaletteView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI30TitledWeekdayHeaderPaletteView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI30TitledWeekdayHeaderPaletteView____lazy_storage___weekdayPalette));
  swift_bridgeObjectRelease();
}

@end