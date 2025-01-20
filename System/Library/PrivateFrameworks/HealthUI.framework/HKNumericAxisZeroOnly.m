@interface HKNumericAxisZeroOnly
- (HKNumericAxisZeroOnly)initWithZeroLabel:(id)a3 axisConfiguration:(id)a4;
- (NSString)zeroLabel;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
@end

@implementation HKNumericAxisZeroOnly

- (HKNumericAxisZeroOnly)initWithZeroLabel:(id)a3 axisConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setOverrideNoTopBaseline:1];
  v12.receiver = self;
  v12.super_class = (Class)HKNumericAxisZeroOnly;
  v8 = [(HKNumericAxis *)&v12 initWithConfiguration:v7];

  if (v8)
  {
    uint64_t v9 = [v6 copy];
    zeroLabel = v8->_zeroLabel;
    v8->_zeroLabel = (NSString *)v9;
  }
  return v8;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 minValue];
    [v7 doubleValue];
    double v9 = v8;

    v10 = [v6 maxValue];
    [v10 doubleValue];
    double v12 = v11;

    v13 = 0;
    if (v9 <= 0.0 && v12 >= 0.0)
    {
      v14 = [(HKNumericAxisZeroOnly *)self zeroLabel];
      if (!v14)
      {
        v14 = [(HKNumericAxis *)self stringFromNumber:&unk_1F3C22570];
      }
      v15 = objc_alloc_init(HKAxisLabel);
      [(HKAxisLabel *)v15 setText:v14];
      [(HKAxisLabel *)v15 setLocation:&unk_1F3C22570];
      [(HKAxisLabel *)v15 setLabelType:1];
      v17[0] = v15;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)zeroLabel
{
  return self->_zeroLabel;
}

- (void).cxx_destruct
{
}

@end