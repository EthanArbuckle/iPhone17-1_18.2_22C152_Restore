@interface HKElectrocardiogramChartView
+ (NSArray)defaultGridOptions;
+ (NSArray)printedGridOptions;
- (BOOL)allowsScrolling;
- (BOOL)isDisplayingControlSignal;
- (BOOL)isEdgeMaskEnabled;
- (CGSize)gridSize;
- (CGSize)intrinsicContentSize;
- (CGSize)lastSize;
- (HKElectrocardiogram)sample;
- (HKElectrocardiogramChartView)initWithGridSize:(CGSize)a3;
- (HKElectrocardiogramChartView)initWithGridSize:(CGSize)a3 gridOptions:(id)a4;
- (HKElectrocardiogramGridView)gridView;
- (HKElectrocardiogramWaveformView)waveformView;
- (NSArray)gridOptions;
- (UIColor)lineColor;
- (UIView)waveformContainerView;
- (double)controlSignalDuration;
- (double)lineWidth;
- (double)pointsPerMillivolt;
- (double)pointsPerSecond;
- (void)_setUpUI;
- (void)_updateChartForSizeChange;
- (void)displayElectrocardiogram:(id)a3 allowsScrolling:(BOOL)a4;
- (void)layoutSubviews;
- (void)setAllowsScrolling:(BOOL)a3;
- (void)setDisplayControlSignal:(BOOL)a3;
- (void)setEdgeMaskEnabled:(BOOL)a3;
- (void)setGridView:(id)a3;
- (void)setLastSize:(CGSize)a3;
- (void)setLineColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setSample:(id)a3;
- (void)setWaveformContainerView:(id)a3;
- (void)setWaveformPath:(id)a3;
- (void)setWaveformPaths:(id)a3;
- (void)setWaveformView:(id)a3;
@end

@implementation HKElectrocardiogramChartView

+ (NSArray)defaultGridOptions
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v2 = [HKElectrocardiogramGridOptions alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_electrocardiogramChartMajorGridlineColor");
  v4 = [(HKElectrocardiogramGridOptions *)v2 initWithUnitMultiple:30 axis:1 lineColor:v3 lineWidth:HKUICeilToScreenScale(0.5)];
  v16[0] = v4;
  v5 = [HKElectrocardiogramGridOptions alloc];
  v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_electrocardiogramChartMajorGridlineColor");
  v7 = [(HKElectrocardiogramGridOptions *)v5 initWithUnitMultiple:25 axis:2 lineColor:v6 lineWidth:HKUICeilToScreenScale(0.5)];
  v16[1] = v7;
  v8 = [HKElectrocardiogramGridOptions alloc];
  v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_electrocardiogramChartMinorGridlineColor");
  v10 = [(HKElectrocardiogramGridOptions *)v8 initWithUnitMultiple:5 axis:3 lineColor:v9 lineWidth:HKUICeilToScreenScale(0.25)];
  v16[2] = v10;
  v11 = [HKElectrocardiogramGridOptions alloc];
  v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_electrocardiogramChartVeryMinorGridlineColor");
  v13 = [(HKElectrocardiogramGridOptions *)v11 initWithUnitMultiple:1 axis:3 lineColor:v12 lineWidth:HKUICeilToScreenScale(0.25)];
  v16[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];

  return (NSArray *)v14;
}

+ (NSArray)printedGridOptions
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = [HKElectrocardiogramGridOptions alloc];
  v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
  v4 = [(HKElectrocardiogramGridOptions *)v2 initWithUnitMultiple:5 axis:3 lineColor:v3 lineWidth:0.5];
  v10[0] = v4;
  v5 = [HKElectrocardiogramGridOptions alloc];
  v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
  v7 = [(HKElectrocardiogramGridOptions *)v5 initWithUnitMultiple:1 axis:3 lineColor:v6 lineWidth:0.5];
  v10[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  return (NSArray *)v8;
}

- (HKElectrocardiogramChartView)initWithGridSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(id)objc_opt_class() defaultGridOptions];
  v7 = -[HKElectrocardiogramChartView initWithGridSize:gridOptions:](self, "initWithGridSize:gridOptions:", v6, width, height);

  return v7;
}

- (HKElectrocardiogramChartView)initWithGridSize:(CGSize)a3 gridOptions:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HKElectrocardiogramChartView;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v12 = -[HKElectrocardiogramChartView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v9, v10, v11);
  if (v12)
  {
    v13 = -[HKElectrocardiogramGridView initWithUnitSize:grids:]([HKElectrocardiogramGridView alloc], "initWithUnitSize:grids:", v7, width, height);
    gridView = v12->_gridView;
    v12->_gridView = v13;

    v15 = -[HKElectrocardiogramWaveformView initWithFrame:]([HKElectrocardiogramWaveformView alloc], "initWithFrame:", v8, v9, v10, v11);
    waveformView = v12->_waveformView;
    v12->_waveformView = v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v8, v9, v10, v11);
    waveformContainerView = v12->_waveformContainerView;
    v12->_waveformContainerView = (UIView *)v17;

    v12->_lastSize = (CGSize)*MEMORY[0x1E4F1DB30];
    [(HKElectrocardiogramChartView *)v12 _setUpUI];
  }

  return v12;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(HKElectrocardiogramChartView *)self waveformView];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(HKElectrocardiogramChartView *)self gridView];
  [v8 majorGridSize];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10 * ceil(v5 / v10);
  double v14 = v12 * ceil(v7 / v12);
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)_setUpUI
{
  v3 = [(HKElectrocardiogramChartView *)self gridView];
  [(HKElectrocardiogramChartView *)self addSubview:v3];

  double v4 = [(HKElectrocardiogramChartView *)self waveformContainerView];
  double v5 = [(HKElectrocardiogramChartView *)self waveformView];
  [v4 addSubview:v5];

  double v6 = [(HKElectrocardiogramChartView *)self waveformContainerView];
  [(HKElectrocardiogramChartView *)self addSubview:v6];

  double v7 = [(HKElectrocardiogramChartView *)self waveformContainerView];
  [v7 setClipsToBounds:1];

  double v8 = [(HKElectrocardiogramChartView *)self gridView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v9 = [(HKElectrocardiogramChartView *)self waveformView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v10 = [(HKElectrocardiogramChartView *)self waveformContainerView];
  objc_msgSend(v10, "hk_alignConstraintsWithView:", self);

  double v11 = [(HKElectrocardiogramChartView *)self gridView];
  objc_msgSend(v11, "hk_alignConstraintsWithView:", self);

  double v12 = [(HKElectrocardiogramChartView *)self waveformView];
  double v13 = [v12 leftAnchor];
  double v14 = [(HKElectrocardiogramChartView *)self waveformContainerView];
  v15 = [v14 leftAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  uint64_t v17 = [(HKElectrocardiogramChartView *)self waveformView];
  v18 = [v17 centerYAnchor];
  v19 = [(HKElectrocardiogramChartView *)self waveformContainerView];
  objc_super v20 = [v19 centerYAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  id v25 = [(HKElectrocardiogramChartView *)self waveformView];
  v22 = [v25 heightAnchor];
  [(HKElectrocardiogramChartView *)self pointsPerMillivolt];
  v24 = [v22 constraintEqualToConstant:v23 * 3.0999999];
  [v24 setActive:1];
}

- (CGSize)gridSize
{
  v2 = [(HKElectrocardiogramChartView *)self gridView];
  [v2 unitSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (NSArray)gridOptions
{
  v2 = [(HKElectrocardiogramChartView *)self gridView];
  double v3 = [v2 grids];

  return (NSArray *)v3;
}

- (BOOL)isDisplayingControlSignal
{
  v2 = [(HKElectrocardiogramChartView *)self gridView];
  double v3 = [v2 controlSignalPath];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setDisplayControlSignal:(BOOL)a3
{
  if (a3)
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
    objc_msgSend(v24, "moveToPoint:", 0.0, 0.0);
    [(HKElectrocardiogramChartView *)self pointsPerSecond];
    double v5 = (v4 + v4) / 9.0;
    [(HKElectrocardiogramChartView *)self controlSignalDuration];
    objc_msgSend(v24, "addLineToPoint:", v6 * v5, 0.0);
    [(HKElectrocardiogramChartView *)self pointsPerSecond];
    double v8 = (v7 + v7) / 9.0;
    [(HKElectrocardiogramChartView *)self controlSignalDuration];
    double v10 = v9 * v8;
    [(HKElectrocardiogramChartView *)self pointsPerMillivolt];
    objc_msgSend(v24, "addLineToPoint:", v10, -v11);
    [(HKElectrocardiogramChartView *)self pointsPerSecond];
    double v13 = v12 * 7.0 / 9.0;
    [(HKElectrocardiogramChartView *)self controlSignalDuration];
    double v15 = v14 * v13;
    [(HKElectrocardiogramChartView *)self pointsPerMillivolt];
    objc_msgSend(v24, "addLineToPoint:", v15, -v16);
    [(HKElectrocardiogramChartView *)self pointsPerSecond];
    double v18 = v17 * 7.0 / 9.0;
    [(HKElectrocardiogramChartView *)self controlSignalDuration];
    objc_msgSend(v24, "addLineToPoint:", v19 * v18, 0.0);
    [(HKElectrocardiogramChartView *)self pointsPerSecond];
    double v21 = v20 * 9.0 / 9.0;
    [(HKElectrocardiogramChartView *)self controlSignalDuration];
    objc_msgSend(v24, "addLineToPoint:", v22 * v21, 0.0);
    double v23 = [(HKElectrocardiogramChartView *)self gridView];
    [v23 setControlSignalPath:v24];
  }
  else
  {
    id v24 = [(HKElectrocardiogramChartView *)self gridView];
    [v24 setControlSignalPath:0];
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HKElectrocardiogramChartView;
  [(HKElectrocardiogramChartView *)&v14 layoutSubviews];
  if ([(HKElectrocardiogramChartView *)self isEdgeMaskEnabled])
  {
    [(HKElectrocardiogramChartView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(HKElectrocardiogramChartView *)self gridSize];
    double v12 = +[HKGradientView hk_verticalWaveformMaskGradientWithInsetLocation:(v11 + v11) / v10];
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
    double v13 = [(HKElectrocardiogramChartView *)self waveformContainerView];
    [v13 setMaskView:v12];
  }
  else
  {
    double v12 = [(HKElectrocardiogramChartView *)self waveformContainerView];
    [v12 setMaskView:0];
  }

  [(HKElectrocardiogramChartView *)self _updateChartForSizeChange];
}

- (double)controlSignalDuration
{
  return 0.36;
}

- (void)setEdgeMaskEnabled:(BOOL)a3
{
  self->_edgeMaskEnabled = a3;
  [(HKElectrocardiogramChartView *)self setNeedsLayout];
}

- (void)setWaveformPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  double v6 = [v4 arrayWithObjects:&v7 count:1];

  -[HKElectrocardiogramChartView setWaveformPaths:](self, "setWaveformPaths:", v6, v7, v8);
}

- (void)setWaveformPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(HKElectrocardiogramChartView *)self waveformView];
  [v5 setPaths:v4];
}

- (void)displayElectrocardiogram:(id)a3 allowsScrolling:(BOOL)a4
{
  BOOL v4 = a4;
  [(HKElectrocardiogramChartView *)self setSample:a3];
  [(HKElectrocardiogramChartView *)self setAllowsScrolling:v4];
  if (v4)
  {
    double v6 = [(HKElectrocardiogramChartView *)self sample];
    [(HKElectrocardiogramChartView *)self pointsPerSecond];
    double v8 = v7;
    [(HKElectrocardiogramChartView *)self pointsPerMillivolt];
    LODWORD(v9) = -1081711002;
    LODWORD(v10) = 1073951539;
    objc_msgSend(v6, "hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:", v8, v11, v9, v10);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13) {
      id v12 = v13;
    }
    else {
      id v12 = (id)MEMORY[0x1E4F1CBF0];
    }
    [(HKElectrocardiogramChartView *)self setWaveformPaths:v12];
  }
  else
  {
    [(HKElectrocardiogramChartView *)self setWaveformPaths:MEMORY[0x1E4F1CBF0]];
    -[HKElectrocardiogramChartView setLastSize:](self, "setLastSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [(HKElectrocardiogramChartView *)self _updateChartForSizeChange];
  }
}

- (void)_updateChartForSizeChange
{
  double v3 = [(HKElectrocardiogramChartView *)self sample];
  if (v3)
  {
    id v30 = v3;
    if (![(HKElectrocardiogramChartView *)self allowsScrolling])
    {
      [(HKElectrocardiogramChartView *)self lastSize];
      double v5 = v4;
      double v7 = v6;
      [(HKElectrocardiogramChartView *)self bounds];
      double v9 = v8;
      double v11 = v10;

      if (v5 == v9 && v7 == v11) {
        return;
      }
      [(HKElectrocardiogramChartView *)self bounds];
      -[HKElectrocardiogramChartView setLastSize:](self, "setLastSize:", v12, v13);
      objc_super v14 = [(HKElectrocardiogramChartView *)self sample];
      double v15 = [v14 samplingFrequency];
      double v16 = [MEMORY[0x1E4F2B618] hertzUnit];
      [v15 doubleValueForUnit:v16];
      double v18 = v17;

      double v19 = v18 * 0.04;
      [(HKElectrocardiogramChartView *)self lastSize];
      double v21 = v20;
      [(HKElectrocardiogramChartView *)self gridSize];
      uint64_t v23 = (uint64_t)(v19 * (v21 / v22));
      id v24 = [(HKElectrocardiogramChartView *)self sample];
      [(HKElectrocardiogramChartView *)self lastSize];
      double v26 = v25;
      [(HKElectrocardiogramChartView *)self pointsPerMillivolt];
      LODWORD(v27) = -1081711002;
      LODWORD(v28) = 1073951539;
      objc_msgSend(v24, "hk_waveformPathsWithNumberOfValues:fitToWidth:pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:", v23, v26, v29, v27, v28);
      id v30 = (id)objc_claimAutoreleasedReturnValue();

      [(HKElectrocardiogramChartView *)self setWaveformPaths:v30];
    }
    double v3 = v30;
  }
}

- (double)pointsPerSecond
{
  [(HKElectrocardiogramChartView *)self gridSize];
  return v2 / 0.04;
}

- (double)pointsPerMillivolt
{
  [(HKElectrocardiogramChartView *)self gridSize];
  return v2 / 0.1;
}

- (double)lineWidth
{
  double v2 = [(HKElectrocardiogramChartView *)self waveformView];
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (void)setLineWidth:(double)a3
{
  id v4 = [(HKElectrocardiogramChartView *)self waveformView];
  [v4 setLineWidth:a3];
}

- (UIColor)lineColor
{
  double v2 = [(HKElectrocardiogramChartView *)self waveformView];
  double v3 = [v2 lineColor];

  return (UIColor *)v3;
}

- (void)setLineColor:(id)a3
{
  id v4 = a3;
  id v5 = [(HKElectrocardiogramChartView *)self waveformView];
  [v5 setLineColor:v4];
}

- (BOOL)isEdgeMaskEnabled
{
  return self->_edgeMaskEnabled;
}

- (HKElectrocardiogramGridView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
}

- (HKElectrocardiogramWaveformView)waveformView
{
  return self->_waveformView;
}

- (void)setWaveformView:(id)a3
{
}

- (UIView)waveformContainerView
{
  return self->_waveformContainerView;
}

- (void)setWaveformContainerView:(id)a3
{
}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (BOOL)allowsScrolling
{
  return self->_allowsScrolling;
}

- (void)setAllowsScrolling:(BOOL)a3
{
  self->_allowsScrolling = a3;
}

- (CGSize)lastSize
{
  double width = self->_lastSize.width;
  double height = self->_lastSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastSize:(CGSize)a3
{
  self->_lastSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_waveformContainerView, 0);
  objc_storeStrong((id *)&self->_waveformView, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
}

@end