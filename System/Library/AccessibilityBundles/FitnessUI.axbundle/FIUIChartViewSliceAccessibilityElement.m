@interface FIUIChartViewSliceAccessibilityElement
- (unint64_t)sliceIndex;
- (void)setSliceIndex:(unint64_t)a3;
@end

@implementation FIUIChartViewSliceAccessibilityElement

- (unint64_t)sliceIndex
{
  return self->_sliceIndex;
}

- (void)setSliceIndex:(unint64_t)a3
{
  self->_sliceIndex = a3;
}

@end