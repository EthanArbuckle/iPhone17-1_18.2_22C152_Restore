@interface NTKRenegadeTimeView
- (BOOL)complicationsEnabled;
- (BOOL)isFrozen;
- (BOOL)paused;
- (CGRect)_quiltOverallBoundingFrameWithComplicationsEnabled:(BOOL)a3;
- (NTKRenegadeBackgroundConfiguration)configuration;
- (NTKRenegadeBackgroundConfiguration)targetConfiguration;
- (NTKRenegadeColorPalette)palette;
- (NTKRenegadeTimeView)initWithDevice:(id)a3;
- (UIEdgeInsets)complicationsEdgeInsets;
- (double)configurationTransitionFraction;
- (double)screenWakeDuration;
- (id)_coloringLabel;
- (id)_nextConfiguration;
- (id)_nextConfigurationWithComplicationsEnabled:(BOOL)a3;
- (void)_applyFrozen;
- (void)_applyTimeLabelFontForComplicationsEnabledWithFraction:(double)a3;
- (void)_layoutTimeLabels;
- (void)_updateLabelBackgroundCutouts;
- (void)_updateLabelBackgroundCutoutsForConfiguration:(id)a3;
- (void)_updateTimeLabels;
- (void)_updateTimeLabelsWithBackgroundCutouts:(BOOL)a3;
- (void)applyTransitionFraction:(double)a3 fromComplicationsEnabled:(BOOL)a4 toComplicationsEnabled:(BOOL)a5;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setComplicationsEdgeInsets:(UIEdgeInsets)a3;
- (void)setComplicationsEnabled:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPalette:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setScreenWakeDuration:(double)a3;
- (void)setTargetConfiguration:(id)a3;
- (void)setTimeOffset:(double)a3;
@end

@implementation NTKRenegadeTimeView

- (NTKRenegadeTimeView)initWithDevice:(id)a3
{
  id v5 = a3;
  [v5 screenBounds];
  v33.receiver = self;
  v33.super_class = (Class)NTKRenegadeTimeView;
  v6 = -[NTKRenegadeTimeView initWithFrame:](&v33, "initWithFrame:");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = (CLKTimeFormatter *)[objc_alloc((Class)CLKTimeFormatter) initWithForcesLatinNumbers:1];
    timeFormatter = v7->_timeFormatter;
    v7->_timeFormatter = v8;

    [(CLKTimeFormatter *)v7->_timeFormatter setIncludeSeparatorInTimeSubstringFromSeparatorText:0];
    [(CLKTimeFormatter *)v7->_timeFormatter addObserver:v7];
    uint64_t v10 = [(NTKRenegadeTimeView *)v7 _coloringLabel];
    hourBackgroundLabel = v7->_hourBackgroundLabel;
    v7->_hourBackgroundLabel = (CLKUIColoringLabel *)v10;

    [(NTKRenegadeTimeView *)v7 addSubview:v7->_hourBackgroundLabel];
    uint64_t v12 = [(NTKRenegadeTimeView *)v7 _coloringLabel];
    hourLabel = v7->_hourLabel;
    v7->_hourLabel = (CLKUIColoringLabel *)v12;

    v14 = [(CLKUIColoringLabel *)v7->_hourLabel layer];
    [v14 setShouldRasterize:1];

    v15 = [(CLKUIColoringLabel *)v7->_hourLabel layer];
    [v15 setFrozen:1];

    uint64_t v16 = [(NTKRenegadeTimeView *)v7 _coloringLabel];
    minuteBackgroundLabel = v7->_minuteBackgroundLabel;
    v7->_minuteBackgroundLabel = (CLKUIColoringLabel *)v16;

    [(NTKRenegadeTimeView *)v7 addSubview:v7->_minuteBackgroundLabel];
    uint64_t v18 = [(NTKRenegadeTimeView *)v7 _coloringLabel];
    minuteLabel = v7->_minuteLabel;
    v7->_minuteLabel = (CLKUIColoringLabel *)v18;

    v20 = [(CLKUIColoringLabel *)v7->_minuteLabel layer];
    [v20 setShouldRasterize:1];

    v21 = [(CLKUIColoringLabel *)v7->_minuteLabel layer];
    [v21 setFrozen:1];

    v22 = [[NTKRenegadeBackgroundView alloc] initWithDevice:v5];
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = v22;

    [(NTKRenegadeTimeView *)v7 addSubview:v7->_backgroundView];
    uint64_t v24 = +[CAShapeLayer layer];
    topContentCutoutLayer = v7->_topContentCutoutLayer;
    v7->_topContentCutoutLayer = (CAShapeLayer *)v24;

    v26 = [(NTKRenegadeTimeView *)v7 layer];
    [v26 addSublayer:v7->_topContentCutoutLayer];

    uint64_t v27 = +[CAShapeLayer layer];
    bottomContentCutoutLayer = v7->_bottomContentCutoutLayer;
    v7->_bottomContentCutoutLayer = (CAShapeLayer *)v27;

    v29 = [(NTKRenegadeTimeView *)v7 layer];
    [v29 addSublayer:v7->_bottomContentCutoutLayer];

    v30 = [(CLKUIColoringLabel *)v7->_hourLabel layer];
    [(CAShapeLayer *)v7->_topContentCutoutLayer setMask:v30];

    v31 = [(CLKUIColoringLabel *)v7->_minuteLabel layer];
    [(CAShapeLayer *)v7->_bottomContentCutoutLayer setMask:v31];

    v7->_frozen = 1;
    [(NTKRenegadeTimeView *)v7 setUserInteractionEnabled:0];
    v7->_timeViewOffset = CGPointZero;
    [(NTKRenegadeTimeView *)v7 _updateTimeLabels];
  }

  return v7;
}

- (id)_coloringLabel
{
  v3 = objc_opt_new();
  v4 = +[CLKFont systemFontOfSize:sub_7E30(self->_device) weight:UIFontWeightHeavy];
  [v3 setFont:v4];

  [v3 setTextAlignment:1];

  return v3;
}

- (void)dealloc
{
  [(CLKTimeFormatter *)self->_timeFormatter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)NTKRenegadeTimeView;
  [(NTKRenegadeTimeView *)&v3 dealloc];
}

- (void)_updateLabelBackgroundCutouts
{
  id v3 = [(NTKRenegadeBackgroundView *)self->_backgroundView configuration];
  [(NTKRenegadeTimeView *)self _updateLabelBackgroundCutoutsForConfiguration:v3];
}

- (void)_updateLabelBackgroundCutoutsForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 topQuiltPath];
  id v6 = [v5 CGPath];

  v7 = [v4 bottomQuiltPath];

  id v8 = v7;
  id v9 = [v8 CGPath];

  [(CAShapeLayer *)self->_topContentCutoutLayer setPath:v6];
  bottomContentCutoutLayer = self->_bottomContentCutoutLayer;

  [(CAShapeLayer *)bottomContentCutoutLayer setPath:v9];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRenegadeTimeView;
  [(NTKRenegadeTimeView *)&v3 layoutSubviews];
  [(NTKRenegadeTimeView *)self _layoutTimeLabels];
}

- (void)_layoutTimeLabels
{
  v22 = self->_device;
  double v3 = sub_7E30(v22);
  double v5 = v4;
  double v7 = v6;
  [(CLKDevice *)v22 screenBounds];
  double v9 = v8;
  double v11 = v10;
  [(CLKUIColoringLabel *)self->_hourLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_hourLabel bounds];
  double v13 = v12;
  double x = self->_timeViewOffset.x;
  double y = self->_timeViewOffset.y;
  double v16 = v5 - v12;
  if (![(CLKDevice *)v22 sizeClass])
  {
    double v17 = 0.25;
    goto LABEL_6;
  }
  if ([(CLKDevice *)v22 sizeClass] == (char *)&dword_0 + 1
    || [(CLKDevice *)v22 sizeClass] == (char *)&dword_0 + 2)
  {
    double v17 = 0.5;
LABEL_6:
    double v16 = v16 + y * v17;
  }
  -[CLKUIColoringLabel ntk_setBoundsAndPositionFromFrame:](self->_hourLabel, "ntk_setBoundsAndPositionFromFrame:", x, v16, v9, v13);
  -[CLKUIColoringLabel ntk_setBoundsAndPositionFromFrame:](self->_hourBackgroundLabel, "ntk_setBoundsAndPositionFromFrame:", x, v16, v9, v13);
  [(CLKUIColoringLabel *)self->_minuteLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_minuteLabel bounds];
  [(CLKUIColoringLabel *)self->_minuteLabel bounds];
  double v19 = v18;
  double v20 = v11 - v7;
  if (![(CLKDevice *)v22 sizeClass]
    || [(CLKDevice *)v22 sizeClass] == (char *)&dword_0 + 1
    || [(CLKDevice *)v22 sizeClass] == (char *)&dword_0 + 2)
  {
    double v21 = v20 + y;
  }
  else
  {
    double v21 = v20 + y * 0.5;
  }
  -[CLKUIColoringLabel ntk_setBoundsAndPositionFromFrame:](self->_minuteLabel, "ntk_setBoundsAndPositionFromFrame:", x, v21, v9, v19);
  -[CLKUIColoringLabel ntk_setBoundsAndPositionFromFrame:](self->_minuteBackgroundLabel, "ntk_setBoundsAndPositionFromFrame:", x, v21, v9, v19);
}

- (void)setComplicationsEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_complicationsEdgeInsets.left != a3.left
    || self->_complicationsEdgeInsets.top != a3.top
    || self->_complicationsEdgeInsets.right != a3.right
    || self->_complicationsEdgeInsets.bottom != a3.bottom)
  {
    self->_complicationsEdgeInsets = a3;
    double v6 = 1.0;
    if (!self->_complicationsEnabled) {
      double v6 = 0.0;
    }
    [(NTKRenegadeTimeView *)self _applyTimeLabelFontForComplicationsEnabledWithFraction:v6];
  }
}

- (id)_nextConfiguration
{
  return [(NTKRenegadeTimeView *)self _nextConfigurationWithComplicationsEnabled:self->_complicationsEnabled];
}

- (id)_nextConfigurationWithComplicationsEnabled:(BOOL)a3
{
  [(CLKDevice *)self->_device screenBounds];

  return +[NTKRenegadeBackgroundConfiguration snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:](NTKRenegadeBackgroundConfiguration, "snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:");
}

- (void)setPalette:(id)a3
{
  double v4 = (NTKRenegadeColorPalette *)a3;
  [(NTKRenegadeTimeView *)self applyTransitionFraction:v4 fromPalette:v4 toPalette:1.0];
  palette = self->_palette;
  self->_palette = v4;
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  +[CATransaction setDisableActions:1];
  double v9 = [v8 hourLabelColor];
  double v10 = [v7 hourLabelColor];
  NTKInterpolateBetweenColors();
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  [(CLKUIColoringLabel *)self->_hourBackgroundLabel setTextColor:v28];
  [(CLKUIColoringLabel *)self->_hourLabel setTextColor:v28];
  double v11 = [v8 minuteLabelColor];
  double v12 = [v7 minuteLabelColor];
  double v13 = NTKInterpolateBetweenColors();

  [(CLKUIColoringLabel *)self->_minuteBackgroundLabel setTextColor:v13];
  [(CLKUIColoringLabel *)self->_minuteLabel setTextColor:v13];
  v14 = [v8 topPatchColor];
  v15 = [v7 topPatchColor];
  uint64_t v27 = NTKInterpolateBetweenColors();

  [(NTKRenegadeBackgroundView *)self->_backgroundView setTopQuiltColor:v27];
  double v16 = [v7 highlightColor];
  double v17 = [v8 highlightColor];
  double v18 = NTKInterpolateBetweenColors();

  id v19 = v18;
  -[CAShapeLayer setFillColor:](self->_topContentCutoutLayer, "setFillColor:", [v19 CGColor]);
  double v20 = [v8 bottomPatchColor];
  double v21 = [v7 bottomPatchColor];
  v22 = NTKInterpolateBetweenColors();

  [(NTKRenegadeBackgroundView *)self->_backgroundView setBottomQuiltColor:v22];
  v23 = [v8 bottomOverlapColor];

  uint64_t v24 = [v7 bottomOverlapColor];

  v25 = NTKInterpolateBetweenColors();

  id v26 = v25;
  -[CAShapeLayer setFillColor:](self->_bottomContentCutoutLayer, "setFillColor:", [v26 CGColor]);
  +[CATransaction setDisableActions:0];
}

- (void)setComplicationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_complicationsEnabled != a3 || !self->_configuration)
  {
    self->_complicationsEnabled = a3;
    double v5 = 0.0;
    if (a3) {
      double v5 = 1.0;
    }
    [(NTKRenegadeTimeView *)self _applyTimeLabelFontForComplicationsEnabledWithFraction:v5];
    configuration = self->_configuration;
    if (configuration
      && ![(NTKRenegadeBackgroundConfiguration *)configuration isSnapshotConfiguration])
    {
      uint64_t v7 = [(NTKRenegadeTimeView *)self _nextConfigurationWithComplicationsEnabled:v3];
    }
    else
    {
      [(CLKDevice *)self->_device screenBounds];
      uint64_t v7 = +[NTKRenegadeBackgroundConfiguration snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:](NTKRenegadeBackgroundConfiguration, "snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:");
    }
    id v8 = (id)v7;
    [(NTKRenegadeTimeView *)self setConfiguration:v7];
  }
}

- (void)applyTransitionFraction:(double)a3 fromComplicationsEnabled:(BOOL)a4 toComplicationsEnabled:(BOOL)a5
{
  if (a4 == a5)
  {
    [(NTKRenegadeTimeView *)self _updateLabelBackgroundCutouts];
  }
  else
  {
    BOOL v6 = a5;
    double v7 = a3;
    id v8 = self->_device;
    [(CLKDevice *)v8 screenBounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    +[NTKRenegadeBackgroundConfiguration snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:](NTKRenegadeBackgroundConfiguration, "snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    double v17 = +[NTKRenegadeBackgroundConfiguration snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:](NTKRenegadeBackgroundConfiguration, "snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:", v10, v12, v14, v16, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    if (!v6) {
      double v7 = 1.0 - v7;
    }
    double v18 = +[NTKRenegadeBackgroundConfiguration interpolatedConfigurationWithFraction:v17 fromConfiguration:v19 toConfiguration:v7];
    [(NTKRenegadeBackgroundView *)self->_backgroundView setConfiguration:v18];

    [(NTKRenegadeTimeView *)self _applyTimeLabelFontForComplicationsEnabledWithFraction:v7];
    [(NTKRenegadeTimeView *)self _updateLabelBackgroundCutoutsForConfiguration:v18];
  }
}

- (void)_applyTimeLabelFontForComplicationsEnabledWithFraction:(double)a3
{
  double v4 = self->_device;
  sub_7E30(v4);
  CLKInterpolateBetweenFloatsUnclipped();
  +[CLKFont systemFontOfSize:weight:](CLKFont, "systemFontOfSize:weight:");
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [(CLKUIColoringLabel *)self->_hourLabel setFont:v24];
  [(CLKUIColoringLabel *)self->_hourBackgroundLabel setFont:v24];
  [(CLKUIColoringLabel *)self->_minuteLabel setFont:v24];
  [(CLKUIColoringLabel *)self->_minuteBackgroundLabel setFont:v24];
  [(CLKDevice *)v4 screenBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v26.origin.double x = v6;
  v26.origin.double y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  double MidX = CGRectGetMidX(v26);
  v27.origin.double x = v6;
  v27.origin.double y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  double MidY = CGRectGetMidY(v27);
  double top = self->_complicationsEdgeInsets.top;
  double left = self->_complicationsEdgeInsets.left;
  CGFloat v17 = v6 + left;
  CGFloat v18 = v8 + top;
  CGFloat v19 = v10 - (left + self->_complicationsEdgeInsets.right);
  CGFloat v20 = v12 - (top + self->_complicationsEdgeInsets.bottom);
  v28.origin.double x = v17;
  v28.origin.double y = v18;
  v28.size.width = v19;
  v28.size.height = v20;
  CGRectGetMidX(v28);
  CLKInterpolateBetweenFloatsClipped();
  CGFloat v22 = v21 - MidX;
  v29.origin.double x = v17;
  v29.origin.double y = v18;
  v29.size.width = v19;
  v29.size.height = v20;
  CGRectGetMidY(v29);
  CLKInterpolateBetweenFloatsClipped();
  self->_timeViewOffset.double x = v22;
  self->_timeViewOffset.double y = v23 - MidY;
  [(NTKRenegadeTimeView *)self _layoutTimeLabels];
  [(NTKRenegadeTimeView *)self _updateTimeLabelsWithBackgroundCutouts:1];
}

- (void)setConfiguration:(id)a3
{
  double v5 = (NTKRenegadeBackgroundConfiguration *)a3;
  if (self->_configuration != v5)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    objc_storeStrong((id *)&self->_targetConfiguration, a3);
    [(NTKRenegadeBackgroundView *)self->_backgroundView setConfiguration:v5];
    [(NTKRenegadeTimeView *)self _updateLabelBackgroundCutoutsForConfiguration:v5];
  }
}

- (void)_updateTimeLabels
{
}

- (void)_updateTimeLabelsWithBackgroundCutouts:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CLKTimeFormatter *)self->_timeFormatter timeSubstringToSeparatorText];
  double v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%02ld", [v5 integerValue]);

  double v7 = [(CLKUIColoringLabel *)self->_hourLabel text];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  int v9 = v3;
  if ((v8 & 1) == 0)
  {
    double v10 = [(CLKUIColoringLabel *)self->_hourLabel layer];
    [v10 setFrozen:0];

    [(CLKUIColoringLabel *)self->_hourLabel setText:v6];
    [(CLKUIColoringLabel *)self->_hourBackgroundLabel setText:v6];
    int v9 = 1;
  }
  double v11 = [(CLKTimeFormatter *)self->_timeFormatter timeSubstringFromSeparatorText];
  double v12 = [(CLKUIColoringLabel *)self->_minuteLabel text];
  unsigned int v13 = [v11 isEqual:v12];

  if (v13)
  {
    if (!v3)
    {
      if (!v9) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  double v14 = [(CLKUIColoringLabel *)self->_minuteLabel layer];
  [v14 setFrozen:0];

  [(CLKUIColoringLabel *)self->_minuteLabel setText:v11];
  [(CLKUIColoringLabel *)self->_minuteBackgroundLabel setText:v11];
  if (v3)
  {
LABEL_8:
    double v15 = [(CLKUIColoringLabel *)self->_hourLabel layer];
    [v15 setFrozen:0];

    double v16 = [(CLKUIColoringLabel *)self->_minuteLabel layer];
    [v16 setFrozen:0];
  }
LABEL_9:
  [(NTKRenegadeTimeView *)self _updateLabelBackgroundCutouts];
LABEL_10:
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_8E68;
  v17[3] = &unk_10658;
  v17[4] = self;
  +[CATransaction addCommitHandler:v17 forPhase:2];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
}

- (void)setTimeOffset:(double)a3
{
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  if (self->_frozen != a3)
  {
    self->_frozen = a3;
    [(NTKRenegadeTimeView *)self _applyFrozen];
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    [(NTKRenegadeTimeView *)self _applyFrozen];
  }
}

- (void)_applyFrozen
{
  [(NTKRenegadeTimeView *)self _quiltOverallBoundingFrameWithComplicationsEnabled:self->_complicationsEnabled];
  +[NTKRenegadeBackgroundConfiguration snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:](NTKRenegadeBackgroundConfiguration, "snapshotConfigurationWithBoundingFrame:complicationEdgeInsets:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(NTKRenegadeTimeView *)self setConfiguration:v3];
}

- (CGRect)_quiltOverallBoundingFrameWithComplicationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(NTKRenegadeTimeView *)self bounds];
  if (v3) {
    p_complicationsEdgeInsets = &self->_complicationsEdgeInsets;
  }
  else {
    p_complicationsEdgeInsets = (UIEdgeInsets *)&UIEdgeInsetsZero;
  }
  double bottom = p_complicationsEdgeInsets->bottom;
  double top = p_complicationsEdgeInsets->top;
  double left = p_complicationsEdgeInsets->left;

  double v13 = NTKRenegadeHorizontallyCenteredFrameWithEdgeInsets(v5, v6, v7, v8, top, left, bottom);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (UIEdgeInsets)complicationsEdgeInsets
{
  double top = self->_complicationsEdgeInsets.top;
  double left = self->_complicationsEdgeInsets.left;
  double bottom = self->_complicationsEdgeInsets.bottom;
  double right = self->_complicationsEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)screenWakeDuration
{
  return self->_screenWakeDuration;
}

- (void)setScreenWakeDuration:(double)a3
{
  self->_screenWakeDuration = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (BOOL)complicationsEnabled
{
  return self->_complicationsEnabled;
}

- (NTKRenegadeColorPalette)palette
{
  return self->_palette;
}

- (NTKRenegadeBackgroundConfiguration)configuration
{
  return self->_configuration;
}

- (NTKRenegadeBackgroundConfiguration)targetConfiguration
{
  return self->_targetConfiguration;
}

- (void)setTargetConfiguration:(id)a3
{
}

- (double)configurationTransitionFraction
{
  return self->_configurationTransitionFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_bottomContentCutoutLayer, 0);
  objc_storeStrong((id *)&self->_topContentCutoutLayer, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_minuteBackgroundLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
  objc_storeStrong((id *)&self->_hourBackgroundLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_palette, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end