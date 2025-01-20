@interface HKGraphViewRendererSeriesRow
- (CGRect)yAxisRect;
- (HKGraphSeries)mainSeriesForRow;
- (HKGraphSeries)selectedSeriesForRow;
- (HKGraphSeriesAxisAnnotation)axisAnnotationHandler;
- (HKGraphViewRendererSeriesRow)initWithRowSeries:(id)a3 mainSeriesForRow:(id)a4 selectedSeriesForRow:(id)a5 selectedRangeBoundariesXValue:(id)a6 selectedTouchPointCount:(int64_t)a7 yAxisRect:(CGRect)a8 axisAnnotationHandler:(id)a9;
- (NSArray)overlaidSeries;
- (NSArray)selectedRangeBoundariesXValue;
- (int64_t)selectedTouchPointCount;
@end

@implementation HKGraphViewRendererSeriesRow

- (HKGraphViewRendererSeriesRow)initWithRowSeries:(id)a3 mainSeriesForRow:(id)a4 selectedSeriesForRow:(id)a5 selectedRangeBoundariesXValue:(id)a6 selectedTouchPointCount:(int64_t)a7 yAxisRect:(CGRect)a8 axisAnnotationHandler:(id)a9
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  id v27 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a9;
  v28.receiver = self;
  v28.super_class = (Class)HKGraphViewRendererSeriesRow;
  v23 = [(HKGraphViewRendererSeriesRow *)&v28 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_overlaidSeries, a3);
    objc_storeStrong((id *)&v24->_mainSeriesForRow, a4);
    objc_storeStrong((id *)&v24->_selectedSeriesForRow, a5);
    objc_storeStrong((id *)&v24->_selectedRangeBoundariesXValue, a6);
    v24->_selectedTouchPointCount = a7;
    v24->_yAxisRect.origin.CGFloat x = x;
    v24->_yAxisRect.origin.CGFloat y = y;
    v24->_yAxisRect.size.CGFloat width = width;
    v24->_yAxisRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v24->_axisAnnotationHandler, a9);
  }

  return v24;
}

- (NSArray)overlaidSeries
{
  return self->_overlaidSeries;
}

- (HKGraphSeries)mainSeriesForRow
{
  return self->_mainSeriesForRow;
}

- (HKGraphSeries)selectedSeriesForRow
{
  return self->_selectedSeriesForRow;
}

- (NSArray)selectedRangeBoundariesXValue
{
  return self->_selectedRangeBoundariesXValue;
}

- (int64_t)selectedTouchPointCount
{
  return self->_selectedTouchPointCount;
}

- (CGRect)yAxisRect
{
  double x = self->_yAxisRect.origin.x;
  double y = self->_yAxisRect.origin.y;
  double width = self->_yAxisRect.size.width;
  double height = self->_yAxisRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (HKGraphSeriesAxisAnnotation)axisAnnotationHandler
{
  return self->_axisAnnotationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisAnnotationHandler, 0);
  objc_storeStrong((id *)&self->_selectedRangeBoundariesXValue, 0);
  objc_storeStrong((id *)&self->_selectedSeriesForRow, 0);
  objc_storeStrong((id *)&self->_mainSeriesForRow, 0);
  objc_storeStrong((id *)&self->_overlaidSeries, 0);
}

@end