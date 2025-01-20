@interface ComplicationCornerGaugeViewRepresentable._CornerView
- (_TtCV19ComplicationDisplay40ComplicationCornerGaugeViewRepresentable11_CornerView)initWithFontFallback:(int64_t)a3;
- (void)layoutSubviews;
@end

@implementation ComplicationCornerGaugeViewRepresentable._CornerView

- (void)layoutSubviews
{
  v2 = self;
  sub_21E3FC8F8();
}

- (_TtCV19ComplicationDisplay40ComplicationCornerGaugeViewRepresentable11_CornerView)initWithFontFallback:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ComplicationCornerGaugeViewRepresentable._CornerView();
  return [(_ComplicationCornerDynamicGaugeView *)&v5 initWithFontFallback:a3];
}

@end