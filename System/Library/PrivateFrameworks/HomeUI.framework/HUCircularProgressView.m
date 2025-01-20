@interface HUCircularProgressView
- (BOOL)progressFillCounterClockwise;
- (BOOL)removeProgressBarOnCompletion;
- (CAShapeLayer)baseLayer;
- (CAShapeLayer)progressShapeLayer;
- (HUCircularProgressView)initWithRadius:(double)a3;
- (HUCircularProgressView)initWithRadius:(double)a3 startAngle:(double)a4 endAngle:(double)a5 progress:(double)a6;
- (UIColor)baseLayerStrokeLineColor;
- (UIColor)progressLayerStrokeLineColor;
- (double)avatarDiameter;
- (double)baseLayerStrokeLineWidth;
- (double)endAngle;
- (double)fromValue;
- (double)progressLayerStrokeLineWidth;
- (double)radius;
- (double)startAngle;
- (id)_lineCapStyle;
- (id)_progressBarFillDirection;
- (unint64_t)lineCapStyle;
- (unint64_t)progressBarFillDirection;
- (void)layoutSubviews;
- (void)setAvatarDiameter:(double)a3;
- (void)setBaseLayer:(id)a3;
- (void)setBaseLayerStrokeLineColor:(id)a3;
- (void)setBaseLayerStrokeLineWidth:(double)a3;
- (void)setEndAngle:(double)a3;
- (void)setFromValue:(double)a3;
- (void)setLineCapStyle:(unint64_t)a3;
- (void)setProgressBarFillDirection:(unint64_t)a3;
- (void)setProgressFillCounterClockwise:(BOOL)a3;
- (void)setProgressLayerStrokeLineColor:(id)a3;
- (void)setProgressLayerStrokeLineWidth:(double)a3;
- (void)setProgressShapeLayer:(id)a3;
- (void)setRadius:(double)a3;
- (void)setRemoveProgressBarOnCompletion:(BOOL)a3;
- (void)setStartAngle:(double)a3;
- (void)updateProgressBy:(double)a3 animationDuration:(float)a4;
- (void)updateProgressTo:(double)a3 animationDuration:(float)a4;
@end

@implementation HUCircularProgressView

- (HUCircularProgressView)initWithRadius:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HUCircularProgressView;
  v4 = -[HUCircularProgressView initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  v5 = v4;
  if (v4)
  {
    v4->_radius = a3;
    v4->_lineCapStyle = 0;
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemGray2Color];
    baseLayerStrokeLineColor = v5->_baseLayerStrokeLineColor;
    v5->_baseLayerStrokeLineColor = (UIColor *)v6;

    uint64_t v8 = [MEMORY[0x1E4F428B8] systemFillColor];
    progressLayerStrokeLineColor = v5->_progressLayerStrokeLineColor;
    v5->_progressLayerStrokeLineColor = (UIColor *)v8;

    v5->_progressBarFillDirection = 0;
    v5->_removeProgressBarOnCompletion = 1;
  }
  return v5;
}

- (HUCircularProgressView)initWithRadius:(double)a3 startAngle:(double)a4 endAngle:(double)a5 progress:(double)a6
{
  result = [(HUCircularProgressView *)self initWithRadius:a3];
  if (result)
  {
    result->_startAngle = a4 + -1.57079633;
    result->_endAngle = a5 + -1.57079633;
    result->_fromValue = a6;
  }
  return result;
}

- (void)layoutSubviews
{
  v3 = [(HUCircularProgressView *)self layer];
  v4 = [v3 sublayers];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperlayer];

  v5 = objc_opt_new();
  [(HUCircularProgressView *)self setBaseLayer:v5];

  [(HUCircularProgressView *)self bounds];
  double v7 = v6 * 0.5;
  [(HUCircularProgressView *)self bounds];
  double v9 = v8 * 0.5;
  v10 = (void *)MEMORY[0x1E4F427D0];
  [(HUCircularProgressView *)self radius];
  double v12 = v11;
  [(HUCircularProgressView *)self startAngle];
  double v14 = v13;
  [(HUCircularProgressView *)self endAngle];
  objc_msgSend(v10, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", -[HUCircularProgressView progressFillCounterClockwise](self, "progressFillCounterClockwise") ^ 1, v7, v9, v12, v14, v15);
  id v49 = objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v49 CGPath];
  v17 = [(HUCircularProgressView *)self baseLayer];
  [v17 setPath:v16];

  id v18 = [(HUCircularProgressView *)self baseLayerStrokeLineColor];
  uint64_t v19 = [v18 CGColor];
  v20 = [(HUCircularProgressView *)self baseLayer];
  [v20 setStrokeColor:v19];

  [(HUCircularProgressView *)self baseLayerStrokeLineWidth];
  double v22 = v21;
  v23 = [(HUCircularProgressView *)self baseLayer];
  [v23 setLineWidth:v22];

  v24 = [(HUCircularProgressView *)self _lineCapStyle];
  v25 = [(HUCircularProgressView *)self baseLayer];
  [v25 setLineCap:v24];

  id v26 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v27 = [v26 CGColor];
  v28 = [(HUCircularProgressView *)self baseLayer];
  [v28 setFillColor:v27];

  v29 = [(HUCircularProgressView *)self layer];
  v30 = [(HUCircularProgressView *)self baseLayer];
  [v29 addSublayer:v30];

  [(HUCircularProgressView *)self progressLayerStrokeLineWidth];
  if (v31 > 0.0)
  {
    v32 = objc_opt_new();
    [(HUCircularProgressView *)self setProgressShapeLayer:v32];

    uint64_t v33 = [v49 CGPath];
    v34 = [(HUCircularProgressView *)self progressShapeLayer];
    [v34 setPath:v33];

    id v35 = [(HUCircularProgressView *)self progressLayerStrokeLineColor];
    uint64_t v36 = [v35 CGColor];
    v37 = [(HUCircularProgressView *)self progressShapeLayer];
    [v37 setStrokeColor:v36];

    [(HUCircularProgressView *)self progressLayerStrokeLineWidth];
    double v39 = v38;
    v40 = [(HUCircularProgressView *)self progressShapeLayer];
    [v40 setLineWidth:v39];

    v41 = [(HUCircularProgressView *)self progressShapeLayer];
    [v41 setStrokeEnd:0.0];

    v42 = [(HUCircularProgressView *)self _lineCapStyle];
    v43 = [(HUCircularProgressView *)self progressShapeLayer];
    [v43 setLineCap:v42];

    id v44 = [MEMORY[0x1E4F428B8] clearColor];
    uint64_t v45 = [v44 CGColor];
    v46 = [(HUCircularProgressView *)self progressShapeLayer];
    [v46 setFillColor:v45];

    v47 = [(HUCircularProgressView *)self layer];
    v48 = [(HUCircularProgressView *)self progressShapeLayer];
    [v47 addSublayer:v48];
  }
}

- (void)setBaseLayerStrokeLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_baseLayerStrokeLineColor, a3);

  [(HUCircularProgressView *)self setNeedsLayout];
}

- (void)setProgressLayerStrokeLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayerStrokeLineColor, a3);

  [(HUCircularProgressView *)self setNeedsLayout];
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
  [(HUCircularProgressView *)self setNeedsLayout];
}

- (void)updateProgressBy:(double)a3 animationDuration:(float)a4
{
  id v19 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  double v7 = NSNumber;
  [(HUCircularProgressView *)self fromValue];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  [v19 setFromValue:v8];

  double v9 = NSNumber;
  [(HUCircularProgressView *)self fromValue];
  double v11 = [v9 numberWithDouble:v10 + a3];
  [v19 setToValue:v11];

  [v19 setDuration:a4];
  [v19 setRemovedOnCompletion:0];
  double v12 = [(HUCircularProgressView *)self _progressBarFillDirection];
  [v19 setFillMode:v12];

  double v13 = [v19 toValue];
  [v13 floatValue];
  float v15 = v14;

  if (v15 >= 1.0)
  {
    objc_msgSend(v19, "setRemovedOnCompletion:", -[HUCircularProgressView removeProgressBarOnCompletion](self, "removeProgressBarOnCompletion"));
    [(HUCircularProgressView *)self setFromValue:0.0];
    [v19 setDuration:0.0];
  }
  else
  {
    uint64_t v16 = [v19 toValue];
    [v16 floatValue];
    [(HUCircularProgressView *)self setFromValue:v17];
  }
  id v18 = [(HUCircularProgressView *)self progressShapeLayer];
  [v18 addAnimation:v19 forKey:@"progressStrokeKey"];
}

- (void)updateProgressTo:(double)a3 animationDuration:(float)a4
{
  id v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  double v7 = NSNumber;
  [(HUCircularProgressView *)self fromValue];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  [v17 setFromValue:v8];

  double v9 = [NSNumber numberWithDouble:a3];
  [v17 setToValue:v9];

  [v17 setDuration:a4];
  [v17 setRemovedOnCompletion:0];
  double v10 = [(HUCircularProgressView *)self _progressBarFillDirection];
  [v17 setFillMode:v10];

  double v11 = [v17 toValue];
  [v11 floatValue];
  float v13 = v12;

  if (v13 >= 1.0)
  {
    objc_msgSend(v17, "setRemovedOnCompletion:", -[HUCircularProgressView removeProgressBarOnCompletion](self, "removeProgressBarOnCompletion"));
    [(HUCircularProgressView *)self setFromValue:0.0];
    [v17 setDuration:0.0];
  }
  else
  {
    float v14 = [v17 toValue];
    [v14 floatValue];
    [(HUCircularProgressView *)self setFromValue:v15];
  }
  uint64_t v16 = [(HUCircularProgressView *)self progressShapeLayer];
  [v16 addAnimation:v17 forKey:@"progressStrokeKey"];
}

- (id)_lineCapStyle
{
  unint64_t v2 = [(HUCircularProgressView *)self lineCapStyle];
  v3 = (void **)MEMORY[0x1E4F3A450];
  v4 = (void **)MEMORY[0x1E4F3A458];
  if (v2 != 1) {
    v4 = (void **)MEMORY[0x1E4F3A460];
  }
  if (v2 != 2) {
    v3 = v4;
  }
  v5 = *v3;

  return v5;
}

- (id)_progressBarFillDirection
{
  unint64_t v2 = [(HUCircularProgressView *)self progressBarFillDirection];
  v3 = (void **)MEMORY[0x1E4F39F98];
  if (v2 != 1) {
    v3 = (void **)MEMORY[0x1E4F39FA8];
  }
  v4 = *v3;

  return v4;
}

- (BOOL)progressFillCounterClockwise
{
  return self->_progressFillCounterClockwise;
}

- (void)setProgressFillCounterClockwise:(BOOL)a3
{
  self->_progressFillCounterClockwise = a3;
}

- (double)baseLayerStrokeLineWidth
{
  return self->_baseLayerStrokeLineWidth;
}

- (void)setBaseLayerStrokeLineWidth:(double)a3
{
  self->_baseLayerStrokeLineWidth = a3;
}

- (UIColor)baseLayerStrokeLineColor
{
  return self->_baseLayerStrokeLineColor;
}

- (double)progressLayerStrokeLineWidth
{
  return self->_progressLayerStrokeLineWidth;
}

- (void)setProgressLayerStrokeLineWidth:(double)a3
{
  self->_progressLayerStrokeLineWidth = a3;
}

- (UIColor)progressLayerStrokeLineColor
{
  return self->_progressLayerStrokeLineColor;
}

- (unint64_t)lineCapStyle
{
  return self->_lineCapStyle;
}

- (void)setLineCapStyle:(unint64_t)a3
{
  self->_lineCapStyle = a3;
}

- (unint64_t)progressBarFillDirection
{
  return self->_progressBarFillDirection;
}

- (void)setProgressBarFillDirection:(unint64_t)a3
{
  self->_progressBarFillDirection = a3;
}

- (BOOL)removeProgressBarOnCompletion
{
  return self->_removeProgressBarOnCompletion;
}

- (void)setRemoveProgressBarOnCompletion:(BOOL)a3
{
  self->_removeProgressBarOnCompletion = a3;
}

- (double)avatarDiameter
{
  return self->_avatarDiameter;
}

- (void)setAvatarDiameter:(double)a3
{
  self->_avatarDiameter = a3;
}

- (double)radius
{
  return self->_radius;
}

- (double)startAngle
{
  return self->_startAngle;
}

- (void)setStartAngle:(double)a3
{
  self->_startAngle = a3;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (void)setEndAngle:(double)a3
{
  self->_endAngle = a3;
}

- (CAShapeLayer)progressShapeLayer
{
  return self->_progressShapeLayer;
}

- (void)setProgressShapeLayer:(id)a3
{
}

- (CAShapeLayer)baseLayer
{
  return self->_baseLayer;
}

- (void)setBaseLayer:(id)a3
{
}

- (double)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(double)a3
{
  self->_fromValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseLayer, 0);
  objc_storeStrong((id *)&self->_progressShapeLayer, 0);
  objc_storeStrong((id *)&self->_progressLayerStrokeLineColor, 0);

  objc_storeStrong((id *)&self->_baseLayerStrokeLineColor, 0);
}

@end