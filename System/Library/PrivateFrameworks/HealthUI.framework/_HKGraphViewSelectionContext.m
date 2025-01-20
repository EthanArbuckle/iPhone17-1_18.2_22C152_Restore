@interface _HKGraphViewSelectionContext
- (CGRect)seriesSelectionRect;
- (HKGraphSeries)closestSeriesToSelection;
- (NSArray)selectedRangeBoundariesXValue;
- (NSArray)selectionAreaMapping;
- (NSArray)touchPoints;
- (double)minimumSelectionDistance;
- (int64_t)selectionState;
- (void)setClosestSeriesToSelection:(id)a3;
- (void)setSelectedRangeBoundariesXValue:(id)a3;
- (void)setSelectionAreaMapping:(id)a3;
- (void)setSelectionState:(int64_t)a3;
- (void)setSeriesSelectionRect:(CGRect)a3;
- (void)setTouchPoints:(id)a3;
@end

@implementation _HKGraphViewSelectionContext

- (double)minimumSelectionDistance
{
  unint64_t v2 = [(_HKGraphViewSelectionContext *)self selectionState];
  double result = 40.0;
  if (v2 < 3) {
    return 1.79769313e308;
  }
  return result;
}

- (int64_t)selectionState
{
  return self->_selectionState;
}

- (void)setSelectionState:(int64_t)a3
{
  self->_selectionState = a3;
}

- (CGRect)seriesSelectionRect
{
  double x = self->_seriesSelectionRect.origin.x;
  double y = self->_seriesSelectionRect.origin.y;
  double width = self->_seriesSelectionRect.size.width;
  double height = self->_seriesSelectionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSeriesSelectionRect:(CGRect)a3
{
  self->_seriesSelectionRect = a3;
}

- (NSArray)touchPoints
{
  return self->_touchPoints;
}

- (void)setTouchPoints:(id)a3
{
}

- (NSArray)selectionAreaMapping
{
  return self->_selectionAreaMapping;
}

- (void)setSelectionAreaMapping:(id)a3
{
}

- (NSArray)selectedRangeBoundariesXValue
{
  return self->_selectedRangeBoundariesXValue;
}

- (void)setSelectedRangeBoundariesXValue:(id)a3
{
}

- (HKGraphSeries)closestSeriesToSelection
{
  return self->_closestSeriesToSelection;
}

- (void)setClosestSeriesToSelection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closestSeriesToSelection, 0);
  objc_storeStrong((id *)&self->_selectedRangeBoundariesXValue, 0);
  objc_storeStrong((id *)&self->_selectionAreaMapping, 0);
  objc_storeStrong((id *)&self->_touchPoints, 0);
}

@end