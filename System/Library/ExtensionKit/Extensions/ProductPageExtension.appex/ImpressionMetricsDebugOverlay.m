@interface ImpressionMetricsDebugOverlay
- (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay)initWithFrame:(CGRect)a3;
@end

@implementation ImpressionMetricsDebugOverlay

- (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension29ImpressionMetricsDebugOverlay_metricsLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay *)sub_10077D120();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29ImpressionMetricsDebugOverlay_metricsLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension29ImpressionMetricsDebugOverlay_overlayColor);
}

@end