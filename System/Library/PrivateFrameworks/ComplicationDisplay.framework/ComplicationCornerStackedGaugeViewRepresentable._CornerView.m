@interface ComplicationCornerStackedGaugeViewRepresentable._CornerView
- (_TtCV19ComplicationDisplay47ComplicationCornerStackedGaugeViewRepresentable11_CornerView)initWithFontFallback:(int64_t)a3;
- (void)layoutSubviews;
@end

@implementation ComplicationCornerStackedGaugeViewRepresentable._CornerView

- (void)layoutSubviews
{
  v2 = self;
  sub_21E405680();
}

- (_TtCV19ComplicationDisplay47ComplicationCornerStackedGaugeViewRepresentable11_CornerView)initWithFontFallback:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable._CornerView();
  return [(CDRichComplicationCornerGaugeTextView *)&v5 initWithFontFallback:a3];
}

@end