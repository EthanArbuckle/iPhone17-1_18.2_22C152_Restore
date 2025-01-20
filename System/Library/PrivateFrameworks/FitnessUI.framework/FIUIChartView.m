@interface FIUIChartView
- (BOOL)labelsInsetChartBackground;
- (BOOL)xAxisLabelsShouldBaselineAlign;
- (CGRect)_chartRect;
- (CGRect)_insetChartRect;
- (FIUIChartAxisDescriptor)yAxisDescriptor;
- (FIUIChartBackgroundView)backgroundView;
- (FIUIChartDataSource)dataSource;
- (FIUIChartTimeAxisDescriptor)xAxisDescriptor;
- (FIUIChartView)init;
- (FIUIChartView)initWithDateInterval:(id)a3;
- (NSDateInterval)dateInterval;
- (NSNumber)highlightedYValue;
- (NSNumber)maxYValue;
- (NSNumber)minYValue;
- (UIEdgeInsets)contentBufferEdgeInsets;
- (UIEdgeInsets)seriesEdgeInsets;
- (double)_absolutePositionForXPlaneValue:(id)a3;
- (double)_xAxisLabelPaddingForBackground:(BOOL)a3;
- (double)_yAxisLabelPadding;
- (double)animationDuration;
- (double)xAxisToLabelPadding;
- (double)yAxisEdgeInset;
- (float)_relativePositionForXPlaneValue:(id)a3;
- (id)_dataPointAtIndex:(unint64_t)a3 forSeriesAtIndex:(unint64_t)a4;
- (id)_dataPointsForSeriesAtIndex:(unint64_t)a3;
- (id)_labelsForSeriesAtIndex:(unint64_t)a3;
- (id)_seriesAtIndex:(unint64_t)a3;
- (id)dataGroup:(id)a3 dataPointsForSetAtIndex:(unint64_t)a4;
- (id)dataGroup:(id)a3 labelsForSetAtIndex:(unint64_t)a4;
- (id)dataGroup:(id)a3 pointForSetAtIndex:(unint64_t)a4 pointIndex:(unint64_t)a5;
- (id)maxXValueForChartSeries:(id)a3;
- (id)maxYValueForChartSeries:(id)a3;
- (id)minXValueForChartSeries:(id)a3;
- (id)minYValueForChartSeries:(id)a3;
- (unint64_t)_numberOfDataPointsForSeriesAtIndex:(unint64_t)a3;
- (unint64_t)_numberOfSeries;
- (unint64_t)dataGroup:(id)a3 numberOfPointsInSetAtIndex:(unint64_t)a4;
- (void)_adjustMinMaxValues;
- (void)_layoutAxisLabels;
- (void)_layoutChartSeries;
- (void)_layoutContainerView;
- (void)_layoutXAxisLabels;
- (void)_layoutYAxisLabels;
- (void)_orderSubviews;
- (void)_reloadDataSeries;
- (void)_updateBackgroundView;
- (void)_updateDataSeries;
- (void)_updateHighlightedValue;
- (void)layoutSubviews;
- (void)reloadData;
- (void)selectAxisPoint:(int64_t)a3 selected:(BOOL)a4;
- (void)setAnimationDuration:(double)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContentBufferEdgeInsets:(UIEdgeInsets)a3;
- (void)setDataSource:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setHighlightedYValue:(id)a3;
- (void)setLabelsInsetChartBackground:(BOOL)a3;
- (void)setMaxYValue:(id)a3;
- (void)setMinYValue:(id)a3;
- (void)setSeriesEdgeInsets:(UIEdgeInsets)a3;
- (void)setXAxisDescriptor:(id)a3;
- (void)setXAxisLabelsShouldBaselineAlign:(BOOL)a3;
- (void)setXAxisToLabelPadding:(double)a3;
- (void)setYAxisDescriptor:(id)a3;
- (void)setYAxisEdgeInset:(double)a3;
@end

@implementation FIUIChartView

- (FIUIChartView)init
{
  return [(FIUIChartView *)self initWithDateInterval:0];
}

- (FIUIChartView)initWithDateInterval:(id)a3
{
  id v5 = a3;
  v6 = -[FIUIChartView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v6)
  {
    v7 = objc_alloc_init(FIUIChartDataGroup);
    dataGroup = v6->_dataGroup;
    v6->_dataGroup = v7;

    xAxisLabels = v6->_xAxisLabels;
    v6->_xAxisLabels = (NSArray *)MEMORY[0x263EFFA68];

    xAxisSubLabels = v6->_xAxisSubLabels;
    v6->_xAxisSubLabels = 0;

    [(FIUIChartDataGroup *)v6->_dataGroup setDataSource:v6];
    objc_storeStrong((id *)&v6->_dateInterval, a3);
    v6->_yAxisEdgeInset = 0.0;
    v6->_labelsInsetChartBackground = 1;
    v11 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    containerView = v6->_containerView;
    v6->_containerView = v11;

    [(UIView *)v6->_containerView setOpaque:0];
    [(FIUIChartView *)v6 addSubview:v6->_containerView];
  }

  return v6;
}

- (void)reloadData
{
  [(FIUIChartDataGroup *)self->_dataGroup reloadData];
  [(FIUIChartView *)self _adjustMinMaxValues];
  [(FIUIChartView *)self _updateHighlightedValue];
  [(FIUIChartView *)self _reloadDataSeries];
  [(FIUIChartView *)self _updateDataSeries];
  [(FIUIChartView *)self setNeedsLayout];
}

- (void)selectAxisPoint:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSArray *)self->_xAxisLabels count] > a3)
  {
    v7 = [(FIUIChartTimeAxisDescriptor *)self->_xAxisDescriptor axisLabels];
    id v10 = [v7 objectAtIndexedSubscript:a3];

    [(FIUIChartTimeAxisDescriptor *)self->_xAxisDescriptor selectLabel:v4 atIndex:a3];
    v8 = [(NSArray *)self->_xAxisLabels objectAtIndexedSubscript:a3];
    v9 = [v10 labelColor];
    [v8 setTextColor:v9];
  }
}

- (void)setDateInterval:(id)a3
{
  id v9 = a3;
  if (!-[NSDateInterval isEqualToDateInterval:](self->_dateInterval, "isEqualToDateInterval:"))
  {
    objc_storeStrong((id *)&self->_dateInterval, a3);
    xAxisDescriptor = self->_xAxisDescriptor;
    v6 = [v9 startDate];
    [(FIUIChartTimeAxisDescriptor *)xAxisDescriptor setMinValue:v6];

    v7 = self->_xAxisDescriptor;
    v8 = [v9 endDate];
    [(FIUIChartTimeAxisDescriptor *)v7 setMaxValue:v8];

    [(FIUIChartView *)self setNeedsLayout];
  }
}

- (void)setXAxisDescriptor:(id)a3
{
  p_xAxisDescriptor = &self->_xAxisDescriptor;
  objc_storeStrong((id *)&self->_xAxisDescriptor, a3);
  id v6 = a3;
  v7 = *p_xAxisDescriptor;
  v8 = [(NSDateInterval *)self->_dateInterval startDate];
  [(FIUIChartTimeAxisDescriptor *)v7 setMinValue:v8];

  id v9 = *p_xAxisDescriptor;
  id v10 = [(NSDateInterval *)self->_dateInterval endDate];
  [(FIUIChartTimeAxisDescriptor *)v9 setMaxValue:v10];

  [(FIUIChartView *)self setNeedsLayout];
}

- (void)setYAxisDescriptor:(id)a3
{
  p_yAxisDescriptor = &self->_yAxisDescriptor;
  objc_storeStrong((id *)&self->_yAxisDescriptor, a3);
  id v6 = a3;
  [(FIUIChartAxisDescriptor *)*p_yAxisDescriptor setMinValue:self->_minYValue];
  [(FIUIChartAxisDescriptor *)*p_yAxisDescriptor setMaxValue:self->_maxYValue];

  [(FIUIChartView *)self setNeedsLayout];
}

- (void)setBackgroundView:(id)a3
{
  id v5 = (FIUIChartBackgroundView *)a3;
  backgroundView = self->_backgroundView;
  v7 = v5;
  if (backgroundView != v5)
  {
    [(FIUIChartBackgroundView *)backgroundView removeFromSuperview];
    [(FIUIChartView *)self addSubview:v7];
    objc_storeStrong((id *)&self->_backgroundView, a3);
  }
}

- (void)_updateBackgroundView
{
  [(FIUIChartView *)self bounds];
  [(FIUIChartView *)self _yAxisLabelPadding];
  [(FIUIChartView *)self _xAxisLabelPaddingForBackground:1];
  [(FIUIChartView *)self _yAxisLabelPadding];
  UIRectInset();
  double v4 = v3;
  double v6 = v5;
  -[FIUIChartBackgroundView sizeThatFits:](self->_backgroundView, "sizeThatFits:", v7, v8);
  -[FIUIChartBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v9, v10);
  backgroundView = self->_backgroundView;
  [(FIUIChartBackgroundView *)backgroundView setNeedsDisplay];
}

- (void)_reloadDataSeries
{
  unint64_t v3 = [(FIUIChartView *)self _numberOfSeries];
  id v8 = [MEMORY[0x263EFF980] array];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      double v5 = [(FIUIChartView *)self _seriesAtIndex:i];
      if (v5) {
        [v8 addObject:v5];
      }
    }
  }
  double v6 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
  chartSeries = self->_chartSeries;
  self->_chartSeries = v6;
}

- (void)_updateDataSeries
{
  if ([(NSArray *)self->_chartSeries count])
  {
    unint64_t v3 = 0;
    do
    {
      double v4 = [(FIUIChartDataGroup *)self->_dataGroup dataSetAtIndex:v3];
      double v5 = [(NSArray *)self->_chartSeries objectAtIndexedSubscript:v3];
      [v5 setDataSet:v4];
      [v5 setDataSource:self];

      ++v3;
    }
    while (v3 < [(NSArray *)self->_chartSeries count]);
  }
}

- (void)_adjustMinMaxValues
{
  unint64_t v3 = [(FIUIChartDataGroup *)self->_dataGroup minYValue];
  if (v3)
  {
  }
  else
  {
    double v4 = [(FIUIChartDataGroup *)self->_dataGroup maxYValue];

    if (!v4)
    {
      minYValue = self->_minYValue;
      self->_minYValue = 0;

      maxYValue = self->_maxYValue;
      self->_maxYValue = 0;
      goto LABEL_24;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
    v12 = [(FIUIChartDataGroup *)self->_dataGroup minYValue];
    [v12 doubleValue];
    double v9 = v13;

    v14 = [(FIUIChartDataGroup *)self->_dataGroup maxYValue];
    [v14 doubleValue];
    double v11 = v15;

    if (vabdd_f64(v11, v9) >= 2.22044605e-16)
    {
LABEL_20:
      id v27 = objc_loadWeakRetained((id *)&self->_dataSource);
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        id v29 = objc_loadWeakRetained((id *)&self->_dataSource);
        v30 = [v29 minimumYRangeForChart:self];
        [v30 doubleValue];
        double v32 = v31;

        double v33 = v32 - (v11 - v9);
        if (v33 > 2.22044605e-16)
        {
          double v34 = v33 * 0.5;
          double v9 = v9 - floor(v34);
          double v11 = v11 + ceil(v34);
        }
      }
      goto LABEL_23;
    }
    id v16 = objc_loadWeakRetained((id *)&self->_dataSource);
    double v17 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      id v18 = objc_loadWeakRetained((id *)&self->_dataSource);
      char v19 = objc_opt_respondsToSelector();

      double v20 = 0.0;
      if ((v19 & 1) == 0)
      {
LABEL_13:
        if (v17 > 2.22044605e-16 || v20 > 2.22044605e-16)
        {
          if (v9 >= v17) {
            double v9 = v17;
          }
          [(NSNumber *)self->_maxYValue floatValue];
          if (v20 >= v26) {
            double v11 = v20;
          }
        }
        else
        {
          double v11 = v11 + 1.0;
          double v9 = v9 + -1.0;
        }
        goto LABEL_20;
      }
      id v21 = objc_loadWeakRetained((id *)&self->_dataSource);
      [v21 defaultOverrideMinYValueInChart:self];
      double v17 = v22;

      id v16 = objc_loadWeakRetained((id *)&self->_dataSource);
      [v16 defaultOverrideMaxYValueInChart:self];
      double v20 = v23;
    }
    else
    {
      double v20 = 0.0;
    }

    goto LABEL_13;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_dataSource);
  [v7 overrideMinMaxYValueInChart:self];
  double v9 = v8;
  double v11 = v10;

LABEL_23:
  v35 = [NSNumber numberWithDouble:v9];
  v36 = self->_minYValue;
  self->_minYValue = v35;

  v37 = [NSNumber numberWithDouble:v11];
  maxYValue = self->_maxYValue;
  self->_maxYValue = v37;
LABEL_24:

  [(FIUIChartAxisDescriptor *)self->_yAxisDescriptor setMinValue:self->_minYValue];
  yAxisDescriptor = self->_yAxisDescriptor;
  v39 = self->_maxYValue;
  [(FIUIChartAxisDescriptor *)yAxisDescriptor setMaxValue:v39];
}

- (void)_updateHighlightedValue
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    yAxisDescriptor = self->_yAxisDescriptor;
    id v8 = objc_loadWeakRetained((id *)p_dataSource);
    id v7 = [v8 highlightedYValueInChart:self];
    [(FIUIChartAxisDescriptor *)yAxisDescriptor setHighlightedValue:v7];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartView;
  [(FIUIChartView *)&v3 layoutSubviews];
  [(FIUIChartView *)self _layoutContainerView];
  [(FIUIChartView *)self _layoutChartSeries];
  [(FIUIChartView *)self _layoutAxisLabels];
  [(FIUIChartView *)self _orderSubviews];
  [(FIUIChartView *)self _updateBackgroundView];
}

- (void)_layoutContainerView
{
  [(FIUIChartView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self->_containerView frame];
  if (v4 != v8 || v6 != v7)
  {
    containerView = self->_containerView;
    [(FIUIChartView *)self bounds];
    -[UIView setFrame:](containerView, "setFrame:");
  }
  double v11 = self->_containerView;
  [(FIUIChartView *)self bringSubviewToFront:v11];
}

- (void)_layoutAxisLabels
{
  [(FIUIChartView *)self _layoutXAxisLabels];
  [(FIUIChartView *)self _layoutYAxisLabels];
}

- (void)_layoutYAxisLabels
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  double v3 = (void *)[(NSArray *)self->_yAxisLabels mutableCopy];
  double v4 = [MEMORY[0x263EFF980] array];
  double v5 = [(FIUIChartAxisDescriptor *)self->_yAxisDescriptor axisLabels];
  [(NSNumber *)self->_minYValue doubleValue];
  double v42 = v6;
  [(NSNumber *)self->_maxYValue doubleValue];
  double v41 = v7;
  if ([v5 count])
  {
    unint64_t v8 = 0;
    do
    {
      double v9 = [v5 objectAtIndexedSubscript:v8];
      objc_msgSend(v3, "hk_dequeue");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        id v10 = objc_alloc_init(MEMORY[0x263F828E0]);
        [v10 setTextAlignment:2];
        [(UIView *)self->_containerView addSubview:v10];
      }
      double v11 = [(FIUIChartAxisDescriptor *)self->_yAxisDescriptor labelFont];
      [v10 setFont:v11];

      v12 = [v9 text];
      [v10 setText:v12];

      double v13 = [v9 labelColor];
      [v10 setTextColor:v13];

      [v9 shadowOffset];
      objc_msgSend(v10, "setShadowOffset:");
      v14 = [v9 shadowColor];
      [v10 setShadowColor:v14];

      [v9 shadowBlur];
      objc_msgSend(v10, "setShadowBlur:");
      [v10 setAdjustsFontSizeToFitWidth:1];
      [v10 setNumberOfLines:0];
      [v10 sizeToFit];
      [(FIUIChartView *)self _insetChartRect];
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      [v10 intrinsicContentSize];
      double v24 = v23;
      double v26 = v25;
      [(FIUIChartAxisDescriptor *)self->_yAxisDescriptor axisDescriptorPadding];
      id v27 = [v9 location];
      [v27 doubleValue];
      double v29 = v28;

      double v30 = FIUIChartRelativePositionForYPlaneValue(v29, v42, v41);
      FIUIChartAbsolutePositionForYPlaneValue(self, v30, v16, v18, v20, v22);
      if (v8 && v8 != [v5 count] - 1 && vabdd_f64(v29, v42) < vabdd_f64(v29, v41)) {
        [v10 _firstBaselineOffsetFromTop];
      }
      UIRoundToViewScale();
      double v32 = v31;
      UIRoundToViewScale();
      objc_msgSend(v10, "setFrame:", v32, v33, v24, v26);
      [v4 addObject:v10];

      ++v8;
    }
    while (v8 < [v5 count]);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v34 = v3;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v44 != v37) {
          objc_enumerationMutation(v34);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v36);
  }

  v39 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];
  yAxisLabels = self->_yAxisLabels;
  self->_yAxisLabels = v39;
}

- (void)_layoutXAxisLabels
{
  v2 = self;
  uint64_t v117 = *MEMORY[0x263EF8340];
  v88 = (void *)[(NSArray *)self->_xAxisLabels mutableCopy];
  double v3 = [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor axisLabels];
  [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor axisSubLabels];
  v83 = v82 = v3;
  double v4 = [v3 reverseObjectEnumerator];
  v89 = [MEMORY[0x263EFF980] array];
  double v5 = [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor labelFont];
  [v5 lineHeight];

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  obuint64_t j = v4;
  uint64_t v90 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
  if (v90)
  {
    uint64_t v87 = *(void *)v109;
    uint64_t v84 = *MEMORY[0x263F814F0];
    v85 = v2;
    do
    {
      for (uint64_t i = 0; i != v90; ++i)
      {
        if (*(void *)v109 != v87) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        id v8 = [v88 lastObject];
        [v88 removeLastObject];
        if (!v8)
        {
          id v8 = objc_alloc_init(MEMORY[0x263F828E0]);
          [v8 setTextAlignment:1];
          [(UIView *)v2->_containerView addSubview:v8];
        }
        double v9 = [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor labelFont];
        [v8 setFont:v9];

        id v10 = [v7 text];
        [v8 setText:v10];

        double v11 = [v7 labelColor];
        [v8 setTextColor:v11];

        [v8 setAdjustsFontSizeToFitWidth:1];
        [v8 setNumberOfLines:0];
        [v8 sizeToFit];
        v12 = [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor labelAMPMFont];
        if (v12)
        {
          id v13 = objc_alloc_init(MEMORY[0x263F08790]);
          v14 = [v7 text];
          double v15 = [v13 AMSymbol];
          uint64_t v16 = [v14 rangeOfString:v15];
          uint64_t v18 = v17;

          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            double v19 = [v7 text];
            CGFloat v20 = [v13 PMSymbol];
            uint64_t v16 = [v19 rangeOfString:v20];
            uint64_t v18 = v21;

            v2 = v85;
            if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_14;
            }
          }
          else
          {
            v2 = v85;
          }
          CGFloat v22 = [v8 attributedText];
          double v23 = (void *)[v22 mutableCopy];

          objc_msgSend(v23, "addAttribute:value:range:", v84, v12, v16, v18);
          [v8 setAttributedText:v23];

LABEL_14:
        }
        [v8 intrinsicContentSize];
        double v24 = [v7 location];
        [(FIUIChartView *)v2 _absolutePositionForXPlaneValue:v24];

        [v7 useReversePlacement];
        [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor axisDescriptorPadding];
        if (v2->_xAxisLabelsShouldBaselineAlign)
        {
          [(UIView *)v2->_containerView bounds];
          CGRectGetMaxY(v118);
          [v8 _firstBaselineOffsetFromTop];
        }
        else
        {
          [v83 count];
          [(UIView *)v2->_containerView bounds];
          CGRectGetMaxY(v119);
          [(FIUIChartView *)v2 _xAxisLabelPaddingForBackground:0];
          UIRoundToViewScale();
          UIRoundToViewScale();
        }
        UIRoundToViewScale();
        objc_msgSend(v8, "setFrame:");
        if ([(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor hideClippedLabels])
        {
          [v8 frame];
          CGFloat v26 = v25;
          [v8 frame];
          CGFloat v28 = v27;
          [v8 frame];
          CGFloat v30 = v29;
          [(FIUIChartView *)v2 bounds];
          v123.size.height = 2.22507386e-308;
          v123.origin.x = v26;
          v123.origin.y = v28;
          v123.size.width = v30;
          objc_msgSend(v8, "setHidden:", !CGRectContainsRect(v120, v123));
        }
        [v89 insertObject:v8 atIndex:0];
      }
      uint64_t v90 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
    }
    while (v90);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v31 = v88;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v104 objects:v115 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v105;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v105 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v104 + 1) + 8 * j) removeFromSuperview];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v104 objects:v115 count:16];
    }
    while (v33);
  }

  uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithArray:v89];
  xAxisLabels = v2->_xAxisLabels;
  v2->_xAxisLabels = (NSArray *)v36;

  if ([v83 count])
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v91 = [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor subLabelAlignment];
    }
    else {
      uint64_t v91 = 0;
    }
    long long v45 = (void *)[(NSArray *)v2->_xAxisSubLabels mutableCopy];

    long long v46 = [v83 reverseObjectEnumerator];

    long long v44 = [MEMORY[0x263EFF980] array];

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    obuint64_t j = v46;
    uint64_t v47 = [obj countByEnumeratingWithState:&v100 objects:v114 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v101;
      do
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v101 != v49) {
            objc_enumerationMutation(obj);
          }
          v51 = *(void **)(*((void *)&v100 + 1) + 8 * k);
          id v52 = [v45 lastObject];
          [v45 removeLastObject];
          if (!v52)
          {
            id v52 = objc_alloc_init(MEMORY[0x263F828E0]);
            [v52 setTextAlignment:1];
            [(UIView *)v2->_containerView addSubview:v52];
          }
          v53 = [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor subLabelFont];
          [v52 setFont:v53];

          v54 = [v51 text];
          [v52 setText:v54];

          v55 = [v51 labelColor];
          [v52 setTextColor:v55];

          v56 = [v51 location];
          [(FIUIChartView *)v2 _absolutePositionForXPlaneValue:v56];

          [(UIView *)v2->_containerView bounds];
          CGRectGetMaxY(v121);
          [(FIUIChartView *)v2 _xAxisLabelPaddingForBackground:0];
          UIRoundToViewScale();
          [v52 intrinsicContentSize];
          double v58 = v57;
          double v60 = v59;
          [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor subAxisDescriptorPadding];
          if (v61 > 0.00000011920929)
          {
            if (!v91) {
              [v52 intrinsicContentSize];
            }
            [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor subAxisDescriptorPadding];
          }
          UIRoundToViewScale();
          double v63 = v62;
          [(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor subAxisVerticalPadding];
          UIRoundToViewScale();
          objc_msgSend(v52, "setFrame:", v63, v64, v58, v60);
          if ([(FIUIChartTimeAxisDescriptor *)v2->_xAxisDescriptor hideClippedLabels])
          {
            [(FIUIChartView *)v2 bounds];
            CGFloat v66 = v65;
            CGFloat v68 = v67;
            CGFloat v70 = v69;
            CGFloat v72 = v71;
            [v52 frame];
            v124.origin.x = v73;
            v124.origin.y = v74;
            v124.size.width = v75;
            v124.size.height = v76;
            v122.origin.x = v66;
            v122.origin.y = v68;
            v122.size.width = v70;
            v122.size.height = v72;
            objc_msgSend(v52, "setHidden:", !CGRectContainsRect(v122, v124));
          }
          [v44 insertObject:v52 atIndex:0];
        }
        uint64_t v48 = [obj countByEnumeratingWithState:&v100 objects:v114 count:16];
      }
      while (v48);
    }

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v31 = v45;
    uint64_t v77 = [v31 countByEnumeratingWithState:&v96 objects:v113 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v97;
      do
      {
        for (uint64_t m = 0; m != v78; ++m)
        {
          if (*(void *)v97 != v79) {
            objc_enumerationMutation(v31);
          }
          [*(id *)(*((void *)&v96 + 1) + 8 * m) removeFromSuperview];
        }
        uint64_t v78 = [v31 countByEnumeratingWithState:&v96 objects:v113 count:16];
      }
      while (v78);
    }

    uint64_t v81 = [MEMORY[0x263EFF8C0] arrayWithArray:v44];
    xAxisSubLabels = v2->_xAxisSubLabels;
    v2->_xAxisSubLabels = (NSArray *)v81;
  }
  else
  {
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    v38 = v2->_xAxisSubLabels;
    uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v92 objects:v112 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v93;
      do
      {
        for (uint64_t n = 0; n != v40; ++n)
        {
          if (*(void *)v93 != v41) {
            objc_enumerationMutation(v38);
          }
          [*(id *)(*((void *)&v92 + 1) + 8 * n) removeFromSuperview];
        }
        uint64_t v40 = [(NSArray *)v38 countByEnumeratingWithState:&v92 objects:v112 count:16];
      }
      while (v40);
    }

    xAxisSubLabels = v2->_xAxisSubLabels;
    v2->_xAxisSubLabels = 0;
    long long v44 = v89;
  }
}

- (void)_layoutChartSeries
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  [(FIUIChartView *)self _chartRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double top = self->_contentBufferEdgeInsets.top;
  double left = self->_contentBufferEdgeInsets.left;
  bottouint64_t m = self->_contentBufferEdgeInsets.bottom;
  double right = self->_contentBufferEdgeInsets.right;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = self->_chartSeries;
  uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    double v17 = v10 - (top + bottom);
    double v18 = v8 - (left + right);
    double v19 = v6 + top;
    double v20 = v4 + left;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        double v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v23, "setFrame:", v20, v19, v18, v17);
        double v24 = [v23 superview];
        containerView = self->_containerView;

        if (v24 != containerView)
        {
          UIEdgeInsetsSubtract();
          objc_msgSend(v23, "setEdgeInsets:");
          [(UIView *)self->_containerView addSubview:v23];
        }
        [v23 setNeedsLayout];
      }
      uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }
}

- (void)_orderSubviews
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v3 = self->_chartSeries;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "displayAboveAxisLabels", (void)v12);
        containerView = self->_containerView;
        if (v10) {
          [(UIView *)containerView bringSubviewToFront:v9];
        }
        else {
          [(UIView *)containerView insertSubview:v9 atIndex:v6++];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (double)_xAxisLabelPaddingForBackground:(BOOL)a3
{
  if (self->_labelsInsetChartBackground || !a3)
  {
    uint64_t v4 = [(FIUIChartTimeAxisDescriptor *)self->_xAxisDescriptor labelFont];
    [v4 lineHeight];

    [(FIUIChartTimeAxisDescriptor *)self->_xAxisDescriptor subAxisSpacing];
  }
  UIRoundToViewScale();
  return result;
}

- (double)_yAxisLabelPadding
{
  return self->_yAxisEdgeInset;
}

- (CGRect)_chartRect
{
  [(UIView *)self->_containerView frame];
  [(FIUIChartView *)self _yAxisLabelPadding];
  [(FIUIChartView *)self _xAxisLabelPaddingForBackground:0];
  [(FIUIChartView *)self _yAxisLabelPadding];
  UIRectInset();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_insetChartRect
{
  [(FIUIChartView *)self _chartRect];
  double top = self->_seriesEdgeInsets.top;
  double left = self->_seriesEdgeInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_seriesEdgeInsets.right);
  double v12 = v11 - (top + self->_seriesEdgeInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (double)_absolutePositionForXPlaneValue:(id)a3
{
  [(FIUIChartView *)self _relativePositionForXPlaneValue:a3];
  double v5 = v4;
  [(FIUIChartView *)self _insetChartRect];
  return FIUIChartAbsolutePositionForXPlaneValue(self, v5, v6, v7, v8, v9);
}

- (float)_relativePositionForXPlaneValue:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  CGFloat v6 = [(NSDateInterval *)dateInterval startDate];
  double v7 = ((double (*)(void))FIUIChartXAxisFloatValue)();

  CGFloat v8 = [(NSDateInterval *)self->_dateInterval endDate];
  double v9 = ((double (*)(void))FIUIChartXAxisFloatValue)();

  double v10 = FIUIChartXAxisFloatValue(v5);
  return FIUIChartRelativePositionForXPlaneValue(v10, v7, v9);
}

- (unint64_t)_numberOfSeries
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unint64_t v4 = [WeakRetained numberOfSeriesInChart:self];

  return v4;
}

- (id)_seriesAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  CGFloat v6 = [WeakRetained chart:self seriesAtIndex:a3];

  return v6;
}

- (unint64_t)_numberOfDataPointsForSeriesAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unint64_t v6 = [WeakRetained chart:self numberOfDataPointsForSeriesAtIndex:a3];

  return v6;
}

- (id)_dataPointAtIndex:(unint64_t)a3 forSeriesAtIndex:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  CGFloat v8 = [WeakRetained chart:self dataPointAtIndex:a3 forSeriesAtIndex:a4];

  return v8;
}

- (id)_dataPointsForSeriesAtIndex:(unint64_t)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_dataSource);
    double v9 = [v8 chart:self dataPointsForSeriesAtIndex:a3];
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (id)_labelsForSeriesAtIndex:(unint64_t)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_dataSource);
    double v9 = [v8 chart:self labelsForSeriesAtIndex:a3];
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (unint64_t)dataGroup:(id)a3 numberOfPointsInSetAtIndex:(unint64_t)a4
{
  return [(FIUIChartView *)self _numberOfDataPointsForSeriesAtIndex:a4];
}

- (id)dataGroup:(id)a3 pointForSetAtIndex:(unint64_t)a4 pointIndex:(unint64_t)a5
{
  return [(FIUIChartView *)self _dataPointAtIndex:a5 forSeriesAtIndex:a4];
}

- (id)dataGroup:(id)a3 dataPointsForSetAtIndex:(unint64_t)a4
{
  return [(FIUIChartView *)self _dataPointsForSeriesAtIndex:a4];
}

- (id)dataGroup:(id)a3 labelsForSetAtIndex:(unint64_t)a4
{
  return [(FIUIChartView *)self _labelsForSeriesAtIndex:a4];
}

- (id)minXValueForChartSeries:(id)a3
{
  return [(NSDateInterval *)self->_dateInterval startDate];
}

- (id)maxXValueForChartSeries:(id)a3
{
  return [(NSDateInterval *)self->_dateInterval endDate];
}

- (id)minYValueForChartSeries:(id)a3
{
  return self->_minYValue;
}

- (id)maxYValueForChartSeries:(id)a3
{
  return self->_maxYValue;
}

- (FIUIChartDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (FIUIChartDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (FIUIChartTimeAxisDescriptor)xAxisDescriptor
{
  return self->_xAxisDescriptor;
}

- (FIUIChartAxisDescriptor)yAxisDescriptor
{
  return self->_yAxisDescriptor;
}

- (FIUIChartBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (double)yAxisEdgeInset
{
  return self->_yAxisEdgeInset;
}

- (void)setYAxisEdgeInset:(double)a3
{
  self->_yAxisEdgeInset = a3;
}

- (double)xAxisToLabelPadding
{
  return self->_xAxisToLabelPadding;
}

- (void)setXAxisToLabelPadding:(double)a3
{
  self->_xAxisToLabelPadding = a3;
}

- (BOOL)labelsInsetChartBackground
{
  return self->_labelsInsetChartBackground;
}

- (void)setLabelsInsetChartBackground:(BOOL)a3
{
  self->_labelsInsetChartBackground = a3;
}

- (BOOL)xAxisLabelsShouldBaselineAlign
{
  return self->_xAxisLabelsShouldBaselineAlign;
}

- (void)setXAxisLabelsShouldBaselineAlign:(BOOL)a3
{
  self->_xAxisLabelsShouldBaselineAliguint64_t n = a3;
}

- (UIEdgeInsets)seriesEdgeInsets
{
  double top = self->_seriesEdgeInsets.top;
  double left = self->_seriesEdgeInsets.left;
  bottouint64_t m = self->_seriesEdgeInsets.bottom;
  double right = self->_seriesEdgeInsets.right;
  result.double right = right;
  result.bottouint64_t m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSeriesEdgeInsets:(UIEdgeInsets)a3
{
  self->_seriesEdgeInsets = a3;
}

- (UIEdgeInsets)contentBufferEdgeInsets
{
  double top = self->_contentBufferEdgeInsets.top;
  double left = self->_contentBufferEdgeInsets.left;
  bottouint64_t m = self->_contentBufferEdgeInsets.bottom;
  double right = self->_contentBufferEdgeInsets.right;
  result.double right = right;
  result.bottouint64_t m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentBufferEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentBufferEdgeInsets = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuratiouint64_t n = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSNumber)minYValue
{
  return self->_minYValue;
}

- (void)setMinYValue:(id)a3
{
}

- (NSNumber)maxYValue
{
  return self->_maxYValue;
}

- (void)setMaxYValue:(id)a3
{
}

- (NSNumber)highlightedYValue
{
  return self->_highlightedYValue;
}

- (void)setHighlightedYValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedYValue, 0);
  objc_storeStrong((id *)&self->_maxYValue, 0);
  objc_storeStrong((id *)&self->_minYValue, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_yAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_xAxisDescriptor, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_chartSeries, 0);
  objc_storeStrong((id *)&self->_yAxisLabels, 0);
  objc_storeStrong((id *)&self->_xAxisSubLabels, 0);
  objc_storeStrong((id *)&self->_xAxisLabels, 0);
  objc_storeStrong((id *)&self->_dataGroup, 0);
}

@end