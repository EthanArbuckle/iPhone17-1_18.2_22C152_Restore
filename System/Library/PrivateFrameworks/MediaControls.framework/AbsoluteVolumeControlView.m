@interface AbsoluteVolumeControlView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)hitRect;
- (_TtC13MediaControls25AbsoluteVolumeControlView)initWithCoder:(id)a3;
- (_TtC13MediaControls25AbsoluteVolumeControlView)initWithFrame:(CGRect)a3;
- (int64_t)maximumTrackStyleForSlider:(id)a3;
- (int64_t)minimumTrackStyleForSlider:(id)a3;
- (void)layoutSubviews;
- (void)sliderTouchDown:(id)a3;
- (void)sliderTouchUpInside:(id)a3;
- (void)sliderValueChanged:(id)a3;
@end

@implementation AbsoluteVolumeControlView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AbsoluteVolumeControlView(0);
  v2 = (char *)v4.receiver;
  [(AbsoluteVolumeControlView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_slider];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (_TtC13MediaControls25AbsoluteVolumeControlView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE90AFB8();
}

- (CGRect)hitRect
{
  v21.receiver = self;
  v21.super_class = (Class)type metadata accessor for AbsoluteVolumeControlView(0);
  v2 = v21.receiver;
  id v3 = [(AbsoluteVolumeControlView *)&v21 hitRect];
  objc_super v4 = *(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xF8);
  v4(v3);
  uint64_t v7 = ((uint64_t (*)(uint64_t, uint64_t))v4)(v5, v6);
  uint64_t v8 = ((uint64_t (*)(uint64_t))v4)(v7);
  v4((id)v8);
  UIRectInset();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v8 = self;
  [(AbsoluteVolumeControlView *)v8 hitRect];
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL v9 = CGRectContainsPoint(v12, v11);

  return v9;
}

- (void)sliderTouchDown:(id)a3
{
  objc_super v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0xC0);
  id v5 = a3;
  uint64_t v6 = self;
  v4(1);
}

- (void)sliderValueChanged:(id)a3
{
  objc_super v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_slider);
  id v5 = a3;
  uint64_t v6 = self;
  objc_msgSend(v4, sel_value);
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v6->super.super.super.isa) + 0xE0))();
  sub_1AE90A894();
}

- (void)sliderTouchUpInside:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AE90A894();
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v5->super.super.super.isa) + 0xC0))(0);
  sub_1AE90A218();
}

- (int64_t)minimumTrackStyleForSlider:(id)a3
{
  return 0;
}

- (int64_t)maximumTrackStyleForSlider:(id)a3
{
  return 1;
}

- (_TtC13MediaControls25AbsoluteVolumeControlView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC13MediaControls25AbsoluteVolumeControlView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_slider));
  sub_1AE8E7634((uint64_t)self + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_observer);
  swift_release();
  swift_release();
  sub_1AE9096AC((uint64_t)self + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView__viewModel);
  sub_1AE90B188((uint64_t)self + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_lastInteractionDate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_updateViewModelTimer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_stylingProvider);
}

@end