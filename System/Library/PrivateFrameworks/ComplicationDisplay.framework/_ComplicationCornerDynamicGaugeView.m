@interface _ComplicationCornerDynamicGaugeView
- (_TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView)initWithFontFallback:(int64_t)a3;
- (void)handleGaugeProvider:(id)a3 leftLabelProvider:(id)a4 rightLabelProvider:(id)a5;
@end

@implementation _ComplicationCornerDynamicGaugeView

- (void)handleGaugeProvider:(id)a3 leftLabelProvider:(id)a4 rightLabelProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  sub_21E3FCCD0(a3, (uint64_t)a4, (uint64_t)a5);
}

- (_TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView)initWithFontFallback:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView_fillStyle) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _ComplicationCornerDynamicGaugeView();
  return [(CDRichComplicationCornerBaseGaugeView *)&v5 initWithFontFallback:a3];
}

@end