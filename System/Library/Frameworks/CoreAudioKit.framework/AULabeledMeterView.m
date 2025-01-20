@interface AULabeledMeterView
- (_TtC12CoreAudioKit18AULabeledMeterView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit18AULabeledMeterView)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)tintColorDidChange;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation AULabeledMeterView

- (_TtC12CoreAudioKit18AULabeledMeterView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit18AULabeledMeterView *)sub_21E57443C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit18AULabeledMeterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21E576DD0();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F832D8];
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_21E574920((uint64_t)a3);
}

- (void)tintColorDidChange
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_fillLayer);
  v4 = self;
  id v5 = self;
  id v6 = objc_msgSend(v4, sel_tintColor);
  id v7 = objc_msgSend(v6, sel_colorWithAlphaComponent_, 0.5);

  id v8 = objc_msgSend(v7, sel_CGColor);
  objc_msgSend(v3, sel_setBackgroundColor_, v8);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21E576AE0(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_peakTimer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_meterLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_fillLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_peakLayer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_meterLabelLayer);
}

@end