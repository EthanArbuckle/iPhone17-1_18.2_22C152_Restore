@interface PKDrawingAdjustmentKnob
+ (double)leftMargin;
- (PKDrawingAdjustmentKnob)init;
- (void)layoutSubviews;
@end

@implementation PKDrawingAdjustmentKnob

- (PKDrawingAdjustmentKnob)init
{
  v13.receiver = self;
  v13.super_class = (Class)PKDrawingAdjustmentKnob;
  v2 = [(PKDrawingAdjustmentKnob *)&v13 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4FB1818];
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v3 imageNamed:@"PKDrawingAdjustmentKnob" inBundle:v4 compatibleWithTraitCollection:0];

    uint64_t v6 = [v5 imageWithRenderingMode:2];
    knobImage = v2->_knobImage;
    v2->_knobImage = (UIImage *)v6;

    uint64_t v8 = [(UIImage *)v2->_knobImage imageFlippedForRightToLeftLayoutDirection];
    knobImageFlipped = v2->_knobImageFlipped;
    v2->_knobImageFlipped = (UIImage *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v5];
    knobView = v2->_knobView;
    v2->_knobView = (UIImageView *)v10;

    [(PKDrawingAdjustmentKnob *)v2 addSubview:v2->_knobView];
  }
  return v2;
}

- (void)layoutSubviews
{
  v3 = [(PKDrawingAdjustmentKnob *)self tintColor];
  [(UIImageView *)self->_knobView setTintColor:v3];

  [(PKDrawingAdjustmentKnob *)self bounds];
  double v5 = v4;
  [(PKDrawingAdjustmentKnob *)self bounds];
  -[UIImageView setFrame:](self->_knobView, "setFrame:", 0.0, 0.0, v5);
  BOOL v6 = [(PKDrawingAdjustmentKnob *)self effectiveUserInterfaceLayoutDirection] == 1;
  knobView = self->_knobView;
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKDrawingAdjustmentKnob__knobImage[v6]);

  [(UIImageView *)knobView setImage:v8];
}

+ (double)leftMargin
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 10.0;
  }
  else {
    double v3 = 6.0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobImageFlipped, 0);
  objc_storeStrong((id *)&self->_knobImage, 0);

  objc_storeStrong((id *)&self->_knobView, 0);
}

@end