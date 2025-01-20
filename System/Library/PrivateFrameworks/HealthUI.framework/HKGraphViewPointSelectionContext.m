@interface HKGraphViewPointSelectionContext
- (HKGraphSeries)selectedSeries;
- (HKValueRange)selectedPathIndexRange;
- (HKValueRange)selectedPointValueRange;
- (HKValueRange)selectedRangeXValues;
- (NSArray)userInfo;
- (NSDateComponents)pointIntervalComponents;
- (double)xDistanceFromFirstTouchPoint;
- (double)xDistanceFromSecondTouchPoint;
- (id)debugDescription;
- (void)setPointIntervalComponents:(id)a3;
- (void)setSelectedPathIndexRange:(id)a3;
- (void)setSelectedPointValueRange:(id)a3;
- (void)setSelectedRangeXValues:(id)a3;
- (void)setSelectedSeries:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setXDistanceFromFirstTouchPoint:(double)a3;
- (void)setXDistanceFromSecondTouchPoint:(double)a3;
@end

@implementation HKGraphViewPointSelectionContext

- (id)debugDescription
{
  v15.receiver = self;
  v15.super_class = (Class)HKGraphViewPointSelectionContext;
  v3 = [(HKGraphViewPointSelectionContext *)&v15 debugDescription];
  v4 = [(HKGraphViewPointSelectionContext *)self selectedSeries];
  v5 = [v3 stringByAppendingFormat:@" {\n    selectedSeries:          %@\n", v4];

  v6 = [(HKGraphViewPointSelectionContext *)self selectedRangeXValues];
  v7 = [v5 stringByAppendingFormat:@"    selectedRangeXValues:    %@\n", v6];

  v8 = [(HKGraphViewPointSelectionContext *)self selectedPathIndexRange];
  v9 = [v7 stringByAppendingFormat:@"    selectedPathIndexRange:  %@\n", v8];

  v10 = [(HKGraphViewPointSelectionContext *)self selectedPointValueRange];
  v11 = [v9 stringByAppendingFormat:@"    selectedPointValueRange: %@\n", v10];

  v12 = [(HKGraphViewPointSelectionContext *)self pointIntervalComponents];
  v13 = [v11 stringByAppendingFormat:@"    pointIntervalComponents: %@\n}", v12];

  return v13;
}

- (HKGraphSeries)selectedSeries
{
  return self->_selectedSeries;
}

- (void)setSelectedSeries:(id)a3
{
}

- (HKValueRange)selectedRangeXValues
{
  return self->_selectedRangeXValues;
}

- (void)setSelectedRangeXValues:(id)a3
{
}

- (HKValueRange)selectedPathIndexRange
{
  return self->_selectedPathIndexRange;
}

- (void)setSelectedPathIndexRange:(id)a3
{
}

- (HKValueRange)selectedPointValueRange
{
  return self->_selectedPointValueRange;
}

- (void)setSelectedPointValueRange:(id)a3
{
}

- (NSDateComponents)pointIntervalComponents
{
  return self->_pointIntervalComponents;
}

- (void)setPointIntervalComponents:(id)a3
{
}

- (NSArray)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (double)xDistanceFromFirstTouchPoint
{
  return self->_xDistanceFromFirstTouchPoint;
}

- (void)setXDistanceFromFirstTouchPoint:(double)a3
{
  self->_xDistanceFromFirstTouchPoint = a3;
}

- (double)xDistanceFromSecondTouchPoint
{
  return self->_xDistanceFromSecondTouchPoint;
}

- (void)setXDistanceFromSecondTouchPoint:(double)a3
{
  self->_xDistanceFromSecondTouchPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_pointIntervalComponents, 0);
  objc_storeStrong((id *)&self->_selectedPointValueRange, 0);
  objc_storeStrong((id *)&self->_selectedPathIndexRange, 0);
  objc_storeStrong((id *)&self->_selectedRangeXValues, 0);
  objc_storeStrong((id *)&self->_selectedSeries, 0);
}

@end