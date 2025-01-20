@interface AVTColorSlider
- (AVTColorSlider)initWithUserInterfaceLayoutDirection:(int64_t)a3;
- (AVTColorSliderDelegate)delegate;
- (BOOL)shouldTriggerFeedback;
- (CALayer)thumbContentLayer;
- (CALayer)thumbSoftShadowLayer;
- (CALayer)trackLayer;
- (CAShapeLayer)thumbBorderLayer;
- (CAShapeLayer)thumbClippingLayer;
- (CGColor)trackBorderColor;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (UIImageView)thumbView;
- (UISelectionFeedbackGenerator)selectionFeedbackGenerator;
- (_UIEdgeFeedbackGenerator)edgeFeedbackGenerator;
- (id)createThumbView;
- (id)currentMaximumTrackImage;
- (id)currentMinimumTrackImage;
- (int64_t)layoutDirection;
- (void)layoutSubviews;
- (void)relayoutSublayers;
- (void)removeTrackLayer:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEdgeFeedbackGenerator:(id)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setSelectionFeedbackGenerator:(id)a3;
- (void)setShouldTriggerFeedback:(BOOL)a3;
- (void)setThumbBorderLayer:(id)a3;
- (void)setThumbClippingLayer:(id)a3;
- (void)setThumbContentLayer:(id)a3;
- (void)setThumbSoftShadowLayer:(id)a3;
- (void)setThumbView:(id)a3;
- (void)setTrackLayer:(id)a3;
- (void)setTrackLayer:(id)a3 animated:(BOOL)a4;
- (void)valueDidChange:(id)a3 forEvent:(id)a4;
@end

@implementation AVTColorSlider

- (AVTColorSlider)initWithUserInterfaceLayoutDirection:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AVTColorSlider;
  v4 = -[AVTColorSlider initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v4;
  if (v4)
  {
    v4->_layoutDirection = a3;
    LODWORD(v5) = -1.0;
    [(AVTColorSlider *)v4 setMinimumValue:v5];
    LODWORD(v7) = 1.0;
    [(AVTColorSlider *)v6 setMaximumValue:v7];
    v6->_shouldTriggerFeedback = 0;
    v8 = [MEMORY[0x263F1CC88] sliderConfiguration];
    v9 = [v8 tweakedConfigurationForClass:objc_opt_class() usage:@"sliderEdge"];

    uint64_t v10 = [objc_alloc(MEMORY[0x263F1CC80]) initWithConfiguration:v9 view:v6];
    edgeFeedbackGenerator = v6->_edgeFeedbackGenerator;
    v6->_edgeFeedbackGenerator = (_UIEdgeFeedbackGenerator *)v10;

    [(_UIEdgeFeedbackGenerator *)v6->_edgeFeedbackGenerator setAxis:1];
    v12 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F1C970]);
    selectionFeedbackGenerator = v6->_selectionFeedbackGenerator;
    v6->_selectionFeedbackGenerator = v12;

    [(UISelectionFeedbackGenerator *)v6->_selectionFeedbackGenerator _setOutputMode:5];
    [(AVTColorSlider *)v6 addTarget:v6 action:sel_valueDidChange_forEvent_ forControlEvents:4096];

    [(AVTColorSlider *)v6 setClipsToBounds:0];
  }
  return v6;
}

- (void)relayoutSublayers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(AVTColorSlider *)self thumbContentLayer];
  v4 = [v3 sublayers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        uint64_t v10 = [(AVTColorSlider *)self thumbContentLayer];
        [v10 bounds];
        objc_msgSend(v9, "setFrame:");

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)layoutSubviews
{
  v102.receiver = self;
  v102.super_class = (Class)AVTColorSlider;
  [(AVTColorSlider *)&v102 layoutSubviews];
  v3 = [(AVTColorSlider *)self edgeFeedbackGenerator];
  [(AVTColorSlider *)self bounds];
  [v3 setDistance:v4];

  uint64_t v5 = [(AVTColorSlider *)self thumbView];
  uint64_t v6 = [v5 layer];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(AVTColorSlider *)self thumbContentLayer];
  objc_msgSend((id)v15, "setFrame:", v8, v10, v12, v14);

  [(AVTColorSlider *)self relayoutSublayers];
  uint64_t v16 = [(AVTColorSlider *)self thumbClippingLayer];
  [v16 frame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  v25 = [(AVTColorSlider *)self thumbView];
  [v25 bounds];
  v108.origin.double x = v26;
  v108.origin.double y = v27;
  v108.size.double width = v28;
  v108.size.double height = v29;
  v103.origin.double x = v18;
  v103.origin.double y = v20;
  v103.size.double width = v22;
  v103.size.double height = v24;
  LOBYTE(v15) = CGRectEqualToRect(v103, v108);

  if ((v15 & 1) == 0)
  {
    v30 = [(AVTColorSlider *)self thumbView];
    v31 = [v30 layer];
    [v31 bounds];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    v40 = [(AVTColorSlider *)self thumbClippingLayer];
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

    v41 = (void *)MEMORY[0x263F1C478];
    v42 = [(AVTColorSlider *)self thumbView];
    v43 = [v42 layer];
    [v43 bounds];
    CGRect v105 = CGRectInset(v104, 1.0, 1.0);
    objc_msgSend(v41, "bezierPathWithOvalInRect:", v105.origin.x, v105.origin.y, v105.size.width, v105.size.height);
    id v44 = objc_claimAutoreleasedReturnValue();
    uint64_t v45 = [v44 CGPath];
    v46 = [(AVTColorSlider *)self thumbClippingLayer];
    [v46 setPath:v45];

    v47 = [(AVTColorSlider *)self thumbView];
    v48 = [v47 layer];
    [v48 bounds];
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    v57 = [(AVTColorSlider *)self thumbBorderLayer];
    [v57 lineWidth];
    CGFloat v59 = v58 * 0.5;
    v60 = [(AVTColorSlider *)self thumbBorderLayer];
    [v60 lineWidth];
    CGFloat v62 = v61 * 0.5;
    v106.origin.double x = v50;
    v106.origin.double y = v52;
    v106.size.double width = v54;
    v106.size.double height = v56;
    CGRect v107 = CGRectInset(v106, v59, v62);
    double x = v107.origin.x;
    double y = v107.origin.y;
    double width = v107.size.width;
    double height = v107.size.height;

    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", x, y, width, height);
    id v67 = objc_claimAutoreleasedReturnValue();
    uint64_t v68 = [v67 CGPath];
    v69 = [(AVTColorSlider *)self thumbBorderLayer];
    [v69 setPath:v68];

    v70 = [(AVTColorSlider *)self thumbView];
    v71 = [v70 layer];
    [v71 bounds];
    double v73 = v72;
    double v75 = v74;
    double v77 = v76;
    double v79 = v78;
    v80 = [(AVTColorSlider *)self thumbBorderLayer];
    objc_msgSend(v80, "setFrame:", v73, v75, v77, v79);

    v81 = [(AVTColorSlider *)self thumbBorderLayer];
    uint64_t v82 = [v81 path];
    v83 = [(AVTColorSlider *)self thumbView];
    v84 = [v83 layer];
    [v84 setShadowPath:v82];

    v85 = [(AVTColorSlider *)self thumbBorderLayer];
    uint64_t v86 = [v85 path];
    v87 = [(AVTColorSlider *)self thumbSoftShadowLayer];
    [v87 setShadowPath:v86];
  }
  v88 = [(AVTColorSlider *)self trackLayer];

  if (v88)
  {
    [(AVTColorSlider *)self bounds];
    double v90 = v89;
    double v92 = v91;
    double v94 = v93 + -18.0;
    double v96 = v95 + 9.0;
    v97 = [(AVTColorSlider *)self trackLayer];
    objc_msgSend(v97, "setFrame:", v90, v96, v92, v94);

    v98 = [(AVTColorSlider *)self trackLayer];
    [v98 setCornerRadius:v94 * 0.5];

    v99 = [(AVTColorSlider *)self trackLayer];
    [v99 setBorderWidth:2.0];

    v100 = [(AVTColorSlider *)self trackBorderColor];
    v101 = [(AVTColorSlider *)self trackLayer];
    [v101 setBorderColor:v100];
  }
}

- (void)setTrackLayer:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (CALayer *)a3;
  double v7 = [(AVTColorSlider *)self trackLayer];

  if (v7)
  {
    double v8 = [(AVTColorSlider *)self trackLayer];
    [(AVTColorSlider *)self removeTrackLayer:v8 animated:v4];
  }
  trackLayer = self->_trackLayer;
  self->_trackLayer = v6;

  uint64_t v10 = *MEMORY[0x263F15A20];
  double v11 = [(AVTColorSlider *)self trackLayer];
  [v11 setCornerCurve:v10];

  double v12 = [(AVTColorSlider *)self layer];
  double v13 = [(AVTColorSlider *)self trackLayer];
  [v12 insertSublayer:v13 atIndex:0];

  if ([(AVTColorSlider *)self layoutDirection] == 1)
  {
    CATransform3DMakeRotation(&v20, 3.14159265, 0.0, 1.0, 0.0);
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    *(_OWORD *)&v20.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    *(_OWORD *)&v20.m33 = v14;
    long long v15 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    *(_OWORD *)&v20.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    *(_OWORD *)&v20.m43 = v15;
    long long v16 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v20.m11 = *MEMORY[0x263F15740];
    *(_OWORD *)&v20.m13 = v16;
    long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v20.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    *(_OWORD *)&v20.m23 = v17;
  }
  CGFloat v18 = [(AVTColorSlider *)self trackLayer];
  CATransform3D v19 = v20;
  [v18 setTransform:&v19];

  [(AVTColorSlider *)self setNeedsLayout];
}

- (void)removeTrackLayer:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4)
  {
    [MEMORY[0x263F158F8] begin];
    double v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v7 setDuration:0.2];
    [v7 setFromValue:&unk_26BF4D3A0];
    [v7 setToValue:&unk_26BF4D588];
    [v6 setOpacity:0.0];
    double v8 = (void *)MEMORY[0x263F158F8];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__AVTColorSlider_removeTrackLayer_animated___block_invoke;
    v10[3] = &unk_263FF03D8;
    id v9 = v6;
    id v11 = v9;
    [v8 setCompletionBlock:v10];
    [v9 addAnimation:v7 forKey:@"opacity"];
    [MEMORY[0x263F158F8] commit];
  }
  else
  {
    [v5 removeFromSuperlayer];
  }
}

uint64_t __44__AVTColorSlider_removeTrackLayer_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

- (CGColor)trackBorderColor
{
  v2 = [(AVTColorSlider *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.05];
  }
  else {
  id v4 = [MEMORY[0x263F1C550] clearColor];
  }
  id v5 = (CGColor *)[v4 CGColor];

  return v5;
}

- (id)createThumbView
{
  uint64_t v3 = [(AVTColorSlider *)self thumbView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [(AVTColorSlider *)self setThumbView:v4];

    id v5 = [MEMORY[0x263F1C550] clearColor];
    uint64_t v6 = [(AVTColorSlider *)self thumbView];
    [v6 setBackgroundColor:v5];

    double v7 = [(AVTColorSlider *)self thumbView];
    [v7 setContentMode:2];

    double v8 = [(AVTColorSlider *)self thumbView];
    [v8 setClipsToBounds:0];

    id v9 = [(AVTColorSlider *)self thumbView];
    uint64_t v10 = [v9 layer];
    LODWORD(v11) = 1042536202;
    [v10 setShadowOpacity:v11];

    double v12 = [(AVTColorSlider *)self thumbView];
    double v13 = [v12 layer];
    objc_msgSend(v13, "setShadowOffset:", 1.0, 5.5);

    long long v14 = [(AVTColorSlider *)self thumbView];
    long long v15 = [v14 layer];
    [v15 setShadowRadius:3.5];

    long long v16 = [MEMORY[0x263F157E8] layer];
    [(AVTColorSlider *)self setThumbSoftShadowLayer:v16];

    long long v17 = [(AVTColorSlider *)self thumbSoftShadowLayer];
    LODWORD(v18) = 1042536202;
    [v17 setShadowOpacity:v18];

    CATransform3D v19 = [(AVTColorSlider *)self thumbSoftShadowLayer];
    objc_msgSend(v19, "setShadowOffset:", 0.0, 0.0);

    CATransform3D v20 = [(AVTColorSlider *)self thumbSoftShadowLayer];
    [v20 setShadowRadius:6.5];

    double v21 = [(AVTColorSlider *)self thumbView];
    CGFloat v22 = [v21 layer];
    double v23 = [(AVTColorSlider *)self thumbSoftShadowLayer];
    [v22 addSublayer:v23];

    CGFloat v24 = [MEMORY[0x263F157E8] layer];
    [(AVTColorSlider *)self setThumbContentLayer:v24];

    v25 = [(AVTColorSlider *)self thumbView];
    CGFloat v26 = [v25 layer];
    CGFloat v27 = [(AVTColorSlider *)self thumbContentLayer];
    [v26 addSublayer:v27];

    id v28 = objc_alloc_init(MEMORY[0x263F15880]);
    [(AVTColorSlider *)self setThumbBorderLayer:v28];

    id v29 = [MEMORY[0x263F1C550] clearColor];
    uint64_t v30 = [v29 CGColor];
    v31 = [(AVTColorSlider *)self thumbBorderLayer];
    [v31 setFillColor:v30];

    id v32 = [MEMORY[0x263F1C550] colorWithRed:0.972549 green:0.972549 blue:0.972549 alpha:1.0];
    uint64_t v33 = [v32 CGColor];
    double v34 = [(AVTColorSlider *)self thumbBorderLayer];
    [v34 setStrokeColor:v33];

    double v35 = [(AVTColorSlider *)self thumbBorderLayer];
    [v35 setLineWidth:6.0];

    double v36 = [(AVTColorSlider *)self thumbView];
    double v37 = [v36 layer];
    double v38 = [(AVTColorSlider *)self thumbBorderLayer];
    [v37 addSublayer:v38];

    id v39 = objc_alloc_init(MEMORY[0x263F15880]);
    [(AVTColorSlider *)self setThumbClippingLayer:v39];

    uint64_t v40 = *MEMORY[0x263F15AC0];
    v41 = [(AVTColorSlider *)self thumbClippingLayer];
    [v41 setFillRule:v40];

    v42 = [(AVTColorSlider *)self thumbClippingLayer];
    v43 = [(AVTColorSlider *)self thumbContentLayer];
    [v43 setMask:v42];
  }
  [(AVTColorSlider *)self thumbView];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)AVTColorSlider;
  -[AVTColorSlider trackRectForBounds:](&v9, sel_trackRectForBounds_, a3.origin.x, a3.origin.y);
  double v8 = width + height * -0.5;
  result.size.double height = v7;
  result.size.double width = v8;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(AVTColorSlider *)self minimumValue];
  float v9 = a5 - v8;
  [(AVTColorSlider *)self maximumValue];
  float v11 = v10;
  [(AVTColorSlider *)self minimumValue];
  double v13 = (float)(v9 / (float)(v11 - v12));
  int64_t v14 = [(AVTColorSlider *)self layoutDirection];
  double v15 = 1.0 - v13;
  if (v14 != 1) {
    double v15 = v13;
  }
  double v16 = (width - height) * v15;
  double v17 = 0.0;
  double v18 = height;
  double v19 = height;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (id)currentMinimumTrackImage
{
  return 0;
}

- (id)currentMaximumTrackImage
{
  return 0;
}

- (void)valueDidChange:(id)a3 forEvent:(id)a4
{
  id v21 = a4;
  [(AVTColorSlider *)self value];
  float v6 = v5;
  double v7 = v5;
  float v8 = [(AVTColorSlider *)self edgeFeedbackGenerator];
  float v9 = [(AVTColorSlider *)self edgeFeedbackGenerator];
  [v9 distance];
  [v8 positionUpdated:v10 * v7];

  double v11 = -v7;
  if (v6 >= 0.0) {
    double v11 = v7;
  }
  double v12 = v11 + -0.03;
  if (v11 + -0.03 < 0.0)
  {
    double v7 = 0.0;
    if (![(AVTColorSlider *)self shouldTriggerFeedback]) {
      goto LABEL_7;
    }
    double v13 = [(AVTColorSlider *)self selectionFeedbackGenerator];
    [v13 selectionChanged];
  }
  [(AVTColorSlider *)self setShouldTriggerFeedback:v12 >= 0.0];
LABEL_7:
  int64_t v14 = [v21 allTouches];
  double v15 = [v14 anyObject];

  uint64_t v16 = [v15 phase];
  if (v16 == 3)
  {
    double v19 = [(AVTColorSlider *)self delegate];
    [v19 colorSlider:self didFinishSelectingValue:v7];

    *(float *)&double v20 = v7;
    [(AVTColorSlider *)self setValue:0 animated:v20];
  }
  else
  {
    if (v16 != 1)
    {
      if (v16) {
        goto LABEL_13;
      }
      double v17 = [(AVTColorSlider *)self selectionFeedbackGenerator];
      [v17 prepare];
    }
    double v18 = [(AVTColorSlider *)self delegate];
    [v18 colorSlider:self valueChanged:v7];
  }
LABEL_13:
}

- (AVTColorSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTColorSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CALayer)trackLayer
{
  return self->_trackLayer;
}

- (void)setTrackLayer:(id)a3
{
}

- (CAShapeLayer)thumbClippingLayer
{
  return self->_thumbClippingLayer;
}

- (void)setThumbClippingLayer:(id)a3
{
}

- (CALayer)thumbContentLayer
{
  return self->_thumbContentLayer;
}

- (void)setThumbContentLayer:(id)a3
{
}

- (CALayer)thumbSoftShadowLayer
{
  return self->_thumbSoftShadowLayer;
}

- (void)setThumbSoftShadowLayer:(id)a3
{
}

- (CAShapeLayer)thumbBorderLayer
{
  return self->_thumbBorderLayer;
}

- (void)setThumbBorderLayer:(id)a3
{
}

- (UIImageView)thumbView
{
  return self->_thumbView;
}

- (void)setThumbView:(id)a3
{
}

- (_UIEdgeFeedbackGenerator)edgeFeedbackGenerator
{
  return self->_edgeFeedbackGenerator;
}

- (void)setEdgeFeedbackGenerator:(id)a3
{
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
}

- (BOOL)shouldTriggerFeedback
{
  return self->_shouldTriggerFeedback;
}

- (void)setShouldTriggerFeedback:(BOOL)a3
{
  self->_shouldTriggerFeedback = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_edgeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbContentLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_trackLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end