@interface _HKGraphViewYAxisTransform
- (HKAxis)yAxisForTransform;
- (HKLinearTransform)endingTransform;
- (HKLinearTransform)startingTransform;
- (HKValueRange)endingRange;
- (NSArray)seriesForTransform;
- (_HKGraphViewYAxisTransform)initWithYAxis:(id)a3 seriesForTransform:(id)a4 startingTransform:(HKLinearTransform)a5 endingTransform:(HKLinearTransform)a6 endingRange:(id)a7;
@end

@implementation _HKGraphViewYAxisTransform

- (_HKGraphViewYAxisTransform)initWithYAxis:(id)a3 seriesForTransform:(id)a4 startingTransform:(HKLinearTransform)a5 endingTransform:(HKLinearTransform)a6 endingRange:(id)a7
{
  double scale = a6.scale;
  double offset = a6.offset;
  double v10 = a5.scale;
  double v11 = a5.offset;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_HKGraphViewYAxisTransform;
  v18 = [(_HKGraphViewYAxisTransform *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_yAxisForTransform, a3);
    objc_storeStrong((id *)&v19->_seriesForTransform, a4);
    v19->_startingTransform.double offset = v11;
    v19->_startingTransform.double scale = v10;
    v19->_endingTransform.double offset = offset;
    v19->_endingTransform.double scale = scale;
    objc_storeStrong((id *)&v19->_endingRange, a7);
  }

  return v19;
}

- (HKAxis)yAxisForTransform
{
  return self->_yAxisForTransform;
}

- (NSArray)seriesForTransform
{
  return self->_seriesForTransform;
}

- (HKLinearTransform)startingTransform
{
  double offset = self->_startingTransform.offset;
  double scale = self->_startingTransform.scale;
  result.double scale = scale;
  result.double offset = offset;
  return result;
}

- (HKLinearTransform)endingTransform
{
  double offset = self->_endingTransform.offset;
  double scale = self->_endingTransform.scale;
  result.double scale = scale;
  result.double offset = offset;
  return result;
}

- (HKValueRange)endingRange
{
  return self->_endingRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingRange, 0);
  objc_storeStrong((id *)&self->_seriesForTransform, 0);
  objc_storeStrong((id *)&self->_yAxisForTransform, 0);
}

@end