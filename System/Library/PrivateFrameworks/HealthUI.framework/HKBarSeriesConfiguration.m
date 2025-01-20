@interface HKBarSeriesConfiguration
- (HKFillStyle)inactiveFillStyle;
- (HKFillStyle)selectedFillStyle;
- (HKFillStyle)unselectedFillStyle;
- (id)isIncludedBlock;
- (void)setInactiveFillStyle:(id)a3;
- (void)setIsIncludedBlock:(id)a3;
- (void)setSelectedFillStyle:(id)a3;
- (void)setUnselectedFillStyle:(id)a3;
@end

@implementation HKBarSeriesConfiguration

- (void)setIsIncludedBlock:(id)a3
{
}

- (void)setUnselectedFillStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isIncludedBlock, 0);
  objc_storeStrong((id *)&self->_inactiveFillStyle, 0);
  objc_storeStrong((id *)&self->_selectedFillStyle, 0);
  objc_storeStrong((id *)&self->_unselectedFillStyle, 0);
}

- (HKFillStyle)unselectedFillStyle
{
  return self->_unselectedFillStyle;
}

- (HKFillStyle)selectedFillStyle
{
  return self->_selectedFillStyle;
}

- (void)setSelectedFillStyle:(id)a3
{
}

- (HKFillStyle)inactiveFillStyle
{
  return self->_inactiveFillStyle;
}

- (void)setInactiveFillStyle:(id)a3
{
}

- (id)isIncludedBlock
{
  return self->_isIncludedBlock;
}

@end