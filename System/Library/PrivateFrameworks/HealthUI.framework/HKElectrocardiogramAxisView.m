@interface HKElectrocardiogramAxisView
- (CAReplicatorLayer)ticksLayer;
- (CGSize)lastBoundsSize;
- (HKElectrocardiogramAxisOptions)options;
- (HKElectrocardiogramAxisView)initWithAxisSpacing:(double)a3 lineColor:(id)a4 lineWidth:(double)a5;
- (HKElectrocardiogramAxisView)initWithAxisSpacing:(double)a3 options:(id)a4 startingIndex:(int64_t)a5;
- (UIColor)lineColor;
- (UIFont)axisLabelFont;
- (UIFontMetrics)metrics;
- (double)axisSpacing;
- (double)lineWidth;
- (id)_createLabel;
- (int64_t)startingIndex;
- (void)_drawAxis;
- (void)layoutSubviews;
- (void)setAxisSpacing:(double)a3;
- (void)setLastBoundsSize:(CGSize)a3;
- (void)setMetrics:(id)a3;
- (void)setOptions:(id)a3;
- (void)setStartingIndex:(int64_t)a3;
- (void)setTicksLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKElectrocardiogramAxisView

- (HKElectrocardiogramAxisView)initWithAxisSpacing:(double)a3 lineColor:(id)a4 lineWidth:(double)a5
{
  id v8 = a4;
  v9 = [HKElectrocardiogramAxisOptions alloc];
  v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_roundedSystemFontWithSize:weight:", 13.0, *MEMORY[0x1E4FB09D0]);
  v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
  v12 = [(HKElectrocardiogramAxisOptions *)v9 initWithAxisLabelFont:v10 axisLabelTextColor:v11 scaleMetricsAutomatically:1 lineColor:v8 lineWidth:a5 axisLineToLabelSpacing:5.0 topBaselineMargin:18.0 bottomBaselineMargin:2.0];

  v13 = [(HKElectrocardiogramAxisView *)self initWithAxisSpacing:v12 options:0 startingIndex:a3];
  return v13;
}

- (HKElectrocardiogramAxisView)initWithAxisSpacing:(double)a3 options:(id)a4 startingIndex:(int64_t)a5
{
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKElectrocardiogramAxisView;
  v10 = -[HKElectrocardiogramAxisView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v11 = v10;
  if (v10)
  {
    v10->_axisSpacing = a3;
    objc_storeStrong((id *)&v10->_options, a4);
    v12 = (CAReplicatorLayer *)objc_alloc_init(MEMORY[0x1E4F39C68]);
    ticksLayer = v11->_ticksLayer;
    v11->_ticksLayer = v12;

    uint64_t v14 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28F0]];
    metrics = v11->_metrics;
    v11->_metrics = (UIFontMetrics *)v14;

    v11->_startingIndex = a5;
    [(HKElectrocardiogramAxisView *)v11 _drawAxis];
  }

  return v11;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)HKElectrocardiogramAxisView;
  [(HKElectrocardiogramAxisView *)&v12 layoutSubviews];
  [(HKElectrocardiogramAxisView *)self lastBoundsSize];
  double v4 = v3;
  double v6 = v5;
  [(HKElectrocardiogramAxisView *)self bounds];
  if (v4 != v8 || v6 != v7)
  {
    [(HKElectrocardiogramAxisView *)self bounds];
    -[HKElectrocardiogramAxisView setLastBoundsSize:](self, "setLastBoundsSize:", v10, v11);
    [(HKElectrocardiogramAxisView *)self _drawAxis];
  }
}

- (void)_drawAxis
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  [(HKElectrocardiogramAxisView *)self bounds];
  double v4 = v3;
  [(HKElectrocardiogramAxisView *)self axisSpacing];
  double v6 = v4 / v5;
  double v7 = round(v6);
  if (vabdd_f64(v6, v7) < 0.01) {
    double v6 = v7;
  }
  double v8 = ceil(v6);
  long long v59 = 0u;
  long long v60 = 0u;
  if (v8 >= 1.0) {
    double v9 = v8;
  }
  else {
    double v9 = 1.0;
  }
  long long v61 = 0uLL;
  long long v62 = 0uLL;
  double v10 = [(HKElectrocardiogramAxisView *)self ticksLayer];
  double v11 = [v10 sublayers];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v59 + 1) + 8 * i) removeFromSuperlayer];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v13);
  }
  uint64_t v16 = (uint64_t)v9;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  objc_super v17 = [(HKElectrocardiogramAxisView *)self subviews];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v56 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v55 + 1) + 8 * j) removeFromSuperview];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v19);
  }

  v22 = (void *)MEMORY[0x1E4F39C88];
  [(HKElectrocardiogramAxisView *)self bounds];
  double v24 = v23;
  v25 = [(HKElectrocardiogramAxisView *)self options];
  [v25 lineWidth];
  v27 = [v22 verticalLineLayerWithLength:v24 lineWidth:v26];

  [v27 setFillColor:0];
  id v28 = [(HKElectrocardiogramAxisView *)self lineColor];
  objc_msgSend(v27, "setStrokeColor:", objc_msgSend(v28, "CGColor"));

  v29 = [(HKElectrocardiogramAxisView *)self ticksLayer];
  [v29 addSublayer:v27];

  v30 = [(HKElectrocardiogramAxisView *)self ticksLayer];
  [v30 setInstanceCount:v16 + 1];

  [(HKElectrocardiogramAxisView *)self axisSpacing];
  CATransform3DMakeTranslation(&v54, v31, 0.0, 0.0);
  v32 = [(HKElectrocardiogramAxisView *)self ticksLayer];
  CATransform3D v53 = v54;
  [v32 setInstanceTransform:&v53];

  v33 = [(HKElectrocardiogramAxisView *)self layer];
  v34 = [(HKElectrocardiogramAxisView *)self ticksLayer];
  [v33 addSublayer:v34];

  id v35 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  [v35 setUnitsStyle:1];
  [v35 setAllowedUnits:128];
  id v36 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  v37 = [(HKElectrocardiogramAxisView *)self options];
  if ([v37 scaleMetricsAutomatically])
  {
    v38 = [(HKElectrocardiogramAxisView *)self metrics];
    v39 = [(HKElectrocardiogramAxisView *)self options];
    [v39 axisLineToLabelSpacing];
    double v41 = v40;
    v42 = [(HKElectrocardiogramAxisView *)self traitCollection];
    [v38 scaledValueForValue:v42 compatibleWithTraitCollection:v41];
    double v44 = v43;
  }
  else
  {
    v38 = [(HKElectrocardiogramAxisView *)self options];
    [v38 axisLineToLabelSpacing];
    double v44 = v45;
  }

  if (v16 >= 1)
  {
    for (uint64_t k = 0; k != v16; ++k)
    {
      v47 = [(HKElectrocardiogramAxisView *)self _createLabel];
      v48 = [v47 leftAnchor];
      v49 = [(HKElectrocardiogramAxisView *)self leftAnchor];
      [(HKElectrocardiogramAxisView *)self axisSpacing];
      v51 = [v48 constraintEqualToAnchor:v49 constant:v44 + v50 * (double)k];
      [v51 setActive:1];

      objc_msgSend(v36, "setSecond:", -[HKElectrocardiogramAxisView startingIndex](self, "startingIndex") + k);
      v52 = [v35 stringFromDateComponents:v36];
      [v47 setText:v52];
    }
  }
}

- (id)_createLabel
{
  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v6 = [(HKElectrocardiogramAxisView *)self options];
  if ([v6 scaleMetricsAutomatically])
  {
    double v7 = [(HKElectrocardiogramAxisView *)self metrics];
    double v8 = [(HKElectrocardiogramAxisView *)self options];
    double v9 = [v8 axisLabelFont];
    double v10 = [(HKElectrocardiogramAxisView *)self traitCollection];
    v2 = [v7 scaledFontForFont:v9 compatibleWithTraitCollection:v10];
    [v5 setFont:v2];
  }
  else
  {
    double v7 = [(HKElectrocardiogramAxisView *)self options];
    double v8 = [v7 axisLabelFont];
    [v5 setFont:v8];
  }

  double v11 = [(HKElectrocardiogramAxisView *)self options];
  uint64_t v12 = [v11 axisLabelTextColor];
  [v5 setTextColor:v12];

  [v5 setTextAlignment:0];
  uint64_t v13 = [(HKElectrocardiogramAxisView *)self options];
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", objc_msgSend(v13, "scaleMetricsAutomatically"));

  [(HKElectrocardiogramAxisView *)self addSubview:v5];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v14 = [v5 firstBaselineAnchor];
  v15 = [(HKElectrocardiogramAxisView *)self topAnchor];
  uint64_t v16 = [(HKElectrocardiogramAxisView *)self options];
  int v17 = [v16 scaleMetricsAutomatically];
  if (v17)
  {
    uint64_t v18 = [(HKElectrocardiogramAxisView *)self metrics];
    v2 = [(HKElectrocardiogramAxisView *)self options];
    [v2 topBaselineMargin];
    objc_msgSend(v18, "scaledValueForValue:");
  }
  else
  {
    uint64_t v18 = [(HKElectrocardiogramAxisView *)self options];
    [v18 topBaselineMargin];
  }
  uint64_t v19 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
  [v19 setActive:1];

  if (v17) {
  uint64_t v20 = [(HKElectrocardiogramAxisView *)self bottomAnchor];
  }
  v21 = [v5 lastBaselineAnchor];
  v22 = [(HKElectrocardiogramAxisView *)self options];
  int v23 = [v22 scaleMetricsAutomatically];
  if (v23)
  {
    double v24 = [(HKElectrocardiogramAxisView *)self metrics];
    self = [(HKElectrocardiogramAxisView *)self options];
    [(HKElectrocardiogramAxisView *)self bottomBaselineMargin];
    objc_msgSend(v24, "scaledValueForValue:");
  }
  else
  {
    double v24 = [(HKElectrocardiogramAxisView *)self options];
    [v24 bottomBaselineMargin];
  }
  v25 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21);
  [v25 setActive:1];

  if (v23) {
  return v5;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramAxisView;
  [(HKElectrocardiogramAxisView *)&v4 traitCollectionDidChange:a3];
  [(HKElectrocardiogramAxisView *)self setNeedsLayout];
}

- (UIFont)axisLabelFont
{
  v2 = [(HKElectrocardiogramAxisView *)self options];
  double v3 = [v2 axisLabelFont];

  return (UIFont *)v3;
}

- (double)lineWidth
{
  v2 = [(HKElectrocardiogramAxisView *)self options];
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (UIColor)lineColor
{
  v2 = [(HKElectrocardiogramAxisView *)self options];
  double v3 = [v2 lineColor];

  return (UIColor *)v3;
}

- (double)axisSpacing
{
  return self->_axisSpacing;
}

- (void)setAxisSpacing:(double)a3
{
  self->_axisSpacing = a3;
}

- (HKElectrocardiogramAxisOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (CAReplicatorLayer)ticksLayer
{
  return self->_ticksLayer;
}

- (void)setTicksLayer:(id)a3
{
}

- (UIFontMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (int64_t)startingIndex
{
  return self->_startingIndex;
}

- (void)setStartingIndex:(int64_t)a3
{
  self->_startingIndex = a3;
}

- (CGSize)lastBoundsSize
{
  double width = self->_lastBoundsSize.width;
  double height = self->_lastBoundsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastBoundsSize:(CGSize)a3
{
  self->_lastBoundsSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ticksLayer, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end