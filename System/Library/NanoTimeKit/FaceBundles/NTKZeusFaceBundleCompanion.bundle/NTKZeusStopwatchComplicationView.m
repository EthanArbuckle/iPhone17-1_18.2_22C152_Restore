@interface NTKZeusStopwatchComplicationView
- (CGRect)contentFrame;
- (CGRect)padContentFrame:(CGRect)a3;
- (NTKZeusStopwatchComplicationView)initWithBackgroundView:(id)a3;
- (id)_createLabel;
- (void)applyPalette:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)blancEditModeApplyPalette:(id)a3;
- (void)layoutSubviews;
- (void)setStopwatchState:(int64_t)a3 elapsedTime:(double)a4 shouldPauseTextCountdown:(BOOL)a5 timeTravelDate:(id)a6;
@end

@implementation NTKZeusStopwatchComplicationView

- (NTKZeusStopwatchComplicationView)initWithBackgroundView:(id)a3
{
  v4 = (NTKZeusComplicationBackgroundView *)a3;
  if (!v4)
  {
    v5 = [NTKZeusComplicationBackgroundView alloc];
    v6 = +[NTKFaceViewRenderingContext sharedRenderingContext];
    v7 = [v6 device];
    v4 = [(NTKZeusComplicationBackgroundView *)v5 initWithDevice:v7];
  }
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusStopwatchComplicationView;
  v8 = [(NTKZeusComplicationView *)&v13 initWithBackgroundView:v4];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [(NTKZeusStopwatchComplicationView *)v8 _createLabel];
    label = v9->_label;
    v9->_label = (CLKUIColoringLabel *)v10;

    [(NTKZeusStopwatchComplicationView *)v9 addSubview:v9->_label];
    [(NTKZeusStopwatchComplicationView *)v9 setStopwatchState:0 elapsedTime:1 shouldPauseTextCountdown:0 timeTravelDate:0.0];
  }

  return v9;
}

- (void)setStopwatchState:(int64_t)a3 elapsedTime:(double)a4 shouldPauseTextCountdown:(BOOL)a5 timeTravelDate:(id)a6
{
  v9 = +[NTKDate complicationDate];
  uint64_t v10 = v9;
  if (a3 == 1)
  {
    id v14 = v9;
    uint64_t v11 = [v9 dateByAddingTimeInterval:-a4];

    uint64_t v10 = (void *)v11;
  }
  id v15 = v10;
  v12 = +[CLKRelativeDateTextProvider textProviderWithDate:v10 style:2 units:224];
  [v12 setWantsSubseconds:0];
  [v12 setTwoDigitMinuteZeroPadding:1];
  if (a3 != 1)
  {
    objc_super v13 = [v15 dateByAddingTimeInterval:a4];
    [v12 setRelativeToDate:v13];
  }
  [v12 setPaused:0];
  [v12 finalize];
  [(CLKUIColoringLabel *)self->_label setTextProvider:v12];
  self->_stopwatchState = a3;
}

- (void)layoutSubviews
{
  -[CLKUIColoringLabel sizeThatFits:](self->_label, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  [(NTKZeusStopwatchComplicationView *)self bounds];
  v3 = [(NTKZeusComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:", v5, v7, v9, v11);
  v12.receiver = self;
  v12.super_class = (Class)NTKZeusStopwatchComplicationView;
  [(NTKZeusComplicationView *)&v12 layoutSubviews];
}

- (CGRect)contentFrame
{
  -[CLKUIColoringLabel sizeThatFits:](self->_label, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v3 = [(CLKUIColoringLabel *)self->_label font];
  [v3 capHeight];

  [(NTKZeusStopwatchComplicationView *)self bounds];
  double v4 = [(NTKZeusComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)padContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  memset(v14, 0, sizeof(v14));
  double v7 = [(NTKZeusComplicationView *)self device];
  sub_9058(v7, v14);

  double v8 = -*(double *)v14;
  double v9 = -(*((double *)v14 + 1) + *((double *)&v15 + 1));
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;

  return CGRectInset(*(CGRect *)&v10, v8, v9);
}

- (void)applyPalette:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKZeusStopwatchComplicationView;
  [(NTKZeusComplicationView *)&v7 applyPalette:a3];
  label = self->_label;
  double v5 = [(NTKZeusComplicationView *)self palette];
  double v6 = [v5 bottomComplication];
  [(CLKUIColoringLabel *)label setTextColor:v6];
}

- (void)blancEditModeApplyPalette:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKZeusStopwatchComplicationView;
  [(NTKZeusComplicationView *)&v7 blancEditModeApplyPalette:a3];
  label = self->_label;
  double v5 = [(NTKZeusComplicationView *)self palette];
  double v6 = [v5 editMode];
  [(CLKUIColoringLabel *)label setTextColor:v6];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusStopwatchComplicationView;
  id v8 = a5;
  id v9 = a4;
  [(NTKZeusComplicationView *)&v13 applyTransitionFraction:v9 fromPalette:v8 toPalette:a3];
  CGFloat v10 = objc_msgSend(v9, "bottomComplication", v13.receiver, v13.super_class);

  CGFloat v11 = [v8 bottomComplication];

  CGFloat v12 = NTKInterpolateBetweenColors();

  [(CLKUIColoringLabel *)self->_label setTextColor:v12];
}

- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusStopwatchComplicationView;
  -[NTKZeusComplicationView applyTransitionFraction:fromMode:toMode:](&v13, "applyTransitionFraction:fromMode:toMode:");
  v12.receiver = self;
  v12.super_class = (Class)NTKZeusStopwatchComplicationView;
  id v8 = [(NTKZeusComplicationView *)&v12 complicationColorForBlancEditMode:a4];
  v11.receiver = self;
  v11.super_class = (Class)NTKZeusStopwatchComplicationView;
  id v9 = [(NTKZeusComplicationView *)&v11 complicationColorForBlancEditMode:a5];
  CGFloat v10 = NTKInterpolateBetweenColors();

  [(CLKUIColoringLabel *)self->_label setTextColor:v10];
}

- (id)_createLabel
{
  v3 = objc_opt_new();
  double v4 = [(NTKZeusComplicationView *)self device];
  sub_9058(v4, v13);
  double v5 = +[CLKFont systemFontOfSize:v14 weight:UIFontWeightMedium];
  double v6 = [v5 CLKFontWithMonospacedNumbers];
  [v3 setFont:v6];

  [v3 setUsesTextProviderTintColoring:0];
  objc_super v7 = [(NTKZeusComplicationView *)self palette];
  id v8 = [v7 bottomComplication];
  [v3 setTextColor:v8];

  [v3 setTextAlignment:1];
  [v3 setInTimeTravel:0];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_AD54;
  v10[3] = &unk_3CC78;
  objc_copyWeak(&v11, &location);
  [v3 setNeedsResizeHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v3;
}

- (void).cxx_destruct
{
}

@end