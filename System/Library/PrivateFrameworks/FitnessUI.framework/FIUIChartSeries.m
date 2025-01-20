@interface FIUIChartSeries
- (BOOL)displayAboveAxisLabels;
- (CGRect)insetBounds;
- (FIUIChartDataSet)dataSet;
- (FIUIChartSeries)init;
- (FIUIChartSeriesDataSource)dataSource;
- (NSNumber)maxYValue;
- (NSNumber)minYValue;
- (UIEdgeInsets)edgeInsets;
- (double)xValueForPointFromChartPoint:(id)a3;
- (double)yValueForPointFromChartPointValue:(id)a3;
- (float)_relativePositionForXPlaneValue:(id)a3;
- (float)_relativePositionForYPlaneValue:(id)a3;
- (id)labelsFromDataSet;
- (void)_reloadMinMaxValues;
- (void)layoutSubviews;
- (void)setDataSet:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDisplayAboveAxisLabels:(BOOL)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setMaxYValue:(id)a3;
- (void)setMinYValue:(id)a3;
@end

@implementation FIUIChartSeries

- (FIUIChartSeries)init
{
  v8.receiver = self;
  v8.super_class = (Class)FIUIChartSeries;
  v2 = [(FIUIChartSeries *)&v8 init];
  v3 = v2;
  if (v2)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&v2->_edgeInsets.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&v2->_edgeInsets.bottom = v4;
    [(FIUIChartSeries *)v2 setBackgroundColor:0];
    [(FIUIChartSeries *)v3 setOpaque:0];
    v5 = [(FIUIChartSeries *)v3 layer];
    v6 = [MEMORY[0x263F82B60] mainScreen];
    [v6 scale];
    objc_msgSend(v5, "setContentsScale:");
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartSeries;
  [(FIUIChartSeries *)&v3 layoutSubviews];
  [(FIUIChartSeries *)self _reloadMinMaxValues];
}

- (id)labelsFromDataSet
{
  return [(FIUIChartDataSet *)self->_dataSet labelsForSet];
}

- (void)_reloadMinMaxValues
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = [WeakRetained minXValueForChartSeries:self];
  minXValue = self->_minXValue;
  self->_minXValue = v5;

  id v7 = objc_loadWeakRetained((id *)p_dataSource);
  objc_super v8 = [v7 maxXValueForChartSeries:self];
  maxXValue = self->_maxXValue;
  self->_maxXValue = v8;

  id v10 = objc_loadWeakRetained((id *)p_dataSource);
  v11 = [v10 minYValueForChartSeries:self];
  minYValue = self->_minYValue;
  self->_minYValue = v11;

  id v15 = objc_loadWeakRetained((id *)p_dataSource);
  v13 = [v15 maxYValueForChartSeries:self];
  maxYValue = self->_maxYValue;
  self->_maxYValue = v13;
}

- (float)_relativePositionForXPlaneValue:(id)a3
{
  minXValue = self->_minXValue;
  id v5 = a3;
  double v6 = FIUIChartXAxisFloatValue(minXValue);
  double v7 = FIUIChartXAxisFloatValue(self->_maxXValue);
  double v8 = FIUIChartXAxisFloatValue(v5);

  return FIUIChartRelativePositionForXPlaneValue(v8, v6, v7);
}

- (float)_relativePositionForYPlaneValue:(id)a3
{
  minYValue = self->_minYValue;
  id v5 = a3;
  [(NSNumber *)minYValue doubleValue];
  double v7 = v6;
  [(NSNumber *)self->_maxYValue doubleValue];
  double v9 = v8;
  [v5 doubleValue];
  double v11 = v10;

  return FIUIChartRelativePositionForYPlaneValue(v11, v7, v9);
}

- (double)xValueForPointFromChartPoint:(id)a3
{
  long long v4 = [a3 xValue];
  double v5 = FIUIChartXAxisFloatValue(v4);

  double v6 = FIUIChartXAxisFloatValue(self->_minXValue);
  double v7 = FIUIChartXAxisFloatValue(self->_maxXValue);
  double v8 = FIUIChartRelativePositionForXPlaneValue(v5, v6, v7);
  [(FIUIChartSeries *)self insetBounds];
  return FIUIChartAbsolutePositionForXPlaneValue(self, v8, v9, v10, v11, v12);
}

- (double)yValueForPointFromChartPointValue:(id)a3
{
  [a3 doubleValue];
  double v5 = v4;
  double v6 = [(FIUIChartSeries *)self minYValue];
  [v6 doubleValue];
  double v8 = v7;

  CGFloat v9 = [(FIUIChartSeries *)self maxYValue];
  [v9 doubleValue];
  double v11 = v10;

  double v12 = FIUIChartRelativePositionForYPlaneValue(v5, v8, v11);
  [(FIUIChartSeries *)self insetBounds];
  return FIUIChartAbsolutePositionForYPlaneValue(self, v12, v13, v14, v15, v16);
}

- (CGRect)insetBounds
{
  [(FIUIChartSeries *)self bounds];
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_edgeInsets.right);
  double v12 = v11 - (top + self->_edgeInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
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

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (FIUIChartSeriesDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (FIUIChartSeriesDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (FIUIChartDataSet)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(id)a3
{
}

- (BOOL)displayAboveAxisLabels
{
  return self->_displayAboveAxisLabels;
}

- (void)setDisplayAboveAxisLabels:(BOOL)a3
{
  self->_displayAboveAxisLabels = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSet, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_maxYValue, 0);
  objc_storeStrong((id *)&self->_minYValue, 0);
  objc_storeStrong((id *)&self->_maxXValue, 0);
  objc_storeStrong((id *)&self->_minXValue, 0);
}

@end