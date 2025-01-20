@interface HKInteractiveChartStackHeight
+ (id)percentStackHeights:(id)a3;
- (HKInteractiveChartStackHeight)initWithKind:(unint64_t)a3 heightValue:(double)a4;
- (double)heightValue;
- (id)debugDescription;
- (unint64_t)kind;
@end

@implementation HKInteractiveChartStackHeight

- (HKInteractiveChartStackHeight)initWithKind:(unint64_t)a3 heightValue:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartStackHeight;
  result = [(HKInteractiveChartStackHeight *)&v7 init];
  if (result)
  {
    result->_kind = a3;
    result->_heightValue = a4;
  }
  return result;
}

- (id)debugDescription
{
  unint64_t v3 = [(HKInteractiveChartStackHeight *)self kind];
  v4 = @"Unknown";
  if (v3 == 1) {
    v4 = @"Points";
  }
  if (v3) {
    v5 = v4;
  }
  else {
    v5 = @"Ratio";
  }
  v6 = NSString;
  [(HKInteractiveChartStackHeight *)self heightValue];
  return (id)[v6 stringWithFormat:@"%lg %@", v7, v5];
}

+ (id)percentStackHeights:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_11);
}

HKInteractiveChartStackHeight *__53__HKInteractiveChartStackHeight_percentStackHeights___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [HKInteractiveChartStackHeight alloc];
  [v2 doubleValue];
  double v5 = v4;

  v6 = [(HKInteractiveChartStackHeight *)v3 initWithKind:0 heightValue:v5];
  return v6;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (double)heightValue
{
  return self->_heightValue;
}

@end